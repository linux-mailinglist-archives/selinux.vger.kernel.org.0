Return-Path: <selinux+bounces-3322-lists+selinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DDA3A851EF
	for <lists+selinux@lfdr.de>; Fri, 11 Apr 2025 05:14:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 88C497AF107
	for <lists+selinux@lfdr.de>; Fri, 11 Apr 2025 03:13:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89C6027C16A;
	Fri, 11 Apr 2025 03:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="J+hBllSF"
X-Original-To: selinux@vger.kernel.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E29C627BF8D
	for <selinux@vger.kernel.org>; Fri, 11 Apr 2025 03:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744341261; cv=none; b=eH54ywVDU9ALtaQzfPUjTg1jKoJvqF1w7RMv7uRuGOX6csnrP9+IY6dPBOgYZOLjKBWZaNAB0ahBah52LsC7jqbNU6hYl6YcDujcc0s6+DC3pdqR2AoqQUovPKzJ6QKDFtSUMl2KENYfZ84Z3FKrT+PY4rN/cdQbLwIzqi/ZlWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744341261; c=relaxed/simple;
	bh=LAC6z9o/IzSh6bnaiweC2in7QUXMIr1Ih43f0mU+IZI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Cm3Y8gesK3EyD2YHXCaapSZwjdzmp2tXIjG7nmRHaufIEVVQnH7Y7fsEDJOiECXpIwE/FdZ+vnLlxcq22k8bKPI+sZIYEMI5Rf76dnitd7KQaBbUPC0TUYQCEA1OupyYXKlxq+GgpmD5/Qbm2rwgmpiNgpgaI1aFfYlGFUj61fU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=J+hBllSF; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e643f0933afso2237666276.1
        for <selinux@vger.kernel.org>; Thu, 10 Apr 2025 20:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1744341259; x=1744946059; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jdWQDh2sqX7+2UwchOD1bq0Gf8ttlkzCQiiE0SsYP50=;
        b=J+hBllSF+JCDWhJ6Edd1JyDAeTuD8aHyjamYFl9bx0BTayy6YgdhfH/G1qBeFtH8f8
         ENKtosVtUgkSovnNaBY1iI2DHz5hctaD9XtMaWqSFsh9QZQZqAd7bkN6TTGeb638tag2
         1v/9DH6E2b6oXte7JjpXu3yAnpklroH/Uk64e43rro1Mq1KzF2b1XomY1RpTdd5jISCV
         qC7oUmnFU3QUiuBBuUJo7EPbwI0wDyh08YMl55KfutNO9TzyHza3sIpqFu3/HAXvk3e+
         7YbdxHdqRSWKcbEVMfa8dieDTgz1P51MDlgQFR1+cyunvnujabe/58OGv/DsJxKxaSff
         YI6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744341259; x=1744946059;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jdWQDh2sqX7+2UwchOD1bq0Gf8ttlkzCQiiE0SsYP50=;
        b=vyiqyzwGDdMPS28dkE/AHbiHDY3S7Ok/sITuLgYyAvtR39DUVPW5hTjq7nydc79hYX
         S/c/404q4Ou+HzrwO0QLj9sO3XO4Y7HjDgZwKl4TgcNHKw3uwaV8vucqx7KYntea7xLt
         la+94scqsRo7XvIk4qKmGB5O4YW6Uiipnz+aSicNcyBI59OjH8bvsq8yYE3tzVOyANvJ
         L7+f49OWG/s+S5Wsc6y0xP6kexO23bU9qhoVrT4wF6W7LyKHLg1UwYRU3PIDVbNS+0IC
         lxkpH9EELIuAXJRUCZF1KgV/zjyU5WIzIHYwt/XYf3a1JOLoPwB4z+1RLkR6JEF/EKCy
         Z1nA==
