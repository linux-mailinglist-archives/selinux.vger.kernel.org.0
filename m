Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2538B1A6990
	for <lists+selinux@lfdr.de>; Mon, 13 Apr 2020 18:14:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731362AbgDMQOr (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Mon, 13 Apr 2020 12:14:47 -0400
Received: from mx1.polytechnique.org ([129.104.30.34]:40956 "EHLO
        mx1.polytechnique.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731324AbgDMQOq (ORCPT
        <rfc822;selinux@vger.kernel.org>); Mon, 13 Apr 2020 12:14:46 -0400
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by ssl.polytechnique.org (Postfix) with ESMTPSA id CBFFD561250
        for <selinux@vger.kernel.org>; Mon, 13 Apr 2020 18:14:42 +0200 (CEST)
Received: by mail-oi1-f175.google.com with SMTP id q204so7771590oia.13
        for <selinux@vger.kernel.org>; Mon, 13 Apr 2020 09:14:42 -0700 (PDT)
X-Gm-Message-State: AGi0PuaHR3eF5r3PDmet959eVE6MraZjbKemZsOkF1P1wMQ7q7HOmnCi
        sU1BtDajPoQ6aPFH2HAT8dwktE2GPPru3gG2zRE=
X-Google-Smtp-Source: APiQypIG+II+Y5qP5KhXCjqQszUo16bTGCAWi41DyMluopkvrSkgC6to/Zal9xfPeo09e1YmjgcPrTT296UI/Ar04Qw=
X-Received: by 2002:aca:d68a:: with SMTP id n132mr12612024oig.40.1586794481751;
 Mon, 13 Apr 2020 09:14:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200412081001.23246-1-nicolas.iooss@m4x.org> <CAFftDdpmF6H21DmDLaYwJW9QQx3hBq7i14SEsKeA=ktPE0brKA@mail.gmail.com>
In-Reply-To: <CAFftDdpmF6H21DmDLaYwJW9QQx3hBq7i14SEsKeA=ktPE0brKA@mail.gmail.com>
From:   Nicolas Iooss <nicolas.iooss@m4x.org>
Date:   Mon, 13 Apr 2020 18:14:30 +0200
X-Gmail-Original-Message-ID: <CAJfZ7==YbLMj4mKtD9KRA5YE=ySBMKZ9V45OfD1Uod5rPhzhRw@mail.gmail.com>
Message-ID: <CAJfZ7==YbLMj4mKtD9KRA5YE=ySBMKZ9V45OfD1Uod5rPhzhRw@mail.gmail.com>
Subject: Re: [PATCH 1/3] libselinux: add missing glue code to grab errno in
 Python bindings
To:     William Roberts <bill.c.roberts@gmail.com>
Cc:     SElinux list <selinux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-AV-Checked: ClamAV using ClamSMTP at svoboda.polytechnique.org (Mon Apr 13 18:14:43 2020 +0200 (CEST))
X-Spam-Flag: No, tests=bogofilter, spamicity=0.001085, queueID=4CFB4561251
X-Org-Mail: nicolas.iooss.2010@polytechnique.org
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Mon, Apr 13, 2020 at 4:18 PM William Roberts
<bill.c.roberts@gmail.com> wrote:
>
> On Sun, Apr 12, 2020 at 3:12 AM Nicolas Iooss <nicolas.iooss@m4x.org> wrote:
> >
> > The Python bindings for libselinux expose functions such as
> > avc_has_perm(), get_ordered_context_list(), etc. When these functions
> > encounter an error, they set errno accordingly and return a negative
> > value. In order to get the value of errno from Python code, it needs to
> > be "forwarded" in a way. This is achieved by glue code in
> > selinuxswig_python_exception.i, which implement raising an OSError
> > exception from the value of errno.
> >
> > selinuxswig_python_exception.i was only generating glue code from
> > functions declared in selinux.h and not in other headers. Add other
> > headers.
> >
> > selinuxswig_python_exception.i is generated by "bash exception.sh". Mark
> > the fact that exception.sh is a Bash script by adding a shebang. This
> > makes "shellcheck" not warn about the Bash array which is used to list
> > header files.
> >
> > Signed-off-by: Nicolas Iooss <nicolas.iooss@m4x.org>
> > ---
> >  libselinux/src/exception.sh                   |  18 +-
> >  libselinux/src/selinuxswig_python_exception.i | 396 ++++++++++++++++++
> >  2 files changed, 412 insertions(+), 2 deletions(-)
> >
> > diff --git a/libselinux/src/exception.sh b/libselinux/src/exception.sh
> > index 33ceef804af5..644c7a05ec54 100755
> > --- a/libselinux/src/exception.sh
> > +++ b/libselinux/src/exception.sh
> > @@ -1,3 +1,5 @@
> > +#!/bin/bash
> > +
> >  function except() {
> >  case $1 in
> >      selinux_file_context_cmp) # ignore
> > @@ -15,10 +17,22 @@ echo "
> >  ;;
> >  esac
> >  }
> > -if ! ${CC:-gcc} -x c -c -I../include -o temp.o - -aux-info temp.aux < ../include/selinux/selinux.h
> > +
> > +# Make sure that selinux.h is included first in order not to depend on the order
> > +# in which "#include <selinux/selinux.h>" appears in other files.
> > +FILE_LIST=(
> > +    ../include/selinux/selinux.h
> > +    ../include/selinux/avc.h
> > +    ../include/selinux/context.h
> > +    ../include/selinux/get_context_list.h
> > +    ../include/selinux/get_default_type.h
> > +    ../include/selinux/label.h
> > +    ../include/selinux/restorecon.h
> > +)
> > +if ! cat "${FILE_LIST[@]}" | ${CC:-gcc} -x c -c -I../include -o temp.o - -aux-info temp.aux
> >  then
> >      # clang does not support -aux-info so fall back to gcc
> > -    gcc -x c -c -I../include -o temp.o - -aux-info temp.aux < ../include/selinux/selinux.h
> > +    cat "${FILE_LIST[@]}" | gcc -x c -c -I../include -o temp.o - -aux-info temp.aux
> >  fi
> >  for i in `awk '/<stdin>.*extern int/ { print $6 }' temp.aux`; do except $i ; done
> >  rm -f -- temp.aux temp.o
> > diff --git a/libselinux/src/selinuxswig_python_exception.i b/libselinux/src/selinuxswig_python_exception.i
> > index cf6582595ee7..9f1f86a5564d 100644
> > --- a/libselinux/src/selinuxswig_python_exception.i
> > +++ b/libselinux/src/selinuxswig_python_exception.i
> > @@ -952,3 +952,399 @@
> >    }
> >  }
> >
> > +
> > +%exception avc_sid_to_context {
> > +  $action
> > +  if (result < 0) {
> > +     PyErr_SetFromErrno(PyExc_OSError);
> > +     SWIG_fail;
> > +  }
> > +}
> > +
> > +
> > +%exception avc_sid_to_context_raw {
> > +  $action
> > +  if (result < 0) {
> > +     PyErr_SetFromErrno(PyExc_OSError);
> > +     SWIG_fail;
> > +  }
> > +}
[...]
>
> A few comments:
> - overall looks fine, builds and works as expected.
> - Why the double newline space on the exception swig file? The other
> .i files seem to do a single newline?
>   is their something I am missing with syntax?
> - I have the following whitespace warning:
> Applying: libselinux: add missing glue code to grab errno in Python bindings
> .git/rebase-apply/patch:444: new blank line at EOF.
> +
> warning: 1 line adds whitespace errors.

The last two points are due to the way the file is generated, by exception.sh:

echo "
%exception $1 {
  \$action
  if (result < 0) {
     PyErr_SetFromErrno(PyExc_OSError);
     SWIG_fail;
  }
}
"
... this introduces blank lines both before and after each exception
blocks. We could remove the one after the block by using }" in the
shell script. I will submit a patch that does this once this patch is
merged, as this makes the file cleaner.

Thanks,
Nicolas

