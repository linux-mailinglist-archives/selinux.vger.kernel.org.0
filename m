Return-Path: <selinux+bounces-5302-lists+selinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CBC0BEBAA6
	for <lists+selinux@lfdr.de>; Fri, 17 Oct 2025 22:29:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 801B51AE35F1
	for <lists+selinux@lfdr.de>; Fri, 17 Oct 2025 20:30:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67505354AFD;
	Fri, 17 Oct 2025 20:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="TlXC+eRl"
X-Original-To: selinux@vger.kernel.org
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96842354AE5
	for <selinux@vger.kernel.org>; Fri, 17 Oct 2025 20:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760732962; cv=none; b=cNlB5OOAzK9M/ZTpJqyRoLgItCBTgSIEcBk/rhWqUc8L35mg9PYfIdKttXHwAQ8ALt07oIZ1a1zLQ429Aigy+v5HXF/RMJMSHRy1nH8LroIgu/+dGXJ1JfnJVr8kiu55lPtrGB7w/dO1hrZzre/MVO3KqCtZFx1Cx1RoH4dA69M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760732962; c=relaxed/simple;
	bh=MrEkDjo/swaglnYBBPDFKgtNtpdXcQjA8Zt8yPgNYdI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VAu0edtnrm5/h+FHTnAEThRE6Qvmje/AeGfkmnWX06eqmH5t+C4kivhUADgdHDi10X2ZtPqH3TMv0N+jr5e4zQcN+aZ1XNsmixr96E1sv6r/kKKtj5mS/d/XHJ8DqyES7ndnzD+ock5J7wRL7TDMCfgRq28XNnDEbT1vL5EIVvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=TlXC+eRl; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-88e68c0a7bfso460982985a.0
        for <selinux@vger.kernel.org>; Fri, 17 Oct 2025 13:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1760732959; x=1761337759; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qMbCAhgwzfKnrZqi4/B6ewTL7p8XlagpgyPHCjLiJhs=;
        b=TlXC+eRlRRScwGayW6gjQ3JoglPjmctT2+7qNBnZIcwhS9G3RFvlgEXFpk0/1q3QTm
         V39kXHfyU3S5KAInn80qMEkFSX4GWYSpks5lgAw4YHjWrO+WO6Ll4ILSEAfNOjmuo8V1
         syonEw86rzBobrq7FrAG8pvDZTeRojAghDNL806M8ycI3HN5rBOswfbPg8/LAGuexo29
         QkbWPu7yR+Qwwwb2YO+LSzD1LnnTAxzmKe7okAKWGWnR3erA6QU+xmmnOGTZFLJaoZK8
         GTiMa5D+6SQxtM2ne4skNy3SlpDtZfRiYm+jv9Wx46tYv3m+ppKOU7r90z2QmLOliyI2
         h7Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760732959; x=1761337759;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qMbCAhgwzfKnrZqi4/B6ewTL7p8XlagpgyPHCjLiJhs=;
        b=W6HRii2eLmwBzTsxQz3zOKY+jhY9UkbYICXXcDq3nnV4rrAupRZLHkL1xemi+5Uv/C
         VvwjbkymUA5BIK3fqgF/Qii0Vhp9YH2wImaOWtyVeuK04jVZAMX0ccalO2Za6c00Wezw
         uiqNVNniQ2K2wUOFOew7/pvw6Njm6KcmfqkNhI0zbvg6nclkolO3iteE/lP47vqkOzDt
         yDs61ot44IK07kGDZg2UsMqRDrCblnZUPKgyUROwaIJ7iIrjQ/r5o0XPgnm/2Ph03FGM
         gba49lnQkAh6kgNser9fsOIhs5xv+KKwblbRd+U/9Qv/BJ3mL5OXoFpm0s2S/NlgnWoS
         lCvw==
X-Forwarded-Encrypted: i=1; AJvYcCU/y1LC8242e2pFtZ2kmeL/l4/NB5YcBAL0AqED56eLn//smAzRvkr8UF/Lt8AioBw+bwDy2tmO@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3miWuusska3/+0O0fc76vWXrbELkBLig5Pqb7XKoZLNOgX4ln
	VSXjap0v3b/Y3KT4S8RgjmlDkJe8nvtzsuMjDTBWOxSNnm24jUUysk5NzLrI8vhypw==
