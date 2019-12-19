Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 95C42126FD7
	for <lists+selinux@lfdr.de>; Thu, 19 Dec 2019 22:41:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727071AbfLSVlu (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Thu, 19 Dec 2019 16:41:50 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:53296 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726880AbfLSVlu (ORCPT
        <rfc822;selinux@vger.kernel.org>); Thu, 19 Dec 2019 16:41:50 -0500
Received: from static-50-53-33-191.bvtn.or.frontiernet.net ([50.53.33.191] helo=[192.168.192.153])
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <john.johansen@canonical.com>)
        id 1ii3YE-0003v7-T7; Thu, 19 Dec 2019 21:41:43 +0000
Subject: Re: [PATCH v12 23/25] NET: Add SO_PEERCONTEXT for multiple LSMs
To:     Casey Schaufler <casey@schaufler-ca.com>,
        Stephen Smalley <sds@tycho.nsa.gov>,
        Simon McVittie <smcv@collabora.com>
Cc:     casey.schaufler@intel.com, jmorris@namei.org,
        linux-security-module@vger.kernel.org, selinux@vger.kernel.org,
        keescook@chromium.org, penguin-kernel@i-love.sakura.ne.jp,
        paul@paul-moore.com
References: <20191216223621.5127-1-casey@schaufler-ca.com>
 <20191216223621.5127-24-casey@schaufler-ca.com>
 <56b96440-a304-42b6-1515-1ad2659b2581@tycho.nsa.gov>
 <e7aa3b6f-cee1-6277-21dd-77a4db9bbc2b@tycho.nsa.gov>
 <a522de22-ba62-a24d-24f7-b69418e7ec0b@tycho.nsa.gov>
 <20191219121939.GA1291250@horizon>
 <55b5c889-ff38-38c4-578e-ec4211b837a4@tycho.nsa.gov>
 <93912039-e64e-cc56-20fc-095accf6c4dd@tycho.nsa.gov>
 <20191219164831.GA1308552@horizon>
 <16af7932-a57b-1454-18ca-c2ff6e6b302d@tycho.nsa.gov>
 <a828a629-cdb8-57c3-8c6e-9b080842ec05@canonical.com>
 <abea0322-cf44-c37f-35c3-955adb8a455d@schaufler-ca.com>
From:   John Johansen <john.johansen@canonical.com>
Autocrypt: addr=john.johansen@canonical.com; prefer-encrypt=mutual; keydata=
 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
