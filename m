Return-Path: <selinux+bounces-4940-lists+selinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BDF32B53C49
	for <lists+selinux@lfdr.de>; Thu, 11 Sep 2025 21:31:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7BE9D56882B
	for <lists+selinux@lfdr.de>; Thu, 11 Sep 2025 19:31:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4CEC25A642;
	Thu, 11 Sep 2025 19:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="cVDfK0C5"
X-Original-To: selinux@vger.kernel.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AE4A2DC765
	for <selinux@vger.kernel.org>; Thu, 11 Sep 2025 19:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757619060; cv=none; b=mc1iDxbP/pgj25LjTFCizq00Od7/9QTbnvcB16BNxYI4zYgPvhyOqkGX/wv2CHBBE2PDuEUL2HJopgkXmrQTrwWo4jzvSmNFBRRCreoGAlPsZf1VLTDXyLW1r2EFAh6o12W20T93quOV6S7HilJqAcnNmwKvEifmsAURAiyiYBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757619060; c=relaxed/simple;
	bh=gT+veZcytG/u8Ap5CoqKgtS9qIoTr1tFB9eg16I06Xk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r+n4TF8qEnsfKmuq932Q9A+E8HI92eGz98OiaiIqFHxY55iXD4+i4HCU6EBNmxtvZFrC43XwWKChAD/ymIyff3bWAFY0RRC+QmmKHHhCL56KrThAZ/jqRh40I5uG7OGBV6kbALb6fjMgrVyYi/eWMgNDckTQf5HrmZ0uzc8S3MI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=cVDfK0C5; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-32de2189729so491611a91.3
        for <selinux@vger.kernel.org>; Thu, 11 Sep 2025 12:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1757619059; x=1758223859; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uGtUDAO6h1eIXkhwicA4JhceHGc31DeBpXZ9IJpT0x4=;
        b=cVDfK0C57ijBNzjK4lLu0gLMl4m/bUfA78+Mk6T6UEPg3B8po8MXQjOk7I9q93/RTa
         v0Rdayw1SKZGhSAioE3BRL4iSIitBx4gkNuG3jYx8B5YjpZewr0Xxt9a4hn1oyaIeTmb
         /aY+mnrA52lCrNvT5j7bF1d4JSWL2Ij17Dai2M+To1+v7+V25yw0qJJnFWEuFrxZtx/F
         RtHBDILzf5BttGrXDoLlk0ksSURexMEScKf25I5+lAS3ljez7lG3YW1F1CeN0Z/Yk5ou
         0MvusWls4rJrbR5lZLZXIyxeiBBbCM6HUQ7HDOtzWUjG3TbFJ7Ah1qhJDMvVmtz2shtC
         sdNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757619059; x=1758223859;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uGtUDAO6h1eIXkhwicA4JhceHGc31DeBpXZ9IJpT0x4=;
        b=fZqpjUHA4kTKutkoW/qc//3WxCGIUTHJH1QChnRS0S8gdc86AhVuhTTDuA7W0UeHDt
         Od7hlEGGRCs3yahDsiC8FCbD7rKb+5NhBDNcrpwtYQaw+UaCzAjIwAuvsS9tmv628WbR
         bqJmP3NeLWzF8cw9SKOWDCsGPvQQHbjplaXn8p9zyIYXPj4AdgUT+jFfz7vknKCi0XBJ
         dL8Nlufcvv/RExkgy+BMRNAoGvRhy4syz2+VcuBLNHd41z/c7hc/jrtl8JAjA8Aor5Su
         9tekUlxzva2u+LVmk6vpO7KtJATnEElObw+r1TJLEf2MjeaAC/CZspQCW2sVljoqwDT7
         /Lcw==
X-Forwarded-Encrypted: i=1; AJvYcCXLz9Y+mQBKPJRWgzbxkw9OiXasJYSPB6qe2EaHPlBB7bRsyQbIhzTStA38DeoK2wtAUhAttdJr@vger.kernel.org
X-Gm-Message-State: AOJu0YzzFfo9t/nD+Boui7rFDBBPJi8NAw1wCT6aRBkIi6jgWSN4S9Ox
	uXQ8ehQPRNfOoOAQUgMiI1NtOoh8OPFRZqzCFHV1p3Z909jcIsaaJa2tN1k88IspTjLP43mdhEr
	G465Fy2jEMEs49QdJZEMQunHadrL/ryl8ZViPmgAE
