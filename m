Return-Path: <selinux+bounces-3225-lists+selinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 37ECDA82F4D
	for <lists+selinux@lfdr.de>; Wed,  9 Apr 2025 20:53:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 06F9419E6ED4
	for <lists+selinux@lfdr.de>; Wed,  9 Apr 2025 18:54:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E7EF278162;
	Wed,  9 Apr 2025 18:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="Ijz3mOeC"
X-Original-To: selinux@vger.kernel.org
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9560D277009
	for <selinux@vger.kernel.org>; Wed,  9 Apr 2025 18:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744224813; cv=none; b=NR56BqSrIYGSzzLnXzWAb4SAdrIgHDLm2XgNcn9cUkt71TpjxbMO65ph9GXVsc4hUrV8flKAOuEZDzoZx8MP4N2itFKvw6/O7UPy3Ap/7d/jSu4oFBxSAW5ATXKo4EuTLfXzZbsSmUf/Dfrva4LE+MjvnVInr/0uggX9R4Iq4xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744224813; c=relaxed/simple;
	bh=pST0Jy42PlsO0MpZv3Tmw04rGz8RTx/Oz6ErubDMxwo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M8S/v14uZQDaKL9Qsm5KAumDEdc5EG792bC2HlGK2b7R0IhjW7RMvxOQE56EwJM9AuNcKgK4zJWyr9A3KG/iZOSJtc9xPvC9EBliXHHORzc9DM9gt0XOc7kgL8bSLzwtjA8U7fGUm20VXDhoO7kEawd8Sd/nkfvbgjYKhMwL5Zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=Ijz3mOeC; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6e8f06e13a4so11156376d6.0
        for <selinux@vger.kernel.org>; Wed, 09 Apr 2025 11:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1744224810; x=1744829610; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=riL1KUp604CYpD1AiWNliF00+qwNhMr/LsXwK6I/EDI=;
        b=Ijz3mOeCYOdU2GA2D1wzEdTUDjv/ZRKlMR/dP/01ML0nFTLB/rBeuF2E8Wfmqss530
         y/487Hj0e8tP2JIXYS0weUINerXes5OIrF3xHWiK4ItbTwgUit4uDJksfI8Iyftz9RhB
         71FnfF1CpAH3RlFaAenEJ5BwTOp/tko7YbdroKoSaE9C02v869LLM/jK4k/ciMOFqYPz
         i4DId0FdCGbuBiRQSrwwkSnsHfmp/lymZC/lp2UYDElXVzqFPiBRAJOMS5QyFHKjWH3F
         ucnizQL1f8ncPMFrlDZXMWtJF9K84uorrkphcmsz86Mu/2AF5K9jkLsZvfDJszTk2JPq
         aimA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744224810; x=1744829610;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=riL1KUp604CYpD1AiWNliF00+qwNhMr/LsXwK6I/EDI=;
        b=RnWiGPyi232spg9HO2fehpTjeG7iIJASPLedEPle8tpWguCq8lVEvvGEqOAbJcpKxJ
         axrZxmDBxUHq3nCzNkhbk9WA91TxljmjFsVpGGJ/71wbgUm51L0wVVnNbJZ2gWFjgKQd
         9iZV55Kj8tHR7SOJ6KIPxUpjS60v3MkvvLvSIUe7diYVck4Ef9eYNO/mzoeaIBGg8J+f
         u/+mNAW3hx3faNa6hFABbbTp6TBNuxa0I4OBjBdXfCkY5cqSP/5ipEMpNyiGVAPNy2kE
         07w5pckFQSKqGtATjC7jDMxNI7S7B2jhSORokPOCxNE9g9Puf4lvbKUJlVfh/OSli6df
         qQUA==
X-Forwarded-Encrypted: i=1; AJvYcCULvgPcbqO1xbxs9kIojFZyKc2a0J6/zfkWpDSyHlVkChIqG96j/g8IttFU1wJGy02fpQa+aJk5@vger.kernel.org
X-Gm-Message-State: AOJu0YyWhtspGiG59yyBOoCu59ra6tKaW5AzCy/7Ie/fKqtLuA2fT3nc
	60U+P+V+TmV6VKiOLPSUltkovzDzLmamXAlpL6GPipy09+m8pY8X+Wv60JMFtg==
