Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39DD41C27F2
	for <lists+selinux@lfdr.de>; Sat,  2 May 2020 21:08:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728464AbgEBTIl (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Sat, 2 May 2020 15:08:41 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:42130 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728450AbgEBTIl (ORCPT
        <rfc822;selinux@vger.kernel.org>); Sat, 2 May 2020 15:08:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1588446518;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=LcJzTx+/X4yAe7Gmdfu2cPtcH0K7ui1eFIzbhAweV7M=;
        b=SKPezyoZXSZgcNAWPSwXuUzTvmwJ9Jd+LHclaFTcea5b1XUL0nX1Itq5F0cGbRvejKp+Ln
        GP1KHaahI+pwal/iZ/CLb1H2E/xU8w/i5OwZ20F7ZjkaPV3I+Ta6skOYJPyF8NZfmYh2VW
        yfrYNjEAWiCEi7Z0NbEGFHgy0EC8/gE=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-146-Zcb96UiLMHG7Yx3bHDPMBg-1; Sat, 02 May 2020 15:08:34 -0400
X-MC-Unique: Zcb96UiLMHG7Yx3bHDPMBg-1
Received: by mail-wr1-f69.google.com with SMTP id a12so4611934wrv.3
        for <selinux@vger.kernel.org>; Sat, 02 May 2020 12:08:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LcJzTx+/X4yAe7Gmdfu2cPtcH0K7ui1eFIzbhAweV7M=;
        b=lYZJf86QQulQbs+jLpsZS2c5oGOonCeZcZbfjABk9AcHa4YeLEkZ7Yj5Lw4YBNnCg0
         WHHGA2abJJG+ewhpbHonggM/BysO+/X4V5G9udF13HE0vizpUXaC0bhY7uifgH552DMQ
         rlX0vTIlk4pDFT45pCfe3KiJrnWfN7RqM0n3kc+fafSFP/qrLxwWPf7PBmhJG6+Ire3M
         MtI+/7SKD4bZ8EDJhQEVcZ9RgOT0uLkcw/KTpZYcPZTQYVcOKqfbR/d1w74wpx6VW7R2
         C5LUt0CPWCljYOaCMfS0wyQn5LiEWZj02HVaQkkSoJ81UBSxgB1nAsQTery1XRktDoYV
         1wqQ==
X-Gm-Message-State: AGi0PuZsske8xfbDs1kEepr/ophY2R+qK52J1tu7Dcz478cRGkTKxrYI
        Id2EPz7dW8AR6QXwfDoFo4sUGrDWSTt5zJ66ZN+WQfh0oQAaZ/onzx1AqFqcWOYMl76qzQcAOyD
        mQFCozKZXJLsrgY+McA==
X-Received: by 2002:a5d:42cf:: with SMTP id t15mr10288647wrr.354.1588446513084;
        Sat, 02 May 2020 12:08:33 -0700 (PDT)
X-Google-Smtp-Source: APiQypKBGDQKW7Veph0FJ1qFZy2pKnFFeYHvcACfczOlQiDW97e8ZAtjIySc/gsMT0TxnrsVlC3Z/A==
X-Received: by 2002:a5d:42cf:: with SMTP id t15mr10288623wrr.354.1588446512661;
        Sat, 02 May 2020 12:08:32 -0700 (PDT)
Received: from omos.redhat.com ([2a02:8308:b13f:2100:f695:3ae5:c8bf:2f57])
        by smtp.gmail.com with ESMTPSA id g186sm5514209wme.7.2020.05.02.12.08.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2020 12:08:32 -0700 (PDT)
From:   Ondrej Mosnacek <omosnace@redhat.com>
To:     selinux@vger.kernel.org
Cc:     James Carter <jwcart2@gmail.com>,
        Stephen Smalley <stephen.smalley.work@gmail.com>,
        Stephen Smalley <sds@tycho.nsa.gov>,
        Chris PeBenito <pebenito@ieee.org>
Subject: [PATCH v3 1/2] libsepol,checkpolicy: optimize storage of filename transitions
Date:   Sat,  2 May 2020 21:08:27 +0200
Message-Id: <20200502190828.3555858-2-omosnace@redhat.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200502190828.3555858-1-omosnace@redhat.com>
References: <20200502190828.3555858-1-omosnace@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

In preparation to support a new policy format with a more optimal
representation of filename transition rules, this patch applies an
equivalent change from kernel commit c3a276111ea2 ("selinux: optimize
storage of filename transitions").

See the kernel commit's description [1] for the rationale behind this
representation. This change doesn't bring any measurable difference of
policy build performance (semodule -B) on Fedora.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/selinux.git/commit/?id=c3a276111ea2572399281988b3129683e2a6b60b

Signed-off-by: Ondrej Mosnacek <omosnace@redhat.com>
---
 checkpolicy/policy_define.c                |  52 +++------
 checkpolicy/test/dispol.c                  |  20 +++-
 libsepol/cil/src/cil_binary.c              |  29 ++---
 libsepol/include/sepol/policydb/policydb.h |  15 ++-
 libsepol/src/expand.c                      |  60 +++-------
 libsepol/src/kernel_to_cil.c               |  24 +++-
 libsepol/src/kernel_to_conf.c              |  24 +++-
 libsepol/src/policydb.c                    | 126 ++++++++++++++-------
 libsepol/src/write.c                       |  46 ++++----
 9 files changed, 217 insertions(+), 179 deletions(-)

diff --git a/checkpolicy/policy_define.c b/checkpolicy/policy_define.c
index c6733fa4..01a90438 100644
--- a/checkpolicy/policy_define.c
+++ b/checkpolicy/policy_define.c
@@ -3303,10 +3303,9 @@ int define_filename_trans(void)
 	ebitmap_t e_stypes, e_ttypes;
 	ebitmap_t e_tclasses;
 	ebitmap_node_t *snode, *tnode, *cnode;
-	filename_trans_t *ft;
-	filename_trans_datum_t *ftdatum;
 	filename_trans_rule_t *ftr;
 	type_datum_t *typdatum;
+	char *dup_name;
 	uint32_t otype;
 	unsigned int c, s, t;
 	int add, rc;
@@ -3388,40 +3387,21 @@ int define_filename_trans(void)
 	ebitmap_for_each_positive_bit(&e_tclasses, cnode, c) {
 		ebitmap_for_each_positive_bit(&e_stypes, snode, s) {
 			ebitmap_for_each_positive_bit(&e_ttypes, tnode, t) {
-				ft = calloc(1, sizeof(*ft));
-				if (!ft) {
-					yyerror("out of memory");
-					goto bad;
-				}
-				ft->stype = s+1;
-				ft->ttype = t+1;
-				ft->tclass = c+1;
-				ft->name = strdup(name);
-				if (!ft->name) {
-					yyerror("out of memory");
-					goto bad;
-				}
-
-				ftdatum = hashtab_search(policydbp->filename_trans,
-							 (hashtab_key_t)ft);
-				if (ftdatum) {
-					yyerror2("duplicate filename transition for: filename_trans %s %s %s:%s",
-						 name,
-						 policydbp->p_type_val_to_name[s],
-						 policydbp->p_type_val_to_name[t],
-						 policydbp->p_class_val_to_name[c]);
-					goto bad;
-				}
-
-				ftdatum = calloc(1, sizeof(*ftdatum));
-				if (!ftdatum) {
-					yyerror("out of memory");
-					goto bad;
-				}
-				rc = hashtab_insert(policydbp->filename_trans,
-						    (hashtab_key_t)ft,
-						    ftdatum);
-				if (rc) {
+				dup_name = NULL;
+				rc = policydb_filetrans_insert(
+					policydbp, s+1, t+1, c+1, name,
+					&dup_name, otype, NULL
+				);
+				free(dup_name);
+				if (rc != SEPOL_OK) {
+					if (rc == SEPOL_EEXIST) {
+						yyerror2("duplicate filename transition for: filename_trans %s %s %s:%s",
+							name,
+							policydbp->p_type_val_to_name[s],
+							policydbp->p_type_val_to_name[t],
+							policydbp->p_class_val_to_name[c]);
+						goto bad;
+					}
 					yyerror("out of memory");
 					goto bad;
 				}
diff --git a/checkpolicy/test/dispol.c b/checkpolicy/test/dispol.c
index d72d9fb3..8785b725 100644
--- a/checkpolicy/test/dispol.c
+++ b/checkpolicy/test/dispol.c
@@ -335,17 +335,25 @@ static int filenametr_display(hashtab_key_t key,
 			      hashtab_datum_t datum,
 			      void *ptr)
 {
-	struct filename_trans *ft = (struct filename_trans *)key;
+	struct filename_trans_key *ft = (struct filename_trans_key *)key;
 	struct filename_trans_datum *ftdatum = datum;
 	struct filenametr_display_args *args = ptr;
 	policydb_t *p = args->p;
 	FILE *fp = args->fp;
+	ebitmap_node_t *node;
+	uint32_t bit;
+
+	do {
+		ebitmap_for_each_positive_bit(&ftdatum->stypes, node, bit) {
+			display_id(p, fp, SYM_TYPES, bit, "");
+			display_id(p, fp, SYM_TYPES, ft->ttype - 1, "");
+			display_id(p, fp, SYM_CLASSES, ft->tclass - 1, ":");
+			display_id(p, fp, SYM_TYPES, ftdatum->otype - 1, "");
+			fprintf(fp, " %s\n", ft->name);
+		}
+		ftdatum = ftdatum->next;
+	} while (ftdatum);
 
-	display_id(p, fp, SYM_TYPES, ft->stype - 1, "");
-	display_id(p, fp, SYM_TYPES, ft->ttype - 1, "");
-	display_id(p, fp, SYM_CLASSES, ft->tclass - 1, ":");
-	display_id(p, fp, SYM_TYPES, ftdatum->otype - 1, "");
-	fprintf(fp, " %s\n", ft->name);
 	return 0;
 }
 
diff --git a/libsepol/cil/src/cil_binary.c b/libsepol/cil/src/cil_binary.c
index 62178d99..bedff628 100644
--- a/libsepol/cil/src/cil_binary.c
+++ b/libsepol/cil/src/cil_binary.c
@@ -1131,13 +1131,13 @@ int __cil_typetransition_to_avtab(policydb_t *pdb, const struct cil_db *db, stru
 	class_datum_t *sepol_obj = NULL;
 	struct cil_list *class_list;
 	type_datum_t *sepol_result = NULL;
-	filename_trans_t *newkey = NULL;
-	filename_trans_datum_t *newdatum = NULL, *otype = NULL;
 	ebitmap_t src_bitmap, tgt_bitmap;
 	ebitmap_node_t *node1, *node2;
 	unsigned int i, j;
+	uint32_t otype;
 	struct cil_list_item *c;
 	char *name = DATUM(typetrans->name)->name;
+	char *dup_name;
 
 	if (name == CIL_KEY_STAR) {
 		struct cil_type_rule trans;
@@ -1176,22 +1176,16 @@ int __cil_typetransition_to_avtab(policydb_t *pdb, const struct cil_db *db, stru
 				rc = __cil_get_sepol_class_datum(pdb, DATUM(c->data), &sepol_obj);
 				if (rc != SEPOL_OK) goto exit;
 
-				newkey = cil_calloc(1, sizeof(*newkey));
-				newdatum = cil_calloc(1, sizeof(*newdatum));
-				newkey->stype = sepol_src->s.value;
-				newkey->ttype = sepol_tgt->s.value;
-				newkey->tclass = sepol_obj->s.value;
-				newkey->name = cil_strdup(name);
-				newdatum->otype = sepol_result->s.value;
-
-				rc = hashtab_insert(pdb->filename_trans,
-						    (hashtab_key_t)newkey,
-						    newdatum);
+				dup_name = NULL;
+				rc = policydb_filetrans_insert(
+					pdb, sepol_src->s.value, sepol_tgt->s.value,
+					sepol_obj->s.value, name, &dup_name,
+					sepol_result->s.value, &otype
+				);
+				free(dup_name);
 				if (rc != SEPOL_OK) {
 					if (rc == SEPOL_EEXIST) {
-						otype = hashtab_search(pdb->filename_trans,
-								(hashtab_key_t)newkey);
-						if (newdatum->otype != otype->otype) {
+						if (sepol_result->s.value!= otype) {
 							cil_log(CIL_ERR, "Conflicting name type transition rules\n");
 						} else {
 							rc = SEPOL_OK;
@@ -1199,9 +1193,6 @@ int __cil_typetransition_to_avtab(policydb_t *pdb, const struct cil_db *db, stru
 					} else {
 						cil_log(CIL_ERR, "Out of memory\n");
 					}
-					free(newkey->name);
-					free(newkey);
-					free(newdatum);
 					if (rc != SEPOL_OK) {
 						goto exit;
 					}
diff --git a/libsepol/include/sepol/policydb/policydb.h b/libsepol/include/sepol/policydb/policydb.h
index 81b63fef..c3180c61 100644
--- a/libsepol/include/sepol/policydb/policydb.h
+++ b/libsepol/include/sepol/policydb/policydb.h
@@ -162,15 +162,16 @@ typedef struct role_allow {
 } role_allow_t;
 
 /* filename_trans rules */
-typedef struct filename_trans {
-	uint32_t stype;
+typedef struct filename_trans_key {
 	uint32_t ttype;
 	uint32_t tclass;
 	char *name;
-} filename_trans_t;
+} filename_trans_key_t;
 
 typedef struct filename_trans_datum {
-	uint32_t otype;		/* expected of new object */
+	ebitmap_t stypes;
+	uint32_t otype;
+	struct filename_trans_datum *next;
 } filename_trans_datum_t;
 
 /* Type attributes */
@@ -591,6 +592,7 @@ typedef struct policydb {
 
 	/* file transitions with the last path component */
 	hashtab_t filename_trans;
+	uint32_t filename_trans_count;
 
 	ebitmap_t *type_attr_map;
 
@@ -650,6 +652,11 @@ extern int policydb_load_isids(policydb_t * p, sidtab_t * s);
 
 extern int policydb_sort_ocontexts(policydb_t *p);
 
+extern int policydb_filetrans_insert(policydb_t *p, uint32_t stype,
+				     uint32_t ttype, uint32_t tclass,
+				     const char *name, char **name_alloc,
+				     uint32_t otype, uint32_t *present_otype);
+
 /* Deprecated */
 extern int policydb_context_isvalid(const policydb_t * p,
 				    const context_struct_t * c);
diff --git a/libsepol/src/expand.c b/libsepol/src/expand.c
index 529e1d35..28f93acb 100644
--- a/libsepol/src/expand.c
+++ b/libsepol/src/expand.c
@@ -1371,16 +1371,15 @@ static int copy_role_trans(expand_state_t * state, role_trans_rule_t * rules)
 static int expand_filename_trans(expand_state_t *state, filename_trans_rule_t *rules)
 {
 	unsigned int i, j;
-	filename_trans_t key, *new_trans;
-	filename_trans_datum_t *otype;
 	filename_trans_rule_t *cur_rule;
 	ebitmap_t stypes, ttypes;
 	ebitmap_node_t *snode, *tnode;
+	char *name;
 	int rc;
 
 	cur_rule = rules;
 	while (cur_rule) {
-		uint32_t mapped_otype;
+		uint32_t mapped_otype, present_otype;
 
 		ebitmap_init(&stypes);
 		ebitmap_init(&ttypes);
@@ -1401,15 +1400,17 @@ static int expand_filename_trans(expand_state_t *state, filename_trans_rule_t *r
 
 		ebitmap_for_each_positive_bit(&stypes, snode, i) {
 			ebitmap_for_each_positive_bit(&ttypes, tnode, j) {
-				key.stype = i + 1;
-				key.ttype = j + 1;
-				key.tclass = cur_rule->tclass;
-				key.name = cur_rule->name;
-				otype = hashtab_search(state->out->filename_trans,
-						       (hashtab_key_t) &key);
-				if (otype) {
+				name = NULL;
+
+				rc = policydb_filetrans_insert(
+					state->out, i + 1, j + 1,
+					cur_rule->tclass, cur_rule->name,
+					&name, mapped_otype, &present_otype
+				);
+				free(name);
+				if (rc == SEPOL_EEXIST) {
 					/* duplicate rule, ignore */
-					if (otype->otype == mapped_otype)
+					if (present_otype == mapped_otype)
 						continue;
 
 					ERR(state->handle, "Conflicting name-based type_transition %s %s:%s \"%s\":  %s vs %s",
@@ -1417,44 +1418,11 @@ static int expand_filename_trans(expand_state_t *state, filename_trans_rule_t *r
 					    state->out->p_type_val_to_name[j],
 					    state->out->p_class_val_to_name[cur_rule->tclass - 1],
 					    cur_rule->name,
-					    state->out->p_type_val_to_name[otype->otype - 1],
+					    state->out->p_type_val_to_name[present_otype - 1],
 					    state->out->p_type_val_to_name[mapped_otype - 1]);
 					return -1;
-				}
-
-				new_trans = calloc(1, sizeof(*new_trans));
-				if (!new_trans) {
-					ERR(state->handle, "Out of memory!");
-					return -1;
-				}
-
-				new_trans->name = strdup(cur_rule->name);
-				if (!new_trans->name) {
-					ERR(state->handle, "Out of memory!");
-					free(new_trans);
-					return -1;
-				}
-				new_trans->stype = i + 1;
-				new_trans->ttype = j + 1;
-				new_trans->tclass = cur_rule->tclass;
-
-				otype = calloc(1, sizeof(*otype));
-				if (!otype) {
-					ERR(state->handle, "Out of memory!");
-					free(new_trans->name);
-					free(new_trans);
-					return -1;
-				}
-				otype->otype = mapped_otype;
-
-				rc = hashtab_insert(state->out->filename_trans,
-						    (hashtab_key_t)new_trans,
-						    otype);
-				if (rc) {
+				} else if (rc < 0) {
 					ERR(state->handle, "Out of memory!");
-					free(otype);
-					free(new_trans->name);
-					free(new_trans);
 					return -1;
 				}
 			}
diff --git a/libsepol/src/kernel_to_cil.c b/libsepol/src/kernel_to_cil.c
index ede78a20..718d3481 100644
--- a/libsepol/src/kernel_to_cil.c
+++ b/libsepol/src/kernel_to_cil.c
@@ -1821,21 +1821,35 @@ struct map_filename_trans_args {
 
 static int map_filename_trans_to_str(hashtab_key_t key, void *data, void *arg)
 {
-	filename_trans_t *ft = (filename_trans_t *)key;
+	filename_trans_key_t *ft = (filename_trans_key_t *)key;
 	filename_trans_datum_t *datum = data;
 	struct map_filename_trans_args *map_args = arg;
 	struct policydb *pdb = map_args->pdb;
 	struct strs *strs = map_args->strs;
 	char *src, *tgt, *class, *filename, *new;
+	struct ebitmap_node *node;
+	uint32_t bit;
+	int rc;
 
-	src = pdb->p_type_val_to_name[ft->stype - 1];
 	tgt = pdb->p_type_val_to_name[ft->ttype - 1];
 	class = pdb->p_class_val_to_name[ft->tclass - 1];
 	filename = ft->name;
-	new =  pdb->p_type_val_to_name[datum->otype - 1];
+	do {
+		new = pdb->p_type_val_to_name[datum->otype - 1];
+
+		ebitmap_for_each_positive_bit(&datum->stypes, node, bit) {
+			src = pdb->p_type_val_to_name[bit];
+			rc = strs_create_and_add(strs,
+						 "(typetransition %s %s %s %s %s)",
+						 5, src, tgt, class, filename, new);
+			if (rc)
+				return rc;
+		}
+
+		datum = datum->next;
+	} while (datum);
 
-	return strs_create_and_add(strs, "(typetransition %s %s %s %s %s)", 5,
-				   src, tgt, class, filename, new);
+	return 0;
 }
 
 static int write_filename_trans_rules_to_cil(FILE *out, struct policydb *pdb)
diff --git a/libsepol/src/kernel_to_conf.c b/libsepol/src/kernel_to_conf.c
index 9de64832..9fb3ed22 100644
--- a/libsepol/src/kernel_to_conf.c
+++ b/libsepol/src/kernel_to_conf.c
@@ -1801,21 +1801,35 @@ struct map_filename_trans_args {
 
 static int map_filename_trans_to_str(hashtab_key_t key, void *data, void *arg)
 {
-	filename_trans_t *ft = (filename_trans_t *)key;
+	filename_trans_key_t *ft = (filename_trans_key_t *)key;
 	filename_trans_datum_t *datum = data;
 	struct map_filename_trans_args *map_args = arg;
 	struct policydb *pdb = map_args->pdb;
 	struct strs *strs = map_args->strs;
 	char *src, *tgt, *class, *filename, *new;
+	struct ebitmap_node *node;
+	uint32_t bit;
+	int rc;
 
-	src = pdb->p_type_val_to_name[ft->stype - 1];
 	tgt = pdb->p_type_val_to_name[ft->ttype - 1];
 	class = pdb->p_class_val_to_name[ft->tclass - 1];
 	filename = ft->name;
-	new =  pdb->p_type_val_to_name[datum->otype - 1];
+	do {
+		new = pdb->p_type_val_to_name[datum->otype - 1];
+
+		ebitmap_for_each_positive_bit(&datum->stypes, node, bit) {
+			src = pdb->p_type_val_to_name[bit];
+			rc = strs_create_and_add(strs,
+						 "type_transition %s %s:%s %s \"%s\";",
+						 5, src, tgt, class, new, filename);
+			if (rc)
+				return rc;
+		}
+
+		datum = datum->next;
+	} while (datum);
 
-	return strs_create_and_add(strs, "type_transition %s %s:%s %s \"%s\";", 5,
-				   src, tgt, class, new, filename);
+	return 0;
 }
 
 static int write_filename_trans_rules_to_conf(FILE *out, struct policydb *pdb)
diff --git a/libsepol/src/policydb.c b/libsepol/src/policydb.c
index 5b289a52..6b121d66 100644
--- a/libsepol/src/policydb.c
+++ b/libsepol/src/policydb.c
@@ -789,12 +789,12 @@ partial_name_hash(unsigned long c, unsigned long prevhash)
 
 static unsigned int filenametr_hash(hashtab_t h, const_hashtab_key_t k)
 {
-	const struct filename_trans *ft = (const struct filename_trans *)k;
+	const filename_trans_key_t *ft = (const filename_trans_key_t *)k;
 	unsigned long hash;
 	unsigned int byte_num;
 	unsigned char focus;
 
-	hash = ft->stype ^ ft->ttype ^ ft->tclass;
+	hash = ft->ttype ^ ft->tclass;
 
 	byte_num = 0;
 	while ((focus = ft->name[byte_num++]))
@@ -805,14 +805,10 @@ static unsigned int filenametr_hash(hashtab_t h, const_hashtab_key_t k)
 static int filenametr_cmp(hashtab_t h __attribute__ ((unused)),
 			  const_hashtab_key_t k1, const_hashtab_key_t k2)
 {
-	const struct filename_trans *ft1 = (const struct filename_trans *)k1;
-	const struct filename_trans *ft2 = (const struct filename_trans *)k2;
+	const filename_trans_key_t *ft1 = (const filename_trans_key_t *)k1;
+	const filename_trans_key_t *ft2 = (const filename_trans_key_t *)k2;
 	int v;
 
-	v = ft1->stype - ft2->stype;
-	if (v)
-		return v;
-
 	v = ft1->ttype - ft2->ttype;
 	if (v)
 		return v;
@@ -1409,9 +1405,12 @@ common_destroy, class_destroy, role_destroy, type_destroy, user_destroy,
 static int filenametr_destroy(hashtab_key_t key, hashtab_datum_t datum,
 			      void *p __attribute__ ((unused)))
 {
-	struct filename_trans *ft = (struct filename_trans *)key;
+	filename_trans_key_t *ft = (filename_trans_key_t *)key;
+	filename_trans_datum_t *fd = datum;
+
 	free(ft->name);
 	free(key);
+	ebitmap_destroy(&fd->stypes);
 	free(datum);
 	return 0;
 }
@@ -2595,12 +2594,77 @@ int role_allow_read(role_allow_t ** r, struct policy_file *fp)
 	return 0;
 }
 
+int policydb_filetrans_insert(policydb_t *p, uint32_t stype, uint32_t ttype,
+			      uint32_t tclass, const char *name,
+			      char **name_alloc, uint32_t otype,
+			      uint32_t *present_otype)
+{
+	filename_trans_key_t *ft, key;
+	filename_trans_datum_t *datum, *last;
+
+	key.ttype = ttype;
+	key.tclass = tclass;
+	key.name = (char *)name;
+
+	last = NULL;
+	datum = hashtab_search(p->filename_trans, (hashtab_key_t)&key);
+	while (datum) {
+		if (ebitmap_get_bit(&datum->stypes, stype - 1)) {
+			if (present_otype)
+				*present_otype = datum->otype;
+			return SEPOL_EEXIST;
+		}
+		if (datum->otype == otype)
+			break;
+		last = datum;
+		datum = datum->next;
+	}
+	if (!datum) {
+		if (!*name_alloc) {
+			*name_alloc = strdup(name);
+			if (!*name_alloc)
+				return SEPOL_ENOMEM;
+		}
+
+		datum = malloc(sizeof(*datum));
+		if (!datum)
+			return SEPOL_ENOMEM;
+
+		ebitmap_init(&datum->stypes);
+		datum->otype = otype;
+		datum->next = NULL;
+
+		if (last) {
+			last->next = datum;
+		} else {
+			ft = malloc(sizeof(*ft));
+			if (!ft) {
+				free(datum);
+				return SEPOL_ENOMEM;
+			}
+
+			ft->ttype = ttype;
+			ft->tclass = tclass;
+			ft->name = *name_alloc;
+
+			if (hashtab_insert(p->filename_trans, (hashtab_key_t)ft,
+					   (hashtab_datum_t)datum)) {
+				free(datum);
+				free(ft);
+				return SEPOL_ENOMEM;
+			}
+			*name_alloc = NULL;
+		}
+	}
+
+	p->filename_trans_count++;
+	return ebitmap_set_bit(&datum->stypes, stype - 1, 1);
+}
+
 int filename_trans_read(policydb_t *p, struct policy_file *fp)
 {
 	unsigned int i;
-	uint32_t buf[4], nel, len;
-	filename_trans_t *ft;
-	filename_trans_datum_t *otype;
+	uint32_t buf[4], nel, len, stype, ttype, tclass, otype;
 	int rc;
 	char *name;
 
@@ -2610,16 +2674,8 @@ int filename_trans_read(policydb_t *p, struct policy_file *fp)
 	nel = le32_to_cpu(buf[0]);
 
 	for (i = 0; i < nel; i++) {
-		ft = NULL;
-		otype = NULL;
 		name = NULL;
 
-		ft = calloc(1, sizeof(*ft));
-		if (!ft)
-			goto err;
-		otype = calloc(1, sizeof(*otype));
-		if (!otype)
-			goto err;
 		rc = next_entry(buf, fp, sizeof(uint32_t));
 		if (rc < 0)
 			goto err;
@@ -2631,8 +2687,6 @@ int filename_trans_read(policydb_t *p, struct policy_file *fp)
 		if (!name)
 			goto err;
 
-		ft->name = name;
-
 		rc = next_entry(name, fp, len);
 		if (rc < 0)
 			goto err;
@@ -2641,13 +2695,13 @@ int filename_trans_read(policydb_t *p, struct policy_file *fp)
 		if (rc < 0)
 			goto err;
 
-		ft->stype = le32_to_cpu(buf[0]);
-		ft->ttype = le32_to_cpu(buf[1]);
-		ft->tclass = le32_to_cpu(buf[2]);
-		otype->otype = le32_to_cpu(buf[3]);
+		stype  = le32_to_cpu(buf[0]);
+		ttype  = le32_to_cpu(buf[1]);
+		tclass = le32_to_cpu(buf[2]);
+		otype  = le32_to_cpu(buf[3]);
 
-		rc = hashtab_insert(p->filename_trans, (hashtab_key_t) ft,
-				    otype);
+		rc = policydb_filetrans_insert(p, stype, ttype, tclass, name,
+					       &name, otype, NULL);
 		if (rc) {
 			if (rc != SEPOL_EEXIST)
 				goto err;
@@ -2659,21 +2713,17 @@ int filename_trans_read(policydb_t *p, struct policy_file *fp)
 			 */
 			WARN(fp->handle,
 			     "Duplicate name-based type_transition %s %s:%s \"%s\":  %s, ignoring",
-			     p->p_type_val_to_name[ft->stype - 1],
-			     p->p_type_val_to_name[ft->ttype - 1],
-			     p->p_class_val_to_name[ft->tclass - 1],
-			     ft->name,
-			     p->p_type_val_to_name[otype->otype - 1]);
-			free(ft);
-			free(name);
-			free(otype);
+			     p->p_type_val_to_name[stype - 1],
+			     p->p_type_val_to_name[ttype - 1],
+			     p->p_class_val_to_name[tclass - 1],
+			     name,
+			     p->p_type_val_to_name[otype - 1]);
 			/* continue, ignoring this one */
 		}
+		free(name);
 	}
 	return 0;
 err:
-	free(ft);
-	free(otype);
 	free(name);
 	return -1;
 }
diff --git a/libsepol/src/write.c b/libsepol/src/write.c
index 1fd6a16a..d3aee8d5 100644
--- a/libsepol/src/write.c
+++ b/libsepol/src/write.c
@@ -571,44 +571,50 @@ static int role_allow_write(role_allow_t * r, struct policy_file *fp)
 
 static int filename_write_helper(hashtab_key_t key, void *data, void *ptr)
 {
-	uint32_t buf[4];
+	uint32_t bit, buf[4];
 	size_t items, len;
-	struct filename_trans *ft = (struct filename_trans *)key;
-	struct filename_trans_datum *otype = data;
+	filename_trans_key_t *ft = (filename_trans_key_t *)key;
+	filename_trans_datum_t *datum = data;
+	ebitmap_node_t *node;
 	void *fp = ptr;
 
 	len = strlen(ft->name);
-	buf[0] = cpu_to_le32(len);
-	items = put_entry(buf, sizeof(uint32_t), 1, fp);
-	if (items != 1)
-		return POLICYDB_ERROR;
+	do {
+		ebitmap_for_each_positive_bit(&datum->stypes, node, bit) {
+			buf[0] = cpu_to_le32(len);
+			items = put_entry(buf, sizeof(uint32_t), 1, fp);
+			if (items != 1)
+				return POLICYDB_ERROR;
 
-	items = put_entry(ft->name, sizeof(char), len, fp);
-	if (items != len)
-		return POLICYDB_ERROR;
+			items = put_entry(ft->name, sizeof(char), len, fp);
+			if (items != len)
+				return POLICYDB_ERROR;
 
-	buf[0] = cpu_to_le32(ft->stype);
-	buf[1] = cpu_to_le32(ft->ttype);
-	buf[2] = cpu_to_le32(ft->tclass);
-	buf[3] = cpu_to_le32(otype->otype);
-	items = put_entry(buf, sizeof(uint32_t), 4, fp);
-	if (items != 4)
-		return POLICYDB_ERROR;
+			buf[0] = cpu_to_le32(bit + 1);
+			buf[1] = cpu_to_le32(ft->ttype);
+			buf[2] = cpu_to_le32(ft->tclass);
+			buf[3] = cpu_to_le32(datum->otype);
+			items = put_entry(buf, sizeof(uint32_t), 4, fp);
+			if (items != 4)
+				return POLICYDB_ERROR;
+		}
+
+		datum = datum->next;
+	} while (datum);
 
 	return 0;
 }
 
 static int filename_trans_write(struct policydb *p, void *fp)
 {
-	size_t nel, items;
+	size_t items;
 	uint32_t buf[1];
 	int rc;
 
 	if (p->policyvers < POLICYDB_VERSION_FILENAME_TRANS)
 		return 0;
 
-	nel =  p->filename_trans->nel;
-	buf[0] = cpu_to_le32(nel);
+	buf[0] = cpu_to_le32(p->filename_trans_count);
 	items = put_entry(buf, sizeof(uint32_t), 1, fp);
 	if (items != 1)
 		return POLICYDB_ERROR;
-- 
2.25.4