X-Gm-Gg: ASbGncsxX5ZxhpCkOyLTGCLeZ/yR0whVsPreGHUpAToiz6gOPK+czoWv/aRbVk42dOV
	FO4+8sTyVv7Ig6fAMetxsO9QTTTAOKbLBqOk/jmf2QiEGtisMzrpdyk2ChMHINd14w5Wcva48gm
	wB1MQY1MHbRRGbNT8Lz+lmskJfyafuH4e0kBtcV5R3KUJQums6kphAW4OGSIofeOgTgOsDRVe8a
	Bk6mKwRlpe3vPpDqYB+FCZB4Qbi1aW8QBGB68xuRA9QsM/KtEEwdoOR5111xovmB/mSO8Y29P3M
	LZSumIo3KmVQwQXFPtD9H+8jE52EUhmQDQgKw4hrQB2u9ToDk0sRw75HphTrNw5QXIIcKGfkL8i
	GM+T9m0LVGaCaGVZN+3lJ52m/98CI2KcSuILtFV6DULRoT9EWOGK6enoPKJyRncBVh5HLns01fR
	YfIGD+4yGf+Otr+GknRYFACjfHn9dtTG9qNTNosoJTGCgwiQ==
X-Google-Smtp-Source: AGHT+IF5DQ3d9wM51CpsTgMTKLscHUHH//P60RsSnY76/NJInVQBpPEooJWgQYhrsE53yvI31D0CjA==
X-Received: by 2002:a05:620a:3902:b0:891:7def:94a4 with SMTP id af79cd13be357-8917def95ffmr330558885a.73.1760732959517;
        Fri, 17 Oct 2025 13:29:19 -0700 (PDT)
Received: from localhost (pool-71-126-255-178.bstnma.fios.verizon.net. [71.126.255.178])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-891cc8d5df6sm40723185a.13.2025.10.17.13.29.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 13:29:18 -0700 (PDT)
From: Paul Moore <paul@paul-moore.com>
To: linux-security-module@vger.kernel.org,
	linux-integrity@vger.kernel.org,
	selinux@vger.kernel.org
Cc: John Johansen <john.johansen@canonical.com>,
	Mimi Zohar <zohar@linux.ibm.com>,
	Roberto Sassu <roberto.sassu@huawei.com>,
	Fan Wu <wufan@kernel.org>,
	=?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack@google.com>,
	Kees Cook <kees@kernel.org>,
	Micah Morton <mortonm@chromium.org>,
	Casey Schaufler <casey@schaufler-ca.com>,
	Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
	Nicolas Bouchinet <nicolas.bouchinet@oss.cyber.gouv.fr>,
	Xiu Jianfeng <xiujianfeng@huawei.com>
Subject: [PATCH v5 18/34] lsm: fold lsm_init_ordered() into security_init()
Date: Fri, 17 Oct 2025 16:24:46 -0400
Message-ID: <20251017202456.484010-54-paul@paul-moore.com>
X-Mailer: git-send-email 2.51.1.dirty
In-Reply-To: <20251017202456.484010-36-paul@paul-moore.com>
References: <20251017202456.484010-36-paul@paul-moore.com>
Precedence: bulk
X-Mailing-List: selinux@vger.kernel.org
List-Id: <selinux.vger.kernel.org>
List-Subscribe: <mailto:selinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:selinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6176; i=paul@paul-moore.com; h=from:subject; bh=MrEkDjo/swaglnYBBPDFKgtNtpdXcQjA8Zt8yPgNYdI=; b=owEBbQKS/ZANAwAKAeog8tqXN4lzAcsmYgBo8qZQkUYKoUBSvWxFNJbIQFAvT1HoVoV+l9u3k XBE8sxSPUOJAjMEAAEKAB0WIQRLQqjPB/KZ1VSXfu/qIPLalzeJcwUCaPKmUAAKCRDqIPLalzeJ c5tED/48ccYR1PItcor6LAnAe8JfnS5dq8yUjGkZM1cxrJC6LJI0hLSi4Ww4dG/7g9lsJ0yCzUt lkSyYYRCRoo3QHwI7rNdCVP6sjmT/Cm4rpuBYZ8NcpZKfQQXYPg+xcGCK5DYVq3lnjRed929H7u t5dD+oBV+gIK5X69xqKfC03yRJAItLjfhqrRb65O09m8olqA1GHOwQ8DYtYvArn2vh6Ovdd2Apz UTaTiuW7vjOAcbYDt09z4+VUn+w6ryXmyqt3uIZGMDFehNlwUMeY2LTqf90+kX+VoZOQy2UN6dm lTxbvBP93iLk5Nx+AHup5WtJtsSinrRQnuWGHiTHZyU0NNIGY+uCN4LxcrLrUGK8ew8cXbT3ztV MBM6b0cPDSOUc/CTD2c/dATlNT+nzaGsDO1Q0fp8v0He5sXGbn71nFz2hgfqKVVEM9UE/ZJI+qb fTiR/XtbRoP5+fhOhnUfu9yFz+wUUUS6oqZEg78qYrLT1g0N3uJCp4b4SiWQxX8PKKcVL2NUFYT RLwPSjDNsiaEom95MzTRfI0TvF2zQ538CcMavi18cv00iLTQqS9jgBBX0HCu0+I/sMHoRgFbEUr RPEek0LBb9V52DrJq+ewDJGrgNNSmNazbIqAQQSzHYc8Kfd3uCgzoxzwAkNkDxIGJ4SaBfzutxM rakFwW3KHo8hS6w==
X-Developer-Key: i=paul@paul-moore.com; a=openpgp; fpr=7100AADFAE6E6E940D2E0AD655E45A5AE8CA7C8A
Content-Transfer-Encoding: 8bit

