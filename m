Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 60E87A4B07
	for <lists+selinux@lfdr.de>; Sun,  1 Sep 2019 20:06:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728982AbfIASGy (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Sun, 1 Sep 2019 14:06:54 -0400
Received: from mx1.polytechnique.org ([129.104.30.34]:39235 "EHLO
        mx1.polytechnique.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728952AbfIASGy (ORCPT
        <rfc822;selinux@vger.kernel.org>); Sun, 1 Sep 2019 14:06:54 -0400
Received: from localhost.localdomain (85-168-38-217.rev.numericable.fr [85.168.38.217])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by ssl.polytechnique.org (Postfix) with ESMTPSA id 54449564880
        for <selinux@vger.kernel.org>; Sun,  1 Sep 2019 20:06:52 +0200 (CEST)
From:   Nicolas Iooss <nicolas.iooss@m4x.org>
To:     selinux@vger.kernel.org
Subject: [PATCH 1/9] semodule-utils: fix comparison with argc
Date:   Sun,  1 Sep 2019 20:06:28 +0200
Message-Id: <20190901180636.31586-2-nicolas.iooss@m4x.org>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190901180636.31586-1-nicolas.iooss@m4x.org>
References: <20190901180636.31586-1-nicolas.iooss@m4x.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AV-Checked: ClamAV using ClamSMTP at svoboda.polytechnique.org (Sun Sep  1 20:06:52 2019 +0200 (CEST))
X-Spam-Flag: No, tests=bogofilter, spamicity=0.000000, queueID=9508B564884
X-Org-Mail: nicolas.iooss.2010@polytechnique.org
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

In order for argv[3] to be used, argc needs to be at least 4, not 3.

This bug was found using lgtm.com analyzer:
https://lgtm.com/projects/g/fishilico/selinux-for-lgtm/snapshot/8c1b2658f80392ff8b3532c6bd5d0cefac8afb30/files/semodule-utils/semodule_package/semodule_unpackage.c?sort=name&dir=ASC&mode=heatmap#xb1ce80b43260d34c:1

Signed-off-by: Nicolas Iooss <nicolas.iooss@m4x.org>
---
 semodule-utils/semodule_package/semodule_unpackage.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/semodule-utils/semodule_package/semodule_unpackage.c b/semodule-utils/semodule_package/semodule_unpackage.c
index c9124c0f5ac1..b8c4fbcec434 100644
--- a/semodule-utils/semodule_package/semodule_unpackage.c
+++ b/semodule-utils/semodule_package/semodule_unpackage.c
@@ -55,7 +55,7 @@ int main(int argc, char **argv)
 
 	ppfile = argv[1];
 	modfile = argv[2];
-	if (argc >= 3)
+	if (argc >= 4)
 		fcfile = argv[3];
 
 	if (file_to_policy_file(ppfile, &in, "r"))
-- 
2.22.0

