Return-Path: <selinux+bounces-3242-lists+selinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8537A82FA2
	for <lists+selinux@lfdr.de>; Wed,  9 Apr 2025 20:57:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F20FC7B1B4D
	for <lists+selinux@lfdr.de>; Wed,  9 Apr 2025 18:53:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FD0A27BF8A;
	Wed,  9 Apr 2025 18:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="bABg+TkN"
X-Original-To: selinux@vger.kernel.org
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BF73279333
	for <selinux@vger.kernel.org>; Wed,  9 Apr 2025 18:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744224830; cv=none; b=nlXD8Ruixij4QjVZmXEsPt+at5VTeliz6dRticG1QjTjUOBlet6ttBb6UeuAX79AvUyUxeslaw19dLtJH6T6c2bZp3oveSWsHYiu7Zf3y8Kv9wZY5Yl1lE19VfS+SPODy3GWKF72c4UVTElqhwID5kuzec5bHj2zWQxvx3t7XUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744224830; c=relaxed/simple;
	bh=XtVvlYRWblGkknMxfv+0u+Iq02pAOnDokKRM2FiShT4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DHU1S3LezaGSlNqw8zz6nR4Z2GzZKjyfrjKaNsem1wNNjsq5ZM1ru/KRmKxA+4f0/8KQizpeWvK+0Au2p7tld2YoTv3CMerPhGWBl19B1Ud9B9v3se0EojcpVY7zBpmTdVibGadGxgiXd2HDQEHMK0vEm/xHkKwjDtgX6vvbJM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=bABg+TkN; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7c58974ed57so1038385a.2
        for <selinux@vger.kernel.org>; Wed, 09 Apr 2025 11:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1744224826; x=1744829626; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WiYgLl5uDhdQl6bgeaSF1pb+X4c4kmb/z637fZ12vBc=;
        b=bABg+TkNnbtkLFqk/dxIoxhs+A8RzY61I7acLGLIGV2vTiDgDkEwSKB82Y1OCnpcrV
         T/HCrjTjCW/78k7lAmaxTsA6l4btWW6uKrMA0L9abEClFw+oVf3/ZvKeN2EQGyq7e9EL
         vK6/HVTe9/mgmXEnmeF6h+MpJNPetWpGJeLrN/7BbAbm7J6wgbcU6sclrmFeetwkp24d
         AEvMRTrO5Bc3zgAmU2pEhnV8JXthA55hAwfKVbGwuWe9mDFyQ3AfpmIWmpQhDU1M/Lwv
         RSCvrIxhHZsA4Py5AW35Q+FgnQ+WHJp/RoeNNac97J6i9RoVrVprTCSq1NxU/z9AXrZx
         X6Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744224826; x=1744829626;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WiYgLl5uDhdQl6bgeaSF1pb+X4c4kmb/z637fZ12vBc=;
        b=w5jbKUKJpgnfgqM9AyJnLSbLlywWeXpbnO3Lpf1K4y0bCkMgKfWNyp2GsrCyixcqs5
         laa2LkiEy94KduN/QXv/8PnuuKaKccx389pdFg5jBMLgB1f5BX+aSlUkzN5Q6oh2AY7T
         vZgEPbH+xTRveyEM+JMna7In/YXicQ+ktfngWy0EVVKzYyJ6VzsLOdM1t/iRRDwHAFOQ
         5XcdpjLzMxnXwi05UvCTrqOozRj5yTRbHoQuKeqa9gAN7EkcmXhVxOthf+Ef6A9BnNiW
         SfQqMfa9Tn6Jrh0lWmJ5P2aIm7tEi38VLi5EE1w3Vywx9zXDTd8LHbgJSFGm2ncO+6EU
         BoZw==
X-Forwarded-Encrypted: i=1; AJvYcCUth4BREOItWyZltKiATSs3t3rtSowAm+no+CWpuGj+6CQtQwuZwfyZGWv8lksl2WQK01EDFAI1@vger.kernel.org
X-Gm-Message-State: AOJu0YwzCrayliVIdAqiy0UoCWoPHJMDitVrvS38QgzOrHqXe3G4OSfT
	UdHO+/00ZFO2Op7Ck3gJ8d0/W1MGbEg28y2RxiqncUIAHCLGdHjXQ0tpGvbsj3MKKxDVTKfm6kw
	=
X-Gm-Gg: ASbGncsFa+PHWQSx2NZG+l45qYeS9txH6db371hbbh9usJdsygTK7PkWHsD7l4E2xyh
	eMFYbOEfF1CNWgyrMPmZGxgcPlff7qMzIUl9v27LMvFcxP/uNbNKhS3JgXaV7gCO5q1K6HF8j0O
	9Pj1qhWvbCTYWAhZWyOOOpHRK6FSBx0ibuZfVFgkGCMyE9XU4z+CM7brRSyMaPtbCvNXhOUCiC8
	ZSEUBLow5evJHlTNV23mo5rw4sFxf5vJeBc/DUS85FyQJyJ15PX65mKlVi0Qt/3gs/FZTJnrLxZ
	orUEKj9VFPm1/DJayE/v227vMH6Bb1YxhDCIOfpa7p/KP6YmAtRPvyYKB14NREszNslA3JPIe8j
	liBxMYQcAOA==
