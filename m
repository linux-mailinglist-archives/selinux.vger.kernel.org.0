Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9BD01166132
	for <lists+selinux@lfdr.de>; Thu, 20 Feb 2020 16:43:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728443AbgBTPnd (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Thu, 20 Feb 2020 10:43:33 -0500
Received: from mailomta1-re.btinternet.com ([213.120.69.94]:60463 "EHLO
        re-prd-fep-047.btinternet.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728236AbgBTPnd (ORCPT
        <rfc822;selinux@vger.kernel.org>); Thu, 20 Feb 2020 10:43:33 -0500
Received: from re-prd-rgout-001.btmx-prd.synchronoss.net ([10.2.54.4])
          by re-prd-fep-047.btinternet.com with ESMTP
          id <20200220154331.TXSV16580.re-prd-fep-047.btinternet.com@re-prd-rgout-001.btmx-prd.synchronoss.net>;
          Thu, 20 Feb 2020 15:43:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=btinternet.com; s=btmx201904; t=1582213411; 
        bh=7YZn2E4RfvGB8ZcvmR/mobpSd/x82TEpP4EiJyjoPQ4=;
        h=From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version;
        b=rueTVTDOGEf+qhq9OmM5gbYD6nBEudk5ri/m8ZEOURAot512eTLYqhPjedpFP17j3y9G3m1j5svs+0NBIiX7+9y9nA//WJ5EphMygBmq9idatlY3nqVpiNJTwGkN2uQOAwCBlJ9NCrIJjFCEGpXFkKf2Jpfx7ue1MgSMLhsf4wDUgH4BTrbYKdYBOtjoxy+TyLdd8vuMvKIPB2LGAAIdx9ZfyRwdJszaECYQF2v//PNBqSObXSSkA2+4WQkPmFAaGzVNzD66OQ/kevZ+j/0Nzf71n5uQ1YZu3NnalMPpUfxOf+rpyhX9chT50c7HBmFc3zq9p9U2E0hDXRhuwl31BQ==
Authentication-Results: btinternet.com;
    auth=pass (PLAIN) smtp.auth=richard_c_haines@btinternet.com
X-Originating-IP: [86.134.4.49]
X-OWM-Source-IP: 86.134.4.49 (GB)
X-OWM-Env-Sender: richard_c_haines@btinternet.com
X-VadeSecure-score: verdict=clean score=0/300, class=clean
X-RazorGate-Vade: gggruggvucftvghtrhhoucdtuddrgedugedrkedvgdekudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemuceutffkvffkuffjvffgnffgvefqofdpqfgfvfenuceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomheptfhitghhrghrugcujfgrihhnvghsuceorhhitghhrghruggptggphhgrihhnvghssegsthhinhhtvghrnhgvthdrtghomheqnecukfhppeekiedrudefgedrgedrgeelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehhvghloheplhhotggrlhhhohhsthdrlhhotggrlhguohhmrghinhdpihhnvghtpeekiedrudefgedrgedrgeelpdhmrghilhhfrhhomhepoehrihgthhgrrhgupggtpghhrghinhgvshessghtihhnthgvrhhnvghtrdgtohhmqedprhgtphhtthhopeeorhhitghhrghruggptggphhgrihhnvghssegsthhinhhtvghrnhgvthdrtghomhequcfqtfevrffvpehrfhgtkedvvdenrhhitghhrghruggptggphhgrihhnvghssegsthhinhhtvghrnhgvthdrtghomhdprhgtphhtthhopeeoshgvlhhinhhugiesvhhgvghrrdhkvghrnhgvlhdrohhrgheq
X-RazorGate-Vade-Verdict: clean 0
X-RazorGate-Vade-Classification: clean
Received: from localhost.localdomain (86.134.4.49) by re-prd-rgout-001.btmx-prd.synchronoss.net (5.8.340) (authenticated as richard_c_haines@btinternet.com)
        id 5E3A147D026697D5; Thu, 20 Feb 2020 15:43:31 +0000
From:   Richard Haines <richard_c_haines@btinternet.com>
To:     selinux@vger.kernel.org
Cc:     Richard Haines <richard_c_haines@btinternet.com>
Subject: [PATCH] selinux-testsuite: Allow nfs test script to close cleanly
Date:   Thu, 20 Feb 2020 15:43:22 +0000
Message-Id: <20200220154322.153644-1-richard_c_haines@btinternet.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Whenever 'make test' fails, close cleanly.

Signed-off-by: Richard Haines <richard_c_haines@btinternet.com>
---
 tools/nfs.sh | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/tools/nfs.sh b/tools/nfs.sh
index 314f898..f99c76b 100755
--- a/tools/nfs.sh
+++ b/tools/nfs.sh
@@ -1,4 +1,16 @@
 #!/bin/sh -e
+
+# If 'make test' fails, close down cleanly
+function err_exit() {
+	popd
+	umount /mnt/selinux-testsuite
+	exportfs -u localhost:$MOUNT
+	rmdir /mnt/selinux-testsuite
+	systemctl stop nfs-server
+}
+
+trap 'err_exit' EXIT
+
 MOUNT=`stat --print %m .`
 TESTDIR=`pwd`
 systemctl start nfs-server
-- 
2.24.1

