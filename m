Return-Path: <selinux+bounces-2188-lists+selinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 350D19B96E9
	for <lists+selinux@lfdr.de>; Fri,  1 Nov 2024 18:55:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 674091C21D77
	for <lists+selinux@lfdr.de>; Fri,  1 Nov 2024 17:55:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3E7B1CDFC6;
	Fri,  1 Nov 2024 17:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="Bxfcj5jq"
X-Original-To: selinux@vger.kernel.org
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 024FF1CC8AF
	for <selinux@vger.kernel.org>; Fri,  1 Nov 2024 17:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730483696; cv=none; b=CiQr92zs9AIS0Bj5S3OlndweSNi+AtPqTMcfwpOcOAR+F2EGJCea6E4awbO/EWgkerwj4UPNo2cbwAr3d/Q9h6fe0D4MDG56nD0regU8CxRLd8btdqfFuBf0JT4x0gBxEv7IPm59o40+PQg2HSUG64Wt/wih73gzfDEZEcmyEiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730483696; c=relaxed/simple;
	bh=XuRVQd+uI/fEZIMs+isDw/LGu3FojnLyngs9SvWfAbQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=koVXulAguOeiIH6XiNOWjApWYB3/IL8RBd04W3cIEcsgzq83/75lg0ZT4+fislcZ/FXO9Hppc+JDtHLfIOHdLbzC1VYEX77ZUMpBQ8HLTl0GaXVp5cY6yiOBDY+DSIx2sk+BmlT5iLX3/yh/Pvl2vqpwP2v2bWfLjqaKoEg90T4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=Bxfcj5jq; arc=none smtp.client-ip=209.85.222.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-84ff43e87cbso640298241.1
        for <selinux@vger.kernel.org>; Fri, 01 Nov 2024 10:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1730483694; x=1731088494; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XuRVQd+uI/fEZIMs+isDw/LGu3FojnLyngs9SvWfAbQ=;
        b=Bxfcj5jqjhoXFeGMFLaVHza5iJgkjyIuJaeZS4e6KR8kIIJC5+IYXTH4u8gRR/xsPr
         bPIs7J3sDjrN2CqtoE0p8/nK6rLg84aZh1ADRhyY+RjMy07HNuflxG1aYvZIG+drH7Ui
         iNKwDWcxUQvc+jQatdYyP71a0pTtkKIh/6j+YCT3j8tWj2xxLvCLVVlCK1FWqTAkux9/
         Nmf+ch0FHo6+/2YxyztE2FRE0tII2Hr1Qge3KspYaLT363R/QbjmlunQbAHnMQsdLsQp
         DB9lE6KAMrT0OY/8Z4OUkJnMb1ETupOVag2lZxORLPGu6NG3xOIX+uGIqrUhK3WWSBy3
         Ju2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730483694; x=1731088494;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XuRVQd+uI/fEZIMs+isDw/LGu3FojnLyngs9SvWfAbQ=;
        b=KpQgFutQkUr2cnO5vMW1rL4fqJPDMo/Ijb318VaII+vH1pETi/tv+A4i+e7w4kcP6B
         hCTq3bOe9fnDRmSamW3gr0NByNNWptvDuVb4/CLZBrPLcW64TFsnXU4oeDXTV7/rlj39
         M25+44PeU0c5aePIOEsu6eO9s4hFx/F2ajkdjRKV4NuGKrgnOThOfPJCiIbKNrIWgx8C
         YReKHrLhQyt3hFvTdAjnOPR7GZtpWGUBx+KqBqt+qNrur1ptWBmPM7y7ouRgzH/31N0F
         YOVBzVRbIDypa9x61x/EeUBH2h5+HbjndivwzE5z3Vl2ArGWF/kVGwsT0fm/phOo5pbG
         xs6g==
X-Forwarded-Encrypted: i=1; AJvYcCUXo24dpo8xnWBQHQXQ4Apt2lWfyi+YHRORvSIcLWWaveUtv13Jjb2vBd9NIrYbZ7pmWR598qwm@vger.kernel.org
X-Gm-Message-State: AOJu0YxcPjp2t6JqlFCs/aPsdqkf7INcaDSwvg26g6Z5M7BVVmUnGCG1
	AdrzdawnOyZzuZFOSc6Fr/3b1FxXa5EhF+EulCOWrrcCZu0enWYK+Jr2tO+wt2nYHmYfrunB9cS
	1VwMm2fZiZl6ldeD0s9rIggfUAeLVA+iUOq+e
