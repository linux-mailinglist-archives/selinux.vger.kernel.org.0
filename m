Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48BFB34081A
	for <lists+selinux@lfdr.de>; Thu, 18 Mar 2021 15:49:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229745AbhCROsu (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Thu, 18 Mar 2021 10:48:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229508AbhCROsk (ORCPT
        <rfc822;selinux@vger.kernel.org>); Thu, 18 Mar 2021 10:48:40 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5974EC06174A
        for <selinux@vger.kernel.org>; Thu, 18 Mar 2021 07:48:40 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id u4so6976558edv.9
        for <selinux@vger.kernel.org>; Thu, 18 Mar 2021 07:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=llkf4N+ll8bDZmWY7APR+GrXBKkEkH3Z7OpFCJxOvLI=;
        b=WjG1erXf8ADRMr5jsJfYDw34gPO7ywBoHfFA+gaa2WB9qLIPnOmhB7ASMjZSNqMuon
         4fw/QwbBDRC9jsRitt7VyRLieunXzdEzvbpVD8rDBK3Ni6ZTxzQOr0nHKP0QXbTM/0uw
         b67n5YRxwFejIsmjG5j7OITDAJTkP5J+sk2mCsX++c8hEFe+9rwPHcY6wFJmPXylFUnk
         TiQeKD5il86lMss75RHCsUewgOO58vecqwgRINZ9pmsy0L78Tel8ny9IJ7WlwDReYHML
         9FBfQWPij8jC+j4i4h1GO4aq3KNL/rXjEcXu+Dib/QmTYejtYIo2JeSxlMp3RyjWpFvb
         dcRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=llkf4N+ll8bDZmWY7APR+GrXBKkEkH3Z7OpFCJxOvLI=;
        b=WZABYI3o/WXUXWFXKLTo3hZYmUUl3HhL4ybEYkRsIrVj4QvTSfrUKoxI+YID82D7Ey
         +6UqWYrvdQOnM8++h4HXs+x1t9H6nvWPiLL0ERd4B7gFb6+VltAm6ZV+fKyh7KgYSerD
         YEKFuC9kRfMvkoywl2Y1jLE4gaeT/0zgVXClj3rNxHhDdQhF+vBF6E3OL+2OWKe5BtlL
         FfPI2g86nIdAKVIE4DLNtnPfEAjwc4A10ZOwI0jLMeWuMRvDdZeGlP65nT81WJ4z828A
         oAbW0aSrJmWPkkJIcpuM66yu4Q1g/PHHOv/2V1GNtyx6uv3oyygM+coW3Z7O20yrNspJ
         e1dA==
X-Gm-Message-State: AOAM531ezaA9ZsXY9rb5+Oc7jOgcwMQ/SH6JMuiJZ605lPGu3p0xX3uq
        AIq3bEg1C7eNNQdSp9ogkIWAH+pvBWi5PvSbRLaU
X-Google-Smtp-Source: ABdhPJzdSYQHE23244GIU8d4xz+1Lkm1o7zR6ssAr8gx3E6rVyl78YYZLnOPXJqP3X2kw52tfSyMQJa5eWGprHjBsgU=
X-Received: by 2002:a05:6402:105a:: with SMTP id e26mr4141110edu.164.1616078918678;
 Thu, 18 Mar 2021 07:48:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210212185930.130477-1-omosnace@redhat.com> <20210212185930.130477-2-omosnace@redhat.com>
 <CAHC9VhQLJKjY0KSC+=f4b=8d8n-m29j_9J5r_VQ_1BpSY8WD2w@mail.gmail.com>
 <CAFqZXNuBYwAT2-vLaTM8_Zng=vh+XsY_EvnzPYM4Z=PoCydZ+A@mail.gmail.com>
 <CAHC9VhSzDVyipy2y8ONiR_Q0YG50FnCJxgHsoi9Nee09hN0WCA@mail.gmail.com>
 <20210303025558.GH6000@sequoia> <CAFqZXNszZY-6Cg0ZaSUY1Y+EvfP-0QApVTJUOQkNt5jrTSgh5w@mail.gmail.com>
In-Reply-To: <CAFqZXNszZY-6Cg0ZaSUY1Y+EvfP-0QApVTJUOQkNt5jrTSgh5w@mail.gmail.com>
From:   Paul Moore <paul@paul-moore.com>
Date:   Thu, 18 Mar 2021 10:48:27 -0400
Message-ID: <CAHC9VhSjtP9JN4XTWi0WyWnbF2j5D5HweQn9-Okut_D==UGQ-A@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] selinux: don't log MAC_POLICY_LOAD record on
 failed policy load
To:     Ondrej Mosnacek <omosnace@redhat.com>
Cc:     Tyler Hicks <tyhicks@linux.microsoft.com>,
        SElinux list <selinux@vger.kernel.org>,
        Stephen Smalley <stephen.smalley.work@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Wed, Mar 3, 2021 at 3:54 AM Ondrej Mosnacek <omosnace@redhat.com> wrote:
