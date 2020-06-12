Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DA721F7806
	for <lists+selinux@lfdr.de>; Fri, 12 Jun 2020 14:40:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726085AbgFLMku (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Fri, 12 Jun 2020 08:40:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726024AbgFLMku (ORCPT
        <rfc822;selinux@vger.kernel.org>); Fri, 12 Jun 2020 08:40:50 -0400
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com [IPv6:2607:f8b0:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FB72C03E96F
        for <selinux@vger.kernel.org>; Fri, 12 Jun 2020 05:40:50 -0700 (PDT)
Received: by mail-oi1-x244.google.com with SMTP id i74so8557794oib.0
        for <selinux@vger.kernel.org>; Fri, 12 Jun 2020 05:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tq2s1YaNAM8PKTaS6uy76Tp9riwQB440rGiZ+EKJMpc=;
        b=sI74e6/qOqS0ucu+zMFFX88w61x7NloWfWl8Xf8Up238Cai+RKvRWFse+To9DK9jVE
         681emOxPmBOybjJKXANxm7DLpd1nrw1vtg0HrXLVOjER0Qy27l54kYypoycSYt6uKaKH
         y2Kpl0IuYPUBJRwk5V/Ug4bQb10vltzFO49WWxlFILise96LZWnH2J4ar61Rps07onPb
         xbn0pVwk/epVn9AhzV7QGFNgE4On0UH145SLQE/d/FsKmIo7X1nPCwNa8Ra+jqEGYlr/
         O8UtbSkPdoxAZdMwBb9xlbYdpnjiTvTMNziEplAtveQg5SoApNR0edvuslBwwjwZaS8k
         JB+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tq2s1YaNAM8PKTaS6uy76Tp9riwQB440rGiZ+EKJMpc=;
        b=Z2Vz2dBB73ue2IpAEzTEu9oLI1vgDLgryq6uFU8BIDI+XTq4NbnbRXi7e3pyq0VL4U
         m3tNQ65br9pOZ/Mhrtsleralft1yADMoUmN4oOJwiF22eaSwYRZEBspsqOn0NoOymx49
         1AKCKCrFDu3PVv/0ibRgxsBjNqbbR3vM17UZHa7BnGNedHRJcAHrKnLT6fbiZnL+DUDw
         y5fO3Snd70Iu+YKZ/5wl14hoKvXVyD2ZBrTpvYnZHt80m3QuZjXTFKvS2dB2hWAl6B4A
         4SWjps2DqPJSSBhziNlXXqLJfRoCBI+QO4pDhYhcamG9y8wg/0S2trZjns3DNeLPkj34
         Ff5Q==
X-Gm-Message-State: AOAM532Eo97iyXJzsVOcDYIHy4Ny857wUB2MWwSLrnu4fSwy0HixHuwm
        BOlVIvsYlxxW7o3JeHmzHeaJcbzRPGnHvrYiG9g=
X-Google-Smtp-Source: ABdhPJxA3ooAvg/UGNDCqnb/VXQmaFV6pMnx7i71Gb0CF4vqrzgbTQsLOw2Qu1y4OgfQfrKTZnrOtqawntBFHBISjzY=
X-Received: by 2002:aca:3283:: with SMTP id y125mr1994994oiy.140.1591965649635;
 Fri, 12 Jun 2020 05:40:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200601072916.219197-1-chirantan@chromium.org>
 <CAEjxPJ41UVY7C9HAahsmm5P4babvi+VVDZi6a2Zwf7MopJgbnQ@mail.gmail.com>
 <CAJFHJrp6pM1EUcBWFL4bKQUA4wZT4N5_0QutXv5vXr7TNAvqVg@mail.gmail.com>
 <CAEjxPJ7QD-zPyytQ6-VpuoAqnuS91fzA3nj-711OsK_9cy-kWQ@mail.gmail.com> <CAJFHJrp560C=KB-LNdMAbJB=r9byUJ0Pgd5u9=o8vHrsB3Ht2Q@mail.gmail.com>
In-Reply-To: <CAJFHJrp560C=KB-LNdMAbJB=r9byUJ0Pgd5u9=o8vHrsB3Ht2Q@mail.gmail.com>
From:   Stephen Smalley <stephen.smalley.work@gmail.com>
Date:   Fri, 12 Jun 2020 08:40:38 -0400
Message-ID: <CAEjxPJ5UtA7ixPd0Je6tMgBuykqo_tJDp-gRDY89M--9dQb_3A@mail.gmail.com>
Subject: Re: [PATCH] selinux: Allow file owner to set "security.sehash"
To:     Chirantan Ekbote <chirantan@chromium.org>
Cc:     Jeffrey Vander Stoep <jeffv@google.com>,
        Nick Kralevich <nnk@google.com>,
        Paul Moore <paul@paul-moore.com>,
        Eric Paris <eparis@parisplace.org>,
        Dylan Reid <dgreid@chromium.org>,
        Suleiman Souhlal <suleiman@chromium.org>,
        SElinux list <selinux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Fri, Jun 12, 2020 at 12:00 AM Chirantan Ekbote
<chirantan@chromium.org> wrote:
>
> On Fri, Jun 5, 2020 at 9:23 PM Stephen Smalley
> <stephen.smalley.work@gmail.com> wrote:
> >
> > On Fri, Jun 5, 2020 at 2:21 AM Chirantan Ekbote <chirantan@chromium.org> wrote:
> > >
> >
> > > The background for this patch is that I have a fuse server that runs
> > > in a user namespace.  It runs as root in that namespace and keeps all
> > > the file system caps so that it can set selinux xattrs.  However, it
> > > cannot set the sehash xattr as that needs CAP_SYS_ADMIN in the parent
> > > namespace.  Looking at the code I thought that might have just been an
> > > oversight but if it's intentional then do you have any suggestions for
> > > how to make this work?  I'd rather not weaken the sandbox for this
> > > process just so that it can set this one xattr.
> >
> > I'd be willing to move from requiring CAP_SYS_ADMIN to performing a
> > SELinux permission check (either FILE__RELABELFROM or a new one), but
> > I'd like the Android folks to chime in here.  Maybe you can ping them
> > through other channels since they haven't responded yet.
>
> I contacted them separately and they are not interested in relaxing
> the requirements and also said that the kernel shouldn't have any
> knowledge of the sehash xattr.  So I guess we can just drop this.

Ok.  Setting of security.sehash is optional so you can always just
leave it disabled.  Only downside is it will then have to walk the
entire directory tree each time to check the labels.
