Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7393119FF9F
	for <lists+selinux@lfdr.de>; Mon,  6 Apr 2020 22:56:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726310AbgDFU4N (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Mon, 6 Apr 2020 16:56:13 -0400
Received: from sonic306-27.consmr.mail.ne1.yahoo.com ([66.163.189.89]:42038
        "EHLO sonic306-27.consmr.mail.ne1.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725957AbgDFU4N (ORCPT
        <rfc822;selinux@vger.kernel.org>); Mon, 6 Apr 2020 16:56:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1586206570; bh=+mszYM8Qpy56DVqznS8iAJ19XtV2RoEB/jAwgml/Ym8=; h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject; b=mlGgiaMa+1Gn+teHTgmjmVvNz+Fmo/eaYXr97Cte5guv10LguP2lhE402BARjOXZvqmJq+huUU2e+W9AhG0NDqrbme6Xn83BC2kjTJY5SUulAMMFAY/sfSMa8AU2yUuF7Ohl4GlN+geUqBpHmmoP7FOqpKG9XtMmAXiMB0d76+VRWbodncHpU8uvZDtYwBcUDusA+GfEYXIdy2wum5uVrwF4j51QABrDHFuy94E3GGqhFqe0H7gjUQC8SWDBV7BWskLr9bKu8lPnBY2uHpA8xU5GADn3UjX3PLwoa9rWIWssmk2RR5fwMcGRToh3nm9pO69q/lZlNMbGgjDGMQynZA==
X-YMail-OSG: x9bYko8VM1nuMiEEgboWlEN.4y7AtDAnXY34Uuo7FlxwKg3mTvY.wYXvOw4z4Yj
 SPEb4x6_hrqD4qm1jtZV_VMlXnrWK1O8RnDplaWqnFkWb7ftFn2g9ryaDvArQ0r9iZoGLQT0EvVs
 0GF4GJsHAnTUk.i6BQiG.QiYxDhOuUoKZW4XG7khV9HzSPxB3P0QcR70BordkGcmywwosK52jpqs
 9t0UY8y50CQQEQwk6c983YY_MRDL6qCbQ9_IaH25JzyeprFZzL_brNe9vsupR0JLXMIXAwoI3GBe
 4fMT5STYLV5bsd2n316jpIttIUNq.XOE2Tc3y7bPQ5cKFyog0a94ftE8joHrFnHjOnotwVS7OC7M
 di6CYJKLVm0OMzX1ISUjgNJNAOPAb4CBVR9FbtyG.fqL3Ui2Y76g7V_3Vi1kKqM_oxykrIodWh.A
 7uMZ6LBhonML3M3z5tl1YCwmxJ0mvRyOJ4TVan9m47BGWoIntW08BxcASoI9UBOEfwqJes_jYgNe
 qfF0_FsRluagngM9M7VkhKIjiHzHpRgi3wWPithcu5eSCYRJzJ6W8YMCaGauXoouFcXXwJ509BTd
 HUQ.dWvyKoHcyzYCFS2imQepLkIodYKT.sh4enaHBi4jkwXSy7s0Jyv7gd8wc57IgXZtqap8Ug5M
 XzDs1TqElOX2JkKu5GhQ.qsioghs2JxUGv5YfEVvUDf9sYCTDgdcKpDe_EXWi.3ayGR37qQJZ2Ea
 iyIHbdLmeMzpgnblfKlxnH8K56lTCVCp.Gg6sXATLOCKq.sx1Ze89lrY853q5Ae_Vb80DL2E96kr
 dPwAtbNZUiB1uA_oZnT_T9YJii6g2BU_njRQxgOTXE120J39cAFXyn9XPlHeeES1sciBUpYdIU3A
 FMZSbDclolmJPylGaoNwfqGe3mXPd.ax9PQf0HXIxrYHD_QgAHDarFYlX07f_e2HQ.8mvkcVXIGL
 2rdk1hrPmKqZDlmrRd1RES_JWzUFGY1NmqqnVUVYBnOPxH6hxXPsoSeBwoqlGMP3gTCaLqawSAiK
 UOTcGT57cQUFYbTw4hl5AvIWldDISqItvUgGq7C55QsF_2OlE1cmeCYmYr0lyM9Qj1T0pMYukW4Z
 gnJbR2rCETwz48ENbpTd.VQhqIzKm4Qs3VvTHVNQN1Cbw_ucBLv23Ryq1nLIxhelPpM3mVijtO9b
 POsTo5Czl2naTX11hdcclqRr9c6hiySSJBBFDrlYFHj_CxNchGyEvHckO3TAYS5bvBWwT3JARoOS
 HkOn50Rt9h_Unek3zMpdOrN.SwkFJgYVXNICqdCxWo4mHtqlpIjL.CdQVrtrA79Rg9JHp3eMKRRY
 8kOIQh_Q5p_jIAQ8nwHFzZh8CGhEq_a3Ov320wSOW2tXtrr_vlApNAujB1LBWuQBVlHd08iwKTMv
 SNn7TrA5t0mm.ci2LL4bEuCwzQZVkOy1ILpiYCniz_2aKARHGVUy1sPIpJScZ7hUPWthbYG4-
Received: from sonic.gate.mail.ne1.yahoo.com by sonic306.consmr.mail.ne1.yahoo.com with HTTP; Mon, 6 Apr 2020 20:56:10 +0000
Received: by smtp423.mail.bf1.yahoo.com (Oath Hermes SMTP Server) with ESMTPA ID ebe40375a6ff55170b5c44f03245fa57;
          Mon, 06 Apr 2020 20:56:08 +0000 (UTC)
From:   Casey Schaufler <casey@schaufler-ca.com>
To:     casey.schaufler@intel.com, jmorris@namei.org,
        linux-security-module@vger.kernel.org, selinux@vger.kernel.org
Cc:     casey@schaufler-ca.com, keescook@chromium.org,
        john.johansen@canonical.com, penguin-kernel@i-love.sakura.ne.jp,
        paul@paul-moore.com, sds@tycho.nsa.gov
Subject: [PATCH v16 06/23] Use lsmblob in security_secctx_to_secid
Date:   Mon,  6 Apr 2020 13:54:52 -0700
Message-Id: <20200406205509.42473-7-casey@schaufler-ca.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200406205509.42473-1-casey@schaufler-ca.com>
References: <20200406205509.42473-1-casey@schaufler-ca.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Change security_secctx_to_secid() to fill in a lsmblob instead
of a u32 secid. Multiple LSMs may be able to interpret the
string, and this allows for setting whichever secid is
appropriate. Change security_secmark_relabel_packet() to use a
lsmblob instead of a u32 secid. In some other cases there is
scaffolding where interfaces have yet to be converted.

Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
---
 include/linux/security.h          | 30 +++++++++++++++++++++++----
 include/net/scm.h                 |  7 +++++--
 kernel/cred.c                     |  4 +---
 net/ipv4/ip_sockglue.c            |  6 ++++--
 net/netfilter/nft_meta.c          | 18 +++++++++-------
 net/netfilter/xt_SECMARK.c        |  9 ++++++--
 net/netlabel/netlabel_unlabeled.c | 23 +++++++++++++--------
 security/security.c               | 34 ++++++++++++++++++++++++++-----
 8 files changed, 98 insertions(+), 33 deletions(-)

diff --git a/include/linux/security.h b/include/linux/security.h
index 2ad58e2900e7..554fe4cbbf48 100644
--- a/include/linux/security.h
+++ b/include/linux/security.h
@@ -188,6 +188,27 @@ static inline bool lsmblob_equal(struct lsmblob *bloba, struct lsmblob *blobb)
 	return !memcmp(bloba, blobb, sizeof(*bloba));
 }
 
