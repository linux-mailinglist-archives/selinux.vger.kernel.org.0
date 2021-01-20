Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE70A2FD539
	for <lists+selinux@lfdr.de>; Wed, 20 Jan 2021 17:18:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388537AbhATQPJ (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Wed, 20 Jan 2021 11:15:09 -0500
Received: from mx1.polytechnique.org ([129.104.30.34]:41849 "EHLO
        mx1.polytechnique.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391317AbhATQOW (ORCPT
        <rfc822;selinux@vger.kernel.org>); Wed, 20 Jan 2021 11:14:22 -0500
Received: from localhost.localdomain (85-168-38-217.rev.numericable.fr [85.168.38.217])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by ssl.polytechnique.org (Postfix) with ESMTPSA id 08A64561248;
        Wed, 20 Jan 2021 17:13:31 +0100 (CET)
From:   Nicolas Iooss <nicolas.iooss@m4x.org>
To:     selinux@vger.kernel.org
Cc:     James Carter <jwcart2@gmail.com>
Subject: [PATCH v2 1/1] libsepol: do not decode out-of-bound rolebounds
Date:   Wed, 20 Jan 2021 17:13:21 +0100
Message-Id: <20210120161321.13656-1-nicolas.iooss@m4x.org>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AV-Checked: ClamAV using ClamSMTP at svoboda.polytechnique.org (Wed Jan 20 17:13:31 2021 +0100 (CET))
X-Spam-Flag: No, tests=bogofilter, spamicity=0.000462, queueID=2E332561252
X-Org-Mail: nicolas.iooss.2010@polytechnique.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

While fuzzing /usr/libexec/hll/pp, a policy module was generated with a
role->bounds larger that the number of roles in the policy.

This issue has been found while fuzzing hll/pp with the American Fuzzy
Lop.

This patch was suggested by James Carter <jwcart2@gmail.com> in
https://lore.kernel.org/selinux/CAP+JOzQc3yXczhk5JfUrr+6rFe3AXis+yJAukCFbz=aQotriQQ@mail.gmail.com/T/#mdd4bed0972c7c6f339e28270f73e9b7b09bb359f

Signed-off-by: Nicolas Iooss <nicolas.iooss@m4x.org>
---
 libsepol/src/policydb.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/libsepol/src/policydb.c b/libsepol/src/policydb.c
index f5809315cc08..08c4cb18efcf 100644
--- a/libsepol/src/policydb.c
+++ b/libsepol/src/policydb.c
@@ -1030,6 +1030,8 @@ static int role_index(hashtab_key_t key, hashtab_datum_t datum, void *datap)
 		return -EINVAL;
 	if (p->p_role_val_to_name[role->s.value - 1] != NULL)
 		return -EINVAL;
+	if (role->bounds > p->p_roles.nprim)
+		return -EINVAL;
 	p->p_role_val_to_name[role->s.value - 1] = (char *)key;
 	p->role_val_to_struct[role->s.value - 1] = role;
 
@@ -1049,6 +1051,8 @@ static int type_index(hashtab_key_t key, hashtab_datum_t datum, void *datap)
 			return -EINVAL;
 		if (p->p_type_val_to_name[typdatum->s.value - 1] != NULL)
 			return -EINVAL;
+		if (typdatum->bounds > p->p_types.nprim)
+			return -EINVAL;
 		p->p_type_val_to_name[typdatum->s.value - 1] = (char *)key;
 		p->type_val_to_struct[typdatum->s.value - 1] = typdatum;
 	}
-- 
2.30.0

