Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 800542D515F
	for <lists+selinux@lfdr.de>; Thu, 10 Dec 2020 04:30:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729206AbgLJD2V (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Wed, 9 Dec 2020 22:28:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729907AbgLJD2J (ORCPT
        <rfc822;selinux@vger.kernel.org>); Wed, 9 Dec 2020 22:28:09 -0500
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79D1DC0613CF
        for <selinux@vger.kernel.org>; Wed,  9 Dec 2020 19:27:29 -0800 (PST)
Received: by mail-ej1-x644.google.com with SMTP id lt17so5314539ejb.3
        for <selinux@vger.kernel.org>; Wed, 09 Dec 2020 19:27:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Yj5ClafbvClxeaJMNU4kT+ciDkx2HOX5A5odS7IEwVE=;
        b=gtg4wa8ElTma6DhRou/SRWiSEoxmYAR8lgQb08Nf9L9QJu2KRpV2uxdFA2APKH/4Oz
         uEEaN0FBYrhJqGfb2ZV/Lycgrhwuy8yAn269z4W8TNHWv86L69h5Fy1xAuIXDjFu65zE
         3UJNtBYWZSTAK1+tHshSHh76RMrh+oYNud5lo/mLGF7h+kXw3kc/2pnD1ktaPLcf5PpL
         tjBV9l4z/P95qhr0YHXtqlAPHdme8XpRdVa99Dq8L6La5IKawxna7Tw0wZSuGR8ADdqp
         3gOHqMPLtKuly+tKwHipr+iIVh2Vge4LaDIr7n7Y9bEsc+nndC6N+qIPkLqscmPuoBpX
         bUiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Yj5ClafbvClxeaJMNU4kT+ciDkx2HOX5A5odS7IEwVE=;
        b=pkuhfatX1Pq6MzOH1e45PGtJ6/AI0CfmzzgAMtZFDG7LLZMyJrEaoSG2ESsQwDWC+v
         0VDPiyERpx5J/4wQK0MT/4PGmAOsEAQ8CReRdCXiKLszVlc//tdEk8ZBe6+B8pnsY6Yn
         8/XlrqqpqQBf0xXu3wGyWy25LkD8TdQZQo8BkKAc8fnwyrqCfgzBky1NeNs79WzPxwnq
         5E2ZpVAhouAE5u5k49Q34seG8dNDI0rbNeVbsWnb61BF69otmi7p0Fra+CCA2NEevqGi
         UWpyGauViYmdX6EQwlg6I4ZAugAPJjSgRTXivbjoPeCm5UsTc9cryri63OpnBkLPSZOM
         VgJw==
X-Gm-Message-State: AOAM533QIeiTHYuGjpaEGaaecJf9wwg2mMCqv2gARcR724t4E+jMVYiR
        77mFLKJ9/540IageZRiWW6C2mEdd3j4Gw3WGOwhevw==
X-Google-Smtp-Source: ABdhPJwR/WwTNr8I/FrWOkbABvGcLkXFnyRXJ90aS+V1/KRXjYw+BbDxJ+JriVw3mpY1FS2xK9SqDf++GH+uc9Q1xwo=
X-Received: by 2002:a17:906:7c49:: with SMTP id g9mr4749290ejp.185.1607570847988;
 Wed, 09 Dec 2020 19:27:27 -0800 (PST)
MIME-Version: 1.0
References: <20201125125402.211692-1-lokeshgidra@google.com>
 <CAFqZXNsry1zqGND-iBaYmwb_KeCvoat-LQFywf04TAp998sqXQ@mail.gmail.com> <CAHC9VhQWXtLZfhwBppH_aFqipwED4u0qOCLX=LQL2YZ6P3CvMQ@mail.gmail.com>
In-Reply-To: <CAHC9VhQWXtLZfhwBppH_aFqipwED4u0qOCLX=LQL2YZ6P3CvMQ@mail.gmail.com>
From:   Lokesh Gidra <lokeshgidra@google.com>
Date:   Wed, 9 Dec 2020 19:27:16 -0800
Message-ID: <CA+EESO52Gj0hpqfzZZb1GidP3cMbgT7Co0yp1ChW82-rAsF1DA@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] selinux-testsuite: Add userfaultfd test
To:     Paul Moore <paul@paul-moore.com>
Cc:     Ondrej Mosnacek <omosnace@redhat.com>,
        Stephen Smalley <stephen.smalley.work@gmail.com>,
        SElinux list <selinux@vger.kernel.org>,
        Kalesh Singh <kaleshsingh@google.com>,
        Calin Juravle <calin@google.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Jeff Vander Stoep <jeffv@google.com>,
        "Cc: Android Kernel" <kernel-team@android.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Wed, Dec 9, 2020 at 6:45 PM Paul Moore <paul@paul-moore.com> wrote:
>
> On Fri, Nov 27, 2020 at 9:09 AM Ondrej Mosnacek <omosnace@redhat.com> wrote:
> > On Wed, Nov 25, 2020 at 1:54 PM Lokesh Gidra <lokeshgidra@google.com> wrote:
> > > Confirm SELinux policies are enforced on userfaultfd operations
> > > via secure anon-inode interface.
> > >
> > > Signed-off-by: Lokesh Gidra <lokeshgidra@google.com>
>
> ...
>
> > This is a good start, but it is only a very basic test :)
> >
> > I would expect at least these tests here:
> > 1. ...
>
> Since it has been a while I wanted to check-in and see how this was
> going?  Having a good test in place in the test suite is an important
> part of getting the kernel code merged.
>

Sorry for the delay. I got caught up in some other work. I'll send
another patch addressing all the comments from Ondrej by the end of
this week.
> --
> paul moore
> www.paul-moore.com
