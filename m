Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC4C67EA87F
	for <lists+selinux@lfdr.de>; Tue, 14 Nov 2023 02:59:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229659AbjKNB7s (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Mon, 13 Nov 2023 20:59:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229580AbjKNB7r (ORCPT
        <rfc822;selinux@vger.kernel.org>); Mon, 13 Nov 2023 20:59:47 -0500
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45BFCD46
        for <selinux@vger.kernel.org>; Mon, 13 Nov 2023 17:59:44 -0800 (PST)
Received: from kwepemm000010.china.huawei.com (unknown [172.30.72.56])
        by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4STqCX4GlHz1P88y
        for <selinux@vger.kernel.org>; Tue, 14 Nov 2023 09:56:24 +0800 (CST)
Received: from localhost.localdomain (10.175.104.170) by
 kwepemm000010.china.huawei.com (7.193.23.169) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Tue, 14 Nov 2023 09:59:41 +0800
From:   <luhuaxin1@huawei.com>
To:     <selinux@vger.kernel.org>
CC:     <fangxiuning@huawei.com>, <zhujianwei7@huawei.com>,
        <shenyining@huawei.com>, Huaxin Lu <luhuaxin1@huawei.com>
Subject: [PATCH v1] libsepol: add check for category value before printing
Date:   Tue, 14 Nov 2023 07:27:50 +0800
Message-ID: <20231113232750.48706-1-luhuaxin1@huawei.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.104.170]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemm000010.china.huawei.com (7.193.23.169)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

From: Huaxin Lu <luhuaxin1@huawei.com>

In mls_semantic_level_expand(), there is a explicitly determine
whether category is 0, which may cause an potential integer
overflow in error branch.

Signed-off-by: Huaxin Lu <luhuaxin1@huawei.com>
---
 libsepol/src/expand.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/libsepol/src/expand.c b/libsepol/src/expand.c
index ee5f9185..9ed22bfd 100644
--- a/libsepol/src/expand.c
+++ b/libsepol/src/expand.c
@@ -945,8 +945,8 @@ int mls_semantic_level_expand(mls_semantic_level_t * sl, mls_level_t * l,
 	for (cat = sl->cat; cat; cat = cat->next) {
 		if (!cat->low || cat->low > cat->high) {
 			ERR(h, "Category range is not valid %s.%s",
-			    p->p_cat_val_to_name[cat->low - 1],
-			    p->p_cat_val_to_name[cat->high - 1]);
+			    cat->low > 0 ? p->p_cat_val_to_name[cat->low - 1] : "n/a",
+			    cat->high > 0 ? p->p_cat_val_to_name[cat->high - 1] : "n/a");
 			return -1;
 		}
 		for (i = cat->low - 1; i < cat->high; i++) {
-- 
2.33.0

