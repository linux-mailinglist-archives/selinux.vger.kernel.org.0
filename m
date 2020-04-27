Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E5AF1BA3C9
	for <lists+selinux@lfdr.de>; Mon, 27 Apr 2020 14:48:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726721AbgD0Ms2 (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Mon, 27 Apr 2020 08:48:28 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:3354 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726539AbgD0Ms2 (ORCPT <rfc822;selinux@vger.kernel.org>);
        Mon, 27 Apr 2020 08:48:28 -0400
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id B00A8DCC2DD6A311BFE7;
        Mon, 27 Apr 2020 20:48:26 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS413-HUB.china.huawei.com (10.3.19.213) with Microsoft SMTP Server id
 14.3.487.0; Mon, 27 Apr 2020 20:48:16 +0800
From:   Wei Yongjun <weiyongjun1@huawei.com>
To:     Paul Moore <paul@paul-moore.com>,
        Stephen Smalley <stephen.smalley.work@gmail.com>,
        Eric Paris <eparis@parisplace.org>,
        "Ondrej Mosnacek" <omosnace@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>
CC:     Wei Yongjun <weiyongjun1@huawei.com>, <selinux@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>
Subject: [PATCH -next] selinux: fix error return code in cond_read_list()
Date:   Mon, 27 Apr 2020 12:49:35 +0000
Message-ID: <20200427124935.130432-1-weiyongjun1@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type:   text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Fix to return negative error code -ENOMEM from the error handling
case instead of 0, as done elsewhere in this function.

Fixes: 60abd3181db2 ("selinux: convert cond_list to array")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 security/selinux/ss/conditional.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/security/selinux/ss/conditional.c b/security/selinux/ss/conditional.c
index 939a74fd8fb4..da94a1b4bfda 100644
--- a/security/selinux/ss/conditional.c
+++ b/security/selinux/ss/conditional.c
@@ -429,7 +429,7 @@ int cond_read_list(struct policydb *p, void *fp)
 
 	p->cond_list = kcalloc(len, sizeof(*p->cond_list), GFP_KERNEL);
 	if (!p->cond_list)
-		return rc;
+		return -ENOMEM;
 
 	rc = avtab_alloc(&(p->te_cond_avtab), p->te_avtab.nel);
 	if (rc)



