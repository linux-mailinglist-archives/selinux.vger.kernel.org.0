Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 140D8A4B12
	for <lists+selinux@lfdr.de>; Sun,  1 Sep 2019 20:14:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728930AbfIASOW (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Sun, 1 Sep 2019 14:14:22 -0400
Received: from mx1.polytechnique.org ([129.104.30.34]:48897 "EHLO
        mx1.polytechnique.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728929AbfIASOW (ORCPT
        <rfc822;selinux@vger.kernel.org>); Sun, 1 Sep 2019 14:14:22 -0400
Received: from localhost.localdomain (85-168-38-217.rev.numericable.fr [85.168.38.217])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by ssl.polytechnique.org (Postfix) with ESMTPSA id C7DAF5606A9
        for <selinux@vger.kernel.org>; Sun,  1 Sep 2019 20:14:19 +0200 (CEST)
From:   Nicolas Iooss <nicolas.iooss@m4x.org>
To:     selinux@vger.kernel.org
Subject: [PATCH] Add configuration file for lgtm.com
Date:   Sun,  1 Sep 2019 20:14:10 +0200
Message-Id: <20190901181410.357-1-nicolas.iooss@m4x.org>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AV-Checked: ClamAV using ClamSMTP at svoboda.polytechnique.org (Sun Sep  1 20:14:20 2019 +0200 (CEST))
X-Spam-Flag: No, tests=bogofilter, spamicity=0.000000, queueID=54D6F5606AA
X-Org-Mail: nicolas.iooss.2010@polytechnique.org
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Add a configuration file in order to parse the C code on
https://lgtm.com/projects/g/SELinuxProject/selinux/

The documentation about this file is on
https://help.semmle.com/lgtm-enterprise/user/help/lgtm.yml-configuration-file.html
and
https://help.semmle.com/lgtm-enterprise/user/help/cpp-extraction.html

Fixes: https://github.com/SELinuxProject/selinux/issues/98

Signed-off-by: Nicolas Iooss <nicolas.iooss@m4x.org>

diff --git a/lgtm.yml b/lgtm.yml
new file mode 100644
index 000000000000..f80bf1461fb6
--- /dev/null
+++ b/lgtm.yml
@@ -0,0 +1,5 @@
+extraction:
+  cpp:
+    index:
+      build_command:
+        - make DESTDIR="$LGTM_WORKSPACE/destdir" install
-- 
2.22.0

