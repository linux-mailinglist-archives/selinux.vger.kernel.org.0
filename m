Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D12F81D4112
	for <lists+selinux@lfdr.de>; Fri, 15 May 2020 00:32:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728654AbgENWcI (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Thu, 14 May 2020 18:32:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728627AbgENWcI (ORCPT
        <rfc822;selinux@vger.kernel.org>); Thu, 14 May 2020 18:32:08 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 736E8C061A0C
        for <selinux@vger.kernel.org>; Thu, 14 May 2020 15:32:07 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id b6so139945ljj.1
        for <selinux@vger.kernel.org>; Thu, 14 May 2020 15:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zQgal8ytnzXytGJuGIqKsS+BhXInFBcpb3bIGXvjaxs=;
        b=NcWPccnenciDSM6X741CyBlTtzBL1BwrFzWvVi/Hg/jdHYK1g/BQpkiqBOn5KbL2wb
         jR6TUU8fmehu1zEleojUmnOxK59xP0kaAXQ6w3qYvW3QsaJvdSruPqRDeTL0jTgLyays
         A/cieaKyAOgUaajY2/xN7kRL+ZipwbE1iv3sjRyaiD5tvSBxpy1U8nTq5Ea2c/FCT16P
         4tjiBMcTKYgCqODmRN5/5lPiDhmmf2ZouQeOjCCiaVuqlX/+LPOhFf+TA4L12uVjqZa8
         YDSDHXwP499XjVayUfK91Zwox7xgvrjYfsqTTFq/xMUQnv/KXxFkOCcbTvijOIjkwSpV
         RIfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zQgal8ytnzXytGJuGIqKsS+BhXInFBcpb3bIGXvjaxs=;
        b=Mb8FpTtB1Ckc5/NI/8sHAalvq5aYCE14elfGfmnIMsZjnVVykaCxv2M0ZRj2GSjSpP
         4XOljAbtWeDPONfEpclfcjvYEMtriPf7ImvIr2qqOMghC3xbciY/uFu321Ssl3L8KbcB
         susb0KMUFCnaWOI4oZCtImi/aLmI0m0+jpp4TdC6jK/OjtLIJI2vdsZHrivWhPoBzCL1
         9q246006tDb4QVUQXSsWWsbG1/QQxUk06oHFuWhQXKasoc6KE1RASgdB/RLLg7afgOAt
         2rtm5pRp5SDopszuJteHS2ygcGZ/AISDzD0B7UmhDL8pIvNGUmABP7mACisBEAWhgHjc
         d+zg==
X-Gm-Message-State: AOAM531EjyPIfSjasuT/nW9rU6KjS025l9LNOT+x9M2oUCFQj10ojK7I
        oIXEBgXefZLfum30LIQ0yNRoGSNSojd8dttQKus=
X-Google-Smtp-Source: ABdhPJznpW2TdnPT7F0s1C72nlMbPZY50j43aZw92vChFLuR42kVFr6q9zlxGC9Cm6rL0KKAMFDRhM1qgj6d1mmK8Vc=
X-Received: by 2002:a2e:a545:: with SMTP id e5mr260068ljn.271.1589495525795;
 Thu, 14 May 2020 15:32:05 -0700 (PDT)
MIME-Version: 1.0
References: <3581425.j52oWYpJar@liv> <20200407085922.GA438349@workstation>
 <20200422065053.GA167999@workstation> <CAHC9VhQUmY=ue3zWdTnE1Ehi90Lj3077sLbu+jyaWoAVKuKyeQ@mail.gmail.com>
 <CAFftDdo1hqbacU2TD6zQp_t_KJq-KS5pWBMr89c4HA3=aUdUbQ@mail.gmail.com>
 <20200423150039.GC204116@workstation> <CAFftDdq_g_rUy=KFh_gOEXoVxkCgz9qWzR17d4Mt1qVChoVLjg@mail.gmail.com>
 <CAEjxPJ5qm8P0jmRvQNavDsrWCDDf7yCeRQ1orp_S63u-2EfBoA@mail.gmail.com>
In-Reply-To: <CAEjxPJ5qm8P0jmRvQNavDsrWCDDf7yCeRQ1orp_S63u-2EfBoA@mail.gmail.com>
From:   William Roberts <bill.c.roberts@gmail.com>
Date:   Thu, 14 May 2020 17:31:54 -0500
Message-ID: <CAFftDdopFfNynCNTnzo34XNVc=t49=82NOQP8OFq+fXLC9Ghtw@mail.gmail.com>
Subject: Re: Fedora VM On Travis for Testing
To:     Stephen Smalley <stephen.smalley.work@gmail.com>
Cc:     SElinux list <selinux@vger.kernel.org>,
        Paul Moore <paul@paul-moore.com>,
        Stephen Smalley <sds@tycho.nsa.gov>,
        Nicolas Iooss <nicolas.iooss@m4x.org>,
        Jason Zaman <jason@perfinion.com>,
        Steve Lawrence <slawrence@tresys.com>,
        Chris PeBenito <pebenito@ieee.org>,
        Jeffrey Vander Stoep <jeffv@google.com>,
        James Carter <jwcart2@tycho.nsa.gov>,
        Joshua Brindle <brindle@gmail.com>,
        Ondrej Mosnacek <omosnace@redhat.com>,
        Petr Lautrbach <plautrba@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Thu, May 14, 2020 at 5:21 PM Stephen Smalley
<stephen.smalley.work@gmail.com> wrote:
>
> On Thu, May 14, 2020 at 5:03 PM William Roberts
> <bill.c.roberts@gmail.com> wrote:
> >
> > I just wanted to lay out a demo of a Fedora 32 cloud VM image booting
> > on Travis with execution happening in the Fedora VM.
> > The Fedora VM contains the selinux source code for that particular
> > travis build, so it has the PR patches, etc.
> > The VM has networking.
> >
> > The build logs for the Travis run are here:
> >   - https://travis-ci.org/github/williamcroberts/selinux/builds/687185489
> >
> > Which comes from my git tree here:
> >   - https://github.com/williamcroberts/selinux/tree/kvm-fedora-testing
> >
> > Note that it's super messy, I need to go through and cleanup both the
> > patch and the git
> > history. I also should verify the downloaded image is signed for the VM.
> > Also note that I may rebase/squash my git branch at any time.
> >
> > Petr started a release document here:
> >   - https://github.com/bachradsusi/SELinuxProject-selinux/blob/RELEASE/RELEASE_PROCESS.md
> >
> > I'd like to gather feedback, and perhaps more comments on:
> > 1. Is this CI approach worth continuing?
> > 2. Comments on the CI scripts (I have no idea what I am doing, common issue)
> > 3. Comments, patches, suggestions on what tests to run in this CI environment.
> > 4. More information in in the RELEASE_PROCESS.md file. I made some
> > comments there
> >     as well on ideas.
> >
> > My goal here is that a release can occur if CI is passing without
> > worry, and that
> > we automate manual steps as much as possible. This way, if we get hit by a bus
> > releases can occur without much effort.
>
> I'm amazed travis-ci supports all of that (especially for free).
> Hopefully you aren't violating their terms of use.

Not that I am aware of and I read their terms of use.
https://docs.travis-ci.com/legal/terms-of-service/

They don't seem to limit what you can do, it seems to be centered
around availability, liability and support.

I stumbled into other projects on github that were running virsh commands

> The biggest thing I'd add is to build and install the selinux
> userspace in place of the stock Fedora versions (sudo make
> LIBDIR=/usr/lib64 SHLIBDIR=/lib64 install install-pywrap relabel) and
> then build and run the selinux-testsuite to exercise the SELinux
> userspace and kernel runtime functionality.  Other things to possibly

Perfect, that's the info I was looking for.

> add would be rebuilding upstream refpolicy (similar to its
> .travis.yml) with the latest userspace, rebuilding and running setools
> (but until we decouple it from libsepol internals this will
> periodically break).

If it breaks, it breaks, just means we need to merge something or actually
fix it properly IIUC.
