Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EE632278F1
	for <lists+selinux@lfdr.de>; Tue, 21 Jul 2020 08:41:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726152AbgGUGln (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Tue, 21 Jul 2020 02:41:43 -0400
Received: from mx1.polytechnique.org ([129.104.30.34]:46352 "EHLO
        mx1.polytechnique.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726053AbgGUGln (ORCPT
        <rfc822;selinux@vger.kernel.org>); Tue, 21 Jul 2020 02:41:43 -0400
X-Greylist: delayed 329 seconds by postgrey-1.27 at vger.kernel.org; Tue, 21 Jul 2020 02:41:42 EDT
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by ssl.polytechnique.org (Postfix) with ESMTPSA id C2BBD564DDC
        for <selinux@vger.kernel.org>; Tue, 21 Jul 2020 08:36:11 +0200 (CEST)
Received: by mail-oi1-f182.google.com with SMTP id r8so16360843oij.5
        for <selinux@vger.kernel.org>; Mon, 20 Jul 2020 23:36:11 -0700 (PDT)
X-Gm-Message-State: AOAM5325PKjw5TDCr5bbK4zWytuRgW8xKAG1BZs5CEIk/Fe0s2j9W8Gs
        WgTdoAgQjn1sv8gdaWpAl0JantpHKwTmAzZPJp4=
X-Google-Smtp-Source: ABdhPJy/2mjDzVlvfz0oTgMRGWJ3QTAIGjZ55u0Z7qKOllATToWobOdWtPVnJQ2mj6dE2FjS8hZDD+/sVUcHU7VeI7s=
X-Received: by 2002:aca:72ca:: with SMTP id p193mr1925243oic.20.1595313370721;
 Mon, 20 Jul 2020 23:36:10 -0700 (PDT)
MIME-Version: 1.0
References: <51d7bd5e067978ea5340ee408a7329e8b921b372.camel@flyn.org> <CAJfZ7=kxW1zaROh_9rC8-CCafBciFXmFfKFh0B0fwwGYCTp6Lg@mail.gmail.com>
In-Reply-To: <CAJfZ7=kxW1zaROh_9rC8-CCafBciFXmFfKFh0B0fwwGYCTp6Lg@mail.gmail.com>
From:   Nicolas Iooss <nicolas.iooss@m4x.org>
Date:   Tue, 21 Jul 2020 08:35:59 +0200
X-Gmail-Original-Message-ID: <CAJfZ7=mSsEfJgE0OY7ir2pF5zyyFuvWCB9KsDARxoFc++og_Zw@mail.gmail.com>
Message-ID: <CAJfZ7=mSsEfJgE0OY7ir2pF5zyyFuvWCB9KsDARxoFc++og_Zw@mail.gmail.com>
Subject: Re: [PATCH] python/audit2allow: add #include <limits.h> to sepolgen-ifgen-attr-helper.c
To:     "W. Michael Petullo" <mike@flyn.org>
Cc:     SElinux list <selinux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-AV-Checked: ClamAV using ClamSMTP at svoboda.polytechnique.org (Tue Jul 21 08:36:12 2020 +0200 (CEST))
X-Spam-Flag: No, tests=bogofilter, spamicity=0.000000, queueID=3D27E564DE3
X-Org-Mail: nicolas.iooss.2010@polytechnique.org
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Sun, Jul 19, 2020 at 6:43 PM Nicolas Iooss <nicolas.iooss@m4x.org> wrote:
>
> On Thu, Jul 16, 2020 at 10:39 PM W. Michael Petullo <mike@flyn.org> wrote:
> >
> > I found that building on OpenWrt/musl failed with:
> >
> >   sepolgen-ifgen-attr-helper.c:152:16: error: 'PATH_MAX' undeclared ...
> >
> > Musl is less "generous" than glibc in recursively including header
> > files, and I suspect this is the reason for this error. Explicitly
> > including limits.h fixes the problem.
> >
> > Signed-off-by: W. Michael Petullo <mike@flyn.org>
> > ---
> >  python/audit2allow/sepolgen-ifgen-attr-helper.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/python/audit2allow/sepolgen-ifgen-attr-helper.c
> > b/python/audit2allow/sepolgen-ifgen-attr-helper.c
> > index 53f20818..f010c958 100644
> > --- a/python/audit2allow/sepolgen-ifgen-attr-helper.c
> > +++ b/python/audit2allow/sepolgen-ifgen-attr-helper.c
> > @@ -28,6 +28,7 @@
> >
> >  #include <selinux/selinux.h>
> >
> > +#include <limits.h>
> >  #include <stdio.h>
> >  #include <sys/types.h>
> >  #include <sys/stat.h>
> > --
> > 2.26.2
>
> Looks good to me. Nevertheless I had some trouble applying your patch
> using "git am" because your message contained
> "b/python/audit2allow/sepolgen-ifgen-attr-helper.c" on a new line. Did
> you use "git send-email" or something similar, to send your patch?
>
> Acked-by: Nicolas Iooss <nicolas.iooss@m4x.org>
>
> If nobody complains, I will apply this patch tomorrow.

Applied.
Thanks,
Nicolas

