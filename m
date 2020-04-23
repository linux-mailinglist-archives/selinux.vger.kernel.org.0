Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5929B1B6415
	for <lists+selinux@lfdr.de>; Thu, 23 Apr 2020 20:55:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728602AbgDWSzN (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Thu, 23 Apr 2020 14:55:13 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:52901 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728594AbgDWSzN (ORCPT
        <rfc822;selinux@vger.kernel.org>); Thu, 23 Apr 2020 14:55:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1587668112;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=430n4sQWwZ1n2BU2Ws5hAlPDf3ea0Ue9L7zj7ofU22c=;
        b=SNDYJkrBIWPupO9zsoPVlQDJ6USQIfuybkVSDK5iYdqIh5wyxgP1fxwfVJsZJEFa8efqYR
        +neM52XihiJSoWb9nZEjWS/4XQv0CkIi9KBC+kyrXEjEzPBZ/282bBJ2FcWkXmrb4ITOU7
        1WcCJrJfxFSCDa9nebupiaryhy9kz/o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-342-ANAHP4VhOQSCG-SO-BHZlw-1; Thu, 23 Apr 2020 14:55:08 -0400
X-MC-Unique: ANAHP4VhOQSCG-SO-BHZlw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0251A462
        for <selinux@vger.kernel.org>; Thu, 23 Apr 2020 18:55:08 +0000 (UTC)
Received: from workstation.redhat.com (unknown [10.40.192.79])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 5212060300;
        Thu, 23 Apr 2020 18:55:05 +0000 (UTC)
From:   Petr Lautrbach <plautrba@redhat.com>
To:     selinux@vger.kernel.org
Cc:     Petr Lautrbach <plautrba@redhat.com>
Subject: [PATCH v2] Convert README to README.md
Date:   Thu, 23 Apr 2020 20:54:49 +0200
Message-Id: <20200423185449.223595-1-plautrba@redhat.com>
In-Reply-To: <CAHC9VhRe25+PkmjaM8GcFZzFgDM5F3S65rfR5LuCBkangOtjGw@mail.gmail.com>
References: <CAHC9VhRe25+PkmjaM8GcFZzFgDM5F3S65rfR5LuCBkangOtjGw@mail.gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Content-Transfer-Encoding: quoted-printable
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

It should make the document readable for github users.

Fixes: https://github.com/SELinuxProject/selinux/issues/225

Signed-off-by: Petr Lautrbach <plautrba@redhat.com>
---

- Fixed indentation in yum command

 README    | 25 -------------------------
 README.md | 41 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 41 insertions(+), 25 deletions(-)
 delete mode 100644 README
 create mode 100644 README.md

diff --git a/README b/README
deleted file mode 100644
index e4423ca23b58..000000000000
--- a/README
+++ /dev/null
@@ -1,25 +0,0 @@
-Please submit all bug reports and patches to selinux@vger.kernel.org.
-Subscribe by sending "subscribe selinux" in the body of an email
-to majordomo@vger.kernel.org.
-
-Build dependencies on Fedora:
-yum install audit-libs-devel bison bzip2-devel dbus-devel dbus-glib-deve=
l flex flex-devel flex-static glib2-devel libcap-devel libcap-ng-devel pa=
m-devel pcre-devel python3-devel python3-setools swig xmlto redhat-rpm-co=
nfig
-
-To build and install everything under a private directory, run:
-make DESTDIR=3D~/obj install install-pywrap
-
-To install as the default system libraries and binaries
-(overwriting any previously installed ones - dangerous!),
-on x86_64, run:
-make LIBDIR=3D/usr/lib64 SHLIBDIR=3D/lib64 install install-pywrap relabe=
l
-or on x86 (32-bit), run:
-make install install-pywrap relabel
-
-This may render your system unusable if the upstream SELinux userspace
-lacks library functions or other dependencies relied upon by your
-distribution.  If it breaks, you get to keep both pieces.
-
-To install libsepol on macOS (mainly for policy analysis):
-cd libsepol; make PREFIX=3D/usr/local install
-
-This requires GNU coreutils (brew install coreutils).
diff --git a/README.md b/README.md
new file mode 100644
index 000000000000..974280f9d14f
--- /dev/null
+++ b/README.md
@@ -0,0 +1,41 @@
+SELinux Userspace
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+Please submit all bug reports and patches to <selinux@vger.kernel.org>.
+
+Subscribe by sending "subscribe selinux" in the body of an email
+to <majordomo@vger.kernel.org>.
+
+Installation
+------------
+
+Build dependencies on Fedora:
+
+    yum install audit-libs-devel bison bzip2-devel dbus-devel dbus-glib-=
devel flex flex-devel flex-static glib2-devel libcap-devel libcap-ng-deve=
l pam-devel pcre-devel python3-devel python3-setools swig xmlto redhat-rp=
m-config
+
+
+To build and install everything under a private directory, run:
+
+    make DESTDIR=3D~/obj install install-pywrap
+
+To install as the default system libraries and binaries
+(overwriting any previously installed ones - dangerous!),
+on x86_64, run:
+
+    make LIBDIR=3D/usr/lib64 SHLIBDIR=3D/lib64 install install-pywrap re=
label
+
+or on x86 (32-bit), run:
+
+    make install install-pywrap relabel
+
+This may render your system unusable if the upstream SELinux userspace
+lacks library functions or other dependencies relied upon by your
+distribution.  If it breaks, you get to keep both pieces.
+
+To install libsepol on macOS (mainly for policy analysis):
+
+    cd libsepol; make PREFIX=3D/usr/local install
+
+This requires GNU coreutils:
+
+    brew install coreutils
--=20
2.26.0

