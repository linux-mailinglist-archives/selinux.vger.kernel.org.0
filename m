Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 197716C1FAC
	for <lists+selinux@lfdr.de>; Mon, 20 Mar 2023 19:27:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231378AbjCTS1Y (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Mon, 20 Mar 2023 14:27:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231383AbjCTS1G (ORCPT
        <rfc822;selinux@vger.kernel.org>); Mon, 20 Mar 2023 14:27:06 -0400
Received: from markus.defensec.nl (markus.defensec.nl [IPv6:2a10:3781:2099::123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 144B57D89
        for <selinux@vger.kernel.org>; Mon, 20 Mar 2023 11:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=defensec.nl;
        s=default; t=1679336387;
        bh=tM0PlMThFfuUauqXEt/JlFZdidPp2bElLx+8S6NkT3g=;
        h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
        b=UqXd7kA9n4ZMlXjjxHYjASR3smVroi4DlHlxL/ZiGGptiFnQItG/TPj6u/ir9wlML
         LLQ5inVem29VcQRfNDSJVXYLprHhUqSqva6WpylJcHhkTtVGdH02mmuI/8PbXYYscM
         sWLvIlux5zNMs1oVP8njq8ibluork3QQtHHxu1XE=
Received: from paulus (paulus.lan [IPv6:2a10:3781:2099::515])
        by markus.defensec.nl (Postfix) with ESMTPSA id 48D173CC;
        Mon, 20 Mar 2023 19:19:47 +0100 (CET)
From:   Dominick Grift <dominick.grift@defensec.nl>
To:     Stephen Smalley <stephen.smalley.work@gmail.com>
Cc:     Ondrej Mosnacek <omosnace@redhat.com>,
        Paul Moore <paul@paul-moore.com>, selinux@vger.kernel.org
Subject: Re: cgroup2 labeling question
References: <87mt47ga29.fsf@defensec.nl>
        <CAEjxPJ51N4sguZZ6EkXDuCkaQSp1=Z8NODFbLS9B1_143ktuxA@mail.gmail.com>
        <871qljfrtz.fsf@defensec.nl>
        <CAFqZXNvJdb8e2b6NzC4yO7DfMc32wrRsyU160YN2Us7oZmKBeQ@mail.gmail.com>
        <87wn3bec97.fsf@defensec.nl>
        <CAFqZXNvULBzqMbN5ymB6fam6=CiUzikp3iWfvFj2cK++5wOwrA@mail.gmail.com>
        <CAEjxPJ6tYSPEVJV1usgpsT=kXBisQwAcYDkUv20br=gxQZV9eA@mail.gmail.com>
        <87lejre9b2.fsf@defensec.nl>
        <CAEjxPJ4gsGseRtSDBrAkLEsFzu5QUXbespYESU0+LyEFJUjo=g@mail.gmail.com>
        <87h6ufe5um.fsf@defensec.nl>
        <CAEjxPJ5JWjhLpOavUsqH-ZU_NHYOc_dKmc8YBQA5jv-XcWazhw@mail.gmail.com>
        <CAEjxPJ7gf5seRK59Gf8ZPRSC+WL1iQWOX1bTimdBmBxuMHPkxw@mail.gmail.com>
        <CAEjxPJ4yUhU05ZY2-6RyisBv4CC8_-ahMWCuwB99rHR6vbKUGQ@mail.gmail.com>
Date:   Mon, 20 Mar 2023 19:19:47 +0100
In-Reply-To: <CAEjxPJ4yUhU05ZY2-6RyisBv4CC8_-ahMWCuwB99rHR6vbKUGQ@mail.gmail.com>
        (Stephen Smalley's message of "Mon, 20 Mar 2023 14:15:40 -0400")
Message-ID: <878rfre14s.fsf@defensec.nl>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Stephen Smalley <stephen.smalley.work@gmail.com> writes:

> On Mon, Mar 20, 2023 at 1:53=E2=80=AFPM Stephen Smalley
> <stephen.smalley.work@gmail.com> wrote:
>>
>> On Mon, Mar 20, 2023 at 1:28=E2=80=AFPM Stephen Smalley
>> <stephen.smalley.work@gmail.com> wrote:
>> > Hmm...that's interesting. I just tried in Fedora using one of the
>> > type_transitions already defined in the default policy and although it
>> > appears to use the type_transition to compute the new SID for the
>> > create check, ls -Z of the file after creation showed it labeled
>> > cgroup_t instead. So it doesn't appear to be working or I am doing it
>> > wrong.
>>
>> Reproducer, on F34,
>> $ sudo mkdir /sys/fs/cgroup/system.slice/.snapshots
>> mkdir: cannot create directory
>> =E2=80=98/sys/fs/cgroup/system.slice/.snapshots=E2=80=99: Permission den=
ied
>> $ sudo ausearch -m AVC -ts recent -i
>> ----
>> type=3DAVC msg=3Daudit(03/20/2023 13:00:04.699:47156) : avc:  denied  {
>> associate } for  pid=3D152325 comm=3Dmkdir name=3D.snapshots
>> scontext=3Dunconfined_u:object_r:snapperd_data_t:s0
>> tcontext=3Dsystem_u:object_r:cgroup_t:s0 tclass=3Dfilesystem permissive=
=3D0
>> $ seinfo --fs_use | grep cgroup
>> $ seinfo --genfscon | grep cgroup
>>    genfscon cgroup /  system_u:object_r:cgroup_t:s0
>>    genfscon cgroup2 /  system_u:object_r:cgroup_t:s0
>> $ sesearch -T -s unconfined_t -t cgroup_t -c dir
>> type_transition unconfined_t cgroup_t:dir snapperd_data_t .snapshots
>> $ sudo setenforce 0
>> $ sudo mkdir /sys/fs/cgroup/system.slice/.snapshots
>> $ ls -Zd /sys/fs/cgroup/system.slice/.snapshots
>> system_u:object_r:cgroup_t:s0 /sys/fs/cgroup/system.slice/.snapshots
>
> Unless systemd is coming along after file creation and relabeling it
> to cgroup_t at that time.

That wouldnt make sense to me, but yes i considered that as well. Ruled
it out without actually confirming it. I actually added a rule:

auditallow domain cgroup_t:dir create;

and that also does not show grants for all the dirs in /sys/fs/cgroup
(just some)

voodoo

--=20
gpg --locate-keys dominick.grift@defensec.nl
Key fingerprint =3D FCD2 3660 5D6B 9D27 7FC6  E0FF DA7E 521F 10F6 4098
Dominick Grift
