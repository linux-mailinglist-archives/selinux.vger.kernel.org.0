Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C4391118CC0
	for <lists+selinux@lfdr.de>; Tue, 10 Dec 2019 16:39:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727440AbfLJPjj (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Tue, 10 Dec 2019 10:39:39 -0500
Received: from USAT19PA25.eemsg.mail.mil ([214.24.22.199]:21712 "EHLO
        USAT19PA25.eemsg.mail.mil" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727178AbfLJPji (ORCPT
        <rfc822;selinux@vger.kernel.org>); Tue, 10 Dec 2019 10:39:38 -0500
X-EEMSG-check-017: 59122756|USAT19PA25_ESA_OUT06.csd.disa.mil
X-IronPort-AV: E=Sophos;i="5.69,300,1571702400"; 
   d="scan'208";a="59122756"
Received: from emsm-gh1-uea10.ncsc.mil ([214.29.60.2])
  by USAT19PA25.eemsg.mail.mil with ESMTP/TLS/DHE-RSA-AES256-SHA256; 10 Dec 2019 15:39:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tycho.nsa.gov; i=@tycho.nsa.gov; q=dns/txt;
  s=tycho.nsa.gov; t=1575992377; x=1607528377;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=C0k2fDQjciYtATHxa5HPUcuzVaBkEaRhjEeQlX8pHL4=;
  b=EiRnUjNNbaI8U/zvUbL43XH89YBodtSIrQ/dlKHcg/JFHF5Wl/IPziQd
   BL8J8CEusEWZdNdXV1x2T1E0q3BL8LqSK8o6k8Jp+jIwTNrtMwW6sPK1Q
   lFmtYokZZcFc4H/g6vhoHmJvr2c7YtLc4XtXSK4tBNCY5EBkygP19pL+s
   mYnFooExBWfkJCXovrb/y6YZ7mvcQgOXSiNmUcoYVqtcHP5AnktVACoYB
   Tc/prb6Yxcdoab48BpUXMZ3rVNNrUIy5Q0QpkwrBA6H1LoZUDi2EGuvBa
   xqCC3cqMpPQlDUaTKOGyGnMZV72ffCRYX2PkqNn9OoWAijtFwIXaXvQyo
   w==;
X-IronPort-AV: E=Sophos;i="5.69,300,1571702400"; 
   d="scan'208";a="30943823"
IronPort-PHdr: =?us-ascii?q?9a23=3AUtkgyBEF5aTTTao9LZnUa51GYnF86YWxBRYc79?=
 =?us-ascii?q?8ds5kLTJ7zpsWwAkXT6L1XgUPTWs2DsrQY0rGQ6vG7EjNfqb+681k6OKRWUB?=
 =?us-ascii?q?EEjchE1ycBO+WiTXPBEfjxciYhF95DXlI2t1uyMExSBdqsLwaK+i764jEdAA?=
 =?us-ascii?q?jwOhRoLerpBIHSk9631+ev8JHPfglEnjWwba58IRmssAncsscbjYRgJ6sz1x?=
 =?us-ascii?q?DEvmZGd+NKyG1yOFmdhQz85sC+/J5i9yRfpfcs/NNeXKv5Yqo1U6VWACwpPG?=
 =?us-ascii?q?4p6sLrswLDTRaU6XsHTmoWiBtIDBPb4xz8Q5z8rzH1tut52CmdIM32UbU5Ui?=
 =?us-ascii?q?ms4qt3VBPljjoMODAj8GHTl8d+kqRVrhy8rBB72oLZYIWYOP94c6jAf90VWH?=
 =?us-ascii?q?BBU95RWSJfH42yYYgBAe0OMuhXtITxu1gDoAGiCQS2GO/j1jlFjWL2060g1O?=
 =?us-ascii?q?QhFBnL0hE8H90QqHTUrMv6NKEPWu6oyanH1zHDb/dI1jb99YPFdQshruyXXb?=
 =?us-ascii?q?9rbcrQyVUgFwPCjlmKr4zlJCma2v4Cs2ic8eptTOSigHMkpQFpujWj28ghh4?=
 =?us-ascii?q?bTio8V11zI7zt1zYkrKdGiVUJ2Z8OvHoFKuCGALYR2R9svQ2RvuCkn1LILoY?=
 =?us-ascii?q?W7fC0WyJQ/wB7fduCHf5CI4h39UOaRJi91hG5/d7Klhhay7FOgxvf9Vsmy3l?=
 =?us-ascii?q?ZKqTFFncfQuXwXyxzS6tSISvt6/ku73zaAyxvT5f1eLUAxlKrbL4Ytwr82lp?=
 =?us-ascii?q?UNrUTOBjL6lUr5gaOMdkgo5/Kk5/rob7n4vJOQKpd4igTkPaQvnsy/D/44Mg?=
 =?us-ascii?q?8LX2WD4uSzyabj8FblQLRKkvI2kq7ZvIrcJcQAvKG1GQBV0oE96xqnFTepzM?=
 =?us-ascii?q?wYnWUbLFJCYB+Hl5LmO0zKIP3jFfewmUmskDNyy/DDOb3hBY/NIWbZnLj9er?=
 =?us-ascii?q?Z97lZWyBAvwtBH+5JUFrYBLeroWkDvsNzYDxk5MxG7wuv8FtV92Z0RWXiVDq?=
 =?us-ascii?q?+aLqzSq1mI6fwrI+WWY48Vojn9eLAZ4Kv1gHs4n0INVbem0IFRa32iGPliZU?=
 =?us-ascii?q?KDbinCmNAERFwWsxI+Qeqis1iLVTpedj7mRK4nzi0qA4KhS4HYT8aih6LXj3?=
 =?us-ascii?q?TzJYFfem0TUgPEKnzvbYjRHqpdZQ=3D=3D?=
X-IPAS-Result: =?us-ascii?q?A2BMAABcu+9d/wHyM5BlHAEBAQEBBwEBEQEEBAEBgWsGA?=
 =?us-ascii?q?QELAQGBcoFtIBIqjQaSEo9LgXsJAQEBAQEBAQEBGxwBAYRAgik1CA4CEAEBA?=
 =?us-ascii?q?QQBAQEBAQUDAQFshUNCAQwBgWspgzMBRoFRgmM/glMlryqFT4M6gUiBNgGHP?=
 =?us-ascii?q?oRzeYEHgUeDG4o3BI0hiiF2liyCOYI7kykMG4JCjDeLP5APmmgCNYFYKwgCG?=
 =?us-ascii?q?AghD4MnUBEUm0ojAzCIOIZzAQE?=
Received: from tarius.tycho.ncsc.mil (HELO tarius.infosec.tycho.ncsc.mil) ([144.51.242.1])
  by EMSM-GH1-UEA10.NCSC.MIL with ESMTP; 10 Dec 2019 15:39:36 +0000
Received: from moss-pluto.infosec.tycho.ncsc.mil (moss-pluto [192.168.25.131])
        by tarius.infosec.tycho.ncsc.mil (8.14.7/8.14.4) with ESMTP id xBAFdLpa022606;
        Tue, 10 Dec 2019 10:39:22 -0500
From:   Stephen Smalley <sds@tycho.nsa.gov>
To:     selinux@vger.kernel.org
Cc:     paul@paul-moore.com, Stephen Smalley <sds@tycho.nsa.gov>
Subject: [PATCH v4] selinux-testsuite: add lockdown tests
Date:   Tue, 10 Dec 2019 10:39:45 -0500
Message-Id: <20191210153945.20635-1-sds@tycho.nsa.gov>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Test all permissions associated with the lockdown class.
Also update other test policies to allow lockdown permissions
where needed.

Signed-off-by: Stephen Smalley <sds@tycho.nsa.gov>
---
 policy/Makefile            |  5 ++++
 policy/test_global.te      |  8 ++++++
 policy/test_lockdown.te    | 54 ++++++++++++++++++++++++++++++++++++++
 policy/test_module_load.te |  2 ++
 policy/test_perf_event.te  |  5 ++++
 tests/Makefile             |  4 +++
 tests/lockdown/Makefile    |  2 ++
 tests/lockdown/test        | 42 +++++++++++++++++++++++++++++
 8 files changed, 122 insertions(+)
 create mode 100644 policy/test_lockdown.te
 create mode 100644 tests/lockdown/Makefile
 create mode 100755 tests/lockdown/test

diff --git a/policy/Makefile b/policy/Makefile
index f0de669be631..c3e5b4460e84 100644
--- a/policy/Makefile
+++ b/policy/Makefile
@@ -109,6 +109,11 @@ ifeq ($(shell grep -q perf_event $(POLDEV)/include/support/all_perms.spt && echo
 TARGETS += test_perf_event.te
 endif
 
+ifeq ($(shell grep -q lockdown $(POLDEV)/include/support/all_perms.spt && echo true),true)
+TARGETS += test_lockdown.te
+export M4PARAM += -Dlockdown_defined
+endif
+
 ifeq (x$(DISTRO),$(filter x$(DISTRO),xRHEL4 xRHEL5 xRHEL6))
 TARGETS:=$(filter-out test_overlayfs.te test_mqueue.te test_ibpkey.te, $(TARGETS))
 endif
diff --git a/policy/test_global.te b/policy/test_global.te
index 90f9b6513731..1a1a127697f6 100644
--- a/policy/test_global.te
+++ b/policy/test_global.te
@@ -99,3 +99,11 @@ ifdef(`distro_redhat', `
 define(`allow_map',
 ifdef(`map_permission_defined', `allow $1 $2:$3 map;')
 )
+
+define(`allow_lockdown_integrity',
+ifdef(`lockdown_defined', `allow $1 self:lockdown integrity;')
+)
+
+define(`allow_lockdown_confidentiality',
+ifdef(`lockdown_defined', `allow $1 self:lockdown confidentiality;')
+)
diff --git a/policy/test_lockdown.te b/policy/test_lockdown.te
new file mode 100644
index 000000000000..a7a4b6bb8aec
--- /dev/null
+++ b/policy/test_lockdown.te
@@ -0,0 +1,54 @@
+#################################
+#
+# Policy for testing lockdown
+#
+
+attribute lockdowndomain;
+
+# Domain for lockdown (all operations allowed)
+type test_lockdown_all_t;
+domain_type(test_lockdown_all_t)
+unconfined_runs_test(test_lockdown_all_t)
+typeattribute test_lockdown_all_t lockdowndomain;
+typeattribute test_lockdown_all_t testdomain;
+
+dev_read_raw_memory(test_lockdown_all_t)
+kernel_read_core_if(test_lockdown_all_t)
+corecmd_bin_entry_type(test_lockdown_all_t)
+allow test_lockdown_all_t self:lockdown integrity;
+allow test_lockdown_all_t self:lockdown confidentiality;
+
+# Domain for integrity
+type test_lockdown_integrity_t;
+domain_type(test_lockdown_integrity_t)
+unconfined_runs_test(test_lockdown_integrity_t)
+typeattribute test_lockdown_integrity_t lockdowndomain;
+typeattribute test_lockdown_integrity_t testdomain;
+
+dev_read_raw_memory(test_lockdown_integrity_t)
+kernel_read_core_if(test_lockdown_integrity_t)
+corecmd_bin_entry_type(test_lockdown_integrity_t)
+allow test_lockdown_integrity_t self:lockdown integrity;
+
+# Domain for confidentiality
+type test_lockdown_confidentiality_t;
+domain_type(test_lockdown_confidentiality_t)
+unconfined_runs_test(test_lockdown_confidentiality_t)
+typeattribute test_lockdown_confidentiality_t lockdowndomain;
+typeattribute test_lockdown_confidentiality_t testdomain;
+
+dev_read_raw_memory(test_lockdown_confidentiality_t)
+kernel_read_core_if(test_lockdown_confidentiality_t)
+corecmd_bin_entry_type(test_lockdown_confidentiality_t)
+allow test_lockdown_confidentiality_t self:lockdown confidentiality;
+
+# Domain for lockdown (all operations denied)
+type test_lockdown_none_t;
+domain_type(test_lockdown_none_t)
+unconfined_runs_test(test_lockdown_none_t)
+typeattribute test_lockdown_none_t lockdowndomain;
+typeattribute test_lockdown_none_t testdomain;
+
+dev_read_raw_memory(test_lockdown_none_t)
+kernel_read_core_if(test_lockdown_none_t)
+corecmd_bin_entry_type(test_lockdown_none_t)
diff --git a/policy/test_module_load.te b/policy/test_module_load.te
index ec8be67cbbf7..455acea97ab6 100644
--- a/policy/test_module_load.te
+++ b/policy/test_module_load.te
@@ -35,6 +35,7 @@ allow test_kmodule_t test_file_t:system { module_load };
 # Required for init_module(2):
 allow test_kmodule_t self:system { module_load };
 allow test_kmodule_t kernel_t:system { module_request };
+allow_lockdown_integrity(test_kmodule_t)
 
 ############### Deny cap sys_module ######################
 type test_kmodule_deny_sys_module_t;
@@ -63,6 +64,7 @@ typeattribute test_kmodule_deny_module_request_t testdomain, kmoduledomain;
 allow test_kmodule_deny_module_request_t self:capability { sys_module };
 allow test_kmodule_deny_module_request_t test_file_t:system { module_load };
 allow test_kmodule_deny_module_request_t self:system { module_load };
+allow_lockdown_integrity(test_kmodule_deny_module_request_t)
 neverallow test_kmodule_deny_module_request_t kernel_t:system { module_request };
 
 #
diff --git a/policy/test_perf_event.te b/policy/test_perf_event.te
index 67250a4ff047..275cebf1b3e9 100644
--- a/policy/test_perf_event.te
+++ b/policy/test_perf_event.te
@@ -12,6 +12,7 @@ typeattribute test_perf_t perfdomain;
 
 allow test_perf_t self:capability { sys_admin };
 allow test_perf_t self:perf_event { open cpu kernel tracepoint read write };
+allow_lockdown_confidentiality(test_perf_t)
 
 ################# Deny capability { sys_admin } ##########################
 type test_perf_no_admin_t;
@@ -41,6 +42,7 @@ typeattribute test_perf_no_cpu_t perfdomain;
 
 allow test_perf_no_cpu_t self:capability { sys_admin };
 allow test_perf_no_cpu_t self:perf_event { open kernel tracepoint read write };
+allow_lockdown_confidentiality(test_perf_no_cpu_t)
 
 ################# Deny perf_event { kernel } ##########################
 type test_perf_no_kernel_t;
@@ -61,6 +63,7 @@ typeattribute test_perf_no_tracepoint_t perfdomain;
 
 allow test_perf_no_tracepoint_t self:capability { sys_admin };
 allow test_perf_no_tracepoint_t self:perf_event { open cpu kernel read write };
+allow_lockdown_confidentiality(test_perf_no_tracepoint_t)
 
 ################# Deny perf_event { read } ##########################
 type test_perf_no_read_t;
@@ -71,6 +74,7 @@ typeattribute test_perf_no_read_t perfdomain;
 
 allow test_perf_no_read_t self:capability { sys_admin };
 allow test_perf_no_read_t self:perf_event { open cpu kernel tracepoint write };
+allow_lockdown_confidentiality(test_perf_no_read_t)
 
 ################# Deny perf_event { write } ##########################
 type test_perf_no_write_t;
@@ -81,6 +85,7 @@ typeattribute test_perf_no_write_t perfdomain;
 
 allow test_perf_no_write_t self:capability { sys_admin };
 allow test_perf_no_write_t self:perf_event { open cpu kernel tracepoint read };
+allow_lockdown_confidentiality(test_perf_no_write_t)
 
 #
 ########### Allow these domains to be entered from sysadm domain ############
diff --git a/tests/Makefile b/tests/Makefile
index 9a890be4f9aa..167c1375e9c9 100644
--- a/tests/Makefile
+++ b/tests/Makefile
@@ -87,6 +87,10 @@ ifeq ($(shell grep -q perf_event $(POLDEV)/include/support/all_perms.spt && echo
 SUBDIRS += perf_event
 endif
 
+ifeq ($(shell grep -q lockdown $(POLDEV)/include/support/all_perms.spt && echo true),true)
+SUBDIRS += lockdown
+endif
+
 ifeq ($(DISTRO),RHEL4)
     SUBDIRS:=$(filter-out bounds dyntrace dyntrans inet_socket mmap nnp_nosuid overlay unix_socket, $(SUBDIRS))
 endif
diff --git a/tests/lockdown/Makefile b/tests/lockdown/Makefile
new file mode 100644
index 000000000000..e7c006f270c5
--- /dev/null
+++ b/tests/lockdown/Makefile
@@ -0,0 +1,2 @@
+all:
+clean:
diff --git a/tests/lockdown/test b/tests/lockdown/test
new file mode 100755
index 000000000000..0b81cb16c1a6
--- /dev/null
+++ b/tests/lockdown/test
@@ -0,0 +1,42 @@
+#!/usr/bin/perl
+
+use Test;
+BEGIN { plan tests => 8 }
+
+# everything is allowed
+$result =
+  system "runcon -t test_lockdown_all_t -- head /dev/mem > /dev/null 2>&1";
+ok( $result, 0 );
+
+$result =
+  system "runcon -t test_lockdown_all_t -- head /proc/kcore > /dev/null 2>&1";
+ok( $result, 0 );
+
+# only integrity operations allowed
+$result = system
+  "runcon -t test_lockdown_integrity_t -- head /dev/mem > /dev/null 2>&1";
+ok( $result, 0 );
+
+$result = system
+  "runcon -t test_lockdown_integrity_t -- head /proc/kcore > /dev/null 2>&1";
+ok($result);
+
+# only confidentiality operations allowed
+$result = system
+  "runcon -t test_lockdown_confidentiality_t -- head /dev/mem > /dev/null 2>&1";
+ok($result);
+
+$result = system
+"runcon -t test_lockdown_confidentiality_t -- head /proc/kcore > /dev/null 2>&1";
+ok( $result, 0 );
+
+# nothing is allowed
+$result =
+  system "runcon -t test_lockdown_none_t -- head /dev/mem > /dev/null 2>&1";
+ok($result);
+
+$result =
+  system "runcon -t test_lockdown_none_t -- head /proc/kcore > /dev/null 2>&1";
+ok($result);
+
+exit;
-- 
2.23.0

