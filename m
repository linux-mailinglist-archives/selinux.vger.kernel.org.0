Return-Path: <selinux+bounces-666-lists+selinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 61DBC856147
	for <lists+selinux@lfdr.de>; Thu, 15 Feb 2024 12:18:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 867ACB34240
	for <lists+selinux@lfdr.de>; Thu, 15 Feb 2024 10:41:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E20812AAE2;
	Thu, 15 Feb 2024 10:33:45 +0000 (UTC)
X-Original-To: selinux@vger.kernel.org
Received: from frasgout12.his.huawei.com (frasgout12.his.huawei.com [14.137.139.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49AE1132C08;
	Thu, 15 Feb 2024 10:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=14.137.139.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707993225; cv=none; b=nCSkGf0T+QWI1ZAY54Pl9E9+N+6t4IwJRtB6KQasq5ntjEGjQOl6bm2Z3Pzdne34XKyzH+GOXtiaKYSYIUGVCKSvRiqGC/GIwGRHqakwy48czl/tvb5eSNmNeVy1sojT65Zu4Hc5zlwrh03wGBld4NedQnKlZ+ULetk/17WaobE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707993225; c=relaxed/simple;
	bh=wd1jgFBte7/bsEpIHxybOAZTbqolPlMJjgOQy1NZCJ8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JCVJwSG16TuMORQfS90JTwiX7HCMSzVrVt++bA9lsnA8njqxx7bFkBPfD6b5UODvOWREZG2QCgE5Uf/h0Ax0e50bqddpjmxo2GhYNyt/fH4Dm/pBwNm4aY0VgYByYH2z7ljNHCi208/DaJaK8UnT1QDnzzqbVp0NPUNzmCYXZWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=14.137.139.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.18.186.51])
	by frasgout12.his.huawei.com (SkyGuard) with ESMTP id 4Tb9sM2fNxz9xw3r;
	Thu, 15 Feb 2024 18:14:31 +0800 (CST)
Received: from mail02.huawei.com (unknown [7.182.16.27])
	by mail.maildlp.com (Postfix) with ESMTP id E8FD41404DB;
	Thu, 15 Feb 2024 18:33:39 +0800 (CST)
Received: from huaweicloud.com (unknown [10.204.63.22])
	by APP2 (Coremail) with SMTP id GxC2BwAXUCQD6M1lUHGHAg--.4426S10;
	Thu, 15 Feb 2024 11:33:39 +0100 (CET)
From: Roberto Sassu <roberto.sassu@huaweicloud.com>
To: viro@zeniv.linux.org.uk,
	brauner@kernel.org,
	jack@suse.cz,
	chuck.lever@oracle.com,
	jlayton@kernel.org,
	neilb@suse.de,
	kolga@netapp.com,
	Dai.Ngo@oracle.com,
	tom@talpey.com,
	paul@paul-moore.com,
	jmorris@namei.org,
	serge@hallyn.com,
	zohar@linux.ibm.com,
	dmitry.kasatkin@gmail.com,
	eric.snowberg@oracle.com,
	dhowells@redhat.com,
	jarkko@kernel.org,
	stephen.smalley.work@gmail.com,
	omosnace@redhat.com,
	casey@schaufler-ca.com,
	shuah@kernel.org,
	mic@digikod.net
Cc: linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-nfs@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	linux-integrity@vger.kernel.org,
	keyrings@vger.kernel.org,
	selinux@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Roberto Sassu <roberto.sassu@huawei.com>,
	Stefan Berger <stefanb@linux.ibm.com>
Subject: [PATCH v10 08/25] evm: Align evm_inode_post_setxattr() definition with LSM infrastructure
Date: Thu, 15 Feb 2024 11:30:56 +0100
Message-Id: <20240215103113.2369171-9-roberto.sassu@huaweicloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240215103113.2369171-1-roberto.sassu@huaweicloud.com>
References: <20240215103113.2369171-1-roberto.sassu@huaweicloud.com>
Precedence: bulk
X-Mailing-List: selinux@vger.kernel.org
List-Id: <selinux.vger.kernel.org>
List-Subscribe: <mailto:selinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:selinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:GxC2BwAXUCQD6M1lUHGHAg--.4426S10
X-Coremail-Antispam: 1UD129KBjvJXoWxGw4rCrWDuFW7AFWUJr1xuFg_yoW5tF4kpF
	Z8K3WDCw1rtFyUWryvyF4xu34v9ayrWryjkrWDKw1IyFn3tr92qryxAr1jvryrJr48GFnY
	qa1avrsYga43X3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBmb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI8067AKxVWUAV
	Cq3wA2048vs2IY020Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0
	rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267
	AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv6xkF7I0E
	14v26r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrV
	C2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE
	7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACI402YVCY1x02628vn2kIc2xKxwCF04k20x
	vY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I
	3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Wrv_Gr1UMIIYrxkI7VAKI48JMI
	IF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1l
	IxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4
	A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjxUFgAwUUUUU
