Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1136F15FAFE
	for <lists+selinux@lfdr.de>; Sat, 15 Feb 2020 00:44:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728310AbgBNXoz (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Fri, 14 Feb 2020 18:44:55 -0500
Received: from sonic310-31.consmr.mail.ne1.yahoo.com ([66.163.186.212]:44524
        "EHLO sonic310-31.consmr.mail.ne1.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728271AbgBNXoz (ORCPT
        <rfc822;selinux@vger.kernel.org>); Fri, 14 Feb 2020 18:44:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1581723893; bh=/JTyJIIxOgLtTQY9hB7CangNajKOxP2qi4YQSMHVAHI=; h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject; b=tsRg9v8gx636c/m8Tdkh0H4jPpVw0IGcl4qvN0CvpSbGKp0Qy2VwmOxgZrkVNqF9v0ELI7LOytngNtoF/aENUbWe38SvixZmHkqQx4OCPQoeoItxuHs2gkhBxQ5jlFlY5o1uotwLqXfB8HtuJp3tudGnYUa7AoykGnIJNxqJQxtMzdFdc6w/NsVzsvogCg8j329eob99YLZD6JRmt6cpT5UD65R5yUkJ1gY4TXZ9rDH+GBilDOozu57MmHkGMf5Oh3D9Dzv2LVhWCpKc6+rRs0IQ8iie+a8/rg/TfvYNLrtJ6w5FMJTlwOxiO7QydUjJvcjT3fIZOhOR6huhNMkrtw==
X-YMail-OSG: J2v3oGEVM1ljvcf.dxmzkgqDMIiG6ndpcQ9jp1yn4Cp12lamVp6bIg.WUpbv5YW
 cDbq8nXsM1w6Z_W.M8sxEp72pW51lJTxJ7HgQxk0VaiZqYDaKDInV3pWUiyhG732d_KvlDFZSbtq
 fh_7lcgQk8VwnHGxa1cLomPIU5qXHt.qCI_fykqleSi3V0xs40.940NqGNMnXPIyPgedIYFTRJVy
 gRXYJv_KI1nJ7F2_iyuO7PCoWoYHYh5O1nwMObIB3Bt_fYmuJ_7G7_HLLbkdiqEGql7TYmj.KJAx
 RCT1GMXjDJ7DBkODauIRFaueXg0lixXP2SXp7typJTV5_Me092lFL0tg.5pKRVOVoV02Y.hAs0As
 Qo8h.AHxd1LrCXZQXVTk26QINdGn7QWHZhoEBSdcwtPtNjbxqKLr.ljj._d.MO0HbtS2_jGG.7XJ
 QnQY.5.s5MBqKaZLKaWgicKzcMYWT2NynD2yC_wqLS1NsaLbdivkly.QeNAZuYlGZpjdO8TUCSgV
 SzvLsUOemcrkUVSrO8cRjdJo8Au8wp9zBoxkwrJwahIYvbD4GAOOhXZEX6KrWAddBqOEKvFkzoaV
 baDDJ8OPbYez0WCi1r4jemWFh4Uo5stfwtxCXq66VVdKWEL_Q5ABgnMHbbU6B2CbABExO8gQrPce
 ic1LeEiuimRdZlXyKyHmDNZsu5eVmqoPk8F5PAgx5M1jp.H5Glr2Z6hnirXgD06CiSE5PDE99kiv
 moktMGjPfhzuS8aeRJRxrwAsYZgYZeDT82UmXY3UscrXJ_EXUM5jF.395QtmI664H1VFN6aUR2Um
 mNoWxCvso0x4aBI_24MmfMIKcMTYgXpLhC4xRvUa7sQJNH4aA4dI16QuZXJNs8V5wipSQVY6yqEA
 DFH_KCYqSgtqvr9x6e9LPkfzasgYj1sU0yp4UvjOUuxeuvGu_KPFVUEMjV3iA6_.vq5pi7AFoqzf
 JmhwoOFrxrMt.Q.BnjMTlwMpG.ZOCguMtXxEegWPuDaBBVWnwE8hkwOPNLoMoGJKDZXB80KFtgsm
 ZColjWtCos7nNZ3lCoMlxFAvxP8CvW7JhiBdUjRI.QVgkFu_Yya7cWx4sYRdStfvEf7xF9_WhnAs
 WB2C4yfxCT8H8a8nUmqfTSXNOljdFwplAMIqynB81kl5GL33tHwTqmpFFUUnA5ioQ4dYtd2YftPL
 tFcNAjcrjtc_VdwuNjvPyeMpTACYNZBXr1TNbgWAU82H3F6KaphKt_M0_7fus0Dgzm2Auj8ajWPp
 qTBDOKre8Nl70kaZ5S_OaGu_TWC51INZHaSk_cNyJJmFaba6H.eQ2gS6k7EwUiqAdQcvrFB7O_1a
 Bb8Cvi0CS6L3h_YXr05EL8RfXzx21TiY8mj03GQYYEXnOAzS3Fb5YqbzmW0pVswl4.2ms20ZsVUx
 gB2vEfpqcpxJ6RzDMgZb8D.v_dywPjjxi4DsC07s99ZD.7GSoykXqDftk2Hjp
Received: from sonic.gate.mail.ne1.yahoo.com by sonic310.consmr.mail.ne1.yahoo.com with HTTP; Fri, 14 Feb 2020 23:44:53 +0000
Received: by smtp407.mail.ne1.yahoo.com (Oath Hermes SMTP Server) with ESMTPA ID 768a909794458cd16a286f5d22121ebc;
          Fri, 14 Feb 2020 23:44:48 +0000 (UTC)
From:   Casey Schaufler <casey@schaufler-ca.com>
To:     casey.schaufler@intel.com, jmorris@namei.org,
        linux-security-module@vger.kernel.org, selinux@vger.kernel.org
Cc:     casey@schaufler-ca.com, keescook@chromium.org,
        john.johansen@canonical.com, penguin-kernel@i-love.sakura.ne.jp,
        paul@paul-moore.com, sds@tycho.nsa.gov
Subject: [PATCH v15 16/23] LSM: Use lsmcontext in security_inode_getsecctx
Date:   Fri, 14 Feb 2020 15:41:56 -0800
Message-Id: <20200214234203.7086-17-casey@schaufler-ca.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200214234203.7086-1-casey@schaufler-ca.com>
References: <20200214234203.7086-1-casey@schaufler-ca.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Change the security_inode_getsecctx() interface to fill
a lsmcontext structure instead of data and length pointers.
This provides the information about which LSM created the
context so that security_release_secctx() can use the
correct hook.

Acked-by: Stephen Smalley <sds@tycho.nsa.gov>
Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
---
 fs/nfsd/nfs4xdr.c        | 23 +++++++++--------------
 include/linux/security.h |  5 +++--
 security/security.c      | 13 +++++++++++--
 3 files changed, 23 insertions(+), 18 deletions(-)

diff --git a/fs/nfsd/nfs4xdr.c b/fs/nfsd/nfs4xdr.c
index df308b1b37fa..ac8eb77d0053 100644
--- a/fs/nfsd/nfs4xdr.c
+++ b/fs/nfsd/nfs4xdr.c
@@ -2379,11 +2379,11 @@ nfsd4_encode_layout_types(struct xdr_stream *xdr, u32 layout_types)
 #ifdef CONFIG_NFSD_V4_SECURITY_LABEL
 static inline __be32
 nfsd4_encode_security_label(struct xdr_stream *xdr, struct svc_rqst *rqstp,
-			    void *context, int len)
+			    struct lsmcontext *context)
 {
 	__be32 *p;
 
-	p = xdr_reserve_space(xdr, len + 4 + 4 + 4);
+	p = xdr_reserve_space(xdr, context->len + 4 + 4 + 4);
 	if (!p)
 		return nfserr_resource;
 
@@ -2393,13 +2393,13 @@ nfsd4_encode_security_label(struct xdr_stream *xdr, struct svc_rqst *rqstp,
 	 */
 	*p++ = cpu_to_be32(0); /* lfs */
 	*p++ = cpu_to_be32(0); /* pi */
-	p = xdr_encode_opaque(p, context, len);
+	p = xdr_encode_opaque(p, context->context, context->len);
 	return 0;
 }
 #else
 static inline __be32
 nfsd4_encode_security_label(struct xdr_stream *xdr, struct svc_rqst *rqstp,
-			    void *context, int len)
+			    struct lsmcontext *context)
 { return 0; }
 #endif
 
