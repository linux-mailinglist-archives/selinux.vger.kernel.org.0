Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8123725384B
	for <lists+selinux@lfdr.de>; Wed, 26 Aug 2020 21:27:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726723AbgHZT12 (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Wed, 26 Aug 2020 15:27:28 -0400
Received: from agnus.defensec.nl ([80.100.19.56]:57894 "EHLO agnus.defensec.nl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726767AbgHZT11 (ORCPT <rfc822;selinux@vger.kernel.org>);
        Wed, 26 Aug 2020 15:27:27 -0400
Received: from brutus (brutus.lan [IPv6:2001:985:d55d::438])
        by agnus.defensec.nl (Postfix) with ESMTPSA id 140242A1507;
        Wed, 26 Aug 2020 21:27:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 agnus.defensec.nl 140242A1507
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=defensec.nl;
        s=default; t=1598470045;
        bh=aIXdvPWX51S/5RkwHgi6mQorLnLGqoYKWU7eAFyzN2o=;
        h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
        b=ZOAnCYcpk5BsDxoGhnMK1AiBYQMnweJJErH2WkUTEN/6h+AePzoGrJadL4ZIObcH2
         3RtPhVzqbbBsJLLGHVY5U0eEXe3nbLST9ksiKCDvNk2BD2TwvCJYpSHwZFlp4+nC2W
         PMEuiaAYtN7lVpyLFkzMHwcPSydgNLpNfjhfh9rY=
From:   Dominick Grift <dominick.grift@defensec.nl>
To:     Chris PeBenito <chpebeni@linux.microsoft.com>
Cc:     Stephen Smalley <stephen.smalley.work@gmail.com>,
        SElinux list <selinux@vger.kernel.org>
Subject: Re: Userspace AVC auditing on policy load
References: <cb7451da-24d3-4a0c-e4f8-205e6539ed54@linux.microsoft.com>
        <e4cdec2a-8c01-fbe4-cba3-3468b4ebea2e@linux.microsoft.com>
        <CAEjxPJ7xrzm6GQUxckRgVot082xZtabV-RZzv0E-Orfq7y_riQ@mail.gmail.com>
        <2b50e8f1-08ef-0868-4a2e-dfdbb61ed5ea@linux.microsoft.com>
        <ypjla6yhql92.fsf@defensec.nl>
        <fb237606-668e-c35e-2049-58c003dd838b@linux.microsoft.com>
Date:   Wed, 26 Aug 2020 21:27:21 +0200
In-Reply-To: <fb237606-668e-c35e-2049-58c003dd838b@linux.microsoft.com> (Chris
        PeBenito's message of "Wed, 26 Aug 2020 15:15:56 -0400")
Message-ID: <ypjl5z95qkbq.fsf@defensec.nl>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Chris PeBenito <chpebeni@linux.microsoft.com> writes:

> On 8/26/20 3:07 PM, Dominick Grift wrote:
>> Chris PeBenito <chpebeni@linux.microsoft.com> writes:
>> 
>>> On 8/26/20 10:46 AM, Stephen Smalley wrote:
>>>> On Wed, Aug 26, 2020 at 10:35 AM Chris PeBenito
>>>> <chpebeni@linux.microsoft.com> wrote:
>>>>>
>>>>> On 8/26/20 9:25 AM, Chris PeBenito wrote:
>>>>>> I was looking into this dbus-broker audit message, which has the wrong audit type:
>>>>>>
>>>>>> audit[422]: USER_AVC pid=422 uid=999 auid=4294967295 ses=4294967295
>>>>>> subj=system_u:system_r:system_dbusd_t msg='avc:  received policyload notice
>>>>>> (seqno=2)
>>>>>>
>>>>>> This is due to dbus-broker setting their avc log callback to send USER_AVC audit
>>>>>> messages for everything that comes to the libselinux log callback. I think the
>>>>>> right thing to do there is to change it to emit USER_SELINUX_ERR audit messages
>>>>>> if the log message is SELINUX_ERROR, otherwise log the message using their
>>>>>> regular method (stderr I think).
>>>>>>
>>>>>> But the question became, why is the userspace AVC not simply emitting its own
>>>>>> USER_MAC_POLICY_LOAD audit message instead of sending a message to the log
>>>>>> callback?
>>>>>
>>>>> Ok, I missed that there is a SELINUX_AVC log type and that's how the userspace
>>>>> denial messages are sent out. How about adding SELINUX_POLICYLOAD and
>>>>> SELINUX_ENFORCE log types so that callers can emit appropriate audit messages?
>>>> Do we need two different new types or just one?  Otherwise, I don't
>>>> have a problem with adding new ones as long as it doesn't break
>>>> existing applications.
>>>
>>> Regarding the risk of breaking existing applications, I did some
>>> checking on some userspace AVC users and what they do in their log
>>> callback:
>>>
>>> * systemd only audits SELINUX_AVC and SELINUX_ERROR messages and
>>>    ignores others(as Petr noted)
>>> * xorg-server audits SELINUX_AVC correctly but audits SELINUX_INFO as
>>>    USER_MAC_POLICY_LOAD and everything else it ignores the type and
>>>   audits as AUDIT_USER_SELINUX_ERR
>>> * dbus-broker ignores type and audits everything as USER_AVC
>>> * dbus-service ignores type and audits everything as USER AVC
>>> * pam: pam_rootok ignores type and audits everything as USER_AVC
>>> * sepgsql custom AVC implementation (this was news to me)
>>> * shadow-utils only audits SELINUX_AVC and SELINUX_ERROR messages and
>>>    others go to syslog
>>> * cronie: no callback set
>>>
>>> That's all the ones I could think of.  Which ones am I missing?
>> Probably libreswan, AFAIK that one might also still be using
>> avc_has_perm() instead of selinux_check_access().
>
> You're correct, it is still use avc_has_perm().  There is no log callback set here.

glibc nscd (also seems to be still using avc_has_perm())

-- 
gpg --locate-keys dominick.grift@defensec.nl
Key fingerprint = FCD2 3660 5D6B 9D27 7FC6  E0FF DA7E 521F 10F6 4098
https://sks-keyservers.net/pks/lookup?op=get&search=0xDA7E521F10F64098
Dominick Grift
