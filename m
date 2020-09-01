Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29AEB2591C5
	for <lists+selinux@lfdr.de>; Tue,  1 Sep 2020 16:55:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728323AbgIAOzU (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Tue, 1 Sep 2020 10:55:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726942AbgIALbq (ORCPT
        <rfc822;selinux@vger.kernel.org>); Tue, 1 Sep 2020 07:31:46 -0400
Received: from agnus.defensec.nl (agnus.defensec.nl [IPv6:2001:985:d55d::711])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 5DB39C061244
        for <selinux@vger.kernel.org>; Tue,  1 Sep 2020 04:07:04 -0700 (PDT)
Received: from localhost.localdomain (brutus.lan [IPv6:2001:985:d55d::438])
        by agnus.defensec.nl (Postfix) with ESMTPSA id 81ECB2A1007;
        Tue,  1 Sep 2020 13:05:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 agnus.defensec.nl 81ECB2A1007
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=defensec.nl;
        s=default; t=1598958351;
        bh=yFBCJVXwFp0Qw1ssPt/Xrv7/dCNQd0pUNMlyts61QjM=;
        h=From:To:Cc:Subject:Date:From;
        b=hAP3YbP2GZ9/5u+PrulF+wGFd+NvPDwy0SjcmYmF7hb/EigqCKct7JxRkWOn+cRqw
         ZmAejfE215/HVGabkIBLUNi4DBG6ZtioK7eAZWMMNgtrH5PfgvMzPXIIqGr4OtcQU6
         PqKDXAgKc9UNOOVvuJD61+P3fM4rN8+CeRgxgIDI=
From:   Dominick Grift <dominick.grift@defensec.nl>
To:     selinux@vger.kernel.org
Cc:     Dominick Grift <dominick.grift@defensec.nl>
Subject: [RFC PATCH] newrole: do not rely on hard-coded audith and pamh paths
Date:   Tue,  1 Sep 2020 13:04:52 +0200
Message-Id: <20200901110452.386724-1-dominick.grift@defensec.nl>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

This causes issue with cross-compiling as the headers might not exist on the host

Signed-off-by: Dominick Grift <dominick.grift@defensec.nl>
---
I was attempting to build a OpenWRT image with SELinux when I hit the above. The aforementioned headers did not exist on the host and instead were located in %{buildroot}/usr/lib
I managed to get around this issue by installing the headers on the host.
Eventually I was unable to build the image though as there was some "ld undefined symbol" issue when it tried to compile busybox with SELinux support.
I must have done something wrong.

 policycoreutils/newrole/Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/policycoreutils/newrole/Makefile b/policycoreutils/newrole/Makefile
index 73ebd413..f508e242 100644
--- a/policycoreutils/newrole/Makefile
+++ b/policycoreutils/newrole/Makefile
@@ -5,8 +5,8 @@ BINDIR ?= $(PREFIX)/bin
 MANDIR ?= $(PREFIX)/share/man
 ETCDIR ?= /etc
 LOCALEDIR = $(DESTDIR)$(PREFIX)/share/locale
-PAMH ?= $(shell test -f /usr/include/security/pam_appl.h && echo y)
-AUDITH ?= $(shell test -f /usr/include/libaudit.h && echo y)
+PAMH ?= y
+AUDITH ?= y
 # Enable capabilities to permit newrole to generate audit records.
 # This will make newrole a setuid root program.
 # The capabilities used are: CAP_AUDIT_WRITE.
-- 
2.28.0

