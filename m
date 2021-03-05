Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A34F32F1DA
	for <lists+selinux@lfdr.de>; Fri,  5 Mar 2021 18:53:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229558AbhCERxJ (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Fri, 5 Mar 2021 12:53:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:42275 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229768AbhCERws (ORCPT
        <rfc822;selinux@vger.kernel.org>); Fri, 5 Mar 2021 12:52:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1614966768;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=QE/iJV2Ertj11OVFp778m+GGYr2DAqaJpsqRms601Vk=;
        b=QAjt85rBhK3tAjk0ArRnUhGL1lNhZ8nxQGXfRru7/4xfFeCvpHtXC1JEZr6FATIwZ4QnNQ
        rl2Mk4ZonPaaJ4A3iGew/FbuGbQmC3VXdnMWncdQrpJLUmp2tlrglp4OSxuLnUwhFgoE7y
        UwnJvHlcXwfdU6v0zq8cO/TknAEUIUE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-506-lPP7vq6CNHSQI0r9sNP-OA-1; Fri, 05 Mar 2021 12:52:44 -0500
X-MC-Unique: lPP7vq6CNHSQI0r9sNP-OA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AF6C3801FAF;
        Fri,  5 Mar 2021 17:52:32 +0000 (UTC)
Received: from [10.36.112.194] (ovpn-112-194.ams2.redhat.com [10.36.112.194])
        by smtp.corp.redhat.com (Postfix) with ESMTP id BBFAC60BF3;
        Fri,  5 Mar 2021 17:52:28 +0000 (UTC)
Subject: Re: [PATCH v3 1/1] mm/madvise: replace ptrace attach requirement for
 process_madvise
To:     Shakeel Butt <shakeelb@google.com>
Cc:     Suren Baghdasaryan <surenb@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Jann Horn <jannh@google.com>,
        Kees Cook <keescook@chromium.org>,
        Jeffrey Vander Stoep <jeffv@google.com>,
        Minchan Kim <minchan@kernel.org>,
        Michal Hocko <mhocko@suse.com>,
        David Rientjes <rientjes@google.com>,
        =?UTF-8?Q?Edgar_Arriaga_Garc=c3=ada?= <edgararriaga@google.com>,
        Tim Murray <timmurray@google.com>,
        Florian Weimer <fweimer@redhat.com>,
        Oleg Nesterov <oleg@redhat.com>,
        James Morris <jmorris@namei.org>,
        Linux MM <linux-mm@kvack.org>,
        SElinux list <selinux@vger.kernel.org>,
        Linux API <linux-api@vger.kernel.org>,
        linux-security-module <linux-security-module@vger.kernel.org>,
        stable <stable@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        kernel-team <kernel-team@android.com>
References: <20210303185807.2160264-1-surenb@google.com>
 <CALvZod73Uem8jzP3QQdQ6waXbx80UUOTJQS7WBwnmaCdq++8xw@mail.gmail.com>
 <CAJuCfpFgDRezmQMjCajXzBp86UbMLMJbqEaeo0_J+pneZ5XOgg@mail.gmail.com>
 <CALvZod4nZ6W05N-4ostUEz5EbCuEvuBpc4LRYfAFgwQU-wb9dQ@mail.gmail.com>
 <b45d9599-b917-10c3-6b86-6ecd8db16d43@redhat.com>
 <CALvZod6b8H-=N6WVrgMVLE3=pm-ELWerjAO5v5KHSH-ih337+g@mail.gmail.com>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <c234a564-a052-b586-2a32-8580aaf8ca5d@redhat.com>
Date:   Fri, 5 Mar 2021 18:52:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <CALvZod6b8H-=N6WVrgMVLE3=pm-ELWerjAO5v5KHSH-ih337+g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On 05.03.21 18:45, Shakeel Butt wrote:
> On Fri, Mar 5, 2021 at 9:37 AM David Hildenbrand <david@redhat.com> wrote:
>>
>> On 04.03.21 01:03, Shakeel Butt wrote:
>>> On Wed, Mar 3, 2021 at 3:34 PM Suren Baghdasaryan <surenb@google.com> wrote:
>>>>
>>>> On Wed, Mar 3, 2021 at 3:17 PM Shakeel Butt <shakeelb@google.com> wrote:
>>>>>
>>>>> On Wed, Mar 3, 2021 at 10:58 AM Suren Baghdasaryan <surenb@google.com> wrote:
>>>>>>
>>>>>> process_madvise currently requires ptrace attach capability.
>>>>>> PTRACE_MODE_ATTACH gives one process complete control over another
>>>>>> process. It effectively removes the security boundary between the
>>>>>> two processes (in one direction). Granting ptrace attach capability
>>>>>> even to a system process is considered dangerous since it creates an
>>>>>> attack surface. This severely limits the usage of this API.
>>>>>> The operations process_madvise can perform do not affect the correctness
>>>>>> of the operation of the target process; they only affect where the data
>>>>>> is physically located (and therefore, how fast it can be accessed).
>>>>>> What we want is the ability for one process to influence another process
>>>>>> in order to optimize performance across the entire system while leaving
>>>>>> the security boundary intact.
>>>>>> Replace PTRACE_MODE_ATTACH with a combination of PTRACE_MODE_READ
>>>>>> and CAP_SYS_NICE. PTRACE_MODE_READ to prevent leaking ASLR metadata
>>>>>> and CAP_SYS_NICE for influencing process performance.
>>>>>>
>>>>>> Cc: stable@vger.kernel.org # 5.10+
>>>>>> Signed-off-by: Suren Baghdasaryan <surenb@google.com>
>>>>>> Reviewed-by: Kees Cook <keescook@chromium.org>
>>>>>> Acked-by: Minchan Kim <minchan@kernel.org>
>>>>>> Acked-by: David Rientjes <rientjes@google.com>
>>>>>> ---
>>>>>> changes in v3
>>>>>> - Added Reviewed-by: Kees Cook <keescook@chromium.org>
>>>>>> - Created man page for process_madvise per Andrew's request: https://git.kernel.org/pub/scm/docs/man-pages/man-pages.git/commit/?id=a144f458bad476a3358e3a45023789cb7bb9f993
>>>>>> - cc'ed stable@vger.kernel.org # 5.10+ per Andrew's request
>>>>>> - cc'ed linux-security-module@vger.kernel.org per James Morris's request
>>>>>>
>>>>>>    mm/madvise.c | 13 ++++++++++++-
>>>>>>    1 file changed, 12 insertions(+), 1 deletion(-)
>>>>>>
>>>>>> diff --git a/mm/madvise.c b/mm/madvise.c
>>>>>> index df692d2e35d4..01fef79ac761 100644
>>>>>> --- a/mm/madvise.c
>>>>>> +++ b/mm/madvise.c
>>>>>> @@ -1198,12 +1198,22 @@ SYSCALL_DEFINE5(process_madvise, int, pidfd, const struct iovec __user *, vec,
>>>>>>                   goto release_task;
>>>>>>           }
>>>>>>
>>>>>> -       mm = mm_access(task, PTRACE_MODE_ATTACH_FSCREDS);
>>>>>> +       /* Require PTRACE_MODE_READ to avoid leaking ASLR metadata. */
>>>>>> +       mm = mm_access(task, PTRACE_MODE_READ_FSCREDS);
>>>>>>           if (IS_ERR_OR_NULL(mm)) {
>>>>>>                   ret = IS_ERR(mm) ? PTR_ERR(mm) : -ESRCH;
>>>>>>                   goto release_task;
>>>>>>           }
>>>>>>
>>>>>> +       /*
>>>>>> +        * Require CAP_SYS_NICE for influencing process performance. Note that
>>>>>> +        * only non-destructive hints are currently supported.
>>>>>
>>>>> How is non-destructive defined? Is MADV_DONTNEED non-destructive?
>>>>
>>>> Non-destructive in this context means the data is not lost and can be
>>>> recovered. I follow the logic described in
>>>> https://lwn.net/Articles/794704/ where Minchan was introducing
>>>> MADV_COLD and MADV_PAGEOUT as non-destructive versions of MADV_FREE
>>>> and MADV_DONTNEED. Following that logic, MADV_FREE and MADV_DONTNEED
>>>> would be considered destructive hints.
>>>> Note that process_madvise_behavior_valid() allows only MADV_COLD and
>>>> MADV_PAGEOUT at the moment, which are both non-destructive.
>>>>
>>>
>>> There is a plan to support MADV_DONTNEED for this syscall. Do we need
>>> to change these access checks again with that support?
>>
>> Eh, I absolutely don't think letting another process discard memory in
>> another process' address space is a good idea. The target process can
>> observe that easily and might even run into real issues.
>>
>> What's the use case?
>>
> 
> Userspace oom reaper. Please look at
> https://lore.kernel.org/linux-api/20201014183943.GA1489464@google.com/T/
> 

Thanks, somehow I missed that (not that it really changed my opinion on 
the approach while skimming over the discussion :) will have a more 
detailed look)

-- 
Thanks,

David / dhildenb

