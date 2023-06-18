Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C3B57349C4
	for <lists+selinux@lfdr.de>; Mon, 19 Jun 2023 03:46:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229456AbjFSBqm (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Sun, 18 Jun 2023 21:46:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229475AbjFSBql (ORCPT
        <rfc822;selinux@vger.kernel.org>); Sun, 18 Jun 2023 21:46:41 -0400
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FB64E44
        for <selinux@vger.kernel.org>; Sun, 18 Jun 2023 18:46:40 -0700 (PDT)
Received: from kwepemm600010.china.huawei.com (unknown [172.30.72.56])
        by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4Qkt0V16g6z1FDcN
        for <selinux@vger.kernel.org>; Mon, 19 Jun 2023 09:46:34 +0800 (CST)
Received: from localhost.localdomain (10.175.104.170) by
 kwepemm600010.china.huawei.com (7.193.23.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 19 Jun 2023 09:46:37 +0800
From:   Huaxin Lu <luhuaxin1@huawei.com>
To:     <selinux@vger.kernel.org>
CC:     <shenyining@huawei.com>, <fangxiuning@huawei.com>,
        <zhujianwei7@huawei.com>
Subject: [PATCH] libselinux: add check for calloc in check_booleans
Date:   Mon, 19 Jun 2023 07:17:02 +0800
Message-ID: <20230618231702.118125-1-luhuaxin1@huawei.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.104.170]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm600010.china.huawei.com (7.193.23.86)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Check the return value of calloc() to avoid null pointer reference.

Signed-off-by: Huaxin Lu <luhuaxin1@huawei.com>
---
 libselinux/src/audit2why.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/libselinux/src/audit2why.c b/libselinux/src/audit2why.c
index ba1a66e..2def89f 100644
--- a/libselinux/src/audit2why.c
+++ b/libselinux/src/audit2why.c
@@ -149,6 +149,12 @@ static int check_booleans(struct boolean_t **bools)
 
 	if (fcnt > 0) {
 		*bools = calloc(sizeof(struct boolean_t), fcnt + 1);
+		if (!*bools) {
+			PyErr_SetString( PyExc_MemoryError, "Out of memory\n");
+			free(foundlist);
+			return 0;
+		}
+	
 		struct boolean_t *b = *bools;
 		for (i = 0; i < fcnt; i++) {
 			int ctr = foundlist[i];
-- 
2.33.0

