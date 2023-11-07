Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C73F97E4048
	for <lists+selinux@lfdr.de>; Tue,  7 Nov 2023 14:42:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234377AbjKGNmW (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Tue, 7 Nov 2023 08:42:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234404AbjKGNmT (ORCPT
        <rfc822;selinux@vger.kernel.org>); Tue, 7 Nov 2023 08:42:19 -0500
Received: from frasgout12.his.huawei.com (frasgout12.his.huawei.com [14.137.139.154])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EFF119B;
        Tue,  7 Nov 2023 05:42:13 -0800 (PST)
Received: from mail02.huawei.com (unknown [172.18.147.227])
        by frasgout12.his.huawei.com (SkyGuard) with ESMTP id 4SPprM5Xkzz9v7HG;
        Tue,  7 Nov 2023 21:25:55 +0800 (CST)
Received: from huaweicloud.com (unknown [10.204.63.22])
        by APP2 (Coremail) with SMTP id GxC2BwDHdmBmPkplW202AA--.56782S5;
        Tue, 07 Nov 2023 14:41:45 +0100 (CET)
From:   Roberto Sassu <roberto.sassu@huaweicloud.com>
To:     viro@zeniv.linux.org.uk, brauner@kernel.org,
        chuck.lever@oracle.com, jlayton@kernel.org, neilb@suse.de,
        kolga@netapp.com, Dai.Ngo@oracle.com, tom@talpey.com,
        paul@paul-moore.com, jmorris@namei.org, serge@hallyn.com,
        zohar@linux.ibm.com, dmitry.kasatkin@gmail.com,
        dhowells@redhat.com, jarkko@kernel.org,
        stephen.smalley.work@gmail.com, eparis@parisplace.org,
        casey@schaufler-ca.com, mic@digikod.net
Cc:     linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-nfs@vger.kernel.org, linux-security-module@vger.kernel.org,
        linux-integrity@vger.kernel.org, keyrings@vger.kernel.org,
        selinux@vger.kernel.org, Roberto Sassu <roberto.sassu@huawei.com>,
        Stefan Berger <stefanb@linux.ibm.com>
Subject: [PATCH v5 03/23] ima: Align ima_inode_setxattr() definition with LSM infrastructure
Date:   Tue,  7 Nov 2023 14:39:52 +0100
Message-Id: <20231107134012.682009-4-roberto.sassu@huaweicloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231107134012.682009-1-roberto.sassu@huaweicloud.com>
References: <20231107134012.682009-1-roberto.sassu@huaweicloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: GxC2BwDHdmBmPkplW202AA--.56782S5
X-Coremail-Antispam: 1UD129KBjvJXoWxJFyDGF1DCryftr43tr48Crg_yoW5CrWfpF
        s5Ga48Gw1FqFy7WryFya17u39Y93y8WryUurWDK3Z2yFnxJr1xtFyfAr1j9ry5Zr48Kr1v
        qa1aqrs0kw13trJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUBab4IE77IF4wAFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k2
        6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI8067AKxVWUWw
        A2048vs2IY020Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
        w2x7M28EF7xvwVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
        W8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
        6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2
        WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkE
        bVWUJVW8JwACjcxG0xvY0x0EwIxGrwACI402YVCY1x02628vn2kIc2xKxwCF04k20xvY0x
        0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
        7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcV
        C0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJwCI42IY
        6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aV
        CY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x07UAkuxUUUUU=
X-CM-SenderInfo: purev21wro2thvvxqx5xdzvxpfor3voofrz/1tbiAgAOBF1jj5IbaQABsY
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

From: Roberto Sassu <roberto.sassu@huawei.com>

Change ima_inode_setxattr() definition, so that it can be registered as
implementation of the inode_setxattr hook.

Signed-off-by: Roberto Sassu <roberto.sassu@huawei.com>
Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
Reviewed-by: Mimi Zohar <zohar@linux.ibm.com>
---
 include/linux/ima.h                   | 11 +++++++----
 security/integrity/ima/ima_appraise.c |  5 +++--
 security/security.c                   |  2 +-
 3 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/include/linux/ima.h b/include/linux/ima.h
index b66353f679e8..077324309c11 100644
--- a/include/linux/ima.h
+++ b/include/linux/ima.h
@@ -188,8 +188,9 @@ static inline void ima_post_key_create_or_update(struct key *keyring,
 extern bool is_ima_appraise_enabled(void);
 extern void ima_inode_post_setattr(struct mnt_idmap *idmap,
 				   struct dentry *dentry, int ia_valid);
-extern int ima_inode_setxattr(struct dentry *dentry, const char *xattr_name,
-		       const void *xattr_value, size_t xattr_value_len);
+extern int ima_inode_setxattr(struct mnt_idmap *idmap, struct dentry *dentry,
+			      const char *xattr_name, const void *xattr_value,
+			      size_t xattr_value_len, int flags);
 extern int ima_inode_set_acl(struct mnt_idmap *idmap,
 			     struct dentry *dentry, const char *acl_name,
 			     struct posix_acl *kacl);
@@ -212,10 +213,12 @@ static inline void ima_inode_post_setattr(struct mnt_idmap *idmap,
 	return;
 }
 
-static inline int ima_inode_setxattr(struct dentry *dentry,
+static inline int ima_inode_setxattr(struct mnt_idmap *idmap,
+				     struct dentry *dentry,
 				     const char *xattr_name,
 				     const void *xattr_value,
-				     size_t xattr_value_len)
+				     size_t xattr_value_len,
+				     int flags)
 {
 	return 0;
 }
diff --git a/security/integrity/ima/ima_appraise.c b/security/integrity/ima/ima_appraise.c
index 36c2938a5c69..cb2d0d11aa77 100644
--- a/security/integrity/ima/ima_appraise.c
+++ b/security/integrity/ima/ima_appraise.c
@@ -750,8 +750,9 @@ static int validate_hash_algo(struct dentry *dentry,
 	return -EACCES;
 }
 
-int ima_inode_setxattr(struct dentry *dentry, const char *xattr_name,
-		       const void *xattr_value, size_t xattr_value_len)
+int ima_inode_setxattr(struct mnt_idmap *idmap, struct dentry *dentry,
+		       const char *xattr_name, const void *xattr_value,
+		       size_t xattr_value_len, int flags)
 {
 	const struct evm_ima_xattr_data *xvalue = xattr_value;
 	int digsig = 0;
diff --git a/security/security.c b/security/security.c
index c87ba1bbd7dc..ec5c8065ea36 100644
--- a/security/security.c
+++ b/security/security.c
@@ -2269,7 +2269,7 @@ int security_inode_setxattr(struct mnt_idmap *idmap,
 		ret = cap_inode_setxattr(dentry, name, value, size, flags);
 	if (ret)
 		return ret;
-	ret = ima_inode_setxattr(dentry, name, value, size);
+	ret = ima_inode_setxattr(idmap, dentry, name, value, size, flags);
 	if (ret)
 		return ret;
 	return evm_inode_setxattr(idmap, dentry, name, value, size);
-- 
2.34.1

