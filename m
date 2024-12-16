Return-Path: <selinux+bounces-2534-lists+selinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EA3F9F3660
	for <lists+selinux@lfdr.de>; Mon, 16 Dec 2024 17:44:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 25B29188579D
	for <lists+selinux@lfdr.de>; Mon, 16 Dec 2024 16:44:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD29D206F05;
	Mon, 16 Dec 2024 16:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=seltendoof.de header.i=@seltendoof.de header.b="jgR5LqUl"
X-Original-To: selinux@vger.kernel.org
Received: from server02.seltendoof.de (server02.seltendoof.de [168.119.48.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51D62207A03;
	Mon, 16 Dec 2024 16:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.48.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734367301; cv=none; b=f0qKHCVwuCmCsp8TxJh7vfP8qRJDBqhEi1YPRBjd6jxF/g3nrbI33yCmk/dTH3zaSHjCk5C6atMCPEk7RGmbl+m5JDMNn0+aY4VTLGLFLuuCNs06ALfS5yD8oECzdcgrM16MrIP6EHxT1dBJfpDF+dwu62H/QmqBcnf5G6G9nSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734367301; c=relaxed/simple;
	bh=AqU7dtIVdVn4Xoif9jfRvIHAkB6o5Ce/RikhKWYAG44=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=n8/40/dFSARyDLyTnnqbLHf5bzaVT4gympfdY4IJDksg6gC4VeGai0Q6VyEwtLCtTah3ZZGADUBw2lbY2DFKcOeaHUn/IoKHHjm6CwPQpWyPZhuGeN35U2ckFnjo5xGmRPvPg0PL4fRUJpnloIsyOUwCKaxwd4pV6f+KQkxCdl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=seltendoof.de; spf=pass smtp.mailfrom=seltendoof.de; dkim=pass (2048-bit key) header.d=seltendoof.de header.i=@seltendoof.de header.b=jgR5LqUl; arc=none smtp.client-ip=168.119.48.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=seltendoof.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=seltendoof.de
From: =?UTF-8?q?Christian=20G=C3=B6ttsche?= <cgoettsche@seltendoof.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seltendoof.de;
	s=2023072701; t=1734367297;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QK2yWQCjIb6QDrwn8vMRQ8K2KUbtUulufCLy2r9Bnfg=;
	b=jgR5LqUlPlYFXf3y7GcGrU4rvB5PjppWV67ABFNvV+MpOmLw13v7GKDiprcsVTYJMMXZMa
	xgGOxPBFWNc7Saie9v+f2FP+2InyYXdLUdESHDfsHGXFK07TENK1RLi4A2XwoZiHf6ha/p
	Yc1UB0ntigo1/4ysXncHJs/eGHK92ZNWyhAX+zmopvTCOCxf0cstHPIbv22yEKsO6hC4sv
	PmZuVpRTSZ4CS0gd49F0yA3G86iEz9kb3jOIW5gl1LoxtKmBpRUWeoFiIwlSAYuC4/8veb
	JVucfMQESjlt9DFP/MMg4PdFnkZZCTH6gDtCOGdPzz8eOB9CyeNP/U5UHSpZ1Q==
To: selinux@vger.kernel.org
Cc: =?UTF-8?q?Christian=20G=C3=B6ttsche?= <cgzones@googlemail.com>,
	Paul Moore <paul@paul-moore.com>,
	Stephen Smalley <stephen.smalley.work@gmail.com>,
	Ondrej Mosnacek <omosnace@redhat.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	=?UTF-8?q?Thi=C3=A9baud=20Weksteen?= <tweek@google.com>,
	=?UTF-8?q?Bram=20Bonn=C3=A9?= <brambonne@google.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Eric Suen <ericsu@linux.microsoft.com>,
	Canfeng Guo <guocanfeng@uniontech.com>
Subject: [RFC PATCH v2 07/22] selinux: use known type instead of void pointer
Date: Mon, 16 Dec 2024 17:40:05 +0100
Message-ID: <20241216164055.96267-7-cgoettsche@seltendoof.de>
In-Reply-To: <20241216164055.96267-1-cgoettsche@seltendoof.de>
References: <20241216164055.96267-1-cgoettsche@seltendoof.de>
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

Improve type safety and readability by using the known type.

Signed-off-by: Christian Göttsche <cgzones@googlemail.com>
---
v2:
 - move one little diff from subsequent patch to this one
 - reorder struct definition in policydb.h as suggested by Daniel
---
 security/selinux/ss/avtab.c       |  8 +--
 security/selinux/ss/avtab.h       |  9 +--
 security/selinux/ss/conditional.c | 12 ++--
 security/selinux/ss/conditional.h |  6 +-
 security/selinux/ss/ebitmap.c     |  4 +-
 security/selinux/ss/ebitmap.h     |  5 +-
 security/selinux/ss/policydb.c    | 91 ++++++++++++++++---------------
 security/selinux/ss/policydb.h    | 16 +++---
 8 files changed, 77 insertions(+), 74 deletions(-)

diff --git a/security/selinux/ss/avtab.c b/security/selinux/ss/avtab.c
index 83add633f92a..c2c31521cace 100644
--- a/security/selinux/ss/avtab.c
+++ b/security/selinux/ss/avtab.c
@@ -336,7 +336,7 @@ static const uint16_t spec_order[] = {
 };
 /* clang-format on */
 
-int avtab_read_item(struct avtab *a, void *fp, struct policydb *pol,
+int avtab_read_item(struct avtab *a, struct policy_file *fp, struct policydb *pol,
 		    int (*insertf)(struct avtab *a, const struct avtab_key *k,
 				   const struct avtab_datum *d, void *p),
 		    void *p, bool conditional)
@@ -507,7 +507,7 @@ static int avtab_insertf(struct avtab *a, const struct avtab_key *k,
 	return avtab_insert(a, k, d);
 }
 
-int avtab_read(struct avtab *a, void *fp, struct policydb *pol)
+int avtab_read(struct avtab *a, struct policy_file *fp, struct policydb *pol)
 {
 	int rc;
 	__le32 buf[1];
@@ -550,7 +550,7 @@ int avtab_read(struct avtab *a, void *fp, struct policydb *pol)
 	goto out;
 }
 
-int avtab_write_item(struct policydb *p, const struct avtab_node *cur, void *fp)
+int avtab_write_item(struct policydb *p, const struct avtab_node *cur, struct policy_file *fp)
 {
 	__le16 buf16[4];
 	__le32 buf32[ARRAY_SIZE(cur->datum.u.xperms->perms.p)];
@@ -586,7 +586,7 @@ int avtab_write_item(struct policydb *p, const struct avtab_node *cur, void *fp)
 	return 0;
 }
 
-int avtab_write(struct policydb *p, struct avtab *a, void *fp)
+int avtab_write(struct policydb *p, struct avtab *a, struct policy_file *fp)
 {
 	u32 i;
 	int rc = 0;
diff --git a/security/selinux/ss/avtab.h b/security/selinux/ss/avtab.h
index 32b8335cf93e..850b3453f259 100644
--- a/security/selinux/ss/avtab.h
+++ b/security/selinux/ss/avtab.h
@@ -105,15 +105,16 @@ static inline void avtab_hash_eval(struct avtab *h, const char *tag)
 #endif
 
 struct policydb;
-int avtab_read_item(struct avtab *a, void *fp, struct policydb *pol,
+struct policy_file;
+int avtab_read_item(struct avtab *a, struct policy_file *fp, struct policydb *pol,
 		    int (*insert)(struct avtab *a, const struct avtab_key *k,
 				  const struct avtab_datum *d, void *p),
 		    void *p, bool conditional);
 
-int avtab_read(struct avtab *a, void *fp, struct policydb *pol);
+int avtab_read(struct avtab *a, struct policy_file *fp, struct policydb *pol);
 int avtab_write_item(struct policydb *p, const struct avtab_node *cur,
-		     void *fp);
-int avtab_write(struct policydb *p, struct avtab *a, void *fp);
+		     struct policy_file *fp);
+int avtab_write(struct policydb *p, struct avtab *a, struct policy_file *fp);
 
 struct avtab_node *avtab_insert_nonunique(struct avtab *h,
 					  const struct avtab_key *key,
diff --git a/security/selinux/ss/conditional.c b/security/selinux/ss/conditional.c
index c9a3060f08a4..d8dcaf2ca88f 100644
--- a/security/selinux/ss/conditional.c
+++ b/security/selinux/ss/conditional.c
@@ -206,7 +206,7 @@ static int bool_isvalid(struct cond_bool_datum *b)
 	return 1;
 }
 
-int cond_read_bool(struct policydb *p, struct symtab *s, void *fp)
+int cond_read_bool(struct policydb *p, struct symtab *s, struct policy_file *fp)
 {
 	char *key = NULL;
 	struct cond_bool_datum *booldatum;
@@ -323,7 +323,7 @@ static int cond_insertf(struct avtab *a, const struct avtab_key *k,
 	return 0;
 }
 
-static int cond_read_av_list(struct policydb *p, void *fp,
+static int cond_read_av_list(struct policydb *p, struct policy_file *fp,
 			     struct cond_av_list *list,
 			     struct cond_av_list *other)
 {
@@ -375,7 +375,7 @@ static int expr_node_isvalid(struct policydb *p, struct cond_expr_node *expr)
 	return 1;
 }
 
-static int cond_read_node(struct policydb *p, struct cond_node *node, void *fp)
+static int cond_read_node(struct policydb *p, struct cond_node *node, struct policy_file *fp)
 {
 	__le32 buf[2];
 	u32 i, len;
@@ -415,7 +415,7 @@ static int cond_read_node(struct policydb *p, struct cond_node *node, void *fp)
 	return cond_read_av_list(p, fp, &node->false_list, &node->true_list);
 }
 
-int cond_read_list(struct policydb *p, void *fp)
+int cond_read_list(struct policydb *p, struct policy_file *fp)
 {
 	__le32 buf[1];
 	u32 i, len;
@@ -453,7 +453,7 @@ int cond_write_bool(void *vkey, void *datum, void *ptr)
 	char *key = vkey;
 	struct cond_bool_datum *booldatum = datum;
 	struct policy_data *pd = ptr;
-	void *fp = pd->fp;
+	struct policy_file *fp = pd->fp;
 	__le32 buf[3];
 	u32 len;
 	int rc;
@@ -536,7 +536,7 @@ static int cond_write_node(struct policydb *p, struct cond_node *node,
 	return 0;
 }
 
-int cond_write_list(struct policydb *p, void *fp)
+int cond_write_list(struct policydb *p, struct policy_file *fp)
 {
 	u32 i;
 	__le32 buf[1];
diff --git a/security/selinux/ss/conditional.h b/security/selinux/ss/conditional.h
index 8827715bad75..468e98ad3ea1 100644
--- a/security/selinux/ss/conditional.h
+++ b/security/selinux/ss/conditional.h
@@ -68,10 +68,10 @@ int cond_destroy_bool(void *key, void *datum, void *p);
 
 int cond_index_bool(void *key, void *datum, void *datap);
 
-int cond_read_bool(struct policydb *p, struct symtab *s, void *fp);
-int cond_read_list(struct policydb *p, void *fp);
+int cond_read_bool(struct policydb *p, struct symtab *s, struct policy_file *fp);
+int cond_read_list(struct policydb *p, struct policy_file *fp);
 int cond_write_bool(void *key, void *datum, void *ptr);
-int cond_write_list(struct policydb *p, void *fp);
+int cond_write_list(struct policydb *p, struct policy_file *fp);
 
 void cond_compute_av(struct avtab *ctab, struct avtab_key *key,
 		     struct av_decision *avd, struct extended_perms *xperms);
diff --git a/security/selinux/ss/ebitmap.c b/security/selinux/ss/ebitmap.c
index 1cc1e7e711e3..43bc19e21960 100644
--- a/security/selinux/ss/ebitmap.c
+++ b/security/selinux/ss/ebitmap.c
@@ -360,7 +360,7 @@ void ebitmap_destroy(struct ebitmap *e)
 	e->node = NULL;
 }
 
-int ebitmap_read(struct ebitmap *e, void *fp)
+int ebitmap_read(struct ebitmap *e, struct policy_file *fp)
 {
 	struct ebitmap_node *n = NULL;
 	u32 mapunit, count, startbit, index, i;
@@ -478,7 +478,7 @@ int ebitmap_read(struct ebitmap *e, void *fp)
 	goto out;
 }
 
-int ebitmap_write(const struct ebitmap *e, void *fp)
+int ebitmap_write(const struct ebitmap *e, struct policy_file *fp)
 {
 	struct ebitmap_node *n;
 	u32 bit, count, last_bit, last_startbit;
diff --git a/security/selinux/ss/ebitmap.h b/security/selinux/ss/ebitmap.h
index 49eb33de87e0..c9569998f287 100644
--- a/security/selinux/ss/ebitmap.h
+++ b/security/selinux/ss/ebitmap.h
@@ -129,8 +129,9 @@ int ebitmap_contains(const struct ebitmap *e1, const struct ebitmap *e2,
 int ebitmap_get_bit(const struct ebitmap *e, u32 bit);
 int ebitmap_set_bit(struct ebitmap *e, u32 bit, int value);
 void ebitmap_destroy(struct ebitmap *e);
-int ebitmap_read(struct ebitmap *e, void *fp);
-int ebitmap_write(const struct ebitmap *e, void *fp);
+struct policy_file;
+int ebitmap_read(struct ebitmap *e, struct policy_file *fp);
+int ebitmap_write(const struct ebitmap *e, struct policy_file *fp);
 u32 ebitmap_hash(const struct ebitmap *e, u32 hash);
 
 #ifdef CONFIG_NETLABEL
diff --git a/security/selinux/ss/policydb.c b/security/selinux/ss/policydb.c
index eb944582d7a6..b57f7db4cd89 100644
--- a/security/selinux/ss/policydb.c
+++ b/security/selinux/ss/policydb.c
@@ -999,7 +999,7 @@ int policydb_context_isvalid(struct policydb *p, struct context *c)
  * Read a MLS range structure from a policydb binary
  * representation file.
  */
-static int mls_read_range_helper(struct mls_range *r, void *fp)
+static int mls_read_range_helper(struct mls_range *r, struct policy_file *fp)
 {
 	__le32 buf[2];
 	u32 items;
@@ -1059,7 +1059,7 @@ static int mls_read_range_helper(struct mls_range *r, void *fp)
  * from a policydb binary representation file.
  */
 static int context_read_and_validate(struct context *c, struct policydb *p,
-				     void *fp)
+				     struct policy_file *fp)
 {
 	__le32 buf[3];
 	int rc;
@@ -1097,7 +1097,7 @@ static int context_read_and_validate(struct context *c, struct policydb *p,
  * binary representation file.
  */
 
-static int str_read(char **strp, gfp_t flags, void *fp, u32 len)
+static int str_read(char **strp, gfp_t flags, struct policy_file *fp, u32 len)
 {
 	int rc;
 	char *str;
@@ -1120,7 +1120,7 @@ static int str_read(char **strp, gfp_t flags, void *fp, u32 len)
 	return 0;
 }
 
-static int perm_read(struct policydb *p, struct symtab *s, void *fp)
+static int perm_read(struct policydb *p, struct symtab *s, struct policy_file *fp)
 {
 	char *key = NULL;
 	struct perm_datum *perdatum;
@@ -1153,7 +1153,7 @@ static int perm_read(struct policydb *p, struct symtab *s, void *fp)
 	return rc;
 }
 
-static int common_read(struct policydb *p, struct symtab *s, void *fp)
+static int common_read(struct policydb *p, struct symtab *s, struct policy_file *fp)
 {
 	char *key = NULL;
 	struct common_datum *comdatum;
@@ -1205,7 +1205,7 @@ static void type_set_init(struct type_set *t)
 	ebitmap_init(&t->negset);
 }
 
-static int type_set_read(struct type_set *t, void *fp)
+static int type_set_read(struct type_set *t, struct policy_file *fp)
 {
 	__le32 buf[1];
 	int rc;
@@ -1224,7 +1224,7 @@ static int type_set_read(struct type_set *t, void *fp)
 }
 
 static int read_cons_helper(struct policydb *p, struct constraint_node **nodep,
-			    u32 ncons, int allowxtarget, void *fp)
+			    u32 ncons, int allowxtarget, struct policy_file *fp)
 {
 	struct constraint_node *c, *lc;
 	struct constraint_expr *e, *le;
@@ -1318,7 +1318,7 @@ static int read_cons_helper(struct policydb *p, struct constraint_node **nodep,
 	return 0;
 }
 
-static int class_read(struct policydb *p, struct symtab *s, void *fp)
+static int class_read(struct policydb *p, struct symtab *s, struct policy_file *fp)
 {
 	char *key = NULL;
 	struct class_datum *cladatum;
@@ -1415,7 +1415,7 @@ static int class_read(struct policydb *p, struct symtab *s, void *fp)
 	return rc;
 }
 
-static int role_read(struct policydb *p, struct symtab *s, void *fp)
+static int role_read(struct policydb *p, struct symtab *s, struct policy_file *fp)
 {
 	char *key = NULL;
 	struct role_datum *role;
@@ -1472,7 +1472,7 @@ static int role_read(struct policydb *p, struct symtab *s, void *fp)
 	return rc;
 }
 
-static int type_read(struct policydb *p, struct symtab *s, void *fp)
+static int type_read(struct policydb *p, struct symtab *s, struct policy_file *fp)
 {
 	char *key = NULL;
 	struct type_datum *typdatum;
@@ -1524,7 +1524,7 @@ static int type_read(struct policydb *p, struct symtab *s, void *fp)
  * Read a MLS level structure from a policydb binary
  * representation file.
  */
-static int mls_read_level(struct mls_level *lp, void *fp)
+static int mls_read_level(struct mls_level *lp, struct policy_file *fp)
 {
 	__le32 buf[1];
 	int rc;
@@ -1546,7 +1546,7 @@ static int mls_read_level(struct mls_level *lp, void *fp)
 	return 0;
 }
 
-static int user_read(struct policydb *p, struct symtab *s, void *fp)
+static int user_read(struct policydb *p, struct symtab *s, struct policy_file *fp)
 {
 	char *key = NULL;
 	struct user_datum *usrdatum;
@@ -1597,7 +1597,7 @@ static int user_read(struct policydb *p, struct symtab *s, void *fp)
 	return rc;
 }
 
-static int sens_read(struct policydb *p, struct symtab *s, void *fp)
+static int sens_read(struct policydb *p, struct symtab *s, struct policy_file *fp)
 {
 	char *key = NULL;
 	struct level_datum *levdatum;
@@ -1638,7 +1638,7 @@ static int sens_read(struct policydb *p, struct symtab *s, void *fp)
 	return rc;
 }
 
-static int cat_read(struct policydb *p, struct symtab *s, void *fp)
+static int cat_read(struct policydb *p, struct symtab *s, struct policy_file *fp)
 {
 	char *key = NULL;
 	struct cat_datum *catdatum;
@@ -1673,7 +1673,7 @@ static int cat_read(struct policydb *p, struct symtab *s, void *fp)
 
 /* clang-format off */
 static int (*const read_f[SYM_NUM])(struct policydb *p, struct symtab *s,
-				    void *fp) = {
+				    struct policy_file *fp) = {
 	common_read,
 	class_read,
 	role_read,
@@ -1843,7 +1843,7 @@ u32 string_to_av_perm(struct policydb *p, u16 tclass, const char *name)
 	return 1U << (perdatum->value - 1);
 }
 
-static int range_read(struct policydb *p, void *fp)
+static int range_read(struct policydb *p, struct policy_file *fp)
 {
 	struct range_trans *rt = NULL;
 	struct mls_range *r = NULL;
@@ -1920,7 +1920,7 @@ static int range_read(struct policydb *p, void *fp)
 	return rc;
 }
 
-static int filename_trans_read_helper_compat(struct policydb *p, void *fp)
+static int filename_trans_read_helper_compat(struct policydb *p, struct policy_file *fp)
 {
 	struct filename_trans_key key, *ft = NULL;
 	struct filename_trans_datum *last, *datum = NULL;
@@ -2005,7 +2005,7 @@ static int filename_trans_read_helper_compat(struct policydb *p, void *fp)
 	return rc;
 }
 
-static int filename_trans_read_helper(struct policydb *p, void *fp)
+static int filename_trans_read_helper(struct policydb *p, struct policy_file *fp)
 {
 	struct filename_trans_key *ft = NULL;
 	struct filename_trans_datum **dst, *datum, *first = NULL;
@@ -2094,7 +2094,7 @@ static int filename_trans_read_helper(struct policydb *p, void *fp)
 	return rc;
 }
 
-static int filename_trans_read(struct policydb *p, void *fp)
+static int filename_trans_read(struct policydb *p, struct policy_file *fp)
 {
 	u32 nel, i;
 	__le32 buf[1];
@@ -2135,7 +2135,7 @@ static int filename_trans_read(struct policydb *p, void *fp)
 	return 0;
 }
 
-static int genfs_read(struct policydb *p, void *fp)
+static int genfs_read(struct policydb *p, struct policy_file *fp)
 {
 	int rc;
 	u32 i, j, nel, nel2, len, len2;
@@ -2249,7 +2249,7 @@ static int genfs_read(struct policydb *p, void *fp)
 }
 
 static int ocontext_read(struct policydb *p,
-			 const struct policydb_compat_info *info, void *fp)
+			 const struct policydb_compat_info *info, struct policy_file *fp)
 {
 	int rc;
 	unsigned int i;
@@ -2446,7 +2446,7 @@ static int ocontext_read(struct policydb *p,
  * Read the configuration data from a policy database binary
  * representation file into a policy database structure.
  */
-int policydb_read(struct policydb *p, void *fp)
+int policydb_read(struct policydb *p, struct policy_file *fp)
 {
 	struct role_allow *ra, *lra;
 	struct role_trans_key *rtk = NULL;
@@ -2769,7 +2769,7 @@ int policydb_read(struct policydb *p, void *fp)
  * Write a MLS level structure to a policydb binary
  * representation file.
  */
-static int mls_write_level(struct mls_level *l, void *fp)
+static int mls_write_level(struct mls_level *l, struct policy_file *fp)
 {
 	__le32 buf[1];
 	int rc;
@@ -2790,7 +2790,7 @@ static int mls_write_level(struct mls_level *l, void *fp)
  * Write a MLS range structure to a policydb binary
  * representation file.
  */
-static int mls_write_range_helper(struct mls_range *r, void *fp)
+static int mls_write_range_helper(struct mls_range *r, struct policy_file *fp)
 {
 	__le32 buf[3];
 	size_t items;
@@ -2830,7 +2830,7 @@ static int sens_write(void *vkey, void *datum, void *ptr)
 	char *key = vkey;
 	struct level_datum *levdatum = datum;
 	struct policy_data *pd = ptr;
-	void *fp = pd->fp;
+	struct policy_file *fp = pd->fp;
 	__le32 buf[2];
 	size_t len;
 	int rc;
@@ -2858,7 +2858,7 @@ static int cat_write(void *vkey, void *datum, void *ptr)
 	char *key = vkey;
 	struct cat_datum *catdatum = datum;
 	struct policy_data *pd = ptr;
-	void *fp = pd->fp;
+	struct policy_file *fp = pd->fp;
 	__le32 buf[3];
 	size_t len;
 	int rc;
@@ -2883,7 +2883,7 @@ static int role_trans_write_one(void *key, void *datum, void *ptr)
 	struct role_trans_key *rtk = key;
 	struct role_trans_datum *rtd = datum;
 	struct policy_data *pd = ptr;
-	void *fp = pd->fp;
+	struct policy_file *fp = pd->fp;
 	struct policydb *p = pd->p;
 	__le32 buf[3];
 	int rc;
@@ -2903,7 +2903,7 @@ static int role_trans_write_one(void *key, void *datum, void *ptr)
 	return 0;
 }
 
-static int role_trans_write(struct policydb *p, void *fp)
+static int role_trans_write(struct policydb *p, struct policy_file *fp)
 {
 	struct policy_data pd = { .p = p, .fp = fp };
 	__le32 buf[1];
@@ -2917,7 +2917,7 @@ static int role_trans_write(struct policydb *p, void *fp)
 	return hashtab_map(&p->role_tr, role_trans_write_one, &pd);
 }
 
-static int role_allow_write(struct role_allow *r, void *fp)
+static int role_allow_write(struct role_allow *r, struct policy_file *fp)
 {
 	struct role_allow *ra;
 	__le32 buf[2];
@@ -2945,7 +2945,7 @@ static int role_allow_write(struct role_allow *r, void *fp)
  * Write a security context structure
  * to a policydb binary representation file.
  */
-static int context_write(struct policydb *p, struct context *c, void *fp)
+static int context_write(struct policydb *p, struct context *c, struct policy_file *fp)
 {
 	int rc;
 	__le32 buf[3];
@@ -2998,7 +2998,7 @@ static int common_write(void *vkey, void *datum, void *ptr)
 	char *key = vkey;
 	struct common_datum *comdatum = datum;
 	struct policy_data *pd = ptr;
-	void *fp = pd->fp;
+	struct policy_file *fp = pd->fp;
 	__le32 buf[4];
 	size_t len;
 	int rc;
@@ -3023,7 +3023,7 @@ static int common_write(void *vkey, void *datum, void *ptr)
 	return 0;
 }
 
-static int type_set_write(struct type_set *t, void *fp)
+static int type_set_write(struct type_set *t, struct policy_file *fp)
 {
 	int rc;
 	__le32 buf[1];
@@ -3042,7 +3042,7 @@ static int type_set_write(struct type_set *t, void *fp)
 }
 
 static int write_cons_helper(struct policydb *p, struct constraint_node *node,
-			     void *fp)
+			     struct policy_file *fp)
 {
 	struct constraint_node *c;
 	struct constraint_expr *e;
@@ -3093,7 +3093,7 @@ static int class_write(void *vkey, void *datum, void *ptr)
 	char *key = vkey;
 	struct class_datum *cladatum = datum;
 	struct policy_data *pd = ptr;
-	void *fp = pd->fp;
+	struct policy_file *fp = pd->fp;
 	struct policydb *p = pd->p;
 	struct constraint_node *c;
 	__le32 buf[6];
@@ -3178,7 +3178,7 @@ static int role_write(void *vkey, void *datum, void *ptr)
 	char *key = vkey;
 	struct role_datum *role = datum;
 	struct policy_data *pd = ptr;
-	void *fp = pd->fp;
+	struct policy_file *fp = pd->fp;
 	struct policydb *p = pd->p;
 	__le32 buf[3];
 	size_t items, len;
@@ -3218,7 +3218,7 @@ static int type_write(void *vkey, void *datum, void *ptr)
 	struct type_datum *typdatum = datum;
 	struct policy_data *pd = ptr;
 	struct policydb *p = pd->p;
-	void *fp = pd->fp;
+	struct policy_file *fp = pd->fp;
 	__le32 buf[4];
 	int rc;
 	size_t items, len;
@@ -3259,7 +3259,7 @@ static int user_write(void *vkey, void *datum, void *ptr)
 	struct user_datum *usrdatum = datum;
 	struct policy_data *pd = ptr;
 	struct policydb *p = pd->p;
-	void *fp = pd->fp;
+	struct policy_file *fp = pd->fp;
 	__le32 buf[3];
 	size_t items, len;
 	int rc;
@@ -3308,7 +3308,8 @@ static int (*const write_f[SYM_NUM])(void *key, void *datum, void *datap) = {
 /* clang-format on */
 
 static int ocontext_write(struct policydb *p,
-			  const struct policydb_compat_info *info, void *fp)
+			  const struct policydb_compat_info *info,
+			  struct policy_file *fp)
 {
 	unsigned int i, j;
 	int rc;
@@ -3444,7 +3445,7 @@ static int ocontext_write(struct policydb *p,
 	return 0;
 }
 
-static int genfs_write(struct policydb *p, void *fp)
+static int genfs_write(struct policydb *p, struct policy_file *fp)
 {
 	struct genfs *genfs;
 	struct ocontext *c;
@@ -3502,7 +3503,7 @@ static int range_write_helper(void *key, void *data, void *ptr)
 	struct range_trans *rt = key;
 	struct mls_range *r = data;
 	struct policy_data *pd = ptr;
-	void *fp = pd->fp;
+	struct policy_file *fp = pd->fp;
 	struct policydb *p = pd->p;
 	int rc;
 
@@ -3524,7 +3525,7 @@ static int range_write_helper(void *key, void *data, void *ptr)
 	return 0;
 }
 
-static int range_write(struct policydb *p, void *fp)
+static int range_write(struct policydb *p, struct policy_file *fp)
 {
 	__le32 buf[1];
 	int rc;
@@ -3551,7 +3552,7 @@ static int filename_write_helper_compat(void *key, void *data, void *ptr)
 	struct filename_trans_key *ft = key;
 	struct filename_trans_datum *datum = data;
 	struct ebitmap_node *node;
-	void *fp = ptr;
+	struct policy_file *fp = ptr;
 	__le32 buf[4];
 	int rc;
 	u32 bit, len = strlen(ft->name);
@@ -3588,7 +3589,7 @@ static int filename_write_helper(void *key, void *data, void *ptr)
 {
 	struct filename_trans_key *ft = key;
 	struct filename_trans_datum *datum;
-	void *fp = ptr;
+	struct policy_file *fp = ptr;
 	__le32 buf[3];
 	int rc;
 	u32 ndatum, len = strlen(ft->name);
@@ -3633,7 +3634,7 @@ static int filename_write_helper(void *key, void *data, void *ptr)
 	return 0;
 }
 
-static int filename_trans_write(struct policydb *p, void *fp)
+static int filename_trans_write(struct policydb *p, struct policy_file *fp)
 {
 	__le32 buf[1];
 	int rc;
@@ -3665,7 +3666,7 @@ static int filename_trans_write(struct policydb *p, void *fp)
  * structure to a policy database binary representation
  * file.
  */
-int policydb_write(struct policydb *p, void *fp)
+int policydb_write(struct policydb *p, struct policy_file *fp)
 {
 	unsigned int num_syms;
 	int rc;
diff --git a/security/selinux/ss/policydb.h b/security/selinux/ss/policydb.h
index 5c11069121d3..c699fa52f59a 100644
--- a/security/selinux/ss/policydb.h
+++ b/security/selinux/ss/policydb.h
@@ -312,14 +312,19 @@ struct policydb {
 	u32 process_trans_perms;
 } __randomize_layout;
 
+struct policy_file {
+	char *data;
+	size_t len;
+};
+
 extern void policydb_destroy(struct policydb *p);
 extern int policydb_load_isids(struct policydb *p, struct sidtab *s);
 extern int policydb_context_isvalid(struct policydb *p, struct context *c);
 extern int policydb_class_isvalid(struct policydb *p, unsigned int class);
 extern int policydb_type_isvalid(struct policydb *p, unsigned int type);
 extern int policydb_role_isvalid(struct policydb *p, unsigned int role);
-extern int policydb_read(struct policydb *p, void *fp);
-extern int policydb_write(struct policydb *p, void *fp);
+extern int policydb_read(struct policydb *p, struct policy_file *fp);
+extern int policydb_write(struct policydb *p, struct policy_file *fp);
 
 extern struct filename_trans_datum *
 policydb_filenametr_search(struct policydb *p, struct filename_trans_key *key);
@@ -342,14 +347,9 @@ policydb_roletr_search(struct policydb *p, struct role_trans_key *key);
 #define POLICYDB_MAGIC	SELINUX_MAGIC
 #define POLICYDB_STRING "SE Linux"
 
-struct policy_file {
-	char *data;
-	size_t len;
-};
-
 struct policy_data {
 	struct policydb *p;
-	void *fp;
+	struct policy_file *fp;
 };
 
 static inline int next_entry(void *buf, struct policy_file *fp, size_t bytes)
-- 
2.45.2


