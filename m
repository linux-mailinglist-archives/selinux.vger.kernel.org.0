Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0FDB449E5A
	for <lists+selinux@lfdr.de>; Mon,  8 Nov 2021 22:39:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240496AbhKHVmn convert rfc822-to-8bit (ORCPT
        <rfc822;lists+selinux@lfdr.de>); Mon, 8 Nov 2021 16:42:43 -0500
Received: from mx1.polytechnique.org ([129.104.30.34]:36308 "EHLO
        mx1.polytechnique.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240495AbhKHVmm (ORCPT
        <rfc822;selinux@vger.kernel.org>); Mon, 8 Nov 2021 16:42:42 -0500
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by ssl.polytechnique.org (Postfix) with ESMTPSA id D96F25605AE
        for <selinux@vger.kernel.org>; Mon,  8 Nov 2021 22:39:55 +0100 (CET)
Received: by mail-pl1-f173.google.com with SMTP id u11so17025731plf.3
        for <selinux@vger.kernel.org>; Mon, 08 Nov 2021 13:39:55 -0800 (PST)
X-Gm-Message-State: AOAM533knZVKoIQZeFqAa8WiSW85kpTB56Iob8HEMzcVMO+bhlbmVcVV
        AEKuyip5qQGsfx8ZJjrG67/mp7ZtQmAlYBGek/U=
X-Google-Smtp-Source: ABdhPJz9lBMlArgkBnjc85r1xLoC+Vx71i9iCgKgHrt6IWOwNzp636yLd32I1JhoazX16rDDgeEAK26ne0YRzWmD05I=
X-Received: by 2002:a17:903:30cd:b0:141:c6dd:4d03 with SMTP id
 s13-20020a17090330cd00b00141c6dd4d03mr2487907plc.16.1636407594692; Mon, 08
 Nov 2021 13:39:54 -0800 (PST)
MIME-Version: 1.0
References: <20211015123100.15785-1-cgzones@googlemail.com> <20211021140519.6593-1-cgzones@googlemail.com>
In-Reply-To: <20211021140519.6593-1-cgzones@googlemail.com>
From:   Nicolas Iooss <nicolas.iooss@m4x.org>
Date:   Mon, 8 Nov 2021 22:39:43 +0100
X-Gmail-Original-Message-ID: <CAJfZ7=nu3AsjWSYNtpbi4--Mm98QtxWrOshXkYsCBEcRoAwYeg@mail.gmail.com>
Message-ID: <CAJfZ7=nu3AsjWSYNtpbi4--Mm98QtxWrOshXkYsCBEcRoAwYeg@mail.gmail.com>
Subject: Re: [PATCH v2] libselinux: use valid address to silence glibc 2.34 warnings
To:     =?UTF-8?Q?Christian_G=C3=B6ttsche?= <cgzones@googlemail.com>
Cc:     SElinux list <selinux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-AV-Checked: ClamAV using ClamSMTP at svoboda.polytechnique.org (Mon Nov  8 22:39:56 2021 +0100 (CET))
X-Spam-Flag: No, tests=bogofilter, spamicity=0.013845, queueID=A98595605B0
X-Org-Mail: nicolas.iooss.2010@polytechnique.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Thu, Oct 21, 2021 at 4:06 PM Christian Göttsche
<cgzones@googlemail.com> wrote:
>
> Glibc 2.34 added an access function attribute to pthread_setspecific(3).
> This leads to the following GCC warnings:
>
>     In file included from matchpathcon.c:5:
>     matchpathcon.c: In function ‘matchpathcon_init_prefix’:
>     selinux_internal.h:38:25: error: ‘pthread_setspecific’ expecting 1 byte in a region of size 0 [-Werror=stringop-overread]
>        38 |                         pthread_setspecific(KEY, VALUE);        \
>           |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>     matchpathcon.c:359:9: note: in expansion of macro ‘__selinux_setspecific’
>       359 |         __selinux_setspecific(destructor_key, (void *)1);
>           |         ^~~~~~~~~~~~~~~~~~~~~
>     In file included from selinux_internal.h:2,
>                      from matchpathcon.c:5:
>     /usr/include/pthread.h:1167:12: note: in a call to function ‘pthread_setspecific’ declared with attribute ‘access (none, 2)’
>      1167 | extern int pthread_setspecific (pthread_key_t __key,
>           |            ^~~~~~~~~~~~~~~~~~~
>
> The actual value and the validity of the passed pointer is irrelevant,
> since it does not gets accessed internally by glibc and
> pthread_getspecific(3) is not used.
> Use a pointer to a global object to please GCC.
>
> Closes: https://github.com/SELinuxProject/selinux/issues/311
> Signed-off-by: Christian Göttsche <cgzones@googlemail.com>

Acked-by: Nicolas Iooss <nicolas.iooss@m4x.org>

Sorry for the delay, I have been busy with other topics.

Thanks!
Nicolas

> ---
>  libselinux/src/matchpathcon.c   | 2 +-
>  libselinux/src/procattr.c       | 2 +-
>  libselinux/src/setrans_client.c | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/libselinux/src/matchpathcon.c b/libselinux/src/matchpathcon.c
> index 1e7f8890..ea78a23e 100644
> --- a/libselinux/src/matchpathcon.c
> +++ b/libselinux/src/matchpathcon.c
> @@ -356,7 +356,7 @@ int matchpathcon_init_prefix(const char *path, const char *subset)
>                 mycanoncon = default_canoncon;
>
>         __selinux_once(once, matchpathcon_init_once);
> -       __selinux_setspecific(destructor_key, (void *)1);
> +       __selinux_setspecific(destructor_key, /* some valid address to please GCC */ &selinux_page_size);
>
>         options[SELABEL_OPT_SUBSET].type = SELABEL_OPT_SUBSET;
>         options[SELABEL_OPT_SUBSET].value = subset;
> diff --git a/libselinux/src/procattr.c b/libselinux/src/procattr.c
> index 6552ee01..142fbf3a 100644
> --- a/libselinux/src/procattr.c
> +++ b/libselinux/src/procattr.c
> @@ -68,7 +68,7 @@ void  __attribute__((destructor)) procattr_destructor(void)
>  static inline void init_thread_destructor(void)
>  {
>         if (destructor_initialized == 0) {
> -               __selinux_setspecific(destructor_key, (void *)1);
> +               __selinux_setspecific(destructor_key, /* some valid address to please GCC */ &selinux_page_size);
>                 destructor_initialized = 1;
>         }
>  }
> diff --git a/libselinux/src/setrans_client.c b/libselinux/src/setrans_client.c
> index 52a8ba78..faa12681 100644
> --- a/libselinux/src/setrans_client.c
> +++ b/libselinux/src/setrans_client.c
> @@ -272,7 +272,7 @@ static inline void init_thread_destructor(void)
>         if (!has_setrans)
>                 return;
>         if (destructor_initialized == 0) {
> -               __selinux_setspecific(destructor_key, (void *)1);
> +               __selinux_setspecific(destructor_key, /* some valid address to please GCC */ &selinux_page_size);
>                 destructor_initialized = 1;
>         }
>  }
> --
> 2.33.0
>

