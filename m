Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA865251EAF
	for <lists+selinux@lfdr.de>; Tue, 25 Aug 2020 19:55:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726611AbgHYRzw (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Tue, 25 Aug 2020 13:55:52 -0400
Received: from linux.microsoft.com ([13.77.154.182]:37968 "EHLO
        linux.microsoft.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726222AbgHYRzr (ORCPT
        <rfc822;selinux@vger.kernel.org>); Tue, 25 Aug 2020 13:55:47 -0400
Received: from [192.168.0.104] (c-73-42-176-67.hsd1.wa.comcast.net [73.42.176.67])
        by linux.microsoft.com (Postfix) with ESMTPSA id CC4AF20B4908;
        Tue, 25 Aug 2020 10:55:46 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com CC4AF20B4908
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
        s=default; t=1598378147;
        bh=YKXCbCue//pdXi+k2hqb4y4ts9efBcScYg5TJ0dpR0s=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=d+QChh2ta9SpLySOlZxpDbHXriGJQlnQZH/lItG8+zlweGBvR1bWnIMGkJ96gk77N
         RRSuj/L0bxxS3/bx+bv0FzNTc1OKZvSpka/pY1z+/L0k81gcJCbO2Ms2O9cmeoQHbL
         OTeXL+hkVLwjzLo3IeCsUaQtCADjZYcW2o/pOUzs=
Subject: Re: [PATCH] IMA: Handle early boot data measurement
To:     Mimi Zohar <zohar@linux.ibm.com>, stephen.smalley.work@gmail.com,
        casey@schaufler-ca.com
Cc:     tyhicks@linux.microsoft.com, tusharsu@linux.microsoft.com,
        sashal@kernel.org, jmorris@namei.org,
        linux-integrity@vger.kernel.org, selinux@vger.kernel.org,
        linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200821231230.20212-1-nramas@linux.microsoft.com>
 <a7ea2da1f895ee3db4697c00804160acb6db656e.camel@linux.ibm.com>
 <307617de-b42d-ac52-6e9e-9e0d16bbc20e@linux.microsoft.com>
 <49f8a616d80344c539b512f8b83590ea281ee54d.camel@linux.ibm.com>
From:   Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
Message-ID: <52d2204b-5b6e-e13f-d0dd-192a776812bc@linux.microsoft.com>
Date:   Tue, 25 Aug 2020 10:55:46 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <49f8a616d80344c539b512f8b83590ea281ee54d.camel@linux.ibm.com>
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On 8/25/20 10:42 AM, Mimi Zohar wrote:

>>>
>>> Please limit the changes in this patch to renaming the functions and/or
>>> files.  For example, adding "measure_payload_hash" should be a separate
>>> patch, not hidden here.
>>>
>>
>> Thanks for the feedback Mimi.
>>
>> I'll split this into 2 patches:
>>
>> PATCH 1: Rename files + rename CONFIG
>> PATCH 2: Update IMA hook to utilize early boot data measurement.
> 
> I'm referring to introducing the "measure_payload_hash" flag.  I assume
> this is to indicate whether the buffer should be hashed or not.
> 
> Example 1: ima_alloc_key_entry() and ima_alloc_data_entry(0 comparison
>> -static struct ima_key_entry *ima_alloc_key_entry(struct key *keyring,
>> -                                                const void *payload,
>> -                                                size_t payload_len)
>> -{
> 
> 
>> +static struct ima_data_entry *ima_alloc_data_entry(const char *event_name,
>> +                                                  const void *payload,
>> +                                                  size_t payload_len,
>> +                                                  const char *event_data,
>> +                                                  enum ima_hooks func,
>> +                                                  bool measure_payload_hash)  <====
>> +{
> 
> Example 2:
> diff --git a/security/integrity/ima/ima_asymmetric_keys.c b/security/integrity/ima/ima_asymmetric_keys.c
> index a74095793936..65423754765f 100644
> --- a/security/integrity/ima/ima_asymmetric_keys.c
> +++ b/security/integrity/ima/ima_asymmetric_keys.c
> @@ -37,9 +37,10 @@ void ima_post_key_create_or_update(struct key *keyring, struct key *key,
>          if (!payload || (payload_len == 0))
>                  return;
>   
> -       if (ima_should_queue_key())
> -               queued = ima_queue_key(keyring, payload, payload_len);
> -
> +       if (ima_should_queue_data())
> +               queued = ima_queue_data(keyring->description, payload,
> +                                       payload_len, keyring->description,
> +                                       KEY_CHECK, false);   <===
>          if (queued)
>                  return;
> 
> But in general, as much as possible function and file name changes
> should be done independently of other changes.
> 
> thanks,

I agree - but in this case, Tushar's patch series on adding support for 
"Critical Data" measurement has already introduced 
"measure_payload_hash" flag. His patch updates 
"process_buffer_measurement()" to take this new flag and measure hash of 
the given data.

My patches extend that to queuing the early boot requests and processing 
them after a custom IMA policy is loaded.

If you still think "measure_payload_hash" flag should be introduced in 
the queuing change as a separate patch I'll split the patches further. 
Please let me know.

thanks,
  -lakshmi


