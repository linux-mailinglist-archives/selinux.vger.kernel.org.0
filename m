Return-Path: <selinux+bounces-4635-lists+selinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6A76B27272
	for <lists+selinux@lfdr.de>; Fri, 15 Aug 2025 00:54:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8653FA22E68
	for <lists+selinux@lfdr.de>; Thu, 14 Aug 2025 22:54:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C55C28153D;
	Thu, 14 Aug 2025 22:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="fpjVNv9z"
X-Original-To: selinux@vger.kernel.org
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77165281357
	for <selinux@vger.kernel.org>; Thu, 14 Aug 2025 22:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755212073; cv=none; b=bbyZBmXAACsaixEFfloBalsHx6ELr1tbHDqWPndD0ltDH8iebUPUMaFSpK3GtCiZamgvdplZNgbXJNyQr4yU1PvkCuR41xZxFPbQ864nRhoLpzf7hOslCbU6+qj5vgpIHpRwpPQ3EKo7Cll60FrgMKV1/SBLg6MV9Uc9eHQInIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755212073; c=relaxed/simple;
	bh=7XLq8rxFwmmbDljx6EHznQWqg7Km4bL3DuFZpYrBJBo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g0IlQJD4kYAGbQQyAo7FNIe6m7u5q2I45CA9u7rY99/gUaTZdhbHUC0S2IQ2b/G2oNzZ1gGAqMzildT1EP5GSAcNqgahtmtsdI2ryq2D2wQObRRvn6H74WXY+uVHgnKB1I+Kbxz1SgVATsUxKOMBg4oEq6CbOHnpp56yUaZbUGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=fpjVNv9z; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-70a88dd062eso14239406d6.0
        for <selinux@vger.kernel.org>; Thu, 14 Aug 2025 15:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1755212070; x=1755816870; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FR2DWSSV9BKP0vHAocB1KanHVxcTq4nxTL3M7JMbPR0=;
        b=fpjVNv9zUwPLVsNPhfDIEdAy+NLa1fIT2beAf7ZL55pp8h5UKa8g1BXQS7I5O017+J
         IdJqRLoNYMY11sfLncaY6giXEoAo7ScYRxi/lU5VRpxI4ovI2oA7T92XQahPnaxJfwob
         088fyS4JksvPn2HFNL5/paQylHHcUIbCki1DXs9Fz3A9FJa0rUBZTYI+W3SYxLKavyY2
         DYz/CXKAnaCHFG8qxXe/VHMpTlzde44UogsnVMsc5TM/MEfb2xnR3ChwYfW2YSjeN8jI
         nxU9ixVYQtjI1RLqO2Bf0+/fvzlsNzGQxp9VrCkK+GDC3q+RkJorGjfcgckvJxOpDC2h
         zniQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755212070; x=1755816870;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FR2DWSSV9BKP0vHAocB1KanHVxcTq4nxTL3M7JMbPR0=;
        b=XuPfpzRkU0ogP+NjTNW3rhvGM9ZVp8RELMPDWaizViXA5Obah6UbpcWukB28928Cp1
         Cs/j53lZ5madomIrSFlnc8OOl1ztNRxzMrRTaeBaDTjUqFTpovzDHMJrHJEe3FApbGbP
         ehLAOb8PjJ3/xtkjeV5asf/ZJj4IDZKJuc5dNzyNod2cUvdvjrBKOsjoeBFUXlvdkYY6
         dsi+j28egEUIh4RjSPK2OX7DUvtQDz1y7JdPnA5f+8E3flueL95zuMnLiohH9Xgcm2eT
         HEitoOG1DqiMlbLyDIebCKdVOhdNcJmTAmGPqKVYUYRbGjOYr0Z0fDCA0Zn9Gu0KzPEq
         yjsA==
X-Forwarded-Encrypted: i=1; AJvYcCXhAvdLHA/1coghTDtTb2I+sBK04Vsj5nVaLh68iiIHf0AIUc2z6Q9vBc2orJbPbO0MOli7QGb6@vger.kernel.org
X-Gm-Message-State: AOJu0YzkOtOFit9u2Pn29BgsH3RCg1JGAzdp+7O3HpG0bk67YsPG0/mX
	3f3rbcdAh9iw+fo97HDGCRoMDDcyOMmYN+ywOndULdhoZW4KdKmmkvR8LGWlto3pbw==
X-Gm-Gg: ASbGncvR8HeVH4Eh5wmcZN9Y5YTQMFRF11+4TC3MCHupW8JXZ6HZGl+0Vwdlh60Yybw
	niNViK5KPXUjG6V7yJ6boIBsOwK65kta7vFdWQwBRufVwglmExbRravVqrgH0sT/UfVaiHMJWcZ
	l5RP1ZmdApKICLo/tUOy7bX+FlOdCKzbJJv972aCZiDylAA2XOgQoZwRI/fynG49xnpzfiMPnzM
	Cq0VaF5yHXGG+F4bbvIyRCaa+bWBXBJGl6JTtPmTR2qwGTCsboq+z7KdhA1RQI+65eZ3271HD8G
	7VsMq4PcVfzmXgxq4Yn4n1PebMPU+arV4e7H3PHks27CXC9hWZt0P/AReNslkUFz2ndRhNQc3K6
	ei7De+RbpaCsC30iM1pBs8vlYe35QzD7QY2fLvzLG1mJYSjuy/Qj0IRZSpjYcsawtaD8=
