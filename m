Return-Path: <selinux+bounces-543-lists+selinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B74384D8AA
	for <lists+selinux@lfdr.de>; Thu,  8 Feb 2024 04:23:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 47F4C28440A
	for <lists+selinux@lfdr.de>; Thu,  8 Feb 2024 03:22:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 658A33717A;
	Thu,  8 Feb 2024 03:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="R6P81ANE"
X-Original-To: selinux@vger.kernel.org
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 724D62E844
	for <selinux@vger.kernel.org>; Thu,  8 Feb 2024 03:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707362332; cv=none; b=DLRIi3hWcd3pF/aMWiT95Cp+yOvsX/RBxGDYxT3ZcRLCCtLMtkXJ5NstJzpDH+YsW6o3lTlL2izh3e+I7YYqXVlduMSsLWbIEnlnabpn7+4iJyYqCCuuhin7HIwfiK9QcU5drP8LVlgUIWVVC7b7rYxbLoQgIk6aAWam94DImTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707362332; c=relaxed/simple;
	bh=9MBr+RMrpbGZsgM1uUdKh5KZRYI7kg3buUw7CDt16OI=;
	h=Date:Message-ID:MIME-Version:Content-Type:Content-Disposition:
	 From:To:Cc:Subject:References:In-Reply-To; b=pnWyKbjEgkKC+GDnbyxhEsCG9mVRT89wTAOXUKhoJ0KxGGwYG1fzuNX4hbceBn+CgxcbSwYoi2hOIJmPWXPPzojNTsFVLugbzOXLCOaGbTtzDh4kF28z5PESs6GnuJL6sUQ1pPSAsSXeeE55Ytt87FIIXMRPJFVKUioW1R/4P88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=R6P81ANE; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-68cc87d4aabso1318816d6.1
        for <selinux@vger.kernel.org>; Wed, 07 Feb 2024 19:18:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1707362327; x=1707967127; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :content-disposition:mime-version:message-id:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=O7fQSgVt/E7Pqy5yj+eKD+U24pcDYXGXrM2DO75hYp0=;
        b=R6P81ANE9DyTlwDgT+tZdgm5f+FTIVqxPlTneEGvxzueDdsIasj0Id4SamS8AH/4An
         ymMEuuPqFqARvlvlZUuFFzzWtT2Mxcka+EQBCVldY6JDV3QwsjVM0Tfh5kV8PhBbo0Nx
         pVf7BNt0Op5EmotLOHbSCDbJyIKcQIrDIM2L+iP2x1hxQT8Z6ccpglGmdcoINsNpS9y1
         7ccEJpDipzR6i1ycpSiGhxDcbTLpUe3xqycrem+Iu6R8K1aCsOsK0civRfaiV0sv18rw
         G8cMbrS4Q8FaybDERvJAt/XfNrEYeXvk0AhlJEYxy9tS2rrSI+jJ6/O/9ymQC0+4BEDh
         l4ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707362327; x=1707967127;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :content-disposition:mime-version:message-id:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O7fQSgVt/E7Pqy5yj+eKD+U24pcDYXGXrM2DO75hYp0=;
        b=IYcYbvZQ1Wy1BaWCBY3eHKpo4Vn3Q51o7wPpC83veexOnxv4UnXogr16ErXRlOi17g
         FQ4xA3adbdW0M2XVa+AuK2ITzmB7pRSRUD/OpNv54SZXKzsZsb4mYwp43h4a3KlhCvyc
         i9soa6HCuGz7LmM7wB+CwyxbtOQUzPv1IMTsLM4DF9XlO55p/bEbk7FNxQiIJriOZiNz
         5FSSR6uNns+mYUSFUBT930KxlytGLlWUeV0PGYSHQS/VO8b0vbSTeWbAbMEoIMF+qj/N
         1RfliFgdj1QrwCOmwm7x1WZPK17bQmFu9qBVr/QzVMZWCpaCS8CUBM1H8xItoCXu44qX
         KiMg==
X-Gm-Message-State: AOJu0YyHhfdqkh0mbOIIi5RvRfgxEIgyAdTR4+bNVhgskSjbb20M8ZtA
	lDhEcskeyPTTtdU16rUgi7/9AdZFCxOQ1RS3M9m2KYbBCTVlRrdpvL/hepCd+A==
