Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D96884AA84E
	for <lists+selinux@lfdr.de>; Sat,  5 Feb 2022 12:19:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241521AbiBELTw (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Sat, 5 Feb 2022 06:19:52 -0500
Received: from markus.defensec.nl ([45.80.168.93]:60728 "EHLO
        markus.defensec.nl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241305AbiBELTw (ORCPT
        <rfc822;selinux@vger.kernel.org>); Sat, 5 Feb 2022 06:19:52 -0500
Received: from brutus (brutus.lan [IPv6:2a10:3781:2099::438])
        by markus.defensec.nl (Postfix) with ESMTPSA id 524DFFC0803;
        Sat,  5 Feb 2022 12:19:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=defensec.nl;
        s=default; t=1644059989;
        bh=DkYsvqxJflEiUvHzl/HqKRyJ4EtQLBjSus05xPD/slM=;
        h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
        b=Q89iLVr+Y19RoCulvxTQNf143XwaHc05NAcwJdX5NUpqajpMyeCRGfYNh6D0ThMQo
         bFhJABM6tPSuXy0EveWijQOo1SuP0BSugrbc/ioBk3Ja/bDtp3SuyjuA8hQWSHiFpi
         WsJghEfV75ISyX6cXcWWyhpqf3wga7AB6bPLU7I0=
From:   Dominick Grift <dominick.grift@defensec.nl>
To:     Chris PeBenito <chpebeni@linux.microsoft.com>
Cc:     Paul Moore <paul@paul-moore.com>,
        Demi Marie Obenour <demiobenour@gmail.com>,
        Stephen Smalley <stephen.smalley.work@gmail.com>,
        Eric Paris <eparis@parisplace.org>, selinux@vger.kernel.org,
        linux-kernel@vger.kernel.org, selinux-refpolicy@vger.kernel.org
Subject: Re: [PATCH] SELinux: Always allow FIOCLEX and FIONCLEX
References: <4df50e95-6173-4ed1-9d08-3c1c4abab23f@gmail.com>
        <CAHC9VhSjTqT-4TMxBnQOQHkj+djONihfeoPVyy1egrZY2t10XA@mail.gmail.com>
        <c8a616e4-26a6-af51-212c-31dca0e265cd@gmail.com>
        <CAHC9VhQTZdeNOx3AXdoc9LXUzDk5n7wyGBX-tV-ZaovhPAdWwQ@mail.gmail.com>
        <e85dd38b-ef7b-ed7e-882e-124cdf942c44@gmail.com>
        <CAHC9VhROuJtvNHuVaR6pEekNFacH3Tywx58_hn1f5Mwk+kjC8g@mail.gmail.com>
        <b7e55304-d114-bcbe-08d2-b54828121a01@gmail.com>
        <CAHC9VhSdgD4Nfaxbnnn4r-OK8koSZ7+zQoPShDbGi9PvkJFpng@mail.gmail.com>
        <478e1651-a383-05ff-d011-6dda771b8ce8@linux.microsoft.com>
Date:   Sat, 05 Feb 2022 12:19:48 +0100
In-Reply-To: <478e1651-a383-05ff-d011-6dda771b8ce8@linux.microsoft.com> (Chris
        PeBenito's message of "Fri, 4 Feb 2022 08:48:27 -0500")
Message-ID: <875ypt5zmz.fsf@defensec.nl>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Chris PeBenito <chpebeni@linux.microsoft.com> writes:

> On 2/3/2022 18:44, Paul Moore wrote:
>> On Wed, Feb 2, 2022 at 5:13 AM Demi Marie Obenour <demiobenour@gmail.com> wrote:
>>> On 2/1/22 12:26, Paul Moore wrote:
>>>> On Sat, Jan 29, 2022 at 10:40 PM Demi Marie Obenour
>>>> <demiobenour@gmail.com> wrote:
>>>>> On 1/26/22 17:41, Paul Moore wrote:
>>>>>> On Tue, Jan 25, 2022 at 5:50 PM Demi Marie Obenour
>>>>>> <demiobenour@gmail.com> wrote:
>>>>>>> On 1/25/22 17:27, Paul Moore wrote:
>>>>>>>> On Tue, Jan 25, 2022 at 4:34 PM Demi Marie Obenour
>>>>>>>> <demiobenour@gmail.com> wrote:
>>>>>>>>>
>>>>>>>>> These ioctls are equivalent to fcntl(fd, F_SETFD, flags), which SELinux
>>>>>>>>> always allows too.  Furthermore, a failed FIOCLEX could result in a file
>>>>>>>>> descriptor being leaked to a process that should not have access to it.
>>>>>>>>>
>>>>>>>>> Signed-off-by: Demi Marie Obenour <demiobenour@gmail.com>
>>>>>>>>> ---
>>>>>>>>>   security/selinux/hooks.c | 5 +++++
>>>>>>>>>   1 file changed, 5 insertions(+)
>>>>>>>>
>>>>>>>> I'm not convinced that these two ioctls should be exempt from SELinux
>>>>>>>> policy control, can you explain why allowing these ioctls with the
>>>>>>>> file:ioctl permission is not sufficient for your use case?  Is it a
>>>>>>>> matter of granularity?
>>>>>>>
>>>>>>> FIOCLEX and FIONCLEX are applicable to *all* file descriptors, not just
>>>>>>> files.  If I want to allow them with SELinux policy, I have to grant
>>>>>>> *:ioctl to all processes and use xperm rules to determine what ioctls
>>>>>>> are actually allowed.  That is incompatible with existing policies and
>>>>>>> needs frequent maintenance when new ioctls are added.
>>>>>>>
>>>>>>> Furthermore, these ioctls do not allow one to do anything that cannot
>>>>>>> already be done by fcntl(F_SETFD), and (unless I have missed something)
>>>>>>> SELinux unconditionally allows that.  Therefore, blocking these ioctls
>>>>>>> does not improve security, but does risk breaking userspace programs.
>>>>>>> The risk is especially great because in the absence of SELinux, I
>>>>>>> believe FIOCLEX and FIONCLEX *will* always succeed, and userspace
>>>>>>> programs may rely on this.  Worse, if a failure of FIOCLEX is ignored,
>>>>>>> a file descriptor can be leaked to a child process that should not have
>>>>>>> access to it, but which SELinux allows access to.  Userspace
>>>>>>> SELinux-naive sandboxes are one way this could happen.  Therefore,
>>>>>>> blocking FIOCLEX may *create* a security issue, and it cannot solve one.
>>>>>>
>>>>>> I can see you are frustrated with my initial take on this, but please
>>>>>> understand that excluding an operation from the security policy is not
>>>>>> something to take lightly and needs discussion.  I've added the
>>>>>> SELinux refpolicy list to this thread as I believe their input would
>>>>>> be helpful here.
>>>>>
>>>>> Absolutely it is not something that should be taken lightly, though I
>>>>> strongly believe it is correct in this case.  Is one of my assumptions
>>>>> mistaken?
>>>>
>>>> My concern is that there is a distro/admin somewhere which is relying
>>>> on their SELinux policy enforcing access controls on these ioctls and
>>>> removing these controls would cause them a regression.
>>>
>>> I obviously do not have visibility into all systems, but I suspect that
>>> nobody is actually relying on this.  Setting and clearing CLOEXEC via
>>> fcntl is not subject to SELinux restrictions, so blocking FIOCLEX
>>> and FIONCLEX can be trivially bypassed unless fcntl(F_SETFD) is
>>> blocked by seccomp or another LSM.  Clearing close-on-exec can also be
>>> implemented with dup2(), and setting it can be implemented with dup3()
>>> and F_DUPFD_CLOEXEC (which SELinux also allows).  In short, I believe
>>> that unconditionally allowing FIOCLEX and FIONCLEX may fix real-world
>>> problems, and that it is highly unlikely that anyone is relying on the
>>> current behavior.
>> I understand your point, but I remain concerned about making a
>> kernel
>> change for something that can be addressed via policy.  I'm also
>> concerned that in the nine days this thread has been on both the mail
>> SELinux developers and refpolicy lists no one other than you and I
>> have commented on this patch.  In order to consider this patch
>> further, I'm going to need to see comments from others, preferably
>> those with a background in supporting SELinux policy.
>> Also, while I'm sure you are already well aware of this, I think it
>> is
>> worth mentioning that SELinux does apply access controls when file
>> descriptors are inherited across an exec() boundary.
>
>
> I don't have a strong opinion either way.  If one were to allow this
> using a policy rule, it would result in a major policy breakage.  The 
> rule would turn on extended perm checks across the entire system,
> which the SELinux Reference Policy isn't written for.  I can't speak
> to the Android policy, but I would imagine it would be the similar
> problem there too.

Excuse me if I am wrong but AFAIK adding a xperm rule does not turn on
xperm checks across the entire system.

If i am not mistaken it will turn on xperm checks only for the
operations that have the same source and target/target class.

This is also why i don't (with the exception TIOSCTI for termdev
chr_file) use xperms by default.

1. it is really easy to selectively filter ioctls by adding xperm rules
for end users (and since ioctls are often device/driver specific they
know best what is needed and what not)

2. if you filter ioctls in upstream policy for example like i do with
TIOSCTI using for example (allowx foo bar (ioctl chr_file (not
(0xXXXX)))) then you cannot easily exclude additional ioctls later where source is
foo and target/tclass is bar/chr_file because there is already a rule in
place allowing the ioctl (and you cannot add rules)

>
>
> --
> Chris PeBenito
>

-- 
gpg --locate-keys dominick.grift@defensec.nl
Key fingerprint = FCD2 3660 5D6B 9D27 7FC6  E0FF DA7E 521F 10F6 4098
Dominick Grift