X-Gm-Gg: ASbGncsHRh22AP79nqQvUSISjYqkBynSYve/rHdHyHfx5ulGxRVfIDRwJBwn+ds+aba
	QOvesbBijCmyBPXM8d5xeT3X3garBhiL/WjyxuQ05eK6TX7CIkfyQNAJBV3r5M1LUNMnd+fyIh1
	LAibrKwZw6xLIqKUnMxyKcI7Nj2xf01/ObvImeyTvdbYGNI1LuXtFs9M0+M4ddX6RpbIgPaj9ck
	8ueVMqzppP9NUr4wpAO1hx6SgZgzGKn9e2EbDbwIVWwyNc2DzWk0/eIEim88IYuWRTCJJkpQY2I
	V24pLEiqITWMXPStWL/UlPPKt+x4M+NBebBM3etmQ3eBlC5ywOQREx9l5UZIif+dOuAg/A0B66E
	6r6oKBxkjkcPo31d+IYBY
X-Google-Smtp-Source: AGHT+IGGqQ+5TDtMPJUftGLobaOx7r+y0xyJI6orbJraNyiHa62EsNyYAeQTLymIJ5NZ2wzofRrAVg==
X-Received: by 2002:a05:6214:29e3:b0:6d9:ac3:e730 with SMTP id 6a1803df08f44-6f0e4c543fcmr8888226d6.5.1744224810451;
        Wed, 09 Apr 2025 11:53:30 -0700 (PDT)
Received: from localhost (pool-71-126-255-178.bstnma.fios.verizon.net. [71.126.255.178])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6f0de9732f1sm10627506d6.44.2025.04.09.11.53.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 11:53:30 -0700 (PDT)
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
Subject: [RFC PATCH 01/29] lsm: split the notifier code out into lsm_notifier.c
Date: Wed,  9 Apr 2025 14:49:46 -0400
Message-ID: <20250409185019.238841-32-paul@paul-moore.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250409185019.238841-31-paul@paul-moore.com>
References: <20250409185019.238841-31-paul@paul-moore.com>
Precedence: bulk
X-Mailing-List: selinux@vger.kernel.org
List-Id: <selinux.vger.kernel.org>
List-Subscribe: <mailto:selinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:selinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3373; i=paul@paul-moore.com; h=from:subject; bh=pST0Jy42PlsO0MpZv3Tmw04rGz8RTx/Oz6ErubDMxwo=; b=owEBbQKS/ZANAwAIAeog8tqXN4lzAcsmYgBn9sFrd2BQ5kvOfAZSK6RvKZzIqRR99lLiF2bqN pnGNiXi9MWJAjMEAAEIAB0WIQRLQqjPB/KZ1VSXfu/qIPLalzeJcwUCZ/bBawAKCRDqIPLalzeJ cwOQD/9bfknkxydw8DwctdBJLYfuqvr64I6HAlZQL5my5A8Wg3Vo1HdGPu6KC3Y53g2Uh1IOPnu 2z+3KL6bAtAzY3vTSt1DzOMeFIwtHRlwl7b13SwzUDNZDjSzjYKvJDrhc5FIdOtA1iRJ165ud9j cOp7hnablMr/sDzHwVZlaS0d4QiN7mtKmcwLxfPrjdimBBmmCFTlxEHbmcacRJmWYAkV6nT7yhZ lhzw68uzYTUCO/jBv4jwC4MntaHJpbNmvvr0xnX08D/drYmAauk3m8WAc70iLiq9p4FzVjIoHzc SH4sfMmLbkSn3lankDvhC7nLg8r7WDDZQr0rhpT7L9YYwMj4HIMh8ILJxsgiEmHMBBmA9F9H0AZ /obaG2I+ts3NWr9Js3Yq00UcR0wwBq0Lw9ev9wp4IvGZcEMsvU0baGLLNBYlR8xVgkCMxgfqN04 f/NhjbSj7EKLI3vXglFkFv+LnOx6hRgLVzofm1uhyLvltJXdkZ3gfCYbJ6dyKFVtZW7oQTTVwcz OhsQlyFY06ybQVOQK92ejGzvNZ0G4NrbK4sKbc1a8xuSDEcsKB/WDVfND+Ste/hT28FYa3eRd44 RtCOjhfd4a5mp+F6aDchV3bg/3ebuLO8EUrKUM1v0u3r5y4FRGigsa4f1zF2p20ok3FKAOCT+yJ u0EBYDe39poS1pQ==
X-Developer-Key: i=paul@paul-moore.com; a=openpgp; fpr=7100AADFAE6E6E940D2E0AD655E45A5AE8CA7C8A
Content-Transfer-Encoding: 8bit

