Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3073A1BAF65
	for <lists+selinux@lfdr.de>; Mon, 27 Apr 2020 22:23:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726364AbgD0UXy (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Mon, 27 Apr 2020 16:23:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726743AbgD0UXy (ORCPT
        <rfc822;selinux@vger.kernel.org>); Mon, 27 Apr 2020 16:23:54 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB8F2C0610D5
        for <selinux@vger.kernel.org>; Mon, 27 Apr 2020 13:23:53 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id k18so7414525pll.6
        for <selinux@vger.kernel.org>; Mon, 27 Apr 2020 13:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=STKcgyAYLyPwimzGvxdtUzzEbb8zdagndp28hkuz3NM=;
        b=vbjvBGFkzAfpbaZ8Rs2pOAPMZDe4p4XIrLJa1ecV7JKIgH8EEIT4DUg1qOYtLY/WuA
         SLCHtmL/T2M1Ifir6UXymLIr98W7y4AEQP6dwBaryInbF1lRTH6GEgvswG2TVuR0Fxp9
         8gXJ7mQEAIAmb1VwmD16tEHjQXr0Iy4tKKWOFRgSLXla4hDeODwwwG/2d7z70HmQWC2n
         DsqnZH+o2tClI/AOBAQMNgzuYEa3nkCFy8Dk9ZjMpdnlnbSidqjU0LOpQlu3Z+5lnIxq
         oKx+eaCB1yZxn15XagD2+xBGpEp3UJSQwXMDOSf53u2Cp17fR9UiegJAUPpRM+inBm1j
         B9Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=STKcgyAYLyPwimzGvxdtUzzEbb8zdagndp28hkuz3NM=;
        b=nXBLcxevUZ9cOrb8knCoO/2J2oHGSx83EYa9hEfQfkihed+MUW4fvkJe4KKecJbhnO
         h167PwoWkMELA1Q8+jLMHuYcYVy7MI8CIujnOlLDJq6lofQiIDOUIbZCmGSAuobMSY4H
         552eIHiwRXJgedMN5Z0QXh6cPlYCSN4bkgTv7INTJcDuzQUeQvGfG7t6Efl1ty2LLViY
         vRggcp/FAm7Znzb5v2YjOXRZkw56B2bcXKZ6NFBr7Xj0jjIKFZ4mIvC6PMAEjmZMp1yD
         5UgMkmzkRXLFo8jGogyeMJa3GePX4hzTTfMSPt6zN11s5cj8cb+aSM3LPL7ZUTWatsT4
         hnug==
X-Gm-Message-State: AGi0PuaJ36bJ2UIUt2i9wDNGp8sMwNDINSkSy2cBNCSyCnD3G0jPbJYE
        3TxfttvIEbmEuwpoaRing1g=
X-Google-Smtp-Source: APiQypIsPnK6Ct9ozAGA4I4fXeA5gmire29Yf49N/XFyrhkd+XDi6WTgtW0oJbLO9SQqH8wBmf+Tbg==
X-Received: by 2002:a17:90a:2943:: with SMTP id x3mr494969pjf.63.1588019033419;
        Mon, 27 Apr 2020 13:23:53 -0700 (PDT)
Received: from localhost.localdomain ([134.134.139.76])
        by smtp.gmail.com with ESMTPSA id n30sm13329438pfq.88.2020.04.27.13.23.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2020 13:23:53 -0700 (PDT)
From:   bill.c.roberts@gmail.com
X-Google-Original-From: william.c.roberts@intel.com
To:     bill.c.roberts@gmail.com
Cc:     plautrba@redhat.com, sds@tycho.nsa.gov, selinux@vger.kernel.org,
        William Roberts <william.c.roberts@intel.com>
Subject: [PATCH v4 18/18] Makefile: swig build allow deprecated functions
Date:   Mon, 27 Apr 2020 15:23:15 -0500
Message-Id: <20200427202315.4943-19-william.c.roberts@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200427202315.4943-1-william.c.roberts@intel.com>
References: <20200225200219.6163-1-william.c.roberts@intel.com>
 <20200427202315.4943-1-william.c.roberts@intel.com>
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

From: William Roberts <william.c.roberts@intel.com>

The SWIG C build should allow deprecated functions and not warn on them
because it is exposing the full interface including deprecated routines.

Signed-off-by: William Roberts <william.c.roberts@intel.com>
---
 libselinux/src/Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/libselinux/src/Makefile b/libselinux/src/Makefile
index 9992221f5fc5..73303c3666c9 100644
--- a/libselinux/src/Makefile
+++ b/libselinux/src/Makefile
@@ -105,7 +105,8 @@ FTS_LDLIBS ?=
 override CFLAGS += -I../include -D_GNU_SOURCE $(DISABLE_FLAGS) $(PCRE_CFLAGS)
 
 SWIG_CFLAGS += -Wno-error -Wno-unused-variable -Wno-unused-but-set-variable -Wno-unused-parameter \
-		-Wno-shadow -Wno-uninitialized -Wno-missing-prototypes -Wno-missing-declarations
+		-Wno-shadow -Wno-uninitialized -Wno-missing-prototypes -Wno-missing-declarations \
+		-Wno-deprecated-declarations
 
 RANLIB ?= ranlib
 
-- 
2.17.1

