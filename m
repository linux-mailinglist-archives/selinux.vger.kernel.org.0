Return-Path: <selinux+bounces-4428-lists+selinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 05896B114D4
	for <lists+selinux@lfdr.de>; Fri, 25 Jul 2025 01:40:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 93EAB1CE6685
	for <lists+selinux@lfdr.de>; Thu, 24 Jul 2025 23:40:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F1C8242D95;
	Thu, 24 Jul 2025 23:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="XJm+fNj9"
X-Original-To: selinux@vger.kernel.org
Received: from sonic310-31.consmr.mail.ne1.yahoo.com (sonic310-31.consmr.mail.ne1.yahoo.com [66.163.186.212])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76EF4242D69
	for <selinux@vger.kernel.org>; Thu, 24 Jul 2025 23:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=66.163.186.212
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753400387; cv=none; b=UCvNgVIi9c6GdeTTbaKfaTeJNigZzkNo5M5hG+KP1rg6wg+6omBbPmlwHHH95ef0OgmpWyzt6mFOjBOoFQ3Y04nXeenWUkht/Z3cmFhptT6o5+D7mb/tNm5ISIwgmnEdHz8BV0pFdVNv8+xN+x6mLv98YYQF34CH0ZdGAlbBuxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753400387; c=relaxed/simple;
	bh=IozoeKc+myZ61Q09FxPvtUQ+iQVywdq2J/1OVE5F4Ac=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DTeE9SSR/NIuDfzq000Lv/VxUMxChK0IHXTLiH0Yne/gpRUalCc1Sna4IT9TnkVnNJ4xlH/35hFHenyiKtEjZDBMHi6hhZ0lVjW8mhBBO905DOy4cggVa4pMc3Gmc/nF1O9oeypsh04WD0o0KISj1CjIfmnN5TlDtm9q9sLY3z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=schaufler-ca.com; spf=none smtp.mailfrom=schaufler-ca.com; dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b=XJm+fNj9; arc=none smtp.client-ip=66.163.186.212
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=schaufler-ca.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=schaufler-ca.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1753400385; bh=D4UXIiSwAd78KReAbVjXDxGlVt15ojyGbNdVGdhm+7I=; h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To; b=XJm+fNj9Iqz1yJaS6kE7XQtmW0NtAaL9j+KcuZv34STY4SMqpeKOwG2hEhivEDkwc9td8oVegdAtm27Z6lzjTXWbiXlztYsF/lYCr2U2LhG/uFZGaJVf4LhPDCimo4QNaHOZNBzjtPt6SMPJ4PuPfSrGYA+0bdYs2tS0cDX+k0PteSoV6xR2WjwXyn6qdX075Feup7q65ycxq9/jmgWhJRJriQdM/gFac5/zm7V8g7aV8dBhQgmC+hny+b8Q6YtqJl/+QUnkSHHdnKKxolP88iNxcDVKyX7jecjNq082lD+O6ss3dVgQQRRwbKzgPVGyHr0EyLMCHSUo7Svb61MgQA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1753400385; bh=fRg+BbhQEaYeAxyUJIeYdQi4iNBNr7ceCSH8G4dEygK=; h=X-Sonic-MF:Date:Subject:To:From:From:Subject; b=HMxD/r358/rs2ogVG9SMcHf8GTobKarO35qHNOifWbSuLLnEiEfupWy2HqrwBs7q/JL+VSZmJ8lP00baQCsqi5aHYtA+7pU97u3BqAfVNinZG84EPx3ReSbZ6t7veiP8ThxtqIQaQ8B34vGvP0K/AkSG+3Wq5TcYtR1UkPfJRHe9vcQJlELsIorIEKMQBmoGZ3rgOgqQNZY/vPh48qgy40UPeG31kyaEXE06x7Yg2LgPRIZp5/9XdyIbI6NavrIvMMsm2ersFjx0gURNGntnwAigyNpG5aAKs+AVk1sCoxyPowAWcmGWoFfLS3p5j4k1jaiQ5TdSq4lFIeVKHyGF5w==
X-YMail-OSG: pWSwA3EVM1ndncA54_YVNxnSfsO2t7DBlvp_gz7oSU6NPooeczWnN5Y.K07RqDr
 14pi7uZzrI14ZgVhfuuGWnVmedlsyQ_OdIvywTKTt7TTQmW.h3HvbjQmiLz8yFVxi7n5uMYTiFB4
 DXTZTbgtgwZYC6cwvT5_rp9Gin1hCCkce1aedO38g514liULBhyoKp.vv8.4vYbzU4rndgaNl5Eq
 TZL_nP5VtCRPQv3cSlsXp9cz5ZEp3zTE6kdJf86.kSuazbYpOSxenTTCMnGvx_6HEounthie3lYU
 w8fhxDchN9KmA75o9Tv1OsBeLBkk67_pRtltUOjBExcY3I_2WxCjJLYGf8UU6q9q.Soh9JT0NBXf
 rayYwtNQOohI6dEgJ.1Dk6hecwDiE6Uryn60MgzsjLPDh8ZS_pc20fNfDphGVEqeBvXJO1xEa5BO
 g_n4ieh1aJD6Ktg_.13O14bQfZX2jYC5_GV9EJibfu8FG7jTN0fJzkLXZ7kv9wp.AjAkhM_gnc28
 63t.N6TO0EdKY1HbavLfOMLc6MyqhFo.PxrToTq5LdEG3rt7cGXW91nAkZzEWYEOIT2pFfApRQaC
 E5w71puWf6FU6zp.ubzXBt_w4BIB1p7urSD3FdHsV2VVX9WXUaOs8i_y9Z2QXATMIhVQQ8Woh0MF
 .Rm9uFHuxVOVS9ul_dbCzs_EWf0fOZI5T_5SgMCGG3TwwxVcvlhNLhD7qFo8TzoAMbv9a.6YOiBh
 3NxU2ooacixeOO3TKrLxRLAJx8FvmoxQRaLtc50ZsCVirWP55gX_u9d5MSvuqcKgPI4ua49SD3do
 ShM5abpvXK0wr53Lthdb3_ssgh0xSyibBq92jo3LPZGLU3jPYsqhUJmYL9JX4VJXEcKpp7.9pz_g
 UQ8xrxB0WWYsTBAsOmWaaMZylEqzbUpUS..aU9cb17LLdI0FDWHOU.dA7SEnnYPxiG_pAhvGzFCm
 5DXQWA2vbYh3nqSDxXeP33dA8NwgcCECYbrdoY.6GJJQ1PfzglliMz1mE06N.KsLY4v4iYZvqsvO
 72cVx_aGNAco8PAlGr5LHgL_ZsExRbv.Lt3Otk2Cp6tUM0xXXAGfjeLpTZSqI6Y7tggPfBGP808Z
 onE.cqfsv4cUrwtGzaeqm.v.bCEF7a_ut.ZMEqcl55v5E3qdjcj4.ruH06eK6ChiJHhGiF7mEn6v
 rjA.5YEcTOXMcBu2GgcAUP4eWYPkDnkIUScWTY6g_ylUTcOaqJblo8.vvWZoqRiQcqRA6jsyjDL6
 g8IGltg_E9KpLAR0DOrHJrfFfhDzqilnp1y6a9kDlVUgoNmEK0R4214a3EziQ5mVH_33Ep7rEkxK
 oYoLPslHsUrZv2nlDkSgtjlChGsm3jsSu0IY5z1LtfsiUyh64RgWh6Og_p.KJXO0JfrsqW4Rrs73
 Bed3or7Tu3dsTg1.Knx00W7AtT87WAFj0Xn4k_phN0X1RKByvJFeEbU_nFEoa6o0WIHJ19eDELxa
 b0zhTUdiknPeWLcZdX_3auVuxLeIKNtPUCb9V2wxC3lobrpHAsxw8rkGLW2TVTrvypmO1eHMP78.
 qFuyXRpVexUlInC9MxlBIpiPtJZh_mOkPSQOG5OuTZOv0r2zQPEu8lYIu4Or6Nj95pRh.XdcCPlX
 s0ErJ.vtViH3lWQnPWSXbHLG4Rn3bGvql9odawS.GlxsTk7U8eUYSHcc9bGm4ZoLyeFRiWOKcW3j
 cEtRXx4rg50JKobKuTHkRMIATBsMczFVVz.hfVyrDcz1L2guFpvj.cW2.rxlfLMbEIYphAphDOU9
 BDnE6Jo8rBY0KRSCrZ8loQBcLy86NTEIPzA25a6m1NlStcYKnjNWYVWYiekkftVDg_IgZkB4algq
 kVT0CEICf0khUmWgch4WMJemyGN2yHjS7FOjSD0J6sak4zSxMGmVuqTRc_qkRghPEYiZVQYkTEN0
 BdyHnnYnjhchOloX_tpGw7TfCbQrw4hzV6MvvgkTtIAtYt510z41k6t.5wv2ZJ4Fg7RikUk0Wmiq
 4n4eJLg7AecE5Fec_YMwJkNeYp46nbT.C9UoQceEsYU3cqheavO6Kh9A450qO.QCQoIAmtaV6ZQ3
 dChxo_LANRbelM.kRqneYEwr6ReR.WrJVvmD1_e2wz8wRFq14uxT1xWYkueY_WPKK3JrgoA7d1KU
 eZqrvBogHgogQ0kEHizrXz2m0FUiim9u4EjOoGOmBdsjBPLXi3rPNr3tSQD9KgWCraLey_M4jtny
 wAxsxhhkDy8pX960C72CTs9nX2rmU9i9soGNX4KINEoQsWZIgYlQGFRNtJd14i_guBXcex1zZEpl
 9KlbvWuS3cEBnxFPkGJmFBBKJEhArme2VjR2x1P37
