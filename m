Return-Path: <selinux+bounces-4347-lists+selinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E563B0CDBB
	for <lists+selinux@lfdr.de>; Tue, 22 Jul 2025 01:24:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 309DA17B97A
	for <lists+selinux@lfdr.de>; Mon, 21 Jul 2025 23:24:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4560F24679D;
	Mon, 21 Jul 2025 23:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="aEfS4R3a"
X-Original-To: selinux@vger.kernel.org
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99A95246765
	for <selinux@vger.kernel.org>; Mon, 21 Jul 2025 23:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753140247; cv=none; b=CLJqpyLsfOCYqUZ8xC6zjxkfaFDvw3NWqyp3HOhsRP7k0quyNFEHNAoQWw2+uYoopdcAkI9zQE1aRN2xzKJK3GxSg6V+h94qwyC0GK1EsKVhHDZrO+rmkBCJrNglwBHiCUs0XBvZqzaocdCkvZ3pv8UxqqEHpmJ9O99KOM0vzAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753140247; c=relaxed/simple;
	bh=sJ3xHy7C70p8eD3qfM5ogSJFTU3Y5lkGyavDif9LnjE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UN4lmlrZqBy159AOmKLYrv2X4dFhBm3ZSis+c8bGnCA4Tb44NboUU3erK1c1IsgQXkgmxMVVa+v/Pw1rA57gIgjNacCxUr6Fm6IwSD476gYQs4QizVE/XGlqz9CZdbP1rh28mqk5TMw35X4KITYBFVcuJo97LTY+JRwTMBnoiy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=aEfS4R3a; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-4ab7082b3f7so64158451cf.3
        for <selinux@vger.kernel.org>; Mon, 21 Jul 2025 16:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1753140244; x=1753745044; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=beo6MFDAYtua5/S2j8GARDSQ9e3HZAx0UoA8dvN4IVI=;
        b=aEfS4R3amkdLjnuTFHH5tfqsryHrdK9knZt4KLi4mlQM4f8uHYFdSJrSrFf+zUtEmt
         8ze2CNUSNJptJMg8dt2j0OV8EN4y2Llpn+eVKIDmXvrAyAFZtgRcb3xL2Ce4OR5aWlAo
         ZTlX1vkdJiqOJbMKSPyowoIDkCsWh5VoUyPH2w3vWDWL2yKKPczcv/fS+7aDwY/+IrF8
         MhPiLq149mEBQi8sIm1qjYgGmSsn1++3kHeevVqtXdMut2VI1U61Lk0h9+gpLh3/YDwh
         K+ERgyjyKzeEhyapQIl9KLjK3qy02HtSC8BYA1sOKz6gwpovgRGUPSF3IqiT6s72ZSm1
         qimw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753140244; x=1753745044;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=beo6MFDAYtua5/S2j8GARDSQ9e3HZAx0UoA8dvN4IVI=;
        b=jaLLAelrpiwRLouTrnbvEAkXR6cECRzWsysg4sCWqAVdV4Ia+16FDJWe3QP+0nYLpi
         ERgr/JeVgsugx/6W78Qe4WndQLmGPkUbWiMbEU3aIHKOvFBxul7iqc870uKoq/BbGSO0
         5UhHEx7X1aH266Octa5QAJCE2pANE4o63oEogHi+m6lZRkwVr9XndBZ19/Oui3Q492y7
         o5F0nIuERlBPCfvX3y77Q8ao3G+uMw41lFuC0LX5k+HWMveTqRe4ncZzUKtBIDxvILa8
         sXCnIIloeA6tDVkcLhw5dBaSiMBBuo330jiupvJpg/z9EKFnLBBiVFZ1AQdkE5pQ8VFZ
         jdxQ==
