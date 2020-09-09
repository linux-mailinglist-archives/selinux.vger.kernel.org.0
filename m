Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C217264F98
	for <lists+selinux@lfdr.de>; Thu, 10 Sep 2020 21:47:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726293AbgIJTrF (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Thu, 10 Sep 2020 15:47:05 -0400
Received: from mailomta17-re.btinternet.com ([213.120.69.110]:57765 "EHLO
        re-prd-fep-045.btinternet.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1731273AbgIJPZ2 (ORCPT
        <rfc822;selinux@vger.kernel.org>); Thu, 10 Sep 2020 11:25:28 -0400
Received: from re-prd-rgout-003.btmx-prd.synchronoss.net ([10.2.54.6])
          by re-prd-fep-045.btinternet.com with ESMTP
          id <20200909133045.LPHP4080.re-prd-fep-045.btinternet.com@re-prd-rgout-003.btmx-prd.synchronoss.net>;
          Wed, 9 Sep 2020 14:30:45 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=btinternet.com; s=btmx201904; t=1599658245; 
        bh=OnkyRBRJw2TQ853ECUwXGINbaynbTZLPvaT+sF02rG4=;
        h=From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version;
        b=sNbvoWhH5V2pbhqfqSxUQ0ubkAIhiBiNiul8TbgSlj6TlqU5A7uFM19dNTNZvy32mEJy0g154LSIA467uLeN26LSMrAdDwV48cge0V3iEctB4zUh1vxWLYQOQyrsu45QE6lobMQeFHJRptIsSFCrpQbsXuL7cKORwUEuaMHCZaluGAzWGEE0kgCN74C4zd8MKJFsr1rp3yjM2khyZYmISaXLGwf2/BfjQ/0Uu9veg0HrIJqLEAoIEwDvnEWRMaKSG8WeQG+Yt2jW1IrH3gdAa3yMfvVtXIb1aSVkl2JDB+CLbH5gToU5lDilOozAL1LS/V4oWOgY89WUQmU0iLpUTg==
Authentication-Results: btinternet.com; none
X-Originating-IP: [86.154.154.133]
X-OWM-Source-IP: 86.154.154.133 (GB)
X-OWM-Env-Sender: richard_c_haines@btinternet.com
X-VadeSecure-score: verdict=clean score=0/300, class=clean
X-RazorGate-Vade: gggruggvucftvghtrhhoucdtuddrgeduiedrudehhedgiedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuueftkffvkffujffvgffngfevqffopdfqfgfvnecuuegrihhlohhuthemuceftddunecunecujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeftihgthhgrrhguucfjrghinhgvshcuoehrihgthhgrrhgupggtpghhrghinhgvshessghtihhnthgvrhhnvghtrdgtohhmqeenucggtffrrghtthgvrhhnpeeutddtleelheeugefgiefhiedtheeukeffveeitdffgeffieeugeeljeegvefgieenucfkphepkeeirdduheegrdduheegrddufeefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehhvghloheplhhotggrlhhhohhsthdrlhhotggrlhguohhmrghinhdpihhnvghtpeekiedrudehgedrudehgedrudeffedpmhgrihhlfhhrohhmpeeorhhitghhrghruggptggphhgrihhnvghssegsthhinhhtvghrnhgvthdrtghomheqpdhrtghpthhtohepoehprghulhesphgruhhlqdhmohhorhgvrdgtohhmqedprhgtphhtthhopeeorhhitghhrghruggptggphhgrihhnvghssegsthhinhhtvghrnhgvthdrtghomhequcfqtfevrffvpehrfhgtkedvvdenrhhitghhrghruggptggphhgrihhnvghssegsthhinhhtvghrnhgvthdrtghomhdprhgtphhtthhopeeoshgvlhhinhhugiesvhhgvghrrdhkvghrnhgvlhdrohhrgheq
X-RazorGate-Vade-Verdict: clean 0
X-RazorGate-Vade-Classification: clean
X-SNCR-hdrdom: btinternet.com
Received: from localhost.localdomain (86.154.154.133) by re-prd-rgout-003.btmx-prd.synchronoss.net (5.8.340) (authenticated as richard_c_haines@btinternet.com)
        id 5ED9C2FD10134DB9; Wed, 9 Sep 2020 14:30:45 +0100
From:   Richard Haines <richard_c_haines@btinternet.com>
To:     paul@paul-moore.com, selinux@vger.kernel.org
Cc:     Richard Haines <richard_c_haines@btinternet.com>
Subject: [PATCH 06/22] postgresql: Tidy up formatting
Date:   Wed,  9 Sep 2020 14:30:23 +0100
Message-Id: <20200909133039.44498-7-richard_c_haines@btinternet.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200909133039.44498-1-richard_c_haines@btinternet.com>
References: <20200909133039.44498-1-richard_c_haines@btinternet.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Signed-off-by: Richard Haines <richard_c_haines@btinternet.com>
---
 src/postgresql.md | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/src/postgresql.md b/src/postgresql.md
index 8e69f3f..595a594 100644
--- a/src/postgresql.md
+++ b/src/postgresql.md
@@ -1,12 +1,12 @@
 # PostgreSQL SELinux Support
 
--   [**sepgsql Overview**](#sepgsql-overview)
--   [**Installing SE-PostgreSQL**](#installing-se-postgresql)
--   [***SECURITY LABEL* SQL Command**](#security-label-sql-command)
--   [**Additional SQL Functions**](#additional-sql-functions)
--   [***postgresql.conf* Entries**](#postgresql.conf-entries)
--   [**Logging Security Events**](#logging-security-events)
--   [**Internal Tables**](#internal-tables)
+- [sepgsql Overview](#sepgsql-overview)
+- [Installing SE-PostgreSQL](#installing-se-postgresql)
+- [*SECURITY LABEL* SQL Command](#security-label-sql-command)
+- [Additional SQL Functions](#additional-sql-functions)
+- [*postgresql.conf* Entries](#postgresql.conf-entries)
+- [Logging Security Events](#logging-security-events)
+- [Internal Tables](#internal-tables)
 
 This section gives an overview of PostgreSQL version 11.x with the
 *sepgsql* extension to support SELinux. It assumes some basic knowledge
@@ -144,14 +144,13 @@ by the *sepgsql.sql* script. If the parameter is NULL, then the default
 The *postgresql.conf* file supports the following additional entries to
 enable and manage SE-PostgreSQL:
 
-1.  This entry is mandatory to enable the *sepgsql* extension to be
-    loaded:
+- This entry is mandatory to enable the *sepgsql* extension to be loaded:
 
 ```
 shared_preload_libraries = 'sepgsql'
 ```
 
-2.  These entries are optional and default to '*off*'.
+- These entries are optional and default to '*off*'.
 
 ```
 # This enables sepgsql to always run in permissive mode:
-- 
2.26.2

