Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0CD41BD60B
	for <lists+selinux@lfdr.de>; Wed, 29 Apr 2020 09:29:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726456AbgD2H3r (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Wed, 29 Apr 2020 03:29:47 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:3336 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726355AbgD2H3r (ORCPT <rfc822;selinux@vger.kernel.org>);
        Wed, 29 Apr 2020 03:29:47 -0400
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id 4CF88DE1252FF49D47E6;
        Wed, 29 Apr 2020 15:29:46 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.487.0; Wed, 29 Apr 2020 15:29:39 +0800
From:   Wei Yongjun <weiyongjun1@huawei.com>
To:     Paul Moore <paul@paul-moore.com>,
        Stephen Smalley <stephen.smalley.work@gmail.com>,
        Eric Paris <eparis@parisplace.org>,
        "Ondrej Mosnacek" <omosnace@redhat.com>,
        Jeff Vander Stoep <jeffv@google.com>
CC:     Wei Yongjun <weiyongjun1@huawei.com>, <selinux@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>
Subject: [PATCH -next] selinux: fix error return code in policydb_read()
Date:   Wed, 29 Apr 2020 07:30:53 +0000
Message-ID: <20200429073053.83660-1-weiyongjun1@huawei.com>
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

Fix to return negative error code -ENOMEM from the kvcalloc() error
handling case instead of 0, as done elsewhere in this function.

Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 security/selinux/ss/policydb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/security/selinux/ss/policydb.c b/security/selinux/ss/policydb.c
index a0b3dc152468..a51e051df2cc 100644
--- a/security/selinux/ss/policydb.c
+++ b/security/selinux/ss/policydb.c
@@ -2638,6 +2638,7 @@ int policydb_read(struct policydb *p, void *fp)
 	if (rc)
 		goto bad;
 
+	rc = -ENOMEM;
 	p->type_attr_map_array = kvcalloc(p->p_types.nprim,
 					  sizeof(*p->type_attr_map_array),
 					  GFP_KERNEL);



