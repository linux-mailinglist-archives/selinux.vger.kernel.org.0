Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5A7426B956
	for <lists+selinux@lfdr.de>; Wed, 16 Sep 2020 03:23:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726312AbgIPBXz (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Tue, 15 Sep 2020 21:23:55 -0400
Received: from mailomta29-sa.btinternet.com ([213.120.69.35]:38077 "EHLO
        sa-prd-fep-043.btinternet.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726023AbgIPBXy (ORCPT
        <rfc822;selinux@vger.kernel.org>); Tue, 15 Sep 2020 21:23:54 -0400
Received: from sa-prd-rgout-003.btmx-prd.synchronoss.net ([10.2.38.6])
          by sa-prd-fep-046.btinternet.com with ESMTP
          id <20200902131747.DQEY4114.sa-prd-fep-046.btinternet.com@sa-prd-rgout-003.btmx-prd.synchronoss.net>;
          Wed, 2 Sep 2020 14:17:47 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=btinternet.com; s=btmx201904; t=1599052667; 
        bh=4H56Ju7m00EEie3KnnXKakippHv7ralv9RWMynRA9Gk=;
        h=From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version;
        b=J0kOAdn4fYkcoNkqUmEgapX4BdFwT80nLlTjqMIWMSHp7xaPeH2iJ8NbH7VH2fZzaK28Ih25NIapLvRmcf22s1US/ncAQBBQxFkr05VwXM6ZRbRh20ctVwitUyim5whWKefENnkK+ZGow5E+0hcNay3VGyuJxvF4tAQZgykqxQ6Ooi5q0zKf2Mi5tIV58bJamISJLCcKi98JKpOkz3taHmZ+gz3F+sM1Y3Y59rq7gNnBk3e7O+P74pwsZsRJJYRQjsL/GO1yAOOwMaecpz7m+mCnOrWGuWs1TI+QMmA5ph+QnwNlb+KOq8lyf/+uR+yZFtZnpw2HcG96yCa1fujG+w==
Authentication-Results: btinternet.com; none
X-Originating-IP: [109.155.32.197]
X-OWM-Source-IP: 109.155.32.197 (GB)
X-OWM-Env-Sender: richard_c_haines@btinternet.com
X-VadeSecure-score: verdict=clean score=0/300, class=clean
X-RazorGate-Vade: gggruggvucftvghtrhhoucdtuddrgeduiedrudefledgieefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuueftkffvkffujffvgffngfevqffopdfqfgfvnecuuegrihhlohhuthemuceftddunecunecujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeftihgthhgrrhguucfjrghinhgvshcuoehrihgthhgrrhgupggtpghhrghinhgvshessghtihhnthgvrhhnvghtrdgtohhmqeenucggtffrrghtthgvrhhnpeeutddtleelheeugefgiefhiedtheeukeffveeitdffgeffieeugeeljeegvefgieenucfkphepuddtledrudehhedrfedvrdduleejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehhvghloheplhhotggrlhhhohhsthdrlhhotggrlhguohhmrghinhdpihhnvghtpedutdelrdduheehrdefvddrudeljedpmhgrihhlfhhrohhmpeeorhhitghhrghruggptggphhgrihhnvghssegsthhinhhtvghrnhgvthdrtghomheqpdhrtghpthhtohepoehprghulhesphgruhhlqdhmohhorhgvrdgtohhmqedprhgtphhtthhopeeorhhitghhrghruggptggphhgrihhnvghssegsthhinhhtvghrnhgvthdrtghomhequcfqtfevrffvpehrfhgtkedvvdenrhhitghhrghruggptggphhgrihhnvghssegsthhinhhtvghrnhgvthdrtghomhdprhgtphhtthhopeeoshgvlhhinhhugiesvhhgvghrrdhkvghrnhgvlhdrohhrgheq
X-RazorGate-Vade-Verdict: clean 0
X-RazorGate-Vade-Classification: clean
X-SNCR-hdrdom: btinternet.com
Received: from localhost.localdomain (109.155.32.197) by sa-prd-rgout-003.btmx-prd.synchronoss.net (5.8.340) (authenticated as richard_c_haines@btinternet.com)
        id 5ED9AFBE0EF36BD1; Wed, 2 Sep 2020 14:17:47 +0100
From:   Richard Haines <richard_c_haines@btinternet.com>
To:     paul@paul-moore.com, selinux@vger.kernel.org
Cc:     Richard Haines <richard_c_haines@btinternet.com>
Subject: [PATCH 08/13] policy_config_statements: Convert to markdown
Date:   Wed,  2 Sep 2020 14:17:33 +0100
Message-Id: <20200902131738.18425-9-richard_c_haines@btinternet.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200902131738.18425-1-richard_c_haines@btinternet.com>
References: <20200902131738.18425-1-richard_c_haines@btinternet.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Convert to markdown

Signed-off-by: Richard Haines <richard_c_haines@btinternet.com>
---
 src/policy_config_statements.md | 54 +++++++++++----------------------
 1 file changed, 18 insertions(+), 36 deletions(-)

diff --git a/src/policy_config_statements.md b/src/policy_config_statements.md
index 156b434..d4eee48 100644
--- a/src/policy_config_statements.md
+++ b/src/policy_config_statements.md
@@ -16,45 +16,27 @@ policycap capability;
 
 **Where:**
 
-<table>
-<tbody>
-<tr>
-<td><code>policycap</code></td>
-<td>The <code>policycap</code> keyword.</td>
-</tr>
-<tr>
-<td><code>capability</code></td>
-<td>A single <code>capability</code> identifier that will be enabled for this policy.</td>
-</tr>
-</tbody>
-</table>
+*policycap*
+
+The *policycap* keyword.
+
+*capability*
+
+A single *capability* identifier that will be enabled for this policy.
 
 **The statement is valid in:**
 
-<table style="text-align:center">
-<tbody>
-<tr style="background-color:#D3D3D3;">
-<td><strong>Monolithic Policy</strong></td>
-<td><strong>Base Policy</strong></td>
-<td><strong>Module Policy</strong></td>
-</tr>
-<tr>
-<td>Yes</td>
-<td>Yes</td>
-<td>No</td>
-</tr>
-<tr style="background-color:#D3D3D3;">
-<td><strong>Conditional Policy <code>if</code> Statement</strong></td>
-<td><strong><code>optional</code> Statement</strong></td>
-<td><strong><code>require</code> Statement</strong></td>
-</tr>
-<tr>
-<td>No</td>
-<td>No</td>
-<td>No</td>
-</tr>
-</tbody>
-</table>
+Policy Type
+
+| Monolithic Policy       | Base Policy             | Module Policy           |
+| ----------------------- | ----------------------- | ----------------------- |
+| Yes                     | Yes                     | No                      |
+
+Conditional Policy Statements
+
+| *if* Statement          | *optional* Statement    | *require* Statement     |
+| ----------------------- | ----------------------- | ----------------------- |
+| No                      | No                      | No                      |
 
 **Example:**
 
-- 
2.26.2

