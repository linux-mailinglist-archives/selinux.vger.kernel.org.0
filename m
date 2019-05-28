Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ED5ED2C966
	for <lists+selinux@lfdr.de>; Tue, 28 May 2019 16:59:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726604AbfE1O7X (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Tue, 28 May 2019 10:59:23 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:35100 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726371AbfE1O7X (ORCPT
        <rfc822;selinux@vger.kernel.org>); Tue, 28 May 2019 10:59:23 -0400
Received: by mail-wr1-f65.google.com with SMTP id m3so20610446wrv.2
        for <selinux@vger.kernel.org>; Tue, 28 May 2019 07:59:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eGMdSE2GCsRb5R4QSJjqQk06P9Mxv3bZBAK87hQDkSw=;
        b=PuCVPVQls1MAZhFq1wFkQKVAHaXYckY5/pPg7wU657WAfj4wFdPCZe9Tw4m9X+gHsN
         7YyZgHGq/OJ6P+n5xHTCjyS3yPpnKt5kOgNwUr7dSGPSWpmENrjjO36+6JWaiYDTjyhy
         JwYLmOrZGgp4ktdAdM4bLdXvNtdxd9relveDBakd6P9wsB6QPkKgiRnkYc0xNqFR9SVj
         pPbhrgBeBdwXDVAjPWDxsOoJEkSozjxZkPOx0LYLlLNOMjjEBIHB5L5D1udJo4w++gnZ
         6HFJtA95hug7g7N6sf5qugMkgdGaIzALtljGPC0X7vR3/tuVXnYW51m3bfpL77OpVk7a
         NCBQ==
X-Gm-Message-State: APjAAAWxXwzEN0A8bO7R2ecJXw+horQHxv4ac6GdgEkuTyrx4svNKMl0
        Srx30/yDR8iztJ3gRvMP623YGmpAxjk=
X-Google-Smtp-Source: APXvYqy7ui/B3s3hnmrq4bIOXDyauVzQHWbdnoB5UCCYl8SDWmOphn9//xYCPnDzss4PwmhBObOD7g==
X-Received: by 2002:a5d:4346:: with SMTP id u6mr697957wrr.287.1559055561360;
        Tue, 28 May 2019 07:59:21 -0700 (PDT)
Received: from localhost.localdomain.com (nat-pool-brq-t.redhat.com. [213.175.37.10])
        by smtp.gmail.com with ESMTPSA id p17sm14118849wrq.95.2019.05.28.07.59.20
        for <selinux@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 May 2019 07:59:20 -0700 (PDT)
From:   Ondrej Mosnacek <omosnace@redhat.com>
To:     selinux@vger.kernel.org
Subject: [PATCH userspace v2 6/7] [RFC] lisepol: slightly more thorough optimization
Date:   Tue, 28 May 2019 16:59:11 +0200
Message-Id: <20190528145912.13827-7-omosnace@redhat.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190528145912.13827-1-omosnace@redhat.com>
References: <20190528145912.13827-1-omosnace@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Removes also rules that are covered only by a union of two or more
rules. There are usually only a few of such rules (if any), but there
should be almost no (policy build) perfomance cost for this.

Side effect: clears all permission bits covered by a more general rule
-> might slow down avtab lookups (only a single rule will now match each
query)
---
 libsepol/src/optimize.c | 28 +++++++++++++++-------------
 1 file changed, 15 insertions(+), 13 deletions(-)

diff --git a/libsepol/src/optimize.c b/libsepol/src/optimize.c
index b3859b6c..abb711e7 100644
--- a/libsepol/src/optimize.c
+++ b/libsepol/src/optimize.c
@@ -73,36 +73,38 @@ static void destroy_type_map(const policydb_t *p, ebitmap_t *type_map)
 	free(type_map);
 }
 
-static int match_xperms(const uint32_t *p1, const uint32_t *p2)
+static int process_xperms(uint32_t *p1, const uint32_t *p2)
 {
 	size_t i;
+	int ret = 1;
 
 	for (i = 0; i < EXTENDED_PERMS_LEN; i++) {
-		if ((p2[i] & p1[i]) != p1[i])
-			return 0;
+		p1[i] &= ~p2[i];
+		if (p1[i] != 0)
+			ret = 0;
 	}
-	return 1;
+	return ret;
 }
 
-static int match_avtab_datum(uint16_t specified,
-			     const avtab_datum_t *d1, const avtab_datum_t *d2)
+static int process_avtab_datum(uint16_t specified,
+			       avtab_datum_t *d1, const avtab_datum_t *d2)
 {
 	/* inverse logic needed for AUDITDENY rules */
 	if (specified & AVTAB_AUDITDENY)
-		return (d1->data & d2->data) == d2->data;
+		return (d1->data |= ~d2->data) == 0xFFFFFFFF;
 
 	if (specified & AVTAB_AV)
-		return (d2->data & d1->data) == d1->data;
+		return (d1->data &= ~d2->data) == 0;
 
 	if (specified & AVTAB_XPERMS) {
-		const avtab_extended_perms_t *x1 = d1->xperms;
+		avtab_extended_perms_t *x1 = d1->xperms;
 		const avtab_extended_perms_t *x2 = d2->xperms;
 
 		if (x1->specified == AVTAB_XPERMS_IOCTLFUNCTION) {
 			if (x2->specified == AVTAB_XPERMS_IOCTLFUNCTION) {
 				if (x1->driver != x2->driver)
 					return 0;
-				return match_xperms(x1->perms, x2->perms);
+				return process_xperms(x1->perms, x2->perms);
 			}
 			if (x2->specified == AVTAB_XPERMS_IOCTLDRIVER)
 				return xperm_test(x1->driver, x2->perms);
@@ -111,7 +113,7 @@ static int match_avtab_datum(uint16_t specified,
 				return 0;
 
 			if (x2->specified == AVTAB_XPERMS_IOCTLDRIVER)
-				return match_xperms(x1->perms, x2->perms);
+				return process_xperms(x1->perms, x2->perms);
 		}
 		return 0;
 	}
@@ -152,7 +154,7 @@ static int is_avrule_redundant(avtab_ptr_t entry, avtab_t *tab,
 			if (!d2)
 				continue;
 
-			if (match_avtab_datum(key.specified, d1, d2))
+			if (process_avtab_datum(key.specified, d1, d2))
 				return 1;
 		}
 	}
@@ -205,7 +207,7 @@ static int is_cond_rule_redundant(avtab_ptr_t e1, cond_av_list_t *list,
 		if (!ebitmap_get_bit(&type_map[t1], t2))
 			continue;
 
-		if (match_avtab_datum(k1, &e1->datum, &e2->datum))
+		if (process_avtab_datum(k1, &e1->datum, &e2->datum))
 			return 1;
 	}
 	return 0;
-- 
2.20.1

