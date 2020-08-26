Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF5B325371D
	for <lists+selinux@lfdr.de>; Wed, 26 Aug 2020 20:28:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726191AbgHZS2e (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Wed, 26 Aug 2020 14:28:34 -0400
Received: from linux.microsoft.com ([13.77.154.182]:55568 "EHLO
        linux.microsoft.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726753AbgHZS2d (ORCPT
        <rfc822;selinux@vger.kernel.org>); Wed, 26 Aug 2020 14:28:33 -0400
Received: from chpebeni.northamerica.corp.microsoft.com (pool-108-15-23-247.bltmmd.fios.verizon.net [108.15.23.247])
        by linux.microsoft.com (Postfix) with ESMTPSA id 5498720B4908;
        Wed, 26 Aug 2020 11:28:32 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 5498720B4908
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
        s=default; t=1598466512;
        bh=F9eZR/o6iU6gdD8pXgMjWQ053hxZKyeej5ICq4ymXlc=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=GguGLl/1nzVQUJ2GEgu6MSL9Ml1YYKPfw1fKugIYm0jZL93nzPsh8KtCbiaPxChxj
         BFMhxPauNaPoWIyMa4xXj84UZRo1KHsF+pr7BsjvWNpARlBH87qlnU/tOENp3A+IJC
         K09JoPLWJj9qQOqVVmsgLCr/Oi5oXKkGYW8Ssouk=
Subject: Re: Userspace AVC auditing on policy load
To:     Stephen Smalley <stephen.smalley.work@gmail.com>
Cc:     SElinux list <selinux@vger.kernel.org>
References: <cb7451da-24d3-4a0c-e4f8-205e6539ed54@linux.microsoft.com>
 <e4cdec2a-8c01-fbe4-cba3-3468b4ebea2e@linux.microsoft.com>
 <CAEjxPJ7xrzm6GQUxckRgVot082xZtabV-RZzv0E-Orfq7y_riQ@mail.gmail.com>
From:   Chris PeBenito <chpebeni@linux.microsoft.com>
Message-ID: <2b50e8f1-08ef-0868-4a2e-dfdbb61ed5ea@linux.microsoft.com>
Date:   Wed, 26 Aug 2020 14:28:31 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <CAEjxPJ7xrzm6GQUxckRgVot082xZtabV-RZzv0E-Orfq7y_riQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On 8/26/20 10:46 AM, Stephen Smalley wrote:
> On Wed, Aug 26, 2020 at 10:35 AM Chris PeBenito
> <chpebeni@linux.microsoft.com> wrote:
>>
>> On 8/26/20 9:25 AM, Chris PeBenito wrote:
>>> I was looking into this dbus-broker audit message, which has the wrong audit type:
>>>
>>> audit[422]: USER_AVC pid=422 uid=999 auid=4294967295 ses=4294967295
>>> subj=system_u:system_r:system_dbusd_t msg='avc:  received policyload notice
>>> (seqno=2)
>>>
>>> This is due to dbus-broker setting their avc log callback to send USER_AVC audit
>>> messages for everything that comes to the libselinux log callback. I think the
>>> right thing to do there is to change it to emit USER_SELINUX_ERR audit messages
>>> if the log message is SELINUX_ERROR, otherwise log the message using their
>>> regular method (stderr I think).
>>>
>>> But the question became, why is the userspace AVC not simply emitting its own
>>> USER_MAC_POLICY_LOAD audit message instead of sending a message to the log
>>> callback?
>>
>> Ok, I missed that there is a SELINUX_AVC log type and that's how the userspace
>> denial messages are sent out. How about adding SELINUX_POLICYLOAD and
>> SELINUX_ENFORCE log types so that callers can emit appropriate audit messages?
> 
> Do we need two different new types or just one?  Otherwise, I don't
> have a problem with adding new ones as long as it doesn't break
> existing applications.

Regarding the risk of breaking existing applications, I did some checking on 
some userspace AVC users and what they do in their log callback:

* systemd only audits SELINUX_AVC and SELINUX_ERROR messages and ignores 
others(as Petr noted)
* xorg-server audits SELINUX_AVC correctly but audits SELINUX_INFO as 
USER_MAC_POLICY_LOAD and everything else it ignores the type and audits as 
AUDIT_USER_SELINUX_ERR
* dbus-broker ignores type and audits everything as USER_AVC
* dbus-service ignores type and audits everything as USER AVC
* pam: pam_rootok ignores type and audits everything as USER_AVC
* sepgsql custom AVC implementation (this was news to me)
* shadow-utils only audits SELINUX_AVC and SELINUX_ERROR messages and others go 
to syslog
* cronie: no callback set

That's all the ones I could think of.  Which ones am I missing?

-- 
Chris PeBenito
