Return-Path: <selinux+bounces-530-lists+selinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 294B284D84F
	for <lists+selinux@lfdr.de>; Thu,  8 Feb 2024 04:19:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5C13B1C22FDF
	for <lists+selinux@lfdr.de>; Thu,  8 Feb 2024 03:19:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD76B208DC;
	Thu,  8 Feb 2024 03:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="A++ohpRO"
X-Original-To: selinux@vger.kernel.org
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D55FF1DDD5
	for <selinux@vger.kernel.org>; Thu,  8 Feb 2024 03:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707362318; cv=none; b=pGt7nDopz9MGzdHWlK68LUG58oPM3A2so1jXJzN9OTKBAlpWOjwDyv9Bs5nrl+NqKMjRiRIRWzwdY6sHUuQW26GfMfzWpRDbd8tWluXTKalAv5eUxGod+PH86LfHgMn8LArYU2fcmjPXmVdy3djLx+pIdO1xIsaGSJAGPPxPlaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707362318; c=relaxed/simple;
	bh=x0PgWCtA6jyKybBYDAMvlB50lhMzr22RVybs/A+ma+k=;
	h=Date:Message-ID:MIME-Version:Content-Type:Content-Disposition:
	 From:To:Cc:Subject:References:In-Reply-To; b=JYpkBVe+88wNLF6ID/kfRbfoOnk6sgGEcvYrvslS5saCUJpj1lVouPhSwCmWxyLdPHbdCtR/FfoPuZU/Zm9Co6qDqCZObhjety9cg3uTEhKFz8r9YDMY9X5ADL+U2IOefw46gVpTNtRWiFfKjmvVNqZnihVyakb2OvSm9X6xmt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=A++ohpRO; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-42a8a3973c5so9757171cf.2
        for <selinux@vger.kernel.org>; Wed, 07 Feb 2024 19:18:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1707362314; x=1707967114; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :content-disposition:mime-version:message-id:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=O9p45HvzglPypNb/Rrrr7bt9K/43QfCMN3mSwEi+7Tk=;
        b=A++ohpROXM2ol5WPul2+22E0Rz/N5rL4ChcIl1vNhxPzlnD1sDDTCP9/AS2MS4n/xQ
         SblcYbA3lsPSV9uaBaN4gFW+ePNJqO1qqPhY1V7CQ6NTHfGBRSNaaQXFA0W6ZGDGxq5C
         lh/JFXVDPrtLu6XY0X/SzJjS/OU8FSC4Tk3u3iLnCe1UhQT9S9WoIPM5DwMKKfq2yb2H
         ch3HSvHurBbnmMrF7fcuLt3D3blOFEoQBdELLsKpDFJ7Z7MD0G43i+NM/DhjwlsZw4aI
         Swx5n13SN3ZIW7ePzPuKwpMQAWe48iewVyIZSqu4oQp1lbMq4QoZGZUGOW1je+fZXGQX
         BmsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707362314; x=1707967114;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :content-disposition:mime-version:message-id:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O9p45HvzglPypNb/Rrrr7bt9K/43QfCMN3mSwEi+7Tk=;
        b=Qe+d0h79xbcdYiIjgo32+GvdfLbHx+u0UMWUiISpgj5wv1iyXevA3R+4U51TBi2h30
         25nhidLOttVLqibewGQakxYWXGGSIP+8rXW549nDSOci7Y8avpz9CR5nzG0lC4bOSGVs
         SRLPdd4j4bKYxMJbdvQlsv4WZNGcOVrMIwa0+LufMeRmytaBv5i85IMcEZHTpAADHThX
         qV4Ko1ljszXfFiK1MVuMJkO3UpNWdIVu+rOY9FDbFIZu2gFO0BJsY8aOOBNUi0vAXTNN
         Qum3GypajYU74gYhLRl3kF0lcFQs+v496MZ6a7o4YVwupSPvXDt9kFRFMZi0HNiFp8tP
         pfjg==
X-Forwarded-Encrypted: i=1; AJvYcCUTGzljrdqDxHVTTuXmjgOj581YCMUnLixpJynePIHCPgpLnzAm1D6zgmttLiyc9ajQuepSoPR2K3DKglV6j4MArXt3ryj/eg==
X-Gm-Message-State: AOJu0YxTqzPRDaO6VvZkrlnFaIXKJ2pdQWg2FLvBrvkSHfATNLd2Gn4/
	aHv80lQ2O7eWBDDKbCI2tjHKi0bbPwdvdSe5eZLuu2TMiHdiu3f9CXI0aam0fQ==
