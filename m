Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8578E38D042
	for <lists+selinux@lfdr.de>; Fri, 21 May 2021 23:50:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229921AbhEUVwD (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Fri, 21 May 2021 17:52:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229915AbhEUVwD (ORCPT
        <rfc822;selinux@vger.kernel.org>); Fri, 21 May 2021 17:52:03 -0400
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com [IPv6:2607:f8b0:4864:20::72d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90A3EC0613CE
        for <selinux@vger.kernel.org>; Fri, 21 May 2021 14:50:39 -0700 (PDT)
Received: by mail-qk1-x72d.google.com with SMTP id v8so21349761qkv.1
        for <selinux@vger.kernel.org>; Fri, 21 May 2021 14:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
        h=subject:from:to:date:message-id:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=yVODgsBH3pwJySxgTtmB98vfatsbGIZ28oW0IWdkpT0=;
        b=y0fBY74DDWd7J2Q4LAZ8Tc+S4IeIm0ggxMFDvuLxRMwxE4pBi5YQBOJb0yVHgNCjw/
         6nXTDhdi237ivx9OpFxTaSt/2w0iOl5KaPuinDGmWlVHyOd7eh+AjdQCE6TfppiXA1qw
         LiqA51F2Iji/7K4YBZqYJ6Jp3NMKsLAP/zlozfNFomva6gAUX0B3D0Rj7BviOlZga5fz
         qRdiUDzGr928A7t5cuzs8jxkLCfqqLd8UOFcH0J8HKrsYx4tgSDOcPII0hN8iO4TXTrm
         Vdoi2lzlO1NwBXvypm8t69RMAW+j40GzHN4PFkD789xwDPx0IIrJSlbaKk8KCBY7Iodj
         VKKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:date:message-id:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=yVODgsBH3pwJySxgTtmB98vfatsbGIZ28oW0IWdkpT0=;
        b=HjZ2utoOotbX1C8MmXz4JCG6k4Hx6gN0Poo9aIgTk5nk7C4t7zVgwk+uC0llbQbdiG
         B4R8DB4X0bcBXXobS4D91/869lIlCkjx0Q9rR6xleHCzdBCqE008RCyb36syv50vfjBE
         8MKZTzxIN8upYBzTLJ++1bEJ6K1KNJHgujhO1ThSrKamIs6v1LmPzaeHgHS7+nyz09kT
         UiWOvuTv9uVjWLwnZt1cWPFaxLcXaMF4ldjeX5Rb2/kwq5JjEsXgXIcbvrzQu8i4IEPQ
         AESn4UFg+dTWQnNUu/salzSjNMDgTUJ8xlcLk5AFPmjh4d460kKk88IgFKf4uOJBR3KH
         DPrw==
X-Gm-Message-State: AOAM533yOn7S3aD4+fCQTD1vQnxOmKc4nThu35DYbrZ3PA62eJWnLJXv
        OGmE8J5Ov6lv6jRFcGASUCsN
X-Google-Smtp-Source: ABdhPJy8CbcdNgRZ+79GQ7zlutlj5Jo5vuvLZxS0af1cMkIKs15miDkHS/LPNWRaK6XS5ozPHjj0Fg==
X-Received: by 2002:a37:ac0d:: with SMTP id e13mr11837998qkm.426.1621633838636;
        Fri, 21 May 2021 14:50:38 -0700 (PDT)
Received: from localhost (pool-96-237-52-188.bstnma.fios.verizon.net. [96.237.52.188])
        by smtp.gmail.com with ESMTPSA id h8sm4914383qtp.46.2021.05.21.14.50.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 May 2021 14:50:38 -0700 (PDT)
Subject: [RFC PATCH 9/9] Smack: Brutalist io_uring support with debug
From:   Paul Moore <paul@paul-moore.com>
To:     linux-security-module@vger.kernel.org, selinux@vger.kernel.org,
        linux-audit@redhat.com, io-uring@vger.kernel.org,
        linux-fsdevel@vger.kernel.org,
        Kumar Kartikeya Dwivedi <memxor@gmail.com>,
        Jens Axboe <axboe@kernel.dk>,
        Alexander Viro <viro@zeniv.linux.org.uk>
Date:   Fri, 21 May 2021 17:50:37 -0400
Message-ID: <162163383761.8379.7421085717625472402.stgit@sifl>
In-Reply-To: <162163367115.8379.8459012634106035341.stgit@sifl>
References: <162163367115.8379.8459012634106035341.stgit@sifl>
User-Agent: StGit/1.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

From: Casey Schaufler <casey@schaufler-ca.com>

Add Smack privilege checks for io_uring. Use CAP_MAC_OVERRIDE
for the override_creds case and CAP_MAC_ADMIN for creating a
polling thread. These choices are based on conjecture regarding
the intent of the surrounding code.

Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
Signed-off-by: Paul Moore <paul@paul-moore.com>
---
 security/smack/smack_lsm.c |   64 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/security/smack/smack_lsm.c b/security/smack/smack_lsm.c
index 223a6da0e6dc..f6423c0096e9 100644
--- a/security/smack/smack_lsm.c
+++ b/security/smack/smack_lsm.c
@@ -4691,6 +4691,66 @@ static int smack_dentry_create_files_as(struct dentry *dentry, int mode,
 	return 0;
 }
 
+#ifdef CONFIG_IO_URING
+/**
+ * smack_uring_override_creds - Is io_uring cred override allowed?
+ * @new: the target creds
+ *
+ * Check to see if the current task is allowed to override it's credentials
+ * to service an io_uring operation.
+ */
+int smack_uring_override_creds(const struct cred *new)
+{
+	struct task_smack *tsp = smack_cred(current_cred());
+	struct task_smack *nsp = smack_cred(new);
+
+#if 1
+	if (tsp->smk_task == nsp->smk_task)
+		pr_info("%s: Smack matches %s\n", __func__,
+			tsp->smk_task->smk_known);
+	else
+		pr_info("%s: Smack override check %s to %s\n", __func__,
+			tsp->smk_task->smk_known, nsp->smk_task->smk_known);
+#endif
+	/*
+	 * Allow the degenerate case where the new Smack value is
+	 * the same as the current Smack value.
+	 */
+	if (tsp->smk_task == nsp->smk_task)
+		return 0;
+
+#if 1
+	pr_info("%s: Smack sqpoll %s\n", __func__,
+		smack_privileged_cred(CAP_MAC_OVERRIDE, current_cred()) ?
+		"ok by Smack" : "disallowed (No CAP_MAC_OVERRIDE)");
+#endif
+	if (smack_privileged_cred(CAP_MAC_OVERRIDE, current_cred()))
+		return 0;
+
+	return -EPERM;
+}
+
+/**
+ * smack_uring_sqpoll - check if a io_uring polling thread can be created
+ *
+ * Check to see if the current task is allowed to create a new io_uring
+ * kernel polling thread.
+ */
+int smack_uring_sqpoll(void)
+{
+#if 1
+	pr_info("%s: Smack new ring %s\n", __func__,
+		smack_privileged_cred(CAP_MAC_ADMIN, current_cred()) ?
+		"ok by Smack" : "disallowed (No CAP_MAC_ADMIN)");
+#endif
+	if (smack_privileged_cred(CAP_MAC_ADMIN, current_cred()))
+		return 0;
+
+	return -EPERM;
+}
+
+#endif /* CONFIG_IO_URING */
+
 struct lsm_blob_sizes smack_blob_sizes __lsm_ro_after_init = {
 	.lbs_cred = sizeof(struct task_smack),
 	.lbs_file = sizeof(struct smack_known *),
@@ -4843,6 +4903,10 @@ static struct security_hook_list smack_hooks[] __lsm_ro_after_init = {
 	LSM_HOOK_INIT(inode_copy_up, smack_inode_copy_up),
 	LSM_HOOK_INIT(inode_copy_up_xattr, smack_inode_copy_up_xattr),
 	LSM_HOOK_INIT(dentry_create_files_as, smack_dentry_create_files_as),
+#ifdef CONFIG_IO_URING
+	LSM_HOOK_INIT(uring_override_creds, smack_uring_override_creds),
+	LSM_HOOK_INIT(uring_sqpoll, smack_uring_sqpoll),
+#endif
 };
 
 

