Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B4F4461A727
	for <lists+selinux@lfdr.de>; Sat,  5 Nov 2022 04:04:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229634AbiKEDEL (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Fri, 4 Nov 2022 23:04:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229609AbiKEDEJ (ORCPT
        <rfc822;selinux@vger.kernel.org>); Fri, 4 Nov 2022 23:04:09 -0400
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABE4522B1B
        for <selinux@vger.kernel.org>; Fri,  4 Nov 2022 20:04:08 -0700 (PDT)
Received: by mail-oi1-x22e.google.com with SMTP id c129so7079931oia.0
        for <selinux@vger.kernel.org>; Fri, 04 Nov 2022 20:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vM8YVr4cq5mteRVZP+VUrF+VqtKB+dPqSsMDeYM+RZs=;
        b=PDNwUrDzWeTcMpOpy2d+d5fFJ8ZF1Negjze3alwRAQxuZ7+l0k/hSFWuPsO3VJ8NWP
         uytCuSqsqXJwQzy6lLWNfAQJseWBZIklIw58AWVftUu1D0rFuh4u4mvkHmeZ4jJ50RGk
         6Ml2r0RxDcPxG8lJutvlGlvSk2/MNOalnBWOTc2JVwsMhZeqCkAzplWrGa/qu21NW3Px
         tsnvouOmbbTqrAazR1Onof/b2urWU0Nqr0nDTKLQcMspeE62PpuIFplnbwbcQ0Zm+8z2
         I55Wri87tVXBp310RZpe9y3h+ajxeVTGvILhP7u5NkoZ1p1FQjPnlvSFbOaH9Hr3A6Pf
         +7gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vM8YVr4cq5mteRVZP+VUrF+VqtKB+dPqSsMDeYM+RZs=;
        b=f1tehZymI9X2Q8WycIaEMAMMgYAIHeO0T4pxk4DGyVrXN4vVuuYFSuhTQKsC5Dk+m/
         0C1bn1yONnePemOGFS38c2ljK9gl2mw8T60Ha28PBHX5Dpc90xNiCsf5ldTUkYHTGyMv
         GRqsfLY2+qZPJxfJ3INYy3vqbLrn1Kr+dKvEQ6VAqJY31sJqLw69aFhNiTN6HoK7SKqa
         g3Bevv7AULDG1raREr7cwT8Gxc/5fTcrZ4rVu5LcuiJKKynqQDvQpK0iVFBRqeWzg0Ma
         h4YFHI9/to4dqwF2eEIZ/Pk4YnaWwntO4vy0vpBXkRWmZyZHsQiEtrd3f3NbEgDjjCaX
         w1rQ==
X-Gm-Message-State: ACrzQf1/QcIeiqj7bCttXMPQfEMn5c9CXmYjMAGk3dNUktm0t3MmKSKX
        10/0oeM/SMOrnhU75pF0Cc1mG8LsPVLGDjjU9E63
X-Google-Smtp-Source: AMsMyM5oxpA9OQ1Js8K8Gnmqd6cJQXcDpytGixhi+qVwAuiti8ogO4ZFgKZrpuntzQrxt0lec0b8SYRgP6G2GJV+LNs=
X-Received: by 2002:a05:6808:1441:b0:35a:4a2d:673b with SMTP id
 x1-20020a056808144100b0035a4a2d673bmr7413982oiv.172.1667617447964; Fri, 04
 Nov 2022 20:04:07 -0700 (PDT)
MIME-Version: 1.0
References: <CAHC9VhSXRDUw0CGLqinogP6g5rHWz4rg3N4Dr-VV8RshWt56Jw@mail.gmail.com>
 <CAHk-=wgXx=0AKgMA8dGRROi5EarYxkEfHNu_zsezLgjtPrqNow@mail.gmail.com>
In-Reply-To: <CAHk-=wgXx=0AKgMA8dGRROi5EarYxkEfHNu_zsezLgjtPrqNow@mail.gmail.com>
From:   Paul Moore <paul@paul-moore.com>
Date:   Fri, 4 Nov 2022 23:03:56 -0400
Message-ID: <CAHC9VhTkzkv2Qm2FwsTyhonBtGx0o-qNmVq_WU-WJP9NcsELpA@mail.gmail.com>
Subject: Re: [GIT PULL] SELinux fixes for v6.1 (#1)
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     selinux@vger.kernel.org, linux-security-module@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Fri, Oct 21, 2022 at 5:42 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
> On Thu, Oct 20, 2022 at 8:20 AM Paul Moore <paul@paul-moore.com> wrote:
> >
> >         The patch, while still fairly small, is a bit
> > larger than one might expect from a simple s/GFP_KERNEL/GFP_ATOMIC/
> > conversion because we added support for the function to be called with
> > different gfp flags depending on the context, preserving GFP_KERNEL
> > for those cases that can safely sleep.
>
> Hmm.
>
> So I've pulled this, but that patch actually makes it obvious that
> there is only one single possible function for "convert->func", namely
> that "convert_context()" function.

Sorry for the delay, network access has been limited the past few
weeks so I needed to prioritize things like getting fixes out over non
critical responses.

Anyway, yes, you're right, it's something we should look into
resolving and I plan to do that in the coming week or two.

-- 
paul-moore.com