X-Forwarded-Encrypted: i=1; AJvYcCVp8xmIU1Z/2gQSBaVOZWP6AodUjCqUTyLoaie/EQcpqXQ5Ehh2upHKS1BEvAmJFMbtjhzdEeao@vger.kernel.org
X-Gm-Message-State: AOJu0Yyfz+MZoShFbNsGg2V6a9xhDVYG02wvn6lBozt1YdNMNwGvNSFE
	XSobKW+jseTPPQjSfJKZvgwgq1FP91sn665UHVTaWHKTe2B1mlBoSZrKk6hv9CqyAYgq5+p5lnq
	RuroArXoVDpjWfCJnD5K69MUnsaJAZUhbBHe6
X-Gm-Gg: ASbGncvqsxLnLRvqD/W7AVckuBALeJdqYSGenODMeGhE+uiTeQ+BO/MqxUR0aX6ltiP
	EC7CMxZhpGZHNXP77kx8bci8SKZnhiDMJNMZPs0zo4IkTdfcFGWg9pZdqygyBhOJ8p+RtvGwVgP
	rMuzQdejjLt58oo3jJi2A3gw==
X-Google-Smtp-Source: AGHT+IFgiOCucamXXWXD1vjG5nmQFl7xXT/iMquWwrzP5toeHuouZQJUuMbt7TfgOpCJSmAMc+xd+/M5cz/ZTYf6P/g=
X-Received: by 2002:a05:6902:230b:b0:e6d:ee6d:664 with SMTP id
 3f1490d57ef6-e704dffc069mr2238530276.21.1744341258911; Thu, 10 Apr 2025
 20:14:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: selinux@vger.kernel.org
List-Id: <selinux.vger.kernel.org>
List-Subscribe: <mailto:selinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:selinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250409185019.238841-31-paul@paul-moore.com> <20250409185019.238841-39-paul@paul-moore.com>
 <202504091607.0A394D5EF@keescook> <CAHC9VhS4nB2xV-zw+=eN2MYaetvCkParammXn1fPGsm-wuHtTw@mail.gmail.com>
 <202504101913.8F3B5D1@keescook>
In-Reply-To: <202504101913.8F3B5D1@keescook>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 10 Apr 2025 23:14:08 -0400
X-Gm-Features: ATxdqUFFTHGJFl3SLQgaT95pzdgTlxaOJYn4twmoIx55QzJ78L9lSfJEamHCFUQ
Message-ID: <CAHC9VhSQWxpo-K96kqJSPJhtLudZL2pExgLq6oQ2H+7xYNTF5w@mail.gmail.com>
Subject: Re: [RFC PATCH 08/29] lsm: get rid of the lsm_names list and do some cleanup
To: Kees Cook <kees@kernel.org>
Cc: linux-security-module@vger.kernel.org, linux-integrity@vger.kernel.org, 
	selinux@vger.kernel.org, John Johansen <john.johansen@canonical.com>, 
	Mimi Zohar <zohar@linux.ibm.com>, Roberto Sassu <roberto.sassu@huawei.com>, 
	Fan Wu <wufan@kernel.org>, =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, 
	=?UTF-8?Q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
	Micah Morton <mortonm@chromium.org>, Casey Schaufler <casey@schaufler-ca.com>, 
	Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 10, 2025 at 10:15=E2=80=AFPM Kees Cook <kees@kernel.org> wrote:
> On Thu, Apr 10, 2025 at 06:47:12PM -0400, Paul Moore wrote:
> > On Wed, Apr 9, 2025 at 7:13=E2=80=AFPM Kees Cook <kees@kernel.org> wrot=
e:
> > > Better yet, do this whole thing in a initcall after LSMs are loaded, =
and
> > > both can gain __ro_after_init...
> >
> > I *really* disliked all the stuff we were having to do during boot,
> > and all the redundant global state we were keeping around.  I'll go
> > ahead and cache the lsm_read() result local to the function but that's
> > probably all I'm going to accept at this point in time.
>
> Oh, for sure. I love that all that can get thrown away. I mean literally
> copy/paste what you have in lsm_read() and stick it immediately before
> the "lsms are done loading" notifier. Then it only needs to be done
> once, it's impossible to race, etc.

Maybe I'll change my mind at some point, but right now I'm feeling
pretty strongly against generating the list string at boot.  I've
added a basic cache protected by a dumb spinlock in lsm_read which
should work.

--=20
paul-moore.com

