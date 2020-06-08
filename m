Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34D751F21BF
	for <lists+selinux@lfdr.de>; Tue,  9 Jun 2020 00:13:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726730AbgFHWN6 (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Mon, 8 Jun 2020 18:13:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726598AbgFHWN5 (ORCPT
        <rfc822;selinux@vger.kernel.org>); Mon, 8 Jun 2020 18:13:57 -0400
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com [IPv6:2607:f8b0:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA624C08C5C2
        for <selinux@vger.kernel.org>; Mon,  8 Jun 2020 15:13:57 -0700 (PDT)
Received: by mail-ot1-x341.google.com with SMTP id n70so2543553ota.5
        for <selinux@vger.kernel.org>; Mon, 08 Jun 2020 15:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rMLgxUh3M6WzSNknY36ioh6i8W7QyH6Qs5J8JBlFLlw=;
        b=SR4jZe1F545nvgKwtKIL/UJZOQTMqQPhFKPGdL8GvsgmikOAbVW/4iCD758A7/LDxi
         ZXhKA+i5ppStDAjJ9QPS+9vZ9QHMG9WFayRuSPw1g996RQ/X7YIzv4NMJp+LItOJWxtz
         BrM85GbcA/8AVgrbI38kuruioBnvHxz0dH9xK6zxjMLuk5QUGpTzb4ascBLE+KUoi4or
         hJ3dJa6Vg922gOdjReJhj4xn77v4c3YCVG/jRI6K+5nd4ablaz0NIiAANHT1lr+lVHVA
         KS7T5coml1frcXU9ExRt6Yc3IOorhdBlVGwgxTHT+SHBlyjNu6ZivA0FurOONJbxxFG8
         58tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rMLgxUh3M6WzSNknY36ioh6i8W7QyH6Qs5J8JBlFLlw=;
        b=oHp9BSix/SGL6QnhshQ1FRpn+MvQzR5lHTsq8MMwfeSkeEPIvtXC6AgXFO1naZtuLo
         DIxrWx8IPadhWPZqy49RfMs4ZzoCeFkD9iJsqIRjitsOsoeZdIPKBdSvFyQpKjBMHTkK
         jlPB+ObHtcQASVPXfUp/OWL5VLWW6Zvt0H6KDZOAJZr6pT2tQ0CagPUi7g1zeiTuoH7F
         QYKWTXmob6eQmV3gQO0GIcbrbCbWetFxz1ThpmRiZdduNMG2N3Du8AWOc2svSPB80Gpz
         xLqgbXteNc0ErOekgJP8v0EN0nq644URCCJ1j9xhHrppodKj49pv88nJYTIyucixVzSv
         0iXQ==
X-Gm-Message-State: AOAM530VdQt3/oEkKXCgfxnNJ+0m1JzABcXIXtjXM6K8wvQLSmcmUBvT
        dBJD4hKpEBYWHBRZzi9eQjni8dlgFCV89fTcJEc=
X-Google-Smtp-Source: ABdhPJxhCGkGhF7/61d3/ZnCVX777si+r2zCb16iv7tV0kzKN4eXSCwWQwL1jqhBgCsUxH/QQXSJaVJlPMNgMh6WgeM=
X-Received: by 2002:a05:6830:18da:: with SMTP id v26mr19848523ote.135.1591654437033;
 Mon, 08 Jun 2020 15:13:57 -0700 (PDT)
MIME-Version: 1.0
References: <159110207843.57260.5661475689740939480.stgit@chester>
 <CAHC9VhQacYKE4sJRbqmpudXfMyzCT8VM0SFUCi=o-MNsn4c_MA@mail.gmail.com>
 <CAEjxPJ5oGWygz87dQw1HbP2wZovc+Q7ESKSF0zBMF_cSwxRdww@mail.gmail.com> <CAHC9VhSsY+MtSrj17g+p3FMeaKQ-Mjjy=iXS+1TbhCKGAn_yxA@mail.gmail.com>
In-Reply-To: <CAHC9VhSsY+MtSrj17g+p3FMeaKQ-Mjjy=iXS+1TbhCKGAn_yxA@mail.gmail.com>
From:   Stephen Smalley <stephen.smalley.work@gmail.com>
Date:   Mon, 8 Jun 2020 18:13:46 -0400
Message-ID: <CAEjxPJ6nLAOjLvhswyLNCUO8bUuwm_h7emFp7dZXDzRjMuG2HA@mail.gmail.com>
Subject: Re: [RFC PATCH] selinux: runtime disable is deprecated, add some
 ssleep() discomfort
To:     Paul Moore <paul@paul-moore.com>
Cc:     Ondrej Mosnacek <omosnace@redhat.com>,
        SElinux list <selinux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Mon, Jun 8, 2020 at 5:35 PM Paul Moore <paul@paul-moore.com> wrote:
>
> On Thu, Jun 4, 2020 at 10:49 AM Stephen Smalley
> <stephen.smalley.work@gmail.com> wrote:
> > On Tue, Jun 2, 2020 at 8:52 AM Paul Moore <paul@paul-moore.com> wrote:
> > > On Tue, Jun 2, 2020 at 8:47 AM Paul Moore <paul@paul-moore.com> wrote:
> > > >
> > > > We deprecated the SELinux runtime disable functionality in Linux
> > > > v5.6, add a five second sleep to anyone using it to help draw their
> > > > attention to the deprecation.
> > > >
> > > > Signed-off-by: Paul Moore <paul@paul-moore.com>
> > > > ---
> > > >  security/selinux/selinuxfs.c |    2 ++
> > > >  1 file changed, 2 insertions(+)
> > >
> > > Warning: while trivial, I've done no testing beyond a quick compile
> > > yet.  I'm posting this now to see what everyone thinks about starting
> > > to make it a bit more painful to use the runtime disable
> > > functionality.
> >
> > I'm concerned about how users will experience and respond to this
> > change (and Linus too).  Currently SELinux runtime disable is the
> > method used by distro installers (at least Fedora/RHEL and
> > derivatives) when SELinux-disabled is selected at install time and it
> > is the approach documented in distro documentation for how to disable
> > SELinux.  Hence, we'd be inflicting pain on the end users for what is
> > essentially a distro choice.
>
> I delayed my response in hopes the Fedora folks would also comment,
> but I'm not seeing anything.
>
> All this patch does is start executing on the deprecation path we laid
> out when we marked the functionality as deprecated.  When we decided
> to do this we had buy-in from the Fedora folks (the only ones who
> still use this option);  if this is a problem for them then I would
> like to understand what changed, and why.  If it is a matter of this
> coming too quickly, that's okay, we can push this out another release
> or two.  We can even drop the sleep down to a second or two.  Both the
> timing of introducing the delay, and the length of the delay itself,
> aren't important to me; it's the fact that we are adding a delay and
> moving forward on the deprecation (just as we said we would).
>
> What were you envisioning when we marked this as deprecated Stephen?
> If not this, what were you thinking we would do?

I feel like we've already communicated the fact that it is being
deprecated to those who need to know (Fedora maintainers), and we
already have it displaying an error message for those who look at
kernel logs.  So I was fine with just waiting some number of kernel
release cycles (not sure what is typical for these kinds of things)
and then just changing selinux_write_disable() to just return 0
without doing anything and dropping the selinux_disable() code and the
config option.  I think we'll want it to return 0 rather than an error
so that systemd will still unmount selinuxfs and act as if SELinux has
been disabled (which in turn will case everything else to act as if
SELinux has been disabled).  The kernel will be in permissive mode
with no policy loaded in that situation, so except for some corner
cases everything should just work.  That seems the least disruptive
path for end users.  Distro maintainers will hopefully get around to
using selinux=0 instead but that may lag.
