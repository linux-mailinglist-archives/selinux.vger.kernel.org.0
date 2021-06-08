Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D898D39FB88
	for <lists+selinux@lfdr.de>; Tue,  8 Jun 2021 18:00:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233574AbhFHQCe (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Tue, 8 Jun 2021 12:02:34 -0400
Received: from mail-ed1-f50.google.com ([209.85.208.50]:44916 "EHLO
        mail-ed1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232973AbhFHQCe (ORCPT
        <rfc822;selinux@vger.kernel.org>); Tue, 8 Jun 2021 12:02:34 -0400
Received: by mail-ed1-f50.google.com with SMTP id u24so25098300edy.11
        for <selinux@vger.kernel.org>; Tue, 08 Jun 2021 09:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=KzBiANLi9j4qRw+7ZE0bvUDI/R5Cy+21s3DcO2hhTog=;
        b=c9/nKfGD/g7bJcrs2n/FTksLofC1WsAzYWyns6HgzgUbaIaYEa4E1QJSOQijaXiqdK
         vydDwJefSR8COecJKyiUFAS7QValLY/ExW3zYEtACWFImnW4YUOfb+F0e8LOszDm7gIO
         duEJ592klP2P39oo83bXUo4QPmyrMaYJb1osJT5LcENXHT2TOYD/XjutVtlTVm9fw9KG
         v4gDSUGAym9GlHGbIGXZQQSy2P8wHw0Yw+ZnH6s8vw4nBsuB/d1XMsY/0S+ZLBU9UlwA
         boiz1T/BcM6clm3oeqhrq5wqrHdkRWQ0w7eHkMVkL+Giz/E0Ktav7D+bRevCrA5VQZSe
         bh3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KzBiANLi9j4qRw+7ZE0bvUDI/R5Cy+21s3DcO2hhTog=;
        b=qCVZnUBWMaGVDYRt4uHwT/mSXvsv36bq9myYkvfHXksberrZwY1pbJTIQXsKnXAJ3F
         vSxOOr3upIPbgTDH+VZGWjlrvDgjhhldtWDWqPirsVO0uLAK0krPEh6YSRlfBkw8Gojx
         1B1wpQbiQ8UTrZ5u5QGdp/pPsWMaFpsmt9rcm4puQThGYzULS7EOpAb2PYD+f93og5ou
         /x4FkrU4zSVmCJlC+uukv+JLRiwfkmA+oH1YxlkrKB69OPrl0YERIs/AsC6JgwO0JJny
         uwl6UIIiVeX4OhGQQQ6UECLEFdFGMnHXixdsOFpxQUgdR/nOQbaD7TPPCNHAdInEbwl7
         QDQA==
X-Gm-Message-State: AOAM531FKBN+ekAwq+L4YVoOXdXByYFFTJV87j+anll30S7D0tXLqksV
        jOSpig2mFU5Gz12rzWwCIBVxFvZLzNo=
X-Google-Smtp-Source: ABdhPJwM8qZ3jKQ11i1V03Ea1bc8V1atZOhXNVAdtWSiZP1bB4oypjP2a2G1AFoQP6Di0a1NgNuonA==
X-Received: by 2002:a05:6402:14d5:: with SMTP id f21mr27077879edx.307.1623167968276;
        Tue, 08 Jun 2021 08:59:28 -0700 (PDT)
Received: from debianHome.localdomain (dynamic-095-112-183-231.95.112.pool.telefonica.de. [95.112.183.231])
        by smtp.gmail.com with ESMTPSA id n13sm51134ejk.97.2021.06.08.08.59.27
        for <selinux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 08:59:28 -0700 (PDT)
From:   =?UTF-8?q?Christian=20G=C3=B6ttsche?= <cgzones@googlemail.com>
To:     selinux@vger.kernel.org
Subject: [PATCH 16/23] libsepol/cil: drop extra semicolon
Date:   Tue,  8 Jun 2021 17:59:05 +0200
Message-Id: <20210608155912.32047-17-cgzones@googlemail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210608155912.32047-1-cgzones@googlemail.com>
References: <20210608155912.32047-1-cgzones@googlemail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Signed-off-by: Christian Göttsche <cgzones@googlemail.com>
---
 libsepol/cil/src/cil_build_ast.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/libsepol/cil/src/cil_build_ast.c b/libsepol/cil/src/cil_build_ast.c
index 9a9bc598..da298311 100644
--- a/libsepol/cil/src/cil_build_ast.c
+++ b/libsepol/cil/src/cil_build_ast.c
@@ -4153,7 +4153,7 @@ void cil_destroy_context(struct cil_context *context)
 		return;
 	}
 
-	cil_symtab_datum_destroy(&context->datum);;
+	cil_symtab_datum_destroy(&context->datum);
 
 	if (context->range_str == NULL && context->range != NULL) {
 		cil_destroy_levelrange(context->range);
-- 
2.32.0

