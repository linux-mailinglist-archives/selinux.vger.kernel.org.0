Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B76DE2349B6
	for <lists+selinux@lfdr.de>; Fri, 31 Jul 2020 18:53:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728958AbgGaQxa (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Fri, 31 Jul 2020 12:53:30 -0400
Received: from agnus.defensec.nl ([80.100.19.56]:52412 "EHLO agnus.defensec.nl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732978AbgGaQx2 (ORCPT <rfc822;selinux@vger.kernel.org>);
        Fri, 31 Jul 2020 12:53:28 -0400
Received: from brutus (brutus.lan [IPv6:2001:985:d55d::438])
        by agnus.defensec.nl (Postfix) with ESMTPSA id 61DC42A0CF5;
        Fri, 31 Jul 2020 18:53:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 agnus.defensec.nl 61DC42A0CF5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=defensec.nl;
        s=default; t=1596214406;
        bh=m9MfBMMW0wWfFiw8m1zwYppTz1aHqV8gTAo0Lp3I3Ew=;
        h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
        b=E9LBIxLxRzq4ugad8/wlZS+w/3fHdqt4gAWvFq8jIIeYw6XS9fCgOwBeMY3XBqaNu
         DwOc3+FHhMp4OgnQLVVc0t8JSu4y18DDHvF1yJf8Nc/dMHTIajv8V8COU6XEO9DVj8
         GFje/2Wa3ZjKUmBy5SibY2x4ryGO10gidJ75ROlU=
From:   Dominick Grift <dominick.grift@defensec.nl>
To:     Christian =?utf-8?Q?G=C3=B6ttsche?= <cgzones@googlemail.com>
Cc:     Gionatan Danti <g.danti@assyoma.it>, selinux@vger.kernel.org
Subject: Re: lnk_file read permission
References: <9c20af23bf7b70d6e01ca6772cc31f88@assyoma.it>
        <CAJ2a_Dcev_o+NyuwUqh2ANseRniZRMQJ4dhDtrF1BtCmFSLgpg@mail.gmail.com>
Date:   Fri, 31 Jul 2020 18:53:21 +0200
In-Reply-To: <CAJ2a_Dcev_o+NyuwUqh2ANseRniZRMQJ4dhDtrF1BtCmFSLgpg@mail.gmail.com>
        ("Christian \=\?utf-8\?Q\?G\=C3\=B6ttsche\=22's\?\= message of "Fri, 31 Jul 2020
 18:25:55 +0200")
Message-ID: <ypjld04bmxry.fsf@defensec.nl>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Christian G=C3=B6ttsche <cgzones@googlemail.com> writes:

> Am Fr., 31. Juli 2020 um 12:03 Uhr schrieb Gionatan Danti <g.danti@assyom=
a.it>:
>>
>> Dear list,
>> I am writing this email as suggested here:
>> https://lists.fedoraproject.org/archives/list/selinux@lists.fedoraprojec=
t.org/message/GWEWGDUQS6PERAYEJHL2EE4GDO432IAO/
>>
>> To recap: I have issue with selinux permission when relocating specific
>> daemon data directory, and using symlink in the original location. For
>> example, lets consider moving /var/lib/mysql in a new, bigger volume.
>>
>> After moving /var/lib/mysql in /data/lib/mysql and creating a symlink
>> for the new location, I used semanage fcontext to add the relative
>> equivalency rules. Moreover, I changed my.cnf to explicitly point to the
>> new data dir and socket file. So far, so good.
>>
>> When restarting apache, I noticed it can't connect to mysql. ausearch -m
>> avc showed the following:
>> ...
>> type=3DAVC msg=3Daudit(1596055762.070:175569): avc:  denied  { read } for
>> pid=3D72946 comm=3D"httpd" name=3D"mysql" dev=3D"sda2" ino=3D103
>> scontext=3Dsystem_u:system_r:httpd_t:s0
>> tcontext=3Dsystem_u:object_r:mysqld_db_t:s0 tclass=3Dlnk_file permissive=
=3D0
>>
>> The log above clearly states that httpd policy lacks lnk_read permission
>> for mysqld_db_t type. While I solved the issue by leaving the socket
>> file inside the original directory (removing the /var/lib/mysql symlink
>> and recreating the mysql dir), I was wondering why each symlink type is
>> specifically allowed
>> rather than giving any processes a generic access to symlinks.
>>
>> Is this kind of rule not permitted by selinux? Can it open the door to
>> other attacks? If so, why? Generally, what is the least invasive
>> approach to relocate services?
>>
>
> An alternative would be, since these symlinks are trusted and
> permanent, to label them as their parent directory (e.g. var_lib_t
> (use the '-l' file type specifier)) and allow the applications to read
> these lnk types.
> This also prevents e.g. mysqld_t to alter the symlink /var/lib/mysqld
> (since it probably has write permission to mysql_db_t:lnk_file but not
> var_lib_t:lnk_file).

I agree with this, also for compatibility with systemds' StateDirectory=3D
in conjunction with DynamicUsers=3D.

I you would for example have a mysqld service with StateDirectory=3Dmysqld
and DynamicUser=3Dyes then systemd would maintain a symlink
/var/lib/mysqld that points to /var/lib/private/mysqld

Even if you do not use that functionality it should still be compatible
with /data/lib /var/lib equivalency.

I do this consistently in my personal policy. ie instead of using
"/var/lib/mysqld(/.*)? i use /var/lib/mysqld -d and /var/lib/mysqld/.*
so that the symlink context stay's generic

Regardless, this is a policy design issue that you should probably take
to your distribution maintainer.

--=20
gpg --locate-keys dominick.grift@defensec.nl
Key fingerprint =3D FCD2 3660 5D6B 9D27 7FC6  E0FF DA7E 521F 10F6 4098
https://sks-keyservers.net/pks/lookup?op=3Dget&search=3D0xDA7E521F10F64098
Dominick Grift
