Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 73748E3DA3
	for <lists+selinux@lfdr.de>; Thu, 24 Oct 2019 22:53:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728584AbfJXUxS (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Thu, 24 Oct 2019 16:53:18 -0400
Received: from sonic306-26.consmr.mail.gq1.yahoo.com ([98.137.68.89]:41669
        "EHLO sonic306-26.consmr.mail.gq1.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728554AbfJXUxP (ORCPT
        <rfc822;selinux@vger.kernel.org>); Thu, 24 Oct 2019 16:53:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1571950393; bh=x2ypYq4u/dogPN3g5Oxt13BZBsIwePQE5swX4jNF68s=; h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject; b=J1pfvKDvha+f2KugCruofDgHNfW14MEoPT2rdK5TreFQf2Q8YeL7FRcD590GW1ku7t+kZkNctVx/QSO5o7FRxc0zTv1GQ64u3/rLKgpVq1v/9+31gfVT1lsdDczJGDfbSzwXQEB9inDpm7z64aWrLprylDU+2ORrtqaEchS61iuJXTwKpKK0mIQE/CFiMZcNEVl1NuLPOVG5lkqs5Ox4pXT4TvDubfp2xA4/3kyeWM+MGjU+TvUyxYRoSxXTyEQ6qa+xV/rg9Mw8uUX96/m3oilkiYqO/lcXc90+kAZIaD7313qXl9JiVY25dmH9HL7N0FuCVDLzdgsnnX/EA4J8jQ==
X-YMail-OSG: 6mMngzQVM1l8WUJ3lenZL_xzEeGE6xRPToIlXiLMVo.WkQ2DqGbqa9MDHnlvLWZ
 ZwjcJR4BKMUW4o6CdDA6577I1Z1XoAxavu6.8dvJDx3cyvy2iehiV2oziNzJEg14tVqMF_tO1w4w
 0v1lSPjNgBGTL.oxU.lfllX.QOUAEoLQDwiOfDFO.6gU_okAvsEgUikkgatb5WPLemZG_hPTTwu2
 90q4GrtwzrTsR2jyiSm61HCI57tgfJccoefgaxJiYvCoDo2GsQLGEGRStOwksXw9GYseOdDeNJ9L
 QsayuJ1c5hSheQOxgcEiDT01wi0LrJ4XjxzQ_VWogfrdCgGQ9OgUXlglY6VqkcfYZqrlG8k6vGTv
 SkPSgE8dD8CqJL1crBba80ypkaQhVKEay09ZHhYsdpnTGGBVT3uvE7Gz_08TbzP_OPxQAbeXVBrd
 LlvMh8.oQd5GGzwuGwpx6pbLXFENhdmkl2YaHmHW9OJqZtKhR6AynQL1mSswOqJEVe_gPMsMgu.d
 yfxFRWcY4g42fNi5VmtmKaobl1E5K1VQnooX7REgXRmx7rIBuq0eo5E.wRv6PnMB5hOEwtE39PjE
 ze5RnjyiLfhJCCOWLPjG_0_GG3yFi2PeV_OXokNf6L_lab4IwfOKQTfhsVCGqgHQlBl4nyM1gRP.
 VQy3LfNt502FzRcF28xRK9R97T0O1Aw5d4POGo7p5_IotSYizkZOy8WhUAJ.dTvxcSHGxBZydZ7Z
 IvTa9PRv3_Y5gh1M4XHY8fN.7iqZ6XmPnTx.2Tq_r8nrNSKTFsNvoJW1CYrBrJhD0FIxiyMdfblI
 2dQRlTy2t7BpFqWxU2BJ5vUT7VlG0324GSQC2woD4xrK4LGfScQNnCYI.H6xsyx7.1vCMfg_5NLP
 I9I2cOuL5RsS1oyJmF0uqAncKGJ5cnnWjdQIvMdRhArxicgFjhIWUF8MkwZrRd0nVIu.1Amvn2hi
 aSpYrFwJ._lXK8M90_EOFIGVxuiW0vvHrBcT0ygZB4NSTLOu3UzlD5vjqf8MNwmwTi1Ljpk8Rkop
 MrcCOxLhLxqxqdeeJ8mEvUcXBOwyAgdRcbnW.pBxt1ELTYhyFfdPYQ1v0LA4MAYf3ZM0hGe8ctp2
 AWYYsS3mLaRSlT9z.ap09CJmkzEkalxZyvgtP44YUzoty.PjBcx8krMUcAhBJrYZ2.m0sa2jklfb
 8NEMWW_aNYH0GTZn.ZvYLsQS9BGVQPnvANS7KIkOPSkX_joY2CdwqLJGQvbHXw.rMsUZV7NtpuQe
 3.XCUU1kFVbN0LiXzcVLqSctvEqx2x22myZ1mB_1WnbsQ2dh0wooIsG3ofTC.Q9N.O4UNGl0qsG.
 HAx0Q_uFwU2V4mvZspMtXnWc3xQ9XCBU3bILLn1XijvmXrHqiYinA9QvqoQkzqnksW1T7nao45T4
 oKzwueX3evJY-
Received: from sonic.gate.mail.ne1.yahoo.com by sonic306.consmr.mail.gq1.yahoo.com with HTTP; Thu, 24 Oct 2019 20:53:13 +0000
Received: by smtp417.mail.gq1.yahoo.com (Oath Hermes SMTP Server) with ESMTPA ID 5303e37f81df37f0f883923f3f0a8567;
          Thu, 24 Oct 2019 20:53:08 +0000 (UTC)
From:   Casey Schaufler <casey@schaufler-ca.com>
To:     casey.schaufler@intel.com, jmorris@namei.org,
        linux-security-module@vger.kernel.org, selinux@vger.kernel.org
Cc:     casey@schaufler-ca.com, keescook@chromium.org,
        john.johansen@canonical.com, penguin-kernel@i-love.sakura.ne.jp,
        paul@paul-moore.com, sds@tycho.nsa.gov
Subject: [PATCH v10 02/25] LSM: Create and manage the lsmblob data structure.
Date:   Thu, 24 Oct 2019 13:52:05 -0700
Message-Id: <20191024205228.6922-3-casey@schaufler-ca.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191024205228.6922-1-casey@schaufler-ca.com>
References: <20191024205228.6922-1-casey@schaufler-ca.com>
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

Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
---
 include/linux/lsm_hooks.h  | 12 ++++++--
 include/linux/security.h   | 58 ++++++++++++++++++++++++++++++++++++++
 security/apparmor/lsm.c    |  7 ++++-
 security/commoncap.c       |  7 ++++-
 security/loadpin/loadpin.c |  8 +++++-
 security/safesetid/lsm.c   |  8 +++++-
 security/security.c        | 31 +++++++++++++++-----
 security/selinux/hooks.c   |  8 +++++-
 security/smack/smack_lsm.c |  7 ++++-
 security/tomoyo/tomoyo.c   |  8 +++++-
 security/yama/yama_lsm.c   |  7 ++++-
 11 files changed, 144 insertions(+), 17 deletions(-)

diff --git a/include/linux/lsm_hooks.h b/include/linux/lsm_hooks.h
index 9a80c7e94785..24b7d78a36b2 100644
--- a/include/linux/lsm_hooks.h
+++ b/include/linux/lsm_hooks.h
@@ -2029,6 +2029,14 @@ struct security_hook_heads {
 #endif /* CONFIG_BPF_SYSCALL */
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
@@ -2037,7 +2045,7 @@ struct security_hook_list {
 	struct hlist_node		list;
 	struct hlist_head		*head;
 	union security_list_options	hook;
-	char				*lsm;
+	struct lsm_id			*lsmid;
 } __randomize_layout;
 
 /*
@@ -2066,7 +2074,7 @@ extern struct security_hook_heads security_hook_heads;
 extern char *lsm_names;
 
 extern void security_add_hooks(struct security_hook_list *hooks, int count,
-				char *lsm);
+			       struct lsm_id *lsmid);
 
 #define LSM_FLAG_LEGACY_MAJOR	BIT(0)
 #define LSM_FLAG_EXCLUSIVE	BIT(1)
diff --git a/include/linux/security.h b/include/linux/security.h
index 49f2685324b0..260760a6f6db 100644
--- a/include/linux/security.h
+++ b/include/linux/security.h
@@ -76,6 +76,64 @@ enum lsm_event {
 	LSM_POLICY_CHANGE,
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
index 2716e7731279..ec2e39aa9a84 100644
--- a/security/apparmor/lsm.c
+++ b/security/apparmor/lsm.c
@@ -1138,6 +1138,11 @@ struct lsm_blob_sizes apparmor_blob_sizes __lsm_ro_after_init = {
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
@@ -1679,7 +1684,7 @@ static int __init apparmor_init(void)
 		goto buffers_out;
 	}
 	security_add_hooks(apparmor_hooks, ARRAY_SIZE(apparmor_hooks),
-				"apparmor");
+				&apparmor_lsmid);
 
 	/* Report that AppArmor successfully initialized */
 	apparmor_initialized = 1;
diff --git a/security/commoncap.c b/security/commoncap.c
index afd9679ca866..973e6c7009d0 100644
--- a/security/commoncap.c
+++ b/security/commoncap.c
@@ -1344,6 +1344,11 @@ int cap_mmap_file(struct file *file, unsigned long reqprot,
 
 #ifdef CONFIG_SECURITY
 
+static struct lsm_id capability_lsmid __lsm_ro_after_init = {
+	.lsm  = "capability",
+	.slot = LSMBLOB_NOT_NEEDED
+};
+
 static struct security_hook_list capability_hooks[] __lsm_ro_after_init = {
 	LSM_HOOK_INIT(capable, cap_capable),
 	LSM_HOOK_INIT(settime, cap_settime),
@@ -1368,7 +1373,7 @@ static struct security_hook_list capability_hooks[] __lsm_ro_after_init = {
 static int __init capability_init(void)
 {
 	security_add_hooks(capability_hooks, ARRAY_SIZE(capability_hooks),
-				"capability");
+			   &capability_lsmid);
 	return 0;
 }
 
diff --git a/security/loadpin/loadpin.c b/security/loadpin/loadpin.c
index 055fb0a64169..7b23fdf24e27 100644
--- a/security/loadpin/loadpin.c
+++ b/security/loadpin/loadpin.c
@@ -181,6 +181,11 @@ static int loadpin_load_data(enum kernel_load_data_id id)
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
@@ -191,7 +196,8 @@ static int __init loadpin_init(void)
 {
 	pr_info("ready to pin (currently %senforcing)\n",
 		enforce ? "" : "not ");
-	security_add_hooks(loadpin_hooks, ARRAY_SIZE(loadpin_hooks), "loadpin");
+	security_add_hooks(loadpin_hooks, ARRAY_SIZE(loadpin_hooks),
+			   &loadpin_lsmid);
 	return 0;
 }
 
diff --git a/security/safesetid/lsm.c b/security/safesetid/lsm.c
index cecd38e2ac80..4a96cd8c0d15 100644
--- a/security/safesetid/lsm.c
+++ b/security/safesetid/lsm.c
@@ -255,6 +255,11 @@ void flush_safesetid_whitelist_entries(void)
 	}
 }
 
+static struct lsm_id safesetid_lsmid __lsm_ro_after_init = {
+	.lsm  = "safesetid",
+	.slot = LSMBLOB_NOT_NEEDED
+};
+
 static struct security_hook_list safesetid_security_hooks[] = {
 	LSM_HOOK_INIT(task_fix_setuid, safesetid_task_fix_setuid),
 	LSM_HOOK_INIT(capable, safesetid_security_capable)
@@ -263,7 +268,8 @@ static struct security_hook_list safesetid_security_hooks[] = {
 static int __init safesetid_security_init(void)
 {
 	security_add_hooks(safesetid_security_hooks,
-			   ARRAY_SIZE(safesetid_security_hooks), "safesetid");
+			   ARRAY_SIZE(safesetid_security_hooks),
+			   &safesetid_lsmid);
 
 	/* Report that SafeSetID successfully initialized */
 	safesetid_initialized = 1;
diff --git a/security/security.c b/security/security.c
index 757a8ee4da65..1cae4faaa279 100644
--- a/security/security.c
+++ b/security/security.c
@@ -309,6 +309,7 @@ static void __init ordered_lsm_init(void)
 	init_debug("msg_msg blob size  = %d\n", blob_sizes.lbs_msg_msg);
 	init_debug("sock blob size     = %d\n", blob_sizes.lbs_sock);
 	init_debug("task blob size     = %d\n", blob_sizes.lbs_task);
+	init_debug("lsmblob size       = %lu\n", sizeof(struct lsmblob));
 
 	/*
 	 * Create any kmem_caches needed for blobs
@@ -391,7 +392,7 @@ static bool match_last_lsm(const char *list, const char *lsm)
 	return !strcmp(last, lsm);
 }
 
-static int lsm_append(char *new, char **result)
+static int lsm_append(const char *new, char **result)
 {
 	char *cp;
 
@@ -412,24 +413,40 @@ static int lsm_append(char *new, char **result)
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
+ * @lsmid: the identification information for the security module
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
-	if (lsm_append(lsm, &lsm_names) < 0)
+
+	if (lsm_append(lsmid->lsm, &lsm_names) < 0)
 		panic("%s - Cannot get early memory.\n", __func__);
 }
 
@@ -1856,7 +1873,7 @@ int security_getprocattr(struct task_struct *p, const char *lsm, char *name,
 	struct security_hook_list *hp;
 
 	hlist_for_each_entry(hp, &security_hook_heads.getprocattr, list) {
-		if (lsm != NULL && strcmp(lsm, hp->lsm))
+		if (lsm != NULL && strcmp(lsm, hp->lsmid->lsm))
 			continue;
 		return hp->hook.getprocattr(p, name, value);
 	}
@@ -1869,7 +1886,7 @@ int security_setprocattr(const char *lsm, const char *name, void *value,
 	struct security_hook_list *hp;
 
 	hlist_for_each_entry(hp, &security_hook_heads.setprocattr, list) {
-		if (lsm != NULL && strcmp(lsm, hp->lsm))
+		if (lsm != NULL && strcmp(lsm, hp->lsmid->lsm))
 			continue;
 		return hp->hook.setprocattr(name, value, size);
 	}
diff --git a/security/selinux/hooks.c b/security/selinux/hooks.c
index d4a1304f1e99..7592b95b43c4 100644
--- a/security/selinux/hooks.c
+++ b/security/selinux/hooks.c
@@ -6645,6 +6645,11 @@ struct lsm_blob_sizes selinux_blob_sizes __lsm_ro_after_init = {
 	.lbs_sock = sizeof(struct sk_security_struct),
 };
 
+static struct lsm_id selinux_lsmid __lsm_ro_after_init = {
+	.lsm  = "selinux",
+	.slot = LSMBLOB_NEEDED
+};
+
 static struct security_hook_list selinux_hooks[] __lsm_ro_after_init = {
 	LSM_HOOK_INIT(binder_set_context_mgr, selinux_binder_set_context_mgr),
 	LSM_HOOK_INIT(binder_transaction, selinux_binder_transaction),
@@ -6902,7 +6907,8 @@ static __init int selinux_init(void)
 
 	hashtab_cache_init();
 
-	security_add_hooks(selinux_hooks, ARRAY_SIZE(selinux_hooks), "selinux");
+	security_add_hooks(selinux_hooks, ARRAY_SIZE(selinux_hooks),
+			   &selinux_lsmid);
 
 	if (avc_add_callback(selinux_netcache_avc_callback, AVC_CALLBACK_RESET))
 		panic("SELinux: Unable to register AVC netcache callback\n");
diff --git a/security/smack/smack_lsm.c b/security/smack/smack_lsm.c
index e64eb558334a..61e05fe86013 100644
--- a/security/smack/smack_lsm.c
+++ b/security/smack/smack_lsm.c
@@ -4571,6 +4571,11 @@ struct lsm_blob_sizes smack_blob_sizes __lsm_ro_after_init = {
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
@@ -4763,7 +4768,7 @@ static __init int smack_init(void)
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
index efac68556b45..0529ecc86954 100644
--- a/security/yama/yama_lsm.c
+++ b/security/yama/yama_lsm.c
@@ -425,6 +425,11 @@ static int yama_ptrace_traceme(struct task_struct *parent)
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
@@ -482,7 +487,7 @@ static inline void yama_init_sysctl(void) { }
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

