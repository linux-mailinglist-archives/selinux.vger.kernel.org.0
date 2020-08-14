Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F144244D6C
	for <lists+selinux@lfdr.de>; Fri, 14 Aug 2020 19:22:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728018AbgHNRWR convert rfc822-to-8bit (ORCPT
        <rfc822;lists+selinux@lfdr.de>); Fri, 14 Aug 2020 13:22:17 -0400
Received: from seldsegrel01.sonyericsson.com ([37.139.156.29]:4067 "EHLO
        SELDSEGREL01.sonyericsson.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727894AbgHNRWQ (ORCPT
        <rfc822;selinux@vger.kernel.org>); Fri, 14 Aug 2020 13:22:16 -0400
Subject: Re: [PATCH v2 1/2] selinux: add tracepoint on denials
To:     Stephen Smalley <stephen.smalley.work@gmail.com>
CC:     =?UTF-8?Q?Thi=c3=a9baud_Weksteen?= <tweek@google.com>,
        Paul Moore <paul@paul-moore.com>,
        Nick Kralevich <nnk@google.com>,
        Joel Fernandes <joelaf@google.com>,
        Eric Paris <eparis@parisplace.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@redhat.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Rob Herring <robh@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        SElinux list <selinux@vger.kernel.org>
References: <20200813144914.737306-1-tweek@google.com>
 <15e2e26d-fe4b-679c-b5c0-c96d56e09853@gmail.com>
 <CA+zpnLcf94HGmE=CGH6nT8ya0oax5orXc5nP1qToUgaca6FeQg@mail.gmail.com>
 <CAEjxPJ50vrauP7dd-ek15vwnMN1kvAyvYSc0fhR4xwCJEQSFxQ@mail.gmail.com>
 <ad64b5af-93de-e84e-17ca-40d8dd3cfe44@sony.com>
 <CAEjxPJ67G24T1a5WitmMqL4RUpjOgQFwpQ8unO1-OXSS=35V4Q@mail.gmail.com>
From:   peter enderborg <peter.enderborg@sony.com>
Message-ID: <3518887d-9083-2836-a8db-c7c27a70c990@sony.com>
Date:   Fri, 14 Aug 2020 19:22:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAEjxPJ67G24T1a5WitmMqL4RUpjOgQFwpQ8unO1-OXSS=35V4Q@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Content-Language: en-GB
X-SEG-SpamProfiler-Analysis: v=2.3 cv=frmim2wf c=1 sm=1 tr=0 a=Jtaq2Av1iV2Yg7i8w6AGMw==:117 a=IkcTkHD0fZMA:10 a=y4yBn9ojGxQA:10 a=z6gsHLkEAAAA:8 a=1XWaLZrsAAAA:8 a=pGLkceISAAAA:8 a=xtmVrf9aUzyO47Hdho8A:9 a=QEXdDO2ut3YA:10 a=d-OLMTCWyvARjPbQ-enb:22
X-SEG-SpamProfiler-Score: 0
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On 8/14/20 7:08 PM, Stephen Smalley wrote:
> On Fri, Aug 14, 2020 at 1:07 PM peter enderborg
> <peter.enderborg@sony.com> wrote:
>> On 8/14/20 6:51 PM, Stephen Smalley wrote:
>>> On Fri, Aug 14, 2020 at 9:05 AM Thiébaud Weksteen <tweek@google.com> wrote:
>>>> On Thu, Aug 13, 2020 at 5:41 PM Stephen Smalley
>>>> <stephen.smalley.work@gmail.com> wrote:
>>>>> An explanation here of how one might go about decoding audited and
>>>>> tclass would be helpful to users (even better would be a script to do it
>>>>> for them).  Again, I know how to do that but not everyone using
>>>>> perf/ftrace will.
>>>> What about something along those lines:
>>>>
>>>> The tclass value can be mapped to a class by searching
>>>> security/selinux/flask.h. The audited value is a bit field of the
>>>> permissions described in security/selinux/av_permissions.h for the
>>>> corresponding class.
>>> Sure, I guess that works.  Would be nice if we just included the class
>>> and permission name(s) in the event itself but I guess you viewed that
>>> as too heavyweight?
>> The class name is added in part 2. Im not sure how a proper format for permission
>> would look like in trace terms. It is a list, right?
> Yes.  See avc_audit_pre_callback() for example code to log the permission names.

I wrote about that on some of the previous sets. The problem is that trace format is quite fixed. So it is lists are not
that easy to handle if you want to filter in them. You can have a trace event for each of them. You can also add
additional trace event "selinux_audied_permission" for each permission. With that you can filter out tclass or permissions.

But the basic thing we would like at the moment is a event that we can debug in user space.

