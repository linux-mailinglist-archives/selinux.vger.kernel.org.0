Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC4FE31FBD9
	for <lists+selinux@lfdr.de>; Fri, 19 Feb 2021 16:19:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229707AbhBSPTU (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Fri, 19 Feb 2021 10:19:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46522 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229683AbhBSPTS (ORCPT
        <rfc822;selinux@vger.kernel.org>); Fri, 19 Feb 2021 10:19:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1613747871;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=tuQvwnxL4vdtfDXlo7IuRGd1ONPxxApoxfPzCwd/F+w=;
        b=T1Gj9BwFROpP6BHN8+LLoOYhbRWo2qUCVzJq9OGN+fpqkXXCTd+sVLPTu6wUIeb+p0a5sx
        1uPRFnbybnvLWsIPJmUnqy8/HdRxJkZHn1hD4WFjjBfFTNdy5VeC4Gd3EFEov/1gR0TpGD
        J9Zdg/5GH/ZajA1ilPLnEh8hMrwKDF8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-5-C1C6PzIkMgqBrt0UmP1LHg-1; Fri, 19 Feb 2021 10:17:46 -0500
X-MC-Unique: C1C6PzIkMgqBrt0UmP1LHg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D54AB6EE23;
        Fri, 19 Feb 2021 15:17:45 +0000 (UTC)
Received: from localhost (unknown [10.40.194.27])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 712BD5D9C6;
        Fri, 19 Feb 2021 15:17:44 +0000 (UTC)
From:   Petr Lautrbach <plautrba@redhat.com>
To:     Nicolas Iooss <nicolas.iooss@m4x.org>, selinux@vger.kernel.org
Subject: Re: [PATCH] libselinux: rename gettid() to something which never
 conflicts with the libc
In-Reply-To: <87pn0xfwfy.fsf@redhat.com>
References: <20210216211328.3609-1-nicolas.iooss@m4x.org>
 <87pn0xfwfy.fsf@redhat.com>
Date:   Fri, 19 Feb 2021 16:17:43 +0100
Message-ID: <87ft1sozmw.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Petr Lautrbach <plautrba@redhat.com> writes:

> Nicolas Iooss <nicolas.iooss@m4x.org> writes:
>
>> Musl recently added a wrapper for gettid() syscall. There is no way to
>> detect this new version in a reliable way, so rename our gettid()
>> wrapper to a non-conflicting name.
>>
>> Introduce a new function which, when using a libc known to provide a
>> wrapper for gettid(), calls it, and which, otherwise, performs the
>> syscall directly.
>>
>> Anyway this function is only used on systems where /proc/thread-self
>> does not exist, which are therefore running Linux<3.17.
>>
>> Fixes: https://github.com/SELinuxProject/selinux/issues/282
>> Signed-off-by: Nicolas Iooss <nicolas.iooss@m4x.org>
>
> Tested on Fedora with musl-1.2.22 scratch build
> https://koji.fedoraproject.org/koji/taskinfo?taskID=3D62214131 :
>
> Before
> ^&^ musl-gcc -D_GNU_SOURCE -I../include procattr.c -c
> procattr.c:38:14: error: static declaration of =E2=80=98gettid=E2=80=99 f=
ollows non-static declaration
>    38 | static pid_t gettid(void)
>       |              ^~~~~~
> In file included from procattr.c:2:
> /usr/x86_64-linux-musl/include/unistd.h:194:7: note: previous declaration=
 of =E2=80=98gettid=E2=80=99 with type =E2=80=98pid_t(void)=E2=80=99 {aka =
=E2=80=98int(void)=E2=80=99}
>   194 | pid_t gettid(void);
>       |       ^~~~~~
>
>
> After
> ^&^ musl-gcc -D_GNU_SOURCE -I../include procattr.c -c
>
>
> Seems to work. Thanks!
>
> Acked-by: Petr Lautrbach <plautrba@redhat.com>
>

Merged.


>
>> diff --git a/libselinux/src/procattr.c b/libselinux/src/procattr.c
>> index 1aa67ac53f39..840570525f5f 100644
>> --- a/libselinux/src/procattr.c
>> +++ b/libselinux/src/procattr.c
>> @@ -25,21 +25,23 @@ static __thread char destructor_initialized;
>>  /* Bionic and glibc >=3D 2.30 declare gettid() system call wrapper in u=
nistd.h and
>>   * has a definition for it */
>>  #ifdef __BIONIC__
>> -  #define OVERRIDE_GETTID 0
>> +  #define HAVE_GETTID 1
>>  #elif !defined(__GLIBC_PREREQ)
>> -  #define OVERRIDE_GETTID 1
>> +  #define HAVE_GETTID 0
>>  #elif !__GLIBC_PREREQ(2,30)
>> -  #define OVERRIDE_GETTID 1
>> +  #define HAVE_GETTID 0
>>  #else
>> -  #define OVERRIDE_GETTID 0
>> +  #define HAVE_GETTID 1
>>  #endif
>>=20=20
>> -#if OVERRIDE_GETTID
>> -static pid_t gettid(void)
>> +static pid_t selinux_gettid(void)
>>  {
>> +#if HAVE_GETTID
>> +	return gettid();
>> +#else
>>  	return syscall(__NR_gettid);
>> -}
>>  #endif
>> +}
>>=20=20
>>  static void procattr_thread_destructor(void __attribute__((unused)) *un=
used)
>>  {
>> @@ -94,7 +96,7 @@ static int openattr(pid_t pid, const char *attr, int f=
lags)
>>  		if (fd >=3D 0 || errno !=3D ENOENT)
>>  			goto out;
>>  		free(path);
>> -		tid =3D gettid();
>> +		tid =3D selinux_gettid();
>>  		rc =3D asprintf(&path, "/proc/self/task/%d/attr/%s", tid, attr);
>>  	} else {
>>  		errno =3D EINVAL;
>> --=20
>> 2.30.0

