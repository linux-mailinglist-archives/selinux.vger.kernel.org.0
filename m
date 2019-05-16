Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1FF3B1FCFC
	for <lists+selinux@lfdr.de>; Thu, 16 May 2019 03:46:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726799AbfEPBqe (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Wed, 15 May 2019 21:46:34 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:40920 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726801AbfEPAgf (ORCPT
        <rfc822;selinux@vger.kernel.org>); Wed, 15 May 2019 20:36:35 -0400
Received: by mail-ot1-f65.google.com with SMTP id u11so1804662otq.7
        for <selinux@vger.kernel.org>; Wed, 15 May 2019 17:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Q1NjYHBDzc2QqEA5t/PslK3T2CgRDPI0f5WRFGvbHiA=;
        b=SRdUTajQxMhuXHz655ck2GAkM+7Bm2fVZLJX40E0i0GZUfIXSHWINUI8lUMb9czk15
         5ZtrvWiXoHuIG3DLmQ7og0xz0mrvHa7tmiJWLRvnHi1Ig8OBW67e7CJlrRzZjr41J+uS
         n9CjzFWT7m+lqnbzFYTbp0mpcJyhyS6eiQT0dp8Uaj+YuIerUY7yERcNBkEcQg1AqRAm
         EmsJ2g2dIlo9pUX3Qoh4jc0u2UfmrpxvxTFt/e041qhat/z4p4KGscG5ksHQJDwJ+FMm
         GaV+o966h6uyKhyxxp9lg+bj6MgvajRwg6HGLQM4BZsreWoxKKhgziSaY11X1XgR51FJ
         Z5zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Q1NjYHBDzc2QqEA5t/PslK3T2CgRDPI0f5WRFGvbHiA=;
        b=VoQ6aEN4lheXLnCbUQR9/8xeFIw3eE//VB0EyTxF06NoWDU2bzahGZKcwZAqWrEtA1
         CJBMB1AFGWIiv0KHMdwUmmDhgOlp+cfrI1UxDHVvePatIUWYiM+9pIQYOIJK5unfg3Zo
         nOMjdMJF3+DdH2ilvsaAUYrg1lEPIOLfT4fX9F91tiYp/nfwrSXdaCqlcUEvWfxRnki9
         BU7iiFDZwkNNFK8+Y1BAUQHhLDVyFqtuhEHDzBzCCVikRCTLcKxGZwK0ZMtpOruiL5Z6
         xAoeI5+Qd8mOGF/j//jiDr5NesMlCWjjzmDJmDgpkrELrT6hRb4pF7J2I+dckd+c9G7k
         bwuA==
X-Gm-Message-State: APjAAAVgT827r9jnxwvj0HPwD62Pu4UkIM1DuGcSfDcItk/8klTfprjR
        M49+0J7RRlEB3KLaMWz71p417Iu0qE0SVYNLd0U=
X-Google-Smtp-Source: APXvYqxkbtWLmtrQ8VlKrFsnqkAzl192d/3ae5w5VGIgHTSESnULDOJztwzutEW2D8Q+tTFqGIcYi5LxTfQokXh/MOA=
X-Received: by 2002:a9d:470d:: with SMTP id a13mr9080584otf.162.1557966994870;
 Wed, 15 May 2019 17:36:34 -0700 (PDT)
MIME-Version: 1.0
References: <alpine.LFD.2.21.1905102118010.16225@34-41-5D-CA-59-C7> <CAFftDdrJKk9p-Watf2M7ptMo=1L0TiEKci=LitfjqsNmkyTUMQ@mail.gmail.com>
In-Reply-To: <CAFftDdrJKk9p-Watf2M7ptMo=1L0TiEKci=LitfjqsNmkyTUMQ@mail.gmail.com>
From:   William Roberts <bill.c.roberts@gmail.com>
Date:   Wed, 15 May 2019 17:36:22 -0700
Message-ID: <CAFftDdpU81Kp-tF6C3tqMCZUXpXZ7nf0RQePz-THXGbRHC1x8w@mail.gmail.com>
Subject: Re: [PATCH] Check strdup() failure
To:     =?UTF-8?B?Sm9ra2UgSMOkbcOkbMOkaW5lbg==?= 
        <jokke.hamalainen@kolttonen.fi>
Cc:     selinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

merged: https://github.com/SELinuxProject/selinux/pull/149

On Fri, May 10, 2019 at 2:00 PM William Roberts
<bill.c.roberts@gmail.com> wrote:
>
> On Fri, May 10, 2019 at 12:04 PM Jokke H=C3=A4m=C3=A4l=C3=A4inen
> <jokke.hamalainen@kolttonen.fi> wrote:
> >
> >
> >
> > ---
> >  libselinux/utils/getconlist.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/libselinux/utils/getconlist.c b/libselinux/utils/getconlis=
t.c
> > index 5ac0ca85..29c16640 100644
> > --- a/libselinux/utils/getconlist.c
> > +++ b/libselinux/utils/getconlist.c
> > @@ -27,6 +27,11 @@ int main(int argc, char **argv)
> >                 switch (opt) {
> >                 case 'l':
> >                         level =3D strdup(optarg);
> > +                       if (!level) {
> > +                               fprintf(stderr, "memory allocation fail=
ure: %d(%s)\n",
> > +                                       errno, strerror(errno));
> > +                               return 3;
> > +                       }
> >                         break;
> >                 default:
> >                         usage(argv[0], "invalid option", 1);
> > --
> > 2.21.0
> >
>
> ack
