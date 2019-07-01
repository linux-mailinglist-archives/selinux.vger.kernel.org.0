Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AB70E58A3B
	for <lists+selinux@lfdr.de>; Thu, 27 Jun 2019 20:56:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726502AbfF0S42 (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Thu, 27 Jun 2019 14:56:28 -0400
Received: from mga12.intel.com ([192.55.52.136]:10284 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726426AbfF0S41 (ORCPT <rfc822;selinux@vger.kernel.org>);
        Thu, 27 Jun 2019 14:56:27 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 27 Jun 2019 11:56:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,424,1557212400"; 
   d="scan'208";a="361259288"
Received: from bxing-desk.ccr.corp.intel.com (HELO ubt18.jf.intel.com) ([134.134.148.187])
  by fmsmga006.fm.intel.com with ESMTP; 27 Jun 2019 11:56:26 -0700
From:   Cedric Xing <cedric.xing@intel.com>
To:     linux-sgx@vger.kernel.org, linux-security-module@vger.kernel.org,
        selinux@vger.kernel.org, cedric.xing@intel.com
Cc:     casey.schaufler@intel.com, jmorris@namei.org, luto@kernel.org,
        jethro@fortanix.com, greg@enjellic.com, sds@tycho.nsa.gov,
        jarkko.sakkinen@linux.intel.com, sean.j.christopherson@intel.com
Subject: [RFC PATCH v2 1/3] x86/sgx: Add SGX specific LSM hooks
Date:   Thu, 27 Jun 2019 11:56:19 -0700
Message-Id: <72420cff8fa944b64e57df8d25c63bd30f8aacfa.1561588012.git.cedric.xing@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1561588012.git.cedric.xing@intel.com>
References: <cover.1561588012.git.cedric.xing@intel.com>
In-Reply-To: <cover.1561588012.git.cedric.xing@intel.com>
References: <20190619222401.14942-1-sean.j.christopherson@intel.com> <cover.1561588012.git.cedric.xing@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

SGX enclaves are loaded from pages in regular memory. Given the ability to
create executable pages, the newly added SGX subsystem may present a backdoor
for adversaries to circumvent LSM policies, such as creating an executable
enclave page from a modified regular page that would otherwise not be made
executable as prohibited by LSM. Therefore arises the primary question of
whether an enclave page should be allowed to be created from a given source
page in regular memory.

A related question is whether to grant/deny a mprotect() request on a given
enclave page/range. mprotect() is traditionally covered by
security_file_mprotect() hook, however, enclave pages have a different lifespan
than either MAP_PRIVATE or MAP_SHARED. Particularly, MAP_PRIVATE pages have the
same lifespan as the VMA while MAP_SHARED pages have the same lifespan as the
backing file (on disk), but enclave pages have the lifespan of the enclave’s
file descriptor. For example, enclave pages could be munmap()’ed then mmap()’ed
again without losing contents (like MAP_SHARED), but all enclave pages will be
lost once its file descriptor has been closed (like MAP_PRIVATE). That said,
LSM modules need some new data structure for tracking protections of enclave
pages/ranges so that they can make proper decisions at mmap()/mprotect()
syscalls.

The last question, which is orthogonal to the 2 above, is whether or not to
allow a given enclave to launch/run. Enclave pages are not visible to the rest
of the system, so to some extent offer a better place for malicious software to
hide. Thus, it is sometimes desirable to whitelist/blacklist enclaves by their
measurements, signing public keys, or image files.

To address the questions above, 2 new LSM hooks are added for enclaves.
  - security_enclave_load() – This hook allows LSM to decide whether or not to
    allow instantiation of a range of enclave pages using the specified VMA. It
    is invoked when a range of enclave pages is about to be loaded. It serves 3
    purposes: 1) indicate to LSM that the file struct in subject is an enclave;
    2) allow LSM to decide whether or not to instantiate those pages and 3)
    allow LSM to initialize internal data structures for tracking
    origins/protections of those pages.
  - security_enclave_init() – This hook allows whitelisting/blacklisting or
    performing whatever checks deemed appropriate before an enclave is allowed
    to run. An LSM module may opt to use the file backing the SIGSTRUCT as a
    proxy to dictate allowed protections for anonymous pages.

