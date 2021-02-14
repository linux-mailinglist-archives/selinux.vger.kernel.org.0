Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 774EE31AF99
	for <lists+selinux@lfdr.de>; Sun, 14 Feb 2021 08:31:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229528AbhBNHa7 (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Sun, 14 Feb 2021 02:30:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229520AbhBNHa6 (ORCPT
        <rfc822;selinux@vger.kernel.org>); Sun, 14 Feb 2021 02:30:58 -0500
Received: from agnus.defensec.nl (agnus.defensec.nl [IPv6:2001:985:d55d::711])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 230D1C061574
        for <selinux@vger.kernel.org>; Sat, 13 Feb 2021 23:30:18 -0800 (PST)
Received: from brutus (brutus.lan [IPv6:2001:985:d55d::438])
        by agnus.defensec.nl (Postfix) with ESMTPSA id 9AB072A0CF2;
        Sun, 14 Feb 2021 08:30:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 agnus.defensec.nl 9AB072A0CF2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=defensec.nl;
        s=default; t=1613287813;
        bh=bgescqn/F3NMyNwfBuXXd7SdaJJkA29vDUsCZFJ2jqM=;
        h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
        b=HQ2Z285AVq4z48bltH7t3XeGtCFH1zw/C/VME2o/abkbgedQYQEqrX16ciuRO6EBn
         beVdlgT3KEJLbSndMLA3yutzMVxGSeV4iQJQ54rtXZd28s/k0+bAWebwth5njpxdr2
         pJx7NlxjYZd2Mx22JdzRpFTWhdvTQyEhj8oSAa2w=
From:   Dominick Grift <dominick.grift@defensec.nl>
To:     Peter Whittaker <peterwhittaker@sphyrnasecurity.com>
Cc:     Topi Miettinen <toiwoton@gmail.com>,
        SElinux list <selinux@vger.kernel.org>
Subject: Re: Defining SELinux users, "Unable to get valid context...". Help!
References: <CAGeouKF3jSsvDosCWDb3q4RSq8g1RiZma6V1N=1ZaSUtf2TadA@mail.gmail.com>
        <ypjlblcppx6o.fsf@defensec.nl> <ypjl7dndpvoy.fsf@defensec.nl>
        <CAGeouKEX-suBZgmCniX=FLUB4LxyfK67=NyDRdqoCfpHnzYk+g@mail.gmail.com>
        <ypjl35y1ot14.fsf@defensec.nl>
        <CAGeouKFS+VOoPZhxCBN0awMqjsc1b59kiZMU_jyHJ+G+4sO2LQ@mail.gmail.com>
        <ypjlv9awo2iy.fsf@defensec.nl>
        <CAGeouKEmq5aiGT7ByaSZBAZ0k5C=epmkDZzvZzW7taMpr3BADQ@mail.gmail.com>
        <ypjlmtw8ne46.fsf@defensec.nl>
        <878dc2cd-5691-328e-d258-805fb14517f4@gmail.com>
        <CAGeouKFG_JkoBH=iUeD-nsPTHQPJqm2wUVnr22oOE=knsQo3Vg@mail.gmail.com>
        <ypjlim6vog7a.fsf@defensec.nl>
        <CAGeouKF5n_HU3h7tMEOFr3S0dXAQjbhMPtgi=AB5g9i3w1s_aw@mail.gmail.com>
Date:   Sun, 14 Feb 2021 08:30:09 +0100
In-Reply-To: <CAGeouKF5n_HU3h7tMEOFr3S0dXAQjbhMPtgi=AB5g9i3w1s_aw@mail.gmail.com>
        (Peter Whittaker's message of "Sat, 13 Feb 2021 17:42:50 -0500")
Message-ID: <ypjleehjnm2m.fsf@defensec.nl>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Peter Whittaker <peterwhittaker@sphyrnasecurity.com> writes:

> On Sat, Feb 13, 2021 at 3:41 PM Dominick Grift
> <dominick.grift@defensec.nl> wrote:
>> Where is "domain"?
>
>> Peter Whittaker <peterwhittaker@sphyrnasecurity.com> writes:
>> > WRT all of what follows, I've attached the current CDTml.te; yes, it
>> > misses the domain type, but at this point, I want to identify why the
>> > two different types of users are treated differently. This is all
>> > under permissive mode.
>
> Yes, I may need it, but at this point I want to understand why one
> works and the other doesn't.

I know that the openssh-server in red-hat based distributions has custom
selinux patches. 

>
> P

-- 
gpg --locate-keys dominick.grift@defensec.nl
Key fingerprint = FCD2 3660 5D6B 9D27 7FC6  E0FF DA7E 521F 10F6 4098
https://sks-keyservers.net/pks/lookup?op=get&search=0xDA7E521F10F64098
Dominick Grift
