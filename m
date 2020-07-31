Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 20F31234BB7
	for <lists+selinux@lfdr.de>; Fri, 31 Jul 2020 21:44:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725826AbgGaTok (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Fri, 31 Jul 2020 15:44:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725767AbgGaTok (ORCPT
        <rfc822;selinux@vger.kernel.org>); Fri, 31 Jul 2020 15:44:40 -0400
Received: from agnus.defensec.nl (agnus.defensec.nl [IPv6:2001:985:d55d::711])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 06D7FC061574
        for <selinux@vger.kernel.org>; Fri, 31 Jul 2020 12:44:40 -0700 (PDT)
Received: from brutus (brutus.lan [IPv6:2001:985:d55d::438])
        by agnus.defensec.nl (Postfix) with ESMTPSA id D6A122A0CF5;
        Fri, 31 Jul 2020 21:44:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 agnus.defensec.nl D6A122A0CF5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=defensec.nl;
        s=default; t=1596224679;
        bh=qlBNBp/xNwu7500QbL7idtdYVAgw7AaVzJOoLtiBJ8Q=;
        h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
        b=sxFKb3f3VsXGpyrePZLzSClhYjSbiSWlgRTBaiElf9BwcGRWG03fh44c6fiKlDa1M
         JH/RFif/UnMPVZNGf6GjZ3fPkpsXVikHJQdN/NiN6dAs+BTwj612lvcEq/dDiJgwug
         zm4FIeAKar2vUGU1mI3w2segt2qApt4LL3b4Smks=
From:   Dominick Grift <dominick.grift@defensec.nl>
To:     Gionatan Danti <g.danti@assyoma.it>
Cc:     Christian =?utf-8?Q?G=C3=B6ttsche?= <cgzones@googlemail.com>,
        selinux@vger.kernel.org
Subject: Re: lnk_file read permission
References: <9c20af23bf7b70d6e01ca6772cc31f88@assyoma.it>
        <CAJ2a_Dcev_o+NyuwUqh2ANseRniZRMQJ4dhDtrF1BtCmFSLgpg@mail.gmail.com>
        <ypjld04bmxry.fsf@defensec.nl>
        <9f363af014b8670267af982f9d4a6362@assyoma.it>
        <bd08eef14271d6a6003bf6ba83ff1904@assyoma.it>
Date:   Fri, 31 Jul 2020 21:44:34 +0200
In-Reply-To: <bd08eef14271d6a6003bf6ba83ff1904@assyoma.it> (Gionatan Danti's
        message of "Fri, 31 Jul 2020 21:37:30 +0200")
Message-ID: <ypjl1rkrmpul.fsf@defensec.nl>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Gionatan Danti <g.danti@assyoma.it> writes:

> Il 2020-07-31 19:09 Gionatan Danti ha scritto:
>> I did not know that systemd would, with specific settings, create a
>> private mysql data dir.
>> I would try the var_lib_t approach more widely.
>> Thanks.
>
> Mmm, it seems labeling the link as var_lib_t is not always sufficient.
> Doing a mongodb test relocation from /var/lib/mongodb to /zzz/mongodb
> the service does not start, even if I can see the link having
> var_lib_t label:
>
> # ls -alZ /var/lib/
> ...
> lrwxrwxrwx. root    root    unconfined_u:object_r:var_lib_t:s0 mongodb
> -> /zzz/mongodb
>
> Indeed, I can see the following in /var/log/audit:
>
> type=AVC msg=audit(1596222151.576:253): avc:  denied  { read } for
> pid=4313 comm="mongod" name="mongodb" dev="dm-0" ino=33673444
> scontext=system_u:system_r:mongod_t:s0
> tcontext=unconfined_u:object_r:var_lib_t:s0 tclass=lnk_file
> permissive=0
>
> Relabeling the synlink with its "native" label via restorecon -RF
> produce the following:
>
> # ls -alZ /var/lib/
> ...
> lrwxrwxrwx. root    root    system_u:object_r:mongod_var_lib_t:s0
> mongodb -> /zzz/mongodb
>
> But the service again does not start, with the followin logs:
>
> type=AVC msg=audit(1596222240.363:257): avc:  denied  { read } for
> pid=4344 comm="mongod" name="mongodb" dev="dm-0" ino=33673444
> scontext=system_u:system_r:mongod_t:s0
> tcontext=system_u:object_r:mongod_var_lib_t:s0 tclass=lnk_file
> permissive=0
>
> What would be the best approach in this case? I know that one approach
> would be to use a bind mount, but I would like to avoid it because:
> a) it has bad filesystem discoverably (you had to search for bind
> mount explicitly, while a symlink is visible even with a simple ls)
> b) I need to setup a fcontext <<None>> for the actual dir which is
> bind-mounted (otherwise, a "restorecon -RF /zzz/" will cause issues,
> by relabeling any files with default_t)
>
> I am open to suggestions...
> Thanks.

Everyone who has business in /var/lib should probably be able to read
var_lib_t lnk_files.

You can use audit2allow to allow these entities to read symlinks of type var_lib_t

Again though, there is a larger picture here and I would argue that your
distribution maintainer should acknowledge that.

-- 
gpg --locate-keys dominick.grift@defensec.nl
Key fingerprint = FCD2 3660 5D6B 9D27 7FC6  E0FF DA7E 521F 10F6 4098
https://sks-keyservers.net/pks/lookup?op=get&search=0xDA7E521F10F64098
Dominick Grift