Organization: Canonical
Message-ID: <9c000fcc-7d83-622d-c9fb-faa9e0815161@canonical.com>
Date:   Thu, 19 Dec 2019 13:41:38 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <abea0322-cf44-c37f-35c3-955adb8a455d@schaufler-ca.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On 12/19/19 12:51 PM, Casey Schaufler wrote:
> On 12/19/2019 11:27 AM, John Johansen wrote:
>> On 12/19/19 9:02 AM, Stephen Smalley wrote:
>>> On 12/19/19 11:48 AM, Simon McVittie wrote:
>>>> On Thu, 19 Dec 2019 at 10:00:31 -0500, Stephen Smalley wrote:
>>>>> Looks like userspace is generally forgiving of whether the terminating NUL
>>>>> byte is included or omitted by the kernel (with different behaviors for
>>>>> SELinux - always included, Smack - omitted by /proc/pid/attr/current but
>>>>> included in SO_PEERSEC, and AppArmor - omitted for /proc/pid/attr/current
>>>>> but includes a terminating \n, omitted for SO_PEERSEC but no terminating
>>>>> \n), and procps-ng explicitly tests for printable characters (but truncates
>>>>> on the first unprintable character).
>>>> Because LSM people have told me in the past that the '\0' is not
>>>> conceptually part of the label, the D-Bus specification and reference
>>>> implementation already assume that its presence or absence is irrelevant,
>>>> and normalize to a canonical form (which happens to be that it appends a
>>>> '\0' if missing, to be nice to C-like languages, but I could equally
>>>> have chosen to strip the '\0' and rely on an out-of-band length count).
>>>>
>>>> By design, SO_PEERCONTEXT and /proc/pid/attr/context don't (can't!)
>>>> preserve whether the label originally ended with '\0' or not (because
>>>> they are designed to use '\0' as a terminator for each label), so these
>>>> new kernel interfaces are already a bit closer than the old kernel
>>>> interfaces to how D-Bus represents this information.
>>>>
>>>> The problematic case is AppArmor's terminating '\n' on
>>>> /proc/pid/attr/current, because when I asked in the past, I was told
>>>> that it would be (unwise but) valid to have a LSM where "foo" and "foo\n"
>>>> are distinct labels.
>>> I don't agree with that stance, but obviously others may differ.
>>>
>> Its not so much a stance as a reality. The LSM allowed anything except
>> \0 values as part of the interface and there was no documentation
>> to set expectations beyond what the code allowed.
>>
>> This could be tightened.
>>
>>>> If that hypothetical LSM would make procps-ng lose information (because
>>>> procps-ng truncates at the first unprintable character), does that change
>>>> the situation any? Would that make it acceptable for other LSM-agnostic
>>>> user-space components, like the reference implementation of D-Bus, to
>>>> assume that stripping a trailing newline from /proc/pid/attr/context
>>>> or from one of the component strings of /proc/pid/attr/current is a
>>>> non-lossy operation?
>>> IMHO, yes.  In fact, looking further, I see that systemd's src/libsystemd/sd-bus/bus-creds.c:bus_creds_add_more() reads /proc/pid/attr/current with its read_one_line_file() helper which ultimately uses read_line_full() and treats EOF, \n, \r, or \0 as terminators and truncates on first such occurrence.
>>>
>> fun
>>
>>>>>>>     If this new API is an opportunity to declare that LSMs are expected
>>>>>>>     to put the same canonical form of a label in
>>>>>>> /proc/$pid/attr/context and
>>>>>>>     SO_PEERCONTEXT, possibly with a non-canonical version (adding '\n' or
>>>>>>>     '\0' or similar) exposed in the older /proc/$pid/attr/current and
>>>>>>>     SO_PEERSEC interfaces for backwards compatibility, then that
>>>>>>> would make
>>>>>>>     life a lot easier for user-space developers like me.
>>>>>> I'm all for this but the current implementation reuses the same
>>>>>> underlying hooks as SO_PEERSEC, so it gets the same result for the
>>>>>> per-lsm values.  We'd need a separate hook if we cannot alter the
>>>>>> current AppArmor SO_PEERSEC format.
>>>> If AppArmor was going to change the format of one of its interfaces
>>>> (or deviate from it when implementing new interfaces), I'd actually
>>>> prefer it to be /proc/pid/attr/current that changed or was superseded,
>>>> because /proc/pid/attr/current is the one that contains a newline that
>>>> consumers are meant to ignore.
>>>>
>>>> For what it's worth, libapparmor explicitly removes the newline, so this
>>>> only matters to LSM-agnostic readers like D-Bus implementations, and to
>>>> lower-level AppArmor-aware readers that use the kernel interfaces directly
>>>> in preference to using libapparmor.
>>> Deferring to the AA maintainer(s) to speak to this.
>> I will look into what I can do. If we can ditch the trailing \n, that would
>> be best. I tried to do that once before and we ran into some problems and
>> I had to revert the change. But that was a long time ago and we can probably
>> get away with doing it now.
> 
> I would be happy to define and document that the compound context does
> not include trailing \n. There are no existing security modules or
> user space that would be impacted. No one uses /proc/self/attr/context
> or SO_PEERCONTEXT yet. If AppArmor is happy with stripping the \n I
> think we're good to go.
> 
yes, we can certainly remove it from peer context, and I expect we can
remove it from current as well
