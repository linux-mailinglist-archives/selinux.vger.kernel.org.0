Return-Path: <selinux+bounces-4827-lists+selinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E38D1B40D09
	for <lists+selinux@lfdr.de>; Tue,  2 Sep 2025 20:21:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6C18F1B63731
	for <lists+selinux@lfdr.de>; Tue,  2 Sep 2025 18:21:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65474340D82;
	Tue,  2 Sep 2025 18:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="saxJGeZc"
X-Original-To: selinux@vger.kernel.org
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFC3F2E06EA
	for <selinux@vger.kernel.org>; Tue,  2 Sep 2025 18:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756837274; cv=none; b=chi4ezyCf7IxWT/nbntvhc/g1C++yj1TWzstosHlve7/xx8E+5MKvMEBw6BubLv3bxD1LiJvr75yPvsirlodUS3/4um2YjL9rQm9m6geivzTJg/ofyhkCU4SPCNpSreeQvxp+mkv6dKfitamwiyam3ml8Vx9+2lqGj1zXgMURL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756837274; c=relaxed/simple;
	bh=QG1cKbEmgCIDwQqxonwIsmcHljsheUhGPmX5mtniRGg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tMjHRmMXDsPSaxQD0ijtGAh5zt5IG5LHuTvTHEgpnMeo9Tkv4M5CKadjEzO6hwhUMWZR7wbkveJBHWSPoXgCE+UHZ71vUDk55oKaskHkq7lvdvWgDVKleHlWn1jad3sfGDOOWmtnIVgfxPpCI74GKzw47M/b+9tWwXI5Q9y898k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=saxJGeZc; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 011D13F291
	for <selinux@vger.kernel.org>; Tue,  2 Sep 2025 18:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1756837271;
	bh=15clSUWqNSAR9SebenuOsr+lyBq90zoYZkr1QC/p+vk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=saxJGeZcyMLqBfNO9HoFhvmaWZZjdhlfbho/uc1uzSUfFrk693Pwj4YVoHdUwJOSO
	 2Wib/EEqr19CwJSzK+TPscFs36ZlA9UjtZm+pi0wZlSkRAQlnIO7gYcRXnlPOn9V51
	 Dn+r4aB6G5xH7KrBZQK7BTtNzYNy/HYxEcaSqgrbueWWtKXIk5h67LdCq95S0di4KN
	 xQhHc+f/NQte179byuG9j19/7i9ZQ8meEFI9B8HpT4HG8wDfGbF8SReRJ9aQO8b6PL
	 yzaHxFtU+ljEU3QEuNY/oSe4FFCc4tRbDEJ4BWHQMNIq9oTQRfXBbDiLj3FmCHnMEg
	 fN18viwTbLp5Q==
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b4c2c09a760so4412720a12.2
        for <selinux@vger.kernel.org>; Tue, 02 Sep 2025 11:21:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756837269; x=1757442069;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=15clSUWqNSAR9SebenuOsr+lyBq90zoYZkr1QC/p+vk=;
        b=AQTCKDH+H/BxgqIccMpTbfFvFRFrUUUmmgJ8tLfgO7jpbAZB3mEBAgaFJwpVwNWBOK
         VIqHdGPRBHHidzUvjPNAC6cdufqnM8DCFkgD4Cng7SddgT0ZzTERLbPxib1Y6JGAWFhY
         dPNaiwNDk2Z7RFCdw8CZbyNbn7SJg+WYB9VlpthGaixVld81QkRAO/OyQHXzy6wuppkb
         +AV9sOvBdHRd1aB/tQZzcG1eltgYu3NMPJZXUYit4ZSMJIjxOJ0X9F5EhwnlqUwtYova
         JwF6Z/rhUv4DWide7RDXVcdmW4VLtKxIW/Ctd5k6EezSpSG+QuuWCXMElEfOohV6XiEy
         Gv7Q==
X-Forwarded-Encrypted: i=1; AJvYcCULWiq3KTLiCWqOxAyz5gBFqiwmHqXDmdiyj5I5EY9uYJOkBF5a7YlNxuWSRwdNJ8rJoknLssNK@vger.kernel.org
X-Gm-Message-State: AOJu0YyKf099sGqDf7LcSxHiFYM68OjWn9wEMwxpc7x7/0qMx7Kx8iPb
	ZurRyrw0NXGY37eTUqsCbj/UAcZFJy8OTh5cF3q3i7w9KRqKyoN7QPArbhZOTZxvrwvk0Eu843x
	wArT+NMLPPt8gMlBlIXvLA7QbEmeEwhz5vsf7lXKuEmeSAw9SuKirlhVR4nBr87abGEIPn56+qW
	F5UFbKGPLxzA==