mprotect() of enclave pages continue to be governed by
security_file_mprotect(), with the expectation that LSM is able to distinguish
between regular and enclave pages inside the hook. For mmap(), the SGX
subsystem is expected to invoke security_file_mprotect() explicitly to check
protections against the requested protections for existing enclave pages. As
stated earlier, enclave pages have different lifespan than the existing
MAP_PRIVATE and MAP_SHARED pages, so would require a new data structure outside
of VMA to track their protections and/or origins. Enclave Memory Area (or EMA
for short) has been introduced to address the need. EMAs are maintained by the
LSM framework for all LSM modules to share. EMAs will be instantiated for
enclaves only so will not impose memory/performance overheads for regular
applications/files. Please see include/linux/lsm_ema.h and security/lsm_ema.c
for details.

A new setup parameter – lsm.ema.cache_decisions has been introduced to offer
the choice between memory consumption and accuracy of audit logs. Enabling
lsm.ema.cache_decisions causes LSM framework NOT to keep backing files open for
EMAs. While that saves memory, it requires LSM modules to make and cache
decisions ahead of time, and makes it difficult for LSM modules to generate
accurate audit logs. System administrators are expected to run LSM in
permissive mode with lsm.ema.cache_decisions off to determine the minimal
permissions needed, and then turn it back on in enforcing mode for optimal
performance and memory usage. lsm.ema.cache_decisions is on by default and
could be turned off by appending “lsm.ema.cache_decisions=0” or
“lsm.ema.cache_decisions=off” to the kernel command line.

Signed-off-by: Cedric Xing <cedric.xing@intel.com>
---
 include/linux/lsm_ema.h   | 171 ++++++++++++++++++++++++++++++++++++++
 include/linux/lsm_hooks.h |  29 +++++++
 include/linux/security.h  |  23 +++++
 security/Makefile         |   1 +
 security/lsm_ema.c        | 132 +++++++++++++++++++++++++++++
 security/security.c       |  47 ++++++++++-
 6 files changed, 402 insertions(+), 1 deletion(-)
 create mode 100644 include/linux/lsm_ema.h
 create mode 100644 security/lsm_ema.c

