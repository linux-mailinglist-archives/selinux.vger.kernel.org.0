Return-Path: <selinux+bounces-4427-lists+selinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B54F1B114CD
	for <lists+selinux@lfdr.de>; Fri, 25 Jul 2025 01:40:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E4BC15A6B64
	for <lists+selinux@lfdr.de>; Thu, 24 Jul 2025 23:40:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DD512417C3;
	Thu, 24 Jul 2025 23:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="cgZCliAM"
X-Original-To: selinux@vger.kernel.org
Received: from sonic311-31.consmr.mail.ne1.yahoo.com (sonic311-31.consmr.mail.ne1.yahoo.com [66.163.188.212])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B1432472B9
	for <selinux@vger.kernel.org>; Thu, 24 Jul 2025 23:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=66.163.188.212
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753400329; cv=none; b=W1rjt+qgiWRA7p33VvhtM8S2PpyDR+YPlyDTfYP2mf2HQKtqrLFX9hoN0la+vBc9Hl68f1lB2vRmPhazUPvffOeAhlSQE09EEo2yD3+bdj2O2I1NQRZBYORMKC/+SBwQCCX7Kg7YGuVBmiL2+UhBNpwBUNDbUhIfA05A0XgpIwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753400329; c=relaxed/simple;
	bh=aCC308KJfoZ/CaIGTyAHzfu45D9FuichQqV6CMTczsA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Tg/XORLQuUhxQakjW+eyvGANpoHbbwmEGxPVGIZ34KOAfa67DcZmAakp3MwwkRUyisn4UWF/w+yId8B3YUC3Dv2GfH8lGJz1d7UoHiNuloUC2qcYzvz4F6EgWw+JbG5LLlFaQ1dKexPs05zizTIi+J4siv+hRzom2Bc1Lgo+Qo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=schaufler-ca.com; spf=none smtp.mailfrom=schaufler-ca.com; dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b=cgZCliAM; arc=none smtp.client-ip=66.163.188.212
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=schaufler-ca.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=schaufler-ca.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1753400327; bh=+C3riNC/TX6NHstud+/7Wumte0yEFTDkdaHRjubdjqQ=; h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To; b=cgZCliAM0Ax8qW0MIiM8vxgZKDgkGvweFUpjKZPyNYCLpzmk4ecsgL0DUr0hkSHf+5hTQ77n7q4CoNBCiUjqavqm+jNb2UrVVfnMGbnG7xt2SMvMjrSvYoHe+bjnP4nwB03bAIzzrikULB9fCrV71MxHV5OLJuIKRwQRhIvM59lkQPlI3K+VpzGXQwmdSfaZGBEvugFzPYLSZtpmTXW1DKj1rqqqW6GXV2BJHPDQO6UoqRjtE0eNdiNZ2eHucr94OToksJy2LX+eC4IFe6fat7ScesM2uX0/sppRHyfgDhLIIXTPdcflSQvlhOMMN0lBMN8OlkUUq41r1Vt9Y2VvAg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1753400327; bh=ap3dlLIVEriczSSSj5Jf0ukx3AF4A7pAL6O4Q4dV/gI=; h=X-Sonic-MF:Date:Subject:To:From:From:Subject; b=ei3duIkvougJXbcMrVnNQBXxsjUiddzGVlsEScSIrNvY5aCnoCtakaF7s8I9r/0OoTS4VPqqeeAKIVpfmtoOvjhwC1iy/OPw2UfPsm7bwyqyHYcMzJRxvAN771DRCcWCmf5Ew4Y78LNGqNgsT78kmLN3qkGpnhFJOAdmRgaMKat6i+nfXZCDT/M48LzZF8kxvGvy6G00cVGFLGFVWOhF2GQMcjiG+33i02083X3fe7n22RtD7jc2TxjAqpBDDGVA4BM01POPiWtnUWfppP+rlDWwESJySJV2itZTrfgNGC41qVos2k6Kvl2CYcZSHWGK3OxUr3Xv+veg0gq4cp509w==
X-YMail-OSG: c9cxzeIVM1nP.wnWAf2TUd9EAtKDBVM8RpjdowI2AIm0Wjwa8yHP81XWrpcXtdx
 oaPpSR4Q_9ayMXVfJnvdj.sy2cchMoJjaGGxaCLaB6RfHZEKxAT8BOpIhZbdNVefVq.YnMIyWruK
 ChxTWpA75dZK0GSQ2wxwTAS.6OjdIIR761nrNJiJ7LtGZqjBZClmbTujGIxC7.i8vuBcrloLm9_Q
 Gl2qvQEu95OOIbsZ.28RzveE1DE0Gahh9ya.PBwk2orHPOPcLj.Q2R.frQvGBpGw8DQUAVYmIUHl
 hrFZeFsiGDC4p.IFxsxVV4wTESyYBFLR0Dn2c5TmdKL3_tPhGpWGTTGlXwNfhpNgxMRtbxGriAFS
 mp2lVGpZM0TmkQCzAxDIzdji43VrqYv4amIo.UhM2mB8I_lX3DyTyl6ebTEGUWXbLlF85qfV2RXx
 XCLXIzmPlj5E6JfsXwCpW0dzI2DAv_rcQmRw8T4ZGFK7PVmizwt5_8XB27eCU2TFeKiwTJwJAbxt
 9HD_Vs9ryvQIoDJda47m1LMwONsf42VjOh9H71CMs5C3EhDFI9.jHN5ax23.7hcw8_w8rG2eCtHv
 4B0WTA22uf8K2ULnsuRGl68Tjei1ASbRCgWWJc0gARPvHSG4eoVYcJrSM7gvmXv41wZDE3BSIgS2
 F06_gLK4bN7aXrQAGXPPYpg7CRxay8.oFHMmQj.ShwRCySkdP1XZDeCd.3nBRenQmwGASppkUPaY
 yrrBPD5HYjYqG3RFehgZ.MSvMemOzBzTmJN3K3z22cxQPq5vjJ6OA1Onm_yCHMssBgIZetkMT0Y5
 qG4aabZlUOFsESxZMv1kk5zI8v8Y56Z2LMSKQ1At0b_DTjk_U4cxGzyltPFAtFCfNjpgYIYrfyGh
 foyMyttN4H4Ya3Ye0zJ823kt2_wDUtPseQPP9aHhMI8d_WlcX7Z89Lja..TYhBd4woRh4raG5iAI
 5jC9L5X8s2SjjJeHG75azUCj6jid4Yz.WbvUSeoE.2zEKHLeL3DzFUQBsVoFnLxr3WO5fOIfWadr
 L6mVu.WkrmDyoWfEqPUlcfH4PoeSPUT945zjeTo0NM0dp92lTRkEqJIcZKY0JB6QSBzawFiEQdhq
 v6PsE.YVTKlPQrFFtc_aPuBBH6G0Q7Zrpbm6jNCIHjTxukCiPVCwHPcTzrQ72SF_2FljrH8jSh4e
 gD5GjyfzvmYaGXliog_6Q6vQtksyVGzJzO87yrwiFDJCVxFDqqGo_2BfJLC1PntmDNSF.CtMCKno
 Linzwo0CTBC87ud92yNsUcbw29LFHnIfqIvGZ314s6aJ4Pc_.Xqc3spfIgFWbPvG08Hrl9flam.0
 iPRZlPb6.H8MaM130EOshsmymU2JhqJ.nVxYxfC14TFJM0p1avtaeNohwe0mBYoNuo4UId8tK_0J
 3kYBVXv8f_.yKWVuF1JruPmN0qq17K.XxMsnswyZCQmnT1GHgz_9.lCIk_gsQLez8Ze8BYSH0y0U
 xw.w7on0aP_1FGRmsibNwHjT0uoWtl2BuO1n2KRT8ZCg_OJcrCQtVeH7LsiQ1Un9oixDnwpR6d7m
 R2z1_YXsj9AH9aJa8YfSiDGg9bBFboKK6EeuncP9bVLlUQnV3iweDKeweni3ylKST5xyaf9IVsUx
 IpbJIDAriZ1OAnFm3Salx.27SOcZPUvR4BBX6d3IDcUCNOI8wyFNgSuyAfHE42SYma6tMYMhAo8j
 cQdc8SdQz.OK2yR5dBuUYS9FZq.rPzvRNJw.7rFjCsKulIZQ_jNX26VVK.FPy0ZKQEc5xbOuo0Gg
 rfJYN3kyrw4cQiLGcDfVbGcsEOD4ddponcOFGZ.tk_LTRN8t7bTD8VmC_0i8HnxI3_4aX95a0nsR
 PjRisAyQW7QlyX1wG0R3QTmiURnZon9KjwQBaAzv5xOcxm9kpQzOFtDZ2SXUEicZ6TEYgWZUlMls
 nGNAtA4DNwWrfG9EhRQP.dTOgG5lq5xUPgkBZYIkEBYHMOkkKbxIY3HliKg3FG26KBHG7HuMZ18R
 GgluhC.SVeBRoS5B6q1wZ0LjQRUW02vAofzzbwG8shfwkSfrQlIntRA_LIfz2Mq1oRjtGgqRKbJh
 0AeEYvLX.x_57jmGUCHyn5wYW3rN8tjUCyepa2lPs8.kHTCUhHSHiOtkL4IUea2vcrwqVw5YVZGJ
 2MJIJP7fCxCMbHxZrhdvYNuK29c4Ox81mb62MEafgGSm0unz4XDMC1j71syRW7bNa4XlUstLIIAs
 EUIEIkL5sH8Dtr8Fv_C4G0wvyCisS7LTK29hiqSREs2ynUz4bdhVHx2uP0uNHdCxrKA6jOn9dtw.
 X9B4_IpViHGNbzDW.b2jTKCPdbnv4y5KqtBvYkXh8ILzJ
