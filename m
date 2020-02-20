Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BFEF91660FC
	for <lists+selinux@lfdr.de>; Thu, 20 Feb 2020 16:32:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728051AbgBTPcl (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Thu, 20 Feb 2020 10:32:41 -0500
Received: from mailomta12-sa.btinternet.com ([213.120.69.18]:39064 "EHLO
        sa-prd-fep-048.btinternet.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728305AbgBTPck (ORCPT
        <rfc822;selinux@vger.kernel.org>); Thu, 20 Feb 2020 10:32:40 -0500
Received: from sa-prd-rgout-005.btmx-prd.synchronoss.net ([10.2.38.8])
          by sa-prd-fep-048.btinternet.com with ESMTP
          id <20200220153238.PCVB30845.sa-prd-fep-048.btinternet.com@sa-prd-rgout-005.btmx-prd.synchronoss.net>;
          Thu, 20 Feb 2020 15:32:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=btinternet.com; s=btmx201904; t=1582212758; 
        bh=5CXLuvMkl1KjN89GRtslKsOqMC5vaeDtK1q2ubgMkTs=;
        h=From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version;
        b=QTprMhVCK8JeutE78B8lsU70Ob+dFUuKfCKu0+9eP9GS4n0z3k1L+ElFtQrN0ng4ZDMUOuFCM+Os1vWTF/Uy4b0tkN5dGAiVwOtVPkV17ZvkUD30RKYGoDPsPDP+lhsMzULfA2uhpReWunjcSaMrTP4Sxgh3okIEfl/jRznndEQIHF8anqu6zGmUe48FSMXIHPbFYs4xEwU4wa5ON7tW8/ZTlQEtL0Xr0bScMPA7NoWp7vhnnCd+Q0mUKRMZJOCXlXZJimzF8zQHUlJwEPfTtePXRBDu6R+E2VxeuypgAWbMcL08+8e/xFwkrYGutEOHFegVUacsz4xULQnmckEMVA==
Authentication-Results: btinternet.com; none
X-Originating-IP: [86.134.4.49]
X-OWM-Source-IP: 86.134.4.49 (GB)
X-OWM-Env-Sender: richard_c_haines@btinternet.com
X-VadeSecure-score: verdict=clean score=0/300, class=clean
X-RazorGate-Vade: gggruggvucftvghtrhhoucdtuddrgedugedrkedvgdejlecutefuodetggdotefrodftvfcurfhrohhfihhlvgemuceutffkvffkuffjvffgnffgvefqofdpqfgfvfenuceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomheptfhitghhrghrugcujfgrihhnvghsuceorhhitghhrghruggptggphhgrihhnvghssegsthhinhhtvghrnhgvthdrtghomheqnecukfhppeekiedrudefgedrgedrgeelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehhvghloheplhhotggrlhhhohhsthdrlhhotggrlhguohhmrghinhdpihhnvghtpeekiedrudefgedrgedrgeelpdhmrghilhhfrhhomhepoehrihgthhgrrhgupggtpghhrghinhgvshessghtihhnthgvrhhnvghtrdgtohhmqedprhgtphhtthhopeeouggrrhhrihgtkhdrfihonhhgsehorhgrtghlvgdrtghomheqpdhrtghpthhtohepoehlihhnuhigqdigfhhssehvghgvrhdrkhgvrhhnvghlrdhorhhgqedprhgtphhtthhopeeophgruhhlsehprghulhdqmhhoohhrvgdrtghomheqpdhrtghpthhtohepoehrihgthhgrrhgupggtpghhrghinhgvshessghtihhnthgvrhhnvghtrdgtohhmqecuqfftvefrvfeprhhftgekvddvnehrihgthhgrrhgupggtpghhrghinhgvshessghtihhnthgvrhhnvghtrdgtohhmpdhrtghpthhtohepoehsughssehthigthhhordhnshgrrdhg
        ohhvqedprhgtphhtthhopeeoshgvlhhinhhugiesvhhgvghrrdhkvghrnhgvlhdrohhrgheq
X-RazorGate-Vade-Verdict: clean 0
X-RazorGate-Vade-Classification: clean
Received: from localhost.localdomain (86.134.4.49) by sa-prd-rgout-005.btmx-prd.synchronoss.net (5.8.340) (authenticated as richard_c_haines@btinternet.com)
        id 5E3A290C026B443A; Thu, 20 Feb 2020 15:32:38 +0000
From:   Richard Haines <richard_c_haines@btinternet.com>
To:     darrick.wong@oracle.com, sds@tycho.nsa.gov, paul@paul-moore.com
Cc:     linux-xfs@vger.kernel.org, selinux@vger.kernel.org,
        Richard Haines <richard_c_haines@btinternet.com>
Subject: [PATCH 1/1] selinux: Add xfs quota command types
Date:   Thu, 20 Feb 2020 15:32:34 +0000
Message-Id: <20200220153234.152426-2-richard_c_haines@btinternet.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200220153234.152426-1-richard_c_haines@btinternet.com>
References: <20200220153234.152426-1-richard_c_haines@btinternet.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Add Q_XQUOTAOFF, Q_XQUOTAON and Q_XSETQLIM to trigger filesystem quotamod
permission check.

Add Q_XGETQUOTA, Q_XGETQSTAT, Q_XGETQSTATV and Q_XGETNEXTQUOTA to trigger
filesystem quotaget permission check.

Signed-off-by: Richard Haines <richard_c_haines@btinternet.com>
---
 security/selinux/hooks.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/security/selinux/hooks.c b/security/selinux/hooks.c
index 46a8f3e7d..974228313 100644
--- a/security/selinux/hooks.c
+++ b/security/selinux/hooks.c
@@ -2145,11 +2145,18 @@ static int selinux_quotactl(int cmds, int type, int id, struct super_block *sb)
 	case Q_QUOTAOFF:
 	case Q_SETINFO:
 	case Q_SETQUOTA:
+	case Q_XQUOTAOFF:
+	case Q_XQUOTAON:
+	case Q_XSETQLIM:
 		rc = superblock_has_perm(cred, sb, FILESYSTEM__QUOTAMOD, NULL);
 		break;
 	case Q_GETFMT:
 	case Q_GETINFO:
 	case Q_GETQUOTA:
+	case Q_XGETQUOTA:
+	case Q_XGETQSTAT:
+	case Q_XGETQSTATV:
+	case Q_XGETNEXTQUOTA:
 		rc = superblock_has_perm(cred, sb, FILESYSTEM__QUOTAGET, NULL);
 		break;
 	default:
-- 
2.24.1

