Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 72B864AE75
	for <lists+selinux@lfdr.de>; Wed, 19 Jun 2019 01:07:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730418AbfFRXGr (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Tue, 18 Jun 2019 19:06:47 -0400
Received: from sonic316-13.consmr.mail.gq1.yahoo.com ([98.137.69.37]:33360
        "EHLO sonic316-13.consmr.mail.gq1.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730398AbfFRXGq (ORCPT
        <rfc822;selinux@vger.kernel.org>); Tue, 18 Jun 2019 19:06:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1560899204; bh=71/TC47hfTGLeea65EIXbKmiZnFs/xN/VDOTGGgm00g=; h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject; b=FQHoVfWd9dRkeZqAvepGvEBBKhx9SaMFsMms+apvUuBNeKjzU2MN2vE5OoniYKZl7bvC95GKaLAutVSX80u+WMwIWu+A806fTm3DVWhE9XzpJsttvKIabcMWcYHP9m8Ta6tHxahbxgbVLKPVE/6gtOQ4RoQAeok6vk/ru8XMH0XoOzrJbopSBu8+eAMxI2tyj80M5m7lEV9PV/BSp3Ymmd7oyftO923Z8Fb8hRh/6PyTOMswpMGdSolmNBON3SGwWy8JVPCt5C6vEsGrfDKqa+rE1ynRAcRZOk9Qa+4zk3lfDS0NaKepaA05TQDdqm6+AkiVm3FkyLflFNS2jZ8jHQ==
X-YMail-OSG: ALKr7McVM1mYKmCxeZo.2Oxwr16hKErEPvNnf2j6L83zNOWUIpRnI36OjYsjC47
 CSiBm52XEgDEkP_e4FV0dZkSgv_5xpmg5QfmVwMP__1SjMENS68clXRJ4q.QUg1RirblC013E5UO
 O3E0pI9CVLgvp_w48O1Uj1u_ILpQw09CW4yrVNMgXhf9hRdQZl71S.qZul3wNF4wwy30vuEYJYlZ
 btIPZGWE9wKv5FDSS9_LWjKZLA2ognSN0CJbeBLx1GP9hjLlXrV00LS1y1LZAxqailoOXyauwEQZ
 lEEo00Z5Am7NoC0M.a8ILYr7q65EKYBV_xFv9Q7RvBsCHgmr4rF1ALix1KtI15USJ8j0qBdKBGhn
 u8IOR5KDBqgSy7mYblHjLbcoxnp.Gg410Aq48F.G7gcV7WVP5jwn2KJ8qlOh8NUnF9MU_h.XjSSK
 nyQoRgDbpb_VYfBVL2eSq.MA1si9RgAyjbNhAHp9R5gdy9L2YPA2jAHMt1nMbMccrfawThm2PVWU
 7bEjs996k_khy8yX7aLBbkQdryY3K3Sy4NnCMVnK1CAqofSPa1erDQXZMbkurRA6txLWXYpyaDJ8
 7qZBQmbOfutsGTVPfJQNCx289ulUjCELk6Hr_fNg_TCL2ZBX3RmZAhihAQ2hJJ7O4ErwUrSs_cew
 3uZ8GmqgwVQPfoq0kh.nDekYaZVXnSX_ptUdWFljzjiNoYHzTCDy4Qesqp2cw5DAwuX76MUAAZLw
 hjCsK2V6uxmQuxHwu6sEiuAbgHvVXWuIMoKRxanK4LQIjn_HI95SgLfiJTpDEvADnPTWU6srnSXl
 YPkANQM2gQlSCYQ0xjb5Kn5PeB0cpDgctQRTOwOLh_pJzyAt3.DTIZyAx7CCmaHHMDUtFMp5CEmM
 F2.HtYPXEKp4Vz6K8qe41JAVb2ho9.uN4zGJXVmI2rWyszr.AeUiv5l_t8pRo5.zjgJvREHwnxW3
 BnrtKK.C1vmCIKxkuCkApWrluvxNAoZ4qVvDmZUTushHwG7Nt9Kywr0fWVhhnAyRS1KoBRYStb3p
 jCQuRa6zIe8uTn2yvqVQfSAyXHkZS3rvCfIIDS2NsJUH3nJLvwKEdkXn9mF04anjmOZxZGcnmNZC
 NzC9Cfgkm3wUt8u7PQ0fphwy1lpnyX_vT4gSauJFWJOH9MomxV3FSOiNrN3yHmWREb9_988RsCiR
 m972Ac7r1YtNxSVXktU6jQPShm6yFn5pFzdRyhNMNRYaAO2dUT_oL7ZLhgHalNxRlw.q9KxUjuqe
 1Saw2wc7nd1BuOZJBiQA0q.flwIsfDPQiVJyJvpyF
Received: from sonic.gate.mail.ne1.yahoo.com by sonic316.consmr.mail.gq1.yahoo.com with HTTP; Tue, 18 Jun 2019 23:06:44 +0000
Received: from c-73-223-4-185.hsd1.ca.comcast.net (EHLO localhost.net) ([73.223.4.185])
          by smtp427.mail.gq1.yahoo.com (Oath Hermes SMTP Server) with ESMTPA ID b5c484e6312471c03acab1f233ace257;
          Tue, 18 Jun 2019 23:06:42 +0000 (UTC)
From:   Casey Schaufler <casey@schaufler-ca.com>
To:     casey.schaufler@intel.com, jmorris@namei.org,
        linux-security-module@vger.kernel.org, selinux@vger.kernel.org
Cc:     casey@schaufler-ca.com, keescook@chromium.org,
        john.johansen@canonical.com, penguin-kernel@i-love.sakura.ne.jp,
        paul@paul-moore.com, sds@tycho.nsa.gov
Subject: [PATCH v2 13/25] LSM: Use lsmblob in security_cred_getsecid
Date:   Tue, 18 Jun 2019 16:05:39 -0700
Message-Id: <20190618230551.7475-14-casey@schaufler-ca.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190618230551.7475-1-casey@schaufler-ca.com>
References: <20190618230551.7475-1-casey@schaufler-ca.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Change the security_cred_getsecid() interface to fill in a
lsmblob instead of a u32 secid. The associated data elements
in the audit sub-system are changed from a secid to a lsmblob
to accomodate multiple possible LSM audit users.

Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
---
 include/linux/security.h          |  2 +-
 kernel/audit.c                    | 14 +++++-------
 kernel/audit.h                    |  5 +++--
 kernel/auditsc.c                  | 37 +++++++++++--------------------
 security/integrity/ima/ima_main.c |  6 ++---
 security/security.c               |  9 +++++---
 6 files changed, 32 insertions(+), 41 deletions(-)

diff --git a/include/linux/security.h b/include/linux/security.h
index b28d4f9c7714..07a239292e02 100644
--- a/include/linux/security.h
+++ b/include/linux/security.h
@@ -383,7 +383,7 @@ int security_cred_alloc_blank(struct cred *cred, gfp_t gfp);
 void security_cred_free(struct cred *cred);
 int security_prepare_creds(struct cred *new, const struct cred *old, gfp_t gfp);
 void security_transfer_creds(struct cred *new, const struct cred *old);
-void security_cred_getsecid(const struct cred *c, u32 *secid);
+void security_cred_getsecid(const struct cred *c, struct lsmblob *l);
 int security_kernel_act_as(struct cred *new, struct lsmblob *l);
 int security_kernel_create_files_as(struct cred *new, struct inode *inode);
 int security_kernel_module_request(char *kmod_name);
diff --git a/kernel/audit.c b/kernel/audit.c
index 3ab2a1c0ba61..a52f8772477f 100644
--- a/kernel/audit.c
+++ b/kernel/audit.c
@@ -137,7 +137,7 @@ static u32	audit_backlog_wait_time = AUDIT_BACKLOG_WAIT_TIME;
 /* The identity of the user shutting down the audit system. */
 kuid_t		audit_sig_uid = INVALID_UID;
 pid_t		audit_sig_pid = -1;
-u32		audit_sig_sid = 0;
+struct lsmblob	audit_sig_lsm;
 
 /* Records can be lost in several ways:
    0) [suppressed in audit_alloc]
@@ -1429,23 +1429,21 @@ static int audit_receive_msg(struct sk_buff *skb, struct nlmsghdr *nlh)
 	}
 	case AUDIT_SIGNAL_INFO:
 		len = 0;
-		if (audit_sig_sid) {
-			struct lsmblob le;
-
-			lsmblob_init(&le, audit_sig_sid);
-			err = security_secid_to_secctx(&le, &ctx, &len);
+		if (lsmblob_is_set(&audit_sig_lsm)) {
+			err = security_secid_to_secctx(&audit_sig_lsm, &ctx,
+						       &len);
 			if (err)
 				return err;
 		}
 		sig_data = kmalloc(sizeof(*sig_data) + len, GFP_KERNEL);
 		if (!sig_data) {
-			if (audit_sig_sid)
+			if (lsmblob_is_set(&audit_sig_lsm))
 				security_release_secctx(ctx, len);
 			return -ENOMEM;
 		}
 		sig_data->uid = from_kuid(&init_user_ns, audit_sig_uid);
 		sig_data->pid = audit_sig_pid;
-		if (audit_sig_sid) {
+		if (lsmblob_is_set(&audit_sig_lsm)) {
 			memcpy(sig_data->ctx, ctx, len);
 			security_release_secctx(ctx, len);
 		}
diff --git a/kernel/audit.h b/kernel/audit.h
index 958d5b8fc1b3..29e29c6f4afb 100644
--- a/kernel/audit.h
+++ b/kernel/audit.h
@@ -22,6 +22,7 @@
 #include <linux/fs.h>
 #include <linux/audit.h>
 #include <linux/skbuff.h>
+#include <linux/security.h>
 #include <uapi/linux/mqueue.h>
 #include <linux/tty.h>
 
@@ -147,7 +148,7 @@ struct audit_context {
 	kuid_t		    target_auid;
 	kuid_t		    target_uid;
 	unsigned int	    target_sessionid;
-	u32		    target_sid;
+	struct lsmblob   target_lsm;
 	char		    target_comm[TASK_COMM_LEN];
 
 	struct audit_tree_refs *trees, *first_trees;
@@ -338,7 +339,7 @@ extern char *audit_unpack_string(void **bufp, size_t *remain, size_t len);
 
 extern pid_t audit_sig_pid;
 extern kuid_t audit_sig_uid;
-extern u32 audit_sig_sid;
+extern struct lsmblob audit_sig_lsm;
 
 extern int audit_filter(int msgtype, unsigned int listtype);
 
diff --git a/kernel/auditsc.c b/kernel/auditsc.c
index cdd1dd9e0eec..ebdd7eab9247 100644
--- a/kernel/auditsc.c
+++ b/kernel/auditsc.c
@@ -112,7 +112,7 @@ struct audit_aux_data_pids {
 	kuid_t			target_auid[AUDIT_AUX_PIDS];
 	kuid_t			target_uid[AUDIT_AUX_PIDS];
 	unsigned int		target_sessionid[AUDIT_AUX_PIDS];
-	u32			target_sid[AUDIT_AUX_PIDS];
+	struct lsmblob	target_lsm[AUDIT_AUX_PIDS];
 	char 			target_comm[AUDIT_AUX_PIDS][TASK_COMM_LEN];
 	int			pid_count;
 };
@@ -937,14 +937,14 @@ static inline void audit_free_context(struct audit_context *context)
 }
 
 static int audit_log_pid_context(struct audit_context *context, pid_t pid,
-				 kuid_t auid, kuid_t uid, unsigned int sessionid,
-				 u32 sid, char *comm)
+				 kuid_t auid, kuid_t uid,
+				 unsigned int sessionid,
+				 struct lsmblob *l, char *comm)
 {
 	struct audit_buffer *ab;
 	char *ctx = NULL;
 	u32 len;
 	int rc = 0;
-	struct lsmblob le;
 
 	ab = audit_log_start(context, GFP_KERNEL, AUDIT_OBJ_PID);
 	if (!ab)
@@ -953,9 +953,8 @@ static int audit_log_pid_context(struct audit_context *context, pid_t pid,
 	audit_log_format(ab, "opid=%d oauid=%d ouid=%d oses=%d", pid,
 			 from_kuid(&init_user_ns, auid),
 			 from_kuid(&init_user_ns, uid), sessionid);
-	if (sid) {
-		lsmblob_init(&le, sid);
-		if (security_secid_to_secctx(&le, &ctx, &len)) {
+	if (lsmblob_is_set(l)) {
+		if (security_secid_to_secctx(l, &ctx, &len)) {
 			audit_log_format(ab, " obj=(none)");
 			rc = 1;
 		} else {
@@ -1525,7 +1524,7 @@ static void audit_log_exit(void)
 						  axs->target_auid[i],
 						  axs->target_uid[i],
 						  axs->target_sessionid[i],
-						  axs->target_sid[i],
+						  &axs->target_lsm[i],
 						  axs->target_comm[i]))
 				call_panic = 1;
 	}
@@ -1534,7 +1533,7 @@ static void audit_log_exit(void)
 	    audit_log_pid_context(context, context->target_pid,
 				  context->target_auid, context->target_uid,
 				  context->target_sessionid,
-				  context->target_sid, context->target_comm))
+				  &context->target_lsm, context->target_comm))
 			call_panic = 1;
 
 	if (context->pwd.dentry && context->pwd.mnt) {
@@ -1711,7 +1710,7 @@ void __audit_syscall_exit(int success, long return_code)
 	context->aux = NULL;
 	context->aux_pids = NULL;
 	context->target_pid = 0;
-	context->target_sid = 0;
+	lsmblob_init(&context->target_lsm, 0);
 	context->sockaddr_len = 0;
 	context->type = 0;
 	context->fds[0] = -1;
@@ -2365,15 +2364,12 @@ int __audit_sockaddr(int len, void *a)
 void __audit_ptrace(struct task_struct *t)
 {
 	struct audit_context *context = audit_context();
-	struct lsmblob le;
 
 	context->target_pid = task_tgid_nr(t);
 	context->target_auid = audit_get_loginuid(t);
 	context->target_uid = task_uid(t);
 	context->target_sessionid = audit_get_sessionid(t);
-	security_task_getsecid(t, &le);
-	/* scaffolding - until target_sid is converted */
-	context->target_sid = le.secid[1];
+	security_task_getsecid(t, &context->target_lsm);
 	memcpy(context->target_comm, t->comm, TASK_COMM_LEN);
 }
 
