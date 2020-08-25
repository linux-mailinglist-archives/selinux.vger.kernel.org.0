Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1E7D25145D
	for <lists+selinux@lfdr.de>; Tue, 25 Aug 2020 10:38:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726905AbgHYIiQ (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Tue, 25 Aug 2020 04:38:16 -0400
Received: from mailomta12-sa.btinternet.com ([213.120.69.18]:26121 "EHLO
        sa-prd-fep-047.btinternet.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728061AbgHYIiO (ORCPT
        <rfc822;selinux@vger.kernel.org>); Tue, 25 Aug 2020 04:38:14 -0400
Received: from sa-prd-rgout-005.btmx-prd.synchronoss.net ([10.2.38.8])
          by sa-prd-fep-047.btinternet.com with ESMTP
          id <20200825083808.VUFH4609.sa-prd-fep-047.btinternet.com@sa-prd-rgout-005.btmx-prd.synchronoss.net>;
          Tue, 25 Aug 2020 09:38:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=btinternet.com; s=btmx201904; t=1598344688; 
        bh=fC2wyhpHaURkZcuBXZz6alQIM4TXhTCsioaQDwjBlVE=;
        h=From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version;
        b=brk6iQT6Uk1fUXMQ2T9m3alODjj/EBpHp9S8uLJK2WT8QVkkMID8fsuPk4bkn+O6g3UTeyK/WeKVZLbewyDwF8LEfD/x1cfkXYu6PTYp5tNoiY6Y7LtULcnLHjNf7c0uLis4CHDh3d1xakUKvTFXAEg+RqEmowEHpYHjtq1jErcdq71h5hs45GXod/krZZTHj480lO8XrCFI0sUgIVzlw4ueGKpaNwG/gZxiOgn6NztmEcPw5yMOGq+RWdANz5HczrjU8CBALF1TY/PJkMkAw0wqZygkiq6pX5aW5kHwzRSZAoxm9O6aXYp87ibbydc6NGRfrXnptKDmFlPEx//jqg==
Authentication-Results: btinternet.com; none
X-Originating-IP: [109.155.130.160]
X-OWM-Source-IP: 109.155.130.160 (GB)
X-OWM-Env-Sender: richard_c_haines@btinternet.com
X-VadeSecure-score: verdict=clean score=0/300, class=clean
X-RazorGate-Vade: gggruggvucftvghtrhhoucdtuddrgeduiedruddvtddgtdejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuueftkffvkffujffvgffngfevqffopdfqfgfvnecuuegrihhlohhuthemuceftddunecunecujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeftihgthhgrrhguucfjrghinhgvshcuoehrihgthhgrrhgupggtpghhrghinhgvshessghtihhnthgvrhhnvghtrdgtohhmqeenucggtffrrghtthgvrhhnpeeutddtleelheeugefgiefhiedtheeukeffveeitdffgeffieeugeeljeegvefgieenucfkphepuddtledrudehhedrudeftddrudeitdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhephhgvlhhopehlohgtrghlhhhoshhtrdhlohgtrghlughomhgrihhnpdhinhgvthepuddtledrudehhedrudeftddrudeitddpmhgrihhlfhhrohhmpeeorhhitghhrghruggptggphhgrihhnvghssegsthhinhhtvghrnhgvthdrtghomheqpdhrtghpthhtohepoehprghulhesphgruhhlqdhmohhorhgvrdgtohhmqedprhgtphhtthhopeeorhhitghhrghruggptggphhgrihhnvghssegsthhinhhtvghrnhgvthdrtghomhequcfqtfevrffvpehrfhgtkedvvdenrhhitghhrghruggptggphhgrihhnvghssegsthhinhhtvghrnhgvthdrtghomhdprhgtphhtthhopeeoshgvlhhinhhugiesvhhgvghrrdhkvghrnhgvlhdrohhrgheq
X-RazorGate-Vade-Verdict: clean 0
X-RazorGate-Vade-Classification: clean
X-SNCR-hdrdom: btinternet.com
Received: from localhost.localdomain (109.155.130.160) by sa-prd-rgout-005.btmx-prd.synchronoss.net (5.8.340) (authenticated as richard_c_haines@btinternet.com)
        id 5ED9B8A70D599D94; Tue, 25 Aug 2020 09:38:08 +0100
From:   Richard Haines <richard_c_haines@btinternet.com>
To:     paul@paul-moore.com, selinux@vger.kernel.org
Cc:     Richard Haines <richard_c_haines@btinternet.com>
Subject: [PATCH 04/18] bounds_rules: Convert to markdown
Date:   Tue, 25 Aug 2020 09:37:29 +0100
Message-Id: <20200825083743.6508-5-richard_c_haines@btinternet.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200825083743.6508-1-richard_c_haines@btinternet.com>
References: <20200825083743.6508-1-richard_c_haines@btinternet.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Add a TOC to aid navigation and convert to markdown.

Signed-off-by: Richard Haines <richard_c_haines@btinternet.com>
---
 src/bounds_rules.md | 65 +++++++++++++++++----------------------------
 1 file changed, 25 insertions(+), 40 deletions(-)

diff --git a/src/bounds_rules.md b/src/bounds_rules.md
index 55a793a..6def780 100644
--- a/src/bounds_rules.md
+++ b/src/bounds_rules.md
@@ -1,5 +1,7 @@
 # Bounds Rules
 
+- [*typebounds*](#typebounds)
+
 Bounds handling was added in version 24 of the policy and consisted of
 adding *userbounds*, *rolebounds* and *typebounds* information to the
 policy. However only the *typebounds* rule is currently implemented by
@@ -28,49 +30,32 @@ typebounds bounding_domain bounded_domain;
 
 **Where:**
 
-<table>
-<tbody>
-<tr>
-<td><code>typebounds</code></td>
-<td>The <code>typebounds</code> keyword.</td>
-</tr>
-<tr>
-<td><code>bounding_domain</code></td>
-<td>The <code>type</code> or <code>typealias</code> identifier of the parent domain.</td>
-</tr>
-<tr>
-<td><code>bounded_domain</code></td>
-<td>One or more <code>type</code> or <code>typealias</code> identifiers of the child domains. Multiple entries consist of a comma ',' separated list.</td>
-</tr>
-</tbody>
-</table>
+*typebound*
+
+The *typebounds* keyword.
+
+*bounding_domain*
+
+The *type* or *typealias* identifier of the parent domain.
+
+*bounded_domain*
+
+One or more *type* or *typealias* identifiers of the child domains.
+Multiple entries consist of a comma ',' separated list.</td>
 
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
-<td>Yes</td>
-</tr>
-<tr style="background-color:#D3D3D3;">
-<td><strong>Conditional Policy <code>if</code> Statement</strong></td>
-<td><strong><code>optional</code> Statement</strong></td>
-<td><strong><code>require</code> Statement</strong></td>
-</tr>
-<tr>
-<td>No</td>
-<td>Yes</td>
-<td>No</td>
-</tr>
-</tbody>
-</table>
+Policy Type
+
+| Monolithic Policy       | Base Policy             | Module Policy           |
+| ----------------------- | ----------------------- | ----------------------- |
+| Yes                     | Yes                     | Yes                     |
+
+Conditional Policy Statements
+
+| *if* Statement          | *optional* Statement    | *require* Statement     |
+| ----------------------- | ----------------------- | ----------------------- |
+| No                      | Yes                     | No                      |
 
 **Example:**
 
-- 
2.26.2

