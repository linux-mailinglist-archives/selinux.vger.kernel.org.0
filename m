Return-Path: <selinux+bounces-602-lists+selinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F966851F67
	for <lists+selinux@lfdr.de>; Mon, 12 Feb 2024 22:18:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A233E1C22513
	for <lists+selinux@lfdr.de>; Mon, 12 Feb 2024 21:18:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3233D4DA16;
	Mon, 12 Feb 2024 21:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="aXaB4ioj"
X-Original-To: selinux@vger.kernel.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ECEC4DA05
	for <selinux@vger.kernel.org>; Mon, 12 Feb 2024 21:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707772633; cv=none; b=fgKkS5NwQTNawIQXNgY1V/ITNcPIUp2scKDTN8/eXO0hUuHlZAkui3OFznvMKfncQP1j5NoFwiREXxbtq/UIo0PdETYpinhlqWqivj04oUgSq+FJV8MXfo/2uG/d2SDLHAchEcI6lB/o6w881kwM0QiF5JtSa6Iwy5j/UxQbIqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707772633; c=relaxed/simple;
	bh=sKyYv3h5LS/Xc+JkhqC/7H32Ejapjycaf0b1D5xsxdY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kxp71QszmfWYlGneJMsc4cJBEeYdiWIveRswJvETjIUUm45T2ER9sy7xA2r6wv1+BYgsDQefCow7P2ABaDRvh2GcH3AmDygHq6ltEMzK3RWgRYxGaC6zzMDFSyjogkXIQ7iEVuZYCUtOa6oYkYIQR8M3naDrVKp8xNdANeunPsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=aXaB4ioj; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-dc25e12cc63so3864348276.0
        for <selinux@vger.kernel.org>; Mon, 12 Feb 2024 13:17:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1707772630; x=1708377430; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZsnFwrkSPFxLZoShd+G+bJFEOcLvvtQSuD3i6JLjUWA=;
        b=aXaB4iojMUi4axEelhZ0stCsfoeKjXkqyvnfbZrFMOcXTy3lf8VtkFY2Ko0RCxA8hK
         gUOqXp9eCWzlicRERGuZaZIrFN3wWQn1ZdWqtOkFPlaofdV/+HODU8yTjxURHdlFqtLv
         ZLO7i2Hdcr3WEQAjn7Qo3jo6Dh1fnT7Ju+gGTnMTUEW1Lq3b+GAmGjkBLvTcyNsb7IvX
         C9X4aDlG/kdcKibBXcjX14+uys8CEASKUh7LIF5o1Eddxy2q+ucLTtVrCoHVOmmNl6pL
         wO0CWg7c5gxyx8NczGZwqKRgGSDYgUCPFjEjc2NIjT43UEFxYtnTeKv4KEY/kly5y2Il
         CPqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707772630; x=1708377430;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZsnFwrkSPFxLZoShd+G+bJFEOcLvvtQSuD3i6JLjUWA=;
        b=g5+hkAC/bMYg8wcMSeAEY9szcfvrQEGtdG/LsNR0vPM0botpzYheECssF6NGfFgl3/
         tfvvHuHthMT3nh4Xa0Qyr+Snpxdw5ZIZCOE7ZpvlKi9IlRliPIo4muO5S2IRS/1XPpfx
         XXKlq7Md2/NzCSdx4n2fcpEjf16E58Fn7OCXeoxitRnECy8qZVnTEUL2hvNK2t4iZAIY
         gptNM/XrQQ95dccu2sqhLtjhOEpmc81FOghuf8sR3f31zaCNq6RoXABVOb8p/eSZsIVD
         t5zw5lVu1TMCtChnB+2ffyBsuKGBZkcfuov0iX9AIdjM7nAcYqw14IHDChLqU/qpqKB3
         Jk6w==
X-Gm-Message-State: AOJu0Yxv+aeH5AEJY/CfnS8D7lGepRT5x/Xs1+5IOIMaeyZxVdLZ9bZa
	oMUmBdJmSycCN7zA7bUUfARECwURTfMZKTn8MRB+/C84XeXFlBtsT3w3UFBSNcLnH172UXB4/38
	w8/6n4OHLm89uWRgKgAaIDbvBmVw4iJkFcsAB
X-Google-Smtp-Source: AGHT+IEOi98MZdQxOtaW3bif3LCitIRo8nxqZzxmxH4vbtrZo7RwV5CIap8rAl9zZwh9y87ZH2fwVGa5f+4Y+dV/RGg=
X-Received: by 2002:a81:4e10:0:b0:604:541d:9d54 with SMTP id
 c16-20020a814e10000000b00604541d9d54mr598093ywb.21.1707772629971; Mon, 12 Feb
 2024 13:17:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: selinux@vger.kernel.org
List-Id: <selinux.vger.kernel.org>
List-Subscribe: <mailto:selinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:selinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240115181809.885385-1-roberto.sassu@huaweicloud.com>
 <20240115181809.885385-13-roberto.sassu@huaweicloud.com> <305cd1291a73d788c497fe8f78b574d771b8ba41.camel@linux.ibm.com>
In-Reply-To: <305cd1291a73d788c497fe8f78b574d771b8ba41.camel@linux.ibm.com>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 12 Feb 2024 16:16:59 -0500
Message-ID: <CAHC9VhQ7DgPJtNTRCYneu_XnpRmuwfPCW+FqVuS=k6U5-F6pJw@mail.gmail.com>
Subject: Re: [PATCH v9 12/25] security: Introduce file_post_open hook
To: Mimi Zohar <zohar@linux.ibm.com>
Cc: Roberto Sassu <roberto.sassu@huaweicloud.com>, viro@zeniv.linux.org.uk, 
	brauner@kernel.org, chuck.lever@oracle.com, jlayton@kernel.org, neilb@suse.de, 
	kolga@netapp.com, Dai.Ngo@oracle.com, tom@talpey.com, jmorris@namei.org, 
	serge@hallyn.com, dmitry.kasatkin@gmail.com, eric.snowberg@oracle.com, 
	dhowells@redhat.com, jarkko@kernel.org, stephen.smalley.work@gmail.com, 
	eparis@parisplace.org, casey@schaufler-ca.com, shuah@kernel.org, 
	mic@digikod.net, linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-nfs@vger.kernel.org, linux-security-module@vger.kernel.org, 
	linux-integrity@vger.kernel.org, keyrings@vger.kernel.org, 
	selinux@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Roberto Sassu <roberto.sassu@huawei.com>, Stefan Berger <stefanb@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 12, 2024 at 4:06=E2=80=AFPM Mimi Zohar <zohar@linux.ibm.com> wr=
ote:
>
> Hi Roberto,
>
>
> > diff --git a/security/security.c b/security/security.c
> > index d9d2636104db..f3d92bffd02f 100644
> > --- a/security/security.c
> > +++ b/security/security.c
> > @@ -2972,6 +2972,23 @@ int security_file_open(struct file *file)
> >       return fsnotify_perm(file, MAY_OPEN);  <=3D=3D=3D  Conflict
>
> Replace with "return fsnotify_open_perm(file);"
>
> >  }
> >
>
> The patch set doesn't apply cleaning to 6.8-rcX without this change.  Unl=
ess
> there are other issues, I can make the change.

I take it this means you want to pull this via the IMA/EVM tree?

--=20
paul-moore.com