@@ -2390,7 +2386,6 @@ int audit_signal_info(int sig, struct task_struct *t)
 	struct audit_aux_data_pids *axp;
 	struct audit_context *ctx = audit_context();
 	kuid_t uid = current_uid(), auid, t_uid = task_uid(t);
-	struct lsmblob le;
 
 	if (auditd_test_task(t) &&
 	    (sig == SIGTERM || sig == SIGHUP ||
@@ -2401,9 +2396,7 @@ int audit_signal_info(int sig, struct task_struct *t)
 			audit_sig_uid = auid;
 		else
 			audit_sig_uid = uid;
-		security_task_getsecid(current, &le);
-		/* scaffolding until audit_sig_sid is converted */
-		audit_sig_sid = le.secid[1];
+		security_task_getsecid(current, &audit_sig_lsm);
 	}
 
 	if (!audit_signals || audit_dummy_context())
@@ -2416,9 +2409,7 @@ int audit_signal_info(int sig, struct task_struct *t)
 		ctx->target_auid = audit_get_loginuid(t);
 		ctx->target_uid = t_uid;
 		ctx->target_sessionid = audit_get_sessionid(t);
-		security_task_getsecid(t, &le);
-		/* scaffolding until target_sid is converted */
-		ctx->target_sid = le.secid[1];
+		security_task_getsecid(t, &ctx->target_lsm);
 		memcpy(ctx->target_comm, t->comm, TASK_COMM_LEN);
 		return 0;
 	}
