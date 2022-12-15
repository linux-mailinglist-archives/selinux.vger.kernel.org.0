Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E84264E33F
	for <lists+selinux@lfdr.de>; Thu, 15 Dec 2022 22:34:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229462AbiLOVel (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Thu, 15 Dec 2022 16:34:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229665AbiLOVek (ORCPT
        <rfc822;selinux@vger.kernel.org>); Thu, 15 Dec 2022 16:34:40 -0500
Received: from mail-vs1-xe2e.google.com (mail-vs1-xe2e.google.com [IPv6:2607:f8b0:4864:20::e2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F1B61CB37
        for <selinux@vger.kernel.org>; Thu, 15 Dec 2022 13:34:39 -0800 (PST)
Received: by mail-vs1-xe2e.google.com with SMTP id 3so513082vsq.7
        for <selinux@vger.kernel.org>; Thu, 15 Dec 2022 13:34:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LYjyO52P6QGBFWDmXclbGc+7Ys5LWI3B/+GmJNH7wFw=;
        b=M1FLjr1rsfoGX6tcZ+O/1lVOQBVHL74282rDJ4q98R6FAqddqpNRvLHQ0OL+L5eS4L
         LHH2uGa9QESwFeEAlUmvAhw6Csq80tqOwSi3P21+lcsHRqMJEGuVhRz89lyakurjvD+g
         fXdRJ6JdS8Ng9qxoBh0G+Hrr9H4wUiI+nLKHRMcpgXYWfRJAA0jYZzRbWcNW5tsKFSGi
         ZnXfG9rxGJQPxiVjUOEd5wMzCfJDomWaymJxRApI08sbtbPfLvxEuiwZgTrsGn9W1TIf
         s4foGJsM9Ir3by4BQHZEjnFQebkvMCZA1ROnq9EFFNGMAOhCPukbvesgSqF5PBFqUiE0
         6OGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LYjyO52P6QGBFWDmXclbGc+7Ys5LWI3B/+GmJNH7wFw=;
        b=R/Z7kGPhjGhqt/zgOklTXxr7at+01Dwpww2lqkxFvDUjRnut/KhV38KEun3gF8QnjD
         nGIhAhjSkSOkKx+JmYYtHA6lp+oXrtjRG9SaaM8JC2NGqQhIfjIk6kolSUCIQ6Gr/iY2
         cSEeP8TXe7PsVPkBXKKGa96Ls8/SAT8in1SOebTdIb9ZJIOpBTGn8QBFPyL+2gjkKaor
         fISnhBRPvn3++NCrwgx31u/wYokY3r1q7Pu3UScJDMGHz0h8UyI+UMCUY8NudC23qTzq
         N68ur94Mhpho/3+Usviqr8p2HnVh2ZDPtDOyCBdM1JhR1NTdHIBQpVoGjdQO0qmBg4P3
         pV8Q==
X-Gm-Message-State: ANoB5plJG0u7AhRWO5d0kjaEBOZ0ostCRBj/EpzyutrpH6FGME3vX3fG
        MCCWVr/8ToRmCSiXk3fn/u5Qz3blObE=
X-Google-Smtp-Source: AA0mqf4kD1RV6Boo3SgbBaPd9hDbeJxl9RyLQE4+wB7hyD6q6OJRaiVXJqRCwK5MoC6foe3G3Rsqpg==
X-Received: by 2002:a67:ef94:0:b0:3b3:3f7:623c with SMTP id r20-20020a67ef94000000b003b303f7623cmr19902364vsp.2.1671140077689;
        Thu, 15 Dec 2022 13:34:37 -0800 (PST)
Received: from electric.. (c-73-200-155-132.hsd1.md.comcast.net. [73.200.155.132])
        by smtp.gmail.com with ESMTPSA id w10-20020a05620a424a00b006a6ebde4799sm21066qko.90.2022.12.15.13.34.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Dec 2022 13:34:37 -0800 (PST)
From:   James Carter <jwcart2@gmail.com>
To:     selinux@vger.kernel.org
Cc:     dburgener@linux.microsoft.com, James Carter <jwcart2@gmail.com>
Subject: [RFC PATCH 1/9] libsepol/cil: Parse and add deny rule to AST, but do not process
Date:   Thu, 15 Dec 2022 16:34:21 -0500
Message-Id: <20221215213429.998948-2-jwcart2@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221215213429.998948-1-jwcart2@gmail.com>
References: <20221215213429.998948-1-jwcart2@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Adds the ability to parse a deny rule, add it to the AST, and
write it out when writing the AST, but the deny rule is otherwise
ignored and does nothing.

When it is fully supported, the deny rule will work like a neverallow
except that it will remove permissions rather than give an error.

Signed-off-by: James Carter <jwcart2@gmail.com>
---
 libsepol/cil/src/cil.c             | 18 ++++++++++
 libsepol/cil/src/cil_build_ast.c   | 56 ++++++++++++++++++++++++++++++
 libsepol/cil/src/cil_build_ast.h   |  2 ++
 libsepol/cil/src/cil_copy_ast.c    | 19 ++++++++++
 libsepol/cil/src/cil_copy_ast.h    |  1 +
 libsepol/cil/src/cil_flavor.h      |  1 +
 libsepol/cil/src/cil_internal.h    | 10 ++++++
 libsepol/cil/src/cil_reset_ast.c   |  8 +++++
 libsepol/cil/src/cil_resolve_ast.c | 44 +++++++++++++++++++++++
 libsepol/cil/src/cil_resolve_ast.h |  1 +
 libsepol/cil/src/cil_verify.c      |  9 +++++
 libsepol/cil/src/cil_write_ast.c   | 10 ++++++
 12 files changed, 179 insertions(+)

diff --git a/libsepol/cil/src/cil.c b/libsepol/cil/src/cil.c
index 38edcf8e..0b35ad35 100644
--- a/libsepol/cil/src/cil.c
+++ b/libsepol/cil/src/cil.c
@@ -225,6 +225,7 @@ char *CIL_KEY_SRC_CIL;
 char *CIL_KEY_SRC_HLL_LMS;
 char *CIL_KEY_SRC_HLL_LMX;
 char *CIL_KEY_SRC_HLL_LME;
+char *CIL_KEY_DENY_RULE;
 
 static void cil_init_keys(void)
 {
@@ -394,6 +395,7 @@ static void cil_init_keys(void)
 	CIL_KEY_SRC_HLL_LMS = cil_strpool_add("lms");
 	CIL_KEY_SRC_HLL_LMX = cil_strpool_add("lmx");
 	CIL_KEY_SRC_HLL_LME = cil_strpool_add("lme");
+	CIL_KEY_DENY_RULE = cil_strpool_add("deny");
 }
 
 void cil_db_init(struct cil_db **db)
@@ -915,6 +917,9 @@ void cil_destroy_data(void **data, enum cil_flavor flavor)
 	case CIL_PERMISSIONX:
 		cil_destroy_permissionx(*data);
 		break;
+	case CIL_DENY_RULE:
+		cil_destroy_deny_rule(*data);
+		break;
 	case CIL_ROLETRANSITION:
 		cil_destroy_roletransition(*data);
 		break;
@@ -1291,6 +1296,8 @@ const char * cil_node_to_string(struct cil_tree_node *node)
 		break;
 	case CIL_PERMISSIONX:
 		return CIL_KEY_PERMISSIONX;
+	case CIL_DENY_RULE:
+		return CIL_KEY_DENY_RULE;
 	case CIL_ROLETRANSITION:
 		return CIL_KEY_ROLETRANSITION;
 	case CIL_TYPE_RULE:
@@ -2470,6 +2477,17 @@ void cil_permissionx_init(struct cil_permissionx **permx)
 	(*permx)->perms = NULL;
 }
 
+void cil_deny_rule_init(struct cil_deny_rule **rule)
+{
+	*rule = cil_malloc(sizeof(**rule));
+
+	(*rule)->src_str = NULL;
+	(*rule)->src = NULL;
+	(*rule)->tgt_str = NULL;
+	(*rule)->tgt = NULL;
+	(*rule)->classperms = NULL;
+}
+
 void cil_type_rule_init(struct cil_type_rule **type_rule)
 {
 	*type_rule = cil_malloc(sizeof(**type_rule));
diff --git a/libsepol/cil/src/cil_build_ast.c b/libsepol/cil/src/cil_build_ast.c
index 4177c9f6..1afc274f 100644
--- a/libsepol/cil/src/cil_build_ast.c
+++ b/libsepol/cil/src/cil_build_ast.c
@@ -2289,6 +2289,60 @@ exit:
 	return rc;
 }
 
+int cil_gen_deny_rule(struct cil_tree_node *parse_current, struct cil_tree_node *ast_node)
+{
+	enum cil_syntax syntax[] = {
+		CIL_SYN_STRING,
+		CIL_SYN_STRING,
+		CIL_SYN_STRING,
+		CIL_SYN_STRING | CIL_SYN_LIST,
+		CIL_SYN_END
+	};
+	size_t syntax_len = sizeof(syntax)/sizeof(*syntax);
+	struct cil_deny_rule *rule = NULL;
+	int rc = SEPOL_ERR;
+
+	if (parse_current == NULL || ast_node == NULL) {
+		goto exit;
+	}
+
+	rc = __cil_verify_syntax(parse_current, syntax, syntax_len);
+	if (rc != SEPOL_OK) {
+		goto exit;
+	}
+
+	cil_deny_rule_init(&rule);
+
+	rule->src_str = parse_current->next->data;
+	rule->tgt_str = parse_current->next->next->data;
+
+	rc = cil_fill_classperms_list(parse_current->next->next->next, &rule->classperms);
+	if (rc != SEPOL_OK) {
+		goto exit;
+	}
+
+	ast_node->data = rule;
+	ast_node->flavor = CIL_DENY_RULE;
+
+	return SEPOL_OK;
+
+exit:
+	cil_tree_log(parse_current, CIL_ERR, "Bad deny rule");
+	cil_destroy_deny_rule(rule);
+	return rc;
+}
+
+void cil_destroy_deny_rule(struct cil_deny_rule *rule)
+{
+	if (rule == NULL) {
+		return;
+	}
+
+	cil_destroy_classperms_list(&rule->classperms);
+
+	free(rule);
+}
+
 int cil_gen_type_rule(struct cil_tree_node *parse_current, struct cil_tree_node *ast_node, uint32_t rule_kind)
 {
 	enum cil_syntax syntax[] = {
@@ -6365,6 +6419,8 @@ static struct cil_tree_node * parse_statement(struct cil_db *db, struct cil_tree
 		rc = cil_gen_avrulex(parse_current, new_ast_node, CIL_AVRULE_NEVERALLOW);
 	} else if (parse_current->data == CIL_KEY_PERMISSIONX) {
 		rc = cil_gen_permissionx(db, parse_current, new_ast_node);
+	} else if (parse_current->data == CIL_KEY_DENY_RULE) {
+		rc = cil_gen_deny_rule(parse_current, new_ast_node);
 	} else if (parse_current->data == CIL_KEY_TYPETRANSITION) {
 		rc = cil_gen_typetransition(db, parse_current, new_ast_node);
 	} else if (parse_current->data == CIL_KEY_TYPECHANGE) {
diff --git a/libsepol/cil/src/cil_build_ast.h b/libsepol/cil/src/cil_build_ast.h
index fd9053ce..aca84b24 100644
--- a/libsepol/cil/src/cil_build_ast.h
+++ b/libsepol/cil/src/cil_build_ast.h
@@ -116,6 +116,8 @@ void cil_destroy_avrule(struct cil_avrule *rule);
 int cil_gen_avrulex(struct cil_tree_node *parse_current, struct cil_tree_node *ast_node, uint32_t rule_kind);
 int cil_gen_permissionx(struct cil_db *db, struct cil_tree_node *parse_current, struct cil_tree_node *ast_node);
 void cil_destroy_permissionx(struct cil_permissionx *permx);
+int cil_gen_deny_rule(struct cil_tree_node *parse_current, struct cil_tree_node *ast_node);
+void cil_destroy_deny_rule(struct cil_deny_rule *rule);
 int cil_gen_type_rule(struct cil_tree_node *parse_current, struct cil_tree_node *ast_node, uint32_t rule_kind);
 void cil_destroy_type_rule(struct cil_type_rule *rule);
 int cil_gen_type(struct cil_db *db, struct cil_tree_node *parse_current, struct cil_tree_node *ast_node);
diff --git a/libsepol/cil/src/cil_copy_ast.c b/libsepol/cil/src/cil_copy_ast.c
index 17f05021..bc972f03 100644
--- a/libsepol/cil/src/cil_copy_ast.c
+++ b/libsepol/cil/src/cil_copy_ast.c
@@ -854,6 +854,22 @@ static int cil_copy_permissionx(struct cil_db *db, void *data, void **copy, symt
 	return SEPOL_OK;
 }
 
+int cil_copy_deny_rule(__attribute__((unused)) struct cil_db *db, void *data, void **copy, __attribute__((unused)) symtab_t *symtab)
+{
+	struct cil_deny_rule *orig = data;
+	struct cil_deny_rule *new = NULL;
+
+	cil_deny_rule_init(&new);
+
+	new->src_str = orig->src_str;
+	new->tgt_str = orig->tgt_str;
+	cil_copy_classperms_list(orig->classperms, &new->classperms);
+
+	*copy = new;
+
+	return SEPOL_OK;
+}
+
 int cil_copy_type_rule(__attribute__((unused)) struct cil_db *db, void *data, void **copy, __attribute__((unused)) symtab_t *symtab)
 {
 	struct cil_type_rule  *orig = data;
@@ -1860,6 +1876,9 @@ static int __cil_copy_node_helper(struct cil_tree_node *orig, uint32_t *finished
 	case CIL_PERMISSIONX:
 		copy_func = &cil_copy_permissionx;
 		break;
+	case CIL_DENY_RULE:
+		copy_func = &cil_copy_deny_rule;
+		break;
 	case CIL_TYPE_RULE:
 		copy_func = &cil_copy_type_rule;
 		break;
diff --git a/libsepol/cil/src/cil_copy_ast.h b/libsepol/cil/src/cil_copy_ast.h
index a50c3708..9f695ec5 100644
--- a/libsepol/cil/src/cil_copy_ast.h
+++ b/libsepol/cil/src/cil_copy_ast.h
@@ -80,6 +80,7 @@ int cil_copy_nametypetransition(struct cil_db *db, void *data, void **copy, symt
 int cil_copy_rangetransition(struct cil_db *db, void *data, void **copy, symtab_t *symtab);
 int cil_copy_bool(struct cil_db *db, void *data, void **copy, symtab_t *symtab);
 int cil_copy_avrule(struct cil_db *db, void *data, void **copy, symtab_t *symtab);
+int cil_copy_deny_rule(__attribute__((unused)) struct cil_db *db, void *data, void **copy, __attribute__((unused)) symtab_t *symtab);
 int cil_copy_type_rule(struct cil_db *db, void *data, void **copy, symtab_t *symtab);
 int cil_copy_sens(struct cil_db *db, void *data, void **copy, symtab_t *symtab);
 int cil_copy_sensalias(struct cil_db *db, void *data, void **copy, symtab_t *symtab);
diff --git a/libsepol/cil/src/cil_flavor.h b/libsepol/cil/src/cil_flavor.h
index c2f0cee7..89ab7875 100644
--- a/libsepol/cil/src/cil_flavor.h
+++ b/libsepol/cil/src/cil_flavor.h
@@ -86,6 +86,7 @@ enum cil_flavor {
 	CIL_ROLEALLOW,
 	CIL_AVRULE,
 	CIL_AVRULEX,
+	CIL_DENY_RULE,
 	CIL_ROLETRANSITION,
 	CIL_TYPE_RULE,
 	CIL_NAMETYPETRANSITION,
diff --git a/libsepol/cil/src/cil_internal.h b/libsepol/cil/src/cil_internal.h
index a7604762..b15cbf64 100644
--- a/libsepol/cil/src/cil_internal.h
+++ b/libsepol/cil/src/cil_internal.h
@@ -242,6 +242,7 @@ extern char *CIL_KEY_SRC_CIL;
 extern char *CIL_KEY_SRC_HLL_LMS;
 extern char *CIL_KEY_SRC_HLL_LMX;
 extern char *CIL_KEY_SRC_HLL_LME;
+extern char *CIL_KEY_DENY_RULE;
 
 /*
 	Symbol Table Array Indices
@@ -632,6 +633,14 @@ struct cil_permissionx {
 	ebitmap_t *perms;
 };
 
+struct cil_deny_rule {
+	char *src_str;
+	void *src; /* type, alias, or attribute */
+	char *tgt_str;
+	void *tgt; /* type, alias, or attribute */
+	struct cil_list *classperms;
+};
+
 #define CIL_TYPE_TRANSITION 16
 #define CIL_TYPE_MEMBER     32
 #define CIL_TYPE_CHANGE     64
@@ -1037,6 +1046,7 @@ void cil_tunable_init(struct cil_tunable **ciltun);
 void cil_tunif_init(struct cil_tunableif **tif);
 void cil_avrule_init(struct cil_avrule **avrule);
 void cil_permissionx_init(struct cil_permissionx **permx);
+void cil_deny_rule_init(struct cil_deny_rule **rule);
 void cil_type_rule_init(struct cil_type_rule **type_rule);
 void cil_roletransition_init(struct cil_roletransition **roletrans);
 void cil_roleallow_init(struct cil_roleallow **role_allow);
diff --git a/libsepol/cil/src/cil_reset_ast.c b/libsepol/cil/src/cil_reset_ast.c
index 0864d7ef..9069317e 100644
--- a/libsepol/cil/src/cil_reset_ast.c
+++ b/libsepol/cil/src/cil_reset_ast.c
@@ -218,6 +218,11 @@ static void cil_reset_avrule(struct cil_avrule *rule)
 	cil_reset_classperms_list(rule->perms.classperms);
 }
 
+static void cil_reset_deny_rule(struct cil_deny_rule *rule)
+{
+	cil_reset_classperms_list(rule->classperms);
+}
+
 static void cil_reset_rangetransition(struct cil_rangetransition *rangetrans)
 {
 	if (rangetrans->range_str == NULL) {
@@ -545,6 +550,9 @@ static int __cil_reset_node(struct cil_tree_node *node,  __attribute__((unused))
 	case CIL_AVRULE:
 		cil_reset_avrule(node->data);
 		break;
+	case CIL_DENY_RULE:
+		cil_reset_deny_rule(node->data);
+		break;
 	case CIL_SENS:
 		cil_reset_sens(node->data);
 		break;
diff --git a/libsepol/cil/src/cil_resolve_ast.c b/libsepol/cil/src/cil_resolve_ast.c
index f5e22c97..941bdde4 100644
--- a/libsepol/cil/src/cil_resolve_ast.c
+++ b/libsepol/cil/src/cil_resolve_ast.c
@@ -371,6 +371,47 @@ exit:
 	return rc;
 }
 
+int cil_resolve_deny_rule(struct cil_tree_node *current, void *extra_args)
+{
+	struct cil_args_resolve *args = extra_args;
+	struct cil_db *db = NULL;
+
+	struct cil_deny_rule *rule = current->data;
+	struct cil_symtab_datum *src_datum = NULL;
+	struct cil_symtab_datum *tgt_datum = NULL;
+	int rc = SEPOL_ERR;
+
+	if (args != NULL) {
+		db = args->db;
+	}
+
+	rc = cil_resolve_name(current, rule->src_str, CIL_SYM_TYPES, args, &src_datum);
+	if (rc != SEPOL_OK) {
+		goto exit;
+	}
+	rule->src = src_datum;
+
+	if (rule->tgt_str == CIL_KEY_SELF) {
+		rule->tgt = db->selftype;
+	} else {
+		rc = cil_resolve_name(current, rule->tgt_str, CIL_SYM_TYPES, args, &tgt_datum);
+		if (rc != SEPOL_OK) {
+			goto exit;
+		}
+		rule->tgt = tgt_datum;
+	}
+
+	rc = cil_resolve_classperms_list(current, rule->classperms, extra_args);
+	if (rc != SEPOL_OK) {
+		goto exit;
+	}
+
+	return SEPOL_OK;
+
+exit:
+	return rc;
+}
+
 int cil_resolve_type_rule(struct cil_tree_node *current, void *extra_args)
 {
 	struct cil_args_resolve *args = extra_args;
@@ -3779,6 +3820,9 @@ static int __cil_resolve_ast_node(struct cil_tree_node *node, void *extra_args)
 		case CIL_PERMISSIONX:
 			rc = cil_resolve_permissionx(node, (struct cil_permissionx*)node->data, args);
 			break;
+		case CIL_DENY_RULE:
+			rc = cil_resolve_deny_rule(node, args);
+			break;
 		case CIL_TYPE_RULE:
 			rc = cil_resolve_type_rule(node, args);
 			break;
diff --git a/libsepol/cil/src/cil_resolve_ast.h b/libsepol/cil/src/cil_resolve_ast.h
index 1d971fd6..78357993 100644
--- a/libsepol/cil/src/cil_resolve_ast.h
+++ b/libsepol/cil/src/cil_resolve_ast.h
@@ -40,6 +40,7 @@ int cil_resolve_classperms(struct cil_tree_node *current, struct cil_classperms
 int cil_resolve_classpermissionset(struct cil_tree_node *current, struct cil_classpermissionset *cps, void *extra_args);
 int cil_resolve_classperms_list(struct cil_tree_node *current, struct cil_list *cp_list, void *extra_args);
 int cil_resolve_avrule(struct cil_tree_node *current, void *extra_args);
+int cil_resolve_deny_rule(struct cil_tree_node *current, void *extra_args);
 int cil_resolve_type_rule(struct cil_tree_node *current, void *extra_args);
 int cil_resolve_typeattributeset(struct cil_tree_node *current, void *extra_args);
 int cil_resolve_typealias(struct cil_tree_node *current, void *extra_args);
diff --git a/libsepol/cil/src/cil_verify.c b/libsepol/cil/src/cil_verify.c
index 4640dc59..70cebc16 100644
--- a/libsepol/cil/src/cil_verify.c
+++ b/libsepol/cil/src/cil_verify.c
@@ -1040,6 +1040,15 @@ static int __cil_verify_booleanif_helper(struct cil_tree_node *node, __attribute
 		}
 		break;
 	}
+	case CIL_DENY_RULE:
+		if (bif->preserved_tunable) {
+			cil_tree_log(node, CIL_ERR, "Not allowed to have a deny rule in a tunableif block (treated as a booleanif due to preserve-tunables)");
+		} else {
+			cil_tree_log(node, CIL_ERR, "Not allowed to have deny rule in a booleanif block");
+		}
+		rc = SEPOL_ERR;
+		goto exit;
+		break;
 	case CIL_TYPE_RULE: /*
 	struct cil_type_rule *typerule = NULL;
 	struct cil_tree_node *temp_node = NULL;
diff --git a/libsepol/cil/src/cil_write_ast.c b/libsepol/cil/src/cil_write_ast.c
index b75784ef..4da7a77c 100644
--- a/libsepol/cil/src/cil_write_ast.c
+++ b/libsepol/cil/src/cil_write_ast.c
@@ -1144,6 +1144,16 @@ void cil_write_ast_node(FILE *out, struct cil_tree_node *node)
 		fprintf(out, ")\n");
 		break;
 	}
+	case CIL_DENY_RULE: {
+		struct cil_deny_rule *rule = node->data;
+		fprintf(out, "(deny ");
+
+		fprintf(out, "%s ", datum_or_str(DATUM(rule->src), rule->src_str));
+		fprintf(out, "%s ", datum_or_str(DATUM(rule->tgt), rule->tgt_str));
+		write_classperms_list(out, rule->classperms);
+		fprintf(out, ")\n");
+		break;
+	}
 	case CIL_TYPE_RULE: {
 		struct cil_type_rule *rule = node->data;
 		if (rule->rule_kind == AVRULE_TRANSITION)
-- 
2.38.1

