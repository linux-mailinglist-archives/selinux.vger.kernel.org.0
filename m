Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 06F407B0C7C
	for <lists+selinux@lfdr.de>; Wed, 27 Sep 2023 21:27:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229682AbjI0T1K (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Wed, 27 Sep 2023 15:27:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229694AbjI0T1J (ORCPT
        <rfc822;selinux@vger.kernel.org>); Wed, 27 Sep 2023 15:27:09 -0400
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 77D53F4
        for <selinux@vger.kernel.org>; Wed, 27 Sep 2023 12:27:07 -0700 (PDT)
Received: from [192.168.1.13] (pool-96-241-22-207.washdc.fios.verizon.net [96.241.22.207])
        by linux.microsoft.com (Postfix) with ESMTPSA id ABBE420B74C0;
        Wed, 27 Sep 2023 12:27:06 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com ABBE420B74C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
        s=default; t=1695842826;
        bh=cx9iEMGBxczQTpEkO0WNC2kQGBFBRRmsNRXVO48o+lY=;
        h=Date:Subject:To:References:From:In-Reply-To:From;
        b=iY7bNyGiG9UpywdQnPUgvwxbrcUK+62D2BeOo+5w5lathD49Wq8SlikiduUGAYZvk
         cbjd+7DaJS+u1YZxAuGD7Grr56PGFB99ZLsL1t8VYowsZa1JzBJJKl2+XmFxDwTqJI
         StjFwet8bCiQFZaXytZJ2W0xA03FPMOwPHFB9qjM=
Message-ID: <4b23ff1b-6b93-f21b-26f4-193efcd9db93@linux.microsoft.com>
Date:   Wed, 27 Sep 2023 15:27:05 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 1/9] libsepol/cil: Use struct cil_db * instead of void *
Content-Language: en-US
To:     James Carter <jwcart2@gmail.com>, selinux@vger.kernel.org
References: <20230927190021.1164278-1-jwcart2@gmail.com>
 <20230927190021.1164278-2-jwcart2@gmail.com>
From:   Daniel Burgener <dburgener@linux.microsoft.com>
In-Reply-To: <20230927190021.1164278-2-jwcart2@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-19.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,USER_IN_DEF_DKIM_WL,
        USER_IN_DEF_SPF_WL autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

> @@ -3661,21 +3615,17 @@ static int cil_check_for_bad_inheritance(struct cil_tree_node *node)
>   	return rc;
>   }
>   
> -static int __cil_resolve_ast_node(struct cil_tree_node *node, void *extra_args)
> +static int __cil_resolve_ast_node(struct cil_tree_node *node, struct cil_args_resolve *args)
>   {
>   	int rc = SEPOL_OK;
> -	struct cil_args_resolve *args = extra_args;
> +	struct cil_db *db = args->db;
>   	enum cil_pass pass = 0;
>   
> -	if (node == NULL || args == NULL) {
> -		goto exit;
> -	}
> -

Is deleting the "node == NULL" part of this check intended here?  It 
seems unrelated to the rest of the commit, and it's not locally obvious 
that it's safe.


