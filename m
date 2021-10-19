Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3A2643398D
	for <lists+selinux@lfdr.de>; Tue, 19 Oct 2021 17:01:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232827AbhJSPDs (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Tue, 19 Oct 2021 11:03:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59539 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232972AbhJSPDo (ORCPT
        <rfc822;selinux@vger.kernel.org>); Tue, 19 Oct 2021 11:03:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1634655691;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=5Z8pxsvvOFRcT+HyiQJ39ItHbml7GQ6KvffUlxLrbMo=;
        b=D7jD5Sgw5JfWN9eANZgwkxg51N6ibdIO7DVXaOuEVViFvWXi7Asowu2wJwFgWixSAImoaZ
        DnuA9mL/GZbPIhi3BKk0ufubH8PofV6Skc/FTxRjDeDkxEgdIRkMiQyR0mpHOm3X0uNNtX
        M4dwuKqnF02b8bK7tnSTS0cJ/cA9zHs=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-574-BNq9KE51NVW6kr5oXWdH4w-1; Tue, 19 Oct 2021 11:01:28 -0400
X-MC-Unique: BNq9KE51NVW6kr5oXWdH4w-1
Received: by mail-wm1-f69.google.com with SMTP id c5-20020a05600c0ac500b0030dba7cafc9so2610621wmr.5
        for <selinux@vger.kernel.org>; Tue, 19 Oct 2021 08:01:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5Z8pxsvvOFRcT+HyiQJ39ItHbml7GQ6KvffUlxLrbMo=;
        b=wcJ0e2oBmh9RjwVkGhlkEqtHXgEHiu85jUb5S+XPfReTRK791BEwt1Jt58ZjkSxrXJ
         X75uwaWi8MPA80HYPOZVa4MjKt9/2G7PkhTQT8100QNBNw99g8g2YolLTaLtopdAy+J5
         Ui2gxQCmowCTansZ2DpJEi9h9ChdF09DgiYHIgCFljw2dAE1HZ0a+5yDWXuOL2azlIw+
         3mGO2/NLH7g4dkPo6/qFIbvpsiGIz20YaDuTNzhyQoIwu2Ja3ZZMFHxCzSxyVeTeEXaO
         M+b71d+vPNL6/IpqpRQvZO6tY/dtH4dA5h7MgZlZV8hNDcXSfEmlAHGTrCr38DhANKzB
         QXeQ==
X-Gm-Message-State: AOAM5317fp9f2eweY6wUSuj3AGkaBwJdQkZ9Brc+sg3z+klfcGCqB0Fi
        Y6ch7EVSWJF9nzgosAdC/0U/HZLU0cHVtTCwDsUnxXmt+9GfYeMQjuk1euhQe1H/DcwtPpZf422
        ZgXjgFMgPZ3TBoWxic8hKdWeA727MQkwdEGDPfFjiXl5eydZsmUxKkw91lCwjZfzK7bIwDg==
X-Received: by 2002:adf:d84d:: with SMTP id k13mr45294530wrl.276.1634655686886;
        Tue, 19 Oct 2021 08:01:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw6AOX1LSpTj11n40UpL5YZyK7rBeUOnwtgPg7GFpZeWpJbtxhpFjyXryJPiwYVt/NPbwl/Hg==
X-Received: by 2002:adf:d84d:: with SMTP id k13mr45294476wrl.276.1634655686544;
        Tue, 19 Oct 2021 08:01:26 -0700 (PDT)
Received: from localhost.localdomain (nat-pool-brq-t.redhat.com. [213.175.37.10])
        by smtp.gmail.com with ESMTPSA id r4sm19271630wrz.58.2021.10.19.08.01.25
        for <selinux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 08:01:25 -0700 (PDT)
From:   Ondrej Mosnacek <omosnace@redhat.com>
To:     selinux@vger.kernel.org
Subject: [PATCH userspace v3 3/7] selinux_restorecon: protect file_spec list with a mutex
Date:   Tue, 19 Oct 2021 17:01:18 +0200
Message-Id: <20211019150122.459722-4-omosnace@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211019150122.459722-1-omosnace@redhat.com>
References: <20211019150122.459722-1-omosnace@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Not very useful on its own, but will allow to implement a parallel
version of selinux_restorecon() in subsequent patches.

Signed-off-by: Ondrej Mosnacek <omosnace@redhat.com>
---
 libselinux/src/selinux_restorecon.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/libselinux/src/selinux_restorecon.c b/libselinux/src/selinux_restorecon.c
index 15129336..732f0ccc 100644
--- a/libselinux/src/selinux_restorecon.c
+++ b/libselinux/src/selinux_restorecon.c
@@ -411,6 +411,7 @@ typedef struct file_spec {
 } file_spec_t;
 
 static file_spec_t *fl_head;
+static pthread_mutex_t fl_mutex = PTHREAD_MUTEX_INITIALIZER;
 
 /*
  * Try to add an association between an inode and a context. If there is a
@@ -424,6 +425,8 @@ static int filespec_add(ino_t ino, const char *con, const char *file,
 	int h, ret;
 	struct stat64 sb;
 
+	__pthread_mutex_lock(&fl_mutex);
+
 	if (!fl_head) {
 		fl_head = calloc(HASH_BUCKETS, sizeof(file_spec_t));
 		if (!fl_head)
@@ -444,11 +447,11 @@ static int filespec_add(ino_t ino, const char *con, const char *file,
 				fl->con = strdup(con);
 				if (!fl->con)
 					goto oom;
-				return 1;
+				goto unlock_1;
 			}
 
 			if (strcmp(fl->con, con) == 0)
-				return 1;
+				goto unlock_1;
 
 			selinux_log(SELINUX_ERROR,
 				"conflicting specifications for %s and %s, using %s.\n",
@@ -457,6 +460,9 @@ static int filespec_add(ino_t ino, const char *con, const char *file,
 			fl->file = strdup(file);
 			if (!fl->file)
 				goto oom;
+
+			__pthread_mutex_unlock(&fl_mutex);
+
 			if (flags->conflicterror) {
 				selinux_log(SELINUX_ERROR,
 				"treating conflicting specifications as an error.\n");
@@ -481,13 +487,19 @@ static int filespec_add(ino_t ino, const char *con, const char *file,
 		goto oom_freefl;
 	fl->next = prevfl->next;
 	prevfl->next = fl;
+
+	__pthread_mutex_unlock(&fl_mutex);
 	return 0;
 
 oom_freefl:
 	free(fl);
 oom:
+	__pthread_mutex_unlock(&fl_mutex);
 	selinux_log(SELINUX_ERROR, "%s:  Out of memory\n", __func__);
 	return -1;
+unlock_1:
+	__pthread_mutex_unlock(&fl_mutex);
+	return 1;
 }
 
 /*
-- 
2.31.1