X-CM-SenderInfo: purev21wro2thvvxqx5xdzvxpfor3voofrz/1tbiAgAOBF1jj5Zf1AAAsk

From: Roberto Sassu <roberto.sassu@huawei.com>

Change evm_inode_post_setxattr() definition, so that it can be registered
as implementation of the inode_post_setxattr hook.

Signed-off-by: Roberto Sassu <roberto.sassu@huawei.com>
Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
Reviewed-by: Mimi Zohar <zohar@linux.ibm.com>
Reviewed-by: Casey Schaufler <casey@schaufler-ca.com>
Acked-by: Paul Moore <paul@paul-moore.com>
Acked-by: Mimi Zohar <zohar@linux.ibm.com>
---
 include/linux/evm.h               | 8 +++++---
 security/integrity/evm/evm_main.c | 4 +++-
 security/security.c               | 2 +-
 3 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/include/linux/evm.h b/include/linux/evm.h
index 7de24c1ada90..3faabdd47852 100644
--- a/include/linux/evm.h
+++ b/include/linux/evm.h
@@ -31,7 +31,8 @@ extern int evm_inode_setxattr(struct mnt_idmap *idmap,
 extern void evm_inode_post_setxattr(struct dentry *dentry,
 				    const char *xattr_name,
 				    const void *xattr_value,
-				    size_t xattr_value_len);
+				    size_t xattr_value_len,
+				    int flags);
 extern int evm_inode_copy_up_xattr(const char *name);
 extern int evm_inode_removexattr(struct mnt_idmap *idmap,
 				 struct dentry *dentry, const char *xattr_name);
@@ -56,7 +57,7 @@ static inline void evm_inode_post_set_acl(struct dentry *dentry,
 					  const char *acl_name,
 					  struct posix_acl *kacl)
 {
-	return evm_inode_post_setxattr(dentry, acl_name, NULL, 0);
+	return evm_inode_post_setxattr(dentry, acl_name, NULL, 0, 0);
 }
 
 int evm_inode_init_security(struct inode *inode, struct inode *dir,
@@ -115,7 +116,8 @@ static inline int evm_inode_setxattr(struct mnt_idmap *idmap,
 static inline void evm_inode_post_setxattr(struct dentry *dentry,
 					   const char *xattr_name,
 					   const void *xattr_value,
-					   size_t xattr_value_len)
+					   size_t xattr_value_len,
+					   int flags)
 {
 	return;
 }
diff --git a/security/integrity/evm/evm_main.c b/security/integrity/evm/evm_main.c
index 12ba3207fd31..d35143179699 100644
--- a/security/integrity/evm/evm_main.c
+++ b/security/integrity/evm/evm_main.c
@@ -753,6 +753,7 @@ bool evm_revalidate_status(const char *xattr_name)
  * @xattr_name: pointer to the affected extended attribute name
  * @xattr_value: pointer to the new extended attribute value
  * @xattr_value_len: pointer to the new extended attribute value length
+ * @flags: flags to pass into filesystem operations
  *
  * Update the HMAC stored in 'security.evm' to reflect the change.
  *
@@ -761,7 +762,8 @@ bool evm_revalidate_status(const char *xattr_name)
  * i_mutex lock.
  */
 void evm_inode_post_setxattr(struct dentry *dentry, const char *xattr_name,
-			     const void *xattr_value, size_t xattr_value_len)
+			     const void *xattr_value, size_t xattr_value_len,
+			     int flags)
 {
 	if (!evm_revalidate_status(xattr_name))
 		return;
diff --git a/security/security.c b/security/security.c
index 16361f75c2ae..7c240d768a76 100644
--- a/security/security.c
+++ b/security/security.c
@@ -2368,7 +2368,7 @@ void security_inode_post_setxattr(struct dentry *dentry, const char *name,
 	if (unlikely(IS_PRIVATE(d_backing_inode(dentry))))
 		return;
 	call_void_hook(inode_post_setxattr, dentry, name, value, size, flags);
-	evm_inode_post_setxattr(dentry, name, value, size);
+	evm_inode_post_setxattr(dentry, name, value, size, flags);
 }
 
 /**
-- 
2.34.1