With only security_init() calling lsm_init_ordered, it makes little
sense to keep lsm_init_ordered() as a standalone function.  Fold
lsm_init_ordered() into security_init().

Reviewed-by: Casey Schaufler <casey@schaufler-ca.com>
Reviewed-by: John Johansen <john.johhansen@canonical.com>
Signed-off-by: Paul Moore <paul@paul-moore.com>
---
 security/lsm_init.c | 159 ++++++++++++++++++++------------------------
 1 file changed, 73 insertions(+), 86 deletions(-)

diff --git a/security/lsm_init.c b/security/lsm_init.c
index eb473f982ddb..9cbb10c42e38 100644
--- a/security/lsm_init.c
+++ b/security/lsm_init.c
@@ -18,6 +18,9 @@ static __initdata int lsm_enabled_false = 0;
 extern struct lsm_info __start_lsm_info[], __end_lsm_info[];
 extern struct lsm_info __start_early_lsm_info[], __end_early_lsm_info[];
 
+/* Number of "early" LSMs */
+static __initdata unsigned int lsm_count_early;
+
 /* Build and boot-time LSM ordering. */
 static __initconst const char *const lsm_order_builtin = CONFIG_LSM;
 static __initdata const char *lsm_order_cmdline;
@@ -169,7 +172,6 @@ static void __init lsm_order_append(struct lsm_info *lsm, const char *src)
 		   lsm_is_enabled(lsm) ? "enabled" : "disabled");
 }
 
