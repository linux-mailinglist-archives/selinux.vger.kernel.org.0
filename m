Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0475074E39A
	for <lists+selinux@lfdr.de>; Tue, 11 Jul 2023 03:40:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230121AbjGKBkk (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Mon, 10 Jul 2023 21:40:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229983AbjGKBkj (ORCPT
        <rfc822;selinux@vger.kernel.org>); Mon, 10 Jul 2023 21:40:39 -0400
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0EE5EA
        for <selinux@vger.kernel.org>; Mon, 10 Jul 2023 18:40:36 -0700 (PDT)
Received: from kwepemm600010.china.huawei.com (unknown [172.30.72.56])
        by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4R0NLl4fryz1FDkx
        for <selinux@vger.kernel.org>; Tue, 11 Jul 2023 09:19:11 +0800 (CST)
Received: from localhost.localdomain (10.175.104.170) by
 kwepemm600010.china.huawei.com (7.193.23.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 11 Jul 2023 09:19:43 +0800
From:   Huaxin Lu <luhuaxin1@huawei.com>
To:     <selinux@vger.kernel.org>
CC:     <shenyining@huawei.com>, <fangxiuning@huawei.com>,
        <zhujianwei7@huawei.com>
Subject: [PATCH] restorecond: add check for strdup in strings_list_add
Date:   Tue, 11 Jul 2023 06:49:33 +0800
Message-ID: <20230710224933.152174-1-luhuaxin1@huawei.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.104.170]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemm600010.china.huawei.com (7.193.23.86)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Check the return value of strdup() to avoid null pointer reference.

Signed-off-by: Huaxin Lu <luhuaxin1@huawei.com>
---
 restorecond/stringslist.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/restorecond/stringslist.c b/restorecond/stringslist.c
index f9404b1..a76542a 100644
--- a/restorecond/stringslist.c
+++ b/restorecond/stringslist.c
@@ -48,6 +48,8 @@ void strings_list_add(struct stringsList **list, const char *string)
 	if (!newptr)
 		exitApp("Out of Memory");
 	newptr->string = strdup(string);
+	if (!newptr->string)
+		exitApp("Out of Memory");
 	newptr->next = ptr;
 	if (prev)
 		prev->next = newptr;
-- 
2.33.0

