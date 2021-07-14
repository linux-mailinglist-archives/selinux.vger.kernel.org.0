Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 540DE3C8A82
	for <lists+selinux@lfdr.de>; Wed, 14 Jul 2021 20:13:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229742AbhGNSQ2 (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Wed, 14 Jul 2021 14:16:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229651AbhGNSQ0 (ORCPT
        <rfc822;selinux@vger.kernel.org>); Wed, 14 Jul 2021 14:16:26 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B72E6C06175F
        for <selinux@vger.kernel.org>; Wed, 14 Jul 2021 11:13:33 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id oz7so986627ejc.2
        for <selinux@vger.kernel.org>; Wed, 14 Jul 2021 11:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Vwe3flzPdkoq+qQPERHJ6lnv+encH4boTRgeJ+9LCAU=;
        b=WmR5USM424bl/NuCE7EulEXcZhM1H2UN4RpjuSHL4zMZhqhqTYDvTofhjVrTRjmXA4
         M8KomDh6Z6/cXd28bru4wSPjwth2bW2tb1WQufi6CzxP1ZcF/+2Vbe/BskkwSVPIh9rw
         UD9/n354UzEiiy1GLMMztK4WtgPhd/adWjTzCPK+n5sxQXlwuV021juW6V4jiwuJJuPC
         VC11IMyACmYlIwGllP9C8UCcbzHtpZu7zKFdGOPWW1rq/CHYu9p51Kd5dK+F6Vas6066
         vWTOZ9OWwcsBie0bEfiX5ILWVBEowQOq8qHOrUq9qQJcrjg9Q+jGuzLJflAGIO7fyqot
         6rtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Vwe3flzPdkoq+qQPERHJ6lnv+encH4boTRgeJ+9LCAU=;
        b=KrCORNCI14R10hJoohBpvKfjbmzqATy2LxKml73+n+P7FdJRrHqTeleU7oqoJe9IuI
         ESCa4sLcajbOOc0YtnFkt5rVOuA4Y0G/66EXDz09tGmRw42Harwi8SkTSrGt+VRJNa+I
         DIemoDw/JwGiGjooy6FQ+vvFOsA8MvfNvUYNv8NLJmOI71zQSsZIcgyHIO7sMV3n+NaG
         0GjuQ4TTG7Z3tJG4zLkIQkT+iy8JJWp54JbJenL0Gqu+r5rOioslFrc7O8IDpxUXNQUe
         gWMCMX8hqT+pPESsYjr2RQM7eTLKcRl6XRr0SBKdKvgGI5b5uLptWmm8UvJzL8A0yZuX
         X/Zw==
X-Gm-Message-State: AOAM533cAX4TsTgF7INflj02OiRYjTz2sJlX6Gb24Ze8lWYTQGvsNwln
        XY4YsJEa5D1WUBQOPNA5OIWKQ0HSALA=
X-Google-Smtp-Source: ABdhPJwR4e70lNj/x65a1XKshDnenYZNFNe06kgN18Voumh4OL0I4kPUQWNmkPJVKzffPCzvrstEaA==
X-Received: by 2002:a17:906:39d7:: with SMTP id i23mr13558038eje.121.1626286411332;
        Wed, 14 Jul 2021 11:13:31 -0700 (PDT)
Received: from debianHome.localdomain (dynamic-095-116-198-161.95.116.pool.telefonica.de. [95.116.198.161])
        by smtp.gmail.com with ESMTPSA id e24sm1030021ejx.100.2021.07.14.11.13.30
        for <selinux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jul 2021 11:13:30 -0700 (PDT)
From:   =?UTF-8?q?Christian=20G=C3=B6ttsche?= <cgzones@googlemail.com>
To:     selinux@vger.kernel.org
Subject: [PATCH] libselinux/utils: drop requirement to combine compiling and linking
Date:   Wed, 14 Jul 2021 20:13:25 +0200
Message-Id: <20210714181325.58688-1-cgzones@googlemail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

The extra dependency of sefcontext_compile on its object file causes the
compile and link step to be separated.
During the link step the CFLAGS are not passed, which might contain
optimization or sanitizer flags.

Current behavior:

    gcc-11 **custom CFLAGS** -I../include -D_GNU_SOURCE     -c -o sefcontext_compile.o sefcontext_compile.c
    gcc-11 -L../src  sefcontext_compile.o ../src/regex.o  -lselinux  -lpcre ../src/libselinux.a -lsepol -o sefcontext_compile

Changed:

    gcc-11 **custom CFLAGS** -I../include -D_GNU_SOURCE    -L../src  sefcontext_compile.c ../src/regex.o  -lselinux  -lpcre ../src/libselinux.a -lsepol -o sefcontext_compile

Signed-off-by: Christian Göttsche <cgzones@googlemail.com>
---
 libselinux/utils/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/libselinux/utils/Makefile b/libselinux/utils/Makefile
index b018a08a..f01295fd 100644
--- a/libselinux/utils/Makefile
+++ b/libselinux/utils/Makefile
@@ -54,7 +54,7 @@ endif
 
 sefcontext_compile: LDLIBS += $(PCRE_LDLIBS) ../src/libselinux.a -lsepol
 
-sefcontext_compile: sefcontext_compile.o ../src/regex.o
+sefcontext_compile: ../src/regex.o
 
 all: $(TARGETS)
 
-- 
2.32.0

