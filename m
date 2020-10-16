Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F279D29069B
	for <lists+selinux@lfdr.de>; Fri, 16 Oct 2020 15:48:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408422AbgJPNsw (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Fri, 16 Oct 2020 09:48:52 -0400
Received: from linux.microsoft.com ([13.77.154.182]:53644 "EHLO
        linux.microsoft.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2408409AbgJPNsw (ORCPT
        <rfc822;selinux@vger.kernel.org>); Fri, 16 Oct 2020 09:48:52 -0400
Received: from localhost.localdomain (c-73-172-233-15.hsd1.md.comcast.net [73.172.233.15])
        by linux.microsoft.com (Postfix) with ESMTPSA id E5FEE20B9C34;
        Fri, 16 Oct 2020 06:48:50 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com E5FEE20B9C34
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
        s=default; t=1602856131;
        bh=WxRrzRxB6Tzhbb5S6Jo+h31cIl/BtlfpCGyDVhikmwY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=hRx7csBOtHSnR3fRQKMAppJ6beRi15jsToi7qPeLsVhJYDZFuPFeGFPLx8hrD7rCv
         D8BVVnwl5SYI1QywhfKScrNBQG/o42tDezBzApHmT8upWHc9/i7jlxznSsx9C0t9uR
         o/UpelSU1dpA+2vBQyCNFggyTOfDEKhrQOI8/LnU=
From:   Daniel Burgener <dburgener@linux.microsoft.com>
To:     stable@vger.kernel.org
Cc:     stephen.smalley.work@gmail.com, paul@paul-moore.com,
        selinux@vger.kernel.org, jmorris@namei.org, sashal@kernel.org
Subject: [PATCH v5.4 v2 2/4] selinux: Refactor selinuxfs directory populating functions
Date:   Fri, 16 Oct 2020 09:48:33 -0400
Message-Id: <20201016134835.1886478-3-dburgener@linux.microsoft.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20201016134835.1886478-1-dburgener@linux.microsoft.com>
References: <20201016134835.1886478-1-dburgener@linux.microsoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

upstream commit 66ec384ad3044d63c9726493a412a2ad5317eae5

Make sel_make_bools and sel_make_classes take the specific elements of
selinux_fs_info that they need rather than the entire struct.

This will allow a future patch to pass temporary elements that are not in
the selinux_fs_info struct to these functions so that the original elements
can be preserved until we are ready to perform the switch over.

Signed-off-by: Daniel Burgener <dburgener@linux.microsoft.com>
---
 security/selinux/selinuxfs.c | 40 +++++++++++++++++++++---------------
 1 file changed, 24 insertions(+), 16 deletions(-)

diff --git a/security/selinux/selinuxfs.c b/security/selinux/selinuxfs.c
index 092c7295f78d..ea21f3ef4a6f 100644
--- a/security/selinux/selinuxfs.c
+++ b/security/selinux/selinuxfs.c
@@ -340,8 +340,11 @@ static const struct file_operations sel_policyvers_ops = {
 };
 
 /* declaration for sel_write_load */
-static int sel_make_bools(struct selinux_fs_info *fsi);
-static int sel_make_classes(struct selinux_fs_info *fsi);
+static int sel_make_bools(struct selinux_fs_info *fsi, struct dentry *bool_dir,
+			  unsigned int *bool_num, char ***bool_pending_names,
+			  unsigned int **bool_pending_values);
+static int sel_make_classes(struct selinux_fs_info *fsi, struct dentry *class_dir,
+			    unsigned long *last_class_ino);
 static int sel_make_policycap(struct selinux_fs_info *fsi);
 
 /* declaration for sel_make_class_dirs */
@@ -531,13 +534,15 @@ static int sel_make_policy_nodes(struct selinux_fs_info *fsi)
 
 	sel_remove_old_policy_nodes(fsi);
 
-	ret = sel_make_bools(fsi);
+	ret = sel_make_bools(fsi, fsi->bool_dir, &fsi->bool_num,
+			     &fsi->bool_pending_names, &fsi->bool_pending_values);
 	if (ret) {
 		pr_err("SELinux: failed to load policy booleans\n");
 		return ret;
 	}
 
-	ret = sel_make_classes(fsi);
+	ret = sel_make_classes(fsi, fsi->class_dir,
+			       &fsi->last_class_ino);
 	if (ret) {
 		pr_err("SELinux: failed to load policy classes\n");
 		return ret;
@@ -1348,12 +1353,13 @@ static void sel_remove_entries(struct dentry *de)
 
 #define BOOL_DIR_NAME "booleans"
 
-static int sel_make_bools(struct selinux_fs_info *fsi)
+static int sel_make_bools(struct selinux_fs_info *fsi, struct dentry *bool_dir,
+			  unsigned int *bool_num, char ***bool_pending_names,
+			  unsigned int **bool_pending_values)
 {
 	int i, ret;
 	ssize_t len;
 	struct dentry *dentry = NULL;
-	struct dentry *dir = fsi->bool_dir;
 	struct inode *inode = NULL;
 	struct inode_security_struct *isec;
 	char **names = NULL, *page;
@@ -1372,12 +1378,12 @@ static int sel_make_bools(struct selinux_fs_info *fsi)
 
 	for (i = 0; i < num; i++) {
 		ret = -ENOMEM;
-		dentry = d_alloc_name(dir, names[i]);
+		dentry = d_alloc_name(bool_dir, names[i]);
 		if (!dentry)
 			goto out;
 
 		ret = -ENOMEM;
-		inode = sel_make_inode(dir->d_sb, S_IFREG | S_IRUGO | S_IWUSR);
+		inode = sel_make_inode(bool_dir->d_sb, S_IFREG | S_IRUGO | S_IWUSR);
 		if (!inode) {
 			dput(dentry);
 			goto out;
@@ -1406,9 +1412,9 @@ static int sel_make_bools(struct selinux_fs_info *fsi)
 		inode->i_ino = i|SEL_BOOL_INO_OFFSET;
 		d_add(dentry, inode);
 	}
-	fsi->bool_num = num;
-	fsi->bool_pending_names = names;
-	fsi->bool_pending_values = values;
+	*bool_num = num;
+	*bool_pending_names = names;
+	*bool_pending_values = values;
 
 	free_page((unsigned long)page);
 	return 0;
@@ -1421,7 +1427,7 @@ static int sel_make_bools(struct selinux_fs_info *fsi)
 		kfree(names);
 	}
 	kfree(values);
-	sel_remove_entries(dir);
+	sel_remove_entries(bool_dir);
 
 	return ret;
 }
@@ -1806,7 +1812,9 @@ static int sel_make_class_dir_entries(char *classname, int index,
 	return rc;
 }
 
-static int sel_make_classes(struct selinux_fs_info *fsi)
+static int sel_make_classes(struct selinux_fs_info *fsi,
+			    struct dentry *class_dir,
+			    unsigned long *last_class_ino)
 {
 
 	int rc, nclasses, i;
@@ -1817,13 +1825,13 @@ static int sel_make_classes(struct selinux_fs_info *fsi)
 		return rc;
 
 	/* +2 since classes are 1-indexed */
-	fsi->last_class_ino = sel_class_to_ino(nclasses + 2);
+	*last_class_ino = sel_class_to_ino(nclasses + 2);
 
 	for (i = 0; i < nclasses; i++) {
 		struct dentry *class_name_dir;
 
-		class_name_dir = sel_make_dir(fsi->class_dir, classes[i],
-					      &fsi->last_class_ino);
+		class_name_dir = sel_make_dir(class_dir, classes[i],
+					      last_class_ino);
 		if (IS_ERR(class_name_dir)) {
 			rc = PTR_ERR(class_name_dir);
 			goto out;
-- 
2.25.4

