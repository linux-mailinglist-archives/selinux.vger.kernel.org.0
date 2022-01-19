Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A70D2493AD2
	for <lists+selinux@lfdr.de>; Wed, 19 Jan 2022 14:04:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354077AbiASNEY (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Wed, 19 Jan 2022 08:04:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354561AbiASNEY (ORCPT
        <rfc822;selinux@vger.kernel.org>); Wed, 19 Jan 2022 08:04:24 -0500
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9524C061574
        for <selinux@vger.kernel.org>; Wed, 19 Jan 2022 05:04:23 -0800 (PST)
Received: by mail-ed1-x532.google.com with SMTP id f17so2384609edw.2
        for <selinux@vger.kernel.org>; Wed, 19 Jan 2022 05:04:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=from:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=un0MftPoZKkrf7WinBejKpvMVAi8cI0700Mj5B+o9B0=;
        b=ftnOfEcJNEg13cu3Q8tuREERm/ZlGjTMbX7/3hs7+mvTVjKOO2rvcJ80AFMbbZivzW
         5HfD+oIkNPy1Uwcs4zAUXUpXrvj8xHtVHmWQT9EnBnjx1yw0ShefzfvFujTvrvspdDTe
         N7QSPZUQfwJvCBtSxNIXO1n8VeC1up2YMyr3Fc4KD0QnEdM/NqFC5iyS+D1QGlI7SMdI
         4hFxexBImWcqLewBEbfJwqQIkPhiVoM37Pk379wC9iSJzKKTvYLMPpXOySGL0oDXWxDr
         3aDHrjPG+Fnw3uoQjStkcDurE6BAjuHJDTXPx52kJedTsNuGX1bcsvt2uUUneday3mFo
         icbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=un0MftPoZKkrf7WinBejKpvMVAi8cI0700Mj5B+o9B0=;
        b=0Mz/Dh71cyFudjVE5bpbWtxzy/3hiGmrGcBkZaf+nKV6pXWmp4TiUA729eMgI2CJ3g
         YNucyjxikaG3x07CthvhYjOW4EkRpFVSPnZRdbDSt/g+ZeJ/vCjZxnkf4YDiHTI1Kfrm
         aVwgxcoL7KRUS5vVw9LQ6IooiU/z/3ijH0tOGPKV4lfMoY5doP1cPrJb3a4OogHkATwl
         jLJQNdgPrUEIW82uG381Ff1Ru0RJhEAgEILvFKpXEcFEYVx6yUIvW8kILlKj7Qrt9u3n
         BrKhXx3xetnrg1a3KoSK1L686riMRsCEhgw1aH/+68THBBRALSebZJJzF3gQmDB4r2ku
         58EQ==
X-Gm-Message-State: AOAM5317BT+3/o3i63XEU9K/ZLLhOJLjVr0ooSXamj1i7i7YVtmJKoau
        4bchWqLeaDBWI4ehBJoQTf0=
X-Google-Smtp-Source: ABdhPJwTVerW/iqrqEiXlijEKfFzHF0YImCXr+qlUTUE74CDdqCbNJaAFr4+qF6PdWMxg1PWDtRF9w==
X-Received: by 2002:a50:8ad0:: with SMTP id k16mr3485165edk.368.1642597462191;
        Wed, 19 Jan 2022 05:04:22 -0800 (PST)
Received: from [10.200.5.195] (opnsense.lrt.ed.tum.de. [129.187.5.241])
        by smtp.gmail.com with ESMTPSA id z6sm1259078edb.58.2022.01.19.05.04.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Jan 2022 05:04:21 -0800 (PST)
From:   bauen1 <j2468h@googlemail.com>
X-Google-Original-From: bauen1 <j2468h@gmail.com>
Message-ID: <d6716dff-d46a-9a2f-3033-fe1bf0205681@gmail.com>
Date:   Wed, 19 Jan 2022 14:04:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH 1/2] libsepol/cil: Limit the amount of reporting for
 neverallow violations
