Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D8AE012A4CD
	for <lists+selinux@lfdr.de>; Wed, 25 Dec 2019 01:00:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726256AbfLYAAH (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Tue, 24 Dec 2019 19:00:07 -0500
Received: from sonic311-31.consmr.mail.ne1.yahoo.com ([66.163.188.212]:34234
        "EHLO sonic311-31.consmr.mail.ne1.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726245AbfLYAAH (ORCPT
        <rfc822;selinux@vger.kernel.org>); Tue, 24 Dec 2019 19:00:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1577232004; bh=fT3ufAk6BNWpCWESqMw8yjtM+fDaZgx5jkv38GDqOUw=; h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject; b=JhYelWB/ugPdAnJoh3PkdRCWZhLV2T2PXRiHBmQUUf536yxhKrUGh8D8pd3hF/TA2x3n5NIjvszz3hiHj3pDFkGohnRMG0y6RDAg8kVv7iYio6tEzftw/Knki0LvkuUV8BVjB2o/kI3xOYUg3MGZ5A3O3L/LGeZNTBEahYa5XAz2alQExgy/BL5bOnKLDInX5ziVQ4Kby2LZuxLPkRwmm+Lfa5LY5RGUxbQw+ErHUZIXI4SP5GjSu6Mu/ex36J2YIRVzvfJyB1kS6cDxjahru3ROlxxOczYByiQK9cd6L6JwuiimhT320H2YKmrKaN8RQlTUcUidipM4lBOk2gr7tQ==
X-YMail-OSG: RHd67J8VM1mqbcqQFgJizU6tdGrvyeTAOTbjRHJxNe2eFVcDg2OxoNxc5OTD3Zd
 .jbSV8OjTMBBi3zeEiJxzXtl_jqdhtx.cnaqJRwVUEAVo7vq1AqLFEIHcEL5PUDYTDL3BJmT4IYO
 wHl6_Lrq5559_vcc6SwKtiMDgYeWsXPz6B3Mpyx81q30s4KhGLJDA85y6K0CU8Mtig.Zt5hQKHBC
 7mDdvLwkYSJITdgwl8TbZCImmbYQTbsygSlaQICgo1DsnzXga2rxuTJRk0ImcSqWn3_e1UpXT5wU
 f5SxdIaInWd1w8PkVXSDVb78tOJsS6T0RbOeE3uqSrDJo.WUCoeRihmN3eHAgM1CNySBAdZU7jn1
 ACaDhsEgHCPoqF3vC1WP0CpOIWPmQn6nvFBVlt4.ieqjF0G2rIh0KAIfh3TXe9ck6AmeggTNP72K
 tdImerNl.B3zZJqRTbuDj1DMw5Z3eTELHLmGmCk.Y.w9Ok3bsO8ZnuV4GB1guFHadwDLxGinJ__n
 ugt0HhosR9ExdTYT5GT6wCKB2MBWfvQ7JJ0jpJdVy8tOBqkumy3YnfTTclnlywVxZ2zOr29K_ZH0
 hsnJbq1_rSJwCgcRCDZV1WtGeA2MY5sUd5bke9YHkSr5JOYd1wpQ1zysvK_RMQxlS.CycJpp9Bdi
 WHyuOHEbN1ipRXG_0fb1PaNu6nzzPDmCBleGe62zpEA.YLEmrm7AQltIwngkpxUnXARH2TM5d3_T
 zbCIDMnd5h2nKLVNZxBVdQ2RwJ9O3GV32Vh2yLVqOdXxr_xcgdffuoqNp9NXCV2ZQzRMqwBNOXRb
 VNKJQAZGCHU.sj0vm8rfh5y3DIDzP_dUtpx_aZjwJbocXYwAeKcIgJc_WxhZctOwKXHdOP6HVy_Z
 ZdMaOb7yX6cYtuXABj4rX4Z_aDiibijDZg275lblpfqDknZPRpYEPut4bW8zIgv9fjRQh5WEZdMk
 qwDuhLyDieaEoT01CIZ1yS.uF6yLyj__N0w..955icibNvcknfpAIu7r0Ig0FQxTnzVtvdcaEZu9
 dKDytLUalDD4WIdQMipBm4migNREqpXmA3uHMQShkg6aZb6CxVbP8xUYt9TM4XtAas_yyn591HE2
 gKvsX1qT2jC1mFQdmK2PEqq5RUiukdsh6Emm_yX96LvGYR81XzdaL1LS0PdPKCgUPyvOA878D.FV
 MP28wTGHaaUkmb0DCNUdJ71B5bMuUXx6QDzucAXf8XWPUWgk80U0ob8FC0BnJfuN5Co2slRXqHFL
 5z4eeWeD1oEi_4c8CDJDu66xUdVrvL2EqWpgB3aSnNWe2iJMRfG2oYQ2_ajc7YWi9z4UoAEnpgjn
 kkOE99Zj6CgjmmIa.SlzqsFUQQ2naA7yw7W3MVM_OYjVkOpg9hH9.Wo6pMG09WAlNBRkpTy2dNlD
 BZh4RygoOTShbVH8Xdg8Sx8_J4JiwithuROPGg_N2dfetwvlQ4wHULnNHwCvcOv.rlKo8Y.Uc
Received: from sonic.gate.mail.ne1.yahoo.com by sonic311.consmr.mail.ne1.yahoo.com with HTTP; Wed, 25 Dec 2019 00:00:04 +0000
Received: by smtp422.mail.ne1.yahoo.com (Oath Hermes SMTP Server) with ESMTPA ID 001a47d8cb2e601c953a3f6dae1f6bf1;
          Wed, 25 Dec 2019 00:00:02 +0000 (UTC)
From:   Casey Schaufler <casey@schaufler-ca.com>
To:     casey.schaufler@intel.com, jmorris@namei.org,
        linux-security-module@vger.kernel.org, selinux@vger.kernel.org
Cc:     casey@schaufler-ca.com, keescook@chromium.org,
        john.johansen@canonical.com, penguin-kernel@i-love.sakura.ne.jp,
        paul@paul-moore.com, sds@tycho.nsa.gov
Subject: [PATCH v13 02/25] LSM: Create and manage the lsmblob data structure.
Date:   Tue, 24 Dec 2019 15:59:16 -0800
Message-Id: <20191224235939.7483-3-casey@schaufler-ca.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191224235939.7483-1-casey@schaufler-ca.com>
References: <20191224235939.7483-1-casey@schaufler-ca.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

When more than one security module is exporting data to
audit and networking sub-systems a single 32 bit integer
is no longer sufficient to represent the data. Add a
structure to be used instead.

The lsmblob structure is currently an array of
u32 "secids". There is an entry for each of the
security modules built into the system that would
use secids if active. The system assigns the module
a "slot" when it registers hooks. If modules are
compiled in but not registered there will be unused
slots.

A new lsm_id structure, which contains the name
of the LSM and its slot number, is created. There
is an instance for each LSM, which assigns the name
and passes it to the infrastructure to set the slot.

Reviewed-by: John Johansen <john.johansen@canonical.com>
Acked-by: Stephen Smalley <sds@tycho.nsa.gov>
Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
---
 include/linux/lsm_hooks.h    | 12 ++++++--
 include/linux/security.h     | 58 ++++++++++++++++++++++++++++++++++++
 security/apparmor/lsm.c      |  7 ++++-
 security/commoncap.c         |  7 ++++-
 security/loadpin/loadpin.c   |  8 ++++-
 security/lockdown/lockdown.c |  7 ++++-
 security/safesetid/lsm.c     |  8 ++++-
 security/security.c          | 28 +++++++++++++----
 security/selinux/hooks.c     |  8 ++++-
 security/smack/smack_lsm.c   |  7 ++++-
 security/tomoyo/tomoyo.c     |  8 ++++-
 security/yama/yama_lsm.c     |  7 ++++-
 12 files changed, 148 insertions(+), 17 deletions(-)

diff --git a/include/linux/lsm_hooks.h b/include/linux/lsm_hooks.h
index c2b1af29a8f0..7eb808cde051 100644
--- a/include/linux/lsm_hooks.h
+++ b/include/linux/lsm_hooks.h
@@ -2077,6 +2077,14 @@ struct security_hook_heads {
 #endif
 } __randomize_layout;
 
+/*
+ * Information that identifies a security module.
+ */
+struct lsm_id {
+	const char	*lsm;	/* Name of the LSM */
+	int		slot;	/* Slot in lsmblob if one is allocated */
+};
+
 /*
  * Security module hook list structure.
  * For use with generic list macros for common operations.
@@ -2085,7 +2093,7 @@ struct security_hook_list {
 	struct hlist_node		list;
 	struct hlist_head		*head;
 	union security_list_options	hook;
-	char				*lsm;
+	struct lsm_id			*lsmid;
 } __randomize_layout;
 
 /*
@@ -2114,7 +2122,7 @@ extern struct security_hook_heads security_hook_heads;
 extern char *lsm_names;
 
 extern void security_add_hooks(struct security_hook_list *hooks, int count,
-				char *lsm);
+			       struct lsm_id *lsmid);
 
 #define LSM_FLAG_LEGACY_MAJOR	BIT(0)
 #define LSM_FLAG_EXCLUSIVE	BIT(1)
diff --git a/include/linux/security.h b/include/linux/security.h
index 3e8d4bacd59d..b74dc70088ca 100644
--- a/include/linux/security.h
+++ b/include/linux/security.h
@@ -128,6 +128,64 @@ enum lockdown_reason {
 	LOCKDOWN_CONFIDENTIALITY_MAX,
 };
 
+/*
+ * Data exported by the security modules
+ *
+ * Any LSM that provides secid or secctx based hooks must be included.
+ */
+#define LSMBLOB_ENTRIES ( \
+	(IS_ENABLED(CONFIG_SECURITY_SELINUX) ? 1 : 0) + \
+	(IS_ENABLED(CONFIG_SECURITY_SMACK) ? 1 : 0) + \
+	(IS_ENABLED(CONFIG_SECURITY_APPARMOR) ? 1 : 0))
+
+struct lsmblob {
+	u32     secid[LSMBLOB_ENTRIES];
+};
+
+#define LSMBLOB_INVALID		-1	/* Not a valid LSM slot number */
+#define LSMBLOB_NEEDED		-2	/* Slot requested on initialization */
+#define LSMBLOB_NOT_NEEDED	-3	/* Slot not requested */
+
+/**
+ * lsmblob_init - initialize an lsmblob structure.
+ * @blob: Pointer to the data to initialize
+ * @secid: The initial secid value
+ *
+ * Set all secid for all modules to the specified value.
+ */
+static inline void lsmblob_init(struct lsmblob *blob, u32 secid)
+{
+	int i;
+
+	for (i = 0; i < LSMBLOB_ENTRIES; i++)
+		blob->secid[i] = secid;
+}
+
+/**
+ * lsmblob_is_set - report if there is an value in the lsmblob
+ * @blob: Pointer to the exported LSM data
+ *
+ * Returns true if there is a secid set, false otherwise
+ */
+static inline bool lsmblob_is_set(struct lsmblob *blob)
+{
+	struct lsmblob empty = {};
+
+	return !!memcmp(blob, &empty, sizeof(*blob));
+}
+
+/**
+ * lsmblob_equal - report if the two lsmblob's are equal
+ * @bloba: Pointer to one LSM data
+ * @blobb: Pointer to the other LSM data
+ *
+ * Returns true if all entries in the two are equal, false otherwise
+ */
+static inline bool lsmblob_equal(struct lsmblob *bloba, struct lsmblob *blobb)
+{
+	return !memcmp(bloba, blobb, sizeof(*bloba));
+}
+
 /* These functions are in security/commoncap.c */
 extern int cap_capable(const struct cred *cred, struct user_namespace *ns,
 		       int cap, unsigned int opts);