X-Sonic-MF: <casey@schaufler-ca.com>
X-Sonic-ID: d7740bf5-090d-4dc2-906f-0daef84a0900
Received: from sonic.gate.mail.ne1.yahoo.com by sonic311.consmr.mail.ne1.yahoo.com with HTTP; Thu, 24 Jul 2025 23:38:47 +0000
Received: by hermes--production-gq1-74d64bb7d7-khmfd (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 4992f4192d3866ee88909385bbfb7ff4;
          Thu, 24 Jul 2025 23:28:38 +0000 (UTC)
Message-ID: <cd7a91fa-a731-48e2-a0e7-d098559603a1@schaufler-ca.com>
Date: Thu, 24 Jul 2025 16:28:36 -0700
Precedence: bulk
X-Mailing-List: selinux@vger.kernel.org
List-Id: <selinux.vger.kernel.org>
List-Subscribe: <mailto:selinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:selinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 16/34] lsm: cleanup the LSM blob size code
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
 <20250721232142.77224-52-paul@paul-moore.com>
Content-Language: en-US
From: Casey Schaufler <casey@schaufler-ca.com>
In-Reply-To: <20250721232142.77224-52-paul@paul-moore.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailer: WebService/1.1.24187 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo

On 7/21/2025 4:21 PM, Paul Moore wrote:
> Convert the lsm_blob_size fields to unsigned integers as there is no
> current need for them to be negative, change "lsm_set_blob_size()" to
> "lsm_blob_size_update()" to better reflect reality, and perform some
> other minor cleanups to the associated code.
>
> Reviewed-by: Kees Cook <kees@kernel.org>
> Reviewed-by: John Johansen <john.johansen@canonical.com>
> Signed-off-by: Paul Moore <paul@paul-moore.com>

