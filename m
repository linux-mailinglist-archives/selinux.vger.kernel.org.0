Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24872224650
	for <lists+selinux@lfdr.de>; Sat, 18 Jul 2020 00:29:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727771AbgGQW2d (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Fri, 17 Jul 2020 18:28:33 -0400
Received: from linux.microsoft.com ([13.77.154.182]:46066 "EHLO
        linux.microsoft.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726710AbgGQW21 (ORCPT
        <rfc822;selinux@vger.kernel.org>); Fri, 17 Jul 2020 18:28:27 -0400
Received: from localhost.localdomain (c-73-42-176-67.hsd1.wa.comcast.net [73.42.176.67])
        by linux.microsoft.com (Postfix) with ESMTPSA id 46CC220B490E;
        Fri, 17 Jul 2020 15:28:25 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 46CC220B490E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
        s=default; t=1595024905;
        bh=FlxPpoHRlEy/uLV0zIbVvaBsQsJDtwjFtee4zr3BQuQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=qpdTMKfTRByOmxb6FUqMUf73lw6pUZIoQLqYguT0Kb4mZCaV5tvhiE/BzwCMC5pI6
         JLUiy1Tzf7lOPLMOm2bnfRckqTjHtbLVw4p7jC4cD6n7HNnG1i/WVmHbNlC9jj6r1z
         vGam79+Lxo481uw+DodhGbAdQwEsE2mf9ZIoxQ6U=
From:   Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
To:     zohar@linux.ibm.com, stephen.smalley.work@gmail.com,
        casey@schaufler-ca.com
Cc:     jmorris@namei.org, linux-integrity@vger.kernel.org,
        selinux@vger.kernel.org, linux-security-module@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/5] LSM: Define SELinux function to measure security state
Date:   Fri, 17 Jul 2020 15:28:18 -0700
Message-Id: <20200717222819.26198-5-nramas@linux.microsoft.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200717222819.26198-1-nramas@linux.microsoft.com>
References: <20200717222819.26198-1-nramas@linux.microsoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

SELinux configuration and policy are some of the critical data for this
security module that needs to be measured. To enable this measurement
SELinux needs to implement the interface function,
security_measure_data(), that the LSM can call.

Define the security_measure_data() function in SELinux to measure SELinux
configuration and policy. Call this function to measure SELinux data
when there is a change in the security module's state.

Sample measurement of SELinux state and hash of the policy:

10 e32e...5ac3 ima-buf sha256:86e8...4594 selinux-state 656e61626c65643d313b656e666f7263696e673d303b636865636b72657170726f743d313b6e6574706565723d313b6f70656e7065726d3d313b657874736f636b636c6173733d313b616c776179736e6574776f726b3d303b6367726f75707365636c6162656c3d313b6e6e706e6f737569647472616e736974696f6e3d313b67656e66737365636c6162656c73796d6c696e6b3d303b
10 f4a7...9408 ima-buf sha256:4941...68fc selinux-policy-hash 8d1d...1834

To verify the measurement check the following:

Execute the following command to extract the measured data
from the IMA log for SELinux configuration (selinux-state).

  cat /sys/kernel/security/integrity/ima/ascii_runtime_measurements | grep -m 1 "selinux-state" | cut -d' ' -f 6 | xxd -r -p

The output should be the list of key-value pairs. For example,
 enabled=1;enforcing=0;checkreqprot=1;network_peer_controls=1;open_perms=1;extended_socket_class=1;always_check_network=0;cgroup_seclabel=1;nnp_nosuid_transition=1;genfs_seclabel_symlinks=0;

To verify the measured data with the current SELinux state:

 => enabled should be set to 1 if /sys/fs/selinux folder exists,
    0 otherwise

For other entries, compare the integer value in the files
 => /sys/fs/selinux/enforce
 => /sys/fs/selinux/checkreqprot
And, each of the policy capabilities files under
 => /sys/fs/selinux/policy_capabilities

The data for selinux-policy-hash is the SHA256 hash of SELinux policy.

To verify the measured data with the current SELinux policy run
the following commands and verify the output hash values match.

  sha256sum /sys/fs/selinux/policy | cut -d' ' -f 1

  cat /sys/kernel/security/integrity/ima/ascii_runtime_measurements | grep -m 1 "selinux-policy-hash" | cut -d' ' -f 6

Signed-off-by: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
Suggested-by: Stephen Smalley <stephen.smalley.work@gmail.com>
---
 security/selinux/Makefile           |   2 +
 security/selinux/hooks.c            |   4 +
 security/selinux/include/security.h |  18 ++++
 security/selinux/measure.c          | 155 ++++++++++++++++++++++++++++
 security/selinux/selinuxfs.c        |   1 +
 security/selinux/ss/services.c      |  66 ++++++++++--
 6 files changed, 237 insertions(+), 9 deletions(-)
 create mode 100644 security/selinux/measure.c

diff --git a/security/selinux/Makefile b/security/selinux/Makefile
index 4d8e0e8adf0b..83d512116341 100644
--- a/security/selinux/Makefile
+++ b/security/selinux/Makefile
@@ -16,6 +16,8 @@ selinux-$(CONFIG_NETLABEL) += netlabel.o
 
 selinux-$(CONFIG_SECURITY_INFINIBAND) += ibpkey.o
 
+selinux-$(CONFIG_IMA) += measure.o
+
 ccflags-y := -I$(srctree)/security/selinux -I$(srctree)/security/selinux/include
 
 $(addprefix $(obj)/,$(selinux-y)): $(obj)/flask.h
diff --git a/security/selinux/hooks.c b/security/selinux/hooks.c
index efa6108b1ce9..cda1d328339f 100644
--- a/security/selinux/hooks.c
+++ b/security/selinux/hooks.c
@@ -7259,6 +7259,8 @@ static __init int selinux_init(void)
 
 	fs_validate_description("selinux", selinux_fs_parameters);
 
+	selinux_init_measurement();
+
 	return 0;
 }
 
