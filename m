Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1CBED7121E
	for <lists+selinux@lfdr.de>; Tue, 23 Jul 2019 08:51:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729881AbfGWGvE (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Tue, 23 Jul 2019 02:51:04 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:39889 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730197AbfGWGvE (ORCPT
        <rfc822;selinux@vger.kernel.org>); Tue, 23 Jul 2019 02:51:04 -0400
Received: by mail-wm1-f66.google.com with SMTP id u25so27034080wmc.4
        for <selinux@vger.kernel.org>; Mon, 22 Jul 2019 23:51:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jMAMtmUAhJdSC4vipMY5itqWELsNJG6mJ9qzPbPKC4c=;
        b=SR0EI9Vln5r6fdhDqesCvQGMz54389HEk50bHmtKliel+6Skxe8ftb4FyRbBJv0H7D
         c6sMpGKojY6o9yofmA/jNHHWyxDvaPXaN9E/WXsrcKvSVgHv8B3j6zKsBERqEEVUueJv
         IknVTtbfaol/vXTdhP9Yqt84gOaMcNt98V0l7ZJaWjjlpgLXbYyK1RyNm3g4pUqb0Lx7
         05575Rrq6+xXT1YBlcs9URKwNeR5t6PFf92SVmrJ0Jew39xkzy5HH1oWpZKVm4wwAd1I
         yMLUpL40GMwqHOlFDg7z5yvLciqdt5cOug1MLxmow+6e0Wi8dM8n5nNoqNvMLRBhr7Ul
         xdNg==
X-Gm-Message-State: APjAAAXt0u34xZlJadkX+RJJicDLw0IV0qTASRauOemk/oyUaNW6v+cV
        0pOAPQNug8ebX0iV+3gIOpZvCX58mmA=
X-Google-Smtp-Source: APXvYqy/k1FmuZtmzbGj70tGf6pEe8WcHy9IAXeVEBHOs6jjeBXUvh5MQmOdUmijA3oVu2MGxa60jg==
X-Received: by 2002:a7b:c5c3:: with SMTP id n3mr59499751wmk.101.1563864662076;
        Mon, 22 Jul 2019 23:51:02 -0700 (PDT)
Received: from localhost.localdomain.com (nat-pool-brq-t.redhat.com. [213.175.37.10])
        by smtp.gmail.com with ESMTPSA id t1sm53376227wra.74.2019.07.22.23.51.01
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 22 Jul 2019 23:51:01 -0700 (PDT)
From:   Ondrej Mosnacek <omosnace@redhat.com>
To:     selinux@vger.kernel.org, Paul Moore <paul@paul-moore.com>
Cc:     NitinGote <nitin.r.gote@intel.com>,
        kernel-hardening@lists.openwall.com,
        Kees Cook <keescook@chromium.org>,
        William Roberts <bill.c.roberts@gmail.com>
Subject: [PATCH v2] selinux: check sidtab limit before adding a new entry
Date:   Tue, 23 Jul 2019 08:50:59 +0200
Message-Id: <20190723065059.30101-1-omosnace@redhat.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

We need to error out when trying to add an entry above SIDTAB_MAX in
sidtab_reverse_lookup() to avoid overflow on the odd chance that this
happens.

Fixes: ee1a84fdfeed ("selinux: overhaul sidtab to fix bug and improve performance")
Signed-off-by: Ondrej Mosnacek <omosnace@redhat.com>
---
 security/selinux/ss/sidtab.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/security/selinux/ss/sidtab.c b/security/selinux/ss/sidtab.c
index e63a90ff2728..1f0a6eaa2d6a 100644
--- a/security/selinux/ss/sidtab.c
+++ b/security/selinux/ss/sidtab.c
@@ -286,6 +286,11 @@ static int sidtab_reverse_lookup(struct sidtab *s, struct context *context,
 		++count;
 	}
 
+	/* bail out if we already reached max entries */
+	rc = -EOVERFLOW;
+	if (count >= SIDTAB_MAX)
+		goto out_unlock;
+
 	/* insert context into new entry */
 	rc = -ENOMEM;
 	dst = sidtab_do_lookup(s, count, 1);
-- 
2.21.0

