Return-Path: <selinux+bounces-4656-lists+selinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F954B28536
	for <lists+selinux@lfdr.de>; Fri, 15 Aug 2025 19:36:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2CD2C7B7462
	for <lists+selinux@lfdr.de>; Fri, 15 Aug 2025 17:34:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 015DB3176F2;
	Fri, 15 Aug 2025 17:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="JfQY+vxY"
X-Original-To: selinux@vger.kernel.org
Received: from sonic315-26.consmr.mail.ne1.yahoo.com (sonic315-26.consmr.mail.ne1.yahoo.com [66.163.190.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAC9A3176E9
	for <selinux@vger.kernel.org>; Fri, 15 Aug 2025 17:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=66.163.190.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755279366; cv=none; b=nUp+iY6sRUq/NgDjq5Mv6x/FSJQRsP/QB+rxTZzKOKJSLIwxJ5wtxKr0W0NI4aV8XcVUz0TOCM55FkXAqe2EoPN5TEdH76iy9Xtt5hlXDzc5G2Csbi5PVfVnIBBty47k4ApCxKh9l3x7w+rjz8XcrYLcnr+ZYKhQcUr2D32cZUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755279366; c=relaxed/simple;
	bh=PVH45VaS2/Kv67LXl0wYjUW6dY2Wo1zUVDbWzOFnvC8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KjWvTlA35hSD3pIn3oFyqUfahCE5fyu/zYtliEdBd+TSlMFwhhKipjRAcHZeNvtwsNZMTTw7kE5GUsSmb96Xt29znvIPbqXaDftCOepYVoyOliqM/xS8e5QvniM6BvbaU5MOXxyq5k2LCBz6ni1cUj4+dmgmDvDnS8jzVmLRX/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=schaufler-ca.com; spf=none smtp.mailfrom=schaufler-ca.com; dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b=JfQY+vxY; arc=none smtp.client-ip=66.163.190.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=schaufler-ca.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=schaufler-ca.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1755279363; bh=DL8npqFMRALAXsPWptJDF7/QCDl8ai9/3F6574Gpphg=; h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To; b=JfQY+vxYFNCFGt5tID04mqom6DKm/RorX6uIDCLMNlkjZcw+lijy8FfaMLk9r6DiI0XzXwHqvH9tyFA9Q8AyCUcZvlqxviyZzHj+cuD1bpWovWryY+0b4Q+A3xs25IhY3nB3RYOWw/NCXOkdKm1vi46OFPLh6POes8uoolucHF0rranQGas1e0dVfEkO4V5Zz8e53ADjNKKN0EeR+DqeupH8+m+/aEQUq6gTstjBCNqUvVeAjvs9JYocqKIJotlZq339IKGDJWiLTz4xl2mKve5evi3NQqbELmJeFEvBdACX70yy2lfSBllLs0Q3msrNQy3MYAUlOcKWikogz6RFlg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1755279363; bh=IEqq4Z4BCCEI53Pz4jDWU7T4lB1czuw4qYzi7oV8s1o=; h=X-Sonic-MF:Date:Subject:To:From:From:Subject; b=jvgGQzxgRC1yIBqivSbD9qsiOOELGGZPuUPWRI7SKmI3W8mrLlhz/pyoaokGUr3UdWtEpSR3/kxIrCkcgOCPw8TzbSRuPEsKGvjxHb+2/5L2zM/Jaj5zCrvo9RDwISvdHQi3CYTDcsH+cTtd5PFnhNkFxxO4ZKpZgVr1QYRucy514fY+T+JdnZsDBuBY3M9/DML9ZeA2hoHl8pR0XWM3EVX9DTISXcQ/d5dEJUAV+mFFjKHDX80/cVo3w0JmoW27DCc0vuXGfTy8mpLcxpjEGTRryg9JSBBs9a3Noo6L1s9yrxCQBFaM0X3SEU6G/s9aiWgmLo5vM0oFByw8jvkKxA==
X-YMail-OSG: W5d9Qc4VM1mGMGKwhQY3lF2i08xMkZk41KGqAsFWM0Zpgq5ekAiksIeuG.cmyLa
 I0oeYNyrM9OlHsgp0RkdWRxWzoUgIAb4jkxP9KvPYoz3vHQhDMRGfZhOFgIdj3SJrxbQjXFQl0og
 1kWu2syuTJVyLs.yF2eftKTEYrelaGShpppnIILSEWYtwWIGbH9t5xwxByq3rksCObSG0BlAf_GO
 r1yOTy0sAWbZYyu5fN.8vnGhHIpsawS2f5oCes_8iEUbZO3VUFpubkXtpF9vCD0G1HIO4EryRbW0
 zVydDv9DqId99UF1tPbiHwR90fS4gjmTccDJ79KTi1usXPPFG6S4n7SZtvv4v5btN3xRrwAOz6cl
 kMdLeqU_ewPvpR9NLV73GiBjarRfk.dHAmJl_XJpyob3QbdWteEGFCGPTvl6CQo1KlfOSXrm5LQ5
 SkLQILozeSO97x1HWh.8eis1OLxaMtfHqsCUTQ7k_vSnLFdqIc7uiQOeJk.Ew8lUIaTAkWij0Rm2
 _dtYlIpwK0yml94UkyK0Ve_SnB57Gire8bZtFAaLp81.rNZ5Y8vVLva3Wqvf3Wm2WACptaJbBYjT
 IhK7sQ.DnmImq9WSbXOMKgzOHkWcLTXCVPyRfUXNrbGa6sgXeS8Nw5s7Bw2gMKT4oRf907aa49tH
 z3SnW_Lfq_j_dO4b7TfZ4l.mOVNQxB8494DC5DqvNMkaAafWS_IOq4L6SChCX_RqUYFRn0VB.Z96
 wbCMoaQSAcF3y8dLjQ5SNEbJ3.8GxJvxRrnGgpeW2kGR4tkaw5_5sh6cfC5sTzLyx.fizx_mnm_b
 GnLwh5Q0GId3loysZMr8yNwnGkE5U7t49_fMuSXu6Fe_gHMt0AZj_Dv4v0xn9EwaiRr.gjgCLiEq
 Edlyv1iYTkqtvwk41Gjr9PhOkFSxrqeRNaMra3x4OM3DTIzJfSsdOopXCS4kIp3UMMpRREbZfslx
 kllG4uKj9esggdtEQ_Cv51gQdorDzV8uiDWbS7Grf86gYys3aUSGo_tZxjKizg5Gky1eSgJR6vff
 wohltwOsuiyIvBYLr8NxtASM5OJXCbrao9mdSsN2wuP3Y1gYqK2wVJWHsgjx83us8i9dAwKvYI4r
 rPkJz2l8dLeCsbFdZIUyh6IT8CYmJReRG7BhXUCqiNFGNWtB0no1aMfCa3mHgwtXf5jrsBxh7xzb
 AYBeIdRCn66JUgOaiAG0JZJqUl9iYrfLb0VbkWmH46p0z7kUg_wPFwGs7JlOyGYjxMp7RP_aYtXx
 ZoaW_LzTAkHNKLZYDvC33ByPgeCJwbPBNJkD6vmzwQ7EQm_MbbxYuUY_u5DfKLckpHlCOQkTdS9g
 yMObAdDmJCwxrol2R6DgkAqZ_b1_zWvg.cxrQLe4Ow.tRmBfU95S4VMBnTyr_VuoMg40hacYnt9I
 uwE2X0UjGRCkjolTUZL7BrW6JIgWArfkywf2N0QyqyWzV6jsqPOVKSmStNaxt9P0W2AGiQcUPhyZ
 l4xXL1_WSwb0CZnWLlWkkJLl0Tquq99p0p8ZssJKtsfqZryyab8XVpV7BsHgN9mtjqJbu0fmtQdN
 pLwi_RI_Wpd63mkF8Uhvrr03iXv5OkEyBRlRYgr7HVTZB_n0k4QkgS7_nx3tjaaWq5NADopHzruP
 RSVyu_Eg3WTlOdCKe7qxi_CLUsjoph67MsPI4XQMENx1OWMAnCBYvrFRjXQ_Iqm6yw.AVoJr8heR
 iFVEpvDImTJaFM3E6J3_CJRJmJa0V28uLX2Yx42dny7_S7qaSPJ2rLUWhU7QynVwJgcCdRcThX8X
 gRnp1eCapCdX7TUTe_Gp9DeADjvEB.Dj0VCkU4J7LHQqVwMNL97LDC877R2aztRePr97lZCR4VWW
 tLh6n8n6fdn6tFFjEd2WmYeW7baU94C9Z8gbUqL973ICXYDR5Ax9hnJlkrSOCTxqRSWfq5n9QgJl
 .tBAyqADhnaeJwzX6SKLSyfEkiWcpGxp3Yh59VV0wsAaMFN4TJ2qKyjCtsPIEz11yAe4JwfhY8PT
 CB73wSIREJ1WUzT60_wknycJnftK45m.AL5mJX_Xq8PvObw2SozS6icdW3ebZs98tmfAcrOvRaIC
 axpQ2wg772b6CoGa4jlNs.JHxqt00P46tmPerLc0IW2eEs1jD8uD0Q7qrQkopms.GYZTqoxt1LFc
 3TPKAMfQ7mtWNIVhMcdlvCfZ98CzFZSnJCaxycp72jkrugTAXcDVl93EaBzAu8CXsF8gnZWyKPyI
 gTKYPFPvj4fY1m_PnVk9NQak9je2lrls5ftaJ8MR4xobpkA2UwmYgtF2zbamBBd6v1mz2NIilyXQ
 pLt66jozoOM9VeNUzjvXaUFYZtanGnwh7
X-Sonic-MF: <casey@schaufler-ca.com>
X-Sonic-ID: dcf2e2fc-0877-4593-a14d-ec376e2d4843
Received: from sonic.gate.mail.ne1.yahoo.com by sonic315.consmr.mail.ne1.yahoo.com with HTTP; Fri, 15 Aug 2025 17:36:03 +0000
Received: by hermes--production-gq1-74d64bb7d7-74ntb (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 23cae23c023c7587df965e14b25c3afe;
          Fri, 15 Aug 2025 17:05:39 +0000 (UTC)
Message-ID: <72224da0-46d1-4366-819c-c5e0d9b507e9@schaufler-ca.com>
Date: Fri, 15 Aug 2025 10:05:37 -0700
Precedence: bulk
X-Mailing-List: selinux@vger.kernel.org
List-Id: <selinux.vger.kernel.org>
List-Subscribe: <mailto:selinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:selinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 17/34] lsm: cleanup initialize_lsm() and rename to
 lsm_init_single()
To: Paul Moore <paul@paul-moore.com>, linux-security-module@vger.kernel.org,
 linux-integrity@vger.kernel.org, selinux@vger.kernel.org
Cc: John Johansen <john.johansen@canonical.com>,
 Mimi Zohar <zohar@linux.ibm.com>, Roberto Sassu <roberto.sassu@huawei.com>,
 Fan Wu <wufan@kernel.org>, =?UTF-8?Q?Micka=C3=ABl_Sala=C3=BCn?=
 <mic@digikod.net>, =?UTF-8?Q?G=C3=BCnther_Noack?= <gnoack@google.com>,
 Kees Cook <kees@kernel.org>, Micah Morton <mortonm@chromium.org>,
 Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 Nicolas Bouchinet <nicolas.bouchinet@oss.cyber.gouv.fr>,
 Xiu Jianfeng <xiujianfeng@huawei.com>,
 Casey Schaufler <casey@schaufler-ca.com>
References: <20250814225159.275901-36-paul@paul-moore.com>
 <20250814225159.275901-53-paul@paul-moore.com>
Content-Language: en-US
From: Casey Schaufler <casey@schaufler-ca.com>
In-Reply-To: <20250814225159.275901-53-paul@paul-moore.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailer: WebService/1.1.24338 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo

On 8/14/2025 3:50 PM, Paul Moore wrote:
> Rename initialize_lsm() to be more consistent with the rest of the LSM
> initialization changes and rework the function itself to better fit
> with the "exit on fail" coding pattern.
>
> Reviewed-by: Kees Cook <kees@kernel.org>
> Reviewed-by: John Johansen <john.johansen@canonical.com>
> Signed-off-by: Paul Moore <paul@paul-moore.com>

Reviewed-by: Casey Schaufler <casey@schaufler-ca.com>

> ---
>  security/lsm_init.c | 25 +++++++++++++++----------
>  1 file changed, 15 insertions(+), 10 deletions(-)
>
> diff --git a/security/lsm_init.c b/security/lsm_init.c
> index 5249aa044d9d..1f64222925c1 100644
> --- a/security/lsm_init.c
> +++ b/security/lsm_init.c
> @@ -169,6 +169,7 @@ static void __init lsm_order_append(struct lsm_info *lsm, const char *src)
>  		   lsm_is_enabled(lsm) ? "enabled" : "disabled");
>  }
>  
> +
>  /**
>   * lsm_blob_size_update - Update the LSM blob size and offset information
>   * @sz_req: the requested additional blob size
> @@ -225,16 +226,20 @@ static void __init lsm_prepare(struct lsm_info *lsm)
>  	lsm_blob_size_update(&blobs->lbs_bpf_token, &blob_sizes.lbs_bpf_token);
>  }
>  
> -/* Initialize a given LSM, if it is enabled. */
> -static void __init initialize_lsm(struct lsm_info *lsm)
> +/**
> + * lsm_init_single - Initialize a given LSM
> + * @lsm: LSM definition
> + */
> +static void __init lsm_init_single(struct lsm_info *lsm)
>  {
> -	if (lsm_is_enabled(lsm)) {
> -		int ret;
> +	int ret;
>  
> -		init_debug("initializing %s\n", lsm->id->name);
> -		ret = lsm->init();
> -		WARN(ret, "%s failed to initialize: %d\n", lsm->id->name, ret);
> -	}
> +	if (!lsm_is_enabled(lsm))
> +		return;
> +
> +	init_debug("initializing %s\n", lsm->id->name);
> +	ret = lsm->init();
> +	WARN(ret, "%s failed to initialize: %d\n", lsm->id->name, ret);
>  }
>  
>  /**
> @@ -379,7 +384,7 @@ static void __init lsm_init_ordered(void)
>  		panic("%s: early task alloc failed.\n", __func__);
>  
>  	lsm_order_for_each(lsm) {
> -		initialize_lsm(*lsm);
> +		lsm_init_single(*lsm);
>  	}
>  }
>  
> @@ -429,7 +434,7 @@ int __init early_security_init(void)
>  		lsm_enabled_set(lsm, true);
>  		lsm_order_append(lsm, "early");
>  		lsm_prepare(lsm);
> -		initialize_lsm(lsm);
> +		lsm_init_single(lsm);
>  	}
>  
>  	return 0;

