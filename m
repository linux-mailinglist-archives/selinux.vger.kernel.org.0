Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7493832409
	for <lists+selinux@lfdr.de>; Sun,  2 Jun 2019 18:52:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726961AbfFBQwM (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Sun, 2 Jun 2019 12:52:12 -0400
Received: from sonic310-30.consmr.mail.ne1.yahoo.com ([66.163.186.211]:43676
        "EHLO sonic310-30.consmr.mail.ne1.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726952AbfFBQwL (ORCPT
        <rfc822;selinux@vger.kernel.org>); Sun, 2 Jun 2019 12:52:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1559494330; bh=nhyQ5HEMViXMwzj11P6PbXR0lPC7xmZwGngBq91che4=; h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject; b=GlmiNJBbrRNxNsIQZdKDNahk0ZrLgz8Yxy7X9wdFZtgWpBqKgWfcR585Egcvxr4IYr1p+BzG7BJkL6Tas0+5o2NBJD/kqE6rOtx3lKvSKjN+VjeGX7npnwTPAvFD/07MjV4NeamvL0koCcUu/6ArtzcJDfUN3NgBUq5RjFrH3c4QvGmmAGM1C5B5e8iSINYtNzgpnSiF5wFfT0dM7iyu41Ndsg2DaQho5OPrXppeUnOfeeMC78yrlhncWgnxbT4KxWGwhcWY7i9bj05mXGrSORmyXpICH/QpE0EXulWkWkh3mjAubQyaMcriiSTffPhL+cRt2J1tTxEArHQn0xrKbA==
X-YMail-OSG: 1lIHSDQVM1kZifA2HQSk5.UgT9_XzmbKGdatRiwpYCLP9AFEj9l0h33ReODOlz.
 12urlG88gCfFaZ8Alsq4E6XrsHceWf.uImrJM_xoP8dvLlOG1jZ_fOHxNFto2wIbubLVibgRF4Ky
 o1HZ2TFwWIVHOM1KlGzB_OrmlFX6FbSoY7VvzH7cAV5dIzfx9TTijCrNyX5kSuxqDwwdObqu_riZ
 .G1gqPlHVSiN7wcxgQw4O8LTd3fXUplkXhJXK9ya7bdgGWmpQcx4fgVTkvUvTHRxU5eweBvaIbS2
 1W3nwYdtHz2wDpN1oN5jg1sKbwzgLyleuWJFXjx9MI7GrrKytW4da7g7otcf0ygXmo8NAqcxQEtP
 uaq82FK45ImZ2mPZ.TecCfiZ27AAhJ03Z7arIX6zWGYOqhIXnIOax8GhplSJMh8ILqWgmK8GrSqT
 a7EJr5boMNSF9w80J308emtijh0YED8a6uSp_8D3NMzzrVP0LWHxNF7JYNQP_xWnYph63L4DxAx3
 SrCq7LL48mmpZh9V5v4Bko0YjCJVeWbdF1aS4BNBi0VSstonTXpSKse3O25txShHhv0ETh2jO55s
 RO8BLsgfIn5_sR4mfHY8duEiry7XmLHJbGlfsZAwS_z0k704OfueJB16T6SSPoC5O3MWYm1r2HQp
 UTe28Hpy6v4jYtfuknwqu4izpkZMgh4zMRJ5ahgcHYDxZoSWMJkJiUwggm40vI8wYv0tNC1CMcaG
 iFxrOjLPDrOtBGSTKIPbR7D4OEMPpOFYpCCzupOxRPKrjNFeACHiIaw67bMA3371nC3yq075ixnr
 pCNABtzNZrdRHccywXBTapMhGvC4xPen75jZCWqqKEmmKYtN3ncLD_c7LdMo9.DqocPZxhI04n0p
 TC5zSFkmrvw12zktCnbVAJHtC0IBheT.quNJsPonwQHL7LnurM6R4mmNy1qIbI8WZST.u8v5surL
 xHHVtr3zu3zSLJmSDn71hxlXlFEXDRkrXO97oZygVZjlG.5scFJZNCukAS5gwLZ9S.pnRS7QgoQ0
 FU2YVDQZbAE54y16QyMHO9HxGGyKIAQTVXGoRK2ib.Uu0hfbaIsHYAhsVvEYobANMBgWS2.Lat04
 AaNZCT9BJMVGBpAztyUiUZou_UpjOW1YlhGYMau5jXJ6IX4H.cElsDXy_Ncdpbrs73Nn_ub3CgpH
 BWqDphD3LuAEgo.sIAzMffJleWIiOLJmUSWRZw33zsXQLWFu.izgXQ6FVuIlL0FmPvnRDYEruSue
 7o9JK2nMyB5ilg2BW2JMjwLQYjUImMfxRYmqkQTek78iEjcgAJ6PZHaD112qr9CQ-
Received: from sonic.gate.mail.ne1.yahoo.com by sonic310.consmr.mail.ne1.yahoo.com with HTTP; Sun, 2 Jun 2019 16:52:10 +0000
Received: from c-73-223-4-185.hsd1.ca.comcast.net (EHLO localhost.net) ([73.223.4.185])
          by smtp423.mail.ne1.yahoo.com (Oath Hermes SMTP Server) with ESMTPA ID fe9f27128ba4a09bc4aa17914eac4de2;
          Sun, 02 Jun 2019 16:52:05 +0000 (UTC)
From:   Casey Schaufler <casey@schaufler-ca.com>
To:     casey.schaufler@intel.com, jmorris@namei.org,
        linux-security-module@vger.kernel.org, selinux@vger.kernel.org
Cc:     casey@schaufler-ca.com, keescook@chromium.org,
        john.johansen@canonical.com, penguin-kernel@i-love.sakura.ne.jp,
        paul@paul-moore.com, sds@tycho.nsa.gov
Subject: [PATCH 16/58] LSM: Use lsm_export in security_secctx_to_secid
Date:   Sun,  2 Jun 2019 09:50:19 -0700
Message-Id: <20190602165101.25079-17-casey@schaufler-ca.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190602165101.25079-1-casey@schaufler-ca.com>
References: <20190602165101.25079-1-casey@schaufler-ca.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