Content-Language: en-US
To:     James Carter <jwcart2@gmail.com>, bauen1 <j2468h@googlemail.com>
Cc:     SElinux list <selinux@vger.kernel.org>
References: <20220114192002.730773-1-jwcart2@gmail.com>
 <dd96ca20-2f8f-ea6c-48b8-6649915fac1c@gmail.com>
 <CAP+JOzSeF50B5fYCLLKJpnGCXXWwxkEDEFU=61ZUY-TyLU7E+g@mail.gmail.com>
In-Reply-To: <CAP+JOzSeF50B5fYCLLKJpnGCXXWwxkEDEFU=61ZUY-TyLU7E+g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org


On 1/18/22 16:48, James Carter wrote:
> On Fri, Jan 14, 2022 at 2:44 PM bauen1 <j2468h@googlemail.com> wrote:
>>
>> Hi,
>>
>> as a heavy user of neverallow / neverallowx, please don't limit this.
>>
>> When adding a new neverallow rule there might quite a few types violating them, and having to rebuild the policy every 2 types would make fixing them incredibly annoying.
>>
>> If you want to limit this, then please make it opt-in or add it as a command line option.
>>
> 
> I am trying to limit error messages because oss-fuzz seems to be good
> at creating policies that generate a lot of error messages and
> subsequently take a lot of time to process.
> 
> But I am not going to do that at the expense of people actually using secilc.
> 
> I was already thinking about making the amount of error reporting
> depending on the verbosity level. What would think of it limiting it
> to two by default, but unlimited at any higher verbosity level. I can
> even add a message to use "-v" to see all of the errors.

Thanks, something like that would be totally fine for me.

> Jim
> 
> 
>> On 1/14/22 20:20, James Carter wrote:
>>> When there is a neverallow violation, a search is made for all of
>>> the rules that violate the neverallow. The violating rules as well
>>> as their parents are written out to make it easier to find these
>>> rules.
>>>
>>> If there is a lot of rules that violate a neverallow, then this
>>> amount of reporting is too much. Instead, only print out the first
>>> two rules (with their parents) that match the violated neverallow
>>> rule along with the total number of rules that violate the
>>> neverallow.
>>>
>>> Signed-off-by: James Carter <jwcart2@gmail.com>
>>> ---
>>>    libsepol/cil/src/cil_binary.c | 10 ++++++++++
>>>    1 file changed, 10 insertions(+)
>>>
>>> diff --git a/libsepol/cil/src/cil_binary.c b/libsepol/cil/src/cil_binary.c
>>> index 4ac8ce8d..04a5d053 100644
>>> --- a/libsepol/cil/src/cil_binary.c
>>> +++ b/libsepol/cil/src/cil_binary.c
>>> @@ -4640,6 +4640,8 @@ static int __cil_print_neverallow_failure(const struct cil_db *db, struct cil_tr
>>>        char *neverallow_str;
>>>        char *allow_str;
>>>        enum cil_flavor avrule_flavor;
>>> +     int num_matching = 0;
>>> +     int count_matching = 0;
>>>
>>>        target.rule_kind = CIL_AVRULE_ALLOWED;
>>>        target.is_extended = cil_rule->is_extended;
>>> @@ -4666,11 +4668,19 @@ static int __cil_print_neverallow_failure(const struct cil_db *db, struct cil_tr
>>>                goto exit;
>>>        }
>>>
>>> +     cil_list_for_each(i2, matching) {
>>> +             num_matching++;
>>> +     }
>>>        cil_list_for_each(i2, matching) {
>>>                n2 = i2->data;
>>>                r2 = n2->data;
>>>                __cil_print_parents("    ", n2);
>>>                __cil_print_rule("      ", allow_str, r2);
>>> +             count_matching++;
>>> +             if (count_matching >= 2) {
>>> +                     cil_log(CIL_ERR, "    Only first 2 of %d matching rules shown\n", num_matching);
>>> +                     break;
>>> +             }
>>>        }
>>>        cil_log(CIL_ERR,"\n");
>>>        cil_list_destroy(&matching, CIL_FALSE);
>>
>> --
>> bauen1
>> https://dn42.bauen1.xyz/

-- 
bauen1
https://dn42.bauen1.xyz/
