Return-Path: <selinux+bounces-965-lists+selinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF9288F329
	for <lists+selinux@lfdr.de>; Thu, 28 Mar 2024 00:26:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CF96B1F27F4F
	for <lists+selinux@lfdr.de>; Wed, 27 Mar 2024 23:26:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E5FB1553AE;
	Wed, 27 Mar 2024 23:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="JQNepPW7"
X-Original-To: selinux@vger.kernel.org
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9875154C05
	for <selinux@vger.kernel.org>; Wed, 27 Mar 2024 23:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711581987; cv=none; b=Xmc1E1bJpAIaK8jM8YK85pLsoUSliIorI7D32LEppGGZ8rRR/dZEdoaFJPOKss8cEeW1XPSVYTsD34sfB7VO8R1PGTPvL34f4NI4Prvqp3lPGVRejM76vzMuxeD3yWMYvw+b2NLk3+eoLxd7+hgVTbOawCDVqvwyHsHkLeoBgZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711581987; c=relaxed/simple;
	bh=+oCABmCPcwsGI+OhvQ5+d6UIKy/f+/yNNpmYX+NieJY=;
	h=Date:Message-ID:MIME-Version:Content-Type:Content-Disposition:
	 From:To:Cc:Subject:References:In-Reply-To; b=kmIrQ4wjbteiy3E+hpfg2N2s5VxBW9VkFpzfQqazVlXYWm/3v53tMQZpjkq74WP/oqMaOCaB+VOazHI55hemrXLR8IBntUpELBkhlmJwW5lw5a8u8hA1EdM1mbFgOGUs0j38ilmN55YYaYHSYUBM/A5Zfaab9keTL4Wf/eCDhno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=JQNepPW7; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-430c4b1a439so2051331cf.3
        for <selinux@vger.kernel.org>; Wed, 27 Mar 2024 16:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1711581984; x=1712186784; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :content-disposition:mime-version:message-id:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gqkZ3v0W1Swr1887NZEacpasAkv1jS/mgA7NWhO8GpI=;
        b=JQNepPW7vDsJNSH4p6RKkvKnojO92Puk+tn77PZ/YicU8UM83rG7TsxDxxOngz8duk
         01BVL6WBSklDqX5YXvFGVf2UiRN6K4jXvj1kDtkY50TkVb0R4/jOIk0J6J2uqT3oKq1w
         hCLA0mFrjvAGs6Mim2c7z7npV0Higph9DQBWrCuL2LclpmT3QzB0KUmbkY8WJf4bAOBd
         mcaAafqyJQ9CucEfnRBZ3s4kqr1OBuGVQREBuf3J77lmcHaeb0cHbLQXLRTixTBHG2dm
         69WMayd8/yxSYgpz9nztuDGAYHWzY2l5yL+vWMJwR9oJRk3bJc4QHGUg8FLBARXsNqdm
         FsaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711581984; x=1712186784;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :content-disposition:mime-version:message-id:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gqkZ3v0W1Swr1887NZEacpasAkv1jS/mgA7NWhO8GpI=;
        b=hYOgSw9SZARDeVLD/g8dPR8xe/tAcOjqoOaRYlACFwt5b7CeZ6auuFmw3iQCMTqeUu
         29Gh4jd6oxvDAkY7XdW99v2ML82ixDCmuIX+LovFMO2SHhRqW3zQEoiHghezE25Knj7y
         1mI8uBqdvrNjwUnPou7WXmuXQ7FlxJqxmmg9hLmhtqBWKcalJ4tug14iRyJpL8yAxFN9
         POF3IZK+y2GNCzSNGzCbLDYAz+XFqHqcvCQI8wfAJ2VjaFboVzt9pWMS46z62qUlaDYt
         W4siGwRAumxbIoGw4TJLcpok4EZwpBKLypUDqV5M3oX0qOcQPVQv++25ylhoZQp/LeIS
         qFSA==
X-Forwarded-Encrypted: i=1; AJvYcCUXy0WN4mKpoMKQFenJTbXMmVm45OgLfHgIuvNIDqokNToRo1rPLpvgbRFg1KxFpSmw7z5bM+sFWQSM53HPgLdqtlOm2hrz/A==
X-Gm-Message-State: AOJu0YwXg4qYITUTrzjc7C5AQ5IygUhDIp31FUfsuoDI+mr1F9nJ163E
	IFFHW6I7skwJeZNSFg6JKa+eKdIGdxiANYxlsd5UzdNmCRetiCc8xG5XVpsH5DWtzVfZKa9mQwg
	=
