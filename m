Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1A38D15FAE5
	for <lists+selinux@lfdr.de>; Sat, 15 Feb 2020 00:43:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728306AbgBNXnM (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Fri, 14 Feb 2020 18:43:12 -0500
Received: from sonic314-27.consmr.mail.ne1.yahoo.com ([66.163.189.153]:41062
        "EHLO sonic314-27.consmr.mail.ne1.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727932AbgBNXnM (ORCPT
        <rfc822;selinux@vger.kernel.org>); Fri, 14 Feb 2020 18:43:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1581723790; bh=Nz2BsKw0RpJ+BAc7gr0ehY/W5OLzgpZJmHP+xz0cFr0=; h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject; b=IhOX9xWd24TCqA/HHOtLxvnRAD68THAmvSHZvtQqxCtm+hQ0m886tmLvkBwOXNuzeB+5GrxYG3igoXJ3+mLPoJ3/hniqWMW38NKRuSJN19qtEcKr7lrZMgT416q9Kjb0IoxDNU7wvKz1j/v+MzEvszYJKFaJGtZYVPmB84OlXIXH2lkHRPvXgzk2w9Ttwo0PS45CZel7H/dRUxcvAirhkWSr0/0paZ/ziFE43+DOyrRaoUXSHDvGsPbLrSBD4srF70vI5WKDIXaBseGK+DU3knr2SQQwS8GyMLtlo0d5MXweLwzaMAb6rA9LSbeK77syo+KITkR/Ye6PXCg+Q40aww==
X-YMail-OSG: xepI7cQVM1n4INpAvz0NqHYQICesSd8USJhNASysUef8trulMfsR9i0ONf5CQoP
 BjjyRU4UQYiJg9i.ZqQEVdkTiYn.koXXohaNgGrjiS0xUoz2VA5GuA4r5QWOtCTC5aD2tfyoWFjU
 sMAfkgiGmj7i68nQlXGYSI58i809gYjzJVYTr01w4e1JMbhidZRlPhIJ4bs565ueeZH8PVqfGsv6
 cPqVXKFfLSpzzfR3FRsSclOSttQ2GnwFOc5b_MpTsG6iPEG.JCnkz35nB3PFG03tXOriC0YQJMz_
 VGQIg8mJ5w7MxEuISt_SqwNhUkbqEXifYzo17WrTo1Kgk8Qxim.1RF2jrYOvfizOg3I8PMtnoEDd
 9Go85M91Qr_5c3l3ZcNNGeZsJI_B2aUdP7.sGQ0g5UolWjOt5r5X88D1k9GYC7vooeeHq3GAxQTd
 Jqh6zZUUTR18BCApsGXZF2LS5O1DA.qRi.casyNSs7g7KG2cQdsC9SsCXpofkvLs1Fo2n3OZ813n
 fwv2JhPsJR7GXTO7yAmxF6B.4sR8vFGBO6M1H27ichwoZGwPYqaYaxbd0YExexPn7Kkv2d15AYEm
 PWsH3YbPS5McdgGgQwNwAB661ZuLMCZ2xWgGAUSkxbAC4VKO0ItLqDYG44N5IYkrCY_u6.ZmS9vp
 In8uPb1LcvxdfseXkxkzT0Noe80c.AauqIa2dREKEWyS26KSd94kZIMilkeUafPs7xLp.TbIWWxr
 w5EgNWbH9gIPM2BLJhlfu7z84Dws.QrCl7dz4NCqrFRrhRGoHvEoc73xGelfrFHVlB8b47w.9ACn
 84WVHBwhLSLXxG0LLGDi4xWXdPdArJS3.2mKx_8Vp_Vp9Dp3kdeZMShKQECTrOpq35ibvWCJlPPq
 rgcWNshoNm9t0ijKnbvZhi0MYWZrHvUBRP12JiWATtsloa4ec2lqrnuDSYoO42KNBjceMsWg6YYL
 h4CgggELXyEy6DsWjv4UaECwuXDURA4ARD6rIoB.SZGbUGPqEfwyxhIf7bHOnvsdVCL6mgwNbw02
 MBjDUj_FyBdkJOGaMX8jWJ0CZTyXkZOXc8jduvqKSRv.fYDlKdxJeIYY6n6VPErkNI2ydQBXuXl0
 jXOYs._JCgPr0WtMXPoo_3CPhrKJZWKY33mwTdXbx0uXrZCMo6U9ZRwPoJN.OWmycYELtlaPuHnN
 K_5Ouyx6.ratJCm84qpH3jUI9GfYtdNGDAicpnaFv5QuvlJ.ep9mFFHv4AwSbbf1kCRg.IhUBAHO
 S_3goA_UmxWS.XN3w_U_XWoLkF339LLjHaBWgNfQ5FV5LLrq1SXGZuh2L_J5qzXcJ4B5AmniwhSs
 W5N_rhPgZM9r6jdh_efMM2QywoxfIxf8_IeZb3dyKbkLXD0HlcfZfN4bpkIg2Lanc91p8nF5xceD
 vtG4_AMefUfl0fWSs.r.QjjIKwTPYZEP8zDLawVe5cLxKNotIjoih6Lat38O8Cu4D
Received: from sonic.gate.mail.ne1.yahoo.com by sonic314.consmr.mail.ne1.yahoo.com with HTTP; Fri, 14 Feb 2020 23:43:10 +0000
Received: by smtp421.mail.gq1.yahoo.com (Oath Hermes SMTP Server) with ESMTPA ID 034a07a14f1305e890adf12d8ef35b61;
          Fri, 14 Feb 2020 23:43:05 +0000 (UTC)
From:   Casey Schaufler <casey@schaufler-ca.com>
To:     casey.schaufler@intel.com, jmorris@namei.org,
        linux-security-module@vger.kernel.org, selinux@vger.kernel.org
Cc:     casey@schaufler-ca.com, keescook@chromium.org,
        john.johansen@canonical.com, penguin-kernel@i-love.sakura.ne.jp,
        paul@paul-moore.com, sds@tycho.nsa.gov
Subject: [PATCH v15 06/23] Use lsmblob in security_secctx_to_secid
Date:   Fri, 14 Feb 2020 15:41:46 -0800
Message-Id: <20200214234203.7086-7-casey@schaufler-ca.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200214234203.7086-1-casey@schaufler-ca.com>
References: <20200214234203.7086-1-casey@schaufler-ca.com>
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
Acked-by: Stephen Smalley <sds@tycho.nsa.gov>
Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
---
 include/linux/security.h          |  5 +++--
 kernel/cred.c                     |  4 +---
 net/netfilter/nft_meta.c          | 12 +++++++-----
 net/netfilter/xt_SECMARK.c        |  5 ++++-
 net/netlabel/netlabel_unlabeled.c | 14 ++++++++------
 security/security.c               | 18 +++++++++++++++---
 6 files changed, 38 insertions(+), 20 deletions(-)

diff --git a/include/linux/security.h b/include/linux/security.h
index 2ad58e2900e7..65adcffafee9 100644
--- a/include/linux/security.h
+++ b/include/linux/security.h
@@ -498,7 +498,8 @@ int security_setprocattr(const char *lsm, const char *name, void *value,
 int security_netlink_send(struct sock *sk, struct sk_buff *skb);
 int security_ismaclabel(const char *name);
 int security_secid_to_secctx(u32 secid, char **secdata, u32 *seclen);
-int security_secctx_to_secid(const char *secdata, u32 seclen, u32 *secid);
+int security_secctx_to_secid(const char *secdata, u32 seclen,
+			     struct lsmblob *blob);
 void security_release_secctx(char *secdata, u32 seclen);
 void security_inode_invalidate_secctx(struct inode *inode);
 int security_inode_notifysecctx(struct inode *inode, void *ctx, u32 ctxlen);
@@ -1304,7 +1305,7 @@ static inline int security_secid_to_secctx(u32 secid, char **secdata, u32 *secle
 
 static inline int security_secctx_to_secid(const char *secdata,
 					   u32 seclen,
-					   u32 *secid)
+					   struct lsmblob *blob)
 {
 	return -EOPNOTSUPP;
 }
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
diff --git a/net/netfilter/nft_meta.c b/net/netfilter/nft_meta.c
index 951b6e87ed5d..e12125b85035 100644
--- a/net/netfilter/nft_meta.c
+++ b/net/netfilter/nft_meta.c
@@ -811,21 +811,23 @@ static const struct nla_policy nft_secmark_policy[NFTA_SECMARK_MAX + 1] = {
 
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
index 2fa826000889..e0f9287483aa 100644
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
 
-- 
2.24.1

