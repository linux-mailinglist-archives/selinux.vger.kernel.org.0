Return-Path: <selinux+bounces-2231-lists+selinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EB099C3FD9
	for <lists+selinux@lfdr.de>; Mon, 11 Nov 2024 14:51:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 93F3D1F22AB2
	for <lists+selinux@lfdr.de>; Mon, 11 Nov 2024 13:51:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBCE019E7F3;
	Mon, 11 Nov 2024 13:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=seltendoof.de header.i=@seltendoof.de header.b="gPW4Tjc2"
X-Original-To: selinux@vger.kernel.org
Received: from server02.seltendoof.de (server02.seltendoof.de [168.119.48.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F9E8194ACC
	for <selinux@vger.kernel.org>; Mon, 11 Nov 2024 13:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.48.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731333083; cv=none; b=T6PCpe4ru6CjriMtwE+n3ucFFXEG8m1G3Wst448AXtLNyWO6TsWmZ2Q/2DzU24a5zqYij+WbaCSHz3BB9mscIzPO6AdVw55LE+78OdLPoP4UQurRq0EgqhKiBOnVSXtl7FdCXvlcr/0xp2I5DWXAY0B2UdwlFJFqXadPAhXZ+gU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731333083; c=relaxed/simple;
	bh=sfFKKjGmXZPCr3k/DmYT7342Y12RsL+FfvEj3MN3zeg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Idr4N8cwaNuomxnwjLn8yybrY3K0FTDL5mjZwIsx/O9NE4cVY1FggUEk7qE5LIEY1CAdCm7BQbm6ZY9R+jLilWen8Dx9K3RtQHIV0lMqX8+Zs8pgXtBmKCOgNwxIALIZJ0FOydSNmuRngjsn4YO11DeAf4zP4dZNRYgnmDZWGk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=seltendoof.de; spf=pass smtp.mailfrom=seltendoof.de; dkim=pass (2048-bit key) header.d=seltendoof.de header.i=@seltendoof.de header.b=gPW4Tjc2; arc=none smtp.client-ip=168.119.48.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=seltendoof.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=seltendoof.de
From: =?UTF-8?q?Christian=20G=C3=B6ttsche?= <cgoettsche@seltendoof.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seltendoof.de;
	s=2023072701; t=1731333071;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z9wIg447xNWI1i6aHLDNEkF6R+4xEoYWo/0DB4AZoyM=;
	b=gPW4Tjc2ACN1kWZq/GnamjTbwyWEA+r2zkpzOBOYDOgcOGF5K+jH5Iba+/mD+TCUKWuRgd
	6SOy7wUtS0FhkEsjVxTAhFiKM49PnL65yBSCHMVzwID6ubHK/UWh2AruX7MmahfWxddzOQ
	VmipCaU7UeXVB3JCYQL9XC0fAVFAsQwJbxJTGnBjJ+LX6nCFhspykKaDRD/ELg/NR91fSb
	JEUBx4kKp7oF91EoeV/X1DD/6H2lO07f4bUKntKwQceTa4gxQNNjTQAy+YCzz5c8btKL1s
	WMeayRity04xcLWTKxGzl/NwqqWIJQQt068ZoyhsuS+EVQEoUSowGWPPxXz1cQ==
To: selinux@vger.kernel.org
Cc: =?UTF-8?q?Christian=20G=C3=B6ttsche?= <cgzones@googlemail.com>
Subject: [PATCH v5 2/6] libsepol: add support for xperms in conditional policies
Date: Mon, 11 Nov 2024 14:51:03 +0100
Message-ID: <20241111135107.20280-2-cgoettsche@seltendoof.de>
In-Reply-To: <20241111135107.20280-1-cgoettsche@seltendoof.de>
References: <20241111135107.20280-1-cgoettsche@seltendoof.de>
Reply-To: cgzones@googlemail.com
Precedence: bulk
X-Mailing-List: selinux@vger.kernel.org
List-Id: <selinux.vger.kernel.org>
List-Subscribe: <mailto:selinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:selinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Christian Göttsche <cgzones@googlemail.com>

Add support for extended permission rules in conditional policies by
adding a new policy version and adjusting writing and validating
policies accordingly.

Signed-off-by: Christian Göttsche <cgzones@googlemail.com>
---
v5:
  - reintroduce correct avrule checking for conditional policies
    regressed in v4 via deduplication
v4:
  - fix assertion logic on CIL generated policy
  - enhance xperm validation
  - rebase onto main
v3:
  - several assertion logic fixes
v2:
  - rebase onto libsepol: Support nlmsg xperms in assertions
  - fix assertion checking with xperm av rules in conditional policies
    (spotted by Jim, thanks!)
---
 libsepol/include/sepol/policydb/policydb.h |  12 +-
 libsepol/src/assertion.c                   | 217 ++++++++++++++++++---
 libsepol/src/policydb.c                    |  21 ++
 libsepol/src/policydb_validate.c           |  52 +++--
 libsepol/src/write.c                       |  46 +++--
 5 files changed, 276 insertions(+), 72 deletions(-)

diff --git a/libsepol/include/sepol/policydb/policydb.h b/libsepol/include/sepol/policydb/policydb.h
index 88fb3672..f833354b 100644
--- a/libsepol/include/sepol/policydb/policydb.h
+++ b/libsepol/include/sepol/policydb/policydb.h
@@ -759,10 +759,11 @@ extern int policydb_set_target_platform(policydb_t *p, int platform);
 #define POLICYDB_VERSION_INFINIBAND		31 /* Linux-specific */
 #define POLICYDB_VERSION_GLBLUB		32
 #define POLICYDB_VERSION_COMP_FTRANS	33 /* compressed filename transitions */
+#define POLICYDB_VERSION_COND_XPERMS	34 /* extended permissions in conditional policies */
 
 /* Range of policy versions we understand*/
 #define POLICYDB_VERSION_MIN	POLICYDB_VERSION_BASE
-#define POLICYDB_VERSION_MAX	POLICYDB_VERSION_COMP_FTRANS
+#define POLICYDB_VERSION_MAX	POLICYDB_VERSION_COND_XPERMS
 
 /* Module versions and specific changes*/
 #define MOD_POLICYDB_VERSION_BASE		4
@@ -785,9 +786,10 @@ extern int policydb_set_target_platform(policydb_t *p, int platform);
 #define MOD_POLICYDB_VERSION_INFINIBAND		19
 #define MOD_POLICYDB_VERSION_GLBLUB		20
 #define MOD_POLICYDB_VERSION_SELF_TYPETRANS	21
+#define MOD_POLICYDB_VERSION_COND_XPERMS	22
 
 #define MOD_POLICYDB_VERSION_MIN MOD_POLICYDB_VERSION_BASE
-#define MOD_POLICYDB_VERSION_MAX MOD_POLICYDB_VERSION_SELF_TYPETRANS
+#define MOD_POLICYDB_VERSION_MAX MOD_POLICYDB_VERSION_COND_XPERMS
 
 #define POLICYDB_CONFIG_MLS    1
 
@@ -801,6 +803,12 @@ extern int policydb_set_target_platform(policydb_t *p, int platform);
 	 ((p)->policy_type != POLICY_KERN			\
 	  && (p)->policyvers >= MOD_POLICYDB_VERSION_BOUNDARY))
 
+#define policydb_has_cond_xperms_feature(p)			\
+	(((p)->policy_type == POLICY_KERN			\
+	  && (p)->policyvers >= POLICYDB_VERSION_COND_XPERMS) ||	\
+	 ((p)->policy_type != POLICY_KERN			\
+	  && (p)->policyvers >= MOD_POLICYDB_VERSION_COND_XPERMS))
+
 /* the config flags related to unknown classes/perms are bits 2 and 3 */
 #define DENY_UNKNOWN	SEPOL_DENY_UNKNOWN
 #define REJECT_UNKNOWN	SEPOL_REJECT_UNKNOWN
diff --git a/libsepol/src/assertion.c b/libsepol/src/assertion.c
index e0e8685f..4028a33d 100644
--- a/libsepol/src/assertion.c
+++ b/libsepol/src/assertion.c
@@ -33,8 +33,8 @@ struct avtab_match_args {
 	sepol_handle_t *handle;
 	policydb_t *p;
 	const avrule_t *narule;
-	avtab_t *avtab;
 	unsigned long errors;
+	bool conditional;
 };
 
 static const char* policy_name(const policydb_t *p) {
@@ -152,12 +152,19 @@ static void extended_permissions_violated(avtab_extended_perms_t *result,
 	}
 }
 
+static bool match_node_key(const struct avtab_node *node, const avtab_key_t *key)
+{
+	return node->key.source_type == key->source_type
+		&& node->key.target_type == key->target_type
+		&& node->key.target_class == key->target_class;
+}
+
 /* Same scenarios of interest as check_assertion_extended_permissions */
 static int report_assertion_extended_permissions(sepol_handle_t *handle,
 				policydb_t *p, const avrule_t *narule,
 				unsigned int stype, unsigned int ttype,
 				const class_perm_node_t *curperm, uint32_t perms,
-				const avtab_key_t *k, avtab_t *avtab)
+				const avtab_key_t *k, bool conditional)
 {
 	avtab_ptr_t node;
 	avtab_key_t tmp_key;
@@ -167,7 +174,7 @@ static int report_assertion_extended_permissions(sepol_handle_t *handle,
 	const ebitmap_t *tattr = &p->type_attr_map[ttype];
 	ebitmap_node_t *snode, *tnode;
 	unsigned int i, j;
-	bool found_xperm = false;
+	bool found_xperm = false, found_cond_conflict = false;
 	int errors = 0;
 
 	memcpy(&tmp_key, k, sizeof(avtab_key_t));
@@ -177,7 +184,7 @@ static int report_assertion_extended_permissions(sepol_handle_t *handle,
 		tmp_key.source_type = i + 1;
 		ebitmap_for_each_positive_bit(tattr, tnode, j) {
 			tmp_key.target_type = j + 1;
-			for (node = avtab_search_node(avtab, &tmp_key);
+			for (node = avtab_search_node(&p->te_avtab, &tmp_key);
 			     node;
 			     node = avtab_search_node_next(node, tmp_key.specified)) {
 				xperms = node->datum.xperms;
@@ -205,11 +212,105 @@ static int report_assertion_extended_permissions(sepol_handle_t *handle,
 					errors++;
 				}
 			}
+
+			for (const cond_list_t *cl = p->cond_list; cl; cl = cl->next) {
+				bool found_true_base = false, found_true_xperm = false;
+				bool found_false_base = false, found_false_xperm = false;
+
+				for (const cond_av_list_t *cal = cl->true_list; cal; cal = cal->next) {
+					node = cal->node; /* node->next is not from the same condition */
+					if (!node)
+						continue;
+
+					if (!match_node_key(node, &tmp_key))
+						continue;
+
+					if (match_any_class_permissions(narule->perms, node->key.target_class, node->datum.data)) {
+						found_true_base = true;
+						continue;
+					}
+
+					if (!(node->key.specified & AVTAB_XPERMS_ALLOWED))
+						continue;
+
+					xperms = node->datum.xperms;
+					if ((xperms->specified != AVTAB_XPERMS_IOCTLFUNCTION)
+							&& (xperms->specified != AVTAB_XPERMS_IOCTLDRIVER)
+							&& (xperms->specified != AVTAB_XPERMS_NLMSG))
+						continue;
+					found_true_xperm = true;
+					/* failure on the extended permission check_extended_permissions */
+					if (check_extended_permissions(narule->xperms, xperms)) {
+						char *permstring;
+
+						extended_permissions_violated(&error, narule->xperms, xperms);
+						permstring = sepol_extended_perms_to_string(&error);
+
+						ERR(handle, "neverallowxperm on line %lu of %s (or line %lu of %s) violated by\n"
+								"allowxperm %s %s:%s %s;",
+								narule->source_line, narule->source_filename, narule->line, policy_name(p),
+								p->p_type_val_to_name[i],
+								p->p_type_val_to_name[j],
+								p->p_class_val_to_name[curperm->tclass - 1],
+								permstring ?: "<format-failure>");
+
+						free(permstring);
+						errors++;
+					}
+				}
+
+				for (const cond_av_list_t *cal = cl->false_list; cal; cal = cal->next) {
+					node = cal->node; /* node->next is not from the same condition */
+					if (!node)
+						continue;
+
+					if (!match_node_key(node, &tmp_key))
+						continue;
+
+					if (match_any_class_permissions(narule->perms, node->key.target_class, node->datum.data)) {
+						found_false_base = true;
+						continue;
+					}
+
+					if (!(node->key.specified & AVTAB_XPERMS_ALLOWED))
+						continue;
+
+					xperms = node->datum.xperms;
+					if ((xperms->specified != AVTAB_XPERMS_IOCTLFUNCTION)
+							&& (xperms->specified != AVTAB_XPERMS_IOCTLDRIVER)
+							&& (xperms->specified != AVTAB_XPERMS_NLMSG))
+						continue;
+					found_false_xperm = true;
+					/* failure on the extended permission check_extended_permissions */
+					if (check_extended_permissions(narule->xperms, xperms)) {
+						char *permstring;
+
+						extended_permissions_violated(&error, narule->xperms, xperms);
+						permstring = sepol_extended_perms_to_string(&error);
+
+						ERR(handle, "neverallowxperm on line %lu of %s (or line %lu of %s) violated by\n"
+								"allowxperm %s %s:%s %s;",
+								narule->source_line, narule->source_filename, narule->line, policy_name(p),
+								p->p_type_val_to_name[i],
+								p->p_type_val_to_name[j],
+								p->p_class_val_to_name[curperm->tclass - 1],
+								permstring ?: "<format-failure>");
+
+						free(permstring);
+						errors++;
+					}
+				}
+
+				if (found_true_xperm && found_false_xperm)
+					found_xperm = true;
+				else if (conditional && ((found_true_base && !found_true_xperm) || (found_false_base && !found_false_xperm)))
+					found_cond_conflict = true;
+			}
 		}
 	}
 
-	/* failure on the regular permissions */
-	if (!found_xperm) {
+	if ((!found_xperm && !conditional) || found_cond_conflict) {
+		/* failure on the regular permissions */
 		char *permstr = sepol_av_to_string(p, curperm->tclass, perms);
 
 		ERR(handle, "neverallowxperm on line %lu of %s (or line %lu of %s) violated by\n"
@@ -222,7 +323,6 @@ static int report_assertion_extended_permissions(sepol_handle_t *handle,
 
 		free(permstr);
 		errors++;
-
 	}
 
 	return errors;
@@ -234,7 +334,6 @@ static int report_assertion_avtab_matches(avtab_key_t *k, avtab_datum_t *d, void
 	struct avtab_match_args *a = (struct avtab_match_args *)args;
 	sepol_handle_t *handle = a->handle;
 	policydb_t *p = a->p;
-	avtab_t *avtab = a->avtab;
 	const avrule_t *narule = a->narule;
 	const class_perm_node_t *cp;
 	uint32_t perms;
@@ -308,7 +407,8 @@ static int report_assertion_avtab_matches(avtab_key_t *k, avtab_datum_t *d, void
 					continue;
 				if (narule->specified == AVRULE_XPERMS_NEVERALLOW) {
 					a->errors += report_assertion_extended_permissions(handle,p, narule,
-											i, j, cp, perms, k, avtab);
+											i, j, cp, perms, k,
+											a->conditional);
 				} else {
 					a->errors++;
 					report_failure(handle, p, narule, i, j, cp, perms);
@@ -335,12 +435,12 @@ static int report_assertion_failures(sepol_handle_t *handle, policydb_t *p, cons
 		.errors = 0,
 	};
 
-	args.avtab = &p->te_avtab;
+	args.conditional = false;
 	rc = avtab_map(&p->te_avtab, report_assertion_avtab_matches, &args);
 	if (rc < 0)
 		goto oom;
 
-	args.avtab = &p->te_cond_avtab;
+	args.conditional = true;
 	rc = avtab_map(&p->te_cond_avtab, report_assertion_avtab_matches, &args);
 	if (rc < 0)
 		goto oom;
@@ -355,9 +455,10 @@ oom:
  * Look up the extended permissions in avtab and verify that neverallowed
  * permissions are not granted.
  */
-static bool check_assertion_extended_permissions_avtab(const avrule_t *narule, avtab_t *avtab,
+static bool check_assertion_extended_permissions_avtab(const avrule_t *narule,
 						unsigned int stype, unsigned int ttype,
-						const avtab_key_t *k, policydb_t *p)
+						const avtab_key_t *k, policydb_t *p,
+						bool conditional)
 {
 	avtab_ptr_t node;
 	avtab_key_t tmp_key;
@@ -367,7 +468,7 @@ static bool check_assertion_extended_permissions_avtab(const avrule_t *narule, a
 	const ebitmap_t *tattr = &p->type_attr_map[ttype];
 	ebitmap_node_t *snode, *tnode;
 	unsigned int i, j;
-	bool ret = true;
+	bool found_xperm = false, found_cond_conflict = false;
 
 	memcpy(&tmp_key, k, sizeof(avtab_key_t));
 	tmp_key.specified = AVTAB_XPERMS_ALLOWED;
@@ -376,7 +477,7 @@ static bool check_assertion_extended_permissions_avtab(const avrule_t *narule, a
 		tmp_key.source_type = i + 1;
 		ebitmap_for_each_positive_bit(tattr, tnode, j) {
 			tmp_key.target_type = j + 1;
-			for (node = avtab_search_node(avtab, &tmp_key);
+			for (node = avtab_search_node(&p->te_avtab, &tmp_key);
 			     node;
 			     node = avtab_search_node_next(node, tmp_key.specified)) {
 				xperms = node->datum.xperms;
@@ -385,14 +486,78 @@ static bool check_assertion_extended_permissions_avtab(const avrule_t *narule, a
 						&& (xperms->specified != AVTAB_XPERMS_IOCTLDRIVER)
 						&& (xperms->specified != AVTAB_XPERMS_NLMSG))
 					continue;
-				ret = check_extended_permissions(neverallow_xperms, xperms);
-				if (ret)
-					return ret;
+				found_xperm = true;
+				if (check_extended_permissions(neverallow_xperms, xperms))
+					return true;
+			}
+
+			for (const cond_list_t *cl = p->cond_list; cl; cl = cl->next) {
+				bool found_true_base = false, found_true_xperm = false;
+				bool found_false_base = false, found_false_xperm = false;
+
+				for (const cond_av_list_t *cal = cl->true_list; cal; cal = cal->next) {
+					node = cal->node; /* node->next is not from the same condition */
+					if (!node)
+						continue;
+
+					if (!match_node_key(node, &tmp_key))
+						continue;
+
+					if ((node->key.specified & AVTAB_ALLOWED) && match_any_class_permissions(narule->perms, node->key.target_class, node->datum.data)) {
+						found_true_base = true;
+						continue;
+					}
+
+					if (!(node->key.specified & AVTAB_XPERMS_ALLOWED))
+						continue;
+
+					xperms = node->datum.xperms;
+
+					if ((xperms->specified != AVTAB_XPERMS_IOCTLFUNCTION)
+							&& (xperms->specified != AVTAB_XPERMS_IOCTLDRIVER)
+							&& (xperms->specified != AVTAB_XPERMS_NLMSG))
+						continue;
+					found_true_xperm = true;
+					if (check_extended_permissions(neverallow_xperms, xperms))
+						return true;
+				}
+
+				for (const cond_av_list_t *cal = cl->false_list; cal; cal = cal->next) {
+					node = cal->node; /* node->next is not from the same condition */
+					if (!node)
+						continue;
+
+					if (!match_node_key(node, &tmp_key))
+						continue;
+
+					if ((node->key.specified & AVTAB_ALLOWED) && match_any_class_permissions(narule->perms, node->key.target_class, node->datum.data)) {
+						found_false_base = true;
+						continue;
+					}
+
+					if (!(node->key.specified & AVTAB_XPERMS_ALLOWED))
+						continue;
+
+					xperms = node->datum.xperms;
+
+					if ((xperms->specified != AVTAB_XPERMS_IOCTLFUNCTION)
+							&& (xperms->specified != AVTAB_XPERMS_IOCTLDRIVER)
+							&& (xperms->specified != AVTAB_XPERMS_NLMSG))
+						continue;
+					found_false_xperm = true;
+					if (check_extended_permissions(neverallow_xperms, xperms))
+						return true;
+				}
+
+				if (found_true_xperm && found_false_xperm)
+					found_xperm = true;
+				else if (conditional && ((found_true_base && !found_true_xperm) || (found_false_base && !found_false_xperm)))
+					found_cond_conflict = true;
 			}
 		}
 	}
 
-	return ret;
+	return (!conditional && !found_xperm) || found_cond_conflict;
 }
 
 /*
@@ -411,8 +576,9 @@ static bool check_assertion_extended_permissions_avtab(const avrule_t *narule, a
  * 4. FAIL - The ioctl permission is granted AND the extended permission is
  *    granted
  */
-static int check_assertion_extended_permissions(const avrule_t *narule, avtab_t *avtab,
-						const avtab_key_t *k, policydb_t *p)
+static int check_assertion_extended_permissions(const avrule_t *narule,
+						const avtab_key_t *k, policydb_t *p,
+						bool conditional)
 {
 	ebitmap_t src_matches, tgt_matches, self_matches;
 	unsigned int i, j;
@@ -474,7 +640,7 @@ static int check_assertion_extended_permissions(const avrule_t *narule, avtab_t
 				continue;
 			if (is_narule_notself && i == j)
 				continue;
-			if (check_assertion_extended_permissions_avtab(narule, avtab, i, j, k, p)) {
+			if (check_assertion_extended_permissions_avtab(narule, i, j, k, p, conditional)) {
 				rc = 1;
 				goto exit;
 			}
@@ -578,7 +744,6 @@ static int check_assertion_avtab_match(avtab_key_t *k, avtab_datum_t *d, void *a
 	struct avtab_match_args *a = (struct avtab_match_args *)args;
 	policydb_t *p = a->p;
 	const avrule_t *narule = a->narule;
-	avtab_t *avtab = a->avtab;
 
 	if ((k->specified & AVTAB_ALLOWED) == 0)
 		goto nomatch;
@@ -611,7 +776,7 @@ static int check_assertion_avtab_match(avtab_key_t *k, avtab_datum_t *d, void *a
 	}
 
 	if (narule->specified == AVRULE_XPERMS_NEVERALLOW) {
-		rc = check_assertion_extended_permissions(narule, avtab, k, p);
+		rc = check_assertion_extended_permissions(narule, k, p, a->conditional);
 		if (rc < 0)
 			goto oom;
 		if (rc == 0)
@@ -636,11 +801,11 @@ int check_assertion(policydb_t *p, const avrule_t *narule)
 		.errors = 0,
 	};
 
-	args.avtab = &p->te_avtab;
+	args.conditional = false;
 	rc = avtab_map(&p->te_avtab, check_assertion_avtab_match, &args);
 
 	if (rc == 0) {
-		args.avtab = &p->te_cond_avtab;
+		args.conditional = true;
 		rc = avtab_map(&p->te_cond_avtab, check_assertion_avtab_match, &args);
 	}
 
diff --git a/libsepol/src/policydb.c b/libsepol/src/policydb.c
index e90ccca1..0747e789 100644
--- a/libsepol/src/policydb.c
+++ b/libsepol/src/policydb.c
@@ -208,6 +208,13 @@ static const struct policydb_compat_info policydb_compat[] = {
 	 .ocon_num = OCON_IBENDPORT + 1,
 	 .target_platform = SEPOL_TARGET_SELINUX,
 	},
+	{
+	 .type = POLICY_KERN,
+	 .version = POLICYDB_VERSION_COND_XPERMS,
+	 .sym_num = SYM_NUM,
+	 .ocon_num = OCON_IBENDPORT + 1,
+	 .target_platform = SEPOL_TARGET_SELINUX,
+	},
 	{
 	 .type = POLICY_BASE,
 	 .version = MOD_POLICYDB_VERSION_BASE,
@@ -334,6 +341,13 @@ static const struct policydb_compat_info policydb_compat[] = {
 	 .ocon_num = OCON_IBENDPORT + 1,
 	 .target_platform = SEPOL_TARGET_SELINUX,
 	},
+	{
+	 .type = POLICY_BASE,
+	 .version = MOD_POLICYDB_VERSION_COND_XPERMS,
+	 .sym_num = SYM_NUM,
+	 .ocon_num = OCON_IBENDPORT + 1,
+	 .target_platform = SEPOL_TARGET_SELINUX,
+	},
 	{
 	 .type = POLICY_MOD,
 	 .version = MOD_POLICYDB_VERSION_BASE,
@@ -460,6 +474,13 @@ static const struct policydb_compat_info policydb_compat[] = {
 	 .ocon_num = 0,
 	 .target_platform = SEPOL_TARGET_SELINUX,
 	},
+	{
+	 .type = POLICY_MOD,
+	 .version = MOD_POLICYDB_VERSION_COND_XPERMS,
+	 .sym_num = SYM_NUM,
+	 .ocon_num = 0,
+	 .target_platform = SEPOL_TARGET_SELINUX,
+	},
 };
 
 #if 0
diff --git a/libsepol/src/policydb_validate.c b/libsepol/src/policydb_validate.c
index 5035313b..9ee4b948 100644
--- a/libsepol/src/policydb_validate.c
+++ b/libsepol/src/policydb_validate.c
@@ -22,6 +22,7 @@ typedef struct map_arg {
 	validate_t *flavors;
 	sepol_handle_t *handle;
 	const policydb_t *policy;
+	int conditional;
 } map_arg_t;
 
 typedef struct perm_arg {
@@ -837,7 +838,7 @@ static int validate_datum(__attribute__ ((unused))hashtab_key_t k, hashtab_datum
 
 static int validate_datum_array_entries(sepol_handle_t *handle, const policydb_t *p, validate_t flavors[])
 {
-	map_arg_t margs = { flavors, handle, p };
+	map_arg_t margs = { flavors, handle, p, 0 };
 
 	if (hashtab_map(p->p_commons.table, validate_common_datum_wrapper, &margs))
 		goto bad;
@@ -903,7 +904,7 @@ static int validate_avtab_key(const avtab_key_t *key, int conditional, const pol
 	case AVTAB_XPERMS_DONTAUDIT:
 		if (p->target_platform != SEPOL_TARGET_SELINUX)
 			goto bad;
-		if (conditional)
+		if (conditional && !policydb_has_cond_xperms_feature(p))
 			goto bad;
 		break;
 	default:
@@ -956,7 +957,7 @@ static int validate_avtab_key_and_datum(avtab_key_t *k, avtab_datum_t *d, void *
 {
 	map_arg_t *margs = args;
 
-	if (validate_avtab_key(k, 0, margs->policy, margs->flavors))
+	if (validate_avtab_key(k, margs->conditional, margs->policy, margs->flavors))
 		return -1;
 
 	if (k->specified & AVTAB_AV) {
@@ -972,15 +973,23 @@ static int validate_avtab_key_and_datum(avtab_key_t *k, avtab_datum_t *d, void *
 	if ((k->specified & AVTAB_TYPE) && validate_simpletype(d->data, margs->policy, margs->flavors))
 		return -1;
 
-	if ((k->specified & AVTAB_XPERMS) && validate_xperms(d->xperms))
-		return -1;
+	if (k->specified & AVTAB_XPERMS) {
+		uint32_t data = d->data;
+
+		/* checkpolicy does not touch data for xperms, CIL sets it. */
+		if (data != 0 && validate_access_vector(margs->handle, margs->policy, k->target_class, data))
+			return -1;
+
+		if (validate_xperms(d->xperms))
+			return -1;
+	}
 
 	return 0;
 }
 
 static int validate_avtab(sepol_handle_t *handle, const avtab_t *avtab, const policydb_t *p, validate_t flavors[])
 {
-	map_arg_t margs = { flavors, handle, p };
+	map_arg_t margs = { flavors, handle, p, 0 };
 
 	if (avtab_map(avtab, validate_avtab_key_and_datum, &margs)) {
 		ERR(handle, "Invalid avtab");
@@ -992,28 +1001,13 @@ static int validate_avtab(sepol_handle_t *handle, const avtab_t *avtab, const po
 
 static int validate_cond_av_list(sepol_handle_t *handle, const cond_av_list_t *cond_av, const policydb_t *p, validate_t flavors[])
 {
-	const struct avtab_node *avtab_ptr;
-
-	for (; cond_av; cond_av = cond_av->next) {
-		for (avtab_ptr = cond_av->node; avtab_ptr; avtab_ptr = avtab_ptr->next) {
-			const avtab_key_t *key = &avtab_ptr->key;
-			const avtab_datum_t *datum = &avtab_ptr->datum;
+	struct avtab_node *avtab_ptr;
+	map_arg_t margs = { flavors, handle, p, 1 };
 
-			if (validate_avtab_key(key, 1, p, flavors))
+	for (; cond_av; cond_av = cond_av->next)
+		for (avtab_ptr = cond_av->node; avtab_ptr; avtab_ptr = avtab_ptr->next)
+			if (validate_avtab_key_and_datum(&avtab_ptr->key, &avtab_ptr->datum, &margs))
 				goto bad;
-			if (key->specified & AVTAB_AV) {
-				uint32_t data = datum->data;
-
-				if ((0xFFF & key->specified) == AVTAB_AUDITDENY)
-					data = ~data;
-
-				if (validate_access_vector(handle, p, key->target_class, data))
-					goto bad;
-			}
-			if ((key->specified & AVTAB_TYPE) && validate_simpletype(datum->data, p, flavors))
-				goto bad;
-		}
-	}
 
 	return 0;
 
@@ -1046,7 +1040,7 @@ static int validate_avrules(sepol_handle_t *handle, const avrule_t *avrule, int
 		case AVRULE_XPERMS_AUDITALLOW:
 		case AVRULE_XPERMS_DONTAUDIT:
 		case AVRULE_XPERMS_NEVERALLOW:
-			if (conditional)
+			if (conditional && !policydb_has_cond_xperms_feature(p))
 				goto bad;
 			break;
 		default:
@@ -1278,7 +1272,7 @@ bad:
 
 static int validate_filename_trans_hashtab(sepol_handle_t *handle, const policydb_t *p, validate_t flavors[])
 {
-	map_arg_t margs = { flavors, handle, p };
+	map_arg_t margs = { flavors, handle, p, 0 };
 
 	if (hashtab_map(p->filename_trans, validate_filename_trans, &margs)) {
 		ERR(handle, "Invalid filename trans");
@@ -1631,7 +1625,7 @@ bad:
 
 static int validate_range_transitions(sepol_handle_t *handle, const policydb_t *p, validate_t flavors[])
 {
-	map_arg_t margs = { flavors, handle, p };
+	map_arg_t margs = { flavors, handle, p, 0 };
 
 	if (hashtab_map(p->range_tr, validate_range_transition, &margs)) {
 		ERR(handle, "Invalid range transition");
diff --git a/libsepol/src/write.c b/libsepol/src/write.c
index a52e2e82..4ef98449 100644
--- a/libsepol/src/write.c
+++ b/libsepol/src/write.c
@@ -56,7 +56,8 @@ struct policy_data {
 };
 
 static int avrule_write_list(policydb_t *p,
-			     avrule_t * avrules, struct policy_file *fp);
+			     avrule_t * avrules, struct policy_file *fp,
+			     unsigned conditional);
 
 static int ebitmap_write(ebitmap_t * e, struct policy_file *fp)
 {
@@ -104,7 +105,8 @@ static uint16_t spec_order[] = {
 
 static int avtab_write_item(policydb_t * p,
 			    avtab_ptr_t cur, struct policy_file *fp,
-			    unsigned merge, unsigned commit, uint32_t * nel)
+			    unsigned merge, unsigned commit, unsigned conditional,
+			    uint32_t * nel)
 {
 	avtab_ptr_t node;
 	uint8_t buf8;
@@ -229,14 +231,20 @@ static int avtab_write_item(policydb_t * p,
 		return POLICYDB_ERROR;
 	if ((p->policyvers < POLICYDB_VERSION_XPERMS_IOCTL) &&
 			(cur->key.specified & AVTAB_XPERMS)) {
-		ERR(fp->handle, "policy version %u does not support ioctl extended"
+		ERR(fp->handle, "policy version %u does not support extended"
 				"permissions rules and one was specified", p->policyvers);
 		return POLICYDB_ERROR;
 	}
 
+	if (!policydb_has_cond_xperms_feature(p) && (cur->key.specified & AVTAB_XPERMS) && conditional) {
+		ERR(fp->handle, "policy version %u does not support extended"
+				"permissions rules in conditional policies and one was specified", p->policyvers);
+		return POLICYDB_ERROR;
+	}
+
 	if (p->target_platform != SEPOL_TARGET_SELINUX &&
 			(cur->key.specified & AVTAB_XPERMS)) {
-		ERR(fp->handle, "Target platform %s does not support ioctl "
+		ERR(fp->handle, "Target platform %s does not support "
 				"extended permissions rules and one was specified",
 				policydb_target_strings[p->target_platform]);
 		return POLICYDB_ERROR;
@@ -313,7 +321,7 @@ static int avtab_write(struct policydb *p, avtab_t * a, struct policy_file *fp)
 		for (cur = a->htable[i]; cur; cur = cur->next) {
 			/* If old format, compute final nel.
 			   If new format, write out the items. */
-			if (avtab_write_item(p, cur, fp, 1, !oldvers, &nel)) {
+			if (avtab_write_item(p, cur, fp, 1, !oldvers, 0, &nel)) {
 				rc = -1;
 				goto out;
 			}
@@ -332,7 +340,7 @@ static int avtab_write(struct policydb *p, avtab_t * a, struct policy_file *fp)
 		avtab_reset_merged(a);
 		for (i = 0; i < a->nslot; i++) {
 			for (cur = a->htable[i]; cur; cur = cur->next) {
-				if (avtab_write_item(p, cur, fp, 1, 1, NULL)) {
+				if (avtab_write_item(p, cur, fp, 1, 1, 0, NULL)) {
 					rc = -1;
 					goto out;
 				}
@@ -795,7 +803,7 @@ static int cond_write_av_list(policydb_t * p,
 
 	for (cur_list = list; cur_list != NULL; cur_list = cur_list->next) {
 		if (cur_list->node->parse_context)
-			if (avtab_write_item(p, cur_list->node, fp, 0, 1, NULL))
+			if (avtab_write_item(p, cur_list->node, fp, 0, 1, 1, NULL))
 				goto out;
 	}
 
@@ -846,9 +854,9 @@ static int cond_write_node(policydb_t * p,
 		if (cond_write_av_list(p, node->false_list, fp) != 0)
 			return POLICYDB_ERROR;
 	} else {
-		if (avrule_write_list(p, node->avtrue_list, fp))
+		if (avrule_write_list(p, node->avtrue_list, fp, 1))
 			return POLICYDB_ERROR;
-		if (avrule_write_list(p, node->avfalse_list, fp))
+		if (avrule_write_list(p, node->avfalse_list, fp, 1))
 			return POLICYDB_ERROR;
 	}
 
@@ -1743,7 +1751,7 @@ static int range_write(policydb_t * p, struct policy_file *fp)
 /************** module writing functions below **************/
 
 static int avrule_write(policydb_t *p, avrule_t * avrule,
-			struct policy_file *fp)
+			struct policy_file *fp, unsigned conditional)
 {
 	size_t items, items2;
 	uint32_t buf[32], len;
@@ -1801,15 +1809,23 @@ static int avrule_write(policydb_t *p, avrule_t * avrule,
 
 		if (p->policyvers < MOD_POLICYDB_VERSION_XPERMS_IOCTL) {
 			ERR(fp->handle,
-			    "module policy version %u does not support ioctl"
+			    "module policy version %u does not support"
 			    " extended permissions rules and one was specified",
 			    p->policyvers);
 			return POLICYDB_ERROR;
 		}
 
+		if (conditional && !policydb_has_cond_xperms_feature(p)) {
+			ERR(fp->handle,
+			    "module policy version %u does not support"
+			    " extended permissions rules in conditional policies and one was specified",
+			    p->policyvers);
+			return POLICYDB_ERROR;
+		}
+
 		if (p->target_platform != SEPOL_TARGET_SELINUX) {
 			ERR(fp->handle,
-			    "Target platform %s does not support ioctl"
+			    "Target platform %s does not support"
 			    " extended permissions rules and one was specified",
 			    policydb_target_strings[p->target_platform]);
 			return POLICYDB_ERROR;
@@ -1834,7 +1850,7 @@ static int avrule_write(policydb_t *p, avrule_t * avrule,
 }
 
 static int avrule_write_list(policydb_t *p, avrule_t * avrules,
-			     struct policy_file *fp)
+			     struct policy_file *fp, unsigned conditional)
 {
 	uint32_t buf[32], len;
 	avrule_t *avrule;
@@ -1852,7 +1868,7 @@ static int avrule_write_list(policydb_t *p, avrule_t * avrules,
 
 	avrule = avrules;
 	while (avrule) {
-		if (avrule_write(p, avrule, fp))
+		if (avrule_write(p, avrule, fp, conditional))
 			return POLICYDB_ERROR;
 		avrule = avrule->next;
 	}
@@ -2056,7 +2072,7 @@ static int avrule_decl_write(avrule_decl_t * decl, int num_scope_syms,
 		return POLICYDB_ERROR;
 	}
 	if (cond_write_list(p, decl->cond_list, fp) == -1 ||
-	    avrule_write_list(p, decl->avrules, fp) == -1 ||
+	    avrule_write_list(p, decl->avrules, fp, 0) == -1 ||
 	    role_trans_rule_write(p, decl->role_tr_rules, fp) == -1 ||
 	    role_allow_rule_write(decl->role_allow_rules, fp) == -1) {
 		return POLICYDB_ERROR;
-- 
2.45.2