@@ -2496,9 +2496,7 @@ nfsd4_encode_fattr(struct xdr_stream *xdr, struct svc_fh *fhp,
 	int err;
 	struct nfs4_acl *acl = NULL;
 #ifdef CONFIG_NFSD_V4_SECURITY_LABEL
-	struct lsmcontext scaff; /* scaffolding */
-	void *context = NULL;
-	int contextlen;
+	struct lsmcontext context = { };
 #endif
 	bool contextsupport = false;
 	struct nfsd4_compoundres *resp = rqstp->rq_resp;
@@ -2556,7 +2554,7 @@ nfsd4_encode_fattr(struct xdr_stream *xdr, struct svc_fh *fhp,
 	     bmval0 & FATTR4_WORD0_SUPPORTED_ATTRS) {
 		if (exp->ex_flags & NFSEXP_SECURITY_LABEL)
 			err = security_inode_getsecctx(d_inode(dentry),
-						&context, &contextlen);
+						       &context);
 		else
 			err = -EOPNOTSUPP;
 		contextsupport = (err == 0);
@@ -2986,8 +2984,7 @@ nfsd4_encode_fattr(struct xdr_stream *xdr, struct svc_fh *fhp,
 
 #ifdef CONFIG_NFSD_V4_SECURITY_LABEL
 	if (bmval2 & FATTR4_WORD2_SECURITY_LABEL) {
-		status = nfsd4_encode_security_label(xdr, rqstp, context,
-								contextlen);
+		status = nfsd4_encode_security_label(xdr, rqstp, &context);
 		if (status)
 			goto out;
 	}
@@ -2999,10 +2996,8 @@ nfsd4_encode_fattr(struct xdr_stream *xdr, struct svc_fh *fhp,
 
 out:
 #ifdef CONFIG_NFSD_V4_SECURITY_LABEL
-	if (context) {
-		lsmcontext_init(&scaff, context, contextlen, 0); /*scaffolding*/
-		security_release_secctx(&scaff);
-	}
+	if (context.context)
+		security_release_secctx(&context);
 #endif /* CONFIG_NFSD_V4_SECURITY_LABEL */
 	kfree(acl);
 	if (tempfh) {
diff --git a/include/linux/security.h b/include/linux/security.h
index ba7fc88f7858..690f8d6495e5 100644
--- a/include/linux/security.h
+++ b/include/linux/security.h
@@ -535,7 +535,7 @@ void security_release_secctx(struct lsmcontext *cp);
 void security_inode_invalidate_secctx(struct inode *inode);
 int security_inode_notifysecctx(struct inode *inode, void *ctx, u32 ctxlen);
 int security_inode_setsecctx(struct dentry *dentry, void *ctx, u32 ctxlen);
-int security_inode_getsecctx(struct inode *inode, void **ctx, u32 *ctxlen);
+int security_inode_getsecctx(struct inode *inode, struct lsmcontext *cp);
 int security_locked_down(enum lockdown_reason what);
 #else /* CONFIG_SECURITY */
 
@@ -1361,7 +1361,8 @@ static inline int security_inode_setsecctx(struct dentry *dentry, void *ctx, u32
 {
 	return -EOPNOTSUPP;
 }
-static inline int security_inode_getsecctx(struct inode *inode, void **ctx, u32 *ctxlen)
+static inline int security_inode_getsecctx(struct inode *inode,
+					   struct lsmcontext *cp)
 {
 	return -EOPNOTSUPP;
 }
diff --git a/security/security.c b/security/security.c
index e2e5277185e0..d663406cba86 100644
--- a/security/security.c
+++ b/security/security.c
@@ -2211,9 +2211,18 @@ int security_inode_setsecctx(struct dentry *dentry, void *ctx, u32 ctxlen)
 }
 EXPORT_SYMBOL(security_inode_setsecctx);
 
-int security_inode_getsecctx(struct inode *inode, void **ctx, u32 *ctxlen)
+int security_inode_getsecctx(struct inode *inode, struct lsmcontext *cp)
 {
-	return call_int_hook(inode_getsecctx, -EOPNOTSUPP, inode, ctx, ctxlen);
+	struct security_hook_list *hp;
+
+	memset(cp, 0, sizeof(*cp));
+
+	hlist_for_each_entry(hp, &security_hook_heads.inode_getsecctx, list) {
+		cp->slot = hp->lsmid->slot;
+		return hp->hook.inode_getsecctx(inode, (void **)&cp->context,
+						&cp->len);
+	}
+	return -EOPNOTSUPP;
 }
 EXPORT_SYMBOL(security_inode_getsecctx);
 
-- 
2.24.1