X-Google-Smtp-Source: AGHT+IGOZnDW6kMg6lvfCr5KMqUmek08jcnigqYok/3JQKY9A9pTnDRAxXGO2E6vajOM9BArHwIvGA==
X-Received: by 2002:ad4:5bc9:0:b0:709:2ab3:17ba with SMTP id 6a1803df08f44-70af5c8880bmr63533856d6.47.1755212070316;
        Thu, 14 Aug 2025 15:54:30 -0700 (PDT)
Received: from localhost (pool-71-126-255-178.bstnma.fios.verizon.net. [71.126.255.178])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-70adc1cc9d2sm19838106d6.1.2025.08.14.15.54.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 15:54:28 -0700 (PDT)
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
Subject: [PATCH v3 15/34] lsm: rename/rework ordered_lsm_parse() to lsm_order_parse()
Date: Thu, 14 Aug 2025 18:50:24 -0400
Message-ID: <20250814225159.275901-51-paul@paul-moore.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250814225159.275901-36-paul@paul-moore.com>
References: <20250814225159.275901-36-paul@paul-moore.com>
Precedence: bulk
X-Mailing-List: selinux@vger.kernel.org
List-Id: <selinux.vger.kernel.org>
List-Subscribe: <mailto:selinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:selinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4838; i=paul@paul-moore.com; h=from:subject; bh=7XLq8rxFwmmbDljx6EHznQWqg7Km4bL3DuFZpYrBJBo=; b=owEBbQKS/ZANAwAKAeog8tqXN4lzAcsmYgBonmi9QIVZ9hk3ACP8hD00f15qI5qZrYo3aXc/B v9mQONvwYGJAjMEAAEKAB0WIQRLQqjPB/KZ1VSXfu/qIPLalzeJcwUCaJ5ovQAKCRDqIPLalzeJ c81kD/9Zn3yshX+a203TWtYOChot99TKLj1RDt2N5gEFE3Y3MnbK/fiAP8zPw6ZzFLlr1izGznC prqzrvbDZAEVp+ZaQQ5xggMFsny4NZWNoaFxPGnoQRVBENEEH2ClAqZ23dUFxhO8gc2WRceNAWR xNE3YioyHWzgV8ZbJn4k0xAQIkptK9hKiTp7Z45MBm29/vfjKzfotHWEfQq4RwRUjlliTM2bERF 4Up4VmJJYvKU8YmUmdhOxP2DSgrY7Db0barLUcHykNTDJuaHNW/SgQEbgsDpX+ytfZM4+JoZJQX Wf3dpL8S0aXV36WFXNTrPUYvv/ZRHERL/xdHqkwGgPYkmleKzwBsCJMIEnbZ5ioNZPDv4genK95 K3LRv2fy3jqnlKp/3WCVH18pyEy58TP+dXrJgRQej2EqMlI/sGi+nhlHmwTNfHNJrfqR4k5vlMz rNJJTTCOrrZ4gCrNt1TZgUhZynSZbedL7mSCkYvOeF9Dlm5Ss/B4xgjbYb67yYNjqHDQ6eMup8x /Y2e68aXbBxWWTXGVQB9rnspd1Cv2xw+tITsGTlnzGa8xJ/t8ZgqVj2Q9SxREgoeo+Bsi3MFz+w ftMHcJPknm3fxmLVKFjRiubtYBL+T8ve+5K1iI2oiZt0Rx8P5DcipP9UYfO2we8QqFAZcIgHUH7 kj2UfqHeT1oqacg==
X-Developer-Key: i=paul@paul-moore.com; a=openpgp; fpr=7100AADFAE6E6E940D2E0AD655E45A5AE8CA7C8A
Content-Transfer-Encoding: 8bit

Rename ordered_lsm_parse() to lsm_order_parse() for the sake of
consistency with the other LSM initialization routines, and also
do some minor rework of the function.  Aside from some minor style
decisions, the majority of the rework involved shuffling the order
of the LSM_FLAG_LEGACY and LSM_ORDER_FIRST code so that the
LSM_FLAG_LEGACY checks are handled first; it is important to note
that this doesn't affect the order in which the LSMs are registered.

Reviewed-by: Casey Schaufler <casey@schaufler-ca.com>
Signed-off-by: Paul Moore <paul@paul-moore.com>
---
 security/lsm_init.c | 82 ++++++++++++++++++++-------------------------
 1 file changed, 37 insertions(+), 45 deletions(-)

diff --git a/security/lsm_init.c b/security/lsm_init.c
index a314484d7c2f..7b2491120fc8 100644
--- a/security/lsm_init.c
+++ b/security/lsm_init.c
@@ -228,83 +228,75 @@ static void __init initialize_lsm(struct lsm_info *lsm)
 	}
 }
 
