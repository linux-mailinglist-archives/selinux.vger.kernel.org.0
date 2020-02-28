Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9E444173C21
	for <lists+selinux@lfdr.de>; Fri, 28 Feb 2020 16:49:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727060AbgB1PtM (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Fri, 28 Feb 2020 10:49:12 -0500
Received: from mail-pl1-f196.google.com ([209.85.214.196]:33043 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727053AbgB1PtM (ORCPT
        <rfc822;selinux@vger.kernel.org>); Fri, 28 Feb 2020 10:49:12 -0500
Received: by mail-pl1-f196.google.com with SMTP id ay11so1406417plb.0
        for <selinux@vger.kernel.org>; Fri, 28 Feb 2020 07:49:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=NLCy5wAvWVD2u0F8d+QCHPjwvw2Q4FFL8KdhB7Bv9MM=;
        b=lKo8rUZJvvBH4BK/jm/zq90coMXUHoN8I5EC3Pr7l29ybf8AJ0u8lVQ878q5nfI4og
         asYyYirSOVGCAq0fKSJDlrFNIGE9vDslAAaR+d6d3OkcXilkPJeonSNYFF7R00OWJh37
         HuoNA9rYBRDfsOXupEFKCoMhb1xuHOqysDQtUf5MHBum7t5ztDks+4JIBmGaIGrelQdz
         tu/BK3JTPU9m+YMVJgRjlHE7dRhoy1ca2rp0wqpBrH6aatLYwyvydTFCsMjaSBcYIvAb
         ZEtMbRTu+lfeqle7+vz6yo/R/PGRxYk9Yur5C3/ksEVwAD34OhTB3COH9PFw8Rk/tdP+
         /mQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=NLCy5wAvWVD2u0F8d+QCHPjwvw2Q4FFL8KdhB7Bv9MM=;
        b=FXZTtN9k6U4sIqkjAGDc5saeW41gIstKx7nSo1rK1hNvnmFWaCYbjKsrhhHr9JxyV0
         Q7oFzmV9Tyg++0uP1yDz/w1H/RXZn8PfwF6tIHxDiQ7k5YXTDGLXjLaxEtu4SWNU6pot
         JUtv9jR6W2PPJC7Cq9h7DSYndkykWY+M5njj9LxrROV518AJG2lsJlIuWF49fAnx2U07
         RnCKTO7d7+10WX+lMLnMO0dcfLbLIQ8R3JAVA86Kl4KUBTIoazr9APXaEgb2sUO17iYE
         033uuvWBzaTAehYA1rKZVhJHWDoIaGFY5BBLOfIVNDREA9EIzy+5vslXv8d7DhMW7s/5
         KVbw==
X-Gm-Message-State: APjAAAVIAtJ51TxsDSQawXLh3RRJmin9nrTuM2q6nomCsX9GRTT4UNC4
        c4ESiGSxUDJNijAxLzYzC7HSzyE+
X-Google-Smtp-Source: APXvYqw44DiSLBRQWlRENgEqlV9R+HSRJeIgmsWVBWJYhxQqPR98aiLWRi4k7naoU6gd7EjG32LB6A==
X-Received: by 2002:a17:902:9889:: with SMTP id s9mr4280453plp.252.1582904950604;
        Fri, 28 Feb 2020 07:49:10 -0800 (PST)
Received: from localhost.localdomain ([134.134.137.79])
        by smtp.gmail.com with ESMTPSA id w18sm12091796pfq.167.2020.02.28.07.49.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2020 07:49:10 -0800 (PST)
From:   bill.c.roberts@gmail.com
X-Google-Original-From: william.c.roberts@intel.com
To:     selinux@vger.kernel.org, drepper@redhat.com, omosnace@redhat.com,
        stephen.smalley.work@gmail.com, plautrba@redhat.com
Cc:     William Roberts <william.c.roberts@intel.com>
Subject: [PATCH v3 2/4] Makefile: add -fno-semantic-interposition
Date:   Fri, 28 Feb 2020 09:48:55 -0600
Message-Id: <20200228154857.587-3-william.c.roberts@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200228154857.587-1-william.c.roberts@intel.com>
References: <20200227230129.31166-1-william.c.roberts@intel.com>
 <20200228154857.587-1-william.c.roberts@intel.com>
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

From: William Roberts <william.c.roberts@intel.com>

Add -fno-semantic-interposition to CFLAGS. This will restore
the DSO infrastructures protections to insure internal callers
of exported symbols call into libselinux and not something laoding first
in the library list.

Clang has this enabled by default.

Signed-off-by: William Roberts <william.c.roberts@intel.com>
---
 libselinux/src/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/libselinux/src/Makefile b/libselinux/src/Makefile
index 7f5a5d7418e9..c76110fbc650 100644
--- a/libselinux/src/Makefile
+++ b/libselinux/src/Makefile
@@ -65,7 +65,7 @@ EXTRA_CFLAGS = -fipa-pure-const -Wlogical-op -Wpacked-bitfield-compat -Wsync-nan
 	-Wcoverage-mismatch -Wcpp -Wformat-contains-nul -Wnormalized=nfc -Wsuggest-attribute=const \
 	-Wsuggest-attribute=noreturn -Wsuggest-attribute=pure -Wtrampolines -Wjump-misses-init \
 	-Wno-suggest-attribute=pure -Wno-suggest-attribute=const -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=2 \
-	-Wstrict-overflow=5
+	-Wstrict-overflow=5 -fno-semantic-interposition
 else
 EXTRA_CFLAGS = -Wunused-command-line-argument
 endif
-- 
2.17.1

