Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4BB67F9ECE
	for <lists+selinux@lfdr.de>; Wed, 13 Nov 2019 01:01:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727109AbfKMABi (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Tue, 12 Nov 2019 19:01:38 -0500
Received: from sonic315-27.consmr.mail.ne1.yahoo.com ([66.163.190.153]:43505
        "EHLO sonic315-27.consmr.mail.ne1.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727022AbfKMABi (ORCPT
        <rfc822;selinux@vger.kernel.org>); Tue, 12 Nov 2019 19:01:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1573603294; bh=7HR/aGdlnp0uR+NQqWULiOQPLAS9AGQ88cLH2bIOOXc=; h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject; b=BsWSG6+ybZ4EFpaAeE+mQCDlE2DQj6jy9gz0JrDINAr4PvX6qIyk8LNP7znusr5Gy0+iFDF82qBdkl3+fQ9xTGdiUQI6C17m4ZfdA4imsYR2ol3Sjul1RrthW/a/ifJ+WLMQoSszNRB41JGBud1TkXWBQxQwwLRBGnlNX+GMGg8bo2Ui111Q7OB7tRzMgj2ix5RjPZkM1x7bb+hYRPlYGMg+yAWx1pj84akII6kUt9b/tSXbOPHD7VYFHVYqn/Ci1JlXHQu8vgx0IsX6LBAl8FQq1mldyPgpZ+hTUz8Lt37X+FEuwc7SE4WXimJ24hdWRhLB16pb/S4sBUN9PL9usw==
X-YMail-OSG: OChq084VM1laSrSyN8AqWxP79HfCOjgSQ0XRXluUD4yA_.kiS9edIcyHCppzweG
 tntzhDeh4Gvz7qiliqzosN6UdfwtKn1u7qVcEHC6sMYaKpRIyEFvb4qivSmthuXFtDsk_c7mDvm6
 fHnAaCftySU7v.A1v8E1cD299UjAfliXGf__oCJa4cyqdL1O_IcQjYH_xxvckE6qcVI5bgZ9ePSt
 Wp14XzhntC8fEchyJldHp9.dswuYRtHzJbdO70gSFn89ZwbcZzZIiNBZ3OSNdIan.IVMe1q0R1GI
 SmWKWD5khbRmhbvvIUt_1PIdYgNmv8y3YO9HcBIMk7ZhMsOhu_u1vJC7zv6wfnPxTdMVwPqGBWgR
 5.o4VvxjtycSFeyrU_kO5MCKVlLqs4rbTAgljNGL9LQXZiFafOTP48tRJcZbM_F9dzivk7Mx05hh
 e6VjYT.EjcSH15P6p_AcfvFTE5UrrToJwotLNbFcOi18GECb6llXSMspsCXRVlRxKIANHlFwGaee
 uLjGL6rOFFyUfeQnVJ07jX_ZDW7J997jM4kc1NxPph5dgDB8LHKAksr9SsFXUlLBiI1d8hExXYkx
 aFrFk_OsdKR7IsDNBjLGyCz1IbC6hJQGjbeHTCHHJ0bjnEutfue7kBcZESQHDNm4anH1xoRxBo3r
 4zt_cZ9BpZym8oEf9dZB8qg4d5O5dEb4Urd9SgiBMkAbCfzkR2QsEzlwjp6aGrtYcvkCFfPvQlQ6
 o4vJNTRvSnz8QASQcK9vd9rBbGcX9TzOXtUdSkKNWkPCCadadfSI6jojv_yL9XUKUOO8HqfS95hD
 bFw2bdm1ovQJCJsxCOTU8W0mfLTQ9s9bUegrlMkYQVux9QCxwPTocNATlrrLsPUV5.EcPd25zTTc
 TpDrcrUAac3wrcPY7qlHmC24AFUzSnrYf3_mC4ba0Acxjlb9pt0dMUi0R_2g26QaYxOFjIRp9yDW
 qe2.ijiNJUcJYFaVLWPMuAU_bf0okF0DdVyRmmT9M3nSB7nvAxUB1IK1LHHTN4S2XdzCWnwxR.ch
 qt.Ki0cfCwq2hcMnqAe4xSXLS115DbmQRRcecHz_YPaL9.3dHCPsk6mlm8KqABnFSs9u8c4O7M4G
 gyHwZGzUXDR.asd9XlrxfAo85Q0_0xq7rmfqO5JTgnQKYT1eIctF0L6rss0Z20TrR4uXvwvVaNn1
 VQ2xnN93tCuK1USd3xPM3PSumCmhDlB_NEVT4iqpizo.F7jx6Jd56pcqOk3FL20lbjLGhPfm6zCe
 rWgOIiRYt1v4xtYNutm3RsOOyKnwX_IptqKjBHLJp8RoncT5BcNKaYjpM_0qTulrmngnOej0mlNa
 XwQMrCFa1EG7JSpU7yzc.AUkJiNERxwEg7eMwvptccvffbz9nqBfCa83la_15CgKNiXIkMLCuyf_
 tO5nYSuEf_FEj31tSnIo2psAnXu1KBx6K4ady2iby_TyQU8sMs0La1UrPYWI-
Received: from sonic.gate.mail.ne1.yahoo.com by sonic315.consmr.mail.ne1.yahoo.com with HTTP; Wed, 13 Nov 2019 00:01:34 +0000
Received: by smtp416.mail.bf1.yahoo.com (Oath Hermes SMTP Server) with ESMTPA ID 3fc9e96fd936fb81ed3ed6b645523234;
          Wed, 13 Nov 2019 00:01:28 +0000 (UTC)
From:   Casey Schaufler <casey@schaufler-ca.com>
To:     casey.schaufler@intel.com, jmorris@namei.org,
        linux-security-module@vger.kernel.org, selinux@vger.kernel.org
Cc:     casey@schaufler-ca.com, keescook@chromium.org,
        john.johansen@canonical.com, penguin-kernel@i-love.sakura.ne.jp,
        paul@paul-moore.com, sds@tycho.nsa.gov
Subject: [PATCH v10 21/25] Audit: Add subj_LSM fields when necessary
Date:   Tue, 12 Nov 2019 16:00:18 -0800
Message-Id: <20191113000022.5300-22-casey@schaufler-ca.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191113000022.5300-1-casey@schaufler-ca.com>
References: <20191113000022.5300-1-casey@schaufler-ca.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Add record entries to identify subject data for all of the
security modules when there is more than one.

Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
---
 drivers/android/binder.c                |  2 +-
 include/linux/audit.h                   |  1 +
 include/linux/security.h                |  9 ++++-
 include/net/scm.h                       |  3 +-
 kernel/audit.c                          | 40 ++++++++++++++++++-
 kernel/audit_fsnotify.c                 |  1 +
 kernel/auditfilter.c                    |  1 +
 kernel/auditsc.c                        | 10 +++--
 net/ipv4/ip_sockglue.c                  |  2 +-
 net/netfilter/nf_conntrack_netlink.c    |  4 +-
 net/netfilter/nf_conntrack_standalone.c |  2 +-
 net/netfilter/nfnetlink_queue.c         |  2 +-
 net/netlabel/netlabel_unlabeled.c       | 11 ++++--
 net/netlabel/netlabel_user.c            |  2 +-
 net/xfrm/xfrm_policy.c                  |  2 +
 net/xfrm/xfrm_state.c                   |  2 +
 security/integrity/ima/ima_api.c        |  1 +
 security/integrity/integrity_audit.c    |  1 +
 security/security.c                     | 51 +++++++++++++++++++++++--
 19 files changed, 124 insertions(+), 23 deletions(-)

diff --git a/drivers/android/binder.c b/drivers/android/binder.c
index 90bc4ce07cd2..cb44f59b9bbe 100644
--- a/drivers/android/binder.c
+++ b/drivers/android/binder.c
@@ -3121,7 +3121,7 @@ static void binder_transaction(struct binder_proc *proc,
 		struct lsmblob blob;
 
 		security_task_getsecid(proc->tsk, &blob);
-		ret = security_secid_to_secctx(&blob, &lsmctx);
+		ret = security_secid_to_secctx(&blob, &lsmctx, LSMBLOB_DISPLAY);
 		if (ret) {
 			return_error = BR_FAILED_REPLY;
 			return_error_param = ret;
diff --git a/include/linux/audit.h b/include/linux/audit.h
index 1e69d9fe16da..306b404d419c 100644
--- a/include/linux/audit.h
+++ b/include/linux/audit.h
@@ -152,6 +152,7 @@ extern void		    audit_log_link_denied(const char *operation);
 extern void		    audit_log_lost(const char *message);
 
 extern int audit_log_task_context(struct audit_buffer *ab);
+extern void audit_log_task_lsms(struct audit_buffer *ab);
 extern void audit_log_task_info(struct audit_buffer *ab);
 
 extern int		    audit_update_lsm_rules(void);
diff --git a/include/linux/security.h b/include/linux/security.h
index 4b685770c399..35b03b57bce2 100644
--- a/include/linux/security.h
+++ b/include/linux/security.h
@@ -128,6 +128,8 @@ struct lsmblob {
 #define LSMBLOB_INVALID		-1	/* Not a valid LSM slot number */
 #define LSMBLOB_NEEDED		-2	/* Slot requested on initialization */
 #define LSMBLOB_NOT_NEEDED	-3	/* Slot not requested */
+#define LSMBLOB_DISPLAY		-4	/* Use the "display" slot */
+#define LSMBLOB_FIRST		-5	/* Use the default "display" slot */
 
 /**
  * lsmblob_init - initialize an lsmblob structure.
@@ -169,6 +171,8 @@ static inline bool lsmblob_equal(struct lsmblob *bloba, struct lsmblob *blobb)
 	return !memcmp(bloba, blobb, sizeof(*bloba));
 }
 
+const char *security_lsm_slot_name(int slot);
+
 /* These functions are in security/commoncap.c */
 extern int cap_capable(const struct cred *cred, struct user_namespace *ns,
 		       int cap, unsigned int opts);
@@ -473,7 +477,8 @@ int security_setprocattr(const char *lsm, const char *name, void *value,
 			 size_t size);
 int security_netlink_send(struct sock *sk, struct sk_buff *skb);
 int security_ismaclabel(const char *name);
-int security_secid_to_secctx(struct lsmblob *blob, struct lsmcontext *cp);
+int security_secid_to_secctx(struct lsmblob *blob, struct lsmcontext *cp,
+			     int display);
 int security_secctx_to_secid(const char *secdata, u32 seclen,
 			     struct lsmblob *blob);
 void security_release_secctx(struct lsmcontext *cp);
@@ -1254,7 +1259,7 @@ static inline int security_ismaclabel(const char *name)
 }
 
 static inline int security_secid_to_secctx(struct lsmblob *blob,
-					   struct lsmcontext *cp)
+					   struct lsmcontext *cp, int display)
 {
 	return -EOPNOTSUPP;
 }
diff --git a/include/net/scm.h b/include/net/scm.h
index 4a6ad8caf423..8b5a4737e1b8 100644
--- a/include/net/scm.h
+++ b/include/net/scm.h
@@ -96,7 +96,8 @@ static inline void scm_passec(struct socket *sock, struct msghdr *msg, struct sc
 	int err;
 
 	if (test_bit(SOCK_PASSSEC, &sock->flags)) {
-		err = security_secid_to_secctx(&scm->lsmblob, &context);
+		err = security_secid_to_secctx(&scm->lsmblob, &context,
+					       LSMBLOB_DISPLAY);
 
 		if (!err) {
 			put_cmsg(msg, SOL_SOCKET, SCM_SECURITY,
diff --git a/kernel/audit.c b/kernel/audit.c
index e1dfd9c6df36..45ea36f1f1c5 100644
--- a/kernel/audit.c
+++ b/kernel/audit.c
@@ -405,6 +405,7 @@ static int audit_log_config_change(char *function_name, u32 new, u32 old,
 	if (rc)
 		allow_changes = 0; /* Something weird, deny request */
 	audit_log_format(ab, " res=%d", allow_changes);
+	audit_log_task_lsms(ab);
 	audit_log_end(ab);
 	return rc;
 }
@@ -1110,6 +1111,7 @@ static void audit_log_feature_change(int which, u32 old_feature, u32 new_feature
 	audit_log_format(ab, " feature=%s old=%u new=%u old_lock=%u new_lock=%u res=%d",
 			 audit_feature_names[which], !!old_feature, !!new_feature,
 			 !!old_lock, !!new_lock, res);
+	audit_log_task_lsms(ab);
 	audit_log_end(ab);
 }
 
@@ -1360,6 +1362,7 @@ static int audit_receive_msg(struct sk_buff *skb, struct nlmsghdr *nlh)
 					size--;
 				audit_log_n_untrustedstring(ab, data, size);
 			}
+			audit_log_task_lsms(ab);
 			audit_log_end(ab);
 		}
 		break;
@@ -1374,6 +1377,7 @@ static int audit_receive_msg(struct sk_buff *skb, struct nlmsghdr *nlh)
 					 msg_type == AUDIT_ADD_RULE ?
 						"add_rule" : "remove_rule",
 					 audit_enabled);
+			audit_log_task_lsms(ab);
 			audit_log_end(ab);
 			return -EPERM;
 		}
@@ -1387,6 +1391,7 @@ static int audit_receive_msg(struct sk_buff *skb, struct nlmsghdr *nlh)
 		audit_log_common_recv_msg(audit_context(), &ab,
 					  AUDIT_CONFIG_CHANGE);
 		audit_log_format(ab, " op=trim res=1");
+		audit_log_task_lsms(ab);
 		audit_log_end(ab);
 		break;
 	case AUDIT_MAKE_EQUIV: {
@@ -1422,6 +1427,7 @@ static int audit_receive_msg(struct sk_buff *skb, struct nlmsghdr *nlh)
 		audit_log_format(ab, " new=");
 		audit_log_untrustedstring(ab, new);
 		audit_log_format(ab, " res=%d", !err);
+		audit_log_task_lsms(ab);
 		audit_log_end(ab);
 		kfree(old);
 		kfree(new);
@@ -1431,7 +1437,7 @@ static int audit_receive_msg(struct sk_buff *skb, struct nlmsghdr *nlh)
 		len = 0;
 		if (lsmblob_is_set(&audit_sig_lsm)) {
 			err = security_secid_to_secctx(&audit_sig_lsm,
-						       &context);
+						       &context, LSMBLOB_FIRST);
 			if (err)
 				return err;
 		}
@@ -1490,6 +1496,7 @@ static int audit_receive_msg(struct sk_buff *skb, struct nlmsghdr *nlh)
 				 " old-log_passwd=%d new-log_passwd=%d res=%d",
 				 old.enabled, s.enabled, old.log_passwd,
 				 s.log_passwd, !err);
+		audit_log_task_lsms(ab);
 		audit_log_end(ab);
 		break;
 	}
