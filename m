Return-Path: <selinux+bounces-4357-lists+selinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4338B0CDD5
	for <lists+selinux@lfdr.de>; Tue, 22 Jul 2025 01:24:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9B49717BF20
	for <lists+selinux@lfdr.de>; Mon, 21 Jul 2025 23:24:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1316F24DCE9;
	Mon, 21 Jul 2025 23:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="MFlodj7h"
X-Original-To: selinux@vger.kernel.org
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F93B248F70
	for <selinux@vger.kernel.org>; Mon, 21 Jul 2025 23:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753140257; cv=none; b=OwzPRF/3mlZhzfGcmYGNo7aCAKiEO0r8yiMBqObGYs2SiEX5r/+psQRbTEsfypXhgsUUpPs/jAyKUoD1m2MzcM3y/nyRe+fcL3G24cF/0FqatODCfIFm/pmRwCMiSFtDNvVurR3I9zBbKaY3vKYYQRt5hBlYMAy0ynCmdTGhuFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753140257; c=relaxed/simple;
	bh=s8ajgUtPSxBTK34/D0YMgtbhZ/1foUt3kMyIZU+SVng=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bf9Ocse24ULwEBMytPW8HGNwiwfZFxMKekl4jIwrlFv5oEdslQeVXYjeIV0OwEa5B2h9NeowZSbVc8gWDqZ6SUVFINSPdv9t5+RIhtGcYyFtJdfjmDgDdFL0AQ5/1GW5Na9SP4OPaHBuj8jxgIGYNCT+1/IT8jErjJ3/gAELCCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=MFlodj7h; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7e2c1dc6567so312601185a.1
        for <selinux@vger.kernel.org>; Mon, 21 Jul 2025 16:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1753140255; x=1753745055; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PD5DGZEPiqCZ1vxQcnp+XZPHkrpuEfjcGw+lKSBcCZA=;
        b=MFlodj7h1llK5MYhfpInB+cJ/1n5gvDdJDpld8O0gQ4h9krJf0wGRkf0SllDiXLcfw
         /sVxBuEbZcJtbRKmW46ZXAGK/dTjNGo+hWu9kaSIQkCnwl+L7UhKvLBAhUhF4Unc7Spi
         bekUvQkbZyYWR7ROrg+EXpk2HV0ZcxgGMM/mTC2X3MQN2U84bnt49O6kJUrdoJ1eFdDQ
         V9gQbSEiO6IOol9RCY0nSgrW/Wp5BQkEBBO+nRTX0Qj+itm4HvpX6jhVNU1/K8EPAiY5
         oQ6EaMKUcqyY+Cqlblneoe3it56jKAzy8IJ8f7v+r8wQTPQD9NVB1bOpU55XrXthL1kW
         VRyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753140255; x=1753745055;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PD5DGZEPiqCZ1vxQcnp+XZPHkrpuEfjcGw+lKSBcCZA=;
        b=PV2kIAVsPDxPB7z+9h+yEpRyfvVmkmA+BBByPOQewrUfmcX4GWGJqwV8cIU0nqBdtK
         kxBQyLwYo2XQtbV/D7pv13vQ5vYJhPPcQFcWJs2KbhUk0aqEBJxoocDAcdS+S7SBrzLY
         E4PG4N7YzEbBxjHXxy5dKSOswd/cMBpus4cNfje6Ruu2CIgxyeyZdH5JY/Lx36OlAy1P
         7ZaOh+14poqHvBoTYcdoeK1cPLxBk63UhdMG2X9op/ThoDvmfWxuoeqxrxWLyQPV0Lyx
         86+GmR15250E5oDf/vjE5luep4oynz6zT6u+E3ORYQs9TMKT4euxT3x9YN00fWQ3vnBK
         342A==
X-Forwarded-Encrypted: i=1; AJvYcCWa0jGpkbplzQBSROVZ/47HC0HPymTHm5SVOe/6vql8SAG0KbIgAMy5kNLdDqO4oCzX/udT7leQ@vger.kernel.org
X-Gm-Message-State: AOJu0YzVC4VW17ya5LKKVmuwHKD/vdcFS1Tc/ns6bIsnEdIEs1YzuY6S
	sCJXwJAgAs6l7Ifgv9yyXvTTZagehEM0YA4frzigmcuGPNq71y0bBSzGCipN0UnsSw==
X-Gm-Gg: ASbGncvna84rf7mWGpPl855b/mcUVRZFITWfBGfpE+cSxWtPEHlP8im1l2+B9Ho2keT
	cXMJt7gOKrv9rQv4BDoQQmrx4tf1+BluoyV5kvD+M8WhpQSeLspGxhWsGufLuvRKxeftp4IGe3C
	WsY4e6q7kcQ52EL1+EL898rlLjwOUhFtHmJwT3A1xW5SsSsraqWzE74+VJnmA4OrwZGP5OKCqwm
	5r3g4W44lnVEnvU8aDfFEnnRIWmG1maZM0rbPPiriyngOnq18HCVTFhS9W4Z6C113pI8FgXTBE2
	KgCdMtp0hTiZbyHnBxgXbEJiraTnZVI+UkV0H0RyIeQg5YlufT606VdNO6fdG1SwzFPkizejRog
	DX9lCmBVOFSKbs/czZFHrY4dQr7hwlbeorGE/GQTV274Yun72ITDf14Ho5wnmmxChVu8=
