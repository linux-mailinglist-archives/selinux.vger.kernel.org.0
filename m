Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D10231D1E1
	for <lists+selinux@lfdr.de>; Tue, 16 Feb 2021 22:14:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229699AbhBPVOT (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Tue, 16 Feb 2021 16:14:19 -0500
Received: from mx1.polytechnique.org ([129.104.30.34]:36430 "EHLO
        mx1.polytechnique.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229544AbhBPVOT (ORCPT
        <rfc822;selinux@vger.kernel.org>); Tue, 16 Feb 2021 16:14:19 -0500
Received: from localhost.localdomain (85-168-38-217.rev.numericable.fr [85.168.38.217])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by ssl.polytechnique.org (Postfix) with ESMTPSA id 112C5561209
        for <selinux@vger.kernel.org>; Tue, 16 Feb 2021 22:13:37 +0100 (CET)
From:   Nicolas Iooss <nicolas.iooss@m4x.org>
To:     selinux@vger.kernel.org
Subject: [PATCH] libselinux: rename gettid() to something which never conflicts with the libc
Date:   Tue, 16 Feb 2021 22:13:28 +0100
Message-Id: <20210216211328.3609-1-nicolas.iooss@m4x.org>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AV-Checked: ClamAV using ClamSMTP at svoboda.polytechnique.org (Tue Feb 16 22:13:37 2021 +0100 (CET))
X-Spam-Flag: No, tests=bogofilter, spamicity=0.000009, queueID=5285156120B
X-Org-Mail: nicolas.iooss.2010@polytechnique.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Musl recently added a wrapper for gettid() syscall. There is no way to
detect this new version in a reliable way, so rename our gettid()
wrapper to a non-conflicting name.

Introduce a new function which, when using a libc known to provide a
wrapper for gettid(), calls it, and which, otherwise, performs the
syscall directly.

Anyway this function is only used on systems where /proc/thread-self
does not exist, which are therefore running Linux<3.17.

Fixes: https://github.com/SELinuxProject/selinux/issues/282
Signed-off-by: Nicolas Iooss <nicolas.iooss@m4x.org>

diff --git a/libselinux/src/procattr.c b/libselinux/src/procattr.c
index 1aa67ac53f39..840570525f5f 100644
--- a/libselinux/src/procattr.c
+++ b/libselinux/src/procattr.c
@@ -25,21 +25,23 @@ static __thread char destructor_initialized;
 /* Bionic and glibc >= 2.30 declare gettid() system call wrapper in unistd.h and
  * has a definition for it */
 #ifdef __BIONIC__
-  #define OVERRIDE_GETTID 0
+  #define HAVE_GETTID 1
 #elif !defined(__GLIBC_PREREQ)
-  #define OVERRIDE_GETTID 1
+  #define HAVE_GETTID 0
 #elif !__GLIBC_PREREQ(2,30)
-  #define OVERRIDE_GETTID 1
+  #define HAVE_GETTID 0
 #else
-  #define OVERRIDE_GETTID 0
+  #define HAVE_GETTID 1
 #endif
 
-#if OVERRIDE_GETTID
-static pid_t gettid(void)
+static pid_t selinux_gettid(void)
 {
+#if HAVE_GETTID
+	return gettid();
+#else
 	return syscall(__NR_gettid);
-}
 #endif
+}
 
 static void procattr_thread_destructor(void __attribute__((unused)) *unused)
 {
@@ -94,7 +96,7 @@ static int openattr(pid_t pid, const char *attr, int flags)
 		if (fd >= 0 || errno != ENOENT)
 			goto out;
 		free(path);
-		tid = gettid();
+		tid = selinux_gettid();
 		rc = asprintf(&path, "/proc/self/task/%d/attr/%s", tid, attr);
 	} else {
 		errno = EINVAL;
-- 
2.30.0