@@ -7284,6 +7286,7 @@ DEFINE_LSM(selinux) = {
 	.enabled = &selinux_enabled_boot,
 	.blobs = &selinux_blob_sizes,
 	.init = selinux_init,
+	.security_measure_data = selinux_measure_data,
 };
 
 #if defined(CONFIG_NETFILTER)
@@ -7394,6 +7397,7 @@ int selinux_disable(struct selinux_state *state)
 	}
 
 	selinux_mark_disabled(state);
+	selinux_measure_state(state);
 
 	pr_info("SELinux:  Disabled at runtime.\n");
 
diff --git a/security/selinux/include/security.h b/security/selinux/include/security.h
index b0e02cfe3ce1..1f41c16a4845 100644
--- a/security/selinux/include/security.h
+++ b/security/selinux/include/security.h
@@ -222,16 +222,34 @@ static inline bool selinux_policycap_genfs_seclabel_symlinks(void)
 	return state->policycap[POLICYDB_CAPABILITY_GENFS_SECLABEL_SYMLINKS];
 }
 
+static inline bool selinux_checkreqprot(const struct selinux_state *state)
+{
+	return READ_ONCE(state->checkreqprot);
+}
+
 int security_mls_enabled(struct selinux_state *state);
 int security_load_policy(struct selinux_state *state,
 			 void *data, size_t len);
 int security_read_policy(struct selinux_state *state,
 			 void **data, size_t *len);
+int security_read_policy_kernel(struct selinux_state *state,
+				void **data, size_t *len);
 size_t security_policydb_len(struct selinux_state *state);
 
 int security_policycap_supported(struct selinux_state *state,
 				 unsigned int req_cap);
 
