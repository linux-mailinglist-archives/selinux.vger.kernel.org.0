Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34AC11F8C0E
	for <lists+selinux@lfdr.de>; Mon, 15 Jun 2020 03:21:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728024AbgFOBVl (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Sun, 14 Jun 2020 21:21:41 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:43800 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727969AbgFOBVl (ORCPT <rfc822;selinux@vger.kernel.org>);
        Sun, 14 Jun 2020 21:21:41 -0400
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id 6105BB0047717EEC8587
        for <selinux@vger.kernel.org>; Mon, 15 Jun 2020 09:21:38 +0800 (CST)
Received: from huawei.com (10.175.101.6) by DGGEMS408-HUB.china.huawei.com
 (10.3.19.208) with Microsoft SMTP Server id 14.3.487.0; Mon, 15 Jun 2020
 09:21:32 +0800
From:   Ji Qin <jiqin.ji@huawei.com>
To:     <selinux@vger.kernel.org>
CC:     <jiqin.ji@huawei.com>
Subject: [PATCH] libselinux: Fix NULL pointer use in selinux_restorecon_set_sehandle
Date:   Sun, 14 Jun 2020 21:20:23 -0400
Message-ID: <20200615012023.8315-1-jiqin.ji@huawei.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.101.6]
X-CFilter-Loop: Reflected
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

error occur when selinux_restorecon_default_handle return NULL in
restorecon_init.

fixes: https://github.com/SELinuxProject/selinux/issues/249

Signed-off-by: Ji Qin <jiqin.ji@huawei.com>
---
 libselinux/src/selinux_restorecon.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/libselinux/src/selinux_restorecon.c b/libselinux/src/selinux_restorecon.c
index 91dfeb66..c2d05a66 100644
--- a/libselinux/src/selinux_restorecon.c
+++ b/libselinux/src/selinux_restorecon.c
@@ -1153,6 +1153,8 @@ void selinux_restorecon_set_sehandle(struct selabel_handle *hndl)
 	size_t num_specfiles, fc_digest_len;
 
 	fc_sehandle = (struct selabel_handle *) hndl;
+	if (!fc_sehandle)
+		return;
 
 	/* Check if digest requested in selabel_open(3), if so use it. */
 	if (selabel_digest(fc_sehandle, &fc_digest, &fc_digest_len,
-- 
2.23.0

