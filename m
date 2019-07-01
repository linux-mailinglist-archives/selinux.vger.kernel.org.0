Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9C5624C391
	for <lists+selinux@lfdr.de>; Thu, 20 Jun 2019 00:24:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730827AbfFSWYR (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Wed, 19 Jun 2019 18:24:17 -0400
Received: from mga18.intel.com ([134.134.136.126]:40155 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730747AbfFSWYP (ORCPT <rfc822;selinux@vger.kernel.org>);
        Wed, 19 Jun 2019 18:24:15 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 19 Jun 2019 15:24:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,394,1557212400"; 
   d="scan'208";a="150743764"
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
Subject: [RFC PATCH v4 06/12] mm: Introduce vm_ops->may_mprotect()
Date:   Wed, 19 Jun 2019 15:23:55 -0700
Message-Id: <20190619222401.14942-7-sean.j.christopherson@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190619222401.14942-1-sean.j.christopherson@intel.com>
References: <20190619222401.14942-1-sean.j.christopherson@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

SGX will use ->may_mprotect() to invoke an SGX variant of the existing
file_mprotect() and mmap_file() LSM hooks.

The name may_mprotect() is intended to reflect the hook's purpose as a
way to restrict mprotect() as opposed to a wholesale replacement.

Due to the nature of SGX and its Enclave Page Cache (EPC), all enclave
VMAs are backed by a single file, i.e. /dev/sgx/enclave, that must be
MAP_SHARED.  Furthermore, all enclaves need read, write and execute
VMAs.  As a result, applying W^X restrictions on /dev/sgx/enclave using
existing LSM hooks is for all intents and purposes impossible, e.g.
denying either W or X would deny access to *any* enclave.

By hooking mprotect(), SGX can invoke an SGX specific LSM hook, which in
turn allows LSMs to enforce W^X policies.

Alternatively, SGX could provide a helper to identify enclaves given a
vma or file.  LSMs could then check if a mapping is for enclave and take
action according.

A second alternative would be to have SGX implement its own LSM hooks
for file_mprotect() and mmap_file(), using them to "forward" the call to
the SGX specific hook.

The major con to both alternatives is that they provide zero flexibility
for the SGX specific LSM hook.  The "is_sgx_enclave()" helper doesn't
allow SGX can't supply any additional information whatsoever, and the
mmap_file() hook is called before the final address is known, e.g. SGX
can't provide any information about the specific enclave being mapped.

Signed-off-by: Sean Christopherson <sean.j.christopherson@intel.com>
---
 include/linux/mm.h |  2 ++
 mm/mprotect.c      | 15 +++++++++++----
 2 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 0e8834ac32b7..b11ec420c8d7 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -458,6 +458,8 @@ struct vm_operations_struct {
 	void (*close)(struct vm_area_struct * area);
 	int (*split)(struct vm_area_struct * area, unsigned long addr);
 	int (*mremap)(struct vm_area_struct * area);
+	int (*may_mprotect)(struct vm_area_struct *vma, unsigned long start,
+			    unsigned long end, unsigned long prot);
 	vm_fault_t (*fault)(struct vm_fault *vmf);
 	vm_fault_t (*huge_fault)(struct vm_fault *vmf,
 			enum page_entry_size pe_size);
diff --git a/mm/mprotect.c b/mm/mprotect.c
index bf38dfbbb4b4..18732543b295 100644
--- a/mm/mprotect.c
+++ b/mm/mprotect.c
@@ -547,13 +547,20 @@ static int do_mprotect_pkey(unsigned long start, size_t len,
 			goto out;
 		}
 
-		error = security_file_mprotect(vma, reqprot, prot);
-		if (error)
-			goto out;
-
 		tmp = vma->vm_end;
 		if (tmp > end)
 			tmp = end;
+
+		if (vma->vm_ops && vma->vm_ops->may_mprotect) {
+			error = vma->vm_ops->may_mprotect(vma, nstart, tmp, prot);
+			if (error)
+				goto out;
+		}
+
+		error = security_file_mprotect(vma, reqprot, prot);
+		if (error)
+			goto out;
+
 		error = mprotect_fixup(vma, &prev, nstart, tmp, newflags);
 		if (error)
 			goto out;
-- 
2.21.0

