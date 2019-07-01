Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4CFB951D4B
	for <lists+selinux@lfdr.de>; Mon, 24 Jun 2019 23:46:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729597AbfFXVqd (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Mon, 24 Jun 2019 17:46:33 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:54007 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727855AbfFXVqc (ORCPT
        <rfc822;selinux@vger.kernel.org>); Mon, 24 Jun 2019 17:46:32 -0400
Received: from static-50-53-46-226.bvtn.or.frontiernet.net ([50.53.46.226] helo=[192.168.192.153])
        by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_128_CBC_SHA1:16)
        (Exim 4.76)
        (envelope-from <john.johansen@canonical.com>)
        id 1hfWnB-0006AE-0R; Mon, 24 Jun 2019 21:46:25 +0000
From:   John Johansen <john.johansen@canonical.com>
Subject: [PATCH v3 16/24] LSM: Ensure the correct LSM context releaser
To:     Casey Schaufler <casey@schaufler-ca.com>,
        casey.schaufler@intel.com, jmorris@namei.org,
        linux-security-module@vger.kernel.org, selinux@vger.kernel.org
Cc:     keescook@chromium.org, penguin-kernel@i-love.sakura.ne.jp,
        paul@paul-moore.com, sds@tycho.nsa.gov
References: <20190621185233.6766-1-casey@schaufler-ca.com>
 <20190621185233.6766-17-casey@schaufler-ca.com>
Openpgp: preference=signencrypt
Autocrypt: addr=john.johansen@canonical.com; prefer-encrypt=mutual; keydata=
 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
Organization: Canonical
Message-ID: <fc6fb376-d61f-38ac-5a7d-888b64dc262e@canonical.com>
Date:   Mon, 24 Jun 2019 14:46:20 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190621185233.6766-17-casey@schaufler-ca.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On 6/21/19 11:52 AM, Casey Schaufler wrote:
> Add a new lsmcontext data structure to hold all the information
> about a "security context", including the string, its size and
> which LSM allocated the string. The allocation information is
> necessary because LSMs have different policies regarding the
> lifecycle of these strings. SELinux allocates and destroys
> them on each use, whereas Smack provides a pointer to an entry
> in a list that never goes away.
> 
> Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>

Reviewed-by: John Johansen <john.johansen@canonical.com>


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
>  security/security.c                     | 12 +++++---
>  security/smack/smack_lsm.c              | 14 ++++++---
>  17 files changed, 142 insertions(+), 42 deletions(-)
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
> index c712fc72b7bd..ddf6d7cb23f1 100644
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
>   */
> @@ -445,7 +480,7 @@ int security_ismaclabel(const char *name);
>  int security_secid_to_secctx(struct lsmblob *blob, char **secdata, u32 *seclen);
>  int security_secctx_to_secid(const char *secdata, u32 seclen,
>  			     struct lsmblob *blob);
> -void security_release_secctx(char *secdata, u32 seclen);
> +void security_release_secctx(struct lsmcontext *cp);
>  
>  void security_inode_invalidate_secctx(struct inode *inode);
>  int security_inode_notifysecctx(struct inode *inode, void *ctx, u32 ctxlen);
> @@ -1236,7 +1271,7 @@ static inline int security_secctx_to_secid(const char *secdata,
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
> index 92c5aa427b53..d5f173e85393 100644
> --- a/security/security.c
> +++ b/security/security.c
> @@ -460,6 +460,7 @@ void __init security_add_hooks(struct security_hook_list *hooks, int count,
>  		    hooks[i].head == &security_hook_heads.setprocattr ||
>  		    hooks[i].head == &security_hook_heads.secctx_to_secid ||
>  		    hooks[i].head == &security_hook_heads.secid_to_secctx ||
> +		    hooks[i].head == &security_hook_heads.release_secctx ||
>  		    hooks[i].head == &security_hook_heads.ipc_getsecid ||
>  		    hooks[i].head == &security_hook_heads.task_getsecid ||
>  		    hooks[i].head == &security_hook_heads.inode_getsecid ||
> @@ -2091,16 +2092,19 @@ int security_secctx_to_secid(const char *secdata, u32 seclen,
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
> -		if (*display == LSMBLOB_INVALID || *display == hp->slot) {
> -			hp->hook.release_secctx(secdata, seclen);
> +		if (cp->slot == hp->slot) {
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
> index e9560b078efe..3834b751d1e9 100644
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
> @@ -4683,6 +4688,7 @@ static struct security_hook_list smack_hooks[] __lsm_ro_after_init = {
>  	LSM_HOOK_INIT(ismaclabel, smack_ismaclabel),
>  	LSM_HOOK_INIT(secid_to_secctx, smack_secid_to_secctx),
>  	LSM_HOOK_INIT(secctx_to_secid, smack_secctx_to_secid),
> +	LSM_HOOK_INIT(release_secctx, smack_release_secctx),
>  	LSM_HOOK_INIT(inode_notifysecctx, smack_inode_notifysecctx),
>  	LSM_HOOK_INIT(inode_setsecctx, smack_inode_setsecctx),
>  	LSM_HOOK_INIT(inode_getsecctx, smack_inode_getsecctx),
> 



