Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0FFE1A4B0F
	for <lists+selinux@lfdr.de>; Sun,  1 Sep 2019 20:07:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729087AbfIASG7 (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Sun, 1 Sep 2019 14:06:59 -0400
Received: from mx1.polytechnique.org ([129.104.30.34]:59543 "EHLO
        mx1.polytechnique.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728952AbfIASG6 (ORCPT
        <rfc822;selinux@vger.kernel.org>); Sun, 1 Sep 2019 14:06:58 -0400
Received: from localhost.localdomain (85-168-38-217.rev.numericable.fr [85.168.38.217])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by ssl.polytechnique.org (Postfix) with ESMTPSA id 6A6D0564880
        for <selinux@vger.kernel.org>; Sun,  1 Sep 2019 20:06:57 +0200 (CEST)
From:   Nicolas Iooss <nicolas.iooss@m4x.org>
To:     selinux@vger.kernel.org
Subject: [PATCH 9/9] libsepol/tests: do not dereference a NULL pointer
Date:   Sun,  1 Sep 2019 20:06:36 +0200
Message-Id: <20190901180636.31586-10-nicolas.iooss@m4x.org>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190901180636.31586-1-nicolas.iooss@m4x.org>
References: <20190901180636.31586-1-nicolas.iooss@m4x.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AV-Checked: ClamAV using ClamSMTP at svoboda.polytechnique.org (Sun Sep  1 20:06:57 2019 +0200 (CEST))
X-Spam-Flag: No, tests=bogofilter, spamicity=0.000080, queueID=940B1564884
X-Org-Mail: nicolas.iooss.2010@polytechnique.org
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

In test_attr_types, the pointer decl is allowed to be NULL in the
beginning, but is dereferenced to produce a helpful message right before
a CU_ASSERT_FATAL. Make this derefence not happen if the pointer is
NULL.

This issue has been found using clang's static analyzer.

Signed-off-by: Nicolas Iooss <nicolas.iooss@m4x.org>
---
 libsepol/tests/test-common.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/libsepol/tests/test-common.c b/libsepol/tests/test-common.c
index e6619ed1d152..1d902880fe2e 100644
--- a/libsepol/tests/test-common.c
+++ b/libsepol/tests/test-common.c
@@ -228,13 +228,16 @@ void test_attr_types(policydb_t * p, const char *id, avrule_decl_t * decl, const
 	unsigned int i;
 	type_datum_t *attr;
 
-	if (decl)
+	if (decl) {
 		attr = hashtab_search(decl->p_types.table, id);
-	else
+		if (attr == NULL)
+			printf("could not find attr %s in decl %d\n", id, decl->decl_id);
+	} else {
 		attr = hashtab_search(p->p_types.table, id);
+		if (attr == NULL)
+			printf("could not find attr %s in policy\n", id);
+	}
 
-	if (attr == NULL)
-		printf("could not find attr %s in decl %d\n", id, decl->decl_id);
 	CU_ASSERT_FATAL(attr != NULL);
 	CU_ASSERT(attr->flavor == TYPE_ATTRIB);
 	CU_ASSERT(attr->primary == 1);
-- 
2.22.0

