Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDA7D2D828B
	for <lists+selinux@lfdr.de>; Sat, 12 Dec 2020 00:03:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393505AbgLKXCP (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Fri, 11 Dec 2020 18:02:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390051AbgLKXCO (ORCPT
        <rfc822;selinux@vger.kernel.org>); Fri, 11 Dec 2020 18:02:14 -0500
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C74AAC0613CF
        for <selinux@vger.kernel.org>; Fri, 11 Dec 2020 15:01:33 -0800 (PST)
Received: by mail-yb1-xb49.google.com with SMTP id t187so10364617ybf.10
        for <selinux@vger.kernel.org>; Fri, 11 Dec 2020 15:01:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:message-id:mime-version:subject:from:to:cc;
        bh=joNBMeLSUx7RyHZEqkqaD1tN9fq8A/fGzDEtfYOTR1Q=;
        b=hYC+9QXpU8cOQOu3ifBeW7j7Gr8TEk8IDEPZ4pMAV2jSbNmO9vxOoPfVZf95xBISSF
         4XVz6wRJwkgnFLKtpzlbzKoxOEH86NvGWRZOscapjnmc59428ARBhspdwKnj8xx40GDS
         l9g398HrDqKvEXjNH/J0quYmRGKtn6B+qsJsB2DG4cFc/DX90H9WSczFZKjYOGLAqFHk
         ECiHbLetJSy9OZ9kRx6bpQccpCS8/tZ0HP/CVgaQaoLAxFCcOedqVVA2wfhKMx+mFSoh
         iL6UfDJKM7N4pOXhBMQXlV6oywNI+0PYNT9JTwD0dNxnlS7n2PgEJjTOhz4xkka5Dtxb
         A99g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
         :to:cc;
        bh=joNBMeLSUx7RyHZEqkqaD1tN9fq8A/fGzDEtfYOTR1Q=;
        b=IZYj1TnzC/RhwGtwyGGClN7SAn/NihiLTsnMf7B57Xbu4fAEr396J2LFAgj6aNRSL2
         jFJPQ5fQbTJsvMFo5mZ+hfJUkFPGSaKJqOTuSLbm55GiVUFyGZbLdV/nCEttx33uHgZP
         QMrPK7ToUJU206ReJ4k00JTkqi8KSKz4d7WM4O7YJFA0VWD0IwHC9cN4TYpnTVOQgnVA
         B+op+a2IZLIU2HTNzptbg6HZvubulxaSTx50nCyiI5ZJJYP/BEW46WzX+esa1fYZz0hC
         +0T0JkHHHmaojK71gaTQSOc7sNa9l0H7/g8ajI0Ca169H0Bd9x9ttI7j7hSMkqyx0J/W
         hwFA==
X-Gm-Message-State: AOAM533elXYLMdHDHOzNBA5wqbhasunWiWX8m1eCUAexh4f8aalTxBs+
        2xis5QRfaTyMmyoUQ3JED31jA2x4O6cdaNzHpg==
X-Google-Smtp-Source: ABdhPJwd/LNp1cAxSD5ttluyV0/Em6Jwr4iFR0FO/g2ufESBu6zIrKD2rxQUFR5igtSmJmSn76iL7R1chwRoshJjaw==
Sender: "lokeshgidra via sendgmr" <lokeshgidra@lg.mtv.corp.google.com>
X-Received: from lg.mtv.corp.google.com ([2620:15c:211:202:f693:9fff:fef4:29dd])
 (user=lokeshgidra job=sendgmr) by 2002:a05:6902:6af:: with SMTP id
 j15mr22826017ybt.17.1607727693027; Fri, 11 Dec 2020 15:01:33 -0800 (PST)
Date:   Fri, 11 Dec 2020 15:01:19 -0800
Message-Id: <20201211230119.1818009-1-lokeshgidra@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.29.2.576.ga3fc446d84-goog
Subject: [PATCH v2 1/1] selinux-testsuite: Add userfaultfd test
From:   Lokesh Gidra <lokeshgidra@google.com>
To:     Paul Moore <paul@paul-moore.com>,
        Stephen Smalley <stephen.smalley.work@gmail.com>,
        Ondrej Mosnacek <omosnace@redhat.com>
Cc:     selinux@vger.kernel.org, kaleshsingh@google.com, calin@google.com,
        surenb@google.com, jeffv@google.com, kernel-team@android.com,
        Lokesh Gidra <lokeshgidra@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Confirm SELinux policies are enforced on userfaultfd operations
via secure anon-inode interface.

Signed-off-by: Lokesh Gidra <lokeshgidra@google.com>
---
 policy/Makefile                 |   4 +-
 policy/test_userfaultfd.cil     |  52 ++++++++++
 policy/test_userfaultfd.te      |  49 +++++++++
 tests/Makefile                  |   2 +-
 tests/userfaultfd/Makefile      |   5 +
 tests/userfaultfd/test          |  39 +++++++
 tests/userfaultfd/userfaultfd.c | 175 ++++++++++++++++++++++++++++++++
 7 files changed, 323 insertions(+), 3 deletions(-)
 create mode 100644 policy/test_userfaultfd.cil
 create mode 100644 policy/test_userfaultfd.te
 create mode 100644 tests/userfaultfd/Makefile
 create mode 100755 tests/userfaultfd/test
 create mode 100644 tests/userfaultfd/userfaultfd.c

diff --git a/policy/Makefile b/policy/Makefile
index 6c49091..3e00875 100644
--- a/policy/Makefile
+++ b/policy/Makefile
@@ -29,14 +29,14 @@ TARGETS = \
 	test_task_getsid.te test_task_setpgid.te test_task_setsched.te \
 	test_transition.te test_unix_socket.te \
 	test_mmap.te test_overlayfs.te test_mqueue.te \
-	test_ibpkey.te test_atsecure.te test_cgroupfs.te
+	test_ibpkey.te test_atsecure.te test_cgroupfs.te test_userfaultfd.te
 
 ifeq (x$(DISTRO),$(filter x$(DISTRO),xRHEL4 xRHEL5 xRHEL6))
 SUPPORTS_CIL = n
 endif
 
 ifeq ($(SUPPORTS_CIL),y)
-CIL_TARGETS = test_mlsconstrain.cil test_overlay_defaultrange.cil
+CIL_TARGETS = test_mlsconstrain.cil test_overlay_defaultrange.cil test_userfaultfd.cil
 ifeq ($(shell [ $(MAX_KERNEL_POLICY) -ge 32 ] && echo true),true)
 ifeq ($(shell [ $(POL_VERS) -ge 32 ] && echo true),true)
 # If other MLS tests get written this can be moved outside of the glblub test
diff --git a/policy/test_userfaultfd.cil b/policy/test_userfaultfd.cil
new file mode 100644
index 0000000..b0f44af
--- /dev/null
+++ b/policy/test_userfaultfd.cil
@@ -0,0 +1,52 @@
+; Define new class anon_inode
+(class anon_inode ())
+(classcommon anon_inode file)
+(classorder (unordered anon_inode))
+
+; Allow all anonymous inodes
+(typeattributeset cil_gen_require test_notransition_uffd_t)
+(allow test_notransition_uffd_t self (anon_inode (create getattr ioctl read)))
+
+(typeattributeset cil_gen_require uffd_t)
+
+; Allow all operations on UFFD
+(typeattributeset cil_gen_require test_uffd_t)
+(typetransition test_uffd_t test_uffd_t anon_inode "[userfaultfd]"    uffd_t)
+(allow test_uffd_t uffd_t (anon_inode (create getattr ioctl read)))
+
+; Don't allow any operation on UFFD
+(typeattributeset cil_gen_require test_nocreate_uffd_t)
+(typetransition test_nocreate_uffd_t test_nocreate_uffd_t anon_inode "[userfaultfd]"    uffd_t)
+
+; Don't allow getattr operation on UFFD
+(typeattributeset cil_gen_require test_nogetattr_uffd_t)
+(typetransition test_nogetattr_uffd_t test_nogetattr_uffd_t anon_inode "[userfaultfd]"    uffd_t)
+(allow test_nogetattr_uffd_t uffd_t (anon_inode (create)))
+
+; Don't allow any ioctl operation on UFFD
+(typeattributeset cil_gen_require test_noioctl_uffd_t)
+(typetransition test_noioctl_uffd_t test_noioctl_uffd_t anon_inode "[userfaultfd]"    uffd_t)
+(allow test_noioctl_uffd_t uffd_t (anon_inode (create getattr)))
+
+; Only allow UFFDIO_API ioctl
+(typeattributeset cil_gen_require test_api_ioctl_uffd_t)
+(typetransition test_api_ioctl_uffd_t test_api_ioctl_uffd_t anon_inode "[userfaultfd]"    uffd_t)
+(allow test_api_ioctl_uffd_t uffd_t (anon_inode (create getattr ioctl read)))
+(allowx test_api_ioctl_uffd_t uffd_t (ioctl anon_inode ((0xaa3f))))
+
+; Only allow UFFDIO_API and UFFDIO_REGISTER ioctls
+(typeattributeset cil_gen_require test_register_ioctl_uffd_t)
+(typetransition test_register_ioctl_uffd_t test_register_ioctl_uffd_t anon_inode "[userfaultfd]"    uffd_t)
+(allow test_register_ioctl_uffd_t uffd_t (anon_inode (create getattr ioctl read)))
+(allowx test_register_ioctl_uffd_t uffd_t (ioctl anon_inode ((0xaa3f 0xaa00))))
+
+; Only allow UFFDIO_API, UFFDIO_REGISTER and UFFDIO_COPY ioctls, which are most used.
+(typeattributeset cil_gen_require test_copy_ioctl_uffd_t)
+(typetransition test_copy_ioctl_uffd_t test_copy_ioctl_uffd_t anon_inode "[userfaultfd]"    uffd_t)
+(allow test_copy_ioctl_uffd_t uffd_t (anon_inode (create getattr ioctl read)))
+(allowx test_copy_ioctl_uffd_t uffd_t (ioctl anon_inode ((0xaa3f 0xaa00 0xaa03))))
+
+; Don't allow read operation on UFFD.
+(typeattributeset cil_gen_require test_noread_uffd_t)
+(typetransition test_noread_uffd_t test_noread_uffd_t anon_inode "[userfaultfd]"    uffd_t)
+(allow test_noread_uffd_t uffd_t (anon_inode (create getattr ioctl)))
diff --git a/policy/test_userfaultfd.te b/policy/test_userfaultfd.te
new file mode 100644
index 0000000..aca9406
--- /dev/null
+++ b/policy/test_userfaultfd.te
@@ -0,0 +1,49 @@
+#################################
+#
+# Policy for testing userfaultfd operations
+#
+
+attribute test_uffd_domain;
+
+type uffd_t;
+
+define(`userfaultfd_domain_type',`
+	type $1;
+	domain_type($1)
+	unconfined_runs_test($1)
+	typeattribute $1 test_uffd_domain;
+	typeattribute $1 testdomain;
+')
+
+# Domain for confirming that without transition rule the userfaultfd
+# gets process' context
+userfaultfd_domain_type(test_notransition_uffd_t)
+
+# Domain for process that has all the permissions to use userfaultfd
+userfaultfd_domain_type(test_uffd_t)
+
+# Domain for process that cannot create userfaultfd
+userfaultfd_domain_type(test_nocreate_uffd_t)
+
+# Domain for process that cannot get attributed of userfaultfd
+userfaultfd_domain_type(test_nogetattr_uffd_t)
+
+# Domain for process which can only use UFFDIO_API ioctl on userfaultfd
+userfaultfd_domain_type(test_api_ioctl_uffd_t)
+
+# Domain for process which can use UFFDIO_API and UFFDIO_REGISTER ioctls
+# on userfaultfd
+userfaultfd_domain_type(test_register_ioctl_uffd_t)
+
+# Domain for process which can use UFFDIO_API, UFFDIO_REGISTER and
+# UFFDIO_COPY ioctls on userfaultfd
+userfaultfd_domain_type(test_copy_ioctl_uffd_t)
+
+# Domain for proces that cannot perform any ioctl operations on userfaultfd
+userfaultfd_domain_type(test_noioctl_uffd_t)
+
+# Domain for process that cannot read from userfaultfd
+userfaultfd_domain_type(test_noread_uffd_t)
+
+# Allow all of these domains to be executed
+allow test_uffd_domain test_file_t:file { entrypoint map execute };
diff --git a/tests/Makefile b/tests/Makefile
index 4c00b5f..3871570 100644
--- a/tests/Makefile
+++ b/tests/Makefile
@@ -27,7 +27,7 @@ SUBDIRS:= domain_trans entrypoint execshare exectrace execute_no_trans \
 	task_setnice task_setscheduler task_getscheduler task_getsid \
 	task_getpgid task_setpgid file ioctl capable_file capable_net \
 	capable_sys dyntrans dyntrace bounds nnp_nosuid mmap unix_socket \
-	inet_socket overlay checkreqprot mqueue mac_admin atsecure
+	inet_socket overlay checkreqprot mqueue mac_admin atsecure userfaultfd
 
 ifeq ($(shell grep -q cap_userns $(POLDEV)/include/support/all_perms.spt && echo true),true)
 ifneq ($(shell ./kvercmp $$(uname -r) 4.7),-1)
diff --git a/tests/userfaultfd/Makefile b/tests/userfaultfd/Makefile
new file mode 100644
index 0000000..0daa759
--- /dev/null
+++ b/tests/userfaultfd/Makefile
@@ -0,0 +1,5 @@
+userfaultfd:
+	cc userfaultfd.c -o userfaultfd -pthread
+all: userfaultfd
+clean:
+	rm -f userfaultfd
diff --git a/tests/userfaultfd/test b/tests/userfaultfd/test
new file mode 100755
index 0000000..f587e0c
--- /dev/null
+++ b/tests/userfaultfd/test
@@ -0,0 +1,39 @@
+#!/usr/bin/perl
+
+use Test;
+
+BEGIN {
+    plan tests => 9;
+}
+
+$basedir = $0;
+$basedir =~ s|(.*)/[^/]*|$1|;
+
+$result = system "runcon -t test_notransition_uffd_t $basedir/userfaultfd test_notransition_uffd_t";
+ok( $result, 0 );
+
+$result = system "runcon -t test_uffd_t $basedir/userfaultfd uffd_t";
+ok( $result, 0 );
+
+$result = system "runcon -t test_nocreate_uffd_t $basedir/userfaultfd uffd_t";
+ok( $result >> 8, 1 );
+
+$result = system "runcon -t test_nogetattr_uffd_t $basedir/userfaultfd uffd_t";
+ok( $result >> 8, 2 );
+
+$result = system "runcon -t test_noioctl_uffd_t $basedir/userfaultfd uffd_t";
+ok( $result >> 8, 4 );
+
+$result = system "runcon -t test_api_ioctl_uffd_t $basedir/userfaultfd uffd_t";
+ok( $result >> 8, 5 );
+
+$result = system "runcon -t test_noread_uffd_t $basedir/userfaultfd uffd_t";
+ok( $result >> 8, 6 );
+
+$result = system "runcon -t test_register_ioctl_uffd_t $basedir/userfaultfd uffd_t";
+ok( $result >> 8, 7 );
+
+$result = system "runcon -t test_copy_ioctl_uffd_t $basedir/userfaultfd uffd_t";
+ok( $result, 0 );
+
+exit;
diff --git a/tests/userfaultfd/userfaultfd.c b/tests/userfaultfd/userfaultfd.c
new file mode 100644
index 0000000..b2ac621
--- /dev/null
+++ b/tests/userfaultfd/userfaultfd.c
@@ -0,0 +1,175 @@
+#include <errno.h>
+#include <fcntl.h>
+#include <poll.h>
+#include <pthread.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <unistd.h>
+
+#include <sys/ioctl.h>
+#include <sys/mman.h>
+#include <sys/types.h>
+#include <sys/syscall.h>
+#include <sys/xattr.h>
+
+#include <linux/userfaultfd.h>
+
+int page_size;
+
+void* fault_handler_thread(void* arg)
+{
+	long uffd = (long)arg;
+	struct uffd_msg msg = {0};
+	struct uffdio_copy uffdio_copy = {0};
+	ssize_t nread;
+	char* page = (char *) mmap(NULL, page_size,  PROT_READ | PROT_WRITE,
+			MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+	if (page == MAP_FAILED) {
+		perror("mmap");
+		exit(-1);
+	}
+	memset(page, 'a', page_size);
+
+	// Loop, handling incoming events on the userfaultfd file descriptor
+	for (;;) {
+		// poll on uffd waiting for an event
+		struct pollfd pollfd;
+		int nready;
+		pollfd.fd = uffd;
+		pollfd.events = POLLIN;
+		nready = poll(&pollfd, 1, -1);
+		if (nready == -1) {
+			perror("poll");
+			exit(-1);
+		}
+
+		/* Read an event from the userfaultfd */
+		nread = read(uffd, &msg, sizeof(msg));
+		if (nread == 0) {
+			printf("EOF on userfaultfd!\n");
+			exit(-1);
+		}
+
+		if (nread == -1) {
+			if (errno == EACCES) {
+				exit(6);
+			}
+			perror("read");
+			exit(-1);
+		}
+
+		// We expect only one kind of event; verify that assumption
+		if (msg.event != UFFD_EVENT_PAGEFAULT) {
+			fprintf(stderr, "Unexpected event on userfaultfd\n");
+			exit(-1);
+		}
+
+		uffdio_copy.src = (unsigned long) page;
+
+		// Align fault address to page boundary
+		uffdio_copy.dst = (unsigned long) msg.arg.pagefault.address &
+						   ~(page_size - 1);
+		uffdio_copy.len = page_size;
+		uffdio_copy.mode = 0; // Wake-up thread thread waiting for page-fault resolution
+		uffdio_copy.copy = 0; // Used by kernel to return how many bytes copied
+		if (ioctl(uffd, UFFDIO_COPY, &uffdio_copy) < 0) {
+			if (errno == EACCES) {
+				exit(7);
+			}
+			perror("ioctl-UFFDIO_COPY");
+			exit(-1);
+		}
+	}
+}
+
+int main (int argc, char* argv[])
+{
+	char* addr;
+	struct uffdio_api api = {0};
+	struct uffdio_register uffdio_register = {0};
+	char selinux_ctxt[128];
+	pthread_t thr; // ID of thread that handles page faults
+	ssize_t ret;
+	
+	long uffd = syscall(__NR_userfaultfd, O_CLOEXEC | O_NONBLOCK);
+	if (uffd < 0) {
+		if (errno == EACCES) {
+			return 1;
+		}
+		perror("syscall(userfaultfd)");
+		return -1;
+	}
+
+	// Check security context of uffd
+        ret = fgetxattr(uffd, "security.selinux", selinux_ctxt, 1024);
+        if (ret < 0) {
+		if (errno == EACCES) {
+			return 2;
+		}
+                perror("fgetxattr");
+                return -1;
+        }
+        selinux_ctxt[ret] = 0;
+	if (strstr(selinux_ctxt, argv[1]) == NULL) {
+		fprintf(stderr, "Couldn't find the right selinux context. "
+				"got:%s expected:%s\n", selinux_ctxt, argv[1]);
+		return 3;
+	}
+
+	api.api = UFFD_API;
+	if (ioctl(uffd, UFFDIO_API, &api) < 0) {
+		if (errno == EACCES) {
+			return 4;
+		}
+		perror("UFFDIO_API");
+		return -1;
+	}
+
+	page_size = sysconf(_SC_PAGE_SIZE);
+	/* Create a private anonymous mapping. The memory will be
+	 * demand-zero paged--that is, not yet allocated. When we
+	 * actually touch the memory, it will be allocated via
+	 * the userfaultfd.
+	 */
+	addr = (char*) mmap(NULL, page_size, PROT_READ | PROT_WRITE,
+			MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+	if (addr == MAP_FAILED) {
+		perror("mmap");
+		return -1;
+	}
+
+	/* Register the memory range of the mapping we just created for
+	 * handling by the userfaultfd object. In mode, we request to track
+	 * missing pages (i.e., pages that have not yet been faulted in).
+	 */
+	uffdio_register.range.start = (unsigned long) addr;
+	uffdio_register.range.len = page_size;
+	uffdio_register.mode = UFFDIO_REGISTER_MODE_MISSING;
+	if (ioctl(uffd, UFFDIO_REGISTER, &uffdio_register) < 0) {
+		if (errno == EACCES) {
+			return 5;
+		}
+		perror("ioctl-UFFDIO_REGISTER");
+		return -1;
+	}
+
+ 	// Create a thread that will process the userfaultfd events
+	ret = pthread_create(&thr, NULL, fault_handler_thread, (void *) uffd);
+	if (ret != 0) {
+		errno = ret;
+		perror("pthread_create");
+		return -1;
+	}
+	
+	/* Acces to the registered memory range should invoke the 'missing'
+	 * userfaultfd page fault, which should get handled by the thread
+	 * created above.
+	 */
+	if (addr[42] != 'a') {
+		fprintf(stderr, "Didn't read the expected value after userfaultfd event\n");
+		return -1;
+	}
+
+	return 0;
+}
-- 
2.28.0

