Return-Path: <selinux+bounces-374-lists+selinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AE237832243
	for <lists+selinux@lfdr.de>; Fri, 19 Jan 2024 00:30:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D799A1C221F7
	for <lists+selinux@lfdr.de>; Thu, 18 Jan 2024 23:30:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83A1F1E526;
	Thu, 18 Jan 2024 23:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="b2USuHK8"
X-Original-To: selinux@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D47061DDF6
	for <selinux@vger.kernel.org>; Thu, 18 Jan 2024 23:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705620622; cv=none; b=oeKUPGFLw6qDnvSmCoOl52JP1jzzIa0q8dnoDyWaFjYlpLA4xBJ3USBOc1XRNMDy5tDgFxlSRKO1oNyzrGWf1ZZquD+DpQaP4wSoaeFEQYTBZVypRqMnn/RSyGqdfNn8Pnclc0Gpoh4hsPWJ0BKqLf2FDwMey5wnq9ryE1EwuEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705620622; c=relaxed/simple;
	bh=z5fPf7zN0RtXmSKi8h8UwIiB1VTg5/bPLOeaIMJh1hA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IOFVI21NdqP3+lUhWpIMG/nOMCkcW+Y5VBDlCOEGwTAId2SofsPqGDoy7D044uUQ6KMQVROtoKcaicCrptV7faKNZHXJYU9/J+a/9QTPWqMYHMkFI+WLc5mUocrF0E/I11n/PXXrGvs2SCQN5C+nTtWNmvimAtM0PU8eGrcA3CA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=b2USuHK8; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3368abe1093so126220f8f.2
        for <selinux@vger.kernel.org>; Thu, 18 Jan 2024 15:30:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1705620619; x=1706225419; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z5fPf7zN0RtXmSKi8h8UwIiB1VTg5/bPLOeaIMJh1hA=;
        b=b2USuHK8iK7DMZDGYMC+kPDshk32tuLAUEMRcaqF5D54H+Vbc4vaGk7eV+AgqfB3Av
         58ZJqHTb+GHSopV6zWwRPyc64mrwwMNGw7HiUWN1+l0VP45wF9TQ0pLcs6g9U8jmrVfn
         8IIEeQVSI69/tmAbqSg74cE9zNfODO443jdwV1lgJ3n1LdG5LktdhzUFfTEA6YTeDzLz
         QqjJSYxh0Fc1PVWVJR45CCuLfOmx/FccDSrGhPueYbVYgyP8mIhUO0/z2Zi7EX3DSC78
         9NCgFvkx4RVZpS+xCXc/xPS2/6nFE4GC6H6rlpu2hIMcBwpA57AtKoSYxc3x5p7PaJhT
         9JWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705620619; x=1706225419;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z5fPf7zN0RtXmSKi8h8UwIiB1VTg5/bPLOeaIMJh1hA=;
        b=GYUBGPxmFClnYBnXof7+RejU4/7UHb8Oqd4u6oEkR2y9eOhySsDIecApr7tjfAk/hp
         BtxdnY9/d3ui56GlmH1tnpdSxQruCrAUZYSHT/Poic8Wg7yMYOftVZAuAhhDs8UhDAmb
         uvQ3+VW1Y3jnt0cQUH95+ZlOmkmxk+1OayD0xbp/1U1yWPcMgXqZAppyKm+XF7aWQJdX
         6oBFQ2a6yWjn0mWIdsfvZ3v+oi0moF3XYc6Z7NdyP5/2ROgcH3R+csPv1cxeAyDUAB/P
         76lXBJJhYnoktOdXgjXQKx7zD6vRaEB4DCN8UtZ9M2OaXp5yhKsdbRMqDH6+Yf+2MUGj
         z1YA==
X-Gm-Message-State: AOJu0YwjjCB6ZuPr3hhlLUt0hrPCiE1qXCxLvacozfiVvRIdR2Os5+SI
	gzRvx8UZgCXmdPd92wucJBPoeVYQ4V3yb3+DRIEkeLV8BqgJU92telSmYS25+5Dyi7IPE7MYPUc
	DSM+bf8lg6yi4qldwiyM1HkqPz5IFg7V2uyk2
X-Google-Smtp-Source: AGHT+IERBKIRZXhUEwT/FvY141cn7UHvj0sDW/KQK0D2C8nJKn7gUoNFHy2qzmo8U2RTdv+h1bRnz1oyiSScKyNcOhE=
X-Received: by 2002:a5d:5092:0:b0:337:c117:10c with SMTP id
 a18-20020a5d5092000000b00337c117010cmr1049929wrt.113.1705620618937; Thu, 18
 Jan 2024 15:30:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: selinux@vger.kernel.org
List-Id: <selinux.vger.kernel.org>
List-Subscribe: <mailto:selinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:selinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240117223729.1444522-1-lokeshgidra@google.com> <20240118135941.c7795d52881f486aa21aeea8@linux-foundation.org>
In-Reply-To: <20240118135941.c7795d52881f486aa21aeea8@linux-foundation.org>
From: Axel Rasmussen <axelrasmussen@google.com>
Date: Thu, 18 Jan 2024 15:29:42 -0800
Message-ID: <CAJHvVcgcRVB75oevri-KH3=cayez7Wjn=G3nXkuO36r11Y98zQ@mail.gmail.com>
Subject: Re: [PATCH] userfaultfd: fix mmap_changing checking in mfill_atomic_hugetlb
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Lokesh Gidra <lokeshgidra@google.com>, linux-fsdevel@vger.kernel.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, selinux@vger.kernel.org, 
	surenb@google.com, kernel-team@android.com, aarcange@redhat.com, 
	peterx@redhat.com, david@redhat.com, bgeffon@google.com, willy@infradead.org, 
	jannh@google.com, kaleshsingh@google.com, ngeoffray@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Apologies, I had forgotten to re-check the "send plaintext" checkbox
in my e-mail client, so the mailing lists rejected my previous mail. I
am duly ashamed. Allow me to try once more. :)

On Thu, Jan 18, 2024 at 1:59=E2=80=AFPM Andrew Morton <akpm@linux-foundatio=
n.org> wrote:
>
> On Wed, 17 Jan 2024 14:37:29 -0800 Lokesh Gidra <lokeshgidra@google.com> =
wrote:
>
> > In mfill_atomic_hugetlb(), mmap_changing isn't being checked
> > again if we drop mmap_lock and reacquire it. When the lock is not held,
> > mmap_changing could have been incremented. This is also inconsistent
> > with the behavior in mfill_atomic().

The change looks reasonable to me. I'm not sure I can conclusively say
there isn't some other mechanism specific to hugetlbfs which means
this isn't needed, though.

>
> Thanks. Could you and reviewers please consider
>
> - what might be the userspace-visible runtime effects?
>
> - Should the fix be backported into earlier kernels?
>
> - A suitable Fixes: target?

Hmm, 60d4d2d2b40e4 added __mcopy_atomic_hugetlb without this. But, at
that point in history, none of the other functions had mmap_changing
either.

So, I think the right Fixes: target is df2cc96e77011 ("userfaultfd:
prevent non-cooperative events vs mcopy_atomic races") ? It seems to
have missed the hugetlb path. This was introduced in 4.18.

Based on that commit's message, essentially what can happen if the
race "succeeds" is, memory can be accessed without userfaultfd being
notified of this fact. Depending on what userfaultfd is being used
for, from userspace's perspective this can appear like memory
corruption for example. So, based on that it seems to me reasonable to
backport this to stable kernels (4.19+).