X-Gm-Gg: ASbGncsSFIt2lPMtKt+Fbw1TGePGfMad7A9qtEZvA+DPmnPkYi6ukj97quqcmx+LTv8
	pNUBld8gLdVXkWVpZV2Gdtll17YHaPhta1u7hLBkyT/BiiFpL/7Dq4xnDXuTj4InThCLbNvb5Vf
	TVTDm4YDIg+F7tCdxVrtMDqVkLxwzIBmxWiWTvPDtEoYKFiNiYVfS70MdQkbg7jAmd72le8IttX
	fL1B906dvOTKeYWSg==
X-Google-Smtp-Source: AGHT+IGiM8SZDeBlMdgXCmqMlNo0rydxM7+BodtgIzFFwXP5lqArAsvcjIDyN7+QlyX05fjuGGVM4Wx0dvThabROEUU=
X-Received: by 2002:a17:90b:3c8c:b0:32b:df31:3dc2 with SMTP id
 98e67ed59e1d1-32de50f8e56mr274173a91.22.1757619058567; Thu, 11 Sep 2025
 12:30:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: selinux@vger.kernel.org
List-Id: <selinux.vger.kernel.org>
List-Subscribe: <mailto:selinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:selinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250814225159.275901-36-paul@paul-moore.com> <20250814225159.275901-67-paul@paul-moore.com>
 <CAHC9VhS3KdVO9n-dgk1qFzTae0i+Oab8atMmt0CAsMEm1D4v5w@mail.gmail.com>
 <bd46c63ebb9eddfcdc8df92fe9f85473416ea8a0.camel@linux.ibm.com>
 <CAHC9VhTJnQ3EggEXwbW5D8xOnb+Z_02yz-Dgb7QiAoArhw1ETg@mail.gmail.com> <9f1dd6d30193c82ff36b5665eadc1aec73736017.camel@linux.ibm.com>
In-Reply-To: <9f1dd6d30193c82ff36b5665eadc1aec73736017.camel@linux.ibm.com>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 11 Sep 2025 15:30:45 -0400
X-Gm-Features: Ac12FXxLgHL87TsIr2nrJx5keTrwkJwtuEdQIoZFTtGyf79rfjMMQYYtFoEoiSw
Message-ID: <CAHC9VhQT8X8UDt2ZbKhA8bVcaNj06sVyTLG0+WyevrTVFpJwtA@mail.gmail.com>
Subject: Re: [PATCH v3 31/34] ima,evm: move initcalls to the LSM framework
To: Mimi Zohar <zohar@linux.ibm.com>
Cc: Roberto Sassu <roberto.sassu@huawei.com>, linux-security-module@vger.kernel.org, 
	linux-integrity@vger.kernel.org, selinux@vger.kernel.org, 
	John Johansen <john.johansen@canonical.com>, Fan Wu <wufan@kernel.org>, 
	=?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, 
	=?UTF-8?Q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
	Kees Cook <kees@kernel.org>, Micah Morton <mortonm@chromium.org>, 
	Casey Schaufler <casey@schaufler-ca.com>, Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>, 
	Nicolas Bouchinet <nicolas.bouchinet@oss.cyber.gouv.fr>, Xiu Jianfeng <xiujianfeng@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 8, 2025 at 6:34=E2=80=AFPM Mimi Zohar <zohar@linux.ibm.com> wro=
te:
> On Sun, 2025-09-07 at 21:05 -0400, Paul Moore wrote:
> > > The "unrelated to IMA/EVM" wording misses the point.  An exception wa=
s made to
> > > load the pre-boot keys onto the .platform keyring in order for IMA/EV=
M to verify
> > > the kexec kernel image appended signature.  This exception was subseq=
uently
> > > extended to verifying the pesigned kexec kernel image signature.  (Ot=
her
> > > subsystems are abusing the keys on the .platform keyring to verify ot=
her
> > > signatures.)
> > >
> > > Instead of saying "unrelated to IMA/EVM", how about saying something =
along the
> > > lines of "IMA has a dependency on the platform and machine keyrings, =
but this
> > > dependency isn't limited to IMA/EVM."
> > >
> > > Paul, this patch set doesn't apply to cleanly to Linus's tree.  What =
is the base
> > > commit?
> >
> > It would have been based on the lsm/dev branch since the LSM tree is
> > the target, however, given the scope of the patchset and the fact that
> > it has been several weeks since it was originally posted, I wouldn't
> > be surprised it if needs some fuzzing when applied on top of lsm/dev
> > too.
>
> Thanks, Paul.  I was able to apply the patches and run some regression te=
sts.

Mimi, I know you already tagged Roberto's patch with a 'Reviewed-by'
tag, but I wanted to follow up and see if you were comfortable
converting that into an ACK, or if you wanted more time to review
Roberto's patch?  No wrong answers, just trying to understand where
you are at with this patch.

--=20
paul-moore.com

