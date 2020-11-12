Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82EA92B06F0
	for <lists+selinux@lfdr.de>; Thu, 12 Nov 2020 14:48:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727264AbgKLNsn (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Thu, 12 Nov 2020 08:48:43 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:7525 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727863AbgKLNsn (ORCPT
        <rfc822;selinux@vger.kernel.org>); Thu, 12 Nov 2020 08:48:43 -0500
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CX2xW1SmyzhkbY;
        Thu, 12 Nov 2020 21:48:31 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.487.0; Thu, 12 Nov 2020 21:48:33 +0800
From:   Chen Zhou <chenzhou10@huawei.com>
To:     <paul@paul-moore.com>, <stephen.smalley.work@gmail.com>,
        <eparis@parisplace.org>, <danielj@mellanox.com>,
        <dledford@redhat.com>
CC:     <selinux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <chenzhou10@huawei.com>, Hulk Robot <hulkci@huawei.com>
Subject: [PATCH v2] selinux: Fix error return code in sel_ib_pkey_sid_slow()
Date:   Thu, 12 Nov 2020 21:53:32 +0800
Message-ID: <20201112135332.89062-1-chenzhou10@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Fix to return a negative error code from the error handling case
instead of 0 in function sel_ib_pkey_sid_slow(), as done elsewhere
in this function.

Fixes: 409dcf31538a ("selinux: Add a cache for quicker retreival of PKey SIDs")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Chen Zhou <chenzhou10@huawei.com>
---
 security/selinux/ibpkey.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/security/selinux/ibpkey.c b/security/selinux/ibpkey.c
index f68a7617cfb9..3a63a989e55e 100644
--- a/security/selinux/ibpkey.c
+++ b/security/selinux/ibpkey.c
@@ -151,8 +151,10 @@ static int sel_ib_pkey_sid_slow(u64 subnet_prefix, u16 pkey_num, u32 *sid)
 	 * is valid, it just won't be added to the cache.
 	 */
 	new = kzalloc(sizeof(*new), GFP_ATOMIC);
-	if (!new)
+	if (!new) {
+		ret = -ENOMEM;
 		goto out;
+	}
 
 	new->psec.subnet_prefix = subnet_prefix;
 	new->psec.pkey = pkey_num;
-- 
2.20.1

