Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 624DF1411D0
	for <lists+selinux@lfdr.de>; Fri, 17 Jan 2020 20:32:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728773AbgAQTcq (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Fri, 17 Jan 2020 14:32:46 -0500
Received: from USAT19PA20.eemsg.mail.mil ([214.24.22.194]:39210 "EHLO
        USAT19PA20.eemsg.mail.mil" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726897AbgAQTcq (ORCPT
        <rfc822;selinux@vger.kernel.org>); Fri, 17 Jan 2020 14:32:46 -0500
X-EEMSG-check-017: 70933375|USAT19PA20_ESA_OUT01.csd.disa.mil
X-IronPort-AV: E=Sophos;i="5.70,331,1574121600"; 
   d="scan'208";a="70933375"
Received: from emsm-gh1-uea11.ncsc.mil ([214.29.60.3])
  by USAT19PA20.eemsg.mail.mil with ESMTP/TLS/DHE-RSA-AES256-SHA256; 17 Jan 2020 19:32:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tycho.nsa.gov; i=@tycho.nsa.gov; q=dns/txt;
  s=tycho.nsa.gov; t=1579289564; x=1610825564;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Oc6mxSG/7RqDA93rjJyrmREFt8UAiTwkyx2Fxk1YySE=;
  b=ExSwNGego98gS5FdhqhqgAjXFgGGyeKcEOeOuFhgysRZICKgwzHmDaSx
   1cUdDqbR8uWTDrbmwOt7+Fj3fIK5xxiKoOsOvDKBpcHOxvs8vCycMU+/T
   BJlwdO7sAgRaJjLuQuqjHmhStzMYPoAVcYpRxgCgx0ElI5/q1BEX+ZdeI
   fV55oARM7WisGDk13Gplxq0pxkgZbMfReM+Dxt53VobofTXrjS5xKW1Zf
   dUtEGyhNLRIQQGFEQjdSZKIblyzHvejB4EVgP8AdWHGcF0K6Nx3QIFvOj
   X9Th7tBzGUgEAmUg3AgtTHB269hfXtkvLx6sDwYwaOrdg37IkryEoP1Ir
   w==;
X-IronPort-AV: E=Sophos;i="5.70,331,1574121600"; 
   d="scan'208";a="37958719"
IronPort-PHdr: =?us-ascii?q?9a23=3AYBJ5TRL7caUPh53rKtmcpTZWNBhigK39O0sv0r?=
 =?us-ascii?q?FitYgRI/TxwZ3uMQTl6Ol3ixeRBMOHsq4C07qd6PioGTRZp8rY6zZaKN0Efi?=
 =?us-ascii?q?RGoP1epxYnDs+BBB+zB9/RRAt+Iv5/UkR49WqwK0lfFZW2TVTTpnqv8WxaQU?=
 =?us-ascii?q?2nZkJ6KevvB4Hdkdm82fys9J3PeQVIgye2ba9vIBmsogjdq8YbjZF+JqsyxR?=
 =?us-ascii?q?fErGdEcPlSyW90OF6fhRnx6tq+8ZJ57yhcp/ct/NNcXKvneKg1UaZWByk8PW?=
 =?us-ascii?q?Av483ruxjDTQ+R6XYZT24bjBlGDRXb4R/jRpv+vTf0ueR72CmBIM35Vqs0Vi?=
 =?us-ascii?q?i476dqUxDnliEKPCMk/W7Ni8xwiKVboA+9pxF63oXZbp2ZOOZ4c6jAc9waX2?=
 =?us-ascii?q?5BVdtPWSJHDI23co8DA/MBMOtcqoXwoUYFoxmjCgm2HO7hyiFGiGL406M51O?=
 =?us-ascii?q?ouHg7I0Rc8E98NqnnYsM/4OLsOXe2z0aLGzS/Db/RT2Trl9YbIbg4uoemMXb?=
 =?us-ascii?q?1ud8ra1FQhFwbfgVWUrYzqITOU3fkKvmiA8uVgTvmii3Inqg5tojivwd0gio?=
 =?us-ascii?q?/Sho0P0FzE+iJ5wJgsKNC+VUV1YsakHYNNuyyVOIZ6WMMvT3xytCokxbAKp4?=
 =?us-ascii?q?S3cDUMxZ863RDQceaHfJKN4h/7UeaRJip3i2x9dbKkghay7VCgyurhVsmoyF?=
 =?us-ascii?q?pKrjRKkt3Ltn0Vyxzc8NKHSvpg/ke6wzqP1gbT6u9DIUAvi6XUN4QtwqIwl5?=
 =?us-ascii?q?UPsUTDGTX6mEPqg6+Nakoo4O2o6+XjYrn+p5+cMZF7ih3mP6gzlcGyDv40Pw?=
 =?us-ascii?q?gTU2SB5+ix26Pv8VfkTLlSi/05iKjZsJTUJcQBoa65BhdY0p0+5BakFDqmzN?=
 =?us-ascii?q?QZkmUHLFJCYh6HiZPpNEvULPD3Cve/nUygkC13yPDeIr3hHpLNI2DYkLj/eb?=
 =?us-ascii?q?Z96khcyBc8zN1E+ZJUBa8OIOjpVk/yqtPYFBk5PBKww+r9D9V9zIweCiqzBf?=
 =?us-ascii?q?qCPafTt0KYzvwgLvPKZ4IPvjv5bf8/6K3Al3g8zGQBcLGp0J1fU3WxGvBrMg?=
 =?us-ascii?q?3Nenb3qssQGmcN+AwlRarlj0PUAm0bXGq7Q69pvmJzM4mhF4qWA938jQ=3D?=
 =?us-ascii?q?=3D?=
X-IPAS-Result: =?us-ascii?q?A2CcAwBECyJe/wHyM5BcCRwBAQEBAQcBAREBBAQBAYF7g?=
 =?us-ascii?q?XgFgg0SKo0UhmIGiyWRSQkBAQEBAQEBAQEbHAEBhECCMDgTAhABAQEEAQEBA?=
 =?us-ascii?q?QEFAwEBbIVDgjspgxsNCwE0EoFRgmc/glclrm0zhUqDL4E+gTaHO4RzeYEHg?=
 =?us-ascii?q?RE2gxuEHxSGBASNVgSKHJdWgkOCSY5jhHgMG4JHMIwai2GrciJEgRQrCAIYC?=
 =?us-ascii?q?CEPgydQGA2IDReOQSMDMI0IXwEB?=
Received: from tarius.tycho.ncsc.mil (HELO tarius.infosec.tycho.ncsc.mil) ([144.51.242.1])
  by emsm-gh1-uea11.NCSC.MIL with ESMTP; 17 Jan 2020 19:32:38 +0000
Received: from moss-pluto.infosec.tycho.ncsc.mil (moss-pluto [192.168.25.131])
        by tarius.infosec.tycho.ncsc.mil (8.14.7/8.14.4) with ESMTP id 00HJVxLJ010036;
        Fri, 17 Jan 2020 14:32:01 -0500
From:   Stephen Smalley <sds@tycho.nsa.gov>
To:     selinux@vger.kernel.org
Cc:     jwcart2@tycho.nsa.gov, Stephen Smalley <sds@tycho.nsa.gov>
Subject: [PATCH v3] libsepol,checkpolicy: remove use of hardcoded security class values
Date:   Fri, 17 Jan 2020 14:33:17 -0500
Message-Id: <20200117193317.26942-1-sds@tycho.nsa.gov>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

libsepol carried its own (outdated) copy of flask.h with the generated
security class and initial SID values for use by the policy
compiler and the forked copy of the security server code
leveraged by tools such as audit2why.  Convert libsepol and
checkpolicy entirely to looking up class values from the policy,
remove the SECCLASS_* definitions from its flask.h header, and move
the header with its remaining initial SID definitions private to
libsepol.  While we are here, fix the sepol_compute_sid() logic to
properly support features long since added to the policy and kernel,
although there are no users of it other than checkpolicy -d (debug)
and it is not exported to users of the shared library.  There
are still some residual differences between the kernel logic and
libsepol.

Signed-off-by: Stephen Smalley <sds@tycho.nsa.gov>
---
v3 removes a private copy of av_permissions.h from libsepol
that only defined the PROCESS__TRANSITION,DYNTRANSITION permissions
used by its code and a reference to av_permissions.h from its
headers.

 checkpolicy/checkmodule.c                     |  1 -
 checkpolicy/checkpolicy.c                     |  1 -
 checkpolicy/policy_define.c                   | 26 +++--
 checkpolicy/policy_parse.y                    |  1 -
 checkpolicy/test/dismod.c                     |  1 -
 libsepol/cil/src/cil_binary.c                 |  1 -
 libsepol/include/sepol/policydb/flask.h       | 94 -------------------
 libsepol/include/sepol/policydb/flask_types.h |  8 +-
 libsepol/include/sepol/policydb/policydb.h    |  5 +
 libsepol/src/av_permissions.h                 |  3 -
 libsepol/src/flask.h                          | 38 ++++++++
 libsepol/src/kernel_to_cil.c                  |  1 -
 libsepol/src/kernel_to_conf.c                 |  1 -
 libsepol/src/mls.c                            |  3 +-
 libsepol/src/policydb.c                       | 78 ++++++++++++++-
 libsepol/src/services.c                       | 88 +++++++++--------
 libsepol/src/sidtab.c                         |  2 +-
 libsepol/src/write.c                          | 25 +++--
 18 files changed, 205 insertions(+), 172 deletions(-)
 delete mode 100644 libsepol/include/sepol/policydb/flask.h
 delete mode 100644 libsepol/src/av_permissions.h
 create mode 100644 libsepol/src/flask.h

diff --git a/checkpolicy/checkmodule.c b/checkpolicy/checkmodule.c
index c9efaf8b442b..ba7a911b14df 100644
--- a/checkpolicy/checkmodule.c
+++ b/checkpolicy/checkmodule.c
@@ -25,7 +25,6 @@
 #include <sepol/policydb/policydb.h>
 #include <sepol/policydb/services.h>
 #include <sepol/policydb/conditional.h>
-#include <sepol/policydb/flask.h>
 #include <sepol/policydb/hierarchy.h>
 #include <sepol/policydb/expand.h>
 #include <sepol/policydb/link.h>
diff --git a/checkpolicy/checkpolicy.c b/checkpolicy/checkpolicy.c
index 7c5b63f82212..ed1516a6aa6a 100644
--- a/checkpolicy/checkpolicy.c
+++ b/checkpolicy/checkpolicy.c
@@ -85,7 +85,6 @@
 #include <sepol/policydb/services.h>
 #include <sepol/policydb/conditional.h>
 #include <sepol/policydb/hierarchy.h>
-#include <sepol/policydb/flask.h>
 #include <sepol/policydb/expand.h>
 #include <sepol/policydb/link.h>
 
diff --git a/checkpolicy/policy_define.c b/checkpolicy/policy_define.c
index e295bc523258..c6733fa469c5 100644
--- a/checkpolicy/policy_define.c
+++ b/checkpolicy/policy_define.c
@@ -53,7 +53,6 @@
 #include <sepol/policydb/policydb.h>
 #include <sepol/policydb/services.h>
 #include <sepol/policydb/conditional.h>
-#include <sepol/policydb/flask.h>
 #include <sepol/policydb/hierarchy.h>
 #include <sepol/policydb/polcaps.h>
 #include "queue.h"
@@ -5509,7 +5508,9 @@ int define_genfs_context_helper(char *fstype, int has_type)
 {
 	struct genfs *genfs_p, *genfs, *newgenfs;
 	ocontext_t *newc, *c, *head, *p;
+	class_datum_t *cladatum;
 	char *type = NULL;
+	const char *sclass;
 	int len, len2;
 
 	if (policydbp->target_platform != SEPOL_TARGET_SELINUX) {
@@ -5571,30 +5572,39 @@ int define_genfs_context_helper(char *fstype, int has_type)
 		}
 		switch (type[0]) {
 		case 'b':
-			newc->v.sclass = SECCLASS_BLK_FILE;
+			sclass = "blk_file";
 			break;
 		case 'c':
-			newc->v.sclass = SECCLASS_CHR_FILE;
+			sclass = "chr_file";
 			break;
 		case 'd':
-			newc->v.sclass = SECCLASS_DIR;
+			sclass = "dir";
 			break;
 		case 'p':
-			newc->v.sclass = SECCLASS_FIFO_FILE;
+			sclass = "fifo_file";
 			break;
 		case 'l':
-			newc->v.sclass = SECCLASS_LNK_FILE;
+			sclass = "lnk_file";
 			break;
 		case 's':
-			newc->v.sclass = SECCLASS_SOCK_FILE;
+			sclass = "sock_file";
 			break;
 		case '-':
-			newc->v.sclass = SECCLASS_FILE;
+			sclass = "file";
 			break;
 		default:
 			yyerror2("invalid type %s", type);
 			goto fail;
 		}
+
+		cladatum = hashtab_search(policydbp->p_classes.table,
+					  sclass);
+		if (!cladatum) {
+			yyerror2("could not find class %s for "
+				 "genfscon statement", sclass);
+			goto fail;
+		}
+		newc->v.sclass = cladatum->s.value;
 	}
 	if (parse_security_context(&newc->context[0]))
 		goto fail;
diff --git a/checkpolicy/policy_parse.y b/checkpolicy/policy_parse.y
index abb7d88557e4..6098eb504d0c 100644
--- a/checkpolicy/policy_parse.y
+++ b/checkpolicy/policy_parse.y
@@ -46,7 +46,6 @@
 #include <sepol/policydb/policydb.h>
 #include <sepol/policydb/services.h>
 #include <sepol/policydb/conditional.h>
-#include <sepol/policydb/flask.h>
 #include <sepol/policydb/hierarchy.h>
 #include <sepol/policydb/polcaps.h>
 #include "queue.h"
diff --git a/checkpolicy/test/dismod.c b/checkpolicy/test/dismod.c
index 996cf33fff0e..8d6be2ff9522 100644
--- a/checkpolicy/test/dismod.c
+++ b/checkpolicy/test/dismod.c
@@ -30,7 +30,6 @@
 #include <sepol/policydb/policydb.h>
 #include <sepol/policydb/services.h>
 #include <sepol/policydb/conditional.h>
-#include <sepol/policydb/flask.h>
 #include <sepol/policydb/link.h>
 #include <sepol/policydb/module.h>
 #include <sepol/policydb/util.h>
diff --git a/libsepol/cil/src/cil_binary.c b/libsepol/cil/src/cil_binary.c
index 4cf6f481fe76..f8e20d32f9f1 100644
--- a/libsepol/cil/src/cil_binary.c
+++ b/libsepol/cil/src/cil_binary.c
@@ -42,7 +42,6 @@
 #include <sepol/policydb/polcaps.h>
 #include <sepol/policydb/conditional.h>
 #include <sepol/policydb/constraint.h>
-#include <sepol/policydb/flask.h>
 #include <sepol/policydb/expand.h>
 #include <sepol/policydb/hierarchy.h>
 
diff --git a/libsepol/include/sepol/policydb/flask.h b/libsepol/include/sepol/policydb/flask.h
deleted file mode 100644
index 3134284b579f..000000000000
--- a/libsepol/include/sepol/policydb/flask.h
+++ /dev/null
@@ -1,94 +0,0 @@
-/* This file is automatically generated.  Do not edit. */
-#ifndef _SEPOL_POLICYDB_FLASK_H_
-#define _SEPOL_POLICYDB_FLASK_H_
-
-/*
- * Security object class definitions
- */
-#define SECCLASS_SECURITY                                1
-#define SECCLASS_PROCESS                                 2
-#define SECCLASS_SYSTEM                                  3
-#define SECCLASS_CAPABILITY                              4
-#define SECCLASS_FILESYSTEM                              5
-#define SECCLASS_FILE                                    6
-#define SECCLASS_DIR                                     7
-#define SECCLASS_FD                                      8
-#define SECCLASS_LNK_FILE                                9
-#define SECCLASS_CHR_FILE                                10
-#define SECCLASS_BLK_FILE                                11
-#define SECCLASS_SOCK_FILE                               12
-#define SECCLASS_FIFO_FILE                               13
-#define SECCLASS_SOCKET                                  14
-#define SECCLASS_TCP_SOCKET                              15
-#define SECCLASS_UDP_SOCKET                              16
-#define SECCLASS_RAWIP_SOCKET                            17
-#define SECCLASS_NODE                                    18
-#define SECCLASS_NETIF                                   19
-#define SECCLASS_NETLINK_SOCKET                          20
-#define SECCLASS_PACKET_SOCKET                           21
-#define SECCLASS_KEY_SOCKET                              22
-#define SECCLASS_UNIX_STREAM_SOCKET                      23
-#define SECCLASS_UNIX_DGRAM_SOCKET                       24
-#define SECCLASS_SEM                                     25
-#define SECCLASS_MSG                                     26
-#define SECCLASS_MSGQ                                    27
-#define SECCLASS_SHM                                     28
-#define SECCLASS_IPC                                     29
-#define SECCLASS_PASSWD                                  30
-#define SECCLASS_DRAWABLE                                31
-#define SECCLASS_WINDOW                                  32
-#define SECCLASS_GC                                      33
-#define SECCLASS_FONT                                    34
-#define SECCLASS_COLORMAP                                35
-#define SECCLASS_PROPERTY                                36
-#define SECCLASS_CURSOR                                  37
-#define SECCLASS_XCLIENT                                 38
-#define SECCLASS_XINPUT                                  39
-#define SECCLASS_XSERVER                                 40
-#define SECCLASS_XEXTENSION                              41
-#define SECCLASS_PAX                                     42
-#define SECCLASS_NETLINK_ROUTE_SOCKET                    43
-#define SECCLASS_NETLINK_FIREWALL_SOCKET                 44
-#define SECCLASS_NETLINK_TCPDIAG_SOCKET                  45
-#define SECCLASS_NETLINK_NFLOG_SOCKET                    46
-#define SECCLASS_NETLINK_XFRM_SOCKET                     47
-#define SECCLASS_NETLINK_SELINUX_SOCKET                  48
-#define SECCLASS_NETLINK_AUDIT_SOCKET                    49
-#define SECCLASS_NETLINK_IP6FW_SOCKET                    50
-#define SECCLASS_NETLINK_DNRT_SOCKET                     51
-#define SECCLASS_DBUS                                    52
-
-/*
- * Security identifier indices for initial entities
- */
-#define SECINITSID_KERNEL                               1
-#define SECINITSID_SECURITY                             2
-#define SECINITSID_UNLABELED                            3
-#define SECINITSID_FS                                   4
-#define SECINITSID_FILE                                 5
-#define SECINITSID_FILE_LABELS                          6
-#define SECINITSID_INIT                                 7
-#define SECINITSID_ANY_SOCKET                           8
-#define SECINITSID_PORT                                 9
-#define SECINITSID_NETIF                                10
-#define SECINITSID_NETMSG                               11
-#define SECINITSID_NODE                                 12
-#define SECINITSID_IGMP_PACKET                          13
-#define SECINITSID_ICMP_SOCKET                          14
-#define SECINITSID_TCP_SOCKET                           15
-#define SECINITSID_SYSCTL_MODPROBE                      16
-#define SECINITSID_SYSCTL                               17
-#define SECINITSID_SYSCTL_FS                            18
-#define SECINITSID_SYSCTL_KERNEL                        19
-#define SECINITSID_SYSCTL_NET                           20
-#define SECINITSID_SYSCTL_NET_UNIX                      21
-#define SECINITSID_SYSCTL_VM                            22
-#define SECINITSID_SYSCTL_DEV                           23
-#define SECINITSID_KMOD                                 24
-#define SECINITSID_POLICY                               25
-#define SECINITSID_SCMP_PACKET                          26
-#define SECINITSID_DEVNULL                              27
-
-#define SECINITSID_NUM                                  27
-
-#endif
diff --git a/libsepol/include/sepol/policydb/flask_types.h b/libsepol/include/sepol/policydb/flask_types.h
index 714176fd2a44..7bec5129fe1d 100644
--- a/libsepol/include/sepol/policydb/flask_types.h
+++ b/libsepol/include/sepol/policydb/flask_types.h
@@ -33,17 +33,13 @@ typedef char *sepol_security_context_t;
  * for a pair of SIDs.  The bits within an access vector
  * are interpreted differently depending on the class of
  * the object.  The access vector interpretations are specified
- * in flask/access_vectors, and the corresponding constants
- * for permissions are defined in the automatically generated
- * header file av_permissions.h.
+ * in policy.
  */
 typedef uint32_t sepol_access_vector_t;
 
 /*
  * Each object class is identified by a fixed-size value.
- * The set of security classes is specified in flask/security_classes, 
- * with the corresponding constants defined in the automatically 
- * generated header file flask.h.
+ * The set of security classes is specified in policy.
  */
 typedef uint16_t sepol_security_class_t;
 #define SEPOL_SECCLASS_NULL			0x0000	/* no class */
diff --git a/libsepol/include/sepol/policydb/policydb.h b/libsepol/include/sepol/policydb/policydb.h
index b0d2fdfc43f8..81b63fefbb20 100644
--- a/libsepol/include/sepol/policydb/policydb.h
+++ b/libsepol/include/sepol/policydb/policydb.h
@@ -605,6 +605,11 @@ typedef struct policydb {
 	unsigned policyvers;
 
 	unsigned handle_unknown;
+
+	sepol_security_class_t process_class;
+	sepol_security_class_t dir_class;
+	sepol_access_vector_t process_trans;
+	sepol_access_vector_t process_trans_dyntrans;
 } policydb_t;
 
 struct sepol_policydb {
diff --git a/libsepol/src/av_permissions.h b/libsepol/src/av_permissions.h
deleted file mode 100644
index 97278ed91f63..000000000000
--- a/libsepol/src/av_permissions.h
+++ /dev/null
@@ -1,3 +0,0 @@
-/* Used by security_compute_av. */
-#define PROCESS__TRANSITION                       0x00000002UL
-#define PROCESS__DYNTRANSITION                    0x00800000UL
diff --git a/libsepol/src/flask.h b/libsepol/src/flask.h
new file mode 100644
index 000000000000..b4130bbcf544
--- /dev/null
+++ b/libsepol/src/flask.h
@@ -0,0 +1,38 @@
+/* This file is automatically generated.  Do not edit. */
+#ifndef _SEPOL_POLICYDB_FLASK_H_
+#define _SEPOL_POLICYDB_FLASK_H_
+
+/*
+ * Security identifier indices for initial entities
+ */
+#define SECINITSID_KERNEL                               1
+#define SECINITSID_SECURITY                             2
+#define SECINITSID_UNLABELED                            3
+#define SECINITSID_FS                                   4
+#define SECINITSID_FILE                                 5
+#define SECINITSID_FILE_LABELS                          6
+#define SECINITSID_INIT                                 7
+#define SECINITSID_ANY_SOCKET                           8
+#define SECINITSID_PORT                                 9
+#define SECINITSID_NETIF                                10
+#define SECINITSID_NETMSG                               11
+#define SECINITSID_NODE                                 12
+#define SECINITSID_IGMP_PACKET                          13
+#define SECINITSID_ICMP_SOCKET                          14
+#define SECINITSID_TCP_SOCKET                           15
+#define SECINITSID_SYSCTL_MODPROBE                      16
+#define SECINITSID_SYSCTL                               17
+#define SECINITSID_SYSCTL_FS                            18
+#define SECINITSID_SYSCTL_KERNEL                        19
+#define SECINITSID_SYSCTL_NET                           20
+#define SECINITSID_SYSCTL_NET_UNIX                      21
+#define SECINITSID_SYSCTL_VM                            22
+#define SECINITSID_SYSCTL_DEV                           23
+#define SECINITSID_KMOD                                 24
+#define SECINITSID_POLICY                               25
+#define SECINITSID_SCMP_PACKET                          26
+#define SECINITSID_DEVNULL                              27
+
+#define SECINITSID_NUM                                  27
+
+#endif
diff --git a/libsepol/src/kernel_to_cil.c b/libsepol/src/kernel_to_cil.c
index ca2e4a9b265b..108767573e28 100644
--- a/libsepol/src/kernel_to_cil.c
+++ b/libsepol/src/kernel_to_cil.c
@@ -18,7 +18,6 @@
 
 #include <sepol/policydb/avtab.h>
 #include <sepol/policydb/conditional.h>
-#include <sepol/policydb/flask.h>
 #include <sepol/policydb/hashtab.h>
 #include <sepol/policydb/polcaps.h>
 #include <sepol/policydb/policydb.h>
diff --git a/libsepol/src/kernel_to_conf.c b/libsepol/src/kernel_to_conf.c
index b49661625e03..1c7b7d226e9e 100644
--- a/libsepol/src/kernel_to_conf.c
+++ b/libsepol/src/kernel_to_conf.c
@@ -17,7 +17,6 @@
 
 #include <sepol/policydb/avtab.h>
 #include <sepol/policydb/conditional.h>
-#include <sepol/policydb/flask.h>
 #include <sepol/policydb/hashtab.h>
 #include <sepol/policydb/polcaps.h>
 #include <sepol/policydb/policydb.h>
diff --git a/libsepol/src/mls.c b/libsepol/src/mls.c
index 6ff9a8468879..1ee90cf8dee1 100644
--- a/libsepol/src/mls.c
+++ b/libsepol/src/mls.c
@@ -29,7 +29,6 @@
 
 #include <sepol/policydb/policydb.h>
 #include <sepol/policydb/services.h>
-#include <sepol/policydb/flask.h>
 #include <sepol/policydb/context.h>
 
 #include <stdlib.h>
@@ -649,7 +648,7 @@ int mls_compute_sid(policydb_t * policydb,
 
 		/* Fallthrough */
 	case AVTAB_CHANGE:
-		if (tclass == SECCLASS_PROCESS)
+		if (tclass == policydb->process_class)
 			/* Use the process MLS attributes. */
 			return mls_copy_context(newcontext, scontext);
 		else
diff --git a/libsepol/src/policydb.c b/libsepol/src/policydb.c
index 67037b6d7760..ac66c24622d9 100644
--- a/libsepol/src/policydb.c
+++ b/libsepol/src/policydb.c
@@ -49,7 +49,6 @@
 #include <sepol/policydb/conditional.h>
 #include <sepol/policydb/avrule_block.h>
 #include <sepol/policydb/util.h>
-#include <sepol/policydb/flask.h>
 
 #include "kernel_to_common.h"
 #include "private.h"
@@ -2562,7 +2561,7 @@ int role_trans_read(policydb_t *p, struct policy_file *fp)
 				return -1;
 			tr->tclass = le32_to_cpu(buf[0]);
 		} else
-			tr->tclass = SECCLASS_PROCESS;
+			tr->tclass = p->process_class;
 		ltr = tr;
 	}
 	return 0;
@@ -3457,7 +3456,7 @@ static int range_read(policydb_t * p, struct policy_file *fp)
 				goto err;
 			rt->target_class = le32_to_cpu(buf[0]);
 		} else