X-Google-Smtp-Source: AGHT+IEstbFu3PL/cbUHeUSev6rcgIuGMR1geIV1sucvr8fjrY/zJYpai452XgMdp2eTPzdTSZOr1A==
X-Received: by 2002:a05:620a:2484:b0:7c5:562d:cd02 with SMTP id af79cd13be357-7c79cc356b7mr584073585a.41.1744224825767;
        Wed, 09 Apr 2025 11:53:45 -0700 (PDT)
Received: from localhost (pool-71-126-255-178.bstnma.fios.verizon.net. [71.126.255.178])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c7a11c9ffesm106634785a.72.2025.04.09.11.53.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 11:53:45 -0700 (PDT)
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
	Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Subject: [RFC PATCH 17/29] lsm: introduce an initcall mechanism into the LSM framework
Date: Wed,  9 Apr 2025 14:50:02 -0400
Message-ID: <20250409185019.238841-48-paul@paul-moore.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250409185019.238841-31-paul@paul-moore.com>
References: <20250409185019.238841-31-paul@paul-moore.com>
Precedence: bulk
X-Mailing-List: selinux@vger.kernel.org
List-Id: <selinux.vger.kernel.org>
List-Subscribe: <mailto:selinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:selinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5184; i=paul@paul-moore.com; h=from:subject; bh=XtVvlYRWblGkknMxfv+0u+Iq02pAOnDokKRM2FiShT4=; b=owEBbQKS/ZANAwAIAeog8tqXN4lzAcsmYgBn9sHQ+Moqr3n7R64wGhRt/UGOmMdC+5MJlDSx8 8OmCZZcNTGJAjMEAAEIAB0WIQRLQqjPB/KZ1VSXfu/qIPLalzeJcwUCZ/bB0AAKCRDqIPLalzeJ c57FEADj5jUlkFCqXxTiPtSD4o6Qnmx1TwCb2o+mS3u5Tw4nSO9+R66f8yIppWkiMoK8qOI2EC+ v9x+Al/BrRTYnoM5RD5p5/DhfZ6DGx6/s9r6FtRgXOtSIpPXW2aEJQsnHzDdSwQkZoBugDkn4LE 2BPU9w4MKU5TFTUBOE+kSaMEpeCawtM4TLol2DD1Ct/R849T7B50zDgcvPaUhp3vDxIjZAvljWB 7CwHYdsHOhTU+RIi1/jG4/w4wmnAgeo+19dKNdu7rTa6yqjGOeXMkCPMalmIq7Ut0huuf7T15bP hmFEsnJq9OmgQLnyKiR1f868pY5dWxxiQ/PrORnHiuFZKtfeeCkEyh60ZXKOTD/Iq0tOxvb/wG/ XOQibSEEj1vUhlWYCft/D5KePpupRp8lzzKvk1zsK73pgTq56Qzij/k1YwDy/sEHkypZ9YXuWkV YftgErcpYMyLp64Bix/Qp22PcvgkjRrOLwhAteQHnMSuMxfoiNuODr3/IYAvcqu6i1QvSgB8jw0 qRkXG+iidTfUBTUQDuPtnbURcBfudtL5ERl/FDpGxvf69W0a5EIz78G2XQ6b4HgoaeDDtNlOBsH m9hFdNHzfURLvUfYxkEl7JJevreUDiIzZ0e0dPOcVcWjqOa1UbvXXJv3KS/o4kq4CuhcfQd1KFS 3GLCrcrpeqgqzCA==
X-Developer-Key: i=paul@paul-moore.com; a=openpgp; fpr=7100AADFAE6E6E940D2E0AD655E45A5AE8CA7C8A
Content-Transfer-Encoding: 8bit

Currently the individual LSMs register their own initcalls, and while
this should be harmless, it can be wasteful in the case where a LSM
is disabled at boot as the initcall will still be executed.  This
patch introduces support for managing the initcalls in the LSM
framework, and future patches will convert the existing LSMs over to
this new mechanism.

Only initcall types which are used by the current in-tree LSMs are
supported, additional initcall types can easily be added in the future
if needed.

Signed-off-by: Paul Moore <paul@paul-moore.com>
---
 include/linux/lsm_hooks.h | 33 ++++++++++++---
 security/lsm_init.c       | 89 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 117 insertions(+), 5 deletions(-)

diff --git a/include/linux/lsm_hooks.h b/include/linux/lsm_hooks.h
index a7ecb0791a0f..0d2c2a017ffc 100644
--- a/include/linux/lsm_hooks.h
+++ b/include/linux/lsm_hooks.h
@@ -148,13 +148,36 @@ enum lsm_order {
 	LSM_ORDER_LAST = 1,	/* This is only for integrity. */
 };
 
