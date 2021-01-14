Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F9342F6AAF
	for <lists+selinux@lfdr.de>; Thu, 14 Jan 2021 20:17:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726997AbhANTQK (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Thu, 14 Jan 2021 14:16:10 -0500
Received: from linux.microsoft.com ([13.77.154.182]:55012 "EHLO
        linux.microsoft.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725950AbhANTQK (ORCPT
        <rfc822;selinux@vger.kernel.org>); Thu, 14 Jan 2021 14:16:10 -0500
Received: from localhost.localdomain (c-73-42-176-67.hsd1.wa.comcast.net [73.42.176.67])
        by linux.microsoft.com (Postfix) with ESMTPSA id 69F9F20B6C40;
        Thu, 14 Jan 2021 11:15:28 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 69F9F20B6C40
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
        s=default; t=1610651728;
        bh=I5hySNT1aoAPIwQkhC/+V7JRkIrmhf0Xu/FEZ6KXXW4=;
        h=From:To:Cc:Subject:Date:From;
        b=Td0Fx+CeRn6s+fDsdbJZa2yRtu/4W4otrnYPzxW37Yr3yoHxhcM845K5aiTkyopsW
         eyOUL7DPGox3FcagCLTU89BckFXDVw+umaxrfLr0fgruCtGllGqA7lrL/dzas8UWXX
         699tp94EmwXF4KuBeWyNsHDSRvS+DaRJAYIdbols=
From:   Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
To:     zohar@linux.ibm.com, paul@paul-moore.com,
        stephen.smalley.work@gmail.com, tusharsu@linux.microsoft.com
Cc:     tyhicks@linux.microsoft.com, casey@schaufler-ca.com,
        agk@redhat.com, snitzer@redhat.com, gmazyland@gmail.com,
        sashal@kernel.org, jmorris@namei.org,
        linux-integrity@vger.kernel.org, selinux@vger.kernel.org,
        linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] selinux: include a consumer of the new IMA critical data hook
Date:   Thu, 14 Jan 2021 11:15:22 -0800
Message-Id: <20210114191522.4001-1-nramas@linux.microsoft.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

SELinux stores the active policy in memory, so the changes to this data
at runtime would have an impact on the security guarantees provided
by SELinux.  Measuring in-memory SELinux policy through IMA subsystem
provides a secure way for the attestation service to remotely validate
the policy contents at runtime.

Measure the hash of the loaded policy by calling the IMA hook
ima_measure_critical_data().  Since the size of the loaded policy
can be large (several MB), measure the hash of the policy instead of
the entire policy to avoid bloating the IMA log entry.

To enable SELinux data measurement, the following steps are required:

1, Add "ima_policy=critical_data" to the kernel command line arguments
   to enable measuring SELinux data at boot time.
For example,
  BOOT_IMAGE=/boot/vmlinuz-5.10.0-rc1+ root=UUID=fd643309-a5d2-4ed3-b10d-3c579a5fab2f ro nomodeset security=selinux ima_policy=critical_data

2, Add the following rule to /etc/ima/ima-policy
   measure func=CRITICAL_DATA label=selinux

Sample measurement of the hash of SELinux policy:

To verify the measured data with the current SELinux policy run
the following commands and verify the output hash values match.

  sha256sum /sys/fs/selinux/policy | cut -d' ' -f 1

  grep "selinux-policy-hash" /sys/kernel/security/integrity/ima/ascii_runtime_measurements | tail -1 | cut -d' ' -f 6

Note that the actual verification of SELinux policy would require loading
the expected policy into an identical kernel on a pristine/known-safe
system and run the sha256sum /sys/kernel/selinux/policy there to get
the expected hash.

Signed-off-by: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
Suggested-by: Stephen Smalley <stephen.smalley.work@gmail.com>
Acked-by: Paul Moore <paul@paul-moore.com>
Reviewed-by: Tyler Hicks <tyhicks@linux.microsoft.com>
---
 Documentation/ABI/testing/ima_policy |  3 +-
 security/selinux/Makefile            |  2 +
 security/selinux/ima.c               | 44 +++++++++++++++++++
 security/selinux/include/ima.h       | 24 +++++++++++
 security/selinux/include/security.h  |  3 +-
 security/selinux/ss/services.c       | 64 ++++++++++++++++++++++++----
 6 files changed, 129 insertions(+), 11 deletions(-)
 create mode 100644 security/selinux/ima.c
 create mode 100644 security/selinux/include/ima.h

diff --git a/Documentation/ABI/testing/ima_policy b/Documentation/ABI/testing/ima_policy
index 54fe1c15ed50..8365596cb42b 100644
--- a/Documentation/ABI/testing/ima_policy
+++ b/Documentation/ABI/testing/ima_policy
@@ -52,8 +52,9 @@ Description:
 			template:= name of a defined IMA template type
 			(eg, ima-ng). Only valid when action is "measure".
 			pcr:= decimal value
-			label:= [data_label]
+			label:= [selinux]|[data_label]
 			data_label:= a unique string used for grouping and limiting critical data.
+			For example, "selinux" to measure critical data for SELinux.
 
 		  default policy:
 			# PROC_SUPER_MAGIC
diff --git a/security/selinux/Makefile b/security/selinux/Makefile
index 4d8e0e8adf0b..776162444882 100644
--- a/security/selinux/Makefile
+++ b/security/selinux/Makefile
@@ -16,6 +16,8 @@ selinux-$(CONFIG_NETLABEL) += netlabel.o
 
 selinux-$(CONFIG_SECURITY_INFINIBAND) += ibpkey.o
 
+selinux-$(CONFIG_IMA) += ima.o
+
 ccflags-y := -I$(srctree)/security/selinux -I$(srctree)/security/selinux/include
 
 $(addprefix $(obj)/,$(selinux-y)): $(obj)/flask.h
diff --git a/security/selinux/ima.c b/security/selinux/ima.c
new file mode 100644
index 000000000000..03715893ff97
--- /dev/null
+++ b/security/selinux/ima.c
@@ -0,0 +1,44 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2021 Microsoft Corporation
+ *
+ * Author: Lakshmi Ramasubramanian (nramas@linux.microsoft.com)
+ *
+ * Measure critical data structures maintainted by SELinux
+ * using IMA subsystem.
+ */
+#include <linux/vmalloc.h>
+#include <linux/ima.h>
+#include "security.h"
+#include "ima.h"
+
+/*
+ * selinux_ima_measure_state - Measure hash of the SELinux policy
+ *
+ * @state: selinux state struct
+ *
+ * NOTE: This function must be called with policy_mutex held.
+ */
+void selinux_ima_measure_state(struct selinux_state *state)
+{
+	void *policy = NULL;
+	size_t policy_len;
+	int rc = 0;
+
+	/*
+	 * Measure SELinux policy only after initialization is completed.
+	 */
+	if (!selinux_initialized(state))
+		return;
+
+	rc = security_read_state_kernel(state, &policy, &policy_len);
+	if (rc) {
+		pr_err("SELinux: %s: failed to read policy %d.\n", __func__, rc);
+		return;
+	}
+
+	ima_measure_critical_data("selinux", "selinux-policy-hash",
+				  policy, policy_len, true);
+
+	vfree(policy);
+}
diff --git a/security/selinux/include/ima.h b/security/selinux/include/ima.h
new file mode 100644
index 000000000000..d69c36611423
--- /dev/null
+++ b/security/selinux/include/ima.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Copyright (C) 2021 Microsoft Corporation
+ *
+ * Author: Lakshmi Ramasubramanian (nramas@linux.microsoft.com)
+ *
+ * Measure critical data structures maintainted by SELinux
+ * using IMA subsystem.
+ */
+
+#ifndef _SELINUX_IMA_H_
+#define _SELINUX_IMA_H_
+
+#include "security.h"
+
+#ifdef CONFIG_IMA
+extern void selinux_ima_measure_state(struct selinux_state *selinux_state);
+#else
+static inline void selinux_ima_measure_state(struct selinux_state *selinux_state)
+{
+}
+#endif
+
+#endif	/* _SELINUX_IMA_H_ */
diff --git a/security/selinux/include/security.h b/security/selinux/include/security.h
index 3cc8bab31ea8..29cae32d3fc5 100644
--- a/security/selinux/include/security.h
+++ b/security/selinux/include/security.h
@@ -229,7 +229,8 @@ void selinux_policy_cancel(struct selinux_state *state,
 			struct selinux_policy *policy);
 int security_read_policy(struct selinux_state *state,
 			 void **data, size_t *len);
-
+int security_read_state_kernel(struct selinux_state *state,
+			       void **data, size_t *len);
 int security_policycap_supported(struct selinux_state *state,
 				 unsigned int req_cap);
 
diff --git a/security/selinux/ss/services.c b/security/selinux/ss/services.c
index 9704c8a32303..cc8dbc4ed8db 100644
--- a/security/selinux/ss/services.c
+++ b/security/selinux/ss/services.c
@@ -65,6 +65,7 @@
 #include "ebitmap.h"
 #include "audit.h"
 #include "policycap_names.h"
+#include "ima.h"
 
 /* Forward declaration. */
 static int context_struct_to_string(struct policydb *policydb,
@@ -2180,6 +2181,7 @@ static void selinux_notify_policy_change(struct selinux_state *state,
 	selinux_status_update_policyload(state, seqno);
 	selinux_netlbl_cache_invalidate();
 	selinux_xfrm_notify_policyload();
+	selinux_ima_measure_state(state);
 }
 
 void selinux_policy_commit(struct selinux_state *state,
@@ -3875,8 +3877,33 @@ int security_netlbl_sid_to_secattr(struct selinux_state *state,
 }
 #endif /* CONFIG_NETLABEL */
 
+/**
+ * __security_read_policy - read the policy.
+ * @policy: SELinux policy
+ * @data: binary policy data
+ * @len: length of data in bytes
+ *
+ */
+static int __security_read_policy(struct selinux_policy *policy,
+				  void *data, size_t *len)
+{
+	int rc;
+	struct policy_file fp;
+
+	fp.data = data;
+	fp.len = *len;
+
+	rc = policydb_write(&policy->policydb, &fp);
+	if (rc)
+		return rc;
+
+	*len = (unsigned long)fp.data - (unsigned long)data;
+	return 0;
+}
+
 /**
  * security_read_policy - read the policy.
+ * @state: selinux_state
  * @data: binary policy data
  * @len: length of data in bytes
  *
@@ -3885,8 +3912,6 @@ int security_read_policy(struct selinux_state *state,
 			 void **data, size_t *len)
 {
 	struct selinux_policy *policy;
-	int rc;
-	struct policy_file fp;
 
 	policy = rcu_dereference_protected(
 			state->policy, lockdep_is_held(&state->policy_mutex));
@@ -3898,14 +3923,35 @@ int security_read_policy(struct selinux_state *state,
 	if (!*data)
 		return -ENOMEM;
 
-	fp.data = *data;
-	fp.len = *len;
+	return __security_read_policy(policy, *data, len);
+}
 
-	rc = policydb_write(&policy->policydb, &fp);
-	if (rc)
-		return rc;
+/**
+ * security_read_state_kernel - read the policy.
+ * @state: selinux_state
+ * @data: binary policy data
+ * @len: length of data in bytes
+ *
+ * Allocates kernel memory for reading SELinux policy.
+ * This function is for internal use only and should not
+ * be used for returning data to user space.
+ *
+ * This function must be called with policy_mutex held.
+ */
+int security_read_state_kernel(struct selinux_state *state,
+			       void **data, size_t *len)
+{
+	struct selinux_policy *policy;
 
-	*len = (unsigned long)fp.data - (unsigned long)*data;
-	return 0;
+	policy = rcu_dereference_protected(
+			state->policy, lockdep_is_held(&state->policy_mutex));
+	if (!policy)
+		return -EINVAL;
+
+	*len = policy->policydb.len;
+	*data = vmalloc(*len);
+	if (!*data)
+		return -ENOMEM;
 
+	return __security_read_policy(policy, *data, len);
 }
-- 
2.30.0

