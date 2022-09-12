Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB8485B5A77
	for <lists+selinux@lfdr.de>; Mon, 12 Sep 2022 14:51:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229542AbiILMve (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Mon, 12 Sep 2022 08:51:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229693AbiILMvd (ORCPT
        <rfc822;selinux@vger.kernel.org>); Mon, 12 Sep 2022 08:51:33 -0400
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id EFBF82F016
        for <selinux@vger.kernel.org>; Mon, 12 Sep 2022 05:51:32 -0700 (PDT)
Received: from [192.168.1.10] (pool-173-66-202-112.washdc.fios.verizon.net [173.66.202.112])
        by linux.microsoft.com (Postfix) with ESMTPSA id 6F486204A5AA;
        Mon, 12 Sep 2022 05:51:32 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 6F486204A5AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
        s=default; t=1662987092;
        bh=iW3kWkGUIsDqEGzex4hoTWnB36zkobgAyZeHlAokn64=;
        h=Date:Subject:To:References:From:In-Reply-To:From;
        b=hq0EzpJkzdcIlsGmSWvY0EFBfZD/seqK2Pio8KpuZxrGYXtSaGGLVaB3SCTirPZfb
         4zOWWtNOVJpmEPKdpa8k4D8AkLHbqognoZKV5Pjr1IyLxSHsZ8Uownx/sNdPw0gn/v
         PegPZF2M2O5Qzw2CkFFnUmH9TYDabiAckfGG0Bzw=
Message-ID: <67b3cb8d-bc04-2585-f27a-1e74c4fa78f9@linux.microsoft.com>
Date:   Mon, 12 Sep 2022 08:51:32 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] python/chcat: Don't fail on missing translation files
Content-Language: en-US
To:     Johannes Segitz <jsegitz@suse.de>, selinux@vger.kernel.org
References: <20220912074043.GB5803@suse.com>
From:   Daniel Burgener <dburgener@linux.microsoft.com>
In-Reply-To: <20220912074043.GB5803@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-22.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On 9/12/2022 3:40 AM, Johannes Segitz wrote:
> Exception handling was not in line with other files, causing chcat to
> fail if translation files were not available
> 
> Signed-off-by: Johannes Segitz <jsegitz@suse.de>
> ---
>   python/chcat/chcat | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/python/chcat/chcat b/python/chcat/chcat
> index e779fcc6..1b93e99b 100755
> --- a/python/chcat/chcat
> +++ b/python/chcat/chcat
> @@ -40,7 +40,7 @@ try:
>                       localedir="/usr/share/locale",
>                       **kwargs)
>       _ = t.gettext
> -except ImportError:
> +except:
>       try:
>           import builtins
>           builtins.__dict__['_'] = str
> --
> 2.35.3

I believe this was already fixed by 
https://lore.kernel.org/selinux/87tu83r2zk.fsf@redhat.com/T/#m55d405c1504f7bc4ffff5f5ea9152b45fdf6848d 
(commit 344463076b2a91e1d2c7f5cc3835dc1a53a05e88)?

-Daniel
