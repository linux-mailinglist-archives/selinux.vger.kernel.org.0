Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 836D44F8B6
	for <lists+selinux@lfdr.de>; Sun, 23 Jun 2019 00:44:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726362AbfFVWok (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Sat, 22 Jun 2019 18:44:40 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:36366 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726339AbfFVWoj (ORCPT
        <rfc822;selinux@vger.kernel.org>); Sat, 22 Jun 2019 18:44:39 -0400
Received: by mail-pl1-f196.google.com with SMTP id k8so4766783plt.3
        for <selinux@vger.kernel.org>; Sat, 22 Jun 2019 15:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=2wGDXbJFPimmnjwaN8WBd0dz9bkF8Bkro/STdBABjOo=;
        b=oPiDdU1weI9CbvZR6HK+nhzzSEBTOaI+uJBg7ZyKfiGy/djG3QQ4pE+ebGcWVaWOL6
         7kMlPZeugPPp9bCGJ0mG2uqO4u2DAItYdg6OxvMOlSW1cEx2MuOfBcYaiKw4KcCB1SOu
         uryCy5ikdbQyi5ZUJYgwoAv1NVfDeGKV0skBA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=2wGDXbJFPimmnjwaN8WBd0dz9bkF8Bkro/STdBABjOo=;
        b=sZ747Ybp/VSIZHA53lJnlmdsrZ4/kQJ857i57vgqVT/8qbuo5kvP1tX1HUs6hDljRk
         0VZvqDXKDLBINtTdiCbTUuJr9T3VRYU3gjuhuq+VlkE0IRXa0C08wBdLP3y0T44h2D8o
         pb/eX0L2hvcJ04da6+UF1t3kn4ggOkzlh22rM85Eyui6ybpJPHWPMcj89ktH8A1YdlvJ
         KNAoQQwB13/YH2WIG+Mhp1eP7aXpU07e/7crY7CrZuGA+XnY2nZEIo9TlYJsfvdKV+HZ
         U3WueWwvMlAGEdEyRQx2A2tF8vv39VNO/Qd6nu8vj0yiffZPB8VMq3LqWW0P98PXoqzD
         ruHg==
X-Gm-Message-State: APjAAAVPApBC+yBqEJYUzY+kKH/e7UzqtzQDTr9CF7Riuv52eAGIyoxZ
        zSDFl848ZXJF5Fr55nN74+5aBQ==
X-Google-Smtp-Source: APXvYqxrBRhXxpp/5RSGPYSiQDdF8VGngn0Uj0/PC6BaKc1i8kDSV9/I9oBQUezZUJDCiwtm/NlL9w==
X-Received: by 2002:a17:902:be0a:: with SMTP id r10mr15602835pls.51.1561243478993;
        Sat, 22 Jun 2019 15:44:38 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id 30sm20228917pjk.17.2019.06.22.15.44.37
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 22 Jun 2019 15:44:38 -0700 (PDT)
Date:   Sat, 22 Jun 2019 15:44:37 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Casey Schaufler <casey@schaufler-ca.com>
Cc:     casey.schaufler@intel.com, jmorris@namei.org,
        linux-security-module@vger.kernel.org, selinux@vger.kernel.org,
        john.johansen@canonical.com, penguin-kernel@i-love.sakura.ne.jp,
        paul@paul-moore.com, sds@tycho.nsa.gov
Subject: Re: [PATCH v3 09/24] LSM: Use lsmblob in security_secid_to_secctx
Message-ID: <201906221544.28B377D0@keescook>
References: <20190621185233.6766-1-casey@schaufler-ca.com>
 <20190621185233.6766-10-casey@schaufler-ca.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190621185233.6766-10-casey@schaufler-ca.com>
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Fri, Jun 21, 2019 at 11:52:18AM -0700, Casey Schaufler wrote:
> Change security_secid_to_secctx() to take a lsmblob as input
> instead of a u32 secid. It will then call the LSM hooks
> using the lsmblob element allocated for that module. The
> callers have been updated as well. This allows for the
> possibility that more than one module may called upon
> to translate a secid to a string, as can occur in the
> audit code.
> 
> Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-Kees

> ---
>  drivers/android/binder.c                |  4 +++-
>  include/linux/security.h                |  5 +++--
>  include/net/scm.h                       |  5 ++---
>  kernel/audit.c                          |  9 +++++++--
>  kernel/auditsc.c                        | 14 ++++++++++----
>  net/ipv4/ip_sockglue.c                  |  3 +--
>  net/netfilter/nf_conntrack_netlink.c    |  8 ++++++--
>  net/netfilter/nf_conntrack_standalone.c |  4 +++-
>  net/netfilter/nfnetlink_queue.c         |  8 ++++++--
>  net/netlabel/netlabel_unlabeled.c       | 18 ++++++++++++++----
>  net/netlabel/netlabel_user.c            |  6 +++---
>  security/security.c                     | 14 +++++++++++---
>  12 files changed, 69 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/android/binder.c b/drivers/android/binder.c
> index 8685882da64c..1962f6b8abd0 100644
> --- a/drivers/android/binder.c
> +++ b/drivers/android/binder.c
> @@ -3120,9 +3120,11 @@ static void binder_transaction(struct binder_proc *proc,
>  
>  	if (target_node && target_node->txn_security_ctx) {
>  		u32 secid;
> +		struct lsmblob blob;
>  
>  		security_task_getsecid(proc->tsk, &secid);
> -		ret = security_secid_to_secctx(secid, &secctx, &secctx_sz);
> +		lsmblob_init(&blob, secid);
> +		ret = security_secid_to_secctx(&blob, &secctx, &secctx_sz);
>  		if (ret) {
>  			return_error = BR_FAILED_REPLY;
>  			return_error_param = ret;
> diff --git a/include/linux/security.h b/include/linux/security.h
> index b0395d224c43..c6cddeff8a17 100644
> --- a/include/linux/security.h
> +++ b/include/linux/security.h
> @@ -442,7 +442,7 @@ int security_setprocattr(const char *lsm, const char *name, void *value,
>  			 size_t size);
>  int security_netlink_send(struct sock *sk, struct sk_buff *skb);
>  int security_ismaclabel(const char *name);
> -int security_secid_to_secctx(u32 secid, char **secdata, u32 *seclen);
> +int security_secid_to_secctx(struct lsmblob *blob, char **secdata, u32 *seclen);
>  int security_secctx_to_secid(const char *secdata, u32 seclen,
>  			     struct lsmblob *blob);
>  void security_release_secctx(char *secdata, u32 seclen);
> @@ -1220,7 +1220,8 @@ static inline int security_ismaclabel(const char *name)
>  	return 0;
>  }
>  
> -static inline int security_secid_to_secctx(u32 secid, char **secdata, u32 *seclen)
> +static inline int security_secid_to_secctx(struct lsmblob *blob,
> +					   char **secdata, u32 *seclen)
>  {
>  	return -EOPNOTSUPP;
>  }
> diff --git a/include/net/scm.h b/include/net/scm.h
> index e2e71c4bf9d0..31ae605fcc0a 100644
> --- a/include/net/scm.h
> +++ b/include/net/scm.h
> @@ -97,9 +97,8 @@ static inline void scm_passec(struct socket *sock, struct msghdr *msg, struct sc
>  	int err;
>  
>  	if (test_bit(SOCK_PASSSEC, &sock->flags)) {
> -		/* Scaffolding - it has to be element 0 for now */
> -		err = security_secid_to_secctx(scm->lsmblob.secid[0],
> -					       &secdata, &seclen);
> +		err = security_secid_to_secctx(&scm->lsmblob, &secdata,
> +					       &seclen);
>  
>  		if (!err) {
>  			put_cmsg(msg, SOL_SOCKET, SCM_SECURITY, seclen, secdata);
> diff --git a/kernel/audit.c b/kernel/audit.c
> index c89ea48c70a6..d0338411d75d 100644
> --- a/kernel/audit.c
> +++ b/kernel/audit.c
> @@ -1430,7 +1430,10 @@ static int audit_receive_msg(struct sk_buff *skb, struct nlmsghdr *nlh)
>  	case AUDIT_SIGNAL_INFO:
>  		len = 0;
>  		if (audit_sig_sid) {
> -			err = security_secid_to_secctx(audit_sig_sid, &ctx, &len);
> +			struct lsmblob blob;
> +
> +			lsmblob_init(&blob, audit_sig_sid);
> +			err = security_secid_to_secctx(&blob, &ctx, &len);
>  			if (err)
>  				return err;
>  		}
> @@ -2073,12 +2076,14 @@ int audit_log_task_context(struct audit_buffer *ab)
>  	unsigned len;
>  	int error;
>  	u32 sid;
> +	struct lsmblob blob;
>  
>  	security_task_getsecid(current, &sid);
>  	if (!sid)
>  		return 0;
>  
> -	error = security_secid_to_secctx(sid, &ctx, &len);
> +	lsmblob_init(&blob, sid);
> +	error = security_secid_to_secctx(&blob, &ctx, &len);
>  	if (error) {
>  		if (error != -EINVAL)
>  			goto error_path;
> diff --git a/kernel/auditsc.c b/kernel/auditsc.c
> index 18ee5556c086..d31914088a82 100644
> --- a/kernel/auditsc.c
> +++ b/kernel/auditsc.c
> @@ -947,6 +947,7 @@ static int audit_log_pid_context(struct audit_context *context, pid_t pid,
>  	char *ctx = NULL;
>  	u32 len;
>  	int rc = 0;
> +	struct lsmblob blob;
>  
>  	ab = audit_log_start(context, GFP_KERNEL, AUDIT_OBJ_PID);
>  	if (!ab)
> @@ -956,7 +957,8 @@ static int audit_log_pid_context(struct audit_context *context, pid_t pid,
>  			 from_kuid(&init_user_ns, auid),
>  			 from_kuid(&init_user_ns, uid), sessionid);
>  	if (sid) {
> -		if (security_secid_to_secctx(sid, &ctx, &len)) {
> +		lsmblob_init(&blob, sid);
> +		if (security_secid_to_secctx(&blob, &ctx, &len)) {
>  			audit_log_format(ab, " obj=(none)");
>  			rc = 1;
>  		} else {
> @@ -1198,7 +1200,10 @@ static void show_special(struct audit_context *context, int *call_panic)
>  		if (osid) {
>  			char *ctx = NULL;
>  			u32 len;
> -			if (security_secid_to_secctx(osid, &ctx, &len)) {
> +			struct lsmblob blob;
> +
> +			lsmblob_init(&blob, osid);
> +			if (security_secid_to_secctx(&blob, &ctx, &len)) {
>  				audit_log_format(ab, " osid=%u", osid);
>  				*call_panic = 1;
>  			} else {
> @@ -1349,9 +1354,10 @@ static void audit_log_name(struct audit_context *context, struct audit_names *n,
>  	if (n->osid != 0) {
>  		char *ctx = NULL;
>  		u32 len;
> +		struct lsmblob blob;
>  
> -		if (security_secid_to_secctx(
> -			n->osid, &ctx, &len)) {
> +		lsmblob_init(&blob, n->osid);
> +		if (security_secid_to_secctx(&blob, &ctx, &len)) {
>  			audit_log_format(ab, " osid=%u", n->osid);
>  			if (call_panic)
>  				*call_panic = 2;
> diff --git a/net/ipv4/ip_sockglue.c b/net/ipv4/ip_sockglue.c
> index 2a5c868ce135..e05f4ef68bd8 100644
> --- a/net/ipv4/ip_sockglue.c
> +++ b/net/ipv4/ip_sockglue.c
> @@ -139,8 +139,7 @@ static void ip_cmsg_recv_security(struct msghdr *msg, struct sk_buff *skb)
>  	if (err)
>  		return;
>  
> -	/* Scaffolding - it has to be element 0 */
> -	err = security_secid_to_secctx(lb.secid[0], &secdata, &seclen);
> +	err = security_secid_to_secctx(&lb, &secdata, &seclen);
>  	if (err)
>  		return;
>  
> diff --git a/net/netfilter/nf_conntrack_netlink.c b/net/netfilter/nf_conntrack_netlink.c
> index 66c596d287a5..ca0968f13240 100644
> --- a/net/netfilter/nf_conntrack_netlink.c
> +++ b/net/netfilter/nf_conntrack_netlink.c
> @@ -330,8 +330,10 @@ static int ctnetlink_dump_secctx(struct sk_buff *skb, const struct nf_conn *ct)
>  	struct nlattr *nest_secctx;
>  	int len, ret;
>  	char *secctx;
> +	struct lsmblob blob;
>  
> -	ret = security_secid_to_secctx(ct->secmark, &secctx, &len);
> +	lsmblob_init(&blob, ct->secmark);
> +	ret = security_secid_to_secctx(&blob, &secctx, &len);
>  	if (ret)
>  		return 0;
>  
> @@ -615,8 +617,10 @@ static inline int ctnetlink_secctx_size(const struct nf_conn *ct)
>  {
>  #ifdef CONFIG_NF_CONNTRACK_SECMARK
>  	int len, ret;
> +	struct lsmblob blob;
>  
> -	ret = security_secid_to_secctx(ct->secmark, NULL, &len);
> +	lsmblob_init(&blob, ct->secmark);
> +	ret = security_secid_to_secctx(&blob, NULL, &len);
>  	if (ret)
>  		return 0;
>  
> diff --git a/net/netfilter/nf_conntrack_standalone.c b/net/netfilter/nf_conntrack_standalone.c
> index c2ae14c720b4..c793103f3cd7 100644
> --- a/net/netfilter/nf_conntrack_standalone.c
> +++ b/net/netfilter/nf_conntrack_standalone.c
> @@ -175,8 +175,10 @@ static void ct_show_secctx(struct seq_file *s, const struct nf_conn *ct)
>  	int ret;
>  	u32 len;
>  	char *secctx;
> +	struct lsmblob blob;
>  
> -	ret = security_secid_to_secctx(ct->secmark, &secctx, &len);
> +	lsmblob_init(&blob, ct->secmark);
> +	ret = security_secid_to_secctx(&blob, &secctx, &len);
>  	if (ret)
>  		return;
>  
> diff --git a/net/netfilter/nfnetlink_queue.c b/net/netfilter/nfnetlink_queue.c
> index 0dcc3592d053..59211bff90ab 100644
> --- a/net/netfilter/nfnetlink_queue.c
> +++ b/net/netfilter/nfnetlink_queue.c
> @@ -309,13 +309,17 @@ static u32 nfqnl_get_sk_secctx(struct sk_buff *skb, char **secdata)
>  {
>  	u32 seclen = 0;
>  #if IS_ENABLED(CONFIG_NETWORK_SECMARK)
> +	struct lsmblob blob;
> +
>  	if (!skb || !sk_fullsock(skb->sk))
>  		return 0;
>  
>  	read_lock_bh(&skb->sk->sk_callback_lock);
>  
> -	if (skb->secmark)
> -		security_secid_to_secctx(skb->secmark, secdata, &seclen);
> +	if (skb->secmark) {
> +		lsmblob_init(&blob, skb->secmark);
> +		security_secid_to_secctx(&blob, secdata, &seclen);
> +	}
>  
>  	read_unlock_bh(&skb->sk->sk_callback_lock);
>  #endif
> diff --git a/net/netlabel/netlabel_unlabeled.c b/net/netlabel/netlabel_unlabeled.c
> index 2976370e41aa..2d8dd5b84457 100644
> --- a/net/netlabel/netlabel_unlabeled.c
> +++ b/net/netlabel/netlabel_unlabeled.c
> @@ -389,6 +389,7 @@ int netlbl_unlhsh_add(struct net *net,
>  	struct audit_buffer *audit_buf = NULL;
>  	char *secctx = NULL;
>  	u32 secctx_len;
> +	struct lsmblob blob;
>  
>  	if (addr_len != sizeof(struct in_addr) &&
>  	    addr_len != sizeof(struct in6_addr))
> @@ -451,7 +452,8 @@ int netlbl_unlhsh_add(struct net *net,
>  unlhsh_add_return:
>  	rcu_read_unlock();
>  	if (audit_buf != NULL) {
> -		if (security_secid_to_secctx(secid,
> +		lsmblob_init(&blob, secid);
> +		if (security_secid_to_secctx(&blob,
>  					     &secctx,
>  					     &secctx_len) == 0) {
>  			audit_log_format(audit_buf, " sec_obj=%s", secctx);
> @@ -488,6 +490,7 @@ static int netlbl_unlhsh_remove_addr4(struct net *net,
>  	struct net_device *dev;
>  	char *secctx;
>  	u32 secctx_len;
> +	struct lsmblob blob;
>  
>  	spin_lock(&netlbl_unlhsh_lock);
>  	list_entry = netlbl_af4list_remove(addr->s_addr, mask->s_addr,
> @@ -507,8 +510,10 @@ static int netlbl_unlhsh_remove_addr4(struct net *net,
>  					  addr->s_addr, mask->s_addr);
>  		if (dev != NULL)
>  			dev_put(dev);
> +		if (entry != NULL)
> +			lsmblob_init(&blob, entry->secid);
>  		if (entry != NULL &&
> -		    security_secid_to_secctx(entry->secid,
> +		    security_secid_to_secctx(&blob,
>  					     &secctx, &secctx_len) == 0) {
>  			audit_log_format(audit_buf, " sec_obj=%s", secctx);
>  			security_release_secctx(secctx, secctx_len);
> @@ -550,6 +555,7 @@ static int netlbl_unlhsh_remove_addr6(struct net *net,
>  	struct net_device *dev;
>  	char *secctx;
>  	u32 secctx_len;
> +	struct lsmblob blob;
>  
>  	spin_lock(&netlbl_unlhsh_lock);
>  	list_entry = netlbl_af6list_remove(addr, mask, &iface->addr6_list);
> @@ -568,8 +574,10 @@ static int netlbl_unlhsh_remove_addr6(struct net *net,
>  					  addr, mask);
>  		if (dev != NULL)
>  			dev_put(dev);
> +		if (entry != NULL)
> +			lsmblob_init(&blob, entry->secid);
>  		if (entry != NULL &&
> -		    security_secid_to_secctx(entry->secid,
> +		    security_secid_to_secctx(&blob,
>  					     &secctx, &secctx_len) == 0) {
>  			audit_log_format(audit_buf, " sec_obj=%s", secctx);
>  			security_release_secctx(secctx, secctx_len);
> @@ -1090,6 +1098,7 @@ static int netlbl_unlabel_staticlist_gen(u32 cmd,
>  	u32 secid;
>  	char *secctx;
>  	u32 secctx_len;
> +	struct lsmblob blob;
>  
>  	data = genlmsg_put(cb_arg->skb, NETLINK_CB(cb_arg->nl_cb->skb).portid,
>  			   cb_arg->seq, &netlbl_unlabel_gnl_family,
> @@ -1144,7 +1153,8 @@ static int netlbl_unlabel_staticlist_gen(u32 cmd,
>  		secid = addr6->secid;
>  	}
>  
> -	ret_val = security_secid_to_secctx(secid, &secctx, &secctx_len);
> +	lsmblob_init(&blob, secid);
> +	ret_val = security_secid_to_secctx(&blob, &secctx, &secctx_len);
>  	if (ret_val != 0)
>  		goto list_cb_failure;
>  	ret_val = nla_put(cb_arg->skb,
> diff --git a/net/netlabel/netlabel_user.c b/net/netlabel/netlabel_user.c
> index 4676f5bb16ae..2ccc6567e2a2 100644
> --- a/net/netlabel/netlabel_user.c
> +++ b/net/netlabel/netlabel_user.c
> @@ -100,6 +100,7 @@ struct audit_buffer *netlbl_audit_start_common(int type,
>  	struct audit_buffer *audit_buf;
>  	char *secctx;
>  	u32 secctx_len;
> +	struct lsmblob blob;
>  
>  	if (audit_enabled == AUDIT_OFF)
>  		return NULL;
> @@ -112,10 +113,9 @@ struct audit_buffer *netlbl_audit_start_common(int type,
>  			 from_kuid(&init_user_ns, audit_info->loginuid),
>  			 audit_info->sessionid);
>  
> +	lsmblob_init(&blob, audit_info->secid);
>  	if (audit_info->secid != 0 &&
> -	    security_secid_to_secctx(audit_info->secid,
> -				     &secctx,
> -				     &secctx_len) == 0) {
> +	    security_secid_to_secctx(&blob, &secctx, &secctx_len) == 0) {
>  		audit_log_format(audit_buf, " subj=%s", secctx);
>  		security_release_secctx(secctx, secctx_len);
>  	}
> diff --git a/security/security.c b/security/security.c
> index cb1545bfe8c5..5ab07631df75 100644
> --- a/security/security.c
> +++ b/security/security.c
> @@ -1992,10 +1992,18 @@ int security_ismaclabel(const char *name)
>  }
>  EXPORT_SYMBOL(security_ismaclabel);
>  
> -int security_secid_to_secctx(u32 secid, char **secdata, u32 *seclen)
> +int security_secid_to_secctx(struct lsmblob *blob, char **secdata, u32 *seclen)
>  {
> -	return call_int_hook(secid_to_secctx, -EOPNOTSUPP, secid, secdata,
> -				seclen);
> +	struct security_hook_list *hp;
> +	int rc;
> +
> +	hlist_for_each_entry(hp, &security_hook_heads.secid_to_secctx, list) {
> +		rc = hp->hook.secid_to_secctx(blob->secid[hp->slot],
> +					      secdata, seclen);
> +		if (rc != 0)
> +			return rc;
> +	}
> +	return 0;
>  }
>  EXPORT_SYMBOL(security_secid_to_secctx);
>  
> -- 
> 2.20.1
> 

-- 
Kees Cook
