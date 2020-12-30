Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52CAA2E7C3A
	for <lists+selinux@lfdr.de>; Wed, 30 Dec 2020 21:12:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726277AbgL3UMg (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Wed, 30 Dec 2020 15:12:36 -0500
Received: from mx1.polytechnique.org ([129.104.30.34]:58541 "EHLO
        mx1.polytechnique.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726197AbgL3UMf (ORCPT
        <rfc822;selinux@vger.kernel.org>); Wed, 30 Dec 2020 15:12:35 -0500
Received: from localhost.localdomain (174.17.206.77.rev.sfr.net [77.206.17.174])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by ssl.polytechnique.org (Postfix) with ESMTPSA id DB620560618
        for <selinux@vger.kernel.org>; Wed, 30 Dec 2020 21:11:53 +0100 (CET)
From:   Nicolas Iooss <nicolas.iooss@m4x.org>
To:     selinux@vger.kernel.org
Subject: [PATCH 2/4] libsepol/cil: fix NULL pointer dereference when using an unused alias
Date:   Wed, 30 Dec 2020 21:11:39 +0100
Message-Id: <20201230201141.3455302-2-nicolas.iooss@m4x.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201230201141.3455302-1-nicolas.iooss@m4x.org>
References: <20201230201141.3455302-1-nicolas.iooss@m4x.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AV-Checked: ClamAV using ClamSMTP at svoboda.polytechnique.org (Wed Dec 30 21:11:54 2020 +0100 (CET))
X-Spam-Flag: No, tests=bogofilter, spamicity=0.000541, queueID=2842C560696
X-Org-Mail: nicolas.iooss.2010@polytechnique.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

OSS-Fuzz found a NULL pointer dereference when the CIL compiler tries to
compile a policy where a categoryalias references an unused
categoryalias:

    $ echo '(categoryalias c0)(categoryalias c1)(categoryaliasactual c0 c1)' > tmp.cil
    $ secil tmp.cil
    Segmentation fault (core dumped)

In such a case, a1 can become NULL in cil_resolve_alias_to_actual().
Add a check to report an error when this occurs. Now the error message
is:

    Alias c0 references an unused alias c1 at tmp.cil:1

Fixes: https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=28471
Signed-off-by: Nicolas Iooss <nicolas.iooss@m4x.org>
---
 libsepol/cil/src/cil_resolve_ast.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/libsepol/cil/src/cil_resolve_ast.c b/libsepol/cil/src/cil_resolve_ast.c
index 255f17ae7e30..0c85eabe5a81 100644
--- a/libsepol/cil/src/cil_resolve_ast.c
+++ b/libsepol/cil/src/cil_resolve_ast.c
@@ -556,6 +556,10 @@ int cil_resolve_alias_to_actual(struct cil_tree_node *current, enum cil_flavor f
 	a1_node = a1->datum.nodes->head->data;
 
 	while (flavor != a1_node->flavor) {
+		if (a1->actual == NULL) {
+			cil_tree_log(current, CIL_ERR, "Alias %s references an unused alias %s", alias->datum.name, a1->datum.name);
+			return SEPOL_ERR;
+		}
 		a1 = a1->actual;
 		a1_node = a1->datum.nodes->head->data;
 		steps += 1;
-- 
2.29.2

