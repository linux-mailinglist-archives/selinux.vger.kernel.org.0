Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5B8149BA95
	for <lists+selinux@lfdr.de>; Tue, 25 Jan 2022 18:46:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1381488AbiAYRp6 (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Tue, 25 Jan 2022 12:45:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356780AbiAYRpb (ORCPT
        <rfc822;selinux@vger.kernel.org>); Tue, 25 Jan 2022 12:45:31 -0500
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 613CDC061747
        for <selinux@vger.kernel.org>; Tue, 25 Jan 2022 09:45:27 -0800 (PST)
Received: by mail-ej1-x62c.google.com with SMTP id s5so32110795ejx.2
        for <selinux@vger.kernel.org>; Tue, 25 Jan 2022 09:45:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=v+JhCJG7g15hco1FfpnIJUO82hnrd6NkmYcF+6eeLPo=;
        b=a4paAk6X+lXbHgR975FUNAILKJjK+GHIKFby7yE+3igVKbZl+vWP1jtoru30kQmR1l
         AnMm15z8x2VhASr4KBv8zfBSkUW2NmMli4cYPPjEVrjFc1bRboE1LB/lznV3d9opqJsh
         nkYefRbIVsKskyxlf4Nvdjdlbmplc6NMEUB7tkrukby40kVSu7b36d6c9tsMKAoZknOi
         lvYR0N1XEPVDmSj9+2Jjl+sM4jJw3IckOViCWT2bDWYv0BQlS6vhGAKrgF1eGVJRb9/R
         AwwnBJC2MYqNUg2QVYcbm5+Bhq7wV8CQjpts6Ts3pklfGQIFi9nPtrJZSgKxubd3Ijm4
         xO7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=v+JhCJG7g15hco1FfpnIJUO82hnrd6NkmYcF+6eeLPo=;
        b=YEreRt+ZrW4t2s8mKHlxJN9GFAE+k+Ze5yFw3AYrsPmFs1AFgqJkA67MW5S8STdFxW
         6HYr7HIyJaTrvgYbRmXLOr29q4uySGs4MPDump2VPAdHw4YPR40O0pHL4BJ4XH8QH+OR
         jZFh1n1UIusGHM090oxUFjzMZfjBqKgeOflKg9dGhNgX+hbF/MRWDVQt8gQNuP4aSOWn
         J8lXOo5ln96JdAmwIWVP9JYpPRZWPOBIc6F1kmY7gsKb9Rc67qQTQ9vEvyBFofAjCGn0
         Q0nq2XnZ6jZ6NsWpqmp6V2IoKUAJNB9D7J6lCRyCjlbeFm0RaldXetnDoZw01h15v0MN
         7e3A==
X-Gm-Message-State: AOAM53079Di+HpkndWgrYEFdCEzv5aJvy73GfWSQ1gJort3Y2cLCgtOv
        vUuDq3QH45hQH/4/ounm9WbF1d1SVSL2PsxVeMvp
X-Google-Smtp-Source: ABdhPJxtnIJYYulDdtbOM0Ld9l5htRqshcjYAkBm/PB/rZ2vmlkA6WWyHzdHGGfmlT2buUqLPljzImUTRWJicbrIwD4=
X-Received: by 2002:a17:907:6d03:: with SMTP id sa3mr3976554ejc.517.1643132725758;
 Tue, 25 Jan 2022 09:45:25 -0800 (PST)
MIME-Version: 1.0
References: <20220120214948.3637895-1-smayhew@redhat.com> <20220120214948.3637895-2-smayhew@redhat.com>
 <CAHC9VhT2RhnXtK3aQuDCFUr5qayH25G8HHjRTJzhWM3H41YNog@mail.gmail.com> <YfAz0EAim7Q9ifGI@aion.usersys.redhat.com>
In-Reply-To: <YfAz0EAim7Q9ifGI@aion.usersys.redhat.com>
From:   Paul Moore <paul@paul-moore.com>
Date:   Tue, 25 Jan 2022 12:45:14 -0500
Message-ID: <CAHC9VhTwXUE9dYBHrkA3Xkr=AgXvcnfSzLLBJ4QqYd4R+kFbbA@mail.gmail.com>
Subject: Re: [PATCH RFC v2 1/2] selinux: Fix selinux_sb_mnt_opts_compat()
To:     Scott Mayhew <smayhew@redhat.com>
Cc:     selinux@vger.kernel.org, linux-nfs@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Tue, Jan 25, 2022 at 12:31 PM Scott Mayhew <smayhew@redhat.com> wrote:
> On Mon, 24 Jan 2022, Paul Moore wrote:
> > On Thu, Jan 20, 2022 at 4:50 PM Scott Mayhew <smayhew@redhat.com> wrote:
> > >
> > > selinux_sb_mnt_opts_compat() is called under the sb_lock spinlock and
> > > shouldn't be performing any memory allocations.  Fix this by parsing the
> > > sids at the same time we're chopping up the security mount options
> > > string and then using the pre-parsed sids when doing the comparison.
> > >
> > > Fixes: cc274ae7763d ("selinux: fix sleeping function called from invalid context")
> > > Fixes: 69c4a42d72eb ("lsm,selinux: add new hook to compare new mount to an existing mount")
> > > Signed-off-by: Scott Mayhew <smayhew@redhat.com>
> > > ---
> > >  security/selinux/hooks.c | 112 ++++++++++++++++++++++++++-------------
> > >  1 file changed, 76 insertions(+), 36 deletions(-)

...

> > >         switch (token) {
> > >         case Opt_context:
> > >                 if (opts->context || opts->defcontext)
> > >                         goto err;
> > >                 opts->context = s;
> > > +               if (preparse_sid) {
> > > +                       rc = parse_sid(NULL, s, &sid);
> > > +                       if (rc == 0) {
> > > +                               opts->context_sid = sid;
> > > +                               opts->preparsed |= CONTEXT_MNT;
> > > +                       }
> > > +               }
> >
> > Is there a reason why we need a dedicated sid variable as opposed to
> > passing opt->context_sid as the parameter?  For example:
> >
> >   rc = parse_sid(NULL, s, &opts->context_sid);
>
> We don't need a dedicated sid variable.  Should I make similar changes
> in the second patch (get rid of the local sid variable in
> selinux_sb_remount() and the *context_sid variables in
> selinux_set_mnt_opts())?

Yes please, I should have explicitly mentioned that.

Thanks.

-- 
paul moore
paul-moore.com
