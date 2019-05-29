Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EF4672E1F8
	for <lists+selinux@lfdr.de>; Wed, 29 May 2019 18:07:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726311AbfE2QHq (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Wed, 29 May 2019 12:07:46 -0400
Received: from mail-lj1-f175.google.com ([209.85.208.175]:44066 "EHLO
        mail-lj1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726062AbfE2QHq (ORCPT
        <rfc822;selinux@vger.kernel.org>); Wed, 29 May 2019 12:07:46 -0400
Received: by mail-lj1-f175.google.com with SMTP id e13so3005778ljl.11
        for <selinux@vger.kernel.org>; Wed, 29 May 2019 09:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ra2wlzYKKTEWBRtbo/hViEXoX8Ucb5LA2+DinCo96Ms=;
        b=iiW4mWL3qTvAYn+lu0EsbyAUDfI0OzjFj1au3OM0beOVqvyf+mWietcyAd7Cf6fVOY
         4QVk+MftwWgndfd7alMsRuBaBcqMgXBDzGdR9NOEpD+KfHSA4UVG7DqBV1Xy1KogSKg6
         brQFSUrS9g+4VMQyuMlKmIc6Z4S4PO9ZtP1B2LVACcQxasjv3Olahj0ih1Z/IsK5II7B
         UtLJBPG07ULwKT2+Rg753j1QpCqygUD/mBKUKAQgkK7Ai9/4GJnB27F0ztOnaJPu8isQ
         FFiLWHW8qtP0UgH1nh9Ti+VHe7U/1sqqYzSM7J46vqBasJIrJG6yLYPNoH5J1aPR2jLK
         axzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ra2wlzYKKTEWBRtbo/hViEXoX8Ucb5LA2+DinCo96Ms=;
        b=fSFbDXkuDF5orVmHovZOWiV7fxm8Ii3Loo2MasAJF8zsSrrxvm3wh62cUd0awcwAG/
         bYOAd1kifDLhsG4u6+ZNg/IOk0gf787twJVqHK2Ux8n/JDT84oXEZMWOOckJr4p0B9nB
         FkK8QkAvp2ZO1gedRk1sJunvVzIwqJvHFNMyzHjPWwvh6sZz7UFExjOnObcq7wnQha8I
         n+cXi0gA4k9BIahiPYXBXDUEGuFzUENuq6xx6m1aQUp8yTFNgU3iFSCzRxicmVcqKOBL
         FVBgVFOOt//iEjpERqp/aEerxE4wA5C7g2yxpCmVCPaoublqQ+wOctB2zwgOC/rCc1ac
         mU5A==
X-Gm-Message-State: APjAAAWbnhbT1+1Yh6j7NqVdas6jnkdTZZZTPGg5vQSfbWiZI7SMop+1
        hgjYOMHBuPur29s02vmrne0HKUT9irdjxKUdGY4G
X-Google-Smtp-Source: APXvYqwblxi2QH4RkWelb7yRsi0tkOicDkn4Yl3Bz7QaiqOv34tGZ4dGpNaWkffP0LDE7oRlK4IDHuINq96Unc0Xbd4=
X-Received: by 2002:a2e:9a97:: with SMTP id p23mr26707732lji.160.1559146059384;
 Wed, 29 May 2019 09:07:39 -0700 (PDT)
MIME-Version: 1.0
References: <20190529155607.3849-1-plautrba@redhat.com>
In-Reply-To: <20190529155607.3849-1-plautrba@redhat.com>
From:   Paul Moore <paul@paul-moore.com>
Date:   Wed, 29 May 2019 12:07:27 -0400
Message-ID: <CAHC9VhQWAtrQnDWTWXNGxXUtgSR9bxRtAXA3240bo511Wiwy9Q@mail.gmail.com>
Subject: Re: [selinux.wiki] Mention Signed-off-by in Contributing.md
To:     Petr Lautrbach <plautrba@redhat.com>
Cc:     selinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Wed, May 29, 2019 at 11:56 AM Petr Lautrbach <plautrba@redhat.com> wrote:
>
> Signed-off-by: Petr Lautrbach <plautrba@redhat.com>
> ---
>
> Currently Signed-of-by line is not mentioned anywhere.
>
> The same CONTRIBUTING file should be also directly in sources.
>
>  Contributing.md | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Contributing.md b/Contributing.md
> index 9a798b2..0240e7e 100644
> --- a/Contributing.md
> +++ b/Contributing.md
> @@ -46,6 +46,7 @@ patches, please follow these guidelines:
>  -   Patches should apply with -p1
>  -   Must apply against HEAD of the master branch
>  -   Separate large patches into logical patches
> +-   Patch descriptions must end with your "Signed-off-by" line. This means your code meets the [Developer's certificate of origin](https://developercertificate.org/).

I would suggest explicitly including the DCO in this file in case the
URL goes away or the contents change.

>  When adding new, large features or tools it is best to discuss the
>  design on the mailing list prior to submitting the patch.
> --
> 2.22.0.rc1

-- 
paul moore
www.paul-moore.com
