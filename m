Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ECED47DA5E
	for <lists+selinux@lfdr.de>; Thu,  1 Aug 2019 13:35:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730713AbfHALfT (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Thu, 1 Aug 2019 07:35:19 -0400
Received: from UHIL19PA35.eemsg.mail.mil ([214.24.21.194]:41909 "EHLO
        UHIL19PA35.eemsg.mail.mil" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725379AbfHALfT (ORCPT
        <rfc822;selinux@vger.kernel.org>); Thu, 1 Aug 2019 07:35:19 -0400
X-EEMSG-check-017: 7068305|UHIL19PA35_ESA_OUT01.csd.disa.mil
X-IronPort-AV: E=Sophos;i="5.64,334,1559520000"; 
   d="scan'208";a="7068305"
Received: from emsm-gh1-uea10.ncsc.mil ([214.29.60.2])
  by UHIL19PA35.eemsg.mail.mil with ESMTP; 01 Aug 2019 11:35:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tycho.nsa.gov; i=@tycho.nsa.gov; q=dns/txt;
  s=tycho.nsa.gov; t=1564659317; x=1596195317;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=jlQB7cQ4z8I1OVbWMam2xwofxK8DNAG0SgC59qnpkyw=;
  b=L9NgdZ4GHW1VhEj98Z1o9qYrpiRgE/0fBTI6IzQUqUTw6OwMItTxp45U
   jaA0bZz4k3SXG91WHvbeOdD7YBniPj/vbgkw1xeRWO6DSuZMGGxTIpg0w
   SuKTaLAl1dY+OrZ8UKFhtAy0iNsMHgmfOmop8efNtswWHHUsE0rpfVJ1D
   bJrlVbHSe3TpYAwP+bNJvRB6+qlkM3++5Tv50+luHxM2fzqDnNdEcjQZ3
   2jCoM/AHnugJC1Cx+oEyCL7a5OXrlCcwPTYnMwP/qPxmvIjvHilrMJY4Q
   huuk5cM4KVYXPuQUvI4zTEjIFFW0kdepGgSieBKbC4tUVy5H5vxWogdZl
   g==;
X-IronPort-AV: E=Sophos;i="5.64,334,1559520000"; 
   d="scan'208";a="26333850"
IronPort-PHdr: =?us-ascii?q?9a23=3AK45EFhzX27YOYojXCy+O+j09IxM/srCxBDY+r6?=
 =?us-ascii?q?Qd2+oRIJqq85mqBkHD//Il1AaPAdyBraMbwLaO+4nbGkU4qa6bt34DdJEeHz?=
 =?us-ascii?q?Qksu4x2zIaPcieFEfgJ+TrZSFpVO5LVVti4m3peRMNQJW2aFLduGC94iAPER?=
 =?us-ascii?q?vjKwV1Ov71GonPhMiryuy+4ZLebxhWiDanZb5/Lhq6oArNusILnYZsN6E9xw?=
 =?us-ascii?q?fTrHBVYepW32RoJVySnxb4+Mi9+YNo/jpTtfw86cNOSL32cKskQ7NWCjQmKH?=
 =?us-ascii?q?0169bwtRbfVwuP52ATXXsQnxFVHgXK9hD6XpP2sivnqupw3TSRMMPqQbwoXz?=
 =?us-ascii?q?mp8qlkSAXsiCwaKTA39m/ZgdF0gK5CoB+soxlzzojJa4+XKfV+ZLvQc9MES2?=
 =?us-ascii?q?RcUMhfVCtPDYyzYYYUE+YMPvxVo5XnqlcSsRezAxSnCuP1yj9Pg3/7xbE33P?=
 =?us-ascii?q?47EQHB2gwrAtMAsHPVrNroKqgSVf2+wa7SwjrfYPNW3jb955XWfR06vfGNXa?=
 =?us-ascii?q?5/ccrWyUU1EQPFlU+fpZbqPzOSyOQAqm6W5PdjW+K3k2Mrtg58rze1ysosl4?=
 =?us-ascii?q?XFnJwZx1/a+Slj3Yo4I8CzRlRhbt6+CpRQsjmXN45xQsw/XW5loD06yrgauZ?=
 =?us-ascii?q?6jeygK1Ygnywbfa/OZd4iI5QruVPqLLjdihXJlZam/iwyu8Umg1uL8Vs603E?=
 =?us-ascii?q?xMriVZidnDqmoB1xnS6siDUvd9/0Gh1iiT1w3L9+1JLk85mbDbJpI82LI8iJ?=
 =?us-ascii?q?UevVrZEiPrgEn2ibWZdkQg+uim8eTnZbDmq4eGOIBohQH+NaUuldGhDukjLg?=
 =?us-ascii?q?gPX3SU+eS71LH5+035W69Fguc5kqnerpDWPd4bqbKhAw9JzoYj7A6yDyy439?=
 =?us-ascii?q?QcnHkHKk9FeR2cgoj3NFHBPur4Ae28g1uyijdrwe7JPrn7DpXKNHjDn6/rfa?=
 =?us-ascii?q?xh5E5E1Aoz0ddf6opMCr4bPfLzXlT8tMTCAR8kNwy42uPnCNJ61oMER22DGL?=
 =?us-ascii?q?OWMKTXsQzA2uV6O+CRYKcNsSv5bv0i4OTjy3Q+nAwzZ66siLIecne+VtthIk?=
 =?us-ascii?q?mUZTK4i9wOFmYGsyIiXefqjxuESjcVaHGsCfFvrgonAZ6rWN+QDrumh6aMiW?=
 =?us-ascii?q?LmT5A=3D?=
X-IPAS-Result: =?us-ascii?q?A2A9BgDuzUJd/wHyM5BlHAEBAQQBAQcEAQGBZ4FuKi1AU?=
 =?us-ascii?q?jIqlBEWAQEBAQEBBoEyAYlmkR0JAQEBAQEBAQEBGwgRAQIBAYRAglYjOBMBA?=
 =?us-ascii?q?wEBAQQBAQEBBQEBbIUeDII6KYMgAUaBUYJXDD8BgXYUrWOFSIMngUiBNIcJh?=
 =?us-ascii?q?FcXeIEHgRGDUIJIgTaGKQSMFxGKC5RgCYIchlyNMwwbgi6CKYkNhiuECAGnN?=
 =?us-ascii?q?iGBWCsIAhgIIQ+DJwmCRReEUolrIwMwgQYBAYpbgkMBAQ?=
Received: from tarius.tycho.ncsc.mil ([144.51.242.1])
  by EMSM-GH1-UEA10.NCSC.MIL with ESMTP; 01 Aug 2019 11:35:16 +0000
Received: from moss-callisto.infosec.tycho.ncsc.mil (moss-callisto [192.168.25.136])
        by tarius.tycho.ncsc.mil (8.14.4/8.14.4) with ESMTP id x71BZGMv016606;
        Thu, 1 Aug 2019 07:35:16 -0400
From:   Aaron Goidel <acgoide@tycho.nsa.gov>
To:     paul@paul-moore.com
Cc:     selinux@vger.kernel.org, Aaron Goidel <acgoide@tycho.nsa.gov>
Subject: [PATCH] selinux-testsuite: add tests for fsnotify
Date:   Thu,  1 Aug 2019 07:35:14 -0400
Message-Id: <20190801113514.12922-1-acgoide@tycho.nsa.gov>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Added a suite to test permissions for setting inotify and fanotify watches
on filesystem objects. Tests watch, watch_with_perm, and watch_reads permissions.

Signed-off-by: Aaron Goidel <acgoide@tycho.nsa.gov>
---
 policy/Makefile              |   4 ++
 policy/test_notify.te        |  94 +++++++++++++++++++++++++
 tests/Makefile               |   4 ++
 tests/notify/Makefile        |   5 ++
 tests/notify/test            | 133 +++++++++++++++++++++++++++++++++++
 tests/notify/test_fanotify.c | 107 ++++++++++++++++++++++++++++
 tests/notify/test_inotify.c  |  43 +++++++++++
 7 files changed, 390 insertions(+)
 create mode 100644 policy/test_notify.te
 create mode 100644 tests/notify/Makefile
 create mode 100755 tests/notify/test
 create mode 100644 tests/notify/test_fanotify.c
 create mode 100644 tests/notify/test_inotify.c

diff --git a/policy/Makefile b/policy/Makefile
index 305b572..65f88c5 100644
--- a/policy/Makefile
+++ b/policy/Makefile
@@ -71,6 +71,10 @@ ifeq ($(shell grep -q corenet_sctp_bind_all_nodes $(POLDEV)/include/kernel/coren
 TARGETS += test_sctp.te
 endif
 
+ifeq ($(shell grep -q all_file_perms.*watch $(POLDEV)/include/support/all_perms.spt && echo true),true)
+TARGETS+=test_notify.te
+endif
+
 ifeq (x$(DISTRO),$(filter x$(DISTRO),xRHEL4 xRHEL5 xRHEL6))
 TARGETS:=$(filter-out test_overlayfs.te test_mqueue.te, $(TARGETS))
 endif
diff --git a/policy/test_notify.te b/policy/test_notify.te
new file mode 100644
index 0000000..0c665db
--- /dev/null
+++ b/policy/test_notify.te
@@ -0,0 +1,94 @@
+####################################################
+# Policy for testing inoftify and fanotify watches #
+####################################################
+
+attribute test_notify_domain;
+
+# Type for the file on which we want to set a watch
+type test_notify_file_t;
+files_type(test_notify_file_t);
+
+# Domain for the process which CAN set a non-permission watch
+type test_watch_t;
+domain_type(test_watch_t);
+unconfined_runs_test(test_watch_t);
+
+typeattribute test_watch_t test_notify_domain;
+typeattribute test_watch_t testdomain;
+
+allow test_notify_domain self:capability sys_admin;
+
+allow test_watch_t test_notify_file_t:file { read write open watch };
+
+# Domain for the process which CAN set a NON-access watch on a file
+type test_perm_watch_t;
+domain_type(test_perm_watch_t);
+unconfined_runs_test(test_perm_watch_t);
+
+typeattribute test_perm_watch_t test_notify_domain;
+typeattribute test_perm_watch_t testdomain;
+
+allow test_perm_watch_t test_notify_file_t:file { read write open watch watch_with_perm };
+
+# Domain which CAN set a NON-perm watch which MAY read accesses
+type test_read_watch_t;
+domain_type(test_read_watch_t);
+unconfined_runs_test(test_read_watch_t);
+
+typeattribute test_read_watch_t test_notify_domain;
+typeattribute test_read_watch_t testdomain;
+
+allow test_read_watch_t test_notify_file_t:file { read write open watch watch_reads };
+
+# Domain which CAN set any watch which CAN read accesses
+type test_perm_read_watch_t;
+domain_type(test_perm_read_watch_t);
+unconfined_runs_test(test_perm_read_watch_t);
+
+typeattribute test_perm_read_watch_t test_notify_domain;
+typeattribute test_perm_read_watch_t testdomain;
+
+allow test_perm_read_watch_t test_notify_file_t:file { read write open watch watch_with_perm watch_reads };
+
+# Domain which CANNOT set any watches
+type test_no_watch_t;
+domain_type(test_no_watch_t);
+unconfined_runs_test(test_no_watch_t);
+
+typeattribute test_no_watch_t test_notify_domain;
+typeattribute test_no_watch_t testdomain;
+
+allow test_no_watch_t test_notify_file_t:file { read write open };
+
+# Domain which allows for mount watches
+type test_mount_watch_t;
+domain_type(test_mount_watch_t);
+unconfined_runs_test(test_mount_watch_t);
+
+typeattribute test_mount_watch_t test_notify_domain;
+typeattribute test_mount_watch_t testdomain;
+
+allow test_mount_watch_t test_notify_file_t:dir { read write open watch_mount };
+
+# Domain which allows for mount perm watches
+type test_mount_perm_t;
+domain_type(test_mount_perm_t);
+unconfined_runs_test(test_mount_perm_t);
+
+typeattribute test_mount_perm_t test_notify_domain;
+typeattribute test_mount_perm_t testdomain;
+
+allow test_mount_perm_t test_notify_file_t:dir { read write open watch_mount watch_with_perm };
+
+# Domain which has no write access but can watch
+type test_rdonly_t;
+domain_type(test_rdonly_t);
+unconfined_runs_test(test_rdonly_t);
+
+typeattribute test_rdonly_t test_notify_domain;
+typeattribute test_rdonly_t testdomain;
+
+allow test_rdonly_t test_notify_file_t:dir { read open watch };
+
+miscfiles_domain_entry_test_files(test_notify_domain);
+userdom_sysadm_entry_spec_domtrans_to(test_notify_domain);
diff --git a/tests/Makefile b/tests/Makefile
index 63aa325..b99c96e 100644
--- a/tests/Makefile
+++ b/tests/Makefile
@@ -50,6 +50,10 @@ ifeq ($(shell grep "^SELINUX_INFINIBAND_PKEY_TEST=" infiniband_pkey/ibpkey_test.
 SUBDIRS += infiniband_pkey
 endif
 
+ifeq ($(shell grep -q all_file_perms.*watch $(POLDEV)/include/support/all_perms.spt && echo true),true)
+SUBDIRS+=notify
+endif
+
 ifeq ($(DISTRO),RHEL4)
     SUBDIRS:=$(filter-out bounds dyntrace dyntrans inet_socket mmap nnp_nosuid overlay unix_socket, $(SUBDIRS))
 endif
diff --git a/tests/notify/Makefile b/tests/notify/Makefile
new file mode 100644
index 0000000..78c4b3b
--- /dev/null
+++ b/tests/notify/Makefile
@@ -0,0 +1,5 @@
+TARGETS=test_inotify test_fanotify
+
+all: $(TARGETS)
+clean: 
+	rm -f $(TARGETS)
diff --git a/tests/notify/test b/tests/notify/test
new file mode 100755
index 0000000..77db8c2
--- /dev/null
+++ b/tests/notify/test
@@ -0,0 +1,133 @@
+#!/usr/bin/perl
+
+use Test;
+BEGIN { plan tests => 18 }    # number of tests to run
+
+# help the test script locate itself
+$basedir = $0;
+$basedir =~ s|(.*)/[^/]*|$1|;
+
+# Get rid of a testfile and dir from last run if it's there (just in case)
+system("rm -f $basedir/watch_me");
+system("rm -rf $basedir/watch_dir");
+
+# Create a new test file
+system("touch $basedir/watch_me");
+system("chcon -t test_notify_file_t $basedir/watch_me");
+
+# Create test dir
+system("mkdir $basedir/watch_dir");
+system("chcon -t test_notify_file_t $basedir/watch_dir");
+
+## TESTS
+
+## TEST BASIC WATCH PERMISSION
+# Should be able to set inotify watch
+$exit_val =
+  system("runcon -t test_watch_t $basedir/test_inotify $basedir/watch_me 2>&1");
+ok( $exit_val, 0 );
+
+# Should be able to set non-permissions based fanotify watch
+$exit_val = system(
+    "runcon -t test_watch_t $basedir/test_fanotify $basedir/watch_me 2>&1");
+ok( $exit_val, 0 );
+
+# Should NOT be able to set permission based fanotify watch
+$exit_val = system(
+    "runcon -t test_watch_t $basedir/test_fanotify -p $basedir/watch_me 2>&1");
+ok($exit_val);    # this should fail
+
+# Should NOT be able to set read based fanotify watch
+$exit_val = system(
+    "runcon -t test_watch_t $basedir/test_fanotify -r $basedir/watch_me 2>&1");
+ok($exit_val);    # this should fail
+
+# Should NOT be able to set read based inotify watch
+$exit_val = system(
+    "runcon -t test_watch_t $basedir/test_inotify -r $basedir/watch_me 2>&1");
+ok($exit_val);    # this should fail
+
+## TEST PERM WATCH
+# Should be able to set permission based fanotify watch
+$exit_val = system(
+"runcon -t test_perm_watch_t $basedir/test_fanotify -p $basedir/watch_me 2>&1"
+);
+ok( $exit_val, 0 );
+
+# Should NOT be able to set watch of accesses
+$exit_val = system(
+"runcon -t test_perm_watch_t $basedir/test_fanotify -r $basedir/watch_me 2>&1"
+);
+ok($exit_val);    # this should fail
+
+## TEST READ NO PERM WATCH PERMSISSIONS
+# Should NOT be able to set read and perm watch
+$exit_val = system(
+"runcon -t test_read_watch_t $basedir/test_fanotify -p -r $basedir/watch_me 2>&1"
+);
+ok($exit_val);    # should fail
+
+# Should be able to set read inotify watch
+$exit_val = system(
+"runcon -t test_read_watch_t $basedir/test_inotify -r $basedir/watch_me 2>&1"
+);
+ok( $exit_val, 0 );
+
+## TEST READ WITH PERM WATCH PERMSISSIONS
+# Should be able to set read and perm watch
+$exit_val = system(
+"runcon -t test_perm_read_watch_t $basedir/test_fanotify -p -r $basedir/watch_me 2>&1"
+);
+ok( $exit_val, 0 );
+
+## TEST NO WATCH PERMSISSIONS
+# Should NOT be able to set inotify watch
+$exit_val = system(
+    "runcon -t test_no_watch_t $basedir/test_inotify $basedir/watch_me 2>&1");
+ok($exit_val);    # this should fail
+
+# Should NOT be able to set any fanotify watch
+$exit_val = system(
+    "runcon -t test_no_watch_t $basedir/test_fanotify $basedir/watch_me 2>&1");
+ok($exit_val);    # this should fail
+
+## TEST READ ONLY
+# Should NOT be able to get read-write descriptor
+$exit_val = system(
+    "runcon -t test_rdonly_t $basedir/test_fanotify -l $basedir/watch_me 2>&1");
+ok($exit_val);    # this should fail
+
+# Should be able to get read-write descriptor
+$exit_val = system(
+    "runcon -t test_watch_t $basedir/test_fanotify -l $basedir/watch_me 2>&1");
+ok( $exit_val, 0 );
+
+## TEST MOUNT WATCHES
+# Should NOT be able to set a watch on a mount point
+$exit_val = system(
+    "runcon -t test_watch_t $basedir/test_fanotify -m $basedir/watch_dir 2>&1");
+ok($exit_val);    # this should fail
+
+# Should be able to set a watch on mount point
+$exit_val = system(
+"runcon -t test_mount_watch_t $basedir/test_fanotify -m $basedir/watch_dir 2>&1"
+);
+ok( $exit_val, 0 );
+
+# Should NOT be able to set a perm watch on a mount
+$exit_val = system(
+"runcon -t test_mount_watch_t $basedir/test_fanotify -m -p $basedir/watch_dir 2>&1"
+);
+ok($exit_val);    # this should fail
+
+# Should be able to set a perm watch on a mount object
+$exit_val = system(
+"runcon -t test_mount_perm_t $basedir/test_fanotify -p -m $basedir/watch_dir 2>&1"
+);
+ok( $exit_val, 0 );
+
+# Clean up test file
+system("rm -f $basedir/watch_me");
+
+# Clean up test dir
+system("rm -rf $basedir/watch_dir");
diff --git a/tests/notify/test_fanotify.c b/tests/notify/test_fanotify.c
new file mode 100644
index 0000000..b94ee77
--- /dev/null
+++ b/tests/notify/test_fanotify.c
@@ -0,0 +1,107 @@
+#define _GNU_SOURCE 1
+
+#include <stdio.h>
+#include <stdlib.h>
+
+#include <getopt.h>
+
+#include <fcntl.h>
+#include <poll.h>
+#include <sys/fanotify.h>
+#include <unistd.h>
+
+void printUsage() {
+  fprintf(stderr, "Usage: test_fanotify [-p] [-r] [-l] [-m] file_name\n");
+  exit(1);
+}
+
+int main(int argc, char *argv[]) {
+  if (argc < 2) {
+    printUsage();
+  }
+
+  int fd, ret, arg;
+  int mask = FAN_OPEN;  // default mask
+  int flags = FAN_MARK_ADD;
+  int listening = 0;
+
+  // the -p flag will test for watch_with_perm
+  // the mask used at mark will contain FAN_OPEN_PERM
+  //
+  // the -r flag will test for watching accesses to files for reads
+  // the mask will contain FAN_ACCESS
+  while ((arg = getopt(argc, argv, "prlm")) != -1) {
+    switch (arg) {
+      case 'p':
+        mask |= FAN_OPEN_PERM;
+        break;
+      case 'r':
+        mask |= FAN_ACCESS;
+        break;
+      case 'l':
+        listening = 1;
+        break;
+      case 'm':
+        flags |= FAN_MARK_MOUNT;
+        break;
+      default:
+        printUsage();
+    }
+  }
+
+  // get file descriptor for new fanotify event queue
+  fd = fanotify_init(FAN_CLASS_CONTENT, O_RDWR);
+  if (fd < 0) {
+    perror("fanotify_init:bad file descriptor");
+    exit(1);
+  }
+
+  // mark a filesystem object and add mark to event queue
+  // get notifications on file opens, accesses, and closes
+  // use current working directory as base dir
+  ret = fanotify_mark(fd, flags, mask, AT_FDCWD, argv[optind]);
+
+  if (ret < 0) {
+    perror("test_fanotify:watch denied");
+    exit(1);
+  }
+
+  // logic to actually listen for an event if the -l flag is passed
+  // this is used to test if an app with read-only access can get a read/write
+  // handle to the watched file
+  if (listening) {
+    if (fork() == 0) {  // fork a child process to cause an event on the file
+      FILE *f;
+
+      f = fopen(argv[optind], "r");  // open file for reading
+      fgetc(f);                      // read char from file
+
+      fclose(f);
+    } else {  // logic to watch for events and try to access file read/write
+      struct pollfd fds;
+      fds.fd = fd;
+      fds.events = POLLIN;
+
+      while (listening) {
+        int polled = poll(&fds, 1, 1);
+        if (polled > 0) {
+          if (fds.revents & POLLIN) {
+            struct fanotify_event_metadata buff[200];
+
+            size_t len = read(fd, (void *)&buff, sizeof(buff));
+            if (len == -1) {
+              perror("test_fanotify:can't open file");
+              exit(1);
+            } else {
+              listening = 0;
+              break;
+            }
+          }
+        } else if (polled == -1) {
+          listening = 0;
+        }
+      }
+    }
+  }
+  exit(0);
+}
diff --git a/tests/notify/test_inotify.c b/tests/notify/test_inotify.c
new file mode 100644
index 0000000..17c3565
--- /dev/null
+++ b/tests/notify/test_inotify.c
@@ -0,0 +1,43 @@
+#include <stdio.h>
+#include <stdlib.h>
+#include <sys/inotify.h>
+#include <getopt.h>
+
+int main(int argc, char *argv[])
+{
+	if (argc < 2) {
+		fprintf(stderr, "Usage: test_inotify [-r] file_name\n");
+		exit(1);
+	}
+
+	int fd, wd, arg;
+	int mask = IN_MODIFY;
+
+	while ((arg = getopt(argc, argv, "pr")) != -1) {
+		switch (arg) {
+		case 'r':
+			mask |= IN_ACCESS;
+			break;
+		default:
+			fprintf(stderr, "Usage: test_inotify [-r] file_name\n");
+			exit(1);
+		}
+	}
+
+	// get new file descriptor for inotify access
+	fd = inotify_init();
+	if (fd < 0) {
+		perror("inotify_init:bad file descriptor");
+		exit(1);
+	}
+
+	// set watch on file and get watch descriptor for accessing events on it
+	wd = inotify_add_watch(fd, argv[optind], mask);
+
+	if (wd < 0) {
+		perror("test_inotify:watch denied");
+		exit(1);
+	}
+
+	exit(0);
+}
-- 
2.21.0

