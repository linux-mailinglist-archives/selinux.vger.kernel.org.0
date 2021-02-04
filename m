Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E82F830D6E4
	for <lists+selinux@lfdr.de>; Wed,  3 Feb 2021 11:00:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232992AbhBCJ7p (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Wed, 3 Feb 2021 04:59:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28215 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233090AbhBCJ7k (ORCPT
        <rfc822;selinux@vger.kernel.org>); Wed, 3 Feb 2021 04:59:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1612346293;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=zpV7k4YDns/e67v5VCjKtF1bVuokiViOtAIJsYcMQtw=;
        b=cQVtWWSI/6zQg5Mt9Ed7Zriudfy623Q9kUNhrGjqnAEqk2XD5zP3PixcLYsHZndXUAJbzq
        UV0ix88V4iU7Pic4u8nGH+UgsT+K5lTc3s/j2LsuagJmiIuoMXEH7PDmzIB6YOgIqIk4R0
        cbxZ3K7gI27zi12ukLqAKTVkDMegNBg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-581-3JxBu_PgNU-Dv-ripnO3_Q-1; Wed, 03 Feb 2021 04:58:12 -0500
X-MC-Unique: 3JxBu_PgNU-Dv-ripnO3_Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 04DC094DCF;
        Wed,  3 Feb 2021 09:58:02 +0000 (UTC)
Received: from localhost (unknown [10.40.195.92])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 7FD361975E;
        Wed,  3 Feb 2021 09:58:01 +0000 (UTC)
From:   Petr Lautrbach <plautrba@redhat.com>
To:     SElinux list <selinux@vger.kernel.org>
Cc:     Nicolas Iooss <nicolas.iooss@m4x.org>
Subject: Re: [PATCH v2 1/1] scripts/release: make the script more robust,
 and release a source repository snapshot
In-Reply-To: <CAJfZ7==OM+VKJF7pTgnztWTTBmgCJTkkchXFdg265CgQ0LdQeA@mail.gmail.com>
References: <20210201221646.13190-1-nicolas.iooss@m4x.org>
 <87sg6dmr5f.fsf@redhat.com>
 <CAJfZ7==OM+VKJF7pTgnztWTTBmgCJTkkchXFdg265CgQ0LdQeA@mail.gmail.com>
Date:   Wed, 03 Feb 2021 10:58:00 +0100
Message-ID: <87pn1hmq1j.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Nicolas Iooss <nicolas.iooss@m4x.org> writes:

> On Wed, Feb 3, 2021 at 10:34 AM Petr Lautrbach <plautrba@redhat.com> wrote:
>>
>> Nicolas Iooss <nicolas.iooss@m4x.org> writes:
>>
>> > Following Petr Lautrbach's suggestion, release a snapshot of the source
>> > repository next to the individual archives which constitute a release.
>> >
>> > While at it, make scripts/release more robust:
>> >
>> > - Fix many warnings reported by shellcheck, by quoting strings.
>> > - Use bash arrays for DIRS and DIRS_NEED_PREFIX
>> > - Merge DIRS and DIRS_NEED_PREFIX into a single array, in order to
>> >   produce SHA256 digests that are directly in alphabetical order, for
>> >   https://github.com/SELinuxProject/selinux/wiki/Releases
>> > - Use "set -e" in order to fail as soon as a command fails
>> > - Change to the top-level directory at the start of the script, in order
>> >   to be able to run it from anywhere.
>> > - Use `cat $DIR/VERSION` and `git -C $DIR` instead of `cd $i ; cat VERSION`
>> >   in order to prevent unexpected issues from directory change.
>> >
>> > Finally, if version tags already exists, re-use them. This enables using
>> > this script to re-generate the release archive (and check that they
>> > really match the git repository). Currently, running scripts/release
>> > will produce the same archives as the ones published in the 3.2-rc1
>> > release (with the same SHA256 digests as the ones on the release page,
>> > https://github.com/SELinuxProject/selinux/wiki/Releases). This helps to
>> > ensure that the behaviour of the script is still fine.
>> >
>> > Suggested-by: Petr Lautrbach <plautrba@redhat.com>
>> > Signed-off-by: Nicolas Iooss <nicolas.iooss@m4x.org>
>> > ---
>> >  scripts/release | 95 +++++++++++++++++++++++++++++++------------------
>> >  1 file changed, 60 insertions(+), 35 deletions(-)
>> >
>> > diff --git a/scripts/release b/scripts/release
>> > index 895a0e1ca1a1..21e30ff54b80 100755
>> > --- a/scripts/release
>> > +++ b/scripts/release
>> > @@ -1,43 +1,57 @@
>> >  #!/bin/bash
>> >
>> > -PWD=`pwd`
>> > -WIKIDIR=../selinux.wiki
>> > -
>> > -if [ \! -d $WIKIDIR ]; then
>> > -    git clone git@github.com:SELinuxProject/selinux.wiki.git $WIKIDIR
>> > -fi
>> > +# Fail when a command fails
>> > +set -e
>> >
>> > -RELEASE_TAG=`cat VERSION`
>> > -DEST=releases/$RELEASE_TAG
>> > -DIRS="libsepol libselinux libsemanage checkpolicy secilc policycoreutils mcstrans restorecond semodule-utils"
>> > -DIRS_NEED_PREFIX="dbus gui python sandbox"
>> > +# Ensure the script is running from the top level directory
>> > +cd "$(dirname -- "$0")/.."
>> >
>> > -git tag -a $RELEASE_TAG -m "Release $RELEASE_TAG"
>> > +WIKIDIR=../selinux.wiki
>> >
>> > -rm -rf $DEST
>> > -mkdir -p $DEST
>> > +if ! [ -d "$WIKIDIR" ]; then
>> > +     git clone git@github.com:SELinuxProject/selinux.wiki.git "$WIKIDIR"
>> > +fi
>> >
>> > -for i in $DIRS; do
>> > -     cd $i
>> > -     VERS=`cat VERSION`
>> > -     ARCHIVE=$i-$VERS.tar.gz
>> > -     git tag $i-$VERS > /dev/null 2>&1
>> > -     git archive -o ../$DEST/$ARCHIVE --prefix=$i-$VERS/ $i-$VERS
>> > -     cd ..
>> > -done
>> > +RELEASE_TAG="$(cat VERSION)"
>> > +DEST="releases/$RELEASE_TAG"
>> > +DIRS=(
>> > +     checkpolicy
>> > +     libselinux
>> > +     libsemanage
>> > +     libsepol
>> > +     mcstrans
>> > +     policycoreutils
>> > +     restorecond
>> > +     secilc
>> > +     selinux-dbus
>> > +     selinux-gui
>> > +     selinux-python
>> > +     selinux-sandbox
>> > +     semodule-utils
>> > +)
>> > +
>> > +if git rev-parse "$RELEASE_TAG" > /dev/null ; then
>> > +     echo "Warning: tag $RELEASE_TAG already exists"
>> > +else
>> > +     git tag -a "$RELEASE_TAG" -m "Release $RELEASE_TAG"
>> > +fi
>>
>> fatal: ambiguous argument '3.2-rc2': unknown revision or path not in the working tree.
>> Use '--' to separate paths from revisions, like this:
>> 'git <command> [<revision>...] -- [<file>...]'
>>
>>
>> > -for i in $DIRS_NEED_PREFIX; do
>> > -     cd $i
>> > -     VERS=`cat VERSION`
>> > -     ARCHIVE=selinux-$i-$VERS.tar.gz
>> > -     git tag selinux-$i-$VERS > /dev/null 2>&1
>> > -     git archive -o ../$DEST/$ARCHIVE --prefix=selinux-$i-$VERS/ selinux-$i-$VERS
>> > -     cd ..
>> > +rm -rf "$DEST"
>> > +mkdir -p "$DEST"
>> > +
>> > +for COMPONENT in "${DIRS[@]}"; do
>> > +     DIR="${COMPONENT#selinux-}"
>> > +     VERS="$(cat "$DIR/VERSION")"
>> > +     TAG="$COMPONENT-$VERS"
>> > +     if git rev-parse "$TAG" > /dev/null ; then
>> > +             echo "Warning: tag $TAG already exists"
>> > +     else
>> > +             git tag "$TAG" > /dev/null
>> > +     fi
>>
>> fatal: ambiguous argument 'checkpolicy-3.2-rc2': unknown revision or path not in the working tree.
>> Use '--' to separate paths from revisions, like this:
>> 'git <command> [<revision>...] -- [<file>...]'
>>
>> The following change fixes both:
>>
>> --- a/scripts/release
>> +++ b/scripts/release
>> @@ -30,7 +30,7 @@ DIRS=(
>>         semodule-utils
>>  )
>>
>> -if git rev-parse "$RELEASE_TAG" > /dev/null ; then
>> +if git rev-parse "$RELEASE_TAG" &> /dev/null ; then
>>         echo "Warning: tag $RELEASE_TAG already exists"
>>  else
>>         git tag -a "$RELEASE_TAG" -m "Release $RELEASE_TAG"
>> @@ -43,7 +43,7 @@ for COMPONENT in "${DIRS[@]}"; do
>>         DIR="${COMPONENT#selinux-}"
>>         VERS="$(cat "$DIR/VERSION")"
>>         TAG="$COMPONENT-$VERS"
>> -       if git rev-parse "$TAG" > /dev/null ; then
>> +       if git rev-parse "$TAG" &> /dev/null ; then
>>                 echo "Warning: tag $TAG already exists"
>>         else
>>                 git tag "$TAG" > /dev/null
>
> Oops, indeed. The errors do not seem to be fatal, but yes, it is
> better to hide them, like you suggest. You can modify my patch with
> this change, or write a patch.
>
> Anyway, your suggestion looks good to me.


I'm just preparing 3.2-rc2 so I'm going to modify your patch, merge and
use it for the new release. 


>
> Thanks!
> Nicolas

