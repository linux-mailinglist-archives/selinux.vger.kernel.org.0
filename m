Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDFEC1B5C92
	for <lists+selinux@lfdr.de>; Thu, 23 Apr 2020 15:28:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726429AbgDWN26 (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Thu, 23 Apr 2020 09:28:58 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:35763 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726224AbgDWN25 (ORCPT
        <rfc822;selinux@vger.kernel.org>); Thu, 23 Apr 2020 09:28:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1587648536;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=TSmzrFwNeNmyRG2axEI9QSw/J7fYMPsr2C9Q4MhIvo4=;
        b=JdysnAWeFuNbVwMZnW5zRlJZjcDRHrXwChIKVl2q7F7/yYi0OSMwX4hZ7PX9TUscCz2Is0
        KU4v+WmdVkmBfAgi3jTKbQq/yjKNa2NE8rGbnN2nbOgd2q/qHzcmxe6rc0YIbzSpC7J2qw
        4aNapxvLx+9SU17L5qCB03hiFc5AUPE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-151-Q5ZX0cgBNEahtNcr4eIzNQ-1; Thu, 23 Apr 2020 09:28:41 -0400
X-MC-Unique: Q5ZX0cgBNEahtNcr4eIzNQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9D0F8100A8F1
        for <selinux@vger.kernel.org>; Thu, 23 Apr 2020 13:28:40 +0000 (UTC)
Received: from workstation.redhat.com (unknown [10.40.192.166])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 96825600E5;
        Thu, 23 Apr 2020 13:28:39 +0000 (UTC)
From:   Petr Lautrbach <plautrba@redhat.com>
To:     selinux@vger.kernel.org
Cc:     Petr Lautrbach <plautrba@redhat.com>
Subject: [PATCH] Convert README to README.md
Date:   Thu, 23 Apr 2020 15:28:33 +0200
Message-Id: <20200423132833.211294-1-plautrba@redhat.com>
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
index 000000000000..b05f1c74f279
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
+   =20
+	yum install audit-libs-devel bison bzip2-devel dbus-devel dbus-glib-dev=
el flex flex-devel flex-static glib2-devel libcap-devel libcap-ng-devel p=
am-devel pcre-devel python3-devel python3-setools swig xmlto redhat-rpm-c=
onfig
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

