Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CABB4121E1E
	for <lists+selinux@lfdr.de>; Mon, 16 Dec 2019 23:34:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727491AbfLPWeP (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Mon, 16 Dec 2019 17:34:15 -0500
Received: from sonic311-30.consmr.mail.ne1.yahoo.com ([66.163.188.211]:41602
        "EHLO sonic311-30.consmr.mail.ne1.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727226AbfLPWeP (ORCPT
        <rfc822;selinux@vger.kernel.org>); Mon, 16 Dec 2019 17:34:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1576535653; bh=CflM/BYE/m6vkCFgy2DwlH+gpJmxaxAxuCstaWJenLE=; h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject; b=sVoNj5XbY9diSpZN1FXRtTiqpwxVvUOpviCSZDPnXrbA5nLRh3m4LKQWH6yKgqwPdkT7+A0xU+ZHSgITWoOaGh6GKHi/GMzdUscQ80xXnPRJR7Wnxmu1UShkV1RlbyGG/JQbFJ/iR2frGIIEA4FTXQZ4e4YbhA8oDRCcv9mdjUVYL9Mc3BhJBomGwK9lQlgziqkqWKqQ52Zi1sW3SupI8ZHPnNVvyKYmpvUk3KmR1/hhPwM/m7n2GmkTXEN8GTkPL7YQzZ03HcVpBWj2yGFK3S3LCxxDntgd/BMHizehWkKPWiAHiUwko7p9bsbHyvdUhVLRifyYq8g52Ipg4oCdBQ==
X-YMail-OSG: BrI6QAYVM1lET52gWFguLUBxXCcssli3McK9bJ0jEYSe8XmEErlCNAWCJkalpR8
 UJ4EAXR4pCF6EjgA2YMjg1Q2xuuOnjAgu2TbAlZy0LyERfDqeUZKuQqWfn6IUzxgP0pYSZKcq5O2
 N_o_qQRsOrx7pmgZCyQn_9fdH7XVNq4sx3eav42F7Sfx6bsPwNeR0hGPVOTe9K_m5N9NeTAbh0C7
 U14GKPSBixv44rI6_sgBr758ydKGBKEfjkBc73ZJFVYXrfoMWUmVZsldQqiAN2CWR8Nuz4wUr0.a
 Kqcd93gfGU.E2HoXtnSTZ18mN_POciCQDRc835Ip5j.Mo8mI.Q5Xwro5tv5uQ9fEJyFAuK7aZ3jQ
 f5vp6WUOC.nyfhrnVswIzC8hStBuGHeoOFvKjlTvCxEG6I2nmcUgmq5374cr1gbRbbs2nz4SVH8H
 PYRSeCdzM7hZz5ZIWwBMe3oB.zyLbs8l3SbgpOsNXEH47pKNprZyw7awmSbZ5BRA6_BHNEELs_EL
 JfIk6a5m_978zDq1Rfji5R4jobthSsGqjO77gZfFS9_LgYOXeOlmj8He7xvSHzgggQP3FsFTZmTJ
 ba.8c6GT8GVs8tXyNb6rhG5DF01n27bHMXdKgdo3PELHoeN1H1.lfLloXTwSRxptWqz9dYAanXLl
 sCDi92JCiLFISt9TRTzr4NiYVuO7h6zVCg.JdxRr3vUcUmxKtGuiPAfoAXiNT6fyRHA3dMyKguqo
 zVpFigk0ld8eCiEDKiDy.SWHSFKxxQRLA6CGIPcw_l9EQXhNawAN3_AR4tH48EALKj8zOFy91meO
 VPBGqMWBmtJ11MNuiRkaptAsHtJdlnf7dua_lYurUGrVPCUzKio1DBFI93veeC84asTW6OpZUc62
 7jFpNi1JTzrKxeuSyM.NOqRTmbsDffv7eTDXrzw231ofJL2g4VFSzs4tERmY6yvUyYYL7ll81rTH
 8lXnDTOt3aJTnUQRLXcgzmeuS2kzJw.6UcwovwNvZTcGvHyJYJquCfH7vOR_5b6zikyULM5nFeUp
 dJ3c9xlF2T7D4qTQy38nV9S_1O78Doe2KTFcEIG0Ycenzd7ibQx0xqNCYy05zcaP9YeLlSvPiXRH
 GilK.L_b6Ijbjz3C1_hIVW3H4FlZ0INucMyje.xPS986c34spoJsS6F61zpBaHhaNW6ex2zLJWiT
 kFpRG4bcpCwxr3arbjnzhFhkNXygYu5dW7tD6PSb0RbzQC9jSJOhNgfO4RLIsQQOJahOGe9iOLNl
 hoaDNBxErJKHiunM02NM_4w7qeoAyi3zU4HQNByEuCgX__kBm5YJfXNbENW2VZ.6Hjfv9QlKyEhd
 5QryBpOyiwFTB75GdUUcT8Z8.58sQiIoHGCUPTETzRMYQETRYRDnXb1P61kZErMezqKbDLI0np97
 YEtK9PS0hExCxH72uVb6qF02nLTK2kIB6QhSRiMMh5qXIUcjcDOzEBSO4wjItESM4PRM-
Received: from sonic.gate.mail.ne1.yahoo.com by sonic311.consmr.mail.ne1.yahoo.com with HTTP; Mon, 16 Dec 2019 22:34:13 +0000
Received: by smtp426.mail.bf1.yahoo.com (Oath Hermes SMTP Server) with ESMTPA ID c9d34065d35cf5052e1c371e78fe445d;
          Mon, 16 Dec 2019 22:34:08 +0000 (UTC)
From:   Casey Schaufler <casey@schaufler-ca.com>
To:     casey.schaufler@intel.com, jmorris@namei.org,
        linux-security-module@vger.kernel.org, selinux@vger.kernel.org
Cc:     keescook@chromium.org, john.johansen@canonical.com,
        penguin-kernel@i-love.sakura.ne.jp, paul@paul-moore.com,
        sds@tycho.nsa.gov
Subject: [PATCH v12 06/25] LSM: Use lsmblob in security_secctx_to_secid
Date:   Mon, 16 Dec 2019 14:33:26 -0800
Message-Id: <20191216223345.5066-7-casey@schaufler-ca.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191216223345.5066-1-casey@schaufler-ca.com>
References: <20191216223345.5066-1-casey@schaufler-ca.com>
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
index 995faba7393f..8cae9e4bd760 100644
--- a/include/linux/security.h
+++ b/include/linux/security.h
@@ -496,7 +496,8 @@ int security_setprocattr(const char *lsm, const char *name, void *value,
 int security_netlink_send(struct sock *sk, struct sk_buff *skb);
 int security_ismaclabel(const char *name);
 int security_secid_to_secctx(u32 secid, char **secdata, u32 *seclen);
-int security_secctx_to_secid(const char *secdata, u32 seclen, u32 *secid);
+int security_secctx_to_secid(const char *secdata, u32 seclen,
+			     struct lsmblob *blob);
 void security_release_secctx(char *secdata, u32 seclen);
 void security_inode_invalidate_secctx(struct inode *inode);
 int security_inode_notifysecctx(struct inode *inode, void *ctx, u32 ctxlen);
@@ -1302,7 +1303,7 @@ static inline int security_secid_to_secctx(u32 secid, char **secdata, u32 *secle
 
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
index 9740b554fdb3..9b8066d02868 100644
--- a/net/netfilter/nft_meta.c
+++ b/net/netfilter/nft_meta.c
@@ -625,21 +625,20 @@ static const struct nla_policy nft_secmark_policy[NFTA_SECMARK_MAX + 1] = {
 
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
index a3be3929a60a..03ac668c0c10 100644
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

