Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C59F5309C01
	for <lists+selinux@lfdr.de>; Sun, 31 Jan 2021 13:37:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230526AbhAaKgQ (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Sun, 31 Jan 2021 05:36:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:23817 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230484AbhAaKKu (ORCPT
        <rfc822;selinux@vger.kernel.org>); Sun, 31 Jan 2021 05:10:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1612087763;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=DewXL8P6Y3gTK9v/c4CgbrbHAUpuTFSjz/5wrRZkpP0=;
        b=PbdQ3Utgkz3DY/oH5r0CQLDLFIJIcWM9qOVtUPUpPAJEzz/WH1fwfBIbDx8UHQVByySIuh
        koZGI8DenDwIV9ME+PfwGbvxleH+zgUv4uyWVi7HkojnoC37iNaNl8JfNZj2d1fXQCqahp
        tGyfCyq5tST3Ompu2lYZ6HpmCkoWNzA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-458-txhuJIMMO0KKIoOHMJGLeg-1; Sun, 31 Jan 2021 05:09:20 -0500
X-MC-Unique: txhuJIMMO0KKIoOHMJGLeg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 824BA107ACE4;
        Sun, 31 Jan 2021 10:09:19 +0000 (UTC)
Received: from localhost (unknown [10.40.192.93])
        by smtp.corp.redhat.com (Postfix) with ESMTP id E60D37086E;
        Sun, 31 Jan 2021 10:09:18 +0000 (UTC)
From:   Petr Lautrbach <plautrba@redhat.com>
To:     SElinux list <selinux@vger.kernel.org>
Cc:     Nicolas Iooss <nicolas.iooss@m4x.org>
Subject: Re: [PATCH] scripts/release: Release also tarball with everything
In-Reply-To: <CAJfZ7=mJ+=tPA8aZzmxhgRqR-incXW8qztibPPQ=RSkc2pS_kQ@mail.gmail.com>
References: <20210129200034.205263-1-plautrba@redhat.com>
 <CAJfZ7=mJ+=tPA8aZzmxhgRqR-incXW8qztibPPQ=RSkc2pS_kQ@mail.gmail.com>
Date:   Sun, 31 Jan 2021 11:09:17 +0100
Message-ID: <87bld5o1te.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Nicolas Iooss <nicolas.iooss@m4x.org> writes:

> On Fri, Jan 29, 2021 at 9:06 PM Petr Lautrbach <plautrba@redhat.com> wrote:
>>
>> Create and publish with sha256sum also tarball called
>> selinux-$VERS.tar.gz with the whole tree. It could be useful for unit
>> testing directly from tarball or backporting patches which affects more
>> subdirectories. Github already provides similar archive called "Source
>> code (tar.gz)" via release assets, but there's no guarantee this file
>> would not change.
>>
>> Signed-off-by: Petr Lautrbach <plautrba@redhat.com>
>> ---
>>  scripts/release | 23 ++++++++++++++++++++---
>>  1 file changed, 20 insertions(+), 3 deletions(-)
>>
>> diff --git a/scripts/release b/scripts/release
>> index 895a0e1ca1a1..40a9c06f56b9 100755
>> --- a/scripts/release
>> +++ b/scripts/release
>> @@ -35,6 +35,8 @@ for i in $DIRS_NEED_PREFIX; do
>>         cd ..
>>  done
>>
>> +git archive -o $DEST/selinux-$VERS.tar.gz --prefix=selinux-$VERS/ $VERS
>> +
>>  cd $DEST
>>
>>  git add .
>> @@ -54,13 +56,28 @@ echo ""
>>  echo "[short log](https://github.com/SELinuxProject/selinux/releases/download/$RELEASE_TAG/shortlog-$RELEASE_TAG.txt)"
>>  echo ""
>>
>> -for i in *.tar.gz; do
>> +for i in $DIRS; do
>> +       tarball=$i-$VERS.tar.gz
>> +       echo -n "[$tarball](https://github.com/SELinuxProject/selinux/releases/download/$RELEASE_TAG/$tarball) "
>> +       sha256sum $tarball | cut -d " " -f 1
>> +       echo ""
>> +done
>>
>> -       echo -n "[$i](https://github.com/SELinuxProject/selinux/releases/download/$RELEASE_TAG/$i) "
>> -       sha256sum $i | cut -d " " -f 1
>> +for i in $DIRS_NEED_PREFIX; do
>> +       tarball=selinux-$i-$VERS.tar.gz
>> +       echo -n "[$tarball](https://github.com/SELinuxProject/selinux/releases/download/$RELEASE_TAG/$tarball) "
>> +       sha256sum $tarball | cut -d " " -f 1
>>         echo ""
>>  done
>>
>> +echo "### Everything"
>> +
>> +echo ""
>> +
>> +echo -n "[selinux-$VERS.tar.gz](https://github.com/SELinuxProject/selinux/releases/download/$RELEASE_TAG/selinux-$VERS.tar.gz) "
>> +sha256sum selinux-$VERS.tar.gz | cut -d " " -f 1
>> +echo ""
>
> Hello, there are at least two issues here:
> * The section is named "Everything" but on
> https://github.com/SELinuxProject/selinux/wiki/Releases it is named
> "All in one". What is the proper name?


I used "All in one" in rc1 release but I didn't announce it properly and
it didn't feel good to me. So I sent this patch to make this official.
And I like "Everything" more than the original "All in one". I can
change it on the release page if the change is accepted or drop it
completely if it's denied. 


> * $VERS comes from a VERSION file in a subdirectory. It would be more
> consistent to either use $RELEASE_TAG (which is the content of the
> main VERSION file) or to use a single $VERS variable (and to verify
> that the */VERSION files all contain the same content, for example
> with "diff VERSION $i/VERSION"). Which option would be preferable?

For now I'd use $RELEASE_TAG for selinux-X.Y.tar.gz

and maybe something like:

-for i in $DIRS; do
-       tarball=$i-$VERS.tar.gz
+for i in $DIRS; do
+       tarball=`ls $i-*.tar.gz`


> Moreover I do not like using string variables without quotes (and
> shellcheck reports warnings for this), but this is a general issue of
> this script. I will send a patch to improve the release script.

Thanks!

>
> Cheers,
> Nicolas

