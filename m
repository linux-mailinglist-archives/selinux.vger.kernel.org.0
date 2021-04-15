Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D05536066F
	for <lists+selinux@lfdr.de>; Thu, 15 Apr 2021 12:04:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232142AbhDOKFQ (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Thu, 15 Apr 2021 06:05:16 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:2862 "EHLO
        frasgout.his.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230260AbhDOKFP (ORCPT
        <rfc822;selinux@vger.kernel.org>); Thu, 15 Apr 2021 06:05:15 -0400
Received: from fraeml714-chm.china.huawei.com (unknown [172.18.147.200])
        by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4FLZSv5lTgz689dF;
        Thu, 15 Apr 2021 17:54:55 +0800 (CST)
Received: from fraphisprd00473.huawei.com (7.182.8.141) by
 fraeml714-chm.china.huawei.com (10.206.15.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 15 Apr 2021 12:04:50 +0200
From:   Roberto Sassu <roberto.sassu@huawei.com>
To:     <zohar@linux.ibm.com>, <jmorris@namei.org>, <paul@paul-moore.com>,
        <casey@schaufler-ca.com>
CC:     <linux-integrity@vger.kernel.org>,
        <linux-security-module@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <selinux@vger.kernel.org>,
        <reiserfs-devel@vger.kernel.org>,
        Roberto Sassu <roberto.sassu@huawei.com>
Subject: [PATCH 2/5] security: Support multiple LSMs implementing the inode_init_security hook
Date:   Thu, 15 Apr 2021 12:04:32 +0200
Message-ID: <20210415100435.18619-3-roberto.sassu@huawei.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210415100435.18619-1-roberto.sassu@huawei.com>
References: <20210415100435.18619-1-roberto.sassu@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [7.182.8.141]
X-ClientProxiedBy: lhreml752-chm.china.huawei.com (10.201.108.202) To
 fraeml714-chm.china.huawei.com (10.206.15.33)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

The current implementation of security_inode_init_security() is capable of
handling only one LSM providing an xattr to be set at inode creation. That
xattr is then passed to EVM to calculate the HMAC.

To support multiple LSMs, each providing an xattr, this patch makes the
following modifications:

security_inode_init_security():
- dynamically allocates new_xattrs, based on the number of
  inode_init_security hooks registered by LSMs;
- replaces the call_int_hook() macro with its definition, to correctly
  handle the case of an LSM returning -EOPNOTSUPP (the loop should not be
  stopped), and to advance in the new_xattrs array so that the correct
  xattr name, value and len pointers are passed to LSMs.

security_old_inode_init_security():
- replaces the call_int_hook() macro with its definition, to stop the loop
  at the first LSM providing an xattr, to avoid a memory leak (due to
  overwriting the *value pointer).

The modifications necessary for EVM to calculate the HMAC on all xattrs
will be done in a separate patch.

Signed-off-by: Roberto Sassu <roberto.sassu@huawei.com>
---
 security/security.c | 87 +++++++++++++++++++++++++++++++++++++--------
 1 file changed, 72 insertions(+), 15 deletions(-)

diff --git a/security/security.c b/security/security.c
index 7f14e59c4f8e..65624357b335 100644
--- a/security/security.c
+++ b/security/security.c
@@ -30,8 +30,6 @@
 #include <linux/msg.h>
 #include <net/flow.h>
 
-#define MAX_LSM_EVM_XATTR	2
-
 /* How many LSMs were built into the kernel? */
 #define LSM_COUNT (__end_lsm_info - __start_lsm_info)
 
@@ -1028,9 +1026,10 @@ int security_inode_init_security(struct inode *inode, struct inode *dir,
 				 const struct qstr *qstr,
 				 const initxattrs initxattrs, void *fs_data)
 {
-	struct xattr new_xattrs[MAX_LSM_EVM_XATTR + 1];
-	struct xattr *lsm_xattr, *evm_xattr, *xattr;
-	int ret;
+	struct xattr *new_xattrs;
+	struct xattr *lsm_xattr, *xattr;
+	struct security_hook_list *P;
+	int ret, max_new_xattrs = 0;
 
 	if (unlikely(IS_PRIVATE(inode)))
 		return 0;
@@ -1038,23 +1037,56 @@ int security_inode_init_security(struct inode *inode, struct inode *dir,
 	if (!initxattrs)
 		return call_int_hook(inode_init_security, -EOPNOTSUPP, inode,
 				     dir, qstr, NULL, NULL, NULL);
-	memset(new_xattrs, 0, sizeof(new_xattrs));
+
+	/* Determine at run-time the max number of xattr structs to allocate. */
+	hlist_for_each_entry(P, &security_hook_heads.inode_init_security, list)
+		max_new_xattrs++;
+
+	if (!max_new_xattrs)
+		return 0;
+
+	/* Allocate +1 for EVM and +1 as terminator. */
+	new_xattrs = kcalloc(max_new_xattrs + 2, sizeof(*new_xattrs), GFP_NOFS);
+	if (!new_xattrs)
+		return -ENOMEM;
+
 	lsm_xattr = new_xattrs;
-	ret = call_int_hook(inode_init_security, -EOPNOTSUPP, inode, dir, qstr,
-						&lsm_xattr->name,
-						&lsm_xattr->value,
-						&lsm_xattr->value_len);
-	if (ret)
+	hlist_for_each_entry(P, &security_hook_heads.inode_init_security,
+			     list) {
+		ret = P->hook.inode_init_security(inode, dir, qstr,
+						  &lsm_xattr->name,
+						  &lsm_xattr->value,
+						  &lsm_xattr->value_len);
+		if (ret && ret != -EOPNOTSUPP)
+			goto out;
+
+		/* LSM implementation error. */
+		if (!ret &&
+		    (lsm_xattr->name == NULL || lsm_xattr->value == NULL)) {
+			WARN_ONCE(
+			    "LSM %s: ret = 0 but xattr name/value = NULL\n",
+			    P->lsm);
+			ret = -ENOENT;
+			goto out;
+		}
+
+		if (!ret && lsm_xattr < new_xattrs + max_new_xattrs)
+			lsm_xattr++;
+	}
+
+	if (lsm_xattr == new_xattrs) {
+		ret = -EOPNOTSUPP;
 		goto out;
+	}
 
-	evm_xattr = lsm_xattr + 1;
-	ret = evm_inode_init_security(inode, lsm_xattr, evm_xattr);
+	ret = evm_inode_init_security(inode, new_xattrs, lsm_xattr);
 	if (ret)
 		goto out;
 	ret = initxattrs(inode, new_xattrs, fs_data);
 out:
 	for (xattr = new_xattrs; xattr->value != NULL; xattr++)
 		kfree(xattr->value);
+	kfree(new_xattrs);
 	return (ret == -EOPNOTSUPP) ? 0 : ret;
 }
 EXPORT_SYMBOL(security_inode_init_security);
@@ -1071,10 +1103,35 @@ int security_old_inode_init_security(struct inode *inode, struct inode *dir,
 				     const struct qstr *qstr, const char **name,
 				     void **value, size_t *len)
 {
+	struct security_hook_list *P;
+	int ret;
+
 	if (unlikely(IS_PRIVATE(inode)))
 		return -EOPNOTSUPP;
-	return call_int_hook(inode_init_security, -EOPNOTSUPP, inode, dir,
-			     qstr, name, value, len);
+
+	hlist_for_each_entry(P, &security_hook_heads.inode_init_security,
+			     list) {
+		ret = P->hook.inode_init_security(inode, dir, qstr,
+						  name, value, len);
+		if (ret && ret != -EOPNOTSUPP)
+			return ret;
+
+		/* LSM implementation error. */
+		if (!ret &&
+		    ((name && *name == NULL) || (value && *value == NULL))) {
+			WARN_ONCE(
+			    "LSM %s: ret = 0 but xattr name/value = NULL\n",
+			    P->lsm);
+
+			/* Callers should do the cleanup. */
+			return -ENOENT;
+		}
+
+		if (!ret)
+			return ret;
+	}
+
+	return -EOPNOTSUPP;
 }
 EXPORT_SYMBOL(security_old_inode_init_security);
 
-- 
2.26.2

