Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 678BC571A1
	for <lists+selinux@lfdr.de>; Wed, 26 Jun 2019 21:23:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726339AbfFZTXV (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Wed, 26 Jun 2019 15:23:21 -0400
Received: from sonic303-28.consmr.mail.ne1.yahoo.com ([66.163.188.154]:35121
        "EHLO sonic303-28.consmr.mail.ne1.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726591AbfFZTXU (ORCPT
        <rfc822;selinux@vger.kernel.org>); Wed, 26 Jun 2019 15:23:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1561576999; bh=/wTbGoj7e8V1VnGCwr5//5wzU06RSIPt0Obw7oLyOCg=; h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject; b=TqkYSWU674tzRz5htTEBqr3CNuJRNFQ5THJhwwwQWjKKeT0ossYMYNtRpveWhrbND/cukoQK3Dod0LiRhVYPtTP6AHgOL5hOudHhO8wQrzPrx+a5DDvJ2OZF5IaTF/sWXNfjYdfg9MH29s7gbjSh4ulyAjALuGDDEzdTEc8JlClie2cwXZ0Ou/CPlLxYDW4d9dbtPCi7dTNd/gqG2zI9nULAY8tMSMh+Indr231QrKQwwjf8NQ+B5dHDjmuBMAkM+5JIAz/+0KhLkx6hH1KwoTbykMfPorQ1UdwH2CFlyUdBydI7IvEBsghgE2SMjXLN9N5nR48f4dk9QbLM5qnJJQ==
X-YMail-OSG: TSVXs.EVM1nbY5kD3Fb_wIqoJ92.eoEfZ0gf50x2bLc9pd2oQgCiMDd1cftV9o2
 beIC9kKX9PtYqxP3a9Q_Crb4lHHt_3zNFx5UFyhWeDobNTIvaeXUnjmHvXtA7rpclGSM0hN97FsG
 ey22uIlFsgQtRBmyGd0jUK3TUox_d3bugQ_EQPJc4INELYraSvvGGopCL_KYTN1lmuR5a.9s_WKm
 SD1493PUpMdEkSTj0TI4MAAqtYgfm4IYC4kOv02OB1Qqj5PA.I34S2c7vDVfrw75DjPBZySIsdL7
 99.WT..Kt.4LoemtwcDAj5zmIm9AZUIMaDLrbvWnunJOsXkqLYscQeKWNIwTl0ZUNLbhIfY5eD3l
 pC1xiXY29Q4x7tmLKTHCSqixy3ysZlYdMvtkyK06MRwH.QmN6fMXiE4St8WD.5LlBpMgGZz2z6v.
 7uEY6Twoodbb9nSNx1QHm5ry2hAsafLxzFojTXNovRAGLlqmpcpdHh0zYlME5qci_E9X8OPRvSDr
 ZDzG2sMprfy8w04Oz4VsYzlX42w8UiqykntWEJJnPANlsQ8TUaEeCWG0J7IFG2fVgfPptBuvsDPG
 7u2h3oRsyTby0IOSStYEFviRgCeGCZqENlLxYMq8.MSj4qTYjGj5mHrdfo4lztet_rnwbvqqg2xl
 II9SSGqRfYy.6ByTJkfwl01RUO2CvRlzx.7MbOyRnjXAIENjRfnpzAnzT1RcHiTm_irjYHG6HfWq
 UCWZAnBz0RsTNMKMlessoB_uyNrQIVuOyeKMaeDMebxd2f1Q9Yj6IeckIItk7jG8vdNJ9FFIN7in
 SHnn9O_bcwcaaCiydidERoKkm.HQcymr.7.KpfJBsslhXb3RN.l1zWMMRNrXmfXlcS_OmnAY4z8Z
 yMZGvnBwOkQIr608IghS9XKGCLmngmxtdfce5BbqmoqzS6xY_TucIQarhDBE6fgAK6C84zsJv1Nr
 em72bzbWri3sBtShyGJL8R7WNu2S.fY3C2ZlHkZadbZnNUeLpVM5SbtvjuWtAb3_g5jB88ONWAbm
 5tQETpX3SOLnDq..dCvMVK_pzqFHw4WIb2guZfs1x_chaDEfvgL1qsVxa_Gvo6U3U6Qq038288ty
 Ub96SR.ezelceC4c0GhcOqy35C0e8rw8QhST3F4F8AKPpcWrE7pKMn8b5qwOIkwnjvk3O95d2DSW
 5cWWutRbnN0hX2iAn3o55uaMYnjs4MFj1QU0eDYndeY.eYwtoTRBe2TLuIzklyK0.jRCV_737.qn
 iWdr0U0MC0p5ZMaV.pYYkZdNTfPwf3Wycn2FqvHIq0g--
Received: from sonic.gate.mail.ne1.yahoo.com by sonic303.consmr.mail.ne1.yahoo.com with HTTP; Wed, 26 Jun 2019 19:23:19 +0000
Received: from c-73-223-4-185.hsd1.ca.comcast.net (EHLO localhost.net) ([73.223.4.185])
          by smtp422.mail.ne1.yahoo.com (Oath Hermes SMTP Server) with ESMTPA ID b8c135b07bec32b448265b8073874548;
          Wed, 26 Jun 2019 19:23:15 +0000 (UTC)
From:   Casey Schaufler <casey@schaufler-ca.com>
To:     casey.schaufler@intel.com, jmorris@namei.org,
        linux-security-module@vger.kernel.org, selinux@vger.kernel.org
Cc:     casey@schaufler-ca.com, keescook@chromium.org,
        john.johansen@canonical.com, penguin-kernel@i-love.sakura.ne.jp,
        paul@paul-moore.com, sds@tycho.nsa.gov
Subject: [PATCH v4 19/23] LSM: Use lsmcontext in security_inode_getsecctx
Date:   Wed, 26 Jun 2019 12:22:30 -0700
Message-Id: <20190626192234.11725-20-casey@schaufler-ca.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190626192234.11725-1-casey@schaufler-ca.com>
References: <20190626192234.11725-1-casey@schaufler-ca.com>
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
correct hook. A lsmcontext is used within kernfs to store
the security information as well.

Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
---
 fs/kernfs/dir.c             |  8 ++------
 fs/kernfs/inode.c           | 34 ++++++++++++----------------------
 fs/kernfs/kernfs-internal.h |  3 +--
 fs/nfsd/nfs4xdr.c           | 23 +++++++++--------------
 include/linux/security.h    |  5 +++--
 security/security.c         | 14 ++++++++++++--
 6 files changed, 39 insertions(+), 48 deletions(-)

diff --git a/fs/kernfs/dir.c b/fs/kernfs/dir.c
index 92afad387237..1d000289d8b7 100644
--- a/fs/kernfs/dir.c
+++ b/fs/kernfs/dir.c
@@ -532,12 +532,8 @@ void kernfs_put(struct kernfs_node *kn)
 	kfree_const(kn->name);
 
 	if (kn->iattr) {
-		struct lsmcontext scaff; /* scaffolding */
-		if (kn->iattr->ia_secdata) {
-			lsmcontext_init(&scaff, kn->iattr->ia_secdata,
-					kn->iattr->ia_secdata_len, 0);
-			security_release_secctx(&scaff);
-		}
+		if (kn->iattr->ia_context.context)
+			security_release_secctx(&kn->iattr->ia_context);
 		simple_xattrs_free(&kn->iattr->xattrs);
 		kmem_cache_free(kernfs_iattrs_cache, kn->iattr);
 	}
diff --git a/fs/kernfs/inode.c b/fs/kernfs/inode.c
index 02cde9dac5ee..ffbf7863306d 100644
--- a/fs/kernfs/inode.c
+++ b/fs/kernfs/inode.c
@@ -135,21 +135,14 @@ int kernfs_iop_setattr(struct dentry *dentry, struct iattr *iattr)
 	return error;
 }
 
