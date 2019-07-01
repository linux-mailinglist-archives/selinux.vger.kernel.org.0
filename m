Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AE2374C38C
	for <lists+selinux@lfdr.de>; Thu, 20 Jun 2019 00:24:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730752AbfFSWYS (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Wed, 19 Jun 2019 18:24:18 -0400
Received: from mga18.intel.com ([134.134.136.126]:40162 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726482AbfFSWYR (ORCPT <rfc822;selinux@vger.kernel.org>);
        Wed, 19 Jun 2019 18:24:17 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 19 Jun 2019 15:24:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,394,1557212400"; 
   d="scan'208";a="150743771"
Received: from sjchrist-coffee.jf.intel.com ([10.54.74.36])
  by orsmga007.jf.intel.com with ESMTP; 19 Jun 2019 15:24:13 -0700
From:   Sean Christopherson <sean.j.christopherson@intel.com>
To:     Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Cc:     linux-sgx@vger.kernel.org, linux-security-module@vger.kernel.org,
        selinux@vger.kernel.org,
        Bill Roberts <william.c.roberts@intel.com>,
        Casey Schaufler <casey.schaufler@intel.com>,
        James Morris <jmorris@namei.org>,
        Dave Hansen <dave.hansen@intel.com>,
        Cedric Xing <cedric.xing@intel.com>,
        Andy Lutomirski <luto@kernel.org>,
        Jethro Beekman <jethro@fortanix.com>,
        "Dr . Greg Wettstein" <greg@enjellic.com>,
        Stephen Smalley <sds@tycho.nsa.gov>
Subject: [RFC PATCH v4 08/12] security/selinux: Require SGX_MAPWX to map enclave page WX
Date:   Wed, 19 Jun 2019 15:23:57 -0700
Message-Id: <20190619222401.14942-9-sean.j.christopherson@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190619222401.14942-1-sean.j.christopherson@intel.com>
References: <20190619222401.14942-1-sean.j.christopherson@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Hook enclave_map() to require a new per-process capability, SGX_MAPWX,
when mapping an enclave as simultaneously writable and executable.
Note, @prot contains the actual protection bits that will be set by the
kernel, not the maximal protection bits specified by userspace when the
page was first loaded into the enclave.

Signed-off-by: Sean Christopherson <sean.j.christopherson@intel.com>
---
 security/selinux/hooks.c            | 21 +++++++++++++++++++++
 security/selinux/include/classmap.h |  3 ++-
 2 files changed, 23 insertions(+), 1 deletion(-)

diff --git a/security/selinux/hooks.c b/security/selinux/hooks.c
index 3ec702cf46ca..fc239e541b62 100644
--- a/security/selinux/hooks.c
+++ b/security/selinux/hooks.c
@@ -6726,6 +6726,23 @@ static void selinux_bpf_prog_free(struct bpf_prog_aux *aux)
 }
 #endif
 
+#ifdef CONFIG_INTEL_SGX
+static int selinux_enclave_map(unsigned long prot)
+{
+	const struct cred *cred = current_cred();
+	u32 sid = cred_sid(cred);
+
+	/* SGX is supported only in 64-bit kernels. */
+	WARN_ON_ONCE(!default_noexec);
+
+	if ((prot & PROT_EXEC) && (prot & PROT_WRITE))
+		return avc_has_perm(&selinux_state, sid, sid,
+				    SECCLASS_PROCESS2, PROCESS2__SGX_MAPWX,
+				    NULL);
+	return 0;
+}
+#endif
+
 struct lsm_blob_sizes selinux_blob_sizes __lsm_ro_after_init = {
 	.lbs_cred = sizeof(struct task_security_struct),
 	.lbs_file = sizeof(struct file_security_struct),
@@ -6968,6 +6985,10 @@ static struct security_hook_list selinux_hooks[] __lsm_ro_after_init = {
 	LSM_HOOK_INIT(bpf_map_free_security, selinux_bpf_map_free),
 	LSM_HOOK_INIT(bpf_prog_free_security, selinux_bpf_prog_free),
 #endif
+
+#ifdef CONFIG_INTEL_SGX
+	LSM_HOOK_INIT(enclave_map, selinux_enclave_map),
+#endif
 };
 
 static __init int selinux_init(void)
diff --git a/security/selinux/include/classmap.h b/security/selinux/include/classmap.h
index 201f7e588a29..cfd91e879bdf 100644
--- a/security/selinux/include/classmap.h
+++ b/security/selinux/include/classmap.h
@@ -51,7 +51,8 @@ struct security_class_mapping secclass_map[] = {
 	    "execmem", "execstack", "execheap", "setkeycreate",
 	    "setsockcreate", "getrlimit", NULL } },
 	{ "process2",
-	  { "nnp_transition", "nosuid_transition", NULL } },
+	  { "nnp_transition", "nosuid_transition",
+	    "sgx_mapwx", NULL } },
 	{ "system",
 	  { "ipc_info", "syslog_read", "syslog_mod",
 	    "syslog_console", "module_request", "module_load", NULL } },
-- 
2.21.0

