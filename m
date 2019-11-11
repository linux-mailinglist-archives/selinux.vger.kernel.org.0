Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7F9E6F7372
	for <lists+selinux@lfdr.de>; Mon, 11 Nov 2019 12:53:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726810AbfKKLxp (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Mon, 11 Nov 2019 06:53:45 -0500
Received: from mx1.polytechnique.org ([129.104.30.34]:38029 "EHLO
        mx1.polytechnique.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726897AbfKKLxp (ORCPT
        <rfc822;selinux@vger.kernel.org>); Mon, 11 Nov 2019 06:53:45 -0500
Received: from localhost.localdomain (85-168-38-217.rev.numericable.fr [85.168.38.217])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by ssl.polytechnique.org (Postfix) with ESMTPSA id 767DB564718;
        Mon, 11 Nov 2019 12:53:43 +0100 (CET)
From:   Nicolas Iooss <nicolas.iooss@m4x.org>
To:     selinux@vger.kernel.org
Cc:     Michael Shigorin <mike@altlinux.org>
Subject: [PATCH 2/3] libselinux,libsemanage: fix python_exception.i dependencies
Date:   Mon, 11 Nov 2019 12:53:14 +0100
Message-Id: <20191111115315.1173097-2-nicolas.iooss@m4x.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191111115315.1173097-1-nicolas.iooss@m4x.org>
References: <20191111115315.1173097-1-nicolas.iooss@m4x.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AV-Checked: ClamAV using ClamSMTP at svoboda.polytechnique.org (Mon Nov 11 12:53:43 2019 +0100 (CET))
X-Spam-Flag: No, tests=bogofilter, spamicity=0.000000, queueID=AF6A4564722
X-Org-Mail: nicolas.iooss.2010@polytechnique.org
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

selinuxswig_python_exception.i and semanageswig_python_exception.i need
to be regenerated when either an input header file changes or
exception.sh changes. Add the missing items to the respective Makefiles.

Signed-off-by: Nicolas Iooss <nicolas.iooss@m4x.org>
---
 libselinux/src/Makefile  | 2 +-
 libsemanage/src/Makefile | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/libselinux/src/Makefile b/libselinux/src/Makefile
index 3b8bad810de0..7f5a5d7418e9 100644
--- a/libselinux/src/Makefile
+++ b/libselinux/src/Makefile
@@ -151,7 +151,7 @@ $(LIBSO): $(LOBJS)
 $(LIBPC): $(LIBPC).in ../VERSION
 	sed -e 's/@VERSION@/$(VERSION)/; s:@prefix@:$(PREFIX):; s:@libdir@:$(LIBDIR):; s:@includedir@:$(INCLUDEDIR):; s:@PCRE_MODULE@:$(PCRE_MODULE):' < $< > $@
 
-selinuxswig_python_exception.i: ../include/selinux/selinux.h
+selinuxswig_python_exception.i: exception.sh ../include/selinux/selinux.h
 	bash -e exception.sh > $@ || (rm -f $@ ; false)
 
 %.o:  %.c policy.h
diff --git a/libsemanage/src/Makefile b/libsemanage/src/Makefile
index e029f0988dd8..8a9570c74163 100644
--- a/libsemanage/src/Makefile
+++ b/libsemanage/src/Makefile
@@ -94,7 +94,7 @@ $(LIBSO): $(LOBJS)
 $(LIBPC): $(LIBPC).in ../VERSION
 	sed -e 's/@VERSION@/$(VERSION)/; s:@prefix@:$(PREFIX):; s:@libdir@:$(LIBDIR):; s:@includedir@:$(INCLUDEDIR):' < $< > $@
 
-semanageswig_python_exception.i: ../include/semanage/semanage.h
+semanageswig_python_exception.i: exception.sh $(wildcard ../include/semanage/*.h)
 	bash -e exception.sh > $@ || (rm -f $@ ; false)
 
 conf-scan.c: conf-scan.l conf-parse.h
-- 
2.24.0