diff --git a/include/linux/lsm_ema.h b/include/linux/lsm_ema.h
new file mode 100644
index 000000000000..a09b8f96da05
--- /dev/null
+++ b/include/linux/lsm_ema.h
@@ -0,0 +1,171 @@
+/* SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause) */
+/**
+ * Enclave Memory Area interface for LSM modules
+ *
+ * Copyright(c) 2016-19 Intel Corporation.
+ */
+
+#ifndef _LSM_EMA_H_
+#define _LSM_EMA_H_
+
+#include <linux/list.h>
+#include <linux/mutex.h>
+#include <linux/fs.h>
+#include <linux/file.h>
+
+/**
+ * lsm_ema - LSM Enclave Memory Area structure
+ *
+ * Data structure to track origins of enclave pages
+ *
+ * @link:
+ *	Link to adjacent EMAs. EMAs are sorted by their addresses in ascending
+ *	order
+ * @start:
+ *	Starting address
+ * @end:
+ *	Ending address
+ * @source:
+ *	File from which this range was loaded from, or NULL if not loaded from
+ *	any files
+ */
+struct lsm_ema {
+	struct list_head	link;
+	size_t			start;
+	size_t			end;
+	struct file		*source;
+};
+
+#define lsm_ema_data(ema, blob_sizes)	\
+	((char *)((struct lsm_ema *)(ema) + 1) + blob_sizes.lbs_ema_data)
+
+/**
+ * lsm_ema_map - LSM Enclave Memory Map structure
+ *
+ * Container for EMAs of an enclave
+ *
+ * @list:
+ *	Head of a list of sorted EMAs
+ * @lock:
+ *	Acquire before querying/updateing the list EMAs
+ */
+struct lsm_ema_map {
+	struct list_head	list;
+	struct mutex		lock;
+};
+
+/**
+ * These are functions to be used by the LSM framework, and must be defined
+ * regardless CONFIG_INTEL_SGX is enabled or not.
+ */
+
+#ifdef CONFIG_INTEL_SGX
+void lsm_ema_global_init(size_t);
+void lsm_free_ema_map(atomic_long_t *);
+#else
+static inline void lsm_ema_global_init(size_t ema_data_size)
+{
+}
+
+static inline void lsm_free_ema_map(atomic_long_t *p)
+{
+}
+#endif
+
+/**
+ * Below are APIs to be used by LSM modules
+ */
+
+struct lsm_ema_map *lsm_init_or_get_ema_map(atomic_long_t *);
+struct lsm_ema *lsm_alloc_ema(void);
+void lsm_free_ema(struct lsm_ema *);
+void lsm_init_ema(struct lsm_ema *, size_t, size_t, struct file *);
+int lsm_merge_ema(struct lsm_ema *, struct lsm_ema_map *);
+struct lsm_ema *lsm_split_ema(struct lsm_ema *, size_t, struct lsm_ema_map *);
+
+static inline struct lsm_ema_map *lsm_get_ema_map(struct file *f)
+{
+	return (void *)atomic_long_read(f->f_security);
+}
+
+static inline int __must_check lsm_lock_ema(struct lsm_ema_map *map)
+{
+	return mutex_lock_interruptible(&map->lock);
+}
+
+static inline void lsm_unlock_ema(struct lsm_ema_map *map)
+{
+	mutex_unlock(&map->lock);
+}
+
+static inline struct lsm_ema *lsm_prev_ema(struct lsm_ema *p,
+					   struct lsm_ema_map *map)
+{
+	p = list_prev_entry(p, link);
+	return &p->link == &map->list ? NULL : p;
+}
+
+static inline struct lsm_ema *lsm_next_ema(struct lsm_ema *p,
+					   struct lsm_ema_map *map)
+{
+	p = list_next_entry(p, link);
+	return &p->link == &map->list ? NULL : p;
+}
+
+static inline struct lsm_ema *lsm_find_ema(struct lsm_ema_map *map, size_t a)
+{
+	struct lsm_ema *p;
+
+	BUG_ON(!mutex_is_locked(&map->lock));
+
+	list_for_each_entry(p, &map->list, link)
+		if (a < p->end)
+			break;
+	return &p->link == &map->list ? NULL : p;
+}
+
+static inline int lsm_insert_ema(struct lsm_ema_map *map, struct lsm_ema *n)
+{
+	struct lsm_ema *p = lsm_find_ema(map, n->start);
+
+	if (!p)
+		list_add_tail(&n->link, &map->list);
+	else if (n->end <= p->start)
+		list_add_tail(&n->link, &p->link);
+	else
+		return -EEXIST;
+
+	lsm_merge_ema(n, map);
+	if (p)
+		lsm_merge_ema(p, map);
+	return 0;
+}
+
+static inline int lsm_for_each_ema(struct lsm_ema_map *map, size_t start,
+				   size_t end, int (*cb)(struct lsm_ema *,
+							 void *), void *arg)
+{
+	struct lsm_ema *ema;
+	int rc;
+
+	ema = lsm_find_ema(map, start);
+	while (ema && end > ema->start) {
+		if (start > ema->start)
+			lsm_split_ema(ema, start, map);
+		if (end < ema->end)
+			ema = lsm_split_ema(ema, end, map);
+
+		rc = (*cb)(ema, arg);
+		lsm_merge_ema(ema, map);
+		if (rc)
+			return rc;
+
+		ema = lsm_next_ema(ema, map);
+	}
+
+	if (ema)
+		lsm_merge_ema(ema, map);
+	return 0;
+}
+
+#endif /* _LSM_EMA_H_ */
diff --git a/include/linux/lsm_hooks.h b/include/linux/lsm_hooks.h
index 47f58cfb6a19..ade1f9f81e64 100644
--- a/include/linux/lsm_hooks.h
+++ b/include/linux/lsm_hooks.h
@@ -29,6 +29,8 @@
 #include <linux/init.h>
 #include <linux/rculist.h>
 
