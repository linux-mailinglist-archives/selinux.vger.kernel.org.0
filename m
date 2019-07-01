Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 630844C387
	for <lists+selinux@lfdr.de>; Thu, 20 Jun 2019 00:24:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730792AbfFSWYQ (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Wed, 19 Jun 2019 18:24:16 -0400
Received: from mga18.intel.com ([134.134.136.126]:40155 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730752AbfFSWYP (ORCPT <rfc822;selinux@vger.kernel.org>);
        Wed, 19 Jun 2019 18:24:15 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 19 Jun 2019 15:24:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,394,1557212400"; 
   d="scan'208";a="150743748"
Received: from sjchrist-coffee.jf.intel.com ([10.54.74.36])
  by orsmga007.jf.intel.com with ESMTP; 19 Jun 2019 15:24:12 -0700
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
Subject: [RFC PATCH v4 02/12] x86/sgx: Do not naturally align MAP_FIXED address
Date:   Wed, 19 Jun 2019 15:23:51 -0700
Message-Id: <20190619222401.14942-3-sean.j.christopherson@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190619222401.14942-1-sean.j.christopherson@intel.com>
References: <20190619222401.14942-1-sean.j.christopherson@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

SGX enclaves have an associated Enclave Linear Range (ELRANGE) that is
tracked and enforced by the CPU using a base+mask approach, similar to
how hardware range registers such as the variable MTRRs.  As a result,
the ELRANGE must be naturally sized and aligned.

To reduce boilerplate code that would be needed in every userspace
enclave loader, the SGX driver naturally aligns the mmap() address and
also requires the range to be naturally sized.  Unfortunately, SGX fails
to grant a waiver to the MAP_FIXED case, e.g. incorrectly rejects mmap()
if userspace is attempting to map a small slice of an existing enclave.

Signed-off-by: Sean Christopherson <sean.j.christopherson@intel.com>
---
 arch/x86/kernel/cpu/sgx/driver/main.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kernel/cpu/sgx/driver/main.c b/arch/x86/kernel/cpu/sgx/driver/main.c
index 07aa5f91b2dd..29384cdd0842 100644
--- a/arch/x86/kernel/cpu/sgx/driver/main.c
+++ b/arch/x86/kernel/cpu/sgx/driver/main.c
@@ -115,7 +115,13 @@ static unsigned long sgx_get_unmapped_area(struct file *file,
 					   unsigned long pgoff,
 					   unsigned long flags)
 {
-	if (len < 2 * PAGE_SIZE || len & (len - 1) || flags & MAP_PRIVATE)
+	if (flags & MAP_PRIVATE)
+		return -EINVAL;
+
+	if (flags & MAP_FIXED)
+		return addr;
+
+	if (len < 2 * PAGE_SIZE || len & (len - 1))
 		return -EINVAL;
 
 	addr = current->mm->get_unmapped_area(file, addr, 2 * len, pgoff,
-- 
2.21.0

