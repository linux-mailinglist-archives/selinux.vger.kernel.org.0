Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BD7CA574C8
	for <lists+selinux@lfdr.de>; Thu, 27 Jun 2019 01:15:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726572AbfFZXPm (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Wed, 26 Jun 2019 19:15:42 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:40046 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726463AbfFZXPj (ORCPT
        <rfc822;selinux@vger.kernel.org>); Wed, 26 Jun 2019 19:15:39 -0400
Received: by mail-pf1-f194.google.com with SMTP id p184so204869pfp.7
        for <selinux@vger.kernel.org>; Wed, 26 Jun 2019 16:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Nx+2hMKi33zgPVOV9Lljhp8sACpM6I9yYB8sR8COkAc=;
        b=d3dJBDzTYnRbhpYcHobg9vk1MoC4EKKMOL2Gz3esn0f3WzNpyt4ln0xY06tEELhDON
         CHiZZS/cBltfmGGARCGXUB7zb75rw5KcqSfhGdO/xK8a2AZWRvqCrNGYzhikZ+stdp19
         G5RLmAWT5MYvultN0y4V8aOcqMSwdRlI1tMWA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Nx+2hMKi33zgPVOV9Lljhp8sACpM6I9yYB8sR8COkAc=;
        b=Q3lXZKhMQO5Ncwu0vNL2udLON7bJLHPWBLGBvpadmNrbdmWlwhRw6KJkL8Il/cHvoW
         T9D2rtqvQxM/+1C//kq4urbu66iOC5M5AKV+cAqcGpe3gJjmSwznSnuLkBBaqcZ4oHDV
         S2TQe9+FtjeDVVZfEq3tEU3WkCXOlZVkAp0f3zfHd5QbHgR2Xv8Xf7wWOIJqosJAD7e/
         R82/bTcmSzk3sMOr19QvmTPas2iYiAb6RFfLegAc3eURngeLuzFjVSlw7AH/CZPB6rMs
         mDHCnlkoP94XB0pj3rm5xOariwgbUtRzZ0kXN6FXbMgyhNxE66/gmjEk2D/cJg5oIChk
         hXyA==
X-Gm-Message-State: APjAAAWJ4Q6knj+DRpkPuSADolnliaFYZD8rKEIlfyeQtA73QdutJPCM
        /v7JcvcJhLItOBSZH8NwOtW21Q==
X-Google-Smtp-Source: APXvYqw8YgNFkAPq3/y6g0w+sITEbnR0FBXx0pMSWp6PSuKdswBRva458eAbcr5/fyIFFeol6BIrkA==
X-Received: by 2002:a17:90a:950d:: with SMTP id t13mr1918636pjo.81.1561590938640;
        Wed, 26 Jun 2019 16:15:38 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id a3sm328847pfo.49.2019.06.26.16.15.37
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Jun 2019 16:15:37 -0700 (PDT)
Date:   Wed, 26 Jun 2019 16:15:37 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Casey Schaufler <casey@schaufler-ca.com>
Cc:     casey.schaufler@intel.com, jmorris@namei.org,
        linux-security-module@vger.kernel.org, selinux@vger.kernel.org,
        john.johansen@canonical.com, penguin-kernel@i-love.sakura.ne.jp,
        paul@paul-moore.com, sds@tycho.nsa.gov
Subject: Re: [PATCH v4 18/23] LSM: Use lsmcontext in
 security_dentry_init_security
Message-ID: <201906261615.409EF70A10@keescook>
References: <20190626192234.11725-1-casey@schaufler-ca.com>
 <20190626192234.11725-19-casey@schaufler-ca.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190626192234.11725-19-casey@schaufler-ca.com>
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Wed, Jun 26, 2019 at 12:22:29PM -0700, Casey Schaufler wrote:
> Change the security_dentry_init_security() interface to
> fill an lsmcontext structure instead of a void * data area
> and a length. The lone caller of this interface is NFS4,
> which may make copies of the data using its own mechanisms.
> A rework of the nfs4 code to use the lsmcontext properly
> is a significant project, so the coward's way out is taken,
> and the lsmcontext data from security_dentry_init_security()
> is copied, then released directly.
> 
> Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-Kees

> ---
>  fs/nfs/nfs4proc.c        | 26 ++++++++++++++++----------
>  include/linux/security.h |  7 +++----
>  security/security.c      | 19 +++++++++++++++----
>  3 files changed, 34 insertions(+), 18 deletions(-)
> 
> diff --git a/fs/nfs/nfs4proc.c b/fs/nfs/nfs4proc.c
> index af1c0db29c39..952f805965bb 100644
> --- a/fs/nfs/nfs4proc.c
> +++ b/fs/nfs/nfs4proc.c
> @@ -113,6 +113,7 @@ static inline struct nfs4_label *
>  nfs4_label_init_security(struct inode *dir, struct dentry *dentry,
>  	struct iattr *sattr, struct nfs4_label *label)
>  {
> +	struct lsmcontext context;
>  	int err;
>  
>  	if (label == NULL)
> @@ -122,21 +123,26 @@ nfs4_label_init_security(struct inode *dir, struct dentry *dentry,
>  		return NULL;
>  
>  	err = security_dentry_init_security(dentry, sattr->ia_mode,
> -				&dentry->d_name, (void **)&label->label, &label->len);
> -	if (err == 0)
> -		return label;
> +					    &dentry->d_name, &context);
> +
> +	if (err)
> +		return NULL;
> +
> +	label->label = kmemdup(context.context, context.len, GFP_KERNEL);
> +	if (label->label == NULL)
> +		label = NULL;
> +	else
> +		label->len = context.len;
> +
> +	security_release_secctx(&context);
> +
> +	return label;
>  
> -	return NULL;
>  }
>  static inline void
>  nfs4_label_release_security(struct nfs4_label *label)
>  {
> -	struct lsmcontext scaff; /* scaffolding */
> -
> -	if (label) {
> -		lsmcontext_init(&scaff, label->label, label->len, 0);
> -		security_release_secctx(&scaff);
> -	}
> +	kfree(label->label);
>  }
>  static inline u32 *nfs4_bitmask(struct nfs_server *server, struct nfs4_label *label)
>  {
> diff --git a/include/linux/security.h b/include/linux/security.h
> index 7255825aa697..2674eb70c2d7 100644
> --- a/include/linux/security.h
> +++ b/include/linux/security.h
> @@ -352,8 +352,8 @@ int security_sb_clone_mnt_opts(const struct super_block *oldsb,
>  int security_add_mnt_opt(const char *option, const char *val,
>  				int len, void **mnt_opts);
>  int security_dentry_init_security(struct dentry *dentry, int mode,
> -					const struct qstr *name, void **ctx,
> -					u32 *ctxlen);
> +					const struct qstr *name,
> +					struct lsmcontext *ctx);
>  int security_dentry_create_files_as(struct dentry *dentry, int mode,
>  					struct qstr *name,
>  					const struct cred *old,
> @@ -724,8 +724,7 @@ static inline void security_inode_free(struct inode *inode)
>  static inline int security_dentry_init_security(struct dentry *dentry,
>  						 int mode,
>  						 const struct qstr *name,
> -						 void **ctx,
> -						 u32 *ctxlen)
> +						 struct lsmcontext *ctx)
>  {
>  	return -EOPNOTSUPP;
>  }
> diff --git a/security/security.c b/security/security.c
> index 97b468f6e6a9..61cdc6bcd32e 100644
> --- a/security/security.c
> +++ b/security/security.c
> @@ -1024,11 +1024,22 @@ void security_inode_free(struct inode *inode)
>  }
>  
>  int security_dentry_init_security(struct dentry *dentry, int mode,
> -					const struct qstr *name, void **ctx,
> -					u32 *ctxlen)
> +				  const struct qstr *name,
> +				  struct lsmcontext *cp)
>  {
> -	return call_int_hook(dentry_init_security, -EOPNOTSUPP, dentry, mode,
> -				name, ctx, ctxlen);
> +	int *display = current->security;
> +	struct security_hook_list *hp;
> +
> +	hlist_for_each_entry(hp, &security_hook_heads.dentry_init_security,
> +			     list)
> +		if (*display == LSMBLOB_INVALID ||
> +		    *display == hp->lsmid->slot) {
> +			cp->slot = hp->lsmid->slot;
> +			return hp->hook.dentry_init_security(dentry, mode,
> +					name, (void **)&cp->context, &cp->len);
> +		}
> +
> +	return -EOPNOTSUPP;
>  }
>  EXPORT_SYMBOL(security_dentry_init_security);
>  
> -- 
> 2.20.1
> 

-- 
Kees Cook
