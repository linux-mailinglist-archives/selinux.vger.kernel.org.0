Return-Path: <selinux+bounces-2235-lists+selinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 503E49C3FDC
	for <lists+selinux@lfdr.de>; Mon, 11 Nov 2024 14:51:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D73581F22C0B
	for <lists+selinux@lfdr.de>; Mon, 11 Nov 2024 13:51:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19FCF19D083;
	Mon, 11 Nov 2024 13:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=seltendoof.de header.i=@seltendoof.de header.b="fhzHxxj/"
X-Original-To: selinux@vger.kernel.org
Received: from server02.seltendoof.de (server02.seltendoof.de [168.119.48.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FA44199939
	for <selinux@vger.kernel.org>; Mon, 11 Nov 2024 13:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.48.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731333085; cv=none; b=pGBAD8+1PhA9fiuZCffLvVCw8Q5MkWSZikn/MS1msTHUeNOzsztRJ/mb7QUKrD4Wnsha3QEw/DYPZacgePap7iqJ9BYcnsg/ZzemzoJqMAy3OhFN2bN5sUYq9MJ924pLEKvkKamK+zdk8YCFSTbbNVhDFvroR2LPQB4RgZ9bmdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731333085; c=relaxed/simple;
	bh=OdNVHxPHFwXg7A5PSjaAp9MoRebGEONJ/Wb4tNsJQVY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Mcv3QBSgPzuY3oL1RIbwobc8dZCwBdP9QE5y8qEuGeLQPt57uqrcVgMcO0kAg2DWjL3VntCg1FeJBeuivbViue/EgyIxa9SoWh/m5T+rNXFiHct652wb+yqkWYzf4UTDvRcnrSxCLLtlaZQaIvomeylSzQ9i46WPLCuVLCd3cZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=seltendoof.de; spf=pass smtp.mailfrom=seltendoof.de; dkim=pass (2048-bit key) header.d=seltendoof.de header.i=@seltendoof.de header.b=fhzHxxj/; arc=none smtp.client-ip=168.119.48.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=seltendoof.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=seltendoof.de
From: =?UTF-8?q?Christian=20G=C3=B6ttsche?= <cgoettsche@seltendoof.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seltendoof.de;
	s=2023072701; t=1731333072;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J8vNQRMaORuZ7Cc2b6AzghxLc83VWb4L3XtQarDluOw=;
	b=fhzHxxj/cPgdMN4YwNfXd2e5vyf633wvAyclT1CfEyCIzF9UZyFqi8Xo8Rcmd7nAggJCAY
	MA+2qi63YdaDcDROcsSkKSDZNgvPvL1KrxJL0SyOlZ2fhHgLuCkHW1GomMvIhQ2gQBQ+iv
	QEAOUpSw5Xdfkr8jfL04vZJgugGGTHL2bHW5nhFmB0UR7aCZQmBDW0eDyu/BofRaRxwaC5
	IR5bPTSwKnZsxdm7APpgvA1JIY+7BVcwTTgXPLTX/M+jW8/QYDhPUKRF5/rOTXaJOcI+6Q
	31IsMXVejxkDzxPr+z4JR+ci5DYhPJEH5nX0TKcaFJ4C6kt7hC9GUBp9K40kbw==
To: selinux@vger.kernel.org
Cc: =?UTF-8?q?Christian=20G=C3=B6ttsche?= <cgzones@googlemail.com>
Subject: [PATCH v5 4/6] libsepol/cil: add support for xperms in conditional policies
Date: Mon, 11 Nov 2024 14:51:05 +0100
Message-ID: <20241111135107.20280-4-cgoettsche@seltendoof.de>
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

Add support for extended permission rules in conditional policies.

Signed-off-by: Christian Göttsche <cgzones@googlemail.com>
---
 libsepol/cil/src/cil_binary.c      | 153 +++++++++++++++++++++++++----
 libsepol/cil/src/cil_build_ast.c   |   6 +-
 libsepol/cil/src/cil_resolve_ast.c |   6 +-
 libsepol/cil/src/cil_verify.c      |   3 +-
 secilc/test/policy.cil             |  13 ++-
 5 files changed, 153 insertions(+), 28 deletions(-)

diff --git a/libsepol/cil/src/cil_binary.c b/libsepol/cil/src/cil_binary.c
index 3d920182..070bf525 100644
--- a/libsepol/cil/src/cil_binary.c
+++ b/libsepol/cil/src/cil_binary.c
@@ -59,14 +59,18 @@
 #define AVRULEX_TABLE_SIZE (1 <<  10)
 #define PERMS_PER_CLASS 32
 
+struct cil_args_xperm_tables {
+	hashtab_t ioctl;
+	hashtab_t nlmsg;
+};
+
 struct cil_args_binary {
 	const struct cil_db *db;
 	policydb_t *pdb;
 	struct cil_list *neverallows;
 	int pass;
 	hashtab_t role_trans_table;
-	hashtab_t avrulex_ioctl_table;
-	hashtab_t avrulex_nlmsg_table;
+	struct cil_args_xperm_tables avrulex_xperm_tables;
 	void **type_value_to_cil;
 };
 
@@ -75,8 +79,14 @@ struct cil_args_booleanif {
 	policydb_t *pdb;
 	cond_node_t *cond_node;
 	enum cil_flavor cond_flavor;
+	struct cil_args_xperm_tables avrulex_xperm_tables;
 };
 
+static unsigned int avrulex_hash(__attribute__((unused)) hashtab_t h, const_hashtab_key_t key);
+static int avrulex_compare(hashtab_t h
+             __attribute__ ((unused)), const_hashtab_key_t key1,
+			              const_hashtab_key_t key2);
+
 static int __cil_get_sepol_user_datum(policydb_t *pdb, struct cil_symtab_datum *datum, user_datum_t **sepol_user)
 {
 	*sepol_user = hashtab_search(pdb->p_users.table, datum->fqn);
@@ -1758,7 +1768,10 @@ static int __cil_permx_bitmap_to_sepol_xperms_list(uint32_t kind, ebitmap_t *xpe
 static int __cil_avrulex_xperm_to_policydb(hashtab_key_t k, hashtab_datum_t datum, uint32_t xperm_kind, void *args)
 {
 	int rc = SEPOL_OK;
-	struct policydb *pdb;
+	struct cil_args_booleanif *booleanif_args = args;
+	struct policydb *pdb = booleanif_args->pdb;
+	cond_node_t *cond_node = booleanif_args->cond_node;
+	enum cil_flavor cond_flavor = booleanif_args->cond_flavor;
 	avtab_key_t *avtab_key;
 	avtab_datum_t avtab_datum;
 	struct cil_list *xperms_list = NULL;
@@ -1768,7 +1781,6 @@ static int __cil_avrulex_xperm_to_policydb(hashtab_key_t k, hashtab_datum_t datu
 	char *kind = NULL;
 
 	avtab_key = (avtab_key_t *)k;
-	pdb = args;
 
 	sepol_obj = pdb->class_val_to_struct[avtab_key->target_class - 1];
 
@@ -1789,7 +1801,12 @@ static int __cil_avrulex_xperm_to_policydb(hashtab_key_t k, hashtab_datum_t datu
 
 	cil_list_for_each(item, xperms_list) {
 		avtab_datum.xperms = item->data;
-		rc = avtab_insert(&pdb->te_avtab, avtab_key, &avtab_datum);
+
+		if (cond_node) {
+			rc = __cil_cond_insert_rule(&pdb->te_cond_avtab, avtab_key, &avtab_datum, cond_node, cond_flavor);
+		} else {
+			rc = avtab_insert(&pdb->te_avtab, avtab_key, &avtab_datum);
+		}
 		if (rc != SEPOL_OK) {
 			goto exit;
 		}
@@ -1872,7 +1889,7 @@ exit:
 	return rc;
 }
 
-static int __cil_avrulex_to_hashtable_helper(policydb_t *pdb, uint16_t kind, struct cil_symtab_datum *src, struct cil_symtab_datum *tgt, struct cil_permissionx *permx, struct cil_args_binary *args)
+static int __cil_avrulex_to_hashtable_helper(policydb_t *pdb, uint16_t kind, struct cil_symtab_datum *src, struct cil_symtab_datum *tgt, struct cil_permissionx *permx, struct cil_args_xperm_tables *xt)
 {
 	int rc = SEPOL_ERR;
 	type_datum_t *sepol_src = NULL;
@@ -1895,11 +1912,11 @@ static int __cil_avrulex_to_hashtable_helper(policydb_t *pdb, uint16_t kind, str
 
 		switch (permx->kind) {
 		case  CIL_PERMX_KIND_IOCTL:
-			rc = __cil_avrulex_xperm_to_hashtable(args->avrulex_ioctl_table, kind, sepol_src->s.value, sepol_tgt->s.value, sepol_obj->s.value, permx->perms);
+			rc = __cil_avrulex_xperm_to_hashtable(xt->ioctl, kind, sepol_src->s.value, sepol_tgt->s.value, sepol_obj->s.value, permx->perms);
 			if (rc != SEPOL_OK) goto exit;
 			break;
 		case  CIL_PERMX_KIND_NLMSG:
-			rc = __cil_avrulex_xperm_to_hashtable(args->avrulex_nlmsg_table, kind, sepol_src->s.value, sepol_tgt->s.value, sepol_obj->s.value, permx->perms);
+			rc = __cil_avrulex_xperm_to_hashtable(xt->nlmsg, kind, sepol_src->s.value, sepol_tgt->s.value, sepol_obj->s.value, permx->perms);
 			if (rc != SEPOL_OK) goto exit;
 			break;
 		default:
@@ -1916,7 +1933,7 @@ exit:
 	return rc;
 }
 
-static int cil_avrulex_to_hashtable(policydb_t *pdb, const struct cil_db *db, struct cil_avrule *cil_avrulex, struct cil_args_binary *args)
+static int cil_avrulex_to_hashtable(policydb_t *pdb, const struct cil_db *db, struct cil_avrule *cil_avrulex, struct cil_args_xperm_tables *xt)
 {
 	int rc = SEPOL_ERR;
 	uint16_t kind;
@@ -1942,7 +1959,7 @@ static int cil_avrulex_to_hashtable(policydb_t *pdb, const struct cil_db *db, st
 
 		ebitmap_for_each_positive_bit(&src_bitmap, snode, s) {
 			src = DATUM(db->val_to_type[s]);
-			rc = __cil_avrulex_to_hashtable_helper(pdb, kind, src, src, cil_avrulex->perms.x.permx, args);
+			rc = __cil_avrulex_to_hashtable_helper(pdb, kind, src, src, cil_avrulex->perms.x.permx, xt);
 			if (rc != SEPOL_OK) {
 				ebitmap_destroy(&src_bitmap);
 				goto exit;
@@ -1960,7 +1977,7 @@ static int cil_avrulex_to_hashtable(policydb_t *pdb, const struct cil_db *db, st
 			for (t = 0; t < (unsigned int)db->num_types; t++) {
 				if (s != t) {
 					tgt = DATUM(db->val_to_type[t]);
-					rc = __cil_avrulex_to_hashtable_helper(pdb, kind, src, tgt, cil_avrulex->perms.x.permx, args);
+					rc = __cil_avrulex_to_hashtable_helper(pdb, kind, src, tgt, cil_avrulex->perms.x.permx, xt);
 					if (rc != SEPOL_OK) {
 						ebitmap_destroy(&src_bitmap);
 						goto exit;
@@ -1980,7 +1997,7 @@ static int cil_avrulex_to_hashtable(policydb_t *pdb, const struct cil_db *db, st
 			ebitmap_for_each_positive_bit(&src_bitmap, tnode, t) {
 				if (s != t) {
 					tgt = DATUM(db->val_to_type[t]);
-					rc = __cil_avrulex_to_hashtable_helper(pdb, kind, src, tgt, cil_avrulex->perms.x.permx, args);
+					rc = __cil_avrulex_to_hashtable_helper(pdb, kind, src, tgt, cil_avrulex->perms.x.permx, xt);
 					if (rc != SEPOL_OK) {
 						ebitmap_destroy(&src_bitmap);
 						goto exit;
@@ -1994,7 +2011,7 @@ static int cil_avrulex_to_hashtable(policydb_t *pdb, const struct cil_db *db, st
 		int expand_tgt = __cil_should_expand_attribute(db, tgt);
 
 		if (!expand_src && !expand_tgt) {
-			rc = __cil_avrulex_to_hashtable_helper(pdb, kind, src, tgt, cil_avrulex->perms.x.permx, args);
+			rc = __cil_avrulex_to_hashtable_helper(pdb, kind, src, tgt, cil_avrulex->perms.x.permx, xt);
 			if (rc != SEPOL_OK) {
 				goto exit;
 			}
@@ -2015,7 +2032,7 @@ static int cil_avrulex_to_hashtable(policydb_t *pdb, const struct cil_db *db, st
 				ebitmap_for_each_positive_bit(&tgt_bitmap, tnode, t) {
 					tgt = DATUM(db->val_to_type[t]);
 
-					rc = __cil_avrulex_to_hashtable_helper(pdb, kind, src, tgt, cil_avrulex->perms.x.permx, args);
+					rc = __cil_avrulex_to_hashtable_helper(pdb, kind, src, tgt, cil_avrulex->perms.x.permx, xt);
 					if (rc != SEPOL_OK) {
 						ebitmap_destroy(&src_bitmap);
 						ebitmap_destroy(&tgt_bitmap);
@@ -2034,7 +2051,7 @@ static int cil_avrulex_to_hashtable(policydb_t *pdb, const struct cil_db *db, st
 			ebitmap_for_each_positive_bit(&src_bitmap, snode, s) {
 				src = DATUM(db->val_to_type[s]);
 
-				rc = __cil_avrulex_to_hashtable_helper(pdb, kind, src, tgt, cil_avrulex->perms.x.permx, args);
+				rc = __cil_avrulex_to_hashtable_helper(pdb, kind, src, tgt, cil_avrulex->perms.x.permx, xt);
 				if (rc != SEPOL_OK) {
 					ebitmap_destroy(&src_bitmap);
 					goto exit;
@@ -2050,7 +2067,7 @@ static int cil_avrulex_to_hashtable(policydb_t *pdb, const struct cil_db *db, st
 			ebitmap_for_each_positive_bit(&tgt_bitmap, tnode, t) {
 				tgt = DATUM(db->val_to_type[t]);
 
-				rc = __cil_avrulex_to_hashtable_helper(pdb, kind, src, tgt, cil_avrulex->perms.x.permx, args);
+				rc = __cil_avrulex_to_hashtable_helper(pdb, kind, src, tgt, cil_avrulex->perms.x.permx, xt);
 				if (rc != SEPOL_OK) {
 					ebitmap_destroy(&tgt_bitmap);
 					goto exit;
@@ -2119,6 +2136,21 @@ static int __cil_cond_to_policydb_helper(struct cil_tree_node *node, __attribute
 			goto exit;
 		}
 		break;
+	case CIL_AVRULEX:
+		if (db->policy_version < POLICYDB_VERSION_COND_XPERMS) {
+			cil_tree_log(node, CIL_ERR, "Extended permission rules are not supported in policy version %d\n",
+				     db->policy_version);
+			rc = SEPOL_ERR;
+			goto exit;
+		}
+		cil_avrule = node->data;
+		rc = cil_avrulex_to_hashtable(pdb, db, cil_avrule, &args->avrulex_xperm_tables);
+		if (rc != SEPOL_OK) {
+			cil_tree_log(node, CIL_ERR, "Failed to insert avrulex into avtab");
+			goto exit;
+		}
+		break;
+
 	case CIL_CALL:
 	case CIL_TUNABLEIF:
 		break;
@@ -2425,6 +2457,8 @@ int cil_booleanif_to_policydb(policydb_t *pdb, const struct cil_db *db, struct c
 	int was_created;
 	int swapped = CIL_FALSE;
 	cond_av_list_t tmp_cl;
+	hashtab_t avrulex_ioctl_table = NULL;
+	hashtab_t avrulex_nlmsg_table = NULL;
 
 	tmp_cond = cond_node_create(pdb, NULL);
 	if (tmp_cond == NULL) {
@@ -2493,26 +2527,97 @@ int cil_booleanif_to_policydb(policydb_t *pdb, const struct cil_db *db, struct c
 	bool_args.cond_node = cond_node;
 
 	if (true_node != NULL) {
+		avrulex_ioctl_table = hashtab_create(avrulex_hash, avrulex_compare, AVRULEX_TABLE_SIZE);
+		if (!avrulex_ioctl_table) {
+			cil_log(CIL_INFO, "Failure to create hashtab for avrulex\n");
+			goto exit;
+		}
+
+		avrulex_nlmsg_table = hashtab_create(avrulex_hash, avrulex_compare, AVRULEX_TABLE_SIZE);
+		if (!avrulex_nlmsg_table) {
+			cil_log(CIL_INFO, "Failure to create hashtab for avrulex\n");
+			goto exit;
+		}
+
 		bool_args.cond_flavor = CIL_CONDTRUE;
+		bool_args.avrulex_xperm_tables.ioctl = avrulex_ioctl_table;
+		bool_args.avrulex_xperm_tables.nlmsg = avrulex_nlmsg_table;
 		rc = cil_tree_walk(true_node, __cil_cond_to_policydb_helper, NULL, NULL, &bool_args);
 		if (rc != SEPOL_OK) {
 			cil_tree_log(true_node, CIL_ERR, "Failure while walking true conditional block");
 			goto exit;
 		}
+
+		rc = hashtab_map(avrulex_ioctl_table, __cil_avrulex_ioctl_to_policydb, &bool_args);
+		if (rc != SEPOL_OK) {
+			cil_log(CIL_INFO, "Failure creating avrulex rules\n");
+			goto exit;
+		}
+
+		rc = hashtab_map(avrulex_nlmsg_table, __cil_avrulex_nlmsg_to_policydb, &bool_args);
+		if (rc != SEPOL_OK) {
+			cil_log(CIL_INFO, "Failure creating avrulex rules\n");
+			goto exit;
+		}
+
+		hashtab_map(avrulex_nlmsg_table, __cil_avrulex_xperm_destroy, NULL);
+		hashtab_destroy(avrulex_nlmsg_table);
+		avrulex_nlmsg_table = NULL;
+
+		hashtab_map(avrulex_ioctl_table, __cil_avrulex_xperm_destroy, NULL);
+		hashtab_destroy(avrulex_ioctl_table);
+		avrulex_ioctl_table = NULL;
 	}
 
 	if (false_node != NULL) {
+		avrulex_ioctl_table = hashtab_create(avrulex_hash, avrulex_compare, AVRULEX_TABLE_SIZE);
+		if (!avrulex_ioctl_table) {
+			cil_log(CIL_INFO, "Failure to create hashtab for avrulex\n");
+			goto exit;
+		}
+
+		avrulex_nlmsg_table = hashtab_create(avrulex_hash, avrulex_compare, AVRULEX_TABLE_SIZE);
+		if (!avrulex_nlmsg_table) {
+			cil_log(CIL_INFO, "Failure to create hashtab for avrulex\n");
+			goto exit;
+		}
+
 		bool_args.cond_flavor = CIL_CONDFALSE;
+		bool_args.avrulex_xperm_tables.ioctl = avrulex_ioctl_table;
+		bool_args.avrulex_xperm_tables.nlmsg = avrulex_nlmsg_table;
 		rc = cil_tree_walk(false_node, __cil_cond_to_policydb_helper, NULL, NULL, &bool_args);
 		if (rc != SEPOL_OK) {
 			cil_tree_log(false_node, CIL_ERR, "Failure while walking false conditional block");
 			goto exit;
 		}
+
+		rc = hashtab_map(avrulex_ioctl_table, __cil_avrulex_ioctl_to_policydb, &bool_args);
+		if (rc != SEPOL_OK) {
+			cil_log(CIL_INFO, "Failure creating avrulex rules\n");
+			goto exit;
+		}
+
+		rc = hashtab_map(avrulex_nlmsg_table, __cil_avrulex_nlmsg_to_policydb, &bool_args);
+		if (rc != SEPOL_OK) {
+			cil_log(CIL_INFO, "Failure creating avrulex rules\n");
+			goto exit;
+		}
+
+		hashtab_map(avrulex_nlmsg_table, __cil_avrulex_xperm_destroy, NULL);
+		hashtab_destroy(avrulex_nlmsg_table);
+		avrulex_nlmsg_table = NULL;
+
+
+		hashtab_map(avrulex_ioctl_table, __cil_avrulex_xperm_destroy, NULL);
+		hashtab_destroy(avrulex_ioctl_table);
+		avrulex_ioctl_table = NULL;
 	}
 
 	return SEPOL_OK;
 
 exit:
+	hashtab_map(avrulex_ioctl_table, __cil_avrulex_xperm_destroy, NULL);
+	hashtab_destroy(avrulex_ioctl_table);
 	if (tmp_cond) {
 		if (tmp_cond->expr)
 			cond_expr_destroy(tmp_cond->expr);
@@ -4087,7 +4192,7 @@ static int __cil_node_to_policydb(struct cil_tree_node *node, void *extra_args)
 		case CIL_AVRULEX: {
 				struct cil_avrule *rule = node->data;
 				if (rule->rule_kind != CIL_AVRULE_NEVERALLOW) {
-					rc = cil_avrulex_to_hashtable(pdb, db, node->data, args);
+					rc = cil_avrulex_to_hashtable(pdb, db, node->data, &args->avrulex_xperm_tables);
 				}
 			}
 			break;
@@ -5158,6 +5263,7 @@ int cil_binary_create_allocated_pdb(const struct cil_db *db, sepol_policydb_t *p
 	int rc = SEPOL_ERR;
 	int i;
 	struct cil_args_binary extra_args;
+	struct cil_args_booleanif booleanif_args;
 	policydb_t *pdb = &policydb->p;
 	struct cil_list *neverallows = NULL;
 	hashtab_t role_trans_table = NULL;
@@ -5222,10 +5328,15 @@ int cil_binary_create_allocated_pdb(const struct cil_db *db, sepol_policydb_t *p
 	extra_args.pdb = pdb;
 	extra_args.neverallows = neverallows;
 	extra_args.role_trans_table = role_trans_table;
-	extra_args.avrulex_ioctl_table = avrulex_ioctl_table;
-	extra_args.avrulex_nlmsg_table = avrulex_nlmsg_table;
+	extra_args.avrulex_xperm_tables.ioctl = avrulex_ioctl_table;
+	extra_args.avrulex_xperm_tables.nlmsg = avrulex_nlmsg_table;
 	extra_args.type_value_to_cil = type_value_to_cil;
 
+	booleanif_args.db = db;
+	booleanif_args.pdb = pdb;
+	booleanif_args.cond_node = NULL;
+	booleanif_args.cond_flavor = CIL_NONE;
+
 	for (i = 1; i <= 3; i++) {
 		extra_args.pass = i;
 
@@ -5244,12 +5355,12 @@ int cil_binary_create_allocated_pdb(const struct cil_db *db, sepol_policydb_t *p
 		}
 
 		if (i == 3) {
-			rc = hashtab_map(avrulex_ioctl_table, __cil_avrulex_ioctl_to_policydb, pdb);
+			rc = hashtab_map(avrulex_ioctl_table, __cil_avrulex_ioctl_to_policydb, &booleanif_args);
 			if (rc != SEPOL_OK) {
 				cil_log(CIL_INFO, "Failure creating avrulex rules\n");
 				goto exit;
 			}
-			rc = hashtab_map(avrulex_nlmsg_table, __cil_avrulex_nlmsg_to_policydb, pdb);
+			rc = hashtab_map(avrulex_nlmsg_table, __cil_avrulex_nlmsg_to_policydb, &booleanif_args);
 			if (rc != SEPOL_OK) {
 				cil_log(CIL_INFO, "Failure creating avrulex rules\n");
 				goto exit;
diff --git a/libsepol/cil/src/cil_build_ast.c b/libsepol/cil/src/cil_build_ast.c
index 19fbb04e..8cc3f9b2 100644
--- a/libsepol/cil/src/cil_build_ast.c
+++ b/libsepol/cil/src/cil_build_ast.c
@@ -6158,7 +6158,11 @@ static int check_for_illegal_statement(struct cil_tree_node *parse_current, stru
 			parse_current->data != CIL_KEY_AUDITALLOW &&
 			parse_current->data != CIL_KEY_TYPETRANSITION &&
 			parse_current->data != CIL_KEY_TYPECHANGE &&
-			parse_current->data != CIL_KEY_TYPEMEMBER) {
+			parse_current->data != CIL_KEY_TYPEMEMBER &&
+			((args->db->policy_version < POLICYDB_VERSION_COND_XPERMS) ||
+			  (parse_current->data != CIL_KEY_ALLOWX &&
+			   parse_current->data != CIL_KEY_DONTAUDITX &&
+			   parse_current->data != CIL_KEY_AUDITALLOWX))) {
 			if (((struct cil_booleanif*)args->boolif->data)->preserved_tunable) {
 				cil_tree_log(parse_current, CIL_ERR, "%s is not allowed in tunableif being treated as a booleanif", (char *)parse_current->data);
 			} else {
diff --git a/libsepol/cil/src/cil_resolve_ast.c b/libsepol/cil/src/cil_resolve_ast.c
index da8863c4..a8fa89df 100644
--- a/libsepol/cil/src/cil_resolve_ast.c
+++ b/libsepol/cil/src/cil_resolve_ast.c
@@ -3848,9 +3848,11 @@ static int __cil_resolve_ast_node_helper(struct cil_tree_node *node, uint32_t *f
 			node->flavor != CIL_CONDBLOCK &&
 			node->flavor != CIL_AVRULE &&
 			node->flavor != CIL_TYPE_RULE &&
-			node->flavor != CIL_NAMETYPETRANSITION) {
+			node->flavor != CIL_NAMETYPETRANSITION &&
+			((args->db->policy_version < POLICYDB_VERSION_COND_XPERMS) ||
+			 (node->flavor != CIL_AVRULEX))) {
 			rc = SEPOL_ERR;
-		} else if (node->flavor == CIL_AVRULE) {
+		} else if (node->flavor == CIL_AVRULE || node->flavor == CIL_AVRULEX) {
 			struct cil_avrule *rule = node->data;
 			if (rule->rule_kind == CIL_AVRULE_NEVERALLOW) {
 				rc = SEPOL_ERR;
diff --git a/libsepol/cil/src/cil_verify.c b/libsepol/cil/src/cil_verify.c
index 9621a247..550b4542 100644
--- a/libsepol/cil/src/cil_verify.c
+++ b/libsepol/cil/src/cil_verify.c
@@ -1101,7 +1101,8 @@ static int __cil_verify_booleanif_helper(struct cil_tree_node *node, __attribute
 	struct cil_booleanif *bif = node->parent->parent->data;
 
 	switch (rule_node->flavor) {
-	case CIL_AVRULE: {
+	case CIL_AVRULE:
+	case CIL_AVRULEX: {
 		struct cil_avrule *avrule = NULL;
 		avrule = rule_node->data;
 		if (avrule->rule_kind == CIL_AVRULE_NEVERALLOW) {
diff --git a/secilc/test/policy.cil b/secilc/test/policy.cil
index e6b78618..d0d52d0d 100644
--- a/secilc/test/policy.cil
+++ b/secilc/test/policy.cil
@@ -47,8 +47,9 @@
 
 (block policy
 	(class file (execute_no_trans entrypoint execmod open audit_access a b c d e))
-	; order should be: file char b c a dir d e f
-	(classorder (file char))
+	(class socket (nlmsg))
+	; order should be: file socket char b c a dir d e f
+	(classorder (file socket char))
 	(classorder (unordered dir))
 	(classorder (unordered c a b d e f))
 	(classorder (char b c a))
@@ -161,7 +162,10 @@
 	;;(allow bad_t not_bad_type (file (execute)))
 	;;(allow bad_t exec_t (file (execute)))
 	(neverallow bad_t not_bad_type (file (execute)))
-			
+
+	(auditallowx getty_t console_device_t (ioctl file (range 0x1000 0x10FF)))
+	(auditallowx getty_t kernel_t (nlmsg socket (range 0x1000 0x10FF)))
+
 	(booleanif secure_mode
 		(true
 			(auditallow device_t exec_t (file (read write)))
@@ -172,9 +176,12 @@
 		(true
 			(typechange auditadm_t console_device_t file user_tty_device_t)
 			(allow getty_t console_device_t (file (getattr open read write append)))
+			(auditallowx getty_t console_device_t (ioctl file (range 0x2000 0x21FF)))
+			(auditallowx getty_t kernel_t (nlmsg socket (0x1)))
 		)
 		(false
 			(dontaudit getty_t console_device_t (file (getattr open read write append)))
+			(dontauditx getty_t console_device_t (ioctl file (range 0x3000 0x31FF)))
 		)
 	)
 
-- 
2.45.2


