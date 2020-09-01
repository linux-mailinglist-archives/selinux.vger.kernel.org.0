Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3CE262597B0
	for <lists+selinux@lfdr.de>; Tue,  1 Sep 2020 18:17:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728604AbgIAQRM (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Tue, 1 Sep 2020 12:17:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731799AbgIAQRI (ORCPT
        <rfc822;selinux@vger.kernel.org>); Tue, 1 Sep 2020 12:17:08 -0400
Received: from agnus.defensec.nl (agnus.defensec.nl [IPv6:2001:985:d55d::711])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 001B1C061244
        for <selinux@vger.kernel.org>; Tue,  1 Sep 2020 09:17:07 -0700 (PDT)
Received: from localhost.localdomain (brutus.lan [IPv6:2001:985:d55d::438])
        by agnus.defensec.nl (Postfix) with ESMTPSA id 77FAA2A0CF5;
        Tue,  1 Sep 2020 18:17:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 agnus.defensec.nl 77FAA2A0CF5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=defensec.nl;
        s=default; t=1598977022;
        bh=Nfsncvx2Gee3WxS7HDCg3zPC+yER1SxHDYSiRRVJVuM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=lqiQDoa2r4zMPqCddg5RNhweqMS46no9PGLj9OzmorfW0cHhPMPiJBd1/2O9Z8Vzs
         LmbNVS/es5omYlqBGIshexcnz/GDe7InROd044wIuxkExdAx/fF3hOYKrKKP64Na2A
         FNrRh1RirzPXkMd4TEMYGtOYCQTUAp1JWU77OYeM=
From:   Dominick Grift <dominick.grift@defensec.nl>
To:     selinux@vger.kernel.org
Cc:     Dominick Grift <dominick.grift@defensec.nl>
Subject: [PATCH] newrole: support cross-compilation with PAM and audit
Date:   Tue,  1 Sep 2020 18:16:41 +0200
Message-Id: <20200901161641.431740-1-dominick.grift@defensec.nl>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <CAEjxPJ73HtLW_AgRBSEUmNVer4xpotkCq1i7r=YJOF1LbixKuQ@mail.gmail.com>
References: <CAEjxPJ73HtLW_AgRBSEUmNVer4xpotkCq1i7r=YJOF1LbixKuQ@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Compilation of newrole with PAM and audit support currently requires that you have the respective headers installed on the host. Instead make the header location customizable to accomodate cross-compilation.

Signed-off-by: Dominick Grift <dominick.grift@defensec.nl>
---
 policycoreutils/newrole/Makefile | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/policycoreutils/newrole/Makefile b/policycoreutils/newrole/Makefile
index 73ebd413..0e7ebce3 100644
--- a/policycoreutils/newrole/Makefile
+++ b/policycoreutils/newrole/Makefile
@@ -5,8 +5,9 @@ BINDIR ?= $(PREFIX)/bin
 MANDIR ?= $(PREFIX)/share/man
 ETCDIR ?= /etc
 LOCALEDIR = $(DESTDIR)$(PREFIX)/share/locale
-PAMH ?= $(shell test -f /usr/include/security/pam_appl.h && echo y)
-AUDITH ?= $(shell test -f /usr/include/libaudit.h && echo y)
+INCLUDEDIR ?= $(PREFIX)/include
+PAMH ?= $(shell test -f $(INCLUDEDIR)/security/pam_appl.h && echo y)
+AUDITH ?= $(shell test -f $(INCLUDEDIR)/libaudit.h && echo y)
 # Enable capabilities to permit newrole to generate audit records.
 # This will make newrole a setuid root program.
 # The capabilities used are: CAP_AUDIT_WRITE.
-- 
2.28.0

