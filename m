Return-Path: <selinux+bounces-227-lists+selinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 548D681737B
	for <lists+selinux@lfdr.de>; Mon, 18 Dec 2023 15:23:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A7BB6288470
	for <lists+selinux@lfdr.de>; Mon, 18 Dec 2023 14:23:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 844951D12A;
	Mon, 18 Dec 2023 14:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gr0maGAL"
X-Original-To: selinux@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08717129EF9
	for <selinux@vger.kernel.org>; Mon, 18 Dec 2023 14:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-40c60dfa5bfso37215035e9.0
        for <selinux@vger.kernel.org>; Mon, 18 Dec 2023 06:23:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1702909408; x=1703514208; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LzQc1yULZChaDLQ9G/ihl8REJbHZhov+DE7MK87TVb0=;
        b=gr0maGALSR52Eyn6HZ0rH2WG9HnEzVFbQ2nQoUbJlErLmPLZrJ5rn+w8wH3L7hr5f1
         uyeuM/Kqz2jJb9uVfttqB3VMiff1lJvGo88GJKTHjtj0cIgFsme++XIE422ZRZytO97F
         T8CjJOoC3KyuZLAknDZ1/JRHefSV0HYfhF+UBtJkBCQJxSpJV7b4c8YJdDOLRTI+sM+E
         +yIRReU4VzDux188nZBBepttBd1sYYfD+u8rD1FSLQwIfC+HnT7MN1u98fUhwS68U/HV
         tBvfICpNi1I1WcrdbAEM9KL7HG9X/wWmq2vNj9900Xat8rbkx9s+QNiK1jCx3JHFYbJt
         8bpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702909408; x=1703514208;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LzQc1yULZChaDLQ9G/ihl8REJbHZhov+DE7MK87TVb0=;
        b=L5q0xaqcHwnt4EouR1zc0twZAfYi1FqYMTY5EFwxd+d9oO/o1kbyHuQUDw7hx+l5vd
         ByIrHntW0FXrwO7ShQp+PFXZksRTX5P7Flk/8aPGRZBsEs+pYorpCqFLG4cOWmjeK3+B
         j9w0J1YHLpJB6a6vvPPMUwiDryDKr7eX2AV+l7a/32AssfNP4RNYGVXn6AUJb/G2JCGT
         iVA3bOBf2sYJ93MVw1KLfp82MR1V0+ZtUnM2uSuXQjtQdpoiuHObacdOKO8MVUjcxwru
         RPletv07/BNa4ATXuZr1Ear8+osUIc1ZYp8FRm5S/OnjRP3yn6OBHD6NtHATbrFRdBPv
         zt+w==
X-Gm-Message-State: AOJu0Yxwth3IrpmpcTxIxMIMKVvz9q46h+AHTJar3Z/jbb7rgul2rF/j
	Pu3gBBYtd5xf1KtyTKBgYchWHP/GLJ25hibN+G44BQ==
X-Google-Smtp-Source: AGHT+IFjfzSrKy1VCxahCZN8bB8Pt2jUcoyta7zgHgxmTr6TUO/ufFtIA/WrJxi9JIIbR7og9rPgwtArG7ubGMx13Uk=
X-Received: by 2002:a05:600c:4d0e:b0:40b:5e1e:cf1 with SMTP id
 u14-20020a05600c4d0e00b0040b5e1e0cf1mr7965342wmp.44.1702909408123; Mon, 18
 Dec 2023 06:23:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: selinux@vger.kernel.org
List-Id: <selinux.vger.kernel.org>
List-Subscribe: <mailto:selinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:selinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231218141645.2548743-1-alpic@google.com>
In-Reply-To: <20231218141645.2548743-1-alpic@google.com>
From: Alfred Piccioni <alpic@google.com>
Date: Mon, 18 Dec 2023 15:22:50 +0100
Message-ID: <CALcwBGDoEjyfAnYHaCCqULa+dwRyw3spHijUXwJ_LAQp=oV-pg@mail.gmail.com>
Subject: Re: [PATCH] SELinux: Introduce security_file_ioctl_compat hook
To: Paul Moore <paul@paul-moore.com>, Stephen Smalley <stephen.smalley.work@gmail.com>, 
	Eric Paris <eparis@parisplace.org>
Cc: stable@vger.kernel.org, selinux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> s/emmits/emits/

Fixed.

> It doesn't (or shouldn't) replace security_file_ioctl, and the hook
> doesn't appear to be conditional on CONFIG_COMPAT per se.
> It is a new hook that is called from the compat ioctl syscall. The old
> hook continues to be used from the regular ioctl syscall and
> elsewhere.

Yup, reworded to be more correct. Partially lack of understanding on
my part of how the ioctl syscalls were being made.

> I don't understand why you made this change, possibly a leftover of an
> earlier version of the patch that tried to replace
> security_file_ioctl() everywhere?

Correct. Forgot to go back and remove it. Fixed.

> By the way, for extra credit, you could augment the ioctl tests in the
> selinux-testsuite to also exercise this new hook and confirm that it
> works correctly. See
> https://github.com/SELinuxProject/selinux-testsuite particularly
> tests/ioctl and policy/test_ioctl.te. Feel free to ask for help on
> that.

I do like extra credit. I'll take a look and see if it's something I
can tackle. I'm primarily doing ad hoc checks on Android devices, so
I'm unsure how easy it will be for me to run the suite. I'll get back
to you shortly on that.

