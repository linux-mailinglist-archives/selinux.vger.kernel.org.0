Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55B9A30B2AE
	for <lists+selinux@lfdr.de>; Mon,  1 Feb 2021 23:20:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229543AbhBAWSw (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Mon, 1 Feb 2021 17:18:52 -0500
Received: from mx1.polytechnique.org ([129.104.30.34]:48756 "EHLO
        mx1.polytechnique.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229481AbhBAWSu (ORCPT
        <rfc822;selinux@vger.kernel.org>); Mon, 1 Feb 2021 17:18:50 -0500
Received: from localhost.localdomain (85-168-38-217.rev.numericable.fr [85.168.38.217])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by ssl.polytechnique.org (Postfix) with ESMTPSA id 037EE5646C6
        for <selinux@vger.kernel.org>; Mon,  1 Feb 2021 23:18:08 +0100 (CET)
From:   Nicolas Iooss <nicolas.iooss@m4x.org>
To:     selinux@vger.kernel.org
Subject: [PATCH 1/1] libsepol/cil: unlink blockinherit->block link when destroying a block
Date:   Mon,  1 Feb 2021 23:17:58 +0100
Message-Id: <20210201221758.13349-1-nicolas.iooss@m4x.org>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AV-Checked: ClamAV using ClamSMTP at svoboda.polytechnique.org (Mon Feb  1 23:18:09 2021 +0100 (CET))
X-Spam-Flag: No, tests=bogofilter, spamicity=0.014554, queueID=320E45646C9
X-Org-Mail: nicolas.iooss.2010@polytechnique.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

The following CIL policy triggers a heap use-after-free in secilc
because when the blockinherit node is destroyed, the block node was
already destroyed:

    (block b2a)
    (blockinherit b2a)

Fix this by setting blockinherit->block to NULL when destroying block.

Signed-off-by: Nicolas Iooss <nicolas.iooss@m4x.org>
---
 libsepol/cil/src/cil_build_ast.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/libsepol/cil/src/cil_build_ast.c b/libsepol/cil/src/cil_build_ast.c
index 02481558ad11..c6edcde6bc5d 100644
--- a/libsepol/cil/src/cil_build_ast.c
+++ b/libsepol/cil/src/cil_build_ast.c
@@ -231,13 +231,30 @@ exit:
 
 void cil_destroy_block(struct cil_block *block)
 {
+	struct cil_list_item *item;
+	struct cil_tree_node *bi_node;
+	struct cil_blockinherit *inherit;
+
 	if (block == NULL) {
 		return;
 	}
 
 	cil_symtab_datum_destroy(&block->datum);
 	cil_symtab_array_destroy(block->symtab);
-	cil_list_destroy(&block->bi_nodes, CIL_FALSE);
+	if (block->bi_nodes != NULL) {
+		/* unlink blockinherit->block */
+		cil_list_for_each(item, block->bi_nodes) {
+			bi_node = item->data;
+			/* the conditions should always be true, but better be sure */
+			if (bi_node->flavor == CIL_BLOCKINHERIT) {
+				inherit = bi_node->data;
+				if (inherit->block == block) {
+					inherit->block = NULL;
+				}
+			}
+		}
+		cil_list_destroy(&block->bi_nodes, CIL_FALSE);
+	}
 
 	free(block);
 }
-- 
2.30.0

