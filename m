Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DAD5A26B316
	for <lists+selinux@lfdr.de>; Wed, 16 Sep 2020 01:00:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727333AbgIOXAK (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Tue, 15 Sep 2020 19:00:10 -0400
Received: from linux.microsoft.com ([13.77.154.182]:58032 "EHLO
        linux.microsoft.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726205AbgIOPEh (ORCPT
        <rfc822;selinux@vger.kernel.org>); Tue, 15 Sep 2020 11:04:37 -0400
Received: from chpebeni.northamerica.corp.microsoft.com (pool-108-15-23-247.bltmmd.fios.verizon.net [108.15.23.247])
        by linux.microsoft.com (Postfix) with ESMTPSA id 40E6220A1B0A;
        Tue, 15 Sep 2020 08:04:23 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 40E6220A1B0A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
        s=default; t=1600182263;
        bh=hQ2/AyaW3BSZZayZPUjCHhl5iTHnIbUrjKDxQYOTZHY=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=DDeSKvxw3aRwhjklunZJnJoxOUvELDTtA1Ts+Tx3eA8sSSFZrVX4iRrcTb72RARav
         1n1qpWjRYSsdIaVVYkfBs0pWJIF1pE1w+2S6h9UTLEhtVwYm2p/tdcFce+nDJmkm0z
         bOHafGwA38dsd/QQYycHjTcxd/GDN650ge8VpJhE=
Subject: Re: [RFC PATCH 1/1] libselinux: Revise userspace AVC avc_log() for
 auditable events.
To:     Stephen Smalley <stephen.smalley.work@gmail.com>
Cc:     SElinux list <selinux@vger.kernel.org>,
        Steve Grubb <sgrubb@redhat.com>
References: <20200915130516.561693-1-chpebeni@linux.microsoft.com>
 <CAEjxPJ77s7WHqixbD60LnEOG_+WYc2mOj0cTPMoKXqk8M5zqBg@mail.gmail.com>
 <6bff0d2f-5e33-213f-dfe5-e3af01474860@linux.microsoft.com>
 <CAEjxPJ7Wj6R9y00=m1z9-qrC2+1onVOQQagD+WV0LxXpcJJCtg@mail.gmail.com>
From:   Chris PeBenito <chpebeni@linux.microsoft.com>
Message-ID: <ddf77261-7fa4-9ff6-01ed-3ac0f3c9e2cc@linux.microsoft.com>
Date:   Tue, 15 Sep 2020 11:04:22 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <CAEjxPJ7Wj6R9y00=m1z9-qrC2+1onVOQQagD+WV0LxXpcJJCtg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On 9/15/20 10:43 AM, Stephen Smalley wrote:
> On Tue, Sep 15, 2020 at 10:33 AM Chris PeBenito
> <chpebeni@linux.microsoft.com> wrote:
>>
>> On 9/15/20 9:34 AM, Stephen Smalley wrote:
>>> On Tue, Sep 15, 2020 at 9:11 AM Chris PeBenito
>>> <chpebeni@linux.microsoft.com> wrote:
>>>> diff --git a/libselinux/src/avc_internal.c b/libselinux/src/avc_internal.c
>>>> index 572b2159..35ea59b6 100644
>>>> --- a/libselinux/src/avc_internal.c
>>>> +++ b/libselinux/src/avc_internal.c
>>>> @@ -59,14 +59,14 @@ int avc_process_setenforce(int enforcing)
>>>>           int rc = 0;
>>>>
>>>>           avc_log(SELINUX_SETENFORCE,
>>>> -               "%s:  received setenforce notice (enforcing=%d)\n",
>>>> +               "%s:  op=setenforce lsm=selinux_uavc enforcing=%d res=1",
>>>>                   avc_prefix, enforcing);
>>>>           if (avc_setenforce)
>>>>                   goto out;
>>>>           avc_enforcing = enforcing;
>>>>           if (avc_enforcing && (rc = avc_ss_reset(0)) < 0) {
>>>>                   avc_log(SELINUX_ERROR,
>>>> -                       "%s:  cache reset returned %d (errno %d)\n",
>>>> +                       "%s:  op=cache_reset lsm=selinux_uavc rc=%d errno=%d res=0",
>>>>                           avc_prefix, rc, errno);
>>>
>>> If we do this at all, I would think the op= would still be setenforce
>>> and this would just be an error for it.
>>
>> At this point we already audited success for the setenforce operation.  Wouldn't
>> it be confusing to have a op=setenforce res=1 and then immediately op=setenforce
>> res=0?
> 
> Yes.  On second thought, I don't think any of the SELINUX_ERROR
> messages are intended for audit and since that is already a different
> type value, the callbacks can already redirect those to stderr or
> syslog as appropriate instead of audit.

Are the typebounds and validatetrans in UAVC passed to the kernel for 
evaluation? The kernel audits failures on those as SELINUX_ERR.  If the UAVC 
handles them itself, it seems that those failures should be audited as 
USER_SELINUX_ERR.


-- 
Chris PeBenito
