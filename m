Return-Path: <selinux+bounces-2893-lists+selinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE447A3EB2B
	for <lists+selinux@lfdr.de>; Fri, 21 Feb 2025 04:16:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 020A9420AA1
	for <lists+selinux@lfdr.de>; Fri, 21 Feb 2025 03:16:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A692D1F78F2;
	Fri, 21 Feb 2025 03:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="a4RAVbIO"
X-Original-To: selinux@vger.kernel.org
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D8041F3FD7
	for <selinux@vger.kernel.org>; Fri, 21 Feb 2025 03:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740107804; cv=none; b=Sdzg6phzmOemUVXJ58myuHvBut2QTMsOwOtap8M54bCJrQFkODNzeanHjxW6SLFIFqtygMY57x2qQslR8bw0spj1z9q2t3UMK1E3MvdgjP8E/NDTLdmWlcHBqWCzHtVbifVqF2WsLs3gHAgaJsHg1wyS571fEJEboTHR4d2u5RY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740107804; c=relaxed/simple;
	bh=kdrOUzgVVdFR3sHFxXYQEjkbdG9MBlaaptabQxv0kQU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CflbWhnB9ptPZQtHNV5KHxnTw0tc0fCBmpT6WuGFvxyeMw7TDB8cfD4zU3pSsfUWQg98tjkxL1aiAoNoH5DC1tgggyIFxuTcq/mDh21LUR5JQYW5Ilqv6/aaPCOc/BBhZllD8+PeRpRXweFIk/mzIpzD9pq7uELImOCi7S8uREI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=a4RAVbIO; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5209962eefbso1616521e0c.1
        for <selinux@vger.kernel.org>; Thu, 20 Feb 2025 19:16:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1740107801; x=1740712601; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DkwUVxurgul/K7FCcMY+3Tk9R0xuunIgonMxNv/xP3Q=;
        b=a4RAVbIOfJ9x4isztn4snzAIQkKsa2B4Ev/2g9k8qeTpj9xGOAW87HuLHh5HVLExoX
         lzAadz9B0iCjyj/k2wlypSEkZdlaov3Kur7BqYAC/qDAmeXIfHGOeyp6HJAe5/dT1+qR
         +Q5bAVtg/QIEE+y+DUnyABwyURrH2xk3DqWvEwbSjsO8HgBmu5JYgMxYfgKXFlYKfA+K
         h+YHXjAZ/MOqhqi3GJLJOUw7hn1WZZtlMLmy1iAss+p4Q6wEke2fx08JzXfhveqn9TWY
         R0UaJaovVuhL6I5AXhPbom6thjGdPXeGd+8Yq354mUBhZTB4FO7GDPvrGbHvAUu2V+77
         3icg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740107801; x=1740712601;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DkwUVxurgul/K7FCcMY+3Tk9R0xuunIgonMxNv/xP3Q=;
        b=cvU46s+pzkJdRGoU2x4AH5bb17v/MI7Jr0W2DlZIWBDOFzSJGLijJgq1irtzk7RClz
         xRi8fX048F4eZ+q0hwDOURzDJpuUf0lLKipFnwpW6IQcYUxcx6eQ4JEWWbSYER5hCgkr
         TVD+WjwV+KqrEm481UfK7WKVCEzXYjzfr1h560wVxaEnyEgDJjK5Uq+zh3hse2mu6rvs
         XICzIep9TEQ2P2LLGBb4/cdWwqft54Frt6xjWlP/hsenO99BLvqsS4yWyEDLAUP+AU2H
         GIRed7JGu2+OaPOwmxihVL64BPeFDcCmtyX1hPu+2alk6CWBV8V7k5gl9at3bw9C+bOT
         qjkA==
X-Forwarded-Encrypted: i=1; AJvYcCWkdeOl9R34MU+8OPi9nPDbG09++OeBhii9Qg8i1TwUlrYPPk1Zp8+iEglOfSumrmuVO5YYh8Iv@vger.kernel.org
X-Gm-Message-State: AOJu0YwaXxfA7VsTtzLmYejfEK9I7yIu8tFNzf9kijTpdPAH0OC5avxR
	pumai8hKXdug9/uovFaLprxt+1BE6Ga2/7UrNsrAGefhNi02qKo+jO8HuWjgkvjubN85TDnU4EN
	i+cazMozoK+Vyat/BKttq5U/QqRUXVv9GIfUL
