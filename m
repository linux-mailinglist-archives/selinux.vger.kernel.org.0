Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BCE41E4C79
	for <lists+selinux@lfdr.de>; Fri, 25 Oct 2019 15:42:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2504844AbfJYNmE (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Fri, 25 Oct 2019 09:42:04 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:58899 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726285AbfJYNly (ORCPT
        <rfc822;selinux@vger.kernel.org>); Fri, 25 Oct 2019 09:41:54 -0400
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com [176.157.204.145])
        (Authenticated sender: thomas.petazzoni@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 9B3FC24000C;
        Fri, 25 Oct 2019 13:41:51 +0000 (UTC)
From:   Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To:     selinux@vger.kernel.org
Cc:     Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH libselinux] libselinux/src/Makefile: don't pass bogus -I and -L to python setup.py build_ext
Date:   Fri, 25 Oct 2019 15:41:49 +0200
Message-Id: <20191025134149.12518-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Using $(DESTDIR) during the build does not follow the normal/standard
semantic of DESTDIR: it is normally only needed during the
installation. Therefore, a lot of build systems/environments don't
pass any DESTDIR at build time, which causes setup.py to be called
with -I /usr/include -L /usr/lib, which breaks cross-compilation.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 libselinux/src/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/libselinux/src/Makefile b/libselinux/src/Makefile
index 2b1696a0..3b8bad81 100644
--- a/libselinux/src/Makefile
+++ b/libselinux/src/Makefile
@@ -130,7 +130,7 @@ SWIGRUBY = swig -Wall -ruby -o $(SWIGRUBYCOUT) -outdir ./ $(DISABLE_FLAGS)
 all: $(LIBA) $(LIBSO) $(LIBPC)
 
 pywrap: all selinuxswig_python_exception.i
-	CFLAGS="$(CFLAGS) $(SWIG_CFLAGS)" $(PYTHON) setup.py build_ext -I $(DESTDIR)$(INCLUDEDIR) -L $(DESTDIR)$(LIBDIR)
+	CFLAGS="$(CFLAGS) $(SWIG_CFLAGS)" $(PYTHON) setup.py build_ext
 
 rubywrap: all $(SWIGRUBYSO)
 
-- 
2.21.0

