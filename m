Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8706B54A38D
	for <lists+selinux@lfdr.de>; Tue, 14 Jun 2022 03:26:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229853AbiFNBSx (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Mon, 13 Jun 2022 21:18:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349139AbiFNBSp (ORCPT
        <rfc822;selinux@vger.kernel.org>); Mon, 13 Jun 2022 21:18:45 -0400
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9272A13CD0;
        Mon, 13 Jun 2022 18:18:41 -0700 (PDT)
Received: from dggpeml500023.china.huawei.com (unknown [172.30.72.53])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4LMVq95HPPzRjHT;
        Tue, 14 Jun 2022 09:15:17 +0800 (CST)
Received: from [10.67.110.112] (10.67.110.112) by
 dggpeml500023.china.huawei.com (7.185.36.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Tue, 14 Jun 2022 09:18:34 +0800
Subject: Re: [PATCH -next] selinux: Fix potential memory leak in
 selinux_add_opt
To:     Paul Moore <paul@paul-moore.com>
CC:     <stephen.smalley.work@gmail.com>, <eparis@parisplace.org>,
        <omosnace@redhat.com>, <selinux@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20220611090550.135674-1-xiujianfeng@huawei.com>
 <CAHC9VhSwYdrHw8jNYxWApPYMjnmX-ZDN1=CzmRBeS1HoL-KOOA@mail.gmail.com>
From:   xiujianfeng <xiujianfeng@huawei.com>
Message-ID: <c54658e5-f0bd-b3f6-3cf8-d7d0e8b1c4df@huawei.com>
Date:   Tue, 14 Jun 2022 09:18:34 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <CAHC9VhSwYdrHw8jNYxWApPYMjnmX-ZDN1=CzmRBeS1HoL-KOOA@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.110.112]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpeml500023.china.huawei.com (7.185.36.114)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Hi,

在 2022/6/14 4:22, Paul Moore 写道:
> On Sat, Jun 11, 2022 at 5:07 AM Xiu Jianfeng <xiujianfeng@huawei.com> wrote:
>> In the entry of selinux_add_opt, *mnt_opts may be assigned to new
>> allocated memory, and also may be freed and reset at the end of the
>> function. however, if security_context_str_to_sid failed, it returns
>> directly and skips the procedure for free and reset, even if it may be
>> handled at the caller of this function, It is better to handle it
>> inside.
>>
>> Fixes: 70f4169ab421 ("selinux: parse contexts for mount options early")
>> Signed-off-by: Xiu Jianfeng <xiujianfeng@huawei.com>
>> ---
>>   security/selinux/hooks.c | 12 +++++++-----
>>   1 file changed, 7 insertions(+), 5 deletions(-)
> Have you actually observed a memory leak from the selinux_mnt_opts
> allocation in selinux_add_opt()?
>
> The selinux_add_opt() function has two callers:
> selinux_sb_eat_lsm_opts() and selinux_fs_context_parse_param().  The
> former cleans up the selinux_mnt_opts allocation it its error handler
> while the latter will end up calling
> security_free_mnt_opts()/selinux_free_mnt_opts() to free the
> fs_context:security when the fs_context is destroyed.
>
> This patch shouldn't be necessary.

I may not have made it clear, I said potential means may have a third 
caller in the future. Anyway,

Yes, you are right,  currently no memleak here, because the two callers 
will do the cleanup, from this point of view,

I think the error handler as following is not necessary:

err:
         if (is_alloc_opts) {
                 kfree(opts);
                 *mnt_opts = NULL;
         }

otherwise, some error paths goto err label while others don't, It's 
confusing.

