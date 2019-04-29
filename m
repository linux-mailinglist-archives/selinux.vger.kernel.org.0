Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7D284E426
	for <lists+selinux@lfdr.de>; Mon, 29 Apr 2019 16:02:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728180AbfD2OCr (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Mon, 29 Apr 2019 10:02:47 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:36100 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725838AbfD2OCn (ORCPT
        <rfc822;selinux@vger.kernel.org>); Mon, 29 Apr 2019 10:02:43 -0400
Received: by mail-lf1-f67.google.com with SMTP id u17so8106242lfi.3
        for <selinux@vger.kernel.org>; Mon, 29 Apr 2019 07:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bGDd3M5I9ULSFWcqsW7JVAiNO7lUjJpBWTqExJJmQuk=;
        b=ECFfMtmc8h1r9ocvANqnrNpKDR9ewLLy/PT7ArGnVtQoLWQPYkoUEemlb1Z+PqCE4R
         FMzbe0pSt669vtS3m+z9DOcUfGQTdS2ecV3apKViPIouPj2sc/1NwRmXxxLWYRugi6nV
         /6yEN48+NXFkr8RN/7qSMW/cQOeltYvYKMMP9zfnWMVVRiuSCSveIRf7Q72G9fE1N0Tn
         ZU4N/V1X60vlJxamkwfKI875ilqJrfzp17nF7d70yF6qcToK699DJs8R4CYOvmAruDFa
         C/WdUWFwFPdhY6+NnLDTEqbe8NLTYrpfoijS6fx1BBCysC9JCE4rmnv8rVFeQrEKFwTr
         79Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bGDd3M5I9ULSFWcqsW7JVAiNO7lUjJpBWTqExJJmQuk=;
        b=hYL1c9RBdTMEhgr3ThN7p0HJG7tL9jsEuS59oNq9+LECnYCrYl4RHo3d8qyIRTIxJy
         vcv+2+sNwUJLoP3hL+KnPNzUbGg5Jl4MhhXWNStlKSiXlS6PXkW3VBrwxbXSTtFfmot9
         WKqkwIp1WN/RoWn8iKf7ByucgXJeCPfBCPerjuUAg1SuEQDs1Q43iUB7HILSg3iUuyWg
         vVF0Z9xlCeNsdcZHfv2YFFGTAAA0oSpRomts3n+rvAgSuxPjPTKJW1yOam7jLiBaAYeY
         NZ4Vb32dl/DLcb1Yhr285Rj12zNDFc9dHE0GfKyBrFGrah0PlN+y2tH4B4vKLSR7ta0s
         EeNg==
X-Gm-Message-State: APjAAAXs5Hm3W6fLRT66biN6I3Hu3ZWlRLeQEkeV9adsCJx+OHtK9/ns
        i4VIBACPELrEyedJYP4lrj5wQK+9AfQW8mAadzsC
X-Google-Smtp-Source: APXvYqxCtmNkHwaubiOFJGa7EJ1Nzkj4OMW/7uaT6yuPfUWq5YIZBobbcG2U4+8vYTNgq9g9iHQTaeUaLUv3GnnBuws=
X-Received: by 2002:a19:6b0d:: with SMTP id d13mr32177675lfa.79.1556546560923;
 Mon, 29 Apr 2019 07:02:40 -0700 (PDT)
MIME-Version: 1.0
References: <20190422210041.GA21711@archlinux-i9> <CAHC9VhTtz3OA3EchaZaAeg=DxoGoz_WFdj+Mi9nd9i+cmjmuJA@mail.gmail.com>
 <20190423132926.GK17719@sasha-vm> <CAHC9VhRcdY7G_ES2VqNVpkoU=CRJkJySb3m1sFdgKJwh3JQ2oA@mail.gmail.com>
 <20190429124002.GB31371@kroah.com>
In-Reply-To: <20190429124002.GB31371@kroah.com>
From:   Paul Moore <paul@paul-moore.com>
Date:   Mon, 29 Apr 2019 10:02:29 -0400
Message-ID: <CAHC9VhQxrtYJTOj=aOL4FY=myA4ZO-rcY7TdCeFbjVnCmgOxew@mail.gmail.com>
Subject: Re: scripts/selinux build error in 4.14 after glibc update
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Sasha Levin <sashal@kernel.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Stephen Smalley <sds@tycho.nsa.gov>,
        Eric Paris <eparis@parisplace.org>, selinux@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        Nicolas Iooss <nicolas.iooss@m4x.org>
Content-Type: text/plain; charset="UTF-8"
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Mon, Apr 29, 2019 at 8:40 AM Greg KH <gregkh@linuxfoundation.org> wrote:
> On Tue, Apr 23, 2019 at 09:43:09AM -0400, Paul Moore wrote:
> > On Tue, Apr 23, 2019 at 9:29 AM Sasha Levin <sashal@kernel.org> wrote:
> > > On Mon, Apr 22, 2019 at 09:59:47PM -0400, Paul Moore wrote:
> > > >On Mon, Apr 22, 2019 at 5:00 PM Nathan Chancellor
> > > ><natechancellor@gmail.com> wrote:
> > > >> Hi all,
> > > >>
> > > >> After a glibc update to 2.29, my 4.14 builds started failing like so:
> > > >
> > > >...
> > > >
> > > >>   HOSTCC  scripts/selinux/genheaders/genheaders
> > > >> In file included from scripts/selinux/genheaders/genheaders.c:19:
> > > >> ./security/selinux/include/classmap.h:245:2: error: #error New address family defined, please update secclass_map.
> > > >>  #error New address family defined, please update secclass_map.
> > > >>   ^~~~~
> > > >
> > > >This is a known problem that has a fix in the selinux/next branch and
> > > >will be going up to Linus during the next merge window.  The fix is
> > > >quite small and should be relatively easy for you to backport to your
> > > >kernel build if you are interested; the patch can be found at the
> > > >archive link below:
> > > >
> > > >https://lore.kernel.org/selinux/20190225005528.28371-1-paulo@paulo.ac
> > >
> > > Why is it waiting for the next merge window? It fixes a build bug that
> > > people hit.
> >
> > I place a reasonably high bar on patches that I send up to Linus
> > outside of the merge window and I didn't feel this patch met that
> > criteria.  Nathan is only the second person I've seen who has
> > encountered this problem, the first being the original patch author.
> > As far as I've seen, the problem is only seen by users building older
> > kernels on very new userspaces (e.g. glibc v2.29 was released in
> > February 2019, Linux v4.14 was released in 2017); this doesn't appear
> > to be a large group of people and I didn't want to risk breaking the
> > main kernel tree during the -rcX phase for such a small group.
>
> Ugh, this breaks my local builds, I would recommend getting it to Linus
> sooner please.

Well, we are at -rc7 right now and it looks like an -rc8 is unlikely
so the question really comes down to can/do you want to wait a week?

-- 
paul moore
www.paul-moore.com
