Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D4B6B1A0374
	for <lists+selinux@lfdr.de>; Tue,  7 Apr 2020 02:12:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726436AbgDGAMD (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Mon, 6 Apr 2020 20:12:03 -0400
Received: from sonic311-31.consmr.mail.ne1.yahoo.com ([66.163.188.212]:43704
        "EHLO sonic311-31.consmr.mail.ne1.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726310AbgDGAMD (ORCPT
        <rfc822;selinux@vger.kernel.org>); Mon, 6 Apr 2020 20:12:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1586218321; bh=xeM5O9VWq2QvuqfWm1TEoLqTzg+0Mk5HotqvF+QuxSw=; h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject; b=TZy9JReRQUJJijieMrdaeJCtDBbsq1oq/FivFej7tksGqAVYscSbd5VhjQW2z+97rJESFEsV6Wsj4ua0LjDt+f8CdrkmSvqOv1vYn9C8uoP7zyLeIzqkUvE8hSCHCORLW5QOrGy7/DZI5fQ7m6hkaeNWEBhv+HzHkUuIawpOca+rjfhzUZNZLQoqBTq2soxS6WkzDb/GuCbrZYXjKxUx8nWlLRRtYZ7sRpdcG6banCCvYdnv2u1ENhexU2pAVHGBGiW7IxaWXqnoGITs4z4Z+8oGMO7Z4Zo6shATXHdDUvEuiRGSTnUUEkMHm+4FH9USIVC2LfFRt9PuuzH+RJ3pqQ==
X-YMail-OSG: nqcIGgEVM1nh1zTZIdHZ0V6CsIz00yDG3AI747zcMFrqNVkyEInvSjd3vc_A8d7
 x2b0o_tbBFK7.9H01_0VyNEYdWLbtefpEOaHJAnlrFDwCq2hOfxqmWYcvrgHVwAZdivoGWwvTKCm
 _sVdTNEiEctT7zT.HICNXaVMuFQDXHnLEQFCCegYrdRn7VSYmvgIfWfyr1ewaiLZI053Rq0urtV9
 xK1Alm1Jxl0zNiU2nUXxAkx0dNWAvdEE7gYxuhyMimTZkCiqH1plT9Q7Q.B2bdiIFhq0r91vJHA6
 BWVtNoq1We0UWYDmyHYFpoffuxOVdOgme_WY7FHEslEG71ORLUwRneubobKUoWAJfDf_2Ihm7rdY
 XGC1UTjA0r1Ti3rUluEiUQ8o3OZTJlm.81ifDSkSasLjEeXmc1EI3wtvHvC2P4uiksabxtwsSUru
 m65NkEsqG1zOzO7rg0Y24m.kzi.q.9jGuZpqzCAuwsEJ17Povtc1RLQLqtlUo.cO0x3YV3OhmVip
 VgxcF2CpKZRozOkIiLpHwfowdajYVxdO7Q6r1mdWixOxb54hty8M6YffT6SR.WBPxKXGsmjmqvX8
 wDs.FKZ.l9mNBkcRi8KnZB9G5xFRDiICkqBZDSBZgEShxP03nDd.Zg7l98r0EXmTcUWOOPCPZqca
 2D30oIonA516P56EefZZOnhHwMiANhZIA8Wc50gnkwgb3KSQ6upEQhrANEyF.r5alooVeQfunCFy
 TIUINdA_KGfpz1kQtPZXq5GxKI6dBsrLSUIdGLnu7JK8F7w62CMwIw1UYigQ..W55kmHLoRIwWNS
 TfSFPeXbvuKteHtptCNc9RqeyY.wYWMGIBXc5uFDt.jbYNqZZfRyZdGi0ZhNGJxGJtVq8kgq3hFj
 YXflZ8gHj_G5wpBg.wrJ2Dw.3gH3ICwShICvZr8iChsSs68OxLHNz2DJxcbAKEpuum0iWoyZbKdQ
 NpdV1n0RBwQG26Fu7RXe3UwYo46z8m28aqVBxuHsI1gmfuBijLVt79U4zyMXvlfrjRyTY4kQxnmT
 RI34bteDzZ5qXOHUaZKDNTd2TJtEcIxGCb4uuSwt.HfuzMEv5xv5SCe0JyZfcYKl6mAuSObCVQl8
 IIIlhKoH25aPoseAgwigQaZ0injCfXpt73xEDsIo1Vs4hHhdWsI7HPpW8TvwM18gt5CAIoPNCZ3Z
 ArJTf4DEZ9ZoE.DsppQz5e6NceTHvWPbK_Xw_HWb66XySNsdXFyWb1hlb73cUTB5pbnDprBQQPnw
 3vigh74tgu_9NsEkBUyuCdiWa7B1X_r5trFvUD9raJPH0oq.oSW34busaLYnBAkNOx9gPWqtPON3
 fSgk8_C3SoNPOptcn6_I4oihMY00qU6PYT.asS7yF19UtvUVe5Lr_KTjF5_y8jsU3rtJnEVeHnf9
 gmOOw2pFUlapDLfGW43TouCiizHx2O85YaYr4KF0RobJeYXzCXfmrhCHR3b6x_2RM0g--
Received: from sonic.gate.mail.ne1.yahoo.com by sonic311.consmr.mail.ne1.yahoo.com with HTTP; Tue, 7 Apr 2020 00:12:01 +0000
Received: by smtp427.mail.ne1.yahoo.com (Oath Hermes SMTP Server) with ESMTPA ID abaaf53643d180ae90eb1302a33b601d;
          Tue, 07 Apr 2020 00:11:56 +0000 (UTC)
From:   Casey Schaufler <casey@schaufler-ca.com>
To:     casey.schaufler@intel.com, jmorris@namei.org,
        linux-security-module@vger.kernel.org, selinux@vger.kernel.org
Cc:     casey@schaufler-ca.com, keescook@chromium.org,
        john.johansen@canonical.com, penguin-kernel@i-love.sakura.ne.jp,
        paul@paul-moore.com, sds@tycho.nsa.gov, linux-audit@redhat.com
Subject: [PATCH v16 09/23] LSM: Use lsmblob in security_task_getsecid
Date:   Mon,  6 Apr 2020 17:01:45 -0700
Message-Id: <20200407000159.43602-10-casey@schaufler-ca.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200407000159.43602-1-casey@schaufler-ca.com>
References: <20200407000159.43602-1-casey@schaufler-ca.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Change the security_task_getsecid() interface to fill in
a lsmblob structure instead of a u32 secid in support of
LSM stacking. Audit interfaces will need to collect all
possible secids for possible reporting.

Reviewed-by: Kees Cook <keescook@chromium.org>
Reviewed-by: John Johansen <john.johansen@canonical.com>
Acked-by: Stephen Smalley <sds@tycho.nsa.gov>
Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
cc: linux-integrity@vger.kernel.org
---
 drivers/android/binder.c              | 12 +-------
 include/linux/security.h              |  7 +++--
 kernel/audit.c                        | 16 ++++------
 kernel/auditfilter.c                  |  4 +--
 kernel/auditsc.c                      | 25 ++++++++--------
 net/netlabel/netlabel_unlabeled.c     |  5 +++-
 net/netlabel/netlabel_user.h          |  6 +++-
 security/integrity/ima/ima_appraise.c | 10 ++++---
 security/integrity/ima/ima_main.c     | 42 +++++++++++++++------------
 security/security.c                   | 12 ++++++--
 10 files changed, 72 insertions(+), 67 deletions(-)

diff --git a/drivers/android/binder.c b/drivers/android/binder.c
index 2783fd9c7ad6..b6f22979a1db 100644
--- a/drivers/android/binder.c
+++ b/drivers/android/binder.c
@@ -3106,20 +3106,10 @@ static void binder_transaction(struct binder_proc *proc,
 	t->priority = task_nice(current);
 
 	if (target_node && target_node->txn_security_ctx) {
-		u32 secid;
 		struct lsmblob blob;
 		size_t added_size;
 
-		security_task_getsecid(proc->tsk, &secid);
-		/*
-		 * Later in this patch set security_task_getsecid() will
-		 * provide a lsmblob instead of a secid. lsmblob_init
-		 * is used to ensure that all the secids in the lsmblob
-		 * get the value returned from security_task_getsecid(),
-		 * which means that the one expected by
-		 * security_secid_to_secctx() will be set.
-		 */
-		lsmblob_init(&blob, secid);
+		security_task_getsecid(proc->tsk, &blob);
 		ret = security_secid_to_secctx(&blob, &secctx, &secctx_sz);
 		if (ret) {
 			return_error = BR_FAILED_REPLY;
diff --git a/include/linux/security.h b/include/linux/security.h
index 10c607a40057..cbc02e13e4b4 100644
--- a/include/linux/security.h
+++ b/include/linux/security.h
@@ -472,7 +472,7 @@ int security_task_fix_setuid(struct cred *new, const struct cred *old,
 int security_task_setpgid(struct task_struct *p, pid_t pgid);
 int security_task_getpgid(struct task_struct *p);
 int security_task_getsid(struct task_struct *p);
-void security_task_getsecid(struct task_struct *p, u32 *secid);
+void security_task_getsecid(struct task_struct *p, struct lsmblob *blob);
 int security_task_setnice(struct task_struct *p, int nice);
 int security_task_setioprio(struct task_struct *p, int ioprio);
 int security_task_getioprio(struct task_struct *p);
@@ -1124,9 +1124,10 @@ static inline int security_task_getsid(struct task_struct *p)
 	return 0;
 }
 
-static inline void security_task_getsecid(struct task_struct *p, u32 *secid)
+static inline void security_task_getsecid(struct task_struct *p,
+					  struct lsmblob *blob)
 {
-	*secid = 0;
+	lsmblob_init(blob, 0);
 }
 
 static inline int security_task_setnice(struct task_struct *p, int nice)
diff --git a/kernel/audit.c b/kernel/audit.c
index 11da27db9b90..1a7646854813 100644
--- a/kernel/audit.c
+++ b/kernel/audit.c
@@ -2071,19 +2071,12 @@ int audit_log_task_context(struct audit_buffer *ab)
 	char *ctx = NULL;
 	unsigned len;
 	int error;
-	u32 sid;
 	struct lsmblob blob;
 
-	security_task_getsecid(current, &sid);
-	if (!sid)
+	security_task_getsecid(current, &blob);
+	if (!lsmblob_is_set(&blob))
 		return 0;
 
-	/*
-	 * lsmblob_init sets all values in the lsmblob to sid.
-	 * This is temporary until security_task_getsecid is converted
-	 * to use a lsmblob, which happens later in this patch set.
-	 */
-	lsmblob_init(&blob, sid);
 	error = security_secid_to_secctx(&blob, &ctx, &len);
 	if (error) {
 		if (error != -EINVAL)
@@ -2291,6 +2284,7 @@ int audit_set_loginuid(kuid_t loginuid)
 int audit_signal_info(int sig, struct task_struct *t)
 {
 	kuid_t uid = current_uid(), auid;
+	struct lsmblob blob;
 
 	if (auditd_test_task(t) &&
 	    (sig == SIGTERM || sig == SIGHUP ||
@@ -2301,7 +2295,9 @@ int audit_signal_info(int sig, struct task_struct *t)
 			audit_sig_uid = auid;
 		else
 			audit_sig_uid = uid;
-		security_task_getsecid(current, &audit_sig_sid);
+		security_task_getsecid(current, &blob);
+		/* scaffolding until audit_sig_sid is converted */
+		audit_sig_sid = blob.secid[0];
 	}
 
 	return audit_signal_info_syscall(t);
diff --git a/kernel/auditfilter.c b/kernel/auditfilter.c
index 542eee7ad882..eb1dc5dfe408 100644
--- a/kernel/auditfilter.c
+++ b/kernel/auditfilter.c
@@ -1332,7 +1332,6 @@ int audit_filter(int msgtype, unsigned int listtype)
 		for (i = 0; i < e->rule.field_count; i++) {
 			struct audit_field *f = &e->rule.fields[i];
 			pid_t pid;
-			u32 sid;
 			struct lsmblob blob;
 
 			switch (f->type) {
@@ -1363,8 +1362,7 @@ int audit_filter(int msgtype, unsigned int listtype)
 			case AUDIT_SUBJ_SEN:
 			case AUDIT_SUBJ_CLR:
 				if (f->lsm_isset) {
-					security_task_getsecid(current, &sid);
-					lsmblob_init(&blob, sid);
+					security_task_getsecid(current, &blob);
 					result = security_audit_rule_match(
 						   &blob, f->type, f->op,
 						   f->lsm_rules);
diff --git a/kernel/auditsc.c b/kernel/auditsc.c
index c5aa1f10e7cc..e64f73cd5bc4 100644
--- a/kernel/auditsc.c
+++ b/kernel/auditsc.c
@@ -444,7 +444,6 @@ static int audit_filter_rules(struct task_struct *tsk,
 {
 	const struct cred *cred;
 	int i, need_sid = 1;
-	u32 sid;
 	struct lsmblob blob;
 	unsigned int sessionid;
 
@@ -641,17 +640,9 @@ static int audit_filter_rules(struct task_struct *tsk,
 			   logged upon error */
 			if (f->lsm_isset) {
 				if (need_sid) {
-					security_task_getsecid(tsk, &sid);
+					security_task_getsecid(tsk, &blob);
 					need_sid = 0;
 				}
-				/*
-				 * lsmblob_init sets all values in the lsmblob
-				 * to sid. This is temporary until
-				 * security_task_getsecid() is converted to
-				 * provide a lsmblob, which happens later in
-				 * this patch set.
-				 */
-				lsmblob_init(&blob, sid);
 				result = security_audit_rule_match(&blob,
 								   f->type,
 								   f->op,
@@ -2398,12 +2389,15 @@ int __audit_sockaddr(int len, void *a)
 void __audit_ptrace(struct task_struct *t)
 {
 	struct audit_context *context = audit_context();
+	struct lsmblob blob;
 
 	context->target_pid = task_tgid_nr(t);
 	context->target_auid = audit_get_loginuid(t);
 	context->target_uid = task_uid(t);
 	context->target_sessionid = audit_get_sessionid(t);
-	security_task_getsecid(t, &context->target_sid);
+	security_task_getsecid(t, &blob);
+	/* scaffolding - until target_sid is converted */
+	context->target_sid = blob.secid[0];
 	memcpy(context->target_comm, t->comm, TASK_COMM_LEN);
 }
 
@@ -2419,6 +2413,7 @@ int audit_signal_info_syscall(struct task_struct *t)
 	struct audit_aux_data_pids *axp;
 	struct audit_context *ctx = audit_context();
 	kuid_t t_uid = task_uid(t);
+	struct lsmblob blob;
 
 	if (!audit_signals || audit_dummy_context())
 		return 0;
@@ -2430,7 +2425,9 @@ int audit_signal_info_syscall(struct task_struct *t)
 		ctx->target_auid = audit_get_loginuid(t);
 		ctx->target_uid = t_uid;
 		ctx->target_sessionid = audit_get_sessionid(t);
-		security_task_getsecid(t, &ctx->target_sid);
+		security_task_getsecid(t, &blob);
+		/* scaffolding until target_sid is converted */
+		ctx->target_sid = blob.secid[0];
 		memcpy(ctx->target_comm, t->comm, TASK_COMM_LEN);
 		return 0;
 	}
@@ -2451,7 +2448,9 @@ int audit_signal_info_syscall(struct task_struct *t)
 	axp->target_auid[axp->pid_count] = audit_get_loginuid(t);
 	axp->target_uid[axp->pid_count] = t_uid;
 	axp->target_sessionid[axp->pid_count] = audit_get_sessionid(t);
-	security_task_getsecid(t, &axp->target_sid[axp->pid_count]);
+	security_task_getsecid(t, &blob);
+	/* scaffolding until target_sid is converted */
+	axp->target_sid[axp->pid_count] = blob.secid[0];
 	memcpy(axp->target_comm[axp->pid_count], t->comm, TASK_COMM_LEN);
 	axp->pid_count++;
 
diff --git a/net/netlabel/netlabel_unlabeled.c b/net/netlabel/netlabel_unlabeled.c
index 2ebe29ddf05e..f4a6204f4205 100644
--- a/net/netlabel/netlabel_unlabeled.c
+++ b/net/netlabel/netlabel_unlabeled.c
@@ -1557,11 +1557,14 @@ int __init netlbl_unlabel_defconf(void)
 	int ret_val;
 	struct netlbl_dom_map *entry;
 	struct netlbl_audit audit_info;
+	struct lsmblob blob;
 
 	/* Only the kernel is allowed to call this function and the only time
 	 * it is called is at bootup before the audit subsystem is reporting
 	 * messages so don't worry to much about these values. */
-	security_task_getsecid(current, &audit_info.secid);
+	security_task_getsecid(current, &blob);
+	/* scaffolding until audit_info.secid is converted */
+	audit_info.secid = blob.secid[0];
 	audit_info.loginuid = GLOBAL_ROOT_UID;
 	audit_info.sessionid = 0;
 
diff --git a/net/netlabel/netlabel_user.h b/net/netlabel/netlabel_user.h
index 3c67afce64f1..438b5db6c714 100644
--- a/net/netlabel/netlabel_user.h
+++ b/net/netlabel/netlabel_user.h
@@ -34,7 +34,11 @@
 static inline void netlbl_netlink_auditinfo(struct sk_buff *skb,
 					    struct netlbl_audit *audit_info)
 {
-	security_task_getsecid(current, &audit_info->secid);
+	struct lsmblob blob;
+
+	security_task_getsecid(current, &blob);
+	/* scaffolding until secid is converted */
+	audit_info->secid = blob.secid[0];
 	audit_info->loginuid = audit_get_loginuid(current);
 	audit_info->sessionid = audit_get_sessionid(current);
 }
diff --git a/security/integrity/ima/ima_appraise.c b/security/integrity/ima/ima_appraise.c
index a9649b04b9f1..3dfb573c7171 100644
--- a/security/integrity/ima/ima_appraise.c
+++ b/security/integrity/ima/ima_appraise.c
@@ -48,14 +48,16 @@ bool is_ima_appraise_enabled(void)
  */
 int ima_must_appraise(struct inode *inode, int mask, enum ima_hooks func)
 {
-	u32 secid;
+	struct lsmblob blob;
 
 	if (!ima_appraise)
 		return 0;
 
-	security_task_getsecid(current, &secid);
-	return ima_match_policy(inode, current_cred(), secid, func, mask,
-				IMA_APPRAISE | IMA_HASH, NULL, NULL, NULL);
+	security_task_getsecid(current, &blob);
+	/* scaffolding the .secid[0] */
+	return ima_match_policy(inode, current_cred(), blob.secid[0], func,
+				mask, IMA_APPRAISE | IMA_HASH, NULL, NULL,
+				NULL);
 }
 
 static int ima_fix_xattr(struct dentry *dentry,
diff --git a/security/integrity/ima/ima_main.c b/security/integrity/ima/ima_main.c
index 9fe949c6a530..1f50f68a6f5b 100644
--- a/security/integrity/ima/ima_main.c
+++ b/security/integrity/ima/ima_main.c
@@ -384,12 +384,13 @@ static int process_measurement(struct file *file, const struct cred *cred,
  */
 int ima_file_mmap(struct file *file, unsigned long prot)
 {
-	u32 secid;
+	struct lsmblob blob;
 
 	if (file && (prot & PROT_EXEC)) {
-		security_task_getsecid(current, &secid);
-		return process_measurement(file, current_cred(), secid, NULL,
-					   0, MAY_EXEC, MMAP_CHECK);
+		security_task_getsecid(current, &blob);
+		/* scaffolding - until process_measurement changes */
+		return process_measurement(file, current_cred(), blob.secid[0],
+					   NULL, 0, MAY_EXEC, MMAP_CHECK);
 	}
 
 	return 0;
@@ -412,10 +413,12 @@ int ima_bprm_check(struct linux_binprm *bprm)
 {
 	int ret;
 	u32 secid;
+	struct lsmblob blob;
 
-	security_task_getsecid(current, &secid);
-	ret = process_measurement(bprm->file, current_cred(), secid, NULL, 0,
-				  MAY_EXEC, BPRM_CHECK);
+	security_task_getsecid(current, &blob);
+	/* scaffolding until process_measurement changes */
+	ret = process_measurement(bprm->file, current_cred(), blob.secid[0],
+				  NULL, 0, MAY_EXEC, BPRM_CHECK);
 	if (ret)
 		return ret;
 
@@ -436,10 +439,11 @@ int ima_bprm_check(struct linux_binprm *bprm)
  */
 int ima_file_check(struct file *file, int mask)
 {
-	u32 secid;
+	struct lsmblob blob;
 
-	security_task_getsecid(current, &secid);
-	return process_measurement(file, current_cred(), secid, NULL, 0,
+	security_task_getsecid(current, &blob);
+	/* scaffolding until process_measurement changes */
+	return process_measurement(file, current_cred(), blob.secid[0], NULL, 0,
 				   mask & (MAY_READ | MAY_WRITE | MAY_EXEC |
 					   MAY_APPEND), FILE_CHECK);
 }
@@ -597,7 +601,7 @@ int ima_post_read_file(struct file *file, void *buf, loff_t size,
 		       enum kernel_read_file_id read_id)
 {
 	enum ima_hooks func;
-	u32 secid;
+	struct lsmblob blob;
 
 	if (!file && read_id == READING_FIRMWARE) {
 		if ((ima_appraise & IMA_APPRAISE_FIRMWARE) &&
@@ -619,9 +623,10 @@ int ima_post_read_file(struct file *file, void *buf, loff_t size,
 	}
 
 	func = read_idmap[read_id] ?: FILE_CHECK;
-	security_task_getsecid(current, &secid);
-	return process_measurement(file, current_cred(), secid, buf, size,
-				   MAY_READ, func);
+	security_task_getsecid(current, &blob);
+	/* scaffolding until process_measurement changes */
+	return process_measurement(file, current_cred(), blob.secid[0], buf,
+				   size, MAY_READ, func);
 }
 
 /**
@@ -703,7 +708,7 @@ void process_buffer_measurement(const void *buf, int size,
 	} hash = {};
 	int violation = 0;
 	int action = 0;
-	u32 secid;
+	struct lsmblob blob;
 
 	if (!ima_policy_flag)
 		return;
@@ -716,9 +721,10 @@ void process_buffer_measurement(const void *buf, int size,
 	 * buffer measurements.
 	 */
 	if (func) {
-		security_task_getsecid(current, &secid);
-		action = ima_get_action(NULL, current_cred(), secid, 0, func,
-					&pcr, &template, keyring);
+		security_task_getsecid(current, &blob);
+		/* scaffolding */
+		action = ima_get_action(NULL, current_cred(), blob.secid[0], 0,
+					func, &pcr, &template, keyring);
 		if (!(action & IMA_MEASURE))
 			return;
 	}
diff --git a/security/security.c b/security/security.c
index 776f62291b9f..58c8866d2871 100644
--- a/security/security.c
+++ b/security/security.c
@@ -1732,10 +1732,16 @@ int security_task_getsid(struct task_struct *p)
 	return call_int_hook(task_getsid, 0, p);
 }
 
-void security_task_getsecid(struct task_struct *p, u32 *secid)
+void security_task_getsecid(struct task_struct *p, struct lsmblob *blob)
 {
-	*secid = 0;
-	call_void_hook(task_getsecid, p, secid);
+	struct security_hook_list *hp;
+
+	lsmblob_init(blob, 0);
+	hlist_for_each_entry(hp, &security_hook_heads.task_getsecid, list) {
+		if (WARN_ON(hp->lsmid->slot < 0 || hp->lsmid->slot >= lsm_slot))
+			continue;
+		hp->hook.task_getsecid(p, &blob->secid[hp->lsmid->slot]);
+	}
 }
 EXPORT_SYMBOL(security_task_getsecid);
 
-- 
2.24.1

