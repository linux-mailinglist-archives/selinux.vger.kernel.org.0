Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA74239F479
	for <lists+selinux@lfdr.de>; Tue,  8 Jun 2021 13:02:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231564AbhFHLEB (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Tue, 8 Jun 2021 07:04:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45031 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231286AbhFHLEA (ORCPT
        <rfc822;selinux@vger.kernel.org>); Tue, 8 Jun 2021 07:04:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1623150127;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=LH+kGGXvul4/VtBvp8swcElDLFMoCOqrADXXWgo8nOs=;
        b=gVeHG8XXgfKJ1ayNAf2VUgL4KsZUCHxD8a8RZLyzNYraPeFXq9S/AxnoXOkSrto6EfvCdc
        SikPkf5xvKlx6L3tbj7JLMgeI1d7crkOmcrDD+trVBczhgpEkp9yFttubdriC634jc6zsr
        GH00Qdc0i8lHlOtCQy7kM6GMGglPnnE=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-382-CkyFTxWgPyGO1BYNua8RfQ-1; Tue, 08 Jun 2021 07:02:06 -0400
X-MC-Unique: CkyFTxWgPyGO1BYNua8RfQ-1
Received: by mail-yb1-f197.google.com with SMTP id x187-20020a25e0c40000b029052a5f0bf9acso26622972ybg.1
        for <selinux@vger.kernel.org>; Tue, 08 Jun 2021 04:02:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LH+kGGXvul4/VtBvp8swcElDLFMoCOqrADXXWgo8nOs=;
        b=flq4NUsl+AXI53nvj0yevok+oL8XUl1KT4CWdqcPCDyBN97nObuBI+vYthp77TtvTl
         PJG35nH8qN08tGTU/PWKDn6NeJB6VWswLjSSyoMMNN1nkNYEemyZqB2bSYGDlwW3LWwn
         NROdPXnwe6cNm+iHk0nhDQYhhqqmKMl7Av9G0jKcv8b8D8iw+rMBudMVT1HQCPULIKLT
         vzmrkXuu50r9KymPO5xgsDX8aV0DwpuSK8WkjQfGvBZmEPppppJRNWhZzajqsuc/42M+
         xHZRTav50Jm4/K468T3+4jR72QHFbT2EHIq3Xe9qAjYo8kABQ8QoUQUUcImm/HIwLbko
         i1ZQ==
X-Gm-Message-State: AOAM531qjTlweMXcTa0cMRB2OPGtIQi4ltt29FjouzRBaR+ZSvsNKkCe
        xEDELCOSSuoC/Eq3x9HZyJsCn36q8uulxw61/w7Byj5yyw7r37xGlcZm4sJthf8HmYqTxeYx8ii
        mp35WgqmhYDwQUdidOOkLwX5IFpJyCZNXXw==
X-Received: by 2002:a25:a289:: with SMTP id c9mr32424324ybi.26.1623150125803;
        Tue, 08 Jun 2021 04:02:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwoJTMJYLIo5JLaPCKlMaY1uD307CdnL8W3DmtqP8Cl7oP8zg5QoWPG6RgZg/bw1HmnyqkVBMTehY7r2dHLJUY=
X-Received: by 2002:a25:a289:: with SMTP id c9mr32424289ybi.26.1623150125563;
 Tue, 08 Jun 2021 04:02:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210517092006.803332-1-omosnace@redhat.com> <CAHC9VhTasra0tU=bKwVqAwLRYaC+hYakirRz0Mn5jbVMuDkwrA@mail.gmail.com>
 <CAFqZXNsh9njbFUNBugidbdiNqD3QbKzsw=KgNKSmW5hv-fD6tA@mail.gmail.com> <CAHC9VhQj_FvBqSGE+eZtbzvDoRAEbbo-6t_2E6MVuyiGA9N8Hw@mail.gmail.com>
In-Reply-To: <CAHC9VhQj_FvBqSGE+eZtbzvDoRAEbbo-6t_2E6MVuyiGA9N8Hw@mail.gmail.com>
From:   Ondrej Mosnacek <omosnace@redhat.com>
Date:   Tue, 8 Jun 2021 13:01:54 +0200
Message-ID: <CAFqZXNsVFv2yh5cXwWYXscYTAuoCKk4H-JbPAYzDbwKUzSDP3A@mail.gmail.com>
Subject: Re: [PATCH v2] lockdown,selinux: avoid bogus SELinux lockdown
 permission checks
To:     Paul Moore <paul@paul-moore.com>
Cc:     Linux Security Module list 
        <linux-security-module@vger.kernel.org>,
        James Morris <jmorris@namei.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@redhat.com>,
        Stephen Smalley <stephen.smalley.work@gmail.com>,
        SElinux list <selinux@vger.kernel.org>,
        linuxppc-dev@lists.ozlabs.org,
        Linux FS Devel <linux-fsdevel@vger.kernel.org>,
        bpf <bpf@vger.kernel.org>, network dev <netdev@vger.kernel.org>,
        Linux kernel mailing list <linux-kernel@vger.kernel.org>,
        Casey Schaufler <casey@schaufler-ca.com>,
        Michael Ellerman <mpe@ellerman.id.au>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Thu, Jun 3, 2021 at 7:46 PM Paul Moore <paul@paul-moore.com> wrote:
> On Wed, Jun 2, 2021 at 9:40 AM Ondrej Mosnacek <omosnace@redhat.com> wrote:
> > On Fri, May 28, 2021 at 3:37 AM Paul Moore <paul@paul-moore.com> wrote:
[...]
> > > I know you and Casey went back and forth on this in v1, but I agree
> > > with Casey that having two LSM hooks here is a mistake.  I know it
> > > makes backports hard, but spoiler alert: maintaining complex software
> > > over any non-trivial period of time is hard, reeeeally hard sometimes
> > > ;)
> >
> > Do you mean having two slots in lsm_hook_defs.h or also having two
> > security_*() functions? (It's not clear to me if you're just
> > reiterating disagreement with v1 or if you dislike the simplified v2
> > as well.)
>
> To be clear I don't think there should be two functions for this, just
> make whatever changes are necessary to the existing
> security_locked_down() LSM hook.  Yes, the backport is hard.  Yes, it
> will touch a lot of code.  Yes, those are lame excuses to not do the
> right thing.

