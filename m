Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A210E2E77A8
	for <lists+selinux@lfdr.de>; Wed, 30 Dec 2020 11:09:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726285AbgL3KIm (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Wed, 30 Dec 2020 05:08:42 -0500
Received: from mx1.polytechnique.org ([129.104.30.34]:60812 "EHLO
        mx1.polytechnique.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726276AbgL3KIl (ORCPT
        <rfc822;selinux@vger.kernel.org>); Wed, 30 Dec 2020 05:08:41 -0500
Received: from localhost.localdomain (174.17.206.77.rev.sfr.net [77.206.17.174])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by ssl.polytechnique.org (Postfix) with ESMTPSA id DB365565ABF
        for <selinux@vger.kernel.org>; Wed, 30 Dec 2020 11:07:58 +0100 (CET)
From:   Nicolas Iooss <nicolas.iooss@m4x.org>
To:     selinux@vger.kernel.org
Subject: [PATCH 5/6] libsepol/cil: fix out-of-bound read in cil_print_recursive_blockinherit
Date:   Wed, 30 Dec 2020 11:07:45 +0100
Message-Id: <20201230100746.2549568-5-nicolas.iooss@m4x.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201230100746.2549568-1-nicolas.iooss@m4x.org>
References: <20201230100746.2549568-1-nicolas.iooss@m4x.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AV-Checked: ClamAV using ClamSMTP at svoboda.polytechnique.org (Wed Dec 30 11:07:59 2020 +0100 (CET))
X-Spam-Flag: No, tests=bogofilter, spamicity=0.000069, queueID=199AC565AC0
X-Org-Mail: nicolas.iooss.2010@polytechnique.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

OSS-Fuzz found a heap buffer overflow (out-of-bound reads) when the CIL
compiler tries to report a recursive blockinherit with an optional
block:

    $ echo '(block b (optional o (blockinherit b)))' > tmp.cil
    $ secilc tmp.cil
    Segmentation fault (core dumped)

This is because cil_print_recursive_blockinherit() assumes that all
nodes are either CIL_BLOCK or CIL_BLOCKINHERIT. Add support for other
block kinds, using cil_node_to_string() to show them.

Fixes: https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=28462
Signed-off-by: Nicolas Iooss <nicolas.iooss@m4x.org>
---
 libsepol/cil/src/cil_resolve_ast.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/libsepol/cil/src/cil_resolve_ast.c b/libsepol/cil/src/cil_resolve_ast.c
index f6deb1002fbd..ecd05dfa5dab 100644
--- a/libsepol/cil/src/cil_resolve_ast.c
+++ b/libsepol/cil/src/cil_resolve_ast.c
@@ -2343,11 +2343,13 @@ void cil_print_recursive_blockinherit(struct cil_tree_node *bi_node, struct cil_
 	for (curr = bi_node; curr != terminating_node; curr = curr->parent) {
 		if (curr->flavor == CIL_BLOCK) {
 			cil_list_prepend(trace, CIL_NODE, curr);
-		} else {
+		} else if (curr->flavor == CIL_BLOCKINHERIT) {
 			if (curr != bi_node) {
 				cil_list_prepend(trace, CIL_NODE, NODE(((struct cil_blockinherit *)curr->data)->block));
 			}
 			cil_list_prepend(trace, CIL_NODE, curr);
+		} else {
+			cil_list_prepend(trace, CIL_NODE, curr);
 		}
 	}
 	cil_list_prepend(trace, CIL_NODE, terminating_node);
@@ -2356,8 +2358,12 @@ void cil_print_recursive_blockinherit(struct cil_tree_node *bi_node, struct cil_
 		curr = item->data;
 		if (curr->flavor == CIL_BLOCK) {
 			cil_tree_log(curr, CIL_ERR, "block %s", DATUM(curr->data)->name);
-		} else {
+		} else if (curr->flavor == CIL_BLOCKINHERIT) {
 			cil_tree_log(curr, CIL_ERR, "blockinherit %s", ((struct cil_blockinherit *)curr->data)->block_str);
+		} else if (curr->flavor == CIL_OPTIONAL) {
+			cil_tree_log(curr, CIL_ERR, "optional %s", DATUM(curr->data)->name);
+		} else {
+			cil_tree_log(curr, CIL_ERR, "%s", cil_node_to_string(curr));
 		}
 	}
 
-- 
2.29.2