+/**
+ * struct lsm_info - Define an individual LSM for the LSM framework.
+ * @id: LSM name/ID info
+ * @order: ordering with respect to other LSMs, optional
+ * @flags: descriptive flags, optional
+ * @blobs: LSM blob sharing, optional
+ * @enabled: controlled by CONFIG_LSM, optional
+ * @init: LSM specific initialization routine
+ * @initcall_pure: LSM callback for initcall_pure() setup, optional
+ * @initcall_early: LSM callback for early_initcall setup, optional
+ * @initcall_core: LSM callback for core_initcall() setup, optional
+ * @initcall_subsys: LSM callback for subsys_initcall() setup, optional
+ * @initcall_fs: LSM callback for fs_initcall setup, optional
+ * @nitcall_device: LSM callback for device_initcall() setup, optional
+ * @initcall_late: LSM callback for late_initcall() setup, optional
+ */
 struct lsm_info {
 	const struct lsm_id *id;
-	enum lsm_order order;	/* Optional: default is LSM_ORDER_MUTABLE */
-	unsigned long flags;	/* Optional: flags describing LSM */
-	int *enabled;		/* Optional: controlled by CONFIG_LSM */
-	int (*init)(void);	/* Required. */
-	struct lsm_blob_sizes *blobs; /* Optional: for blob sharing. */
+	enum lsm_order order;
+	unsigned long flags;
+	struct lsm_blob_sizes *blobs;
+	int *enabled;
+	int (*init)(void);
+	int (*initcall_pure)(void);
+	int (*initcall_early)(void);
+	int (*initcall_core)(void);
+	int (*initcall_subsys)(void);
+	int (*initcall_fs)(void);
+	int (*initcall_device)(void);
+	int (*initcall_late)(void);
 };
 
 #define DEFINE_LSM(lsm)							\
diff --git a/security/lsm_init.c b/security/lsm_init.c
index 8e00afeb84cf..75eb0cc82869 100644
--- a/security/lsm_init.c
+++ b/security/lsm_init.c
@@ -39,6 +39,27 @@ static __initdata struct lsm_info *lsm_order[MAX_LSM_COUNT + 1];
 	for ((iter) = __start_early_lsm_info;				\
 	     (iter) < __end_early_lsm_info; (iter)++)
 
+#define lsm_initcall(level)						\
+	({ 								\
+		int _r, _rc = 0;					\
+		struct lsm_info **_lp, *_l; 				\
+		lsm_order_for_each(_lp) { 				\
+			_l = *_lp; 					\
+			if (!_l->initcall_##level) 			\
+				continue;				\
+			lsm_pr_dbg("running %s %s initcall",		\
+				   _l->id->name, #level);		\
+			_r = _l->initcall_##level();			\
+			if (_r) {					\
+				pr_warn("failed LSM %s %s initcall with errno %d\n", \
+					_l->id->name, #level, _r);	\
+				if (!_rc)				\
+					_rc = _r;			\
+			}						\
+		}							\
+		_rc;							\
+	})
+
 /**
  * lsm_choose_security - Legacy "major" LSM selection
  * @str: kernel command line parameter
@@ -458,3 +479,71 @@ int __init security_init(void)
 
 	return 0;
 }
+
+/**
+ * security_initcall_pure - Run the LSM pure initcalls
+ */
+static int __init security_initcall_pure(void)
+{
+	return lsm_initcall(pure);
+}
+pure_initcall(security_initcall_pure);
+
+/**
+ * security_initcall_early - Run the LSM early initcalls
+ */
+static int __init security_initcall_early(void)
+{
+	return lsm_initcall(early);
+}
+early_initcall(security_initcall_early);
+
+/**
+ * security_initcall_core - Run the LSM core initcalls
+ */
+static int __init security_initcall_core(void)
+{
+	return lsm_initcall(core);
+}
+core_initcall(security_initcall_core);
+
+/**
+ * security_initcall_subsys - Run the LSM subsys initcalls
+ */
+static int __init security_initcall_subsys(void)
+{
+	return lsm_initcall(subsys);
+}
+subsys_initcall(security_initcall_subsys);
+
+/**
+ * security_initcall_fs - Run the LSM fs initcalls
+ */
+static int __init security_initcall_fs(void)
+{
+	return lsm_initcall(fs);
+}
+fs_initcall(security_initcall_fs);
+
+/**
+ * security_initcall_device - Run the LSM device initcalls
+ */
+static int __init security_initcall_device(void)
+{
+	return lsm_initcall(device);
+}
+device_initcall(security_initcall_device);
+
+/**
+ * security_initcall_late - Run the LSM late initcalls
+ */
+static int __init security_initcall_late(void)
+{
+	int rc;
+
+	rc = lsm_initcall(late);
+	lsm_pr_dbg("all enabled LSMs fully activated\n");
+
+	return rc;
+}
+late_initcall(security_initcall_late);
-- 
2.49.0


