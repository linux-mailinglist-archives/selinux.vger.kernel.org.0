Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06104248565
	for <lists+selinux@lfdr.de>; Tue, 18 Aug 2020 14:53:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726645AbgHRMxB (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Tue, 18 Aug 2020 08:53:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726935AbgHRMwq (ORCPT
        <rfc822;selinux@vger.kernel.org>); Tue, 18 Aug 2020 08:52:46 -0400
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com [IPv6:2607:f8b0:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24ECEC061389
        for <selinux@vger.kernel.org>; Tue, 18 Aug 2020 05:52:46 -0700 (PDT)
Received: by mail-ot1-x343.google.com with SMTP id v6so16108658ota.13
        for <selinux@vger.kernel.org>; Tue, 18 Aug 2020 05:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YcM/dw7JFtBR8KsFAywnpLu87Se5kgPH9nPxzN3HRo0=;
        b=VVrLlT1eLgTo4yb96c3Jg2wH+cjeq0ypwbW67wobKvkoF1Pe4IRSbkzW35NezeZXdG
         AlcDy9+sVoEYQG7ix1r2oEbhq1JkaubPhCOGWd46TVSQibADfe/4Qg/G857QQjvIhhF7
         0YXRXRMzU72P1uf8q1NgeYhzHj0a5zRf4UQo0OwmDlPj+GGqq7H3vOsRk7YvILvJs0VY
         6VBEruO00R2ciJeyPYBjlmY0mX5qQz+SzdyddSqJe1R2q4LXWpmeVrt9oPhS0mBD1GwU
         MEerJGb5JFxWhHK4F/Iiw8+BK9pYjDkvokbjLAyTzdsMa5hGyjMHsdGTq4IgLvy1gezE
         gocg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YcM/dw7JFtBR8KsFAywnpLu87Se5kgPH9nPxzN3HRo0=;
        b=N0Suxm1/c6GSXDNK6uni9qRa5jdLOuHAwuQRZlPSSwmSt79abjeSPTVi7aZtle/kf+
         2u1dDYFlKClkPu9GpQW10q8/1kMqIP6rWszRHh1ooUeuxNEr8xYXnjTPDBXcg0efooH8
         uRuZGOUsYhSjJeLxTsqHhyMkQyxE7g/9dq41S+74NlwPL3HBNOULgEecLwNJbNp2Z1Zg
         6S/5JCRdtx0gvi+HML5r6t9xtM+UOTbVtvHiBY5cK4skx6Gaqg5O1GPB6L6joazCc08+
         FkKX7WiVIC2B7L0mz+07XycgN+RnHCPVI+W4QVQ4PyCY+NbLlQS3fjTpMnUG6XKtYkCY
         X0Kg==
X-Gm-Message-State: AOAM5309P5UPzV8/6/+z6AGlW0ZLVIWAqSWK5gUXkeZaJj19zjbBef9J
        pmEKz0SD/n6H65pQ9GVdLj+NaGeIngwd9iGPTqA=
X-Google-Smtp-Source: ABdhPJxDMiOif3m1F1KZJnFsTWA1qRCVhckEvzIY4Jxxmzl3F9LDutzVQdRxdetDyJjDpY15a2sOx9odaPgOYgTYH7M=
X-Received: by 2002:a05:6830:16d8:: with SMTP id l24mr14128365otr.89.1597755165488;
 Tue, 18 Aug 2020 05:52:45 -0700 (PDT)
MIME-Version: 1.0
References: <CAEjxPJ6b0MM-04XwcE58N-BiOBBi2g-1AZovoBmPGgcfU_wZiQ@mail.gmail.com>
 <CAHC9VhQurFFNfjx22RxKp-QG_GJ6VDZy3yEOWwWY++wfn+2C9Q@mail.gmail.com> <CAEjxPJ693_3xX=VJTkQejfSatox9YxER9L0y=0H781noSGA-Hw@mail.gmail.com>
In-Reply-To: <CAEjxPJ693_3xX=VJTkQejfSatox9YxER9L0y=0H781noSGA-Hw@mail.gmail.com>
From:   Stephen Smalley <stephen.smalley.work@gmail.com>
Date:   Tue, 18 Aug 2020 08:52:34 -0400
Message-ID: <CAEjxPJ6TEk=iXHkB0=6EytMeJo1R+ZSgS8O0-32NPHpR43PhsQ@mail.gmail.com>
Subject: Re: potential memory leak in netlbl_mgmt_add_common
To:     Paul Moore <paul@paul-moore.com>
Cc:     Ondrej Mosnacek <omosnace@redhat.com>,
        SElinux list <selinux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Tue, Aug 18, 2020 at 8:28 AM Stephen Smalley
<stephen.smalley.work@gmail.com> wrote:
>
> On Mon, Aug 17, 2020 at 10:25 PM Paul Moore <paul@paul-moore.com> wrote:
> >
> > On Thu, Aug 13, 2020 at 12:32 PM Stephen Smalley
> > <stephen.smalley.work@gmail.com> wrote:
> > >
> > > I noticed this in /sys/kernel/debug/kmemleak while testing other
> > > patches.  This is on 5.8.0-rc1 but may be older.
> > >
> > > unreferenced object 0xffff888158b40380 (size 32):
> > >   comm "netlabelctl", pid 2982, jiffies 4295212079 (age 3234.561s)
> > >   hex dump (first 32 bytes):
> > >     80 03 b4 58 81 88 ff ff 80 03 b4 58 81 88 ff ff  ...X.......X....
> > >     90 03 b4 58 81 88 ff ff 90 03 b4 58 81 88 ff ff  ...X.......X....
> > >   backtrace:
> > >     [<000000009fe161a4>] netlbl_mgmt_add_common+0x2df/0x9b0
> > >     [<00000000816cc1d9>] netlbl_mgmt_adddef+0x133/0x190
> > >     [<00000000f060e456>] genl_rcv_msg+0x2dd/0x490
> > >     [<000000001c733400>] netlink_rcv_skb+0xd0/0x200
> > >     [<00000000c42f6f58>] genl_rcv+0x24/0x40
> > >     [<000000005421c040>] netlink_unicast+0x2b4/0x3e0
> > >     [<00000000ab107bba>] netlink_sendmsg+0x3a6/0x660
> > >     [<00000000643024bd>] sock_sendmsg+0x96/0xa0
> > >     [<00000000ba78e5a6>] ____sys_sendmsg+0x404/0x440
> > >     [<000000006f3de0f5>] ___sys_sendmsg+0xd8/0x140
> > >     [<000000009b8c70ea>] __sys_sendmsg+0xa3/0x110
> > >     [<00000000e65194c3>] do_syscall_64+0x52/0xb0
> > >     [<00000000367aebc6>] entry_SYSCALL_64_after_hwframe+0x44/0xa9
> >
> > Hmmm, that's interesting, a quick look at the code doesn't reveal
> > anything obvious and it looks like I don't currently have kmemleak
> > enabled in my kernel so I'll need to rebuild ... you wouldn't happen
> > to have line numbers for the backtrace above would you?  Anything
> > special you did to reproduce this?
>
> I don't still have that kernel so I'll need to reproduce it again.  It
> was reproducible however just by running the selinux-testsuite and
> then echo scan > /sys/kernel/debug/kmemleak and then cat
> /sys/kernel/debug/kmemleak.  kmemleak-related config was:
> CONFIG_HAVE_DEBUG_KMEMLEAK=y
> CONFIG_DEBUG_KMEMLEAK=y
> CONFIG_DEBUG_KMEMLEAK_MEM_POOL_SIZE=4096
> # CONFIG_DEBUG_KMEMLEAK_TEST is not set
> # CONFIG_DEBUG_KMEMLEAK_DEFAULT_OFF is not set
> CONFIG_DEBUG_KMEMLEAK_AUTO_SCAN=y

If I am decoding this correctly, it looks like the leaking allocation
is at net/netlabel/netlabel_mgmt.c:152:
   147         if (info->attrs[NLBL_MGMT_A_IPV4ADDR]) {
    148                 struct in_addr *addr;
    149                 struct in_addr *mask;
    150                 struct netlbl_domaddr4_map *map;
    151
    152                 addrmap = kzalloc(sizeof(*addrmap), GFP_KERNEL);
    153                 if (addrmap == NULL) {
    154                         ret_val = -ENOMEM;
    155                         goto add_doi_put_def;
    156                 }
