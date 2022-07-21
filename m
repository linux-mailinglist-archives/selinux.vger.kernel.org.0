Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE46657CED8
	for <lists+selinux@lfdr.de>; Thu, 21 Jul 2022 17:25:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229555AbiGUPY5 (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Thu, 21 Jul 2022 11:24:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230325AbiGUPYz (ORCPT
        <rfc822;selinux@vger.kernel.org>); Thu, 21 Jul 2022 11:24:55 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8486783F26
        for <selinux@vger.kernel.org>; Thu, 21 Jul 2022 08:24:53 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id va17so3822583ejb.0
        for <selinux@vger.kernel.org>; Thu, 21 Jul 2022 08:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=DCKBvZTV4/Io5d1NpR9vQKnImkai2AbrW2529ehq13c=;
        b=HYz7HrUTUUFyUg5LYwifffi6gqcceudOLJBPanQVheVX3EBycXMXrRoAWWbw/XwBFX
         pdW2cD0x9RGCGeDXL8ylbmgN5VVmSr2Mw3EETK0u62PtirYDduUFUdIk7MVB4JwkUqrs
         8UsD/5SBpoZjCdANdkz98fPS1EEoNURA5ad/DlauV8LznJtyy8RVgJy2ZruBL1E1xs6q
         HH714i8h2U49prCngyF4sCCO+bQO035arKvvUue1eCyhKc687Vv41T1nowq+jgXEfmO6
         YR583F+uQNPsxCPRen36cwb/mweyiot3j8efWO9+WtpDeM9Ly3Dk34bp5+WQ7ZuT/1GM
         j3zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DCKBvZTV4/Io5d1NpR9vQKnImkai2AbrW2529ehq13c=;
        b=QYJ79gN5ElNbvwTwjet78IrV2Cqv0PmNe26gdvgJu1tnp43xUB/uetfU9x2FWkNEca
         gZoH+85kYxhb2tD3exrCNmMf5wITF3rDTU5oNMEJOigyeI1Has9lW+PXrJvsGRkDuMhd
         sxKmaTMtQblPz2i9TNKB7R1IY5FTQYxD3Hv0a/IDJluShfmZInDfiW1REfaKn7tn0EVS
         fidlIUYJD3ZQMpcRIGSNBRuu7KHj8xpPVMIOLs9u5P5rG3fGA7lkiJZLeJNZwjvVtmhK
         WKSADjCG2fKdGd0HIG+ZnAeFFxR0ggqGlRZuu2ChJXVE73c/Boa3TIUsYa2dvsqYCKxy
         7QFg==
X-Gm-Message-State: AJIora/Ff2F6D2EPznpJctMZZR1/zAt9R3wTnf9o49z643GM6MfSdYl8
        PKyZJYu/iz6nw7LvOtZ6ng4lJCAVxZKUgQ==
X-Google-Smtp-Source: AGRyM1vUVD8WcKjrWj1P4MIr+6GmwCbKtMX/c7hpEMLZyO+fBsBKW/davub7W1AnbyYqQLumeyAeAw==
X-Received: by 2002:a17:907:d28:b0:72b:5cc9:99c with SMTP id gn40-20020a1709070d2800b0072b5cc9099cmr41116435ejc.228.1658417091985;
        Thu, 21 Jul 2022 08:24:51 -0700 (PDT)
Received: from debianHome.localdomain (dynamic-077-000-209-027.77.0.pool.telefonica.de. [77.0.209.27])
        by smtp.gmail.com with ESMTPSA id d18-20020a056402079200b0043a253973aasm1163486edy.10.2022.07.21.08.24.51
        for <selinux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jul 2022 08:24:51 -0700 (PDT)
From:   =?UTF-8?q?Christian=20G=C3=B6ttsche?= <cgzones@googlemail.com>
To:     selinux@vger.kernel.org
Subject: [PATCH v2 5/5] libsepol: more strict validation
Date:   Thu, 21 Jul 2022 17:24:44 +0200
Message-Id: <20220721152444.31690-5-cgzones@googlemail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220721152444.31690-1-cgzones@googlemail.com>
References: <20220721152444.31690-1-cgzones@googlemail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Validate that

  - each constraint has at least one expression
  - classes reference a valid common class identifier
  - the role flavor is either ROLE or ATTRIB
  - types reference a valid primary identifier
  - types refer to a raw type, not an attribute, as bounds
  - extended permissions in avtabs have a valid specifier
  - type av rules refer to a raw type (e.g. type_transition)
  - conditionals have at least one expression
  - the state and flags of conditionals are valid
  - filename transitions have at least one datum
  - low ports are not bigger than high ones in port ocontexts
  - genfs declarations refer to a valid class identifier
  - genfs declarations contains a filesystem name
  - filename transitions refer to a raw type
  - permissive types are raw ones
  - the range transition hashmap is valid
  - the type-attribute-maps are valid

Signed-off-by: Christian Göttsche <cgzones@googlemail.com>
---
v2:
   only validate type_attr maps for policies since version 20
---
 libsepol/src/policydb_validate.c | 259 +++++++++++++++++++++++++------
 1 file changed, 209 insertions(+), 50 deletions(-)

diff --git a/libsepol/src/policydb_validate.c b/libsepol/src/policydb_validate.c
index 0f399771..521ea4ff 100644
--- a/libsepol/src/policydb_validate.c
+++ b/libsepol/src/policydb_validate.c
@@ -48,6 +48,8 @@ static int validate_init(validate_t *flavor, char **val_to_name, uint32_t nprim)
 
 static int validate_array_init(const policydb_t *p, validate_t flavors[])
 {
+	if (validate_init(&flavors[SYM_COMMONS], p->p_common_val_to_name, p->p_commons.nprim))
+		goto bad;
 	if (validate_init(&flavors[SYM_CLASSES], p->p_class_val_to_name, p->p_classes.nprim))
 		goto bad;
 	if (validate_init(&flavors[SYM_ROLES], p->p_role_val_to_name, p->p_roles.nprim))
@@ -235,6 +237,9 @@ static int validate_constraint_nodes(sepol_handle_t *handle, unsigned int nperms
 		if (nperms > 0 && nperms != PERM_SYMTAB_SIZE && cons->permissions >= (UINT32_C(1) << nperms))
 			goto bad;
 
+		if (!cons->expr)
+			goto bad;
+
 		for (cexp = cons->expr; cexp; cexp = cexp->next) {
 			if (cexp->expr_type == CEXPR_NAMES) {
 				if (cexp->attr & CEXPR_XTARGET && nperms != 0)
@@ -339,10 +344,33 @@ bad:
 	return -1;
 }
 
+static int validate_common_datum(sepol_handle_t *handle, const common_datum_t *common, validate_t flavors[])
+{
+	if (validate_value(common->s.value, &flavors[SYM_COMMONS]))
+		goto bad;
+	if (common->permissions.nprim > PERM_SYMTAB_SIZE)
+		goto bad;
+
+	return 0;
+
+bad:
+	ERR(handle, "Invalid common class datum");
+	return -1;
+}
+
+static int validate_common_datum_wrapper(__attribute__((unused)) hashtab_key_t k, hashtab_datum_t d, void *args)
+{
+	map_arg_t *margs = args;
+
+	return validate_common_datum(margs->handle, d, margs->flavors);
+}
+
 static int validate_class_datum(sepol_handle_t *handle, const class_datum_t *class, validate_t flavors[])
 {
 	if (validate_value(class->s.value, &flavors[SYM_CLASSES]))
 		goto bad;
+	if (class->comdatum && validate_common_datum(handle, class->comdatum, flavors))
+		goto bad;
 	if (class->permissions.nprim > PERM_SYMTAB_SIZE)
 		goto bad;
 	if (validate_constraint_nodes(handle, class->permissions.nprim, class->constraints, flavors))
@@ -405,25 +433,6 @@ static int validate_class_datum_wrapper(__attribute__((unused)) hashtab_key_t k,
 	return validate_class_datum(margs->handle, d, margs->flavors);
 }
 
-static int validate_common_datum(sepol_handle_t *handle, const common_datum_t *common)
-{
-	if (common->permissions.nprim > PERM_SYMTAB_SIZE)
-		goto bad;
-
-	return 0;
-
-bad:
-	ERR(handle, "Invalid common class datum");
-	return -1;
-}
-
-static int validate_common_datum_wrapper(__attribute__((unused)) hashtab_key_t k, hashtab_datum_t d, void *args)
-{
-	map_arg_t *margs = args;
-
-	return validate_common_datum(margs->handle, d);
-}
-
 static int validate_role_datum(sepol_handle_t *handle, const role_datum_t *role, validate_t flavors[])
 {
 	if (validate_value(role->s.value, &flavors[SYM_ROLES]))
@@ -437,6 +446,14 @@ static int validate_role_datum(sepol_handle_t *handle, const role_datum_t *role,
 	if (validate_ebitmap(&role->roles, &flavors[SYM_ROLES]))
 		goto bad;
 
+	switch(role->flavor) {
+	case ROLE_ROLE:
+	case ROLE_ATTRIB:
+		break;
+	default:
+		goto bad;
+	}
+
 	return 0;
 
 bad:
@@ -451,19 +468,46 @@ static int validate_role_datum_wrapper(__attribute__((unused)) hashtab_key_t k,
 	return validate_role_datum(margs->handle, d, margs->flavors);
 }
 
-static int validate_type_datum(sepol_handle_t *handle, const type_datum_t *type, validate_t flavors[])
+static int validate_simpletype(uint32_t value, const policydb_t *p, validate_t flavors[])
 {
-	if (validate_value(type->s.value, &flavors[SYM_TYPES]))
+	const type_datum_t *type;
+
+	if (validate_value(value, &flavors[SYM_TYPES]))
+		goto bad;
+
+	type = p->type_val_to_struct[value - 1];
+	if (!type)
 		goto bad;
-	if (validate_ebitmap(&type->types, &flavors[SYM_TYPES]))
+
+	if (type->flavor == TYPE_ATTRIB)
+		goto bad;
+
+	return 0;
+
+bad:
+	return -1;
+}
+
+static int validate_type_datum(sepol_handle_t *handle, const type_datum_t *type, const policydb_t *p, validate_t flavors[])
+{
+	if (validate_value(type->s.value, &flavors[SYM_TYPES]))
 		goto bad;
-	if (type->bounds && validate_value(type->bounds, &flavors[SYM_TYPES]))
+	if (type->primary && validate_value(type->primary, &flavors[SYM_TYPES]))
 		goto bad;
 
 	switch (type->flavor) {
 	case TYPE_TYPE:
-	case TYPE_ATTRIB:
 	case TYPE_ALIAS:
+		if (!ebitmap_is_empty(&type->types))
+			goto bad;
+		if (type->bounds && validate_simpletype(type->bounds, p, flavors))
+			goto bad;
+		break;
+	case TYPE_ATTRIB:
+		if (validate_ebitmap(&type->types, &flavors[SYM_TYPES]))
+			goto bad;
+		if (type->bounds)
+			goto bad;
 		break;
 	default:
 		goto bad;
@@ -491,7 +535,7 @@ static int validate_type_datum_wrapper(__attribute__((unused)) hashtab_key_t k,
 {
 	map_arg_t *margs = args;
 
-	return validate_type_datum(margs->handle, d, margs->flavors);
+	return validate_type_datum(margs->handle, d, margs->policy, margs->flavors);
 }
 
 static int validate_mls_semantic_cat(const mls_semantic_cat_t *cat, const validate_t *cats)
@@ -758,22 +802,42 @@ bad:
 	return -1;
 }
 
+static int validate_xperms(const avtab_extended_perms_t *xperms)
+{
+	switch (xperms->specified) {
+	case AVTAB_XPERMS_IOCTLDRIVER:
+	case AVTAB_XPERMS_IOCTLFUNCTION:
+		break;
+	default:
+		goto bad;
+	}
+
+	return 0;
+
+bad:
+	return -1;
+}
 static int validate_avtab_key_and_datum(avtab_key_t *k, avtab_datum_t *d, void *args)
 {
-	validate_t *flavors = (validate_t *)args;
+	map_arg_t *margs = args;
+
+	if (validate_avtab_key(k, 0, margs->flavors))
+		return -1;
 
-	if (validate_avtab_key(k, 0, flavors))
+	if ((k->specified & AVTAB_TYPE) && validate_simpletype(d->data, margs->policy, margs->flavors))
 		return -1;
 
-	if ((k->specified & AVTAB_TYPE) && validate_value(d->data, &flavors[SYM_TYPES]))
+	if ((k->specified & AVTAB_XPERMS) && validate_xperms(d->xperms))
 		return -1;
 
 	return 0;
 }
 
-static int validate_avtab(sepol_handle_t *handle, const avtab_t *avtab, validate_t flavors[])
+static int validate_avtab(sepol_handle_t *handle, const avtab_t *avtab, const policydb_t *p, validate_t flavors[])
 {
-	if (avtab_map(avtab, validate_avtab_key_and_datum, flavors)) {
+	map_arg_t margs = { flavors, handle, p };
+
+	if (avtab_map(avtab, validate_avtab_key_and_datum, &margs)) {
 		ERR(handle, "Invalid avtab");
 		return -1;
 	}
@@ -797,20 +861,15 @@ static int validate_cond_av_list(sepol_handle_t *handle, const cond_av_list_t *c
 	return 0;
 }
 
-static int validate_avrules(sepol_handle_t *handle, const avrule_t *avrule, int conditional, validate_t flavors[])
+static int validate_avrules(sepol_handle_t *handle, const avrule_t *avrule, int conditional, const policydb_t *p, validate_t flavors[])
 {
-	const class_perm_node_t *class;
+	const class_perm_node_t *classperm;
 
 	for (; avrule; avrule = avrule->next) {
 		if (validate_type_set(&avrule->stypes, &flavors[SYM_TYPES]))
 			goto bad;
 		if (validate_type_set(&avrule->ttypes, &flavors[SYM_TYPES]))
 			goto bad;
-		class = avrule->perms;
-		for (; class; class = class->next) {
-			if (validate_value(class->tclass, &flavors[SYM_CLASSES]))
-				goto bad;
-		}
 
 		switch(avrule->specified) {
 		case AVRULE_ALLOWED:
@@ -833,6 +892,13 @@ static int validate_avrules(sepol_handle_t *handle, const avrule_t *avrule, int
 			goto bad;
 		}
 
+		for (classperm = avrule->perms; classperm; classperm = classperm->next) {
+			if (validate_value(classperm->tclass, &flavors[SYM_CLASSES]))
+				goto bad;
+			if ((avrule->specified & AVRULE_TYPE) && validate_simpletype(classperm->data, p, flavors))
+				goto bad;
+		}
+
 		if (avrule->specified & AVRULE_XPERMS) {
 			if (!avrule->xperms)
 				goto bad;
@@ -885,6 +951,9 @@ static int validate_cond_expr(sepol_handle_t *handle, const struct cond_expr *ex
 {
 	int depth = -1;
 
+	if (!expr)
+		goto bad;
+
 	for (; expr; expr = expr->next) {
 		switch(expr->expr_type) {
 		case COND_BOOL:
@@ -922,7 +991,7 @@ bad:
 	return -1;
 }
 
-static int validate_cond_list(sepol_handle_t *handle, const cond_list_t *cond, validate_t flavors[])
+static int validate_cond_list(sepol_handle_t *handle, const cond_list_t *cond, const policydb_t *p, validate_t flavors[])
 {
 	for (; cond; cond = cond->next) {
 		if (validate_cond_expr(handle, cond->expr, &flavors[SYM_BOOLS]))
@@ -931,12 +1000,28 @@ static int validate_cond_list(sepol_handle_t *handle, const cond_list_t *cond, v
 			goto bad;
 		if (validate_cond_av_list(handle, cond->false_list, flavors))
 			goto bad;
-		if (validate_avrules(handle, cond->avtrue_list, 1, flavors))
+		if (validate_avrules(handle, cond->avtrue_list, 1, p, flavors))
 			goto bad;
-		if (validate_avrules(handle, cond->avfalse_list, 1, flavors))
+		if (validate_avrules(handle, cond->avfalse_list, 1, p, flavors))
 			goto bad;
 		if (validate_bool_id_array(handle, cond->bool_ids, cond->nbools, &flavors[SYM_BOOLS]))
 			goto bad;
+
+		switch (cond->cur_state) {
+		case 0:
+		case 1:
+			break;
+		default:
+			goto bad;
+		}
+
+		switch (cond->flags) {
+		case 0:
+		case COND_NODE_FLAGS_TUNABLE:
+			break;
+		default:
+			goto bad;
+		}
 	}
 
 	return 0;
@@ -992,6 +1077,8 @@ static int validate_filename_trans(hashtab_key_t k, hashtab_datum_t d, void *arg
 		goto bad;
 	if (validate_value(ftk->tclass, &flavors[SYM_CLASSES]))
 		goto bad;
+	if (!ftd)
+		goto bad;
 	for (; ftd; ftd = ftd->next) {
 		if (validate_ebitmap(&ftd->stypes, &flavors[SYM_TYPES]))
 			goto bad;
@@ -1046,6 +1133,10 @@ static int validate_ocontexts(sepol_handle_t *handle, const policydb_t *p, valid
 					if (validate_context(&octx->context[1], flavors, p->mls))
 						goto bad;
 					break;
+				case OCON_PORT:
+					if (octx->u.port.low_port > octx->u.port.high_port)
+						goto bad;
+					break;
 				case OCON_FSUSE:
 					switch (octx->v.behavior) {
 					case SECURITY_FS_USE_XATTR:
@@ -1076,7 +1167,12 @@ static int validate_genfs(sepol_handle_t *handle, const policydb_t *p, validate_
 		for (octx = genfs->head; octx; octx = octx->next) {
 			if (validate_context(&octx->context[0], flavors, p->mls))
 				goto bad;
+			if (octx->v.sclass && validate_value(octx->v.sclass, &flavors[SYM_CLASSES]))
+				goto bad;
 		}
+
+		if (!genfs->fstype)
+			goto bad;
 	}
 
 	return 0;
@@ -1173,7 +1269,7 @@ bad:
 }
 
 
-static int validate_filename_trans_rules(sepol_handle_t *handle, const filename_trans_rule_t *filename_trans, validate_t flavors[])
+static int validate_filename_trans_rules(sepol_handle_t *handle, const filename_trans_rule_t *filename_trans, const policydb_t *p, validate_t flavors[])
 {
 	for (; filename_trans; filename_trans = filename_trans->next) {
 		if (validate_type_set(&filename_trans->stypes, &flavors[SYM_TYPES]))
@@ -1182,7 +1278,7 @@ static int validate_filename_trans_rules(sepol_handle_t *handle, const filename_
 			goto bad;
 		if (validate_value(filename_trans->tclass,&flavors[SYM_CLASSES] ))
 			goto bad;
-		if (validate_value(filename_trans->otype, &flavors[SYM_TYPES]))
+		if (validate_simpletype(filename_trans->otype, p, flavors))
 			goto bad;
 
 		/* currently only the RULE_SELF flag can be set */
@@ -1211,15 +1307,15 @@ static int validate_symtabs(sepol_handle_t *handle, const symtab_t symtabs[], va
 	return 0;
 }
 
-static int validate_avrule_blocks(sepol_handle_t *handle, const avrule_block_t *avrule_block, validate_t flavors[])
+static int validate_avrule_blocks(sepol_handle_t *handle, const avrule_block_t *avrule_block, const policydb_t *p, validate_t flavors[])
 {
 	const avrule_decl_t *decl;
 
 	for (; avrule_block; avrule_block = avrule_block->next) {
 		for (decl = avrule_block->branch_list; decl != NULL; decl = decl->next) {
-			if (validate_cond_list(handle, decl->cond_list, flavors))
+			if (validate_cond_list(handle, decl->cond_list, p, flavors))
 				goto bad;
-			if (validate_avrules(handle, decl->avrules, 0, flavors))
+			if (validate_avrules(handle, decl->avrules, 0, p, flavors))
 				goto bad;
 			if (validate_role_trans_rules(handle, decl->role_tr_rules, flavors))
 				goto bad;
@@ -1231,7 +1327,7 @@ static int validate_avrule_blocks(sepol_handle_t *handle, const avrule_block_t *
 				goto bad;
 			if (validate_scope_index(handle, &decl->declared, flavors))
 				goto bad;
-			if (validate_filename_trans_rules(handle, decl->filename_trans_rules, flavors))
+			if (validate_filename_trans_rules(handle, decl->filename_trans_rules, p, flavors))
 				goto bad;
 			if (validate_symtabs(handle, decl->symtab, flavors))
 				goto bad;
@@ -1259,7 +1355,7 @@ static int validate_permissives(sepol_handle_t *handle, const policydb_t *p, val
 	unsigned i;
 
 	ebitmap_for_each_positive_bit(&p->permissive_map, node, i) {
-		if (validate_value(i, &flavors[SYM_TYPES]))
+		if (validate_simpletype(i, p, flavors))
 			goto bad;
 	}
 
@@ -1270,6 +1366,61 @@ bad:
 	return -1;
 }
 
+static int validate_range_transition(hashtab_key_t key, hashtab_datum_t data, void *args)
+{
+	const range_trans_t *rt = (const range_trans_t *)key;
+	const mls_range_t *r = data;
+	const map_arg_t *margs = args;
+	const validate_t *flavors = margs->flavors;
+
+	if (validate_value(rt->source_type, &flavors[SYM_TYPES]))
+		goto bad;
+	if (validate_value(rt->target_type, &flavors[SYM_TYPES]))
+		goto bad;
+	if (validate_value(rt->target_class, &flavors[SYM_CLASSES]))
+		goto bad;
+
+	if (validate_mls_range(r, &flavors[SYM_LEVELS], &flavors[SYM_CATS]))
+		goto bad;
+
+	return 0;
+
+bad:
+	return -1;
+}
+
+static int validate_range_transitions(sepol_handle_t *handle, const policydb_t *p, validate_t flavors[])
+{
+	map_arg_t margs = { flavors, handle, p };
+
+	if (hashtab_map(p->range_tr, validate_range_transition, &margs)) {
+		ERR(handle, "Invalid range transition");
+			return -1;
+	}
+
+	return 0;
+}
+
+static int validate_typeattr_map(sepol_handle_t *handle, const policydb_t *p, validate_t flavors[])
+{
+	const ebitmap_t *maps = p->type_attr_map;
+	unsigned int i;
+
+	if (p->policy_type == POLICY_KERN) {
+		for (i = 0; i < p->p_types.nprim; i++) {
+			if (validate_ebitmap(&maps[i], &flavors[SYM_TYPES]))
+				goto bad;
+		}
+	} else if (maps)
+		goto bad;
+
+	return 0;
+
+bad:
+	ERR(handle, "Invalid type attr map");
+	return -1;
+}
+
 static int validate_properties(sepol_handle_t *handle, const policydb_t *p)
 {
 	switch (p->policy_type) {
@@ -1341,10 +1492,10 @@ int policydb_validate(sepol_handle_t *handle, const policydb_t *p)
 		goto bad;
 
 	if (p->policy_type == POLICY_KERN) {
-		if (validate_avtab(handle, &p->te_avtab, flavors))
+		if (validate_avtab(handle, &p->te_avtab, p, flavors))
 			goto bad;
 		if (p->policyvers >= POLICYDB_VERSION_BOOL)
-			if (validate_cond_list(handle, p->cond_list, flavors))
+			if (validate_cond_list(handle, p->cond_list, p, flavors))
 				goto bad;
 		if (validate_role_transes(handle, p->role_tr, flavors))
 			goto bad;
@@ -1354,7 +1505,7 @@ int policydb_validate(sepol_handle_t *handle, const policydb_t *p)
 			if (validate_filename_trans_hashtab(handle, p->filename_trans, flavors))
 				goto bad;
 	} else {
-		if (validate_avrule_blocks(handle, p->global, flavors))
+		if (validate_avrule_blocks(handle, p->global, p, flavors))
 			goto bad;
 	}
 
@@ -1376,6 +1527,14 @@ int policydb_validate(sepol_handle_t *handle, const policydb_t *p)
 	if (validate_permissives(handle, p, flavors))
 		goto bad;
 
+	if (validate_range_transitions(handle, p, flavors))
+		goto bad;
+
+	if (p->policyvers >= POLICYDB_VERSION_AVTAB) {
+		if (validate_typeattr_map(handle, p, flavors))
+			goto bad;
+	}
+
 	validate_array_destroy(flavors);
 
 	return 0;
-- 
2.36.1

