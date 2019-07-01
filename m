Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B863F574C2
	for <lists+selinux@lfdr.de>; Thu, 27 Jun 2019 01:14:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726410AbfFZXOU (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Wed, 26 Jun 2019 19:14:20 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:38916 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726385AbfFZXOT (ORCPT
        <rfc822;selinux@vger.kernel.org>); Wed, 26 Jun 2019 19:14:19 -0400
Received: by mail-pl1-f195.google.com with SMTP id b7so164534pls.6
        for <selinux@vger.kernel.org>; Wed, 26 Jun 2019 16:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=HIk29jAYLv2/DOnIw2Cc2ORFvyDC8pZUxXa8kMgTEPs=;
        b=RYAUFGHy4f6nYUOUH0YO6GcXrEmTqG9ktKEo2Br1Nld53UCYzg4O9B/usRxSffbiBo
         WPXdQdvlOLHpLYRVatcQj3fmglYwrjlZCOcoOVI1Iry1S3iconxMUwZlk2eU5nEdKx8d
         90hKhAonNKgKBhGSQSYPbbK+PdO/+Yz2xWFFs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=HIk29jAYLv2/DOnIw2Cc2ORFvyDC8pZUxXa8kMgTEPs=;
        b=OLAk7vqX0c4L1AjmnAqpBgG7vHREmdbpM1mprzYOf5oPIitbOvW3/19+NhcnldhDaC
         7A3+YdOYVYvVE5DbZziWIc+MIgd/z5pAJBUw1W5Al/578avxuXmMbHfrc0z3AWo41IiV
         j8sHkDxGiHafreNdV6QTF+m/PTmU/MXL0MPaQMtuArFIjxWvP5P2lnTJvcjlx100/VvT
         2oNVu43kv4Uh0KChkVOP+1KDN3COqQQkUBKYVI+oo80QqCqcZ1gakPijROhT2TqLAIE5
         3+9Mtk3IlbuDk+pxHjBLNq0bWCiAKtCESTaKOwX1AW+nrvZG0pnIlhiNXsMbMyrG1aGn
         v8HA==
X-Gm-Message-State: APjAAAWeW4YfRCqAw8N2Sx6EkyRsS3Yo+OayusTNusL02A+6GXYQDPHE
        +sFeURnm9RX+YK+36Zgqel1Srg==
X-Google-Smtp-Source: APXvYqxe8g/cKhcNW32ulkT/hbinqtzTnNNOUqHexxoSxdUrqv9OUUUC3rd3GGs6zRxjOWgggQHhwQ==
X-Received: by 2002:a17:902:9a06:: with SMTP id v6mr684856plp.71.1561590858511;
        Wed, 26 Jun 2019 16:14:18 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id m4sm364815pff.108.2019.06.26.16.14.17
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Jun 2019 16:14:17 -0700 (PDT)
Date:   Wed, 26 Jun 2019 16:14:16 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Casey Schaufler <casey@schaufler-ca.com>
Cc:     casey.schaufler@intel.com, jmorris@namei.org,
        linux-security-module@vger.kernel.org, selinux@vger.kernel.org,
        john.johansen@canonical.com, penguin-kernel@i-love.sakura.ne.jp,
        paul@paul-moore.com, sds@tycho.nsa.gov
Subject: Re: [PATCH v4 16/23] LSM: Use lsmcontext in security_secid_to_secctx
Message-ID: <201906261614.625E007B6@keescook>
References: <20190626192234.11725-1-casey@schaufler-ca.com>
 <20190626192234.11725-17-casey@schaufler-ca.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190626192234.11725-17-casey@schaufler-ca.com>
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Wed, Jun 26, 2019 at 12:22:27PM -0700, Casey Schaufler wrote:
> Replace the (secctx,seclen) pointer pair with a single
> lsmcontext pointer to allow return of the LSM identifier
> along with the context and context length. This allows
> security_release_secctx() to know how to release the
> context. Callers have been modified to use or save the
> returned data from the new structure.
> 
> Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-Kees

> ---
>  drivers/android/binder.c                | 10 +++++--
>  fs/kernfs/dir.c                         |  9 ++++--
>  fs/kernfs/inode.c                       |  7 +++--
>  fs/nfs/nfs4proc.c                       |  8 +++--
>  fs/nfsd/nfs4xdr.c                       |  7 +++--
>  include/linux/security.h                | 39 +++++++++++++++++++++++--
>  include/net/scm.h                       |  4 ++-
>  kernel/audit.c                          | 14 ++++++---
>  kernel/auditsc.c                        | 12 ++++++--
>  net/ipv4/ip_sockglue.c                  |  4 ++-
>  net/netfilter/nf_conntrack_netlink.c    |  4 ++-
>  net/netfilter/nf_conntrack_standalone.c |  4 ++-
>  net/netfilter/nfnetlink_queue.c         | 13 ++++++---
>  net/netlabel/netlabel_unlabeled.c       | 19 +++++++++---
>  net/netlabel/netlabel_user.c            |  4 ++-
>  security/security.c                     | 12 ++++----
>  security/smack/smack_lsm.c              | 14 ++++++---
>  17 files changed, 141 insertions(+), 43 deletions(-)
> 
> diff --git a/drivers/android/binder.c b/drivers/android/binder.c
> index 144ac4f1c24f..89e574be34cc 100644
> --- a/drivers/android/binder.c
> +++ b/drivers/android/binder.c
> @@ -2876,6 +2876,7 @@ static void binder_transaction(struct binder_proc *proc,
>  	int t_debug_id = atomic_inc_return(&binder_last_id);
>  	char *secctx = NULL;
>  	u32 secctx_sz = 0;
> +	struct lsmcontext scaff; /* scaffolding */
>  
>  	e = binder_transaction_log_add(&binder_transaction_log);
>  	e->debug_id = t_debug_id;
> @@ -3158,7 +3159,8 @@ static void binder_transaction(struct binder_proc *proc,
>  		binder_alloc_copy_to_buffer(&target_proc->alloc,
>  					    t->buffer, buf_offset,
>  					    secctx, secctx_sz);
> -		security_release_secctx(secctx, secctx_sz);
> +		lsmcontext_init(&scaff, secctx, secctx_sz, 0);
> +		security_release_secctx(&scaff);
>  		secctx = NULL;
>  	}
>  	t->buffer->debug_id = t->debug_id;
> @@ -3479,8 +3481,10 @@ static void binder_transaction(struct binder_proc *proc,
>  	t->buffer->transaction = NULL;
>  	binder_alloc_free_buf(&target_proc->alloc, t->buffer);
>  err_binder_alloc_buf_failed:
> -	if (secctx)
> -		security_release_secctx(secctx, secctx_sz);
> +	if (secctx) {
> +		lsmcontext_init(&scaff, secctx, secctx_sz, 0);
> +		security_release_secctx(&scaff);
> +	}
>  err_get_secctx_failed:
>  	kfree(tcomplete);
>  	binder_stats_deleted(BINDER_STAT_TRANSACTION_COMPLETE);
> diff --git a/fs/kernfs/dir.c b/fs/kernfs/dir.c
> index b84d635567d3..92afad387237 100644
> --- a/fs/kernfs/dir.c
> +++ b/fs/kernfs/dir.c
> @@ -532,9 +532,12 @@ void kernfs_put(struct kernfs_node *kn)
>  	kfree_const(kn->name);
>  
>  	if (kn->iattr) {
> -		if (kn->iattr->ia_secdata)
> -			security_release_secctx(kn->iattr->ia_secdata,
> -						kn->iattr->ia_secdata_len);
> +		struct lsmcontext scaff; /* scaffolding */
> +		if (kn->iattr->ia_secdata) {
> +			lsmcontext_init(&scaff, kn->iattr->ia_secdata,
> +					kn->iattr->ia_secdata_len, 0);
> +			security_release_secctx(&scaff);
> +		}
>  		simple_xattrs_free(&kn->iattr->xattrs);
>  		kmem_cache_free(kernfs_iattrs_cache, kn->iattr);
>  	}
> diff --git a/fs/kernfs/inode.c b/fs/kernfs/inode.c
> index 0c1fd945ce42..02cde9dac5ee 100644
> --- a/fs/kernfs/inode.c
> +++ b/fs/kernfs/inode.c
> @@ -349,6 +349,7 @@ static int kernfs_security_xattr_set(const struct xattr_handler *handler,
>  {
>  	struct kernfs_node *kn = inode->i_private;
>  	struct kernfs_iattrs *attrs;
> +	struct lsmcontext context;
>  	void *secdata;
>  	u32 secdata_len = 0;
>  	int error;
> @@ -368,8 +369,10 @@ static int kernfs_security_xattr_set(const struct xattr_handler *handler,
>  	error = kernfs_node_setsecdata(attrs, &secdata, &secdata_len);
>  	mutex_unlock(&kernfs_mutex);
>  
> -	if (secdata)
> -		security_release_secctx(secdata, secdata_len);
> +	if (secdata) {
> +		lsmcontext_init(&context, secdata, secdata_len, 0);
> +		security_release_secctx(&context);
> +	}
>  	return error;
>  }
>  
> diff --git a/fs/nfs/nfs4proc.c b/fs/nfs/nfs4proc.c
> index 4dbb0ee23432..af1c0db29c39 100644
> --- a/fs/nfs/nfs4proc.c
> +++ b/fs/nfs/nfs4proc.c
> @@ -131,8 +131,12 @@ nfs4_label_init_security(struct inode *dir, struct dentry *dentry,
>  static inline void
>  nfs4_label_release_security(struct nfs4_label *label)
>  {
> -	if (label)
> -		security_release_secctx(label->label, label->len);
> +	struct lsmcontext scaff; /* scaffolding */
> +
> +	if (label) {
> +		lsmcontext_init(&scaff, label->label, label->len, 0);
> +		security_release_secctx(&scaff);
> +	}
>  }
>  static inline u32 *nfs4_bitmask(struct nfs_server *server, struct nfs4_label *label)
>  {
> diff --git a/fs/nfsd/nfs4xdr.c b/fs/nfsd/nfs4xdr.c
> index 3de42a729093..bb3db033e144 100644
> --- a/fs/nfsd/nfs4xdr.c
> +++ b/fs/nfsd/nfs4xdr.c
> @@ -2420,6 +2420,7 @@ nfsd4_encode_fattr(struct xdr_stream *xdr, struct svc_fh *fhp,
>  	__be32 status;
>  	int err;
>  	struct nfs4_acl *acl = NULL;
> +	struct lsmcontext scaff; /* scaffolding */
>  	void *context = NULL;
>  	int contextlen;
>  	bool contextsupport = false;
> @@ -2919,8 +2920,10 @@ nfsd4_encode_fattr(struct xdr_stream *xdr, struct svc_fh *fhp,
>  
>  out:
>  #ifdef CONFIG_NFSD_V4_SECURITY_LABEL
> -	if (context)
> -		security_release_secctx(context, contextlen);
> +	if (context) {
> +		lsmcontext_init(&scaff, context, contextlen, 0); /*scaffolding*/
> +		security_release_secctx(&scaff);
> +	}
>  #endif /* CONFIG_NFSD_V4_SECURITY_LABEL */
>  	kfree(acl);
>  	if (tempfh) {
> diff --git a/include/linux/security.h b/include/linux/security.h
> index d310fa3942ce..046012a7255f 100644
> --- a/include/linux/security.h
> +++ b/include/linux/security.h
> @@ -76,6 +76,41 @@ enum lsm_event {
>  	LSM_POLICY_CHANGE,
>  };
>  
> +/*
> + * A "security context" is the text representation of
> + * the information used by LSMs.
> + * This structure contains the string, its length, and which LSM
> + * it is useful for.
> + */
> +struct lsmcontext {
> +	char	*context;	/* Provided by the module */
> +	u32	len;
> +	int	slot;		/* Identifies the module */
> +};
> +
> +/**
> + * lsmcontext_init - initialize an lsmcontext structure.
> + * @cp: Pointer to the context to initialize
> + * @context: Initial context, or NULL
> + * @size: Size of context, or 0
> + * @slot: Which LSM provided the context
> + *
> + * Fill in the lsmcontext from the provided information.
> + * This is a scaffolding function that will be removed when
> + * lsmcontext integration is complete.
> + */
> +static inline void lsmcontext_init(struct lsmcontext *cp, char *context,
> +				   u32 size, int slot)
> +{
> +	cp->slot = slot;
> +	cp->context = context;
> +
> +	if (context == NULL || size == 0)
> +		cp->len = 0;
> +	else
> +		cp->len = strlen(context);
> +}
> +
>  /*
>   * Data exported by the security modules
>   *
> @@ -449,7 +484,7 @@ int security_ismaclabel(const char *name);
>  int security_secid_to_secctx(struct lsmblob *blob, char **secdata, u32 *seclen);
>  int security_secctx_to_secid(const char *secdata, u32 seclen,
>  			     struct lsmblob *blob);
> -void security_release_secctx(char *secdata, u32 seclen);
> +void security_release_secctx(struct lsmcontext *cp);
>  
>  void security_inode_invalidate_secctx(struct inode *inode);
>  int security_inode_notifysecctx(struct inode *inode, void *ctx, u32 ctxlen);
> @@ -1240,7 +1275,7 @@ static inline int security_secctx_to_secid(const char *secdata,
>  	return -EOPNOTSUPP;
>  }
>  
> -static inline void security_release_secctx(char *secdata, u32 seclen)
> +static inline void security_release_secctx(struct lsmcontext *cp)
>  {
>  }
>  
> diff --git a/include/net/scm.h b/include/net/scm.h
> index 31ae605fcc0a..6c7c3c229e4a 100644
> --- a/include/net/scm.h
> +++ b/include/net/scm.h
> @@ -92,6 +92,7 @@ static __inline__ int scm_send(struct socket *sock, struct msghdr *msg,
>  #ifdef CONFIG_SECURITY_NETWORK
>  static inline void scm_passec(struct socket *sock, struct msghdr *msg, struct scm_cookie *scm)
>  {
> +	struct lsmcontext context;
>  	char *secdata;
>  	u32 seclen;
>  	int err;
> @@ -102,7 +103,8 @@ static inline void scm_passec(struct socket *sock, struct msghdr *msg, struct sc
>  
>  		if (!err) {
>  			put_cmsg(msg, SOL_SOCKET, SCM_SECURITY, seclen, secdata);
> -			security_release_secctx(secdata, seclen);
> +			lsmcontext_init(&context, secdata, seclen, 0);/*scaffolding*/
> +			security_release_secctx(&context);
>  		}
>  	}
>  }
> diff --git a/kernel/audit.c b/kernel/audit.c
> index 1b51e907f131..f844a2a642e6 100644
> --- a/kernel/audit.c
> +++ b/kernel/audit.c
> @@ -1193,6 +1193,7 @@ static int audit_receive_msg(struct sk_buff *skb, struct nlmsghdr *nlh)
>  	struct audit_sig_info   *sig_data;
>  	char			*ctx = NULL;
>  	u32			len;
> +	struct lsmcontext	scaff; /* scaffolding */
>  
>  	err = audit_netlink_ok(skb, msg_type);
>  	if (err)
> @@ -1437,15 +1438,18 @@ static int audit_receive_msg(struct sk_buff *skb, struct nlmsghdr *nlh)
>  		}
>  		sig_data = kmalloc(sizeof(*sig_data) + len, GFP_KERNEL);
>  		if (!sig_data) {
> -			if (lsmblob_is_set(&audit_sig_lsm))
> -				security_release_secctx(ctx, len);
> +			if (lsmblob_is_set(&audit_sig_lsm)) {
> +				lsmcontext_init(&scaff, ctx, len, 0);
> +				security_release_secctx(&scaff);
> +			}
>  			return -ENOMEM;
>  		}
>  		sig_data->uid = from_kuid(&init_user_ns, audit_sig_uid);
>  		sig_data->pid = audit_sig_pid;
>  		if (lsmblob_is_set(&audit_sig_lsm)) {
>  			memcpy(sig_data->ctx, ctx, len);
> -			security_release_secctx(ctx, len);
> +			lsmcontext_init(&scaff, ctx, len, 0);
> +			security_release_secctx(&scaff);
>  		}
>  		audit_send_reply(skb, seq, AUDIT_SIGNAL_INFO, 0, 0,
>  				 sig_data, sizeof(*sig_data) + len);
> @@ -2074,6 +2078,7 @@ int audit_log_task_context(struct audit_buffer *ab)
>  	unsigned len;
>  	int error;
>  	struct lsmblob blob;
> +	struct lsmcontext scaff; /* scaffolding */
>  
>  	security_task_getsecid(current, &blob);
>  	if (!lsmblob_is_set(&blob))
> @@ -2087,7 +2092,8 @@ int audit_log_task_context(struct audit_buffer *ab)
>  	}
>  
>  	audit_log_format(ab, " subj=%s", ctx);
> -	security_release_secctx(ctx, len);
> +	lsmcontext_init(&scaff, ctx, len, 0);
> +	security_release_secctx(&scaff);
>  	return 0;
>  
>  error_path:
> diff --git a/kernel/auditsc.c b/kernel/auditsc.c
> index c7aa39bda5cc..9fab0e7d90c3 100644
> --- a/kernel/auditsc.c
> +++ b/kernel/auditsc.c
> @@ -943,6 +943,7 @@ static int audit_log_pid_context(struct audit_context *context, pid_t pid,
>  				 struct lsmblob *blob, char *comm)
>  {
>  	struct audit_buffer *ab;
> +	struct lsmcontext lsmcxt;
>  	char *ctx = NULL;
>  	u32 len;
>  	int rc = 0;
> @@ -960,7 +961,8 @@ static int audit_log_pid_context(struct audit_context *context, pid_t pid,
>  			rc = 1;
>  		} else {
>  			audit_log_format(ab, " obj=%s", ctx);
> -			security_release_secctx(ctx, len);
> +			lsmcontext_init(&lsmcxt, ctx, len, 0); /*scaffolding*/
> +			security_release_secctx(&lsmcxt);
>  		}
>  	}
>  	audit_log_format(ab, " ocomm=");
> @@ -1172,6 +1174,7 @@ static void audit_log_fcaps(struct audit_buffer *ab, struct audit_names *name)
>  
>  static void show_special(struct audit_context *context, int *call_panic)
>  {
> +	struct lsmcontext lsmcxt;
>  	struct audit_buffer *ab;
>  	int i;
>  
> @@ -1205,7 +1208,8 @@ static void show_special(struct audit_context *context, int *call_panic)
>  				*call_panic = 1;
>  			} else {
>  				audit_log_format(ab, " obj=%s", ctx);
> -				security_release_secctx(ctx, len);
> +				lsmcontext_init(&lsmcxt, ctx, len, 0);
> +				security_release_secctx(&lsmcxt);
>  			}
>  		}
>  		if (context->ipc.has_perm) {
> @@ -1352,6 +1356,7 @@ static void audit_log_name(struct audit_context *context, struct audit_names *n,
>  		char *ctx = NULL;
>  		u32 len;
>  		struct lsmblob blob;
> +		struct lsmcontext lsmcxt;
>  
>  		lsmblob_init(&blob, n->osid);
>  		if (security_secid_to_secctx(&blob, &ctx, &len)) {
> @@ -1360,7 +1365,8 @@ static void audit_log_name(struct audit_context *context, struct audit_names *n,
>  				*call_panic = 2;
>  		} else {
>  			audit_log_format(ab, " obj=%s", ctx);
> -			security_release_secctx(ctx, len);
> +			lsmcontext_init(&lsmcxt, ctx, len, 0); /* scaffolding */
> +			security_release_secctx(&lsmcxt);
>  		}
>  	}
>  
> diff --git a/net/ipv4/ip_sockglue.c b/net/ipv4/ip_sockglue.c
> index e05f4ef68bd8..7834c357b60b 100644
> --- a/net/ipv4/ip_sockglue.c
> +++ b/net/ipv4/ip_sockglue.c
> @@ -130,6 +130,7 @@ static void ip_cmsg_recv_checksum(struct msghdr *msg, struct sk_buff *skb,
>  
>  static void ip_cmsg_recv_security(struct msghdr *msg, struct sk_buff *skb)
>  {
> +	struct lsmcontext context;
>  	struct lsmblob lb;
>  	char *secdata;
>  	u32 seclen;
> @@ -144,7 +145,8 @@ static void ip_cmsg_recv_security(struct msghdr *msg, struct sk_buff *skb)
>  		return;
>  
>  	put_cmsg(msg, SOL_IP, SCM_SECURITY, seclen, secdata);
> -	security_release_secctx(secdata, seclen);
> +	lsmcontext_init(&context, secdata, seclen, 0); /* scaffolding */
> +	security_release_secctx(&context);
>  }
>  
>  static void ip_cmsg_recv_dstaddr(struct msghdr *msg, struct sk_buff *skb)
> diff --git a/net/netfilter/nf_conntrack_netlink.c b/net/netfilter/nf_conntrack_netlink.c
> index ca0968f13240..6954e6600583 100644
> --- a/net/netfilter/nf_conntrack_netlink.c
> +++ b/net/netfilter/nf_conntrack_netlink.c
> @@ -331,6 +331,7 @@ static int ctnetlink_dump_secctx(struct sk_buff *skb, const struct nf_conn *ct)
>  	int len, ret;
>  	char *secctx;
>  	struct lsmblob blob;
> +	struct lsmcontext context;
>  
>  	lsmblob_init(&blob, ct->secmark);
>  	ret = security_secid_to_secctx(&blob, &secctx, &len);
> @@ -348,7 +349,8 @@ static int ctnetlink_dump_secctx(struct sk_buff *skb, const struct nf_conn *ct)
>  
>  	ret = 0;
>  nla_put_failure:
> -	security_release_secctx(secctx, len);
> +	lsmcontext_init(&context, secctx, len, 0); /* scaffolding */
> +	security_release_secctx(&context);
>  	return ret;
>  }
>  #else
> diff --git a/net/netfilter/nf_conntrack_standalone.c b/net/netfilter/nf_conntrack_standalone.c
> index c793103f3cd7..79158ad0486e 100644
> --- a/net/netfilter/nf_conntrack_standalone.c
> +++ b/net/netfilter/nf_conntrack_standalone.c
> @@ -176,6 +176,7 @@ static void ct_show_secctx(struct seq_file *s, const struct nf_conn *ct)
>  	u32 len;
>  	char *secctx;
>  	struct lsmblob blob;
> +	struct lsmcontext context;
>  
>  	lsmblob_init(&blob, ct->secmark);
>  	ret = security_secid_to_secctx(&blob, &secctx, &len);
> @@ -184,7 +185,8 @@ static void ct_show_secctx(struct seq_file *s, const struct nf_conn *ct)
>  
>  	seq_printf(s, "secctx=%s ", secctx);
>  
> -	security_release_secctx(secctx, len);
> +	lsmcontext_init(&context, secctx, len, 0); /* scaffolding */
> +	security_release_secctx(&context);
>  }
>  #else
>  static inline void ct_show_secctx(struct seq_file *s, const struct nf_conn *ct)
> diff --git a/net/netfilter/nfnetlink_queue.c b/net/netfilter/nfnetlink_queue.c
> index 59211bff90ab..fe8403ef4e89 100644
> --- a/net/netfilter/nfnetlink_queue.c
> +++ b/net/netfilter/nfnetlink_queue.c
> @@ -399,6 +399,7 @@ nfqnl_build_packet_message(struct net *net, struct nfqnl_instance *queue,
>  	enum ip_conntrack_info uninitialized_var(ctinfo);
>  	struct nfnl_ct_hook *nfnl_ct;
>  	bool csum_verify;
> +	struct lsmcontext scaff; /* scaffolding */
>  	char *secdata = NULL;
>  	u32 seclen = 0;
>  
> @@ -629,8 +630,10 @@ nfqnl_build_packet_message(struct net *net, struct nfqnl_instance *queue,
>  	}
>  
>  	nlh->nlmsg_len = skb->len;
> -	if (seclen)
> -		security_release_secctx(secdata, seclen);
> +	if (seclen) {
> +		lsmcontext_init(&scaff, secdata, seclen, 0);
> +		security_release_secctx(&scaff);
> +	}
>  	return skb;
>  
>  nla_put_failure:
> @@ -638,8 +641,10 @@ nfqnl_build_packet_message(struct net *net, struct nfqnl_instance *queue,
>  	kfree_skb(skb);
>  	net_err_ratelimited("nf_queue: error creating packet message\n");
>  nlmsg_failure:
> -	if (seclen)
> -		security_release_secctx(secdata, seclen);
> +	if (seclen) {
> +		lsmcontext_init(&scaff, secdata, seclen, 0);
> +		security_release_secctx(&scaff);
> +	}
>  	return NULL;
>  }
>  
> diff --git a/net/netlabel/netlabel_unlabeled.c b/net/netlabel/netlabel_unlabeled.c
> index 2294aa9471e6..15b1945853be 100644
> --- a/net/netlabel/netlabel_unlabeled.c
> +++ b/net/netlabel/netlabel_unlabeled.c
> @@ -387,6 +387,7 @@ int netlbl_unlhsh_add(struct net *net,
>  	struct net_device *dev;
>  	struct netlbl_unlhsh_iface *iface;
>  	struct audit_buffer *audit_buf = NULL;
> +	struct lsmcontext context;
>  	char *secctx = NULL;
>  	u32 secctx_len;
>  	struct lsmblob blob;
> @@ -457,7 +458,9 @@ int netlbl_unlhsh_add(struct net *net,
>  					     &secctx,
>  					     &secctx_len) == 0) {
>  			audit_log_format(audit_buf, " sec_obj=%s", secctx);
> -			security_release_secctx(secctx, secctx_len);
> +			/* scaffolding */
> +			lsmcontext_init(&context, secctx, secctx_len, 0);
> +			security_release_secctx(&context);
>  		}
>  		audit_log_format(audit_buf, " res=%u", ret_val == 0 ? 1 : 0);
>  		audit_log_end(audit_buf);
> @@ -488,6 +491,7 @@ static int netlbl_unlhsh_remove_addr4(struct net *net,
>  	struct netlbl_unlhsh_addr4 *entry;
>  	struct audit_buffer *audit_buf;
>  	struct net_device *dev;
> +	struct lsmcontext context;
>  	char *secctx;
>  	u32 secctx_len;
>  	struct lsmblob blob;
> @@ -516,7 +520,9 @@ static int netlbl_unlhsh_remove_addr4(struct net *net,
>  		    security_secid_to_secctx(&blob,
>  					     &secctx, &secctx_len) == 0) {
>  			audit_log_format(audit_buf, " sec_obj=%s", secctx);
> -			security_release_secctx(secctx, secctx_len);
> +			/* scaffolding */
> +			lsmcontext_init(&context, secctx, secctx_len, 0);
> +			security_release_secctx(&context);
>  		}
>  		audit_log_format(audit_buf, " res=%u", entry != NULL ? 1 : 0);
>  		audit_log_end(audit_buf);
> @@ -553,6 +559,7 @@ static int netlbl_unlhsh_remove_addr6(struct net *net,
>  	struct netlbl_unlhsh_addr6 *entry;
>  	struct audit_buffer *audit_buf;
>  	struct net_device *dev;
> +	struct lsmcontext context;
>  	char *secctx;
>  	u32 secctx_len;
>  	struct lsmblob blob;
> @@ -580,7 +587,8 @@ static int netlbl_unlhsh_remove_addr6(struct net *net,
>  		    security_secid_to_secctx(&blob,
>  					     &secctx, &secctx_len) == 0) {
>  			audit_log_format(audit_buf, " sec_obj=%s", secctx);
> -			security_release_secctx(secctx, secctx_len);
> +			lsmcontext_init(&context, secctx, secctx_len, 0);
> +			security_release_secctx(&context);
>  		}
>  		audit_log_format(audit_buf, " res=%u", entry != NULL ? 1 : 0);
>  		audit_log_end(audit_buf);
> @@ -1094,6 +1102,7 @@ static int netlbl_unlabel_staticlist_gen(u32 cmd,
>  	int ret_val = -ENOMEM;
>  	struct netlbl_unlhsh_walk_arg *cb_arg = arg;
>  	struct net_device *dev;
> +	struct lsmcontext context;
>  	void *data;
>  	u32 secid;
>  	char *secctx;
> @@ -1161,7 +1170,9 @@ static int netlbl_unlabel_staticlist_gen(u32 cmd,
>  			  NLBL_UNLABEL_A_SECCTX,
>  			  secctx_len,
>  			  secctx);
> -	security_release_secctx(secctx, secctx_len);
> +	/* scaffolding */
> +	lsmcontext_init(&context, secctx, secctx_len, 0);
> +	security_release_secctx(&context);
>  	if (ret_val != 0)
>  		goto list_cb_failure;
>  
> diff --git a/net/netlabel/netlabel_user.c b/net/netlabel/netlabel_user.c
> index 2ccc6567e2a2..94aea4985b74 100644
> --- a/net/netlabel/netlabel_user.c
> +++ b/net/netlabel/netlabel_user.c
> @@ -98,6 +98,7 @@ struct audit_buffer *netlbl_audit_start_common(int type,
>  					       struct netlbl_audit *audit_info)
>  {
>  	struct audit_buffer *audit_buf;
> +	struct lsmcontext context;
>  	char *secctx;
>  	u32 secctx_len;
>  	struct lsmblob blob;
> @@ -117,7 +118,8 @@ struct audit_buffer *netlbl_audit_start_common(int type,
>  	if (audit_info->secid != 0 &&
>  	    security_secid_to_secctx(&blob, &secctx, &secctx_len) == 0) {
>  		audit_log_format(audit_buf, " subj=%s", secctx);
> -		security_release_secctx(secctx, secctx_len);
> +		lsmcontext_init(&context, secctx, secctx_len, 0);/*scaffolding*/
> +		security_release_secctx(&context);
>  	}
>  
>  	return audit_buf;
> diff --git a/security/security.c b/security/security.c
> index 82e29c477fa4..3563b1e2f8f9 100644
> --- a/security/security.c
> +++ b/security/security.c
> @@ -2116,17 +2116,19 @@ int security_secctx_to_secid(const char *secdata, u32 seclen,
>  }
>  EXPORT_SYMBOL(security_secctx_to_secid);
>  
> -void security_release_secctx(char *secdata, u32 seclen)
> +void security_release_secctx(struct lsmcontext *cp)
>  {
>  	struct security_hook_list *hp;
> -	int *display = current->security;
>  
>  	hlist_for_each_entry(hp, &security_hook_heads.release_secctx, list)
> -		if (*display == LSMBLOB_INVALID ||
> -		    *display == hp->lsmid->slot) {
> -			hp->hook.release_secctx(secdata, seclen);
> +		if (cp->slot == hp->lsmid->slot) {
> +			hp->hook.release_secctx(cp->context, cp->len);
> +			memset(cp, 0, sizeof(*cp));
>  			return;
>  		}
> +
> +	pr_warn("%s context \"%s\" from slot %d not released\n", __func__,
> +		cp->context, cp->slot);
>  }
>  EXPORT_SYMBOL(security_release_secctx);
>  
> diff --git a/security/smack/smack_lsm.c b/security/smack/smack_lsm.c
> index ad646b865295..3d571c438dfa 100644
> --- a/security/smack/smack_lsm.c
> +++ b/security/smack/smack_lsm.c
> @@ -4439,11 +4439,16 @@ static int smack_secctx_to_secid(const char *secdata, u32 seclen, u32 *secid)
>  	return 0;
>  }
>  
> -/*
> - * There used to be a smack_release_secctx hook
> - * that did nothing back when hooks were in a vector.
> - * Now that there's a list such a hook adds cost.
> +/**
> + * smack_release_secctx - do everything necessary to free a context
> + * @secdata: Unused
> + * @seclen: Unused
> + *
> + * Do nothing but hold a slot in the hooks list.
>   */
> +static void smack_release_secctx(char *secdata, u32 seclen)
> +{
> +}
>  
>  static int smack_inode_notifysecctx(struct inode *inode, void *ctx, u32 ctxlen)
>  {
> @@ -4685,6 +4690,7 @@ static struct security_hook_list smack_hooks[] __lsm_ro_after_init = {
>  	LSM_HOOK_INIT(ismaclabel, smack_ismaclabel),
>  	LSM_HOOK_INIT(secid_to_secctx, smack_secid_to_secctx),
>  	LSM_HOOK_INIT(secctx_to_secid, smack_secctx_to_secid),
> +	LSM_HOOK_INIT(release_secctx, smack_release_secctx),
>  	LSM_HOOK_INIT(inode_notifysecctx, smack_inode_notifysecctx),
>  	LSM_HOOK_INIT(inode_setsecctx, smack_inode_setsecctx),
>  	LSM_HOOK_INIT(inode_getsecctx, smack_inode_getsecctx),
> -- 
> 2.20.1
> 

-- 
Kees Cook
