Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 18D9418BAD6
	for <lists+selinux@lfdr.de>; Thu, 19 Mar 2020 16:20:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727222AbgCSPUD (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Thu, 19 Mar 2020 11:20:03 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:42789 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727001AbgCSPUD (ORCPT
        <rfc822;selinux@vger.kernel.org>); Thu, 19 Mar 2020 11:20:03 -0400
Received: by mail-qt1-f195.google.com with SMTP id g16so2083624qtp.9
        for <selinux@vger.kernel.org>; Thu, 19 Mar 2020 08:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=crunchydata-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nGB7bofuXmjSzCkO8nVZ+Afpxr1G4Vzm7C+BLXS7AGE=;
        b=Ti9L/zBSMmGr0ePmRC8e1imnCZca2jf+bzyM6UKnbrUe/0+fssrgcksHCcwrS9rJZ5
         hh4y43QSobvtb97aKljGlgd6Vy7Ug1S6lGgelbyvD7WY9CxZC5FE+Zhq5nFUXfK4vle6
         MbyEiMP3fbg8sLioPvyJsGBr16SYWWLvMcjUiUCrhJ9mfVV91M412AhGf0B20Tj4bPBc
         SZ+aVJd+oS3fs1KxVZmtvwzXWs+Vkv5rMRHWn4CBTpJfv3qE2Gc3xAErzsT4lyl161gK
         /lD/3IF7o3T3qkSYvVwoSLj8xzNH+un3MIchq6mZ0fiENG/Rnb1BaQiZVh52HsR3Fvud
         0lNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nGB7bofuXmjSzCkO8nVZ+Afpxr1G4Vzm7C+BLXS7AGE=;
        b=I3DBy90ZELdzO+NI6tzy6Z495EdskMwzIazioNsxfjwcC2wZQUI0DMHCwYTsUBg7Rv
         jz4O+orZJ5ra3l6SrZ3+zSJ5xPJQs4h/HmgPni9/fvB/e36JeuUlHyaajYbm+r5rsuAC
         Id0+JW5ufWHyt19MAb/Keds6rUAVdgvg4tAw4gHYAZBtUuWbfTNcBqWaRkb6RKzDpoSD
         WZhMH6X6+6h/rqsobCGHMOkfKPHDsGpi5yFecBlizpqvEx1uCtwmdKktt8MGZMbFEOUk
         rIn596XR2RtAw5bBB/iEkJ/ctn3eDGIZToIU0XqzKklOPZUwQzE98iNiVFwIu4CTO746
         IKhw==
X-Gm-Message-State: ANhLgQ1FGWVAkJAI44BKfL9NqTTdG4G3ZzUKv+LFW3dKcz39YW82GOC3
        6hRA1H8/AY3XJm+8lFWRR+T8fZRSPrU=
X-Google-Smtp-Source: ADFU+vtpZlDjCI8ganaBD3vEZwmc7hvMEfrmL5HaWrUwGhREBoQxyjNmDK6SGaSucPtyEV7IewjxGw==
X-Received: by 2002:ac8:17f9:: with SMTP id r54mr3419757qtk.285.1584631200875;
        Thu, 19 Mar 2020 08:20:00 -0700 (PDT)
Received: from fedora30.localdomain (pool-71-121-242-40.bltmmd.fios.verizon.net. [71.121.242.40])
        by smtp.gmail.com with ESMTPSA id w21sm1637784qkf.60.2020.03.19.08.20.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2020 08:20:00 -0700 (PDT)
From:   Joshua Brindle <joshua.brindle@crunchydata.com>
To:     selinux@vger.kernel.org
Cc:     paul@paul-moore.com, stephen.smalley.work@gmail.com,
        omosnace@redhat.com,
        Joshua Brindle <joshua.brindle@crunchydata.com>
Subject: [PATCH v4] Add tests for default_range glblub
Date:   Thu, 19 Mar 2020 08:19:49 -0700
Message-Id: <20200319151948.15747-1-joshua.brindle@crunchydata.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

selinux-testsuite adds test for default_range glblub
which can only be inserted into the policy via cil, so add
CIL_TARGETS to policy and an attempt to detect whether the policy is MCS,
meaning it only has 1 sensitivity and more need to be added, or MLS
and therefore fine to test on.

Signed-off-by: Joshua Brindle <joshua.brindle@crunchydata.com>
---
 policy/Makefile              | 15 ++++++--
 policy/test_add_levels.cil   | 34 ++++++++++++++++++
 policy/test_glblub.cil       |  4 +++
 tests/Makefile               | 19 ++++++++--
 tests/glblub/.gitignore      |  1 +
 tests/glblub/Makefile        |  7 ++++
 tests/glblub/default_range.c | 66 +++++++++++++++++++++++++++++++++++
 tests/glblub/test            | 67 ++++++++++++++++++++++++++++++++++++
 tests/pol_detect             | 17 +++++++++
 9 files changed, 226 insertions(+), 4 deletions(-)
 create mode 100644 policy/test_add_levels.cil
 create mode 100644 policy/test_glblub.cil
 create mode 100644 tests/glblub/.gitignore
 create mode 100644 tests/glblub/Makefile
 create mode 100644 tests/glblub/default_range.c
 create mode 100755 tests/glblub/test
 create mode 100755 tests/pol_detect

diff --git a/policy/Makefile b/policy/Makefile
index cf8d431..dfe601b 100644
--- a/policy/Makefile
+++ b/policy/Makefile
@@ -13,6 +13,7 @@ DISTRO=$(shell ../tests/os_detect)
 POL_VERS := $(shell $(CHECKPOLICY) -V |cut -f 1 -d ' ')
 MOD_POL_VERS := $(shell $(CHECKMODULE) -V |cut -f 2 -d '-')
 MAX_KERNEL_POLICY := $(shell cat $(SELINUXFS)/policyvers)
+POL_TYPE := $(shell ../tests/pol_detect $(SELINUXFS))
 
 TARGETS = \
 	test_global.te test_capable_file.te test_capable_net.te \
@@ -29,6 +30,16 @@ TARGETS = \
 	test_mmap.te test_overlayfs.te test_mqueue.te \
 	test_ibpkey.te test_atsecure.te test_cgroupfs.te
 
+
+ifeq ($(shell [[ $(MAX_KERNEL_POLICY) -ge 32 && $(POL_VERS) -ge 32 ]] && echo true),true)
+# If other MLS tests get written this can be moved outside of the glblub test
+ifeq ($(POL_TYPE), MLS)
+CIL_TARGETS = test_glblub.cil
+else ifeq ($(POL_TYPE), MCS)
+CIL_TARGETS = test_add_levels.cil test_glblub.cil
+endif
+endif # GLBLUB
+
 ifeq ($(shell [ $(POL_VERS) -ge 24 ] && echo true),true)
 TARGETS += test_bounds.te test_nnp_nosuid.te
 endif
@@ -151,12 +162,12 @@ build: $(TARGETS)
 load: expand_check all
 	# General policy load
 	@-/usr/sbin/setsebool allow_domain_fd_use=0
-	$(SEMODULE) -i test_policy/test_policy.pp
+	$(SEMODULE) -i test_policy/test_policy.pp $(CIL_TARGETS)
 
 unload:
 	# General policy unload
 	@-/usr/sbin/setsebool allow_domain_fd_use=1
-	$(SEMODULE) -r test_policy
+	$(SEMODULE) -r test_policy $(subst .cil,,$(CIL_TARGETS))
 
 clean:
 	rm -rf test_policy tmp
diff --git a/policy/test_add_levels.cil b/policy/test_add_levels.cil
new file mode 100644
index 0000000..374e970
--- /dev/null
+++ b/policy/test_add_levels.cil
@@ -0,0 +1,34 @@
+(sensitivity s1)
+(sensitivitycategory s1 (range c0 c1023))
+(sensitivity s2)
+(sensitivitycategory s2 (range c0 c1023))
+(sensitivity s3)
+(sensitivitycategory s3 (range c0 c1023))
+(sensitivity s4)
+(sensitivitycategory s4 (range c0 c1023))
+(sensitivity s5)
+(sensitivitycategory s5 (range c0 c1023))
+(sensitivity s6)
+(sensitivitycategory s6 (range c0 c1023))
+(sensitivity s7)
+(sensitivitycategory s7 (range c0 c1023))
+(sensitivity s8)
+(sensitivitycategory s8 (range c0 c1023))
+(sensitivity s9)
+(sensitivitycategory s9 (range c0 c1023))
+(sensitivity s10)
+(sensitivitycategory s10 (range c0 c1023))
+(sensitivity s11)
+(sensitivitycategory s11 (range c0 c1023))
+(sensitivity s12)
+(sensitivitycategory s12 (range c0 c1023))
+(sensitivity s13)
+(sensitivitycategory s13 (range c0 c1023))
+(sensitivity s14)
+(sensitivitycategory s14 (range c0 c1023))
+(sensitivity s15)
+(sensitivitycategory s15 (range c0 c1023))
+(sensitivityorder (s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15))
+
+(selinuxuser system_u system_u ((s0) (s15 (range c0 c1023))))
+(userrange system_u ((s0) (s15 (range c0 c1023))))
diff --git a/policy/test_glblub.cil b/policy/test_glblub.cil
new file mode 100644
index 0000000..b1b81da
--- /dev/null
+++ b/policy/test_glblub.cil
@@ -0,0 +1,4 @@
+(defaultrange db_table glblub)
+
+(class new_class_no_default_range (foobar))
+(classorder (unordered new_class_no_default_range))
diff --git a/tests/Makefile b/tests/Makefile
index 46a1641..5b86a2b 100644
--- a/tests/Makefile
+++ b/tests/Makefile
@@ -1,10 +1,21 @@
-INCLUDEDIR ?= /usr/include
-POLDEV ?= /usr/share/selinux/devel
+PREFIX ?= /usr
+BINDIR ?= $(PREFIX)/bin
+SBINDIR ?= $(PREFIX)/sbin
+POLDEV ?= $(PREFIX)/share/selinux/devel
+INCLUDEDIR ?= $(PREFIX)/include
 SELINUXFS ?= /sys/fs/selinux
 
 export CFLAGS+=-g -O0 -Wall -D_GNU_SOURCE
 
 DISTRO=$(shell ./os_detect)
+SELINUXFS := $(shell cat /proc/mounts | grep selinuxfs | cut -f 2 -d ' ')
+CHECKPOLICY = $(BINDIR)/checkpolicy
+CHECKMODULE = $(BINDIR)/checkmodule
+
+POL_VERS := $(shell $(CHECKPOLICY) -V |cut -f 1 -d ' ')
+MOD_POL_VERS := $(shell $(CHECKMODULE) -V |cut -f 2 -d '-')
+MAX_KERNEL_POLICY := $(shell cat $(SELINUXFS)/policyvers)
+POL_TYPE := $(shell ./pol_detect $(SELINUXFS))
 
 SUBDIRS:= domain_trans entrypoint execshare exectrace execute_no_trans \
 	fdreceive inherit link mkdir msg open ptrace readlink relabel rename \
@@ -57,6 +68,10 @@ ifeq ($(shell grep -q key_socket $(POLDEV)/include/support/all_perms.spt && test
 SUBDIRS += key_socket
 endif
 
+ifeq ($(shell [[ $(MAX_KERNEL_POLICY) -ge 32 && ( $(POL_TYPE) == 'MLS' || $(POL_TYPE) == 'MCS' ) && $(POL_VERS) -ge 32 ]]  && echo true),true)
+SUBDIRS += glblub
+endif
+
 ifeq ($(shell grep "^SELINUX_INFINIBAND_ENDPORT_TEST=" infiniband_endport/ibendport_test.conf | cut -d'=' -f 2),1)
 SUBDIRS += infiniband_endport
 endif
diff --git a/tests/glblub/.gitignore b/tests/glblub/.gitignore
new file mode 100644
index 0000000..25354b2
--- /dev/null
+++ b/tests/glblub/.gitignore
@@ -0,0 +1 @@
+default_range
diff --git a/tests/glblub/Makefile b/tests/glblub/Makefile
new file mode 100644
index 0000000..bd22df2
--- /dev/null
+++ b/tests/glblub/Makefile
@@ -0,0 +1,7 @@
+TARGETS=default_range
+
+LDLIBS += -lselinux
+
+all: $(TARGETS)
+clean:
+	rm -f $(TARGETS)
diff --git a/tests/glblub/default_range.c b/tests/glblub/default_range.c
new file mode 100644
index 0000000..ac70d4f
--- /dev/null
+++ b/tests/glblub/default_range.c
@@ -0,0 +1,66 @@
+#include <unistd.h>
+#include <sys/types.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <errno.h>
+#include <selinux/selinux.h>
+
+void run_test(const char *c1, const char *c2, security_class_t tclass,
+	      const char *exp_con)
+{
+	char *buf = NULL;
+	int ret;
+
+	ret = security_compute_create(c1, c2, tclass, &buf);
+	if (ret < 0) {
+		exit(3);
+	}
+
+	if (exp_con == NULL && buf == NULL) {
+		return;
+	}
+
+	if (exp_con == NULL && buf != NULL) {
+		fprintf(stderr, "expected NULL, got %s\n", buf);
+		freecon(buf);
+		exit(3);
+	}
+
+	if (exp_con != NULL && buf == NULL) {
+		fprintf(stderr, "expected %s, got NULL\n", exp_con);
+		exit(3);
+	}
+
+	if (strcmp(buf, exp_con)) {
+		fprintf(stderr, "%s did not match expected %s\n", buf, exp_con);
+		exit(3);
+	}
+
+	freecon(buf);
+
+}
+
+int main(int argc, const char **argv)
+{
+	security_class_t tclass;
+	const char *exp_con;
+
+	if (argc != 4 && argc != 5) {
+		fprintf(stderr, "Usage %s <source> <target> <class> [expected]\n", argv[0]);
+		exit(1);
+	}
+
+	if (argc == 4) exp_con = NULL;
+	else exp_con = argv[4];
+
+	tclass = string_to_security_class(argv[3]);
+	if (!tclass) {
+		fprintf(stderr, "Invalid class '%s'\n", argv[3]);
+		exit(1);
+	}
+
+	run_test(argv[1], argv[2], tclass, exp_con);
+
+	exit(EXIT_SUCCESS);
+}
diff --git a/tests/glblub/test b/tests/glblub/test
new file mode 100755
index 0000000..212fef6
--- /dev/null
+++ b/tests/glblub/test
@@ -0,0 +1,67 @@
+#!/usr/bin/perl
+
+use Test;
+BEGIN { plan tests => 9 }
+
+$basedir = $0;
+$basedir =~ s|(.*)/[^/]*|$1|;
+
+sub run_test {
+    my ( $src, $tgt, $objclass, $res ) = @_;
+    my $con = "system_u:object_r:kernel_t";
+
+    my $result =
+      system("$basedir/default_range $con:$src $con:$tgt $objclass $con:$res");
+
+    ok( $result, 0 );
+}
+
+sub run_test_fail {
+    my ( $src, $tgt ) = @_;
+    my $con = "system_u:object_r:kernel_t";
+
+    my $result = system("$basedir/default_range $con:$src $con:$tgt db_table");
+
+    ok( $result >> 8, 3 );
+}
+
+# Verify glblub range_transition behavior
+run_test(
+    "s0:c0.c100-s10:c0.c150", "s5:c50.c100-s15:c0.c149",
+    "db_table",               "s5:c50.c100-s10:c0.c149"
+);
+
+run_test(
+    "s5:c50.c100-s15:c0.c149", "s0:c0.c100-s10:c0.c150",
+    "db_table",                "s5:c50.c100-s10:c0.c149"
+);
+
+run_test( "s0:c0.c100-s10:c0.c150", "s0", "db_table", "s0" );
+
+run_test(
+    "s5:c512.c550,c552.c1023-s5:c0.c550,c552.c1023",
+    "s5:c512.c550,c553.c1023-s5:c0,c1,c4,c5,c6,c512.c550,c553.c1023",
+    "db_table",
+    "s5:c512.c550,c553.c1023-s5:c0,c1,c4.c6,c512.c550,c553.c1023"
+);
+
+run_test( "s5:c50.c100-s15:c0.c149",
+    "s5:c512.c550,c552.c1023-s5:c0.c550,c552.c1023",
+    "db_table", "s5-s5:c0.c149" );
+
+# Verify incompatible contexts
+run_test_fail( "s5:c50.c100-s15:c0.c149", "s4-s4:c0.c1023" );
+
+run_test_fail( "s4-s4:c0.c1023", "s5:c50.c100-s15:c0.c149" );
+
+# Verify default (source-low) behavior
+run_test(
+    "s0:c0.c100-s10:c0.c150",     "s5:c50.c100-s15:c0.c149",
+    "new_class_no_default_range", "s0:c0.c100"
+);
+
+run_test(
+    "s5:c50.c100-s15:c0.c149",    "s0:c0.c100-s10:c0.c150",
+    "new_class_no_default_range", "s5:c50.c100"
+);
+
diff --git a/tests/pol_detect b/tests/pol_detect
new file mode 100755
index 0000000..ba25b94
--- /dev/null
+++ b/tests/pol_detect
@@ -0,0 +1,17 @@
+#!/bin/bash
+
+if [ $# -ne 1 ]; then
+	echo "Usage $0 <selinuxfs directory>"
+	exit 1
+fi
+
+# This is heuristic but seems unlikely to be wrong,
+# the kernel initial sid should always be SystemHigh
+# and SystemHigh is normally s15
+level=$(cat $1/initial_contexts/kernel | tr '\0' '\n' | cut -d: -f4)
+
+if [ -z $level ]; then echo "NON-MLS"
+elif [ $level = 's0' ]; then echo "MCS"
+elif [ $level = 's15' ]; then echo "MLS"
+else echo "UNKNOWN"
+fi
-- 
2.21.1

