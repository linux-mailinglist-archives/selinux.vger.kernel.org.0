Return-Path: <selinux+bounces-4625-lists+selinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA18B27254
	for <lists+selinux@lfdr.de>; Fri, 15 Aug 2025 00:54:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5700DA22DA2
	for <lists+selinux@lfdr.de>; Thu, 14 Aug 2025 22:54:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A22A7281357;
	Thu, 14 Aug 2025 22:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="cpctCTDz"
X-Original-To: selinux@vger.kernel.org
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0039428312F
	for <selinux@vger.kernel.org>; Thu, 14 Aug 2025 22:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755212053; cv=none; b=pz24yK88zYHJBa5KjLHYjzy+AqPU9OukeNVZ9Q0mNiSovOSbkQcb3zl3lG85SytchzilPUVSRW+l3arLX7lIsBdrYzpYDP8fDywrAfJOP1UNqDlgRMoWHpVErNxfa/8C5ZnDF6KN23RGjYlgu1Y+zuXBZuhNc2UagsXkALd+2hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755212053; c=relaxed/simple;
	bh=6Jf2jSj9Zvd0Mvh69sW62nNqFI1LA47Wt+0bcTP+YXI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QDHqUt9CI3t7vSlfFipBvJAOuSCGbecbBKo+WxkC6wgA5YOMZBEzbgqWGPH4aW0xslAA5aukRvrcpafNJ80b1bKtYORwTl1fW6xf4JHCiFV6RAcnni+K+JdDUaQgkssSaN7px2lrLiq23/ZgTdy8/FhfSbanKU2EngNeCX5CVZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=cpctCTDz; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7e8704da966so100020785a.1
        for <selinux@vger.kernel.org>; Thu, 14 Aug 2025 15:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1755212051; x=1755816851; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZfdSqUjk/D+U4qDbwJ7jUGp3W+fkdYIRqKP/NHBw3bA=;
        b=cpctCTDz9amgPvGrJobpurIy/+7Q61LJL5wtmiqSGEDL5E+bxBLsj6H3w7p5j8Rdfz
         C5Ktoogm94AL6ZHaxpThaCtriDjZHeEFZ9sdYUd1UpOmKe6n17mF0OWvdYEOO6iE+UlI
         Sn6CLKgkkL0olgEIFX0UZDVwxrTXetHDXCRmOTzRV9T1B+81jS1Af54nDu0VK6RDeuQb
         NjbnxR/DepE5NOfWV9LLUymdhTZYkcDHVAav4E5udps1lNX54acA1YlYQG0Vg8Ihixg3
         v/ybdASUw+iAM/KxO388OOQ9Ou8ML0W32Z1+IzFeNEj6zYKvViQvPL59dv6EZbyFgNTv
         ZI0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755212051; x=1755816851;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZfdSqUjk/D+U4qDbwJ7jUGp3W+fkdYIRqKP/NHBw3bA=;
        b=guEzBnuZA6UPLHC0INKrvgay4JO5dXx9D3B5XW07e5FkB9K1WE9yT8P+cphgjMFdrs
         ZQSga0KWuDvkibKnm5f73u2zS4ftg8gx4bY3Ds4059rmUAtBlgtvxPK5Rcj3sg8OR1V9
         1eqNccjHq+NdRJF81JwvWLckCxKP9WEHZdG/korwfF1CN9/x+hznt9zQNR44sIZL7jDl
         jO2dLzM1N20Ek7XzYVvjZYs6vldMumJaZ6wXU+vHkZrqfS8nbCQCOUSc3wiqY6Itqy88
         aRqIw51Y4yvtEKqE11aro1Lz7J9CEOlEU0NODOCFtzchnqU4fg+Hl7IfLsGUdefGdP9U
         8W1g==
X-Forwarded-Encrypted: i=1; AJvYcCXcg8hvrbSqg0fODhvlTktYqo10p8l4ncPZtAnHMjem7YM4gmRGLhdOFF8ZZw46KcfjKwGZtWQA@vger.kernel.org
X-Gm-Message-State: AOJu0YzymxTwIxY8M0yIncIz5DDdQWBo6xhqquJqPnF/TOBkHjNuhZPt
	Hmg+PwQ0i2jEz6uAdplevr/XdXu3oInYM7JiYoJhO0RwyEwtodAsXpvHxDi9rVAoIzZDmr3lW0g
	2vck=
X-Gm-Gg: ASbGncuVMfyrjNM83GA3NNtJYKU9tQxqdb5zqQhJQ0tUKA4QKCu4r3FQ2xETbOASK1q
	cAooxXN//xODqXAtxf0ecJp+N8XxWFub12bMx5PVT8Ctga9AGjh1Azgzlua8dtwllVSST+JIIPS
	00uZxAPZb/+qeogOWKGaag9N1IzQKOGxRgu4MT+UFQ6AnIooC+uRPW4uagsVCCppuR2Ae9R1b0H
	HleYlm3XBGnpJdv0v0OxCu8B/dw4tkvUJiQWSklq50HJYWKYTQ62k7/Afs1MdpHiYoqXLub57Lk
	+5bJqIjUdS1DLJ4ZZiYStMcnBMcumzGUZGqbRhJbGAB24NHhuYRPVlvk9OG4o/xaW+5pYwCJXdC
	NRySofyzOCzOZ4OKfv8xotA70NS76d2Yk8b/0RtBiAu3JM3PKlt47KELGpqyn+AL4zrk=
