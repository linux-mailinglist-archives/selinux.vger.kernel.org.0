Return-Path: <selinux+bounces-2807-lists+selinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 296ACA21475
	for <lists+selinux@lfdr.de>; Tue, 28 Jan 2025 23:35:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EEFB67A15C9
	for <lists+selinux@lfdr.de>; Tue, 28 Jan 2025 22:34:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48CDF1E1027;
	Tue, 28 Jan 2025 22:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="Q6B7N39g"
X-Original-To: selinux@vger.kernel.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 937FF18FDD2
	for <selinux@vger.kernel.org>; Tue, 28 Jan 2025 22:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738103740; cv=none; b=QXb5Tqn/3DWuq625ytEDOumiBX9vXMUFLMXVUfVbvkapjDwJGJWIDUFdb8iD2dQGrSQNqPsrW0DyGMdxzKnVyPIn7Z7BiC8TF4eTUBcNKBb1gMos2POnmE2cI4VcMeBip+DDtqZwZMYWiU/pHOHB4Z/QihfkEeHrGA+W3DlnIug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738103740; c=relaxed/simple;
	bh=aQQwYUnvWfgtyP+dmbUmLDOmnX2Z+iELnKkJRJAabEo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AOr62LGWZy9/8t/31XvCO4ALm/NgAYPDP4l7kB1YntV0kwONjII17E6Mbsv3WCuP1GXUjIGP5i8VXi7memZUoYV+EL7zv2A4MfbDQ1eISIzDLYYR4WdAqvFaDHzgQUs8AzKqXVOivRCaGWS2SW/hdQfpz9XPDfr5K3Wz3IWAno8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=Q6B7N39g; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e3983426f80so9616062276.1
        for <selinux@vger.kernel.org>; Tue, 28 Jan 2025 14:35:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1738103737; x=1738708537; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nYZCBsynDG8pTs1UEIkhpbYnZhRRPDshsaE1Ef10ZkE=;
        b=Q6B7N39gC+pZhMin/p0PUkN4h67DIhbReor1XUqWwZh6d8HvXgBZlkksiPVSu9s2pC
         d5QO0s0m/MO+Axw8duVFvxM3+UnqVeg+eSyxUyNHonHcduRoVEwWJg+hxl6mbKRksfX/
         RHE1JGVWLXTuM5zdJOoBx1HXuTjhOy2V0pepF02BIANIIISdUgxv/eSu3C+BXi+hhkMm
         uoGkoMyTCeVlgBPwGly7wOuzxgvlqTjVCmFGJXnexqViXtw76nhGCkpDNZKYa66AyD42
         TLtzfDQPM0+4LMV1C16SdpYwaPCNXCokBlJc3azqdVovEUQ98ajVwWkTCL3s6VhVsTZH
         m/4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738103737; x=1738708537;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nYZCBsynDG8pTs1UEIkhpbYnZhRRPDshsaE1Ef10ZkE=;
        b=AWB+TXbxFsq5DkfqfxidN/142HPJ2aqSvouoAd86HefMP48/gpjoGotQOclBxo7O0T
         l9DgNAfP58DnZohwuy1qVFrpahPcm1ctChU9fwhACgGTPjZwu8MP0kPF3qAdBSYWf5i/
         4ivTX6iJec4DTEoxslU+cdQNL1pr0/tFdEWtCycYB7PM+wbhgSKdWiMQcc30gTH92eQd
         gfhv3YxfEiREOecLGojYDTeF2Zz6kgPN2BGzw/CBwJmuuUc59tX7DffpIvWz/cWiCQQC
         760zroiOmqUoDxTis6oCxUesiJVwUZNrmX7c1KAF3enLtkmHo2LFsiB4lFrLZ4682Jws
         RCdQ==
X-Forwarded-Encrypted: i=1; AJvYcCXKvKqwYiEfOZ6KhlXYZ3IXPb25H1DSgYkKySCa1uvmMXuvXUAq6ZL2AwnhOuM8Uc2jHXfObo81@vger.kernel.org
X-Gm-Message-State: AOJu0YxnQs8/ajbgjSLb9T8HQg+WSazHEWR9IFWyuCr4jEGUf7MerAyZ
	9fBkdqV4f3OSsUYjDoqKJ5qL7OMgNqXz3/XD2G/pktk1wquUkUnWag++TsodIn9raZqZP7G9O1v
	upLjetpFh1AkxHMa0vRfX7GAPf9vgpzQjuq9PRn6sPUF9qwsLNA==
X-Gm-Gg: ASbGncubD+Ldl3XbB0R9fhCPzt70nPKroa2KTcovFe07iJ877CpYwpSnBKiBpI964Wp
	S6PVFi855WOGDRg0yW1qpSk3zbbvElzjNnR/j9KoBFyII6PvwfHYAlu0Bx+sX1OswcvIkFiw=