-static int kernfs_node_setsecdata(struct kernfs_iattrs *attrs, void **secdata,
-				  u32 *secdata_len)
+static void kernfs_node_setsecdata(struct kernfs_iattrs *attrs,
+				   struct lsmcontext *cp)
 {
-	void *old_secdata;
-	size_t old_secdata_len;
+	struct lsmcontext old_context;
 
-	old_secdata = attrs->ia_secdata;
-	old_secdata_len = attrs->ia_secdata_len;
-
-	attrs->ia_secdata = *secdata;
-	attrs->ia_secdata_len = *secdata_len;
-
-	*secdata = old_secdata;
-	*secdata_len = old_secdata_len;
-	return 0;
+	old_context = attrs->ia_context;
+	attrs->ia_context = *cp;
+	*cp = old_context;
 }
 
 ssize_t kernfs_iop_listxattr(struct dentry *dentry, char *buf, size_t size)
@@ -192,8 +185,8 @@ static void kernfs_refresh_inode(struct kernfs_node *kn, struct inode *inode)
 		 * persistent copy in kernfs_node.
 		 */
 		set_inode_attr(inode, &attrs->ia_iattr);
-		security_inode_notifysecctx(inode, attrs->ia_secdata,
-					    attrs->ia_secdata_len);
+		security_inode_notifysecctx(inode, attrs->ia_context.context,
+					    attrs->ia_context.len);
 	}
 
 	if (kernfs_type(kn) == KERNFS_DIR)
