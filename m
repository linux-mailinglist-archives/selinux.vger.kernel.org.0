Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DA8F467909
	for <lists+selinux@lfdr.de>; Fri,  3 Dec 2021 15:05:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1381328AbhLCOI6 (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Fri, 3 Dec 2021 09:08:58 -0500
Received: from mailomta12-sa.btinternet.com ([213.120.69.18]:62660 "EHLO
        sa-prd-fep-048.btinternet.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S240657AbhLCOI5 (ORCPT
        <rfc822;selinux@vger.kernel.org>); Fri, 3 Dec 2021 09:08:57 -0500
Received: from sa-prd-rgout-001.btmx-prd.synchronoss.net ([10.2.38.4])
          by sa-prd-fep-048.btinternet.com with ESMTP
          id <20211203140532.IKNW22188.sa-prd-fep-048.btinternet.com@sa-prd-rgout-001.btmx-prd.synchronoss.net>;
          Fri, 3 Dec 2021 14:05:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=btinternet.com; s=btmx201904; t=1638540332; 
        bh=qrcFIq5Ey4TWkHSFm9kyQSuTvgvQ4mX8/PvQFGcONO8=;
        h=From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version;
        b=gFeCOs/UsX1jqzD3oloLKM4MVfdt4FiFSfqcPKWwQJPX7mPFRmgEbPGWFs+dVFIWmEgoUZ5tG6IZTU6qPfy/+WyLHQUJFpgtGE+K25QARFuIM3M+ZfQH2Ggd9AEok+KyCAZyGeqXr+RgRzDJF6+oZf5qIbXgPYc/JLxXN5p4yZKtNol4SmVCTmftt9R0INvSk9exsEYAY2WDFoTaCB6apIK7SQPznOtQ8VhFMN7xfbADCK+t3iWJgZVbMd4mChiKGiejwKuQ/+ZhlMhcEj6gvC19UQsyF8MEF/yF72MYSGf0dD7+CRNzacUEj4o5LtmptwuI1rJ5joHryvWCe3/+Kw==
Authentication-Results: btinternet.com; none
X-SNCR-Rigid: 613006A90DA0619A
X-Originating-IP: [81.147.31.174]
X-OWM-Source-IP: 81.147.31.174 (GB)
X-OWM-Env-Sender: richard_c_haines@btinternet.com
X-VadeSecure-score: verdict=clean score=0/300, class=clean
X-RazorGate-Vade: gggruggvucftvghtrhhoucdtuddrgedvuddrieejgdeiudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemuceutffkvffkuffjvffgnffgvefqofdpqfgfvfenuceurghilhhouhhtmecufedtudenucenucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomheptfhitghhrghrugcujfgrihhnvghsuceorhhitghhrghruggptggphhgrihhnvghssegsthhinhhtvghrnhgvthdrtghomheqnecuggftrfgrthhtvghrnhepuedttdelleehueeggfeihfeitdehueekffeviedtffegffeiueegleejgeevgfeinecukfhppeekuddrudegjedrfedurddujeegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehhvghloheplhhotggrlhhhohhsthdrlhhotggrlhguohhmrghinhdpihhnvghtpeekuddrudegjedrfedurddujeegpdhmrghilhhfrhhomheprhhitghhrghruggptggphhgrihhnvghssegsthhinhhtvghrnhgvthdrtghomhdprhgtphhtthhopehprghulhesphgruhhlqdhmohhorhgvrdgtohhmpdhrtghpthhtoheprhhitghhrghruggptggphhgrihhnvghssegsthhinhhtvghrnhgvthdrtghomhdprhgtphhtthhopehsvghlihhnuhigsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-RazorGate-Vade-Verdict: clean 0
X-RazorGate-Vade-Classification: clean
X-SNCR-hdrdom: btinternet.com
Received: from localhost.localdomain (81.147.31.174) by sa-prd-rgout-001.btmx-prd.synchronoss.net (5.8.716.04) (authenticated as richard_c_haines@btinternet.com)
        id 613006A90DA0619A; Fri, 3 Dec 2021 14:05:32 +0000
From:   Richard Haines <richard_c_haines@btinternet.com>
To:     selinux@vger.kernel.org
Cc:     paul@paul-moore.com,
        Richard Haines <richard_c_haines@btinternet.com>
Subject: [PATCH 1/7] notebook: Minor formatting fixes
Date:   Fri,  3 Dec 2021 14:05:13 +0000
Message-Id: <20211203140519.30930-2-richard_c_haines@btinternet.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211203140519.30930-1-richard_c_haines@btinternet.com>
References: <20211203140519.30930-1-richard_c_haines@btinternet.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Signed-off-by: Richard Haines <richard_c_haines@btinternet.com>
---
 src/bounds_rules.md                |  2 +-
 src/class_permission_statements.md |  2 +-
 src/libselinux_functions.md        | 14 +++++++-------
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/src/bounds_rules.md b/src/bounds_rules.md
index 6def780..650f817 100644
--- a/src/bounds_rules.md
+++ b/src/bounds_rules.md
@@ -41,7 +41,7 @@ The *type* or *typealias* identifier of the parent domain.
 *bounded_domain*
 
 One or more *type* or *typealias* identifiers of the child domains.
-Multiple entries consist of a comma ',' separated list.</td>
+Multiple entries consist of a comma ',' separated list.
 
 **The statement is valid in:**
 
diff --git a/src/class_permission_statements.md b/src/class_permission_statements.md
index 264e022..63e7262 100644
--- a/src/class_permission_statements.md
+++ b/src/class_permission_statements.md
@@ -160,7 +160,7 @@ A previously declared *common* identifier.
 *perm_set*
 
 One or more optional permission identifiers in a space separated list enclosed
-within braces \'\{\}\'.</td>
+within braces \'\{\}\'.
 
 Note: There must be at least one *common_set* or one *perm_set* defined within
 the statement.
diff --git a/src/libselinux_functions.md b/src/libselinux_functions.md
index b06018a..54b5d70 100644
--- a/src/libselinux_functions.md
+++ b/src/libselinux_functions.md
@@ -167,7 +167,7 @@ The SID mapping is not affected. Return 0 on success, -1 with errno set on error
 Log SID table statistics. Log a message with information about the size and
 distribution of the SID table. The audit callback is used to print the message.
 
-avc_sid_to_context*, *avc_sid_to_context_raw* - *avc.h*
+*avc_sid_to_context*, *avc_sid_to_context_raw* - *avc.h*
 
 Get copy of context corresponding to SID. Return a copy of the security context
 corresponding to the input sid in the memory referenced by *ctx*. The caller is
@@ -522,21 +522,21 @@ only the *scon* domain.
 
 *security_compute_create*, *security_compute_create_raw* - *selinux.h*
 
-Compute a labeling decision and set *newcon to refer to it.
+Compute a labeling decision and set *\*newcon* to refer to it.
 Caller must free via ***freecon**(3)*.
 
 *security_compute_create_name*, *security_compute_create_name_raw* - *selinux.h*
 
-This is identical to* ***security_compute_create**(3)* but also takes the name
+This is identical to ***security_compute_create**(3)* but also takes the name
 of the new object in creation as an argument.
 When a *type_transition* rule on the given class and the *scon* / *tcon* pair
-has an object name extension, *newcon* will be returned according to the policy.
+has an object name extension, *\*newcon* will be returned according to the policy.
 Note that this interface is only supported on the kernels 2.6.40 or later.
 For older kernels the object name is ignored.
 
 *security_compute_member*, *security_compute_member_raw* - *selinux.h*
 
-Compute a polyinstantiation member decision and set *newcon to refer to it.
+Compute a polyinstantiation member decision and set *\*newcon* to refer to it.
 Caller must free via ***freecon**(3)*.
 
 *security_compute_relabel*, *security_compute_relabel_raw* - *selinux.h*
@@ -544,7 +544,7 @@ Caller must free via ***freecon**(3)*.
 Compute a relabeling decision and set *\*newcon* to refer to it.
 Caller must free via ***freecon**(3)*.
 
-*security_compute_user*, security_compute_user_raw* (deprecated) - *selinux.h*
+*security_compute_user*, *security_compute_user_raw* (deprecated) - *selinux.h*
 
 Compute the set of reachable user contexts and set *\*con* to refer to the
 NULL-terminated array of contexts. Caller must free via ***freeconary**(3)*.
@@ -918,7 +918,7 @@ Return path to the securetty_types file under the policy root directory.
 
 *selinux_sepgsql_context_path* - *selinux.h*
 
-*Return path to *sepgsql_context* file under the policy root directory.
+Return path to *sepgsql_context* file under the policy root directory.
 
 *selinux_set_callback* - *selinux.h*
 
-- 
2.33.1

