Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 130D57EE14E
	for <lists+selinux@lfdr.de>; Thu, 16 Nov 2023 14:16:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230340AbjKPNQw (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Thu, 16 Nov 2023 08:16:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230182AbjKPNQv (ORCPT
        <rfc822;selinux@vger.kernel.org>); Thu, 16 Nov 2023 08:16:51 -0500
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CFBE101;
        Thu, 16 Nov 2023 05:16:48 -0800 (PST)
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-2802e5ae23bso633815a91.2;
        Thu, 16 Nov 2023 05:16:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700140608; x=1700745408; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R5ggOw6GphawqhPawDLfaVpMxqhsYWi11Z2Wl02CIa8=;
        b=WxzDmLYdjT0lKwAU054gov4uKLyGYaETzJnqaT/cOYEdrWYfqyX0IyLKZLcJYpB1dp
         0GvBNaozeAO16EtRbUSMQ5mQ72/w4FEAPiHaRegjiaPNT9McN6nqrkacF4jG3pQ7+ReB
         ejwJY4T/pIZsv/sTdWnLj83S34fNf6iLFiNo50we7lYMMZdiuR1Gi6G7LbtqZDh9xbSo
         jQrv275HIr6iVr/qaWqkkqSw4cTLiDUNRzvgGs5/4mRUaYPUJ5StxTEvjQGLYoDw8EHR
         WDezX3r3x7LBsgM3q90R4iLHtsaIseA+MGIcmYPLvF5eHNjdDlnmhzASTd/58u+zKt2S
         dC+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700140608; x=1700745408;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R5ggOw6GphawqhPawDLfaVpMxqhsYWi11Z2Wl02CIa8=;
        b=qn6x17zChyFyPGjnXhMD7gropqaGDutfNPve9Xbeubbn13PXkfx3UFkkgjrcSTXL6N
         z3TcNY8UH0nJBTXuNn43yBosm+h2HJRPl8kETD7KKT4R77eMa3EJNpbRkV1E3cSwoi3L
         uDki1562UtkuE4IKTHyEmiK+2DA5d0oQiiIhoxWFYvA/JjyKR/9lE4gXE8lUE/4goiN0
         uFHsgGslkCH5l2pmn+oq79U+AZ7LH50Ib8lPlpFW4jrbkxQGVetkc8VulLTAkKrYlYMD
         sEA2njmRNdg2hePSu/cRJ12e02jrQtK1+70Bb0uZdI/1YoEauznrbux5/9y/pMdmfF+E
         mFiQ==
X-Gm-Message-State: AOJu0YwX0viE1SexaJgTmZJY31Z8svnTzCFmSrGQdx0Qunh06kL/u02v
        wt03SJ+DTwhv1slPha5Dxwg7ykGmmiN5RDHAk1pVSBtqeZ4=
X-Google-Smtp-Source: AGHT+IGqivqvVPmL2XcTnTwJLoejNk0zciTCT4/8v3XCyGNCMUUjSr5ckV85JSTcrMj2Ni2BG/gcK3jgMPkZk3Gl1eg=
X-Received: by 2002:a17:90b:3910:b0:280:c4be:3c8e with SMTP id
 ob16-20020a17090b391000b00280c4be3c8emr14931208pjb.48.1700140607921; Thu, 16
 Nov 2023 05:16:47 -0800 (PST)
MIME-Version: 1.0
References: <20231016220835.GH800259@ZenIV> <CAHC9VhTzEiKixwpKuit0CBq3S5F-CX3bT1raWdK8UPuN3xS-Bw@mail.gmail.com>
 <CAEjxPJ4FD4m7wEO+FcH+=LyH2inTZqxi1OT5FkUH485s+cqM2Q@mail.gmail.com>
 <CAHC9VhQQ-xbV-dVvTm26LaQ8F+0iW+Z0SMXdZ9MeDBJ7z2x4xg@mail.gmail.com> <CAEjxPJ5YiW62qQEfpEDfSrav_43J7SeYYbBqV8YPRdpqBizAQw@mail.gmail.com>
In-Reply-To: <CAEjxPJ5YiW62qQEfpEDfSrav_43J7SeYYbBqV8YPRdpqBizAQw@mail.gmail.com>
From:   Stephen Smalley <stephen.smalley.work@gmail.com>
Date:   Thu, 16 Nov 2023 08:16:36 -0500
Message-ID: <CAEjxPJ5rL9aYxZq8nbB-gBfmNUM_s6+h8Q7C2jYYyP5M9O6z3Q@mail.gmail.com>
Subject: Re: [PATCH][RFC] selinuxfs: saner handling of policy reloads
To:     Paul Moore <paul@paul-moore.com>
Cc:     Al Viro <viro@zeniv.linux.org.uk>,
        Christian Brauner <brauner@kernel.org>,
        selinux@vger.kernel.org, linux-fsdevel@vger.kernel.org,
        Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Wed, Nov 15, 2023 at 8:35=E2=80=AFAM Stephen Smalley
<stephen.smalley.work@gmail.com> wrote:
>
> On Tue, Nov 14, 2023 at 5:24=E2=80=AFPM Paul Moore <paul@paul-moore.com> =
wrote:
> >
> > On Tue, Nov 14, 2023 at 3:57=E2=80=AFPM Stephen Smalley
> > <stephen.smalley.work@gmail.com> wrote:
> > > On Mon, Nov 13, 2023 at 11:19=E2=80=AFAM Paul Moore <paul@paul-moore.=
com> wrote:
> > > > On Mon, Oct 16, 2023 at 6:08=E2=80=AFPM Al Viro <viro@zeniv.linux.o=
rg.uk> wrote:
> > > > >
> > > > > [
> > > > > That thing sits in viro/vfs.git#work.selinuxfs; I have
> > > > > lock_rename()-related followups in another branch, so a pull woul=
d be more
> > > > > convenient for me than cherry-pick.  NOTE: testing and comments w=
ould
> > > > > be very welcome - as it is, the patch is pretty much untested bey=
ond
> > > > > "it builds".
> > > > > ]
> > > >
> > > > Hi Al,
> > > >
> > > > I will admit to glossing over the comment above when I merged this
> > > > into the selinux/dev branch last night.  As it's been a few weeks, =
I'm
> > > > not sure if the comment above still applies, but if it does let me
> > > > know and I can yank/revert the patch in favor of a larger pull.  Le=
t
> > > > me know what you'd like to do.
> > >
> > > Seeing this during testsuite runs:
> > >
> > > [ 3550.206423] SELinux:  Converting 1152 SID table entries...
> > > [ 3550.666195] ------------[ cut here ]------------
> > > [ 3550.666201] WARNING: CPU: 3 PID: 12300 at fs/inode.c:330 drop_nlin=
k+0x57/0x70
> >
> > How are you running the test suite Stephen?  I haven't hit this in my
> > automated testing and I did another test run manually to make sure I
> > wasn't missing it and everything ran clean.
> >
> > I'm running the latest selinux-testsuite on a current Rawhide system
> > with kernel 6.7.0-0.rc1.20231114git9bacdd89.17.1.secnext.fc40 (current
> > Rawhide kernel + the LSM, SELinux, and audit dev trees).
>
> Technically this was with a kernel built from your dev branch plus
> Ondrej's selinux: introduce an initial SID for early boot processes
> patch, but I don't see how the latter could introduce such a bug. Will
> retry without it.

Reproduced without Ondrej's patch; the trick seems to be accessing
selinuxfs files during the testsuite run (likely interleaving with
policy reloads).
while true; do cat /sys/fs/selinux/initial_contexts/kernel ; done &
while running the testsuite seems to trigger.
Could also try while true; do sudo load_policy; done & in parallel
with the above loop.
In any event, will retry with Al's updated branch with the fix he proposed.
