Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 38B1629F80
	for <lists+selinux@lfdr.de>; Fri, 24 May 2019 22:00:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391723AbfEXUAk (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Fri, 24 May 2019 16:00:40 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:37050 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391669AbfEXUAk (ORCPT
        <rfc822;selinux@vger.kernel.org>); Fri, 24 May 2019 16:00:40 -0400
Received: by mail-ot1-f68.google.com with SMTP id r10so9788063otd.4
        for <selinux@vger.kernel.org>; Fri, 24 May 2019 13:00:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ObtpsatTjRcx7Mw1tOIegIwh2MJlgDi8L4jZt6VL68I=;
        b=Vuw2LAbj8UU+Qb8CyhN4OCU2e43tXjWr+ijGKubU/tL91rRnurUZamIw59SCaOA39A
         dsMRCd49R7+WSvmhFgL97b43Z9uai4hZdZFC5oJOkpuUrcj33d1CAO/TDMM3+glKagm4
         HYYCO0zch2LP2te3ZATb352ELQ0BpSpxQNC3HRdDz/Z26TotQ9ulXSWKDJJS4WoJGAx1
         bmbhqCfqu9BXf36dtiLsCvTj7YYAAyVYJr4l8+LPybO5m8XC642gy1CgypGd+dJUMuzf
         FkOp+q2GbxZ79bTTEzHlWPgH82ZUoA/QtJ7b7qB7r13YG/9mfSZZvl6VE6emApnd0SSE
         roKA==
X-Gm-Message-State: APjAAAUSjz2SIfvoe9cmZ4kB6CuZr7SgCBDVQpf1JRUMsxm1bFMBOCXh
        EQEbEN1+4pSXD0V4UJSxokI3lfcR9w98KMmIekp4uOoMHgM=
X-Google-Smtp-Source: APXvYqxoFxsO4EQ9YHe/r5BxT8CpPKF3ffloVshw9MrmeUg3pBJy2eZFamIWSNNZ4nvJoDfJU4iNStpowgS3ArFR9IA=
X-Received: by 2002:a9d:71d1:: with SMTP id z17mr37180078otj.22.1558728039710;
 Fri, 24 May 2019 13:00:39 -0700 (PDT)
MIME-Version: 1.0
References: <20190523102449.9621-1-omosnace@redhat.com> <0571b2a9-2f34-72c4-431d-450adb7df6a5@tycho.nsa.gov>
 <CAFqZXNsYY5HWkcqwYhu2sZR3eGQGDJnEr43pVbM1fxeA0M1Lzg@mail.gmail.com> <0480cc58-a4f4-bd0f-9edb-f2befe546578@tycho.nsa.gov>
In-Reply-To: <0480cc58-a4f4-bd0f-9edb-f2befe546578@tycho.nsa.gov>
From:   Ondrej Mosnacek <omosnace@redhat.com>
Date:   Fri, 24 May 2019 22:00:28 +0200
Message-ID: <CAFqZXNtkoOWuKX1J8Y+y0ymEOEfPc3oy1OU1XBWRaLtgbOAAHQ@mail.gmail.com>
Subject: Re: [Non-DoD Source] [PATCH userspace 0/4] Remove redundant rules
 when building policydb
To:     jwcart2 <jwcart2@tycho.nsa.gov>
Cc:     selinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Fri, May 24, 2019 at 6:01 PM jwcart2 <jwcart2@tycho.nsa.gov> wrote:
> On 5/24/19 4:54 AM, Ondrej Mosnacek wrote:
> > On Thu, May 23, 2019 at 10:39 PM jwcart2 <jwcart2@tycho.nsa.gov> wrote:
> >> On 5/23/19 6:24 AM, Ondrej Mosnacek wrote:
> >>> This series implements an optional optimization step when building
> >>> a policydb via semodule or secilc, which identifies and removes rules
> >>> that are redundant -- i.e. they are already covered by a more general
> >>> rule based on attribute inheritance.
> >>>
> >>> Since the performance penalty of this additional step is very small
> >>> (it adds about 1 s to the current running time of ~20-30 s [1]) and
> >>> it can have a big positive effect on the number of rules in policy
> >>> (it manages to remove ~40% AV rules from Fedora 29 policy), the
> >>> optimization is enabled by default and can be turned off using a
> >>> command-line option (--no-optimize) in secilc and semodule [2].
> >>>
> >>> The optimization routine eliminates:
> >>>    * all allow/neverallow/dontaudit/auditallow rules (including xperm
> >>>      variants) that are covered by another more general rule,
> >>>    * all conditional versions of the above rules that are covered by a
> >>>      more general rule either in the unconditional table or in the same
> >>>      branch of the same conditional.
> >>>
> >>> The optimization doesn't process other rules, since they currently
> >>> do not support attributes. There is some room left for more precise
> >>> optimization of conditional rules, but it would likely bring only
> >>> little additional benefit.
> >>>
> >>> When the policy is mostly or fully expanded, the optimization should
> >>> be turned off. If it isn't, the policy build time will increase a lot
> >>> for no benefit. However, the complexity of optimization will be only
> >>> linear w.r.t. the number of rules and so the impact should not be
> >>> catastrophic. (When testing with secilc on a subset of Fedora policy
> >>> with -X 100000 the build time was 1.7 s with optimization vs. 1 s
> >>> without it.)
> >>>
> >>> Tested live on my Fedora 29 devel machine under normal use. No unusual
> >>> AVCs were observed with optimized policy loaded.
> >>>
> >>> Travis build passed: https://travis-ci.org/WOnder93/selinux/builds/536157427
> >>>
> >>> NOTE: The xperm rule support wasn't tested -- I would welcome some
> >>>         peer review/testing of this part.
> >>>
> >>> [1] As measured on my machine (Fedora 29 policy, x86_64).
> >>> [2] I have no problem with switching it to opt-in if that is preferred.
> >>>
> >>> Ondrej Mosnacek (4):
> >>>     libsepol: add a function to optimize kernel policy
> >>>     secilc: optimize policy before writing
> >>>     libsemanage: optimize policy on rebuild
> >>>     semodule: add flag to disable policy optimization
> >>>
> >>>    libsemanage/include/semanage/handle.h      |   4 +
> >>>    libsemanage/src/direct_api.c               |   7 +
> >>>    libsemanage/src/handle.c                   |  13 +
> >>>    libsemanage/src/handle.h                   |   1 +
> >>>    libsemanage/src/libsemanage.map            |   5 +
> >>>    libsepol/include/sepol/policydb.h          |   5 +
> >>>    libsepol/include/sepol/policydb/policydb.h |   2 +
> >>>    libsepol/src/libsepol.map.in               |   5 +
> >>>    libsepol/src/optimize.c                    | 370 +++++++++++++++++++++
> >>>    libsepol/src/policydb_public.c             |   5 +
> >>>    policycoreutils/semodule/semodule.c        |  12 +-
> >>>    secilc/secilc.c                            |  16 +-
> >>>    12 files changed, 442 insertions(+), 3 deletions(-)
> >>>    create mode 100644 libsepol/src/optimize.c
> >>>
> >>
> >> It would be nice to have checkpolicy support this as well. It shouldn't be too
> >> hard to do that.
> >
> > Looking at checkpolicy.c, it looks like it only generates POLICY_BASE
> > or POLICY_MODULE policy types. I currently limit the optimization only
> > to POLICY_KERN type, because from comments in policydb.h I got the
> > impression that other policy types have different structure and I'm
> > not sure if they need some special handling. I don't have that much
> > knowledge about SELinux userspace code yet... if you can give me some
> > hints about the difference between the various POLICY_* types, then I
> > will be happy to make some adjustments if they make sense.
> >
>
> It is kind of confusing. I sent a patch to the list. You can incorporate that
> into your patch series or I can just do it after.

Thanks, I'll have a look at it and probably just include in v2.

>
> I've attached the test policy that I used and a test script. I haven't had a
> chance to dig more into what may be going on.

Cool, this test policy will also help me test the xperms support,
thanks! I will play with it tomorrow or on Monday.

I'm ~95% sure that my incremental patch will fix the dontaudit issue -
if I manage to verify it, then I'll squash it in and include in v2.

>
> Jim
>
>
> >>
> >> I need to do some more testing, but I think something is not working correctly.
> >>
> >> I am starting from conf files here because I have both Fedora and Android ones
> >> that I have used for testing and it is easier to run them through checkpolicy to
> >> convert to CIL.
> >>
> >> With these rules:
> >>
> >> # Redundant 1
> >> allow tp01 tpr1:cl01 { p01a p11a p01b p11b };
> >> allow tp02 tpr1:cl01 { p01a p11a };
> >> allow at02 tpr1:cl01 { p01a p11a p01b };
> >>
> >> # Redundant 2
> >> dontaudit tp01 tpr2:cl01 { p01a p11a p01b p11b };
> >> dontaudit tp02 tpr2:cl01 { p01a p11a };
> >> dontaudit at02 tpr2:cl01 { p01a p11a p01b };
> >>
> >> # Redundant 3
> >> allow at02 tpr3:cl01 { p01a p11a p01b };
> >> if (b01) {
> >>     allow tp01 tpr3:cl01 { p01a p11a p01b p11b };
> >>     allow tp02 tpr3:cl01 { p01a p11a };
> >> }
> >>
> >> # Redundant 4
> >> dontaudit at02 tpr4:cl01 { p01a p11a p01b };
> >> if (b01) {
> >>     dontaudit tp01 tpr4:cl01 { p01a p11a p01b p11b };
> >>     dontaudit tp02 tpr4:cl01 { p01a p11a };
> >> }
> >>
> >>
> >> I see the following from sediff:
> >>
> >> Allow Rules (0 Added, 1 Removed, 0 Modified)
> >>      Removed Allow Rules: 1
> >>         - allow tp02 tpr3:cl01 { p01a p11a }; [ b01 ]:True
> >>
> >> Dontaudit Rules (0 Added, 1 Removed, 1 Modified)
> >>      Removed Dontaudit Rules: 1
> >>         - dontaudit tp01 tpr4:cl01 { p01a p01b p11a p11b }; [ b01 ]:True
> >>      Modified Dontaudit Rules: 1
> >>         * dontaudit tp01 tpr2:cl01 { p01b p11a p01a -p11b };
> >>
> >> So it handles Redundant 1 just fine, but has problems with Redundant 2 which
> >> should be the same.
> >
> > Yes, I think I'm handling the dontaudit rules incorrectly... For some
> > (historical?) reason they actually specify the permissions that *are*
> > audited, although the semantic of combining multiple rules is still
> > that a permission is dontaudited if there is at least one dontaudit
> > rule for it, so the logic of handling the raw perms data has to be
> > inverted for AVTAB_AUDITDENY entries. I had noticed earlier that
> > AVTAB_AUDITDENY rules are handled differently but somehow I concluded
> > that the perms values should still bitwise-or together...
> >
> > Can you please try it with adding:
> >
> > if (specified & AVTAB_AUDITDENY)
> >      return (d1->data & d2->data) == d2->data;
> >
> > to the beginning of match_avtab_datum() in optimize.c? (patch form
> > here: https://github.com/WOnder93/selinux/commit/17c77e4bb8857ebfff9b32e2e0bc800e206aba1e.patch)
> >
> >>
> >> I don't remember what to expect from sediff for boolean rules. I had played
> >> around with removing rules with some of my earlier lua tools and I thought that
> >> sediff handled removing redundant rules from booleans, but I could be wrong.
> >>
> >> I will look at this more maybe tomorrow, but most likely after the Memorial day
> >> weekend.
> >>
> >> Jim
> >>
> >> --
> >> James Carter <jwcart2@tycho.nsa.gov>
> >> National Security Agency
> > --
> > Ondrej Mosnacek <omosnace at redhat dot com>
> > Software Engineer, Security Technologies
> > Red Hat, Inc.
> >
>
>
> --
> James Carter <jwcart2@tycho.nsa.gov>
> National Security Agency

-- 
Ondrej Mosnacek <omosnace at redhat dot com>
Software Engineer, Security Technologies
Red Hat, Inc.