+#ifdef CONFIG_IMA
+extern void __init selinux_init_measurement(void);
+extern void selinux_measure_data(void);
+extern void selinux_measure_state(struct selinux_state *selinux_state);
+#else
+static inline void __init selinux_init_measurement(void) {}
+static inline void selinux_measure_data(void) {}
+static inline void selinux_measure_state(
+	struct selinux_state *selinux_state) {}
+#endif
+
 #define SEL_VEC_MAX 32
 struct av_decision {
 	u32 allowed;
diff --git a/security/selinux/measure.c b/security/selinux/measure.c
new file mode 100644
index 000000000000..659011637ae7
--- /dev/null
+++ b/security/selinux/measure.c
@@ -0,0 +1,155 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Measure SELinux state using IMA subsystem.
+ */
+#include <linux/ima.h>
+#include "security.h"
+
+/* Pre-allocated buffer used for measuring state */
+static char *selinux_state_string;
+static size_t selinux_state_string_len;
+static char *str_format = "%s=%d;";
+static int selinux_state_count;
+
+void __init selinux_init_measurement(void)
+{
+	int i;
+
+	/*
+	 * enabled
+	 * enforcing
+	 * checkreqport
+	 * All policy capability flags
+	 */
+	selinux_state_count = 3 + __POLICYDB_CAPABILITY_MAX;
+
+	selinux_state_string_len = snprintf(NULL, 0, str_format,
+					    "enabled", 0);
+	selinux_state_string_len += snprintf(NULL, 0, str_format,
+					     "enforcing", 0);
+	selinux_state_string_len += snprintf(NULL, 0, str_format,
+					     "checkreqprot", 0);
+	for (i = 3; i < selinux_state_count; i++) {
+		selinux_state_string_len +=
+			snprintf(NULL, 0, str_format,
+				 selinux_policycap_names[i-3], 0);
+	}
+	++selinux_state_string_len;
+
+	selinux_state_string = kzalloc(selinux_state_string_len, GFP_KERNEL);
+	if (!selinux_state_string) {
+		pr_warn("Failed to alloc memory for SELinux measurement\n");
+		selinux_state_string_len = 0;
+	}
+}
+
+static int selinux_hash_policy(const char *hash_alg_name,
+			       void *policy, size_t policy_len,
+			       void **policy_hash, int *policy_hash_len)
+{
+	struct crypto_shash *tfm;
+	struct shash_desc *desc = NULL;
+	void *digest = NULL;
+	int desc_size;
+	int digest_size;
+	int ret = 0;
+
+	tfm = crypto_alloc_shash(hash_alg_name, 0, 0);
+	if (IS_ERR(tfm))
+		return PTR_ERR(tfm);
+
+	desc_size = crypto_shash_descsize(tfm) + sizeof(*desc);
+	digest_size = crypto_shash_digestsize(tfm);
+
+	digest = kmalloc(digest_size, GFP_KERNEL);
+	if (!digest) {
+		ret = -ENOMEM;
+		goto error;
+	}
+
+	desc = kzalloc(desc_size, GFP_KERNEL);
+	if (!desc) {
+		ret = -ENOMEM;
+		goto error;
+	}
+
+	desc->tfm = tfm;
+
+	ret = crypto_shash_digest(desc, policy, policy_len, digest);
+	if (ret < 0)
+		goto error;
+
+	*policy_hash_len = digest_size;
+	*policy_hash = digest;
+	digest = NULL;
+
+error:
+	kfree(desc);
+	kfree(digest);
+
+	crypto_free_shash(tfm);
+
+	return ret;
+}
+
+void selinux_measure_state(struct selinux_state *selinux_state)
+{
+	void *policy = NULL;
+	void *policy_hash = NULL;
+	size_t curr, buflen;
+	int i, policy_hash_len, rc = 0;
+
+	if (!selinux_initialized(selinux_state)) {
+		pr_warn("%s: SELinux not yet initialized.\n", __func__);
+		return;
+	}
+
+	if (!selinux_state_string) {
+		pr_warn("%s: Buffer for state not allocated.\n", __func__);
+		return;
+	}
+
+	curr = snprintf(selinux_state_string, selinux_state_string_len,
+			str_format, "enabled",
+			!selinux_disabled(selinux_state));
+	curr += snprintf((selinux_state_string + curr),
+			 (selinux_state_string_len - curr),
+			 str_format, "enforcing",
+			 enforcing_enabled(selinux_state));
+	curr += snprintf((selinux_state_string + curr),
+			 (selinux_state_string_len - curr),
+			 str_format, "checkreqprot",
+			 selinux_checkreqprot(selinux_state));
+
+	for (i = 3; i < selinux_state_count; i++) {
+		curr += snprintf((selinux_state_string + curr),
+				 (selinux_state_string_len - curr),
+				 str_format,
+				 selinux_policycap_names[i - 3],
+				 selinux_state->policycap[i - 3]);
+	}
+
+	if (curr >= 0 && curr < selinux_state_string_len)
+		ima_lsm_state("selinux-state", selinux_state_string, curr);
+	else {
+		rc = -EINVAL;
+		goto out;
+	}
+
+	rc = security_read_policy_kernel(selinux_state, &policy, &buflen);
+	if (!rc)
+		rc = selinux_hash_policy("sha256", policy, buflen,
+					 &policy_hash, &policy_hash_len);
+	if (!rc)
+		ima_lsm_state("selinux-policy-hash", policy_hash,
+			      policy_hash_len);
+
+out:
+	vfree(policy);
+	kfree(policy_hash);
+}
+
+void selinux_measure_data(void)
+{
+	selinux_measure_state(&selinux_state);
+}
diff --git a/security/selinux/selinuxfs.c b/security/selinux/selinuxfs.c
index 4781314c2510..b1f70739d709 100644
--- a/security/selinux/selinuxfs.c
+++ b/security/selinux/selinuxfs.c
@@ -173,6 +173,7 @@ static ssize_t sel_write_enforce(struct file *file, const char __user *buf,
 			from_kuid(&init_user_ns, audit_get_loginuid(current)),
 			audit_get_sessionid(current));
 		enforcing_set(state, new_value);
+		selinux_measure_state(&selinux_state);
 		if (new_value)
 			avc_ss_reset(state->avc, 0);
 		selnl_notify_setenforce(new_value);
diff --git a/security/selinux/ss/services.c b/security/selinux/ss/services.c
index ef0afd878bfc..79a6b462f1fe 100644
--- a/security/selinux/ss/services.c
+++ b/security/selinux/ss/services.c
@@ -3720,14 +3720,22 @@ int security_netlbl_sid_to_secattr(struct selinux_state *state,
 }
 #endif /* CONFIG_NETLABEL */
 
+static int security_read_policy_len(struct selinux_state *state, size_t *len)
+{
+	if (!selinux_initialized(state))
+		return -EINVAL;
+
+	*len = security_policydb_len(state);
+	return 0;
+}
+
 /**
  * security_read_policy - read the policy.
  * @data: binary policy data
  * @len: length of data in bytes
- *
  */
-int security_read_policy(struct selinux_state *state,
-			 void **data, size_t *len)
+int security_read_selinux_policy(struct selinux_state *state,
+				 void **data, size_t *len)
 {
 	struct policydb *policydb = &state->ss->policydb;
 	int rc;
@@ -3736,12 +3744,6 @@ int security_read_policy(struct selinux_state *state,
 	if (!selinux_initialized(state))
 		return -EINVAL;
 
-	*len = security_policydb_len(state);
-
-	*data = vmalloc_user(*len);
-	if (!*data)
-		return -ENOMEM;
-
 	fp.data = *data;
 	fp.len = *len;
 
@@ -3754,5 +3756,51 @@ int security_read_policy(struct selinux_state *state,
 
 	*len = (unsigned long)fp.data - (unsigned long)*data;
 	return 0;
+}
+
+/**
+ * security_read_policy - read the policy.
+ * @data: binary policy data
+ * @len: length of data in bytes
+ *
+ */
+int security_read_policy(struct selinux_state *state,
+			 void **data, size_t *len)
+{
+	int rc;
+
+	rc = security_read_policy_len(state, len);
+	if (rc)
+		return rc;
+
+	*data = vmalloc_user(*len);
+	if (!*data)
+		return -ENOMEM;
+
+	return security_read_selinux_policy(state, data, len);
+}
+
+/**
+ * security_read_policy_kernel - read the policy.
+ * @data: binary policy data
+ * @len: length of data in bytes
+ *
+ * Allocates kernel memory for reading SELinux policy.
+ * This function is for internal use only and should not
+ * be used for returning data to user space
+ */
+int security_read_policy_kernel(struct selinux_state *state,
+				void **data, size_t *len)
+{
+	int rc;
+
+	rc = security_read_policy_len(state, len);
+	if (rc)
+		return rc;
+
+	*data = vmalloc(*len);
+	if (!*data)
+		return -ENOMEM;
 
+	return security_read_selinux_policy(state, data, len);
 }
-- 
2.27.0