X-Google-Smtp-Source: AGHT+IGHHtvVIRpffHHM8Wdp7ieP8QGpfN/LOSUG5hir/HCGtrR8F2jvWgTd2q8lMFIIPMJ0RMrQMA==
X-Received: by 2002:a0c:8e01:0:b0:696:a7f3:92fd with SMTP id v1-20020a0c8e01000000b00696a7f392fdmr935941qvb.65.1711581984604;
        Wed, 27 Mar 2024 16:26:24 -0700 (PDT)
Received: from localhost ([70.22.175.108])
        by smtp.gmail.com with ESMTPSA id me18-20020a0562145d1200b00696a03c6bc0sm90410qvb.7.2024.03.27.16.26.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 16:26:24 -0700 (PDT)
Date: Wed, 27 Mar 2024 19:26:23 -0400
Message-ID: <eef33b146490969c6741cefdf353dcf4@paul-moore.com>
Precedence: bulk
X-Mailing-List: selinux@vger.kernel.org
List-Id: <selinux.vger.kernel.org>
List-Subscribe: <mailto:selinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:selinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 
Content-Type: text/plain; charset=utf-8 
Content-Disposition: inline 
Content-Transfer-Encoding: 8bit
From: Paul Moore <paul@paul-moore.com>
To: =?UTF-8?q?Christian=20G=C3=B6ttsche?= <cgzones@googlemail.com>, selinux@vger.kernel.org
Cc: Stephen Smalley <stephen.smalley.work@gmail.com>, Ondrej Mosnacek <omosnace@redhat.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] selinux: improve symtab string hashing
References: <20240315181414.649045-1-cgzones@googlemail.com>
In-Reply-To: <20240315181414.649045-1-cgzones@googlemail.com>

On Mar 15, 2024 =?UTF-8?q?Christian=20G=C3=B6ttsche?= <cgzones@googlemail.com> wrote:
> 
> The number of buckets is calculated by performing a binary AND against
> the mask of the hash table, which is one less than its size (which is a
> power of two).  This leads to all top bits being discarded, requiring
> for short or similar inputs a hash function with a good avalanche
> effect.
> 
> Use djb2a:
> 
>     # current
>     common prefixes:  7 entries and 5/8 buckets used, longest chain length 2, sum of chain length^2 11
>     classes:  134 entries and 100/256 buckets used, longest chain length 5, sum of chain length^2 234
>     roles:  15 entries and 6/16 buckets used, longest chain length 5, sum of chain length^2 57
>     types:  4448 entries and 3016/8192 buckets used, longest chain length 41, sum of chain length^2 14922
>     users:  7 entries and 3/8 buckets used, longest chain length 3, sum of chain length^2 17
>     bools:  306 entries and 221/512 buckets used, longest chain length 4, sum of chain length^2 524
>     levels:  1 entries and 1/1 buckets used, longest chain length 1, sum of chain length^2 1
>     categories:  1024 entries and 400/1024 buckets used, longest chain length 4, sum of chain length^2 2740
> 
>     # patch
>     common prefixes:  7 entries and 5/8 buckets used, longest chain length 2, sum of chain length^2 11
>     classes:  134 entries and 101/256 buckets used, longest chain length 3, sum of chain length^2 210
>     roles:  15 entries and 9/16 buckets used, longest chain length 3, sum of chain length^2 31
>     types:  4448 entries and 3459/8192 buckets used, longest chain length 5, sum of chain length^2 6778
>     users:  7 entries and 5/8 buckets used, longest chain length 3, sum of chain length^2 13
>     bools:  306 entries and 236/512 buckets used, longest chain length 5, sum of chain length^2 470
>     levels:  1 entries and 1/1 buckets used, longest chain length 1, sum of chain length^2 1
>     categories:  1024 entries and 518/1024 buckets used, longest chain length 7, sum of chain length^2 2992
> 
> Signed-off-by: Christian Göttsche <cgzones@googlemail.com>
> ---
> v2:
>    add licensing note
> ---
>  security/selinux/ss/symtab.c | 22 +++++++++++-----------
>  1 file changed, 11 insertions(+), 11 deletions(-)

Merged into selinux/dev, thanks.

--
paul-moore.com

