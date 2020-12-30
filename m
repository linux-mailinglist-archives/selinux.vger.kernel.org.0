Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A9F32E77A9
	for <lists+selinux@lfdr.de>; Wed, 30 Dec 2020 11:09:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726305AbgL3KJS (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Wed, 30 Dec 2020 05:09:18 -0500
Received: from mx1.polytechnique.org ([129.104.30.34]:40532 "EHLO
        mx1.polytechnique.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726292AbgL3KJR (ORCPT
        <rfc822;selinux@vger.kernel.org>); Wed, 30 Dec 2020 05:09:17 -0500
Received: from localhost.localdomain (174.17.206.77.rev.sfr.net [77.206.17.174])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by ssl.polytechnique.org (Postfix) with ESMTPSA id 3269C565A70
        for <selinux@vger.kernel.org>; Wed, 30 Dec 2020 11:08:00 +0100 (CET)
From:   Nicolas Iooss <nicolas.iooss@m4x.org>
To:     selinux@vger.kernel.org
Subject: [PATCH 6/6] libsepol/cil: destroy perm_datums when __cil_resolve_perms fails
Date:   Wed, 30 Dec 2020 11:07:46 +0100
Message-Id: <20201230100746.2549568-6-nicolas.iooss@m4x.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201230100746.2549568-1-nicolas.iooss@m4x.org>
References: <20201230100746.2549568-1-nicolas.iooss@m4x.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AV-Checked: ClamAV using ClamSMTP at svoboda.polytechnique.org (Wed Dec 30 11:08:00 2020 +0100 (CET))
X-Spam-Flag: No, tests=bogofilter, spamicity=0.000003, queueID=6E8BF565ABF
X-Org-Mail: nicolas.iooss.2010@polytechnique.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

When __cil_resolve_perms fails, it does not destroy perm_datums, which
leads to a memory leak reported by OSS-Fuzz with the following CIL
policy:

    (class cl01())
    (classorder(cl01))
    (type at02)
    (type tpr3)
    (allow at02 tpr3(cl01((s))))

Calling cil_list_destroy() fixes the issue.

Fixes: https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=28466
Signed-off-by: Nicolas Iooss <nicolas.iooss@m4x.org>
---
 libsepol/cil/src/cil_resolve_ast.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/libsepol/cil/src/cil_resolve_ast.c b/libsepol/cil/src/cil_resolve_ast.c
index ecd05dfa5dab..255f17ae7e30 100644
--- a/libsepol/cil/src/cil_resolve_ast.c
+++ b/libsepol/cil/src/cil_resolve_ast.c
@@ -146,6 +146,7 @@ static int __cil_resolve_perms(symtab_t *class_symtab, symtab_t *common_symtab,
 	return SEPOL_OK;
 
 exit:
+	cil_list_destroy(perm_datums, CIL_FALSE);
 	return rc;
 }
 
-- 
2.29.2