-			rt->target_class = SECCLASS_PROCESS;
+			rt->target_class = p->process_class;
 		r = calloc(1, sizeof(*r));
 		if (!r)
 			goto err;
@@ -3586,7 +3585,7 @@ static int role_trans_rule_read(policydb_t *p, role_trans_rule_t ** r,
 			if (ebitmap_read(&tr->classes, fp))
 				return -1;
 		} else {
-			if (ebitmap_set_bit(&tr->classes, SECCLASS_PROCESS - 1, 1))
+			if (ebitmap_set_bit(&tr->classes, p->process_class - 1, 1))
 				return -1;
 		}
 
@@ -3963,6 +3962,51 @@ static int scope_read(policydb_t * p, int symnum, struct policy_file *fp)
 	return -1;
 }
 
+static sepol_security_class_t policydb_string_to_security_class(
+	struct policydb *policydb,
+	const char *class_name)
+{
+	class_datum_t *tclass_datum;
+
+	tclass_datum = hashtab_search(policydb->p_classes.table,
+				      (hashtab_key_t) class_name);
+	if (!tclass_datum)
+		return 0;
+	return tclass_datum->s.value;
+}
+
+static sepol_access_vector_t policydb_string_to_av_perm(
+	struct policydb *policydb,
+	sepol_security_class_t tclass,
+	const char *perm_name)
+{
+	class_datum_t *tclass_datum;
+	perm_datum_t *perm_datum;
+
+	if (!tclass || tclass > policydb->p_classes.nprim)
+		return 0;
+	tclass_datum = policydb->class_val_to_struct[tclass - 1];
+
+	perm_datum = (perm_datum_t *)
+			hashtab_search(tclass_datum->permissions.table,
+			(hashtab_key_t)perm_name);
+	if (perm_datum != NULL)
+		return 0x1U << (perm_datum->s.value - 1);
+
+	if (tclass_datum->comdatum == NULL)
+		return 0;
+
+	perm_datum = (perm_datum_t *)
+			hashtab_search(tclass_datum->comdatum->permissions.table,
+			(hashtab_key_t)perm_name);
+
+	if (perm_datum != NULL)
+		return 0x1U << (perm_datum->s.value - 1);
+
+	return 0;
+}
+
+
 /*
  * Read the configuration data from a policy database binary
  * representation file into a policy database structure.
@@ -4190,6 +4234,18 @@ int policydb_read(policydb_t * p, struct policy_file *fp, unsigned verbose)
 		p->symtab[i].nprim = nprim;
 	}
 
+	switch (p->target_platform) {
+	case SEPOL_TARGET_SELINUX:
+		p->process_class = policydb_string_to_security_class(p, "process");
+		p->dir_class = policydb_string_to_security_class(p, "dir");
+		break;
+	case SEPOL_TARGET_XEN:
+		p->process_class = policydb_string_to_security_class(p, "domain");
+		break;
+	default:
+		break;
+	}
+
 	if (policy_type == POLICY_KERN) {
 		if (avtab_read(&p->te_avtab, fp, r_policyvers))
 			goto bad;
@@ -4233,6 +4289,20 @@ int policydb_read(policydb_t * p, struct policy_file *fp, unsigned verbose)
 	if (policydb_index_classes(p))
 		goto bad;
 
+	switch (p->target_platform) {
+	case SEPOL_TARGET_SELINUX:
+		/* fall through */
+	case SEPOL_TARGET_XEN:
+		p->process_trans = policydb_string_to_av_perm(p, p->process_class,
+							      "transition");
+		p->process_trans_dyntrans = p->process_trans |
+			policydb_string_to_av_perm(p, p->process_class,
+						   "dyntransition");
+		break;
+	default:
+		break;
+	}
+
 	if (policydb_index_others(fp->handle, p, verbose))
 		goto bad;
 
