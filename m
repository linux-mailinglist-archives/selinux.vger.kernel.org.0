Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5689F39CC19
	for <lists+selinux@lfdr.de>; Sun,  6 Jun 2021 03:32:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230099AbhFFBeM (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Sat, 5 Jun 2021 21:34:12 -0400
Received: from mail-ej1-f54.google.com ([209.85.218.54]:37842 "EHLO
        mail-ej1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230073AbhFFBeM (ORCPT
        <rfc822;selinux@vger.kernel.org>); Sat, 5 Jun 2021 21:34:12 -0400
Received: by mail-ej1-f54.google.com with SMTP id ce15so20541799ejb.4
        for <selinux@vger.kernel.org>; Sat, 05 Jun 2021 18:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fCe+jGmEAwmTn8B7zS0WgL0TEtprm2eMCt59nOvx6D0=;
        b=1C/ZT6VO9/kFcqfqv3/zGsJrGPbrhEkvKHwxEuzs8VA+HqFgEw+D7iKUER1uKs1Jo/
         WFi9sbz3aeTG7eP+wDUwtqXJxTGLIeLKpe+Neul/K0LwdDBXA6m6MUnx7DVMfVCm0TNl
         24B6T3B5amn7STxRsQYCiKJoj/OTiS9PdP6TF3DpFYm4CINKKT2/qhFX55q9g5XzM1gW
         IsLV/oz6uv37DVUDE/J4BvW1bzN2zZWz2qp9lhp57jie5gag3PPX2j+mA/S9azmajBOK
         UH4ORdfwCnJ6mSDzr3achqJ+PRt1OuF9IX6S/DKHAy992Bmd7Ocqyxg5RmNb5/eOhu3C
         p9Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fCe+jGmEAwmTn8B7zS0WgL0TEtprm2eMCt59nOvx6D0=;
        b=gfJm9xpcXiiyatcSVGiShSBFHXJkrVI9HbFw2H0ElFEZO0VvRj/fprI4AtyRUE5zkD
         YhGlpuBPv8GaU+US+p/gArxbj6Ov8Dy9ptZ4diqPHAUu7gTndxhF8FegFKynOGebEPVg
         K8fMAws15xeRpqPyQUeu/DD2Y+O/9cx0O5kXQWFR76d2bEzyPzR2Ny1JGhn2T0lGh6ad
         3zGRtISZCCYdrEb8nu8ze1OqIVM8PHHJefiIJ4MKU119aeqTzzJPK2EivZxaStlGZISm
         /irNPdBBsgye3GQovMgwC3aEw7+NEv6ECGVI2nRSUlkmfdOf+3WuWp8OAABwGuewFN2Z
         7DQA==
X-Gm-Message-State: AOAM531ZoGwAc8YzqhuqljYQ5VLciV16vngx+quaQA2MSaSvvwfee+gh
        bYPx+PTzGUCDbO3Ifpnzt/0O33e2Zog+WhU7vOBP
X-Google-Smtp-Source: ABdhPJyhY/AL0NTznJ9xF6JwaBvqMnxz7Ps9n6YMYTY6wpWXUGQF/hzXLj9xr7+Kqv4CWEHA77JSrz2Ou+hnQjZ4Kv8=
X-Received: by 2002:a17:906:4111:: with SMTP id j17mr11223553ejk.488.1622943068465;
 Sat, 05 Jun 2021 18:31:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210517092006.803332-1-omosnace@redhat.com> <CAHC9VhTasra0tU=bKwVqAwLRYaC+hYakirRz0Mn5jbVMuDkwrA@mail.gmail.com>
 <01135120-8bf7-df2e-cff0-1d73f1f841c3@iogearbox.net> <CAHC9VhR-kYmMA8gsqkiL5=poN9FoL-uCyx1YOLCoG2hRiUBYug@mail.gmail.com>
 <c7c2d7e1-e253-dce0-d35c-392192e4926e@iogearbox.net> <CAHC9VhS1XRZjKcTFgH1+n5uA-CeT+9BeSP5jvT2+RE5ougLpUg@mail.gmail.com>
 <2e541bdc-ae21-9a07-7ac7-6c6a4dda09e8@iogearbox.net> <CAHC9VhT464vr9sWxqY3PRB4DAccz=LvRMLgWBsSViWMR0JJvOQ@mail.gmail.com>
 <3ca181e3-df32-9ae0-12c6-efb899b7ce7a@iogearbox.net> <CAHC9VhTuPnPs1wMTmoGUZ4fvyy-es9QJpE7O_yTs2JKos4fgbw@mail.gmail.com>
 <f4373013-88fb-b839-aaaa-3826548ebd0c@iogearbox.net> <CAHC9VhS=BeGdaAi8Ae5Fx42Fzy_ybkcXwMNcPwK=uuA6=+SRcg@mail.gmail.com>
 <c59743f6-0000-1b15-bc16-ff761b443aef@iogearbox.net> <CAHC9VhT1JhdRw9P_m3niY-U-vukxTWKTE9q6AMyQ=r_ohpPxMw@mail.gmail.com>
 <CAADnVQ+0bNtDj46Q8s-h=rqJgZz2JaGTeHpbmof3e7fBBQKuDQ@mail.gmail.com>
In-Reply-To: <CAADnVQ+0bNtDj46Q8s-h=rqJgZz2JaGTeHpbmof3e7fBBQKuDQ@mail.gmail.com>
From:   Paul Moore <paul@paul-moore.com>
Date:   Sat, 5 Jun 2021 21:30:57 -0400
Message-ID: <CAHC9VhQv4xNhHsxpR7wqBsuch2UC=5DPAXTJAtujtF9G8wpfmQ@mail.gmail.com>
Subject: Re: [PATCH v2] lockdown,selinux: avoid bogus SELinux lockdown
 permission checks
To:     Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc:     Daniel Borkmann <daniel@iogearbox.net>,
        Ondrej Mosnacek <omosnace@redhat.com>,
        LSM List <linux-security-module@vger.kernel.org>,
        James Morris <jmorris@namei.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@redhat.com>,
        Stephen Smalley <stephen.smalley.work@gmail.com>,
        selinux@vger.kernel.org, ppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Linux-Fsdevel <linux-fsdevel@vger.kernel.org>,
        bpf <bpf@vger.kernel.org>,
        Network Development <netdev@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Casey Schaufler <casey@schaufler-ca.com>,
        Jiri Olsa <jolsa@redhat.com>,
        Alexei Starovoitov <ast@kernel.org>,
        Andrii Nakryiko <andrii@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Fri, Jun 4, 2021 at 8:08 PM Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
> On Fri, Jun 4, 2021 at 4:34 PM Paul Moore <paul@paul-moore.com> wrote:
> >
> > > Again, the problem is not limited to BPF at all. kprobes is doing register-
> > > time hooks which are equivalent to the one of BPF. Anything in run-time
> > > trying to prevent probe_read_kernel by kprobes or BPF is broken by design.
> >
> > Not being an expert on kprobes I can't really comment on that, but
> > right now I'm focused on trying to make things work for the BPF
> > helpers.  I suspect that if we can get the SELinux lockdown
> > implementation working properly for BPF the solution for kprobes won't
> > be far off.
>
> Paul,

Hi Alexei,

> Both kprobe and bpf can call probe_read_kernel==copy_from_kernel_nofault
> from all contexts.
> Including NMI.

Thanks, that is helpful.  In hindsight it should have been obvious
that kprobe/BPF would offer to insert code into the NMI handlers, but
I don't recall it earlier in the discussion, it's possible I simply
missed the mention.

> Most of audit_log_* is not acceptable.
> Just removing a wakeup is not solving anything.

That's not really fair now is it?  Removing the wakeups in
audit_log_start() and audit_log_end() does solve some problems,
although not all of them (i.e. the NMI problem being the 800lb
gorilla).  Because of the NMI case we're not going to solve the
LSM/audit case anytime soon so it looks like we are going to have to
fall back to the patch Daniel proposed.

Acked-by: Paul Moore <paul@paul-moore.com>

--
paul moore
www.paul-moore.com
