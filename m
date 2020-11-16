Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B67A2B541C
	for <lists+selinux@lfdr.de>; Mon, 16 Nov 2020 23:07:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727267AbgKPWHQ (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Mon, 16 Nov 2020 17:07:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727044AbgKPWHQ (ORCPT
        <rfc822;selinux@vger.kernel.org>); Mon, 16 Nov 2020 17:07:16 -0500
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com [IPv6:2607:f8b0:4864:20::744])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 874DBC0613CF
        for <selinux@vger.kernel.org>; Mon, 16 Nov 2020 14:07:16 -0800 (PST)
Received: by mail-qk1-x744.google.com with SMTP id y197so18585383qkb.7
        for <selinux@vger.kernel.org>; Mon, 16 Nov 2020 14:07:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=w5pe9q6adHI2OT0fc7/40FKVmxW//jsuPI7tGzcF8Fw=;
        b=fH7ovnraYG4nIFf3IkBiuDqd68jDo2Guqkfxh2EWBUZfMgBkT/kQ5fw728TLjgxtf9
         o/rXDdUaR8xf0teMRdpyXQ47cy1ppl/8lAGoHqke43u0PC1nTn49gHvKCckk3Y55fFTo
         CbOf+Nzw4Kn09moaN2yBOGs+ejdqFh19cydMP0SpxlsQZuHHHal+KD8W3QGZBXFmtFtZ
         AnweNXv+5iR7taLBmnKBtYBJcwFZD/OJ8ZbXswZPirAtLVWSI7G0R5kdO93Bw9MfIiYp
         fpW5q4fjhHswdw+kHbVQmuC6SRZzJFDC+EFUpRGn99HEfYL1uqEw5e+yxwa829CAEh+3
         foQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=w5pe9q6adHI2OT0fc7/40FKVmxW//jsuPI7tGzcF8Fw=;
        b=VX0vz++6dfLvrNb8eNSgBdvGrX65fbfZGpIW/0LhjoOCJZNW6YAeDB9vR1ua8O4BiL
         BKhfPXR6It/i6jkdNhDlUQjj5fUVMiLK2EWIB7/acVp8Kk6NRxSnHRGiZPyKGt0jDD/o
         sWHk6uc0bSNEMnxkcLEvTSDzHv20RwwlR+7BkMjWyN1xoX5pDuDs7f1xPFTcyaK0WD4D
         EstkGeByOd+nHW1owsigIeZBYbrwesGWoBujkDavF5vYYaZt/xci/w3qkoNw0sAS/ds4
         mSPq8Zz5VsyGS5LYPwSm8YLX7TVoW4uB9m2OSNnJ729I8KXVwK/hOiWGTPUxEQk5MNY7
         6EFg==
X-Gm-Message-State: AOAM5336O8c/N10e12PRtmpXZ+XRXvkkF8SmeW3EVF3Znu+s9bQ16LQZ
        baYIPCGpSUDlRBkQoF07oA/vIUDEhws=
X-Google-Smtp-Source: ABdhPJzBaGj7Aj5C9hUzT5igcu3ketKSIkSyKDAugoElxWgbaFjfI4qeHpKOTJaPaKQEh6As5WRF3A==
X-Received: by 2002:a37:6c06:: with SMTP id h6mr16749917qkc.288.1605564435716;
        Mon, 16 Nov 2020 14:07:15 -0800 (PST)
Received: from localhost.localdomain (c-73-200-157-122.hsd1.md.comcast.net. [73.200.157.122])
        by smtp.gmail.com with ESMTPSA id q11sm12653330qtp.47.2020.11.16.14.07.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2020 14:07:15 -0800 (PST)
From:   James Carter <jwcart2@gmail.com>
To:     selinux@vger.kernel.org
Cc:     James Carter <jwcart2@gmail.com>
Subject: [PATCH 2/6] libsepol/cil: Git rid of unnecessary check in cil_gen_node()
Date:   Mon, 16 Nov 2020 17:06:58 -0500
Message-Id: <20201116220702.174765-3-jwcart2@gmail.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20201116220702.174765-1-jwcart2@gmail.com>
References: <20201116220702.174765-1-jwcart2@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Since cil_gen_node() is only called from declarations, the check to
determine if the node is a declaration is not needed, so remove it.

Signed-off-by: James Carter <jwcart2@gmail.com>
---
 libsepol/cil/src/cil_build_ast.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/libsepol/cil/src/cil_build_ast.c b/libsepol/cil/src/cil_build_ast.c
index bb5bbc84..67801def 100644
--- a/libsepol/cil/src/cil_build_ast.c
+++ b/libsepol/cil/src/cil_build_ast.c
@@ -154,7 +154,7 @@ int cil_gen_node(struct cil_db *db, struct cil_tree_node *ast_node, struct cil_s
 		}
 	}
 
-	if (ast_node->flavor >= CIL_MIN_DECLARATIVE && ast_node->parent->flavor == CIL_MACRO) {
+	if (ast_node->parent->flavor == CIL_MACRO) {
 		struct cil_list_item *item;
 		struct cil_list *param_list = ((struct cil_macro*)ast_node->parent->data)->params;
 		if (param_list != NULL) {
-- 
2.25.4