@@ -2068,6 +2075,33 @@ void audit_log_key(struct audit_buffer *ab, char *key)
 		audit_log_format(ab, "(null)");
 }
 
+void audit_log_task_lsms(struct audit_buffer *ab)
+{
+	int i;
+	const char *lsm;
+	struct lsmblob blob;
+	struct lsmcontext context;
+
+	/*
+	 * Don't do anything unless there is more than one LSM
+	 * with a security context to report.
+	 */
+	if (security_lsm_slot_name(1) == NULL)
+		return;
+
+	security_task_getsecid(current, &blob);
+
+	for (i = 0; i < LSMBLOB_ENTRIES; i++) {
+		lsm = security_lsm_slot_name(i);
+		if (lsm == NULL)
+			break;
+		if (security_secid_to_secctx(&blob, &context, i))
+			continue;
+		audit_log_format(ab, " subj_%s=%s", lsm, context.context);
+		security_release_secctx(&context);
+	}
+}
+
 int audit_log_task_context(struct audit_buffer *ab)
 {
 	int error;
@@ -2078,7 +2112,7 @@ int audit_log_task_context(struct audit_buffer *ab)
 	if (!lsmblob_is_set(&blob))
 		return 0;
 
-	error = security_secid_to_secctx(&blob, &context);
+	error = security_secid_to_secctx(&blob, &context, LSMBLOB_FIRST);
 	if (error) {
 		if (error != -EINVAL)
 			goto error_path;
@@ -2185,6 +2219,7 @@ void audit_log_link_denied(const char *operation)
 	audit_log_format(ab, "op=%s", operation);
 	audit_log_task_info(ab);
 	audit_log_format(ab, " res=0");
+	audit_log_task_lsms(ab);
 	audit_log_end(ab);
 }
 
@@ -2235,6 +2270,7 @@ static void audit_log_set_loginuid(kuid_t koldloginuid, kuid_t kloginuid,
 			 oldloginuid, loginuid, tty ? tty_name(tty) : "(none)",
 			 oldsessionid, sessionid, !rc);
 	audit_put_tty(tty);
+	audit_log_task_lsms(ab);
 	audit_log_end(ab);
 }
 
