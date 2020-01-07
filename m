Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BE8CB131D96
	for <lists+selinux@lfdr.de>; Tue,  7 Jan 2020 03:29:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727439AbgAGC3D (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Mon, 6 Jan 2020 21:29:03 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:39698 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727295AbgAGC3D (ORCPT
        <rfc822;selinux@vger.kernel.org>); Mon, 6 Jan 2020 21:29:03 -0500
Received: by mail-lj1-f193.google.com with SMTP id l2so53032953lja.6
        for <selinux@vger.kernel.org>; Mon, 06 Jan 2020 18:29:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qr+jDEqj5Pr8NFmWbY9mXMORlZhFDmQUIMnTyhm7dS0=;
        b=tGDu88+eSsnwXaSAPvBGtkw/bdgCKhzSZXko6BDNXZ6nI6inFI6bXoq9vqm8yGlQwj
         fRWDDHKN+GPanpOPk04/ungoTSJEH32RuuS1SZcJoMA3I93Yjglb8zkOkBmvCXMIM9cM
         BnCmzhR0o0PS4JsGdsv4i/FKuQlg0VrmJhN7uupGUFNHW4otIgJ727v+VSoYs/fUBFbY
         DBNeTHlX3etl5Okh4fHVHDTB7ZVURXrwxWsiqIJnZ+RToMn3F4uVMKknJ7PqRF809BnN
         lYmjR0Rqs18kibrUqOOmbEDRTTaHFBPZz3FsP4KmXNPZNAf34zCv3md4IdPcf70x092O
         sWZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qr+jDEqj5Pr8NFmWbY9mXMORlZhFDmQUIMnTyhm7dS0=;
        b=mcwbZexrlZwzvVrz+CgjkHuOEOyBawccYrc4k+5t1Ks68wEmb7+t7Utl4gQA5py9NI
         axhZ8LG30TbZgFqs1Gjq5ZNhQ4xqnM15JB114Qx4rBBDu+RyRgieH3AoROuHlceNXebd
         lghroBYjpSjJ/ZDxAp9ZNo6lZs3qoTPROJWja6rFEyP1B/mZjm3iZbs5/cNFEvy4xlEv
         4FjoZMegeuHrh/bWzOWzws3L8yCLWsYxHSTxtJGyLm92K0pJMjEyXc70ghwuNV4SntyB
         GAYXgliBZBsfuDjOivCEmAJXnMAbGpsktcGBqJ2eVUpK48vWwVA4bz7RT7MfYPT4fm1K
         cR5g==
X-Gm-Message-State: APjAAAVh9VVjxXOC/El9Bj3dXlnOBQVLR78zacKUc/+dZ0VFHbPPVE03
        N5/43NUjYkmuJpup/ENk8/GQWv32RJNwGNPvhNbGFWnbHg==
X-Google-Smtp-Source: APXvYqxbFv/9uUbieW6N8BCPwhoBLGTQGV1gHSNrcYi/n2ejm31rhzPqgPu533CKodD3XRyA57iKoSufuxYT7p8EgQ4=
X-Received: by 2002:a2e:8188:: with SMTP id e8mr54091758ljg.57.1578364140648;
 Mon, 06 Jan 2020 18:29:00 -0800 (PST)
MIME-Version: 1.0
References: <1578326514-22012-1-git-send-email-rsiddoji@codeaurora.org>
In-Reply-To: <1578326514-22012-1-git-send-email-rsiddoji@codeaurora.org>
From:   Paul Moore <paul@paul-moore.com>
Date:   Mon, 6 Jan 2020 21:28:49 -0500
Message-ID: <CAHC9VhRROm6esDfhTc5DUuA9ocmFN5dUyXHHv+=neeW4km8DMg@mail.gmail.com>
Subject: Re: [PATCH v3] selinux: move ibpkeys code under CONFIG_SECURITY_INFINIBAND.
To:     Ravi Kumar Siddojigari <rsiddoji@codeaurora.org>
Cc:     selinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Mon, Jan 6, 2020 at 11:03 AM Ravi Kumar Siddojigari
<rsiddoji@codeaurora.org> wrote:
> please find the updated patch based on the review comments

Hi Ravi,

I'm not sure how you are posting your patches to the list, but it is
causing the patches to be malformed; I am not able to merge this patch
in its current condition.

I believe Stephen already provided you some tips on posting patches,
but please also go and read the
"Documentation/process/submitting-patches.rst" which can be found in
the Linux Kernel sources.  If you have any questions about how to
submit patches after reading that file please let me know.

-Paul

> Move cache based  pkey sid  retrieval code which was added
> with  Commit "409dcf31" under CONFIG_SECURITY_INFINIBAND.
> As its  going to alloc a new cache which impacts
> low ram devices which was enabled by default.
>
> Suggested-by: Paul Moore <paul@paul-moore.com>
> Signed-off-by: Ravi Kumar Siddojigari <rsiddoji@codeaurora.org>
> ---
>  security/selinux/Makefile         |  4 +++-
>  security/selinux/include/ibpkey.h | 13 +++++++++++++
>  2 files changed, 16 insertions(+), 1 deletion(-)
>
> diff --git a/security/selinux/Makefile b/security/selinux/Makefile
> index ccf950409384..2000f95fb197 100644
> --- a/security/selinux/Makefile
> +++ b/security/selinux/Makefile
> @@ -6,7 +6,7 @@
>  obj-$(CONFIG_SECURITY_SELINUX) := selinux.o
>
>  selinux-y := avc.o hooks.o selinuxfs.o netlink.o nlmsgtab.o netif.o \
> -            netnode.o netport.o ibpkey.o \
> +            netnode.o netport.o \
>              ss/ebitmap.o ss/hashtab.o ss/symtab.o ss/sidtab.o ss/avtab.o \
>              ss/policydb.o ss/services.o ss/conditional.o ss/mls.o ss/status.o
>
> @@ -14,6 +14,8 @@ selinux-$(CONFIG_SECURITY_NETWORK_XFRM) += xfrm.o
>
>  selinux-$(CONFIG_NETLABEL) += netlabel.o
>
> +selinux-$(CONFIG_SECURITY_INFINIBAND) += ibpkey.o
> +
>  ccflags-y := -I$(srctree)/security/selinux -I$(srctree)/security/selinux/include
>
>  $(addprefix $(obj)/,$(selinux-y)): $(obj)/flask.h
> diff --git a/security/selinux/include/ibpkey.h b/security/selinux/include/ibpkey.h
> index a2ebe397bcb7..040b93cca486 100644
> --- a/security/selinux/include/ibpkey.h
> +++ b/security/selinux/include/ibpkey.h
> @@ -14,8 +14,21 @@
>  #ifndef _SELINUX_IB_PKEY_H
>  #define _SELINUX_IB_PKEY_H
>
> +#ifdef CONFIG_SECURITY_INFINIBAND
>  void sel_ib_pkey_flush(void);
>
>  int sel_ib_pkey_sid(u64 subnet_prefix, u16 pkey, u32 *sid);
>
> +#else
> +
> +static inline void sel_ib_pkey_flush(void) {
> +  return;
> +}
> +
> +static inline int sel_ib_pkey_sid(u64 subnet_prefix, u16 pkey, u32 *sid) {
> +  *sid = SECINITSID_UNLABELED;
> +  return 0;
> +}
> Move cache based  pkey sid  retrieval code which was added
> with  Commit "409dcf31" under CONFIG_SECURITY_INFINIBAND.
> As its  going to alloc a new cache which impacts
> low ram devices which was enabled by default.
>
> Suggested-by: Paul Moore <paul@paul-moore.com>
> Signed-off-by: Ravi Kumar Siddojigari <rsiddoji@codeaurora.org>
> ---
>  security/selinux/Makefile         |  4 +++-
>  security/selinux/include/ibpkey.h | 13 +++++++++++++
>  2 files changed, 16 insertions(+), 1 deletion(-)
>
> diff --git a/security/selinux/Makefile b/security/selinux/Makefile
> index ccf950409384..2000f95fb197 100644
> --- a/security/selinux/Makefile
> +++ b/security/selinux/Makefile
> @@ -6,7 +6,7 @@
>  obj-$(CONFIG_SECURITY_SELINUX) := selinux.o
>
>  selinux-y := avc.o hooks.o selinuxfs.o netlink.o nlmsgtab.o netif.o \
> -            netnode.o netport.o ibpkey.o \
> +            netnode.o netport.o \
>              ss/ebitmap.o ss/hashtab.o ss/symtab.o ss/sidtab.o ss/avtab.o \
>              ss/policydb.o ss/services.o ss/conditional.o ss/mls.o ss/status.o
>
> @@ -14,6 +14,8 @@ selinux-$(CONFIG_SECURITY_NETWORK_XFRM) += xfrm.o
>
>  selinux-$(CONFIG_NETLABEL) += netlabel.o
>
> +selinux-$(CONFIG_SECURITY_INFINIBAND) += ibpkey.o
> +
>  ccflags-y := -I$(srctree)/security/selinux -I$(srctree)/security/selinux/include
>
>  $(addprefix $(obj)/,$(selinux-y)): $(obj)/flask.h
> diff --git a/security/selinux/include/ibpkey.h b/security/selinux/include/ibpkey.h
> index a2ebe397bcb7..040b93cca486 100644
> --- a/security/selinux/include/ibpkey.h
> +++ b/security/selinux/include/ibpkey.h
> @@ -14,8 +14,21 @@
>  #ifndef _SELINUX_IB_PKEY_H
>  #define _SELINUX_IB_PKEY_H
>
> +#ifdef CONFIG_SECURITY_INFINIBAND
>  void sel_ib_pkey_flush(void);
>
>  int sel_ib_pkey_sid(u64 subnet_prefix, u16 pkey, u32 *sid);
>
> +#else
> +
> +static inline void sel_ib_pkey_flush(void) {
> +  return;
> +}
> +
> +static inline int sel_ib_pkey_sid(u64 subnet_prefix, u16 pkey, u32 *sid) {
> +  *sid = SECINITSID_UNLABELED;
> +  return 0;
> +}
> +#endif
> +
>  #endif
> --
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project



-- 
paul moore
www.paul-moore.com
