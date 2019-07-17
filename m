Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 58BC36BB1F
	for <lists+selinux@lfdr.de>; Wed, 17 Jul 2019 13:10:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726326AbfGQLKU (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Wed, 17 Jul 2019 07:10:20 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43906 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726081AbfGQLKU (ORCPT <rfc822;selinux@vger.kernel.org>);
        Wed, 17 Jul 2019 07:10:20 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id C2C933082E23
        for <selinux@vger.kernel.org>; Wed, 17 Jul 2019 11:10:19 +0000 (UTC)
Received: from workstation.brq.redhat.com (unknown [10.43.12.182])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 21DEE5C232;
        Wed, 17 Jul 2019 11:10:18 +0000 (UTC)
From:   Petr Lautrbach <plautrba@redhat.com>
To:     selinux@vger.kernel.org
Cc:     Petr Lautrbach <plautrba@redhat.com>
Subject: [PATCH] libselinux: Use Python distutils to install SELinux python bindings
Date:   Wed, 17 Jul 2019 13:10:14 +0200
Message-Id: <20190717111014.25650-1-plautrba@redhat.com>
In-Reply-To: <pjd4l3mezyk.fsf@redhat.com>
References: <pjd4l3mezyk.fsf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]); Wed, 17 Jul 2019 11:10:19 +0000 (UTC)
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Follow officially documented way how to build C extension modules using
distutils - https://docs.python.org/3.8/extending/building.html#building

Fixes:

- selinux python module fails to load when it's built using SWIG-4.0:

>>> import selinux
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
  File "/usr/lib64/python3.7/site-packages/selinux/__init__.py", line 13, in <module>
    from . import _selinux
ImportError: cannot import name '_selinux' from 'selinux' (/usr/lib64/python3.7/site-packages/selinux/__init__.py)

