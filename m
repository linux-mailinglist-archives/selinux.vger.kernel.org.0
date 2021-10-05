Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E5A1422ECB
	for <lists+selinux@lfdr.de>; Tue,  5 Oct 2021 19:12:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236515AbhJEROV (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Tue, 5 Oct 2021 13:14:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233961AbhJEROV (ORCPT
        <rfc822;selinux@vger.kernel.org>); Tue, 5 Oct 2021 13:14:21 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05AFAC061749;
        Tue,  5 Oct 2021 10:12:30 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id i24so39090708lfj.13;
        Tue, 05 Oct 2021 10:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VfG0EMNUF/9ihTNG0o0r23xLdq2FB/bRJATXueQqBL8=;
        b=dMUMfVLTWwTA0HWGYkpJjOviJFuvW3CannJzzRGAUqWt+SQ8cXJQgaGXRbunsJn0aJ
         uBLjiT+rYzhMQhKF5ZUvDpJqWQ19k3ZFUHCXXrcgUU5nm7R1BOqmL/QzTGnVp7JPMkbI
         l0Xrr9KMGEJIHKHz4we68eq6iBiU6WHYYIMFaV91ZJTumEqRhPpEafhFM+/IUeTTwMVr
         CnLH+VZ3GSGKugRjT8HbEVoRvcWdRuQyddt6Mh+6dk23gNe0xnvhqS9g7IELWTWZ4B5z
         7O182KDLsKXSooavj0KvJPPzW06b7Pbl5RDaCQSQGvpYF6cothNxTTdO3c5bjMSuPU5+
         r2kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VfG0EMNUF/9ihTNG0o0r23xLdq2FB/bRJATXueQqBL8=;
        b=21y4UzeN0Cnt7b8oBKTxwX1wu0cZvlut8xmwk+eNI86T/KGQpK1IGTfuZzpIY1hHLC
         HmWm5TnLyQSrEGbMqdJzjiLm0+FlkGYgS5SNSFvfZDRzu7cuYrtkiTOauP7lVTPwqTaQ
         K/EdWjiycxmfhd3rrztXO8onScQDAR4VyKtKV8jQuFs8fBHfOH6KoZLYlV+1xDTivPaN
         lHf/zZ8F3yb8BWPu6LkOSkx5zf7/rJ3RGLK37HC1MNxwwgpysssfsYsTml2yCzQVMCSN
         OQsLVQDPUkwFP7cZMemdU13JKQOnjCosHwvaFS70z+As7m/bC3KezuAAZNqZ3d57XBza
         zH5w==
X-Gm-Message-State: AOAM531AMdomhMA6pMU/8bgu7iJRKAk55WWiHTbvpo5hrum3RAiRSz4g
        w0vA/ZM+jiE6dKoE50IgNFcNwfLNQ7Ko3JuQufRMePXlmtM=
X-Google-Smtp-Source: ABdhPJzt/fLIDzpIyv5KpByxXbAROc6o5Pbxe5TWgzzO31bv80or06lf11M9VS0e6fY69o20/Oazy1wSCxs8SEkErPM=
X-Received: by 2002:a05:6512:acc:: with SMTP id n12mr4455938lfu.395.1633453948174;
 Tue, 05 Oct 2021 10:12:28 -0700 (PDT)
MIME-Version: 1.0
References: <20211001175521.3853257-1-tkjos@google.com> <c6a650e4-15e4-2943-f759-0e9577784c7a@schaufler-ca.com>
 <CAG48ez2tejBUXJGf0R9qpEiauL9-ABgkds6mZTQD7sZKLMdAAQ@mail.gmail.com>
 <CAG48ez1SRau1Tnge5HVqxCFsNCizmnQLErqnC=eSeERv8jg-zQ@mail.gmail.com>
 <f59c6e9f-2892-32da-62f8-8bbeec18ee4c@schaufler-ca.com> <CAG48ez0yF0u=QBLVL2XrGB8r8ouQj-_aS9SScu4O4f+LhZxCDw@mail.gmail.com>
 <e0c1fab9-cb97-d5af-1f4b-f15b6b2097fd@schaufler-ca.com> <CAG48ez3qc+2sc6xTJQVqLTRcjCiw_Adx13KT3OvPMCjBLjZvgA@mail.gmail.com>
 <6bd2de29-b46a-1d24-4c73-9e4e0f3f6eea@schaufler-ca.com> <CAG48ez0RM6NGZLdEjaqU9KmaOgeFR6cSeNo50XG9oaFxC_ayYw@mail.gmail.com>
 <CAEjxPJ4X4N_zgH4oRbdkZi21mvS--ExDb_1gad09buMHshB_hQ@mail.gmail.com> <CAHRSSEwVONsmf8JHo0PsDmexOqamKTsLF2BkpXZfAvsJvDw0ew@mail.gmail.com>
In-Reply-To: <CAHRSSEwVONsmf8JHo0PsDmexOqamKTsLF2BkpXZfAvsJvDw0ew@mail.gmail.com>
From:   Stephen Smalley <stephen.smalley.work@gmail.com>
Date:   Tue, 5 Oct 2021 13:12:16 -0400
Message-ID: <CAEjxPJ4MB4nEBSNOVZtM9N9XRiSB6qsmsCMuWN=Ocm8TcP64GA@mail.gmail.com>
Subject: Re: [PATCH v2] binder: use cred instead of task for selinux checks
To:     Todd Kjos <tkjos@google.com>
Cc:     Jann Horn <jannh@google.com>,
        Casey Schaufler <casey@schaufler-ca.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        arve@android.com, tkjos@android.com, maco@android.com,
        christian@brauner.io, James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>,
        Paul Moore <paul@paul-moore.com>,
        Eric Paris <eparis@parisplace.org>,
        Kees Cook <keescook@chromium.org>,
        Jeffrey Vander Stoep <jeffv@google.com>,
        Mimi Zohar <zohar@linux.ibm.com>,
        LSM List <linux-security-module@vger.kernel.org>,
        SElinux list <selinux@vger.kernel.org>,
        devel@driverdev.osuosl.org,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "Joel Fernandes (Google)" <joel@joelfernandes.org>,
        "Cc: Android Kernel" <kernel-team@android.com>,
        stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Tue, Oct 5, 2021 at 12:49 PM Todd Kjos <tkjos@google.com> wrote:
>
> On Tue, Oct 5, 2021 at 8:21 AM Stephen Smalley
> <stephen.smalley.work@gmail.com> wrote:
> >
> > On Mon, Oct 4, 2021 at 8:27 PM Jann Horn <jannh@google.com> wrote:
> > >
> > > On Tue, Oct 5, 2021 at 1:38 AM Casey Schaufler <casey@schaufler-ca.com> wrote:
> > > > On 10/4/2021 3:28 PM, Jann Horn wrote:
> > > > > On Mon, Oct 4, 2021 at 6:19 PM Casey Schaufler <casey@schaufler-ca.com> wrote:
> > > > >> On 10/1/2021 3:58 PM, Jann Horn wrote:
> > > > >>> On Fri, Oct 1, 2021 at 10:10 PM Casey Schaufler <casey@schaufler-ca.com> wrote:
> > > > >>>> On 10/1/2021 12:50 PM, Jann Horn wrote:
> > > > >>>>> On Fri, Oct 1, 2021 at 9:36 PM Jann Horn <jannh@google.com> wrote:
> > > > >>>>>> On Fri, Oct 1, 2021 at 8:46 PM Casey Schaufler <casey@schaufler-ca.com> wrote:
> > > > >>>>>>> On 10/1/2021 10:55 AM, Todd Kjos wrote:
> > > > >>>>>>>> Save the struct cred associated with a binder process
> > > > >>>>>>>> at initial open to avoid potential race conditions
> > > > >>>>>>>> when converting to a security ID.
> > > > >>>>>>>>
> > > > >>>>>>>> Since binder was integrated with selinux, it has passed
> > > > >>>>>>>> 'struct task_struct' associated with the binder_proc
> > > > >>>>>>>> to represent the source and target of transactions.
> > > > >>>>>>>> The conversion of task to SID was then done in the hook
> > > > >>>>>>>> implementations. It turns out that there are race conditions
> > > > >>>>>>>> which can result in an incorrect security context being used.
> > > > >>>>>>> In the LSM stacking patch set I've been posting for a while
> > > > >>>>>>> (on version 29 now) I use information from the task structure
> > > > >>>>>>> to ensure that the security information passed via the binder
> > > > >>>>>>> interface is agreeable to both sides. Passing the cred will
> > > > >>>>>>> make it impossible to do this check. The task information
> > > > >>>>>>> required is not appropriate to have in the cred.
> > > > >>>>>> Why not? Why can't you put the security identity of the task into the creds?
> > > > >>>>> Ah, I get it now, you're concerned about different processes wanting
> > > > >>>>> to see security contexts formatted differently (e.g. printing the
> > > > >>>>> SELinux label vs printing the AppArmor label), right?
> > > > >>>> That is correct.
> > > > >>>>
> > > > >>>>> But still, I don't think you can pull that information from the
> > > > >>>>> receiving task. Maybe the easiest solution would be to also store that
> > > > >>>>> in the creds? Or you'd have to manually grab that information when
> > > > >>>>> /dev/binder is opened.
> > > > >>>> I'm storing the information in the task security blob because that's
> > > > >>>> the appropriate scope. Today the LSM hook is given both task_struct's.
> > > > >>> Which is wrong, because you have no idea who the semantic "recipient
> > > > >>> task" is - any task that has a mapping of the binder fd can
> > > > >>> effectively receive transactions from it.
> > > > >>>
> > > > >>> (And the current "sender task" is also wrong, because binder looks at
> > > > >>> the task that opened the binder device, not the task currently
> > > > >>> performing the action.)
> > > > >> I'm confused. Are you saying that the existing binder code is
> > > > >> completely broken? Are you saying that neither "task" is correct?
> > > > > Yeah, basically
> > > >
> > > > Well, hot biscuits and gravy!
> > > >
> > > > >  - but luckily the actual impact this has is limited by
> > > > > the transitions that SELinux permits. If domain1 has no way to
> > > > > transition to domain2, then it can't abuse this bug to pretend to be
> > > > > domain2. I do have a reproducer that lets Android's "shell" domain
> > > > > send a binder transaction that appears to come from "runas", but
> > > > > luckily "runas" has no interesting privileges with regards to binder,
> > > > > so that's not exploitable.
> > > >
> > > > You're counting on the peculiarities of the SELinux policy you're
> > > > assuming is used to mask the fact that the hook isn't really doing
> > > > what it is supposed to?  Ouch.
> > >
> > > I'm not saying I like the current situation - I do think that this
> > > needs to change. I'm just saying it probably isn't *exploitable*, and
> > > exploitability often hinges on these little circumstantial details.
> > >
> > > > >> How does passing the creds from the wrong tasks "fix" the problem?
> > > > > This patch is not passing the creds from the "wrong" tasks at all. It
> > > > > relies on the basic idea that when a security context opens a
> > > > > resource, and then hands that resource to another context for
> > > > > read/write operations, then you can effectively treat this as a
> > > > > delegation of privileges from the original opener, and perform access
> > > > > checks against the credentials using which the resource was opened.
> > > >
> > > > OK. I can understand that without endorsing it.
> > > >
> > > > > In particular, we already have those semantics in the core kernel for
> > > > > ->read() and ->write() VFS operations - they are *not allowed* to look
> > > > > at the credentials of the caller, and if they want to make security
> > > > > checks, they have to instead check against file->f_cred, which are the
> > > > > credentials using which the file was originally opened. (Yes, some
> > > > > places still get that wrong.) Passing a file descriptor to another
> > > > > task is a delegation of access, and the other task can then call
> > > > > syscalls like read() / write() / mmap() on the file descriptor without
> > > > > needing to have any access to the underlying file.
> > > >
> > > > A mechanism sufficiently entrenched.
> > >
> > > It's not just "entrenched", it is a fundamental requirement for being
> > > able to use file descriptor passing with syscalls like write(). If
> > > task A gives a file descriptor to task B, then task B must be able to
> > > write() to that FD without having to worry that the FD actually refers
> > > to some sort of special file that interprets the written data as some
> > > type of command, or something like that, and that this leads to task B
> > > unknowingly passing through access checks.
> > >
> > > > > You can't really attribute binder transactions to specific tasks that
> > > > > are actually involved in the specific transaction, neither on the
> > > > > sending side nor on the receiving side, because binder is built around
> > > > > passing data through memory mappings. Memory mappings can be accessed
> > > > > by multiple tasks, and even a task that does not currently have it
> > > > > mapped could e.g. map it at a later time. And on top of that you have
> > > > > the problem that the receiving task might also go through privileged
> > > > > execve() transitions.
> > > >
> > > > OK. I'm curious now as to why the task_struct was being passed to the
> > > > hook in the first place.
> > >
> > > Probably because that's what most other LSM hooks looked like and the
> > > authors/reviewers of the patch didn't realize that this model doesn't
> > > really work for binder? FWIW, these hooks were added in commit
> > > 79af73079d75 ("Add security hooks to binder and implement the hooks
> > > for SELinux."). The commit message also just talks about "processes".
> >
> > Note that in the same code path (binder_transaction), sender_euid is
> > set from proc->tsk and security_ctx is based on proc->tsk. If we are
> > changing the hooks to operate on the opener cred, then presumably we
> > should be doing that for sender_euid and replace the
> > security_task_getsecid_obj() call with security_cred_getsecid()?
>
> Stephan, do you want that to be included in this patch? Or should I
> follow this up with another patch for the sender_euid case?

Either way is fine with me. Fixing sender_euid arguably is a fix that
should go all the way back to the introduction of binder unless I
misunderstand; it is independent of SELinux. Fixing the
security_task_getsecid -> cred_secid only goes back to
ec74136ded792deed80780a2f8baf3521eeb72f9. So having it as 3 separate
patches may help with the different Fixes tags and back-porting
purposes.
