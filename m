Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F21923DFC0
	for <lists+selinux@lfdr.de>; Thu,  6 Aug 2020 19:53:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728422AbgHFRwb convert rfc822-to-8bit (ORCPT
        <rfc822;lists+selinux@lfdr.de>); Thu, 6 Aug 2020 13:52:31 -0400
Received: from seldsegrel01.sonyericsson.com ([37.139.156.29]:8045 "EHLO
        SELDSEGREL01.sonyericsson.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728399AbgHFQbU (ORCPT
        <rfc822;selinux@vger.kernel.org>); Thu, 6 Aug 2020 12:31:20 -0400
Subject: Re: [PATCH 2/2] selinux: add attributes to avc tracepoint
To:     Stephen Smalley <stephen.smalley.work@gmail.com>,
        =?UTF-8?Q?Thi=c3=a9baud_Weksteen?= <tweek@google.com>,
        Paul Moore <paul@paul-moore.com>
CC:     Nick Kralevich <nnk@google.com>,
        Eric Paris <eparis@parisplace.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@redhat.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Rob Herring <robh@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        SElinux list <selinux@vger.kernel.org>
References: <20200806080358.3124505-1-tweek@google.com>
 <20200806080358.3124505-2-tweek@google.com>
 <89d23362-39b9-79e5-84f1-d7b89204ef38@gmail.com>
 <8627d780-0e19-6755-0de5-c686deb0f5de@sony.com>
 <971592b6-5d5f-05d8-d243-b521fe65577d@gmail.com>
 <07e2c48d-3918-6ceb-a6b2-4e2f18f9ea01@gmail.com>
 <CAEjxPJ4no_GqMp8aw43zpwmwq42Wi_1dvP+ZBs1a-mnReDt5Og@mail.gmail.com>
From:   peter enderborg <peter.enderborg@sony.com>
Message-ID: <dfeac808-b40d-77fd-0d31-f66f279083eb@sony.com>
Date:   Thu, 6 Aug 2020 16:51:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAEjxPJ4no_GqMp8aw43zpwmwq42Wi_1dvP+ZBs1a-mnReDt5Og@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Content-Language: en-GB
X-SEG-SpamProfiler-Analysis: v=2.3 cv=frmim2wf c=1 sm=1 tr=0 a=kIrCkORFHx6JeP9rmF/Kww==:117 a=IkcTkHD0fZMA:10 a=y4yBn9ojGxQA:10 a=pGLkceISAAAA:8 a=z6gsHLkEAAAA:8 a=Fbti1pkVs00Xad8lyQgA:9 a=QEXdDO2ut3YA:10 a=d-OLMTCWyvARjPbQ-enb:22
X-SEG-SpamProfiler-Score: 0
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On 8/6/20 3:49 PM, Stephen Smalley wrote:
> On Thu, Aug 6, 2020 at 9:45 AM Stephen Smalley
> <stephen.smalley.work@gmail.com> wrote:
>> On 8/6/20 8:32 AM, Stephen Smalley wrote:
>>
>>> On 8/6/20 8:24 AM, peter enderborg wrote:
>>>
>>>> On 8/6/20 2:11 PM, Stephen Smalley wrote:
>>>>> On 8/6/20 4:03 AM, Thiébaud Weksteen wrote:
>>>>>
>>>>>> From: Peter Enderborg <peter.enderborg@sony.com>
>>>>>>
>>>>>> Add further attributes to filter the trace events from AVC.
>>>>> Please include sample usage and output in the description.
>>>>>
>>>>>
>>>> Im not sure where you want it to be.
>>>>
>>>> In the commit message or in a Documentation/trace/events-avc.rst ?
>>> I was just asking for it in the commit message / patch description.  I
>>> don't know what is typical for Documentation/trace.
>> For example, I just took the patches for a spin, running the
>> selinux-testsuite under perf like so:
>>
>> sudo perf record -e avc:selinux_audited -g make test
>>
>> and then ran:
>>
>> sudo perf report -g
>>
>> and a snippet of sample output included:
>>
>>       6.40%     6.40%  requested=0x800000 denied=0x800000
>> audited=0x800000 result=-13 ssid=922 tsid=922
>> scontext=unconfined_u:unconfined_r:test_binder_mgr_t:s0-s0:c0.c1023
>> tcontext=unconfined_u:unconfined_r:test_binder_mgr_t:s0-s0:c0.c1023
>> tclass=capability
> So then the question becomes how do you use the above information,
> e.g. is that sufficient to correlate it to an actual avc: denied
> message, how do you decode the requested/denied/audited fields (or
> should the code do that for you and just report the string name(s) of
> the permission(s), do you need all three of those fields separately,
> is it useful to log the ssid/tsid at all given that you have the
> contexts and sids are dynamically assigned, etc.
>
>>              |
>>              ---0x495641000028933d
>>                 __libc_start_main
>>                 |
>>                 |--4.60%--__GI___ioctl
>>                 |          entry_SYSCALL_64
>>                 |          do_syscall_64
>>                 |          __x64_sys_ioctl
>>                 |          ksys_ioctl
>>                 |          binder_ioctl
>>                 |          binder_set_nice
>>                 |          can_nice
>>                 |          capable
>>                 |          security_capable
>>                 |          cred_has_capability.isra.0
>>                 |          slow_avc_audit
>>                 |          common_lsm_audit
>>                 |          avc_audit_post_callback
>>                 |          avc_audit_post_callback

The real cool thing happen when you enable "user-stack-trace" too.

           <...>-4820  [007] .... 85878.897553: selinux_audited: requested=0x4000000 denied=0x4000000 audited=0x4000000 result=-13 ssid=341 tsid=61 scontext=system_u:system_r:ntpd_t:s0 tcontext=system_u:object_r:bin_t:s0 tclass=file
           <...>-4820  [007] .... 85878.897572: <user stack trace>
 =>  <00007f07d99bb45b>
 =>  <0000555ecd89ca57>

The fields are useful for filter what you what to see and what you can ignore.  Having the ssid and text was from the part where it is called.
The numeric can be used for two things. When you dont have any context. Same same reason as in post_callback. We need to be static
in format so it need  be there if it ever can happen. And it is also useful for faster filtering.

You can do "ssid!=42 && ssid!=43 && tsid==666".  From my view it would be good to have all fields there. But they need to right typed to be able
to use the filter mechanism. There must me some trade-off too where the argument filtering get bigger than the processing, but I think we can
add a lot more before we reach that threshold.