X-Gm-Gg: ASbGnctUAaMxbKfoPvijjxtP+669emFkGJvd7QIDPoeLEsPj7vPtRPqEl2FhXqxLZk9
	3q0NZQ0dtekFSzSFpCXlSSvfPVE8Kz69hie0MVwVbj94+NaptNg/86+WFpJKSHxibOHWiev1IZi
	c8iAbKajFzW8J1QM8lWNH/7Vwzgq76SAc9tLP9qUVfWni8tpTLKU+gDD1uT1fm9UnGnW3GV8Pel
	HAAKRK28e0PaIgVHCTAju4IwlsBCBoKfuno/uYreA2lxTbQJxiYQT5tgvltLFwPSYpCrHr7f1YQ
	TcfQs8pnEHAdK0BZyRoOdGlRQzcECOW5jpKj7SrloEfUkQ7De3dFLA==
X-Received: by 2002:a17:903:ac8:b0:248:9128:6cf9 with SMTP id d9443c01a7336-24944aa2fb1mr153942535ad.28.1756837269490;
        Tue, 02 Sep 2025 11:21:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGdk5a18UBvT5b2zKJCuw6sw/U4u+4WIcxc8xXWrGNz9ORShAKLqwFqBstpzx9V+0C0dGgadA==
X-Received: by 2002:a17:903:ac8:b0:248:9128:6cf9 with SMTP id d9443c01a7336-24944aa2fb1mr153942215ad.28.1756837269048;
        Tue, 02 Sep 2025 11:21:09 -0700 (PDT)
Received: from [192.168.192.85] ([50.47.129.42])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-24906598815sm135582765ad.117.2025.09.02.11.21.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Sep 2025 11:21:08 -0700 (PDT)
Message-ID: <6d06f0b4-e5dd-45da-9df7-b60b0499f944@canonical.com>
Date: Tue, 2 Sep 2025 11:21:07 -0700
Precedence: bulk
X-Mailing-List: selinux@vger.kernel.org
List-Id: <selinux.vger.kernel.org>
List-Subscribe: <mailto:selinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:selinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 34/34] lsm: add a LSM_STARTED_ALL notification event
To: Paul Moore <paul@paul-moore.com>, linux-security-module@vger.kernel.org,
 linux-integrity@vger.kernel.org, selinux@vger.kernel.org
Cc: Mimi Zohar <zohar@linux.ibm.com>, Roberto Sassu
 <roberto.sassu@huawei.com>, Fan Wu <wufan@kernel.org>,
 =?UTF-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>,
 =?UTF-8?Q?G=C3=BCnther_Noack?= <gnoack@google.com>,
 Kees Cook <kees@kernel.org>, Micah Morton <mortonm@chromium.org>,
 Casey Schaufler <casey@schaufler-ca.com>,
 Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 Nicolas Bouchinet <nicolas.bouchinet@oss.cyber.gouv.fr>,
 Xiu Jianfeng <xiujianfeng@huawei.com>
References: <20250814225159.275901-36-paul@paul-moore.com>
 <20250814225159.275901-70-paul@paul-moore.com>
Content-Language: en-US
From: John Johansen <john.johansen@canonical.com>
Autocrypt: addr=john.johansen@canonical.com; keydata=
 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 lT9Q
Organization: Canonical
In-Reply-To: <20250814225159.275901-70-paul@paul-moore.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/14/25 15:50, Paul Moore wrote:
> Add a new LSM notifier event, LSM_STARTED_ALL, which is fired once at
> boot when all of the LSMs have been started.
> 
> Reviewed-by: Kees Cook <kees@kernel.org>
> Reviewed-by: Casey Schaufler <casey@schaufler-ca.com>
> Signed-off-by: Paul Moore <paul@paul-moore.com>

Reviewed-by: John Johansen <john.johansen@canonical.com>

> ---
>   include/linux/security.h | 1 +
>   security/lsm_init.c      | 1 +
>   2 files changed, 2 insertions(+)
> 
> diff --git a/include/linux/security.h b/include/linux/security.h
> index 8560c50edd2e..c13f0a849024 100644
> --- a/include/linux/security.h
> +++ b/include/linux/security.h
> @@ -85,6 +85,7 @@ struct timezone;
>   
>   enum lsm_event {
>   	LSM_POLICY_CHANGE,
> +	LSM_STARTED_ALL,
>   };
>   
>   struct dm_verity_digest {
> diff --git a/security/lsm_init.c b/security/lsm_init.c
> index 2bd705836df8..af4046c5c581 100644
> --- a/security/lsm_init.c
> +++ b/security/lsm_init.c
> @@ -556,6 +556,7 @@ static int __init security_initcall_late(void)
>   
>   	rc = lsm_initcall(late);
>   	lsm_pr_dbg("all enabled LSMs fully activated\n");
> +	call_blocking_lsm_notifier(LSM_STARTED_ALL, NULL);
>   
>   	return rc;
>   }