+/**
+ * lsmblob_value - find the first non-zero value in an lsmblob structure.
+ * @blob: Pointer to the data
+ *
+ * This needs to be used with extreme caution, as the cases where
+ * it is appropriate are rare.
+ *
+ * Return the first secid value set in the lsmblob.
+ * There should only be one.
+ */
+static inline u32 lsmblob_value(const struct lsmblob *blob)
+{
+	int i;
+
+	for (i = 0; i < LSMBLOB_ENTRIES; i++)
+		if (blob->secid[i])
+			return blob->secid[i];
+
+	return 0;
+}
+
 /* These functions are in security/commoncap.c */
 extern int cap_capable(const struct cred *cred, struct user_namespace *ns,
 		       int cap, unsigned int opts);
@@ -498,7 +519,8 @@ int security_setprocattr(const char *lsm, const char *name, void *value,
 int security_netlink_send(struct sock *sk, struct sk_buff *skb);
 int security_ismaclabel(const char *name);
 int security_secid_to_secctx(u32 secid, char **secdata, u32 *seclen);
-int security_secctx_to_secid(const char *secdata, u32 seclen, u32 *secid);
+int security_secctx_to_secid(const char *secdata, u32 seclen,
+			     struct lsmblob *blob);
 void security_release_secctx(char *secdata, u32 seclen);
 void security_inode_invalidate_secctx(struct inode *inode);
 int security_inode_notifysecctx(struct inode *inode, void *ctx, u32 ctxlen);
@@ -1304,7 +1326,7 @@ static inline int security_secid_to_secctx(u32 secid, char **secdata, u32 *secle
 
 static inline int security_secctx_to_secid(const char *secdata,
 					   u32 seclen,
-					   u32 *secid)
+					   struct lsmblob *blob)
 {
 	return -EOPNOTSUPP;
 }
@@ -1372,7 +1394,7 @@ void security_inet_csk_clone(struct sock *newsk,
 			const struct request_sock *req);
 void security_inet_conn_established(struct sock *sk,
 			struct sk_buff *skb);
-int security_secmark_relabel_packet(u32 secid);
+int security_secmark_relabel_packet(struct lsmblob *blob);
 void security_secmark_refcount_inc(void);
 void security_secmark_refcount_dec(void);
 int security_tun_dev_alloc_security(void **security);
@@ -1545,7 +1567,7 @@ static inline void security_inet_conn_established(struct sock *sk,
 {
 }
 
-static inline int security_secmark_relabel_packet(u32 secid)
+static inline int security_secmark_relabel_packet(struct lsmblob *blob)
 {
 	return 0;
 }
diff --git a/include/net/scm.h b/include/net/scm.h
index e2e71c4bf9d0..c09f2dfeec88 100644
--- a/include/net/scm.h
+++ b/include/net/scm.h
@@ -97,8 +97,11 @@ static inline void scm_passec(struct socket *sock, struct msghdr *msg, struct sc
 	int err;
 
 	if (test_bit(SOCK_PASSSEC, &sock->flags)) {
-		/* Scaffolding - it has to be element 0 for now */
-		err = security_secid_to_secctx(scm->lsmblob.secid[0],
+		/* There can currently be only one value in the lsmblob,
+		 * so getting it from lsmblob_value is appropriate until
+		 * security_secid_to_secctx() is converted to taking a
+		 * lsmblob directly. */
+		err = security_secid_to_secctx(lsmblob_value(&scm->lsmblob),
 					       &secdata, &seclen);
 
 		if (!err) {
diff --git a/kernel/cred.c b/kernel/cred.c
index fae63c0a1b36..e654a5a84408 100644
--- a/kernel/cred.c
+++ b/kernel/cred.c
@@ -756,14 +756,12 @@ EXPORT_SYMBOL(set_security_override);
 int set_security_override_from_ctx(struct cred *new, const char *secctx)
 {
 	struct lsmblob blob;
-	u32 secid;
 	int ret;
 
-	ret = security_secctx_to_secid(secctx, strlen(secctx), &secid);
+	ret = security_secctx_to_secid(secctx, strlen(secctx), &blob);
 	if (ret < 0)
 		return ret;
 
-	lsmblob_init(&blob, secid);
 	return set_security_override(new, &blob);
 }
 EXPORT_SYMBOL(set_security_override_from_ctx);
diff --git a/net/ipv4/ip_sockglue.c b/net/ipv4/ip_sockglue.c
index 6cf57d5ac899..7207f90eba44 100644
--- a/net/ipv4/ip_sockglue.c
+++ b/net/ipv4/ip_sockglue.c
@@ -139,8 +139,10 @@ static void ip_cmsg_recv_security(struct msghdr *msg, struct sk_buff *skb)
 	if (err)
 		return;
 
-	/* Scaffolding - it has to be element 0 */
-	err = security_secid_to_secctx(lb.secid[0], &secdata, &seclen);
+	/* There can only be one secid in the lsmblob at this point,
+	 * so getting it using lsmblob_value() is sufficient until
+	 * security_secid_to_secctx() is changed to use a lsmblob */
+	err = security_secid_to_secctx(lsmblob_value(&lb), &secdata, &seclen);
 	if (err)
 		return;
 
diff --git a/net/netfilter/nft_meta.c b/net/netfilter/nft_meta.c
index 951b6e87ed5d..5875222aeac5 100644
--- a/net/netfilter/nft_meta.c
+++ b/net/netfilter/nft_meta.c
@@ -801,7 +801,7 @@ struct nft_expr_type nft_meta_type __read_mostly = {
 
 #ifdef CONFIG_NETWORK_SECMARK
 struct nft_secmark {
-	u32 secid;
+	struct lsmblob lsmdata;
 	char *ctx;
 };
 
@@ -811,21 +811,21 @@ static const struct nla_policy nft_secmark_policy[NFTA_SECMARK_MAX + 1] = {
 
 static int nft_secmark_compute_secid(struct nft_secmark *priv)
 {
-	u32 tmp_secid = 0;
+	struct lsmblob blob;
 	int err;
 
-	err = security_secctx_to_secid(priv->ctx, strlen(priv->ctx), &tmp_secid);
+	err = security_secctx_to_secid(priv->ctx, strlen(priv->ctx), &blob);
 	if (err)
 		return err;
 
-	if (!tmp_secid)
+	if (!lsmblob_is_set(&blob))
 		return -ENOENT;
 
-	err = security_secmark_relabel_packet(tmp_secid);
+	err = security_secmark_relabel_packet(&blob);
 	if (err)
 		return err;
 
-	priv->secid = tmp_secid;
+	priv->lsmdata = blob;
 	return 0;
 }
 
@@ -835,7 +835,11 @@ static void nft_secmark_obj_eval(struct nft_object *obj, struct nft_regs *regs,
 	const struct nft_secmark *priv = nft_obj_data(obj);
 	struct sk_buff *skb = pkt->skb;
 
-	skb->secmark = priv->secid;
+	/* It is not possible for more than one secid to be set in
+	 * the lsmblob structure because it is set using
+	 * security_secctx_to_secid(). Any secid that is set must therefore
+	 * be the one that should go in the secmark. */
+	skb->secmark = lsmblob_value(&priv->lsmdata);
 }
 
 static int nft_secmark_obj_init(const struct nft_ctx *ctx,
diff --git a/net/netfilter/xt_SECMARK.c b/net/netfilter/xt_SECMARK.c
index 2317721f3ecb..8a004d018871 100644
--- a/net/netfilter/xt_SECMARK.c
+++ b/net/netfilter/xt_SECMARK.c
@@ -45,13 +45,14 @@ secmark_tg(struct sk_buff *skb, const struct xt_action_param *par)
 
 static int checkentry_lsm(struct xt_secmark_target_info *info)
 {
+	struct lsmblob blob;
 	int err;
 
 	info->secctx[SECMARK_SECCTX_MAX - 1] = '\0';
 	info->secid = 0;
 
 	err = security_secctx_to_secid(info->secctx, strlen(info->secctx),
-				       &info->secid);
+				       &blob);
 	if (err) {
 		if (err == -EINVAL)
 			pr_info_ratelimited("invalid security context \'%s\'\n",
@@ -59,13 +60,17 @@ static int checkentry_lsm(struct xt_secmark_target_info *info)
 		return err;
 	}
 
+	/* xt_secmark_target_info can't be changed to use lsmblobs because
+	 * it is exposed as an API. Use lsmblob_value() to get the one
+	 * value that got set by security_secctx_to_secid(). */
+	info->secid = lsmblob_value(&blob);
 	if (!info->secid) {
 		pr_info_ratelimited("unable to map security context \'%s\'\n",
 				    info->secctx);
 		return -ENOENT;
 	}
 
-	err = security_secmark_relabel_packet(info->secid);
+	err = security_secmark_relabel_packet(&blob);
 	if (err) {
 		pr_info_ratelimited("unable to obtain relabeling permission\n");
 		return err;
diff --git a/net/netlabel/netlabel_unlabeled.c b/net/netlabel/netlabel_unlabeled.c
index 77bb1bb22c3b..8948557eaebb 100644
--- a/net/netlabel/netlabel_unlabeled.c
+++ b/net/netlabel/netlabel_unlabeled.c
@@ -882,7 +882,7 @@ static int netlbl_unlabel_staticadd(struct sk_buff *skb,
 	void *addr;
 	void *mask;
 	u32 addr_len;
-	u32 secid;
+	struct lsmblob blob;
 	struct netlbl_audit audit_info;
 
 	/* Don't allow users to add both IPv4 and IPv6 addresses for a
@@ -906,13 +906,18 @@ static int netlbl_unlabel_staticadd(struct sk_buff *skb,
 	ret_val = security_secctx_to_secid(
 		                  nla_data(info->attrs[NLBL_UNLABEL_A_SECCTX]),
 				  nla_len(info->attrs[NLBL_UNLABEL_A_SECCTX]),
-				  &secid);
+				  &blob);
 	if (ret_val != 0)
 		return ret_val;
 
+	/* netlbl_unlhsh_add will be changed to pass a struct lsmblob *
+	 * instead of a u32 later in this patch set. security_secctx_to_secid()
+	 * will only be setting one entry in the lsmblob struct, so it is
+	 * safe to use lsmblob_value() to get that one value. */
+
 	return netlbl_unlhsh_add(&init_net,
-				 dev_name, addr, mask, addr_len, secid,
-				 &audit_info);
+				 dev_name, addr, mask, addr_len,
+				 lsmblob_value(&blob), &audit_info);
 }
 
 /**
@@ -933,7 +938,7 @@ static int netlbl_unlabel_staticadddef(struct sk_buff *skb,
 	void *addr;
 	void *mask;
 	u32 addr_len;
-	u32 secid;
+	struct lsmblob blob;
 	struct netlbl_audit audit_info;
 
 	/* Don't allow users to add both IPv4 and IPv6 addresses for a
@@ -955,13 +960,15 @@ static int netlbl_unlabel_staticadddef(struct sk_buff *skb,
 	ret_val = security_secctx_to_secid(
 		                  nla_data(info->attrs[NLBL_UNLABEL_A_SECCTX]),
 				  nla_len(info->attrs[NLBL_UNLABEL_A_SECCTX]),
-				  &secid);
+				  &blob);
 	if (ret_val != 0)
 		return ret_val;
 
+	/* security_secctx_to_secid() will only put one secid into the lsmblob
+	 * so it's safe to use lsmblob_value() to get the secid. */
 	return netlbl_unlhsh_add(&init_net,
-				 NULL, addr, mask, addr_len, secid,
-				 &audit_info);
+				 NULL, addr, mask, addr_len,
+				 lsmblob_value(&blob), &audit_info);
 }
 
 /**
diff --git a/security/security.c b/security/security.c
index 2fa826000889..6edbcb4c655e 100644
--- a/security/security.c
+++ b/security/security.c
@@ -2002,10 +2002,22 @@ int security_secid_to_secctx(u32 secid, char **secdata, u32 *seclen)
 }
 EXPORT_SYMBOL(security_secid_to_secctx);
 
-int security_secctx_to_secid(const char *secdata, u32 seclen, u32 *secid)
+int security_secctx_to_secid(const char *secdata, u32 seclen,
+			     struct lsmblob *blob)
 {
-	*secid = 0;
-	return call_int_hook(secctx_to_secid, 0, secdata, seclen, secid);
+	struct security_hook_list *hp;
+	int rc;
+
+	lsmblob_init(blob, 0);
+	hlist_for_each_entry(hp, &security_hook_heads.secctx_to_secid, list) {
+		if (WARN_ON(hp->lsmid->slot < 0 || hp->lsmid->slot >= lsm_slot))
+			continue;
+		rc = hp->hook.secctx_to_secid(secdata, seclen,
+					      &blob->secid[hp->lsmid->slot]);
+		if (rc != 0)
+			return rc;
+	}
+	return 0;
 }
 EXPORT_SYMBOL(security_secctx_to_secid);
 
@@ -2222,9 +2234,21 @@ void security_inet_conn_established(struct sock *sk,
 }
 EXPORT_SYMBOL(security_inet_conn_established);
 
-int security_secmark_relabel_packet(u32 secid)
+int security_secmark_relabel_packet(struct lsmblob *blob)
 {
-	return call_int_hook(secmark_relabel_packet, 0, secid);
+	struct security_hook_list *hp;
+	int rc = 0;
+
+	hlist_for_each_entry(hp, &security_hook_heads.secmark_relabel_packet,
+			     list) {
+		if (WARN_ON(hp->lsmid->slot < 0 || hp->lsmid->slot >= lsm_slot))
+			continue;
+		rc = hp->hook.secmark_relabel_packet(
+						blob->secid[hp->lsmid->slot]);
+		if (rc != 0)
+			break;
+	}
+	return rc;
 }
 EXPORT_SYMBOL(security_secmark_relabel_packet);
 
-- 
2.24.1

