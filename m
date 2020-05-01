Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A0E21C105B
	for <lists+selinux@lfdr.de>; Fri,  1 May 2020 11:29:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728352AbgEAJ3l (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Fri, 1 May 2020 05:29:41 -0400
Received: from mx1.polytechnique.org ([129.104.30.34]:48019 "EHLO
        mx1.polytechnique.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728236AbgEAJ3l (ORCPT
        <rfc822;selinux@vger.kernel.org>); Fri, 1 May 2020 05:29:41 -0400
Received: from localhost.localdomain (85-168-38-217.rev.numericable.fr [85.168.38.217])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by ssl.polytechnique.org (Postfix) with ESMTPSA id A46DA5649DF
        for <selinux@vger.kernel.org>; Fri,  1 May 2020 11:29:38 +0200 (CEST)
From:   Nicolas Iooss <nicolas.iooss@m4x.org>
To:     selinux@vger.kernel.org
Subject: [PATCH 1/2] scripts/env_use_destdir: fix Fedora support
Date:   Fri,  1 May 2020 11:29:28 +0200
Message-Id: <20200501092929.1162708-1-nicolas.iooss@m4x.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AV-Checked: ClamAV using ClamSMTP at svoboda.polytechnique.org (Fri May  1 11:29:38 2020 +0200 (CEST))
X-Spam-Flag: No, tests=bogofilter, spamicity=0.000000, queueID=DB86D5649E2
X-Org-Mail: nicolas.iooss.2010@polytechnique.org
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

libselinux and libsemanage use:

    PYTHONLIBDIR ?= $(shell $(PYTHON) -c "from distutils.sysconfig
    import *; print(get_python_lib(plat_specific=1,
    prefix='$(PREFIX)'))")

while python/semanage and python/sepolgen/src/sepolgen use:

    PYTHONLIBDIR ?= $(shell $(PYTHON) -c "from distutils.sysconfig
    import *; print(get_python_lib(prefix='$(PREFIX)'))")

This is right: libselinux and libsemanage's Python bindings use native
code (thus "plat_specific=1") while the others only install Python
files.

Nevertheless `scripts/env_use_destdir` only runs the second command
when computing `$PYTHONPATH`. When using this script to run `make test`
in a minimal Fedora 31 environment, this leads to an error such as:

    make[2]: Entering directory '/code/python/sepolicy'
    Traceback (most recent call last):
      File "test_sepolicy.py", line 117, in <module>
        import selinux
    ModuleNotFoundError: No module named 'selinux'

Fix this by also adding `get_python_lib(plat_specific=1)` to the
computed `$PYTHONPATH`.

While at it, preserve `$PYTHONPATH` instead of resetting it. This makes
it easier to work with Python virtual environments.

Signed-off-by: Nicolas Iooss <nicolas.iooss@m4x.org>
---
 scripts/env_use_destdir | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/scripts/env_use_destdir b/scripts/env_use_destdir
index 251987c255ce..491da58f9207 100755
--- a/scripts/env_use_destdir
+++ b/scripts/env_use_destdir
@@ -24,8 +24,14 @@ fi
 export LD_LIBRARY_PATH="$DESTDIR/usr/lib:$DESTDIR/lib"
 export PATH="$DESTDIR/usr/sbin:$DESTDIR/usr/bin:$DESTDIR/sbin:$DESTDIR/bin:$PATH"
 
-# shellcheck disable=SC2155
-export PYTHONPATH="$DESTDIR$(${PYTHON:-python3} -c "from distutils.sysconfig import *;print(get_python_lib(prefix='/usr'))")"
+NEW_PYTHONPATH="$DESTDIR$(${PYTHON:-python3} -c "from distutils.sysconfig import *;print(get_python_lib(plat_specific=1, prefix='/usr'))"):$DESTDIR$(${PYTHON:-python3} -c "from distutils.sysconfig import *;print(get_python_lib(prefix='/usr'))")"
+if [ -n "${PYTHONPATH:-}" ] ; then
+    # Prefix the PYTHONPATH with the new directories
+    export PYTHONPATH="$NEW_PYTHONPATH:$PYTHONPATH"
+else
+    # Define PYTHONPATH
+    export PYTHONPATH="$NEW_PYTHONPATH"
+fi
 
 # shellcheck disable=SC2155
 export RUBYLIB="$DESTDIR/$(${RUBY:-ruby} -e 'puts RbConfig::CONFIG["vendorlibdir"]'):$DESTDIR/$(${RUBY:-ruby} -e 'puts RbConfig::CONFIG["vendorarchdir"]')"
-- 
2.26.2

