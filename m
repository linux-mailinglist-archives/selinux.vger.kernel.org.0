Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C594122897F
	for <lists+selinux@lfdr.de>; Tue, 21 Jul 2020 21:52:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730959AbgGUTwK (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Tue, 21 Jul 2020 15:52:10 -0400
Received: from agnus.defensec.nl ([80.100.19.56]:56048 "EHLO agnus.defensec.nl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728683AbgGUTwJ (ORCPT <rfc822;selinux@vger.kernel.org>);
        Tue, 21 Jul 2020 15:52:09 -0400
Received: from localhost.localdomain (brutus [IPv6:2001:985:d55d::438])
        by agnus.defensec.nl (Postfix) with ESMTPSA id 7081F2A1007;
        Tue, 21 Jul 2020 21:52:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 agnus.defensec.nl 7081F2A1007
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=defensec.nl;
        s=default; t=1595361127;
        bh=8xJJ3BMDF4KLbRuru91MwjSXTPmPFOzWoHd3wwMbpBs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Q/629TXSBOZnZFkpSocOAgn+TrEA4hw0Uw4dQaooN12CLlbPaKSkKMgw9gx7Fs7oZ
         pIyIxN8s10GBBK1xXJvJW0ugPbTJuj3IYaoqc17x2ANnAOEPRkTHEH3BIyvcTYeiwy
         8a1YJ0zoHEpmxENXDxw0qOcRCEtWyIC5VSw8L8e0=
From:   Dominick Grift <dominick.grift@defensec.nl>
To:     selinux@vger.kernel.org
Cc:     Dominick Grift <dominick.grift@defensec.nl>
Subject: [SELinux-notebook PATCH v7] objects.md: some clarifications
Date:   Tue, 21 Jul 2020 21:51:53 +0200
Message-Id: <20200721195153.1974509-1-dominick.grift@defensec.nl>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <CAEjxPJ4azq2sfyXG4wq8OVbkqcFa3c_UW4HZC1D7TmNa7Eaf9w@mail.gmail.com>
References: <CAEjxPJ4azq2sfyXG4wq8OVbkqcFa3c_UW4HZC1D7TmNa7Eaf9w@mail.gmail.com>
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
v7: copied and pasted feedback from Stephen Smalley

 src/objects.md | 47 +++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 43 insertions(+), 4 deletions(-)

diff --git a/src/objects.md b/src/objects.md
index 58664ef..4f53446 100644
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
-3.  SELinux-aware applications can enforce a new label (with the
-    policies approval of course) using the **libselinux** API
-    functions.
+3.  SELinux-aware applications can assign a new label (with the
+    policy's approval of course) using the **libselinux** API
+    functions. The `process setfscreate` permission can be used to
+    allow subjects to create files with a new label programmatically
+    using the ***setfscreatecon**(3)* function, overriding default
+    rules and transition statements.
 4.  An object manager (OM) can enforce a default label that can either
     be built into the OM or obtained via a configuration file (such as
     those used by
@@ -269,6 +275,39 @@ and manage their transition:
 
 `type_transition`, `role_transition` and `range_transition`
 
+SELinux-aware applications can assign a new label (with the policy's
+approval of course) using the **libselinux** API functions. The
+`process setexec`, `process setkeycreate` and `process setsockcreate`
+access vectors can be used to allow subjects to label processes,
+kernel keyrings, and sockets programmatically using the
+***setexec**(3)*, ***setkeycreatecon**(3)* and
+***setsockcreatecon**(3)* functions respectively, overriding
+transition statements.
+
+The `kernel` **initial security identifier** is used to associate
+a specified label with kernel objects, including kernel threads
+(both those that are created during initialization but also kernel
+threads created later), kernel-private sockets, synthetic objects
+representing kernel resources (e.g. the "system" class).
+
+It is true that processes created prior to initial policy load will
+also be in the kernel SID until/unless there is a policy loaded and
+either a policy-defined transition or an explicit setcon or
+setexeccon+execve, but that's just the typical default inheritance
+from creating task behavior for processes.
+
+The `unlabeled` **initial security identifier** is used
+to associate a specified label with subjects that had their label
+invalidated due to policy changes at runtime.
+
+It is also assigned as the initial state for various objects e.g.
+inodes, superblocks, etc until they reach a point where a more
+specific label can be determined e.g. from an xattr or from policy.
+The context associated with the unlabeled SID is used as the fallback
+context for both subjects and objects when their label is invalidated
+by a policy reload (their SID is unchanged but the SID is
+transparently remapped to the unlabeled context).
+
 ### Object Reuse
 
 As GNU / Linux runs it creates instances of objects and manages the
-- 
2.27.0

