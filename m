Return-Path: <selinux+bounces-113-lists+selinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 79BC3807FCC
	for <lists+selinux@lfdr.de>; Thu,  7 Dec 2023 05:51:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8A5EB1C20363
	for <lists+selinux@lfdr.de>; Thu,  7 Dec 2023 04:50:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32E09443E;
	Thu,  7 Dec 2023 04:50:56 +0000 (UTC)
X-Original-To: selinux@vger.kernel.org
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAEFD193
	for <selinux@vger.kernel.org>; Wed,  6 Dec 2023 20:50:50 -0800 (PST)
Received: from dggpemm100001.china.huawei.com (unknown [172.30.72.53])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Sm1zN2BmbzYspL;
	Thu,  7 Dec 2023 12:50:08 +0800 (CST)
Received: from [10.174.177.243] (10.174.177.243) by
 dggpemm100001.china.huawei.com (7.185.36.93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Dec 2023 12:50:47 +0800
Message-ID: <79f6131f-7d69-408d-917a-f0ca6fccc5b2@huawei.com>
Date: Thu, 7 Dec 2023 12:50:47 +0800
Precedence: bulk
X-Mailing-List: selinux@vger.kernel.org
List-Id: <selinux.vger.kernel.org>
List-Subscribe: <mailto:selinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:selinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Kefeng Wang <wangkefeng.wang@huawei.com>
Subject: Re: [PATCH v3 3/4] selinux: use vma_is_initial_stack() and
 vma_is_initial_heap()
To: Paul Moore <paul@paul-moore.com>, Ondrej Mosnacek <omosnace@redhat.com>
CC: Stephen Smalley <stephen.smalley.work@gmail.com>, SElinux list
	<selinux@vger.kernel.org>, "open list:MEMORY MANAGEMENT"
	<linux-mm@kvack.org>, David Hildenbrand <david@redhat.com>,
	<peterz@infradead.org>, Andrew Morton <akpm@linux-foundation.org>
References: <20230728050043.59880-1-wangkefeng.wang@huawei.com>
 <20230728050043.59880-4-wangkefeng.wang@huawei.com>
 <CAEjxPJ5ZuBGVDah0f3g0-7t2v1uSXTmp_cTT3g_MSP3J9QtoeA@mail.gmail.com>
 <CAHC9VhR_Tzbs=fE+D6VrP1boe7O_uHPu9yd7kfVppnB2vtPLOA@mail.gmail.com>
 <CAEjxPJ6iFRZUetSvMgZvq_327U_JZ_w9s=gFccKgJhfCt8bqNg@mail.gmail.com>
 <CAHC9VhRB1uVVWFUgnMZ1iwCD_A0mEX2Xhn79qTxuNKTzisWULg@mail.gmail.com>
 <CAFqZXNv0SVT0fkOK6neP9AXbj3nxJ61JAY4+zJzvxqJaeuhbFw@mail.gmail.com>
 <CAHC9VhSzrYOUAkM5-smu0rAZ7gWwPvR+TARWN9ojfaVACtYRew@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAHC9VhSzrYOUAkM5-smu0rAZ7gWwPvR+TARWN9ojfaVACtYRew@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm100001.china.huawei.com (7.185.36.93)
X-CFilter-Loop: Reflected



On 2023/12/7 4:47, Paul Moore wrote:
> On Wed, Dec 6, 2023 at 9:22 AM Ondrej Mosnacek <omosnace@redhat.com> wrote:
>>
>> (Restoring part of the Cc list to include more relevant lists &
>> people... If you are lost, the original email is here:
>> https://lore.kernel.org/selinux/20230728050043.59880-4-wangkefeng.wang@huawei.com/)
>>
>> On Tue, Aug 1, 2023 at 1:08 AM Paul Moore <paul@paul-moore.com> wrote:
>>> On Mon, Jul 31, 2023 at 4:02 PM Stephen Smalley
>>> <stephen.smalley.work@gmail.com> wrote:
>>>> On Mon, Jul 31, 2023 at 12:19 PM Paul Moore <paul@paul-moore.com> wrote:
>>>>>
>>>>> On Mon, Jul 31, 2023 at 10:26 AM Stephen Smalley
>>>>> <stephen.smalley.work@gmail.com> wrote:
>>>>>> I believe this patch yields a semantic change in the SELinux execheap
>>>>>> permission check. That said, I think the change is for the better.
>>>>>
>>>>> Agreed.  I'm also in favor of using a helper which is maintained by
>>>>> the VM folks over open coded logic in the SELinux code.
>>>>
>>>> Yes, only caveat is in theory it could trigger new execheap denials
>>>> under existing policies.
>>>> Trying to construct an example based on the
>>>> selinux-testsuite/tests/mmap/mprot_heap.c example but coming up empty
>>>> so far on something that both works and yields different results
>>>> before and after this patch.
>>>
>>> My gut feeling is that this will not be an issue, but I could very
>>> well be wrong.  If it becomes a significant issue we can revert the
>>> SELinux portion of the patch.
>>>
>>> Of course, if you have any luck demonstrating this with reasonable
>>> code, that would be good input too.
>>
>> So, it turns out this does affect actual code. Thus far, we know about
>> gcl [1] and wine [2]. The gcl case is easy to reproduce (just install
>> gcl on Fedora and run gcl without arguments), so I was able to dig a
>> bit deeper.
>>
>> gcl has the following relevant memory mappings as captured by gdb:
>> Start Addr           End Addr       Size     Offset  Perms  objfile
>>    0x413000           0xf75000   0xb62000   0x3fa000  rw-p
>> /usr/lib/gcl-2.6.14/unixport/saved_ansi_gcl
>>    0xf75000           0xf79000     0x4000        0x0  rwxp   [heap]
>>
>> It tries to call mprotect(0x883000, 7282688,
>> PROT_READ|PROT_WRITE|PROT_EXEC), i.e. it tries to make the region
>> 0x883000 - 0xf75000 executable. Before this patch it was allowed,
>> whereas now it triggers an execheap SELinux denial. But this seems
>> wrong - the affected region is merely adjacent to the [heap] region,
>> it does not actually overlap with it. So even if we accept that the
>> correct semantics is to catch any region that overlaps with the heap
>> (before only subregions of the heap were subject to the execheap
>> check), this corner case doesn't seem to be handled correctly by the
>> new check (and the same bug seems to have been in fs/proc/task_mmu.c
>> before commit 11250fd12eb8 ("mm: factor out VMA stack and heap
>> checks")).

Yes, the heap check exists for a long time,

                          [start_brk        brk]
case1:                     [vm_start,vm_end]
case2:             [vm_start,vm_end]
case3:                               [vm_start,vm_end]
case4:         [vm_start,                      vm_end]

case5:   [vm_start,vm_end]
case6:                                          [vm_start,vm_end]

old check:
vma->vm_start >= vma->vm_mm->start_brk && vma->vm_end <= vma->vm_mm->brk

Only include case1， vma range must be within heap

new check:
vma->vm_start <= vma->vm_mm->brk && vma->vm_end >= vma->vm_mm->start_brk

Include case1~case6, but case5(vm_end=start_brk) and case6(vm_start=brk)
are the corner cases, gcl issue matchs the case5.

>>
>> I didn't analyze the wine case ([2]), but it may be the same situation.
>>
>> Unless I'm mistaken, those <= & >= in should in fact be just < & >.

I support this change.
  vma->vm_start < vma->vm_mm->brk && vma->vm_end > vma->vm_mm->start_brk

>> And the expression in vma_is_initial_stack() is also suspicious (but
>> I'm not going to make any assumption on what is the intended semantics
>> there...)
>>
>> [1] https://bugzilla.redhat.com/show_bug.cgi?id=2252391
>> [2] https://bugzilla.redhat.com/show_bug.cgi?id=2247299

Could you quickly verify after the above change?
> 
> Thanks Ondrej.
> 
> I'm hoping the mm folks will comment on this as it looks like this is
> an issue with the helper functions, but just in case I'm going to prep
> a revert for just the SELinux changes.  If we don't hear anything in
> the next couple of days I'll send the revert up to Linus with the idea
> that we can eventually shift back to the helpers when this is sorted.
> 