-
 /**
  * lsm_blob_size_update - Update the LSM blob size and offset information
  * @sz_req: the requested additional blob size
@@ -313,14 +315,74 @@ static void __init lsm_order_parse(const char *list, const char *src)
 	}
 }
 
-/**
- * lsm_init_ordered - Initialize the ordered LSMs
- */
-static void __init lsm_init_ordered(void)
+static void __init lsm_static_call_init(struct security_hook_list *hl)
 {
-	unsigned int first = 0;
+	struct lsm_static_call *scall = hl->scalls;
+	int i;
+
+	for (i = 0; i < MAX_LSM_COUNT; i++) {
+		/* Update the first static call that is not used yet */
+		if (!scall->hl) {
+			__static_call_update(scall->key, scall->trampoline,
+					     hl->hook.lsm_func_addr);
+			scall->hl = hl;
+			static_branch_enable(scall->active);
+			return;
+		}
+		scall++;
+	}
+	panic("%s - Ran out of static slots.\n", __func__);
+}
+
+/**
+ * security_add_hooks - Add a modules hooks to the hook lists.
+ * @hooks: the hooks to add
+ * @count: the number of hooks to add
+ * @lsmid: the identification information for the security module
+ *
+ * Each LSM has to register its hooks with the infrastructure.
+ */
+void __init security_add_hooks(struct security_hook_list *hooks, int count,
+			       const struct lsm_id *lsmid)
+{
+	int i;
+
+	for (i = 0; i < count; i++) {
+		hooks[i].lsmid = lsmid;
+		lsm_static_call_init(&hooks[i]);
+	}
+}
+
+int __init early_security_init(void)
+{
+	struct lsm_info *lsm;
+
+	lsm_early_for_each_raw(lsm) {
+		lsm_enabled_set(lsm, true);
+		lsm_order_append(lsm, "early");
+		lsm_prepare(lsm);
+		lsm_init_single(lsm);
+		lsm_count_early++;
+	}
+
+	return 0;
+}
+
+/**
+ * security_init - Initializes the LSM framework
+ *
+ * This should be called early in the kernel initialization sequence.
+ */
+int __init security_init(void)
+{
+	unsigned int cnt;
 	struct lsm_info **lsm;
 	struct lsm_info *early;
+	unsigned int first = 0;
+
+	init_debug("legacy security=%s\n", lsm_order_legacy ? : " *unspecified*");
+	init_debug("  CONFIG_LSM=%s\n", lsm_order_builtin);
+	init_debug("boot arg lsm=%s\n", lsm_order_cmdline ? : " *unspecified*");
 
 	if (lsm_order_cmdline) {
 		if (lsm_order_legacy) {
@@ -332,9 +394,8 @@ static void __init lsm_init_ordered(void)
 	} else
 		lsm_order_parse(lsm_order_builtin, "builtin");
 
-	lsm_order_for_each(lsm) {
+	lsm_order_for_each(lsm)
 		lsm_prepare(*lsm);
-	}
 
 	pr_info("initializing lsm=");
 	lsm_early_for_each_raw(early) {
@@ -383,87 +444,13 @@ static void __init lsm_init_ordered(void)
 	if (lsm_task_alloc(current))
 		panic("%s: early task alloc failed.\n", __func__);
 
+	cnt = 0;
 	lsm_order_for_each(lsm) {
+		/* skip the "early" LSMs as they have already been setup */
+		if (cnt++ < lsm_count_early)
+			continue;
 		lsm_init_single(*lsm);
 	}
-}
-
-static void __init lsm_static_call_init(struct security_hook_list *hl)
-{
-	struct lsm_static_call *scall = hl->scalls;
-	int i;
-
-	for (i = 0; i < MAX_LSM_COUNT; i++) {
-		/* Update the first static call that is not used yet */
-		if (!scall->hl) {
-			__static_call_update(scall->key, scall->trampoline,
-					     hl->hook.lsm_func_addr);
-			scall->hl = hl;
-			static_branch_enable(scall->active);
-			return;
-		}
-		scall++;
-	}
-	panic("%s - Ran out of static slots.\n", __func__);
-}
-
-/**
- * security_add_hooks - Add a modules hooks to the hook lists.
- * @hooks: the hooks to add
- * @count: the number of hooks to add
- * @lsmid: the identification information for the security module
- *
- * Each LSM has to register its hooks with the infrastructure.
- */
-void __init security_add_hooks(struct security_hook_list *hooks, int count,
-			       const struct lsm_id *lsmid)
-{
-	int i;
-
-	for (i = 0; i < count; i++) {
-		hooks[i].lsmid = lsmid;
-		lsm_static_call_init(&hooks[i]);
-	}
-}
-
-int __init early_security_init(void)
-{
-	struct lsm_info *lsm;
-
-	lsm_early_for_each_raw(lsm) {
-		lsm_enabled_set(lsm, true);
-		lsm_order_append(lsm, "early");
-		lsm_prepare(lsm);
-		lsm_init_single(lsm);
-	}
-
-	return 0;
-}
-
-/**
- * security_init - initializes the security framework
- *
- * This should be called early in the kernel initialization sequence.
- */
-int __init security_init(void)
-{
-	struct lsm_info *lsm;
-
-	init_debug("legacy security=%s\n", lsm_order_legacy ? : " *unspecified*");
-	init_debug("  CONFIG_LSM=%s\n", lsm_order_builtin);
-	init_debug("boot arg lsm=%s\n", lsm_order_cmdline ? : " *unspecified*");
-
-	/*
-	 * Append the names of the early LSM modules now that kmalloc() is
-	 * available
-	 */
-	lsm_early_for_each_raw(lsm) {
-		init_debug("  early started: %s (%s)\n", lsm->id->name,
-			   lsm_is_enabled(lsm) ? "enabled" : "disabled");
-	}
-
-	/* Load LSMs in specified order. */
-	lsm_init_ordered();
 
 	return 0;
 }
-- 
2.51.1.dirty


