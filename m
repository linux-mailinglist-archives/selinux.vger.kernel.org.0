Return-Path: <selinux+bounces-2124-lists+selinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6C999AD26D
	for <lists+selinux@lfdr.de>; Wed, 23 Oct 2024 19:21:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 16624B23955
	for <lists+selinux@lfdr.de>; Wed, 23 Oct 2024 17:21:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 434A21CF7AB;
	Wed, 23 Oct 2024 17:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=seltendoof.de header.i=@seltendoof.de header.b="sJSDsft6"
X-Original-To: selinux@vger.kernel.org
Received: from server02.seltendoof.de (server02.seltendoof.de [168.119.48.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BB7A1CF7C5
	for <selinux@vger.kernel.org>; Wed, 23 Oct 2024 17:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.48.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729704055; cv=none; b=Ir7qim93KIZB6c2aruTj2YLK7tPIutN5krSH3g/oxzw+UK8H0UVp3zEC49X4qfTtjUHyiaM2jKWHJJPzl7p2b/JE8vjRr0qCqo6wTyftIqjJrjqpJcTUkzX6EhrrwuISoatg95281/SeoiVVJocnmpymU1NHYoNDeyTRTto41PQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729704055; c=relaxed/simple;
	bh=ZNtB0GAMXA0xNmxkiFbpboek0UHYdT6gdAX9TdVvlu0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qaAxgIHZUgKOdCq1dyJ8Iva+Me/g+kqy/aV2VXt6gAFzvR8wOMILtkRb7iYw4nbBTUIPNueYEOOTfldO5xHkfpZIzt0D37/oCA+M+dlwcS+PJHPy34R6oReElVgqm46imki2Omjpmy6ehm/2+GNuhDpmy8AG+O98xx3NchTjTjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=seltendoof.de; spf=pass smtp.mailfrom=seltendoof.de; dkim=pass (2048-bit key) header.d=seltendoof.de header.i=@seltendoof.de header.b=sJSDsft6; arc=none smtp.client-ip=168.119.48.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=seltendoof.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=seltendoof.de
From: =?UTF-8?q?Christian=20G=C3=B6ttsche?= <cgoettsche@seltendoof.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seltendoof.de;
	s=2023072701; t=1729704050;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZAKOd4LXMHMfI2ZSwK73J9Wy4qZ2aknEpvltOfeWIDY=;
	b=sJSDsft6YYXnUCVzks788gh0uHH/HoA4PPO00tOWkOhaaQ7w9dcqItPvLRRhb0otdnG/sL
	KHphx7BoSiaM3Op8oQLcZeqMwZ7gSVXhk2H5vj+tbc6dSNhBl/8VeZFNgPogvjqg69NVPl
	8aAFIGEPncMKlXMFgRpIYke6ds7yU5RRAvsTDjCpxfli0gAJQIecQk9ndkIlreYy1a09NV
	axLa4PT1gdHlO8r5A0+zPU2lZP7FyXDRiyQUEHQbT1Usm/VJyc/sJl4Pb7ytWP1JNqwxq6
	+Ie3izeFtQsxg7IL4qcqldWeHH5EnrEELy1uqW4o2KlH0gwTxkaIk9Ihymdlog==
To: selinux@vger.kernel.org
Cc: =?UTF-8?q?Christian=20G=C3=B6ttsche?= <cgzones@googlemail.com>
Subject: [PATCH 2/3] checkpolicy: add support for xperms in conditional policies
Date: Wed, 23 Oct 2024 19:20:43 +0200
Message-ID: <20241023172044.98572-2-cgoettsche@seltendoof.de>
In-Reply-To: <20241023172044.98572-1-cgoettsche@seltendoof.de>
References: <20241023172044.98572-1-cgoettsche@seltendoof.de>
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
 checkpolicy/policy_define.c                   | 108 +++++++++++++++---
 checkpolicy/policy_define.h                   |   1 +
 checkpolicy/policy_parse.y                    |  20 +++-
 checkpolicy/tests/policy_allonce.conf         |   7 +-
 .../tests/policy_allonce.expected.conf        |  10 ++
 .../tests/policy_allonce.expected_opt.conf    |  10 ++
 6 files changed, 141 insertions(+), 15 deletions(-)

diff --git a/checkpolicy/policy_define.c b/checkpolicy/policy_define.c
index f8a10154..38992b1a 100644
--- a/checkpolicy/policy_define.c
+++ b/checkpolicy/policy_define.c
@@ -1859,6 +1859,8 @@ int define_bool_tunable(int is_tunable)
 
 avrule_t *define_cond_pol_list(avrule_t * avlist, avrule_t * sl)
 {
+	avrule_t *last;
+
 	if (pass == 1) {
 		/* return something so we get through pass 1 */
 		return (avrule_t *) 1;
@@ -1869,8 +1871,12 @@ avrule_t *define_cond_pol_list(avrule_t * avlist, avrule_t * sl)
 		return avlist;
 	}
 
-	/* prepend the new avlist to the pre-existing one */
-	sl->next = avlist;
+	/* Prepend the new avlist to the pre-existing one.
+	 * An extended permission statement might consist of multiple av
+	 * rules. */
+	for (last = sl; last->next; last = last->next)
+		;
+	last->next = avlist;
 	return sl;
 }
 
@@ -1972,7 +1978,7 @@ static int avrule_read_xperm_ranges(struct av_xperm_range_list **rangehead)
 			id = queue_remove(id_queue);
 			r->range.high = (uint16_t) strtoul(id,NULL,0);
 			if (r->range.high < r->range.low) {
-				yyerror2("Ioctl range %d-%d must be in ascending order.",
+				yyerror2("extended permission range %d-%d must be in ascending order.",
 					 r->range.low, r->range.high);
 				return -1;
 			}
@@ -2454,9 +2460,9 @@ static int avrule_cpy(avrule_t *dest, const avrule_t *src)
 	return 0;
 }
 
-static int define_te_avtab_ioctl(const avrule_t *avrule_template)
+static int define_te_avtab_ioctl(const avrule_t *avrule_template, avrule_t **ret_avrules)
 {
-	avrule_t *avrule;
+	avrule_t *avrule, *ret = NULL, **last = &ret;
 	struct av_xperm_range_list *rangelist, *r;
 	av_extended_perms_t *complete_driver, *partial_driver, *xperms;
 	unsigned int i;
@@ -2478,7 +2484,13 @@ static int define_te_avtab_ioctl(const avrule_t *avrule_template)
 		if (avrule_cpy(avrule, avrule_template))
 			return -1;
 		avrule->xperms = complete_driver;
-		append_avrule(avrule);
+
+		if (ret_avrules) {
+			*last = avrule;
+			last = &(avrule->next);
+		} else {
+			append_avrule(avrule);
+		}
 	}
 
 	/* flag ioctl driver codes that are partially enabled */
@@ -2507,7 +2519,13 @@ static int define_te_avtab_ioctl(const avrule_t *avrule_template)
 			if (avrule_cpy(avrule, avrule_template))
 				return -1;
 			avrule->xperms = xperms;
-			append_avrule(avrule);
+
+			if (ret_avrules) {
+				*last = avrule;
+				last = &(avrule->next);
+			} else {
+				append_avrule(avrule);
+			}
 		}
 	}
 
