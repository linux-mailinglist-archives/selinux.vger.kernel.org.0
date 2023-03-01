Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A7966A6E8C
	for <lists+selinux@lfdr.de>; Wed,  1 Mar 2023 15:35:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230207AbjCAOfw (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Wed, 1 Mar 2023 09:35:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229905AbjCAOfv (ORCPT
        <rfc822;selinux@vger.kernel.org>); Wed, 1 Mar 2023 09:35:51 -0500
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com [IPv6:2607:f8b0:4864:20::82d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1188332532
        for <selinux@vger.kernel.org>; Wed,  1 Mar 2023 06:35:49 -0800 (PST)
Received: by mail-qt1-x82d.google.com with SMTP id r5so14388410qtp.4
        for <selinux@vger.kernel.org>; Wed, 01 Mar 2023 06:35:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677681348;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xRn+PdacFqOLHjZmyuCEKGbbNO1uNbdKUmaZmRWYHh4=;
        b=q7NK3KUj8V7dLpS0GbyCk5ouVe9QZYfPhci+WwKoY0UzA3WYXvUVU0bwAmza7ilJXm
         uJhpMEov8OfB3gDAt01Z9ridkK6KvSgWn7ZZo4+4MqUF5NOUUlz/AK4BLMb+bhYYViCd
         UB6Z58ZG1eItuKj5jwwB6w1JZYw6a4tzdPdrZPYmlPWTrvrFDkwxI+b+kG+A2yxyYSrT
         NyEU3kRZFY/ph1zFlNGHeJ6vrLCjIICrS42KdbKpQ7g5qnDUMS3f/BrCKmXu3Sdw3xPn
         NwilIrw+PTQiJxAKPrVEoSXgcZCxVCka33C0f4fYJuDrwq4fINhhYseZQf/MpZ2VyTpB
         whrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677681348;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xRn+PdacFqOLHjZmyuCEKGbbNO1uNbdKUmaZmRWYHh4=;
        b=5S8JHtGoyE8ItnFUZ2MfRziwhKWvog7XB+ZFv2BBIIb+lqFsIpW/7eGx3lThSsx135
         BKTEqvWyr2KQo5VNTdYdaZfcGEgsgYLhlDdDrZe5Y6msMzWpqJuPANGb8VR3jPQZ5Q1E
         wXmasFyXFIxm0VIGA+hsyI4WjvV88gWGBuad/QE3fKnn9Tc/R9TNk/wz5B8UtUpU2gXP
         9QNQUvyOHub5GtQ9gM/6bbx2UMcRGzCiJmp+RRE3IGKNZQNg+gCKpEjbRxAFpgPR7LAp
         A/id+saBZhCz77mf9UrjGSCBkKwwIQgfdK/rr2j6zIBTAgwrwdFYwSp25IdWC1qqhZN3
         Xlyw==
X-Gm-Message-State: AO0yUKXnFagFXLHf+XkXbOo8DzZYu3BaHsensL/RqQv35vOci68YEOGT
        Rd5shbh7suPVro1JgRh8J+sHY9kFzOs=
X-Google-Smtp-Source: AK7set+PDrLfY0CzTwpkS9zzxsBmcfS7C/W7dYKwMl71qh07rWmdchvu/vWZD+8UIPAp9RpWjHxiSQ==
X-Received: by 2002:a05:622a:50:b0:3bf:cfe8:f8f5 with SMTP id y16-20020a05622a005000b003bfcfe8f8f5mr11590143qtw.41.1677681347722;
        Wed, 01 Mar 2023 06:35:47 -0800 (PST)
Received: from electric.. (c-73-172-54-2.hsd1.md.comcast.net. [73.172.54.2])
        by smtp.gmail.com with ESMTPSA id r196-20020a3744cd000000b0071a02d712b0sm9158324qka.99.2023.03.01.06.35.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Mar 2023 06:35:47 -0800 (PST)
From:   James Carter <jwcart2@gmail.com>
To:     selinux@vger.kernel.org
Cc:     James Carter <jwcart2@gmail.com>
Subject: [PATCH 2/6] libsepol/cil: Add notself and other support to CIL
Date:   Wed,  1 Mar 2023 09:35:43 -0500
Message-Id: <20230301143543.701872-1-jwcart2@gmail.com>
X-Mailer: git-send-email 2.39.2
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

Like "self", both of these reserved words can be used as a target
in an access vector rule. "notself" means all types other than
the source type. "other" is meant to be used with an attribute and
its use results in the rule being expanded with each type of the
attribute being used as the source type with each of the other types
being used as the target type. Using "other" with just a type will
result in no rule.

Example 1
  (allow TYPE1 notself (CLASS (PERM)))

This rule is expanded to a number of rules with TYPE1 as the source
and every type except for TYPE1 as the target.

Example 2
  (allow ATTR1 notself (CLASS (PERM)))

Like Example 1, this rule will be expanded to each type in ATTR1
being the source with every type except for the type used as the
source being the target.

Example 3
  (allow TYPE1 other (CLASS (PERM)))

This expands to no rule.

Example 4
  (allow ATTR1 other (CLASS (PERM)))

Like Example 2, but the target types will be limited to the types
in the attribute ATTR1 instead of all types. So if ATTR1 has the
type t1, t2, and t3, then this rule expands to the following rules.
  (allow t1 t2 (CLASS (PERM)))
  (allow t1 t3 (CLASS (PERM)))
  (allow t2 t1 (CLASS (PERM)))
  (allow t2 t3 (CLASS (PERM)))
  (allow t3 t1 (CLASS (PERM)))
  (allow t3 t2 (CLASS (PERM)))

Signed-off-by: James Carter <jwcart2@gmail.com>
---
v2: Name the keyword "other" rather than "minusself"
    Use ebitmap_is_empty() [Which didn't exist when the patch was originally created.]

 libsepol/cil/src/cil.c             |  12 ++
 libsepol/cil/src/cil_binary.c      |  91 ++++++++++++-
 libsepol/cil/src/cil_build_ast.c   |  10 +-
 libsepol/cil/src/cil_find.c        | 205 +++++++++++++++++++++++++----
 libsepol/cil/src/cil_internal.h    |   4 +
 libsepol/cil/src/cil_resolve_ast.c |   4 +
 libsepol/cil/src/cil_verify.c      |   3 +-
 7 files changed, 299 insertions(+), 30 deletions(-)

diff --git a/libsepol/cil/src/cil.c b/libsepol/cil/src/cil.c
index 38edcf8e..ed97ff44 100644
--- a/libsepol/cil/src/cil.c
+++ b/libsepol/cil/src/cil.c
@@ -84,6 +84,8 @@ char *CIL_KEY_CONS_INCOMP;
 char *CIL_KEY_CONDTRUE;
 char *CIL_KEY_CONDFALSE;
 char *CIL_KEY_SELF;
+char *CIL_KEY_NOTSELF;
+char *CIL_KEY_OTHER;
 char *CIL_KEY_OBJECT_R;
 char *CIL_KEY_STAR;
 char *CIL_KEY_TCP;
@@ -253,6 +255,8 @@ static void cil_init_keys(void)
 	CIL_KEY_CONDTRUE = cil_strpool_add("true");
 	CIL_KEY_CONDFALSE = cil_strpool_add("false");
 	CIL_KEY_SELF = cil_strpool_add("self");
+	CIL_KEY_NOTSELF = cil_strpool_add("notself");
+	CIL_KEY_OTHER = cil_strpool_add("other");
 	CIL_KEY_OBJECT_R = cil_strpool_add("object_r");
 	CIL_KEY_STAR = cil_strpool_add("*");
 	CIL_KEY_UDP = cil_strpool_add("udp");
@@ -430,6 +434,12 @@ void cil_db_init(struct cil_db **db)
 	cil_type_init(&(*db)->selftype);
 	(*db)->selftype->datum.name = CIL_KEY_SELF;
 	(*db)->selftype->datum.fqn = CIL_KEY_SELF;
+	cil_type_init(&(*db)->notselftype);
+	(*db)->notselftype->datum.name = CIL_KEY_NOTSELF;
+	(*db)->notselftype->datum.fqn = CIL_KEY_NOTSELF;
+	cil_type_init(&(*db)->othertype);
+	(*db)->othertype->datum.name = CIL_KEY_OTHER;
+	(*db)->othertype->datum.fqn = CIL_KEY_OTHER;
 	(*db)->num_types_and_attrs = 0;
 	(*db)->num_classes = 0;
 	(*db)->num_types = 0;
@@ -483,6 +493,8 @@ void cil_db_destroy(struct cil_db **db)
 	cil_list_destroy(&(*db)->names, CIL_TRUE);
 
 	cil_destroy_type((*db)->selftype);
+	cil_destroy_type((*db)->notselftype);
+	cil_destroy_type((*db)->othertype);
 
 	cil_strpool_destroy();
 	free((*db)->val_to_type);
diff --git a/libsepol/cil/src/cil_binary.c b/libsepol/cil/src/cil_binary.c
index 40615db2..38cba333 100644
--- a/libsepol/cil/src/cil_binary.c
+++ b/libsepol/cil/src/cil_binary.c
@@ -1519,6 +1519,46 @@ static int __cil_avrule_to_avtab(policydb_t *pdb, const struct cil_db *db, struc
 			}
 		}
 		ebitmap_destroy(&src_bitmap);
+	} else if (tgt->fqn == CIL_KEY_NOTSELF) {
+		rc = __cil_expand_type(src, &src_bitmap);
+		if (rc != SEPOL_OK) {
+			goto exit;
+		}
+
+		ebitmap_for_each_positive_bit(&src_bitmap, snode, s) {
+			src = DATUM(db->val_to_type[s]);
+			for (t = 0; t < (unsigned int)db->num_types; t++) {
+				if (s != t) {
+					tgt = DATUM(db->val_to_type[t]);
+					rc = __cil_avrule_expand(pdb, kind, src, tgt, classperms, cond_node, cond_flavor);
+					if (rc != SEPOL_OK) {
+						ebitmap_destroy(&src_bitmap);
+						goto exit;
+					}
+				}
+			}
+		}
+		ebitmap_destroy(&src_bitmap);
+	} else if (tgt->fqn == CIL_KEY_OTHER) {
+		rc = __cil_expand_type(src, &src_bitmap);
+		if (rc != SEPOL_OK) {
+			goto exit;
+		}
+
+		ebitmap_for_each_positive_bit(&src_bitmap, snode, s) {
+			src = DATUM(db->val_to_type[s]);
+			ebitmap_for_each_positive_bit(&src_bitmap, tnode, t) {
+				if (s != t) {
+					tgt = DATUM(db->val_to_type[t]);
+					rc = __cil_avrule_expand(pdb, kind, src, tgt, classperms, cond_node, cond_flavor);
+					if (rc != SEPOL_OK) {
+						ebitmap_destroy(&src_bitmap);
+						goto exit;
+					}
+				}
+			}
+		}
+		ebitmap_destroy(&src_bitmap);
 	} else {
 		int expand_src = __cil_should_expand_attribute(db, src);
 		int expand_tgt = __cil_should_expand_attribute(db, tgt);
@@ -1875,10 +1915,51 @@ static int cil_avrulex_to_hashtable(policydb_t *pdb, const struct cil_db *db, st
 			src = DATUM(db->val_to_type[s]);
 			rc = __cil_avrulex_to_hashtable_helper(pdb, kind, src, src, cil_avrulex->perms.x.permx, args);
 			if (rc != SEPOL_OK) {
+				ebitmap_destroy(&src_bitmap);
 				goto exit;
 			}
 		}
 		ebitmap_destroy(&src_bitmap);
+	} else if (tgt->fqn == CIL_KEY_NOTSELF) {
+		rc = __cil_expand_type(src, &src_bitmap);
+		if (rc != SEPOL_OK) {
+			goto exit;
+		}
+
+		ebitmap_for_each_positive_bit(&src_bitmap, snode, s) {
+			src = DATUM(db->val_to_type[s]);
+			for (t = 0; t < (unsigned int)db->num_types; t++) {
+				if (s != t) {
+					tgt = DATUM(db->val_to_type[t]);
+					rc = __cil_avrulex_to_hashtable_helper(pdb, kind, src, tgt, cil_avrulex->perms.x.permx, args);
+					if (rc != SEPOL_OK) {
+						ebitmap_destroy(&src_bitmap);
+						goto exit;
+					}
+				}
+			}
+		}
+		ebitmap_destroy(&src_bitmap);
+	} else if (tgt->fqn == CIL_KEY_OTHER) {
+		rc = __cil_expand_type(src, &src_bitmap);
+		if (rc != SEPOL_OK) {
+			goto exit;
+		}
+
+		ebitmap_for_each_positive_bit(&src_bitmap, snode, s) {
+			src = DATUM(db->val_to_type[s]);
+			ebitmap_for_each_positive_bit(&src_bitmap, tnode, t) {
+				if (s != t) {
+					tgt = DATUM(db->val_to_type[t]);
+					rc = __cil_avrulex_to_hashtable_helper(pdb, kind, src, tgt, cil_avrulex->perms.x.permx, args);
+					if (rc != SEPOL_OK) {
+						ebitmap_destroy(&src_bitmap);
+						goto exit;
+					}
+				}
+			}
+		}
+		ebitmap_destroy(&src_bitmap);
 	} else {
 		int expand_src = __cil_should_expand_attribute(db, src);
 		int expand_tgt = __cil_should_expand_attribute(db, tgt);
@@ -4813,8 +4894,16 @@ static int cil_check_neverallow(const struct cil_db *db, policydb_t *pdb, struct
 
 	if (tgt->fqn == CIL_KEY_SELF) {
 		rule->flags = RULE_SELF;
+	} else if (tgt->fqn == CIL_KEY_NOTSELF) {
+		rule->flags = RULE_NOTSELF;
+	} else if (tgt->fqn == CIL_KEY_OTHER) {
+		rule->flags = RULE_NOTSELF;
+		rc = __cil_add_sepol_type(pdb, db, cil_rule->src, &rule->ttypes.types);
+		if (rc != SEPOL_OK) {
+			goto exit;
+		}
 	} else {
-		rc = __cil_add_sepol_type(pdb, db, cil_rule->tgt, &rule->ttypes.types);
+		rc = __cil_add_sepol_type(pdb, db, tgt, &rule->ttypes.types);
 		if (rc != SEPOL_OK) {
 			goto exit;
 		}
diff --git a/libsepol/cil/src/cil_build_ast.c b/libsepol/cil/src/cil_build_ast.c
index 4177c9f6..ca9f80c7 100644
--- a/libsepol/cil/src/cil_build_ast.c
+++ b/libsepol/cil/src/cil_build_ast.c
@@ -3126,9 +3126,13 @@ int cil_gen_aliasactual(struct cil_db *db, struct cil_tree_node *parse_current,
 		goto exit;
 	}
 
-	if ((flavor == CIL_TYPEALIAS && parse_current->next->data == CIL_KEY_SELF) || parse_current->next->next->data == CIL_KEY_SELF) {
-		cil_log(CIL_ERR, "The keyword '%s' is reserved\n", CIL_KEY_SELF);
-		rc = SEPOL_ERR;
+	rc = cil_verify_name(db, parse_current->next->data, flavor);
+	if (rc != SEPOL_OK) {
+		goto exit;
+	}
+
+	rc = cil_verify_name(db, parse_current->next->next->data, flavor);
+	if (rc != SEPOL_OK) {
 		goto exit;
 	}
 
diff --git a/libsepol/cil/src/cil_find.c b/libsepol/cil/src/cil_find.c
index 8b755277..e94370e8 100644
--- a/libsepol/cil/src/cil_find.c
+++ b/libsepol/cil/src/cil_find.c
@@ -115,12 +115,13 @@ static int cil_type_matches(ebitmap_t *matches, struct cil_symtab_datum *d1, str
 
 /* s1 is the src type that is matched with a self
  * s2, and t2 are the source and type of the other rule
+ * Assumes there is a match between s1 and s2
  */
 static int cil_self_match_any(struct cil_symtab_datum *s1, struct cil_symtab_datum *s2, struct cil_symtab_datum *t2)
 {
 	int rc;
-	struct cil_tree_node *n1 = NODE(s1);
-	if (n1->flavor != CIL_TYPEATTRIBUTE) {
+
+	if (FLAVOR(s1) != CIL_TYPEATTRIBUTE) {
 		rc = cil_type_match_any(s1, t2);
 	} else {
 		struct cil_typeattribute *a = (struct cil_typeattribute *)s1;
@@ -129,20 +130,148 @@ static int cil_self_match_any(struct cil_symtab_datum *s1, struct cil_symtab_dat
 		rc = cil_type_matches(&map, s2, t2);
 		if (rc < 0) {
 			ebitmap_destroy(&map);
-			goto exit;
+			return rc;
 		}
-		if (map.node == NULL) {
-			rc = CIL_FALSE;
-			goto exit;
+		if (ebitmap_is_empty(&map)) {
+			ebitmap_destroy(&map);
+			return CIL_FALSE;
 		}
 		rc = ebitmap_match_any(&map, a->types);
 		ebitmap_destroy(&map);
 	}
 
-exit:
 	return rc;
 }
 
+/* s1 is the src type that is matched with a notself
+ * s2 and t2 are the source and type of the other rule
+ * Assumes there is a match between s1 and s2
+ */
+static int cil_notself_match_any(struct cil_symtab_datum *s1, struct cil_symtab_datum *s2, struct cil_symtab_datum *t2)
+{
+	int rc;
+	ebitmap_node_t *snode, *tnode;
+	unsigned int s,t;
+
+	if (FLAVOR(s1) != CIL_TYPEATTRIBUTE) {
+		struct cil_type *ts1 = (struct cil_type *)s1;
+		if (FLAVOR(t2) != CIL_TYPEATTRIBUTE) {
+			struct cil_type *tt2 = (struct cil_type *)t2;
+			if (ts1->value != tt2->value) {
+				return CIL_TRUE;
+			}
+		} else {
+			struct cil_typeattribute *at2 = (struct cil_typeattribute *)t2;
+			ebitmap_for_each_positive_bit(at2->types, tnode, t) {
+				if (t != (unsigned int)ts1->value) {
+					return CIL_TRUE;
+				}
+			}
+		}
+	} else {
+		ebitmap_t smap;
+		ebitmap_init(&smap);
+		rc = cil_type_matches(&smap, s1, s2);
+		if (rc < 0) {
+			ebitmap_destroy(&smap);
+			return rc;
+		}
+		if (ebitmap_is_empty(&smap)) {
+			ebitmap_destroy(&smap);
+			return CIL_FALSE;
+		}
+		if (FLAVOR(t2) != CIL_TYPEATTRIBUTE) {
+			struct cil_type *tt2 = (struct cil_type *)t2;
+			ebitmap_for_each_positive_bit(&smap, snode, s) {
+				if (s != (unsigned int)tt2->value) {
+					ebitmap_destroy(&smap);
+					return CIL_TRUE;
+				}
+			}
+		} else {
+			struct cil_typeattribute *at2 = (struct cil_typeattribute *)t2;
+			ebitmap_for_each_positive_bit(&smap, snode, s) {
+				ebitmap_for_each_positive_bit(at2->types, tnode, t) {
+					if (s != t) {
+						ebitmap_destroy(&smap);
+						return CIL_TRUE;
+					}
+				}
+			}
+		}
+		ebitmap_destroy(&smap);
+	}
+
+	return CIL_FALSE;
+}
+
+/* s1 is the src type that is matched with an other
+ * s2, and t2 are the source and type of the other rule
+ * Assumes there is a match between s1 and s2
+ */
+static int cil_other_match_any(struct cil_symtab_datum *s1, struct cil_symtab_datum *s2, struct cil_symtab_datum *t2)
+{
+	int rc;
+	ebitmap_t smap, tmap;
+	ebitmap_node_t *snode, *tnode;
+	unsigned int s,t;
+
+	if (FLAVOR(s1) != CIL_TYPEATTRIBUTE) {
+		return CIL_FALSE;
+	}
+
+	ebitmap_init(&smap);
+	rc = cil_type_matches(&smap, s1, s2);
+	if (rc < 0) {
+		ebitmap_destroy(&smap);
+		return rc;
+	}
+
+	ebitmap_init(&tmap);
+	rc = cil_type_matches(&tmap, s1, t2);
+	if (rc < 0) {
+		ebitmap_destroy(&smap);
+		ebitmap_destroy(&tmap);
+		return rc;
+	}
+
+	if (ebitmap_is_empty(&smap) || ebitmap_is_empty(&tmap)) {
+		ebitmap_destroy(&smap);
+		ebitmap_destroy(&tmap);
+		return CIL_FALSE;
+	}
+
+	ebitmap_for_each_positive_bit(&smap, snode, s) {
+		ebitmap_for_each_positive_bit(&tmap, tnode, t) {
+			if (s != t) {
+				ebitmap_destroy(&smap);
+				ebitmap_destroy(&tmap);
+				return CIL_TRUE;
+			}
+		}
+	}
+
+	ebitmap_destroy(&smap);
+	ebitmap_destroy(&tmap);
+
+	return CIL_FALSE;
+}
+
+/* s2 is the src type that is matched with an other
+ * Assumes there is a match between s1 and s2
+ * s1 is not needed, since it is known that there is a match
+ */
+static int cil_notself_other_match_any(struct cil_symtab_datum *s2)
+{
+	if (FLAVOR(s2) == CIL_TYPEATTRIBUTE) {
+		struct cil_typeattribute *as2 = (struct cil_typeattribute *)s2;
+		if (ebitmap_cardinality(as2->types) > 1) {
+			return CIL_TRUE;
+		}
+	}
+	return CIL_FALSE;
+}
+
 static int cil_classperms_match_any(struct cil_classperms *cp1, struct cil_classperms *cp2)
 {
 	struct cil_class *c1 = cp1->class;
@@ -308,30 +437,56 @@ static int cil_find_matching_avrule(struct cil_tree_node *node, struct cil_avrul
 
 	if (!cil_type_match_any(s1, s2)) goto exit;
 
-	if (t1->fqn != CIL_KEY_SELF && t2->fqn != CIL_KEY_SELF) {
-		if (!cil_type_match_any(t1, t2)) goto exit;
-	} else {
-		if (t1->fqn == CIL_KEY_SELF && t2->fqn == CIL_KEY_SELF) {
+	if (t1->fqn == CIL_KEY_SELF) {
+		if (t2->fqn == CIL_KEY_SELF) {
 			/* The earlier check whether s1 and s2 matches is all that is needed */
-		} else if (t1->fqn == CIL_KEY_SELF) {
+			rc = CIL_TRUE;
+		} else if (t2->fqn == CIL_KEY_NOTSELF || t2->fqn == CIL_KEY_OTHER) {
+			rc = CIL_FALSE;
+		} else {
 			rc = cil_self_match_any(s1, s2, t2);
-			if (rc < 0) {
-				goto exit;
-			} else if (rc == CIL_FALSE) {
-				rc = SEPOL_OK;
-				goto exit;
-			}
-		} else if (t2->fqn == CIL_KEY_SELF) {
+		}
+	} else if (t1->fqn == CIL_KEY_NOTSELF) {
+		if (t2->fqn == CIL_KEY_SELF) {
+			rc = CIL_FALSE;
+		} else if (t2->fqn == CIL_KEY_NOTSELF) {
+			/* The earlier check whether s1 and s2 matches is all that is needed */
+			rc = CIL_TRUE;
+		} else if (t2->fqn == CIL_KEY_OTHER) {
+			rc = cil_notself_other_match_any(s2);
+		} else {
+			rc = cil_notself_match_any(s1, s2, t2);
+		}
+	} else if (t1->fqn == CIL_KEY_OTHER) {
+		if (t2->fqn == CIL_KEY_SELF) {
+			rc = CIL_FALSE;
+		} else if (t2->fqn == CIL_KEY_NOTSELF) {
+			rc = cil_notself_other_match_any(s1);
+		} else if (t2->fqn == CIL_KEY_OTHER) {
+			/* The earlier check whether s1 and s2 matches is all that is needed */
+			rc = CIL_TRUE;
+		} else {
+			rc = cil_other_match_any(s1, s2, t2);
+		}
+	} else {
+		if (t2->fqn == CIL_KEY_SELF) {
 			rc = cil_self_match_any(s2, s1, t1);
-			if (rc < 0) {
-				goto exit;
-			} else if (rc == CIL_FALSE) {
-				rc = SEPOL_OK;
-				goto exit;
-			}
+		} else if (t2->fqn == CIL_KEY_NOTSELF) {
+			rc = cil_notself_match_any(s2, s1, t1);
+		} else if (t2->fqn == CIL_KEY_OTHER) {
+			rc = cil_other_match_any(s2, s1, t1);
+		} else {
+			rc = cil_type_match_any(t1, t2);
 		}
 	}
 
+	if (rc < 0) {
+		goto exit;
+	} else if (rc == CIL_FALSE) {
+		rc = SEPOL_OK;
+		goto exit;
+	}
+
 	if (!target->is_extended) {
 		if (cil_classperms_list_match_any(avrule->perms.classperms, target->perms.classperms)) {
 			cil_list_append(matching, CIL_NODE, node);
diff --git a/libsepol/cil/src/cil_internal.h b/libsepol/cil/src/cil_internal.h
index a7604762..d727c352 100644
--- a/libsepol/cil/src/cil_internal.h
+++ b/libsepol/cil/src/cil_internal.h
@@ -101,6 +101,8 @@ extern char *CIL_KEY_CONS_INCOMP;
 extern char *CIL_KEY_CONDTRUE;
 extern char *CIL_KEY_CONDFALSE;
 extern char *CIL_KEY_SELF;
+extern char *CIL_KEY_NOTSELF;
+extern char *CIL_KEY_OTHER;
 extern char *CIL_KEY_OBJECT_R;
 extern char *CIL_KEY_STAR;
 extern char *CIL_KEY_TCP;
@@ -289,6 +291,8 @@ struct cil_db {
 	struct cil_tree *parse;
 	struct cil_tree *ast;
 	struct cil_type *selftype;
+	struct cil_type *notselftype;
+	struct cil_type *othertype;
 	struct cil_list *sidorder;
 	struct cil_list *classorder;
 	struct cil_list *catorder;
diff --git a/libsepol/cil/src/cil_resolve_ast.c b/libsepol/cil/src/cil_resolve_ast.c
index d2bfdc81..96dd4054 100644
--- a/libsepol/cil/src/cil_resolve_ast.c
+++ b/libsepol/cil/src/cil_resolve_ast.c
@@ -333,6 +333,10 @@ int cil_resolve_avrule(struct cil_tree_node *current, void *extra_args)
 		
 	if (rule->tgt_str == CIL_KEY_SELF) {
 		rule->tgt = db->selftype;
+	} else if (rule->tgt_str == CIL_KEY_NOTSELF) {
+		rule->tgt = db->notselftype;
+	} else if (rule->tgt_str == CIL_KEY_OTHER) {
+		rule->tgt = db->othertype;
 	} else {
 		rc = cil_resolve_name(current, rule->tgt_str, CIL_SYM_TYPES, args, &tgt_datum);
 		if (rc != SEPOL_OK) {
diff --git a/libsepol/cil/src/cil_verify.c b/libsepol/cil/src/cil_verify.c
index 4640dc59..3445507e 100644
--- a/libsepol/cil/src/cil_verify.c
+++ b/libsepol/cil/src/cil_verify.c
@@ -68,7 +68,8 @@ static int __cil_is_reserved_name(const char *name, enum cil_flavor flavor)
 	case CIL_TYPE:
 	case CIL_TYPEATTRIBUTE:
 	case CIL_TYPEALIAS:
-		if ((name == CIL_KEY_ALL) || (name == CIL_KEY_SELF))
+		if ((name == CIL_KEY_ALL) || (name == CIL_KEY_SELF) || (name == CIL_KEY_NOTSELF)
+			|| (name == CIL_KEY_OTHER))
 			return CIL_TRUE;
 		break;
 	case CIL_CAT:
-- 
2.39.2