Reviewed-by: Casey Schaufler <casey@schaufler-ca.com>


> ---
>  include/linux/lsm_hooks.h | 28 ++++++++++-----------
>  security/lsm_init.c       | 51 +++++++++++++++++++++++----------------
>  2 files changed, 44 insertions(+), 35 deletions(-)
>
> diff --git a/include/linux/lsm_hooks.h b/include/linux/lsm_hooks.h
> index bc477fb20d02..a7ecb0791a0f 100644
> --- a/include/linux/lsm_hooks.h
> +++ b/include/linux/lsm_hooks.h
> @@ -102,20 +102,20 @@ struct security_hook_list {
>   * Security blob size or offset data.
>   */
>  struct lsm_blob_sizes {
> -	int lbs_cred;
> -	int lbs_file;
> -	int lbs_ib;
> -	int lbs_inode;
> -	int lbs_sock;
> -	int lbs_superblock;
> -	int lbs_ipc;
> -	int lbs_key;
> -	int lbs_msg_msg;
> -	int lbs_perf_event;
> -	int lbs_task;
> -	int lbs_xattr_count; /* number of xattr slots in new_xattrs array */
> -	int lbs_tun_dev;
> -	int lbs_bdev;
> +	unsigned int lbs_cred;
> +	unsigned int lbs_file;
> +	unsigned int lbs_ib;
> +	unsigned int lbs_inode;
> +	unsigned int lbs_sock;
> +	unsigned int lbs_superblock;
> +	unsigned int lbs_ipc;
> +	unsigned int lbs_key;
> +	unsigned int lbs_msg_msg;
> +	unsigned int lbs_perf_event;
> +	unsigned int lbs_task;
> +	unsigned int lbs_xattr_count; /* num xattr slots in new_xattrs array */
> +	unsigned int lbs_tun_dev;
> +	unsigned int lbs_bdev;
>  };
>  
>  /*
> diff --git a/security/lsm_init.c b/security/lsm_init.c
> index b1156f414491..aad363e37140 100644
> --- a/security/lsm_init.c
> +++ b/security/lsm_init.c
> @@ -169,16 +169,22 @@ static void __init lsm_order_append(struct lsm_info *lsm, const char *src)
>  		   lsm_is_enabled(lsm) ? "enabled" : "disabled");
>  }
>  
> -static void __init lsm_set_blob_size(int *need, int *lbs)
> +/**
> + * lsm_blob_size_update - Update the LSM blob size and offset information
> + * @sz_req: the requested additional blob size
> + * @sz_cur: the existing blob size
> + */
> +static void __init lsm_blob_size_update(unsigned int *sz_req,
> +					unsigned int *sz_cur)
>  {
> -	int offset;
> +	unsigned int offset;
>  
> -	if (*need <= 0)
> +	if (*sz_req == 0)
>  		return;
>  
> -	offset = ALIGN(*lbs, sizeof(void *));
> -	*lbs = offset + *need;
> -	*need = offset;
> +	offset = ALIGN(*sz_cur, sizeof(void *));
> +	*sz_cur = offset + *sz_req;
> +	*sz_req = offset;
>  }
>  
>  /**
> @@ -193,24 +199,27 @@ static void __init lsm_prepare(struct lsm_info *lsm)
>  		return;
>  
>  	/* Register the LSM blob sizes. */
> -	lsm_set_blob_size(&blobs->lbs_cred, &blob_sizes.lbs_cred);
> -	lsm_set_blob_size(&blobs->lbs_file, &blob_sizes.lbs_file);
> -	lsm_set_blob_size(&blobs->lbs_ib, &blob_sizes.lbs_ib);
> +	blobs = lsm->blobs;
> +	lsm_blob_size_update(&blobs->lbs_cred, &blob_sizes.lbs_cred);
> +	lsm_blob_size_update(&blobs->lbs_file, &blob_sizes.lbs_file);
> +	lsm_blob_size_update(&blobs->lbs_ib, &blob_sizes.lbs_ib);
>  	/* inode blob gets an rcu_head in addition to LSM blobs. */
>  	if (blobs->lbs_inode && blob_sizes.lbs_inode == 0)
>  		blob_sizes.lbs_inode = sizeof(struct rcu_head);
> -	lsm_set_blob_size(&blobs->lbs_inode, &blob_sizes.lbs_inode);
> -	lsm_set_blob_size(&blobs->lbs_ipc, &blob_sizes.lbs_ipc);
> -	lsm_set_blob_size(&blobs->lbs_key, &blob_sizes.lbs_key);
> -	lsm_set_blob_size(&blobs->lbs_msg_msg, &blob_sizes.lbs_msg_msg);
> -	lsm_set_blob_size(&blobs->lbs_perf_event, &blob_sizes.lbs_perf_event);
> -	lsm_set_blob_size(&blobs->lbs_sock, &blob_sizes.lbs_sock);
> -	lsm_set_blob_size(&blobs->lbs_superblock, &blob_sizes.lbs_superblock);
> -	lsm_set_blob_size(&blobs->lbs_task, &blob_sizes.lbs_task);
> -	lsm_set_blob_size(&blobs->lbs_tun_dev, &blob_sizes.lbs_tun_dev);
> -	lsm_set_blob_size(&blobs->lbs_xattr_count,
> -			  &blob_sizes.lbs_xattr_count);
> -	lsm_set_blob_size(&blobs->lbs_bdev, &blob_sizes.lbs_bdev);
> +	lsm_blob_size_update(&blobs->lbs_inode, &blob_sizes.lbs_inode);
> +	lsm_blob_size_update(&blobs->lbs_ipc, &blob_sizes.lbs_ipc);
> +	lsm_blob_size_update(&blobs->lbs_key, &blob_sizes.lbs_key);
> +	lsm_blob_size_update(&blobs->lbs_msg_msg, &blob_sizes.lbs_msg_msg);
> +	lsm_blob_size_update(&blobs->lbs_perf_event,
> +			     &blob_sizes.lbs_perf_event);
> +	lsm_blob_size_update(&blobs->lbs_sock, &blob_sizes.lbs_sock);
> +	lsm_blob_size_update(&blobs->lbs_superblock,
> +			     &blob_sizes.lbs_superblock);
> +	lsm_blob_size_update(&blobs->lbs_task, &blob_sizes.lbs_task);
> +	lsm_blob_size_update(&blobs->lbs_tun_dev, &blob_sizes.lbs_tun_dev);
> +	lsm_blob_size_update(&blobs->lbs_xattr_count,
> +			     &blob_sizes.lbs_xattr_count);
> +	lsm_blob_size_update(&blobs->lbs_bdev, &blob_sizes.lbs_bdev);
>  }
>  
>  /* Initialize a given LSM, if it is enabled. */

