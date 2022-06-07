Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D2033542375
	for <lists+selinux@lfdr.de>; Wed,  8 Jun 2022 08:51:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242959AbiFHAm6 (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Tue, 7 Jun 2022 20:42:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1574249AbiFGXZU (ORCPT
        <rfc822;selinux@vger.kernel.org>); Tue, 7 Jun 2022 19:25:20 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B7EC18CA87
        for <selinux@vger.kernel.org>; Tue,  7 Jun 2022 14:35:18 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id l2-20020a05600c1d0200b0039c35ef94c4so8152278wms.4
        for <selinux@vger.kernel.org>; Tue, 07 Jun 2022 14:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=idUSaa8gwuIihbYaNise3w2YYlg1vymPz92K2rveSzI=;
        b=wY3H2AQEuie1/H+ZQCrqw2Ym3cijoyGcBYEMvPGe9A5rikiCwOacYWiEdL3NyP2w2Z
         eo04kdxyDvMIkeOR8ujpECEK+FXPvIxUMUxtKiUtBXfofJPtpFLoJ4GQBvP5bdRV6ldz
         0XH1WzwMyYxol5CWC5TZWoNr2ATnRQGkvcEd67Edp2p18nOBHXNf6yjZs+Z3OiCLPevD
         L7NiIsh2CW/Ic9meQ5kHtpnf29EwRNoD37iX3W4eMu2QmBkJ1tv5gtPh/ilPDuk5p8WY
         yiLsWJNV7zvgdxEZWcei+KFmjz3ac/StH0E7gjzcUS0y/83flr16hMuMDLYCT8OMcRIu
         qEEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=idUSaa8gwuIihbYaNise3w2YYlg1vymPz92K2rveSzI=;
        b=OhIvrHdVeRWntv81QV2C0gicv6GqIUJQtM6fgK1wE3ELqq99Xk3Elczbe+D3Z5a2Ma
         SdCOf9jV0AcYGR+t7iHn80PyYD+Zlj13eJUtSBZwVPx4Rb2JysBUJswOj8HNFELppLAE
         2PbVkHy+Xp0DRFdzdSiDc5PmoKFNF3yYJb6Y8uPwlM1t/TbOkS1PB9ZP4tfj/qVsLshK
         fKYaPxZXcQqGayrygy1xnGAwyww8U+RFf9bX1awcjwWT2otGfUNfXBDEQh3rnnCNbNId
         BZItj9R8lWVmEKGSARZ4Ore/x34e2oxBNeSZQpqcsnMeDFzOssul3DU6QF5hmLB9v6P9
         BRug==
X-Gm-Message-State: AOAM532mRnH4QCg+Uc3Pz10x/VwK3SXJDrmwYctygLupdaZfj1GCo7UD
        8PeHTgXCjO/WVkmgwLTCuDt0HdOVzQq9X5MZrCFB
X-Google-Smtp-Source: ABdhPJzzLkpNybysE8NlMkiaHbeXlwUKDCOTZfOlVYt3X5t6eWLvpTTJqqVFNh7+BVmCLhqfAO1qp23jQiYri0wULZ4=
X-Received: by 2002:a05:600c:4e16:b0:397:6d34:76a4 with SMTP id
 b22-20020a05600c4e1600b003976d3476a4mr31706600wmq.0.1654637716853; Tue, 07
 Jun 2022 14:35:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220217142133.72205-1-cgzones@googlemail.com>
 <20220217142133.72205-4-cgzones@googlemail.com> <CAHC9VhRatc13ZsBSsjZeGtBfz0ouUGL9n0LTjbQtuZtYv2M43w@mail.gmail.com>
 <CAKwvOdkpA-P5763rt39q4HRjOdqC2Ca_Wu4suHU-qxpz3FkO8Q@mail.gmail.com>
In-Reply-To: <CAKwvOdkpA-P5763rt39q4HRjOdqC2Ca_Wu4suHU-qxpz3FkO8Q@mail.gmail.com>
From:   Paul Moore <paul@paul-moore.com>
Date:   Tue, 7 Jun 2022 17:35:05 -0400
Message-ID: <CAHC9VhQ=tDdbTeugwiZtWkZxupDkdt7QBDr8a4txtSg0D+Q46w@mail.gmail.com>
Subject: Re: [PATCH 5/5] selinux: drop unnecessary NULL check
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     =?UTF-8?Q?Christian_G=C3=B6ttsche?= <cgzones@googlemail.com>,
        selinux@vger.kernel.org,
        Stephen Smalley <stephen.smalley.work@gmail.com>,
        Eric Paris <eparis@parisplace.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Ondrej Mosnacek <omosnace@redhat.com>,
        Serge Hallyn <serge@hallyn.com>,
        Austin Kim <austin.kim@lge.com>,
        Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
        Casey Schaufler <casey@schaufler-ca.com>,
        Yang Li <yang.lee@linux.alibaba.com>,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Tue, Jun 7, 2022 at 5:26 PM Nick Desaulniers <ndesaulniers@google.com> w=
rote:
>
> On Tue, Jun 7, 2022 at 2:22 PM Paul Moore <paul@paul-moore.com> wrote:
> >
> > On Thu, Feb 17, 2022 at 9:22 AM Christian G=C3=B6ttsche
> > <cgzones@googlemail.com> wrote:
> > >
> > > Commit e3489f8974e1 ("selinux: kill selinux_sb_get_mnt_opts()")
> > > introduced a NULL check on the context after a successful call to
> > > security_sid_to_context().  This is on the one hand redundant after
> > > checking for success and on the other hand insufficient on an actual
> > > NULL pointer, since the context is passed to seq_escape() leading to =
a
> > > call of strlen() on it.
> > >
> > > Reported by Clang analyzer:
> > >
> > >     In file included from security/selinux/hooks.c:28:
> > >     In file included from ./include/linux/tracehook.h:50:
> > >     In file included from ./include/linux/memcontrol.h:13:
> > >     In file included from ./include/linux/cgroup.h:18:
> > >     ./include/linux/seq_file.h:136:25: warning: Null pointer passed a=
s 1st argument to string length function [unix.cstring.NullArg]
> > >             seq_escape_mem(m, src, strlen(src), flags, esc);
> > >                                    ^~~~~~~~~~~
> > >
> > > Signed-off-by: Christian G=C3=B6ttsche <cgzones@googlemail.com>
> > > ---
> > >  security/selinux/hooks.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > I was waiting for Nick to reply, but he never did, and this looks good
> > to me so I just merged it into selinux/next.  Thanks for your patience
> > Christian.
>
> LGTM; you can ping me on irc #ndesaulniers on most kernel channels if
> you're waiting on me. ;)

Thanks, but I generally don't have the spare cycles to keep track of
everyone's prefered method of interaction, that's why we've got the
mailing list (warts and all) :)

For what it's worth, I was waiting on you because you asked about the
additional trace info and without any context I thought you might be
looking for something else (?).  In the end, I think everyone agreed
that the patch was good so I merged it.  I think as a general rule
it's a good practice to follow-up with a reply when people provide
additional information that you've requested.  Not only is it the
polite thing to do, it helps clarify things with everyone else that
there is no hidden "gotcha!" in the patch.

Regardless, thanks for checking back on this :)

--=20
paul-moore.com