X-Sonic-MF: <casey@schaufler-ca.com>
X-Sonic-ID: 382997fd-3c7c-4364-89f9-69d82166a3fc
Received: from sonic.gate.mail.ne1.yahoo.com by sonic310.consmr.mail.ne1.yahoo.com with HTTP; Thu, 24 Jul 2025 23:39:45 +0000
Received: by hermes--production-gq1-74d64bb7d7-lwch7 (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID ac9fc2ff9e6c27f811bd2abab431ec14;
          Thu, 24 Jul 2025 23:29:35 +0000 (UTC)
Message-ID: <52b0a3f3-4b5d-473b-ace5-29c5862a5898@schaufler-ca.com>
Date: Thu, 24 Jul 2025 16:29:33 -0700
Precedence: bulk
X-Mailing-List: selinux@vger.kernel.org
List-Id: <selinux.vger.kernel.org>
List-Subscribe: <mailto:selinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:selinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 17/34] lsm: cleanup initialize_lsm() and rename to
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
References: <20250721232142.77224-36-paul@paul-moore.com>
 <20250721232142.77224-53-paul@paul-moore.com>
Content-Language: en-US
From: Casey Schaufler <casey@schaufler-ca.com>
In-Reply-To: <20250721232142.77224-53-paul@paul-moore.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailer: WebService/1.1.24187 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo

On 7/21/2025 4:21 PM, Paul Moore wrote:
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
> index aad363e37140..49f93383e551 100644
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
> @@ -222,16 +223,20 @@ static void __init lsm_prepare(struct lsm_info *lsm)
>  	lsm_blob_size_update(&blobs->lbs_bdev, &blob_sizes.lbs_bdev);
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
> @@ -373,7 +378,7 @@ static void __init lsm_init_ordered(void)
>  		panic("%s: early task alloc failed.\n", __func__);
>  
>  	lsm_order_for_each(lsm) {
> -		initialize_lsm(*lsm);
> +		lsm_init_single(*lsm);
>  	}
>  }
>  
> @@ -423,7 +428,7 @@ int __init early_security_init(void)
>  		lsm_enabled_set(lsm, true);
>  		lsm_order_append(lsm, "early");
>  		lsm_prepare(lsm);
> -		initialize_lsm(lsm);
> +		lsm_init_single(lsm);
>  	}
>  
>  	return 0;

