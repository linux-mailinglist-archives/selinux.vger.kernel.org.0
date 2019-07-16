Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 30D2F6AC4E
	for <lists+selinux@lfdr.de>; Tue, 16 Jul 2019 17:55:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728121AbfGPPzg (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Tue, 16 Jul 2019 11:55:36 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38122 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727796AbfGPPzg (ORCPT <rfc822;selinux@vger.kernel.org>);
        Tue, 16 Jul 2019 11:55:36 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 84E84307D848;
        Tue, 16 Jul 2019 15:55:35 +0000 (UTC)
Received: from localhost (ovpn-204-71.brq.redhat.com [10.40.204.71])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 4C7405D71B;
        Tue, 16 Jul 2019 15:55:34 +0000 (UTC)
References: <20190607153544.10046-1-plautrba@redhat.com> <CAJfZ7==POrXzRod8d-tJxgg3bDny+3hN=M_r1SLgc7QO6g1jwQ@mail.gmail.com>
User-agent: mu4e 1.2.0; emacs 26.2
From:   Petr Lautrbach <plautrba@redhat.com>
To:     selinux@vger.kernel.org
Cc:     Petr Lautrbach <plautrba@redhat.com>,
        Nicolas Iooss <nicolas.iooss@m4x.org>
Subject: Re: [RFC] libselinux: Use Python distutils to install SELinux python bindings
In-reply-to: <CAJfZ7==POrXzRod8d-tJxgg3bDny+3hN=M_r1SLgc7QO6g1jwQ@mail.gmail.com>
Date:   Tue, 16 Jul 2019 17:55:31 +0200
Message-ID: <pjd4l3mezyk.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]); Tue, 16 Jul 2019 15:55:35 +0000 (UTC)
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org


Nicolas Iooss <nicolas.iooss@m4x.org> writes:

