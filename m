Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67CCC2D07C8
	for <lists+selinux@lfdr.de>; Sun,  6 Dec 2020 23:58:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728311AbgLFW51 (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Sun, 6 Dec 2020 17:57:27 -0500
Received: from mx1.polytechnique.org ([129.104.30.34]:59172 "EHLO
        mx1.polytechnique.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728221AbgLFW51 (ORCPT
        <rfc822;selinux@vger.kernel.org>); Sun, 6 Dec 2020 17:57:27 -0500
Received: from localhost.localdomain (85-168-38-217.rev.numericable.fr [85.168.38.217])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by ssl.polytechnique.org (Postfix) with ESMTPSA id BBCAA564E41
        for <selinux@vger.kernel.org>; Sun,  6 Dec 2020 23:56:44 +0100 (CET)
From:   Nicolas Iooss <nicolas.iooss@m4x.org>
To:     selinux@vger.kernel.org
Subject: [PATCH 1/2] GitHub Actions: upgrade to Python 3.9
Date:   Sun,  6 Dec 2020 23:56:24 +0100
Message-Id: <20201206225625.3077530-1-nicolas.iooss@m4x.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AV-Checked: ClamAV using ClamSMTP at svoboda.polytechnique.org (Sun Dec  6 23:56:45 2020 +0100 (CET))
X-Spam-Flag: No, tests=bogofilter, spamicity=0.000155, queueID=119DD564E44
X-Org-Mail: nicolas.iooss.2010@polytechnique.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Signed-off-by: Nicolas Iooss <nicolas.iooss@m4x.org>
---
 .github/workflows/run_tests.yml | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/.github/workflows/run_tests.yml b/.github/workflows/run_tests.yml
index 6f280de8ff4d..d889b5d55604 100644
--- a/.github/workflows/run_tests.yml
+++ b/.github/workflows/run_tests.yml
@@ -10,25 +10,26 @@ jobs:
       matrix:
         compiler: [gcc, clang]
         python-ruby-version:
-          - {python: 3.8, ruby: 2.7}
-          - {python: 3.8, ruby: 2.7, other: test-flags-override}
-          - {python: 3.8, ruby: 2.7, other: test-debug}
-          - {python: 3.8, ruby: 2.7, other: linker-bfd}
-          - {python: 3.8, ruby: 2.7, other: linker-gold}
+          - {python: 3.9, ruby: 2.7}
+          - {python: 3.9, ruby: 2.7, other: test-flags-override}
+          - {python: 3.9, ruby: 2.7, other: test-debug}
+          - {python: 3.9, ruby: 2.7, other: linker-bfd}
+          - {python: 3.9, ruby: 2.7, other: linker-gold}
           # Test several Python versions with the latest Ruby version
+          - {python: 3.8, ruby: 2.7}
           - {python: 3.7, ruby: 2.7}
           - {python: 3.6, ruby: 2.7}
           - {python: 3.5, ruby: 2.7}
           - {python: pypy3, ruby: 2.7}
           # Test several Ruby versions with the latest Python version
-          - {python: 3.8, ruby: 2.6}
-          - {python: 3.8, ruby: 2.5}
-          - {python: 3.8, ruby: 2.4}
+          - {python: 3.9, ruby: 2.6}
+          - {python: 3.9, ruby: 2.5}
+          - {python: 3.9, ruby: 2.4}
         exclude:
           - compiler: clang
-            python-ruby-version: {python: 3.8, ruby: 2.7, other: linker-bfd}
+            python-ruby-version: {python: 3.9, ruby: 2.7, other: linker-bfd}
           - compiler: clang
-            python-ruby-version: {python: 3.8, ruby: 2.7, other: linker-gold}
+            python-ruby-version: {python: 3.9, ruby: 2.7, other: linker-gold}
 
     steps:
     - uses: actions/checkout@v2
-- 
2.29.2