@@ -2439,9 +2430,7 @@ int audit_signal_info(int sig, struct task_struct *t)
 	axp->target_auid[axp->pid_count] = audit_get_loginuid(t);
 	axp->target_uid[axp->pid_count] = t_uid;
 	axp->target_sessionid[axp->pid_count] = audit_get_sessionid(t);
-	security_task_getsecid(t, &le);
-	/* scaffolding until target_sid is converted */
-	axp->target_sid[axp->pid_count] = le.secid[1];
+	security_task_getsecid(t, &axp->target_lsm[axp->pid_count]);
 	memcpy(axp->target_comm[axp->pid_count], t->comm, TASK_COMM_LEN);
 	axp->pid_count++;
 
diff --git a/security/integrity/ima/ima_main.c b/security/integrity/ima/ima_main.c
index 99870a6286a9..9959d7cbe42e 100644
--- a/security/integrity/ima/ima_main.c
+++ b/security/integrity/ima/ima_main.c
@@ -363,7 +363,6 @@ int ima_file_mmap(struct file *file, unsigned long prot)
 int ima_bprm_check(struct linux_binprm *bprm)
 {
 	int ret;
-	u32 secid;
 	struct lsmblob le;
 
 	security_task_getsecid(current, &le);
@@ -373,8 +372,9 @@ int ima_bprm_check(struct linux_binprm *bprm)
 	if (ret)
 		return ret;
 
-	security_cred_getsecid(bprm->cred, &secid);
-	return process_measurement(bprm->file, bprm->cred, secid, NULL, 0,
+	security_cred_getsecid(bprm->cred, &le);
+	/* scaffolding until process_measurement changes */
+	return process_measurement(bprm->file, bprm->cred, le.secid[1], NULL, 0,
 				   MAY_EXEC, CREDS_CHECK);
 }
 
diff --git a/security/security.c b/security/security.c
index e82994667263..46f6cf21d33c 100644
--- a/security/security.c
+++ b/security/security.c
@@ -1638,10 +1638,13 @@ void security_transfer_creds(struct cred *new, const struct cred *old)
 	call_void_hook(cred_transfer, new, old);
 }
 
-void security_cred_getsecid(const struct cred *c, u32 *secid)
+void security_cred_getsecid(const struct cred *c, struct lsmblob *l)
 {
-	*secid = 0;
-	call_void_hook(cred_getsecid, c, secid);
+	struct security_hook_list *hp;
+
+	lsmblob_init(l, 0);
+	hlist_for_each_entry(hp, &security_hook_heads.cred_getsecid, list)
+		hp->hook.cred_getsecid(c, &l->secid[hp->slot]);
 }
 EXPORT_SYMBOL(security_cred_getsecid);
 
-- 
2.20.1

