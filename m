Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DC738155D48
	for <lists+selinux@lfdr.de>; Fri,  7 Feb 2020 19:02:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727068AbgBGSCx (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Fri, 7 Feb 2020 13:02:53 -0500
Received: from mail-yb1-f202.google.com ([209.85.219.202]:47760 "EHLO
        mail-yb1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726900AbgBGSCx (ORCPT
        <rfc822;selinux@vger.kernel.org>); Fri, 7 Feb 2020 13:02:53 -0500
Received: by mail-yb1-f202.google.com with SMTP id e15so2721247ybc.14
        for <selinux@vger.kernel.org>; Fri, 07 Feb 2020 10:02:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=iKjEZXvKKVcsWaI7ym2KttzdoB/EiCc42gBxG/ve1HE=;
        b=gDNjzVrHvKMFTQCFsIM4J+qmSZzKqJ6pjINTMCtV6GCnxkS9bWToX/Y7xbkb+A3BDU
         BG7girIrsDQZf30Fla4zwIn/uYke9+gN9WYJ37tHJS0UCJ1NOXhqpu6CXZy5gt76lVq1
         hMFOpKyvDkQSFnaL/WVIg1c4lfLL/MZHN+OC6qHtiUWwLxPdlVOZVQTG7GkNpejL+Wtp
         RyyWyJ1obapU77yE+1ZScpmgkSaWzo84v3k9Bss2jm1uk2sl9MOYTfuNUd87dh9m6/qv
         zwDaDmlEWABrXP0KCozHVo39yHMf4vTFKGS2u2BsFFf/esrXDo19vauBjGw6p/GWCA2Z
         AtqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=iKjEZXvKKVcsWaI7ym2KttzdoB/EiCc42gBxG/ve1HE=;
        b=h7nLoj311vWfEUx7EMAIYj5BcsIwWCCfZ9ahZACpCyXx7CLARJb+j/xa0aTwRoH9eP
         zCPeDx8dYYzWWAJ+MfiCMBeAGhPTPK5jKsd+nqfd9cc0uBVuSSg7T5xbcmhsc04pRVES
         vtX/wAUu3wjeY3IcBvfgPqHurLSw3oZg/BwEmXPnqLkYgD/4LH7mnx8qDbhPPKxbJjDp
         ol0o4EYVNJS2gojqd02xycyWBTlIsb+Em2acsGcM20R1kz9hRiXO2m2g5Lpo5wCGJesh
         PS3FofORFsiFUVkxHu33ed5NzymGsZEdMOKMxLBkURaX+5yIDKwMIUjcJnqgAJ81jVtm
         ITJA==
X-Gm-Message-State: APjAAAUrZbkSZgRB47gIruVS5JUkfFVmVMzKxJ0EyPGAotfGmnapzD15
        thNmgvt0dqcOJHpJbCTPE9Dr3eom+JAMe0A=
X-Google-Smtp-Source: APXvYqzHR4qUgqPBjFg2Eg15cywA5UDtWrs7vMReQKmbNj/hxk/GoJLGmLAct4ku6gkiSA6xO4UPiZNVNtyqGtg=
X-Received: by 2002:a25:c04f:: with SMTP id c76mr306526ybf.355.1581098571073;
 Fri, 07 Feb 2020 10:02:51 -0800 (PST)
Date:   Fri,  7 Feb 2020 10:01:49 -0800
Message-Id: <20200207180148.235161-1-smoreland@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
Subject: [PATCH v3] security: selinux: allow per-file labeling for bpffs
From:   Steven Moreland <smoreland@google.com>
To:     paul@paul-moore.com, sds@tycho.nsa.gov, eparis@parisplace.org,
        keescook@chromium.org, anton@enomsg.org, ccross@android.com,
        tony.luck@intel.com, selinux@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-team@android.com
Cc:     "Connor O'Brien" <connoro@google.com>,
        Steven Moreland <smoreland@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

From: Connor O'Brien <connoro@google.com>

Add support for genfscon per-file labeling of bpffs files. This allows
for separate permissions for different pinned bpf objects, which may
be completely unrelated to each other.

Signed-off-by: Connor O'Brien <connoro@google.com>
Signed-off-by: Steven Moreland <smoreland@google.com>
---
 security/selinux/hooks.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/security/selinux/hooks.c b/security/selinux/hooks.c
index d9e8b2131a65..18f8cd47729c 100644
--- a/security/selinux/hooks.c
+++ b/security/selinux/hooks.c
@@ -699,6 +699,7 @@ static int selinux_set_mnt_opts(struct super_block *sb,
 	if (!strcmp(sb->s_type->name, "debugfs") ||
 	    !strcmp(sb->s_type->name, "tracefs") ||
 	    !strcmp(sb->s_type->name, "binderfs") ||
+	    !strcmp(sb->s_type->name, "bpf") ||
 	    !strcmp(sb->s_type->name, "pstore"))
 		sbsec->flags |= SE_SBGENFS;
 
-- 
2.25.0.341.g760bfbb309-goog

v2 -> v3
- on selinux next branch (instead of master)
