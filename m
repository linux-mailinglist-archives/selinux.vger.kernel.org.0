Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E88D64E6B4
	for <lists+selinux@lfdr.de>; Fri, 16 Dec 2022 05:31:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229844AbiLPEb0 (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Thu, 15 Dec 2022 23:31:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229841AbiLPEbV (ORCPT
        <rfc822;selinux@vger.kernel.org>); Thu, 15 Dec 2022 23:31:21 -0500
X-Greylist: delayed 905 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 15 Dec 2022 20:31:18 PST
Received: from m12.mail.163.com (m12.mail.163.com [220.181.12.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 2BF893A2
        for <selinux@vger.kernel.org>; Thu, 15 Dec 2022 20:31:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=qnNt3
        U8Ss1+HkvJExW5wQLM0k+R6zN2fEF7NdbF6vmA=; b=ZbjuPbEWu2yBatVHwPPGf
        7HKrgj801cNNt1p+KPOXFwF59YnUMkfMPV0Xls73I+BALfwoK9488LoEw3+IF13C
        adk/2o3AnUXVyRhE6yIXTobsvdc+4R+3ZVHach9rgwirSWD3RC9SH4fX5iTWEOJO
        2S/ZkNhjYFyPn84M47P5Wo=
Received: from localhost.localdomain (unknown [113.200.76.118])
        by zwqz-smtp-mta-g2-4 (Coremail) with SMTP id _____wBnvnoC8Ztj+_I9AA--.22039S2;
        Fri, 16 Dec 2022 12:16:02 +0800 (CST)
From:   kkz <izhaoshuang@163.com>
To:     selinux@vger.kernel.org
Subject: [PATCH] sepolicy: fix a spelling mistake
Date:   Fri, 16 Dec 2022 12:16:02 +0800
Message-Id: <20221216041602.19344-1-izhaoshuang@163.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wBnvnoC8Ztj+_I9AA--.22039S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Gw18tF4rGrWUtrWDXrWrZrb_yoW3GFgEkr
        4vq3ZFvry5XF18K3W8CasrJF1Fq3s09F1Fvry3Kr1avrnxtr9akFyDXF1rJF47Cr4UCry3
        ZrZ8uF4UAr13ZjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUj4EE5UUUUU==
X-Originating-IP: [113.200.76.118]
X-CM-SenderInfo: 5l2kt0pvkxt0rj6rljoofrz/1tbiHQbZuGI68W7WYwAAsI
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_20,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

From: kkz <zhaoshuang@uniontech.com>

Signed-off-by: kkz <zhaoshuang@uniontech.com>
---
 python/sepolicy/sepolicy/templates/script.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/python/sepolicy/sepolicy/templates/script.py b/python/sepolicy/sepolicy/templates/script.py
index c79738b8..564a6b38 100644
--- a/python/sepolicy/sepolicy/templates/script.py
+++ b/python/sepolicy/sepolicy/templates/script.py
@@ -75,7 +75,7 @@ rpmbuild --define "_sourcedir ${pwd}" --define "_specdir ${pwd}" --define "_buil
 """
 
 manpage="""\
-# Generate a man page off the installed module
+# Generate a man page of the installed module
 sepolicy manpage -p . -d DOMAINTYPE_t
 """
 
-- 
2.20.1

