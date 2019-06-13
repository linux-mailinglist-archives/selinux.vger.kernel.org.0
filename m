Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C85B843B1B
	for <lists+selinux@lfdr.de>; Thu, 13 Jun 2019 17:26:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727607AbfFMP0W (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Thu, 13 Jun 2019 11:26:22 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:33386 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729212AbfFMLqF (ORCPT
        <rfc822;selinux@vger.kernel.org>); Thu, 13 Jun 2019 07:46:05 -0400
Received: by mail-wm1-f68.google.com with SMTP id h19so6435999wme.0
        for <selinux@vger.kernel.org>; Thu, 13 Jun 2019 04:46:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=94t7dcXKOLS7NrIeRejEq30uSZ21aj47SocKv7pipiM=;
        b=XfrSjOkDjDey66BJpK3hdQtCn0W+KkOtnG6iBhVWbNHhEPT/a78StOWGLqx2KzaY3J
         FrMPMSyFytnF5lFZaJ8jzz5V2IWyh0WVTxnotz8rZlSF5f9tSPkGyndkdPiR/xKHhhWg
         gY7nVHmXfroc7Nded7BZFJkIouO5+cPAo4V2uDcRXTYvYEuUQ3cHIIAX192GS2ijdqUi
         BOWwAIplDED04soXmtnhgOtMAeBgUWbzh0k86fOJxv4SZGDsX6tppWpGoYJjOR1gBb8E
         WQH3oKSS6tP6uc/qoI0voT3d1JN1qwW7EhPN48IlfFiuEumnYrBARfFrcHXTiRUAnnSn
         UNZQ==
X-Gm-Message-State: APjAAAVFHLDeA6cEixiJbAnl99p7l1oFUrOp+WFNCLCHJKQlMzN9EvqM
        D7BQ+3xWzh2X3pl1udaR4gIZ1Avv9co=
X-Google-Smtp-Source: APXvYqzSfZv2FR1BzDhfIyzQHt+yJR1mc8W9mAXYLx5vTSsFAdKg677JjsgFvN+bpQ/82RZjmVAOiw==
X-Received: by 2002:a05:600c:291:: with SMTP id 17mr3393812wmk.32.1560426361879;
        Thu, 13 Jun 2019 04:46:01 -0700 (PDT)
Received: from localhost.localdomain.com (nat-pool-brq-t.redhat.com. [213.175.37.10])
        by smtp.gmail.com with ESMTPSA id b203sm2906357wmd.41.2019.06.13.04.46.01
        for <selinux@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 13 Jun 2019 04:46:01 -0700 (PDT)
From:   Ondrej Mosnacek <omosnace@redhat.com>
To:     selinux@vger.kernel.org
Subject: [PATCH userspace v4 1/4] libsepol: add a function to optimize kernel policy
Date:   Thu, 13 Jun 2019 13:45:55 +0200
Message-Id: <20190613114558.32621-2-omosnace@redhat.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190613114558.32621-1-omosnace@redhat.com>
References: <20190613114558.32621-1-omosnace@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Add sepol_policydb_optimize(), which checks a kernel policy for
redundant rules (i.e. those that are covered by an existing more general
rule) and removes them.

Results on Fedora 29 policy:

WITHOUT OPTIMIZATION:
    # time semodule -B
    real    0m21,280s
    user    0m18,636s
    sys     0m2,525s

    $ wc -c /sys/fs/selinux/policy
    8692158 /sys/fs/selinux/policy

    $ seinfo (edited)
      Allow:            113159
      Dontaudit:         10297
      Total:            123156

WITH OPTIMIZATION ENABLED:
    # time semodule -B
    real    0m22,825s
    user    0m20,178s
    sys     0m2,520s

    $ wc -c /sys/fs/selinux/policy
    8096158 /sys/fs/selinux/policy

    $ seinfo (edited)
      Allow:             66334
      Dontaudit:          7480
      Total:             73814

Signed-off-by: Ondrej Mosnacek <omosnace@redhat.com>
---
 libsepol/include/sepol/policydb.h          |   5 +
 libsepol/include/sepol/policydb/policydb.h |   2 +
 libsepol/src/libsepol.map.in               |   5 +
 libsepol/src/optimize.c                    | 378 +++++++++++++++++++++
 libsepol/src/policydb_public.c             |   5 +
 5 files changed, 395 insertions(+)
 create mode 100644 libsepol/src/optimize.c

diff --git a/libsepol/include/sepol/policydb.h b/libsepol/include/sepol/policydb.h
index 6769b913..792913dd 100644
--- a/libsepol/include/sepol/policydb.h
+++ b/libsepol/include/sepol/policydb.h
@@ -100,6 +100,11 @@ extern int sepol_policydb_set_handle_unknown(sepol_policydb_t * p,
 extern int sepol_policydb_set_target_platform(sepol_policydb_t * p,
 					     int target_platform);
 
+/*
+ * Optimize the policy by removing redundant rules.
+ */
+extern int sepol_policydb_optimize(sepol_policydb_t * p);
+
 /* 
  * Read a policydb from a policy file.
  * This automatically sets the type and version based on the 
diff --git a/libsepol/include/sepol/policydb/policydb.h b/libsepol/include/sepol/policydb/policydb.h
index 591ce6e0..a279382e 100644
--- a/libsepol/include/sepol/policydb/policydb.h
+++ b/libsepol/include/sepol/policydb/policydb.h
@@ -636,6 +636,8 @@ extern int policydb_user_cache(hashtab_key_t key,
 
 extern int policydb_reindex_users(policydb_t * p);
 
+extern int policydb_optimize(policydb_t * p);
+
 extern void policydb_destroy(policydb_t * p);
 
 extern int policydb_load_isids(policydb_t * p, sidtab_t * s);
diff --git a/libsepol/src/libsepol.map.in b/libsepol/src/libsepol.map.in
index d879016c..6358e51f 100644
--- a/libsepol/src/libsepol.map.in
+++ b/libsepol/src/libsepol.map.in
@@ -59,3 +59,8 @@ LIBSEPOL_1.1 {
 	sepol_polcap_getnum;
 	sepol_polcap_getname;
 } LIBSEPOL_1.0;
+
+LIBSEPOL_1.2 {
+  global:
+	sepol_optimize_policy;
+} LIBSEPOL_1.1;
diff --git a/libsepol/src/optimize.c b/libsepol/src/optimize.c
new file mode 100644
index 00000000..3780b68b
--- /dev/null
+++ b/libsepol/src/optimize.c
@@ -0,0 +1,378 @@
+/*
+ * Author: Ondrej Mosnacek <omosnacek@gmail.com>
+ *
+ * Copyright (C) 2019 Red Hat Inc.
+ *
+ *  This library is free software; you can redistribute it and/or
+ *  modify it under the terms of the GNU Lesser General Public
+ *  License as published by the Free Software Foundation; either
+ *  version 2.1 of the License, or (at your option) any later version.
+ *
+ *  This library is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ *  Lesser General Public License for more details.
+ *
+ *  You should have received a copy of the GNU Lesser General Public
+ *  License along with this library; if not, write to the Free Software
+ *  Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
+ */
+
+/*
+ * Binary policy optimization.
+ *
+ * Defines the policydb_optimize() function, which finds and removes
+ * redundant rules from the binary policy to reduce its size and potentially
+ * improve rule matching times. Only rules that are already covered by a
+ * more general rule are removed. The resulting policy is functionally
+ * equivalent to the original one.
+ */
+
+#include <sepol/policydb/policydb.h>
+#include <sepol/policydb/conditional.h>
+
+/* builds map: type/attribute -> {all attributes that are a superset of it} */
+static ebitmap_t *build_type_map(const policydb_t *p)
+{
+	unsigned int i, k;
+	ebitmap_t *map = malloc(p->p_types.nprim * sizeof(ebitmap_t));
+	if (!map)
+		return NULL;
+
+	for (i = 0; i < p->p_types.nprim; i++) {
+		if (p->type_val_to_struct[i] &&
+		    p->type_val_to_struct[i]->flavor != TYPE_ATTRIB) {
+			if (ebitmap_cpy(&map[i], &p->type_attr_map[i]))
+				goto err;
+		} else {
+			ebitmap_t *types_i = &p->attr_type_map[i];
+
+			ebitmap_init(&map[i]);
+			for (k = 0; k < p->p_types.nprim; k++) {
+				ebitmap_t *types_k = &p->attr_type_map[k];
+
+				if (ebitmap_contains(types_k, types_i)) {
+					if (ebitmap_set_bit(&map[i], k, 1))
+						goto err;
+				}
+			}
+		}
+	}
+	return map;
+err:
+	for (k = 0; k <= i; k++)
+		ebitmap_destroy(&map[k]);
+	free(map);
+	return NULL;
+}
+
+static void destroy_type_map(const policydb_t *p, ebitmap_t *type_map)
+{
+	unsigned int i;
+	for (i = 0; i < p->p_types.nprim; i++)
+		ebitmap_destroy(&type_map[i]);
+	free(type_map);
+}
+
+static int process_xperms(uint32_t *p1, const uint32_t *p2)
+{
+	size_t i;
+	int ret = 1;
+
+	for (i = 0; i < EXTENDED_PERMS_LEN; i++) {
+		p1[i] &= ~p2[i];
+		if (p1[i] != 0)
+			ret = 0;
+	}
+	return ret;
+}
+
+static int process_avtab_datum(uint16_t specified,
+			       avtab_datum_t *d1, const avtab_datum_t *d2)
+{
+	/* inverse logic needed for AUDITDENY rules */
+	if (specified & AVTAB_AUDITDENY)
+		return (d1->data |= ~d2->data) == UINT32_C(0xFFFFFFFF);
+
+	if (specified & AVTAB_AV)
+		return (d1->data &= ~d2->data) == 0;
+
+	if (specified & AVTAB_XPERMS) {
+		avtab_extended_perms_t *x1 = d1->xperms;
+		const avtab_extended_perms_t *x2 = d2->xperms;
+
+		if (x1->specified == AVTAB_XPERMS_IOCTLFUNCTION) {
+			if (x2->specified == AVTAB_XPERMS_IOCTLFUNCTION) {
+				if (x1->driver != x2->driver)
+					return 0;
+				return process_xperms(x1->perms, x2->perms);
+			}
+			if (x2->specified == AVTAB_XPERMS_IOCTLDRIVER)
+				return xperm_test(x1->driver, x2->perms);
+		} else if (x1->specified == AVTAB_XPERMS_IOCTLDRIVER) {
+			if (x2->specified == AVTAB_XPERMS_IOCTLFUNCTION)
+				return 0;
+
+			if (x2->specified == AVTAB_XPERMS_IOCTLDRIVER)
+				return process_xperms(x1->perms, x2->perms);
+		}
+		return 0;
+	}
+	return 0;
+}
+
+/* checks if avtab contains a rule that covers the given rule */
+static int is_avrule_redundant(avtab_ptr_t entry, avtab_t *tab,
+			       const ebitmap_t *type_map)
+{
+	unsigned int i, k, s_idx, t_idx;
+	ebitmap_node_t *snode, *tnode;
+	avtab_datum_t *d1, *d2;
+	avtab_key_t key;
+
+	/* we only care about AV rules */
+	if (!(entry->key.specified & (AVTAB_AV|AVTAB_XPERMS)))
+		return 0;
+
+	s_idx = entry->key.source_type - 1;
+	t_idx = entry->key.target_type - 1;
+
+	key.target_class = entry->key.target_class;
+	key.specified    = entry->key.specified;
+
+	d1 = &entry->datum;
+
+	ebitmap_for_each_positive_bit(&type_map[s_idx], snode, i) {
+		key.source_type = i + 1;
+
+		ebitmap_for_each_positive_bit(&type_map[t_idx], tnode, k) {
+			if (s_idx == i && t_idx == k)
+				continue;
+
+			key.target_type = k + 1;
+
+			d2 = avtab_search(tab, &key);
+			if (!d2)
+				continue;
+
+			if (process_avtab_datum(key.specified, d1, d2))
+				return 1;
+		}
+	}
+	return 0;
+}
+
+static int is_type_attr(policydb_t *p, unsigned int id)
+{
+	return p->type_val_to_struct[id]->flavor == TYPE_ATTRIB;
+}
+
+static int is_avrule_with_attr(avtab_ptr_t entry, policydb_t *p)
+{
+	unsigned int s_idx = entry->key.source_type - 1;
+	unsigned int t_idx = entry->key.target_type - 1;
+
+	return is_type_attr(p, s_idx) || is_type_attr(p, t_idx);
+}
+
+/* checks if conditional list contains a rule that covers the given rule */
+static int is_cond_rule_redundant(avtab_ptr_t e1, cond_av_list_t *list,
+				  const ebitmap_t *type_map)
+{
+	unsigned int s1, t1, c1, k1, s2, t2, c2, k2;
+
+	/* we only care about AV rules */
+	if (!(e1->key.specified & (AVTAB_AV|AVTAB_XPERMS)))
+		return 0;
+
+	s1 = e1->key.source_type - 1;
+	t1 = e1->key.target_type - 1;
+	c1 = e1->key.target_class;
+	k1 = e1->key.specified;
+
+	for (; list; list = list->next) {
+		avtab_ptr_t e2 = list->node;
+
+		s2 = e2->key.source_type - 1;
+		t2 = e2->key.target_type - 1;
+		c2 = e2->key.target_class;
+		k2 = e2->key.specified;
+
+		if (k1 != k2 || c1 != c2)
+			continue;
+
+		if (s1 == s2 && t1 == t2)
+			continue;
+		if (!ebitmap_get_bit(&type_map[s1], s2))
+			continue;
+		if (!ebitmap_get_bit(&type_map[t1], t2))
+			continue;
+
+		if (process_avtab_datum(k1, &e1->datum, &e2->datum))
+			return 1;
+	}
+	return 0;
+}
+
+static void optimize_avtab(policydb_t *p, const ebitmap_t *type_map)
+{
+	avtab_t *tab = &p->te_avtab;
+	unsigned int i;
+	avtab_ptr_t *cur;
+
+	for (i = 0; i < tab->nslot; i++) {
+		cur = &tab->htable[i];
+		while (*cur) {
+			if (is_avrule_redundant(*cur, tab, type_map)) {
+				/* redundant rule -> remove it */
+				avtab_ptr_t tmp = *cur;
+
+				*cur = tmp->next;
+				if (tmp->key.specified & AVTAB_XPERMS)
+					free(tmp->datum.xperms);
+				free(tmp);
+
+				tab->nel--;
+			} else {
+				/* rule not redundant -> move to next rule */
+				cur = &(*cur)->next;
+			}
+		}
+	}
+}
+
+/* find redundant rules in (*cond) and put them into (*del) */
+static void optimize_cond_av_list(cond_av_list_t **cond, cond_av_list_t **del,
+				  policydb_t *p, const ebitmap_t *type_map)
+{
+	cond_av_list_t **listp = cond;
+	cond_av_list_t *pcov = NULL;
+	cond_av_list_t **pcov_cur = &pcov;
+
+	/*
+	 * Separate out all "potentially covering" rules (src or tgt is an attr)
+	 * and move them to the end of the list. This is needed to avoid
+	 * polynomial complexity when almost all rules are expanded.
+	 */
+	while (*cond) {
+		if (is_avrule_with_attr((*cond)->node, p)) {
+			cond_av_list_t *tmp = *cond;
+
+			*cond = tmp->next;
+			tmp->next = pcov;
+			pcov = tmp;
+		} else {
+			cond = &(*cond)->next;
+		}
+	}
+	/* link the "potentially covering" rules to the end of the list */
+	*cond = pcov;
+
+	/* now go through the list and find the redundant rules */
+	cond = listp;
+	pcov_cur = &pcov;
+	while (*cond) {
+		/* needed because pcov itself may get deleted */
+		if (*cond == pcov)
+			pcov_cur = cond;
+		/*
+		 * First check if covered by an unconditional rule, then also
+		 * check if covered by another rule in the same list.
+		 */
+		if (is_avrule_redundant((*cond)->node, &p->te_avtab, type_map) ||
+		    is_cond_rule_redundant((*cond)->node, *pcov_cur, type_map)) {
+			cond_av_list_t *tmp = *cond;
+
+			*cond = tmp->next;
+			tmp->next = *del;
+			*del = tmp;
+		} else {
+			cond = &(*cond)->next;
+		}
+	}
+}
+
+static void optimize_cond_avtab(policydb_t *p, const ebitmap_t *type_map)
+{
+	avtab_t *tab = &p->te_cond_avtab;
+	unsigned int i;
+	avtab_ptr_t *cur;
+	cond_node_t **cond;
+	cond_av_list_t **avcond, *del = NULL;
+
+	/* First go through all conditionals and collect redundant rules. */
+	cond = &p->cond_list;
+	while (*cond) {
+		optimize_cond_av_list(&(*cond)->true_list,  &del, p, type_map);
+		optimize_cond_av_list(&(*cond)->false_list, &del, p, type_map);
+		/* TODO: maybe also check for rules present in both lists */
+
+		/* nothing left in both lists -> remove the whole conditional */
+		if (!(*cond)->true_list && !(*cond)->false_list) {
+			cond_node_t *cond_tmp = *cond;
+
+			*cond = cond_tmp->next;
+			cond_node_destroy(cond_tmp);
+			free(cond_tmp);
+		} else {
+			cond = &(*cond)->next;
+		}
+	}
+
+	if (!del)
+		return;
+
+	/*
+	 * Now go through the whole cond_avtab and remove all rules that are
+	 * found in the 'del' list.
+	 */
+	for (i = 0; i < tab->nslot; i++) {
+		cur = &tab->htable[i];
+		while (*cur) {
+			int redundant = 0;
+			avcond = &del;
+			while (*avcond) {
+				if ((*avcond)->node == *cur) {
+					cond_av_list_t *cond_tmp = *avcond;
+
+					*avcond = cond_tmp->next;
+					free(cond_tmp);
+					redundant = 1;
+					break;
+				} else {
+					avcond = &(*avcond)->next;
+				}
+			}
+			if (redundant) {
+				avtab_ptr_t tmp = *cur;
+
+				*cur = tmp->next;
+				if (tmp->key.specified & AVTAB_XPERMS)
+					free(tmp->datum.xperms);
+				free(tmp);
+
+				tab->nel--;
+			} else {
+				cur = &(*cur)->next;
+			}
+		}
+	}
+}
+
+int policydb_optimize(policydb_t *p)
+{
+	ebitmap_t *type_map;
+
+	if (p->policy_type != POLICY_KERN)
+		return -1;
+
+	type_map = build_type_map(p);
+	if (!type_map)
+		return -1;
+
+	optimize_avtab(p, type_map);
+	optimize_cond_avtab(p, type_map);
+
+	destroy_type_map(p, type_map);
+	return 0;
+}
diff --git a/libsepol/src/policydb_public.c b/libsepol/src/policydb_public.c
index e7218423..747a43ff 100644
--- a/libsepol/src/policydb_public.c
+++ b/libsepol/src/policydb_public.c
@@ -169,6 +169,11 @@ int sepol_policydb_set_target_platform(sepol_policydb_t * sp,
 	return 0;
 }
 
+int sepol_policydb_optimize(sepol_policydb_t * p)
+{
+	return policydb_optimize(&p->p);
+}
+
 int sepol_policydb_read(sepol_policydb_t * p, sepol_policy_file_t * pf)
 {
 	return policydb_read(&p->p, &pf->pf, 0);
-- 
2.20.1

