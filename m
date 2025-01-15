Return-Path: <selinux+bounces-2742-lists+selinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 63C23A127A4
	for <lists+selinux@lfdr.de>; Wed, 15 Jan 2025 16:37:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9EDB81889CE2
	for <lists+selinux@lfdr.de>; Wed, 15 Jan 2025 15:37:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CBC2132105;
	Wed, 15 Jan 2025 15:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d/1keElU"
X-Original-To: selinux@vger.kernel.org
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4CBE86335
	for <selinux@vger.kernel.org>; Wed, 15 Jan 2025 15:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736955439; cv=none; b=IvL6VVGdMs+2Py2P6HLqxBJoBS70fkecaLdiIbDnEL8p3QP12saueksbX1QZgATiJuAWy1KlGkFIH1Zbzhx9B4gt5TIsWv60vNMWrvtznPmLKuafpvWlAQdi3wUME4VAWBMJA07tgGUrsaSi19/DnKoE1cEcMVN7oBqkvTd+3Yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736955439; c=relaxed/simple;
	bh=Zxfl3ga7AYE79KWf1Z+DSr22xOmiMDSxNKnRvrbSVbg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TziF8ZiYEYPCdDrk/815/jTwNWhudVJJGXhE63Iqg8wbb3zNCd1h/pClRdK2xbG8r8+XZO1XPsxQhblb52YV0GlcMiPeL1snPNfNeNOMWQAD4V7bWKC4YeXfMcctypqGrrWaFV0vKszGJuxNJvrOIifgQas5xf5LMhDw0qRAhrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d/1keElU; arc=none smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-4b1279ca1d2so2009189137.3
        for <selinux@vger.kernel.org>; Wed, 15 Jan 2025 07:37:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736955437; x=1737560237; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tm9SoNGMGHej3K6+PcQSLK9zTOjXgliCtlLLxQU3zU0=;
        b=d/1keElUe/hIWHsOLZM7UW4O55AmAx2fxOJzaXfezUhjEQ8UulvCqIt/NyaaZsFlyQ
         dOin8IJ2maj3GP2rn+fCUliwWjV7Ig2PCOA9zYeN4LpBljhIggFA1DhYk33ygE2C1Atc
         QeR6/USHSU3nSAyvCZK+uBh6o/eorOmju6UXvBwB3yZfLnFPouW/a4d+bNRwBkNK3GvC
         8G3CEUs0UWCuxWOq+32OtRiJ2SQItHAoQziZyLDA5eWV3H9tF34pej0xLKQ1BZRDRdDW
         7Ue82gX3mdebXuj0ThgAFV8rWo36RhUd75lUlD10i/y83XyLXN7wGazefvbLww7MMjRC
         0i/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736955437; x=1737560237;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tm9SoNGMGHej3K6+PcQSLK9zTOjXgliCtlLLxQU3zU0=;
        b=FTmhtIesMw5FSUfRoBcNWbx7hpok73rqXM5UoU62CNNJ3PaG662kP1ESx3J5KlWgFu
         f/iM5XghUqWkZHv31blC+7qy3eZUqboBhZf2KELNWFjMRcNpuAIPGquKHptRE1fjeJSB
         two9yBRqzsnAPElp+XT1QIuW0mDrxZPHeHhIYBbeTBoFML5yuAJBJGTZwnG65m4z6Fd7
         kCvC6136VkdEE6XWWcJfP6O7wWstutBM9CjOsrPmBaG45ReLbU4fHQsMesCCCTw8HYbN
         IMrNp0M1N44la9U0ktgWZCbdPK4TX+qs4MmzrW99Acyo14f79sL6tvVLHhjKZ43eXtZD
         EnkQ==
X-Gm-Message-State: AOJu0YwAZ3tRJu+wItOCTcemVNin7LpWNNA5sECtAc+SPCf18ZOOMfRj
	wEeEKxk98wbIKAK+sQFzzy4Om1hrRrRE8ui1nJONKlzY1ppVCH4dhIIsIijlNgIvglJLw62lDjn
	F3sd2Q4okmTSX4lEHoN8YbjB0IwBO7yHg
X-Gm-Gg: ASbGncsBsIck5NcOdqy6lSMJ6JbrF5NnRVFXNEMzaB0SRMw/RgRreQFCQt/oDBChLWH
	Iq/vJintMsHtfqH8CzL0roHhvjSDm/nXFFgoX8g==
X-Google-Smtp-Source: AGHT+IHZri1DS81DV4hfkzzDjbGO5jGBEpE4Z+VNZ8z0QLHtAJHDIvpJn+6KJk0uqMHGC97w1IcZxLeV6ycYCDGzKKY=
X-Received: by 2002:a05:6102:2acb:b0:4b1:11c6:d3c6 with SMTP id
 ada2fe7eead31-4b3d0ee45a7mr24301143137.5.1736955436662; Wed, 15 Jan 2025
 07:37:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: selinux@vger.kernel.org
List-Id: <selinux.vger.kernel.org>
List-Subscribe: <mailto:selinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:selinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250113213824.26000-1-dburgener@linux.microsoft.com>
In-Reply-To: <20250113213824.26000-1-dburgener@linux.microsoft.com>
From: James Carter <jwcart2@gmail.com>
Date: Wed, 15 Jan 2025 10:37:06 -0500
X-Gm-Features: AbW1kvaeDc0k5os5S5DHurwgewWec-emRSIb22lcReMaRjmSHMp2g0gT3tbDJ00
Message-ID: <CAP+JOzQPqG6DXH5025tpK9AG=MNoa-uALOBPjGkq7nmLrW3bAA@mail.gmail.com>
Subject: Re: [PATCH] CONTRIBUTING.md: Drop dependency and build instructions
To: Daniel Burgener <dburgener@linux.microsoft.com>
Cc: selinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 13, 2025 at 4:38=E2=80=AFPM Daniel Burgener
<dburgener@linux.microsoft.com> wrote:
>
> They are redundant with README.md, and haven't been kept up to date.
> For example, the CONTRIBUTING.md dependencies are missing the xmlto
> dependency.  Rather than try to maintain this information in two places,
> just refer contributors to the README and keep the CONTRIBUTING doc
> focused on high level process.
>
> Signed-off-by: Daniel Burgener <dburgener@linux.microsoft.com>

Acked-by: James Carter <jwcart2@gmail.com>

> ---
>  CONTRIBUTING.md | 9 +--------
>  1 file changed, 1 insertion(+), 8 deletions(-)
>
> diff --git a/CONTRIBUTING.md b/CONTRIBUTING.md
> index 7c548e58..e6a677a0 100644
> --- a/CONTRIBUTING.md
> +++ b/CONTRIBUTING.md
> @@ -23,14 +23,7 @@ using a custom policy please include it as well.
>
>  ## Compiling
>
> -There are a number of dependencies required to build the userspace
> -tools/libraries. On a Fedora system you can install them with yum:
> -
> -    # yum install audit-libs-devel bison bzip2-devel dbus-devel dbus-gli=
b-devel flex flex-devel flex-static glib2-devel libcap-devel libcap-ng-deve=
l pam-devel pcre2-devel python-devel setools-devel swig ustr-devel
> -
> -The tools and libraries can be built and installed under a private direc=
tory from the top level with make, e.g.
> -
> -    $ make DESTDIR=3D~/obj install install-pywrap
> +See README.md for instructions on how to compile and test this project.
>
>  ## Contributing Code
>
> --
> 2.34.1
>
>

