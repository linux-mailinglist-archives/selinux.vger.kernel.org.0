Return-Path: <selinux+bounces-2225-lists+selinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CE7C9BF7C2
	for <lists+selinux@lfdr.de>; Wed,  6 Nov 2024 21:04:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6EB791C20E23
	for <lists+selinux@lfdr.de>; Wed,  6 Nov 2024 20:04:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0230D20ADD5;
	Wed,  6 Nov 2024 20:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cKzjgodp"
X-Original-To: selinux@vger.kernel.org
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7661C20A5FD
	for <selinux@vger.kernel.org>; Wed,  6 Nov 2024 20:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730923480; cv=none; b=tAdKGHemvqXiWLvp+cwN09ZR5SYKysiWZ4tuFJ4h9564XUGxuMYukVVrOnvQ0gyTNiIQ+XohE1ZRdWbuvagDATvvFM5D15f90cXAokyY5F3pEnRkAnvSr8oyBuBl3wtIZm48TlpjMBuymXkB8IvvqI78wKLsZrA68yY788PVQto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730923480; c=relaxed/simple;
	bh=BspyLJCBhVU7JzSbYxOkRAtXXmmgtvzeeZOPsAydFOk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BzqJ0pz+xnv4fB44q8r2P3mi3o8zGpHtbVtma7hcUlcFrgrG7DRAMxKwBtmAuGbyd+IPoIGk6os82ivFQF+AY+Ke/jD1OaK07qqQdHkD9s1gQDaQq8Z5uhTrbHtec1L7wf2KKwfe0D57mPSCrTJGjBq7rg59vns4fCVht87PjvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cKzjgodp; arc=none smtp.client-ip=209.85.161.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-5ebc52deca0so101613eaf.3
        for <selinux@vger.kernel.org>; Wed, 06 Nov 2024 12:04:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730923478; x=1731528278; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F5a/mRYarAyNizqexEtcY7oom9/3uy8abRnClmrUqOA=;
        b=cKzjgodpW5Tv6uMMSSOK04kNs0b2dV6nwMT6nmXvG7/eJrbKUbS3lccIMjuHOobr8m
         h2KpgpREuCepiMm/5irkqTsQTnXpSDoFLOTrWfiPCtAmN6hIpX80TWWKe7GO+JCi4nqs
         XEfckIOKue1RRpWgsAONV4YXmM0kJySNN/TmOi/lXMWgMZ7E634VsRRTNu2xhZjiQ/hF
         QvAdcIvKI/lqsDY76EU1iQwPy+xCwy3GqGvmlMcA7rvovA1TOTVry23FwyUGWPiAr91K
         vwq5oua9CBAT9afUJDj5PdRcrQT/fIxTx8BHGgRLkofFpwQNWmoIlPvl63Nd7eRz0RS6
         1tHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730923478; x=1731528278;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F5a/mRYarAyNizqexEtcY7oom9/3uy8abRnClmrUqOA=;
        b=KSHExDhlQg2Copm7P8oHM9OaaIAQCFXg0VyOqB8yvoaIJRsCDo+92FMTJuXcAqndiP
         Bbvag7zGlOjkYWRylMaVpnADIyswZAQLJgk5h5eaqmm88ySGU3UIBxjAagLkF7EdDagr
         q6+lWlURvuNiln1U7wSD9wQrLR2kl/Tt45vgRa6z9utNbBSpaX7Abx+l4i30mc47rx49
         mLFGwo4cUPyAuuGe/qpoo0vUeXquWIoLjKZQ3++zvXhtpJn4sdpaak+R2Zq8JgEb9VRZ
         lJvm3J8C/rs1GcZwH30MY5UhP2kSFqj/OzXeB4eeXtXeioskH2f7+/2SisfsaIO4Zkpf
         dHIg==
X-Gm-Message-State: AOJu0YwjEGDrhEL6R5WBKOl+JIDJj0i9eg9pjSWJ57dEmSE5ej99GVgr
	d6NOsqKFoj3Fg/8ouNls/eJgg+qu98Yzvh/IrEs0CYCytKXmSooOBDdangIAUr6tq0QmdCBRT7Y
	bXUfoj9uT3K6vNVVzeBecmAReMpw=
X-Google-Smtp-Source: AGHT+IFJio2mkPZwvfoFT4jnDkn2BdbkeWdrE9Ke13pL5dqH7cUIWb7iikkac7bmpwYHRMK630PHbsTFhcuQF089zcs=
X-Received: by 2002:a05:6358:5d8f:b0:1c3:7456:eb8 with SMTP id
 e5c5f4694b2df-1c5f9a138d5mr967296255d.19.1730923478496; Wed, 06 Nov 2024
 12:04:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: selinux@vger.kernel.org
List-Id: <selinux.vger.kernel.org>
List-Subscribe: <mailto:selinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:selinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241106104906.29847-1-cgoettsche@seltendoof.de>
In-Reply-To: <20241106104906.29847-1-cgoettsche@seltendoof.de>
From: James Carter <jwcart2@gmail.com>
Date: Wed, 6 Nov 2024 15:04:27 -0500
Message-ID: <CAP+JOzTeZMrweOyoRp785ScL+pwoWAhc4m4V9Rk6mN7m=jt5qw@mail.gmail.com>
Subject: Re: [PATCH] checkpolicy: avoid leak of identifier on required attribute
To: cgzones@googlemail.com
Cc: selinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 6, 2024 at 5:52=E2=80=AFAM Christian G=C3=B6ttsche
<cgoettsche@seltendoof.de> wrote:
>
> From: Christian G=C3=B6ttsche <cgzones@googlemail.com>
>
> Example policy generated by fuzzer:
>
>     class s
>     sid k
>     class s { i }
>     optional{
>       require{
>         attribute i;
>       }
>     }
>     type m;
>     typealias m alias i;
>
>     typeai
>
> Reported-by: oss-fuzz (issue 377576480)
> Signed-off-by: Christian G=C3=B6ttsche <cgzones@googlemail.com>

Acked-by: James Carter <jwcart2@gmail.com>

> ---
>  checkpolicy/policy_define.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/checkpolicy/policy_define.c b/checkpolicy/policy_define.c
> index 9aae8378..96414d46 100644
> --- a/checkpolicy/policy_define.c
> +++ b/checkpolicy/policy_define.c
> @@ -1322,6 +1322,7 @@ static int add_aliases_to_type(type_datum_t * type)
>                                 aliasdatum->primary =3D type->s.value;
>                                 aliasdatum->flavor =3D TYPE_ALIAS;
>
> +                               free(id);
>                                 break;
>                         }
>                 default:{
> --
> 2.45.2
>
>