diff --git a/security/apparmor/lsm.c b/security/apparmor/lsm.c
index 61b24f4eb355..146d75e5e021 100644
--- a/security/apparmor/lsm.c
+++ b/security/apparmor/lsm.c
@@ -1147,6 +1147,11 @@ struct lsm_blob_sizes apparmor_blob_sizes __lsm_ro_after_init = {
 	.lbs_sock = sizeof(struct aa_sk_ctx),
 };
 
+static struct lsm_id apparmor_lsmid __lsm_ro_after_init = {
+	.lsm  = "apparmor",
+	.slot = LSMBLOB_NEEDED
+};
+
 static struct security_hook_list apparmor_hooks[] __lsm_ro_after_init = {
 	LSM_HOOK_INIT(ptrace_access_check, apparmor_ptrace_access_check),
 	LSM_HOOK_INIT(ptrace_traceme, apparmor_ptrace_traceme),
@@ -1847,7 +1852,7 @@ static int __init apparmor_init(void)
 		goto buffers_out;
 	}
 	security_add_hooks(apparmor_hooks, ARRAY_SIZE(apparmor_hooks),
-				"apparmor");
+				&apparmor_lsmid);
 
 	/* Report that AppArmor successfully initialized */
 	apparmor_initialized = 1;
diff --git a/security/commoncap.c b/security/commoncap.c
index f4ee0ae106b2..9dcfd2a0e891 100644
--- a/security/commoncap.c
+++ b/security/commoncap.c
@@ -1339,6 +1339,11 @@ int cap_mmap_file(struct file *file, unsigned long reqprot,
 
 #ifdef CONFIG_SECURITY
 
+static struct lsm_id capability_lsmid __lsm_ro_after_init = {
+	.lsm  = "capability",
+	.slot = LSMBLOB_NOT_NEEDED
+};
+
 static struct security_hook_list capability_hooks[] __lsm_ro_after_init = {
 	LSM_HOOK_INIT(capable, cap_capable),
 	LSM_HOOK_INIT(settime, cap_settime),
@@ -1363,7 +1368,7 @@ static struct security_hook_list capability_hooks[] __lsm_ro_after_init = {
 static int __init capability_init(void)
 {
 	security_add_hooks(capability_hooks, ARRAY_SIZE(capability_hooks),
-				"capability");
+			   &capability_lsmid);
 	return 0;
 }
 
diff --git a/security/loadpin/loadpin.c b/security/loadpin/loadpin.c
index ee5cb944f4ad..86317e78899f 100644
--- a/security/loadpin/loadpin.c
+++ b/security/loadpin/loadpin.c
@@ -180,6 +180,11 @@ static int loadpin_load_data(enum kernel_load_data_id id)
 	return loadpin_read_file(NULL, (enum kernel_read_file_id) id);
 }
 
+static struct lsm_id loadpin_lsmid __lsm_ro_after_init = {
+	.lsm  = "loadpin",
+	.slot = LSMBLOB_NOT_NEEDED
+};
+
 static struct security_hook_list loadpin_hooks[] __lsm_ro_after_init = {
 	LSM_HOOK_INIT(sb_free_security, loadpin_sb_free_security),
 	LSM_HOOK_INIT(kernel_read_file, loadpin_read_file),
@@ -227,7 +232,8 @@ static int __init loadpin_init(void)
 	pr_info("ready to pin (currently %senforcing)\n",
 		enforce ? "" : "not ");
 	parse_exclude();
-	security_add_hooks(loadpin_hooks, ARRAY_SIZE(loadpin_hooks), "loadpin");
+	security_add_hooks(loadpin_hooks, ARRAY_SIZE(loadpin_hooks),
+			   &loadpin_lsmid);
 	return 0;
 }
 
diff --git a/security/lockdown/lockdown.c b/security/lockdown/lockdown.c
index b2f87015d6e9..91662325e450 100644
--- a/security/lockdown/lockdown.c
+++ b/security/lockdown/lockdown.c
@@ -102,6 +102,11 @@ static struct security_hook_list lockdown_hooks[] __lsm_ro_after_init = {
 	LSM_HOOK_INIT(locked_down, lockdown_is_locked_down),
 };
 
+static struct lsm_id lockdown_lsmid __lsm_ro_after_init = {
+	.lsm = "landlock",
+	.slot = LSMBLOB_NOT_NEEDED
+};
+
 static int __init lockdown_lsm_init(void)
 {
 #if defined(CONFIG_LOCK_DOWN_KERNEL_FORCE_INTEGRITY)
@@ -110,7 +115,7 @@ static int __init lockdown_lsm_init(void)
 	lock_kernel_down("Kernel configuration", LOCKDOWN_CONFIDENTIALITY_MAX);
 #endif
 	security_add_hooks(lockdown_hooks, ARRAY_SIZE(lockdown_hooks),
-			   "lockdown");
+			   &lockdown_lsmid);
 	return 0;
 }
 
