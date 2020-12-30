Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F1202E77A6
	for <lists+selinux@lfdr.de>; Wed, 30 Dec 2020 11:09:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726185AbgL3KIh (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Wed, 30 Dec 2020 05:08:37 -0500
Received: from mx1.polytechnique.org ([129.104.30.34]:33098 "EHLO
        mx1.polytechnique.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725814AbgL3KIg (ORCPT
        <rfc822;selinux@vger.kernel.org>); Wed, 30 Dec 2020 05:08:36 -0500
Received: from localhost.localdomain (174.17.206.77.rev.sfr.net [77.206.17.174])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by ssl.polytechnique.org (Postfix) with ESMTPSA id 4B796565ABF
        for <selinux@vger.kernel.org>; Wed, 30 Dec 2020 11:07:54 +0100 (CET)
From:   Nicolas Iooss <nicolas.iooss@m4x.org>
To:     selinux@vger.kernel.org
Subject: [PATCH 1/6] libsepol: do not decode out-of-bound rolebounds
Date:   Wed, 30 Dec 2020 11:07:41 +0100
Message-Id: <20201230100746.2549568-1-nicolas.iooss@m4x.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AV-Checked: ClamAV using ClamSMTP at svoboda.polytechnique.org (Wed Dec 30 11:07:54 2020 +0100 (CET))
X-Spam-Flag: No, tests=bogofilter, spamicity=0.004018, queueID=ED697565AC0
X-Org-Mail: nicolas.iooss.2010@polytechnique.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

While fuzzing /usr/libexec/hll/pp, a policy module was generated with a
role->bounds larger that the number of roles in the policy.

This issue has been found while fuzzing hll/pp with the American Fuzzy
Lop.

Signed-off-by: Nicolas Iooss <nicolas.iooss@m4x.org>
---
 libsepol/src/module_to_cil.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/libsepol/src/module_to_cil.c b/libsepol/src/module_to_cil.c
index a87bc15e7610..c99790eb76e7 100644
--- a/libsepol/src/module_to_cil.c
+++ b/libsepol/src/module_to_cil.c
@@ -2165,7 +2165,9 @@ static int role_to_cil(int indent, struct policydb *pdb, struct avrule_block *UN
 			}
 		}
 
-		if (role->bounds > 0) {
+		if (role->bounds >= pdb->p_roles.nprim) {
+			log_err("Warning: role %s defines an out-of-bound rolebounds", key);
+		} else if (role->bounds > 0) {
 			cil_println(indent, "(rolebounds %s %s)", key, pdb->p_role_val_to_name[role->bounds - 1]);
 		}
 		break;
-- 
2.29.2

