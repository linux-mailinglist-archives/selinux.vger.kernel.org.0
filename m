Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 536B92E77AB
	for <lists+selinux@lfdr.de>; Wed, 30 Dec 2020 11:09:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726230AbgL3KIm (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Wed, 30 Dec 2020 05:08:42 -0500
Received: from mx1.polytechnique.org ([129.104.30.34]:44150 "EHLO
        mx1.polytechnique.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725814AbgL3KIk (ORCPT
        <rfc822;selinux@vger.kernel.org>); Wed, 30 Dec 2020 05:08:40 -0500
Received: from localhost.localdomain (174.17.206.77.rev.sfr.net [77.206.17.174])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by ssl.polytechnique.org (Postfix) with ESMTPSA id 47000565ABF
        for <selinux@vger.kernel.org>; Wed, 30 Dec 2020 11:07:58 +0100 (CET)
From:   Nicolas Iooss <nicolas.iooss@m4x.org>
To:     selinux@vger.kernel.org
Subject: [PATCH 4/6] libsepol/cil: fix NULL pointer dereference when parsing an improper integer
Date:   Wed, 30 Dec 2020 11:07:44 +0100
Message-Id: <20201230100746.2549568-4-nicolas.iooss@m4x.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201230100746.2549568-1-nicolas.iooss@m4x.org>
References: <20201230100746.2549568-1-nicolas.iooss@m4x.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AV-Checked: ClamAV using ClamSMTP at svoboda.polytechnique.org (Wed Dec 30 11:07:58 2020 +0100 (CET))
X-Spam-Flag: No, tests=bogofilter, spamicity=0.000001, queueID=67C1E565AC0
X-Org-Mail: nicolas.iooss.2010@polytechnique.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

OSS-Fuzz found a NULL pointer dereference when the CIL compiler tries to
compile a policy with an invalid integer:

    $ echo '(ioportcon(2())n)' > tmp.cil
    $ secilc tmp.cil
    Segmentation fault (core dumped)

This is because strtol() is called with a NULL pointer, in
cil_fill_integer().

Fix this by checking that int_node->data is not NULL. While at it, use
strtoul() instead of strtol() to parse an unsigned integer.

Fixes: https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=28456
Signed-off-by: Nicolas Iooss <nicolas.iooss@m4x.org>
---
 libsepol/cil/src/cil_build_ast.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/libsepol/cil/src/cil_build_ast.c b/libsepol/cil/src/cil_build_ast.c
index 67801def0dc0..0c9015cef578 100644
--- a/libsepol/cil/src/cil_build_ast.c
+++ b/libsepol/cil/src/cil_build_ast.c
@@ -5566,15 +5566,15 @@ int cil_fill_integer(struct cil_tree_node *int_node, uint32_t *integer, int base
 {
 	int rc = SEPOL_ERR;
 	char *endptr = NULL;
-	int val;
+	unsigned long val;
 
-	if (int_node == NULL || integer == NULL) {
+	if (int_node == NULL || int_node->data == NULL || integer == NULL) {
 		goto exit;
 	}
 
 	errno = 0;
-	val = strtol(int_node->data, &endptr, base);
-	if (errno != 0 || endptr == int_node->data || *endptr != '\0') {
+	val = strtoul(int_node->data, &endptr, base);
+	if (errno != 0 || endptr == int_node->data || *endptr != '\0' || val > UINT32_MAX) {
 		rc = SEPOL_ERR;
 		goto exit;
 	}
@@ -5594,7 +5594,7 @@ int cil_fill_integer64(struct cil_tree_node *int_node, uint64_t *integer, int ba
 	char *endptr = NULL;
 	uint64_t val;
 
-	if (int_node == NULL || integer == NULL) {
+	if (int_node == NULL || int_node->data == NULL || integer == NULL) {
 		goto exit;
 	}
 
-- 
2.29.2

