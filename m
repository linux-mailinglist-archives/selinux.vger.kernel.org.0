Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2BD1B3A02F
	for <lists+selinux@lfdr.de>; Sat,  8 Jun 2019 16:08:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727107AbfFHOIn convert rfc822-to-8bit (ORCPT
        <rfc822;lists+selinux@lfdr.de>); Sat, 8 Jun 2019 10:08:43 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52088 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726227AbfFHOIn (ORCPT <rfc822;selinux@vger.kernel.org>);
        Sat, 8 Jun 2019 10:08:43 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 7BF86C045129;
        Sat,  8 Jun 2019 14:08:42 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-18.phx2.redhat.com [10.3.116.18])
        by smtp.corp.redhat.com (Postfix) with ESMTP id E28901001B06;
        Sat,  8 Jun 2019 14:08:41 +0000 (UTC)
Reply-To: dwalsh@redhat.com
Subject: Re: New Container vulnerability could potentially use an SELinux fix.
To:     Stephen Smalley <sds@tycho.nsa.gov>,
        Miloslav Trmac <mitr@redhat.com>, selinux@vger.kernel.org
References: <7ca438c7-4a41-4daa-fc3f-a46a2e0af945@redhat.com>
 <9313f92a-46cf-c65c-6cfb-1373917de02b@tycho.nsa.gov>
 <d07bdda3-264b-daf4-5896-6e7a7c68f63a@redhat.com>
 <75f00b22-390a-8f7b-5f84-15c64d17eb89@tycho.nsa.gov>
From:   Daniel Walsh <dwalsh@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=dwalsh@redhat.com; prefer-encrypt=mutual; keydata=
 mQENBFsaqOEBCADBSnZCZpi262vX8m7iL/OdHKP9G9dhS28FR60cjd8nMPqHDNhQJBjLMZra
 66L2cCIEhc4HEItail7KU1BckrMc4laFaxL8tLoVTKHZwb74n2OcAJ4FtgzkNNlB1XJvSwC/
 909uwt7cpDqwXpJvyP3t17iuklB1OY0EEjTDt9aU4+0QjHzV18L4Cpd9iQ4ksu+EHT+pjlBk
 DdQB+hKoAjxPl11Eh6pZfrAcrNWpYBBk0A3XE9Jb6ghbmHWltNgVOsCa9GcswJHUEeFiOup6
 J5DTv6Xzwt0t6QB8nIs+wDJH+VxqAXcrxscnAhViIfGGS2AtxzjnVOz/J+UZPaauIGXTABEB
 AAG0LERhbmllbCBKIFdhbHNoIChGb3IgR2l0KSA8ZHdhbHNoQHJlZGhhdC5jb20+iQE4BBMB
 AgAiBQJbGqjhAhsDBgsJCAcDAgYVCAIJCgsEFgIDAQIeAQIXgAAKCRCi35Adq+LAKHuJB/98
 nZB5RmNjMWua4Ms8q5a1R9XWlDAb3mrST6JeL+uV/M0fa18e2Aw4/hi/WZHjAjoypLmcuaRx
 GeCbC8iYdpfRDUG79Y956Qq+Vs8c6VfNDMY1mvtfb00eeTaYoOCu0Aa9LDeR9iLKh2g0RI+N
 Zr3EU45RxZdacIs1v6mU8pGpyUq/FvuTGK9GzR9d1YeVCuSpQKN4ckHNZHJUXyk0vOZft1oO
 nSgLqM9EDWA+yz1JLmRYwbNsim7IvfVOav5mCgnKzHcL2mLv8qCnMFZjoQV8aGny/W739Z3a
 YJo1CdOg6zSu5SOvmq9idYrBRkwEtyLXss2oceTVBs0MxqQ/9mLPuQENBFsaqOEBCADDl2hl
 bUpqJGgwt2eQvs0Z0DCx/7nn0hlLfEn4WAv2HqP25AjIRXUX31Mzu68C4QnsvNtY4zN+FGRC
 EfUpYsjiL7vBYlRePhIohyMYU4RLp5eXFQKahHO/9Xlhe8mwueQNwYxNBPfMQ65U2AuqxpcS
 scx4s5w208mhqHoKz6IB2LuKeflhYfH5Y1FNAtVGHfhg22xlcAdupPPcxGuS4fBEW6PD/SDf
 Y4HT5iUHsyksQKjM0IFalqZ7YuLfXBl07OD2zU7WI9c3W0dwkvwIRjt3aD4iAah544uOLff+
 BzfxWghXeo80S2a1WCL0S/2qR0NVct/ExaDWboYr/bKpTa/1ABEBAAGJAR8EGAECAAkFAlsa
 qOECGwwACgkQot+QHaviwCi2hgf/XRvrt+VBmp1ZFxQAR9E6S7AtRT8KSytjFiqEC7TpOx3r
 2OZ4gZ3ZiW4TMW8hS7aYRgF1uYpLzl7BbrCfCHfAWEcXZ+uG8vayg8G/mLAcNlLY+JE76ATs
 53ziEY9R2Vb/wLMFd2nNBdqfwGcRH9N9VOej9vP76nCP01ZolY8Nms2hE383/+1Quxp5EedU
 BN5W5l7x9riBJyqCA63hr4u8wNsTuQgrDyhm/U1IvYeLtMopgotjnIR3KiTKOElbppLeXW3w
 EO/sQTPk+vQ4vcsJYY9Dnf1NlvHE4klj60GHjtjitsBEHzdE7s+J9FOxPmt8l+gMogGumKpN
 Y4lO0pfTyg==
