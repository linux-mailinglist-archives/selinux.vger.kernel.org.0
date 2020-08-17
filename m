Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B594724732A
	for <lists+selinux@lfdr.de>; Mon, 17 Aug 2020 20:52:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387993AbgHQSwA (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Mon, 17 Aug 2020 14:52:00 -0400
Received: from agnus.defensec.nl ([80.100.19.56]:51172 "EHLO agnus.defensec.nl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2391764AbgHQSvx (ORCPT <rfc822;selinux@vger.kernel.org>);
        Mon, 17 Aug 2020 14:51:53 -0400
Received: from brutus (brutus.lan [IPv6:2001:985:d55d::438])
        by agnus.defensec.nl (Postfix) with ESMTPSA id E323A2A1283;
        Mon, 17 Aug 2020 20:51:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 agnus.defensec.nl E323A2A1283
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=defensec.nl;
        s=default; t=1597690312;
        bh=3PTMboeRWyJCcCCAyRgo/G8tfWxA+M3FIMtHf1/BJGw=;
        h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
        b=j9Zn24YlgW00FA/nDE1RUCmqVNH66+ETndTanPHiXywXmsNaLZoN+bNYXoV487ToF
         ZYAXI5j9JYIfmrD03csiaPCqdamaTjI9V3nlf5mAHcvxhtKvBp7egq/h/Ijf/jkCaz
         Pj802TLT5AhJwaZq3drAZlPYgtUFylaXeeTjL25I=
From:   Dominick Grift <dominick.grift@defensec.nl>
To:     James Carter <jwcart2@gmail.com>
Cc:     bauen1 <j2468h@googlemail.com>, selinux <selinux@vger.kernel.org>
Subject: Re: Resource usage of CIL compared to HLL
References: <2ce8defb-523c-01c0-560c-7881d0a99416@gmail.com>
        <CAP+JOzStOhn92uN_04R8JbVy1_5noQUVfoG-O6+2WnsKG8tcdw@mail.gmail.com>
        <ypjlo8n9p2lk.fsf@defensec.nl>
Date:   Mon, 17 Aug 2020 20:51:46 +0200
In-Reply-To: <ypjlo8n9p2lk.fsf@defensec.nl> (Dominick Grift's message of "Mon,
        17 Aug 2020 20:08:23 +0200")
Message-ID: <ypjlk0xxp0l9.fsf@defensec.nl>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Dominick Grift <dominick.grift@defensec.nl> writes:

> James Carter <jwcart2@gmail.com> writes:
>
>> On Mon, Aug 17, 2020 at 9:48 AM bauen1 <j2468h@googlemail.com> wrote:
>>>
>>> Hi,
>>>
>>> I usually test all my patches against refpolicy and my own cil
>>> policy (https://gitlab.com/bauen1/bauen1-policy/) on small VMs in
>>> the range of 1 vcpu, 512mb memory and a few gb of disk space
>>> (Comparable to the cheapest VPS plan you can get and still run
>>> reasonable stuff on).
>>> Recently I've started hitting the memory limit while building my cil policy using semodule / secilc.
>>>
>>> I've found that secilc can easily hit ~400mb memory usage while building dssp3 or ~260mb while building my policy.
>>> semodule invokes the same functions as secilc to build the policy
>>> but requires somewhere between 100mb - 200mb for whatever it is
>>> doing.
>>> Running semodule against a normal refpolicy installation only requires ~160mb memory total.
>>> This means that installing refpolicy on my VMs is not an issue, but
>>> even my CIL policy that is far from complete will easily OOM the
>>> machine.
>>> While adding additional memory isn't really an issue, I'm a bit
>>> annoyed that building an incomplete CIL policy requires ~2.8 times
>>> the memory that a complete refpolicy requires.
>>>
>>> After a bit of testing using valgrind, I believe this is mostly due
>>> to the way CIL handles blockinherit by duplicating the entire AST of
>>> the original block into the target.
>>> This works very well and is very simple, but also doesn't scale very well.
>>> For example my policy has a few "base templates",
>>> e.g. `file.template` that contain a lot of general use macros,
>>> e.g. `relabel_files`, `manage_blk_files`. A similar approach is
>>> taken by grift in dssp3.
>>> All of these macros (~130) are copied to every block containing a file type (only ~470) resulting in a lot of duplicate memory.
>>>
>>> Is it even possible to change libsepol, e.g. to use a COW for
>>> copy_ast_tree (and similiar) or is this behavior required e.g. for
>>> `in` or would a change not be worth it due to additional complexity
>>> ?
>>>
>>
>> Long before we developed CIL I had experimented with parsing Refpolicy
>> with a lua program that I created. I was really worried about memory
>> usage when developing that, so I did not copy anything. When it was
>> proposed to copy the AST for CIL I was sceptical and reworked my lua
>> program to see what the impact would be. It turned out to be easier to
>> do, faster, and did not require any more memory. The memory lost due
>> to copying the AST was made up by not having as many symbol tables.
>>
>> If a lot of the macros that are being inherited are not used, then it
>> might be worthwhile to add a step to remove unused macros. Of course,
>> to really save the memory usage only the macros that are going to be
>> used should be copied, but I don't think that would be easy to do.
>>
>> I will admit that I am not a big user of inheritance. What is gained
>> from inheriting all of the macros like that?
>
> consistency and comprehensiveness.
>
> In reffpolicy based policy its tempting to quickly copy and paste macros
> when you need them, leading to all kinds of inconsistencies ranging from
> descriptions that are wrong because one forgot to edit it after a copy
> paste to inconsistent macro names because it can be hard to be
> consistent with naming. Consistency is very important as there is almost
> nothing as annoying as guessing an interface/macro name wrong time after
> time because of an inconsistency.
>
> Having a comphrensive collection of inherited macros means that most of
> the time you dont have to deal with/worry about creating macros. It might also come
> in handy later if at some point an CIL-aware audit2allow -R type
> functionality arrives.
>
> That at one point was a pain point with refpolicy I believe were
> audit2allow -R wouldnt suggest an interface to use because the interface did not
> exist. By predefining all macros you ensure that audit2allow -R finds
> something.

Or it returned a interface that was broader than needed because a more
fitting interface did not exist. Thereby needlessly opening up the
policy.

By templating and using the templates you ensure that the macros are
there and that they are what you expect they are

>
>>
>> Thanks for the report. I will take a look to see if there might be a
>> fairly easy way to improve the situation.
>> Jim

-- 
gpg --locate-keys dominick.grift@defensec.nl
Key fingerprint = FCD2 3660 5D6B 9D27 7FC6  E0FF DA7E 521F 10F6 4098
https://sks-keyservers.net/pks/lookup?op=get&search=0xDA7E521F10F64098
Dominick Grift
