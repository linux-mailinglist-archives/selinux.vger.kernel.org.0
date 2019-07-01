Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 12CE9574AB
	for <lists+selinux@lfdr.de>; Thu, 27 Jun 2019 01:07:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726463AbfFZXHv (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Wed, 26 Jun 2019 19:07:51 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:44670 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726430AbfFZXHv (ORCPT
        <rfc822;selinux@vger.kernel.org>); Wed, 26 Jun 2019 19:07:51 -0400
Received: by mail-pl1-f195.google.com with SMTP id t7so144089plr.11
        for <selinux@vger.kernel.org>; Wed, 26 Jun 2019 16:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=wjZI+1Kl8QZTd1oVkGPgfuLUm0RP2x1AyjV7qphP/Sc=;
        b=ImByWMAfXmB9nLJ3wpTvm6O/Ry1UqWF24RKJlw6TtuG9gfCnWX3AGVDHMuicumeCpU
         PiGi9T5RAlReSje6++oOjrL7fZVtz77lwkaHUXRYDvEw+M44xSGpti2b3K1dCyhqw0MW
         BKVz+c6QQBDX+ktCRpggHUeimG8QgyfJHxJXU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=wjZI+1Kl8QZTd1oVkGPgfuLUm0RP2x1AyjV7qphP/Sc=;
        b=sYy7yFeX8YdjYuLjpP28i9fL92h6aJqH8PMmXKVtuXeyRQgBW6BgPaW+5wJZG8kROE
         XmhQgn3INvzoT7dtQ6vQCKqpkTEcClGHK/wNZ8t5jOxolSPogfPGE72wHZI2oi2Xmn0F
         Uhlj9oWox3cIDjToKpdXIjoy7MDb7EaFWpJTlM70dYQWm4hNgddyjsgY+w+m5SL9S2j7
         R/tUuq+pgkCoi4hgYwVTzEp1pVRZ6XwfzUf75oKb6/qVtJpGADL5CZFhV7o70pWlhaQv
         /85qqzo+FT7rcaI8i0HWoCsMrLhshzDnn/Av4IKVTIOQozTiUg25sat9t6eArsio26Cd
         vOTw==
X-Gm-Message-State: APjAAAVfBRLCEo0B0XauReI7xphQr94ZrFgUB0MwxuGjge0xsgeCqrLt
        C8+VK8/DGhT2K9JFesyw6XT4Ug==
X-Google-Smtp-Source: APXvYqzecPMxf4M2e2c3E3ycYQBNEw5sYt/1tzWW+b+kLLui6/h7C2jukG8bjxVYBz8ayFrS3sGqiw==
X-Received: by 2002:a17:902:748c:: with SMTP id h12mr681964pll.208.1561590470787;
        Wed, 26 Jun 2019 16:07:50 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id u65sm5842215pjb.1.2019.06.26.16.07.49
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Jun 2019 16:07:49 -0700 (PDT)
Date:   Wed, 26 Jun 2019 16:07:49 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Casey Schaufler <casey@schaufler-ca.com>
Cc:     casey.schaufler@intel.com, jmorris@namei.org,
        linux-security-module@vger.kernel.org, selinux@vger.kernel.org,
        john.johansen@canonical.com, penguin-kernel@i-love.sakura.ne.jp,
        paul@paul-moore.com, sds@tycho.nsa.gov
Subject: Re: [PATCH v4 08/23] LSM: Use lsmblob in security_secctx_to_secid
Message-ID: <201906261607.89C5F0247F@keescook>
References: <20190626192234.11725-1-casey@schaufler-ca.com>
 <20190626192234.11725-9-casey@schaufler-ca.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190626192234.11725-9-casey@schaufler-ca.com>
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Wed, Jun 26, 2019 at 12:22:19PM -0700, Casey Schaufler wrote:
> Change security_secctx_to_secid() to fill in a lsmblob instead
> of a u32 secid. Multiple LSMs may be able to interpret the
> string, and this allows for setting whichever secid is
> appropriate. In some cases there is scaffolding where other
> interfaces have yet to be converted.
> 
> Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-Kees

> ---
>  include/linux/security.h          |  5 +++--
>  kernel/cred.c                     |  4 +---
>  net/netfilter/nft_meta.c          | 13 ++++++-------
>  net/netfilter/xt_SECMARK.c        |  5 ++++-
>  net/netlabel/netlabel_unlabeled.c | 14 ++++++++------
>  security/security.c               | 18 +++++++++++++++---
>  6 files changed, 37 insertions(+), 22 deletions(-)
> 
> diff --git a/include/linux/security.h b/include/linux/security.h
> index dcf20da87d1b..30337f1a9056 100644
> --- a/include/linux/security.h
> +++ b/include/linux/security.h
> @@ -447,7 +447,8 @@ int security_setprocattr(const char *lsm, const char *name, void *value,
>  int security_netlink_send(struct sock *sk, struct sk_buff *skb);
>  int security_ismaclabel(const char *name);
>  int security_secid_to_secctx(u32 secid, char **secdata, u32 *seclen);
> -int security_secctx_to_secid(const char *secdata, u32 seclen, u32 *secid);
> +int security_secctx_to_secid(const char *secdata, u32 seclen,
> +			     struct lsmblob *blob);
>  void security_release_secctx(char *secdata, u32 seclen);
>  
>  void security_inode_invalidate_secctx(struct inode *inode);
> @@ -1230,7 +1231,7 @@ static inline int security_secid_to_secctx(u32 secid, char **secdata, u32 *secle
>  
>  static inline int security_secctx_to_secid(const char *secdata,
>  					   u32 seclen,
> -					   u32 *secid)
> +					   struct lsmblob *blob)
>  {
>  	return -EOPNOTSUPP;
>  }
> diff --git a/kernel/cred.c b/kernel/cred.c
> index 71c14dda107e..d70a2c02ced4 100644
> --- a/kernel/cred.c
> +++ b/kernel/cred.c
> @@ -725,14 +725,12 @@ EXPORT_SYMBOL(set_security_override);
>  int set_security_override_from_ctx(struct cred *new, const char *secctx)
>  {
>  	struct lsmblob blob;
> -	u32 secid;
>  	int ret;
>  
> -	ret = security_secctx_to_secid(secctx, strlen(secctx), &secid);
> +	ret = security_secctx_to_secid(secctx, strlen(secctx), &blob);
>  	if (ret < 0)
>  		return ret;
>  
> -	lsmblob_init(&blob, secid);
>  	return set_security_override(new, &blob);
>  }
>  EXPORT_SYMBOL(set_security_override_from_ctx);
> diff --git a/net/netfilter/nft_meta.c b/net/netfilter/nft_meta.c
> index 987d2d6ce624..054fb4b48d51 100644
> --- a/net/netfilter/nft_meta.c
> +++ b/net/netfilter/nft_meta.c
> @@ -576,21 +576,20 @@ static const struct nla_policy nft_secmark_policy[NFTA_SECMARK_MAX + 1] = {
>  
>  static int nft_secmark_compute_secid(struct nft_secmark *priv)
>  {
> -	u32 tmp_secid = 0;
> +	struct lsmblob blob;
>  	int err;
>  
> -	err = security_secctx_to_secid(priv->ctx, strlen(priv->ctx), &tmp_secid);
> +	err = security_secctx_to_secid(priv->ctx, strlen(priv->ctx), &blob);
>  	if (err)
>  		return err;
>  
> -	if (!tmp_secid)
> -		return -ENOENT;
> -
> -	err = security_secmark_relabel_packet(tmp_secid);
> +	/* Using le[0] is scaffolding */
> +	err = security_secmark_relabel_packet(blob.secid[0]);
>  	if (err)
>  		return err;
>  
> -	priv->secid = tmp_secid;
> +	/* Using le[0] is scaffolding */
> +	priv->secid = blob.secid[0];
>  	return 0;
>  }
>  
> diff --git a/net/netfilter/xt_SECMARK.c b/net/netfilter/xt_SECMARK.c
> index f16202d26c20..8081fadc30e9 100644
> --- a/net/netfilter/xt_SECMARK.c
> +++ b/net/netfilter/xt_SECMARK.c
> @@ -49,13 +49,14 @@ secmark_tg(struct sk_buff *skb, const struct xt_action_param *par)
>  
>  static int checkentry_lsm(struct xt_secmark_target_info *info)
>  {
> +	struct lsmblob blob;
>  	int err;
>  
>  	info->secctx[SECMARK_SECCTX_MAX - 1] = '\0';
>  	info->secid = 0;
>  
>  	err = security_secctx_to_secid(info->secctx, strlen(info->secctx),
> -				       &info->secid);
> +				       &blob);
>  	if (err) {
>  		if (err == -EINVAL)
>  			pr_info_ratelimited("invalid security context \'%s\'\n",
> @@ -63,6 +64,8 @@ static int checkentry_lsm(struct xt_secmark_target_info *info)
>  		return err;
>  	}
>  
> +	/* scaffolding during the transition */
> +	info->secid = blob.secid[0];
>  	if (!info->secid) {
>  		pr_info_ratelimited("unable to map security context \'%s\'\n",
>  				    info->secctx);
> diff --git a/net/netlabel/netlabel_unlabeled.c b/net/netlabel/netlabel_unlabeled.c
> index c92894c3e40a..2976370e41aa 100644
> --- a/net/netlabel/netlabel_unlabeled.c
> +++ b/net/netlabel/netlabel_unlabeled.c
> @@ -895,7 +895,7 @@ static int netlbl_unlabel_staticadd(struct sk_buff *skb,
>  	void *addr;
>  	void *mask;
>  	u32 addr_len;
> -	u32 secid;
> +	struct lsmblob blob;
>  	struct netlbl_audit audit_info;
>  
>  	/* Don't allow users to add both IPv4 and IPv6 addresses for a
> @@ -919,12 +919,13 @@ static int netlbl_unlabel_staticadd(struct sk_buff *skb,
>  	ret_val = security_secctx_to_secid(
>  		                  nla_data(info->attrs[NLBL_UNLABEL_A_SECCTX]),
>  				  nla_len(info->attrs[NLBL_UNLABEL_A_SECCTX]),
> -				  &secid);
> +				  &blob);
>  	if (ret_val != 0)
>  		return ret_val;
>  
> +	/* scaffolding with the [0] */
>  	return netlbl_unlhsh_add(&init_net,
> -				 dev_name, addr, mask, addr_len, secid,
> +				 dev_name, addr, mask, addr_len, blob.secid[0],
>  				 &audit_info);
>  }
>  
> @@ -946,7 +947,7 @@ static int netlbl_unlabel_staticadddef(struct sk_buff *skb,
>  	void *addr;
>  	void *mask;
>  	u32 addr_len;
> -	u32 secid;
> +	struct lsmblob blob;
>  	struct netlbl_audit audit_info;
>  
>  	/* Don't allow users to add both IPv4 and IPv6 addresses for a
> @@ -968,12 +969,13 @@ static int netlbl_unlabel_staticadddef(struct sk_buff *skb,
>  	ret_val = security_secctx_to_secid(
>  		                  nla_data(info->attrs[NLBL_UNLABEL_A_SECCTX]),
>  				  nla_len(info->attrs[NLBL_UNLABEL_A_SECCTX]),
> -				  &secid);
> +				  &blob);
>  	if (ret_val != 0)
>  		return ret_val;
>  
> +	/* scaffolding with the [0] */
>  	return netlbl_unlhsh_add(&init_net,
> -				 NULL, addr, mask, addr_len, secid,
> +				 NULL, addr, mask, addr_len, blob.secid[0],
>  				 &audit_info);
>  }
>  
> diff --git a/security/security.c b/security/security.c
> index 4e1eb2a54064..ad9aaa46ed04 100644
> --- a/security/security.c
> +++ b/security/security.c
> @@ -1982,10 +1982,22 @@ int security_secid_to_secctx(u32 secid, char **secdata, u32 *seclen)
>  }
>  EXPORT_SYMBOL(security_secid_to_secctx);
>  
> -int security_secctx_to_secid(const char *secdata, u32 seclen, u32 *secid)
> +int security_secctx_to_secid(const char *secdata, u32 seclen,
> +			     struct lsmblob *blob)
>  {
> -	*secid = 0;
> -	return call_int_hook(secctx_to_secid, 0, secdata, seclen, secid);
> +	struct security_hook_list *hp;
> +	int rc;
> +
> +	lsmblob_init(blob, 0);
> +	hlist_for_each_entry(hp, &security_hook_heads.secctx_to_secid, list) {
> +		if (WARN_ON(hp->lsmid->slot < 0 || hp->lsmid->slot >= lsm_slot))
> +			continue;
> +		rc = hp->hook.secctx_to_secid(secdata, seclen,
> +					      &blob->secid[hp->lsmid->slot]);
> +		if (rc != 0)
> +			return rc;
> +	}
> +	return 0;
>  }
>  EXPORT_SYMBOL(security_secctx_to_secid);
>  
> -- 
> 2.20.1
> 

-- 
Kees Cook
