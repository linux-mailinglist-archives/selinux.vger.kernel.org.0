Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B063542C546
	for <lists+selinux@lfdr.de>; Wed, 13 Oct 2021 17:52:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230474AbhJMPyN (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Wed, 13 Oct 2021 11:54:13 -0400
Received: from smtp-bc0a.mail.infomaniak.ch ([45.157.188.10]:60543 "EHLO
        smtp-bc0a.mail.infomaniak.ch" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233899AbhJMPyM (ORCPT
        <rfc822;selinux@vger.kernel.org>); Wed, 13 Oct 2021 11:54:12 -0400
X-Greylist: delayed 310 seconds by postgrey-1.27 at vger.kernel.org; Wed, 13 Oct 2021 11:54:12 EDT
Received: from smtp-3-0001.mail.infomaniak.ch (unknown [10.4.36.108])
        by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4HTxjY44HSzMqSBR;
        Wed, 13 Oct 2021 17:46:57 +0200 (CEST)
Received: from ns3096276.ip-94-23-54.eu (unknown [23.97.221.149])
        by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4HTxjX55Rfzlh8TK;
        Wed, 13 Oct 2021 17:46:56 +0200 (CEST)
Subject: Re: [PATCH] security/landlock: use square brackets around
 "landlock-ruleset"
To:     Paul Moore <paul@paul-moore.com>,
        Ondrej Mosnacek <omosnace@redhat.com>,
        Christian Brauner <brauner@kernel.org>
Cc:     Chris PeBenito <pebenito@ieee.org>,
        Petr Lautrbach <plautrba@redhat.com>,
        Christian Brauner <christian.brauner@ubuntu.com>,
        Linux Security Module list 
        <linux-security-module@vger.kernel.org>,
        SElinux list <selinux@vger.kernel.org>
References: <20211011133704.1704369-1-brauner@kernel.org>
 <06b6f249-06e6-f472-c74c-bb3ff6f4b4ee@digikod.net>
 <20211012103830.s7kzijrn25ucjasr@wittgenstein>
 <CAHC9VhSd32Q_tCctwYB0y4EXGCV8_9QajkNkkc96EwjdFsVkJw@mail.gmail.com>
 <CAFqZXNu7OEFVaS-oJH_JhsCWg3aN67Hajbiw8U8Zd+TSMKatOQ@mail.gmail.com>
 <CAHC9VhR2kvwaYWZtXrZty7X_uQCr+pHnm6rHFAGzUDrstBpT_g@mail.gmail.com>
From:   =?UTF-8?Q?Micka=c3=abl_Sala=c3=bcn?= <mic@digikod.net>
Message-ID: <cfbb70a1-360f-37e7-f3c5-487e1330a65a@digikod.net>
Date:   Wed, 13 Oct 2021 17:47:53 +0200
User-Agent: 
MIME-Version: 1.0
In-Reply-To: <CAHC9VhR2kvwaYWZtXrZty7X_uQCr+pHnm6rHFAGzUDrstBpT_g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org


On 12/10/2021 23:09, Paul Moore wrote:
> On Tue, Oct 12, 2021 at 4:38 PM Ondrej Mosnacek <omosnace@redhat.com> wrote:
>>
>> On Tue, Oct 12, 2021 at 8:12 PM Paul Moore <paul@paul-moore.com> wrote:
>>> On Tue, Oct 12, 2021 at 6:38 AM Christian Brauner
>>> <christian.brauner@ubuntu.com> wrote:
>>>> On Mon, Oct 11, 2021 at 04:38:55PM +0200, Mickaël Salaün wrote:
>>>>> On 11/10/2021 15:37, Christian Brauner wrote:
>>>>>> From: Christian Brauner <christian.brauner@ubuntu.com>
>>>>>>
>>>>>> Make the name of the anon inode fd "[landlock-ruleset]" instead of
>>>>>> "landlock-ruleset". This is minor but most anon inode fds already
>>>>>> carry square brackets around their name:
>>>>>>
>>>>>>     [eventfd]
>>>>>>     [eventpoll]
>>>>>>     [fanotify]
>>>>>>     [fscontext]
>>>>>>     [io_uring]
>>>>>>     [pidfd]
>>>>>>     [signalfd]
>>>>>>     [timerfd]
>>>>>>     [userfaultfd]
>>>>>>
>>>>>> For the sake of consistency lets do the same for the landlock-ruleset anon
>>>>>> inode fd that comes with landlock. We did the same in
>>>>>> 1cdc415f1083 ("uapi, fsopen: use square brackets around "fscontext" [ver #2]")
>>>>>> for the new mount api.
>>>>>
>>>>> Before creating "landlock-ruleset" FD, I looked at other anonymous FD
>>>>> and saw this kind of inconsistency. I don't get why we need to add extra
>>>>> characters to names, those brackets seem useless. If it should be part
>>>>
>>>> Past inconsistency shouldn't justify future inconsistency. If you have a
>>>> strong opinion about this for landlock I'm not going to push for it.
>>>> Exchanging more than 2-3 email about something like this seems too much.
>>>
>>> [NOTE: adding the SELinux list as well as Chris (SELinux refrence
>>> policy maintainer) and Petr (Fedora/RHEL SELinux)]
>>>
>>> Chris and Petr, do either of you currently have any policy that
>>> references the "landlock-ruleset" anonymous inode?  In other words,
>>> would adding the brackets around the name cause you any problems?
>>
>> AFAIU, the anon_inode transitions (the only mechanism where the "file
>> name" would be exposed to the policy) are done only for inodes created
>> by anon_inode_getfd_secure(), which is currently only used by
>> userfaultfd. So you don't even need to ask that question; at this
>> point it should be safe to change any of the names except
>> "[userfaultfd]" as far as SELinux policy is concerned.
> 
> There is also io_uring if you look at selinux/next.
> 
> Regardless, thanks, I didn't check to see if landlock was using the
> new anon inode interface, since both Mickaël and Christian were
> concerned about breaking SELinux I had assumed they were using it :)
> 

Ok, thanks Paul and Ondrej.

Such anonymous inode names seem to be only exposed to proc for now.
Let's change this name then. I think it make sense to backport this
patch down to 5.13 to fix all the inconsistencies.
