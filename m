Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C61B942947D
	for <lists+selinux@lfdr.de>; Mon, 11 Oct 2021 18:26:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232114AbhJKQ22 (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Mon, 11 Oct 2021 12:28:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232087AbhJKQ21 (ORCPT
        <rfc822;selinux@vger.kernel.org>); Mon, 11 Oct 2021 12:28:27 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13FA3C061570
        for <selinux@vger.kernel.org>; Mon, 11 Oct 2021 09:26:27 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id d9so46036525edh.5
        for <selinux@vger.kernel.org>; Mon, 11 Oct 2021 09:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=jzK8JTFGXR9V+WKOCu2iIAbtYEx+Yt34mGHccxB1Wec=;
        b=EpBVUFWsjQwAsU/xniK8OlCSajQzjRPOxZXk9v2J/EF1Rj8NE2l/224uJTQRSZG0tf
         ExJtSvr0QBjQi1cZjbtDlzktr5bgBQ4sPkjxhzQ0LhTTkSW9//mbAjT/0+I3hK4qxKtw
         nfNqaa6ar9LkgDpdKdPLHTlx+XtyHmQUnZVFOC+QzpEaMgVqJc8AXx9IKIkb6GXkGWKn
         I8uqghhImmKhZMCzaATk+Yj1C3Y/dg3MoHYu/rOugIdk5cYxTryvkzSCtgZFTRjJ2bXf
         6UXL54SBiPS0NJbDmq6C5FefseuJQKFp/ElNFv7QRi0VH5qeY7og58dy9yTmU7i5+iog
         Owng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jzK8JTFGXR9V+WKOCu2iIAbtYEx+Yt34mGHccxB1Wec=;
        b=E1dZmu+9548DvleUomd9IyWJ17cgBoImhkk/7pv+i+D1ekv8W/cCwIoe3Y/zfcaB0N
         lzjbzHZQZFmNKxtN3DqqXeUynnmi/lZvwsXgOlzYXS+UjeApFAiIRTm/6DNQZb2w82N2
         Fc5Kofv9nGxe5h2s8wwUeQ8JUuRVNQL32Jcyt3sA2Fn/K7ySLnwfnrzM0U6xY7geoGbl
         ItXyXhb6nH/YNntGilP6fd83ix4SIpcQq1qQX+HoB75+/69r9CD427SppOXl7VzUDpdf
         9RSSCRbt56yI8fmEssqfc1e5AdVlidhtCuQQZGvnZHWclhW+wdG4WbtVezn0ihee97qn
         CdJQ==
X-Gm-Message-State: AOAM530CE8FIBJLsfvUAChM21rWlGLtdp3O2j6jOzGUefGkDPP41XdmC
        CpC0rslTC16W9lW16hBX1lkKQcqKV8M=
X-Google-Smtp-Source: ABdhPJyAPRLqzH1cNBl/MMzz44AOV6VoapdDs+xbB9CfKlxyhE4ZP1Ac4FqV1mSJIENtVrA+xvPtDQ==
X-Received: by 2002:a17:907:7803:: with SMTP id la3mr27559080ejc.235.1633969585578;
        Mon, 11 Oct 2021 09:26:25 -0700 (PDT)
Received: from debianHome.localdomain (dynamic-077-010-085-058.77.10.pool.telefonica.de. [77.10.85.58])
        by smtp.gmail.com with ESMTPSA id a1sm4489514edu.43.2021.10.11.09.26.25
        for <selinux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Oct 2021 09:26:25 -0700 (PDT)
From:   =?UTF-8?q?Christian=20G=C3=B6ttsche?= <cgzones@googlemail.com>
To:     selinux@vger.kernel.org
Subject: [RFC PATCH 08/35] libsepol: use mallocarray wrapper to avoid overflows
Date:   Mon, 11 Oct 2021 18:25:06 +0200
Message-Id: <20211011162533.53404-9-cgzones@googlemail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211011162533.53404-1-cgzones@googlemail.com>
References: <20211011162533.53404-1-cgzones@googlemail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Use a wrapper to guard `malloc(a * b)` type allocations, to detect
multiplication overflows, which result in too few memory being
allocated.

Signed-off-by: Christian Göttsche <cgzones@googlemail.com>
---
 libsepol/src/conditional.c   | 2 +-
 libsepol/src/expand.c        | 4 ++--
 libsepol/src/hashtab.c       | 4 +++-
 libsepol/src/link.c          | 3 ++-
 libsepol/src/module.c        | 4 ++--
 libsepol/src/module_to_cil.c | 4 ++--
 libsepol/src/optimize.c      | 6 ++++--
 libsepol/src/policydb.c      | 6 +++---
 libsepol/src/private.h       | 9 +++++++++
 libsepol/src/services.c      | 6 +++---
 libsepol/src/sidtab.c        | 3 ++-
 libsepol/src/user_record.c   | 3 ++-
 libsepol/src/write.c         | 2 +-
 13 files changed, 36 insertions(+), 20 deletions(-)

diff --git a/libsepol/src/conditional.c b/libsepol/src/conditional.c
index a01350a6..9a10aae1 100644
--- a/libsepol/src/conditional.c
+++ b/libsepol/src/conditional.c
@@ -522,7 +522,7 @@ int cond_init_bool_indexes(policydb_t * p)
 	if (p->bool_val_to_struct)
 		free(p->bool_val_to_struct);
 	p->bool_val_to_struct = (cond_bool_datum_t **)
-	    malloc(p->p_bools.nprim * sizeof(cond_bool_datum_t *));
+	    mallocarray(p->p_bools.nprim, sizeof(cond_bool_datum_t *));
 	if (!p->bool_val_to_struct)
 		return -1;
 	return 0;
diff --git a/libsepol/src/expand.c b/libsepol/src/expand.c
index a6a466f7..8a7259a0 100644
--- a/libsepol/src/expand.c
+++ b/libsepol/src/expand.c
@@ -3146,9 +3146,9 @@ int expand_module(sepol_handle_t * handle,
 		goto cleanup;
 
 	/* Build the type<->attribute maps and remove attributes. */
-	state.out->attr_type_map = malloc(state.out->p_types.nprim *
+	state.out->attr_type_map = mallocarray(state.out->p_types.nprim,
 					  sizeof(ebitmap_t));
-	state.out->type_attr_map = malloc(state.out->p_types.nprim *
+	state.out->type_attr_map = mallocarray(state.out->p_types.nprim,
 					  sizeof(ebitmap_t));
 	if (!state.out->attr_type_map || !state.out->type_attr_map) {
 		ERR(handle, "Out of memory!");
diff --git a/libsepol/src/hashtab.c b/libsepol/src/hashtab.c
index 21143b76..2eb35212 100644
--- a/libsepol/src/hashtab.c
+++ b/libsepol/src/hashtab.c
@@ -32,6 +32,8 @@
 #include <string.h>
 #include <sepol/policydb/hashtab.h>
 
+#include "private.h"
+
 hashtab_t hashtab_create(unsigned int (*hash_value) (hashtab_t h,
 						     const_hashtab_key_t key),
 			 int (*keycmp) (hashtab_t h,
@@ -52,7 +54,7 @@ hashtab_t hashtab_create(unsigned int (*hash_value) (hashtab_t h,
 	p->nel = 0;
 	p->hash_value = hash_value;
 	p->keycmp = keycmp;
-	p->htable = (hashtab_ptr_t *) malloc(sizeof(hashtab_ptr_t) * size);
+	p->htable = (hashtab_ptr_t *) mallocarray(size, sizeof(hashtab_ptr_t));
 	if (p->htable == NULL) {
 		free(p);
 		return NULL;
diff --git a/libsepol/src/link.c b/libsepol/src/link.c
index 461d2feb..a6b10b52 100644
--- a/libsepol/src/link.c
+++ b/libsepol/src/link.c
@@ -34,6 +34,7 @@
 #include <assert.h>
 
 #include "debug.h"
+#include "private.h"
 
 #undef min
 #define min(a,b) (((a) < (b)) ? (a) : (b))
@@ -1679,7 +1680,7 @@ static int copy_scope_index(scope_index_t * src, scope_index_t * dest,
 	}
 
 	/* next copy the enabled permissions data  */
-	if ((dest->class_perms_map = malloc(largest_mapped_class_value *
+	if ((dest->class_perms_map = mallocarray(largest_mapped_class_value,
 					    sizeof(*dest->class_perms_map))) ==
 	    NULL) {
 		goto cleanup;
diff --git a/libsepol/src/module.c b/libsepol/src/module.c
index 02a5de2c..4a51f25c 100644
--- a/libsepol/src/module.c
+++ b/libsepol/src/module.c
@@ -406,14 +406,14 @@ static int module_package_read_offsets(sepol_module_package_t * mod,
 		goto err;
 	}
 
-	off = (size_t *) malloc((nsec + 1) * sizeof(size_t));
+	off = (size_t *) mallocarray(nsec + 1, sizeof(size_t));
 	if (!off) {
 		ERR(file->handle, "out of memory");
 		goto err;
 	}
 
 	free(buf);
-	buf = malloc(sizeof(uint32_t) * nsec);
+	buf = mallocarray(nsec, sizeof(uint32_t));
 	if (!buf) {
 		ERR(file->handle, "out of memory");
 		goto err;
diff --git a/libsepol/src/module_to_cil.c b/libsepol/src/module_to_cil.c
index 16e4004e..ad0880bd 100644
--- a/libsepol/src/module_to_cil.c
+++ b/libsepol/src/module_to_cil.c
@@ -430,7 +430,7 @@ static int stack_init(struct stack **stack)
 		goto exit;
 	}
 
-	s->stack = malloc(sizeof(*s->stack) * STACK_SIZE);
+	s->stack = mallocarray(STACK_SIZE, sizeof(*s->stack));
 	if (s->stack == NULL) {
 		goto exit;
 	}
@@ -1008,7 +1008,7 @@ static int ebitmap_to_names(struct ebitmap *map, char **vals_to_names, char ***n
 		goto exit;
 	}
 
-	name_arr = malloc(sizeof(*name_arr) * num);
+	name_arr = mallocarray(num, sizeof(*name_arr));
 	if (name_arr == NULL) {
 		log_err("Out of memory");
 		rc = -1;
diff --git a/libsepol/src/optimize.c b/libsepol/src/optimize.c
index 6826155c..f8298fb7 100644
--- a/libsepol/src/optimize.c
+++ b/libsepol/src/optimize.c
@@ -31,6 +31,8 @@
 #include <sepol/policydb/policydb.h>
 #include <sepol/policydb/conditional.h>
 
+#include "private.h"
+
 #define TYPE_VEC_INIT_SIZE 16
 
 struct type_vec {
@@ -42,7 +44,7 @@ static int type_vec_init(struct type_vec *v)
 {
 	v->capacity = TYPE_VEC_INIT_SIZE;
 	v->count = 0;
-	v->types = malloc(v->capacity * sizeof(*v->types));
+	v->types = mallocarray(v->capacity, sizeof(*v->types));
 	if (!v->types)
 		return -1;
 	return 0;
@@ -93,7 +95,7 @@ static struct type_vec *build_type_map(const policydb_t *p)
 {
 	unsigned int i, k;
 	ebitmap_node_t *n;
-	struct type_vec *map = malloc(p->p_types.nprim * sizeof(*map));
+	struct type_vec *map = mallocarray(p->p_types.nprim, sizeof(*map));
 	if (!map)
 		return NULL;
 
diff --git a/libsepol/src/policydb.c b/libsepol/src/policydb.c
index 7093d9b7..46fb4893 100644
--- a/libsepol/src/policydb.c
+++ b/libsepol/src/policydb.c
@@ -4111,7 +4111,7 @@ static int scope_read(policydb_t * p, int symnum, struct policy_file *fp)
 		goto cleanup;
 	}
 	if ((scope->decl_ids =
-	     malloc(scope->decl_ids_len * sizeof(uint32_t))) == NULL) {
+	     mallocarray(scope->decl_ids_len, sizeof(uint32_t))) == NULL) {
 		goto cleanup;
 	}
 	rc = next_entry(scope->decl_ids, fp, sizeof(uint32_t) * scope->decl_ids_len);
@@ -4500,8 +4500,8 @@ int policydb_read(policydb_t * p, struct policy_file *fp, unsigned verbose)
 	}
 
 	if (policy_type == POLICY_KERN) {
-		p->type_attr_map = malloc(p->p_types.nprim * sizeof(ebitmap_t));
-		p->attr_type_map = malloc(p->p_types.nprim * sizeof(ebitmap_t));
+		p->type_attr_map = mallocarray(p->p_types.nprim, sizeof(ebitmap_t));
+		p->attr_type_map = mallocarray(p->p_types.nprim, sizeof(ebitmap_t));
 		if (!p->type_attr_map || !p->attr_type_map)
 			goto bad;
 		for (i = 0; i < p->p_types.nprim; i++) {
diff --git a/libsepol/src/private.h b/libsepol/src/private.h
index 6146f59f..d3d65a57 100644
--- a/libsepol/src/private.h
+++ b/libsepol/src/private.h
@@ -83,3 +83,12 @@ extern int next_entry(void *buf, struct policy_file *fp, size_t bytes);
 extern size_t put_entry(const void *ptr, size_t size, size_t n,
 		        struct policy_file *fp);
 extern int str_read(char **strp, struct policy_file *fp, size_t len);
+
+static inline void* mallocarray(size_t nmemb, size_t size) {
+	if (size && nmemb > (size_t)-1 / size) {
+		errno = ENOMEM;
+		return NULL;
+	}
+
+	return malloc(nmemb * size);
+}
diff --git a/libsepol/src/services.c b/libsepol/src/services.c
index 673b3971..a132d080 100644
--- a/libsepol/src/services.c
+++ b/libsepol/src/services.c
@@ -712,7 +712,7 @@ mls_ops:
 	 * Generate the same number of answer buffer entries as expression
 	 * buffers (as there will never be more).
 	 */
-	answer_list = malloc(expr_count * sizeof(*answer_list));
+	answer_list = mallocarray(expr_count, sizeof(*answer_list));
 	if (!answer_list) {
 		ERR(NULL, "failed to allocate answer stack");
 		rc = -ENOMEM;
@@ -2163,7 +2163,7 @@ int sepol_get_user_sids(sepol_security_id_t fromsid,
 	}
 	usercon.user = user->s.value;
 
-	mysids = malloc(maxnel * sizeof(sepol_security_id_t));
+	mysids = mallocarray(maxnel, sizeof(sepol_security_id_t));
 	if (!mysids) {
 		rc = -ENOMEM;
 		goto out;
@@ -2199,7 +2199,7 @@ int sepol_get_user_sids(sepol_security_id_t fromsid,
 			} else {
 				maxnel += SIDS_NEL;
 				mysids2 =
-				    malloc(maxnel *
+				    mallocarray(maxnel,
 					   sizeof(sepol_security_id_t));
 
 				if (!mysids2) {
diff --git a/libsepol/src/sidtab.c b/libsepol/src/sidtab.c
index 255e0725..adeae6eb 100644
--- a/libsepol/src/sidtab.c
+++ b/libsepol/src/sidtab.c
@@ -15,6 +15,7 @@
 #include <sepol/policydb/sidtab.h>
 
 #include "flask.h"
+#include "private.h"
 
 #define SIDTAB_HASH(sid) \
 (sid & SIDTAB_HASH_MASK)
@@ -27,7 +28,7 @@ int sepol_sidtab_init(sidtab_t * s)
 {
 	int i;
 
-	s->htable = malloc(sizeof(sidtab_ptr_t) * SIDTAB_SIZE);
+	s->htable = mallocarray(SIDTAB_SIZE, sizeof(sidtab_ptr_t));
 	if (!s->htable)
 		return -ENOMEM;
 	for (i = 0; i < SIDTAB_SIZE; i++)
diff --git a/libsepol/src/user_record.c b/libsepol/src/user_record.c
index ac520060..c1356a6b 100644
--- a/libsepol/src/user_record.c
+++ b/libsepol/src/user_record.c
@@ -4,6 +4,7 @@
 
 #include "user_internal.h"
 #include "debug.h"
+#include "private.h"
 
 struct sepol_user {
 	/* This user's name */
@@ -265,7 +266,7 @@ int sepol_user_get_roles(sepol_handle_t * handle,
 
 	unsigned int i;
 	const char **tmp_roles =
-	    (const char **)malloc(sizeof(char *) * user->num_roles);
+	    (const char **)mallocarray(user->num_roles, sizeof(char *));
 	if (!tmp_roles)
 		goto omem;
 
diff --git a/libsepol/src/write.c b/libsepol/src/write.c
index 3bd034d6..9df5b0bd 100644
--- a/libsepol/src/write.c
+++ b/libsepol/src/write.c
@@ -2117,7 +2117,7 @@ static int scope_write(hashtab_key_t key, hashtab_datum_t datum, void *ptr)
 		 * buffer.  this would have been easier with C99's
 		 * dynamic arrays... */
 		rc = POLICYDB_ERROR;
-		dyn_buf = malloc(items * sizeof(*dyn_buf));
+		dyn_buf = mallocarray(items, sizeof(*dyn_buf));
 		if (!dyn_buf)
 			goto err;
 		buf = dyn_buf;
-- 
2.33.0

