Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 204C3F9EEB
	for <lists+selinux@lfdr.de>; Wed, 13 Nov 2019 01:09:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727137AbfKMAJn (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Tue, 12 Nov 2019 19:09:43 -0500
Received: from sonic315-27.consmr.mail.ne1.yahoo.com ([66.163.190.153]:33603
        "EHLO sonic315-27.consmr.mail.ne1.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726936AbfKMAJm (ORCPT
        <rfc822;selinux@vger.kernel.org>); Tue, 12 Nov 2019 19:09:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1573603781; bh=co4jpZY+mhudboH3Pzmlm1GU8BGwBGVp+kygYlsjIuI=; h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject; b=sc5+O79U2g8mvon/Kfb6Z58FdIsfnPMcGwmKeP/dXfY2Y3JahW5HnvnDLO19JH2i/jSAKsmStFLzMe6MgasD8vonLtXVksFoV9WLzIrV16KzIMuiR98LaEkT55mWdZzP7ZAzjQFNcKcudav/3bwdUOrwljOfQpuXOaMlr0tfHkUrkcJ9l1TyfCs60kvE3aD1Tgkp91fx2HpAsUivOACZA/2Qc+4KzU1THSFsSUYRwLC23b6cQEzYKQvyrH5ffYQXBRbII+SxzPaHzhmLQnBsbchBAuISOw46wB1YRPfp87MyGxCdngN6aeker+/aAv6JmbofMj76T2GeAsmEiQgACA==
X-YMail-OSG: duWiNj8VM1kWGio0c7v0TjNmXFZm4sb0DDVN56LeFgDNeVJnXNC3_5WNotV6Scy
 cyKHhcZctV9moIseQxpQgFd9eLYm2EH9VF0cw7po7rEG6d6JEULuUDMaC_FCBCsBuaKyOuv0QXSD
 7MC7xNDAIAaox6jgtdd6Ti2C_q6R2SxHwOR33_eRsyM0rZbMQyoa3KEAvlkNbMApULRKauPe1EKI
 NXMz1jlbYj8Z7zJm9OgZGFbTa1e.ZXz1dmlO3hpGDzUPHhzKl1eMVS0DeCMoZBygbOyKNNKJKsiu
 AL1Klcg.i6ob4CjD5aZHq2CMSwx7a_InP_CnwKy3v3uixRDSt_trf.OM6AsOnGiWQ4.zlHmlxTfq
 RQoD4u2FPasi1Ds6d96uLgO0eoh.lfJjidEU7ny4kw3Hv9a1Kk68d13zCKiDHn9bTdrLvtTkADnk
 DvYUkqJfrHrgZHOJUQNr8NVUiJYq_JO1972IQQ717sbo_dYctPLmtDlObqzpW_Umlxah74LH6I.x
 1IyMpzlsoKDX5y2k1KUHusFp60qAU1oIEMKUaZA5N2t3VH7P3TqEr.GOOHjIzrXybbXwU2OjDQJm
 DZOm9l9QU8b4IuU5bJxpCmLn1odWSizZDpKpYf6tUw77xALq8dUl6AHIxoxJMOw1l8KOmtgtA.zq
 loykfiEApdYFCTbB6_u0aIChsizFfPuALD6WWvUqJykbbVYRQc1q4OrsL_rAI55UrjHzMsHR98AS
 rD.XNV7p4KnmbrWyIhrPy32SN2Kmu1kpvyHguASNUX..cdtU52oWzpbbNH8625wkoqOCJsfXtrm5
 _.BLCEGLPAzbjRxd_19S4MGdVZuqKcwvQITqYYk4N4TUHVSKEJgbZI2rbV0P6DlG1pUHYjJwWgjt
 NTuXTH0o2tMvq9tccmAu_WFI5IpD_oH2BBb5q0lDVDCjMHZeem_nHEUrxrmd19Tjd5UrH8pMhPQB
 Nkg6v2or_Sc3PPwpLwMTGevPzN3G1meG_.ZzR6FDlab_DR3N.zVQ8576rscKjQffkNBKVIfctM58
 sS6xSoqSLd_LsoBxPIAsBPwWDC7cH50wRhPlhfsXqxBwv_2a6iR91R6V7AvhSTdJdtcSSreQOLjI
 nc4_8IO.Ay50wqGh3IhNd2JKeBJk7Qdj3CTED08sxg9UyQK3DSk41ChqQCAapxhvGhElNu1j_E7o
 SbNe3NN3rQoH9ABYzFPjfBl8gPACP.SRG5bfvslXSji7h4Dd5evXKG8st6MLrvyVgiVGY6fUcjFR
 uc53.sJK0Fq_yl78BVqWMz2ZynSJDpkG7S18nP5HMM74GlzD9cK5toxduTEU9OQw1X7qmYPmvMqV
 3b9mDjRpfTZBq3MnVr0CpR5Xlmn8J_5_OUIn5P0cVETijpUzN2b0d57BwATogEwvorXozT.4c87e
 Hmhl5QNsreHbcm.JH28PX5qqsY11TmaKKfNUAazc5Gmc4W1D7rACIJ2JV.CH7R6kpdA--
Received: from sonic.gate.mail.ne1.yahoo.com by sonic315.consmr.mail.ne1.yahoo.com with HTTP; Wed, 13 Nov 2019 00:09:41 +0000
Received: by smtp427.mail.ne1.yahoo.com (Oath Hermes SMTP Server) with ESMTPA ID eba4c54ba4d55f2cad95fb20ef489486;
          Wed, 13 Nov 2019 00:09:39 +0000 (UTC)
From:   Casey Schaufler <casey@schaufler-ca.com>
To:     casey.schaufler@intel.com, jmorris@namei.org,
        linux-security-module@vger.kernel.org, selinux@vger.kernel.org
Cc:     casey@schaufler-ca.com, keescook@chromium.org,
        john.johansen@canonical.com, penguin-kernel@i-love.sakura.ne.jp,
        paul@paul-moore.com, sds@tycho.nsa.gov
Subject: [PATCH 06/25] LSM: Use lsmblob in security_secctx_to_secid
Date:   Tue, 12 Nov 2019 16:08:54 -0800
Message-Id: <20191113000913.5414-7-casey@schaufler-ca.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191113000913.5414-1-casey@schaufler-ca.com>
References: <20191113000913.5414-1-casey@schaufler-ca.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Change security_secctx_to_secid() to fill in a lsmblob instead
of a u32 secid. Multiple LSMs may be able to interpret the
string, and this allows for setting whichever secid is
appropriate. In some cases there is scaffolding where other
interfaces have yet to be converted.

Reviewed-by: Kees Cook <keescook@chromium.org>
Reviewed-by: John Johansen <john.johansen@canonical.com>
Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
---
 include/linux/security.h          |  5 +++--
 kernel/cred.c                     |  4 +---
 net/netfilter/nft_meta.c          | 13 ++++++-------
 net/netfilter/xt_SECMARK.c        |  5 ++++-
 net/netlabel/netlabel_unlabeled.c | 14 ++++++++------
 security/security.c               | 18 +++++++++++++++---
 6 files changed, 37 insertions(+), 22 deletions(-)

diff --git a/include/linux/security.h b/include/linux/security.h
index d57f400a307e..b69877a13efa 100644
--- a/include/linux/security.h
+++ b/include/linux/security.h
@@ -494,7 +494,8 @@ int security_setprocattr(const char *lsm, const char *name, void *value,
 int security_netlink_send(struct sock *sk, struct sk_buff *skb);
 int security_ismaclabel(const char *name);
 int security_secid_to_secctx(u32 secid, char **secdata, u32 *seclen);
-int security_secctx_to_secid(const char *secdata, u32 seclen, u32 *secid);
+int security_secctx_to_secid(const char *secdata, u32 seclen,
+			     struct lsmblob *blob);
 void security_release_secctx(char *secdata, u32 seclen);
 void security_inode_invalidate_secctx(struct inode *inode);
 int security_inode_notifysecctx(struct inode *inode, void *ctx, u32 ctxlen);
@@ -1300,7 +1301,7 @@ static inline int security_secid_to_secctx(u32 secid, char **secdata, u32 *secle
 
 static inline int security_secctx_to_secid(const char *secdata,
 					   u32 seclen,
-					   u32 *secid)
+					   struct lsmblob *blob)
 {
 	return -EOPNOTSUPP;
 }
diff --git a/kernel/cred.c b/kernel/cred.c
index 846ac4b23c16..7fef90f3f10b 100644
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
diff --git a/net/netfilter/nft_meta.c b/net/netfilter/nft_meta.c
index 317e3a9e8c5b..7c49397c33fd 100644
--- a/net/netfilter/nft_meta.c
+++ b/net/netfilter/nft_meta.c
@@ -617,21 +617,20 @@ static const struct nla_policy nft_secmark_policy[NFTA_SECMARK_MAX + 1] = {
 
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
-		return -ENOENT;
-
-	err = security_secmark_relabel_packet(tmp_secid);
+	/* Using le[0] is scaffolding */
+	err = security_secmark_relabel_packet(blob.secid[0]);
 	if (err)
 		return err;
 
-	priv->secid = tmp_secid;
+	/* Using le[0] is scaffolding */
+	priv->secid = blob.secid[0];
 	return 0;
 }
 
diff --git a/net/netfilter/xt_SECMARK.c b/net/netfilter/xt_SECMARK.c
index 2317721f3ecb..2d68416b4552 100644
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
@@ -59,6 +60,8 @@ static int checkentry_lsm(struct xt_secmark_target_info *info)
 		return err;
 	}
 
+	/* scaffolding during the transition */
+	info->secid = blob.secid[0];
 	if (!info->secid) {
 		pr_info_ratelimited("unable to map security context \'%s\'\n",
 				    info->secctx);
diff --git a/net/netlabel/netlabel_unlabeled.c b/net/netlabel/netlabel_unlabeled.c
index d2e4ab8d1cb1..7a5a87f15736 100644
--- a/net/netlabel/netlabel_unlabeled.c
+++ b/net/netlabel/netlabel_unlabeled.c
@@ -881,7 +881,7 @@ static int netlbl_unlabel_staticadd(struct sk_buff *skb,
 	void *addr;
 	void *mask;
 	u32 addr_len;
-	u32 secid;
+	struct lsmblob blob;
 	struct netlbl_audit audit_info;
 
 	/* Don't allow users to add both IPv4 and IPv6 addresses for a
@@ -905,12 +905,13 @@ static int netlbl_unlabel_staticadd(struct sk_buff *skb,
 	ret_val = security_secctx_to_secid(
 		                  nla_data(info->attrs[NLBL_UNLABEL_A_SECCTX]),
 				  nla_len(info->attrs[NLBL_UNLABEL_A_SECCTX]),
-				  &secid);
+				  &blob);
 	if (ret_val != 0)
 		return ret_val;
 
+	/* scaffolding with the [0] */
 	return netlbl_unlhsh_add(&init_net,
-				 dev_name, addr, mask, addr_len, secid,
+				 dev_name, addr, mask, addr_len, blob.secid[0],
 				 &audit_info);
 }
 
@@ -932,7 +933,7 @@ static int netlbl_unlabel_staticadddef(struct sk_buff *skb,
 	void *addr;
 	void *mask;
 	u32 addr_len;
-	u32 secid;
+	struct lsmblob blob;
 	struct netlbl_audit audit_info;
 
 	/* Don't allow users to add both IPv4 and IPv6 addresses for a
@@ -954,12 +955,13 @@ static int netlbl_unlabel_staticadddef(struct sk_buff *skb,
 	ret_val = security_secctx_to_secid(
 		                  nla_data(info->attrs[NLBL_UNLABEL_A_SECCTX]),
 				  nla_len(info->attrs[NLBL_UNLABEL_A_SECCTX]),
-				  &secid);
+				  &blob);
 	if (ret_val != 0)
 		return ret_val;
 
+	/* scaffolding with the [0] */
 	return netlbl_unlhsh_add(&init_net,
-				 NULL, addr, mask, addr_len, secid,
+				 NULL, addr, mask, addr_len, blob.secid[0],
 				 &audit_info);
 }
 
diff --git a/security/security.c b/security/security.c
index 55837706e3ef..32bb5383de9b 100644
--- a/security/security.c
+++ b/security/security.c
@@ -1970,10 +1970,22 @@ int security_secid_to_secctx(u32 secid, char **secdata, u32 *seclen)
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
 
-- 
2.20.1