-/* Populate ordered LSMs list from comma-separated LSM name list. */
-static void __init ordered_lsm_parse(const char *order, const char *origin)
+/**
+ * lsm_order_parse - Parse the comma delimited LSM list
+ * @list: LSM list
+ * @src: source of the list
+ */
+static void __init lsm_order_parse(const char *list, const char *src)
 {
 	struct lsm_info *lsm;
 	char *sep, *name, *next;
 
-	/* LSM_ORDER_FIRST is always first. */
-	lsm_for_each_raw(lsm) {
-		if (lsm->order == LSM_ORDER_FIRST)
-			lsm_order_append(lsm, "  first");
-	}
-
-	/* Process "security=", if given. */
+	/* Handle any Legacy LSM exclusions if one was specified. */
 	if (lsm_order_legacy) {
-		struct lsm_info *major;
-
 		/*
-		 * To match the original "security=" behavior, this
-		 * explicitly does NOT fallback to another Legacy Major
-		 * if the selected one was separately disabled: disable
-		 * all non-matching Legacy Major LSMs.
+		 * To match the original "security=" behavior, this explicitly
+		 * does NOT fallback to another Legacy Major if the selected
+		 * one was separately disabled: disable all non-matching
+		 * Legacy Major LSMs.
 		 */
-		lsm_for_each_raw(major) {
-			if ((major->flags & LSM_FLAG_LEGACY_MAJOR) &&
-			    strcmp(major->id->name, lsm_order_legacy) != 0) {
-				lsm_enabled_set(major, false);
+		lsm_for_each_raw(lsm) {
+			if ((lsm->flags & LSM_FLAG_LEGACY_MAJOR) &&
+			     strcmp(lsm->id->name, lsm_order_legacy)) {
+				lsm_enabled_set(lsm, false);
 				init_debug("security=%s disabled: %s (only one legacy major LSM)\n",
-					   lsm_order_legacy, major->id->name);
+					   lsm_order_legacy, lsm->id->name);
 			}
 		}
 	}
 
-	sep = kstrdup(order, GFP_KERNEL);
+	/* LSM_ORDER_FIRST */
+	lsm_for_each_raw(lsm) {
+		if (lsm->order == LSM_ORDER_FIRST)
+			lsm_order_append(lsm, "first");
+	}
+
+	/* Normal or "mutable" LSMs */
+	sep = kstrdup(list, GFP_KERNEL);
 	next = sep;
 	/* Walk the list, looking for matching LSMs. */
 	while ((name = strsep(&next, ",")) != NULL) {
-		bool found = false;
-
 		lsm_for_each_raw(lsm) {
-			if (strcmp(lsm->id->name, name) == 0) {
-				if (lsm->order == LSM_ORDER_MUTABLE)
-					lsm_order_append(lsm, origin);
-				found = true;
-			}
+			if (!strcmp(lsm->id->name, name) &&
+			    lsm->order == LSM_ORDER_MUTABLE)
+				lsm_order_append(lsm, src);
 		}
-
-		if (!found)
-			init_debug("%s ignored: %s (not built into kernel)\n",
-				   origin, name);
 	}
+	kfree(sep);
 
-	/* Process "security=", if given. */
+	/* Legacy LSM if specified. */
 	if (lsm_order_legacy) {
 		lsm_for_each_raw(lsm) {
-			if (lsm_order_exists(lsm))
-				continue;
-			if (strcmp(lsm->id->name, lsm_order_legacy) == 0)
-				lsm_order_append(lsm, "security=");
+			if (!strcmp(lsm->id->name, lsm_order_legacy))
+				lsm_order_append(lsm, src);
 		}
 	}
 
-	/* LSM_ORDER_LAST is always last. */
+	/* LSM_ORDER_LAST */
 	lsm_for_each_raw(lsm) {
 		if (lsm->order == LSM_ORDER_LAST)
-			lsm_order_append(lsm, "   last");
+			lsm_order_append(lsm, "last");
 	}
 
-	/* Disable all LSMs not in the ordered list. */
+	/* Disable all LSMs not previously enabled. */
 	lsm_for_each_raw(lsm) {
 		if (lsm_order_exists(lsm))
 			continue;
 		lsm_enabled_set(lsm, false);
 		init_debug("%s skipped: %s (not in requested order)\n",
-			   origin, lsm->id->name);
+			   src, lsm->id->name);
 	}
-
-	kfree(sep);
 }
 
 /**
@@ -322,9 +314,9 @@ static void __init lsm_init_ordered(void)
 				lsm_order_legacy, lsm_order_cmdline);
 			lsm_order_legacy = NULL;
 		}
-		ordered_lsm_parse(lsm_order_cmdline, "cmdline");
+		lsm_order_parse(lsm_order_cmdline, "cmdline");
 	} else
-		ordered_lsm_parse(lsm_order_builtin, "builtin");
+		lsm_order_parse(lsm_order_builtin, "builtin");
 
 	lsm_order_for_each(lsm) {
 		lsm_prepare(*lsm);
-- 
2.50.1


