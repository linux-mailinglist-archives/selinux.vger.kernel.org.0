Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E811B33A7CB
	for <lists+selinux@lfdr.de>; Sun, 14 Mar 2021 21:22:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233760AbhCNUSY (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Sun, 14 Mar 2021 16:18:24 -0400
Received: from mx1.polytechnique.org ([129.104.30.34]:49232 "EHLO
        mx1.polytechnique.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233959AbhCNURw (ORCPT
        <rfc822;selinux@vger.kernel.org>); Sun, 14 Mar 2021 16:17:52 -0400
Received: from localhost.localdomain (85-168-38-217.rev.numericable.fr [85.168.38.217])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by ssl.polytechnique.org (Postfix) with ESMTPSA id EACCD5646B0
        for <selinux@vger.kernel.org>; Sun, 14 Mar 2021 21:17:50 +0100 (CET)
From:   Nicolas Iooss <nicolas.iooss@m4x.org>
To:     selinux@vger.kernel.org
Subject: [PATCH 5/6] libsepol/cil: fix NULL pointer dereference in __cil_insert_name
Date:   Sun, 14 Mar 2021 21:16:50 +0100
Message-Id: <20210314201651.474432-5-nicolas.iooss@m4x.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210314201651.474432-1-nicolas.iooss@m4x.org>
References: <20210314201651.474432-1-nicolas.iooss@m4x.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AV-Checked: ClamAV using ClamSMTP at svoboda.polytechnique.org (Sun Mar 14 21:17:51 2021 +0100 (CET))
X-Spam-Flag: No, tests=bogofilter, spamicity=0.001378, queueID=468945646B4
X-Org-Mail: nicolas.iooss.2010@polytechnique.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

OSS-Fuzz found a Null-dereference in __cil_insert_name when trying to
compile the following policy:

    (macro MACRO ()
        (classmap CLASS (PERM))
        (type TYPE)
        (typetransition TYPE TYPE CLASS "name" TYPE)
    )
    (call MACRO)

When using a macro with no argument, macro->params is NULL and
cil_list_for_each(item, macro->params) dereferenced a NULL pointer.
Fix this by checking that macro->params is not NULL before using it.

Fixes: https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=28565
Signed-off-by: Nicolas Iooss <nicolas.iooss@m4x.org>
---
 libsepol/cil/src/cil_resolve_ast.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/libsepol/cil/src/cil_resolve_ast.c b/libsepol/cil/src/cil_resolve_ast.c
index 2ea106d63505..63beed9230b9 100644
--- a/libsepol/cil/src/cil_resolve_ast.c
+++ b/libsepol/cil/src/cil_resolve_ast.c
@@ -82,7 +82,7 @@ static struct cil_name * __cil_insert_name(struct cil_db *db, hashtab_key_t key,
 	} else if (parent->flavor == CIL_MACRO) {
 		macro = parent->data;
 	}
-	if (macro != NULL) {
+	if (macro != NULL && macro->params != NULL) {
 		struct cil_list_item *item;
 		cil_list_for_each(item, macro->params) {
 			if (((struct cil_param*)item->data)->str == key) {
-- 
2.30.2

