Return-Path: <selinux+bounces-539-lists+selinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B8DF84D889
	for <lists+selinux@lfdr.de>; Thu,  8 Feb 2024 04:21:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DA29DB20B82
	for <lists+selinux@lfdr.de>; Thu,  8 Feb 2024 03:21:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91FFD28DAB;
	Thu,  8 Feb 2024 03:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="CckRshft"
X-Original-To: selinux@vger.kernel.org
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FE2B2CCD5
	for <selinux@vger.kernel.org>; Thu,  8 Feb 2024 03:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707362327; cv=none; b=lWJU2LPr0kwu8XI45Si+yIMJ4TCbae0QA7OFlsopuI7cIPhITBHCnifPJro4jXTuPWNoGkVALcDp6Iyp19t8FONWBc1CsuoynJht8pDMFiMQo4gDCbrudKJ0f0rsTXOWu4OBTwEAJ8HkmI059hoSWRFzhkMEL2Vwt17SfVNFCik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707362327; c=relaxed/simple;
	bh=qUZDZYdcOVyNAYycr8p0bXQZRB4zjl1lrkTSLJknVNw=;
	h=Date:Message-ID:MIME-Version:Content-Type:Content-Disposition:
	 From:To:Cc:Subject:References:In-Reply-To; b=qfMF2t4op0Sm8K7TRbH+PikiYG1tQNma1kB4Zm0BKq79lUQI2nSHuAjtNDXwMrMkeIOmaywF5Yh1gzeDqZCwpJmDStd9+IcnL4jtYIXLsCm6GvQ2vXWSHBPsnvlPABEgayFbnfxAWXlGS+gpW3X5Ei36U1eJD0zmniR+vT7mRak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=CckRshft; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-42bf29aff0dso9095751cf.3
        for <selinux@vger.kernel.org>; Wed, 07 Feb 2024 19:18:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1707362322; x=1707967122; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :content-disposition:mime-version:message-id:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8ZeuYHwDTViLa8vRHQu+TwTZjS19Db+fh3Y1+BuGrUE=;
        b=CckRshftgxsuiAC+M2ek53zQ9OTCYQyT9deqh8QOSMRm0aTQa2ViPunx0zwxPcw9UJ
         hh6AUvcfNmi+4m9yj7S/Eh2VlJ6TTO1qy3aIsyNlYBaUrErqI71wWHoUfh62CzNbBS/6
         GIfcaMn3wWQEvCcd3TTqTNQsk2v8Xw/utSVSYldzisksu0qpH7PTbEOwOkAyRHJ70hdc
         xdCN3uZcX5Tu+Obu3uCGf5XTk94T6+YWeY1bjLVU8BQtwOBRSmjr2Jv+0w6ThF9hk3yB
         yXGZIz9ORP+DbewZuNlg9Y0HaJ23p//PeQmQSc5AOui+dp9e1/5Z0Rae/hT7G8PDHgnT
         mQXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707362322; x=1707967122;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :content-disposition:mime-version:message-id:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8ZeuYHwDTViLa8vRHQu+TwTZjS19Db+fh3Y1+BuGrUE=;
        b=tmY9t4EsLrM42aC7lYoRZUuunpCBcrYkah/kRFvIS1Q9LmFIOw+1aNJWboT0gbwgll
         rDX9Cz5zMGABGTn1/zIf0AOG8+upmeAQtsYmykP8mYZb1xg54GSf7Iq3M6jpScxT6rIf
         7qJ9LGXpjgnxYy16gzzgVIY6iMlB5qqSVM6CiD+tK6bFygU6oJGYG9jOWJnPJWAcKY9C
         C9A/k3OckqRLSivtiX3wXkdKacwJdcVqg95YMH6N4Om/0E2TAKatKvaETw3tevo+oTtI
         przChOdo19G8Buz5qLJi54W+rCJWNzmBhN76AXO3Q3T6swuiywdJw8lIhjIEMAmvZ0OB
         3XMg==
X-Forwarded-Encrypted: i=1; AJvYcCUcPtHrlX0BiQ8iqOXFYWe0LJ935Th0THezxc0uMewXBVpQJGQLpp/QKTyMsUCLZnxFwVuyQ4h48jZuAC7/LK03OBjfeTi7XQ==
X-Gm-Message-State: AOJu0Ywt8Czyd4Y8TlDaO88TaRUg07FUgo9iDaAWUarz1qfPqXCN7Vj8
	jTHnSloL85sJUy3c4hKjVaxCq0wr8vjG13WCPakL0MUU/AR9CBWLyETpLJl1rg==
