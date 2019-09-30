Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0A32EC269F
	for <lists+selinux@lfdr.de>; Mon, 30 Sep 2019 22:40:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729775AbfI3Uia (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Mon, 30 Sep 2019 16:38:30 -0400
Received: from mx1.polytechnique.org ([129.104.30.34]:39623 "EHLO
        mx1.polytechnique.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730437AbfI3Uia (ORCPT
        <rfc822;selinux@vger.kernel.org>); Mon, 30 Sep 2019 16:38:30 -0400
Received: from localhost.localdomain (85-168-38-217.rev.numericable.fr [85.168.38.217])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by ssl.polytechnique.org (Postfix) with ESMTPSA id E6E4E564866
        for <selinux@vger.kernel.org>; Mon, 30 Sep 2019 22:22:35 +0200 (CEST)
From:   Nicolas Iooss <nicolas.iooss@m4x.org>
To:     selinux@vger.kernel.org
Subject: [PATCH 1/2] libsemanage/tests: return when str is NULL
Date:   Mon, 30 Sep 2019 22:22:10 +0200
Message-Id: <20190930202211.781578-1-nicolas.iooss@m4x.org>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AV-Checked: ClamAV using ClamSMTP at svoboda.polytechnique.org (Mon Sep 30 22:22:36 2019 +0200 (CEST))
X-Spam-Flag: No, tests=bogofilter, spamicity=0.000001, queueID=3DC39564867
X-Org-Mail: nicolas.iooss.2010@polytechnique.org
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

CU_FAIL() does not stop the execution flow.

This issue has been found using Infer static analyzer.

Signed-off-by: Nicolas Iooss <nicolas.iooss@m4x.org>
---
 libsemanage/tests/test_utilities.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/libsemanage/tests/test_utilities.c b/libsemanage/tests/test_utilities.c
index ba995b5ae094..fa3a077f5e92 100644
--- a/libsemanage/tests/test_utilities.c
+++ b/libsemanage/tests/test_utilities.c
@@ -142,6 +142,7 @@ void test_semanage_split_on_space(void)
 	if (!str) {
 		CU_FAIL
 		    ("semanage_split_on_space: unable to perform test, no memory");
+		return;
 	}
 	temp = semanage_split_on_space(str);
 	CU_ASSERT_STRING_EQUAL(temp, "bar    baz");
-- 
2.22.0

