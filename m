Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 109A132DF71
	for <lists+selinux@lfdr.de>; Fri,  5 Mar 2021 03:10:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229516AbhCECKI (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Thu, 4 Mar 2021 21:10:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229463AbhCECKI (ORCPT
        <rfc822;selinux@vger.kernel.org>); Thu, 4 Mar 2021 21:10:08 -0500
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00A8BC061574
        for <selinux@vger.kernel.org>; Thu,  4 Mar 2021 18:10:06 -0800 (PST)
Received: by mail-ed1-x52f.google.com with SMTP id m9so508269edd.5
        for <selinux@vger.kernel.org>; Thu, 04 Mar 2021 18:10:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=O9ReJcy8RlfrDC/fAF+2CwFahTTparPVhDqzUGMBrqE=;
        b=woUbkBjqxCS2IzG7iYf9ZxU8YwMf3pJO3aanguwN3a9ejhULoWEEOvedgeoMmHRpcB
         CpQzvoHNNVNY87HzO0gGKcpMCjp4M8uu5mMdOWxgia7GfLsIbD8ES+Z+e3KauORxPdOK
         tlebWgMEU78s2xbRwVrz2Nj/0VnNV7/j1+3xgsUuaA8Cp3kWX0x+zx//hB3IKKcrleOG
         A4uNsMamZ+CPRpSooYpTI+Ce17zHiTrsImBHPR3oD8XjSzu42+tZ1c+B1WvAtc3dYg16
         9MCq6l7p86q7RtEMYjjK8fDmSTdUo6uF+jifM/wooLUjKcs+bS4MI9Ah9al7vOhMrO2s
         kjAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=O9ReJcy8RlfrDC/fAF+2CwFahTTparPVhDqzUGMBrqE=;
        b=CHEHSqUYwBqN+lZAr6CTezEBOY3W9+jmoZ32pDI5WWwGDeyQcopdHapxBUYA7NuMh7
         8ct/1DK+c5JbijH+bwba+F8BCxD4acPfmXHMIK/YYGaPugUYDM0mSKG7sIVvSgQuEfUy
         ib398gfDu+MwcoGYhlW/zg6bSRxAhciJB78UpuldoCAAe10C3DRCXdOi8k0z0m+kqkeh
         qWAtrutFIVORRzJCWgxe9cbhwWfLSpj854n4tMnHtJEXahVl3GJ4+l/wX+TVmloHYCOc
         BRvXxeJFiSD4O4jQPIquwl/K5H7pNx43wMkSYDCwDTexTC12LJ2VmVGUKJBNxtXubZ5H
         0CZg==
X-Gm-Message-State: AOAM532G8yCJPdLHHiguwfBV8oIaZWixDNtwZiW3C3rwdJCe8e0DWOK6
        NJn/bs+aAwXaa9d4wvIk3A5FsFcpK9PUOq9eC1wQ
X-Google-Smtp-Source: ABdhPJwU/jYv/w94e0kLCOV17GeQZelv+fX7z5DY6QQvma7jKikZr0KQ9k1MEZKv+mWLLb81+E/rWaCcJnm1odjFkpU=
X-Received: by 2002:a05:6402:1cc1:: with SMTP id ds1mr3615411edb.135.1614910205565;
 Thu, 04 Mar 2021 18:10:05 -0800 (PST)
MIME-Version: 1.0
References: <20210211180303.GE5014@redhat.com> <CAHC9VhRM6MiF1m2aFpLJKb3CFWXcXEX_SY=EnkLaq7U_X2UTZw@mail.gmail.com>
In-Reply-To: <CAHC9VhRM6MiF1m2aFpLJKb3CFWXcXEX_SY=EnkLaq7U_X2UTZw@mail.gmail.com>
From:   Paul Moore <paul@paul-moore.com>
Date:   Thu, 4 Mar 2021 21:09:54 -0500
Message-ID: <CAHC9VhSrcMS7BxZ9R=RUb-5DkWxT_6ELpcm1-1XwszkzVmwrgQ@mail.gmail.com>
Subject: Re: [PATCH][v2] selinux: Allow context mounts for unpriviliged overlayfs
To:     Vivek Goyal <vgoyal@redhat.com>
Cc:     selinux@vger.kernel.org, linux-unionfs@vger.kernel.org,
        Stephen Smalley <stephen.smalley.work@gmail.com>,
        Eric Paris <eparis@parisplace.org>,
        Miklos Szeredi <miklos@szeredi.hu>,
        Daniel J Walsh <dwalsh@redhat.com>,
        Ondrej Mosnacek <omosnace@redhat.com>,
        Amir Goldstein <amir73il@gmail.com>,
        Giuseppe Scrivano <gscrivan@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Thu, Feb 11, 2021 at 4:24 PM Paul Moore <paul@paul-moore.com> wrote:
> On Thu, Feb 11, 2021 at 1:03 PM Vivek Goyal <vgoyal@redhat.com> wrote:
> >
> > Now overlayfs allow unpriviliged mounts. That is root inside a non-init
> > user namespace can mount overlayfs. This is being added in 5.11 kernel.
> >
> > Giuseppe tried to mount overlayfs with option "context" and it failed
> > with error -EACCESS.
> >
> > $ su test
> > $ unshare -rm
> > $ mkdir -p lower upper work merged
> > $ mount -t overlay -o lowerdir=lower,workdir=work,upperdir=upper,userxattr,context='system_u:object_r:container_file_t:s0' none merged
> >
> > This fails with -EACCESS. It works if option "-o context" is not specified.
> >
> > Little debugging showed that selinux_set_mnt_opts() returns -EACCESS.
> >
> > So this patch adds "overlay" to the list, where it is fine to specific
> > context from non init_user_ns.
> >
> > v2: Fixed commit message to reflect that unpriveleged overlayfs mount is
> >     being added in 5.11 and not in 5.10 kernel.
> >
> > Reported-by: Giuseppe Scrivano <gscrivan@redhat.com>
> > Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
> > ---
> >  security/selinux/hooks.c |    3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
>
> Thanks Vivek, once the merge window closes I'll merge this into
> selinux/next and send a note to this thread.

I just merged this into my local selinux/next and will be pushing it
to kernel.org later tonight.  Thanks!

-- 
paul moore
www.paul-moore.com
