Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 45F91574CA
	for <lists+selinux@lfdr.de>; Thu, 27 Jun 2019 01:16:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726455AbfFZXQF (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Wed, 26 Jun 2019 19:16:05 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:39568 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726407AbfFZXQF (ORCPT
        <rfc822;selinux@vger.kernel.org>); Wed, 26 Jun 2019 19:16:05 -0400
Received: by mail-pf1-f196.google.com with SMTP id j2so207393pfe.6
        for <selinux@vger.kernel.org>; Wed, 26 Jun 2019 16:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=6Lb3J7p4sN7hwIMK/0Mib2kby/kSUa+fK30VA6w3QJc=;
        b=P0qSiQPTQCINZmcRe8gGP1mSYIDoJ3aH0mHaKyOHBtqxFIQ4vuZOb/nC5u9nWnqBK/
         ZaAhnuhUS3UEjD4EDkOaGzSyyO/5i20iC2fZZTs92jeEZIyLEhm0mFcM8vWHg3Gbep4Z
         E4akcyIqG3XtJ0xq1J01AXz3h7rBZX5ad+o4c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6Lb3J7p4sN7hwIMK/0Mib2kby/kSUa+fK30VA6w3QJc=;
        b=JrDt+zEPyR2kreFv+ZR5LKZHhyfaFIH3iFA4vn+j8XeLsMscbwYQfAUisLTvzsU/id
         UXtjHiwk6UheZ3S34u2OOCuqBNDVJHTVLk374xVBXHsvDdvDq10x9a9SThAx5MveMf2h
         M9SIPVZ0PhchzYUs4yWmjTmW/mtpbStHgYxJckgWjCrCGoK5dJ9E48A8dH3ntOxTRX/g
         5DYj4t+S3wiROVMCZAfhJRM57ahLZo6nzy05EDnzutfsIufOXK8BZuoXdPpixZngcOzq
         Ys0vjI1Ky76hldhxMo+Kg6QnixdtyJHxTTYgdr0DbVfLndaLpYiK2SwYVu4IkIFsHQwi
         qHrg==
X-Gm-Message-State: APjAAAX2RryIunFDiHnu2JKZdCgBjNY7PBOOpkAvKgRgDlxEwoDMp5DC
        XqJnU7yAnEavk2CtyVtJhvW8Mg==
X-Google-Smtp-Source: APXvYqzgnxsg02/an86/szepU0/eBu99pCno1jaHpZp1TxShMtqiUL3sghtvZ011igTk/G/RcQs0nA==
X-Received: by 2002:a17:90a:a397:: with SMTP id x23mr2013330pjp.118.1561590964359;
        Wed, 26 Jun 2019 16:16:04 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id e184sm318418pfa.169.2019.06.26.16.16.03
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Jun 2019 16:16:03 -0700 (PDT)
Date:   Wed, 26 Jun 2019 16:16:02 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Casey Schaufler <casey@schaufler-ca.com>
Cc:     casey.schaufler@intel.com, jmorris@namei.org,
        linux-security-module@vger.kernel.org, selinux@vger.kernel.org,
        john.johansen@canonical.com, penguin-kernel@i-love.sakura.ne.jp,
        paul@paul-moore.com, sds@tycho.nsa.gov
Subject: Re: [PATCH v4 19/23] LSM: Use lsmcontext in security_inode_getsecctx
Message-ID: <201906261616.20C95FE30@keescook>
References: <20190626192234.11725-1-casey@schaufler-ca.com>
 <20190626192234.11725-20-casey@schaufler-ca.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190626192234.11725-20-casey@schaufler-ca.com>
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Wed, Jun 26, 2019 at 12:22:30PM -0700, Casey Schaufler wrote:
> Change the security_inode_getsecctx() interface to fill
> a lsmcontext structure instead of data and length pointers.
> This provides the information about which LSM created the
> context so that security_release_secctx() can use the
> correct hook. A lsmcontext is used within kernfs to store
> the security information as well.
> 
> Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-Kees

> ---
>  fs/kernfs/dir.c             |  8 ++------
>  fs/kernfs/inode.c           | 34 ++++++++++++----------------------
>  fs/kernfs/kernfs-internal.h |  3 +--
>  fs/nfsd/nfs4xdr.c           | 23 +++++++++--------------
>  include/linux/security.h    |  5 +++--
>  security/security.c         | 14 ++++++++++++--
>  6 files changed, 39 insertions(+), 48 deletions(-)
> 
> diff --git a/fs/kernfs/dir.c b/fs/kernfs/dir.c
> index 92afad387237..1d000289d8b7 100644
> --- a/fs/kernfs/dir.c
> +++ b/fs/kernfs/dir.c
> @@ -532,12 +532,8 @@ void kernfs_put(struct kernfs_node *kn)
>  	kfree_const(kn->name);
>  
>  	if (kn->iattr) {
> -		struct lsmcontext scaff; /* scaffolding */
> -		if (kn->iattr->ia_secdata) {
> -			lsmcontext_init(&scaff, kn->iattr->ia_secdata,
> -					kn->iattr->ia_secdata_len, 0);
> -			security_release_secctx(&scaff);
> -		}
> +		if (kn->iattr->ia_context.context)
> +			security_release_secctx(&kn->iattr->ia_context);
>  		simple_xattrs_free(&kn->iattr->xattrs);
>  		kmem_cache_free(kernfs_iattrs_cache, kn->iattr);
>  	}
> diff --git a/fs/kernfs/inode.c b/fs/kernfs/inode.c
> index 02cde9dac5ee..ffbf7863306d 100644
> --- a/fs/kernfs/inode.c
> +++ b/fs/kernfs/inode.c
> @@ -135,21 +135,14 @@ int kernfs_iop_setattr(struct dentry *dentry, struct iattr *iattr)
>  	return error;
>  }
>  
> -static int kernfs_node_setsecdata(struct kernfs_iattrs *attrs, void **secdata,
> -				  u32 *secdata_len)
> +static void kernfs_node_setsecdata(struct kernfs_iattrs *attrs,
> +				   struct lsmcontext *cp)
>  {
> -	void *old_secdata;
> -	size_t old_secdata_len;
> +	struct lsmcontext old_context;
>  
> -	old_secdata = attrs->ia_secdata;
> -	old_secdata_len = attrs->ia_secdata_len;
> -
> -	attrs->ia_secdata = *secdata;
> -	attrs->ia_secdata_len = *secdata_len;
> -
> -	*secdata = old_secdata;
> -	*secdata_len = old_secdata_len;
> -	return 0;
> +	old_context = attrs->ia_context;
> +	attrs->ia_context = *cp;
> +	*cp = old_context;
>  }
>  
>  ssize_t kernfs_iop_listxattr(struct dentry *dentry, char *buf, size_t size)
> @@ -192,8 +185,8 @@ static void kernfs_refresh_inode(struct kernfs_node *kn, struct inode *inode)
>  		 * persistent copy in kernfs_node.
>  		 */
>  		set_inode_attr(inode, &attrs->ia_iattr);
> -		security_inode_notifysecctx(inode, attrs->ia_secdata,
> -					    attrs->ia_secdata_len);
> +		security_inode_notifysecctx(inode, attrs->ia_context.context,
> +					    attrs->ia_context.len);
>  	}
>  
>  	if (kernfs_type(kn) == KERNFS_DIR)
> @@ -350,8 +343,6 @@ static int kernfs_security_xattr_set(const struct xattr_handler *handler,
>  	struct kernfs_node *kn = inode->i_private;
>  	struct kernfs_iattrs *attrs;
>  	struct lsmcontext context;
> -	void *secdata;
> -	u32 secdata_len = 0;
>  	int error;
>  
>  	attrs = kernfs_iattrs(kn);
> @@ -361,18 +352,17 @@ static int kernfs_security_xattr_set(const struct xattr_handler *handler,
>  	error = security_inode_setsecurity(inode, suffix, value, size, flags);
>  	if (error)
>  		return error;
> -	error = security_inode_getsecctx(inode, &secdata, &secdata_len);
> +	error = security_inode_getsecctx(inode, &context);
>  	if (error)
>  		return error;
>  
>  	mutex_lock(&kernfs_mutex);
> -	error = kernfs_node_setsecdata(attrs, &secdata, &secdata_len);
> +	kernfs_node_setsecdata(attrs, &context);
>  	mutex_unlock(&kernfs_mutex);
>  
> -	if (secdata) {
> -		lsmcontext_init(&context, secdata, secdata_len, 0);
> +	if (context.context)
>  		security_release_secctx(&context);
> -	}
> +
>  	return error;
>  }
>  
> diff --git a/fs/kernfs/kernfs-internal.h b/fs/kernfs/kernfs-internal.h
> index 0b7d197a904c..844a028d282f 100644
> --- a/fs/kernfs/kernfs-internal.h
> +++ b/fs/kernfs/kernfs-internal.h
> @@ -21,8 +21,7 @@
>  
>  struct kernfs_iattrs {
>  	struct iattr		ia_iattr;
> -	void			*ia_secdata;
> -	u32			ia_secdata_len;
> +	struct lsmcontext	ia_context;
>  
>  	struct simple_xattrs	xattrs;
>  };
> diff --git a/fs/nfsd/nfs4xdr.c b/fs/nfsd/nfs4xdr.c
> index bb3db033e144..1209083565dd 100644
> --- a/fs/nfsd/nfs4xdr.c
> +++ b/fs/nfsd/nfs4xdr.c
> @@ -2304,11 +2304,11 @@ nfsd4_encode_layout_types(struct xdr_stream *xdr, u32 layout_types)
>  #ifdef CONFIG_NFSD_V4_SECURITY_LABEL
>  static inline __be32
>  nfsd4_encode_security_label(struct xdr_stream *xdr, struct svc_rqst *rqstp,
> -			    void *context, int len)
> +			    struct lsmcontext *context)
>  {
>  	__be32 *p;
>  
> -	p = xdr_reserve_space(xdr, len + 4 + 4 + 4);
> +	p = xdr_reserve_space(xdr, context->len + 4 + 4 + 4);
>  	if (!p)
>  		return nfserr_resource;
>  
> @@ -2318,13 +2318,13 @@ nfsd4_encode_security_label(struct xdr_stream *xdr, struct svc_rqst *rqstp,
>  	 */
>  	*p++ = cpu_to_be32(0); /* lfs */
>  	*p++ = cpu_to_be32(0); /* pi */
> -	p = xdr_encode_opaque(p, context, len);
> +	p = xdr_encode_opaque(p, context->context, context->len);
>  	return 0;
>  }
>  #else
>  static inline __be32
>  nfsd4_encode_security_label(struct xdr_stream *xdr, struct svc_rqst *rqstp,
> -			    void *context, int len)
> +			    struct lsmcontext *context)
>  { return 0; }
>  #endif
>  
> @@ -2420,9 +2420,7 @@ nfsd4_encode_fattr(struct xdr_stream *xdr, struct svc_fh *fhp,
>  	__be32 status;
>  	int err;
>  	struct nfs4_acl *acl = NULL;
> -	struct lsmcontext scaff; /* scaffolding */
> -	void *context = NULL;
> -	int contextlen;
> +	struct lsmcontext context;
>  	bool contextsupport = false;
>  	struct nfsd4_compoundres *resp = rqstp->rq_resp;
>  	u32 minorversion = resp->cstate.minorversion;
> @@ -2479,7 +2477,7 @@ nfsd4_encode_fattr(struct xdr_stream *xdr, struct svc_fh *fhp,
>  	     bmval0 & FATTR4_WORD0_SUPPORTED_ATTRS) {
>  		if (exp->ex_flags & NFSEXP_SECURITY_LABEL)
>  			err = security_inode_getsecctx(d_inode(dentry),
> -						&context, &contextlen);
> +						       &context);
>  		else
>  			err = -EOPNOTSUPP;
>  		contextsupport = (err == 0);
> @@ -2908,8 +2906,7 @@ nfsd4_encode_fattr(struct xdr_stream *xdr, struct svc_fh *fhp,
>  	}
>  
>  	if (bmval2 & FATTR4_WORD2_SECURITY_LABEL) {
> -		status = nfsd4_encode_security_label(xdr, rqstp, context,
> -								contextlen);
> +		status = nfsd4_encode_security_label(xdr, rqstp, &context);
>  		if (status)
>  			goto out;
>  	}
> @@ -2920,10 +2917,8 @@ nfsd4_encode_fattr(struct xdr_stream *xdr, struct svc_fh *fhp,
>  
>  out:
>  #ifdef CONFIG_NFSD_V4_SECURITY_LABEL
> -	if (context) {
> -		lsmcontext_init(&scaff, context, contextlen, 0); /*scaffolding*/
> -		security_release_secctx(&scaff);
> -	}
> +	if (context.context)
> +		security_release_secctx(&context);
>  #endif /* CONFIG_NFSD_V4_SECURITY_LABEL */
>  	kfree(acl);
>  	if (tempfh) {
> diff --git a/include/linux/security.h b/include/linux/security.h
> index 2674eb70c2d7..c16aea55be97 100644
> --- a/include/linux/security.h
> +++ b/include/linux/security.h
> @@ -489,7 +489,7 @@ void security_release_secctx(struct lsmcontext *cp);
>  void security_inode_invalidate_secctx(struct inode *inode);
>  int security_inode_notifysecctx(struct inode *inode, void *ctx, u32 ctxlen);
>  int security_inode_setsecctx(struct dentry *dentry, void *ctx, u32 ctxlen);
> -int security_inode_getsecctx(struct inode *inode, void **ctx, u32 *ctxlen);
> +int security_inode_getsecctx(struct inode *inode, struct lsmcontext *cp);
>  #else /* CONFIG_SECURITY */
>  
>  static inline int call_lsm_notifier(enum lsm_event event, void *data)
> @@ -1290,7 +1290,8 @@ static inline int security_inode_setsecctx(struct dentry *dentry, void *ctx, u32
>  {
>  	return -EOPNOTSUPP;
>  }
> -static inline int security_inode_getsecctx(struct inode *inode, void **ctx, u32 *ctxlen)
> +static inline int security_inode_getsecctx(struct inode *inode,
> +					   struct lsmcontext *cp)
>  {
>  	return -EOPNOTSUPP;
>  }
> diff --git a/security/security.c b/security/security.c
> index 61cdc6bcd32e..45b9f905f5c0 100644
> --- a/security/security.c
> +++ b/security/security.c
> @@ -2164,9 +2164,19 @@ int security_inode_setsecctx(struct dentry *dentry, void *ctx, u32 ctxlen)
>  }
>  EXPORT_SYMBOL(security_inode_setsecctx);
>  
> -int security_inode_getsecctx(struct inode *inode, void **ctx, u32 *ctxlen)
> +int security_inode_getsecctx(struct inode *inode, struct lsmcontext *cp)
>  {
> -	return call_int_hook(inode_getsecctx, -EOPNOTSUPP, inode, ctx, ctxlen);
> +	int *display = current->security;
> +	struct security_hook_list *hp;
> +
> +	hlist_for_each_entry(hp, &security_hook_heads.inode_getsecctx, list)
> +		if (*display == LSMBLOB_INVALID ||
> +		    *display == hp->lsmid->slot) {
> +			cp->slot = hp->lsmid->slot;
> +			return hp->hook.inode_getsecctx(inode,
> +					(void **)&cp->context, &cp->len);
> +		}
> +	return -EOPNOTSUPP;
>  }
>  EXPORT_SYMBOL(security_inode_getsecctx);
>  
> -- 
> 2.20.1
> 

-- 
Kees Cook
