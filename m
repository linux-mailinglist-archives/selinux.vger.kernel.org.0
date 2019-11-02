Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 957C5ECFF8
	for <lists+selinux@lfdr.de>; Sat,  2 Nov 2019 18:28:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726771AbfKBR2o (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Sat, 2 Nov 2019 13:28:44 -0400
Received: from mx1.polytechnique.org ([129.104.30.34]:57537 "EHLO
        mx1.polytechnique.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726554AbfKBR2o (ORCPT
        <rfc822;selinux@vger.kernel.org>); Sat, 2 Nov 2019 13:28:44 -0400
Received: from localhost.localdomain (85-168-38-217.rev.numericable.fr [85.168.38.217])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by ssl.polytechnique.org (Postfix) with ESMTPSA id 16CE25648A9
        for <selinux@vger.kernel.org>; Sat,  2 Nov 2019 18:28:42 +0100 (CET)
From:   Nicolas Iooss <nicolas.iooss@m4x.org>
To:     selinux@vger.kernel.org
Subject: [PATCH 4/4] gui: compile Python bytecode when installing Python files
Date:   Sat,  2 Nov 2019 18:28:12 +0100
Message-Id: <20191102172812.22492-4-nicolas.iooss@m4x.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191102172812.22492-1-nicolas.iooss@m4x.org>
References: <20191102172812.22492-1-nicolas.iooss@m4x.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AV-Checked: ClamAV using ClamSMTP at svoboda.polytechnique.org (Sat Nov  2 18:28:42 2019 +0100 (CET))
X-Spam-Flag: No, tests=bogofilter, spamicity=0.000000, queueID=5616C5648AA
X-Org-Mail: nicolas.iooss.2010@polytechnique.org
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Create a cache directory such as
/usr/share/system-config-selinux/__pycache__/ in order to prevent it
from being dynamically created when the gui is used.

Signed-off-by: Nicolas Iooss <nicolas.iooss@m4x.org>
---
 gui/Makefile | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/gui/Makefile b/gui/Makefile
index ca965c942912..c3fd196fcd2c 100644
--- a/gui/Makefile
+++ b/gui/Makefile
@@ -1,3 +1,5 @@
+PYTHON ?= python3
+
 # Installation directories.
 LINGUAS ?= ru
 PREFIX ?= /usr
@@ -54,6 +56,8 @@ install: all
 		install -m 644 sepolicy_$${i}.png $(DESTDIR)$(DATADIR)/icons/hicolor/$${i}x$${i}/apps/sepolicy.png; \
 	done
 	install -m 644 org.selinux.config.policy $(DESTDIR)$(DATADIR)/polkit-1/actions/
+	$(PYTHON) -m compileall $(DESTDIR)$(SHAREDIR)
+
 clean:
 
 indent:
-- 
2.23.0

