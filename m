Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C7092250F2
	for <lists+selinux@lfdr.de>; Sun, 19 Jul 2020 11:44:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726021AbgGSJop (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Sun, 19 Jul 2020 05:44:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725988AbgGSJoo (ORCPT
        <rfc822;selinux@vger.kernel.org>); Sun, 19 Jul 2020 05:44:44 -0400
Received: from agnus.defensec.nl (agnus.defensec.nl [IPv6:2001:985:d55d::711])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 39197C0619D2
        for <selinux@vger.kernel.org>; Sun, 19 Jul 2020 02:44:44 -0700 (PDT)
Received: from localhost.localdomain (brutus [IPv6:2001:985:d55d::438])
        by agnus.defensec.nl (Postfix) with ESMTPSA id 6D8F92A1010;
        Sun, 19 Jul 2020 11:44:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 agnus.defensec.nl 6D8F92A1010
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=defensec.nl;
        s=default; t=1595151880;
        bh=WJ5lS06mgFYwXRkh1SSKgVZv9CdJy52isfzGdpcl6Wo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=oZBQFZmksX+l/6uA2L9OeQwX9INdoHh3gAWu7WNdbvVUZu+tbRDYt5v04F/6qtmSh
         SuTDkFDqpSEoyb1IPN7vqSFTfE1PL8k3rYW4vELydWOXWPwBUowotDQj4bKOuPUbGd
         ylN3SlxvSu93KB4TJfs2RJiWCGmYz1B1y72XF5MM=
From:   Dominick Grift <dominick.grift@defensec.nl>
To:     selinux@vger.kernel.org
Cc:     Dominick Grift <dominick.grift@defensec.nl>
Subject: [SELinux-notebook PATCH v6] objects.md: some clarifications
Date:   Sun, 19 Jul 2020 11:44:20 +0200
Message-Id: <20200719094420.1515976-1-dominick.grift@defensec.nl>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <CAHC9VhS1d_=gotE6eau2hmxM+OjujY=u8sMQE10gNKOJ1z87dQ@mail.gmail.com>
References: <CAHC9VhS1d_=gotE6eau2hmxM+OjujY=u8sMQE10gNKOJ1z87dQ@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Elaborate on labeling. Touch on the significance of the default statement, on various av permissions related to labeling using the libselinux API, and on how the kernel and unlabeled initial security identifiers are used to address labeling challenges in special cases such as initialization and failover respectively.

Signed-off-by: Dominick Grift <dominick.grift@defensec.nl>
---
v2: fixes patch description
v3: adding patch description, s/policies/policy's/, split unlabeled and kernel descriptions for clarity
v4: fixes another typo in description and emphasize system initialization a bit
v5: emphasize kernel threads with kernel isid description
v6: forgot to mention defaultuser, can only associate one label with isids

 src/objects.md | 29 ++++++++++++++++++++++++++---
 1 file changed, 26 insertions(+), 3 deletions(-)

diff --git a/src/objects.md b/src/objects.md
index 58664ef..d27f881 100644
--- a/src/objects.md
+++ b/src/objects.md
@@ -110,14 +110,20 @@ objects is managed by the system and generally unseen by the users
 (until labeling goes wrong !!). As processes and objects are created and
 destroyed, they either:
 
-1.  Inherit their labels from the parent process or object.
+1.  Inherit their labels from the parent process or object. The policy
+    default user, type, role and range statements can be used to
+	change the behavior as discussed in the [**Default Rules**](default_rules.md#default-object-rules)
+    section.
 2.  The policy type, role and range transition statements allow a
     different label to be assigned as discussed in the
     [**Domain and Object Transitions**](domain_object_transitions.md#domain-and-object-transitions)
     section.
 3.  SELinux-aware applications can enforce a new label (with the
-    policies approval of course) using the **libselinux** API
-    functions.
+    policy's approval of course) using the **libselinux** API
+    functions. The `process setfscreate` access vector can be used to
+    allow subjects to create files with a new label programmatically
+    using the ***setfscreatecon**(3)* function, overriding default
+    rules and transition statements.
 4.  An object manager (OM) can enforce a default label that can either
     be built into the OM or obtained via a configuration file (such as
     those used by
@@ -269,6 +275,23 @@ and manage their transition:
 
 `type_transition`, `role_transition` and `range_transition`
 
+SELinux-aware applications can enforce a new label (with the policy's
+approval of course) using the **libselinux** API functions. The
+`process setexec`, `process setkeycreate` and `process setsockcreate`
+access vectors can be used to allow subjects to label processes,
+kernel keyrings, and sockets programmatically using the
+***setexec**(3)*, ***setkeycreatecon**(3)* and
+***setsockcreatecon**(3)* functions respectively, overriding
+transition statements.
+
+The `kernel` **initial security identifier** is used to associate
+specified a label with subjects that were left unlabeled due to
+system initialization, for example kernel threads.
+
+The `unlabeled` **initial security identifier** is used
+to associate a specified label with subjects that had their label
+invalidated due to policy changes at runtime.
+
 ### Object Reuse
 
 As GNU / Linux runs it creates instances of objects and manages the
-- 
2.27.0