X-Google-Smtp-Source: AGHT+IG/vE6Y3quAxigmo06IFrijykZF+p8TmHij4Lfj9qURwEQgMHkq95MWxa6e33AEBQA2JmKJmA==
X-Received: by 2002:a0c:f5c9:0:b0:68c:68bd:b724 with SMTP id q9-20020a0cf5c9000000b0068c68bdb724mr5886949qvm.4.1707362322287;
        Wed, 07 Feb 2024 19:18:42 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU2IFuzewHpOKoXct9biVe9fWJEFffQvwxzMpaN1wh+C/EnyyepGQBPLjp45QoGsjpyirjMktBsMFeDf6NW6o9Pr2idgN9X96q6u6e3DM3H5me7IwzUq/ipNM/QwS1aSWYi3g/t12cwEC0Q8qzY89IYK3dLa1jrEwjM7OMfXILsgci41LWkT5ZRQU6wdshoksbhiTaqQ7IW/mdsqx/kTXRVwVEQX/19e/T5wYZSCezGU0M6gL+Hhfa4fsHAHdGDpLOjkPeKkM52pcIz9pbSMhnyPgDvWKrb4YcWQGI+4twYhExFQZWCQjMp+lc0qpZ2LYsP5RkFaLP1z1MR+h0nb+Lg4T8QJRrLVv0RRJobApHCn6qRe3FNzXgM2gU1GtbvVU2eCX79XY/83uEQR1JHgHaUurCCPRscWlwzpQmfNjGdfj6Y9F4eGNU9fjGGnxjuBMRBcqqQqKmOyK2B55Z63c2brzpgOijagpTSP+QKIBbN/f6XmGA7t8ZQHLlUXni5XzgZu2FQIgcU53BrtwmKXuegw3dlFQ4Sswt9NFQ5xASS56zyD68ZrXmUbUFaNi4Gd7jAafkUD3JRXPmh6yRBbV8BWmeV3brLN2jf845BXl8GvX8mUowsiLKf8MXwp1Lot36skDUC94fjl1g00hjQfJOoLp3mhSJkAlPbQzBRRdoFuIogtk/PpHsx0vOsHD8AjJ1K2CJZDj+jq9ad+KrZL7TqzIJXL9XB1QCuBnKAjaaW4/+qn5WKLhALEs2kuyhYJzVfTwdlYE+btVT7Wn+fdc5wE2L7KtWaS+skXLtfT13HOd+Iih+aNYi5OwgGZMuFmzoMSIUDcXgMPKFbwqkG9ThgcSTO3eVaH/zLJiNsMD2rZJzo0ok4yTMoSL/gtKrfOI7xQJ+nolZAQ1W3wUnX5wnkDh0fEJi1yrkCExvuvQ9HddPpUDnMbUfXnihNzhQciGYsH8
 EculpBbu/6nEY=
Received: from localhost ([70.22.175.108])
        by smtp.gmail.com with ESMTPSA id nh10-20020a056214390a00b0068c4d8a9dcasm1171654qvb.140.2024.02.07.19.18.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Feb 2024 19:18:41 -0800 (PST)
Date: Wed, 07 Feb 2024 22:18:41 -0500
Message-ID: <512191c5fea825fa2020600807a6816f@paul-moore.com>
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
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-nfs@vger.kernel.org, linux-security-module@vger.kernel.org, linux-integrity@vger.kernel.org, keyrings@vger.kernel.org, selinux@vger.kernel.org, linux-kselftest@vger.kernel.org, Roberto Sassu <roberto.sassu@huawei.com>, Stefan Berger <stefanb@linux.ibm.com>
Subject: Re: [PATCH v9 10/25] security: Introduce inode_post_setattr hook
References: <20240115181809.885385-11-roberto.sassu@huaweicloud.com>
In-Reply-To: <20240115181809.885385-11-roberto.sassu@huaweicloud.com>

On Jan 15, 2024 Roberto Sassu <roberto.sassu@huaweicloud.com> wrote:
> 
> In preparation for moving IMA and EVM to the LSM infrastructure, introduce
> the inode_post_setattr hook.
> 
> At inode_setattr hook, EVM verifies the file's existing HMAC value. At
> inode_post_setattr, EVM re-calculates the file's HMAC based on the modified
> file attributes and other file metadata.
> 
> Other LSMs could similarly take some action after successful file attribute
> change.
> 
> The new hook cannot return an error and cannot cause the operation to be
> reverted.
> 
> Signed-off-by: Roberto Sassu <roberto.sassu@huawei.com>
> Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
> Reviewed-by: Mimi Zohar <zohar@linux.ibm.com>
> Acked-by: Casey Schaufler <casey@schaufler-ca.com>
> ---
>  fs/attr.c                     |  1 +
>  include/linux/lsm_hook_defs.h |  2 ++
>  include/linux/security.h      |  7 +++++++
>  security/security.c           | 16 ++++++++++++++++
>  4 files changed, 26 insertions(+)

Acked-by: Paul Moore <paul@paul-moore.com>

--
paul-moore.com