+struct lsm_ema;
+
 /**
  * union security_list_options - Linux Security Module hook function list
  *
@@ -1446,6 +1448,21 @@
  * @bpf_prog_free_security:
  *	Clean up the security information stored inside bpf prog.
  *
+ * @enclave_load:
+ *	Decide if a range of pages shall be allowed to be loaded into an
+ *	enclave
+ *
+ *	@encl points to the file identifying the target enclave
+ *	@ema specifies the target range to be loaded
+ *	@flags contains protections being requested for the target range
+ *	@source points to the VMA containing the source pages to be loaded
+ *
+ * @enclave_init:
+ *	Decide if an enclave shall be allowed to launch
+ *
+ *	@encl points to the file identifying the target enclave being launched
+ *	@sigstruct contains a copy of the SIGSTRUCT in kernel memory
+ *	@source points to the VMA backing SIGSTRUCT in user memory
  */
 union security_list_options {
 	int (*binder_set_context_mgr)(struct task_struct *mgr);
@@ -1807,6 +1824,13 @@ union security_list_options {
 	int (*bpf_prog_alloc_security)(struct bpf_prog_aux *aux);
 	void (*bpf_prog_free_security)(struct bpf_prog_aux *aux);
 #endif /* CONFIG_BPF_SYSCALL */
+
+#ifdef CONFIG_INTEL_SGX
+	int (*enclave_load)(struct file *encl, struct lsm_ema *ema,
+			    size_t flags, struct vm_area_struct *source);
+	int (*enclave_init)(struct file *encl, struct sgx_sigstruct *sigstruct,
+			    struct vm_area_struct *source);
+#endif
 };
 
 struct security_hook_heads {
@@ -2046,6 +2070,10 @@ struct security_hook_heads {
 	struct hlist_head bpf_prog_alloc_security;
 	struct hlist_head bpf_prog_free_security;
 #endif /* CONFIG_BPF_SYSCALL */
+#ifdef CONFIG_INTEL_SGX
+	struct hlist_head enclave_load;
+	struct hlist_head enclave_init;
+#endif
 } __randomize_layout;
 
 /*
@@ -2069,6 +2097,7 @@ struct lsm_blob_sizes {
 	int	lbs_ipc;
 	int	lbs_msg_msg;
 	int	lbs_task;
+	int	lbs_ema_data;
 };
 
 /*
diff --git a/include/linux/security.h b/include/linux/security.h
index 659071c2e57c..52c200810004 100644
--- a/include/linux/security.h
+++ b/include/linux/security.h
@@ -1829,5 +1829,28 @@ static inline void security_bpf_prog_free(struct bpf_prog_aux *aux)
 #endif /* CONFIG_SECURITY */
 #endif /* CONFIG_BPF_SYSCALL */
 
+#ifdef CONFIG_INTEL_SGX
+struct sgx_sigstruct;
+#ifdef CONFIG_SECURITY
+int security_enclave_load(struct file *encl, size_t start, size_t end,
+			  size_t flags, struct vm_area_struct *source);
+int security_enclave_init(struct file *encl, struct sgx_sigstruct *sigstruct,
+			  struct vm_area_struct *source);
+#else
+static inline int security_enclave_load(struct file *encl, size_t start,
+					size_t end, struct vm_area_struct *src)
+{
+	return 0;
+}
+
+static inline int security_enclave_init(struct file *encl,
+					struct sgx_sigstruct *sigstruct,
+					struct vm_area_struct *src)
+{
+	return 0;
+}
+#endif /* CONFIG_SECURITY */
+#endif /* CONFIG_INTEL_SGX */
+
 #endif /* ! __LINUX_SECURITY_H */
 
diff --git a/security/Makefile b/security/Makefile
index c598b904938f..1bab8f1344b6 100644
--- a/security/Makefile
+++ b/security/Makefile
@@ -28,6 +28,7 @@ obj-$(CONFIG_SECURITY_YAMA)		+= yama/
 obj-$(CONFIG_SECURITY_LOADPIN)		+= loadpin/
 obj-$(CONFIG_SECURITY_SAFESETID)       += safesetid/
 obj-$(CONFIG_CGROUP_DEVICE)		+= device_cgroup.o
+obj-$(CONFIG_INTEL_SGX)			+= lsm_ema.o
 
 # Object integrity file lists
 subdir-$(CONFIG_INTEGRITY)		+= integrity
diff --git a/security/lsm_ema.c b/security/lsm_ema.c
new file mode 100644
index 000000000000..68fae0724d37
--- /dev/null
+++ b/security/lsm_ema.c
@@ -0,0 +1,132 @@
+// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
+// Copyright(c) 2016-18 Intel Corporation.
+
+#include <linux/lsm_ema.h>
+#include <linux/slab.h>
+
+static struct kmem_cache *lsm_ema_cache;
+static size_t lsm_ema_data_size;
+static int lsm_ema_cache_decisions = 1;
+
+void lsm_ema_global_init(size_t ema_size)
+{
+	BUG_ON(lsm_ema_data_size > 0);
+
+	lsm_ema_data_size = ema_size;
+
+	ema_size += sizeof(struct lsm_ema);
+	ema_size = max(ema_size, sizeof(struct lsm_ema_map));
+	lsm_ema_cache = kmem_cache_create("lsm_ema_cache", ema_size,
+					  __alignof__(struct lsm_ema),
+					  SLAB_PANIC, NULL);
+
+}
+
+struct lsm_ema_map *lsm_init_or_get_ema_map(atomic_long_t *p)
+{
+	struct lsm_ema_map *map;
+
+	map = (typeof(map))atomic_long_read(p);
+	if (!map) {
+		long n;
+
+		map = (typeof(map))lsm_alloc_ema();
+		if (!map)
+			return NULL;
+
+		INIT_LIST_HEAD(&map->list);
+		mutex_init(&map->lock);
+
+		n = atomic_long_cmpxchg(p, 0, (long)map);
+		if (n) {
+			atomic_long_t a;
+			atomic_long_set(&a, (long)map);
+			map = (typeof(map))n;
+			lsm_free_ema_map(&a);
+		}
+	}
+	return map;
+}
+
+void lsm_free_ema_map(atomic_long_t *p)
+{
+	struct lsm_ema_map *map;
+	struct lsm_ema *ema, *n;
+
+	map = (typeof(map))atomic_long_read(p);
+	if (!map)
+		return;
+
+	BUG_ON(mutex_is_locked(&map->lock));
+
+	list_for_each_entry_safe(ema, n, &map->list, link)
+		lsm_free_ema(ema);
+	kmem_cache_free(lsm_ema_cache, map);
+}
+
+struct lsm_ema *lsm_alloc_ema(void)
+{
+	return kmem_cache_zalloc(lsm_ema_cache, GFP_KERNEL);
+}
+
+void lsm_free_ema(struct lsm_ema *ema)
+{
+	list_del(&ema->link);
+	if (ema->source)
+		fput(ema->source);
+	kmem_cache_free(lsm_ema_cache, ema);
+}
+
+void lsm_init_ema(struct lsm_ema *ema, size_t start, size_t end,
+		  struct file *source)
+{
+	INIT_LIST_HEAD(&ema->link);
+	ema->start = start;
+	ema->end = end;
+	if (!lsm_ema_cache_decisions && source)
+		ema->source = get_file(source);
+}
+
+int lsm_merge_ema(struct lsm_ema *p, struct lsm_ema_map *map)
+{
+	struct lsm_ema *prev = list_prev_entry(p, link);
+
+	BUG_ON(!mutex_is_locked(&map->lock));
+
+	if (&prev->link == &map->list || prev->end != p->start ||
+	    prev->source != p->source ||
+	    memcmp(prev + 1, p + 1, lsm_ema_data_size))
+		return 0;
+
+	p->start = prev->start;
+	fput(prev->source);
+	lsm_free_ema(prev);
+	return 1;
+}
+
+struct lsm_ema *lsm_split_ema(struct lsm_ema *p, size_t at,
+			      struct lsm_ema_map *map)
+{
+	struct lsm_ema *n;
+
+	BUG_ON(!mutex_is_locked(&map->lock));
+
+	if (at <= p->start || at >= p->end)
+		return p;
+
+	n = lsm_alloc_ema();
+	if (likely(n)) {
+		lsm_init_ema(n, p->start, at, p->source);
+		memcpy(n + 1, p + 1, lsm_ema_data_size);
+		p->start = at;
+		list_add_tail(&n->link, &p->link);
+	}
+	return n;
+}
+
+static int __init set_ema_cache_decisions(char *str)
+{
+	lsm_ema_cache_decisions = (strcmp(str, "0") && strcmp(str, "off"));
+	return 1;
+}
+__setup("lsm.ema.cache_decisions=", set_ema_cache_decisions);
diff --git a/security/security.c b/security/security.c
index f493db0bf62a..d50883f18be2 100644
--- a/security/security.c
+++ b/security/security.c
@@ -17,6 +17,7 @@
 #include <linux/init.h>
 #include <linux/kernel.h>
 #include <linux/lsm_hooks.h>
+#include <linux/lsm_ema.h>
 #include <linux/integrity.h>
 #include <linux/ima.h>
 #include <linux/evm.h>
@@ -41,7 +42,9 @@ static struct kmem_cache *lsm_file_cache;
 static struct kmem_cache *lsm_inode_cache;
 
 char *lsm_names;
-static struct lsm_blob_sizes blob_sizes __lsm_ro_after_init;
+static struct lsm_blob_sizes blob_sizes __lsm_ro_after_init = {
+	.lbs_file = sizeof(atomic_long_t) * IS_ENABLED(CONFIG_INTEL_SGX),
+};
 
 /* Boot-time LSM user choice */
 static __initdata const char *chosen_lsm_order;
@@ -169,6 +172,7 @@ static void __init lsm_set_blob_sizes(struct lsm_blob_sizes *needed)
 	lsm_set_blob_size(&needed->lbs_ipc, &blob_sizes.lbs_ipc);
 	lsm_set_blob_size(&needed->lbs_msg_msg, &blob_sizes.lbs_msg_msg);
 	lsm_set_blob_size(&needed->lbs_task, &blob_sizes.lbs_task);
+	lsm_set_blob_size(&needed->lbs_ema_data, &blob_sizes.lbs_ema_data);
 }
 
 /* Prepare LSM for initialization. */
@@ -314,6 +318,7 @@ static void __init ordered_lsm_init(void)
 		lsm_inode_cache = kmem_cache_create("lsm_inode_cache",
 						    blob_sizes.lbs_inode, 0,
 						    SLAB_PANIC, NULL);
+	lsm_ema_global_init(blob_sizes.lbs_ema_data);
 
 	lsm_early_cred((struct cred *) current->cred);
 	lsm_early_task(current);
@@ -1357,6 +1362,7 @@ void security_file_free(struct file *file)
 	blob = file->f_security;
 	if (blob) {
 		file->f_security = NULL;
+		lsm_free_ema_map(blob);
 		kmem_cache_free(lsm_file_cache, blob);
 	}
 }