OK, I guess I'll just go with the bigger patch.

> > > > The callers migrated to the new hook, passing NULL as cred:
> > > > 1. arch/powerpc/xmon/xmon.c
> > > >      Here the hook seems to be called from non-task context and is only
> > > >      used for redacting some sensitive values from output sent to
> > > >      userspace.
> > >
> > > This definitely sounds like kernel_t based on the description above.
> >
> > Here I'm a little concerned that the hook might be called from some
> > unusual interrupt, which is not masked by spin_lock_irqsave()... We
> > ran into this with PMI (Platform Management Interrupt) before, see
> > commit 5ae5fbd21079 ("powerpc/perf: Fix handling of privilege level
> > checks in perf interrupt context"). While I can't see anything that
> > would suggest something like this happening here, the whole thing is
> > so foreign to me that I'm wary of making assumptions :)
> >
> > @Michael/PPC devs, can you confirm to us that xmon_is_locked_down() is
> > only called from normal syscall/interrupt context (as opposed to
> > something tricky like PMI)?
>
> You did submit the code change so I assumed you weren't concerned
> about it :)  If it is a bad hook placement that is something else
> entirely.

What I submitted effectively avoided the SELinux hook to be called, so
I didn't bother checking deeper in what context those hook calls would
occur.

> Hopefully we'll get some guidance from the PPC folks.
>
> > > > 4. net/xfrm/xfrm_user.c:copy_to_user_*()
> > > >      Here a cryptographic secret is redacted based on the value returned
> > > >      from the hook. There are two possible actions that may lead here:
> > > >      a) A netlink message XFRM_MSG_GETSA with NLM_F_DUMP set - here the
> > > >         task context is relevant, since the dumped data is sent back to
> > > >         the current task.
> > >
> > > If the task context is relevant we should use it.
> >
> > Yes, but as I said it would create an asymmetry with case b), which
> > I'll expand on below...
> >
> > > >      b) When deleting an SA via XFRM_MSG_DELSA, the dumped SAs are
> > > >         broadcasted to tasks subscribed to XFRM events - here the
> > > >         SELinux check is not meningful as the current task's creds do
> > > >         not represent the tasks that could potentially see the secret.
> > >
> > > This looks very similar to the BPF hook discussed above, I believe my
> > > comments above apply here as well.
> >
> > Using the current task is just logically wrong in this case. The
> > current task here is just simply deleting an SA that happens to have
> > some secret value in it. When deleting an SA, a notification is sent
> > to a group of subscribers (some group of other tasks), which includes
> > a dump of the secret value. The current task isn't doing any attempt
> > to breach lockdown, it's just deleting an SA.
> >
> > It also makes it really awkward to make policy decisions around this.
> > Suppose that domains A, B, and C need to be able to add/delete SAs and
> > domains D, E, and F need to receive notifications about changes in
> > SAs. Then if, say, domain E actually needs to see the secret values in
> > the notifications, you must grant the confidentiality permission to
> > all of A, B, C to keep things working. And now you have opened up the
> > door for A, B, C to do other lockdown-confidentiality stuff, even
> > though these domains themselves actually don't request/need any
> > confidential data from the kernel. That's just not logical and you may
> > actually end up (slightly) worse security-wise than if you just
> > skipped checking for XFRM secrets altogether, because you need to
> > allow confidentiality to domains for which it may be excessive.
>
> It sounds an awful lot like the lockdown hook is in the wrong spot.
> It sounds like it would be a lot better to relocate the hook than
> remove it.

I don't see how you would solve this by moving the hook. Where do you
want to relocate it? The main obstacle is that the message containing
the SA dump is sent to consumers via a simple netlink broadcast, which
doesn't provide a facility to redact the SA secret on a per-consumer
basis. I can't see any way to make the checks meaningful for SELinux
without a major overhaul of the broadcast logic.

IMO, switching the subject to kernel_t either in both cases or at
least in case b) is the best compromise between usability, security,
and developers' time / code complexity. I don't think controlling
which of the CAP_NET_ADMIN domains can/can't see/leak SA secrets is
worth obsessing about.

--
Ondrej Mosnacek
Software Engineer, Linux Security - SELinux kernel
Red Hat, Inc.

