Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6C6F366FF6
	for <lists+selinux@lfdr.de>; Wed, 21 Apr 2021 18:21:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242342AbhDUQV4 (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Wed, 21 Apr 2021 12:21:56 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:2900 "EHLO
        frasgout.his.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242053AbhDUQVz (ORCPT
        <rfc822;selinux@vger.kernel.org>); Wed, 21 Apr 2021 12:21:55 -0400
Received: from fraeml714-chm.china.huawei.com (unknown [172.18.147.226])
        by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4FQQX96l34z6wjBw;
        Thu, 22 Apr 2021 00:11:05 +0800 (CST)
Received: from roberto-ThinkStation-P620.huawei.com (10.204.62.217) by
 fraeml714-chm.china.huawei.com (10.206.15.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 21 Apr 2021 18:21:19 +0200
From:   Roberto Sassu <roberto.sassu@huawei.com>
To:     <zohar@linux.ibm.com>, <jmorris@namei.org>, <paul@paul-moore.com>,
        <casey@schaufler-ca.com>
CC:     <linux-integrity@vger.kernel.org>,
        <linux-security-module@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <selinux@vger.kernel.org>,
        <reiserfs-devel@vger.kernel.org>,
        Roberto Sassu <roberto.sassu@huawei.com>
Subject: [PATCH v2 5/6] evm: Align evm_inode_init_security() definition with LSM infrastructure
Date:   Wed, 21 Apr 2021 18:19:24 +0200
Message-ID: <20210421161925.968825-6-roberto.sassu@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210421161925.968825-1-roberto.sassu@huawei.com>
References: <20210421161925.968825-1-roberto.sassu@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.204.62.217]
X-ClientProxiedBy: lhreml754-chm.china.huawei.com (10.201.108.204) To
 fraeml714-chm.china.huawei.com (10.206.15.33)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

This patch changes the evm_inode_init_security() definition to align with
the LSM infrastructure, in preparation for moving IMA and EVM to that
infrastructure.

Signed-off-by: Roberto Sassu <roberto.sassu@huawei.com>
---
 include/linux/evm.h               | 17 ++++++++++-------
 security/integrity/evm/evm_main.c | 17 +++++++++++------
 security/security.c               |  7 +++----
 3 files changed, 24 insertions(+), 17 deletions(-)

diff --git a/include/linux/evm.h b/include/linux/evm.h
index 8cad46bcec9d..b6c4092426f3 100644
--- a/include/linux/evm.h
+++ b/include/linux/evm.h
@@ -34,9 +34,9 @@ extern int evm_inode_removexattr(struct user_namespace *mnt_userns,
 				 struct dentry *dentry, const char *xattr_name);
 extern void evm_inode_post_removexattr(struct dentry *dentry,
 				       const char *xattr_name);
-extern int evm_inode_init_security(struct inode *inode,
-				   const struct xattr *xattr_array,
-				   struct xattr *evm);
+extern int evm_inode_init_security(struct inode *inode, struct inode *dir,
+				   const struct qstr *qstr,
+				   struct xattr *xattrs, void *fs_data);
 extern bool evm_status_revalidate(const char *xattr_name);
 #ifdef CONFIG_FS_POSIX_ACL
 extern int posix_xattr_acl(const char *xattrname);
@@ -102,11 +102,14 @@ static inline void evm_inode_post_removexattr(struct dentry *dentry,
 	return;
 }
 
-static inline int evm_inode_init_security(struct inode *inode,
-					  const struct xattr *xattr_array,
-					  struct xattr *evm)
+static inline int evm_inode_init_security(struct inode *inode, struct inode *dir,
+					  const struct qstr *qstr,
+					  struct xattr *xattrs, void *fs_data)
 {
-	return 0;
+	if (!xattrs || !xattrs->name)
+		return 0;
+
+	return -EOPNOTSUPP;
 }
 
 static inline bool evm_status_revalidate(const char *xattr_name)
diff --git a/security/integrity/evm/evm_main.c b/security/integrity/evm/evm_main.c
index 84a9b7a69b1f..336a421e2e5a 100644
--- a/security/integrity/evm/evm_main.c
+++ b/security/integrity/evm/evm_main.c
@@ -17,6 +17,7 @@
 #include <linux/xattr.h>
 #include <linux/integrity.h>
 #include <linux/evm.h>
+#include <linux/lsm_hooks.h>
 #include <linux/magic.h>
 #include <linux/posix_acl_xattr.h>
 
@@ -706,23 +707,27 @@ void evm_inode_post_setattr(struct dentry *dentry, int ia_valid)
 /*
  * evm_inode_init_security - initializes security.evm HMAC value
  */
-int evm_inode_init_security(struct inode *inode,
-				 const struct xattr *lsm_xattr,
-				 struct xattr *evm_xattr)
+int evm_inode_init_security(struct inode *inode, struct inode *dir,
+			    const struct qstr *qstr,
+			    struct xattr *xattrs, void *fs_data)
 {
 	struct evm_xattr *xattr_data;
+	struct xattr *evm_xattr = lsm_find_xattr_slot(xattrs);
 	int rc;
 
-	if (!(evm_initialized & EVM_INIT_HMAC) ||
-	    !evm_protected_xattr(lsm_xattr->name))
+	if (!xattrs || !xattrs->name)
 		return 0;
 
+	if (!(evm_initialized & EVM_INIT_HMAC) ||
+	    !evm_protected_xattr(xattrs->name))
+		return -EOPNOTSUPP;
+
 	xattr_data = kzalloc(sizeof(*xattr_data), GFP_NOFS);
 	if (!xattr_data)
 		return -ENOMEM;
 
 	xattr_data->data.type = EVM_XATTR_HMAC;
-	rc = evm_init_hmac(inode, lsm_xattr, xattr_data->digest);
+	rc = evm_init_hmac(inode, xattrs, xattr_data->digest);
 	if (rc < 0)
 		goto out;
 
diff --git a/security/security.c b/security/security.c
index 2ab67fa4422e..ee5b9caccc40 100644
--- a/security/security.c
+++ b/security/security.c
@@ -1027,7 +1027,7 @@ int security_inode_init_security(struct inode *inode, struct inode *dir,
 				 const initxattrs initxattrs, void *fs_data)
 {
 	struct xattr *new_xattrs;
-	struct xattr *lsm_xattr, *evm_xattr, *xattr;
+	struct xattr *lsm_xattr, *xattr;
 	struct security_hook_list *P;
 	int ret, max_new_xattrs = 0;
 
@@ -1082,9 +1082,8 @@ int security_inode_init_security(struct inode *inode, struct inode *dir,
 		goto out;
 	}
 
-	evm_xattr = lsm_xattr;
-	ret = evm_inode_init_security(inode, new_xattrs, evm_xattr);
-	if (ret)
+	ret = evm_inode_init_security(inode, dir, qstr, new_xattrs, fs_data);
+	if (ret && ret != -EOPNOTSUPP)
 		goto out;
 	ret = initxattrs(inode, new_xattrs, fs_data);
 out:
-- 
2.25.1

