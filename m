Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A9EF3CD62A
	for <lists+selinux@lfdr.de>; Mon, 19 Jul 2021 15:54:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240602AbhGSNNo (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Mon, 19 Jul 2021 09:13:44 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:7392 "EHLO
        szxga02-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239282AbhGSNNo (ORCPT
        <rfc822;selinux@vger.kernel.org>); Mon, 19 Jul 2021 09:13:44 -0400
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.54])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4GT3C63rq9z7wYk;
        Mon, 19 Jul 2021 21:50:42 +0800 (CST)
Received: from dggpeml500023.china.huawei.com (7.185.36.114) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 19 Jul 2021 21:54:20 +0800
Received: from [10.67.110.112] (10.67.110.112) by
 dggpeml500023.china.huawei.com (7.185.36.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 19 Jul 2021 21:54:20 +0800
Subject: Re: issues about selinux namespace
To:     Stephen Smalley <stephen.smalley.work@gmail.com>,
        <jamorris@linux.microsoft.com>
CC:     "Likun(OSLab)" <hw.likun@huawei.com>,
        <linux-security-module@vger.kernel.org>, <selinux@vger.kernel.org>
References: <22c0d7a1-b658-64ce-f099-0b3617ef8e38@huawei.com>
 <CAEjxPJ5-w83HMRGuDHHqMthkju3bxT0gZ-EiiTE=t5UhQqQ_ug@mail.gmail.com>
From:   xiujianfeng <xiujianfeng@huawei.com>
Message-ID: <ec36e53f-5a6d-b86e-790c-d58b7b503aae@huawei.com>
Date:   Mon, 19 Jul 2021 21:54:19 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <CAEjxPJ5-w83HMRGuDHHqMthkju3bxT0gZ-EiiTE=t5UhQqQ_ug@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.110.112]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpeml500023.china.huawei.com (7.185.36.114)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

thanks stepthen,  I've found James's patch in 
https://lwn.net/Articles/737949/,

but it seems can't resolve my questions, so any futher discussion would 
be helpfull and welcome.

在 2021/7/14 20:11, Stephen Smalley 写道:
> Please take your email to the selinux@vger.kernel.org. You are the
> second person to ask about selinux namespaces within the past week or
> so. I did upstream the refactoring and encapsulation of the data
> structures and code via the selinux_state patches, so those are in the
> mainline kernel these days, and Paul Moore and I have periodically
> re-based the remaining patches on top of upstream over in the
> https://github.com/SELinuxProject/selinux-kernel/tree/working-selinuxns
> branch. However, I had to drop the inode and superblock per-ns patches
> temporarily because of changes to LSM (inode blob management moved to
> the LSM framework out of the security modules), so that would need to
> be revisited. There was a separate patch from James Morris to support
> per-namespace security.selinux extended attributes; you can dig that
> out from the history or mailing lists if you want to revive that. I
> won't be able to look at it again until October at the earliest.
>
> On Wed, Jul 14, 2021 at 6:54 AM xiujianfeng <xiujianfeng@huawei.com> wrote:
>> Hi Stephen,
>>
>> I am writing to discuss about selinux namespace because I found your
>> previous work on github and I think selinux namespace is helpful to
>> harden container security. So I try to do further work but there are
>> some issues mentioned in the commit message and I have no idea how to
>> fix them, it would be great if I can get help from you.
>> First is about selinux hook functions, we need to update each hook to
>> perform its processing on current namespace and all of its ancestors,
>> for object, we can have different sid/tag in different namespace based
>> on inode namespace support, but for task, do we need to maintain each
>> security context generated in the corresponding namespace?
>> Second is the lifecycle management of on-disk inode labels. it's not
>> easy to handle this, should we clean all corresponding labels on disk
>> when namespace exit? if we do this, it may cost long time to iterate
>> inode on disk and must relabel files when container restart, if not, the
>> inode xattr space maybe full and cannot write label again when new
>> namespace starts.
>> BTW, do you have plan to finish the work?
>>
>> I look forward to receiving your reply.
>>
>> Best wishes.
> .
