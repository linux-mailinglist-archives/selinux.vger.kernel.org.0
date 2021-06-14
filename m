Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67BFB3A699E
	for <lists+selinux@lfdr.de>; Mon, 14 Jun 2021 17:07:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233014AbhFNPJP (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Mon, 14 Jun 2021 11:09:15 -0400
Received: from mail-qk1-f181.google.com ([209.85.222.181]:34507 "EHLO
        mail-qk1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232958AbhFNPJO (ORCPT
        <rfc822;selinux@vger.kernel.org>); Mon, 14 Jun 2021 11:09:14 -0400
Received: by mail-qk1-f181.google.com with SMTP id k11so37051701qkk.1
        for <selinux@vger.kernel.org>; Mon, 14 Jun 2021 08:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8MBojHBZyYNrYaT8XmIlkDcMqfyBisYItKmu7GdCavQ=;
        b=Mrl9PEudqpHVgmtR1wYwIV4R0TzKHaDHnGoqp0bXGezQY7/JwqyKxi2R05dU9+3K+G
         oXN9K+km+TwfTJ1TaorrvCwGtQXfposiOL6OIc+Lnxkq9m5USBs21K3Eb7TORoATcbHa
         bT+Iuhc67Mq2080v5ew0TVUiJz4rbrNRaERDlheDniWEf2PXOlMQFm5BgIGXDrt+ZPwa
         uwXIKi5jsk423HM2iTTGB9ixea76FYPIX+6vsl6nvwHn9VYbxMwU1C/Pu4xIliAbX+05
         b/gePFCDt5j8ol5F7SiO/d36V04G0GRYuRTEAuUzipSk8xGnrPix9qokjDM/PQ7SlrKx
         aD9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8MBojHBZyYNrYaT8XmIlkDcMqfyBisYItKmu7GdCavQ=;
        b=AcTg9A9GhJEulVFoUx9l1tnqu/4KPIWrcyFz1I6U7e/pxsIA8W2ORUBLEST+sRC740
         V+bBBcyVye9NNyCHniM3apqhvLKomPBssIC27MrHAmVQzHnh4JbEfOSsq18RI9Xc6dbV
         fLI8J/Lk/D6equzx8gNVfet71ys7wOcY/bx/a8uOMC73Cgq4e/mQLIKuJYhATn4OtO56
         J2A/aX9txDnBWCBuTiNd1/zCT0Jg5l2GLzSN8HhcEKY1FSQCXE217ukMDZWPdeRO84m+
         fg1cfWuB2DxtfFharQV1VZFA75QJvbVUY/GuyHZM2Px3gLbjzmrlT5JBCCFaoMLglcOK
         6bqw==
X-Gm-Message-State: AOAM530hfB66ofX7r1ZdjVE19WCkNxKRUWXo4KZnw8x2poIpfjNxR5c8
        c4jCnsEqVq6RfsfianKCaDka6K+/y5SDpw==
X-Google-Smtp-Source: ABdhPJzXjFyFwmVC4F+aPRFyRdaOWFYz4utkL3xc8G0IIZwdbtBaBE2GWWD9KePI/A6eSEGh0vkwbA==
X-Received: by 2002:a05:620a:11:: with SMTP id j17mr16479271qki.258.1623683154204;
        Mon, 14 Jun 2021 08:05:54 -0700 (PDT)
Received: from localhost.localdomain (c-73-200-157-122.hsd1.md.comcast.net. [73.200.157.122])
        by smtp.gmail.com with ESMTPSA id 75sm8221014qkm.57.2021.06.14.08.05.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jun 2021 08:05:53 -0700 (PDT)
From:   James Carter <jwcart2@gmail.com>
To:     selinux@vger.kernel.org
Cc:     nicolas.iooss@m4x.org, James Carter <jwcart2@gmail.com>
Subject: [PATCH 5/5] libsepol/cil: Improve degenerate inheritance check
Date:   Mon, 14 Jun 2021 11:05:46 -0400
Message-Id: <20210614150546.512001-6-jwcart2@gmail.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210614150546.512001-1-jwcart2@gmail.com>
References: <20210614150546.512001-1-jwcart2@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

The commit 74d00a8decebf940d95064ff60042dcb2cbcc2c0 (libsepol/cil:
Detect degenerate inheritance and exit with an error) detects the
use of inheritance (mostly by the secilc-fuzzer and not in any real
policies) that results in the exponential growth of the policy through
the copying of blocks that takes place with inheritance in CIL.
Unfortunately, the check takes place during the pass when all the
blocks are being copied, so it is possible to consume all of a system's
memory before an error is produced.

The new check happens in two parts. First, a check is made while the
block inheritance is being linked to the block it will inherit. In
this check, all of the parent nodes of the inheritance rule up to the
root node are checked and if enough of these blocks are being inherited
(>= CIL_DEGENERATE_INHERITANCE_DEPTH), then a flag is set for a more
in-depth check after the pass. This in-depth check will determine the
number of potential inheritances that will occur when resolving the
all of the inheritance rules. If this value is greater than
CIL_DEGENERATE_INHERITANCE_GROWTH * the original number of inheritance
rules and greater than CIL_DEGENERATE_INHERITANCE_MINIMUM (which is
set to 0x1 << CIL_DEGENERATE_INHERITANCE_DEPTH), then degenerate
inheritance is determined to have occurred and an error result will
be returned.

Since the potential number of inheritances can quickly be an extremely
large number, the count of potential inheritances is aborted as soon
as the threshold for degenerate inheritance has been exceeded.

Normal policies should rarely, if ever, have the in-depth check occur.

Signed-off-by: James Carter <jwcart2@gmail.com>
---
 libsepol/cil/src/cil_internal.h    |   5 +-
 libsepol/cil/src/cil_resolve_ast.c | 229 +++++++++++++++++++----------
 2 files changed, 153 insertions(+), 81 deletions(-)

diff --git a/libsepol/cil/src/cil_internal.h b/libsepol/cil/src/cil_internal.h
index a77c9520..b8610976 100644
--- a/libsepol/cil/src/cil_internal.h
+++ b/libsepol/cil/src/cil_internal.h
@@ -48,8 +48,9 @@
 
 #define CIL_MAX_NAME_LENGTH 2048
 
-#define CIL_DEGENERATE_INHERITANCE_DEPTH 12
-#define CIL_DEGENERATE_INHERITANCE_BREADTH (0x1 << CIL_DEGENERATE_INHERITANCE_DEPTH)
+#define CIL_DEGENERATE_INHERITANCE_DEPTH 10UL
+#define CIL_DEGENERATE_INHERITANCE_MINIMUM (0x01 << CIL_DEGENERATE_INHERITANCE_DEPTH)
+#define CIL_DEGENERATE_INHERITANCE_GROWTH 10UL
 
 enum cil_pass {
 	CIL_PASS_INIT = 0,
diff --git a/libsepol/cil/src/cil_resolve_ast.c b/libsepol/cil/src/cil_resolve_ast.c
index 77ffe0ff..baf6fc0d 100644
--- a/libsepol/cil/src/cil_resolve_ast.c
+++ b/libsepol/cil/src/cil_resolve_ast.c
@@ -62,6 +62,7 @@ struct cil_args_resolve {
 	struct cil_list *catorder_lists;
 	struct cil_list *sensitivityorder_lists;
 	struct cil_list *in_list;
+	int *inheritance_check;
 };
 
 static struct cil_name * __cil_insert_name(struct cil_db *db, hashtab_key_t key, struct cil_tree_node *ast_node)
@@ -2306,40 +2307,7 @@ exit:
 	return rc;
 }
 
-int cil_resolve_blockinherit_link(struct cil_tree_node *current, void *extra_args)
-{
-	struct cil_blockinherit *inherit = current->data;
-	struct cil_symtab_datum *block_datum = NULL;
-	struct cil_tree_node *node = NULL;
-	int rc = SEPOL_ERR;
-
-	rc = cil_resolve_name(current, inherit->block_str, CIL_SYM_BLOCKS, extra_args, &block_datum);
-	if (rc != SEPOL_OK) {
-		goto exit;
-	}
-
-	node = NODE(block_datum);
-
-	if (node->flavor != CIL_BLOCK) {
-		cil_log(CIL_ERR, "%s is not a block\n", cil_node_to_string(node));
-		rc = SEPOL_ERR;
-		goto exit;
-	}
-
-	inherit->block = (struct cil_block *)block_datum;
-
-	if (inherit->block->bi_nodes == NULL) {
-		cil_list_init(&inherit->block->bi_nodes, CIL_NODE);
-	}
-	cil_list_append(inherit->block->bi_nodes, CIL_NODE, current);
-
-	return SEPOL_OK;
-
-exit:
-	return rc;
-}
-
-void cil_print_recursive_blockinherit(struct cil_tree_node *bi_node, struct cil_tree_node *terminating_node)
+static void cil_print_recursive_blockinherit(struct cil_tree_node *bi_node, struct cil_tree_node *terminating_node)
 {
 	struct cil_list *trace = NULL;
 	struct cil_list_item *item = NULL;
@@ -2377,7 +2345,7 @@ void cil_print_recursive_blockinherit(struct cil_tree_node *bi_node, struct cil_
 	cil_list_destroy(&trace, CIL_FALSE);
 }
 
-int cil_check_recursive_blockinherit(struct cil_tree_node *bi_node)
+static int cil_check_recursive_blockinherit(struct cil_tree_node *bi_node)
 {
 	struct cil_tree_node *curr = NULL;
 	struct cil_blockinherit *bi = NULL;
@@ -2410,53 +2378,68 @@ exit:
 	return rc;
 }
 
-/*
- * Detect degenerate inheritance of the form:
- * ...
- * (blockinherit ba)
- * (block ba
- *    (block b1
- *      (blockinherit bb)
- *    )
- *    (block bb
- *      (block b2
- *        (blockinherit bc)
- *      )
- *      (block bc
- *      ...
- */
-static int cil_check_for_degenerate_inheritance(struct cil_tree_node *current)
+static int cil_possible_degenerate_inheritance(struct cil_tree_node *node)
 {
-	struct cil_block *block = current->data;
-	struct cil_tree_node *node;
-	struct cil_list_item *item;
-	unsigned depth;
-	unsigned breadth = 0;
-
-	cil_list_for_each(item, block->bi_nodes) {
-		breadth++;
-	}
+	unsigned depth = 1;
 
-	if (breadth >= CIL_DEGENERATE_INHERITANCE_BREADTH) {
-		node = current->parent;
-		depth = 0;
-		while (node && node->flavor != CIL_ROOT) {
-			if (node->flavor == CIL_BLOCK) {
-				block = node->data;
-				if (block->bi_nodes != NULL) {
-					depth++;
-				}
+	node = node->parent;
+	while (node && node->flavor != CIL_ROOT) {
+		if (node->flavor == CIL_BLOCK) {
+			if (((struct cil_block *)(node->data))->bi_nodes != NULL) {
+				depth++;
 			}
-			node = node->parent;
 		}
+		node = node->parent;
+	}
 
-		if (depth >= CIL_DEGENERATE_INHERITANCE_DEPTH) {
-			cil_tree_log(current, CIL_ERR, "Degenerate inheritance detected (depth=%u, breadth=%u)", depth, breadth);
-			return SEPOL_ERR;
-		}
+	if (depth >= CIL_DEGENERATE_INHERITANCE_DEPTH) {
+		return CIL_TRUE;
+	}
+
+	return CIL_FALSE;
+}
+
+int cil_resolve_blockinherit_link(struct cil_tree_node *current, void *extra_args)
+{
+	struct cil_args_resolve *args = extra_args;
+	struct cil_blockinherit *inherit = current->data;
+	struct cil_symtab_datum *block_datum = NULL;
+	struct cil_tree_node *node = NULL;
+	int rc = SEPOL_ERR;
+
+	rc = cil_resolve_name(current, inherit->block_str, CIL_SYM_BLOCKS, extra_args, &block_datum);
+	if (rc != SEPOL_OK) {
+		goto exit;
+	}
+
+	node = NODE(block_datum);
+
+	if (node->flavor != CIL_BLOCK) {
+		cil_log(CIL_ERR, "%s is not a block\n", cil_node_to_string(node));
+		rc = SEPOL_ERR;
+		goto exit;
+	}
+
+	inherit->block = (struct cil_block *)block_datum;
+
+	rc = cil_check_recursive_blockinherit(current);
+	if (rc != SEPOL_OK) {
+			goto exit;
+	}
+
+	if (inherit->block->bi_nodes == NULL) {
+		cil_list_init(&inherit->block->bi_nodes, CIL_NODE);
+	}
+	cil_list_append(inherit->block->bi_nodes, CIL_NODE, current);
+
+	if (*(args->inheritance_check) == CIL_FALSE) {
+		*(args->inheritance_check) = cil_possible_degenerate_inheritance(node);
 	}
 
 	return SEPOL_OK;
+
+exit:
+	return rc;
 }
 
 int cil_resolve_blockinherit_copy(struct cil_tree_node *current, void *extra_args)
@@ -2475,11 +2458,6 @@ int cil_resolve_blockinherit_copy(struct cil_tree_node *current, void *extra_arg
 
 	db = args->db;
 
-	rc = cil_check_for_degenerate_inheritance(current);
-	if (rc != SEPOL_OK) {
-		goto exit;
-	}
-
 	// Make sure this is the original block and not a merged block from a blockinherit
 	if (current != block->datum.nodes->head->data) {
 		rc = SEPOL_OK;
@@ -3579,6 +3557,88 @@ exit:
 	return rc;
 }
 
+/*
+ * Degenerate inheritance leads to exponential growth of the policy
+ * It can take many forms, but here is one example.
+ * ...
+ * (blockinherit ba)
+ * (block b0
+ *   (block b1
+ *     (block b2
+ *       (block b3
+ *         ...
+ *       )
+ *       (blockinherit b3)
+ *     )
+ *     (blockinherit b2)
+ *   )
+ *   (blockinherit b1)
+ * )
+ * (blockinherit b0)
+ * ...
+ * This leads to 2^4 copies of the content of block b3, 2^3 copies of the
+ * contents of block b2, etc.
+ */
+static unsigned cil_count_actual(struct cil_tree_node *node)
+{
+	unsigned count = 0;
+
+	if (node->flavor == CIL_BLOCKINHERIT) {
+		count += 1;
+	}
+
+	for (node = node->cl_head; node; node = node->next) {
+		count += cil_count_actual(node);
+	}
+
+	return count;
+}
+
+static unsigned cil_count_potential(struct cil_tree_node *node, unsigned max)
+{
+	unsigned count = 0;
+
+	if (node->flavor == CIL_BLOCKINHERIT) {
+		struct cil_blockinherit *bi = node->data;
+		count += 1;
+		if (bi->block) {
+			count += cil_count_potential(NODE(bi->block), max);
+			if (count > max) {
+				return count;
+			}
+		}
+	}
+
+	for (node = node->cl_head; node; node = node->next) {
+		count += cil_count_potential(node, max);
+		if (count > max) {
+			return count;
+		}
+	}
+
+	return count;
+}
+
+static int cil_check_for_degenerate_inheritance(struct cil_tree_node *node)
+{
+	uint64_t num_actual, num_potential, max;
+
+	num_actual = cil_count_actual(node);
+
+	max = num_actual * CIL_DEGENERATE_INHERITANCE_GROWTH;
+	if (max < CIL_DEGENERATE_INHERITANCE_MINIMUM) {
+		max = CIL_DEGENERATE_INHERITANCE_MINIMUM;
+	}
+
+	num_potential = cil_count_potential(node, max);
+
+	if (num_potential > max) {
+		return SEPOL_ERR;
+	}
+
+	return SEPOL_OK;
+}
+
 int __cil_resolve_ast_node(struct cil_tree_node *node, void *extra_args)
 {
 	int rc = SEPOL_OK;
@@ -4054,6 +4114,7 @@ int cil_resolve_ast(struct cil_db *db, struct cil_tree_node *current)
 	struct cil_args_resolve extra_args;
 	enum cil_pass pass = CIL_PASS_TIF;
 	uint32_t changed = 0;
+	int inheritance_check = 0;
 
 	if (db == NULL || current == NULL) {
 		return rc;
@@ -4072,6 +4133,7 @@ int cil_resolve_ast(struct cil_db *db, struct cil_tree_node *current)
 	extra_args.catorder_lists = NULL;
 	extra_args.sensitivityorder_lists = NULL;
 	extra_args.in_list = NULL;
+	extra_args.inheritance_check = &inheritance_check;
 
 	cil_list_init(&extra_args.disabled_optionals, CIL_NODE);
 	cil_list_init(&extra_args.sidorder_lists, CIL_LIST_ITEM);
@@ -4096,6 +4158,15 @@ int cil_resolve_ast(struct cil_db *db, struct cil_tree_node *current)
 			cil_list_destroy(&extra_args.in_list, CIL_FALSE);
 		}
 
+		if (pass == CIL_PASS_BLKIN_LINK) {
+			rc = cil_check_for_degenerate_inheritance(current);
+			if (rc != SEPOL_OK) {
+				cil_log(CIL_ERR, "Degenerate inheritance detected\n");
+				rc = SEPOL_ERR;
+				goto exit;
+			}
+		}
+
 		if (pass == CIL_PASS_MISC1) {
 			db->sidorder = __cil_ordered_lists_merge_all(&extra_args.sidorder_lists, NULL);
 			if (db->sidorder == NULL) {
-- 
2.26.3

