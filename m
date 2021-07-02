Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D82D03B9F78
	for <lists+selinux@lfdr.de>; Fri,  2 Jul 2021 13:07:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231593AbhGBLJr (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Fri, 2 Jul 2021 07:09:47 -0400
Received: from mx1.polytechnique.org ([129.104.30.34]:45996 "EHLO
        mx1.polytechnique.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231126AbhGBLJq (ORCPT
        <rfc822;selinux@vger.kernel.org>); Fri, 2 Jul 2021 07:09:46 -0400
Received: from localhost.localdomain (85-168-38-217.rev.numericable.fr [85.168.38.217])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by ssl.polytechnique.org (Postfix) with ESMTPSA id 379F05647B5
        for <selinux@vger.kernel.org>; Fri,  2 Jul 2021 13:07:13 +0200 (CEST)
From:   Nicolas Iooss <nicolas.iooss@m4x.org>
To:     selinux@vger.kernel.org
Subject: [PATCH] libsepol/cil: do not override previous results of __cil_verify_classperms
Date:   Fri,  2 Jul 2021 13:07:05 +0200
Message-Id: <20210702110705.435223-1-nicolas.iooss@m4x.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AV-Checked: ClamAV using ClamSMTP at svoboda.polytechnique.org (Fri Jul  2 13:07:13 2021 +0200 (CEST))
X-Spam-Flag: No, tests=bogofilter, spamicity=0.000214, queueID=67E4A5647B6
X-Org-Mail: nicolas.iooss.2010@polytechnique.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

When __cil_verify_map_class() verifies a classpermission, it calls
__verify_map_perm_classperms() on each item. If the first item reports a
failure and the next one succeeds, the failure is overwritten in
map_args->rc. This is a bug which causes a NULL pointer dereference in
the CIL compiler when compiling the following policy:

    (sid SID)
    (sidorder (SID))

    (class CLASS (PERM1))
    (classorder (CLASS))

    (classpermission CLSPERM)
    (classpermissionset CLSPERM (CLASS (PERM1)))
    (classmap files (CLAMAPxx x))
    (classmapping files CLAMAPxx CLSPERM)

Fixes: https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=30286

Signed-off-by: Nicolas Iooss <nicolas.iooss@m4x.org>
---
 libsepol/cil/src/cil_verify.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/libsepol/cil/src/cil_verify.c b/libsepol/cil/src/cil_verify.c
index 59397f70f2ea..8ad3dc9e114a 100644
--- a/libsepol/cil/src/cil_verify.c
+++ b/libsepol/cil/src/cil_verify.c
@@ -1786,8 +1786,12 @@ static int __verify_map_perm_classperms(__attribute__((unused)) hashtab_key_t k,
 {
 	struct cil_verify_map_args *map_args = args;
 	struct cil_perm *cmp = (struct cil_perm *)d;
+	int rc;
 
-	map_args->rc = __cil_verify_classperms(cmp->classperms, &cmp->datum, &map_args->class->datum, &cmp->datum, CIL_MAP_PERM, 0, 2);
+	rc = __cil_verify_classperms(cmp->classperms, &cmp->datum, &map_args->class->datum, &cmp->datum, CIL_MAP_PERM, 0, 2);
+	if (rc != SEPOL_OK) {
+		map_args->rc = rc;
+	}
 
 	return SEPOL_OK;
 }
-- 
2.32.0