X-Google-Smtp-Source: AGHT+IFtF9pLRCzD9wTDfHj/BsxYJm/9dARApCvNXQSGJ08WEfZJYRhGrP+vVcnDQWv+BLRW+qXLZA==
X-Received: by 2002:a05:6214:19e2:b0:6fd:74d4:b6 with SMTP id 6a1803df08f44-704f6aa0301mr332315806d6.28.1753140255173;
        Mon, 21 Jul 2025 16:24:15 -0700 (PDT)
Received: from localhost (pool-71-126-255-178.bstnma.fios.verizon.net. [71.126.255.178])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-7051b921b86sm45418056d6.49.2025.07.21.16.24.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 16:24:14 -0700 (PDT)
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
Subject: [RFC PATCH v2 15/34] lsm: rename/rework ordered_lsm_parse() to lsm_order_parse()
Date: Mon, 21 Jul 2025 19:21:18 -0400
Message-ID: <20250721232142.77224-51-paul@paul-moore.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250721232142.77224-36-paul@paul-moore.com>
References: <20250721232142.77224-36-paul@paul-moore.com>
Precedence: bulk
X-Mailing-List: selinux@vger.kernel.org
List-Id: <selinux.vger.kernel.org>
List-Subscribe: <mailto:selinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:selinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4783; i=paul@paul-moore.com; h=from:subject; bh=s8ajgUtPSxBTK34/D0YMgtbhZ/1foUt3kMyIZU+SVng=; b=owEBbQKS/ZANAwAKAeog8tqXN4lzAcsmYgBofsu+K3X3GBLwLQOLO+7aqlOfI3tNg0C4Gvmiq NanPCbrBWGJAjMEAAEKAB0WIQRLQqjPB/KZ1VSXfu/qIPLalzeJcwUCaH7LvgAKCRDqIPLalzeJ c0CFD/9LkEItfBU/qx5q1+E2zhO2ZdvXyDYzvOFpqgAuDhipEaRPm2YbosuO9V0REN41pGe88AT C76pVx9mNkL9eoVzYBr6dcZ0lCkr6xi4+BcgQfJ+LjNWhvDBquyprbyQGNrfguBqyfIZHbN6EBy u3FcbgPmpNCjt064CWOTfPhPQGkbTX5qS+XK668K+jLOPnC4cEd57FZUiGHxUEDyzmfonqGjlaW ul/+iQjAjxzSS4WuuFD5eLANSKz6LddadkP7n2vNzDNTE3hEqbc0+eauC8vKjWFAFA/bMhIIk/l PKhBZaWae/sVqX1CrvWaGhFDkWvdeo9/yyJBZAVAqaJu9fl12EB5OB0EYg/+AGOv5iw8UkUtzBP nozQwUoJf5PuhN0f9/4502cP8Pw+BepAx8G9FLVhB8Z0cjH2QX2k+cBFoVB2l/jPmBXxm3q5RvQ qwTuzgFqkb6zZ/hnm5JErTI8ICx/GtfMQ5pkLmqrJiUeWn8soZdrpOctEbjTpyW4NDp594ye0FO Suww097DHyl2Jgm/AzemvMTrnK5Qv6CL5xaT6Ed+WYl2veLhiVntagNEHODfjGKjq9vd38NDtAM NmBTifj/dLfP1emfKc42Fv0+cc2/XRtUQ5733KoqiUft47AH1jEZkx3bGpByJTYNfVXu7eqLiFE hCqivUL0xWwzxjQ==
X-Developer-Key: i=paul@paul-moore.com; a=openpgp; fpr=7100AADFAE6E6E940D2E0AD655E45A5AE8CA7C8A
Content-Transfer-Encoding: 8bit

Rename ordered_lsm_parse() to lsm_order_parse() for the sake of
consistency with the other LSM initialization routines, and also
do some minor rework of the function.  Aside from some minor style
decisions, the majority of the rework involved shuffling the order
of the LSM_FLAG_LEGACY and LSM_ORDER_FIRST code so that the
LSM_FLAG_LEGACY checks are handled first; it is important to note
that this doesn't affect the order in which the LSMs are registered.

Signed-off-by: Paul Moore <paul@paul-moore.com>
---
 security/lsm_init.c | 82 ++++++++++++++++++++-------------------------
 1 file changed, 37 insertions(+), 45 deletions(-)

diff --git a/security/lsm_init.c b/security/lsm_init.c
index 8c632ab77da9..b1156f414491 100644
--- a/security/lsm_init.c
+++ b/security/lsm_init.c
@@ -225,83 +225,75 @@ static void __init initialize_lsm(struct lsm_info *lsm)
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
@@ -319,9 +311,9 @@ static void __init lsm_init_ordered(void)
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