@@ -2521,12 +2539,15 @@ done:
 		free(r);
 	}
 
+	if (ret_avrules)
+		*ret_avrules = ret;
+
 	return 0;
 }
 
-static int define_te_avtab_netlink(const avrule_t *avrule_template)
+static int define_te_avtab_netlink(const avrule_t *avrule_template, avrule_t **ret_avrules)
 {
-	avrule_t *avrule;
+	avrule_t *avrule, *ret = NULL, **last = &ret;
 	struct av_xperm_range_list *rangelist, *r;
 	av_extended_perms_t *partial_driver, *xperms;
 	unsigned int i;
@@ -2561,7 +2582,13 @@ static int define_te_avtab_netlink(const avrule_t *avrule_template)
 			if (avrule_cpy(avrule, avrule_template))
 				return -1;
 			avrule->xperms = xperms;
-			append_avrule(avrule);
+
+			if (ret_avrules) {
+				*last = avrule;
+				last = &(avrule->next);
+			} else {
+				append_avrule(avrule);
+			}
 		}
 	}
 
@@ -2575,9 +2602,64 @@ done:
 		free(r);
 	}
 
+	if (ret_avrules)
+		*ret_avrules = ret;
+
 	return 0;
 }
 
+avrule_t *define_cond_te_avtab_extended_perms(int which)
+{
+	char *id;
+	unsigned int i;
+	avrule_t *avrule_template, *rules = NULL;
+	int rc = 0;
+
+	if (policydbp->policy_type == POLICY_KERN && policydbp->policyvers < POLICYDB_VERSION_COND_XPERMS) {
+		yyerror2("extended permissions in conditional policies are only supported since policy version %d, found policy version %d",
+			POLICYDB_VERSION_COND_XPERMS, policydbp->policyvers);
+		return COND_ERR;
+	}
+	if (policydbp->policy_type != POLICY_KERN && policydbp->policyvers < MOD_POLICYDB_VERSION_COND_XPERMS) {
+		yyerror2("extended permissions in conditional policies are only supported since module policy version %d, found module policy version %d",
+			MOD_POLICYDB_VERSION_COND_XPERMS, policydbp->policyvers);
+		return COND_ERR;
+	}
+
+	if (pass == 1) {
+		for (i = 0; i < 4; i++) {
+			while ((id = queue_remove(id_queue)))
+				free(id);
+		}
+		return (avrule_t *) 1; /* any non-NULL value */
+	}
+
+	/* populate avrule template with source/target/tclass */
+	if (define_te_avtab_xperms_helper(which, &avrule_template))
+		return COND_ERR;
+
+	id = queue_remove(id_queue);
+	if (strcmp(id, "ioctl") == 0) {
+		rc = define_te_avtab_ioctl(avrule_template, &rules);
+	} else if (strcmp(id, "nlmsg") == 0) {
+		rc = define_te_avtab_netlink(avrule_template, &rules);
+	} else {
+		yyerror2("only ioctl and nlmsg extended permissions are supported, found %s", id);
+		rc = -1;
+	}
+
+	free(id);
+	avrule_destroy(avrule_template);
+	free(avrule_template);
+
+	if (rc) {
+		avrule_destroy(rules);
+		return NULL;
+	}
+
+	return rules;
+}
+
 int define_te_avtab_extended_perms(int which)
 {
 	char *id;
@@ -2599,11 +2681,11 @@ int define_te_avtab_extended_perms(int which)
 
 	id = queue_remove(id_queue);
 	if (strcmp(id,"ioctl") == 0) {
-		rc = define_te_avtab_ioctl(avrule_template);
+		rc = define_te_avtab_ioctl(avrule_template, NULL);
 	} else if (strcmp(id,"nlmsg") == 0) {
-		rc = define_te_avtab_netlink(avrule_template);
+		rc = define_te_avtab_netlink(avrule_template, NULL);
 	} else {
-		yyerror2("only ioctl extended permissions are supported, found %s", id);
+		yyerror2("only ioctl and nlmsg extended permissions are supported, found %s", id);
 		rc = -1;
 	}
 
diff --git a/checkpolicy/policy_define.h b/checkpolicy/policy_define.h
index ef74f616..216da3ad 100644
--- a/checkpolicy/policy_define.h
+++ b/checkpolicy/policy_define.h
@@ -15,6 +15,7 @@
 avrule_t *define_cond_compute_type(int which);
 avrule_t *define_cond_pol_list(avrule_t *avlist, avrule_t *sl);
 avrule_t *define_cond_te_avtab(int which);
+avrule_t *define_cond_te_avtab_extended_perms(int which);
 avrule_t *define_cond_filename_trans(void);
 cond_expr_t *define_cond_expr(uint32_t expr_type, void *arg1, void* arg2);
 int define_attrib(void);
diff --git a/checkpolicy/policy_parse.y b/checkpolicy/policy_parse.y
index ed1786d8..7e117222 100644
--- a/checkpolicy/policy_parse.y
+++ b/checkpolicy/policy_parse.y
@@ -74,6 +74,7 @@ typedef int (* require_func_t)(int pass);
 
 %type <ptr> cond_expr cond_expr_prim cond_pol_list cond_else
 %type <ptr> cond_allow_def cond_auditallow_def cond_auditdeny_def cond_dontaudit_def
+%type <ptr> cond_xperm_allow_def cond_xperm_auditallow_def cond_xperm_dontaudit_def
 %type <ptr> cond_transition_def cond_te_avtab_def cond_rule_def
 %type <valptr> cexpr cexpr_prim op role_mls_op
 %type <val> ipv4_addr_def number
@@ -432,6 +433,12 @@ cond_te_avtab_def	: cond_allow_def
 			  { $$ = $1; }
 			| cond_dontaudit_def
 			  { $$ = $1; }
+			| cond_xperm_allow_def
+			  { $$ = $1; }
+			| cond_xperm_auditallow_def
+			  { $$ = $1; }
+			| cond_xperm_dontaudit_def
+			  { $$ = $1; }
 			;
 cond_allow_def		: ALLOW names names ':' names names  ';'
 			{ $$ = define_cond_te_avtab(AVRULE_ALLOWED) ;
@@ -449,7 +456,18 @@ cond_dontaudit_def	: DONTAUDIT names names ':' names names ';'
 			{ $$ = define_cond_te_avtab(AVRULE_DONTAUDIT);
                           if ($$ == COND_ERR) YYABORT; }
 		        ;
-			;
+cond_xperm_allow_def		: ALLOWXPERM names names ':' names identifier xperms ';'
+				{ $$ = define_cond_te_avtab_extended_perms(AVRULE_XPERMS_ALLOWED) ;
+				  if ($$ == COND_ERR) YYABORT; }
+				;
+cond_xperm_auditallow_def	: AUDITALLOWXPERM names names ':' names identifier xperms ';'
+				{ $$ = define_cond_te_avtab_extended_perms(AVRULE_XPERMS_AUDITALLOW) ;
+				  if ($$ == COND_ERR) YYABORT; }
+				;
+cond_xperm_dontaudit_def	: DONTAUDITXPERM names names ':' names identifier xperms ';'
+				{ $$ = define_cond_te_avtab_extended_perms(AVRULE_XPERMS_DONTAUDIT) ;
+				  if ($$ == COND_ERR) YYABORT; }
+				;
 transition_def		: TYPE_TRANSITION  names names ':' names identifier filename ';'
 			{if (define_filename_trans()) YYABORT; }
 			| TYPE_TRANSITION names names ':' names identifier ';'
diff --git a/checkpolicy/tests/policy_allonce.conf b/checkpolicy/tests/policy_allonce.conf
index 2cfbb772..51a8c40a 100644
--- a/checkpolicy/tests/policy_allonce.conf
+++ b/checkpolicy/tests/policy_allonce.conf
@@ -2,6 +2,7 @@
 class CLASS1
 class CLASS2
 class CLASS3
+class CLASS4
 class dir
 class file
 class process
@@ -10,6 +11,7 @@ common COMMON1 { CPERM1 }
 class CLASS1 { PERM1 ioctl }
 class CLASS2 inherits COMMON1
 class CLASS3 inherits COMMON1 { PERM1 }
+class CLASS4 { nlmsg }
 default_user { CLASS1 } source;
 default_role { CLASS2 } target;
 default_type { CLASS3 } source;
@@ -26,6 +28,7 @@ typealias TYPE1 alias TYPEALIAS1;
 typeattribute TYPE1 ATTR1;
 typebounds TYPE4 TYPE3;
 bool BOOL1 true;
+bool BOOL2 false;
 tunable TUNABLE1 false;
 tunable TUNABLE2 true;
 type_transition TYPE1 TYPE2 : CLASS1 TYPE3;
@@ -37,6 +40,7 @@ auditallow { TYPE1 TYPE2 } TYPE3 : CLASS1 { PERM1 };
 dontaudit TYPE1 { TYPE2 TYPE3 } : CLASS3 { PERM1 CPERM1 };
 neverallow TYPE1 TYPE2 : { CLASS2 CLASS3 } { CPERM1 };
 allowxperm TYPE1 TYPE2 : CLASS1 ioctl { 0x456-0x5678 };
+allowxperm TYPE2 TYPE1 : CLASS4 nlmsg { 0x1 0x12 };
 auditallowxperm TYPE1 TYPE2 : CLASS1 ioctl 0x2;
 dontauditxperm TYPE1 TYPE2 : CLASS1 ioctl 0x3;
 neverallowxperm TYPE1 TYPE2 : CLASS1 ioctl 0x4;
@@ -50,7 +54,8 @@ role_transition ROLE1 TYPE1 : CLASS1 ROLE2;
 allow ROLE1 ROLE2;
 roleattribute ROLE3 ROLE_ATTR1;
 role ROLE1 types { TYPE1 };
-if ! BOOL1 { allow TYPE1 self: CLASS1 *; }
+if ! BOOL1 { allow TYPE1 self: CLASS1 *; dontauditxperm TYPE1 TYPE2:CLASS1 ioctl { 0x6789 - 0x9876 }; }
+if BOOL2 { allowxperm TYPE2 TYPE1:CLASS4 nlmsg { 0x1 0x2 }; }
 if TUNABLE1 xor TUNABLE2 { allow TYPE1 self: CLASS2 *; } else { allow TYPE1 self: CLASS3 *; }
 optional { require { class CLASS2 { CPERM1 }; } allow TYPE1 self: CLASS2 *; }
 user USER1 roles ROLE1;
diff --git a/checkpolicy/tests/policy_allonce.expected.conf b/checkpolicy/tests/policy_allonce.expected.conf
index 26d56438..355d9991 100644
--- a/checkpolicy/tests/policy_allonce.expected.conf
+++ b/checkpolicy/tests/policy_allonce.expected.conf
@@ -2,6 +2,7 @@
 class CLASS1
 class CLASS2
 class CLASS3
+class CLASS4
 class dir
 class file
 class process
@@ -10,6 +11,7 @@ common COMMON1 { CPERM1 }
 class CLASS1 { PERM1 ioctl }
 class CLASS2 inherits COMMON1
 class CLASS3 inherits COMMON1 { PERM1 }
+class CLASS4 { nlmsg }
 default_user { CLASS1 } source;
 default_role { CLASS2 } target;
 default_type { CLASS3 } source;
@@ -17,6 +19,7 @@ policycap open_perms;
 attribute ATTR1;
 attribute ATTR2;
 bool BOOL1 true;
+bool BOOL2 false;
 type TYPE1;
 type TYPE2;
 type TYPE3;
@@ -37,6 +40,7 @@ dontaudit TYPE1 TYPE3:CLASS3 { CPERM1 PERM1 };
 allowxperm TYPE1 TYPE2:CLASS1 ioctl { 0x456-0x4ff };
 allowxperm TYPE1 TYPE2:CLASS1 ioctl { 0x500-0x55ff };
 allowxperm TYPE1 TYPE2:CLASS1 ioctl { 0x5600-0x5678 };
+allowxperm TYPE2 TYPE1:CLASS4 nlmsg { 0x1 0x12 };
 auditallowxperm TYPE1 TYPE2:CLASS1 ioctl { 0x2 };
 dontauditxperm TYPE1 TYPE2:CLASS1 ioctl { 0x3 };
 type_transition TYPE1 TYPE2:CLASS1 TYPE3;
@@ -49,6 +53,12 @@ type_transition TYPE2 TYPE4:CLASS1 TYPE1 "FILENAME";
 if (BOOL1) {
 } else {
     allow TYPE1 self:CLASS1 { PERM1 ioctl };
+    dontauditxperm TYPE1 TYPE2:CLASS1 ioctl { 0x6789-0x67ff };
+    dontauditxperm TYPE1 TYPE2:CLASS1 ioctl { 0x6800-0x97ff };
+    dontauditxperm TYPE1 TYPE2:CLASS1 ioctl { 0x9800-0x9876 };
+}
+if (BOOL2) {
+    allowxperm TYPE2 TYPE1:CLASS4 nlmsg { 0x1-0x2 };
 }
 role ROLE1;
 role ROLE2;
diff --git a/checkpolicy/tests/policy_allonce.expected_opt.conf b/checkpolicy/tests/policy_allonce.expected_opt.conf
index 769be2b3..f951c335 100644
--- a/checkpolicy/tests/policy_allonce.expected_opt.conf
+++ b/checkpolicy/tests/policy_allonce.expected_opt.conf
@@ -2,6 +2,7 @@
 class CLASS1
 class CLASS2
 class CLASS3
+class CLASS4
 class dir
 class file
 class process
@@ -10,6 +11,7 @@ common COMMON1 { CPERM1 }
 class CLASS1 { PERM1 ioctl }
 class CLASS2 inherits COMMON1
 class CLASS3 inherits COMMON1 { PERM1 }
+class CLASS4 { nlmsg }
 default_user { CLASS1 } source;
 default_role { CLASS2 } target;
 default_type { CLASS3 } source;
@@ -17,6 +19,7 @@ policycap open_perms;
 attribute ATTR1;
 attribute ATTR2;
 bool BOOL1 true;
+bool BOOL2 false;
 type TYPE1;
 type TYPE2;
 type TYPE3;
@@ -37,6 +40,7 @@ dontaudit TYPE1 TYPE3:CLASS3 { CPERM1 PERM1 };
 allowxperm TYPE1 TYPE2:CLASS1 ioctl { 0x456-0x4ff };
 allowxperm TYPE1 TYPE2:CLASS1 ioctl { 0x500-0x55ff };
 allowxperm TYPE1 TYPE2:CLASS1 ioctl { 0x5600-0x5678 };
+allowxperm TYPE2 TYPE1:CLASS4 nlmsg { 0x1 0x12 };
 auditallowxperm TYPE1 TYPE2:CLASS1 ioctl { 0x2 };
 dontauditxperm TYPE1 TYPE2:CLASS1 ioctl { 0x3 };
 type_transition TYPE1 TYPE2:CLASS1 TYPE3;
@@ -49,6 +53,12 @@ type_transition TYPE2 TYPE4:CLASS1 TYPE1 "FILENAME";
 if (BOOL1) {
 } else {
     allow TYPE1 self:CLASS1 { ioctl };
+    dontauditxperm TYPE1 TYPE2:CLASS1 ioctl { 0x6789-0x67ff };
+    dontauditxperm TYPE1 TYPE2:CLASS1 ioctl { 0x6800-0x97ff };
+    dontauditxperm TYPE1 TYPE2:CLASS1 ioctl { 0x9800-0x9876 };
+}
+if (BOOL2) {
+    allowxperm TYPE2 TYPE1:CLASS4 nlmsg { 0x1-0x2 };
 }
 role ROLE1;
 role ROLE2;
-- 
2.45.2