Organization: Red Hat
Message-ID: <3957e38f-e62b-9800-da58-33ccb351a849@redhat.com>
Date:   Sat, 8 Jun 2019 10:08:41 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <75f00b22-390a-8f7b-5f84-15c64d17eb89@tycho.nsa.gov>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]); Sat, 08 Jun 2019 14:08:42 +0000 (UTC)
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On 6/7/19 5:26 PM, Stephen Smalley wrote:
> On 6/7/19 5:06 PM, Daniel Walsh wrote:
>> On 6/7/19 12:44 PM, Stephen Smalley wrote:
>>> On 6/7/19 11:42 AM, Daniel Walsh wrote:
>>>> We have periodic vulnerablities around bad container images having
>>>> symbolic link attacks against the host.
>>>>
>>>> One came out last week about doing a `podman cp`
>>>>
>>>> Which would copy content from the host into the container.  The issue
>>>> was that if the container was running, it could trick the processes
>>>> copying content into it to follow a symbolic link to external of the
>>>> container image.
>>>>
>>>> The question came up, is there a way to use SELinux to prevent
>>>> this. And
>>>> sadly the answer right now is no, because we have no way to know what
>>>> the label of the process attempting to update the container file
>>>> system
>>>> is running as.  Usually it will be running as unconfined_t.
>>>>
>>>> One idea would be to add a rule to policy that control the
>>>> following of
>>>> symbolic links to only those specified in policy.
>>>>
>>>>
>>>> Something like
>>>>
>>>> SPECIALRESTRICTED TYPE container_file_t
>>>>
>>>> allow container_file_t container_file_t:symlink follow;
>>>>
>>>> Then if a process attempted to copy content onto a symbolic link from
>>>> container_file_t to a non container_file_t type, the kernel would deny
>>>> access.
>>>>
>>>> Thoughts?
>>>
>>> SELinux would prevent it if you didn't allow unconfined_t (or other
>>> privileged domains) to follow untrustworthy symlinks (e.g. don't allow
>>> unconfined_t container_file_t:lnk_file read; in the first place).
>>> That's the right way to prevent it.
>>>
>>> Trying to apply a check between symlink and its target as you suggest
>>> is problematic; we don't generally have them both at the same point.
>>> If we are allowed to follow the symlink, we read its contents and
>>> perform a path walk on that, and that could be a multi-component
>>> pathname lookup that itself spans further symlinks, mount points,
>>> etc.  I think that would be challenging to support in the kernel,
>>> subject to races, and certainly would require changes outside of just
>>> SELinux.
>>>
>>> If you truly cannot impose such restrictions on unconfined_t, then
>>> maybe podman should run in its own domain.
>>>
>> This is not an issue with just podman.  Podman can mount the image and
>> the tools can just read/write content into the mountpoint.
>>
>> I thought I recalled a LSM that prefented symlink attacks when users
>> would link a file in the homedir against /etc/shadow and then attempt to
>> get the admin to modify the file in his homedir?
>>
>> I was thinking that if that existed we could build more controls on it
>> based on Labels rather then just UIDs matching.
>
> Not sure if you are thinking of symlink attacks or hard link attacks.
> SELinux supports preventing the former by restricting the ability to
> follow symlinks based on lnk_file read permission, so you can prevent
> trusted processes from following untrustworthy symlinks.  SELinux
> supports preventing the latter by restricting the ability to create
> hard links to unauthorized files.  But you need to write your policies
> in a manner that leverages that support, and a fully unconfined domain
> isn't going to be protected via SELinux by definition; ideally you'd
> be phasing out unconfined altogether like Android did.  Modern kernels
> also have the /proc/sys/fs/protected_hardlinks and
> /proc/sys/fs/protected_symlinks settings, which restrict based on UID,
> but the symlink checks aren't based on the target of the symlink either.

Android does not have an Admin, so it is a lot easier for them.  But not
going to get into that now.  I obviously understand how SELinux works. 
But perhaps I am looking for something differntly.

This link defines pretty close to what I would want, but extended for
labels rather then just UIDS.

https://sysctl-explorer.net/fs/protected_symlinks/


> A long-standing class of security issues is the symlink-based
> time-of-check-time-of-use race, most commonly seen in world-writable
> directories like /tmp. The common method of exploitation of this flaw
> is to cross privilege boundaries when following a given symlink (i.e.
> a **PRIVILEGED** process follows a symlink belonging **PROVIDED BY
> OTHERS**). For a likely incomplete list of hundreds of examples across
> the years, please see:
> http://cve.mitre.org/cgi-bin/cvekey.cgi?keyword=/tmp
>
> When set to “0”, symlink following behavior is unrestricted.
>
> When set to “1” symlinks are permitted to be followed only when
> outside a sticky world-writable directory **WE COULD POTENTIALLY SET
> THIS OR SOME OTHER FLAG**, or when the **LABEL** of the symlink and
> follower match, or when the directory **LABEL** matches the symlink’s
> **LABEL**.
>
> This protection is based on the restrictions in Openwall and grsecurity.
>