@@ -350,8 +343,6 @@ static int kernfs_security_xattr_set(const struct xattr_handler *handler,
 	struct kernfs_node *kn = inode->i_private;
 	struct kernfs_iattrs *attrs;
 	struct lsmcontext context;
-	void *secdata;
-	u32 secdata_len = 0;
 	int error;
 
 	attrs = kernfs_iattrs(kn);
@@ -361,18 +352,17 @@ static int kernfs_security_xattr_set(const struct xattr_handler *handler,
 	error = security_inode_setsecurity(inode, suffix, value, size, flags);
 	if (error)
 		return error;
-	error = security_inode_getsecctx(inode, &secdata, &secdata_len);
+	error = security_inode_getsecctx(inode, &context);
 	if (error)
 		return error;
 
 	mutex_lock(&kernfs_mutex);
-	error = kernfs_node_setsecdata(attrs, &secdata, &secdata_len);
+	kernfs_node_setsecdata(attrs, &context);
 	mutex_unlock(&kernfs_mutex);
 
-	if (secdata) {
-		lsmcontext_init(&context, secdata, secdata_len, 0);
+	if (context.context)
 		security_release_secctx(&context);
-	}
+
 	return error;
 }
 
diff --git a/fs/kernfs/kernfs-internal.h b/fs/kernfs/kernfs-internal.h
index 0b7d197a904c..844a028d282f 100644
--- a/fs/kernfs/kernfs-internal.h
+++ b/fs/kernfs/kernfs-internal.h
@@ -21,8 +21,7 @@
 
 struct kernfs_iattrs {
 	struct iattr		ia_iattr;
-	void			*ia_secdata;
-	u32			ia_secdata_len;
+	struct lsmcontext	ia_context;
 
 	struct simple_xattrs	xattrs;
 };
diff --git a/fs/nfsd/nfs4xdr.c b/fs/nfsd/nfs4xdr.c
index bb3db033e144..1209083565dd 100644
--- a/fs/nfsd/nfs4xdr.c
+++ b/fs/nfsd/nfs4xdr.c
@@ -2304,11 +2304,11 @@ nfsd4_encode_layout_types(struct xdr_stream *xdr, u32 layout_types)
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
 
@@ -2318,13 +2318,13 @@ nfsd4_encode_security_label(struct xdr_stream *xdr, struct svc_rqst *rqstp,
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
 
@@ -2420,9 +2420,7 @@ nfsd4_encode_fattr(struct xdr_stream *xdr, struct svc_fh *fhp,
 	__be32 status;
 	int err;
 	struct nfs4_acl *acl = NULL;
-	struct lsmcontext scaff; /* scaffolding */
-	void *context = NULL;
-	int contextlen;
+	struct lsmcontext context;
 	bool contextsupport = false;
 	struct nfsd4_compoundres *resp = rqstp->rq_resp;
 	u32 minorversion = resp->cstate.minorversion;
@@ -2479,7 +2477,7 @@ nfsd4_encode_fattr(struct xdr_stream *xdr, struct svc_fh *fhp,
 	     bmval0 & FATTR4_WORD0_SUPPORTED_ATTRS) {
 		if (exp->ex_flags & NFSEXP_SECURITY_LABEL)
 			err = security_inode_getsecctx(d_inode(dentry),
-						&context, &contextlen);
+						       &context);
 		else
 			err = -EOPNOTSUPP;
 		contextsupport = (err == 0);
@@ -2908,8 +2906,7 @@ nfsd4_encode_fattr(struct xdr_stream *xdr, struct svc_fh *fhp,
 	}
 
 	if (bmval2 & FATTR4_WORD2_SECURITY_LABEL) {
-		status = nfsd4_encode_security_label(xdr, rqstp, context,
-								contextlen);
+		status = nfsd4_encode_security_label(xdr, rqstp, &context);
 		if (status)
 			goto out;
 	}
@@ -2920,10 +2917,8 @@ nfsd4_encode_fattr(struct xdr_stream *xdr, struct svc_fh *fhp,
 
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
index 2674eb70c2d7..c16aea55be97 100644
--- a/include/linux/security.h
+++ b/include/linux/security.h
@@ -489,7 +489,7 @@ void security_release_secctx(struct lsmcontext *cp);
 void security_inode_invalidate_secctx(struct inode *inode);
 int security_inode_notifysecctx(struct inode *inode, void *ctx, u32 ctxlen);
 int security_inode_setsecctx(struct dentry *dentry, void *ctx, u32 ctxlen);
-int security_inode_getsecctx(struct inode *inode, void **ctx, u32 *ctxlen);
+int security_inode_getsecctx(struct inode *inode, struct lsmcontext *cp);
 #else /* CONFIG_SECURITY */
 
 static inline int call_lsm_notifier(enum lsm_event event, void *data)
@@ -1290,7 +1290,8 @@ static inline int security_inode_setsecctx(struct dentry *dentry, void *ctx, u32
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
index 61cdc6bcd32e..45b9f905f5c0 100644
--- a/security/security.c
+++ b/security/security.c
@@ -2164,9 +2164,19 @@ int security_inode_setsecctx(struct dentry *dentry, void *ctx, u32 ctxlen)
 }
 EXPORT_SYMBOL(security_inode_setsecctx);
 
-int security_inode_getsecctx(struct inode *inode, void **ctx, u32 *ctxlen)
+int security_inode_getsecctx(struct inode *inode, struct lsmcontext *cp)
 {
-	return call_int_hook(inode_getsecctx, -EOPNOTSUPP, inode, ctx, ctxlen);
+	int *display = current->security;
+	struct security_hook_list *hp;
+
+	hlist_for_each_entry(hp, &security_hook_heads.inode_getsecctx, list)
+		if (*display == LSMBLOB_INVALID ||
+		    *display == hp->lsmid->slot) {
+			cp->slot = hp->lsmid->slot;
+			return hp->hook.inode_getsecctx(inode,
+					(void **)&cp->context, &cp->len);
+		}
+	return -EOPNOTSUPP;
 }
 EXPORT_SYMBOL(security_inode_getsecctx);
 
-- 
2.20.1