SWIG-4.0 changed (again?) its behavior so that it uses: from . import _selinux
which looks for _selinux module in the same directory as where __init__.py is -
$(PYLIBDIR)/site-packages/selinux. But _selinux module is installed into
$(PYLIBDIR)/site-packages/ since a9604c30a5e2f ("libselinux: Change the location
of _selinux.so").

- audit2why python module fails to build with Python 3.8

cc -O2 -g -pipe -Wall -Werror=format-security -Wp,-D_FORTIFY_SOURCE=2 -Wp,-D_GLIBCXX_ASSERTIONS -fexceptions -fstack-protector-strong -grecord-gcc-switches -specs=/usr/lib/rpm/redhat/redhat-hardened-cc1 -specs=/usr/lib/rpm/redhat/redhat-annobin-cc1 -m64 -mtune=generic -fasynchronous-unwind-tables -fstack-clash-protection -fcf-protection -DOVERRIDE_GETTID=0 -I../include -D_GNU_SOURCE -DDISABLE_RPM -DNO_ANDROID_BACKEND -DUSE_PCRE2 -DPCRE2_CODE_UNIT_WIDTH=8  -Wl,-z,relro -Wl,--as-needed  -Wl,-z,now -specs=/usr/lib/rpm/redhat/redhat-hardened-ld -L. -shared -o python-3.8audit2why.so python-3.8audit2why.lo -lselinux -l:libsepol.a  -Wl,-soname,audit2why.so,--version-script=audit2why.map,-z,defs
/usr/bin/ld: python-3.8audit2why.lo: in function `finish':
/builddir/build/BUILD/libselinux-2.9/src/audit2why.c:166: undefined reference to `PyArg_ParseTuple'
/usr/bin/ld: python-3.8audit2why.lo: in function `_Py_INCREF':
/usr/include/python3.8/object.h:449: undefined reference to `_Py_NoneStruct'
/usr/bin/ld: /usr/include/python3.8/object.h:449: undefined reference to `_Py_NoneStruct'
/usr/bin/ld: python-3.8audit2why.lo: in function `check_booleans':
/builddir/build/BUILD/libselinux-2.9/src/audit2why.c:84: undefined reference to `PyExc_RuntimeError'
...

It's related to the following Python change
https://docs.python.org/dev/whatsnew/3.8.html#debug-build-uses-the-same-abi-as-release-build

Python distutils adds correct link options automatically.

- selinux python module doesn't provide any Python metadata

When selinux python module was built manually, it didn't provide any metadata.
distutils takes care about that so that selinux Python module is visible for
pip:

$ pip3 list | grep selinux
selinux              2.9

Signed-off-by: Petr Lautrbach <plautrba@redhat.com>
---
 libselinux/src/.gitignore |  2 +-
 libselinux/src/Makefile   | 36 ++++++++----------------------------
 libselinux/src/setup.py   | 24 ++++++++++++++++++++++++
 3 files changed, 33 insertions(+), 29 deletions(-)
 create mode 100644 libselinux/src/setup.py

diff --git a/libselinux/src/.gitignore b/libselinux/src/.gitignore
index 4dcc3b3b..428afe5a 100644
--- a/libselinux/src/.gitignore
+++ b/libselinux/src/.gitignore
@@ -1,4 +1,4 @@
 selinux.py
-selinuxswig_wrap.c
+selinuxswig_python_wrap.c
 selinuxswig_python_exception.i
 selinuxswig_ruby_wrap.c
diff --git a/libselinux/src/Makefile b/libselinux/src/Makefile
index e9ed0383..d074548b 100644
--- a/libselinux/src/Makefile
+++ b/libselinux/src/Makefile
@@ -36,7 +36,7 @@ TARGET=libselinux.so
 LIBPC=libselinux.pc
 SWIGIF= selinuxswig_python.i selinuxswig_python_exception.i
 SWIGRUBYIF= selinuxswig_ruby.i
-SWIGCOUT= selinuxswig_wrap.c
+SWIGCOUT= selinuxswig_python_wrap.c
 SWIGPYOUT= selinux.py
 SWIGRUBYCOUT= selinuxswig_ruby_wrap.c
 SWIGLOBJ:= $(patsubst %.c,$(PYPREFIX)%.lo,$(SWIGCOUT))
@@ -55,7 +55,7 @@ ifeq ($(LIBSEPOLA),)
         LDLIBS_LIBSEPOLA := -l:libsepol.a
 endif
 
-GENERATED=$(SWIGCOUT) $(SWIGRUBYCOUT) selinuxswig_python_exception.i
+GENERATED=$(SWIGCOUT) $(SWIGRUBYCOUT) $(SWIGCOUT) selinuxswig_python_exception.i
 SRCS= $(filter-out $(GENERATED) audit2why.c, $(sort $(wildcard *.c)))
 
 MAX_STACK_SIZE=32768
@@ -125,25 +125,18 @@ DISABLE_FLAGS+= -DNO_ANDROID_BACKEND
 SRCS:= $(filter-out label_backends_android.c, $(SRCS))
 endif
 
-SWIG = swig -Wall -python -o $(SWIGCOUT) -outdir ./ $(DISABLE_FLAGS)
-
 SWIGRUBY = swig -Wall -ruby -o $(SWIGRUBYCOUT) -outdir ./ $(DISABLE_FLAGS)
 
 all: $(LIBA) $(LIBSO) $(LIBPC)
 
-pywrap: all $(SWIGFILES) $(AUDIT2WHYSO)
+pywrap: all selinuxswig_python_exception.i
+	CFLAGS="$(CFLAGS) $(SWIG_CFLAGS)" $(PYTHON) setup.py build_ext -I $(DESTDIR)$(INCLUDEDIR) -L $(DESTDIR)$(LIBDIR)
 
 rubywrap: all $(SWIGRUBYSO)
 
-$(SWIGLOBJ): $(SWIGCOUT)
-	$(CC) $(CFLAGS) $(SWIG_CFLAGS) $(PYINC) -fPIC -DSHARED -c -o $@ $<
-
 $(SWIGRUBYLOBJ): $(SWIGRUBYCOUT)
 	$(CC) $(CFLAGS) $(SWIG_CFLAGS) $(RUBYINC) -fPIC -DSHARED -c -o $@ $<
 
-$(SWIGSO): $(SWIGLOBJ)
-	$(CC) $(CFLAGS) $(LDFLAGS) -L. -shared -o $@ $< -lselinux $(PYLIBS)
-
 $(SWIGRUBYSO): $(SWIGRUBYLOBJ)
 	$(CC) $(CFLAGS) $(LDFLAGS) -L. -shared -o $@ $^ -lselinux $(RUBYLIBS)
 
@@ -161,29 +154,15 @@ $(LIBPC): $(LIBPC).in ../VERSION
 selinuxswig_python_exception.i: ../include/selinux/selinux.h
 	bash -e exception.sh > $@ || (rm -f $@ ; false)
 
-$(AUDIT2WHYLOBJ): audit2why.c
-	$(CC) $(filter-out -Werror, $(CFLAGS)) $(PYINC) -fPIC -DSHARED -c -o $@ $<
-
-$(AUDIT2WHYSO): $(AUDIT2WHYLOBJ) $(LIBSEPOLA)
-	$(CC) $(CFLAGS) $(LDFLAGS) -L. -shared -o $@ $^ -lselinux $(LDLIBS_LIBSEPOLA) $(PYLIBS) -Wl,-soname,audit2why.so,--version-script=audit2why.map,-z,defs
-
 %.o:  %.c policy.h
 	$(CC) $(CFLAGS) $(TLSFLAGS) -c -o $@ $<
 
 %.lo:  %.c policy.h
 	$(CC) $(CFLAGS) -fPIC -DSHARED -c -o $@ $<
 
-$(SWIGCOUT): $(SWIGIF)
-	$(SWIG) $<
-
-$(SWIGPYOUT): $(SWIGCOUT)
-
 $(SWIGRUBYCOUT): $(SWIGRUBYIF)
 	$(SWIGRUBY) $<
 
-swigify: $(SWIGIF)
-	$(SWIG) $<
-
 install: all 
 	test -d $(DESTDIR)$(LIBDIR) || install -m 755 -d $(DESTDIR)$(LIBDIR)
 	install -m 644 $(LIBA) $(DESTDIR)$(LIBDIR)
@@ -194,10 +173,9 @@ install: all
 	ln -sf --relative $(DESTDIR)$(SHLIBDIR)/$(LIBSO) $(DESTDIR)$(LIBDIR)/$(TARGET)
 
 install-pywrap: pywrap
-	test -d $(DESTDIR)$(PYTHONLIBDIR)/selinux || install -m 755 -d $(DESTDIR)$(PYTHONLIBDIR)/selinux
-	install -m 755 $(SWIGSO) $(DESTDIR)$(PYTHONLIBDIR)/_selinux$(PYCEXT)
-	install -m 755 $(AUDIT2WHYSO) $(DESTDIR)$(PYTHONLIBDIR)/selinux/audit2why$(PYCEXT)
+	$(PYTHON) setup.py install --prefix=$(PREFIX) `test -n "$(DESTDIR)" && echo --root $(DESTDIR)`
 	install -m 644 $(SWIGPYOUT) $(DESTDIR)$(PYTHONLIBDIR)/selinux/__init__.py
+	ln -sf $(DESTDIR)$(PYTHONLIBDIR)/selinux/_selinux$(PYCEXT) $(DESTDIR)$(PYTHONLIBDIR)/_selinux$(PYCEXT)
 
 install-rubywrap: rubywrap
 	test -d $(DESTDIR)$(RUBYINSTALL) || install -m 755 -d $(DESTDIR)$(RUBYINSTALL) 
@@ -208,6 +186,8 @@ relabel:
 
 clean-pywrap:
 	-rm -f $(SWIGLOBJ) $(SWIGSO) $(AUDIT2WHYLOBJ) $(AUDIT2WHYSO)
+	$(PYTHON) setup.py clean
+	-rm -rf build *~ \#* *pyc .#*
 
 clean-rubywrap:
 	-rm -f $(SWIGRUBYLOBJ) $(SWIGRUBYSO)
diff --git a/libselinux/src/setup.py b/libselinux/src/setup.py
new file mode 100644
index 00000000..4dc03f55
--- /dev/null
+++ b/libselinux/src/setup.py
@@ -0,0 +1,24 @@
+#!/usr/bin/python3
+
+from distutils.core import Extension, setup
+
+setup(
+    name="selinux",
+    version="2.9",
+    description="SELinux python 3 bindings",
+    author="SELinux Project",
+    author_email="selinux@vger.kernel.org",
+    ext_modules=[
+        Extension('selinux._selinux',
+                  sources=['selinuxswig_python.i'],
+                  include_dirs=['../include'],
+                  library_dirs=['.'],
+                  libraries=['selinux']),
+        Extension('selinux.audit2why',
+                  sources=['audit2why.c'],
+                  include_dirs=['../include'],
+                  library_dirs=['.'],
+                  libraries=['selinux'],
+                  extra_link_args=['-l:libsepol.a', '-Wl,--version-script=audit2why.map'])
+    ],
+)
-- 
2.22.0

