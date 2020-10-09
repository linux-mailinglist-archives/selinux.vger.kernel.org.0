Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D815D28800C
	for <lists+selinux@lfdr.de>; Fri,  9 Oct 2020 03:38:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729195AbgJIBiB (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Thu, 8 Oct 2020 21:38:01 -0400
Received: from smtpbgsg3.qq.com ([54.179.177.220]:52707 "EHLO smtpbgsg3.qq.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727313AbgJIBiB (ORCPT <rfc822;selinux@vger.kernel.org>);
        Thu, 8 Oct 2020 21:38:01 -0400
X-QQ-mid: bizesmtp5t1602207449tw4bkf1lb
Received: from localhost.localdomain (unknown [218.76.23.26])
        by esmtp6.qq.com (ESMTP) with 
        id ; Fri, 09 Oct 2020 09:37:22 +0800 (CST)
X-QQ-SSF: 01400000002000F0D000B00A0000000
X-QQ-FEAT: ttTApyPbKRL8o/OW0Tc0K/ozrqMmUh4lWJLcEiDW15mb3C4vXfw1vCIv2XQqC
        wFQziXVkN3tmsOZ9AwG5wTtoTV/MI+OoZIq8sulMn3XP5WnjcpBxuI7T6cRSN1PtPhBNgUq
        fpzDFEa5wWdB1GJM/0nbtKNZRrJYEzTdO73aKsh0U+Nd6p8ckInZBgIA0jzN2u1wqG4jbKE
        Gud1sineM05CuFoV+0bhEtVVAF/z7hJsnRiWaqJYOtn1dZaCQASDy6BXda+iOicuU0uc3ld
        GZf3E3eQV+aEf/WRIqQ0HLfKuHjLase2zKvO31NjRHZADbumvUPCUXSk193H7q9QB4R7Ysy
        qvYeuAO
X-QQ-GoodBg: 2
From:   rentianyue@tj.kylinos.cn
To:     Paul Moore <paul@paul-moore.com>,
        Stephen Smalley <stephen.smalley.work@gmail.com>,
        Eric Paris <eparis@parisplace.org>,
        Andreas Gruenbacher <agruenba@redhat.com>
Cc:     yangzhao@kylinos.cn, selinux@vger.kernel.org,
        Tianyue Ren <rentianyue@kylinos.cn>
Subject: [PATCH v3 1/1] selinux: fix error initialization in inode_doinit_with_dentry()
Date:   Fri,  9 Oct 2020 09:36:30 +0800
Message-Id: <20201009013630.6777-2-rentianyue@tj.kylinos.cn>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201009013630.6777-1-rentianyue@tj.kylinos.cn>
References: <CAHC9VhQTp3Rc_7zM661Rzur0XSuWRWKJJg=CwLPAQo5ABRpS-w@mail.gmail.com>
 <20201009013630.6777-1-rentianyue@tj.kylinos.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tj.kylinos.cn:qybgforeign:qybgforeign6
X-QQ-Bgrelay: 1
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

From: Tianyue Ren <rentianyue@kylinos.cn>

Mark the inode security label as invalid if we cannot find
a dentry so that we will retry later rather than marking it
initialized with the unlabeled SID.

Fixes: 9287aed2ad1f ("selinux: Convert isec->lock into a spinlock")
Signed-off-by: Tianyue Ren <rentianyue@kylinos.cn>
---
 security/selinux/hooks.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/security/selinux/hooks.c b/security/selinux/hooks.c
index bf8328adad8f..c3ca2957a79d 100644
--- a/security/selinux/hooks.c
+++ b/security/selinux/hooks.c
@@ -1499,7 +1499,13 @@ static int inode_doinit_with_dentry(struct inode *inode, struct dentry *opt_dent
 			 * inode_doinit with a dentry, before these inodes could
 			 * be used again by userspace.
 			 */
-			goto out;
+			isec->initialized = LABEL_INVALID;
+			/*
+			 * There is nothing useful to jump to "out"
+			 * label that except a needless spin
+			 * lock/unlock cycle.
+			 */
+			return 0;
 		}
 
 		rc = inode_doinit_use_xattr(inode, dentry, sbsec->def_sid,
@@ -1553,8 +1559,15 @@ static int inode_doinit_with_dentry(struct inode *inode, struct dentry *opt_dent
 			 * inode_doinit() with a dentry, before these inodes
 			 * could be used again by userspace.
 			 */
-			if (!dentry)
-				goto out;
+			if (!dentry) {
+				isec->initialized = LABEL_INVALID;
+				/*
+				 * There is nothing useful to jump to "out"
+				 * label that except a needless spin
+				 * lock/unlock cycle.
+				 */
+				return 0;
+			}
 			rc = selinux_genfs_get_sid(dentry, sclass,
 						   sbsec->flags, &sid);
 			if (rc) {
-- 
2.28.0