X-Google-Smtp-Source: AGHT+IEg2jFuD33qS6tDJsMUauoak+5M3TUvs37Ud043Ss8E8vI85dIo7hUTabiYfP4Deso0lkrPFA==
X-Received: by 2002:a05:6214:260f:b0:686:7256:c9f4 with SMTP id gu15-20020a056214260f00b006867256c9f4mr10855029qvb.9.1707362327320;
        Wed, 07 Feb 2024 19:18:47 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVi3gO1izPeIA/OC5xdbEjweQkU7vk98P9KgyNvjhyv44xwmGNol5Rd//WWoZucdmEstslipX1kJD+Um2MGVgkHystyYQ3F6gklDGcTngACsJLZN3JTz+wsOkwtyqPy171QyMyTNtoMmAqp2YjsKEBSR5YKGpEDHkhHkGA6xZ98WdSCJL45A5As/kwz831Hh35q1Ul9B6yi5DN1Diq7uGnIz+i7VjJgiB3HaPzUOC6IYXt3yPMxsye9o2w6FtqUfab5yGRmeaOr8GYjznCyBJ9M72Z/QmIa1nucm8boNSvGcnp+P1HzZwjMNdI2VxeoJ3DbqzTLZShcg3pBHHLe9xKfiCr5QJRxLpcte3YtgzjFtknPPsnzUsdiR+C89o+wp2n/pA2hLEF6h44sxjqrECq0lUDr/3U/D5L8uis3wJjSeOK0h1Axk2R5z7yXQFpg8AGJn3EwRkMf9y6AGV9LRqWH16ahTzyJsJ7C93FiFNGfuGuzJdnxTAhfHAVAP3rqMh80ZaEPu2BJynMmN1k+CjpEEFCcEoPE/MG1inaHSiewoBxgAmd9HWTx+l123aMLrwpBEWspTZP/xcgnJb5b8wkddvNH/7q6zLTBB5xGKPCz10yblh8LsphhG/GsVzEB8MePk9dk/DJPrjSnZCf85rmplvGT5tzhhwsdtbvCiva2XWU4Q7bwRKe1sRP77LWKyzqrsEa0tuQNE6NBf61KJJrrScQjnzo5Sw1BMuhW8Mag2clgERWpXuQwCz42EU7i6yT0lKB9uzS2HTm1Yw/LhnUn1u0Mkod7TfAVZJW8AqgyN9xQU2tH10qKDxRdzZ1mz1NBjZbnwlRVCc/udCK1UGp8wkUeuny6NP3CFnstxGbS4U1XiChi/BvIsmT16OGPd5S/RNY+U/4s0OKoc+3u5sMzv45XvIHkwKXnDXjQZ+ASBwW+WFNl
Received: from localhost ([70.22.175.108])
        by smtp.gmail.com with ESMTPSA id os47-20020a05620a812f00b00783df78821dsm1079337qkn.25.2024.02.07.19.18.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Feb 2024 19:18:46 -0800 (PST)
Date: Wed, 07 Feb 2024 22:18:46 -0500
Message-ID: <5b4c8041ca471b8a9bb76a8409927d56@paul-moore.com>
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
Subject: Re: [PATCH v9 15/25] security: Introduce inode_post_create_tmpfile  hook
References: <20240115181809.885385-16-roberto.sassu@huaweicloud.com>
In-Reply-To: <20240115181809.885385-16-roberto.sassu@huaweicloud.com>

On Jan 15, 2024 Roberto Sassu <roberto.sassu@huaweicloud.com> wrote:
> 
> In preparation for moving IMA and EVM to the LSM infrastructure, introduce
> the inode_post_create_tmpfile hook.
> 
> As temp files can be made persistent, treat new temp files like other new
> files, so that the file hash is calculated and stored in the security
> xattr.
> 
> LSMs could also take some action after temp files have been created.
> 
> The new hook cannot return an error and cannot cause the operation to be
> canceled.
> 
> Signed-off-by: Roberto Sassu <roberto.sassu@huawei.com>
> Acked-by: Casey Schaufler <casey@schaufler-ca.com>
> Reviewed-by: Mimi Zohar <zohar@linux.ibm.com>
> ---
>  fs/namei.c                    |  1 +
>  include/linux/lsm_hook_defs.h |  2 ++
>  include/linux/security.h      |  6 ++++++
>  security/security.c           | 15 +++++++++++++++
>  4 files changed, 24 insertions(+)

Acked-by: Paul Moore <paul@paul-moore.com>

--
paul-moore.com