> Hi,
>
> Thanks for your patch. Some comments below.
>
> On Fri, Jun 7, 2019 at 5:35 PM Petr Lautrbach <plautrba@redhat.com> wrote:
>>
>> Follow officially documented way how to build C extension modules using
>> distutils - https://docs.python.org/3.8/extending/building.html#building
>>
>> Fixes:
>>
>> - https://bugzilla.redhat.com/show_bug.cgi?id=1715589 - selinux python module
>> fails to load when it's built using SWIG-4.0:
>>
>> >>> import selinux
>> Traceback (most recent call last):
>>   File "<stdin>", line 1, in <module>
>>   File "/usr/lib64/python3.7/site-packages/selinux/__init__.py", line 13, in <module>
>>     from . import _selinux
>> ImportError: cannot import name '_selinux' from 'selinux' (/usr/lib64/python3.7/site-packages/selinux/__init__.py)
>> >>>
>>
>> SWIG-4.0 changed (again?) its behavior so that it uses: from . import _selinux
>> which looks for _selinux module in the same directory as where __init__.py is -
>> $(PYLIBDIR)/site-packages/selinux. But _selinux module is installed into
>> $(PYLIBDIR)/site-packages/ since a9604c30a5e2f ("libselinux: Change the location
>> of _selinux.so").
>>
>> On the other hand, the module can't be loaded when it's built using older SWIG.
>> I'd use a symlink from $(PYLIBDIR)/site-packages/selinux to
>> $(PYLIBDIR)/site-packages/ in order to fix that
>
> I agree. For information, Debian sid still uses SWIG 3.0 (cf.
> https://packages.debian.org/sid/swig), and this patch indeed breaks
> things there ("make install-pywrap" succeeds but "import selinux" in
> python fails to find module _selinux). Adding the symlink for _selinux
> native module can be done with:
>
> --- a/libselinux/src/Makefile
> +++ b/libselinux/src/Makefile
> @@ -175,6 +175,7 @@ install: all
>  install-pywrap: pywrap
>         $(PYTHON) setup.py install --prefix=$(PREFIX) `test -n
> "$(DESTDIR)" && echo --root $(DESTDIR)`
>         install -m 644 selinux.py $(DESTDIR)$(PYTHONLIBDIR)/selinux/__init__.py
> +       ln -sf selinux/_selinux$(PYCEXT)
> $(DESTDIR)$(PYTHONLIBDIR)/_selinux$(PYCEXT)
>
>  install-rubywrap: rubywrap
>         test -d $(DESTDIR)$(RUBYINSTALL) || install -m 755 -d
> $(DESTDIR)$(RUBYINSTALL)
>
>>
>> - https://bugzilla.redhat.com/show_bug.cgi?id=1715756 - audit2why python module
>> fails to build with Python 3.8
>>
>> - https://bugzilla.redhat.com/show_bug.cgi?id=1709576 - selinux python module
>> doesn't provide any Python metadata
>>
>> Signed-off-by: Petr Lautrbach <plautrba@redhat.com>
>> ---
>>  libselinux/src/.gitignore |  2 +-
>>  libselinux/src/Makefile   | 37 ++++++++-----------------------------
>>  libselinux/src/setup.py   | 24 ++++++++++++++++++++++++
>>  3 files changed, 33 insertions(+), 30 deletions(-)
>>  create mode 100644 libselinux/src/setup.py
>>
>> diff --git a/libselinux/src/.gitignore b/libselinux/src/.gitignore
>> index 4dcc3b3b..428afe5a 100644
>> --- a/libselinux/src/.gitignore
>> +++ b/libselinux/src/.gitignore
>> @@ -1,4 +1,4 @@
>>  selinux.py
>> -selinuxswig_wrap.c
>> +selinuxswig_python_wrap.c
>>  selinuxswig_python_exception.i
>>  selinuxswig_ruby_wrap.c
>> diff --git a/libselinux/src/Makefile b/libselinux/src/Makefile
>> index e9ed0383..826c830c 100644
>> --- a/libselinux/src/Makefile
>> +++ b/libselinux/src/Makefile
>> @@ -36,7 +36,7 @@ TARGET=libselinux.so
>>  LIBPC=libselinux.pc
>>  SWIGIF= selinuxswig_python.i selinuxswig_python_exception.i
>>  SWIGRUBYIF= selinuxswig_ruby.i
>> -SWIGCOUT= selinuxswig_wrap.c
>> +SWIGCOUT= selinuxswig_python_wrap.c
>>  SWIGPYOUT= selinux.py
>>  SWIGRUBYCOUT= selinuxswig_ruby_wrap.c
>>  SWIGLOBJ:= $(patsubst %.c,$(PYPREFIX)%.lo,$(SWIGCOUT))
>> @@ -55,7 +55,7 @@ ifeq ($(LIBSEPOLA),)
>>          LDLIBS_LIBSEPOLA := -l:libsepol.a
>>  endif
>>
>> -GENERATED=$(SWIGCOUT) $(SWIGRUBYCOUT) selinuxswig_python_exception.i
>> +GENERATED=$(SWIGCOUT) $(SWIGRUBYCOUT) $(SWIGCOUT) selinuxswig_python_exception.i
>>  SRCS= $(filter-out $(GENERATED) audit2why.c, $(sort $(wildcard *.c)))
>>
>>  MAX_STACK_SIZE=32768
>> @@ -125,25 +125,18 @@ DISABLE_FLAGS+= -DNO_ANDROID_BACKEND
>>  SRCS:= $(filter-out label_backends_android.c, $(SRCS))
>>  endif
>>
>> -SWIG = swig -Wall -python -o $(SWIGCOUT) -outdir ./ $(DISABLE_FLAGS)
>> -
>>  SWIGRUBY = swig -Wall -ruby -o $(SWIGRUBYCOUT) -outdir ./ $(DISABLE_FLAGS)
>>
>>  all: $(LIBA) $(LIBSO) $(LIBPC)
>>
>> -pywrap: all $(SWIGFILES) $(AUDIT2WHYSO)
>> +pywrap: all selinuxswig_python_exception.i
>> +       CFLAGS="$(SWIG_CFLAGS)" $(PYTHON) setup.py build_ext -I $(DESTDIR)$(INCLUDEDIR) -L $(DESTDIR)$(LIBDIR)
>>
>>  rubywrap: all $(SWIGRUBYSO)
>>
>> -$(SWIGLOBJ): $(SWIGCOUT)
>> -       $(CC) $(CFLAGS) $(SWIG_CFLAGS) $(PYINC) -fPIC -DSHARED -c -o $@ $<
>> -
>>  $(SWIGRUBYLOBJ): $(SWIGRUBYCOUT)
>>         $(CC) $(CFLAGS) $(SWIG_CFLAGS) $(RUBYINC) -fPIC -DSHARED -c -o $@ $<
>>
>> -$(SWIGSO): $(SWIGLOBJ)
>> -       $(CC) $(CFLAGS) $(LDFLAGS) -L. -shared -o $@ $< -lselinux $(PYLIBS)
>> -
>>  $(SWIGRUBYSO): $(SWIGRUBYLOBJ)
>>         $(CC) $(CFLAGS) $(LDFLAGS) -L. -shared -o $@ $^ -lselinux $(RUBYLIBS)
>>
>> @@ -161,29 +154,15 @@ $(LIBPC): $(LIBPC).in ../VERSION
>>  selinuxswig_python_exception.i: ../include/selinux/selinux.h
>>         bash -e exception.sh > $@ || (rm -f $@ ; false)
>>
>> -$(AUDIT2WHYLOBJ): audit2why.c
>> -       $(CC) $(filter-out -Werror, $(CFLAGS)) $(PYINC) -fPIC -DSHARED -c -o $@ $<
>> -
>> -$(AUDIT2WHYSO): $(AUDIT2WHYLOBJ) $(LIBSEPOLA)
>> -       $(CC) $(CFLAGS) $(LDFLAGS) -L. -shared -o $@ $^ -lselinux $(LDLIBS_LIBSEPOLA) $(PYLIBS) -Wl,-soname,audit2why.so,--version-script=audit2why.map,-z,defs
>> -
>>  %.o:  %.c policy.h
>>         $(CC) $(CFLAGS) $(TLSFLAGS) -c -o $@ $<
>>
>>  %.lo:  %.c policy.h
>>         $(CC) $(CFLAGS) -fPIC -DSHARED -c -o $@ $<
>>
>> -$(SWIGCOUT): $(SWIGIF)
>> -       $(SWIG) $<
>> -
>> -$(SWIGPYOUT): $(SWIGCOUT)
>> -
>>  $(SWIGRUBYCOUT): $(SWIGRUBYIF)
>>         $(SWIGRUBY) $<
>>
>> -swigify: $(SWIGIF)
>> -       $(SWIG) $<
>> -
>>  install: all
>>         test -d $(DESTDIR)$(LIBDIR) || install -m 755 -d $(DESTDIR)$(LIBDIR)
>>         install -m 644 $(LIBA) $(DESTDIR)$(LIBDIR)
>> @@ -194,10 +173,8 @@ install: all
>>         ln -sf --relative $(DESTDIR)$(SHLIBDIR)/$(LIBSO) $(DESTDIR)$(LIBDIR)/$(TARGET)
>>
>>  install-pywrap: pywrap
>> -       test -d $(DESTDIR)$(PYTHONLIBDIR)/selinux || install -m 755 -d $(DESTDIR)$(PYTHONLIBDIR)/selinux
>> -       install -m 755 $(SWIGSO) $(DESTDIR)$(PYTHONLIBDIR)/_selinux$(PYCEXT)
>> -       install -m 755 $(AUDIT2WHYSO) $(DESTDIR)$(PYTHONLIBDIR)/selinux/audit2why$(PYCEXT)
>> -       install -m 644 $(SWIGPYOUT) $(DESTDIR)$(PYTHONLIBDIR)/selinux/__init__.py
>> +       $(PYTHON) setup.py install --prefix=$(PREFIX) `test -n "$(DESTDIR)" && echo --root $(DESTDIR)`
>> +       install -m 644 selinux.py $(DESTDIR)$(PYTHONLIBDIR)/selinux/__init__.py
>>
>>  install-rubywrap: rubywrap
>>         test -d $(DESTDIR)$(RUBYINSTALL) || install -m 755 -d $(DESTDIR)$(RUBYINSTALL)
>> @@ -208,6 +185,8 @@ relabel:
>>
>>  clean-pywrap:
>>         -rm -f $(SWIGLOBJ) $(SWIGSO) $(AUDIT2WHYLOBJ) $(AUDIT2WHYSO)
>> +       $(PYTHON) setup.py clean
>> +       -rm -rf build *~ \#* *pyc .#*
>>
>>  clean-rubywrap:
>>         -rm -f $(SWIGRUBYLOBJ) $(SWIGRUBYSO)
>> diff --git a/libselinux/src/setup.py b/libselinux/src/setup.py
>> new file mode 100644
>> index 00000000..b12e7869
>> --- /dev/null
>> +++ b/libselinux/src/setup.py
>> @@ -0,0 +1,24 @@
>> +#!/usr/bin/python3
>> +
>> +from distutils.core import Extension, setup
>> +
>> +setup(
>> +    name="selinux",
>> +    version="2.9",
>> +    description="SELinux python 3 bindings",
>> +    author="SELinux Project",
>> +    author_email="selinux@vger.kernel.org",
>> +    ext_modules=[
>> +        Extension('selinux._selinux',
>> +                  sources=['selinuxswig_python.i'],
>> +                  include_dirs=['../include'],
>> +                  library_dirs=['.'],
>> +                  libraries=['selinux']),
>> +        Extension('selinux.audit2why',
>> +                  sources=['audit2why.c'],
>> +                  include_dirs=['../include'],
>> +                  library_dirs=['.'],
>> +                  libraries=['selinux'],
>> +                  extra_link_args=['-l:libsepol.a'])
>> +    ],
>> +)
>> --
>> 2.22.0.rc3
>
> When building audit2why extension, the version script "audit2why.map"
> is no longer used. This might cause libsepol's symbols to "leak" to
> the global symbol namespace used by the linker when audit2why
> extension gets loaded (I have not tested if this really happens and I
> may have missed some details).
> Could you use extra_link_args=['-l:libsepol.a',
> '-Wl,--version-script=audit2why.map'] and test if this works?
>
> With the symlink and the version script, I managed to build the
> extension on Arch Linux and Debian 9 and performed some minimal tests.
>

Thanks for comments.

I've applied all your suggestions and add some more. Everything is in my
devel branch on github now -
https://github.com/bachradsusi/SELinuxProject-selinux/commits/swig-use-python-distutils

I'm waiting for Travis tests, then I'll run another tests directly on
Fedora packages and when everything passes I'll resend this as a regular
patch(es).

Petr
