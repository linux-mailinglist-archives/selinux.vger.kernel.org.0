Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DAEF43244E
	for <lists+selinux@lfdr.de>; Sun,  2 Jun 2019 18:54:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727085AbfFBQyN (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Sun, 2 Jun 2019 12:54:13 -0400
Received: from sonic316-12.consmr.mail.gq1.yahoo.com ([98.137.69.36]:43275
        "EHLO sonic316-12.consmr.mail.gq1.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727093AbfFBQyM (ORCPT
        <rfc822;selinux@vger.kernel.org>); Sun, 2 Jun 2019 12:54:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1559494451; bh=20Rb5jYWo49Bap1qMEB12Igt97pOzw5rUDuKwPsIKtU=; h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject; b=qPUhE2BzQpqCSzkp+5SsT3ARiKAiKTvcW7RKldDNFeC+SVd3HCVACY9Wx32s1osHleVC8xDhy6ye43YWKSyyyFJ9yY7WfimA5ByaaI2ukW85w2U+NOKpIvVzymyoednAj2wBHyzYV3qg+YH7QSC54MEjYfnXHOKTffyu8AalBrP0Q0KzM0Tbzf3zhqGUDZBnOuj6od8E4+QOaXhV2C1tncRSpSJw4u/RsjsC1/Fyxg346qu0qXXkmorWhSaPL4LAS+f/GogWl2kWn9y0XO11eb1vMsVXefD4fvyhLiF950Pz6tZ0tjJ5jQa+Oem4w/r8e5S9+me7oCVeMnyxE29R/w==
X-YMail-OSG: DI7t6AcVM1kuNPwYmEheRnJX6l5vTUAINEyjqVtlT.g5eEAnVumcUn2At_3RzCT
 OYfLvmon3lCMXtv0jWxiLlRajHB.p1mcC9IwztHbrbkK6OUaK9zSbi7lKy6AB3.UD6RVGQhJHlBg
 TtTmsH7e.Q0YAVSYmgwf_pgNcVU6BKaz1TNOYfhmKrqKfdhWjUOalPWas8iL7XKvCYta3yymUTai
 ez_3QjP73eHz_mhLW17fN2VWdzJ70ZARmBjlfdRDLNzwzew8FikIU.eBQi1Bgbm0Y._6A29ceBNF
 KKhsrMBD41KfBtkXIU13k0ubWnDxj6YSO24gw_cVsJLIReXo_ENQX5jHOBHRSFDJnzZwGyBKCNIe
 vA_UokYgIaqtQH6V3DL5vclPrLFDqAjQDNQYmTpxSXguh_tbW15eNJ2krWPVzyTSgGceH2aL4x8w
 Oxi9Hr7VkpZ0X253Br8uRrqGKu38EzH8zcYBpOJrt9hXAw0yWZaUG3P3ARqvN9SMmeeaGTsrR6tn
 B0WK_XW4HBR2Qxx82pT3cZjqc1MRJFqM1NxSDiesjs6zlLsycG1tVGazCw94XN.93Hqs24T1e5S6
 Qx_ZEGJNxwUBELYlD7UKEH0q6pFICl8MvP2VxA9AZcfgHzf3w6VeYhALXFgXsMQyGr0LuCDI9ryj
 XNw.61_sIqEVKjoeVh0RYN9O.gkIdm1hQpef4rz2XSTx6xrboHuam2enhe_GStxt_ZG1VZeegvNn
 wcn9ulh7C.wS_6bqwYtY7AO3dKfuVOBaZJdrjrKgylTMM1gLnrzqbH86HqZaekqGGQdqrL4jc1Fj
 ebY9eI3HzoVKZLcoj9odfadD_27Z.rtnITnx1Sb8oXZjedlof92ZBfX6ZUg3LZi9cz7bvfVneeg9
 jMLxiN.6IIyDowTjQw2TfpH2FMY_dT5C2wxCOm5EeKMpGKlcqy1g3RVuPltHBwobWmdrhooZ75Z1
 oVhHRQAPW8stedj94y8YmFxUN89DgFNBpxcz0uyzpHir3fkPsxKaAQpKZeSJKqYZHCDm1PPOTDIy
 nZqfL.4syztHeZyMwFWIkp7SMIDidiB_UxL4gTi0CwTF.nGqsbTZmpAzlPiAKu4duBy8hAcqQEUb
 7FLLlEuxiPAhz6S_XnRxpy814bf8XIyywe0f7D1Yy1Y8jnlyafIpt7aeu3yISJtHgEQbyOpdOdGp
 YlSZqPFHopegZADxI7Bc.9XgiEg8DP62.1p1.AV_gZ2.0u7yFPdFFXGXBAnY10lNbfLyEk_nc0Zd
 fl4jGN.qs5NvB3lgDJcjESADB9ZVhMAlMH8DOjkYcSo7Z3jPY.h8-
Received: from sonic.gate.mail.ne1.yahoo.com by sonic316.consmr.mail.gq1.yahoo.com with HTTP; Sun, 2 Jun 2019 16:54:11 +0000
Received: from c-73-223-4-185.hsd1.ca.comcast.net (EHLO localhost.net) ([73.223.4.185])
          by smtp430.mail.gq1.yahoo.com (Oath Hermes SMTP Server) with ESMTPA ID e9ca3210f73b95a606016904e284b22a;
          Sun, 02 Jun 2019 16:54:07 +0000 (UTC)
From:   Casey Schaufler <casey@schaufler-ca.com>
To:     casey.schaufler@intel.com, jmorris@namei.org,
        linux-security-module@vger.kernel.org, selinux@vger.kernel.org
Cc:     casey@schaufler-ca.com, keescook@chromium.org,
        john.johansen@canonical.com, penguin-kernel@i-love.sakura.ne.jp,
        paul@paul-moore.com, sds@tycho.nsa.gov
Subject: [PATCH 48/58] LSM: Use lsm_context in security_secid_to_secctx
Date:   Sun,  2 Jun 2019 09:50:51 -0700
Message-Id: <20190602165101.25079-49-casey@schaufler-ca.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190602165101.25079-1-casey@schaufler-ca.com>
References: <20190602165101.25079-1-casey@schaufler-ca.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Convert security_secid_to_secctx to use the lsm_context structure
instead of a context/secid pair. There is some scaffolding involved
that will be removed when the related data is updated.

Add a flag for lsm_export to indicate that the caller of
security_secid_to_secctx() is only interested in the length
of the context.

Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
---
 drivers/android/binder.c                |  2 +-
 include/linux/security.h                | 13 +++++++------
 include/net/scm.h                       |  2 +-
 kernel/audit.c                          |  5 ++---
 kernel/auditsc.c                        | 10 +++++-----
 net/ipv4/ip_sockglue.c                  |  2 +-
 net/netfilter/nf_conntrack_netlink.c    | 11 ++++++-----
 net/netfilter/nf_conntrack_standalone.c |  2 +-
 net/netfilter/nfnetlink_queue.c         |  2 +-
 net/netlabel/netlabel_unlabeled.c       | 12 ++++--------
 net/netlabel/netlabel_user.c            |  3 +--
 security/apparmor/secid.c               |  3 +--
 security/security.c                     | 13 ++-----------
 security/selinux/hooks.c                |  3 +++
 security/smack/smack_lsm.c              |  2 +-
 15 files changed, 37 insertions(+), 48 deletions(-)

diff --git a/drivers/android/binder.c b/drivers/android/binder.c
index c2cfef13257c..58033c003cc2 100644
--- a/drivers/android/binder.c
+++ b/drivers/android/binder.c
@@ -3121,7 +3121,7 @@ static void binder_transaction(struct binder_proc *proc,
 		struct lsm_export le;
 
 		security_task_getsecid(proc->tsk, &le);
-		ret = security_secid_to_secctx(&le, &lc.context, &lc.len);
+		ret = security_secid_to_secctx(&le, &lc);
 		if (ret) {
 			return_error = BR_FAILED_REPLY;
 			return_error_param = ret;
diff --git a/include/linux/security.h b/include/linux/security.h
index 57ce9b824eef..9a9de2bafa55 100644
--- a/include/linux/security.h
+++ b/include/linux/security.h
@@ -83,10 +83,11 @@ struct lsm_export {
 	u32	apparmor;
 	u32	flags;
 };
-#define LSM_EXPORT_NONE		0x00
-#define LSM_EXPORT_SELINUX	0x01
-#define LSM_EXPORT_SMACK	0x02
-#define LSM_EXPORT_APPARMOR	0x04
+#define LSM_EXPORT_NONE		0x00000000
+#define LSM_EXPORT_SELINUX	0x00000001
+#define LSM_EXPORT_SMACK	0x00000002
+#define LSM_EXPORT_APPARMOR	0x00000004
+#define LSM_EXPORT_LENGTH	0x80000000	/* Only the length required */
 
 static inline void lsm_export_init(struct lsm_export *l)
 {
@@ -431,7 +432,7 @@ int security_setprocattr(const char *lsm, const char *name, void *value,
 			 size_t size);
 int security_netlink_send(struct sock *sk, struct sk_buff *skb);
 int security_ismaclabel(const char *name);
-int security_secid_to_secctx(struct lsm_export *l, char **secdata, u32 *seclen);
+int security_secid_to_secctx(struct lsm_export *l, struct lsm_context *cp);
 int security_secctx_to_secid(struct lsm_context *cp, struct lsm_export *l);
 void security_release_secctx(struct lsm_context *cp);
 
@@ -1211,7 +1212,7 @@ static inline int security_ismaclabel(const char *name)
 }
 
 static inline int security_secid_to_secctx(struct lsm_export *l,
-					   char **secdata, u32 *seclen)
+					   struct lsm_seccontext *cp)
 {
 	return -EOPNOTSUPP;
 }
diff --git a/include/net/scm.h b/include/net/scm.h
index 7e242ebdd258..b25ca3b6a514 100644
--- a/include/net/scm.h
+++ b/include/net/scm.h
@@ -96,7 +96,7 @@ static inline void scm_passec(struct socket *sock, struct msghdr *msg, struct sc
 	int err;
 
 	if (test_bit(SOCK_PASSSEC, &sock->flags)) {
-		err = security_secid_to_secctx(&scm->le, &lc.context, &lc.len);
+		err = security_secid_to_secctx(&scm->le, &lc);
 
 		if (!err) {
 			put_cmsg(msg, SOL_SOCKET, SCM_SECURITY,
diff --git a/kernel/audit.c b/kernel/audit.c
index 269c76fefe40..203e5b14bea4 100644
--- a/kernel/audit.c
+++ b/kernel/audit.c
@@ -1428,8 +1428,7 @@ static int audit_receive_msg(struct sk_buff *skb, struct nlmsghdr *nlh)
 	}
 	case AUDIT_SIGNAL_INFO:
 		if (lsm_export_any(&audit_sig_lsm)) {
-			err = security_secid_to_secctx(&audit_sig_lsm,
-						       &lc.context, &lc.len);
+			err = security_secid_to_secctx(&audit_sig_lsm, &lc);
 			if (err)
 				return err;
 		}
@@ -2076,7 +2075,7 @@ int audit_log_task_context(struct audit_buffer *ab)
 	if (!lsm_export_any(&le))
 		return 0;
 
-	error = security_secid_to_secctx(&le, &lc.context, &lc.len);
+	error = security_secid_to_secctx(&le, &lc);
 	if (error) {
 		if (error != -EINVAL)
 			goto error_path;
diff --git a/kernel/auditsc.c b/kernel/auditsc.c
index 4dab81c7aca0..ceefd17467f9 100644
--- a/kernel/auditsc.c
+++ b/kernel/auditsc.c
@@ -938,7 +938,7 @@ static int audit_log_pid_context(struct audit_context *context, pid_t pid,
 				 unsigned int sessionid,
 				 struct lsm_export *l, char *comm)
 {
-	struct lsm_context lc = { .context = NULL, };
+	struct lsm_context lc;
 	struct audit_buffer *ab;
 	int rc = 0;
 
@@ -950,7 +950,7 @@ static int audit_log_pid_context(struct audit_context *context, pid_t pid,
 			 from_kuid(&init_user_ns, auid),
 			 from_kuid(&init_user_ns, uid), sessionid);
 	if (lsm_export_any(l)) {
-		if (security_secid_to_secctx(l, &lc.context, &lc.len)) {
+		if (security_secid_to_secctx(l, &lc)) {
 			audit_log_format(ab, " obj=(none)");
 			rc = 1;
 		} else {
@@ -1190,8 +1190,8 @@ static void show_special(struct audit_context *context, int *call_panic)
 				 from_kgid(&init_user_ns, context->ipc.gid),
 				 context->ipc.mode);
 		if (lsm_export_any(l)) {
-			struct lsm_context lc = { .context = NULL, };
-			if (security_secid_to_secctx(l, &lc.context, &lc.len)) {
+			struct lsm_context lc;
+			if (security_secid_to_secctx(l, &lc)) {
 				audit_log_format(ab, " osid=(unknown)");
 				*call_panic = 1;
 			} else {
@@ -1342,7 +1342,7 @@ static void audit_log_name(struct audit_context *context, struct audit_names *n,
 	if (lsm_export_any(&n->olsm)) {
 		struct lsm_context lc;
 
-		if (security_secid_to_secctx(&n->olsm, &lc.context, &lc.len)) {
+		if (security_secid_to_secctx(&n->olsm, &lc)) {
 			audit_log_format(ab, " osid=(unknown)");
 			if (call_panic)
 				*call_panic = 2;
diff --git a/net/ipv4/ip_sockglue.c b/net/ipv4/ip_sockglue.c
index 18a7fab8b2d3..56035b53952d 100644
--- a/net/ipv4/ip_sockglue.c
+++ b/net/ipv4/ip_sockglue.c
@@ -138,7 +138,7 @@ static void ip_cmsg_recv_security(struct msghdr *msg, struct sk_buff *skb)
 	if (err)
 		return;
 
-	err = security_secid_to_secctx(&le, &lc.context, &lc.len);
+	err = security_secid_to_secctx(&le, &lc);
 	if (err)
 		return;
 
diff --git a/net/netfilter/nf_conntrack_netlink.c b/net/netfilter/nf_conntrack_netlink.c
index 49bce1b085ce..ea83909af6db 100644
--- a/net/netfilter/nf_conntrack_netlink.c
+++ b/net/netfilter/nf_conntrack_netlink.c
@@ -337,7 +337,7 @@ static int ctnetlink_dump_secctx(struct sk_buff *skb, const struct nf_conn *ct)
 	le.selinux = ct->secmark;
 	le.smack = ct->secmark;
 
-	ret = security_secid_to_secctx(&le, &lc.context, &lc.len);
+	ret = security_secid_to_secctx(&le, &lc);
 	if (ret)
 		return 0;
 
@@ -620,20 +620,21 @@ static inline size_t ctnetlink_acct_size(const struct nf_conn *ct)
 static inline int ctnetlink_secctx_size(const struct nf_conn *ct)
 {
 #ifdef CONFIG_NF_CONNTRACK_SECMARK
-	int len, ret;
+	int ret;
 	struct lsm_export le;
+	struct lsm_context lc;
 
 	lsm_export_init(&le);
-	le.flags = LSM_EXPORT_SELINUX | LSM_EXPORT_SMACK;
+	le.flags = LSM_EXPORT_SELINUX | LSM_EXPORT_SMACK | LSM_EXPORT_LENGTH;
 	le.selinux = ct->secmark;
 	le.smack = ct->secmark;
 
-	ret = security_secid_to_secctx(&le, NULL, &len);
+	ret = security_secid_to_secctx(&le, &lc);
 	if (ret)
 		return 0;
 
 	return nla_total_size(0) /* CTA_SECCTX */
-	       + nla_total_size(sizeof(char) * len); /* CTA_SECCTX_NAME */
+	       + nla_total_size(sizeof(char) * lc.len); /* CTA_SECCTX_NAME */
 #else
 	return 0;
 #endif
diff --git a/net/netfilter/nf_conntrack_standalone.c b/net/netfilter/nf_conntrack_standalone.c
index 97d16a51504b..797abf443a34 100644
--- a/net/netfilter/nf_conntrack_standalone.c
+++ b/net/netfilter/nf_conntrack_standalone.c
@@ -182,7 +182,7 @@ static void ct_show_secctx(struct seq_file *s, const struct nf_conn *ct)
 	le.selinux = ct->secmark;
 	le.smack = ct->secmark;
 
-	ret = security_secid_to_secctx(&le, &lc.context, &lc.len);
+	ret = security_secid_to_secctx(&le, &lc);
 	if (ret)
 		return;
 
diff --git a/net/netfilter/nfnetlink_queue.c b/net/netfilter/nfnetlink_queue.c
index b70871693368..4a3d4b52caef 100644
--- a/net/netfilter/nfnetlink_queue.c
+++ b/net/netfilter/nfnetlink_queue.c
@@ -322,7 +322,7 @@ static u32 nfqnl_get_sk_secctx(struct sk_buff *skb, char **secdata)
 		le.flags = LSM_EXPORT_SELINUX | LSM_EXPORT_SMACK;
 		le.selinux = skb->secmark;
 		le.smack = skb->secmark;
-		security_secid_to_secctx(&le, &lc.context, &lc.len);
+		security_secid_to_secctx(&le, &lc);
 		*secdata = lc.context;
 	}
 
diff --git a/net/netlabel/netlabel_unlabeled.c b/net/netlabel/netlabel_unlabeled.c
index 4c4a8f6df261..336d315ee8eb 100644
--- a/net/netlabel/netlabel_unlabeled.c
+++ b/net/netlabel/netlabel_unlabeled.c
@@ -450,7 +450,7 @@ int netlbl_unlhsh_add(struct net *net,
 	rcu_read_unlock();
 	if (audit_buf != NULL) {
 		struct lsm_context lc;
-		if (security_secid_to_secctx(l, &lc.context, &lc.len) == 0) {
+		if (security_secid_to_secctx(l, &lc) == 0) {
 			audit_log_format(audit_buf, " sec_obj=%s", lc.context);
 			security_release_secctx(&lc);
 		}
@@ -504,8 +504,7 @@ static int netlbl_unlhsh_remove_addr4(struct net *net,
 		if (dev != NULL)
 			dev_put(dev);
 		if (entry != NULL &&
-		    security_secid_to_secctx(&entry->le,
-					     &lc.context, &lc.len) == 0) {
+		    security_secid_to_secctx(&entry->le, &lc) == 0) {
 			audit_log_format(audit_buf, " sec_obj=%s", lc.context);
 			security_release_secctx(&lc);
 		}
@@ -544,8 +543,6 @@ static int netlbl_unlhsh_remove_addr6(struct net *net,
 	struct netlbl_unlhsh_addr6 *entry;
 	struct audit_buffer *audit_buf;
 	struct net_device *dev;
-	char *secctx;
-	u32 secctx_len;
 
 	spin_lock(&netlbl_unlhsh_lock);
 	list_entry = netlbl_af6list_remove(addr, mask, &iface->addr6_list);
@@ -566,8 +563,7 @@ static int netlbl_unlhsh_remove_addr6(struct net *net,
 		if (dev != NULL)
 			dev_put(dev);
 		if (entry != NULL &&
-		    security_secid_to_secctx(&entry->le,
-					     &lc.context, &lc.len) == 0) {
+		    security_secid_to_secctx(&entry->le, &lc) == 0) {
 			audit_log_format(audit_buf, " sec_obj=%s", lc.context);
 			security_release_secctx(&lc);
 		}
@@ -1137,7 +1133,7 @@ static int netlbl_unlabel_staticlist_gen(u32 cmd,
 		lep = (struct lsm_export *)&addr6->le;
 	}
 
-	ret_val = security_secid_to_secctx(lep, &lc.context, &lc.len);
+	ret_val = security_secid_to_secctx(lep, &lc);
 	if (ret_val != 0)
 		goto list_cb_failure;
 	ret_val = nla_put(cb_arg->skb,
diff --git a/net/netlabel/netlabel_user.c b/net/netlabel/netlabel_user.c
index 0418f0935199..11ea98525c4e 100644
--- a/net/netlabel/netlabel_user.c
+++ b/net/netlabel/netlabel_user.c
@@ -112,8 +112,7 @@ struct audit_buffer *netlbl_audit_start_common(int type,
 			 audit_info->sessionid);
 
 	if (lsm_export_any(&audit_info->le) &&
-	    security_secid_to_secctx(&audit_info->le, &lc.context,
-				     &lc.len) == 0) {
+	    security_secid_to_secctx(&audit_info->le, &lc) == 0) {
 		audit_log_format(audit_buf, " subj=%s", lc.context);
 		security_release_secctx(&lc);
 	}
diff --git a/security/apparmor/secid.c b/security/apparmor/secid.c
index 46c8b9a67ac7..9dc17903a936 100644
--- a/security/apparmor/secid.c
+++ b/security/apparmor/secid.c
@@ -92,8 +92,7 @@ int apparmor_secid_to_secctx(struct lsm_export *l, struct lsm_context *cp)
 	if (!label)
 		return -EINVAL;
 
-	/* scaffolding check - Casey */
-	if (cp)
+	if (!(l->flags & LSM_EXPORT_LENGTH))
 		len = aa_label_asxprint(&cp->context, root_ns, label,
 					FLAG_SHOW_MODE | FLAG_VIEW_SUBNS |
 					FLAG_HIDDEN_UNCONFINED | FLAG_ABS_ROOT,
diff --git a/security/security.c b/security/security.c
index 3da7302d20ec..6588172b3ec8 100644
--- a/security/security.c
+++ b/security/security.c
@@ -1972,18 +1972,9 @@ int security_ismaclabel(const char *name)
 }
 EXPORT_SYMBOL(security_ismaclabel);
 
-int security_secid_to_secctx(struct lsm_export *l, char **secdata, u32 *seclen)
+int security_secid_to_secctx(struct lsm_export *l, struct lsm_context *cp)
 {
-	struct lsm_context lc = { .context = NULL, .len = 0, };
-	int rc;
-
-	rc = call_one_int_hook(secid_to_secctx, -EOPNOTSUPP, l, &lc);
-	if (secdata)
-		*secdata = lc.context;
-	else
-		security_release_secctx(&lc);
-	*seclen = lc.len;
-	return rc;
+	return call_one_int_hook(secid_to_secctx, -EOPNOTSUPP, l, cp);
 }
 EXPORT_SYMBOL(security_secid_to_secctx);
 
diff --git a/security/selinux/hooks.c b/security/selinux/hooks.c
index 332296f69f76..7bf73493d10d 100644
--- a/security/selinux/hooks.c
+++ b/security/selinux/hooks.c
@@ -6306,6 +6306,9 @@ static int selinux_secid_to_secctx(struct lsm_export *l, struct lsm_context *cp)
 	u32 secid;
 
 	selinux_import_secid(l, &secid);
+	if (l->flags & LSM_EXPORT_LENGTH)
+		return security_sid_to_context(&selinux_state, secid,
+					       NULL, &cp->len);
 	return security_sid_to_context(&selinux_state, secid,
 				       &cp->context, &cp->len);
 }
diff --git a/security/smack/smack_lsm.c b/security/smack/smack_lsm.c
index cf27905ccaa5..1b5b3e421bff 100644
--- a/security/smack/smack_lsm.c
+++ b/security/smack/smack_lsm.c
@@ -4442,7 +4442,7 @@ static int smack_secid_to_secctx(struct lsm_export *l, struct lsm_context *cp)
 	smack_import_secid(l, &secid);
 	skp = smack_from_secid(secid);
 
-	cp->context = skp->smk_known;
+	cp->context = (l->flags & LSM_EXPORT_LENGTH) ? NULL : skp->smk_known;
 	cp->len = strlen(skp->smk_known);
 	return 0;
 }
-- 
2.19.1

