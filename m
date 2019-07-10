Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4360B62B6E
	for <lists+selinux@lfdr.de>; Tue,  9 Jul 2019 00:26:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726575AbfGHW0l (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Mon, 8 Jul 2019 18:26:41 -0400
Received: from mga11.intel.com ([192.55.52.93]:13922 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726371AbfGHW0l (ORCPT <rfc822;selinux@vger.kernel.org>);
        Mon, 8 Jul 2019 18:26:41 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 08 Jul 2019 15:26:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,468,1557212400"; 
   d="scan'208";a="167801457"
Received: from bxing-desk.ccr.corp.intel.com (HELO [134.134.148.187]) ([134.134.148.187])
  by orsmga003.jf.intel.com with ESMTP; 08 Jul 2019 15:26:40 -0700
Subject: Re: [RFC PATCH v3 0/4] security/x86/sgx: SGX specific LSM hooks
To:     Sean Christopherson <sean.j.christopherson@intel.com>
Cc:     linux-sgx@vger.kernel.org, linux-security-module@vger.kernel.org,
        selinux@vger.kernel.org, casey.schaufler@intel.com,
        jmorris@namei.org, luto@kernel.org, jethro@fortanix.com,
        greg@enjellic.com, sds@tycho.nsa.gov,
        jarkko.sakkinen@linux.intel.com
References: <cover.1561588012.git.cedric.xing@intel.com>
 <cover.1562542383.git.cedric.xing@intel.com>
 <20190708155524.GD20433@linux.intel.com>
 <8ba6c32d-cedc-53fd-9e86-f78be0067ac3@intel.com>
 <20190708184955.GC20791@linux.intel.com>
From:   "Xing, Cedric" <cedric.xing@intel.com>
Message-ID: <25585bb7-fb29-97c6-9ce1-5d7f192ab0f2@intel.com>
Date:   Mon, 8 Jul 2019 15:26:41 -0700
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190708184955.GC20791@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Hi Sean,

What's in my cover letter is my assessment on what's in your series. You 
may disagree. But I don't think it productive until you can prove your 
points in code.

The key points I'm making are:
(1) The impact to user mode code due to UAPI change is more significant 
than you have envisioned.
(2) Your series has implemented less than required in practice.

For #1, regular shared objects don't carry info like whether it contains 
self-modifying code or generates code on the fly. So your requirement of 
"maximal protection" is new, and you should at least put together a 
story to show everyone how it could be met, especially without changing 
build tools.

For #2, SGX2 is imminent, and the upcoming ICX server will support 512GB 
of EPC. So the problems in mprotect() performance and EAUG-on-#PF must 
be solved, let alone other problems. I guess you have to code them up so 
everyone will be able to evaluate whether your approach is really as 
simple as you have claimed.

-Cedric

On 7/8/2019 11:49 AM, Sean Christopherson wrote:
> On Mon, Jul 08, 2019 at 10:49:59AM -0700, Xing, Cedric wrote:
>> On 7/8/2019 8:55 AM, Sean Christopherson wrote:
>>> On Sun, Jul 07, 2019 at 04:41:30PM -0700, Cedric Xing wrote:
>> True only for SGX1.
>>>>      “maximal protection” at page load time, but such information is NOT always
>>>>      available. For example, Graphene containers may run different applications
>>>>      comprised of different set of executables and/or shared objects. Some of
>>>>      them may contain self-modifying code (or text relocation) while others
>>>>      don’t. The generic enclave loader usually doesn’t have such information so
>>>>      wouldn’t be able to provide it ahead of time.
>>>
>>> I'm unconvinced that it would be remotely difficult to teach an enclave
>>> loader that an enclave or hosted application employs SMC, relocation or
>>> any other behavior that would require declaring RWX on all pages.
>>
>> You've been talking as if "enclave loader" is tailored to the enclave it is
>> loading. But in reality "enclave loader" is usually a library knowing
>> usually nothing about the enclave. How could it know if an enclave contains
>> self-modifying code?
> 
> Given the rarity of SMC, require enclaves to declare "I do SMC"...  The
> Intel SDK already requires the enclave developer to declare heap size,
> stack size, thread affinity, etc...  I have a very hard time believing
> that it can't support SMC and relocation flags.
>   
>>>>    · Inefficient Auditing – Audit logs are supposed to help system
>>>>      administrators to determine the set of minimally needed permissions and to
>>>>      detect abnormal behaviors. But consider the “maximal protection” model, if
>>>>      “maximal protection” is set to be too permissive, then audit log wouldn’t
>>>>      be able to detect anomalies;
>>>
>>> Huh?  Declaring overly permissive protections is only problematic if an
>>> LSM denies the permission, in which case it will generate an accurate
>>> audit log.
>>>
>>> If the enclave/loader "requires" a permission it doesn't actually need,
>>> e.g. EXECDIRTY, then it's a software bug that should be fixed.  I don't
>>> see how this scenario is any different than an application that uses
>>> assembly code without 'noexecstack' and inadvertantly "requires"
>>> EXECSTACK due to triggering "read implies exec".  In both cases the
>>> denied permission is unnecessary due to a userspace application bug.
>>
>> You see, you've been assuming "enclave loader" knows everything and tailored
>> to what it loads in a particular application. But the reality is the loader
>> is generic and probably shared by multiple applications.
> 
> No, I'm assuming that an enclave can communicate its basic needs without
> undue pain.
> 
>> It needs some generic way to figure out the "maximal protection". An
>> implementation could use information embedded in the enclave file, or could
>> just be "configurable". In the former case, you put extra burdens on the build
>> tools, while in the latter case, your audit logs cannot help generating an
>> appropriate configuration.
> 
> I'm contending the "extra burdens" is minimal.
> 
>    if (do_smc || do_relocation)
>            max_prot = RWX;
>    else
>            max_prot = SECINFO.FLAGS;
> 
>>>>      or if “maximal protection” is too restrictive,
>>>>      then audit log cannot identify the file violating the policy.
>>>
>>> Maximal protections that are too restrictive are completely orthogonal to
>>> LSMs as the enclave would fail to run irrespective of LSMs.  This is no
>>> different than specifying the wrong RWX flags in SECINFO, or opening a
>>> file as RO instead of RW.
>>
>> Say loader is configurable. By looking at the log, can an administrator tell
>> which file has too restrictive "maximal protection"?
> 
> Again, this fails irrespective of LSMs.  So the answer is "no", because
> there is no log.  But the admin will never have to deal with this issue
> because the enclave will *never* run, i.e. would unconditionally fail to
> run during initial development.  And the developer has bigger problems if
> they can't debug their own code.
> 
>>>> In either case the audit log cannot fulfill its purposes.
