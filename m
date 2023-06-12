Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4380472CB69
	for <lists+selinux@lfdr.de>; Mon, 12 Jun 2023 18:23:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235962AbjFLQW7 (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Mon, 12 Jun 2023 12:22:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235956AbjFLQW5 (ORCPT
        <rfc822;selinux@vger.kernel.org>); Mon, 12 Jun 2023 12:22:57 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11D78F9
        for <selinux@vger.kernel.org>; Mon, 12 Jun 2023 09:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686586929;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=fTS/zV/pfN0ZHan78e3/OJ2Ilki65DRYltH26Czlcaw=;
        b=KBdAX+pbOOjUqZLzF8eXSjVmPRmoprI8w1rc967r6VqH+vP55Ge35Xs1vltfZu00z0r05c
        zkeYowItwA8lsu+uWKAr8vRO6tvu7U5BdS+OgLnkd/+MQrnHk0kuq6lXl5RT91W+9rIFVI
        6I5hLY0qBgyKiTKGKXHNN28hIcfRvcY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-398-lULtG1EYNcysbUvYjYgEkA-1; Mon, 12 Jun 2023 12:22:06 -0400
X-MC-Unique: lULtG1EYNcysbUvYjYgEkA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8A47F811E7F
        for <selinux@vger.kernel.org>; Mon, 12 Jun 2023 16:22:06 +0000 (UTC)
Received: from P1.redhat.com (unknown [10.45.226.81])
        by smtp.corp.redhat.com (Postfix) with ESMTP id C272320234B3;
        Mon, 12 Jun 2023 16:22:05 +0000 (UTC)
From:   Petr Lautrbach <lautrbach@redhat.com>
To:     selinux@vger.kernel.org
Cc:     vmojzis@redhat.com, Petr Lautrbach <lautrbach@redhat.com>
Subject: [PATCH v2 4/4] python: update python.pot
Date:   Mon, 12 Jun 2023 18:21:16 +0200
Message-ID: <20230612162155.2604483-5-lautrbach@redhat.com>
In-Reply-To: <20230612162155.2604483-1-lautrbach@redhat.com>
References: <ef52fcda-2eaa-ee5b-9325-b5d3d753820f@redhat.com>
 <20230612162155.2604483-1-lautrbach@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,WEIRD_PORT autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Signed-off-by: Petr Lautrbach <lautrbach@redhat.com>
---
 python/po/python.pot | 963 ++++++++++++++++++++++---------------------
 1 file changed, 487 insertions(+), 476 deletions(-)

diff --git a/python/po/python.pot b/python/po/python.pot
index 16d04eb0f18e..435a1b764e34 100644
--- a/python/po/python.pot
+++ b/python/po/python.pot
@@ -8,7 +8,7 @@ msgid ""
 msgstr ""
 "Project-Id-Version: PACKAGE VERSION\n"
 "Report-Msgid-Bugs-To: \n"
-"POT-Creation-Date: 2023-01-18 11:57+0100\n"
+"POT-Creation-Date: 2023-06-12 18:13+0200\n"
 "PO-Revision-Date: YEAR-MO-DA HO:MI+ZONE\n"
 "Last-Translator: FULL NAME <EMAIL@ADDRESS>\n"
 "Language-Team: LANGUAGE <LL@li.org>\n"
@@ -17,17 +17,12 @@ msgstr ""
 "Content-Type: text/plain; charset=UTF-8\n"
 "Content-Transfer-Encoding: 8bit\n"
 
-#: ../audit2allow/audit2allow:239
-msgid "******************** IMPORTANT ***********************\n"
+#: ../audit2allow/audit2allow:244
+msgid "IMPORTANT"
 msgstr ""
 
-#: ../audit2allow/audit2allow:240
-#, python-format
-msgid ""
-"To make this policy package active, execute:\n"
-"\n"
-"semodule -i %s\n"
-"\n"
+#: ../audit2allow/audit2allow:245
+msgid "To make this policy package active, execute:"
 msgstr ""
 
 #: ../chcat/chcat:111 ../chcat/chcat:191
@@ -40,13 +35,13 @@ msgid "Can not modify sensitivity levels using '+' on %s"
 msgstr ""
 
 #: ../chcat/chcat:128
-#, python-format
-msgid "%s is already in %s"
+#, python-brace-format
+msgid "{target} is already in {category}"
 msgstr ""
 
 #: ../chcat/chcat:210 ../chcat/chcat:220
-#, python-format
-msgid "%s is not in %s"
+#, python-brace-format
+msgid "{target} is not in {category}"
 msgstr ""
 
 #: ../chcat/chcat:291 ../chcat/chcat:296
@@ -152,218 +147,222 @@ msgstr ""
 
 #: ../semanage/semanage:242
 msgid ""
-"\n"
-"MLS/MCS Security Range (MLS/MCS Systems only)\n"
-"SELinux Range  for SELinux login mapping\n"
-"defaults to the SELinux user record range.\n"
-"SELinux Range for SELinux user defaults to s0.\n"
+"MLS/MCS Security Range (MLS/MCS Systems only) SELinux Range for SELinux "
+"login mapping defaults to the SELinux user record range. SELinux Range for "
+"SELinux user defaults to s0."
 msgstr ""
 
-#: ../semanage/semanage:251
+#: ../semanage/semanage:249
 msgid ""
-"\n"
-"    Protocol  for  the specified port (tcp|udp|dccp|sctp) or internet "
-"protocol\n"
-"    version for the specified node (ipv4|ipv6).\n"
+"Protocol for the specified port (tcp|udp|dccp|sctp) or internet protocol "
+"version for the specified node (ipv4|ipv6)."
 msgstr ""
 
-#: ../semanage/semanage:257
-msgid ""
-"\n"
-"    Subnet prefix for  the specified infiniband ibpkey.\n"
+#: ../semanage/semanage:253
+msgid "Subnet prefix for  the specified infiniband ibpkey."
 msgstr ""
 
-#: ../semanage/semanage:262
-msgid ""
-"\n"
-"    Name for the specified infiniband end port.\n"
+#: ../semanage/semanage:256
+msgid "Name for the specified infiniband end port."
 msgstr ""
 
-#: ../semanage/semanage:267
+#: ../semanage/semanage:259
 #, python-format
 msgid "Modify a record of the %s object type"
 msgstr ""
 
-#: ../semanage/semanage:271
+#: ../semanage/semanage:263
 #, python-format
 msgid "List records of the %s object type"
 msgstr ""
 
-#: ../semanage/semanage:275
+#: ../semanage/semanage:267
 #, python-format
 msgid "Delete a record of the %s object type"
 msgstr ""
 
-#: ../semanage/semanage:279
+#: ../semanage/semanage:271
 msgid "Extract customizable commands, for use within a transaction"
 msgstr ""
 
-#: ../semanage/semanage:283
+#: ../semanage/semanage:275
 #, python-format
 msgid "Remove all %s objects local customizations"
 msgstr ""
 
-#: ../semanage/semanage:287
+#: ../semanage/semanage:279
 msgid "SELinux user name"
 msgstr ""
 
-#: ../semanage/semanage:292
+#: ../semanage/semanage:284
 msgid "Manage login mappings between linux users and SELinux confined users"
 msgstr ""
 
-#: ../semanage/semanage:309
+#: ../semanage/semanage:301
 #, python-format
 msgid "login_name | %%groupname"
 msgstr ""
 
-#: ../semanage/semanage:361
+#: ../semanage/semanage:344
 msgid "Manage file context mapping definitions"
 msgstr ""
 
-#: ../semanage/semanage:375
+#: ../semanage/semanage:359
+msgid ""
+"Substitute target path with sourcepath when generating default label. This "
+"is used with fcontext. Requires source and target path arguments. The "
+"context labeling for the target subtree is made equivalent to that defined "
+"for the source."
+msgstr ""
+
+#: ../semanage/semanage:363
 msgid ""
-"Substitute  target  path with sourcepath when generating default\n"
-"                                                                  label.  "
-"This is used with fcontext. Requires source  and  target\n"
-"                                                                  path  "
-"arguments.  The context labeling for the target subtree is\n"
-"                                                                  made "
-"equivalent to that defined for the source."
+"File Type. This is used with fcontext. Requires a file type as shown in the "
+"mode field by ls, e.g. use d to match only directories or f to match only "
+"regular files. The following file type options can be passed: f (regular "
+"file), d (directory), c (character device), b (block device), s (socket), l "
+"(symbolic link), p (named pipe). If you do not specify a file type, the file "
+"type will default to \"all files\"."
 msgstr ""
 
-#: ../semanage/semanage:383
+#: ../semanage/semanage:371
 msgid ""
 "Path to be labeled (may be in the form of a Perl compatible regular "
 "expression)"
 msgstr ""
 
-#: ../semanage/semanage:411
+#: ../semanage/semanage:399
 msgid "Manage SELinux confined users (Roles and levels for an SELinux user)"
 msgstr ""
 
-#: ../semanage/semanage:429
+#: ../semanage/semanage:417
 msgid ""
-"\n"
-"SELinux Roles.  You must enclose multiple roles within quotes, separate by "
-"spaces. Or specify -R multiple times.\n"
+"SELinux Roles. You must enclose multiple roles within quotes, separate by "
+"spaces. Or specify -R multiple times."
 msgstr ""
 
-#: ../semanage/semanage:433
+#: ../semanage/semanage:419
 msgid "selinux_name"
 msgstr ""
 
-#: ../semanage/semanage:461
+#: ../semanage/semanage:447
 msgid "Manage network port type definitions"
 msgstr ""
 
-#: ../semanage/semanage:477
+#: ../semanage/semanage:463
 msgid "port | port_range"
 msgstr ""
 
-#: ../semanage/semanage:506
+#: ../semanage/semanage:492
 msgid "Manage infiniband ibpkey type definitions"
 msgstr ""
 
-#: ../semanage/semanage:522
+#: ../semanage/semanage:508
 msgid "pkey | pkey_range"
 msgstr ""
 
-#: ../semanage/semanage:549
+#: ../semanage/semanage:535
 msgid "Manage infiniband end port type definitions"
 msgstr ""
 
-#: ../semanage/semanage:565
+#: ../semanage/semanage:551
 msgid "ibendport"
 msgstr ""
 
-#: ../semanage/semanage:592
+#: ../semanage/semanage:578
 msgid "Manage network interface type definitions"
 msgstr ""
 
-#: ../semanage/semanage:607
+#: ../semanage/semanage:593
 msgid "interface_spec"
 msgstr ""
 
-#: ../semanage/semanage:631
+#: ../semanage/semanage:617
 msgid "Manage SELinux policy modules"
 msgstr ""
 
-#: ../semanage/semanage:642
+#: ../semanage/semanage:628
 msgid "Add a module"
 msgstr ""
 
-#: ../semanage/semanage:643
+#: ../semanage/semanage:629
 msgid "Remove a module"
 msgstr ""
 
-#: ../semanage/semanage:644
+#: ../semanage/semanage:630
 msgid "Disable a module"
 msgstr ""
 
-#: ../semanage/semanage:645
+#: ../semanage/semanage:631
 msgid "Enable a module"
 msgstr ""
 
-#: ../semanage/semanage:672
+#: ../semanage/semanage:658
 msgid "Manage network node type definitions"
 msgstr ""
 
-#: ../semanage/semanage:686
+#: ../semanage/semanage:672
 msgid "Network Mask"
 msgstr ""
 
-#: ../semanage/semanage:690
+#: ../semanage/semanage:676
 msgid "node"
 msgstr ""
 
-#: ../semanage/semanage:715
+#: ../semanage/semanage:701
 msgid "Manage booleans to selectively enable functionality"
 msgstr ""
 
-#: ../semanage/semanage:720
+#: ../semanage/semanage:706
 msgid "boolean"
 msgstr ""
 
-#: ../semanage/semanage:730
+#: ../semanage/semanage:716
 msgid "Enable the boolean"
 msgstr ""
 
-#: ../semanage/semanage:731
+#: ../semanage/semanage:717
 msgid "Disable the boolean"
 msgstr ""
 
-#: ../semanage/semanage:752
+#: ../semanage/semanage:738
 msgid "semanage permissive: error: the following argument is required: type\n"
 msgstr ""
 
-#: ../semanage/semanage:756
+#: ../semanage/semanage:742
 msgid "Manage process type enforcement mode"
 msgstr ""
 
-#: ../semanage/semanage:768 ../semanage/seobject.py:2677
+#: ../semanage/semanage:754 ../semanage/seobject.py:2672
 msgid "type"
 msgstr ""
 
-#: ../semanage/semanage:779
+#: ../semanage/semanage:765
 msgid "Disable/Enable dontaudit rules in policy"
 msgstr ""
 
-#: ../semanage/semanage:799
+#: ../semanage/semanage:785
 msgid "Output local customizations"
 msgstr ""
 
-#: ../semanage/semanage:801
+#: ../semanage/semanage:787
 msgid "Output file"
 msgstr ""
 
-#: ../semanage/semanage:894
+#: ../semanage/semanage:880
 msgid "Import local customizations"
 msgstr ""
 
-#: ../semanage/semanage:897
+#: ../semanage/semanage:883
 msgid "Input file"
 msgstr ""
 
+#: ../semanage/semanage:891
+msgid ""
+"semanage is used to configure certain elements of SELinux policy with-out "
+"requiring modification or recompilation from policy source."
+msgstr ""
+
 #: ../semanage/seobject.py:279
 msgid "Could not create semanage handle"
 msgstr ""
@@ -485,123 +484,115 @@ msgstr ""
 msgid "Customized Permissive Types"
 msgstr ""
 
-#: ../semanage/seobject.py:510
-msgid ""
-"The sepolgen python module is required to setup permissive domains.\n"
-"In some distributions it is included in the policycoreutils-devel package.\n"
-"# yum install policycoreutils-devel\n"
-"Or similar for your distro."
-msgstr ""
-
-#: ../semanage/seobject.py:520
+#: ../semanage/seobject.py:515
 #, python-format
 msgid "Could not set permissive domain %s (module installation failed)"
 msgstr ""
 
-#: ../semanage/seobject.py:526
+#: ../semanage/seobject.py:521
 #, python-format
 msgid "Could not remove permissive domain %s (remove failed)"
 msgstr ""
 
-#: ../semanage/seobject.py:563 ../semanage/seobject.py:633
-#: ../semanage/seobject.py:678 ../semanage/seobject.py:797
-#: ../semanage/seobject.py:827 ../semanage/seobject.py:892
-#: ../semanage/seobject.py:948 ../semanage/seobject.py:1226
-#: ../semanage/seobject.py:1492 ../semanage/seobject.py:2502
-#: ../semanage/seobject.py:2575 ../semanage/seobject.py:2599
-#: ../semanage/seobject.py:2730 ../semanage/seobject.py:2781
+#: ../semanage/seobject.py:558 ../semanage/seobject.py:628
+#: ../semanage/seobject.py:673 ../semanage/seobject.py:792
+#: ../semanage/seobject.py:822 ../semanage/seobject.py:887
+#: ../semanage/seobject.py:943 ../semanage/seobject.py:1221
+#: ../semanage/seobject.py:1487 ../semanage/seobject.py:2497
+#: ../semanage/seobject.py:2570 ../semanage/seobject.py:2594
+#: ../semanage/seobject.py:2725 ../semanage/seobject.py:2776
 #, python-format
 msgid "Could not create a key for %s"
 msgstr ""
 
-#: ../semanage/seobject.py:567 ../semanage/seobject.py:637
-#: ../semanage/seobject.py:682 ../semanage/seobject.py:688
+#: ../semanage/seobject.py:562 ../semanage/seobject.py:632
+#: ../semanage/seobject.py:677 ../semanage/seobject.py:683
 #, python-format
 msgid "Could not check if login mapping for %s is defined"
 msgstr ""
 
-#: ../semanage/seobject.py:569
+#: ../semanage/seobject.py:564
 #, python-format
 msgid "Login mapping for %s is already defined"
 msgstr ""
 
-#: ../semanage/seobject.py:574
+#: ../semanage/seobject.py:569
 #, python-format
 msgid "Linux Group %s does not exist"
 msgstr ""
 
-#: ../semanage/seobject.py:579
+#: ../semanage/seobject.py:574
 #, python-format
 msgid "Linux User %s does not exist"
 msgstr ""
 
-#: ../semanage/seobject.py:583
+#: ../semanage/seobject.py:578
 #, python-format
 msgid "Could not create login mapping for %s"
 msgstr ""
 
-#: ../semanage/seobject.py:587 ../semanage/seobject.py:841
+#: ../semanage/seobject.py:582 ../semanage/seobject.py:836
 #, python-format
 msgid "Could not set name for %s"
 msgstr ""
 
-#: ../semanage/seobject.py:592 ../semanage/seobject.py:851
+#: ../semanage/seobject.py:587 ../semanage/seobject.py:846
 #, python-format
 msgid "Could not set MLS range for %s"
 msgstr ""
 
-#: ../semanage/seobject.py:596
+#: ../semanage/seobject.py:591
 #, python-format
 msgid "Could not set SELinux user for %s"
 msgstr ""
 
-#: ../semanage/seobject.py:600
+#: ../semanage/seobject.py:595
 #, python-format
 msgid "Could not add login mapping for %s"
 msgstr ""
 
-#: ../semanage/seobject.py:616
+#: ../semanage/seobject.py:611
 msgid "Requires seuser or serange"
 msgstr ""
 
-#: ../semanage/seobject.py:639 ../semanage/seobject.py:684
+#: ../semanage/seobject.py:634 ../semanage/seobject.py:679
 #, python-format
 msgid "Login mapping for %s is not defined"
 msgstr ""
 
-#: ../semanage/seobject.py:643
+#: ../semanage/seobject.py:638
 #, python-format
 msgid "Could not query seuser for %s"
 msgstr ""
 
-#: ../semanage/seobject.py:658
+#: ../semanage/seobject.py:653
 #, python-format
 msgid "Could not modify login mapping for %s"
 msgstr ""
 
-#: ../semanage/seobject.py:690
+#: ../semanage/seobject.py:685
 #, python-format
 msgid "Login mapping for %s is defined in policy, cannot be deleted"
 msgstr ""
 
-#: ../semanage/seobject.py:694
+#: ../semanage/seobject.py:689
 #, python-format
 msgid "Could not delete login mapping for %s"
 msgstr ""
 
-#: ../semanage/seobject.py:713 ../semanage/seobject.py:745
-#: ../semanage/seobject.py:991
+#: ../semanage/seobject.py:708 ../semanage/seobject.py:740
+#: ../semanage/seobject.py:986
 msgid "Could not list login mappings"
 msgstr ""
 
-#: ../semanage/seobject.py:772 ../semanage/seobject.py:784
+#: ../semanage/seobject.py:767 ../semanage/seobject.py:779
 #: ../sepolicy/sepolicy/sepolicy.glade:1156
 #: ../sepolicy/sepolicy/sepolicy.glade:3138
 msgid "Login Name"
 msgstr ""
 
-#: ../semanage/seobject.py:772 ../semanage/seobject.py:784
-#: ../semanage/seobject.py:1041 ../semanage/seobject.py:1046
+#: ../semanage/seobject.py:767 ../semanage/seobject.py:779
+#: ../semanage/seobject.py:1036 ../semanage/seobject.py:1041
 #: ../sepolicy/sepolicy/sepolicy.glade:1182
 #: ../sepolicy/sepolicy/sepolicy.glade:3156
 #: ../sepolicy/sepolicy/sepolicy.glade:3242
@@ -609,938 +600,958 @@ msgstr ""
 msgid "SELinux User"
 msgstr ""
 
-#: ../semanage/seobject.py:772
+#: ../semanage/seobject.py:767
 msgid "MLS/MCS Range"
 msgstr ""
 
-#: ../semanage/seobject.py:772
+#: ../semanage/seobject.py:767
 msgid "Service"
 msgstr ""
 
-#: ../semanage/seobject.py:800 ../semanage/seobject.py:831
-#: ../semanage/seobject.py:896 ../semanage/seobject.py:952
-#: ../semanage/seobject.py:958
+#: ../semanage/seobject.py:795 ../semanage/seobject.py:826
+#: ../semanage/seobject.py:891 ../semanage/seobject.py:947
+#: ../semanage/seobject.py:953
 #, python-format
 msgid "Could not check if SELinux user %s is defined"
 msgstr ""
 
-#: ../semanage/seobject.py:803 ../semanage/seobject.py:902
-#: ../semanage/seobject.py:964
+#: ../semanage/seobject.py:798 ../semanage/seobject.py:897
+#: ../semanage/seobject.py:959
 #, python-format
 msgid "Could not query user for %s"
 msgstr ""
 
-#: ../semanage/seobject.py:823
+#: ../semanage/seobject.py:818
 #, python-format
 msgid "You must add at least one role for %s"
 msgstr ""
 
-#: ../semanage/seobject.py:833
+#: ../semanage/seobject.py:828
 #, python-format
 msgid "SELinux user %s is already defined"
 msgstr ""
 
-#: ../semanage/seobject.py:837
+#: ../semanage/seobject.py:832
 #, python-format
 msgid "Could not create SELinux user for %s"
 msgstr ""
 
-#: ../semanage/seobject.py:846
-#, python-format
-msgid "Could not add role %s for %s"
+#: ../semanage/seobject.py:841
+#, python-brace-format
+msgid "Could not add role {role} for {name}"
 msgstr ""
 
-#: ../semanage/seobject.py:855
+#: ../semanage/seobject.py:850
 #, python-format
 msgid "Could not set MLS level for %s"
 msgstr ""
 
-#: ../semanage/seobject.py:858
-#, python-format
-msgid "Could not add prefix %s for %s"
+#: ../semanage/seobject.py:853
+#, python-brace-format
+msgid "Could not add prefix {prefix} for {role}"
 msgstr ""
 
-#: ../semanage/seobject.py:861
+#: ../semanage/seobject.py:856
 #, python-format
 msgid "Could not extract key for %s"
 msgstr ""
 
-#: ../semanage/seobject.py:865
+#: ../semanage/seobject.py:860
 #, python-format
 msgid "Could not add SELinux user %s"
 msgstr ""
 
-#: ../semanage/seobject.py:886
+#: ../semanage/seobject.py:881
 msgid "Requires prefix, roles, level or range"
 msgstr ""
 
-#: ../semanage/seobject.py:888
+#: ../semanage/seobject.py:883
 msgid "Requires prefix or roles"
 msgstr ""
 
-#: ../semanage/seobject.py:898 ../semanage/seobject.py:954
+#: ../semanage/seobject.py:893 ../semanage/seobject.py:949
 #, python-format
 msgid "SELinux user %s is not defined"
 msgstr ""
 
-#: ../semanage/seobject.py:927
+#: ../semanage/seobject.py:922
 #, python-format
 msgid "Could not modify SELinux user %s"
 msgstr ""
 
-#: ../semanage/seobject.py:960
+#: ../semanage/seobject.py:955
 #, python-format
 msgid "SELinux user %s is defined in policy, cannot be deleted"
 msgstr ""
 
-#: ../semanage/seobject.py:971
+#: ../semanage/seobject.py:966
 #, python-format
 msgid "Could not delete SELinux user %s"
 msgstr ""
 
-#: ../semanage/seobject.py:1009
+#: ../semanage/seobject.py:1004
 msgid "Could not list SELinux users"
 msgstr ""
 
-#: ../semanage/seobject.py:1015
+#: ../semanage/seobject.py:1010
 #, python-format
 msgid "Could not list roles for user %s"
 msgstr ""
 
-#: ../semanage/seobject.py:1040
+#: ../semanage/seobject.py:1035
 msgid "Labeling"
 msgstr ""
 
-#: ../semanage/seobject.py:1040
+#: ../semanage/seobject.py:1035
 msgid "MLS/"
 msgstr ""
 
-#: ../semanage/seobject.py:1041
+#: ../semanage/seobject.py:1036
 msgid "Prefix"
 msgstr ""
 
-#: ../semanage/seobject.py:1041
+#: ../semanage/seobject.py:1036
 msgid "MCS Level"
 msgstr ""
 
-#: ../semanage/seobject.py:1041
+#: ../semanage/seobject.py:1036
 msgid "MCS Range"
 msgstr ""
 
-#: ../semanage/seobject.py:1041 ../semanage/seobject.py:1046
+#: ../semanage/seobject.py:1036 ../semanage/seobject.py:1041
 #: ../sepolicy/sepolicy/sepolicy.glade:3262
 #: ../sepolicy/sepolicy/sepolicy.glade:5233
 #: ../sepolicy/sepolicy/sepolicy.glade:5382
 msgid "SELinux Roles"
 msgstr ""
 
-#: ../semanage/seobject.py:1071
+#: ../semanage/seobject.py:1066
 msgid "Protocol has to be one of udp, tcp, dccp or sctp"
 msgstr ""
 
-#: ../semanage/seobject.py:1073
+#: ../semanage/seobject.py:1068
 msgid "Port is required"
 msgstr ""
 
-#: ../semanage/seobject.py:1087
+#: ../semanage/seobject.py:1082
 msgid "Invalid Port"
 msgstr ""
 
-#: ../semanage/seobject.py:1091 ../semanage/seobject.py:1365
-#, python-format
-msgid "Could not create a key for %s/%s"
+#: ../semanage/seobject.py:1086
+#, python-brace-format
+msgid "Could not create a key for {proto}/{port}"
 msgstr ""
 
-#: ../semanage/seobject.py:1102 ../semanage/seobject.py:1376
-#: ../semanage/seobject.py:1631
+#: ../semanage/seobject.py:1097 ../semanage/seobject.py:1371
+#: ../semanage/seobject.py:1626
 msgid "Type is required"
 msgstr ""
 
-#: ../semanage/seobject.py:1107 ../semanage/seobject.py:1172
+#: ../semanage/seobject.py:1102 ../semanage/seobject.py:1167
 #, python-format
 msgid "Type %s is invalid, must be a port type"
 msgstr ""
 
-#: ../semanage/seobject.py:1113 ../semanage/seobject.py:1178
-#: ../semanage/seobject.py:1244 ../semanage/seobject.py:1250
-#, python-format
-msgid "Could not check if port %s/%s is defined"
+#: ../semanage/seobject.py:1108 ../semanage/seobject.py:1173
+#: ../semanage/seobject.py:1239 ../semanage/seobject.py:1245
+#, python-brace-format
+msgid "Could not check if port {proto}/{port} is defined"
 msgstr ""
 
-#: ../semanage/seobject.py:1115
-#, python-format
-msgid "Port %s/%s already defined"
+#: ../semanage/seobject.py:1110
+#, python-brace-format
+msgid "Port {proto}/{port} already defined"
 msgstr ""
 
-#: ../semanage/seobject.py:1119
-#, python-format
-msgid "Could not create port for %s/%s"
+#: ../semanage/seobject.py:1114
+#, python-brace-format
+msgid "Could not create port for {proto}/{port}"
 msgstr ""
 
-#: ../semanage/seobject.py:1125 ../semanage/seobject.py:1399
-#: ../semanage/seobject.py:1653
-#, python-format
-msgid "Could not create context for %s/%s"
+#: ../semanage/seobject.py:1120
+#, python-brace-format
+msgid "Could not create context for {proto}/{port}"
 msgstr ""
 
-#: ../semanage/seobject.py:1129
-#, python-format
-msgid "Could not set user in port context for %s/%s"
+#: ../semanage/seobject.py:1124
+#, python-brace-format
+msgid "Could not set user in port context for {proto}/{port}"
 msgstr ""
 
-#: ../semanage/seobject.py:1133
-#, python-format
-msgid "Could not set role in port context for %s/%s"
+#: ../semanage/seobject.py:1128
+#, python-brace-format
+msgid "Could not set role in port context for {proto}/{port}"
 msgstr ""
 
-#: ../semanage/seobject.py:1137
-#, python-format
-msgid "Could not set type in port context for %s/%s"
+#: ../semanage/seobject.py:1132
+#, python-brace-format
+msgid "Could not set type in port context for {proto}/{port}"
 msgstr ""
 
-#: ../semanage/seobject.py:1142
-#, python-format
-msgid "Could not set mls fields in port context for %s/%s"
+#: ../semanage/seobject.py:1137
+#, python-brace-format
+msgid "Could not set mls fields in port context for {proto}/{port}"
 msgstr ""
 
-#: ../semanage/seobject.py:1146
-#, python-format
-msgid "Could not set port context for %s/%s"
+#: ../semanage/seobject.py:1141
+#, python-brace-format
+msgid "Could not set port context for {proto}/{port}"
 msgstr ""
 
-#: ../semanage/seobject.py:1150
-#, python-format
-msgid "Could not add port %s/%s"
+#: ../semanage/seobject.py:1145
+#, python-brace-format
+msgid "Could not add port {proto}/{port}"
 msgstr ""
 
-#: ../semanage/seobject.py:1166 ../semanage/seobject.py:1438
-#: ../semanage/seobject.py:1692 ../semanage/seobject.py:1970
-#: ../semanage/seobject.py:2176
+#: ../semanage/seobject.py:1161 ../semanage/seobject.py:1433
+#: ../semanage/seobject.py:1687 ../semanage/seobject.py:1965
+#: ../semanage/seobject.py:2171
 msgid "Requires setype or serange"
 msgstr ""
 
-#: ../semanage/seobject.py:1168 ../semanage/seobject.py:1440
-#: ../semanage/seobject.py:1694
+#: ../semanage/seobject.py:1163 ../semanage/seobject.py:1435
+#: ../semanage/seobject.py:1689
 msgid "Requires setype"
 msgstr ""
 
-#: ../semanage/seobject.py:1180 ../semanage/seobject.py:1246
-#, python-format
-msgid "Port %s/%s is not defined"
+#: ../semanage/seobject.py:1175 ../semanage/seobject.py:1241
+#, python-brace-format
+msgid "Port {proto}/{port} is not defined"
 msgstr ""
 
-#: ../semanage/seobject.py:1184
-#, python-format
-msgid "Could not query port %s/%s"
+#: ../semanage/seobject.py:1179
+#, python-brace-format
+msgid "Could not query port {proto}/{port}"
 msgstr ""
 
-#: ../semanage/seobject.py:1198
-#, python-format
-msgid "Could not modify port %s/%s"
+#: ../semanage/seobject.py:1193
+#, python-brace-format
+msgid "Could not modify port {proto}/{port}"
 msgstr ""
 
-#: ../semanage/seobject.py:1213
+#: ../semanage/seobject.py:1208
 msgid "Could not list the ports"
 msgstr ""
 
-#: ../semanage/seobject.py:1230
+#: ../semanage/seobject.py:1225
 #, python-format
 msgid "Could not delete the port %s"
 msgstr ""
 
-#: ../semanage/seobject.py:1252
-#, python-format
-msgid "Port %s/%s is defined in policy, cannot be deleted"
+#: ../semanage/seobject.py:1247
+#, python-brace-format
+msgid "Port {proto}/{port} is defined in policy, cannot be deleted"
 msgstr ""
 
-#: ../semanage/seobject.py:1256
-#, python-format
-msgid "Could not delete port %s/%s"
+#: ../semanage/seobject.py:1251
+#, python-brace-format
+msgid "Could not delete port {proto}/{port}"
 msgstr ""
 
-#: ../semanage/seobject.py:1274 ../semanage/seobject.py:1294
+#: ../semanage/seobject.py:1269 ../semanage/seobject.py:1289
 msgid "Could not list ports"
 msgstr ""
 
-#: ../semanage/seobject.py:1329 ../sepolicy/sepolicy/sepolicy.glade:2668
+#: ../semanage/seobject.py:1324 ../sepolicy/sepolicy/sepolicy.glade:2668
 #: ../sepolicy/sepolicy/sepolicy.glade:2766
 #: ../sepolicy/sepolicy/sepolicy.glade:4630
 msgid "SELinux Port Type"
 msgstr ""
 
-#: ../semanage/seobject.py:1329
+#: ../semanage/seobject.py:1324
 msgid "Proto"
 msgstr ""
 
-#: ../semanage/seobject.py:1329 ../semanage/seobject.py:1835
+#: ../semanage/seobject.py:1324 ../semanage/seobject.py:1830
 #: ../sepolicy/sepolicy/sepolicy.glade:1407
 msgid "Port Number"
 msgstr ""
 
-#: ../semanage/seobject.py:1351
+#: ../semanage/seobject.py:1346
 msgid "Subnet Prefix is required"
 msgstr ""
 
-#: ../semanage/seobject.py:1361
+#: ../semanage/seobject.py:1356
 msgid "Invalid Pkey"
 msgstr ""
 
-#: ../semanage/seobject.py:1381 ../semanage/seobject.py:1445
+#: ../semanage/seobject.py:1360
+#, python-brace-format
+msgid "Could not create a key for {subnet_prefix}/{pkey}"
+msgstr ""
+
+#: ../semanage/seobject.py:1376 ../semanage/seobject.py:1440
 #, python-format
 msgid "Type %s is invalid, must be a ibpkey type"
 msgstr ""
 
-#: ../semanage/seobject.py:1387 ../semanage/seobject.py:1451
-#: ../semanage/seobject.py:1505 ../semanage/seobject.py:1511
-#, python-format
-msgid "Could not check if ibpkey %s/%s is defined"
+#: ../semanage/seobject.py:1382 ../semanage/seobject.py:1446
+#: ../semanage/seobject.py:1500 ../semanage/seobject.py:1506
+#, python-brace-format
+msgid "Could not check if ibpkey {subnet_prefix}/{pkey} is defined"
 msgstr ""
 
-#: ../semanage/seobject.py:1389
-#, python-format
-msgid "ibpkey %s/%s already defined"
+#: ../semanage/seobject.py:1384
+#, python-brace-format
+msgid "ibpkey {subnet_prefix}/{pkey} already defined"
 msgstr ""
 
-#: ../semanage/seobject.py:1393
-#, python-format
-msgid "Could not create ibpkey for %s/%s"
+#: ../semanage/seobject.py:1388
+#, python-brace-format
+msgid "Could not create ibpkey for {subnet_prefix}/{pkey}"
 msgstr ""
 
-#: ../semanage/seobject.py:1403
-#, python-format
-msgid "Could not set user in ibpkey context for %s/%s"
+#: ../semanage/seobject.py:1394
+#, python-brace-format
+msgid "Could not create context for {subnet_prefix}/{pkey}"
 msgstr ""
 
-#: ../semanage/seobject.py:1407
-#, python-format
-msgid "Could not set role in ibpkey context for %s/%s"
+#: ../semanage/seobject.py:1398
+#, python-brace-format
+msgid "Could not set user in ibpkey context for {subnet_prefix}/{pkey}"
 msgstr ""
 
-#: ../semanage/seobject.py:1411
-#, python-format
-msgid "Could not set type in ibpkey context for %s/%s"
+#: ../semanage/seobject.py:1402
+#, python-brace-format
+msgid "Could not set role in ibpkey context for {subnet_prefix}/{pkey}"
 msgstr ""
 
-#: ../semanage/seobject.py:1416
-#, python-format
-msgid "Could not set mls fields in ibpkey context for %s/%s"
+#: ../semanage/seobject.py:1406
+#, python-brace-format
+msgid "Could not set type in ibpkey context for {subnet_prefix}/{pkey}"
 msgstr ""
 
-#: ../semanage/seobject.py:1420
-#, python-format
-msgid "Could not set ibpkey context for %s/%s"
+#: ../semanage/seobject.py:1411
+#, python-brace-format
+msgid "Could not set mls fields in ibpkey context for {subnet_prefix}/{pkey}"
 msgstr ""
 
-#: ../semanage/seobject.py:1424
-#, python-format
-msgid "Could not add ibpkey %s/%s"
+#: ../semanage/seobject.py:1415
+#, python-brace-format
+msgid "Could not set ibpkey context for {subnet_prefix}/{pkey}"
 msgstr ""
 
-#: ../semanage/seobject.py:1453 ../semanage/seobject.py:1507
-#, python-format
-msgid "ibpkey %s/%s is not defined"
+#: ../semanage/seobject.py:1419
+#, python-brace-format
+msgid "Could not add ibpkey {subnet_prefix}/{pkey}"
 msgstr ""
 
-#: ../semanage/seobject.py:1457
-#, python-format
-msgid "Could not query ibpkey %s/%s"
+#: ../semanage/seobject.py:1448 ../semanage/seobject.py:1502
+#, python-brace-format
+msgid "ibpkey {subnet_prefix}/{pkey} is not defined"
 msgstr ""
 
-#: ../semanage/seobject.py:1468
-#, python-format
-msgid "Could not modify ibpkey %s/%s"
+#: ../semanage/seobject.py:1452
+#, python-brace-format
+msgid "Could not query ibpkey {subnet_prefix}/{pkey}"
 msgstr ""
 
-#: ../semanage/seobject.py:1481
+#: ../semanage/seobject.py:1463
+#, python-brace-format
+msgid "Could not modify ibpkey {subnet_prefix}/{pkey}"
+msgstr ""
+
+#: ../semanage/seobject.py:1476
 msgid "Could not list the ibpkeys"
 msgstr ""
 
-#: ../semanage/seobject.py:1496
+#: ../semanage/seobject.py:1491
 #, python-format
 msgid "Could not delete the ibpkey %s"
 msgstr ""
 
-#: ../semanage/seobject.py:1513
-#, python-format
-msgid "ibpkey %s/%s is defined in policy, cannot be deleted"
+#: ../semanage/seobject.py:1508
+#, python-brace-format
+msgid "ibpkey {subnet_prefix}/{pkey} is defined in policy, cannot be deleted"
 msgstr ""
 
-#: ../semanage/seobject.py:1517
-#, python-format
-msgid "Could not delete ibpkey %s/%s"
+#: ../semanage/seobject.py:1512
+#, python-brace-format
+msgid "Could not delete ibpkey {subnet_prefix}/{pkey}"
 msgstr ""
 
-#: ../semanage/seobject.py:1533 ../semanage/seobject.py:1554
+#: ../semanage/seobject.py:1528 ../semanage/seobject.py:1549
 msgid "Could not list ibpkeys"
 msgstr ""
 
-#: ../semanage/seobject.py:1589
+#: ../semanage/seobject.py:1584
 msgid "SELinux IB Pkey Type"
 msgstr ""
 
-#: ../semanage/seobject.py:1589
+#: ../semanage/seobject.py:1584
 msgid "Subnet_Prefix"
 msgstr ""
 
-#: ../semanage/seobject.py:1589
+#: ../semanage/seobject.py:1584
 msgid "Pkey Number"
 msgstr ""
 
-#: ../semanage/seobject.py:1611
+#: ../semanage/seobject.py:1606
 msgid "IB device name is required"
 msgstr ""
 
-#: ../semanage/seobject.py:1616
+#: ../semanage/seobject.py:1611
 msgid "Invalid Port Number"
 msgstr ""
 
-#: ../semanage/seobject.py:1620
-#, python-format
-msgid "Could not create a key for ibendport %s/%s"
+#: ../semanage/seobject.py:1615
+#, python-brace-format
+msgid "Could not create a key for ibendport {ibdev_name}/{ibendport}"
 msgstr ""
 
-#: ../semanage/seobject.py:1636 ../semanage/seobject.py:1699
+#: ../semanage/seobject.py:1631 ../semanage/seobject.py:1694
 #, python-format
 msgid "Type %s is invalid, must be an ibendport type"
 msgstr ""
 
-#: ../semanage/seobject.py:1641 ../semanage/seobject.py:1705
-#: ../semanage/seobject.py:1757 ../semanage/seobject.py:1763
-#, python-format
-msgid "Could not check if ibendport %s/%s is defined"
+#: ../semanage/seobject.py:1636
+#, python-brace-format
+msgid "Could not check if ibendport {ibdev_name}/{port} is defined"
 msgstr ""
 
-#: ../semanage/seobject.py:1643
-#, python-format
-msgid "ibendport %s/%s already defined"
+#: ../semanage/seobject.py:1638
+#, python-brace-format
+msgid "ibendport {ibdev_name}/{port} already defined"
 msgstr ""
 
-#: ../semanage/seobject.py:1647
-#, python-format
-msgid "Could not create ibendport for %s/%s"
+#: ../semanage/seobject.py:1642
+#, python-brace-format
+msgid "Could not create ibendport for {ibdev_name}/{port}"
 msgstr ""
 
-#: ../semanage/seobject.py:1657
-#, python-format
-msgid "Could not set user in ibendport context for %s/%s"
+#: ../semanage/seobject.py:1648
+#, python-brace-format
+msgid "Could not create context for {ibendport}/{port}"
 msgstr ""
 
-#: ../semanage/seobject.py:1661
-#, python-format
-msgid "Could not set role in ibendport context for %s/%s"
+#: ../semanage/seobject.py:1652
+#, python-brace-format
+msgid "Could not set user in ibendport context for {ibdev_name}/{port}"
+msgstr ""
+
+#: ../semanage/seobject.py:1656
+#, python-brace-format
+msgid "Could not set role in ibendport context for {ibdev_name}/{port}"
+msgstr ""
+
+#: ../semanage/seobject.py:1660
+#, python-brace-format
+msgid "Could not set type in ibendport context for {ibdev_name}/{port}"
 msgstr ""
 
 #: ../semanage/seobject.py:1665
-#, python-format
-msgid "Could not set type in ibendport context for %s/%s"
+#, python-brace-format
+msgid "Could not set mls fields in ibendport context for {ibdev_name}/{port}"
 msgstr ""
 
-#: ../semanage/seobject.py:1670
-#, python-format
-msgid "Could not set mls fields in ibendport context for %s/%s"
+#: ../semanage/seobject.py:1669
+#, python-brace-format
+msgid "Could not set ibendport context for {ibdev_name}/{port}"
 msgstr ""
 
-#: ../semanage/seobject.py:1674
-#, python-format
-msgid "Could not set ibendport context for %s/%s"
+#: ../semanage/seobject.py:1673
+#, python-brace-format
+msgid "Could not add ibendport {ibdev_name}/{port}"
 msgstr ""
 
-#: ../semanage/seobject.py:1678
-#, python-format
-msgid "Could not add ibendport %s/%s"
+#: ../semanage/seobject.py:1700 ../semanage/seobject.py:1752
+#: ../semanage/seobject.py:1758
+#, python-brace-format
+msgid "Could not check if ibendport {ibdev_name}/{ibendport} is defined"
 msgstr ""
 
-#: ../semanage/seobject.py:1707 ../semanage/seobject.py:1759
-#, python-format
-msgid "ibendport %s/%s is not defined"
+#: ../semanage/seobject.py:1702 ../semanage/seobject.py:1754
+#, python-brace-format
+msgid "ibendport {ibdev_name}/{ibendport} is not defined"
 msgstr ""
 
-#: ../semanage/seobject.py:1711
-#, python-format
-msgid "Could not query ibendport %s/%s"
+#: ../semanage/seobject.py:1706
+#, python-brace-format
+msgid "Could not query ibendport {ibdev_name}/{ibendport}"
 msgstr ""
 
-#: ../semanage/seobject.py:1722
-#, python-format
-msgid "Could not modify ibendport %s/%s"
+#: ../semanage/seobject.py:1717
+#, python-brace-format
+msgid "Could not modify ibendport {ibdev_name}/{ibendport}"
 msgstr ""
 
-#: ../semanage/seobject.py:1735
+#: ../semanage/seobject.py:1730
 msgid "Could not list the ibendports"
 msgstr ""
 
-#: ../semanage/seobject.py:1744
-#, python-format
-msgid "Could not create a key for %s/%d"
+#: ../semanage/seobject.py:1739
+#, python-brace-format
+msgid "Could not create a key for {ibdev_name}/{port}"
 msgstr ""
 
-#: ../semanage/seobject.py:1748
-#, python-format
-msgid "Could not delete the ibendport %s/%d"
+#: ../semanage/seobject.py:1743
+#, python-brace-format
+msgid "Could not delete the ibendport {ibdev_name}/{port}"
 msgstr ""
 
-#: ../semanage/seobject.py:1765
-#, python-format
-msgid "ibendport %s/%s is defined in policy, cannot be deleted"
+#: ../semanage/seobject.py:1760
+#, python-brace-format
+msgid ""
+"ibendport {ibdev_name}/{ibendport} is defined in policy, cannot be deleted"
 msgstr ""
 
-#: ../semanage/seobject.py:1769
-#, python-format
-msgid "Could not delete ibendport %s/%s"
+#: ../semanage/seobject.py:1764
+#, python-brace-format
+msgid "Could not delete ibendport {ibdev_name}/{ibendport}"
 msgstr ""
 
-#: ../semanage/seobject.py:1785 ../semanage/seobject.py:1805
+#: ../semanage/seobject.py:1780 ../semanage/seobject.py:1800
 msgid "Could not list ibendports"
 msgstr ""
 
-#: ../semanage/seobject.py:1835
+#: ../semanage/seobject.py:1830
 msgid "SELinux IB End Port Type"
 msgstr ""
 
-#: ../semanage/seobject.py:1835
+#: ../semanage/seobject.py:1830
 msgid "IB Device Name"
 msgstr ""
 
-#: ../semanage/seobject.py:1861
+#: ../semanage/seobject.py:1856
 msgid "Node Address is required"
 msgstr ""
 
-#: ../semanage/seobject.py:1873 ../semanage/seobject.py:1885
+#: ../semanage/seobject.py:1868 ../semanage/seobject.py:1880
 msgid "Unknown or missing protocol"
 msgstr ""
 
-#: ../semanage/seobject.py:1899
+#: ../semanage/seobject.py:1894
 msgid "SELinux node type is required"
 msgstr ""
 
-#: ../semanage/seobject.py:1904 ../semanage/seobject.py:1975
+#: ../semanage/seobject.py:1899 ../semanage/seobject.py:1970
 #, python-format
 msgid "Type %s is invalid, must be a node type"
 msgstr ""
 
-#: ../semanage/seobject.py:1908 ../semanage/seobject.py:1979
-#: ../semanage/seobject.py:2016 ../semanage/seobject.py:2117
-#: ../semanage/seobject.py:2180 ../semanage/seobject.py:2216
-#: ../semanage/seobject.py:2435
+#: ../semanage/seobject.py:1903 ../semanage/seobject.py:1974
+#: ../semanage/seobject.py:2011 ../semanage/seobject.py:2112
+#: ../semanage/seobject.py:2175 ../semanage/seobject.py:2211
+#: ../semanage/seobject.py:2430
 #, python-format
 msgid "Could not create key for %s"
 msgstr ""
 
-#: ../semanage/seobject.py:1912 ../semanage/seobject.py:1983
-#: ../semanage/seobject.py:2020 ../semanage/seobject.py:2026
+#: ../semanage/seobject.py:1907 ../semanage/seobject.py:1978
+#: ../semanage/seobject.py:2015 ../semanage/seobject.py:2021
 #, python-format
 msgid "Could not check if addr %s is defined"
 msgstr ""
 
-#: ../semanage/seobject.py:1914
+#: ../semanage/seobject.py:1909
 #, python-format
 msgid "Addr %s already defined"
 msgstr ""
 
-#: ../semanage/seobject.py:1918
+#: ../semanage/seobject.py:1913
 #, python-format
 msgid "Could not create addr for %s"
 msgstr ""
 
-#: ../semanage/seobject.py:1924 ../semanage/seobject.py:2132
-#: ../semanage/seobject.py:2389
+#: ../semanage/seobject.py:1919 ../semanage/seobject.py:2127
+#: ../semanage/seobject.py:2384
 #, python-format
 msgid "Could not create context for %s"
 msgstr ""
 
-#: ../semanage/seobject.py:1928
+#: ../semanage/seobject.py:1923
 #, python-format
 msgid "Could not set mask for %s"
 msgstr ""
 
-#: ../semanage/seobject.py:1932
+#: ../semanage/seobject.py:1927
 #, python-format
 msgid "Could not set user in addr context for %s"
 msgstr ""
 
-#: ../semanage/seobject.py:1936
+#: ../semanage/seobject.py:1931
 #, python-format
 msgid "Could not set role in addr context for %s"
 msgstr ""
 
-#: ../semanage/seobject.py:1940
+#: ../semanage/seobject.py:1935
 #, python-format
 msgid "Could not set type in addr context for %s"
 msgstr ""
 
-#: ../semanage/seobject.py:1945
+#: ../semanage/seobject.py:1940
 #, python-format
 msgid "Could not set mls fields in addr context for %s"
 msgstr ""
 
-#: ../semanage/seobject.py:1949
+#: ../semanage/seobject.py:1944
 #, python-format
 msgid "Could not set addr context for %s"
 msgstr ""
 
-#: ../semanage/seobject.py:1953
+#: ../semanage/seobject.py:1948
 #, python-format
 msgid "Could not add addr %s"
 msgstr ""
 
-#: ../semanage/seobject.py:1985 ../semanage/seobject.py:2022
+#: ../semanage/seobject.py:1980 ../semanage/seobject.py:2017
 #, python-format
 msgid "Addr %s is not defined"
 msgstr ""
 
-#: ../semanage/seobject.py:1989
+#: ../semanage/seobject.py:1984
 #, python-format
 msgid "Could not query addr %s"
 msgstr ""
 
-#: ../semanage/seobject.py:1999
+#: ../semanage/seobject.py:1994
 #, python-format
 msgid "Could not modify addr %s"
 msgstr ""
 
-#: ../semanage/seobject.py:2028
+#: ../semanage/seobject.py:2023
 #, python-format
 msgid "Addr %s is defined in policy, cannot be deleted"
 msgstr ""
 
-#: ../semanage/seobject.py:2032
+#: ../semanage/seobject.py:2027
 #, python-format
 msgid "Could not delete addr %s"
 msgstr ""
 
-#: ../semanage/seobject.py:2046
+#: ../semanage/seobject.py:2041
 msgid "Could not deleteall node mappings"
 msgstr ""
 
-#: ../semanage/seobject.py:2060
+#: ../semanage/seobject.py:2055
 msgid "Could not list addrs"
 msgstr ""
 
-#: ../semanage/seobject.py:2113 ../semanage/seobject.py:2426
+#: ../semanage/seobject.py:2108 ../semanage/seobject.py:2421
 msgid "SELinux Type is required"
 msgstr ""
 
-#: ../semanage/seobject.py:2121 ../semanage/seobject.py:2184
-#: ../semanage/seobject.py:2220 ../semanage/seobject.py:2226
+#: ../semanage/seobject.py:2116 ../semanage/seobject.py:2179
+#: ../semanage/seobject.py:2215 ../semanage/seobject.py:2221
 #, python-format
 msgid "Could not check if interface %s is defined"
 msgstr ""
 
-#: ../semanage/seobject.py:2123
+#: ../semanage/seobject.py:2118
 #, python-format
 msgid "Interface %s already defined"
 msgstr ""
 
-#: ../semanage/seobject.py:2127
+#: ../semanage/seobject.py:2122
 #, python-format
 msgid "Could not create interface for %s"
 msgstr ""
 
-#: ../semanage/seobject.py:2136
+#: ../semanage/seobject.py:2131
 #, python-format
 msgid "Could not set user in interface context for %s"
 msgstr ""
 
-#: ../semanage/seobject.py:2140
+#: ../semanage/seobject.py:2135
 #, python-format
 msgid "Could not set role in interface context for %s"
 msgstr ""
 
-#: ../semanage/seobject.py:2144
+#: ../semanage/seobject.py:2139
 #, python-format
 msgid "Could not set type in interface context for %s"
 msgstr ""
 
-#: ../semanage/seobject.py:2149
+#: ../semanage/seobject.py:2144
 #, python-format
 msgid "Could not set mls fields in interface context for %s"
 msgstr ""
 
-#: ../semanage/seobject.py:2153
+#: ../semanage/seobject.py:2148
 #, python-format
 msgid "Could not set interface context for %s"
 msgstr ""
 
-#: ../semanage/seobject.py:2157
+#: ../semanage/seobject.py:2152
 #, python-format
 msgid "Could not set message context for %s"
 msgstr ""
 
-#: ../semanage/seobject.py:2161
+#: ../semanage/seobject.py:2156
 #, python-format
 msgid "Could not add interface %s"
 msgstr ""
 
-#: ../semanage/seobject.py:2186 ../semanage/seobject.py:2222
+#: ../semanage/seobject.py:2181 ../semanage/seobject.py:2217
 #, python-format
 msgid "Interface %s is not defined"
 msgstr ""
 
-#: ../semanage/seobject.py:2190
+#: ../semanage/seobject.py:2185
 #, python-format
 msgid "Could not query interface %s"
 msgstr ""
 
-#: ../semanage/seobject.py:2201
+#: ../semanage/seobject.py:2196
 #, python-format
 msgid "Could not modify interface %s"
 msgstr ""
 
-#: ../semanage/seobject.py:2228
+#: ../semanage/seobject.py:2223
 #, python-format
 msgid "Interface %s is defined in policy, cannot be deleted"
 msgstr ""
 
-#: ../semanage/seobject.py:2232
+#: ../semanage/seobject.py:2227
 #, python-format
 msgid "Could not delete interface %s"
 msgstr ""
 
-#: ../semanage/seobject.py:2246
+#: ../semanage/seobject.py:2241
 msgid "Could not delete all interface  mappings"
 msgstr ""
 
-#: ../semanage/seobject.py:2260
+#: ../semanage/seobject.py:2255
 msgid "Could not list interfaces"
 msgstr ""
 
-#: ../semanage/seobject.py:2285
+#: ../semanage/seobject.py:2280
 msgid "SELinux Interface"
 msgstr ""
 
-#: ../semanage/seobject.py:2285 ../semanage/seobject.py:2677
+#: ../semanage/seobject.py:2280 ../semanage/seobject.py:2672
 msgid "Context"
 msgstr ""
 
-#: ../semanage/seobject.py:2355
+#: ../semanage/seobject.py:2350
 #, python-format
 msgid "Target %s is not valid. Target is not allowed to end with '/'"
 msgstr ""
 
-#: ../semanage/seobject.py:2358
+#: ../semanage/seobject.py:2353
 #, python-format
 msgid "Substitute %s is not valid. Substitute is not allowed to end with '/'"
 msgstr ""
 
-#: ../semanage/seobject.py:2361
+#: ../semanage/seobject.py:2356
 #, python-format
 msgid "Equivalence class for %s already exists"
 msgstr ""
 
-#: ../semanage/seobject.py:2367
+#: ../semanage/seobject.py:2362
 #, python-format
 msgid "File spec %s conflicts with equivalency rule '%s %s'"
 msgstr ""
 
-#: ../semanage/seobject.py:2378
+#: ../semanage/seobject.py:2373
 #, python-format
 msgid "Equivalence class for %s does not exist"
 msgstr ""
 
-#: ../semanage/seobject.py:2395
+#: ../semanage/seobject.py:2390
 #, python-format
 msgid "Could not set user in file context for %s"
 msgstr ""
 
-#: ../semanage/seobject.py:2399
+#: ../semanage/seobject.py:2394
 #, python-format
 msgid "Could not set role in file context for %s"
 msgstr ""
 
-#: ../semanage/seobject.py:2404 ../semanage/seobject.py:2464
+#: ../semanage/seobject.py:2399 ../semanage/seobject.py:2459
 #, python-format
 msgid "Could not set mls fields in file context for %s"
 msgstr ""
 
-#: ../semanage/seobject.py:2410
+#: ../semanage/seobject.py:2405
 msgid "Invalid file specification"
 msgstr ""
 
-#: ../semanage/seobject.py:2412
+#: ../semanage/seobject.py:2407
 msgid "File specification can not include spaces"
 msgstr ""
 
-#: ../semanage/seobject.py:2417
+#: ../semanage/seobject.py:2412
 #, python-format
 msgid ""
 "File spec %s conflicts with equivalency rule '%s %s'; Try adding '%s' instead"
 msgstr ""
 
-#: ../semanage/seobject.py:2431 ../semanage/seobject.py:2496
+#: ../semanage/seobject.py:2426 ../semanage/seobject.py:2491
 #, python-format
 msgid "Type %s is invalid, must be a file or device type"
 msgstr ""
 
-#: ../semanage/seobject.py:2439 ../semanage/seobject.py:2444
-#: ../semanage/seobject.py:2506 ../semanage/seobject.py:2515
-#: ../semanage/seobject.py:2603 ../semanage/seobject.py:2607
+#: ../semanage/seobject.py:2434 ../semanage/seobject.py:2439
+#: ../semanage/seobject.py:2501 ../semanage/seobject.py:2510
+#: ../semanage/seobject.py:2598 ../semanage/seobject.py:2602
 #, python-format
 msgid "Could not check if file context for %s is defined"
 msgstr ""
 
-#: ../semanage/seobject.py:2447
+#: ../semanage/seobject.py:2442
 #, python-format
 msgid "File context for %s already defined"
 msgstr ""
 
-#: ../semanage/seobject.py:2451
+#: ../semanage/seobject.py:2446
 #, python-format
 msgid "Could not create file context for %s"
 msgstr ""
 
-#: ../semanage/seobject.py:2459
+#: ../semanage/seobject.py:2454
 #, python-format
 msgid "Could not set type in file context for %s"
 msgstr ""
 
-#: ../semanage/seobject.py:2467 ../semanage/seobject.py:2539
-#: ../semanage/seobject.py:2543
+#: ../semanage/seobject.py:2462 ../semanage/seobject.py:2534
+#: ../semanage/seobject.py:2538
 #, python-format
 msgid "Could not set file context for %s"
 msgstr ""
 
-#: ../semanage/seobject.py:2473
+#: ../semanage/seobject.py:2468
 #, python-format
 msgid "Could not add file context for %s"
 msgstr ""
 
-#: ../semanage/seobject.py:2492
+#: ../semanage/seobject.py:2487
 msgid "Requires setype, serange or seuser"
 msgstr ""
 
-#: ../semanage/seobject.py:2511 ../semanage/seobject.py:2521
+#: ../semanage/seobject.py:2506 ../semanage/seobject.py:2516
 #, python-format
 msgid "Could not query file context for %s"
 msgstr ""
 
-#: ../semanage/seobject.py:2517 ../semanage/seobject.py:2611
+#: ../semanage/seobject.py:2512 ../semanage/seobject.py:2606
 #, python-format
 msgid "File context for %s is not defined"
 msgstr ""
 
-#: ../semanage/seobject.py:2547
+#: ../semanage/seobject.py:2542
 #, python-format
 msgid "Could not modify file context for %s"
 msgstr ""
 
-#: ../semanage/seobject.py:2565
+#: ../semanage/seobject.py:2560
 msgid "Could not list the file contexts"
 msgstr ""
 
-#: ../semanage/seobject.py:2579
+#: ../semanage/seobject.py:2574
 #, python-format
 msgid "Could not delete the file context %s"
 msgstr ""
 
-#: ../semanage/seobject.py:2609
+#: ../semanage/seobject.py:2604
 #, python-format
 msgid "File context for %s is defined in policy, cannot be deleted"
 msgstr ""
 
-#: ../semanage/seobject.py:2615
+#: ../semanage/seobject.py:2610
 #, python-format
 msgid "Could not delete file context for %s"
 msgstr ""
 
-#: ../semanage/seobject.py:2632
+#: ../semanage/seobject.py:2627
 msgid "Could not list file contexts"
 msgstr ""
 
-#: ../semanage/seobject.py:2636
+#: ../semanage/seobject.py:2631
 msgid "Could not list file contexts for home directories"
 msgstr ""
 
-#: ../semanage/seobject.py:2640
+#: ../semanage/seobject.py:2635
 msgid "Could not list local file contexts"
 msgstr ""
 
-#: ../semanage/seobject.py:2677
+#: ../semanage/seobject.py:2672
 msgid "SELinux fcontext"
 msgstr ""
 
-#: ../semanage/seobject.py:2690
+#: ../semanage/seobject.py:2685
 msgid ""
 "\n"
 "SELinux Distribution fcontext Equivalence \n"
 msgstr ""
 
-#: ../semanage/seobject.py:2695
+#: ../semanage/seobject.py:2690
 msgid ""
 "\n"
 "SELinux Local fcontext Equivalence \n"
 msgstr ""
 
-#: ../semanage/seobject.py:2733 ../semanage/seobject.py:2784
-#: ../semanage/seobject.py:2790
+#: ../semanage/seobject.py:2728 ../semanage/seobject.py:2779
+#: ../semanage/seobject.py:2785
 #, python-format
 msgid "Could not check if boolean %s is defined"
 msgstr ""
 
-#: ../semanage/seobject.py:2735 ../semanage/seobject.py:2786
+#: ../semanage/seobject.py:2730 ../semanage/seobject.py:2781
 #, python-format
 msgid "Boolean %s is not defined"
 msgstr ""
 
-#: ../semanage/seobject.py:2739
+#: ../semanage/seobject.py:2734
 #, python-format
 msgid "Could not query file context %s"
 msgstr ""
 
-#: ../semanage/seobject.py:2744
+#: ../semanage/seobject.py:2739
 #, python-format
 msgid "You must specify one of the following values: %s"
 msgstr ""
 
-#: ../semanage/seobject.py:2749
+#: ../semanage/seobject.py:2744
 #, python-format
 msgid "Could not set active value of boolean %s"
 msgstr ""
 
-#: ../semanage/seobject.py:2752
+#: ../semanage/seobject.py:2747
 #, python-format
 msgid "Could not modify boolean %s"
 msgstr ""
 
-#: ../semanage/seobject.py:2768
-#, python-format
-msgid "Bad format %s: Record %s"
+#: ../semanage/seobject.py:2763
+#, python-brace-format
+msgid "Bad format {filename}: Record {record}"
 msgstr ""
 
-#: ../semanage/seobject.py:2792
+#: ../semanage/seobject.py:2787
 #, python-format
 msgid "Boolean %s is defined in policy, cannot be deleted"
 msgstr ""
 
-#: ../semanage/seobject.py:2796
+#: ../semanage/seobject.py:2791
 #, python-format
 msgid "Could not delete boolean %s"
 msgstr ""
 
-#: ../semanage/seobject.py:2808 ../semanage/seobject.py:2825
+#: ../semanage/seobject.py:2803 ../semanage/seobject.py:2820
 msgid "Could not list booleans"
 msgstr ""
 
-#: ../semanage/seobject.py:2858
+#: ../semanage/seobject.py:2853
 msgid "off"
 msgstr ""
 
-#: ../semanage/seobject.py:2858
+#: ../semanage/seobject.py:2853
 msgid "on"
 msgstr ""
 
-#: ../semanage/seobject.py:2870
+#: ../semanage/seobject.py:2865
 msgid "SELinux boolean"
 msgstr ""
 
-#: ../semanage/seobject.py:2870
+#: ../semanage/seobject.py:2865
 msgid "State"
 msgstr ""
 
-#: ../semanage/seobject.py:2870
+#: ../semanage/seobject.py:2865
 msgid "Default"
 msgstr ""
 
-#: ../semanage/seobject.py:2870 ../sepolicy/sepolicy/sepolicy.glade:2140
+#: ../semanage/seobject.py:2865 ../sepolicy/sepolicy/sepolicy.glade:2140
 #: ../sepolicy/sepolicy/sepolicy.glade:2510
 #: ../sepolicy/sepolicy/sepolicy.glade:5099
 msgid "Description"
@@ -1555,151 +1566,151 @@ msgstr ""
 msgid "Missing interface definition for %s"
 msgstr ""
 
-#: ../sepolicy/sepolicy/generate.py:140
+#: ../sepolicy/sepolicy/generate.py:138
 msgid "Standard Init Daemon"
 msgstr ""
 
-#: ../sepolicy/sepolicy/generate.py:141
+#: ../sepolicy/sepolicy/generate.py:139
 msgid "DBUS System Daemon"
 msgstr ""
 
-#: ../sepolicy/sepolicy/generate.py:142
+#: ../sepolicy/sepolicy/generate.py:140
 msgid "Internet Services Daemon"
 msgstr ""
 
-#: ../sepolicy/sepolicy/generate.py:143
+#: ../sepolicy/sepolicy/generate.py:141
 msgid "Web Application/Script (CGI)"
 msgstr ""
 
-#: ../sepolicy/sepolicy/generate.py:144
+#: ../sepolicy/sepolicy/generate.py:142
 msgid "Sandbox"
 msgstr ""
 
-#: ../sepolicy/sepolicy/generate.py:145
+#: ../sepolicy/sepolicy/generate.py:143
 msgid "User Application"
 msgstr ""
 
-#: ../sepolicy/sepolicy/generate.py:146
+#: ../sepolicy/sepolicy/generate.py:144
 msgid "Existing Domain Type"
 msgstr ""
 
-#: ../sepolicy/sepolicy/generate.py:147
+#: ../sepolicy/sepolicy/generate.py:145
 msgid "Minimal Terminal Login User Role"
 msgstr ""
 
-#: ../sepolicy/sepolicy/generate.py:148
+#: ../sepolicy/sepolicy/generate.py:146
 msgid "Minimal X Windows Login User Role"
 msgstr ""
 
-#: ../sepolicy/sepolicy/generate.py:149
+#: ../sepolicy/sepolicy/generate.py:147
 msgid "Desktop Login User Role"
 msgstr ""
 
-#: ../sepolicy/sepolicy/generate.py:150
+#: ../sepolicy/sepolicy/generate.py:148
 msgid "Administrator Login User Role"
 msgstr ""
 
-#: ../sepolicy/sepolicy/generate.py:151
+#: ../sepolicy/sepolicy/generate.py:149
 msgid "Confined Root Administrator Role"
 msgstr ""
 
-#: ../sepolicy/sepolicy/generate.py:152
+#: ../sepolicy/sepolicy/generate.py:150
 msgid "Module information for a new type"
 msgstr ""
 
-#: ../sepolicy/sepolicy/generate.py:158
+#: ../sepolicy/sepolicy/generate.py:156
 msgid "Valid Types:\n"
 msgstr ""
 
-#: ../sepolicy/sepolicy/generate.py:193
+#: ../sepolicy/sepolicy/generate.py:191
 #, python-format
 msgid "Ports must be numbers or ranges of numbers from 1 to %d "
 msgstr ""
 
-#: ../sepolicy/sepolicy/generate.py:205
+#: ../sepolicy/sepolicy/generate.py:203
 msgid "You must enter a valid policy type"
 msgstr ""
 
-#: ../sepolicy/sepolicy/generate.py:208
+#: ../sepolicy/sepolicy/generate.py:206
 #, python-format
 msgid "You must enter a name for your policy module for your '%s'."
 msgstr ""
 
-#: ../sepolicy/sepolicy/generate.py:346
+#: ../sepolicy/sepolicy/generate.py:344
 msgid ""
 "Name must be alphanumeric with no spaces. Consider using option \"-n "
 "MODULENAME\""
 msgstr ""
 
-#: ../sepolicy/sepolicy/generate.py:438
+#: ../sepolicy/sepolicy/generate.py:436
 msgid "User Role types can not be assigned executables."
 msgstr ""
 
-#: ../sepolicy/sepolicy/generate.py:444
+#: ../sepolicy/sepolicy/generate.py:442
 msgid "Only Daemon apps can use an init script."
 msgstr ""
 
-#: ../sepolicy/sepolicy/generate.py:462
+#: ../sepolicy/sepolicy/generate.py:460
 msgid "use_resolve must be a boolean value "
 msgstr ""
 
-#: ../sepolicy/sepolicy/generate.py:468
+#: ../sepolicy/sepolicy/generate.py:466
 msgid "use_syslog must be a boolean value "
 msgstr ""
 
-#: ../sepolicy/sepolicy/generate.py:474
+#: ../sepolicy/sepolicy/generate.py:472
 msgid "use_kerberos must be a boolean value "
 msgstr ""
 
-#: ../sepolicy/sepolicy/generate.py:480
+#: ../sepolicy/sepolicy/generate.py:478
 msgid "manage_krb5_rcache must be a boolean value "
 msgstr ""
 
-#: ../sepolicy/sepolicy/generate.py:510
+#: ../sepolicy/sepolicy/generate.py:508
 msgid "USER Types automatically get a tmp type"
 msgstr ""
 
-#: ../sepolicy/sepolicy/generate.py:847
+#: ../sepolicy/sepolicy/generate.py:845
 #, python-format
 msgid "'%s' policy modules require existing domains"
 msgstr ""
 
-#: ../sepolicy/sepolicy/generate.py:872
+#: ../sepolicy/sepolicy/generate.py:870
 msgid "Type field required"
 msgstr ""
 
-#: ../sepolicy/sepolicy/generate.py:885
+#: ../sepolicy/sepolicy/generate.py:883
 #, python-format
 msgid ""
 "You need to define a new type which ends with: \n"
 " %s"
 msgstr ""
 
-#: ../sepolicy/sepolicy/generate.py:1113
+#: ../sepolicy/sepolicy/generate.py:1111
 msgid "You must enter the executable path for your confined process"
 msgstr ""
 
-#: ../sepolicy/sepolicy/generate.py:1378
+#: ../sepolicy/sepolicy/generate.py:1376
 msgid "Created the following files:\n"
 msgstr ""
 
-#: ../sepolicy/sepolicy/generate.py:1379
+#: ../sepolicy/sepolicy/generate.py:1377
 msgid "Type Enforcement file"
 msgstr ""
 
-#: ../sepolicy/sepolicy/generate.py:1380
+#: ../sepolicy/sepolicy/generate.py:1378
 msgid "Interface file"
 msgstr ""
 
-#: ../sepolicy/sepolicy/generate.py:1381
+#: ../sepolicy/sepolicy/generate.py:1379
 msgid "File Contexts file"
 msgstr ""
 
-#: ../sepolicy/sepolicy/generate.py:1383
+#: ../sepolicy/sepolicy/generate.py:1381
 msgid "Spec file"
 msgstr ""
 
-#: ../sepolicy/sepolicy/generate.py:1384
+#: ../sepolicy/sepolicy/generate.py:1382
 msgid "Setup Script"
 msgstr ""
 
@@ -2367,29 +2378,29 @@ msgstr ""
 msgid "named pipe"
 msgstr ""
 
-#: ../sepolicy/sepolicy/__init__.py:148
+#: ../sepolicy/sepolicy/__init__.py:149
 msgid "No SELinux Policy installed"
 msgstr ""
 
-#: ../sepolicy/sepolicy/__init__.py:184
+#: ../sepolicy/sepolicy/__init__.py:185
 #, python-format
 msgid "Failed to read %s policy file"
 msgstr ""
 
-#: ../sepolicy/sepolicy/__init__.py:470
+#: ../sepolicy/sepolicy/__init__.py:471
 #, python-format
 msgid "-- Allowed %s [ %s ]"
 msgstr ""
 
-#: ../sepolicy/sepolicy/__init__.py:896
+#: ../sepolicy/sepolicy/__init__.py:897
 msgid "You must regenerate interface info by running /usr/bin/sepolgen-ifgen"
 msgstr ""
 
-#: ../sepolicy/sepolicy/__init__.py:1221
+#: ../sepolicy/sepolicy/__init__.py:1230
 msgid "unknown"
 msgstr ""
 
-#: ../sepolicy/sepolicy/__init__.py:1230
+#: ../sepolicy/sepolicy/__init__.py:1239
 #, python-brace-format
 msgid "Allow {subject} to {rest}"
 msgstr ""
-- 
2.41.0.rc2

