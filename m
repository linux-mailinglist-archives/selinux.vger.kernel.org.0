Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C79B44CD86
	for <lists+selinux@lfdr.de>; Thu, 11 Nov 2021 00:00:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234158AbhKJXDd (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Wed, 10 Nov 2021 18:03:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234182AbhKJXDc (ORCPT
        <rfc822;selinux@vger.kernel.org>); Wed, 10 Nov 2021 18:03:32 -0500
Received: from mail-pg1-x549.google.com (mail-pg1-x549.google.com [IPv6:2607:f8b0:4864:20::549])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4E77C061767
        for <selinux@vger.kernel.org>; Wed, 10 Nov 2021 15:00:44 -0800 (PST)
Received: by mail-pg1-x549.google.com with SMTP id k22-20020a635a56000000b002df9863aa74so759546pgm.19
        for <selinux@vger.kernel.org>; Wed, 10 Nov 2021 15:00:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=akg642f7HDeisDI17y1/ahPZ+9iAX4nebtKtHRS0FT0=;
        b=tYlvx8oO3Ox97muMYpX13r1a/mvmZk08+xfJ29QkGgOrWb7Yr7bEE0TBHzndmJ6ieu
         WLd/RCgFiGXhnctk6ifoQcszWap/Hhs8FGuwNzTxWOEtxT18a9RP/vM5/+W148LjVfbo
         9KYs9Bt/YeXsBATtT6nP7unifCeZpwKgz0rXCnduN7+b+iQ7lk0w8QRBoBxl9jNndcEa
         UbGY1/Lp9g7lVpEGxsKyRNbpzAU2/xTCA5cq07Tb7Sa0ImJ1488YfBtLBGTVEPWCpsG2
         +src/caUTiZWvW2i5hLlkFPfrYC6+fJLPFkocE9tdiscEUgGDCMjAI/zBTQUVTJgWhk7
         J0ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=akg642f7HDeisDI17y1/ahPZ+9iAX4nebtKtHRS0FT0=;
        b=UpRz2VLS4S5Q4xcZmGqDaERQR0Ws4DSuh05xOKVtr9OdTsyrFSiXNKJSSU8yoQ0zcG
         RTuvURjvowBHfJs8vKoATu9uyMYc5K2HjU9K57odaa12Opqk3Ph9S1a8ZEA+Qy4YAJ+J
         BiONE7HHrnIHk8sOpkvx0wtqmiv8K+896kfWbgxObjnkosV8xACm36mO6UAX7rj8nwjb
         9SDma9aRS6Mxj2RNMgss9FuU8zTC//1b41HLnkc5LW3UTFHCtXEVPJohQJopP8DaOTBQ
         8Yw5EnHD705b2Q8RkeJra0PvL+kaRfsq1kCipF9psVhO4kzM7lcmbOI4SPB6l/iFgKWB
         SMaA==
X-Gm-Message-State: AOAM531+Ta7n9u8WWiUqkE1NRD0s4T/oyF/0u4AePo4p5kPEbGvfuYvA
        2CdHZiKyHyfX5rgT6pK6+SD7Hk8jMQ==
X-Google-Smtp-Source: ABdhPJxxCupVj5ImDPnY2F8WAukfAsjSmvOKv44ciI5NXs0e9uEd08daIFxS+YgObqo/u75TDbTqI1VcDw==
X-Received: from tkjos-desktop.mtv.corp.google.com ([2620:15c:211:200:4a73:99b6:9694:8c4d])
 (user=tkjos job=sendgmr) by 2002:a63:144e:: with SMTP id 14mr1668364pgu.14.1636585244153;
 Wed, 10 Nov 2021 15:00:44 -0800 (PST)
Date:   Wed, 10 Nov 2021 15:00:36 -0800
In-Reply-To: <20211110230036.3274365-1-tkjos@google.com>
Message-Id: <20211110230036.3274365-3-tkjos@google.com>
Mime-Version: 1.0
References: <20211110230036.3274365-1-tkjos@google.com>
X-Mailer: git-send-email 2.34.0.rc0.344.g81b53c2807-goog
Subject: [PATCH 5.10 3/3] binder: use cred instead of task for getsecid
From:   Todd Kjos <tkjos@google.com>
To:     stable@vger.kernel.org, gregkh@linuxfoundation.org,
        arve@android.com, tkjos@android.com, maco@android.com,
        christian@brauner.io, jmorris@namei.org, serge@hallyn.com,
        paul@paul-moore.com, stephen.smalley.work@gmail.com,
        eparis@parisplace.org, keescook@chromium.org, jannh@google.com,
        jeffv@google.com, zohar@linux.ibm.com,
        linux-security-module@vger.kernel.org, selinux@vger.kernel.org,
        devel@driverdev.osuosl.org
Cc:     joel@joelfernandes.org, kernel-team@android.com,
        Todd Kjos <tkjos@google.com>,
        kernel test robot <lkp@intel.com>,
        Casey Schaufler <casey@schaufler-ca.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

commit 4d5b5539742d2554591751b4248b0204d20dcc9d upstream.

Use the 'struct cred' saved at binder_open() to lookup
the security ID via security_cred_getsecid(). This
ensures that the security context that opened binder
is the one used to generate the secctx.

Cc: stable@vger.kernel.org # 5.4+
Fixes: ec74136ded79 ("binder: create node flag to request sender's security context")
Signed-off-by: Todd Kjos <tkjos@google.com>
Suggested-by: Stephen Smalley <stephen.smalley.work@gmail.com>
Reported-by: kernel test robot <lkp@intel.com>
Acked-by: Casey Schaufler <casey@schaufler-ca.com>
Signed-off-by: Paul Moore <paul@paul-moore.com>
Change-Id: Ia7b59804a0bdbd51191bbcca556414840307c623
---
 drivers/android/binder.c | 2 +-
 include/linux/security.h | 5 +++++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/android/binder.c b/drivers/android/binder.c
index 50fff726dc70..3ba3944a9e1f 100644
--- a/drivers/android/binder.c
+++ b/drivers/android/binder.c
@@ -3103,7 +3103,7 @@ static void binder_transaction(struct binder_proc *proc,
 		u32 secid;
 		size_t added_size;
 
-		security_task_getsecid(proc->tsk, &secid);
+		security_cred_getsecid(proc->cred, &secid);
 		ret = security_secid_to_secctx(secid, &secctx, &secctx_sz);
 		if (ret) {
 			return_error = BR_FAILED_REPLY;
diff --git a/include/linux/security.h b/include/linux/security.h
index e67cc8c40865..35355429648e 100644
--- a/include/linux/security.h
+++ b/include/linux/security.h
@@ -1003,6 +1003,11 @@ static inline void security_transfer_creds(struct cred *new,
 {
 }
 
+static inline void security_cred_getsecid(const struct cred *c, u32 *secid)
+{
+	*secid = 0;
+}
+
 static inline int security_kernel_act_as(struct cred *cred, u32 secid)
 {
 	return 0;
-- 
2.34.0.rc0.344.g81b53c2807-goog

