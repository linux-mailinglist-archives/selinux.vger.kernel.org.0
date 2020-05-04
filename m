Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB6051C46DB
	for <lists+selinux@lfdr.de>; Mon,  4 May 2020 21:11:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726338AbgEDTLo (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Mon, 4 May 2020 15:11:44 -0400
Received: from mx1.polytechnique.org ([129.104.30.34]:34294 "EHLO
        mx1.polytechnique.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725956AbgEDTLn (ORCPT
        <rfc822;selinux@vger.kernel.org>); Mon, 4 May 2020 15:11:43 -0400
Received: from localhost.localdomain (85-168-38-217.rev.numericable.fr [85.168.38.217])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by ssl.polytechnique.org (Postfix) with ESMTPSA id 3984E561223
        for <selinux@vger.kernel.org>; Mon,  4 May 2020 21:11:40 +0200 (CEST)
From:   Nicolas Iooss <nicolas.iooss@m4x.org>
To:     selinux@vger.kernel.org
Subject: [PATCH] Travis-CI: upgrade to Ubuntu 18.04 and latest releases of Python and Ruby
Date:   Mon,  4 May 2020 21:11:22 +0200
Message-Id: <20200504191122.732231-1-nicolas.iooss@m4x.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AV-Checked: ClamAV using ClamSMTP at svoboda.polytechnique.org (Mon May  4 21:11:40 2020 +0200 (CEST))
X-Spam-Flag: No, tests=bogofilter, spamicity=0.000006, queueID=6C9F356122F
X-Org-Mail: nicolas.iooss.2010@polytechnique.org
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

* Test Python 3.8 and Pypy3 3.6-7.2.0
* Test Ruby 2.7
* Drop Ruby 2.2 and 2.3 (they are not supported with Ubuntu 18.04 in
  https://rubies.travis-ci.org/)
* While at it, replace deprecated libdbus-glib-1-dev with libglib2.0-dev
  now that restorecond has been upgraded.

Signed-off-by: Nicolas Iooss <nicolas.iooss@m4x.org>
---
 .travis.yml | 40 ++++++++++++++++++++--------------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/.travis.yml b/.travis.yml
index 4361d26cbb83..c36e721a5e1d 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -11,33 +11,33 @@ compiler:
 env:
   matrix:
     # Test the last version of Python and Ruby together, with some linkers
-    - PYVER=python3.7 RUBYLIBVER=2.6
-    - PYVER=python3.7 RUBYLIBVER=2.6 TEST_FLAGS_OVERRIDE=1
-    - PYVER=python3.7 RUBYLIBVER=2.6 TEST_DEBUG=1
-    - PYVER=python3.7 RUBYLIBVER=2.6 LINKER=gold
-    - PYVER=python3.7 RUBYLIBVER=2.6 LINKER=bfd
-
-    # Test several Python versions
-    - PYVER=python3.5 RUBYLIBVER=2.6
-    - PYVER=python3.6 RUBYLIBVER=2.6
-    - PYVER=pypy3.5-6.0 RUBYLIBVER=2.6
+    - PYVER=python3.8 RUBYLIBVER=2.7
+    - PYVER=python3.8 RUBYLIBVER=2.7 TEST_FLAGS_OVERRIDE=1
+    - PYVER=python3.8 RUBYLIBVER=2.7 TEST_DEBUG=1
+    - PYVER=python3.8 RUBYLIBVER=2.7 LINKER=gold
+    - PYVER=python3.8 RUBYLIBVER=2.7 LINKER=bfd
+
+    # Test several Python versions (https://docs.travis-ci.com/user/languages/python/#python-versions)
+    - PYVER=python3.5 RUBYLIBVER=2.7
+    - PYVER=python3.6 RUBYLIBVER=2.7
+    - PYVER=python3.7 RUBYLIBVER=2.7
+    - PYVER=pypy3.6-7.2.0 RUBYLIBVER=2.7
 
     # Test several Ruby versions (http://rubies.travis-ci.org/)
-    - PYVER=python3.7 RUBYLIBVER=2.5.1
-    - PYVER=python3.7 RUBYLIBVER=2.4
-    - PYVER=python3.7 RUBYLIBVER=2.3
-    - PYVER=python3.7 RUBYLIBVER=2.2
+    - PYVER=python3.8 RUBYLIBVER=2.6
+    - PYVER=python3.8 RUBYLIBVER=2.5.1
+    - PYVER=python3.8 RUBYLIBVER=2.4
 
 matrix:
   exclude:
     - compiler: clang
-      env: PYVER=python3.7 RUBYLIBVER=2.6 LINKER=gold
+      env: PYVER=python3.8 RUBYLIBVER=2.7 LINKER=gold
     - compiler: clang
-      env: PYVER=python3.7 RUBYLIBVER=2.6 LINKER=bfd
+      env: PYVER=python3.8 RUBYLIBVER=2.7 LINKER=bfd
 
-# Use Travis-CI Ubuntu 16.04 Xenial Xerus infrastructure, "full image" variant
+# Use Travis-CI Ubuntu 18.04 Bionic Beaver, "full image" variant
 sudo: required
-dist: xenial
+dist: bionic
 
 # Install SELinux userspace utilities dependencies
 addons:
@@ -52,7 +52,7 @@ addons:
     - libcap-dev
     - libcap-ng-dev # This package is not whitelisted for the container infrastructure (https://github.com/travis-ci/apt-package-whitelist/issues/1096)
     - libcunit1-dev
-    - libdbus-glib-1-dev
+    - libglib2.0-dev
     - libpcre3-dev
     - patch
     - python3-dev
@@ -78,7 +78,7 @@ install:
   # Download the required python version if it is not installed
   - VIRTUAL_ENV="$HOME/virtualenv/$PYVER"
   - if ! [ -d "$VIRTUAL_ENV" ] ; then
-        curl --retry 10 -o python.tar.bz2 "https://s3.amazonaws.com/travis-python-archives/binaries/ubuntu/16.04/x86_64/${PYVER/python/python-}.tar.bz2" &&
+        curl --retry 10 -o python.tar.bz2 "https://s3.amazonaws.com/travis-python-archives/binaries/ubuntu/18.04/x86_64/${PYVER/python/python-}.tar.bz2" &&
         sudo tar xjf python.tar.bz2 --directory / &&
         rm python.tar.bz2 ;
     fi
-- 
2.26.2

