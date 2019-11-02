Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EA4C0ECFF6
	for <lists+selinux@lfdr.de>; Sat,  2 Nov 2019 18:28:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726687AbfKBR2l (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Sat, 2 Nov 2019 13:28:41 -0400
Received: from mx1.polytechnique.org ([129.104.30.34]:51924 "EHLO
        mx1.polytechnique.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726554AbfKBR2l (ORCPT
        <rfc822;selinux@vger.kernel.org>); Sat, 2 Nov 2019 13:28:41 -0400
Received: from localhost.localdomain (85-168-38-217.rev.numericable.fr [85.168.38.217])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by ssl.polytechnique.org (Postfix) with ESMTPSA id 565EC5648A9
        for <selinux@vger.kernel.org>; Sat,  2 Nov 2019 18:28:39 +0100 (CET)
From:   Nicolas Iooss <nicolas.iooss@m4x.org>
To:     selinux@vger.kernel.org
Subject: [PATCH 2/4] libsemanage: compile Python bytecode when installing Python files
Date:   Sat,  2 Nov 2019 18:28:10 +0100
Message-Id: <20191102172812.22492-2-nicolas.iooss@m4x.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191102172812.22492-1-nicolas.iooss@m4x.org>
References: <20191102172812.22492-1-nicolas.iooss@m4x.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AV-Checked: ClamAV using ClamSMTP at svoboda.polytechnique.org (Sat Nov  2 18:28:39 2019 +0100 (CET))
X-Spam-Flag: No, tests=bogofilter, spamicity=0.000000, queueID=9BC6D5648AA
X-Org-Mail: nicolas.iooss.2010@polytechnique.org
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Create a cache file such as
/usr/lib/python3.7/site-packages/__pycache__/semanage.cpython-37.pyc
in order to prevent it from being dynamically created when semanage
module is imported.

Signed-off-by: Nicolas Iooss <nicolas.iooss@m4x.org>
---
 libsemanage/src/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/libsemanage/src/Makefile b/libsemanage/src/Makefile
index e029f0988dd8..a9adfa47bdc8 100644
--- a/libsemanage/src/Makefile
+++ b/libsemanage/src/Makefile
@@ -145,7 +145,7 @@ install-pywrap: pywrap
 	test -d $(DESTDIR)$(PYTHONLIBDIR) || install -m 755 -d $(DESTDIR)$(PYTHONLIBDIR)
 	install -m 755 $(SWIGSO) $(DESTDIR)$(PYTHONLIBDIR)/_semanage$(PYCEXT)
 	install -m 644 semanage.py $(DESTDIR)$(PYTHONLIBDIR)
-
+	$(PYTHON) -m compileall $(DESTDIR)$(PYTHONLIBDIR)/semanage.py
 
 install-rubywrap: rubywrap
 	test -d $(DESTDIR)$(RUBYINSTALL) || install -m 755 -d $(DESTDIR)$(RUBYINSTALL) 
-- 
2.23.0

