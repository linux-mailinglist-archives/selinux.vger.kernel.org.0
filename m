Return-Path: <selinux+bounces-529-lists+selinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A1984D843
	for <lists+selinux@lfdr.de>; Thu,  8 Feb 2024 04:18:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 13244B20A36
	for <lists+selinux@lfdr.de>; Thu,  8 Feb 2024 03:18:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 795781D698;
	Thu,  8 Feb 2024 03:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="RBYcfQLZ"
X-Original-To: selinux@vger.kernel.org
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84E3B1D52B
	for <selinux@vger.kernel.org>; Thu,  8 Feb 2024 03:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707362315; cv=none; b=S2FdHo7poM0O+LACiBVu1zS4DSkg2xEktoJ/KG6FqoGRPXSPiOMQEse21FgLH7Lz+qHDiziGTYaFtm53R0ieHTD7Xic7V/0B7Zf53DxV5tAuHll6RRXdIYkcvmlzvIpHZHZ+vViDfVjVhtwa5nZhS4nf9LPb38/hTUi93qopwnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707362315; c=relaxed/simple;
	bh=CwXu+mEYRI9NtMHVFqk3Ff2/WozQDRsM1R/qG5WWA8w=;
	h=Date:Message-ID:MIME-Version:Content-Type:Content-Disposition:
	 From:To:Cc:Subject:References:In-Reply-To; b=bcJ7/vLExo6K1CGoOHYITDAazgrTvGhQ9oZEufpaTvP9w7XTpDSKNif5w0/zytu8RCUZKXINJ7ZPcGSCICQPbyUjUxTU3ANAj/6+JTyUL5tEaVEVVbo+uEL9R0dU5ySZF81G5OmtYTSkZlxB4fnT3e2Uu3klcpqS131ZYFIl5+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=RBYcfQLZ; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-42a4516ec5dso9585181cf.3
        for <selinux@vger.kernel.org>; Wed, 07 Feb 2024 19:18:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1707362312; x=1707967112; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :content-disposition:mime-version:message-id:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hK0BeESH0EV8j47xzGv04cLJ4LIyRw2g36A76+PXBk8=;
        b=RBYcfQLZMf5lpVN7fxjLnX2DoVMoSKm+6dNz3zT+9CR45fEDT0NAvMtZmSWYMD0WS4
         Nuz1VPnBK2CSkLuq60y0qaUkH5HMvOqNC4oQDKnBTNQzgRohE84R1wN8HCGtViitA/Ka
         RPdOOsnku53l5/uKuBYdU9Jl7s3PAkEz+Hzb/FsdU036fCh0i0h4VlL4TeOi5v23o4eX
         K3lfzFTFg5KVng1ZPqzn1qT09KT/mFOyo7RBmSYBBIczy7V3B1qvf7RhqyQc2piqrP86
         Um5G5MhCFleg+gSRquvszS0DeHmMIfWHIIRmdhfgQaY5mzE4EfVCfHFdvo6QuVXyOW06
         3uMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707362312; x=1707967112;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :content-disposition:mime-version:message-id:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hK0BeESH0EV8j47xzGv04cLJ4LIyRw2g36A76+PXBk8=;
        b=Ed3V6k+EbmvmKC1fq4L/FE8nTkH7YXvEF3Am3OeIQscxwThgFR3CtXNxJ1kLkikL7q
         Gevw4RPl4Ab0MCjEM18/1N4QG2+I81wBh5zWU8/CKpN6vpi5HbXibqm05tTnJMetIuPP
         sE1xn1OBkFbOluDabS4t39SljjIuWYnQ/0jZd+d3aRJowiiUtiSPDB2O0ZVMZYVCwiOs
         zVw9UH7/jaJvcDav0iZahCaaC44sK7cJhkslECHCpwrE9neVzE6eOn2UwKoMKrxvg/CT
         V5JXTySLEm/G4vr855ZS8T/u9u2Flvjzr3Ea0dX7swgsGwTekZR+E2C8xvykUMkzbkyu
         GPrw==
X-Forwarded-Encrypted: i=1; AJvYcCUGOkVsNIaGMJ2zCVPbp0ABrfMegbwaRNGMf7PiL7kC4i/Zj6QbIos6gAlKu4P9gPuNP+bQLTK3P/YTjemSObBvRIlQJ08/1g==
X-Gm-Message-State: AOJu0YzCDk8CSYRH5CoQUp4XREqgkrJ96hZoETiXC0mjnKOjG1y/bD7q
	Drz2Qj+yCmjAt4lnr6TmV0wf37bPGc/VKr0iH2zR4WQ9qOR4s8bj4Ox8JWyYOA==