X-Google-Smtp-Source: AGHT+IHwSUpQIXy8a/yixgVQM5oIXSyjLzFOdJo++UxulPZTczMCvknoZ6mNt68XEnGWzoQpYbQ23g==
X-Received: by 2002:ac8:4406:0:b0:42b:f32c:33c9 with SMTP id j6-20020ac84406000000b0042bf32c33c9mr8061829qtn.54.1707362314301;
        Wed, 07 Feb 2024 19:18:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVqXjUoHILUgUL2EqHV+BO4jRZYm4kzuyYd2CDKB8KsCqDloYTlv2tZhIfIsfWoNmmSlkxY40914/gaVDfJFFLjUf9scKnqQJVM9QlmQ0n9Y+/w3XhFujR11GOaxkKuFbIprdyZ9RMqwEoENoRkVnyzB1H5YlAe+LkUx+yVv+ZhO9JZWUOmnfuVukMeoMPC5Xsj54QOzV94HZMeUQaY0M8v+X046OLjte6YtbmrnigshxTjueOld39x9MZwt+XzKslzEKUb8ussaFuxX9V6NwgA867s1WnXCQh8oVdBJqatfN3oEPILjFwDmU4FHIxXBAYEomfZ7FheiGqJHjsnNnp17z5Qp7kJaluFgV8Mg/tBpDM4+f7frkHDkbyP+QhTet4LeOlGl8HWKLFrD7xA9v0wjaiw47jAqaaEr3NYLUvqa5+iuGAhrbFeqS49YNaS4++hEFNqWHC49sOW79m0zBDaZudyTSNcMDV3yrPfpdj4uj61R5tH0Bfx0G5/Ra8+HMIN+TnUVl8zq2bMqAm23Nbmv5oHJD5cr5wpEudk/ZTruyJmw3TBY1niRJoePGXMwdjYSQC8+4uibsX7Z63utdQ0xPmKlmJVUa/fnjculRj/pW06eLSeWR9tBHc8Vi5Qpv5d2p6c4rbnRiBa+B87/hh3DwD4LgvxgKP8Qe4E++a3VjihdU5T5ThboW1nI15Wk25Pq+lMnkRuJLgFvOdzSD/HZSwbQVEccbQ4qvr752I939lScaH5dmXr3sKOWyXbMrWY1CYao26Pl4gqzTM8ykRu6XIgcFmPhgHMHv0TBQGPIq4hYmjPAsWShNEP7a8n2MOq9GgZeRDdPEYrzw0L4ppOuAkdfFnH+sjXkQh59cnEJns7fTTkEskHT92z4xIN7s5TwE76xSk3TfLjNkH4HO4abshV+FbYzeWlQ5PTGwkRu6zZojQOkuQLRkSK3+3sUehhlI
 dzOyAuGVoZWXY=
Received: from localhost ([70.22.175.108])
        by smtp.gmail.com with ESMTPSA id l20-20020ac81494000000b00429c9bf789fsm1063933qtj.42.2024.02.07.19.18.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Feb 2024 19:18:33 -0800 (PST)
Date: Wed, 07 Feb 2024 22:18:33 -0500
Message-ID: <69799b1cfa491838ff4c6d6a046481fd@paul-moore.com>
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
Subject: Re: [PATCH v9 2/25] ima: Align ima_file_mprotect() definition with LSM  infrastructure
References: <20240115181809.885385-3-roberto.sassu@huaweicloud.com>
In-Reply-To: <20240115181809.885385-3-roberto.sassu@huaweicloud.com>

On Jan 15, 2024 Roberto Sassu <roberto.sassu@huaweicloud.com> wrote:
> 
> Change ima_file_mprotect() definition, so that it can be registered
> as implementation of the file_mprotect hook.
> 
> Signed-off-by: Roberto Sassu <roberto.sassu@huawei.com>
> Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
> Reviewed-by: Casey Schaufler <casey@schaufler-ca.com>
> Reviewed-by: Mimi Zohar <zohar@linux.ibm.com>
> ---
>  include/linux/ima.h               | 5 +++--
>  security/integrity/ima/ima_main.c | 6 ++++--
>  security/security.c               | 2 +-
>  3 files changed, 8 insertions(+), 5 deletions(-)

Acked-by: Paul Moore <paul@paul-moore.com>

--
paul-moore.com