diff --git a/security/safesetid/lsm.c b/security/safesetid/lsm.c
index 7760019ad35d..950dfb7f931e 100644
--- a/security/safesetid/lsm.c
+++ b/security/safesetid/lsm.c
@@ -149,6 +149,11 @@ static int safesetid_task_fix_setuid(struct cred *new,
 	return -EACCES;
 }
 
+static struct lsm_id safesetid_lsmid __lsm_ro_after_init = {
+	.lsm  = "safesetid",
+	.slot = LSMBLOB_NOT_NEEDED
+};
+
 static struct security_hook_list safesetid_security_hooks[] = {
 	LSM_HOOK_INIT(task_fix_setuid, safesetid_task_fix_setuid),
 	LSM_HOOK_INIT(capable, safesetid_security_capable)
@@ -157,7 +162,8 @@ static struct security_hook_list safesetid_security_hooks[] = {
 static int __init safesetid_security_init(void)
 {
 	security_add_hooks(safesetid_security_hooks,
-			   ARRAY_SIZE(safesetid_security_hooks), "safesetid");
+			   ARRAY_SIZE(safesetid_security_hooks),
+			   &safesetid_lsmid);
 
 	/* Report that SafeSetID successfully initialized */
 	safesetid_initialized = 1;
diff --git a/security/security.c b/security/security.c
index 7fb6e5bcf6ec..87fc70f77660 100644
--- a/security/security.c
+++ b/security/security.c
@@ -308,6 +308,7 @@ static void __init ordered_lsm_init(void)
 	init_debug("msg_msg blob size  = %d\n", blob_sizes.lbs_msg_msg);
 	init_debug("sock blob size     = %d\n", blob_sizes.lbs_sock);
 	init_debug("task blob size     = %d\n", blob_sizes.lbs_task);
+	init_debug("lsmblob size       = %zu\n", sizeof(struct lsmblob));
 
 	/*
 	 * Create any kmem_caches needed for blobs
@@ -435,21 +436,36 @@ static int lsm_append(const char *new, char **result)
 	return 0;
 }
 
+/*
+ * Current index to use while initializing the lsmblob secid list.
+ */
+static int lsm_slot __initdata;
+
 /**
  * security_add_hooks - Add a modules hooks to the hook lists.
  * @hooks: the hooks to add
  * @count: the number of hooks to add
- * @lsm: the name of the security module
+ * @lsmid: the the identification information for the security module
  *
  * Each LSM has to register its hooks with the infrastructure.
+ * If the LSM is using hooks that export secids allocate a slot
+ * for it in the lsmblob.
  */
 void __init security_add_hooks(struct security_hook_list *hooks, int count,
-				char *lsm)
+			       struct lsm_id *lsmid)
 {
 	int i;
 
+	if (lsmid->slot == LSMBLOB_NEEDED) {
+		if (lsm_slot >= LSMBLOB_ENTRIES)
+			panic("%s Too many LSMs registered.\n", __func__);
+		lsmid->slot = lsm_slot++;
+		init_debug("%s assigned lsmblob slot %d\n", lsmid->lsm,
+			   lsmid->slot);
+	}
+
 	for (i = 0; i < count; i++) {
-		hooks[i].lsm = lsm;
+		hooks[i].lsmid = lsmid;
 		hlist_add_tail_rcu(&hooks[i].list, hooks[i].head);
 	}
 
@@ -458,7 +474,7 @@ void __init security_add_hooks(struct security_hook_list *hooks, int count,
 	 * and fix this up afterwards.
 	 */
 	if (slab_is_available()) {
-		if (lsm_append(lsm, &lsm_names) < 0)
+		if (lsm_append(lsmid->lsm, &lsm_names) < 0)
 			panic("%s - Cannot get early memory.\n", __func__);
 	}
 }
@@ -1906,7 +1922,7 @@ int security_getprocattr(struct task_struct *p, const char *lsm, char *name,
 	struct security_hook_list *hp;
 
 	hlist_for_each_entry(hp, &security_hook_heads.getprocattr, list) {
-		if (lsm != NULL && strcmp(lsm, hp->lsm))
+		if (lsm != NULL && strcmp(lsm, hp->lsmid->lsm))
 			continue;
 		return hp->hook.getprocattr(p, name, value);
 	}
@@ -1919,7 +1935,7 @@ int security_setprocattr(const char *lsm, const char *name, void *value,
 	struct security_hook_list *hp;
 
 	hlist_for_each_entry(hp, &security_hook_heads.setprocattr, list) {
-		if (lsm != NULL && strcmp(lsm, hp->lsm))
+		if (lsm != NULL && strcmp(lsm, hp->lsmid->lsm))
 			continue;
 		return hp->hook.setprocattr(name, value, size);
 	}
diff --git a/security/selinux/hooks.c b/security/selinux/hooks.c
index 0839b2fbbf9b..97f2ee6e4080 100644
--- a/security/selinux/hooks.c
+++ b/security/selinux/hooks.c
@@ -6860,6 +6860,11 @@ static int selinux_perf_event_write(struct perf_event *event)
 }
 #endif
 
+static struct lsm_id selinux_lsmid __lsm_ro_after_init = {
+	.lsm  = "selinux",
+	.slot = LSMBLOB_NEEDED
+};
+
 static struct security_hook_list selinux_hooks[] __lsm_ro_after_init = {
 	LSM_HOOK_INIT(binder_set_context_mgr, selinux_binder_set_context_mgr),
 	LSM_HOOK_INIT(binder_transaction, selinux_binder_transaction),
@@ -7128,7 +7133,8 @@ static __init int selinux_init(void)
 
 	hashtab_cache_init();
 
-	security_add_hooks(selinux_hooks, ARRAY_SIZE(selinux_hooks), "selinux");
+	security_add_hooks(selinux_hooks, ARRAY_SIZE(selinux_hooks),
+			   &selinux_lsmid);
 
 	if (avc_add_callback(selinux_netcache_avc_callback, AVC_CALLBACK_RESET))
 		panic("SELinux: Unable to register AVC netcache callback\n");
diff --git a/security/smack/smack_lsm.c b/security/smack/smack_lsm.c
index 4cecdfdcd913..82cbb3eeec76 100644
--- a/security/smack/smack_lsm.c
+++ b/security/smack/smack_lsm.c
@@ -4585,6 +4585,11 @@ struct lsm_blob_sizes smack_blob_sizes __lsm_ro_after_init = {
 	.lbs_sock = sizeof(struct socket_smack),
 };
 
+static struct lsm_id smack_lsmid __lsm_ro_after_init = {
+	.lsm  = "smack",
+	.slot = LSMBLOB_NEEDED
+};
+
 static struct security_hook_list smack_hooks[] __lsm_ro_after_init = {
 	LSM_HOOK_INIT(ptrace_access_check, smack_ptrace_access_check),
 	LSM_HOOK_INIT(ptrace_traceme, smack_ptrace_traceme),
@@ -4783,7 +4788,7 @@ static __init int smack_init(void)
 	/*
 	 * Register with LSM
 	 */
-	security_add_hooks(smack_hooks, ARRAY_SIZE(smack_hooks), "smack");
+	security_add_hooks(smack_hooks, ARRAY_SIZE(smack_hooks), &smack_lsmid);
 	smack_enabled = 1;
 
 	pr_info("Smack:  Initializing.\n");
diff --git a/security/tomoyo/tomoyo.c b/security/tomoyo/tomoyo.c
index 716c92ec941a..f1968e80f06d 100644
--- a/security/tomoyo/tomoyo.c
+++ b/security/tomoyo/tomoyo.c
@@ -529,6 +529,11 @@ static void tomoyo_task_free(struct task_struct *task)
 	}
 }
 
+static struct lsm_id tomoyo_lsmid __lsm_ro_after_init = {
+	.lsm  = "tomoyo",
+	.slot = LSMBLOB_NOT_NEEDED
+};
+
 /*
  * tomoyo_security_ops is a "struct security_operations" which is used for
  * registering TOMOYO.
@@ -581,7 +586,8 @@ static int __init tomoyo_init(void)
 	struct tomoyo_task *s = tomoyo_task(current);
 
 	/* register ourselves with the security framework */
-	security_add_hooks(tomoyo_hooks, ARRAY_SIZE(tomoyo_hooks), "tomoyo");
+	security_add_hooks(tomoyo_hooks, ARRAY_SIZE(tomoyo_hooks),
+			   &tomoyo_lsmid);
 	pr_info("TOMOYO Linux initialized\n");
 	s->domain_info = &tomoyo_kernel_domain;
 	atomic_inc(&tomoyo_kernel_domain.users);
diff --git a/security/yama/yama_lsm.c b/security/yama/yama_lsm.c
index 94dc346370b1..0f0cf7136929 100644
--- a/security/yama/yama_lsm.c
+++ b/security/yama/yama_lsm.c
@@ -421,6 +421,11 @@ static int yama_ptrace_traceme(struct task_struct *parent)
 	return rc;
 }
 
+static struct lsm_id yama_lsmid __lsm_ro_after_init = {
+	.lsm  = "yama",
+	.slot = LSMBLOB_NOT_NEEDED
+};
+
 static struct security_hook_list yama_hooks[] __lsm_ro_after_init = {
 	LSM_HOOK_INIT(ptrace_access_check, yama_ptrace_access_check),
 	LSM_HOOK_INIT(ptrace_traceme, yama_ptrace_traceme),
@@ -477,7 +482,7 @@ static inline void yama_init_sysctl(void) { }
 static int __init yama_init(void)
 {
 	pr_info("Yama: becoming mindful.\n");
-	security_add_hooks(yama_hooks, ARRAY_SIZE(yama_hooks), "yama");
+	security_add_hooks(yama_hooks, ARRAY_SIZE(yama_hooks), &yama_lsmid);
 	yama_init_sysctl();
 	return 0;
 }
-- 
2.20.1

