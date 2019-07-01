Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 47A1D4B0FC
	for <lists+selinux@lfdr.de>; Wed, 19 Jun 2019 06:59:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725866AbfFSE7z (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Wed, 19 Jun 2019 00:59:55 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:38001 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725881AbfFSE7z (ORCPT
        <rfc822;selinux@vger.kernel.org>); Wed, 19 Jun 2019 00:59:55 -0400
Received: by mail-pg1-f193.google.com with SMTP id v11so8935044pgl.5
        for <selinux@vger.kernel.org>; Tue, 18 Jun 2019 21:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=crvxEfstFaUdD0BtkDUMJB6K63T97+dCJdBYNcxJDu8=;
        b=aLz9yr0WFwZSVg8aepCG4r6BB2PZqkVkqWp+nlh2ZG3qBHCij8eFWfeh8Q4dh1OBNY
         M/Wpn59o0fs84rqf7V2VBT3Kk2XBjOUICD5LCyixzNzq81Ll4CW8ZbRg8kcZ+WVZh2O5
         U8ewGYexcD8GkvbDORLsIvN5tWj5xWVmjXraU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=crvxEfstFaUdD0BtkDUMJB6K63T97+dCJdBYNcxJDu8=;
        b=h+VOp11oi+9O6melDJ4sTvG4dN/z6iIUN5EqgVbUwqj19gMdmSNHWyBAH1siM36ib4
         JWmv1YxnfjXUfQlbtwAiQ+6s4de1qbozWvPC1xobuufpgGTCoY1mgPtstcfi790Xr5dq
         JzhaBqLS66wJ6BejNiRzKLcRvL7oq+bOLB5vG5VCumXXDAgBLbCY+oL4Mq62K2x7Q/gV
         /W7h33Zq9QA3Um2oyIB9H5VUZiADOObydSm8qvvWPStO3rolFUMiG2lQ5EuGYNzCXCaM
         OAOlSFp88nZiAConGz6LS1WJMVsb5eY//2k3mrX2AFqD/t1flf9+cLl/35mOdacm+3LE
         +Rsw==
X-Gm-Message-State: APjAAAWMjg2WERhomrzAXrmHPmT+XgSXQMn0z/vPZ+wo8Jo9Vq126CeU
        dUyIal7lv9LFiIem2uMFXYJedg==
X-Google-Smtp-Source: APXvYqxY09yp+LnIzDzs+nMX1z1tKFs/w4+q915cE4/3d5VAF4EN307D0huWrtyqQqPwMt7HhbzwKQ==
X-Received: by 2002:a65:5889:: with SMTP id d9mr5897115pgu.39.1560920394329;
        Tue, 18 Jun 2019 21:59:54 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id c9sm19387474pfn.3.2019.06.18.21.59.53
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Jun 2019 21:59:53 -0700 (PDT)
Date:   Tue, 18 Jun 2019 21:59:52 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Casey Schaufler <casey@schaufler-ca.com>
Cc:     casey.schaufler@intel.com, jmorris@namei.org,
        linux-security-module@vger.kernel.org, selinux@vger.kernel.org,
        john.johansen@canonical.com, penguin-kernel@i-love.sakura.ne.jp,
        paul@paul-moore.com, sds@tycho.nsa.gov
Subject: Re: [PATCH v2 07/25] net: Prepare UDS for secuirty module stacking
Message-ID: <201906182157.29524DC78@keescook>
References: <20190618230551.7475-1-casey@schaufler-ca.com>
 <20190618230551.7475-8-casey@schaufler-ca.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190618230551.7475-8-casey@schaufler-ca.com>
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

typo in Subject -> "secuirty" -> "security"

On Tue, Jun 18, 2019 at 04:05:33PM -0700, Casey Schaufler wrote:
> Change the data used in UDS SO_PEERSEC processing from a
> secid to a more general struct lsmblob. Update the
> security_socket_getpeersec_dgram() interface to use the
> lsmblob. There is a small amount of scaffolding code
> that will come out when the security_secid_to_secctx()
> code is brought in line with the lsmblob.

Can you spell this out a little more, "scaffolding code passes slot 1
unconditionally while the following patches will fix this up when they
are made aware of lsmblob" etc. (Also, why slot 1 and not slot 0?)

-Kees

> 
> Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
> ---
>  include/linux/security.h |  7 +++++--
>  include/net/af_unix.h    |  2 +-
>  include/net/scm.h        |  8 +++++---
>  net/ipv4/ip_sockglue.c   |  8 +++++---
>  net/unix/af_unix.c       |  6 +++---
>  security/security.c      | 16 +++++++++++++---
>  6 files changed, 32 insertions(+), 15 deletions(-)
> 
> diff --git a/include/linux/security.h b/include/linux/security.h
> index 89a5391f2441..64f5cc2dd249 100644
> --- a/include/linux/security.h
> +++ b/include/linux/security.h
> @@ -1276,7 +1276,8 @@ int security_socket_shutdown(struct socket *sock, int how);
>  int security_sock_rcv_skb(struct sock *sk, struct sk_buff *skb);
>  int security_socket_getpeersec_stream(struct socket *sock, char __user *optval,
>  				      int __user *optlen, unsigned len);
> -int security_socket_getpeersec_dgram(struct socket *sock, struct sk_buff *skb, u32 *secid);
> +int security_socket_getpeersec_dgram(struct socket *sock, struct sk_buff *skb,
> +				     struct lsmblob *l);
>  int security_sk_alloc(struct sock *sk, int family, gfp_t priority);
>  void security_sk_free(struct sock *sk);
>  void security_sk_clone(const struct sock *sk, struct sock *newsk);
> @@ -1414,7 +1415,9 @@ static inline int security_socket_getpeersec_stream(struct socket *sock, char __
>  	return -ENOPROTOOPT;
>  }
>  
> -static inline int security_socket_getpeersec_dgram(struct socket *sock, struct sk_buff *skb, u32 *secid)
> +static inline int security_socket_getpeersec_dgram(struct socket *sock,
> +						   struct sk_buff *skb,
> +						   struct lsmblob *l)
>  {
>  	return -ENOPROTOOPT;
>  }
> diff --git a/include/net/af_unix.h b/include/net/af_unix.h
> index 3426d6dacc45..933492c08b8c 100644
> --- a/include/net/af_unix.h
> +++ b/include/net/af_unix.h
> @@ -36,7 +36,7 @@ struct unix_skb_parms {
>  	kgid_t			gid;
>  	struct scm_fp_list	*fp;		/* Passed files		*/
>  #ifdef CONFIG_SECURITY_NETWORK
> -	u32			secid;		/* Security ID		*/
> +	struct lsmblob		lsmblob;	/* Security LSM data	*/
>  #endif
>  	u32			consumed;
>  } __randomize_layout;
> diff --git a/include/net/scm.h b/include/net/scm.h
> index 1ce365f4c256..c87a17101c86 100644
> --- a/include/net/scm.h
> +++ b/include/net/scm.h
> @@ -33,7 +33,7 @@ struct scm_cookie {
>  	struct scm_fp_list	*fp;		/* Passed files		*/
>  	struct scm_creds	creds;		/* Skb credentials	*/
>  #ifdef CONFIG_SECURITY_NETWORK
> -	u32			secid;		/* Passed security ID 	*/
> +	struct lsmblob		lsmblob;	/* Passed LSM data	*/
>  #endif
>  };
>  
> @@ -46,7 +46,7 @@ struct scm_fp_list *scm_fp_dup(struct scm_fp_list *fpl);
>  #ifdef CONFIG_SECURITY_NETWORK
>  static __inline__ void unix_get_peersec_dgram(struct socket *sock, struct scm_cookie *scm)
>  {
> -	security_socket_getpeersec_dgram(sock, NULL, &scm->secid);
> +	security_socket_getpeersec_dgram(sock, NULL, &scm->lsmblob);
>  }
>  #else
>  static __inline__ void unix_get_peersec_dgram(struct socket *sock, struct scm_cookie *scm)
> @@ -97,7 +97,9 @@ static inline void scm_passec(struct socket *sock, struct msghdr *msg, struct sc
>  	int err;
>  
>  	if (test_bit(SOCK_PASSSEC, &sock->flags)) {
> -		err = security_secid_to_secctx(scm->secid, &secdata, &seclen);
> +		/* Scaffolding - it has to be element 1 for now */
> +		err = security_secid_to_secctx(scm->lsmblob.secid[1],
> +					       &secdata, &seclen);
>  
>  		if (!err) {
>  			put_cmsg(msg, SOL_SOCKET, SCM_SECURITY, seclen, secdata);
> diff --git a/net/ipv4/ip_sockglue.c b/net/ipv4/ip_sockglue.c
> index 82f341e84fae..fbe2147ee595 100644
> --- a/net/ipv4/ip_sockglue.c
> +++ b/net/ipv4/ip_sockglue.c
> @@ -130,15 +130,17 @@ static void ip_cmsg_recv_checksum(struct msghdr *msg, struct sk_buff *skb,
>  
>  static void ip_cmsg_recv_security(struct msghdr *msg, struct sk_buff *skb)
>  {
> +	struct lsmblob lb;
>  	char *secdata;
> -	u32 seclen, secid;
> +	u32 seclen;
>  	int err;
>  
> -	err = security_socket_getpeersec_dgram(NULL, skb, &secid);
> +	err = security_socket_getpeersec_dgram(NULL, skb, &lb);
>  	if (err)
>  		return;
>  
> -	err = security_secid_to_secctx(secid, &secdata, &seclen);
> +	/* Scaffolding - it has to be element 1 */
> +	err = security_secid_to_secctx(lb.secid[1], &secdata, &seclen);
>  	if (err)
>  		return;
>  
> diff --git a/net/unix/af_unix.c b/net/unix/af_unix.c
> index ddb838a1b74c..c50a004a1389 100644
> --- a/net/unix/af_unix.c
> +++ b/net/unix/af_unix.c
> @@ -143,17 +143,17 @@ static struct hlist_head *unix_sockets_unbound(void *addr)
>  #ifdef CONFIG_SECURITY_NETWORK
>  static void unix_get_secdata(struct scm_cookie *scm, struct sk_buff *skb)
>  {
> -	UNIXCB(skb).secid = scm->secid;
> +	UNIXCB(skb).lsmblob = scm->lsmblob;
>  }
>  
>  static inline void unix_set_secdata(struct scm_cookie *scm, struct sk_buff *skb)
>  {
> -	scm->secid = UNIXCB(skb).secid;
> +	scm->lsmblob = UNIXCB(skb).lsmblob;
>  }
>  
>  static inline bool unix_secdata_eq(struct scm_cookie *scm, struct sk_buff *skb)
>  {
> -	return (scm->secid == UNIXCB(skb).secid);
> +	return lsmblob_equal(&scm->lsmblob, &(UNIXCB(skb).lsmblob));
>  }
>  #else
>  static inline void unix_get_secdata(struct scm_cookie *scm, struct sk_buff *skb)
> diff --git a/security/security.c b/security/security.c
> index 4296cd2ca508..5ed818699e15 100644
> --- a/security/security.c
> +++ b/security/security.c
> @@ -2132,10 +2132,20 @@ int security_socket_getpeersec_stream(struct socket *sock, char __user *optval,
>  				optval, optlen, len);
>  }
>  
> -int security_socket_getpeersec_dgram(struct socket *sock, struct sk_buff *skb, u32 *secid)
> +int security_socket_getpeersec_dgram(struct socket *sock, struct sk_buff *skb,
> +				     struct lsmblob *l)
>  {
> -	return call_int_hook(socket_getpeersec_dgram, -ENOPROTOOPT, sock,
> -			     skb, secid);
> +	struct security_hook_list *hp;
> +	int rc = -ENOPROTOOPT;
> +
> +	hlist_for_each_entry(hp, &security_hook_heads.socket_getpeersec_dgram,
> +			     list) {
> +		rc = hp->hook.socket_getpeersec_dgram(sock, skb,
> +						      &l->secid[hp->slot]);
> +		if (rc != 0)
> +			break;
> +	}
> +	return rc;
>  }
>  EXPORT_SYMBOL(security_socket_getpeersec_dgram);
>  
> -- 
> 2.20.1
> 

-- 
Kees Cook
