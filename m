Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 034A9398E0E
	for <lists+selinux@lfdr.de>; Wed,  2 Jun 2021 17:13:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231593AbhFBPPj (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Wed, 2 Jun 2021 11:15:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231577AbhFBPPj (ORCPT
        <rfc822;selinux@vger.kernel.org>); Wed, 2 Jun 2021 11:15:39 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2B00C061574
        for <selinux@vger.kernel.org>; Wed,  2 Jun 2021 08:13:39 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id l1so4391802ejb.6
        for <selinux@vger.kernel.org>; Wed, 02 Jun 2021 08:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+J7KF4ks9US2bAffAcsOJQKFyjMfB4gR4lgzzMSLNYI=;
        b=igpuWRlb73xmxahkSHaMuUjyZe1AZUKePohe+4Fi/InrT6JxVOc8e91F5osWhaSLgX
         E84EkXnpmXUZMoleQY1TbZkS7zMEZN4+HXy889QAxq82OaDUCta8mDCg+CDFR0S68+/f
         DwY+xH9cCE0L/2BTW7CmtzXLbJ0WcObPFs2rxeOAsHButkL/MPV4qN+JjL3+3vK+FmR2
         Tme3hvmLA2IKH5aKNG7E7QJEpZrATS6Njz5FrIOFpBzua8jgqkDvKqiu000m3hQ5f23y
         nyETPrIfZtVbKPopwrFxW+VhJEa29oaIO9TR9M3v2rjZnVsDs06ghXOLkpMzEgh7PvwR
         gZgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+J7KF4ks9US2bAffAcsOJQKFyjMfB4gR4lgzzMSLNYI=;
        b=DuVimcWgGZMqsutcApX6vwVh6jOSYlz39mWFBJ5QsGAAo0BLh4TG1me/XBxM67I3i4
         ay6/jh4yW9om+smuSm/cCadVz4eUTuXZZBOKr90qBT4U40OFWI2SSflbSI3+zfvYda9T
         96w4B/5qZpwmto3iu9NzLQoCqjR12m9pbv1eUlmhG4syoYx2PRZjnxeSMjhe3lh8Ux5F
         LIjCJGyAou12Wml7KG+/NTRJ1HfFWF+6jLmhAGlFHxFEi0V8w6F4Eqpcc4YQumEtFQZK
         AWNTeNnNVrESPsoa1dhAQYUgVrcUkSV8gnsfh2GrBS7wbAU7fA4SJWscv1iI1l7PFrDQ
         yppg==
X-Gm-Message-State: AOAM532jGb03jPww+TTspP5bDmekAOEhxi7iw5z0NwOSBF9bBqso/jXe
        AbQwONf7lomOtGebZo418q3VxeiJe2cAqSZ4wFx2
X-Google-Smtp-Source: ABdhPJwFomdKMYZxRrY9ExJPtl6HzjR84K/gicCWfDx/868bcJc4eB2tlYYJNUFzU5Q4QC96WaC2lUPEqPL7r6AtsDo=
X-Received: by 2002:a17:906:2c54:: with SMTP id f20mr17365763ejh.91.1622646818352;
 Wed, 02 Jun 2021 08:13:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210517092006.803332-1-omosnace@redhat.com> <CAHC9VhTasra0tU=bKwVqAwLRYaC+hYakirRz0Mn5jbVMuDkwrA@mail.gmail.com>
 <01135120-8bf7-df2e-cff0-1d73f1f841c3@iogearbox.net> <CAHC9VhR-kYmMA8gsqkiL5=poN9FoL-uCyx1YOLCoG2hRiUBYug@mail.gmail.com>
 <c7c2d7e1-e253-dce0-d35c-392192e4926e@iogearbox.net> <CAHC9VhS1XRZjKcTFgH1+n5uA-CeT+9BeSP5jvT2+RE5ougLpUg@mail.gmail.com>
 <2e541bdc-ae21-9a07-7ac7-6c6a4dda09e8@iogearbox.net> <CAHC9VhT464vr9sWxqY3PRB4DAccz=LvRMLgWBsSViWMR0JJvOQ@mail.gmail.com>
 <3ca181e3-df32-9ae0-12c6-efb899b7ce7a@iogearbox.net>
In-Reply-To: <3ca181e3-df32-9ae0-12c6-efb899b7ce7a@iogearbox.net>
From:   Paul Moore <paul@paul-moore.com>
Date:   Wed, 2 Jun 2021 11:13:27 -0400
Message-ID: <CAHC9VhTuPnPs1wMTmoGUZ4fvyy-es9QJpE7O_yTs2JKos4fgbw@mail.gmail.com>
Subject: Re: [PATCH v2] lockdown,selinux: avoid bogus SELinux lockdown
 permission checks
To:     Daniel Borkmann <daniel@iogearbox.net>
Cc:     Ondrej Mosnacek <omosnace@redhat.com>,
        linux-security-module@vger.kernel.org,
        James Morris <jmorris@namei.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@redhat.com>,
        Stephen Smalley <stephen.smalley.work@gmail.com>,
        selinux@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        Casey Schaufler <casey@schaufler-ca.com>, jolsa@redhat.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Wed, Jun 2, 2021 at 8:40 AM Daniel Borkmann <daniel@iogearbox.net> wrote:
> On 6/1/21 10:47 PM, Paul Moore wrote:
> > The thing I'm worried about would be the case where a LSM policy
> > change requires that an existing BPF program be removed or disabled.
> > I'm guessing based on the refcounting that there is not presently a
> > clean way to remove a BPF program from the system, but is this
> > something we could resolve?  If we can't safely remove a BPF program
> > from the system, can we replace/swap it with an empty/NULL BPF
> > program?
>
> Removing progs would somehow mean destroying those references from an
> async event and then /safely/ guaranteeing that nothing is accessing
> them anymore. But then if policy changes once more where they would
> be allowed again we would need to revert back to the original state,
> which brings us to your replace/swap question with an empty/null prog.
> It's not feasible either, because there are different BPF program types
> and they can have different return code semantics that lead to subsequent
> actions. If we were to replace them with an empty/NULL program, then
> essentially this will get us into an undefined system state given it's
> unclear what should be a default policy for each program type, etc.
> Just to pick one simple example, outside of tracing, that comes to mind:
> say, you attached a program with tc to a given device ingress hook. That
> program implements firewalling functionality, and potentially deep down
> in that program there is functionality to record/sample packets along
> with some meta data. Part of what is exported to the ring buffer to the
> user space reader may be a struct net_device field that is otherwise not
> available (or at least not yet), hence it's probe-read with mentioned
> helpers. If you were now to change the SELinux policy for that tc loader
> application, and therefore replace/swap the progs in the kernel that were
> loaded with it (given tc's lockdown policy was recorded in their sec blob)
> with an empty/NULL program, then either you say allow-all or drop-all,
> but either way, you break the firewalling functionality completely by
> locking yourself out of the machine or letting everything through. There
> is no sane way where we could reason about the context/internals of a
> given program where it would be safe to replace with a simple empty/NULL
> prog.

Help me out here, is your answer that the access check can only be
done at BPF program load time?  That isn't really a solution from a
SELinux perspective as far as I'm concerned.

I understand the ideas I've tossed out aren't practical from a BPF
perspective, but it would be nice if we could find something that does
work.  Surely you BPF folks can think of some way to provide a
runtime, not load time, check?

-- 
paul moore
www.paul-moore.com
