Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7EE631D9E5
	for <lists+selinux@lfdr.de>; Wed, 17 Feb 2021 14:01:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232819AbhBQNAo (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Wed, 17 Feb 2021 08:00:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232648AbhBQNAn (ORCPT
        <rfc822;selinux@vger.kernel.org>); Wed, 17 Feb 2021 08:00:43 -0500
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B34C1C061574
        for <selinux@vger.kernel.org>; Wed, 17 Feb 2021 05:00:02 -0800 (PST)
Received: by mail-oi1-x232.google.com with SMTP id f3so14765121oiw.13
        for <selinux@vger.kernel.org>; Wed, 17 Feb 2021 05:00:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=k++7u2ndv4cVVLv37g32EAWSo5zEbub/JxtctHyXILU=;
        b=nBmrv9DIqQEWK52IAmFdlt1mtBB4Fhjhh2VwjKjlOB1DBxBcKwG7s8f+wsSxr/Y3Rx
         RqQZaRZT2LE7/9NduhcKUhSfAmrnOG+/Ik7qVGuUggF9FHvs0AX/OQG+tnDj3SZsSTxT
         i1HPjIo77kw9aV4KDEwcVnJkEXsnXQ4rXkmSpnbC2RI5HEfLoWuwLyVeVpDeKDp/Aqza
         UckyVzQWI8ef2V8kM5VjGmqxM98BB1l6OgTP8AJgsFB/MufAtl8EhBQTupc3eYbwkcfH
         rwrAfqe6D6D4HDtgeG9LpJrXOE4IZd8d75ZGmIiDuPwiD66Aa11S1uZrlHhEmWBMqAe9
         5ULw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=k++7u2ndv4cVVLv37g32EAWSo5zEbub/JxtctHyXILU=;
        b=ed2S9qboxAo1IghBqzbrnhc387ijVshYWbgzD/iAm+pow7ggkjG+g/S64EJ8MBKrDO
         ugNkhj1ZXSOo+N6fBs1ilZKw1Z0/zZ2OCSqUglM0jePa+hTwYPtu5MUyAsBN4OAvwFeV
         evIyFyVisNnwUbmWTErcyQZLmwfgQYfgFxuGrel2XZJ0YnlpKmjYzeUSxCggwLX+tWDs
         2/el6U5gSWFgpLw8eIyT+s2FUg+swKRpvutlkNRH2lNiVGKMwsTe9Gmg3EjWd0w/qhaF
         brooKgz4/imJKRxQmqGm97Ohbk62BCKivOgbdjcJ3ZMPX8ZVzmz9L+MUXrHpvkgKkVmx
         PO/g==
X-Gm-Message-State: AOAM530y5c6jieIEf/jE1zz2lu5SfrX4PqnH/DJIZGmqy1e0lZ7R1IaG
        9IofQUImoxbnpYE1hMEF3psqPByU3DoTnpmqpoKvQ7He4BPF9w==
X-Google-Smtp-Source: ABdhPJziyvYJmMyxz9XgJaWMyXobQL48Pptdbr5hetOp1blyvKdMbP2/9fQ+cpn1dkseSxCTlcFb5WTEhbWYiT47ph8=
X-Received: by 2002:aca:ecc8:: with SMTP id k191mr5371255oih.16.1613566801940;
 Wed, 17 Feb 2021 05:00:01 -0800 (PST)
MIME-Version: 1.0
References: <20210217073728.1137112-1-dominick.grift@defensec.nl>
In-Reply-To: <20210217073728.1137112-1-dominick.grift@defensec.nl>
From:   James Carter <jwcart2@gmail.com>
Date:   Wed, 17 Feb 2021 07:59:51 -0500
Message-ID: <CAP+JOzT1jbDYK=u8nyAG8X=_abxKwb7vqqF=gyDVKWLZqFh6xg@mail.gmail.com>
Subject: Re: [PATCH] secilc: fixes cil_role_statements.md example
To:     Dominick Grift <dominick.grift@defensec.nl>
Cc:     SElinux list <selinux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Wed, Feb 17, 2021 at 2:42 AM Dominick Grift
<dominick.grift@defensec.nl> wrote:
>
> Signed-off-by: Dominick Grift <dominick.grift@defensec.nl>

Acked-by: James Carter <jwcart2@gmail.com>

> ---
>  secilc/docs/cil_role_statements.md | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/secilc/docs/cil_role_statements.md b/secilc/docs/cil_role_statements.md
> index ee6a5868..2e1b4047 100644
> --- a/secilc/docs/cil_role_statements.md
> +++ b/secilc/docs/cil_role_statements.md
> @@ -339,7 +339,7 @@ In this example the role `test` cannot have greater privileges than `unconfined.
>  ```secil
>      (role test)
>
> -    (unconfined
> +    (block unconfined
>          (role role)
>          (rolebounds role .test)
>      )
> --
> 2.30.1
>