> On Wed, Mar 3, 2021 at 3:56 AM Tyler Hicks <tyhicks@linux.microsoft.com> wrote:
> > On 2021-02-28 13:52:52, Paul Moore wrote:
> > > On Fri, Feb 26, 2021 at 9:46 AM Ondrej Mosnacek <omosnace@redhat.com> wrote:
> > > > On Thu, Feb 25, 2021 at 7:15 PM Paul Moore <paul@paul-moore.com> wrote:
> > > > > On Fri, Feb 12, 2021 at 1:59 PM Ondrej Mosnacek <omosnace@redhat.com> wrote:
> > > > > >
> > > > > > If sel_make_policy_nodes() fails, we should jump to 'out', not 'out1',
> > > > > > as the latter would incorrectly log an MAC_POLICY_LOAD audit record,
> > > > > > even though the policy hasn't actually been reloaded. The 'out1' jump
> > > > > > label now becomes unused and can be removed.
> > > > > >
> > > > > > Fixes: 02a52c5c8c3b ("selinux: move policy commit after updating selinuxfs")
> > > > > > Signed-off-by: Ondrej Mosnacek <omosnace@redhat.com>
> > > > > > ---
> > > > > >  security/selinux/selinuxfs.c | 3 +--
> > > > > >  1 file changed, 1 insertion(+), 2 deletions(-)
> > > > > >
> > > > > > diff --git a/security/selinux/selinuxfs.c b/security/selinux/selinuxfs.c
> > > > > > index 01a7d50ed39b..340711e3dc9a 100644
> > > > > > --- a/security/selinux/selinuxfs.c
> > > > > > +++ b/security/selinux/selinuxfs.c
> > > > > > @@ -651,14 +651,13 @@ static ssize_t sel_write_load(struct file *file, const char __user *buf,
> > > > > >         length = sel_make_policy_nodes(fsi, newpolicy);
> > > > > >         if (length) {
> > > > > >                 selinux_policy_cancel(fsi->state, newpolicy);
> > > > > > -               goto out1;
> > > > > > +               goto out;
> > > > >
> > > > > This looks good, especially with AUDIT_MAC_POLICY_LOAD recording
> > > > > "res=1".  However, now that I'm looking at the error path here, we
> > > > > don't display anything if sel_make_policy_nodes() fails, do we?  If
> > > > > security_load_policy fails we at least do a printk(), but if this
> > > > > fails it silently kills the policy load; at the very least I think we
> > > > > want a `pr_warn_ratelimited("SELinux: failed to load policy due to
> > > > > selinuxfs failures")` or something similar.
> > > >
> > > > There are error messages in some error paths in
> > > > sel_make_policy_nodes(), but not all. Those are pr_err()s, while in
> > > > sel_write_load() there is a pr_warn_ratelimited(). Could we just unify
> > > > the sel_make_policy_nodes() failure to a single message? (I don't
> > > > think the information on which part has failed is very useful as the
> > > > most likely cause here is a memory allocation failure, not bad
> > > > policy.) If so, should it be a pr_warn() or pr_err()? Ratelimited or
> > > > not?
> > >
> > > My personal opinion is that the kernel only needs to provide the error
> > > details to userspace which can be useful in determining what wrong,
> > > and how the user can fix it.  For example, if there is a memory
> > > allocation failure in the kernel there is often little the user can do
> > > (and it is often transient anyway due to loading and other factors),
> > > so simply reporting that there was an allocation failure while
> > > attempting X is sufficient.
> > >
> > > Beyond that, I think things can get a little fuzzy, e.g. pr_warn() or
> > > pr_err?  Ratelimit or always emit the message?  I also think the
> > > answers can change as userspace behaviors change over time.  If one of
> > > the policy load error paths uses a pr_err() then we should probably
> > > stick with that; it also seems appropriate as failing to (re)load a
> > > SELinux policy *is* a serious matter.  As far as the rate limiting is
> > > concerned, I'm not sure if that is an important difference here; if
> > > the system is getting enough requests to reload the policy, and
> > > repeatedly failing, such that the ratelimiting matters there are
> > > likely other, much larger, issues at play on the system.
> >
> > I was a little surprised to see pr_warn_ratelimited() (from both the
> > KERN_WARNING and ratelimited perspectives) used in the policy loading error
> > path so I poked around a bit. The description of commit 4262fb51c9f5 ("selinux:
> > log errors when loading new policy") explains the reasoning:
> >
> >     If the policy fails to be loaded from userspace then a warning message is
> >     printed, whereas if a failure occurs after loading policy from userspace an
> >     error message will be printed with details on where policy loading failed
> >     (recreating one of /classes/, /policy_capabilities/, /booleans/ in the
> >     SELinux fs).
> >
> > This seems like sound logic and would result in Ondrej using pr_err() in the
> > sel_make_policy_nodes() error path.
>
> The situation has changed a bit since that was written, though... Back
> then after the policy had been loaded there was no way to turn back
> and if sel_make_policy_nodes() failed, the new policy would stay and
> selinuxfs would have been left behind in an inconsistent/broken state.
> Now this issue is fixed and the new policy isn't actually applied
> until the selinuxfs preparation succeeds. So from a certain POV, the
> selinuxfs failure is no longer that fatal and could just print a
> warning like the other error path, because the result is the same
> after both failures (active policy and selinuxfs state remains
> unchanged).
>
> Paul (or Stephen if you are reading this and have time to comment),
> what do you think?

Sorry for the late reply, I lost this in my inbox and since I already
marked the patchset as "changes requested" in patchwork it fell off my
radar ...

Anyway, back to your question ... it does seem like pr_warn() is the
right answer here for the reasons that Ondrej mentioned above, and I
personally feel it is in keeping with the original patch's intention
as well; "If the policy fails to be loaded from userspace then a
warning message is printed ..."  However, I'm not going to lose a lot
of sleep over differences between pr_warn() and pr_err() here, if
someone feels strongly that it should be pr_err() and can back that up
with some solid reasoning and/or precedence then so be it.

-- 
paul moore
www.paul-moore.com