X-Google-Smtp-Source: AGHT+IEQmZyx0M7TgORYr8o/XO/6xmULFCpLAKBfCrmCveoffJDDqUt+CH8ML3wbs8zziIrr6RjM+A==
X-Received: by 2002:a05:620a:4588:b0:7e6:2610:f2e4 with SMTP id af79cd13be357-7e8702e34f6mr726583985a.3.1755212050739;
        Thu, 14 Aug 2025 15:54:10 -0700 (PDT)
Received: from localhost (pool-71-126-255-178.bstnma.fios.verizon.net. [71.126.255.178])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-70af5be3f2dsm19390316d6.75.2025.08.14.15.54.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 15:54:09 -0700 (PDT)
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
Subject: [PATCH v3 05/34] lsm: integrate report_lsm_order() code into caller
Date: Thu, 14 Aug 2025 18:50:14 -0400
Message-ID: <20250814225159.275901-41-paul@paul-moore.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250814225159.275901-36-paul@paul-moore.com>
References: <20250814225159.275901-36-paul@paul-moore.com>
Precedence: bulk
X-Mailing-List: selinux@vger.kernel.org
List-Id: <selinux.vger.kernel.org>
List-Subscribe: <mailto:selinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:selinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2058; i=paul@paul-moore.com; h=from:subject; bh=6Jf2jSj9Zvd0Mvh69sW62nNqFI1LA47Wt+0bcTP+YXI=; b=owEBbQKS/ZANAwAKAeog8tqXN4lzAcsmYgBonmicHnek4WiqCOW6K4A7nX17F9Ywn83QPfVU4 FiS6nrsi1uJAjMEAAEKAB0WIQRLQqjPB/KZ1VSXfu/qIPLalzeJcwUCaJ5onAAKCRDqIPLalzeJ c9IaD/45j/lV0Ur2Yqe7ywMf6j05N+DIKvnf9HXUOCuTnrjvV0LPuKA/QpWDG1x79mFTaRtz0d8 5DFQXVIa0WyDQbILY8Ejp1mcYp7l9abcXC5a5Eb7/l9olzmm/9GbQIBjH5yxr09ULKG7fXZ6NLd lRXCuojqFKR/mFjofpsvx8ScE0UTrZ3Jnll9ug2a4dJ9WMTBXyNpDVRDXMBZacQoyjgmt/NlIBF GyKYtvZWYYZ33661Edq7L2f6T8ihsSf+N12pXzAw7HP9jfO3j3pFqN2TNa5PydZz9v0mfDz7KCE PDeJi7l9ZC+J8C4xrldXjHO/rvMCoroanMcj2TH92gu3McrssrSzVGKKDz3OObJ4SoJE0ZEDfsi 2KdFX8MpibR6Xcsq004F4aFmYzkzKpa74Rl2dQnFiIgOcwpBiNEZW0InPzpn7+EKDqrfTA0SFhx w9en76V6eUTHtGnGd8/6fewrFNQhGCOJ6+p6TDy1lyxVX6helIzMMzylcJTtQJRdC07B6yCDD2t ceNV/cpBHtvl1eL00gWOpMj8R/SaRCAGLaxeblEk2yMeOunLoPGyMvGS0Pbbb0fuLx8WvwRMnvN PUF5Ytp2rzq48nj9+QBFAzVS0cWHOSN+q2/iotcsxig+J4O7Rf8n+3DJYcJZHXf0geyCCWuvyv9 c7AiqV7M7KF6Q5A==
X-Developer-Key: i=paul@paul-moore.com; a=openpgp; fpr=7100AADFAE6E6E940D2E0AD655E45A5AE8CA7C8A
Content-Transfer-Encoding: 8bit

With only one caller of report_lsm_order(), insert the function's code
directly into the caller and ger rid of report_lsm_order().

Reviewed-by: Casey Schaufler <casey@schaufler-ca.com>
Signed-off-by: Paul Moore <paul@paul-moore.com>
---
 security/lsm_init.c | 33 ++++++++++++---------------------
 1 file changed, 12 insertions(+), 21 deletions(-)

diff --git a/security/lsm_init.c b/security/lsm_init.c
index 18828a65c364..09afa7ad719e 100644
--- a/security/lsm_init.c
+++ b/security/lsm_init.c
@@ -291,26 +291,6 @@ static void __init ordered_lsm_parse(const char *order, const char *origin)
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
@@ -341,7 +321,9 @@ static void __init lsm_early_task(struct task_struct *task)
 
 static void __init ordered_lsm_init(void)
 {
+	unsigned int first = 0;
 	struct lsm_info **lsm;
+	struct lsm_info *early;
 
 	if (chosen_lsm_order) {
 		if (chosen_major_lsm) {
@@ -357,7 +339,16 @@ static void __init ordered_lsm_init(void)
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


