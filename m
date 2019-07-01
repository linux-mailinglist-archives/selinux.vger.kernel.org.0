Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C4B504F8E0
	for <lists+selinux@lfdr.de>; Sun, 23 Jun 2019 01:15:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726417AbfFVXPw (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Sat, 22 Jun 2019 19:15:52 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:33526 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726365AbfFVXPw (ORCPT
        <rfc822;selinux@vger.kernel.org>); Sat, 22 Jun 2019 19:15:52 -0400
Received: by mail-pf1-f196.google.com with SMTP id x15so5423801pfq.0
        for <selinux@vger.kernel.org>; Sat, 22 Jun 2019 16:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=xwoMVINCx9uQkb6e1pzS3FDyk6Axz4CvDv7TcW8I8cY=;
        b=eJT2Fg00eGSyYoe10NG4XhhhyeB+kSwqiJF3WOEijZg87SJ3dx8pHZDf1f8dwmzDFl
         FkTlMvRcUSccuMgshv5dkh68CmbSLBYwe4Pd06QI1q4+IPc6zVUlIPWDo2Q58g07wNRE
         a1jtCCMFTPwBPC6MJWb0B/Or/ZwA+VX5WIpJ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=xwoMVINCx9uQkb6e1pzS3FDyk6Axz4CvDv7TcW8I8cY=;
        b=iQ4jII3eWDrp5/D1NYFMisnMVsck4kqEVb5uMq4qgAp/eWE2L2b0MPcRetGh3YGAA7
         JvyEekgLf+Xncs40Ljm85QGSXvSTTddR7DlXQK6ZIh808PMmpG6xD5vkLUMMdaHrh/vu
         ceHDF+0Swvb6ynYf+ggs/Yn5OU/HJyaxT0R3lq1wusxAA2Q1kjKdNakkGcXZNQR79TfX
         dLWvCSzphv6+5Z9SZ+2qSdvXqT2dIVcfyoEXb1IuWGbN9Hof6x5/LUH7hh8tzFf/yPIW
         9c/He1R4P0CkyvnLw6xsiqQIGG/W0pk4b/t5ukJEi+1oMdeqrxNUhAQXCYCbXMjXxuiF
         O91w==
X-Gm-Message-State: APjAAAVNYnaSttieJ670IuPx+0F78JW2KnpDA8UKNwYCCRakSpQsEPk/
        rh57PY2WYO9HZz5B5IXuwfWapA==
X-Google-Smtp-Source: APXvYqy/PlC+/FHBnp/7f7DE/gROhHn8e8dVSGaNtnv3XlTfXzEeIc/LeZvUcHn6Jk2UVYj+GSEUYQ==
X-Received: by 2002:a17:90a:8a0b:: with SMTP id w11mr15336715pjn.125.1561245351400;
        Sat, 22 Jun 2019 16:15:51 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id q144sm14427231pfc.103.2019.06.22.16.15.50
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 22 Jun 2019 16:15:50 -0700 (PDT)
Date:   Sat, 22 Jun 2019 16:15:49 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Casey Schaufler <casey@schaufler-ca.com>
Cc:     casey.schaufler@intel.com, jmorris@namei.org,
        linux-security-module@vger.kernel.org, selinux@vger.kernel.org,
        john.johansen@canonical.com, penguin-kernel@i-love.sakura.ne.jp,
        paul@paul-moore.com, sds@tycho.nsa.gov
Subject: Re: [PATCH v3 24/24] AppArmor: Remove the exclusive flag
Message-ID: <201906221615.CA1845229@keescook>
References: <20190621185233.6766-1-casey@schaufler-ca.com>
 <20190621185233.6766-25-casey@schaufler-ca.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190621185233.6766-25-casey@schaufler-ca.com>
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Fri, Jun 21, 2019 at 11:52:33AM -0700, Casey Schaufler wrote:
> With the inclusion of the "display" process attribute
> mechanism AppArmor no longer needs to be treated as an
> "exclusive" security module. Remove the flag that indicates
> it is exclusive. Remove the stub getpeersec_dgram AppArmor
> hook as it has no effect in the single LSM case and
> interferes in the multiple LSM case.
> 
> Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-Kees

> ---
>  security/apparmor/lsm.c | 20 +-------------------
>  1 file changed, 1 insertion(+), 19 deletions(-)
> 
> diff --git a/security/apparmor/lsm.c b/security/apparmor/lsm.c
> index dcbbefbd95ff..c4365434f10b 100644
> --- a/security/apparmor/lsm.c
> +++ b/security/apparmor/lsm.c
> @@ -1082,22 +1082,6 @@ static int apparmor_socket_getpeersec_stream(struct socket *sock,
>  	return error;
>  }
>  
> -/**
> - * apparmor_socket_getpeersec_dgram - get security label of packet
> - * @sock: the peer socket
> - * @skb: packet data
> - * @secid: pointer to where to put the secid of the packet
> - *
> - * Sets the netlabel socket state on sk from parent
> - */
> -static int apparmor_socket_getpeersec_dgram(struct socket *sock,
> -					    struct sk_buff *skb, u32 *secid)
> -
> -{
> -	/* TODO: requires secid support */
> -	return -ENOPROTOOPT;
> -}
> -
>  /**
>   * apparmor_sock_graft - Initialize newly created socket
>   * @sk: child sock
> @@ -1196,8 +1180,6 @@ static struct security_hook_list apparmor_hooks[] __lsm_ro_after_init = {
>  #endif
>  	LSM_HOOK_INIT(socket_getpeersec_stream,
>  		      apparmor_socket_getpeersec_stream),
> -	LSM_HOOK_INIT(socket_getpeersec_dgram,
> -		      apparmor_socket_getpeersec_dgram),
>  	LSM_HOOK_INIT(sock_graft, apparmor_sock_graft),
>  #ifdef CONFIG_NETWORK_SECMARK
>  	LSM_HOOK_INIT(inet_conn_request, apparmor_inet_conn_request),
> @@ -1709,7 +1691,7 @@ static int __init apparmor_init(void)
>  
>  DEFINE_LSM(apparmor) = {
>  	.name = "apparmor",
> -	.flags = LSM_FLAG_LEGACY_MAJOR | LSM_FLAG_EXCLUSIVE,
> +	.flags = LSM_FLAG_LEGACY_MAJOR,
>  	.enabled = &apparmor_enabled,
>  	.blobs = &apparmor_blob_sizes,
>  	.init = apparmor_init,
> -- 
> 2.20.1
> 

-- 
Kees Cook