@@ -1420,6 +1426,7 @@ int security_file_mprotect(struct vm_area_struct *vma, unsigned long reqprot,
 {
 	return call_int_hook(file_mprotect, 0, vma, reqprot, prot);
 }
+EXPORT_SYMBOL(security_file_mprotect);
 
 int security_file_lock(struct file *file, unsigned int cmd)
 {
@@ -2355,3 +2362,41 @@ void security_bpf_prog_free(struct bpf_prog_aux *aux)
 	call_void_hook(bpf_prog_free_security, aux);
 }
 #endif /* CONFIG_BPF_SYSCALL */
+
+#ifdef CONFIG_INTEL_SGX
+int security_enclave_load(struct file *encl, size_t start, size_t end,
+			  size_t flags, struct vm_area_struct *src)
+{
+	struct lsm_ema_map *map;
+	struct lsm_ema *ema;
+	int rc;
+
+	map = lsm_init_or_get_ema_map(encl->f_security);
+	if (unlikely(!map))
+		return -ENOMEM;
+
+	ema = lsm_alloc_ema();
+	if (unlikely(!ema))
+		return -ENOMEM;
+
+	lsm_init_ema(ema, start, end, src->vm_file);
+	rc = call_int_hook(enclave_load, 0, encl, ema, flags, src);
+	if (!rc)
+		rc = lsm_lock_ema(map);
+	if (!rc) {
+		rc = lsm_insert_ema(map, ema);
+		lsm_unlock_ema(map);
+	}
+	if (rc)
+		lsm_free_ema(ema);
+	return rc;
+}
+EXPORT_SYMBOL(security_enclave_load);
+
+int security_enclave_init(struct file *encl, struct sgx_sigstruct *sigstruct,
+			  struct vm_area_struct *src)
+{
+	return call_int_hook(enclave_init, 0, encl, sigstruct, src);
+}
+EXPORT_SYMBOL(security_enclave_init);
+#endif /* CONFIG_INTEL_SGX */
-- 
2.17.1

