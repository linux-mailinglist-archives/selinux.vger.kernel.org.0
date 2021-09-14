Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B71C40A49F
	for <lists+selinux@lfdr.de>; Tue, 14 Sep 2021 05:33:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239029AbhINDfO (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Mon, 13 Sep 2021 23:35:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238995AbhINDe7 (ORCPT
        <rfc822;selinux@vger.kernel.org>); Mon, 13 Sep 2021 23:34:59 -0400
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com [IPv6:2607:f8b0:4864:20::736])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F7AAC061762
        for <selinux@vger.kernel.org>; Mon, 13 Sep 2021 20:33:43 -0700 (PDT)
Received: by mail-qk1-x736.google.com with SMTP id c10so13196938qko.11
        for <selinux@vger.kernel.org>; Mon, 13 Sep 2021 20:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
        h=subject:from:to:date:message-id:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=54Sbzge3G+aat3VcychMMrLelhIpqQAZp6yuJG+ykt8=;
        b=aZ6thOvMHLr+wxTevjEA1i5Ht/W/KrKBQJDrsm43lV+2/eSbhr0/w/m5LaTbRZv97v
         13VV/f6a5EZn+YwNo+evAqqV68Rk0Q3ZSZ7p66Z50xOHLmTvSRidUUAQqWKoRmufA//s
         TRdH5DrwLc8h6Fex7ElS7A8hxXq9SCFZnCMT2WXwEZFLdqa6eaRHhZuYOqmQZA+UPyb8
         U6kNemODgsXPNN7mcEVByROU8emfLbr8Vnk/Yuyf9KR1xQgvIKEYcEbjkCJLJqdNEz8k
         K9dZzuNqP701EebgEt1oQ05r+hhjxT6DR0Y1fY8t9nmU0Lbxbb7cA5vBOG5ann40QGgU
         C7rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:date:message-id:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=54Sbzge3G+aat3VcychMMrLelhIpqQAZp6yuJG+ykt8=;
        b=hFHtz097zRgI6t7mPBZnTTB2BpsfXrcOr9fu2snb8aIdD2Pgr43sb6/tDVKTn/lx2U
         ahTOUSQfQBXDzZPRNRbzTeA768KAeaD+zvSlxkQ9Q8qiDBrHpvKkk5TwGRy6PJLmKfQx
         Orp/yaH4e9IUJLKhmP2wydqO29nqOetZUmbB9ZC8qe7mn8Qer1fFPznxwjSO/R/wf6vh
         F5D3C2HMcjorDlgbCdsHcU1qycVNnpffH3QFo7EonuiMFefe9Fs/POss72wtPGhItWaP
         7yLUD6/l/6Qs8pBXEw+yvuYAzDmxmlzXPbaqj93RNx3o1LWWh0w1yQ2+22lzK/EFnETE
         LElA==
X-Gm-Message-State: AOAM532o+DNkVkUtRTof2TQgYLuIfyhnDc6m2qTktarEoYBfVP0S4ANA
        nBL6AEGEZQ53nx5d56w4X4hX
X-Google-Smtp-Source: ABdhPJxCTwAyD5dWI5ou1pL9SVHqbRt3WXQyP3KXoalYRryIJkcZ1TtZ+jPi+4HNVU0jJ4AhyxpGgA==
X-Received: by 2002:a37:6691:: with SMTP id a139mr2900014qkc.310.1631590422163;
        Mon, 13 Sep 2021 20:33:42 -0700 (PDT)
Received: from localhost (pool-96-237-52-188.bstnma.fios.verizon.net. [96.237.52.188])
        by smtp.gmail.com with ESMTPSA id b1sm5212672qtj.76.2021.09.13.20.33.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Sep 2021 20:33:41 -0700 (PDT)
Subject: [PATCH v3 8/8] Smack: Brutalist io_uring support with debug
From:   Paul Moore <paul@paul-moore.com>
To:     linux-security-module@vger.kernel.org, selinux@vger.kernel.org,
        linux-audit@redhat.com, io-uring@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
        Pavel Begunkov <asml.silence@gmail.com>,
        Kumar Kartikeya Dwivedi <memxor@gmail.com>
Date:   Mon, 13 Sep 2021 23:33:41 -0400
Message-ID: <163159042110.470089.9405201508228711833.stgit@olly>
In-Reply-To: <163159032713.470089.11728103630366176255.stgit@olly>
References: <163159032713.470089.11728103630366176255.stgit@olly>
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
[PM: make the smack_uring_* funcs static, remove debug code]
Signed-off-by: Paul Moore <paul@paul-moore.com>

---
v3:
- removed debug code
v2:
- made the smack_uring_* funcs static
v1:
- initial draft
---
 security/smack/smack_lsm.c |   46 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/security/smack/smack_lsm.c b/security/smack/smack_lsm.c
index cacbe7518519..f90ab1efeb6d 100644
--- a/security/smack/smack_lsm.c
+++ b/security/smack/smack_lsm.c
@@ -4691,6 +4691,48 @@ static int smack_dentry_create_files_as(struct dentry *dentry, int mode,
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
+static int smack_uring_override_creds(const struct cred *new)
+{
+	struct task_smack *tsp = smack_cred(current_cred());
+	struct task_smack *nsp = smack_cred(new);
+
+	/*
+	 * Allow the degenerate case where the new Smack value is
+	 * the same as the current Smack value.
+	 */
+	if (tsp->smk_task == nsp->smk_task)
+		return 0;
+
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
+static int smack_uring_sqpoll(void)
+{
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
@@ -4843,6 +4885,10 @@ static struct security_hook_list smack_hooks[] __lsm_ro_after_init = {
 	LSM_HOOK_INIT(inode_copy_up, smack_inode_copy_up),
 	LSM_HOOK_INIT(inode_copy_up_xattr, smack_inode_copy_up_xattr),
 	LSM_HOOK_INIT(dentry_create_files_as, smack_dentry_create_files_as),
+#ifdef CONFIG_IO_URING
+	LSM_HOOK_INIT(uring_override_creds, smack_uring_override_creds),
+	LSM_HOOK_INIT(uring_sqpoll, smack_uring_sqpoll),
+#endif
 };
 
 