X-Google-Smtp-Source: AGHT+IE7eC97V5BzAfD/tG04L5XcjZcJiXoiih1RJdkWvH041yGERA7Z4QAJ8EFV2WsyRszuQi2lTSOL9/bPdPy7rNs=
X-Received: by 2002:a05:690c:9a13:b0:6e5:aaf7:68d0 with SMTP id
 00721157ae682-6f7a838921bmr6861117b3.18.1738103737567; Tue, 28 Jan 2025
 14:35:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: selinux@vger.kernel.org
List-Id: <selinux.vger.kernel.org>
List-Subscribe: <mailto:selinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:selinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250127155723.67711-1-hamzamahfooz@linux.microsoft.com>
 <20250127155723.67711-2-hamzamahfooz@linux.microsoft.com> <bd6c2bee-b9bb-4eba-9216-135df204a10e@schaufler-ca.com>
 <CAHC9VhRaXgLKo6NbEVBiZOA1NowbwdoYNkFEpZ65VJ6h0TSdFw@mail.gmail.com> <bb360079-f485-48c5-825d-89cbf4cf0c52@schaufler-ca.com>
In-Reply-To: <bb360079-f485-48c5-825d-89cbf4cf0c52@schaufler-ca.com>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 28 Jan 2025 17:35:26 -0500
X-Gm-Features: AWEUYZkNPjTDY2rqH2crsRY0arhnMl7CRc5MJbx2Mo4ABz0hV_LiXsT4DauH70o
Message-ID: <CAHC9VhTAunsgA-k64-qmQzeyvmAHuQ-=Jp-yWDi9XDP9CHkhHA@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] lsm,io_uring: add LSM hooks for io_uring_setup()
To: Casey Schaufler <casey@schaufler-ca.com>
Cc: Hamza Mahfooz <hamzamahfooz@linux.microsoft.com>, linux-kernel@vger.kernel.org, 
	James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, Jens Axboe <axboe@kernel.dk>, 
	Pavel Begunkov <asml.silence@gmail.com>, Stephen Smalley <stephen.smalley.work@gmail.com>, 
	Ondrej Mosnacek <omosnace@redhat.com>, =?UTF-8?Q?Bram_Bonn=C3=A9?= <brambonne@google.com>, 
	=?UTF-8?Q?Thi=C3=A9baud_Weksteen?= <tweek@google.com>, 
	=?UTF-8?Q?Christian_G=C3=B6ttsche?= <cgzones@googlemail.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, linux-security-module@vger.kernel.org, 
	io-uring@vger.kernel.org, selinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 27, 2025 at 7:23=E2=80=AFPM Casey Schaufler <casey@schaufler-ca=
.com> wrote:
> On 1/27/2025 1:23 PM, Paul Moore wrote:
> > On Mon, Jan 27, 2025 at 12:18=E2=80=AFPM Casey Schaufler <casey@schaufl=
er-ca.com> wrote:
> >> On 1/27/2025 7:57 AM, Hamza Mahfooz wrote:
> >>> It is desirable to allow LSM to configure accessibility to io_uring
> >>> because it is a coarse yet very simple way to restrict access to it. =
So,
> >>> add an LSM for io_uring_allowed() to guard access to io_uring.
> >> I don't like this at all at all. It looks like you're putting in a hoo=
k
> >> so that io_uring can easily deflect any responsibility for safely
> >> interacting with LSMs.
> > That's not how this works Casey, unless you're seeing something differe=
nt?
>
> Yes, it's just me being paranoid. When a mechanism is introduced that mak=
es
> it easy to disable a system feature in the LSM environment I start hearin=
g
> voices saying "You can't use security and the cool thing together", and t=
he
> developers of "the cool thing" wave hands and say "just disable it" and i=
t
> never gets properly integrated. I have seen this so many times it makes m=
e
> wonder how anything ever does get made to work in multiple configurations=
.

While there is plenty of precedent regarding paranoia over kernel
changes outside the LSM, and yes, I do agree that there are likely
some configurations that aren't tested (or make little sense for that
matter), I don't believe that to be the case here.  The proposed LSM
hook is simply another access control, and it makes it much easier for
LSMs without full and clear anonymous inode controls to apply access
controls to io_uring.

> > This is an additional access control point for io_uring, largely to
> > simplify what a LSM would need to do to help control a process' access
> > to io_uring, it does not replace any of the io_uring LSM hooks or
> > access control points.
>
> What I see is "LSM xyzzy has an issue with io_uring? Just create a
> io_uring_allowed() hook that always disables io_uring." LSM xyzzy never
> gets attention from the io_uring developers because, as far as they care,
> the problem is solved.

To be honest, I wouldn't expect the io_uring developers (or any kernel
subsystem maintainer outside the LSMs) to worry about a specific LSM.
The io_uring developers should be focused on ensuring that the LSM
hooks for io_uring are updated as necessary and called from all of the
right locations as io_uring continues to evolve.  If there is a
problem with LSM xyzzy because it provides a buggy LSM callback for
the io_uring LSM hooks, that is a xyzzy issue not an io_uring issue.

--=20
paul-moore.com

