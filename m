Return-Path: <selinux+bounces-2356-lists+selinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C378A9D197D
	for <lists+selinux@lfdr.de>; Mon, 18 Nov 2024 21:14:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5C928B212B6
	for <lists+selinux@lfdr.de>; Mon, 18 Nov 2024 20:14:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C9A21E501C;
	Mon, 18 Nov 2024 20:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GaZsRdBh"
X-Original-To: selinux@vger.kernel.org
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED29F1E5015
	for <selinux@vger.kernel.org>; Mon, 18 Nov 2024 20:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731960861; cv=none; b=oD48D4IesWewZNr04nzmbiPNxeeeAPqyKSdKO1KVPUMt1mWw0vLBEaoVTy7CQMn9Ei9M6VEFEMQttt1aMYw+cBt8qi7WXrRMA6JQJJaqmo4zwcZPczxJvAF4olFrrG41q75wq2HESM3WB8JrrbxRYD9v2RPxs9xKsCii26WM5y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731960861; c=relaxed/simple;
	bh=ZXG5Zm76IIoapEiCm49pzCqY8d88JmUu+FGya4o2+D8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tdgSFYHXP97kDDESJTmMFy1pZoyoypYe5VtJYOGeEsMFuc9LUWqojxMPAob6U2sdeJv2kQ6zKGrc1A8lfD5JukFQTCeP+ztkuvoIfcXPtgMveyM1Pj5SvJ65qQ9jKVAGpc75ljfqpI1WNlAKkRqEXwKzkorjk9rpFK5fTttNd6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GaZsRdBh; arc=none smtp.client-ip=209.85.161.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-5ebc04d495aso60074eaf.2
        for <selinux@vger.kernel.org>; Mon, 18 Nov 2024 12:14:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731960859; x=1732565659; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=64/C5fPRfdSaiziO/nVkBXHjWt9JCqJFc1pGP5pm/gM=;
        b=GaZsRdBhs93t4V0y1z1QfOUsPLUc3u1cIHIBKIxm5LYFDoUkkB5LnZz2Zj6IAydCax
         md/57DVU9g/xEDjby/X2DZ4NrEjY/rmuRAye9/ozdcQTPK7eNIGct/9QdBEFW017PTcX
         X613DfMZkta8KMbDLZLD/LbAIBUD4OglfmxTHRlA+AfYBvcgcDKMVZJ1ZIXDgmIN4gGz
         2mcC5uGC91Lg3ln3NM6aHoS99jf/Anjwjwjynp6xpV6gTpfLmIoPxR5kQpWa1AIlnuDZ
         mLGyoydXDmi/Nc0hIOmYBLtOBCn64jMFcGtMrD9+hmSCfBq44v/54KgT3IhWgRM79eaz
         BWSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731960859; x=1732565659;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=64/C5fPRfdSaiziO/nVkBXHjWt9JCqJFc1pGP5pm/gM=;
        b=ammMAT+pXwE8I4LoC2i560ufjamHg+4YhG9a5l7FRuWWlLxjPsA0POBFYzfnhC0R11
         fJK18xAjYuoOs3/yGZhbIW702nDvueluH6plFloSDTprkdkGyXdNL0dg4Lydj69SYX81
         35yeJ8o7Br1gaaa6c5Do8UBHfnesoiUXyr2qjCDYnWpLn8ASxlIgDkzDARFUSQwzM27u
         giWOhgc9SZvXCxE6B+K/PiuKebbUoy23nx98LzCH+hD93l6FoegvMfY09FCYEk7IecOE
         nr9eHW+4sDF5dVNeBjU9KDIsHbsEU6WQ5/OmQ+1izQm78kS+3gzzMVySvDrEuJnOqCsa
         yF4g==
X-Gm-Message-State: AOJu0YxLPHKAWY6P4NYMmH+S4laD3oNtZaJ9zu0hCBEppbF7Uc5AvkYr
	VS6BSXRVVBtlyFR4KBftMgC4cUFQ9J8R4w0wEyUuXwOl/r7DeGc+HXz0iHJWxh77XzQ5OIVl7XO
	Y/6N6ej+TwfalQ/EL6lSg0e6csf4=
X-Google-Smtp-Source: AGHT+IFimHpIwYuPqbvT4AMGwfap63p1BBsI/Zzwf0A/drbU7OZ+qbs/vNLhElolUekFbxeywy9vxRjangN15swrRCM=
X-Received: by 2002:a05:6830:6b09:b0:718:9ac7:27c4 with SMTP id
 46e09a7af769-71a7794ff15mr12648540a34.5.1731960858977; Mon, 18 Nov 2024
 12:14:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: selinux@vger.kernel.org
List-Id: <selinux.vger.kernel.org>
List-Subscribe: <mailto:selinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:selinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241106104906.29847-1-cgoettsche@seltendoof.de> <CAP+JOzTeZMrweOyoRp785ScL+pwoWAhc4m4V9Rk6mN7m=jt5qw@mail.gmail.com>
In-Reply-To: <CAP+JOzTeZMrweOyoRp785ScL+pwoWAhc4m4V9Rk6mN7m=jt5qw@mail.gmail.com>
From: James Carter <jwcart2@gmail.com>
Date: Mon, 18 Nov 2024 15:14:08 -0500
Message-ID: <CAP+JOzRczwW6xX+EcNP0Ho1m1nn6y3niC7RP_4QJ9RTCQY4P0Q@mail.gmail.com>
Subject: Re: [PATCH] checkpolicy: avoid leak of identifier on required attribute
To: cgzones@googlemail.com
Cc: selinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 6, 2024 at 3:04=E2=80=AFPM James Carter <jwcart2@gmail.com> wro=
te:
>
> On Wed, Nov 6, 2024 at 5:52=E2=80=AFAM Christian G=C3=B6ttsche
> <cgoettsche@seltendoof.de> wrote:
> >
> > From: Christian G=C3=B6ttsche <cgzones@googlemail.com>
> >
> > Example policy generated by fuzzer:
> >
> >     class s
> >     sid k
> >     class s { i }
> >     optional{
> >       require{
> >         attribute i;
> >       }
> >     }
> >     type m;
> >     typealias m alias i;
> >
> >     typeai
> >
> > Reported-by: oss-fuzz (issue 377576480)
> > Signed-off-by: Christian G=C3=B6ttsche <cgzones@googlemail.com>
>
> Acked-by: James Carter <jwcart2@gmail.com>
>

Merged.
Thanks,
Jim

> > ---
> >  checkpolicy/policy_define.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/checkpolicy/policy_define.c b/checkpolicy/policy_define.c
> > index 9aae8378..96414d46 100644
> > --- a/checkpolicy/policy_define.c
> > +++ b/checkpolicy/policy_define.c
> > @@ -1322,6 +1322,7 @@ static int add_aliases_to_type(type_datum_t * typ=
e)
> >                                 aliasdatum->primary =3D type->s.value;
> >                                 aliasdatum->flavor =3D TYPE_ALIAS;
> >
> > +                               free(id);
> >                                 break;
> >                         }
> >                 default:{
> > --
> > 2.45.2
> >
> >

