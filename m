Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B03D311563
	for <lists+selinux@lfdr.de>; Fri,  5 Feb 2021 23:32:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231587AbhBEW3y (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Fri, 5 Feb 2021 17:29:54 -0500
Received: from mailomta17-sa.btinternet.com ([213.120.69.23]:22810 "EHLO
        sa-prd-fep-045.btinternet.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S232483AbhBEOSi (ORCPT
        <rfc822;selinux@vger.kernel.org>); Fri, 5 Feb 2021 09:18:38 -0500
Received: from sa-prd-rgout-001.btmx-prd.synchronoss.net ([10.2.38.4])
          by sa-prd-fep-048.btinternet.com with ESMTP
          id <20210125132602.EWFG7754.sa-prd-fep-048.btinternet.com@sa-prd-rgout-001.btmx-prd.synchronoss.net>;
          Mon, 25 Jan 2021 13:26:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=btinternet.com; s=btmx201904; t=1611581162; 
        bh=5Q/ZDaq6RSyISgZ8pqQEe7SNeCs4dRKnjD4FQxJGlqM=;
        h=From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version;
        b=mzBOucNarbux3gvLePove8A8jlAaHVBU0MTXbETNYWRJHnoei223Q3klhN6O60YiePXIW09eIy7+0FpNP2+WuacBIEcu1YXenoDfRiyExdnvyxErr19W9ibli/KAqZx7I+8B29AhXmpDKXPtDJXJzlW38ABON/5Za6XjxkUNgos/Grm1BznaIkDDjaDixp8xDi2XMWCKVi1Dp36t6GLkR+7v+bOMjhKzq4WffjQLJz8otKATiSkcGFEv1M7qI7qBUErjB96lkb/mXdS54gnAjnnVK5jR5VBAQe+Xgxpzu0TqUXDsv7lCHAUZvpxpJ0gfaIXfeoAr23jURnKM65Sb+A==
Authentication-Results: btinternet.com;
    auth=pass (PLAIN) smtp.auth=richard_c_haines@btinternet.com
X-SNCR-Rigid: 5ED99EC9244FF912
X-Originating-IP: [217.42.114.247]
X-OWM-Source-IP: 217.42.114.247 (GB)
X-OWM-Env-Sender: richard_c_haines@btinternet.com
X-VadeSecure-score: verdict=clean score=0/300, class=clean
X-RazorGate-Vade: gggruggvucftvghtrhhoucdtuddrgeduledrvdefgdehtdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemuceutffkvffkuffjvffgnffgvefqofdpqfgfvfenuceurghilhhouhhtmecufedtudenucenucfjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomheptfhitghhrghrugcujfgrihhnvghsuceorhhitghhrghruggptggphhgrihhnvghssegsthhinhhtvghrnhgvthdrtghomheqnecuggftrfgrthhtvghrnhepleetffegveevjeehvefhtefgueevudettedutdffvdejkeeiteegheevfeejtdefnecukfhppedvudejrdegvddruddugedrvdegjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhephhgvlhhopehlohgtrghlhhhoshhtrdhlohgtrghlughomhgrihhnpdhinhgvthepvddujedrgedvrdduudegrddvgeejpdhmrghilhhfrhhomhepoehrihgthhgrrhgupggtpghhrghinhgvshessghtihhnthgvrhhnvghtrdgtohhmqedprhgtphhtthhopeeophgruhhlsehprghulhdqmhhoohhrvgdrtghomheqpdhrtghpthhtohepoehrihgthhgrrhgupggtpghhrghinhgvshessghtihhnthgvrhhnvghtrdgtohhmqecuqfftvefrvfeprhhftgekvddvnehrihgthhgrrhgupggtpghhrghinhgvshessghtihhnthgvrhhnvghtrdgtohhmpdhrtghpthhtohepoehsvghlihhnuhigsehvghgvrhdrkhgvrhhnvghlrdhorhhgqe
X-RazorGate-Vade-Verdict: clean 0
X-RazorGate-Vade-Classification: clean
X-SNCR-hdrdom: btinternet.com
Received: from localhost.localdomain (217.42.114.247) by sa-prd-rgout-001.btmx-prd.synchronoss.net (5.8.340) (authenticated as richard_c_haines@btinternet.com)
        id 5ED99EC9244FF912; Mon, 25 Jan 2021 13:26:02 +0000
From:   Richard Haines <richard_c_haines@btinternet.com>
To:     selinux@vger.kernel.org
Cc:     paul@paul-moore.com,
        Richard Haines <richard_c_haines@btinternet.com>
Subject: [PATCH] selinux-notebook: Add policy version 33 requirements
Date:   Mon, 25 Jan 2021 13:25:57 +0000
Message-Id: <20210125132557.12047-1-richard_c_haines@btinternet.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Update types_of_policy.md for policy version 33.

Signed-off-by: Richard Haines <richard_c_haines@btinternet.com>
---
 src/types_of_policy.md | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/src/types_of_policy.md b/src/types_of_policy.md
index b9ae190..8172947 100644
--- a/src/types_of_policy.md
+++ b/src/types_of_policy.md
@@ -373,6 +373,12 @@ will be the intersection of the MLS range of the two contexts.
 See the [**default_range**](default_rules.md#default_range) for details.
 Requires kernel 5.5 minimum.
 
+**Policy: 33**
+
+Implement a more space-efficient form of storing filename transition rules in
+the binary policy (also decreases policy load time). Requires kernel 5.8
+minimum with libsepol version 3.2 minimum.
+
 <!-- %CUTHERE% -->
 
 ---
-- 
2.29.2

