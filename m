Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F16F0324E6D
	for <lists+selinux@lfdr.de>; Thu, 25 Feb 2021 11:43:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230201AbhBYKni (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Thu, 25 Feb 2021 05:43:38 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:12576 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235307AbhBYKk4 (ORCPT
        <rfc822;selinux@vger.kernel.org>); Thu, 25 Feb 2021 05:40:56 -0500
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4DmTlQ2fCmzMf0T
        for <selinux@vger.kernel.org>; Thu, 25 Feb 2021 18:38:10 +0800 (CST)
Received: from huawei.com (10.175.124.27) by DGGEMS413-HUB.china.huawei.com
 (10.3.19.213) with Microsoft SMTP Server id 14.3.498.0; Thu, 25 Feb 2021
 18:40:06 +0800
From:   lutianxiong <lutianxiong@huawei.com>
To:     <selinux@vger.kernel.org>
CC:     <lutianxiong@huawei.com>, <jiqin.ji@huawei.com>,
        <liaoqingwei@huawei.com>
Subject: [PATCH] libsepol/cil: fix NULL pointer dereference in cil_fill_ipaddr
Date:   Thu, 25 Feb 2021 18:40:02 +0800
Message-ID: <20210225104002.1333-1-lutianxiong@huawei.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.124.27]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Found a NULL pointer dereference by fuzzing, reproducing:
    $ echo "(nodecon(())o(e()))" > tmp.cil
    $ secilc tmp.cil
    Segmentation fault (core dumped)

Add NULL check for addr_node->data in cil_fill_ipaddr.

Signed-off-by: lutianxiong <lutianxiong@huawei.com>
---
 libsepol/cil/src/cil_build_ast.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/libsepol/cil/src/cil_build_ast.c b/libsepol/cil/src/cil_build_ast.c
index 726f46c..4e53f06 100644
--- a/libsepol/cil/src/cil_build_ast.c
+++ b/libsepol/cil/src/cil_build_ast.c
@@ -5660,7 +5660,7 @@ int cil_fill_ipaddr(struct cil_tree_node *addr_node, struct cil_ipaddr *addr)
 {
 	int rc = SEPOL_ERR;
 
-	if (addr_node == NULL || addr == NULL) {
+	if (addr_node == NULL || addr_node->data == NULL || addr == NULL) {
 		goto exit;
 	}
 
-- 
2.23.0