In an effort to decompose security/security.c somewhat to make it less
twisted and unwieldy, pull out the LSM notifier code into a new file
as it is fairly well self-contained.

No code changes.

Signed-off-by: Paul Moore <paul@paul-moore.com>
---
 security/Makefile       |  2 +-
 security/lsm_notifier.c | 31 +++++++++++++++++++++++++++++++
 security/security.c     | 23 -----------------------
 3 files changed, 32 insertions(+), 24 deletions(-)
 create mode 100644 security/lsm_notifier.c

diff --git a/security/Makefile b/security/Makefile
index 22ff4c8bd8ce..14d87847bce8 100644
--- a/security/Makefile
+++ b/security/Makefile
@@ -11,7 +11,7 @@ obj-$(CONFIG_SECURITY) 			+= lsm_syscalls.o
 obj-$(CONFIG_MMU)			+= min_addr.o
 
 # Object file lists
-obj-$(CONFIG_SECURITY)			+= security.o
+obj-$(CONFIG_SECURITY)			+= security.o lsm_notifier.o
 obj-$(CONFIG_SECURITYFS)		+= inode.o
 obj-$(CONFIG_SECURITY_SELINUX)		+= selinux/
 obj-$(CONFIG_SECURITY_SMACK)		+= smack/
diff --git a/security/lsm_notifier.c b/security/lsm_notifier.c
new file mode 100644
index 000000000000..c92fad5d57d4
--- /dev/null
+++ b/security/lsm_notifier.c
@@ -0,0 +1,31 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * LSM notifier functions
+ *
+ */
+
+#include <linux/notifier.h>
+#include <linux/security.h>
+
+static BLOCKING_NOTIFIER_HEAD(blocking_lsm_notifier_chain);
+
+int call_blocking_lsm_notifier(enum lsm_event event, void *data)
+{
+	return blocking_notifier_call_chain(&blocking_lsm_notifier_chain,
+					    event, data);
+}
+EXPORT_SYMBOL(call_blocking_lsm_notifier);
+
+int register_blocking_lsm_notifier(struct notifier_block *nb)
+{
+	return blocking_notifier_chain_register(&blocking_lsm_notifier_chain,
+						nb);
+}
+EXPORT_SYMBOL(register_blocking_lsm_notifier);
+
+int unregister_blocking_lsm_notifier(struct notifier_block *nb)
+{
+	return blocking_notifier_chain_unregister(&blocking_lsm_notifier_chain,
+						  nb);
+}
+EXPORT_SYMBOL(unregister_blocking_lsm_notifier);
diff --git a/security/security.c b/security/security.c
index fb57e8fddd91..477be0a17e3f 100644
--- a/security/security.c
+++ b/security/security.c
@@ -90,8 +90,6 @@ const char *const lockdown_reasons[LOCKDOWN_CONFIDENTIALITY_MAX + 1] = {
 	[LOCKDOWN_CONFIDENTIALITY_MAX] = "confidentiality",
 };
 
-static BLOCKING_NOTIFIER_HEAD(blocking_lsm_notifier_chain);
-
 static struct kmem_cache *lsm_file_cache;
 static struct kmem_cache *lsm_inode_cache;
 
@@ -643,27 +641,6 @@ void __init security_add_hooks(struct security_hook_list *hooks, int count,
 	}
 }
 
-int call_blocking_lsm_notifier(enum lsm_event event, void *data)
-{
-	return blocking_notifier_call_chain(&blocking_lsm_notifier_chain,
-					    event, data);
-}
-EXPORT_SYMBOL(call_blocking_lsm_notifier);
-
-int register_blocking_lsm_notifier(struct notifier_block *nb)
-{
-	return blocking_notifier_chain_register(&blocking_lsm_notifier_chain,
-						nb);
-}
-EXPORT_SYMBOL(register_blocking_lsm_notifier);
-
-int unregister_blocking_lsm_notifier(struct notifier_block *nb)
-{
-	return blocking_notifier_chain_unregister(&blocking_lsm_notifier_chain,
-						  nb);
-}
-EXPORT_SYMBOL(unregister_blocking_lsm_notifier);
-
 /**
  * lsm_blob_alloc - allocate a composite blob
  * @dest: the destination for the blob
-- 
2.49.0