diff --git a/kernel/audit_fsnotify.c b/kernel/audit_fsnotify.c
index 37ae95cfb7f4..3a00583fa7fa 100644
--- a/kernel/audit_fsnotify.c
+++ b/kernel/audit_fsnotify.c
@@ -135,6 +135,7 @@ static void audit_mark_log_rule_change(struct audit_fsnotify_mark *audit_mark, c
 	audit_log_untrustedstring(ab, audit_mark->path);
 	audit_log_key(ab, rule->filterkey);
 	audit_log_format(ab, " list=%d res=1", rule->listnr);
+	audit_log_task_lsms(ab);
 	audit_log_end(ab);
 }
 
diff --git a/kernel/auditfilter.c b/kernel/auditfilter.c
index 8f244c98bb57..508d784413da 100644
--- a/kernel/auditfilter.c
+++ b/kernel/auditfilter.c
@@ -1099,6 +1099,7 @@ static void audit_log_rule_change(char *action, struct audit_krule *rule, int re
 	audit_log_format(ab, " op=%s", action);
 	audit_log_key(ab, rule->filterkey);
 	audit_log_format(ab, " list=%d res=%d", rule->listnr, res);
+	audit_log_task_lsms(ab);
 	audit_log_end(ab);
 }
 
diff --git a/kernel/auditsc.c b/kernel/auditsc.c
index 0478680cd0a8..46d7a58babd2 100644
--- a/kernel/auditsc.c
+++ b/kernel/auditsc.c
@@ -954,7 +954,7 @@ static int audit_log_pid_context(struct audit_context *context, pid_t pid,
 			 from_kuid(&init_user_ns, auid),
 			 from_kuid(&init_user_ns, uid), sessionid);
 	if (lsmblob_is_set(blob)) {
-		if (security_secid_to_secctx(blob, &lsmctx)) {
+		if (security_secid_to_secctx(blob, &lsmctx, LSMBLOB_FIRST)) {
 			audit_log_format(ab, " obj=(none)");
 			rc = 1;
 		} else {
@@ -1198,7 +1198,8 @@ static void show_special(struct audit_context *context, int *call_panic)
 			struct lsmblob blob;
 
 			lsmblob_init(&blob, osid);
-			if (security_secid_to_secctx(&blob, &lsmcxt)) {
+			if (security_secid_to_secctx(&blob, &lsmcxt,
+						     LSMBLOB_FIRST)) {
 				audit_log_format(ab, " osid=%u", osid);
 				*call_panic = 1;
 			} else {
@@ -1351,7 +1352,7 @@ static void audit_log_name(struct audit_context *context, struct audit_names *n,
 		struct lsmcontext lsmctx;
 
 		lsmblob_init(&blob, n->osid);
-		if (security_secid_to_secctx(&blob, &lsmctx)) {
+		if (security_secid_to_secctx(&blob, &lsmctx, LSMBLOB_FIRST)) {
 			audit_log_format(ab, " osid=%u", n->osid);
 			if (call_panic)
 				*call_panic = 2;
@@ -1460,6 +1461,7 @@ static void audit_log_exit(void)
 
 	audit_log_task_info(ab);
 	audit_log_key(ab, context->filterkey);
+	audit_log_task_lsms(ab);
 	audit_log_end(ab);
 
 	for (aux = context->aux; aux; aux = aux->next) {
@@ -2569,6 +2571,7 @@ void audit_core_dumps(long signr)
 		return;
 	audit_log_task(ab);
 	audit_log_format(ab, " sig=%ld res=1", signr);
+	audit_log_task_lsms(ab);
 	audit_log_end(ab);
 }
 
@@ -2595,6 +2598,7 @@ void audit_seccomp(unsigned long syscall, long signr, int code)
 	audit_log_format(ab, " sig=%ld arch=%x syscall=%ld compat=%d ip=0x%lx code=0x%x",
 			 signr, syscall_get_arch(), syscall,
 			 in_compat_syscall(), KSTK_EIP(current), code);
+	audit_log_task_lsms(ab);
 	audit_log_end(ab);
 }
 
diff --git a/net/ipv4/ip_sockglue.c b/net/ipv4/ip_sockglue.c
index 80ae0c5a1301..447fe60af0cd 100644
--- a/net/ipv4/ip_sockglue.c
+++ b/net/ipv4/ip_sockglue.c
@@ -138,7 +138,7 @@ static void ip_cmsg_recv_security(struct msghdr *msg, struct sk_buff *skb)
 	if (err)
 		return;
 
-	err = security_secid_to_secctx(&lb, &context);
+	err = security_secid_to_secctx(&lb, &context, LSMBLOB_DISPLAY);
 	if (err)
 		return;
 
diff --git a/net/netfilter/nf_conntrack_netlink.c b/net/netfilter/nf_conntrack_netlink.c
index 403307ff0fff..c870aebe99a3 100644
--- a/net/netfilter/nf_conntrack_netlink.c
+++ b/net/netfilter/nf_conntrack_netlink.c
@@ -333,7 +333,7 @@ static int ctnetlink_dump_secctx(struct sk_buff *skb, const struct nf_conn *ct)
 	struct lsmcontext context;
 
 	lsmblob_init(&blob, ct->secmark);
-	ret = security_secid_to_secctx(&blob, &context);
+	ret = security_secid_to_secctx(&blob, &context, LSMBLOB_DISPLAY);
 	if (ret)
 		return 0;
 
@@ -621,7 +621,7 @@ static inline int ctnetlink_secctx_size(const struct nf_conn *ct)
 	struct lsmcontext context;
 
 	lsmblob_init(&blob, ct->secmark);
-	ret = security_secid_to_secctx(&blob, &context);
+	ret = security_secid_to_secctx(&blob, &context, LSMBLOB_DISPLAY);
 	if (ret)
 		return 0;
 
diff --git a/net/netfilter/nf_conntrack_standalone.c b/net/netfilter/nf_conntrack_standalone.c
index fcb51ab2bb8b..60dd81eb6f89 100644
--- a/net/netfilter/nf_conntrack_standalone.c
+++ b/net/netfilter/nf_conntrack_standalone.c
@@ -177,7 +177,7 @@ static void ct_show_secctx(struct seq_file *s, const struct nf_conn *ct)
 	struct lsmcontext context;
 
 	lsmblob_init(&blob, ct->secmark);
-	ret = security_secid_to_secctx(&blob, &context);
+	ret = security_secid_to_secctx(&blob, &context, LSMBLOB_DISPLAY);
 	if (ret)
 		return;
 
diff --git a/net/netfilter/nfnetlink_queue.c b/net/netfilter/nfnetlink_queue.c
index 58d5bd7a376e..ad4bb3f9c7dc 100644
--- a/net/netfilter/nfnetlink_queue.c
+++ b/net/netfilter/nfnetlink_queue.c
@@ -318,7 +318,7 @@ static u32 nfqnl_get_sk_secctx(struct sk_buff *skb, struct lsmcontext *context)
 	if (skb->secmark) {
 		/* Any LSM might be looking for the secmark */
 		lsmblob_init(&blob, skb->secmark);
-		security_secid_to_secctx(&blob, context);
+		security_secid_to_secctx(&blob, context, LSMBLOB_DISPLAY);
 	}
 
 	read_unlock_bh(&skb->sk->sk_callback_lock);
diff --git a/net/netlabel/netlabel_unlabeled.c b/net/netlabel/netlabel_unlabeled.c
index 57ede7781c8f..cf34c163af20 100644
--- a/net/netlabel/netlabel_unlabeled.c
+++ b/net/netlabel/netlabel_unlabeled.c
@@ -450,7 +450,8 @@ int netlbl_unlhsh_add(struct net *net,
 unlhsh_add_return:
 	rcu_read_unlock();
 	if (audit_buf != NULL) {
-		if (security_secid_to_secctx(lsmblob, &context) == 0) {
+		if (security_secid_to_secctx(lsmblob, &context,
+					     LSMBLOB_FIRST) == 0) {
 			audit_log_format(audit_buf, " sec_obj=%s",
 					 context.context);
 			security_release_secctx(&context);
@@ -505,7 +506,8 @@ static int netlbl_unlhsh_remove_addr4(struct net *net,
 		if (dev != NULL)
 			dev_put(dev);
 		if (entry != NULL &&
-		    security_secid_to_secctx(&entry->lsmblob, &context) == 0) {
+		    security_secid_to_secctx(&entry->lsmblob, &context,
+					     LSMBLOB_FIRST) == 0) {
 			audit_log_format(audit_buf, " sec_obj=%s",
 					 context.context);
 			security_release_secctx(&context);
@@ -565,7 +567,8 @@ static int netlbl_unlhsh_remove_addr6(struct net *net,
 		if (dev != NULL)
 			dev_put(dev);
 		if (entry != NULL &&
-		    security_secid_to_secctx(&entry->lsmblob, &context) == 0) {
+		    security_secid_to_secctx(&entry->lsmblob, &context,
+					     LSMBLOB_FIRST) == 0) {
 			audit_log_format(audit_buf, " sec_obj=%s",
 					 context.context);
 			security_release_secctx(&context);
@@ -1136,7 +1139,7 @@ static int netlbl_unlabel_staticlist_gen(u32 cmd,
 		lsmb = (struct lsmblob *)&addr6->lsmblob;
 	}
 
-	ret_val = security_secid_to_secctx(lsmb, &context);
+	ret_val = security_secid_to_secctx(lsmb, &context, LSMBLOB_FIRST);
 	if (ret_val != 0)
 		goto list_cb_failure;
 	ret_val = nla_put(cb_arg->skb,
diff --git a/net/netlabel/netlabel_user.c b/net/netlabel/netlabel_user.c
index 2d1307f65250..193200955dbd 100644
--- a/net/netlabel/netlabel_user.c
+++ b/net/netlabel/netlabel_user.c
@@ -114,7 +114,7 @@ struct audit_buffer *netlbl_audit_start_common(int type,
 
 	lsmblob_init(&blob, audit_info->secid);
 	if (audit_info->secid != 0 &&
-	    security_secid_to_secctx(&blob, &context) == 0) {
+	    security_secid_to_secctx(&blob, &context, LSMBLOB_FIRST) == 0) {
 		audit_log_format(audit_buf, " subj=%s", context.context);
 		security_release_secctx(&context);
 	}
diff --git a/net/xfrm/xfrm_policy.c b/net/xfrm/xfrm_policy.c
index 8d1a898d0ba5..5a67b2e5d941 100644
--- a/net/xfrm/xfrm_policy.c
+++ b/net/xfrm/xfrm_policy.c
@@ -3996,6 +3996,7 @@ void xfrm_audit_policy_add(struct xfrm_policy *xp, int result, bool task_valid)
 	xfrm_audit_helper_usrinfo(task_valid, audit_buf);
 	audit_log_format(audit_buf, " res=%u", result);
 	xfrm_audit_common_policyinfo(xp, audit_buf);
+	audit_log_task_lsms(audit_buf);
 	audit_log_end(audit_buf);
 }
 EXPORT_SYMBOL_GPL(xfrm_audit_policy_add);
@@ -4011,6 +4012,7 @@ void xfrm_audit_policy_delete(struct xfrm_policy *xp, int result,
 	xfrm_audit_helper_usrinfo(task_valid, audit_buf);
 	audit_log_format(audit_buf, " res=%u", result);
 	xfrm_audit_common_policyinfo(xp, audit_buf);
+	audit_log_task_lsms(audit_buf);
 	audit_log_end(audit_buf);
 }
 EXPORT_SYMBOL_GPL(xfrm_audit_policy_delete);
diff --git a/net/xfrm/xfrm_state.c b/net/xfrm/xfrm_state.c
index 1bb971f46fc6..d6944123ca0e 100644
--- a/net/xfrm/xfrm_state.c
+++ b/net/xfrm/xfrm_state.c
@@ -2456,6 +2456,7 @@ void xfrm_audit_state_add(struct xfrm_state *x, int result, bool task_valid)
 	xfrm_audit_helper_usrinfo(task_valid, audit_buf);
 	xfrm_audit_helper_sainfo(x, audit_buf);
 	audit_log_format(audit_buf, " res=%u", result);
+	audit_log_task_lsms(audit_buf);
 	audit_log_end(audit_buf);
 }
 EXPORT_SYMBOL_GPL(xfrm_audit_state_add);
@@ -2470,6 +2471,7 @@ void xfrm_audit_state_delete(struct xfrm_state *x, int result, bool task_valid)
 	xfrm_audit_helper_usrinfo(task_valid, audit_buf);
 	xfrm_audit_helper_sainfo(x, audit_buf);
 	audit_log_format(audit_buf, " res=%u", result);
+	audit_log_task_lsms(audit_buf);
 	audit_log_end(audit_buf);
 }
 EXPORT_SYMBOL_GPL(xfrm_audit_state_delete);
diff --git a/security/integrity/ima/ima_api.c b/security/integrity/ima/ima_api.c
index 94b2a4840d81..1e96afcb2d8d 100644
--- a/security/integrity/ima/ima_api.c
+++ b/security/integrity/ima/ima_api.c
@@ -337,6 +337,7 @@ void ima_audit_measurement(struct integrity_iint_cache *iint,
 	audit_log_format(ab, " hash=\"%s:%s\"", algo_name, hash);
 
 	audit_log_task_info(ab);
+	audit_log_task_lsms(ab);
 	audit_log_end(ab);
 
 	iint->flags |= IMA_AUDITED;
diff --git a/security/integrity/integrity_audit.c b/security/integrity/integrity_audit.c
index 82c98f7d217e..aca1c6bdcccd 100644
--- a/security/integrity/integrity_audit.c
+++ b/security/integrity/integrity_audit.c
@@ -57,5 +57,6 @@ void integrity_audit_msg(int audit_msgno, struct inode *inode,
 		audit_log_format(ab, " ino=%lu", inode->i_ino);
 	}
 	audit_log_format(ab, " res=%d", !result);
+	audit_log_task_lsms(ab);
 	audit_log_end(ab);
 }
diff --git a/security/security.c b/security/security.c
index ebbe7fac48d8..4e878907f12b 100644
--- a/security/security.c
+++ b/security/security.c
@@ -426,7 +426,31 @@ static int lsm_append(const char *new, char **result)
  * Pointers to the LSM id structures for local use.
  */
 static int lsm_slot __lsm_ro_after_init;
-static struct lsm_id *lsm_slotlist[LSMBLOB_ENTRIES];
+static struct lsm_id *lsm_slotlist[LSMBLOB_ENTRIES] __lsm_ro_after_init;
+
+/**
+ * security_lsm_slot_name - Get the name of the security module in a slot
+ * @slot: index into the "display" slot list.
+ *
+ * Provide the name of the security module associated with
+ * a display slot.
+ *
+ * If @slot is LSMBLOB_INVALID return the value
+ * for slot 0 if it has been set, otherwise NULL.
+ *
+ * Returns a pointer to the name string or NULL.
+ */
+const char *security_lsm_slot_name(int slot)
+{
+	if (slot == LSMBLOB_INVALID)
+		slot = 0;
+	else if (slot >= LSMBLOB_ENTRIES || slot < 0)
+		return NULL;
+
+	if (lsm_slotlist[slot] == NULL)
+		return NULL;
+	return lsm_slotlist[slot]->lsm;
+}
 
 /**
  * security_add_hooks - Add a modules hooks to the hook lists.
@@ -2100,13 +2124,32 @@ int security_ismaclabel(const char *name)
 }
 EXPORT_SYMBOL(security_ismaclabel);
 
-int security_secid_to_secctx(struct lsmblob *blob, struct lsmcontext *cp)
+int security_secid_to_secctx(struct lsmblob *blob, struct lsmcontext *cp,
+			     int display)
 {
 	struct security_hook_list *hp;
-	int display = lsm_task_display(current);
 
 	memset(cp, 0, sizeof(*cp));
 
+	/*
+	 * display either is the slot number use for formatting
+	 * or an instruction on which relative slot to use.
+	 */
+	if (display == LSMBLOB_DISPLAY)
+		display = lsm_task_display(current);
+	else if (display == LSMBLOB_FIRST)
+		display = LSMBLOB_INVALID;
+	else if (display < 0) {
+		WARN_ONCE(true,
+			"LSM: security_secid_to_secctx unknown display\n");
+		display = LSMBLOB_INVALID;
+	} else if (display >= lsm_slot) {
+		WARN_ONCE(true,
+			"LSM: security_secid_to_secctx invalid display\n");
+		display = LSMBLOB_INVALID;
+	}
+
+
 	hlist_for_each_entry(hp, &security_hook_heads.secid_to_secctx, list) {
 		if (WARN_ON(hp->lsmid->slot < 0 || hp->lsmid->slot >= lsm_slot))
 			continue;
@@ -2117,7 +2160,7 @@ int security_secid_to_secctx(struct lsmblob *blob, struct lsmcontext *cp)
 					&cp->context, &cp->len);
 		}
 	}
-	return 0;
+	return -EOPNOTSUPP;
 }
 EXPORT_SYMBOL(security_secid_to_secctx);
 
-- 
2.20.1

