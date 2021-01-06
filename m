Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2530D2EC090
	for <lists+selinux@lfdr.de>; Wed,  6 Jan 2021 16:41:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727030AbhAFPkc (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Wed, 6 Jan 2021 10:40:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726845AbhAFPkb (ORCPT
        <rfc822;selinux@vger.kernel.org>); Wed, 6 Jan 2021 10:40:31 -0500
Received: from agnus.defensec.nl (agnus.defensec.nl [IPv6:2001:985:d55d::711])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 4C27CC061357
        for <selinux@vger.kernel.org>; Wed,  6 Jan 2021 07:39:51 -0800 (PST)
Received: from brutus (brutus.defensec.nl [IPv6:2001:985:d55d::438])
        by agnus.defensec.nl (Postfix) with ESMTPSA id 09B5E2A0FFE;
        Wed,  6 Jan 2021 16:39:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 agnus.defensec.nl 09B5E2A0FFE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=defensec.nl;
        s=default; t=1609947590;
        bh=6TSm1QwiEG+KG3QwTEMiUlWueaF1L7rFcI3c+Ct5jYU=;
        h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
        b=HctQGrjEJdA6lDuRSAVeAPleUec6zf6lP/bENvzckd1RLdxwK+DE4tjJK0bavqwm4
         VuYlgHdNtsZsmYfckgqnY+2IDJ4ozT6/OfQSRlCR4vdnkjVx7QJGFwVrMXYCiF0pQB
         BoJOzUHmV0fha6o6fNfcwSI+Nxg31ay1ppBCGQ+8=
From:   Dominick Grift <dominick.grift@defensec.nl>
To:     Ashish Mishra <ashishm@mvista.com>
Cc:     SElinux list <selinux@vger.kernel.org>,
        Paul Moore <paul@paul-moore.com>
Subject: Re: Selinux context type is same for root & normal user both
References: <CAP2OjcjH0=HdTMr3eVkD-LkK++8XVDb05C+TtC9+1ii61kErzg@mail.gmail.com>
        <ypjlzh1o523g.fsf@defensec.nl>
        <CAP2Ojcg2+FbjEc0mDuE6uLKL45vtNmUnwQDMAoYp97ST67XL1g@mail.gmail.com>
        <ypjlv9cc50hj.fsf@defensec.nl>
        <CAP2Ojch8tfxeYwep2LmouBF7RgUctfJ5Xh_MxvnKZ3fd82Bogw@mail.gmail.com>
        <ypjla6tmgoka.fsf@defensec.nl>
        <CAP2OjcjOEXsWM1H2pkMzhb3y2ss7SCTw8_1Tsb23kUnEDVfx-g@mail.gmail.com>
        <ypjl5z4agmt4.fsf@defensec.nl>
        <CAP2Ojci-JoSP_DtOecVNFi8AhTKTqKmpu+558Kzpucr8-z3nyg@mail.gmail.com>
        <ypjlsg7ef6nh.fsf@defensec.nl>
        <CAP2Ojcg5d=i0FKM0f1DTqtT2N3ftKEEqJq4=zdZr4m22xn4zjA@mail.gmail.com>
Date:   Wed, 06 Jan 2021 16:39:46 +0100
In-Reply-To: <CAP2Ojcg5d=i0FKM0f1DTqtT2N3ftKEEqJq4=zdZr4m22xn4zjA@mail.gmail.com>
        (Ashish Mishra's message of "Wed, 6 Jan 2021 20:50:50 +0530")
Message-ID: <ypjlo8i2f519.fsf@defensec.nl>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Ashish Mishra <ashishm@mvista.com> writes:

> Hi Dominick ,
>
> Will look at the re-labelling as you suggested.
> Is there any doc / blog / implementation etc to understand the
> sequence and commands to do this.
> To understand this step in a better way.
>
> We are working with such a setup freshly so any inputs / guidance will
> be helpful.
>
> Thanks for your time & inputs for this long thread .

For docs i would suggest selinuxproject.org and
https://github.com/SELinuxProject/selinux-notebook/blob/main/src/toc.md

For implementations i would suggest looking at how OpenWrt implemented
SELinux as this is a very simple implementation and the target seems to
be relatively similar to yours with the exception that OpenWrt does not
use a volatile root but instead uses a read-only squashfs and a overlay.

You can also look at Fedora CoreOS for inspiration, and Googles SEAndroid.

Implementing meaningful SELinux for exotic use cases like yours is not
trivial though IMHO. Using reference policy as a base-policy might not
be optimal for your use-case (to say the least) and it would probably be easier to create a
policy from scratch instead in the longer run.

>
> Thanks ,
> Ashish
>
>
>
>
>
>
>
>
>
>
> On Wed, Jan 6, 2021 at 8:34 PM Dominick Grift
> <dominick.grift@defensec.nl> wrote:
>>
>> Ashish Mishra <ashishm@mvista.com> writes:
>>
>> > Hi Dominick ,
>> > Thanks for your valuable time and inputs .
>> >
>> > As a background w.r.t ROOTFS :
>> > a) We had an custom SDK which is a basic makefile based SDK .
>> >
>> > b) The rootfs was RAMFS based .
>> >      For selinux we switched from RAMFS to TEMPFS
>> >
>> > c) It was not having SELINUX , so we added refpolicy & selinux-userland
>> >      Expectation was we will get working selinux context & policy.
>> >      I have the policy but the context is being the same for each file
>> > and folder .
>>
>> You also have to address labeling. If your filesystem is ram-based
>> (volatile) then I
>> suspect you will have to address labeling at runtime (ie run
>> setfiles/restorecon to label the filesystem). The point is that
>> your filesystem is currently not labeled according to the reference
>> policy.
>>
>> >
>> > d)  The setup is being evaluated for tempfs ( INITRAMFS-as -TEMPFS +
>> > SELINUX ) w.r.t output of mount command :
>> > ~ # mount
>> > rootfs on / type rootfs (rw,seclabel,size=253620k,nr_inodes=63405)
>> > sysfs on /sys type sysfs (rw,seclabel,relatime)
>> > selinuxfs on /sys/fs/selinux type selinuxfs (rw,nosuid,noexec,relatime)
>> > nodev on /dev type devtmpfs
>> > (rw,seclabel,relatime,size=253620k,nr_inodes=63405,mode=755)
>> > none on /proc type proc (rw,relatime)
>> > none on /dev/shm type tmpfs (rw,seclabel,relatime)
>> > none on /dev/pts type devpts (rw,seclabel,relatime,mode=600,ptmxmode=000)
>> > none on /sys/kernel/debug type debugfs (rw,seclabel,relatime)
>> > none on /mnth type hugetlbfs (rw,seclabel,relatime)
>> > cgroup on /sys/fs/cgroup type tmpfs (rw,seclabel,relatime,mode=755)
>> > cgroup on /sys/fs/cgroup/cpuset type cgroup (rw,relatime,cpuset)
>> > cgroup on /sys/fs/cgroup/cpu type cgroup (rw,relatime,cpu)
>> > cgroup on /sys/fs/cgroup/cpuacct type cgroup (rw,relatime,cpuacct)
>> > cgroup on /sys/fs/cgroup/blkio type cgroup (rw,relatime,blkio)
>> > cgroup on /sys/fs/cgroup/memory type cgroup (rw,relatime,memory)
>> > cgroup on /sys/fs/cgroup/devices type cgroup (rw,relatime,devices)
>> > cgroup on /sys/fs/cgroup/freezer type cgroup (rw,relatime,freezer)
>> > cgroup on /sys/fs/cgroup/net_cls type cgroup (rw,relatime,net_cls)
>> > cgroup on /sys/fs/cgroup/net_prio type cgroup (rw,relatime,net_prio)
>> > cgroup on /sys/fs/cgroup/hugetlb type cgroup (rw,relatime,hugetlb)
>> > cgroup on /sys/fs/cgroup/pids type cgroup (rw,relatime,pids)
>> > cgroup on /sys/fs/cgroup/debug type cgroup (rw,relatime,debug)
>> > cgroups on /sys/fs/cgroup/unified type cgroup2 (rw,relatime)
>> >
>> >
>> > Thanks ,
>> > Ashish
>>
>> --
>> gpg --locate-keys dominick.grift@defensec.nl
>> Key fingerprint = FCD2 3660 5D6B 9D27 7FC6  E0FF DA7E 521F 10F6 4098
>> https://sks-keyservers.net/pks/lookup?op=get&search=0xDA7E521F10F64098
>> Dominick Grift

-- 
gpg --locate-keys dominick.grift@defensec.nl
Key fingerprint = FCD2 3660 5D6B 9D27 7FC6  E0FF DA7E 521F 10F6 4098
https://sks-keyservers.net/pks/lookup?op=get&search=0xDA7E521F10F64098
Dominick Grift
