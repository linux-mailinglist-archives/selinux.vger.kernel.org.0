Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDC8C40A2D9
	for <lists+selinux@lfdr.de>; Tue, 14 Sep 2021 03:50:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232448AbhINBvr (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Mon, 13 Sep 2021 21:51:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231976AbhINBvo (ORCPT
        <rfc822;selinux@vger.kernel.org>); Mon, 13 Sep 2021 21:51:44 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E885FC061760
        for <selinux@vger.kernel.org>; Mon, 13 Sep 2021 18:50:27 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id n10so17235253eda.10
        for <selinux@vger.kernel.org>; Mon, 13 Sep 2021 18:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jPu3h9CQPcnJEoZBnk22cJi+iEEAQklCzeiD4Yt6F+4=;
        b=ViM5QgV3bdhBUnRbzSzh9HBc/gtTqBCotJ+JMSFQthJmEDXZ9S9mjR1RKsWsWlI3D/
         DvpQAeCLfEdvvtfSo0kxE0IL7QiAMaQeHPwLKM5DSFGsAu+o5T+hXxZy3zq0vI4ArzZu
         cGA2HBMNSt56w0+6BO3RwBu6GVVjRsR6v6PjsTnK9pSz25FxtFWjPG4vmvhyiLFoqNcl
         x42bOj4TXZrV2i1+MvQMWj4Dc8JJLhyVIS0GaMF1NPB++uv9dab/nVRbOvkD1Pt4jx8Y
         JE8FZo7CE6G5j6ErdyzN5p/04LD8zrnYw2TRBSLojwarDBtqFnxHcCQoYFFadNIrVpiI
         lZrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jPu3h9CQPcnJEoZBnk22cJi+iEEAQklCzeiD4Yt6F+4=;
        b=AclBB45pFAhFnUSNkkZ+xuuBv9rRxV8GNd2vgMwBlutLLQx6VVwTFEjeyJJqnWEE1o
         9oGQWL/S7h/4gQCUxD4nvCBK3lzAuvKZ3Xn0MlC2FJQRCtV8yk2pLWvQuRmTHiY/2HwG
         6e0IFNWE9ridFd2lsF6qPzkdO9yQ8yEBPzKfl+B2QXT3mhpgkGKTB1FghhvQdD8F7Ap+
         Ty27f2TasBtsBHGGPJkw48sPsuKiUNpn4ntu0OsChtieT6ZIjONVdzhVJEso6Hf/VOyw
         8shMOnKPIYG29J47JqwdU1KSm07mkGNQCD6/9+XxEFgtBJc713Jo/6c9iROZbVg1reKV
         dolg==
X-Gm-Message-State: AOAM5320sz6vRZRVsxYpkBOVEYVkx1m677aSbxHPRZ6GV6x3g9DXOEfz
        +Ojo+CpyBDniEK4NCMz0dU9wg/A49N2kf5nnHQbs
X-Google-Smtp-Source: ABdhPJxh9C/8a1CsAbh15aNiNt0zThWTeKtkQZUPvHU1ASlce16mrq98gj9qsXKgpDoK44hWmc7N9M7URgGcpkj+mxk=
X-Received: by 2002:a05:6402:13d0:: with SMTP id a16mr12628569edx.155.1631584226307;
 Mon, 13 Sep 2021 18:50:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210824205724.GB490529@madcap2.tricolour.ca> <20210826011639.GE490529@madcap2.tricolour.ca>
 <CAHC9VhSADQsudmD52hP8GQWWR4+=sJ7mvNkh9xDXuahS+iERVA@mail.gmail.com>
 <20210826163230.GF490529@madcap2.tricolour.ca> <CAHC9VhTkZ-tUdrFjhc2k1supzW1QJpY-15pf08mw6=ynU9yY5g@mail.gmail.com>
 <20210827133559.GG490529@madcap2.tricolour.ca> <CAHC9VhRqSO6+MVX+LYBWHqwzd3QYgbSz3Gd8E756J0QNEmmHdQ@mail.gmail.com>
 <20210828150356.GH490529@madcap2.tricolour.ca> <CAHC9VhRgc_Fhi4c6L__butuW7cmSFJxTMxb+BBn6P-8Yt0ck_w@mail.gmail.com>
 <CAHC9VhQD8hKekqosjGgWPxZFqS=EFy-_kQL5zAo1sg0MU=6n5A@mail.gmail.com>
 <20210910005858.GL490529@madcap2.tricolour.ca> <CAHC9VhSRJYW7oRq6iLCH_UYukeFfE0pEJ_wBLdr1mw2QGUPh-Q@mail.gmail.com>
In-Reply-To: <CAHC9VhSRJYW7oRq6iLCH_UYukeFfE0pEJ_wBLdr1mw2QGUPh-Q@mail.gmail.com>
From:   Paul Moore <paul@paul-moore.com>
Date:   Mon, 13 Sep 2021 21:50:15 -0400
Message-ID: <CAHC9VhTrimTds_miuyRhhHjoG_Fhmk2vH7G3hKeeFWO3BdLpKw@mail.gmail.com>
Subject: Re: [RFC PATCH v2 0/9] Add LSM access controls and auditing to io_uring
To:     Richard Guy Briggs <rgb@redhat.com>
Cc:     sgrubb@redhat.com, linux-security-module@vger.kernel.org,
        selinux@vger.kernel.org, linux-audit@redhat.com,
        io-uring@vger.kernel.org, linux-fsdevel@vger.kernel.org,
        Kumar Kartikeya Dwivedi <memxor@gmail.com>,
        Jens Axboe <axboe@kernel.dk>,
        Pavel Begunkov <asml.silence@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Mon, Sep 13, 2021 at 3:23 PM Paul Moore <paul@paul-moore.com> wrote:
> On Thu, Sep 9, 2021 at 8:59 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> > On 2021-09-01 15:21, Paul Moore wrote:
> > > On Sun, Aug 29, 2021 at 11:18 AM Paul Moore <paul@paul-moore.com> wrote:
> > > > On Sat, Aug 28, 2021 at 11:04 AM Richard Guy Briggs <rgb@redhat.com> wrote:
> > > > > I did set a syscall filter for
> > > > >         -a exit,always -F arch=b64 -S io_uring_enter,io_uring_setup,io_uring_register -F key=iouringsyscall
> > > > > and that yielded some records with a couple of orphans that surprised me
> > > > > a bit.
> > > >
> > > > Without looking too closely at the log you sent, you can expect URING
> > > > records without an associated SYSCALL record when the uring op is
> > > > being processed in the io-wq or sqpoll context.  In the io-wq case the
> > > > processing is happening after the thread finished the syscall but
> > > > before the execution context returns to userspace and in the case of
> > > > sqpoll the processing is handled by a separate kernel thread with no
> > > > association to a process thread.
> > >
> > > I spent some time this morning/afternoon playing with the io_uring
> > > audit filtering capability and with your audit userspace
> > > ghau-iouring-filtering.v1.0 branch it appears to work correctly.  Yes,
> > > the userspace tooling isn't quite 100% yet (e.g. `auditctl -l` doesn't
> > > map the io_uring ops correctly), but I know you mentioned you have a
> > > number of fixes/improvements still as a work-in-progress there so I'm
> > > not too concerned.  The important part is that the kernel pieces look
> > > to be working correctly.
> >
> > Ok, I have squashed and pushed the audit userspace support for iouring:
> >         https://github.com/rgbriggs/audit-userspace/commit/e8bd8d2ea8adcaa758024cb9b8fa93895ae35eea
> >         https://github.com/linux-audit/audit-userspace/compare/master...rgbriggs:ghak-iouring-filtering.v2.1
> > There are test rpms for f35 here:
> >         http://people.redhat.com/~rbriggs/ghak-iouring/git-e8bd8d2-fc35/
> >
> > userspace v2 changelog:
> > - check for watch before adding perm
> > - update manpage to include filesystem filter
> > - update support for the uring filter list: doc, -U op, op names
> > - add support for the AUDIT_URINGOP record type
> > - add uringop support to ausearch
> > - add uringop support to aureport
> > - lots of bug fixes
> >
> > "auditctl -a uring,always -S ..." will now throw an error and require
> > "-U" instead.
>
> Thanks Richard.
>
> FYI, I rebased the io_uring/LSM/audit patchset on top of v5.15-rc1
> today and tested both with your v1.0 and with your v2.1 branch and the
> various combinations seemed to work just fine (of course the v2.1
> userspace branch was more polished, less warts, etc.).  I'm going to
> go over the patch set one more time to make sure everything is still
> looking good, write up an updated cover letter, and post a v3 revision
> later tonight with the hope of merging it into -next later this week.

Best laid plans of mice and men ...

It turns out the LSM hook macros are full of warnings-now-errors that
should likely be resolved before sending anything LSM related to
Linus.  I'll post v3 once I fix this, which may not be until tomorrow.

(To be clear, the warnings/errors aren't new to this patchset, I'm
likely just the first person to notice them.)

-- 
paul moore
www.paul-moore.com