X-Gm-Gg: ASbGncs/HTGS7/nbOBdEK7MstXfljikCrZi7Dcza2fibFKA+2oxfPe/z8Jn2tRqQZB3
	cqquo7eDhklxD4YyZEPBLW6ivyW+3hjawGns92GY9VxvWl0KFu3mormQUYSU8qg53V1Ez9c7P4z
	yOS3HIY2c=
X-Google-Smtp-Source: AGHT+IH4wi2+Fbki2I5z7rt08OZ60QpOG7qQiecIvmmUTNGESL+MgXrnaybH2kx63UDin7eeHdz7nGr7qRecyFqb7AQ=
X-Received: by 2002:a05:6122:1789:b0:520:a84c:1b59 with SMTP id
 71dfb90a1353d-521dcfc0dd1mr3393922e0c.5.1740107801011; Thu, 20 Feb 2025
 19:16:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: selinux@vger.kernel.org
List-Id: <selinux.vger.kernel.org>
List-Subscribe: <mailto:selinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:selinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241023212158.18718-1-casey@schaufler-ca.com>
 <20241023212158.18718-5-casey@schaufler-ca.com> <CAEjxPJ56H_Y-ObgNHrCggDK28NOARZ0CDmLDRvY5qgzu=YgE=A@mail.gmail.com>
 <CAHC9VhSSpLx=ku7ZJ7qVxHHyOZZPQWs_hoxVRZpTfhOJ=T2X9w@mail.gmail.com>
 <CAHC9VhQUUOqh3j9mK5eaVOc6H7JXsjH8vajgrDOoOGOBTszWQw@mail.gmail.com>
 <CAEjxPJ6-jL=h-Djxp5MGRbTexQF1vRDPNcwpxCZwFM22Gja0dg@mail.gmail.com>
 <CAEjxPJ5KTJ1DDaAJ89sSdxUetbP_5nHB5OZ0qL18m4b_5N10-w@mail.gmail.com>
 <1b6af217-a84e-4445-a856-3c69222bf0ed@schaufler-ca.com> <CAEjxPJ44NNZU7u7vLN_Oj4jeptZ=Mb9RkKvJtL=xGciXOWDmKA@mail.gmail.com>
 <eba48af3-a8ef-4220-87a1-c86b96bcdad8@schaufler-ca.com> <CAEjxPJ7aXgOCP4+1Lbfe2b5fjB9Mu1n2h2juDY1RjPgP10PUxQ@mail.gmail.com>
 <784b9c6d-22e1-44d0-86f8-d2b13c4b0e11@schaufler-ca.com>
In-Reply-To: <784b9c6d-22e1-44d0-86f8-d2b13c4b0e11@schaufler-ca.com>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 20 Feb 2025 22:16:30 -0500
X-Gm-Features: AWEUYZmAClGRobwy2rc6ntcXOfyVW75ozxug9Z5R0cdhhnSfjf0Qve2WSPi3N4M
Message-ID: <CAHC9VhT968J3zBxtzJcnW+6AKzDKA4MzBgMYoHHXsEaREAe=ww@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] LSM: lsm_context in security_dentry_init_security
To: Casey Schaufler <casey@schaufler-ca.com>
Cc: Stephen Smalley <stephen.smalley.work@gmail.com>, linux-security-module@vger.kernel.org, 
	jmorris@namei.org, serge@hallyn.com, keescook@chromium.org, 
	john.johansen@canonical.com, penguin-kernel@i-love.sakura.ne.jp, 
	linux-kernel@vger.kernel.org, selinux@vger.kernel.org, mic@digikod.net, 
	ceph-devel@vger.kernel.org, linux-nfs@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 20, 2025 at 4:08=E2=80=AFPM Casey Schaufler <casey@schaufler-ca=
.com> wrote:
>
> Adding the lsm_context was cleaner. Not worth yet another roadblock.
> I will have a patch asap. I'm dealing with a facilities issue at
> Smack Labs (whole site being painted, everything in disarray) that
> is slowing things down.

Sorry for the delay today, I was distracted by some meetings and
wrestling with gcc v15 on my Fedora Rawhide dev/test system while I
try to test the LSM init patchset.  Anyway, I'll add my comments to
Stephen's formal patch posting.

--=20
paul-moore.com