diff --git a/libsepol/src/services.c b/libsepol/src/services.c
index 3758436f8e34..43cb29d6d39c 100644
--- a/libsepol/src/services.c
+++ b/libsepol/src/services.c
@@ -1,4 +1,3 @@
-
 /*
  * Author : Stephen Smalley, <sds@tycho.nsa.gov>
  */
@@ -59,15 +58,14 @@
 #include <sepol/policydb/sidtab.h>
 #include <sepol/policydb/services.h>
 #include <sepol/policydb/conditional.h>
-#include <sepol/policydb/flask.h>
 #include <sepol/policydb/util.h>
 
 #include "debug.h"
 #include "private.h"
 #include "context.h"
-#include "av_permissions.h"
 #include "dso.h"
 #include "mls.h"
+#include "flask.h"
 
 #define BUG() do { ERR(NULL, "Badness at %s:%d", __FILE__, __LINE__); } while (0)
 #define BUG_ON(x) do { if (x) ERR(NULL, "Badness at %s:%d", __FILE__, __LINE__); } while (0)
@@ -989,8 +987,8 @@ static int context_struct_compute_av(context_struct_t * scontext,
 	 * role is changing, then check the (current_role, new_role) 
 	 * pair.
 	 */
-	if (tclass == SECCLASS_PROCESS &&
-	    (avd->allowed & (PROCESS__TRANSITION | PROCESS__DYNTRANSITION)) &&
+	if (tclass == policydb->process_class &&
+	    (avd->allowed & policydb->process_trans_dyntrans) &&
 	    scontext->role != tcontext->role) {
 		for (ra = policydb->role_allow; ra; ra = ra->next) {
 			if (scontext->role == ra->role &&
@@ -998,8 +996,7 @@ static int context_struct_compute_av(context_struct_t * scontext,
 				break;
 		}
 		if (!ra)
-			avd->allowed = (avd->allowed) & ~(PROCESS__TRANSITION |
-							  PROCESS__DYNTRANSITION);
+			avd->allowed &= ~policydb->process_trans_dyntrans;
 	}
 
 	if (requested & ~avd->allowed) {
@@ -1361,6 +1358,7 @@ static int sepol_compute_sid(sepol_security_id_t ssid,
 			     sepol_security_class_t tclass,
 			     uint32_t specified, sepol_security_id_t * out_sid)
 {
+	struct class_datum *cladatum = NULL;
 	context_struct_t *scontext = 0, *tcontext = 0, newcontext;
 	struct role_trans *roletr = 0;
 	avtab_key_t avkey;
@@ -1381,14 +1379,22 @@ static int sepol_compute_sid(sepol_security_id_t ssid,
 		goto out;
 	}
 
+	if (tclass && tclass <= policydb->p_classes.nprim)
+		cladatum = policydb->class_val_to_struct[tclass - 1];
+
 	context_init(&newcontext);
 
 	/* Set the user identity. */
 	switch (specified) {
 	case AVTAB_TRANSITION:
 	case AVTAB_CHANGE:
-		/* Use the process user identity. */
-		newcontext.user = scontext->user;
+		if (cladatum && cladatum->default_user == DEFAULT_TARGET) {
+			newcontext.user = tcontext->user;
+		} else {
+			/* notice this gets both DEFAULT_SOURCE and unset */
+			/* Use the process user identity. */
+			newcontext.user = scontext->user;
+		}
 		break;
 	case AVTAB_MEMBER:
 		/* Use the related object owner. */
@@ -1396,18 +1402,31 @@ static int sepol_compute_sid(sepol_security_id_t ssid,
 		break;
 	}
 
-	/* Set the role and type to default values. */
-	switch (tclass) {
-	case SECCLASS_PROCESS:
-		/* Use the current role and type of process. */
+	/* Set the role to default values. */
+	if (cladatum && cladatum->default_role == DEFAULT_SOURCE) {
 		newcontext.role = scontext->role;
+	} else if (cladatum && cladatum->default_role == DEFAULT_TARGET) {
+		newcontext.role = tcontext->role;
+	} else {
+		if (tclass == policydb->process_class)
+			newcontext.role = scontext->role;
+		else
+			newcontext.role = OBJECT_R_VAL;
+	}
+
+	/* Set the type to default values. */
+	if (cladatum && cladatum->default_type == DEFAULT_SOURCE) {
 		newcontext.type = scontext->type;
-		break;
-	default:
-		/* Use the well-defined object role. */
-		newcontext.role = OBJECT_R_VAL;
-		/* Use the type of the related object. */
+	} else if (cladatum && cladatum->default_type == DEFAULT_TARGET) {
 		newcontext.type = tcontext->type;
+	} else {
+		if (tclass == policydb->process_class) {
+			/* Use the type of process. */
+			newcontext.type = scontext->type;
+		} else {
+			/* Use the type of the related object. */
+			newcontext.type = tcontext->type;
+		}
 	}
 
 	/* Look for a type transition/member/change rule. */
@@ -1435,23 +1454,18 @@ static int sepol_compute_sid(sepol_security_id_t ssid,
 	}
 
 	/* Check for class-specific changes. */
-	switch (tclass) {
-	case SECCLASS_PROCESS:
-		if (specified & AVTAB_TRANSITION) {
-			/* Look for a role transition rule. */
-			for (roletr = policydb->role_tr; roletr;
-			     roletr = roletr->next) {
-				if (roletr->role == scontext->role &&
-				    roletr->type == tcontext->type) {
-					/* Use the role transition rule. */
-					newcontext.role = roletr->new_role;
-					break;
-				}
+	if (specified & AVTAB_TRANSITION) {
+		/* Look for a role transition rule. */
+		for (roletr = policydb->role_tr; roletr;
+		     roletr = roletr->next) {
+			if (roletr->role == scontext->role &&
+			    roletr->type == tcontext->type &&
+			    roletr->tclass == tclass) {
+				/* Use the role transition rule. */
+				newcontext.role = roletr->new_role;
+				break;
 			}
 		}
-		break;
-	default:
-		break;
 	}
 
 	/* Set the MLS attributes.
@@ -2203,10 +2217,10 @@ int hidden sepol_get_user_sids(sepol_security_id_t fromsid,
 				continue;
 
 			rc = context_struct_compute_av(fromcon, &usercon,
-						       SECCLASS_PROCESS,
-						       PROCESS__TRANSITION,
+						       policydb->process_class,
+						       policydb->process_trans,
 						       &avd, &reason, NULL, 0);
-			if (rc || !(avd.allowed & PROCESS__TRANSITION))
+			if (rc || !(avd.allowed & policydb->process_trans))
 				continue;
 			rc = sepol_sidtab_context_to_sid(sidtab, &usercon,
 							 &sid);
@@ -2321,7 +2335,7 @@ int hidden sepol_fs_use(const char *fstype,
 		}
 		*sid = c->sid[0];
 	} else {
-		rc = sepol_genfs_sid(fstype, "/", SECCLASS_DIR, sid);
+		rc = sepol_genfs_sid(fstype, "/", policydb->dir_class, sid);
 		if (rc) {
 			*behavior = SECURITY_FS_USE_NONE;
 			rc = 0;
diff --git a/libsepol/src/sidtab.c b/libsepol/src/sidtab.c
index 23b2e8f33630..e6bf57161e52 100644
--- a/libsepol/src/sidtab.c
+++ b/libsepol/src/sidtab.c
@@ -14,7 +14,7 @@
 
 #include <sepol/policydb/sidtab.h>
 
-#include <sepol/policydb/flask.h>
+#include "flask.h"
 
 #define SIDTAB_HASH(sid) \
 (sid & SIDTAB_HASH_MASK)
diff --git a/libsepol/src/write.c b/libsepol/src/write.c
index c6be2be2562e..ab5bc25889d4 100644
--- a/libsepol/src/write.c
+++ b/libsepol/src/write.c
@@ -40,7 +40,6 @@
 #include <sepol/policydb/policydb.h>
 #include <sepol/policydb/conditional.h>
 #include <sepol/policydb/expand.h>
-#include <sepol/policydb/flask.h>
 
 #include "debug.h"
 #include "private.h"
@@ -514,7 +513,7 @@ static int role_trans_write(policydb_t *p, struct policy_file *fp)
 
 	nel = 0;
 	for (tr = r; tr; tr = tr->next)
-		if(new_roletr || tr->tclass == SECCLASS_PROCESS)
+		if(new_roletr || tr->tclass == p->process_class)
 			nel++;
 
 	buf[0] = cpu_to_le32(nel);
@@ -522,7 +521,7 @@ static int role_trans_write(policydb_t *p, struct policy_file *fp)
 	if (items != 1)
 		return POLICYDB_ERROR;
 	for (tr = r; tr; tr = tr->next) {
-		if (!new_roletr && tr->tclass != SECCLASS_PROCESS) {
+		if (!new_roletr && tr->tclass != p->process_class) {
 			if (!warning_issued)
 				WARN(fp->handle, "Discarding role_transition "
 				     "rules for security classes other than "
@@ -1574,6 +1573,7 @@ struct rangetrans_write_args {
 	size_t nel;
 	int new_rangetr;
 	struct policy_file *fp;
+	struct policydb *p;
 };
 
 static int rangetrans_count(hashtab_key_t key,
@@ -1582,11 +1582,12 @@ static int rangetrans_count(hashtab_key_t key,
 {
 	struct range_trans *rt = (struct range_trans *)key;
 	struct rangetrans_write_args *args = ptr;
+	struct policydb *p = args->p;
 
 	/* all range_transitions are written for the new format, only
 	   process related range_transitions are written for the old
 	   format, so count accordingly */
-	if (args->new_rangetr || rt->target_class == SECCLASS_PROCESS)
+	if (args->new_rangetr || rt->target_class == p->process_class)
 		args->nel++;
 	return 0;
 }
@@ -1598,12 +1599,13 @@ static int range_write_helper(hashtab_key_t key, void *data, void *ptr)
 	struct mls_range *r = data;
 	struct rangetrans_write_args *args = ptr;
 	struct policy_file *fp = args->fp;
+	struct policydb *p = args->p;
 	int new_rangetr = args->new_rangetr;
 	size_t items;
 	static int warning_issued = 0;
 	int rc;
 
-	if (!new_rangetr && rt->target_class != SECCLASS_PROCESS) {
+	if (!new_rangetr && rt->target_class != p->process_class) {
 		if (!warning_issued)
 			WARN(fp->handle, "Discarding range_transition "
 			     "rules for security classes other than "
@@ -1642,6 +1644,7 @@ static int range_write(policydb_t * p, struct policy_file *fp)
 	args.nel = 0;
 	args.new_rangetr = new_rangetr;
 	args.fp = fp;
+	args.p = p;
 	rc = hashtab_map(p->range_tr, rangetrans_count, &args);
 	if (rc)
 		return rc;
@@ -1766,13 +1769,15 @@ static int avrule_write_list(policydb_t *p, avrule_t * avrules,
 	return POLICYDB_SUCCESS;
 }
 
-static int only_process(ebitmap_t *in)
+static int only_process(ebitmap_t *in, struct policydb *p)
 {
-	unsigned int i;
+	unsigned int i, value;
 	ebitmap_node_t *node;
 
+	value = p->process_class - 1;
+
 	ebitmap_for_each_positive_bit(in, node, i) {
-		if (i != SECCLASS_PROCESS - 1)
+		if (i != value)
 			return 0;
 	}
 	return 1;
@@ -1789,7 +1794,7 @@ static int role_trans_rule_write(policydb_t *p, role_trans_rule_t * t,
 	int new_role = p->policyvers >= MOD_POLICYDB_VERSION_ROLETRANS;
 
 	for (tr = t; tr; tr = tr->next)
-		if (new_role || only_process(&tr->classes))
+		if (new_role || only_process(&tr->classes, p))
 			nel++;
 
 	buf[0] = cpu_to_le32(nel);
@@ -1797,7 +1802,7 @@ static int role_trans_rule_write(policydb_t *p, role_trans_rule_t * t,
 	if (items != 1)
 		return POLICYDB_ERROR;
 	for (tr = t; tr; tr = tr->next) {
-		if (!new_role && !only_process(&tr->classes)) {
+		if (!new_role && !only_process(&tr->classes, p)) {
 			if (!warned)
 				WARN(fp->handle, "Discarding role_transition "
 					"rules for security classes other than "
-- 
2.24.1

