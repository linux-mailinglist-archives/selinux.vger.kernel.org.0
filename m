Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C35F1E4C89
	for <lists+selinux@lfdr.de>; Fri, 25 Oct 2019 15:43:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439693AbfJYNnM (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Fri, 25 Oct 2019 09:43:12 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:45227 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2504824AbfJYNnL (ORCPT
        <rfc822;selinux@vger.kernel.org>); Fri, 25 Oct 2019 09:43:11 -0400
X-Originating-IP: 176.157.204.145
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com [176.157.204.145])
        (Authenticated sender: thomas.petazzoni@bootlin.com)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 5CD77C001C;
        Fri, 25 Oct 2019 13:43:10 +0000 (UTC)
From:   Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To:     selinux@vger.kernel.org
Cc:     Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH libselinux 1/2] libselinux/src/Makefile: don't use ln --relative option
Date:   Fri, 25 Oct 2019 15:43:03 +0200
Message-Id: <20191025134304.12666-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

The ln --relative option is not available in fairly old versions of
ln, which are still in use in older Linux distributions.

Since the two use of ln --relative can very trivially be implemented
differently in libselinux/src/Makefile, let's do so.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 libselinux/src/Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/libselinux/src/Makefile b/libselinux/src/Makefile
index 2b1696a0..dc675a49 100644
--- a/libselinux/src/Makefile
+++ b/libselinux/src/Makefile
@@ -170,12 +170,12 @@ install: all
 	install -m 755 $(LIBSO) $(DESTDIR)$(SHLIBDIR)
 	test -d $(DESTDIR)$(LIBDIR)/pkgconfig || install -m 755 -d $(DESTDIR)$(LIBDIR)/pkgconfig
 	install -m 644 $(LIBPC) $(DESTDIR)$(LIBDIR)/pkgconfig
-	ln -sf --relative $(DESTDIR)$(SHLIBDIR)/$(LIBSO) $(DESTDIR)$(LIBDIR)/$(TARGET)
+	cd $(DESTDIR)$(SHLIBDIR) && ln -sf $(LIBSO) $(TARGET)
 
 install-pywrap: pywrap
 	$(PYTHON) setup.py install --prefix=$(PREFIX) `test -n "$(DESTDIR)" && echo --root $(DESTDIR)`
 	install -m 644 $(SWIGPYOUT) $(DESTDIR)$(PYTHONLIBDIR)/selinux/__init__.py
-	ln -sf --relative $(DESTDIR)$(PYTHONLIBDIR)/selinux/_selinux$(PYCEXT) $(DESTDIR)$(PYTHONLIBDIR)/_selinux$(PYCEXT)
+	cd $(DESTDIR)$(PYTHONLIBDIR) && ln -sf selinux/_selinux$(PYCEXT) _selinux$(PYCEXT)
 
 install-rubywrap: rubywrap
 	test -d $(DESTDIR)$(RUBYINSTALL) || install -m 755 -d $(DESTDIR)$(RUBYINSTALL) 
-- 
2.21.0

