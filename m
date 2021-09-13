Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D266D40852E
	for <lists+selinux@lfdr.de>; Mon, 13 Sep 2021 09:16:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237596AbhIMHSJ (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Mon, 13 Sep 2021 03:18:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42024 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237557AbhIMHSI (ORCPT
        <rfc822;selinux@vger.kernel.org>); Mon, 13 Sep 2021 03:18:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1631517412;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=3sfiq9gd+F6JH8oSBvW0EmNYJfq7/aiWJpxsGuGmiIY=;
        b=ZKEAB7pFxe9CC54RI/gGq7S3Gjl2Hu1ASFt2nwrlZmBeY3kwt4Us5yujxcersJxpgJT06Z
        u9T7cTt7xgtvhnSp3DOonl9FwGJFp+X5AV1ULlPFOsq7JmqCN4wJC1YjCgogQv5xQGJRRo
        01dg0MXd84s+fz9nnDrJ+xt0py5Spho=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-247-6o8C2C0GP6mCQMNe66VtTQ-1; Mon, 13 Sep 2021 03:16:51 -0400
X-MC-Unique: 6o8C2C0GP6mCQMNe66VtTQ-1
Received: by mail-yb1-f199.google.com with SMTP id q17-20020a25b591000000b005a07d27bbdaso11834227ybj.3
        for <selinux@vger.kernel.org>; Mon, 13 Sep 2021 00:16:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3sfiq9gd+F6JH8oSBvW0EmNYJfq7/aiWJpxsGuGmiIY=;
        b=QnwZeGfryuj6sdOj0noPm8WEwPoUbNqlH4a3MJuwhuZ/0loUzTadB33j69kxfyEyq6
         G6YXhWOD8kAJAE8Z2t2Bv+hYjhUsuAxAiMbsPa6OPBvMSQC7KEyBqJ+sFy8HxdeRpv1N
         7sgpmp2SzFMU8RfaBfMo3q8GBteghxY774TpqWVVBf5ydktTKG5mGcSNZDah+B5n4rNm
         u+FENkABX5Bk+rtWw7t9fHGBpQt3fDiEk4fmmhzpqgwVragSV4mychA0yfiZjcKYtDVf
         i0OwC3b3/o5Ac7Tgta6ptdkTv4fOA8UAaXDHZY20cXqa1cA9mLFJm7RTOek8TMnx/GWF
         QP4g==
X-Gm-Message-State: AOAM532FeTPyhEptblVy8s7sy7FfFPP3KhCu9NCHunN8P+2u0f9kyEia
        SpKSk2veeOfGDSi0/TxlZeySta1XcTXYctU+sL16AZjBCvBQSYK91//SEf8eXZN57xO1cjoByxR
        aSCQBiknc92v4QUSYBgtMDse677liNARU/Q==
X-Received: by 2002:a25:83:: with SMTP id 125mr13609795yba.467.1631517411149;
        Mon, 13 Sep 2021 00:16:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx7kJQ1PXFrM1GJmwLzxTDCzAnCF4sbmb32hyfGmjO6KYJLAN17PxbqC5KZnDcXxN+lY9MSOWE9m1W7pZXWyqo=
X-Received: by 2002:a25:83:: with SMTP id 125mr13609777yba.467.1631517410913;
 Mon, 13 Sep 2021 00:16:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210912122234.GA22469@asgard.redhat.com>
In-Reply-To: <20210912122234.GA22469@asgard.redhat.com>
From:   Ondrej Mosnacek <omosnace@redhat.com>
Date:   Mon, 13 Sep 2021 09:16:39 +0200
Message-ID: <CAFqZXNtmN9827MQ0aX7ZcUia5amXuZWppb-9-ySxVP0QBy=O8Q@mail.gmail.com>
Subject: Re: [PATCH v2] include/uapi/linux/xfrm.h: Fix XFRM_MSG_MAPPING ABI breakage
To:     Eugene Syromiatnikov <esyr@redhat.com>
Cc:     Steffen Klassert <steffen.klassert@secunet.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Antony Antony <antony.antony@secunet.com>,
        Christian Langrock <christian.langrock@secunet.com>,
        Nicolas Dichtel <nicolas.dichtel@6wind.com>,
        SElinux list <selinux@vger.kernel.org>,
        Paul Moore <paul@paul-moore.com>,
        Stephen Smalley <stephen.smalley.work@gmail.com>,
        Eric Paris <eparis@parisplace.org>,
        network dev <netdev@vger.kernel.org>,
        Linux kernel mailing list <linux-kernel@vger.kernel.org>,
        "Dmitry V. Levin" <ldv@strace.io>,
        Linux API <linux-api@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Hi,

On Sun, Sep 12, 2021 at 2:23 PM Eugene Syromiatnikov <esyr@redhat.com> wrote:
> Commit 2d151d39073a ("xfrm: Add possibility to set the default to block
> if we have no policy") broke ABI by changing the value of the XFRM_MSG_MAPPING
> enum item, thus also evading the build-time check
> in security/selinux/nlmsgtab.c:selinux_nlmsg_lookup for presence of proper
> security permission checks in nlmsg_xfrm_perms.  Fix it by placing
> XFRM_MSG_SETDEFAULT/XFRM_MSG_GETDEFAULT to the end of the enum, right before
> __XFRM_MSG_MAX, and updating the nlmsg_xfrm_perms accordingly.
>
> Fixes: 2d151d39073a ("xfrm: Add possibility to set the default to block if we have no policy")
> References: https://lore.kernel.org/netdev/20210901151402.GA2557@altlinux.org/
> Signed-off-by: Eugene Syromiatnikov <esyr@redhat.com>
> ---
> v2:
>  - Updated SELinux nlmsg_xfrm_perms permissions table and selinux_nlmsg_lookup
>    build-time check accordingly.
>
> v1: https://lore.kernel.org/lkml/20210901153407.GA20446@asgard.redhat.com/
> ---
>  include/uapi/linux/xfrm.h   | 6 +++---
>  security/selinux/nlmsgtab.c | 4 +++-
>  2 files changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/include/uapi/linux/xfrm.h b/include/uapi/linux/xfrm.h
> index b96c1ea..26f456b1 100644
> --- a/include/uapi/linux/xfrm.h
> +++ b/include/uapi/linux/xfrm.h
> @@ -213,13 +213,13 @@ enum {
>         XFRM_MSG_GETSPDINFO,
>  #define XFRM_MSG_GETSPDINFO XFRM_MSG_GETSPDINFO
>
> +       XFRM_MSG_MAPPING,
> +#define XFRM_MSG_MAPPING XFRM_MSG_MAPPING
> +
>         XFRM_MSG_SETDEFAULT,
>  #define XFRM_MSG_SETDEFAULT XFRM_MSG_SETDEFAULT
>         XFRM_MSG_GETDEFAULT,
>  #define XFRM_MSG_GETDEFAULT XFRM_MSG_GETDEFAULT
> -
> -       XFRM_MSG_MAPPING,
> -#define XFRM_MSG_MAPPING XFRM_MSG_MAPPING

Perhaps it would be a good idea to put a comment here to make it less
likely that this repeats in the future. Something like:

/* IMPORTANT: Only insert new entries right above this line, otherwise
you break ABI! */

>         __XFRM_MSG_MAX
>  };
>  #define XFRM_MSG_MAX (__XFRM_MSG_MAX - 1)
> diff --git a/security/selinux/nlmsgtab.c b/security/selinux/nlmsgtab.c
> index d59276f..94ea2a8 100644
> --- a/security/selinux/nlmsgtab.c
> +++ b/security/selinux/nlmsgtab.c
> @@ -126,6 +126,8 @@ static const struct nlmsg_perm nlmsg_xfrm_perms[] =
>         { XFRM_MSG_NEWSPDINFO,  NETLINK_XFRM_SOCKET__NLMSG_WRITE },
>         { XFRM_MSG_GETSPDINFO,  NETLINK_XFRM_SOCKET__NLMSG_READ  },
>         { XFRM_MSG_MAPPING,     NETLINK_XFRM_SOCKET__NLMSG_READ  },
> +       { XFRM_MSG_SETDEFAULT,  NETLINK_XFRM_SOCKET__NLMSG_WRITE },
> +       { XFRM_MSG_GETDEFAULT,  NETLINK_XFRM_SOCKET__NLMSG_READ  },
>  };
>
>  static const struct nlmsg_perm nlmsg_audit_perms[] =
> @@ -189,7 +191,7 @@ int selinux_nlmsg_lookup(u16 sclass, u16 nlmsg_type, u32 *perm)
>                  * structures at the top of this file with the new mappings
>                  * before updating the BUILD_BUG_ON() macro!
>                  */
> -               BUILD_BUG_ON(XFRM_MSG_MAX != XFRM_MSG_MAPPING);
> +               BUILD_BUG_ON(XFRM_MSG_MAX != XFRM_MSG_GETDEFAULT);
>                 err = nlmsg_perm(nlmsg_type, perm, nlmsg_xfrm_perms,
>                                  sizeof(nlmsg_xfrm_perms));
>                 break;
> --
> 2.1.4
>


-- 
Ondrej Mosnacek
Software Engineer, Linux Security - SELinux kernel
Red Hat, Inc.