X-Google-Smtp-Source: AGHT+IGpZWRS7BciYc0E1wVHDo3UpmFl3VgGAmCTU/eLWbmLvCNB5DRi1BbJML+2QLswaRfYEk1Scg==
X-Received: by 2002:a05:622a:5094:b0:42a:8a40:e33c with SMTP id fp20-20020a05622a509400b0042a8a40e33cmr7154113qtb.57.1707362312345;
        Wed, 07 Feb 2024 19:18:32 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUevVJKwGdSjfdxiP74JGQH+dsVjTsQ22eS+EDgBhq5kdojHKMCot0Gi/z8CEm12WoDxxkC3fcVtiK1dC0B3jq9yqLGeT5IFivl8m7XQJWgO55sQ9GXn1H7Ahms5bxBd6ZCyxKAdFNl2BYS72MgAwJD8S9UW4n1izwi2zeo/x/6ETDHNdxssLHxhaFub0YwbvtgYkQ+Ts4QIs7hmF61Y0SEo7j5ZG0Xamly6PoTUHvENvAy+ub6SJ4HG1A22OmY8yClktBlY+zrwL3Ab0EVQ+0lI+ybXc96Pd02q8LtBA9SI8XhGCFyO4N68F6edRmx6KaVTqS3OPyjAl2iOkAN2e3UnfK9zHTj/4KCXUV9tyxtLZ9dbGoCXN1hn+ZmobXJRfCWvYks8nMbQXj8Wc/kf7EB42miI/kXnvD8VqHV5+s51PqtdtyrqA5Gz2WNVfPSdGXsBW0LACDd760AbQCozTmHErxN6lEAyEBt03J7rcruNSyNpM6Wn+umVt7c7/VVoivjVOXcU+sxKnheAA2vtSugW1dN38s2OpNzvrFgApBY/MxAf4nddsTPkXLHFoiA6ZYqJJm6Da0e955UOduupoYwOoj0vZF4IZQ8xNOty6rkZ5kRzAGJWo3Paz4OmvTnMBQ+nvI/304hJMLv9S+syJjaw7s9Ze27m3HM28DvziGUmI8ETXbrbIMjexxmysGJIMnpQa3tif2wEvfrl2D6BkN7Dh4pYcvIqjIkwq0sZLEIggav8FBhb83axn0lwmF0E59LNP182o3Lbhyu3ia5Liy98P3Ihe7jst+qOisYHc6KBfQD70sSyyITvsLhAF8CSzxECMO+c1DJ0NNdDiISpQJlXVfA1iJUidOs2SNjtGWBHBJ5cu10lvsZQwX6TACxjEwZhJo+WXEuJQIWx5uasUCUwLZyA6h3QHchFf9sBvNtRjPwoGvF
Received: from localhost ([70.22.175.108])
        by smtp.gmail.com with ESMTPSA id b24-20020ac86bd8000000b0042bed7dc558sm1071255qtt.6.2024.02.07.19.18.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Feb 2024 19:18:31 -0800 (PST)
Date: Wed, 07 Feb 2024 22:18:31 -0500
Message-ID: <d54ca249c3071522218c7ba7b4984bab@paul-moore.com>
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
To: Roberto Sassu <roberto.sassu@huaweicloud.com>, viro@zeniv.linux.org.uk, brauner@kernel.org, chuck.lever@oracle.com, jlayton@kernel.org, neilb@suse.de, kolga@netapp.com, Dai.Ngo@oracle.com, tom@talpey.com, jmorris@namei.org, serge@hallyn.com, zohar@linux.ibm.com, dmitry.kasatkin@gmail.com, eric.snowberg@oracle.com, dhowells@redhat.com, jarkko@kernel.org, stephen.smalley.work@gmail.com, eparis@parisplace.org, casey@schaufler-ca.com, shuah@kernel.org, mic@digikod.net
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-nfs@vger.kernel.org, linux-security-module@vger.kernel.org, linux-integrity@vger.kernel.org, keyrings@vger.kernel.org, selinux@vger.kernel.org, linux-kselftest@vger.kernel.org, Roberto Sassu <roberto.sassu@huawei.com>
Subject: Re: [PATCH v9 0/25] security: Move IMA and EVM to the LSM
 infrastructure
References: <20240115181809.885385-1-roberto.sassu@huaweicloud.com>
In-Reply-To: <20240115181809.885385-1-roberto.sassu@huaweicloud.com>

On Jan 15, 2024 Roberto Sassu <roberto.sassu@huaweicloud.com> wrote:
> 
> IMA and EVM are not effectively LSMs, especially due to the fact that in
> the past they could not provide a security blob while there is another LSM
> active.
> 
> That changed in the recent years, the LSM stacking feature now makes it
> possible to stack together multiple LSMs, and allows them to provide a
> security blob for most kernel objects. While the LSM stacking feature has
> some limitations being worked out, it is already suitable to make IMA and
> EVM as LSMs.
> 
> The main purpose of this patch set is to remove IMA and EVM function calls,
> hardcoded in the LSM infrastructure and other places in the kernel, and to
> register them as LSM hook implementations, so that those functions are
> called by the LSM infrastructure like other regular LSMs.

Thanks Roberto, this is looking good.  I appreciate all the work you've
put into making this happen; when I first mentioned this idea I figured
it would be something that would happen much farther into the future, I
wasn't expecting to see you pick this up and put in the work to make it
happen - thank you.

I had some pretty minor comments but I think the only thing I saw that
I think needs a change/addition is a comment in the Makefile regarding
the IMA/EVM ordering; take a look and let me know what you think.

There are also a few patches in the patchset that don't have an
ACK/review tag from Mimi, although now that you are co-maininting IMA/EVM
with Mimi I don't know if that matters.  If the two of you can let me
know how you want me to handle LSM patches that are IMA/EVM related I
would appreciate it (two ACKs, one or other, something else?).

Once you add a Makefile commane and we sort out the IMA/EVM approval
process I think we're good to get this into linux-next.  A while back
Mimi and I had a chat offline and if I recall everything correctly she
preferred that I take this patchset via the LSM tree.  I don't have a
problem with that, and to be honest I would probably prefer
that too, but I wanted to check with everyone that is still the case.
Just in case, I've added my ACKs/reviews to this patchset in case this
needs to be merged via the integrity tree.

--
paul-moore.com