X-Forwarded-Encrypted: i=1; AJvYcCXXnYcth2FX3kP/jxVwZfn8PROinjBq4i3YnKdJ4E4N++gmyMTVVTlA4whlIbzwWIgcpbJ3Cb1k@vger.kernel.org
X-Gm-Message-State: AOJu0YzstxPt1wS/BuCWhDqsXciq7W6R1vC+SX8QvRqDOjzAUS9ESYcn
	5kiVXZyl4yNFQTc0h24QRapY19on3j5LhP3mSj4mwZgG+xaQVdQVFr09QHvAmxF4wRDM/GEvfpH
	bFoE=
X-Gm-Gg: ASbGncsxxJW4/V79ANsCtli4D6m6CcEdLQS4rhkfGoryoL756x7mPvW5WkAnU7klloF
	/vK86DbQeNkOxDxe/Ss2ceDy1PC3GMWct/aQbAHNd/RciWVaBYVYFwOW6h32XhxFf5h1ZLoB4rA
	jkDel6LBVSHXykgO6652oe4nGHOLoIZRXXR4y1G2/VMiA5TTRYSpMU+7Hja/kgfXYSUH7T/nI+Z
	hDgtMCyQqpCUa3RymTu2gDywJC3oY09c0Vj5QJLEUWz/DeSg8yUA9qIYF4ueuLFDClXBUM8iKWU
	otI81K637j1VZR+Lehv4VBfn2bromnF6rWcTLx21bGQAl4NK1NtW+wUKQZpt+fTKvBsi8yB03wJ
	MPndiwpmO8kmHrRxAtJ6nOHiS0UrIQ8dOXNleL2yqwE5bsiCnu9PlqOd+Gy8ibRHXRizRpHWB6J
	SEjw==
X-Google-Smtp-Source: AGHT+IFoonNJzWXgnH/3KtOAD2gWtOBkFOgNqS2pzH1PLI/hnzTpsgw4zYDsrF7GZ3mUmkB7iYo2nw==
X-Received: by 2002:a05:622a:1187:b0:4aa:a5c8:8645 with SMTP id d75a77b69052e-4abd0622ee4mr82574031cf.22.1753140244576;
        Mon, 21 Jul 2025 16:24:04 -0700 (PDT)
Received: from localhost (pool-71-126-255-178.bstnma.fios.verizon.net. [71.126.255.178])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-4abb49a95c9sm48093881cf.27.2025.07.21.16.24.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 16:24:04 -0700 (PDT)
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
Subject: [RFC PATCH v2 05/34] lsm: integrate report_lsm_order() code into caller
Date: Mon, 21 Jul 2025 19:21:08 -0400
Message-ID: <20250721232142.77224-41-paul@paul-moore.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250721232142.77224-36-paul@paul-moore.com>
References: <20250721232142.77224-36-paul@paul-moore.com>
Precedence: bulk
X-Mailing-List: selinux@vger.kernel.org
List-Id: <selinux.vger.kernel.org>
List-Subscribe: <mailto:selinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:selinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2003; i=paul@paul-moore.com; h=from:subject; bh=sJ3xHy7C70p8eD3qfM5ogSJFTU3Y5lkGyavDif9LnjE=; b=owEBbQKS/ZANAwAKAeog8tqXN4lzAcsmYgBofsubFQ02x5okQRnLfJFXEQBTRBCEH72Si1g+0 fLnIqLHo7KJAjMEAAEKAB0WIQRLQqjPB/KZ1VSXfu/qIPLalzeJcwUCaH7LmwAKCRDqIPLalzeJ c9MID/4qbI6LBQ3r9eKYM4n1dbbBZ6t6cl22UVk/Mc5X7k8EJE1Asvptpk859IaZjQ8tKIKK2J2 9MIPFX6RtOszP9ahTFS+fRFwksTjND4eg3TsBnh6AlBMGgTlKqqDZsOIPZ5y+JLmSiC9x9riUmE QgSQIxrhwHDVI0YXMHriKAoyAaq3Wc9Pw5wDi7zQZFQRAVCXd+VG9PHF0/14lg4bgA5HxqUPSD5 ANjscsCuUjvXqUF3qcLifLDAbcjbEunLgIkmkjqyBBbH96rZls6jDn2ZKINPU76Eix+NxklqQ5X ISEzI2VSvsPs+UYu44L8JUVw1Lf2f0kXf5Iy+P1/7/UsStmsOJrbrUojWWs7EXMT7On2xz1rHKW UAKdgF2BdZT06dGjuh6n666fc+G6pOwmAqewxAbQceKztR7ee0MmIpVC/DAlHlJbmPQqjKc+pRB PrXDN7zxRq85FOh1dwvyYY3nfmxIyNmJmaiTZ6X/lIevIPMe0z8nuDRi8EGp9U443KVtkbg3OnJ 8WBcUQKsREBTbbChr46E0Nw5rIq9lDq0jm29RbaCWd7HZcW36u6Z+qiPm4LP8GGowdhaFGHKwuL hhIoZSpZrgsIWQjRzZTEGdfQztGzAeHGq/wDBWLTOW7gyBYz8Hu9y0GBXsiTHPkwRc/IlNJbMVl +Sw27+ahg1cAB+w==
X-Developer-Key: i=paul@paul-moore.com; a=openpgp; fpr=7100AADFAE6E6E940D2E0AD655E45A5AE8CA7C8A
Content-Transfer-Encoding: 8bit

