Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D8B81BAF55
	for <lists+selinux@lfdr.de>; Mon, 27 Apr 2020 22:23:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726775AbgD0UXh (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Mon, 27 Apr 2020 16:23:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726501AbgD0UXg (ORCPT
        <rfc822;selinux@vger.kernel.org>); Mon, 27 Apr 2020 16:23:36 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEE12C0610D5
        for <selinux@vger.kernel.org>; Mon, 27 Apr 2020 13:23:36 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id l20so1261081pgb.11
        for <selinux@vger.kernel.org>; Mon, 27 Apr 2020 13:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=LiSqBGVfe5hAcik2WCFSuq49veVlaqUwalAvJGlQXvg=;
        b=jeoBRwfJn7YyYeTMOA5SJ3Axt6rQnS+h3YUIK23QXz5A3zTDE1wRYi19Qhzn5wNld5
         UKIyQxbojC+lxxlfXtrW277fMNcremNwWJ5g5wo82aPd7hBwHE8k6JBVjzlkjH7s3u9L
         WgYYdy4PnlFzPAxtI5iJF0H4zbRW+gV6tJUoZTkUSDtWUeu7G+0AzMw9hSDRunLhlevi
         CXvwHWBc/cA6vgYpyG20pw//Yqc2x7rDcVJ5p/qKPboN8ABdkBPiyKK4BD2VaKqyvcGm
         8JjaH8bKzYbNy3mQzeaehQhpLXwQkKFX6SM3VhK5qsy5YQX/wO9pksf54ggu8pp+0Jwf
         T8rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=LiSqBGVfe5hAcik2WCFSuq49veVlaqUwalAvJGlQXvg=;
        b=R2GqIlAxUSA6D7NLK0NCfOl6y00LPj4qszobJMHMg2KmKjh9O9emVUSCplD++EVocI
         KF4iss8X21oJxoqAr/LqgBuR2Uh5HCH6GhAu/CkW0r3glQz4tdW2b8Z1w8sBBKoPOxmH
         2v+zZo1CbUCN2OX3Eswo6mPNmMTwck3os47b8qiUbdr2b2EJkg8ty4ZOO+nibQsu7OjK
         odr55cIFAgoyesvuh/kXNnxIT1BRPEKBL05pSw/3PmzgGE3dXwKSYl/kP+xotdOjjfVE
         X9iu4GaK6tHgVv36vIqNv0EIM0G4kpBZvQtVLqGAjGprCVs0P0VPjblzrLN3x9cUJXpg
         IppQ==
X-Gm-Message-State: AGi0PuZGYuhiHP46ngoxaaLgF4Sy4k5m+9Ikv5NbSQbEjh+Mg+zCUouJ
        JTJFviqik2zOFCUhyyIyy6w=
X-Google-Smtp-Source: APiQypJadLmeOOiXe9Pbkp+2SCVtRFpCyyfpjmDyVlTLj5DbfnqvLsxLK6pqTqXMtzdNWSVixgvMvw==
X-Received: by 2002:a62:1d1:: with SMTP id 200mr27071354pfb.286.1588019015347;
        Mon, 27 Apr 2020 13:23:35 -0700 (PDT)
Received: from localhost.localdomain ([134.134.139.76])
        by smtp.gmail.com with ESMTPSA id n30sm13329438pfq.88.2020.04.27.13.23.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2020 13:23:34 -0700 (PDT)
From:   bill.c.roberts@gmail.com
X-Google-Original-From: william.c.roberts@intel.com
To:     bill.c.roberts@gmail.com
Cc:     plautrba@redhat.com, sds@tycho.nsa.gov, selinux@vger.kernel.org,
        William Roberts <william.c.roberts@intel.com>
Subject: [PATCH v4 08/18] checkPasswdAccess: annotate deprecated
Date:   Mon, 27 Apr 2020 15:23:05 -0500
Message-Id: <20200427202315.4943-9-william.c.roberts@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200427202315.4943-1-william.c.roberts@intel.com>
References: <20200225200219.6163-1-william.c.roberts@intel.com>
 <20200427202315.4943-1-william.c.roberts@intel.com>
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

From: William Roberts <william.c.roberts@intel.com>

Signed-off-by: William Roberts <william.c.roberts@intel.com>
---
 libselinux/include/selinux/selinux.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/libselinux/include/selinux/selinux.h b/libselinux/include/selinux/selinux.h
index deaa3f172586..9dcb3220264a 100644
--- a/libselinux/include/selinux/selinux.h
+++ b/libselinux/include/selinux/selinux.h
@@ -619,7 +619,11 @@ extern int selinux_check_access(const char * scon, const char * tcon, const char
 /* Check a permission in the passwd class.
    Return 0 if granted or -1 otherwise. */
 extern int selinux_check_passwd_access(access_vector_t requested);
-extern int checkPasswdAccess(access_vector_t requested);
+extern int checkPasswdAccess(access_vector_t requested)
+#ifdef __GNUC__
+   __attribute__ ((deprecated("Use selinux_check_access")))
+#endif
+;
 
 /* Check if the tty_context is defined as a securetty
    Return 0 if secure, < 0 otherwise. */
-- 
2.17.1