X-Google-Smtp-Source: AGHT+IGsE4qjrOhlqC4OJb9cUFtYG/Io0uUOjSSRLwaJ/zVTvuHnCYeP5oQx993rVYYkkRD54yed9fa034djjSzDRQ4=
X-Received: by 2002:a05:6102:41a1:b0:4a3:ac2b:bfff with SMTP id
 ada2fe7eead31-4a962ef5a46mr4954235137.22.1730483693833; Fri, 01 Nov 2024
 10:54:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: selinux@vger.kernel.org
List-Id: <selinux.vger.kernel.org>
List-Subscribe: <mailto:selinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:selinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241023212158.18718-3-casey@schaufler-ca.com>
 <68a956fa44249434dedf7d13cd949b35@paul-moore.com> <ZyQPfFvPD72rx4ME@calendula>
 <ZyQRgL_jWdvKgRl-@calendula> <dd727620-9823-4701-aaf1-080b03fb6ccd@schaufler-ca.com>
 <ZySCeoe3kVqKTyUh@calendula> <6a405591-40c5-4db6-bed5-8133a80b55f7@schaufler-ca.com>
 <CAHC9VhRZg5ODurJrXWbZ+DaAdEGVJYn9MhNi+bV0f4Di12P5xA@mail.gmail.com>
 <CAHC9VhQ+ig=GY1CeVGj1OrsyZtMAMBwst03b-oZ+eC2mLnqjNg@mail.gmail.com> <6fd788a9-b051-4c5e-8618-362a8632cb97@schaufler-ca.com>
In-Reply-To: <6fd788a9-b051-4c5e-8618-362a8632cb97@schaufler-ca.com>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 1 Nov 2024 13:54:42 -0400
Message-ID: <CAHC9VhQA0L-H-9BPhXCFKMpgs4_Xk+fOip7L7s98wRK-UhS43A@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] LSM: Replace context+len with lsm_context
To: Casey Schaufler <casey@schaufler-ca.com>
Cc: Pablo Neira Ayuso <pablo@netfilter.org>, linux-security-module@vger.kernel.org, 
	jmorris@namei.org, serge@hallyn.com, keescook@chromium.org, 
	john.johansen@canonical.com, penguin-kernel@i-love.sakura.ne.jp, 
	stephen.smalley.work@gmail.com, linux-kernel@vger.kernel.org, 
	selinux@vger.kernel.org, mic@digikod.net, netdev@vger.kernel.org, 
	audit@vger.kernel.org, netfilter-devel@vger.kernel.org, 
	Todd Kjos <tkjos@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 1, 2024 at 12:59=E2=80=AFPM Casey Schaufler <casey@schaufler-ca=
.com> wrote:
> On 11/1/2024 9:42 AM, Paul Moore wrote:
> > On Fri, Nov 1, 2024 at 12:35=E2=80=AFPM Paul Moore <paul@paul-moore.com=
> wrote:
> >> On Fri, Nov 1, 2024 at 12:14=E2=80=AFPM Casey Schaufler <casey@schaufl=
er-ca.com> wrote:
> >>> On 11/1/2024 12:25 AM, Pablo Neira Ayuso wrote:
> >>>> On Thu, Oct 31, 2024 at 04:58:13PM -0700, Casey Schaufler wrote:
> >>>>> On 10/31/2024 4:23 PM, Pablo Neira Ayuso wrote:
> >>>>>> On Fri, Nov 01, 2024 at 12:15:16AM +0100, Pablo Neira Ayuso wrote:
> >>>>>>> Hi Paul,
> >>>>>>>
> >>>>>>> This patch breaks nf_conntrack_netlink, Casey mentioned that he w=
ill
> >>>>>>> post another series.
> >>>>> I have a fix, it is pretty simple. How about I send a 6/5 patch for=
 it?
> >>>> No idea. I don't know what is the status of this series. I would
> >>>> suggest to repost a new series.
> >>> I will post v4 shortly. Thanks for the feedback.
> >> Please just post a fix against v2 using lsm/dev as a base.
> > That should have been "against *v3* using lsm/dev as a base".
> >
> > Also, since I didn't explicitly mention it, if I don't see a fix by
> > dinner time tonight (US East Coast), I'll revert this patchset, but
> > I'd like to avoid that if possible.
>
> I will have this as quickly as I can. The patch is easy, but the overhead
> may slow it down a bit. I should have it in time to avoid the revert.

It turns out there is no rush on this as it looks like the Rust
bindings are going to be the one that ends up pushing this out past
the next merge window as there is a conflict with changes to the Rust
LSM helpers in the VFS tree.

We still obviously need to the fix, so please keep going with the fix
based against v3; I'm going to move the v3 patchset from lsm/dev to
lsm/dev-staging, this will still allow for the usual LSM testing but
will shield it from linux-next.

--=20
paul-moore.com

