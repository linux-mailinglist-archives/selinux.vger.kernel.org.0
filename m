Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 226CB40AEA5
	for <lists+selinux@lfdr.de>; Tue, 14 Sep 2021 15:10:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232983AbhINNLe (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Tue, 14 Sep 2021 09:11:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233025AbhINNLd (ORCPT
        <rfc822;selinux@vger.kernel.org>); Tue, 14 Sep 2021 09:11:33 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6205CC061574
        for <selinux@vger.kernel.org>; Tue, 14 Sep 2021 06:10:16 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id x22so249020ejj.8
        for <selinux@vger.kernel.org>; Tue, 14 Sep 2021 06:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=VAGDgfMng1Ryo4u47arIfIo58hsAUJBZ/rj0LpEDnKw=;
        b=i03CpiY8MH1sfIQ9hfNyzPasmHgEFZUSchb8df8FowBJI9B5lH1D7QdN1NQ4m1jWk/
         clFdEi6AhjmYbk5hqeInRPUuCU921M15Cxldav5PXwjyAZmRc9T4vYi+WzRG533KZkP3
         k2g4zbm5VNLgUjxj3vz3BXuBaTwD/WpZf2rBSGEk8TBslEz0JxXFFoiEdGwRHFMpk4Ye
         idjqkSspf44bRzCYVYSvPRrDd9sx1NyR6WzsDMPXVU1s07X2GOxAwAcrGmqm6CoUKDvl
         cChjsKBAml4iAPUzr6BAwQfA7tJaLxvnEMQPz77AfS6lwx6fcOwUzUu5UHvPWAb6xzG7
         W26A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VAGDgfMng1Ryo4u47arIfIo58hsAUJBZ/rj0LpEDnKw=;
        b=Jav4/NvSZaWkRVOYBcGHGPPYKAt80TOQwLnmAbfYHv3FXi/ONtx8VwpveE0chTkHxn
         zLDGQUW9nKtlzWsnf2fQx0BCIBqLxEshyYWH5jRiYOZ7UypkdvzxlLsb9zviisvmHhBm
         6XloeEkRgmmAewj2g8ZTXzbzaxlSgQjvo0HaVugUT7npgAKXA3uiZ0rMVFZEIDgajFdl
         vGRiRqABwADtzlYj/73hPvQNtjNjofsU6ChQCV2rVfmkeZvMJxUDltW5WJVumJdEdUFB
         3TxqccDCO0I4Mq2KTR8BKh5PAKq6mlnbY8L1sgmWMHtOc+JwVspII9WWYMbYwbF44hkZ
         cwJg==
X-Gm-Message-State: AOAM532uba2BrCpFJXX94nSSOmUlxgwaeKAhmEuCYq2OlgfhTezo+4I0
        cIFNkwoAFpZxsOBNzK6ZUXdjf+x6UW8=
X-Google-Smtp-Source: ABdhPJwp0HmBEJq/aVUIcmg8+n1MFwM/PP8mHaLjvNw8Lz7didDcY6525uSSDayfqqVnG5Y1De5Asw==
X-Received: by 2002:a17:906:9742:: with SMTP id o2mr19103892ejy.532.1631625014303;
        Tue, 14 Sep 2021 06:10:14 -0700 (PDT)
Received: from debianHome.localdomain (dynamic-077-003-237-250.77.3.pool.telefonica.de. [77.3.237.250])
        by smtp.gmail.com with ESMTPSA id b3sm4837623ejb.7.2021.09.14.06.10.13
        for <selinux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Sep 2021 06:10:13 -0700 (PDT)
From:   =?UTF-8?q?Christian=20G=C3=B6ttsche?= <cgzones@googlemail.com>
To:     selinux@vger.kernel.org
Subject: [PATCH v2] libselinux/utils: drop requirement to combine compiling and linking
Date:   Tue, 14 Sep 2021 15:10:07 +0200
Message-Id: <20210914131007.24150-1-cgzones@googlemail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210714181325.58688-1-cgzones@googlemail.com>
References: <20210714181325.58688-1-cgzones@googlemail.com>
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

Reorder the LDLIBS requirements to avoid the symbol 'pcre_fullinfo'
being unresolvable at link time.

Current behavior:

    gcc-11 **custom CFLAGS** -I../include -D_GNU_SOURCE     -c -o sefcontext_compile.o sefcontext_compile.c
    gcc-11 -L../src  sefcontext_compile.o ../src/regex.o  -lselinux  -lpcre ../src/libselinux.a -lsepol -o sefcontext_compile

Changed:

    gcc-11 **custom CFLAGS** -I../include -D_GNU_SOURCE    -L../src  sefcontext_compile.c  -lselinux  ../src/libselinux.a -lpcre -lsepol -o sefcontext_compile

Signed-off-by: Christian Göttsche <cgzones@googlemail.com>
---
v2:
  - drop line regarding regex.o, as suggested by Nicolas Iooss.
  - order -lpcre after libselinux.a


 libselinux/utils/Makefile | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/libselinux/utils/Makefile b/libselinux/utils/Makefile
index b018a08a..36816155 100644
--- a/libselinux/utils/Makefile
+++ b/libselinux/utils/Makefile
@@ -52,9 +52,7 @@ else
 TARGETS=$(patsubst %.c,%,$(sort $(wildcard *.c)))
 endif
 
-sefcontext_compile: LDLIBS += $(PCRE_LDLIBS) ../src/libselinux.a -lsepol
-
-sefcontext_compile: sefcontext_compile.o ../src/regex.o
+sefcontext_compile: LDLIBS += ../src/libselinux.a $(PCRE_LDLIBS) -lsepol
 
 all: $(TARGETS)
 
-- 
2.33.0