With only one caller of report_lsm_order(), insert the function's code
directly into the caller and ger rid of report_lsm_order().

Signed-off-by: Paul Moore <paul@paul-moore.com>
---
 security/lsm_init.c | 33 ++++++++++++---------------------
 1 file changed, 12 insertions(+), 21 deletions(-)

diff --git a/security/lsm_init.c b/security/lsm_init.c
index a73c3769dfea..d20c6df55e7d 100644
--- a/security/lsm_init.c
+++ b/security/lsm_init.c
@@ -288,26 +288,6 @@ static void __init ordered_lsm_parse(const char *order, const char *origin)
 	kfree(sep);
 }
 
-static void __init report_lsm_order(void)
-{
-	struct lsm_info **lsm, *early;
-	int first = 0;
-
-	pr_info("initializing lsm=");
-
-	/* Report each enabled LSM name, comma separated. */
-	lsm_early_for_each_raw(early) {
-		if (is_enabled(early))
-			pr_cont("%s%s", first++ == 0 ? "" : ",", early->name);
-	}
-	lsm_order_for_each(lsm) {
-		if (is_enabled(*lsm))
-			pr_cont("%s%s", first++ == 0 ? "" : ",", (*lsm)->name);
-	}
-
-	pr_cont("\n");
-}
-
 /**
  * lsm_early_cred - during initialization allocate a composite cred blob
  * @cred: the cred that needs a blob
@@ -338,7 +318,9 @@ static void __init lsm_early_task(struct task_struct *task)
 
 static void __init ordered_lsm_init(void)
 {
+	unsigned int first = 0;
 	struct lsm_info **lsm;
+	struct lsm_info *early;
 
 	if (chosen_lsm_order) {
 		if (chosen_major_lsm) {
@@ -354,7 +336,16 @@ static void __init ordered_lsm_init(void)
 		lsm_prepare(*lsm);
 	}
 
-	report_lsm_order();
+	pr_info("initializing lsm=");
+	lsm_early_for_each_raw(early) {
+		if (is_enabled(early))
+			pr_cont("%s%s", first++ == 0 ? "" : ",", early->name);
+	}
+	lsm_order_for_each(lsm) {
+		if (is_enabled(*lsm))
+			pr_cont("%s%s", first++ == 0 ? "" : ",", (*lsm)->name);
+	}
+	pr_cont("\n");
 
 	init_debug("cred blob size       = %d\n", blob_sizes.lbs_cred);
 	init_debug("file blob size       = %d\n", blob_sizes.lbs_file);
-- 
2.50.1


