Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01F82371EF8
	for <lists+selinux@lfdr.de>; Mon,  3 May 2021 19:54:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231664AbhECRzC (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Mon, 3 May 2021 13:55:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231685AbhECRy5 (ORCPT
        <rfc822;selinux@vger.kernel.org>); Mon, 3 May 2021 13:54:57 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3ABF9C06138F
        for <selinux@vger.kernel.org>; Mon,  3 May 2021 10:54:00 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id y26so7323616eds.4
        for <selinux@vger.kernel.org>; Mon, 03 May 2021 10:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=fIogwTVFYjCmaSZ6TY103+kSKHXedn5m6sgVOECNPfM=;
        b=WIOuTKcj8TkHBKROSItE+/S+4JEjS08kwLmXz9ftEbOPUMhMgTnP3+NzFNmI9bOemk
         u7XNgBxLiUa4xxL2GhrXtfqxuHTWYtwOKQchB532qcpThJ1rIqF6h2AhjcfpyKx4WfCq
         Z8LCPQIpQ1IJQL/LLfPjGEou0pdacjlTDgi54Vc+CSq63pwvtADpWFxJbKdkZ3OnXVHf
         roWV30JYtZWgQoKkvUTqsE3/0N96FIbE5gnwhmlSk8Eg4Z2cvR04uwL2I8zSRQQtDJDl
         ioup3t2skPKWvY4lAksKTmdljRJ2RsKxRcHnycp2HkU5Kp8Ef6NJJIe+67i2okCuvSG8
         nsQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fIogwTVFYjCmaSZ6TY103+kSKHXedn5m6sgVOECNPfM=;
        b=JHP7n6WZaAJABAA1hF1k9F335soIc9Y58j1212+65VtPMiB76q6u1K5XNhCR8MN54w
         +sjCpm/JMQl5RL9Ef4FMqqJbOr7OH9Z5ZWUtDDJP4mQ+R7pBDq5sycInSZd+Cb9TfR62
         679nMBZ/UHA1mvPq/RFLbiyTkjFV1q6OiW9F800cMERvb3lh35Xu4CAs54UJ5X7ZDGLe
         cukZwTRSHxRBsUIH/HrDrDpfU2sPum45VTqXlY/u2RphzZvo2kgqmHRTmgFQ8DJBKthr
         pXuZkfS8AieEEVmiGoQ7tmhre8izRdA/AkxK6Pi29gahz5QW52DrIOekIhIRw8ak77f1
         bMBA==
X-Gm-Message-State: AOAM533lyW8XiyTPZdbp9U0CifseEUxmMY2TH8xnFugdRVGzml1SGELE
        TSzNgEWMYxr34fgnAKaZgkmEtE+XZFeG6A==
X-Google-Smtp-Source: ABdhPJzze1Rb7E2qmssIn5ibT922W0tkuXkUxN51dH5msy+CmJsJxfw7dElPstwykto6Uma0WHbKGw==
X-Received: by 2002:aa7:c413:: with SMTP id j19mr21358945edq.206.1620064439020;
        Mon, 03 May 2021 10:53:59 -0700 (PDT)
Received: from debianHome.localdomain (dynamic-077-000-172-037.77.0.pool.telefonica.de. [77.0.172.37])
        by smtp.gmail.com with ESMTPSA id b17sm1830165edr.80.2021.05.03.10.53.58
        for <selinux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 May 2021 10:53:58 -0700 (PDT)
From:   =?UTF-8?q?Christian=20G=C3=B6ttsche?= <cgzones@googlemail.com>
To:     selinux@vger.kernel.org
Subject: [PATCH 11/25] libselinux: context_new(): drop dead assignment
Date:   Mon,  3 May 2021 19:53:36 +0200
Message-Id: <20210503175350.55954-12-cgzones@googlemail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210503175350.55954-1-cgzones@googlemail.com>
References: <20210503175350.55954-1-cgzones@googlemail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

The variable `i` is not used inside this loop, and it later
unconditionally set to 0.

Found by clang-analyzer.

Signed-off-by: Christian Göttsche <cgzones@googlemail.com>
---
 libselinux/src/context.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/libselinux/src/context.c b/libselinux/src/context.c
index ce425880..b2144c7c 100644
--- a/libselinux/src/context.c
+++ b/libselinux/src/context.c
@@ -37,7 +37,7 @@ context_t context_new(const char *str)
 	}
 	n->current_str = n->component[0] = n->component[1] = n->component[2] =
 	    n->component[3] = 0;
-	for (i = count = 0, p = str; *p; p++) {
+	for (count = 0, p = str; *p; p++) {
 		switch (*p) {
 		case ':':
 			count++;
-- 
2.31.1

