Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AF5E931790
	for <lists+selinux@lfdr.de>; Sat,  1 Jun 2019 01:12:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726653AbfEaXMm (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Fri, 31 May 2019 19:12:42 -0400
Received: from sonic302-9.consmr.mail.bf2.yahoo.com ([74.6.135.48]:37502 "EHLO
        sonic302-9.consmr.mail.bf2.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726450AbfEaXMk (ORCPT
        <rfc822;selinux@vger.kernel.org>); Fri, 31 May 2019 19:12:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1559344359; bh=nhyQ5HEMViXMwzj11P6PbXR0lPC7xmZwGngBq91che4=; h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject; b=isyLxpNGwV9a8I09DiE5IPWVcYeHMmXGADM4W+ftjnmvXTzZ0dmva5TSbOg9TTFfmbtQEFh73hx/UCY2mG6KepN429TbhsFVkBaBG/79ZXtfjThLzrbJvgGo9f0yAGu1SwSoo8OIeUSEafgVgBRK0hVtIIOWuUqkwdtaqT6otN2/EgHBzvN8NtvKqs5saaRp7CSZVOUGzzC400QFLvx1D4kgVRzWea5b+yc1KVRbKj8/JIqA4sFc0Xuxyf38GSyf1qApguBnBZtJivKe9gDW3mfguRfzkvZQKUwWYu+MSChsrQUn241iWb6ytm+9rF6Et7vMruKFGVlGcc8tWun4nQ==
X-YMail-OSG: H_cCyl0VM1mGgnERVMhwVOqQE1oE_wiSKO52I2YRiZ3c3FUhUgGEpH_1FEeRVNv
 T_85JCfPCXQJDoWovNswJIvu9pK5k.B3UCtlE90O.1MfvjNi.sV2lhNQ03Uz8RHEBBC2CfYzj0Gt
 tV0plr7FJdpWjYqeqtSikKRp9EjIfm9wqqFglEMI9MbkGftwIQ_gDPM6X29c.xepps1YH9CZmHw0
 TjjiIVXVw_3y5lciuAkswzJ_R8BGiWjsh34Dqz8Np3RJKZSS7cRCJAmEPfZC.JKFyiTy30jdmNHF
 Cc6AAC2601iEBrq0WS5bXNLZLzkPvE4jbryQT.2Wp0.SZQ3emwZVR2CVlVPOTKXUY7Nx7MyyfOed
 bJqAY9AoNhJTrEizrivm464H28HA3hZcSFq7qh_e5KQzikAbPltFqCvjZQ2da1LQR4ygmaXRX4FP
 aFzKBVgT8eS0ESW_xsOC1iCRQ1Ny16nguvu81oL_KCvk7EWPFaV.Fvp6.fnmK7H5GFVdIl.ub9Wj
 K7pMARLWtuFvDb8rqWsFWuxdo6ZhxAjRLb0hpXZuTY6fadgcDBfkM19Rk280kdgJBkEIjq7P9VYL
 R.ht0x3qpuABY7pZpUA5wBEnZ5Pd44qu19At2GUT_7zrbUgiKXGjpQTZcieu57SW8jydVfEW.mkC
 ZGgLmWbNs1tptJ0SYxn9bFmhCrQsUtPM0F0vtKO5Gi42xuDUISV5fTlRYkHsfAd2toPcpcp0S05e
 q4dC6K69Ogn1PLyxkjOqA2c2LXCa1KuIKGKnunMU2UoA45dD.EoMydGKSscDPXrPJk7mkBy.U9Ix
 Mhc6zjPQj32O9N18eQ9UbRezAWBcBJwuTPrH9wcd8hJmBuvUKMNivPyZS8HttoO0CzdUwjNwmjNC
 ZFD2PmphbFH0BlZ1hdd3lv40uF5HzuGvE7x2aX9glgszfenCnImLJnQ.qJMCO30EwfRc34lvwN.o
 qqfgmNLYTw31VDQdF7dvIHpsxFjoPBtbTgtacknWen7I_SJzDLOiP_OcW63ulA2c521Zyupkebi7
 3PVQPmvFWjG8zCFGraqmJGNgmuIssqZzareIBOjED6_IQsCzym.Lo0Gj1HrtRt3DldDofWhA_kDt
 oVRe2t3UmGXElMLh1iXjUbKA2LxO2o.nUog.mOPecHS86BFqcoccz3V7b57fu55lMqDDq621DEKD
 GkjqB.iwJXqowpEdOe5qhuxwIeyKO1YigvPKN9knjWhEj33fFrrBmdtssPkcC.I.nnmI_zDTSkAe
 a1bmSqSefX2oqgiq3Y_j4V3IAnDPhqWeNpo4kNO0s.FI7Gp8USYq4QPkl2HR9QeS4lUZOhZTY
Received: from sonic.gate.mail.ne1.yahoo.com by sonic302.consmr.mail.bf2.yahoo.com with HTTP; Fri, 31 May 2019 23:12:39 +0000
Received: from c-73-223-4-185.hsd1.ca.comcast.net (EHLO localhost.localdomain) ([73.223.4.185])
          by smtp424.mail.bf1.yahoo.com (Oath Hermes SMTP Server) with ESMTPA ID 96e99cd6627b9eaaa0e67fd214bcff39;
          Fri, 31 May 2019 23:12:37 +0000 (UTC)
From:   Casey Schaufler <casey@schaufler-ca.com>
To:     casey.schaufler@intel.com, jmorris@namei.org,
        linux-security-module@vger.kernel.org, selinux@vger.kernel.org
Cc:     casey@schaufler-ca.com, keescook@chromium.org,
        john.johansen@canonical.com, penguin-kernel@i-love.sakura.ne.jp,
        paul@paul-moore.com, sds@tycho.nsa.gov
Subject: [PATCH 16/58] LSM: Use lsm_export in security_secctx_to_secid
Date:   Fri, 31 May 2019 16:09:38 -0700
Message-Id: <20190531231020.628-17-casey@schaufler-ca.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20190531231020.628-1-casey@schaufler-ca.com>
References: <20190531231020.628-1-casey@schaufler-ca.com>
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Convert security_secctx_to_secid to use the lsm_export structure
instead of a u32 secid. There is some scaffolding involved
that will be removed when the related data is updated.

Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
---
 include/linux/security.h          |  5 +++--
 kernel/cred.c                     |  4 +---
 net/netfilter/nft_meta.c          |  4 +++-
 net/netfilter/xt_SECMARK.c        |  5 +++--
 net/netlabel/netlabel_unlabeled.c |  8 ++++++--
 security/security.c               | 11 ++++-------
 6 files changed, 20 insertions(+), 17 deletions(-)

diff --git a/include/linux/security.h b/include/linux/security.h
index e3f5c61b9b2c..991d2d2e290e 100644
--- a/include/linux/security.h
+++ b/include/linux/security.h
@@ -437,7 +437,8 @@ int security_setprocattr(const char *lsm, const char *name, void *value,
 int security_netlink_send(struct sock *sk, struct sk_buff *skb);
 int security_ismaclabel(const char *name);
 int security_secid_to_secctx(u32 secid, char **secdata, u32 *seclen);
-int security_secctx_to_secid(const char *secdata, u32 seclen, u32 *secid);
+int security_secctx_to_secid(const char *secdata, u32 seclen,
+			     struct lsm_export *l);
 void security_release_secctx(char *secdata, u32 seclen);
 
 void security_inode_invalidate_secctx(struct inode *inode);
@@ -1220,7 +1221,7 @@ static inline int security_secid_to_secctx(u32 secid, char **secdata, u32 *secle
 
 static inline int security_secctx_to_secid(const char *secdata,
 					   u32 seclen,
-					   u32 *secid)
+					   struct lsm_export *l)
 {
 	return -EOPNOTSUPP;
 }
diff --git a/kernel/cred.c b/kernel/cred.c
index 40a3fde22667..7792538b1ca6 100644
--- a/kernel/cred.c
+++ b/kernel/cred.c
@@ -725,14 +725,12 @@ EXPORT_SYMBOL(set_security_override);
 int set_security_override_from_ctx(struct cred *new, const char *secctx)
 {
 	struct lsm_export le;
-	u32 secid;
 	int ret;
 
-	ret = security_secctx_to_secid(secctx, strlen(secctx), &secid);
+	ret = security_secctx_to_secid(secctx, strlen(secctx), &le);
 	if (ret < 0)
 		return ret;
 
-	lsm_export_to_all(&le, secid);
 	return set_security_override(new, &le);
 }
 EXPORT_SYMBOL(set_security_override_from_ctx);
diff --git a/net/netfilter/nft_meta.c b/net/netfilter/nft_meta.c
index 987d2d6ce624..598bea8e4799 100644
--- a/net/netfilter/nft_meta.c
+++ b/net/netfilter/nft_meta.c
@@ -576,13 +576,15 @@ static const struct nla_policy nft_secmark_policy[NFTA_SECMARK_MAX + 1] = {
 
 static int nft_secmark_compute_secid(struct nft_secmark *priv)
 {
+	struct lsm_export le;
 	u32 tmp_secid = 0;
 	int err;
 
-	err = security_secctx_to_secid(priv->ctx, strlen(priv->ctx), &tmp_secid);
+	err = security_secctx_to_secid(priv->ctx, strlen(priv->ctx), &le);
 	if (err)
 		return err;
 
+	lsm_export_secid(&le, &tmp_secid);
 	if (!tmp_secid)
 		return -ENOENT;
 
diff --git a/net/netfilter/xt_SECMARK.c b/net/netfilter/xt_SECMARK.c
index f16202d26c20..2def8d8898e6 100644
--- a/net/netfilter/xt_SECMARK.c
+++ b/net/netfilter/xt_SECMARK.c
@@ -49,13 +49,13 @@ secmark_tg(struct sk_buff *skb, const struct xt_action_param *par)
 
 static int checkentry_lsm(struct xt_secmark_target_info *info)
 {
+	struct lsm_export le;
 	int err;
 
 	info->secctx[SECMARK_SECCTX_MAX - 1] = '\0';
 	info->secid = 0;
 
-	err = security_secctx_to_secid(info->secctx, strlen(info->secctx),
-				       &info->secid);
+	err = security_secctx_to_secid(info->secctx, strlen(info->secctx), &le);
 	if (err) {
 		if (err == -EINVAL)
 			pr_info_ratelimited("invalid security context \'%s\'\n",
@@ -63,6 +63,7 @@ static int checkentry_lsm(struct xt_secmark_target_info *info)
 		return err;
 	}
 
+	lsm_export_secid(&le, &info->secid);
 	if (!info->secid) {
 		pr_info_ratelimited("unable to map security context \'%s\'\n",
 				    info->secctx);
diff --git a/net/netlabel/netlabel_unlabeled.c b/net/netlabel/netlabel_unlabeled.c
index c92894c3e40a..fc38934ccb35 100644
--- a/net/netlabel/netlabel_unlabeled.c
+++ b/net/netlabel/netlabel_unlabeled.c
@@ -896,6 +896,7 @@ static int netlbl_unlabel_staticadd(struct sk_buff *skb,
 	void *mask;
 	u32 addr_len;
 	u32 secid;
+	struct lsm_export le;
 	struct netlbl_audit audit_info;
 
 	/* Don't allow users to add both IPv4 and IPv6 addresses for a
@@ -919,10 +920,11 @@ static int netlbl_unlabel_staticadd(struct sk_buff *skb,
 	ret_val = security_secctx_to_secid(
 		                  nla_data(info->attrs[NLBL_UNLABEL_A_SECCTX]),
 				  nla_len(info->attrs[NLBL_UNLABEL_A_SECCTX]),
-				  &secid);
+				  &le);
 	if (ret_val != 0)
 		return ret_val;
 
+	lsm_export_secid(&le, &secid);
 	return netlbl_unlhsh_add(&init_net,
 				 dev_name, addr, mask, addr_len, secid,
 				 &audit_info);
@@ -947,6 +949,7 @@ static int netlbl_unlabel_staticadddef(struct sk_buff *skb,
 	void *mask;
 	u32 addr_len;
 	u32 secid;
+	struct lsm_export le;
 	struct netlbl_audit audit_info;
 
 	/* Don't allow users to add both IPv4 and IPv6 addresses for a
@@ -968,10 +971,11 @@ static int netlbl_unlabel_staticadddef(struct sk_buff *skb,
 	ret_val = security_secctx_to_secid(
 		                  nla_data(info->attrs[NLBL_UNLABEL_A_SECCTX]),
 				  nla_len(info->attrs[NLBL_UNLABEL_A_SECCTX]),
-				  &secid);
+				  &le);
 	if (ret_val != 0)
 		return ret_val;
 
+	lsm_export_secid(&le, &secid);
 	return netlbl_unlhsh_add(&init_net,
 				 NULL, addr, mask, addr_len, secid,
 				 &audit_info);
diff --git a/security/security.c b/security/security.c
index d8300a6400c3..868e9ae6b48c 100644
--- a/security/security.c
+++ b/security/security.c
@@ -1967,14 +1967,11 @@ int security_secid_to_secctx(u32 secid, char **secdata, u32 *seclen)
 }
 EXPORT_SYMBOL(security_secid_to_secctx);
 
-int security_secctx_to_secid(const char *secdata, u32 seclen, u32 *secid)
+int security_secctx_to_secid(const char *secdata, u32 seclen,
+			     struct lsm_export *l)
 {
-	struct lsm_export data = { .flags = LSM_EXPORT_NONE };
-	int rc;
-
-	rc = call_int_hook(secctx_to_secid, 0, secdata, seclen, &data);
-	lsm_export_secid(&data, secid);
-	return rc;
+	lsm_export_init(l);
+	return call_int_hook(secctx_to_secid, 0, secdata, seclen, l);
 }
 EXPORT_SYMBOL(security_secctx_to_secid);
 
-- 
2.19.1

