Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B29E6F6AD5
	for <lists+selinux@lfdr.de>; Thu,  4 May 2023 14:05:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230270AbjEDMF4 (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Thu, 4 May 2023 08:05:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229973AbjEDMFz (ORCPT
        <rfc822;selinux@vger.kernel.org>); Thu, 4 May 2023 08:05:55 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6593C6188
        for <selinux@vger.kernel.org>; Thu,  4 May 2023 05:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1683201904;
        h=from:from:reply-to:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Y2YvQG+A1WR4DVjFLSNVndXTGeZwV45k0nwSPFRAqD8=;
        b=dQMJ8S6hWK93CkpcG3vRzgLSIXWjbeRlJ6zAR76bIdALFQ23CcApEuDL87jpCU5v7ejXMe
        EXMddnYJ8EJSZ8x6PVw40Ivs5YzoABXDXpd2/8Kri225DIQ524KyFRhkNoyS54iMAySfxo
        Hxa1HCErUNi2ouRg/ORTDMgNlQ8gUhE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-28-BENy68pfPWeDRjZdbQkJZw-1; Thu, 04 May 2023 08:05:03 -0400
X-MC-Unique: BENy68pfPWeDRjZdbQkJZw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2526A884EC6
        for <selinux@vger.kernel.org>; Thu,  4 May 2023 12:05:03 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.45.225.59])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 9B2BC492B00
        for <selinux@vger.kernel.org>; Thu,  4 May 2023 12:05:02 +0000 (UTC)
From:   Vit Mojzis <vmojzis@redhat.com>
To:     selinux@vger.kernel.org
Subject: [PATCH v2 3/4] python/semanage: Improve man pages
Date:   Thu,  4 May 2023 14:04:49 +0200
Message-Id: <20230504120450.771407-4-vmojzis@redhat.com>
In-Reply-To: <20230504120450.771407-1-vmojzis@redhat.com>
References: <CAP+JOzQBSknYVqAqhu6WGwnTDBCXc-P1B73+MnfbcEyGi621CA@mail.gmail.com>
 <20230504120450.771407-1-vmojzis@redhat.com>
Reply-To: <CAP+JOzQBSknYVqAqhu6WGwnTDBCXc-P1B73+MnfbcEyGi621CA@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

- Add missing options
- Add more examples
- Note special cases

Signed-off-by: Vit Mojzis <vmojzis@redhat.com>
---
 python/semanage/semanage-boolean.8    |  9 ++++++---
 python/semanage/semanage-dontaudit.8  |  8 +++++---
 python/semanage/semanage-export.8     | 10 +++++++++-
 python/semanage/semanage-fcontext.8   | 17 +++++++++++------
 python/semanage/semanage-ibendport.8  |  6 ++++--
 python/semanage/semanage-ibpkey.8     |  6 ++++--
 python/semanage/semanage-import.8     | 10 +++++++++-
 python/semanage/semanage-interface.8  |  8 ++++++--
 python/semanage/semanage-login.8      | 14 ++++++++------
 python/semanage/semanage-module.8     | 15 ++++++++++-----
 python/semanage/semanage-node.8       | 16 +++++++++++++---
 python/semanage/semanage-permissive.8 |  8 +++++---
 python/semanage/semanage-port.8       | 10 ++++++----
 python/semanage/semanage-user.8       |  8 +++++---
 14 files changed, 101 insertions(+), 44 deletions(-)

diff --git a/python/semanage/semanage-boolean.8 b/python/semanage/semanage-boolean.8
index 1282d106..3b664023 100644
--- a/python/semanage/semanage-boolean.8
+++ b/python/semanage/semanage-boolean.8
@@ -7,11 +7,14 @@ semanage\-boolean \- SELinux Policy Management boolean tool
 .SH "DESCRIPTION"
 semanage is used to configure certain elements of
 SELinux policy without requiring modification to or recompilation
-from policy sources.  semanage boolean command controls the settings of booleans in SELinux policy.  booleans are if\-then\-else rules written in SELinux Policy.  They can be used to customize the way that SELinux Policy rules effect a confined domain.
+from policy sources.
+.B semanage boolean
+command controls the settings of booleans in SELinux policy. Booleans are if\-then\-else rules written in SELinux Policy. They can be used to customize the way that SELinux Policy rules effect a confined domain.
+
 .SH "OPTIONS"
 .TP
 .I  \-h, \-\-help
-show this help message and exit
+Show this help message and exit
 .TP
 .I \-n, \-\-noheading
 Do not print heading when listing the specified object type
@@ -45,7 +48,7 @@ Disable the boolean
 
 .SH EXAMPLE
 .nf
-Turn on the apache can send mail boolean
+Turn on the "apache can send mail" boolean (persistent version of #setsebool httpd_can_sendmail on)
 # semanage boolean \-m \-\-on httpd_can_sendmail
 
 List customized booleans
diff --git a/python/semanage/semanage-dontaudit.8 b/python/semanage/semanage-dontaudit.8
index 81accc6f..51d1f4b6 100644
--- a/python/semanage/semanage-dontaudit.8
+++ b/python/semanage/semanage-dontaudit.8
@@ -7,13 +7,15 @@
 .SH "DESCRIPTION"
 semanage is used to configure certain elements of
 SELinux policy without requiring modification to or recompilation
-from policy sources.  semanage dontaudit toggles whether or not dontaudit rules will be in the policy.  Policy writers use dontaudit rules to cause
-confined applications to use alternative paths.  Dontaudit rules are denied but not reported in the logs.  Some times dontaudit rules can cause bugs in applications but policy writers will not realize it since the AVC is not audited.  Turning off dontaudit rules with this command to see if the kernel is blocking an access.
+from policy sources.
+.B semanage dontaudit
+toggles whether or not dontaudit rules will be in the policy. Policy writers use dontaudit rules to cause
+confined applications to use alternative paths. Dontaudit rules are denied but not reported in the logs. Sometimes dontaudit rules can cause bugs in applications but policy writers will not realize it since the AVC is not audited. Turn off dontaudit rules with this command to see if the kernel is blocking an access.
 
 .SH "OPTIONS"
 .TP
 .I   \-h, \-\-help
-show this help message and exit
+Show this help message and exit
 .TP
 .I   \-S STORE, \-\-store STORE
 Select an alternate SELinux Policy Store to manage
diff --git a/python/semanage/semanage-export.8 b/python/semanage/semanage-export.8
index d422683b..51984793 100644
--- a/python/semanage/semanage-export.8
+++ b/python/semanage/semanage-export.8
@@ -7,7 +7,15 @@
 .SH "DESCRIPTION"
 semanage is used to configure certain elements of
 SELinux policy without requiring modification to or recompilation
-from policy sources.  semanage import and export can be used to extract the SELinux modifications from one machine and apply them to another. You can put a whole group of semanage commands within a file and apply them to a machine in a single transaction.
+from policy sources.
+.B semanage import
+and
+.B export
+can be used to extract the SELinux modifications from one machine and apply them to another. Please note that this will remove all current semanage customizations on the second machine as the command list generated using
+.B semanage export
+start with
+.I <command> -D
+for all semanage sub-commands. You can put a whole group of semanage commands within a file and apply them to a machine in a single transaction.
 
 .SH "OPTIONS"
 .TP
diff --git a/python/semanage/semanage-fcontext.8 b/python/semanage/semanage-fcontext.8
index 1ebf085f..3e327d88 100644
--- a/python/semanage/semanage-fcontext.8
+++ b/python/semanage/semanage-fcontext.8
@@ -8,8 +8,10 @@ semanage\-fcontext \- SELinux Policy Management file context tool
 .SH "DESCRIPTION"
 semanage is used to configure certain elements of
 SELinux policy without requiring modification to or recompilation
-from policy sources.  semanage fcontext is used to  manage the default
-file system labeling on an SELinux system.  This command maps file paths using regular expressions to SELinux labels.
+from policy sources.
+.B semanage fcontext
+is used to manage the default file system labeling on an SELinux system.
+This command maps file paths using regular expressions to SELinux labels.
 
 FILE_SPEC may contain either a fully qualified path,
 or a Perl compatible regular expression (PCRE),
@@ -32,7 +34,7 @@ to avoid unintentionally impacting other parts of the filesystem.
 .SH "OPTIONS"
 .TP
 .I  \-h, \-\-help
-show this help message and exit
+Show this help message and exit
 .TP
 .I   \-n, \-\-noheading
 Do not print heading when listing the specified object type
@@ -82,12 +84,13 @@ MLS/MCS Security Range (MLS/MCS Systems only) SELinux Range for SELinux login ma
 
 .SH EXAMPLE
 .nf
-.I remember to run restorecon after you set the file context
-Add file-context for everything under /web
+.I Remember to run restorecon after you set the file context
+Add file-context httpd_sys_content_t for everything under /web
 # semanage fcontext \-a \-t httpd_sys_content_t "/web(/.*)?"
 # restorecon \-R \-v /web
 
 Substitute /home1 with /home when setting file context
+i.e. label everything under /home1 the same way /home is labeled
 # semanage fcontext \-a \-e /home /home1
 # restorecon \-R \-v /home1
 
@@ -99,7 +102,9 @@ execute the following commands.
 
 .SH "SEE ALSO"
 .BR selinux (8),
-.BR semanage (8)
+.BR semanage (8),
+.BR restorecon (8),
+.BR selabel_file (5)
 
 .SH "AUTHOR"
 This man page was written by Daniel Walsh <dwalsh@redhat.com>
diff --git a/python/semanage/semanage-ibendport.8 b/python/semanage/semanage-ibendport.8
index 0a29eae1..53fe4ee8 100644
--- a/python/semanage/semanage-ibendport.8
+++ b/python/semanage/semanage-ibendport.8
@@ -5,12 +5,14 @@
 .B semanage ibendport [\-h] [\-n] [\-N] [\-S STORE] [ \-\-add \-t TYPE \-z IBDEV_NAME \-r RANGE port | \-\-delete \-z IBDEV_NAME port | \-\-deleteall  | \-\-extract  | \-\-list [\-C] | \-\-modify \-t TYPE \-z IBDEV_NAME \-r RANGE port ]
 
 .SH "DESCRIPTION"
-semanage is used to configure certain elements of SELinux policy without requiring modification to or recompilation from policy sources.  semanage ibendport controls the ibendport number to ibendport type definitions.
+semanage is used to configure certain elements of SELinux policy without requiring modification to or recompilation from policy sources.
+.B semanage ibendport
+controls the ibendport number to ibendport type definitions.
 
 .SH "OPTIONS"
 .TP
 .I  \-h, \-\-help
-show this help message and exit
+Show this help message and exit
 .TP
 .I   \-n, \-\-noheading
 Do not print heading when listing the specified object type
diff --git a/python/semanage/semanage-ibpkey.8 b/python/semanage/semanage-ibpkey.8
index 51f455ab..6cc5e02f 100644
--- a/python/semanage/semanage-ibpkey.8
+++ b/python/semanage/semanage-ibpkey.8
@@ -5,12 +5,14 @@
 .B semanage ibpkey [\-h] [\-n] [\-N] [\-S STORE] [ \-\-add \-t TYPE \-x SUBNET_PREFIX \-r RANGE ibpkey_name | ibpkey_range | \-\-delete \-x SUBNET_PREFIX ibpkey_name | ibpkey_range | \-\-deleteall  | \-\-extract  | \-\-list [\-C] | \-\-modify \-t TYPE \-x SUBNET_PREFIX \-r RANGE ibpkey_name | ibpkey_range ]
 
 .SH "DESCRIPTION"
-semanage is used to configure certain elements of SELinux policy without requiring modification to or recompilation from policy sources.  semanage ibpkey controls the ibpkey number to ibpkey type definitions.
+semanage is used to configure certain elements of SELinux policy without requiring modification to or recompilation from policy sources.
+.B semanage ibpkey
+controls the ibpkey number to ibpkey type definitions.
 
 .SH "OPTIONS"
 .TP
 .I  \-h, \-\-help
-show this help message and exit
+Show this help message and exit
 .TP
 .I   \-n, \-\-noheading
 Do not print heading when listing the specified object type
diff --git a/python/semanage/semanage-import.8 b/python/semanage/semanage-import.8
index 4a9b3e76..041e9ab0 100644
--- a/python/semanage/semanage-import.8
+++ b/python/semanage/semanage-import.8
@@ -7,7 +7,15 @@
 .SH "DESCRIPTION"
 semanage is used to configure certain elements of
 SELinux policy without requiring modification to or recompilation
-from policy sources.  semanage import and export can be used to extract the SELinux modifications from one machine and apply them to another. You can put a whole group of semanage commands within a file and apply them to a machine in a single transaction.
+from policy sources.
+.B semanage import
+and
+.B export
+can be used to extract the SELinux modifications from one machine and apply them to another. Please note that this will remove all current semanage customizations on the second machine as the command list generated using
+.B semanage export
+start with
+.I <command> -D
+for all semanage sub-commands. You can put a whole group of semanage commands within a file and apply them to a machine in a single transaction.
 
 .SH "OPTIONS"
 .TP
diff --git a/python/semanage/semanage-interface.8 b/python/semanage/semanage-interface.8
index d9d526dc..080db70b 100644
--- a/python/semanage/semanage-interface.8
+++ b/python/semanage/semanage-interface.8
@@ -7,12 +7,14 @@
 .SH "DESCRIPTION"
 semanage is used to configure certain elements of
 SELinux policy without requiring modification to or recompilation
-from policy sources.  semanage interface controls the labels assigned to network interfaces.
+from policy sources.
+.B semanage interface
+controls the labels assigned to network interfaces.
 
 .SH "OPTIONS"
 .TP
 .I \-h, \-\-help
-show this help message and exit
+Show this help message and exit
 .TP
 .I  \-n, \-\-noheading
 Do not print heading when listing the specified object type
@@ -54,6 +56,8 @@ MLS/MCS Security Range (MLS/MCS Systems only) SELinux Range for SELinux login ma
 .nf
 list all interface definitions
 # semanage interface \-l
+Assign type netif_t and MLS/MCS range s0:c0.c1023 to interface eth0
+# semanage interface \-a \-t netif_t \-r s0:c0.c1023 eth0
 
 .SH "SEE ALSO"
 .BR selinux (8),
diff --git a/python/semanage/semanage-login.8 b/python/semanage/semanage-login.8
index f451bdc6..9076a1ed 100644
--- a/python/semanage/semanage-login.8
+++ b/python/semanage/semanage-login.8
@@ -7,12 +7,14 @@
 .SH "DESCRIPTION"
 semanage is used to configure certain elements of
 SELinux policy without requiring modification to or recompilation
-from policy sources.  semanage login controls the mapping between a Linux User and the SELinux User.  It can be used to turn  on confined users.  For example you could define that a particular user or group of users will login to a system as the user_u user.  Prefix the group name with a '%' sign to indicate a group name.
+from policy sources.
+.B semanage login
+controls the mapping between a Linux User and the SELinux User. It can be used to turn on confined users. For example you could define that a particular user or group of users will login to a system as the user_u user. Prefix the group name with a '%' sign to indicate a group name.
 
 .SH "OPTIONS"
 .TP
 .I  \-h, \-\-help
-show this help message and exit
+Show this help message and exit
 .TP
 .I  \-n, \-\-noheading
 Do not print heading when listing the specified object type
@@ -52,11 +54,11 @@ MLS/MCS Security Range (MLS/MCS Systems only) SELinux Range for SELinux login ma
 
 .SH EXAMPLE
 .nf
-Modify the default user on the system to the guest_u user
+Set the default SELinux user on the system to guest_u
 # semanage login \-m \-s guest_u __default__
-Assign gijoe user on an MLS machine  a range and to the staff_u user
-# semanage login \-a \-s staff_u \-rSystemLow-Secret gijoe
-Assign all users in the engineering group to the staff_u user
+Map user gijoe to SELinux user staff_u and assign MLS range SystemLow\-Secret
+# semanage login \-a \-s staff_u \-rSystemLow\-Secret gijoe
+Map all users in the engineering group to SELinux user staff_u
 # semanage login \-a \-s staff_u %engineering
 
 .SH "SEE ALSO"
diff --git a/python/semanage/semanage-module.8 b/python/semanage/semanage-module.8
index e0057167..6913b0cd 100644
--- a/python/semanage/semanage-module.8
+++ b/python/semanage/semanage-module.8
@@ -5,12 +5,14 @@
 .B semanage module [\-h] [\-n] [\-N] [\-S STORE] (\-a | \-r | \-e | \-d | \-\-extract | \-\-list [\-C] | \-\-deleteall) [module_name]
 
 .SH "DESCRIPTION"
-semanage is used to configure certain elements of SELinux policy without requiring modification to or recompilation from policy sources.  semanage module installs, removes, disables SELinux Policy modules.
+semanage is used to configure certain elements of SELinux policy without requiring modification to or recompilation from policy sources.
+.B semanage module
+installs, removes, disables, or enables SELinux Policy modules.
 
 .SH "OPTIONS"
 .TP
 .I  \-h, \-\-help
-show this help message and exit
+Show this help message and exit
 .TP
 .I   \-n, \-\-noheading
 Do not print heading when listing the specified object type
@@ -22,11 +24,14 @@ Do not reload policy after commit
 Select an alternate SELinux Policy Store to manage
 .TP
 .I   \-a, \-\-add
-Install specified module
+Install specified module. Accepts both binary policy files (.pp) and CIL source files
 .TP
 .I   \-r, \-\-remove
 Remove specified module
 .TP
+.I   \-D, \-\-deleteall
+Remove all local customizations related to modules
+.TP
 .I   \-d \-\-disable
 Disable specified module
 .TP
@@ -48,8 +53,8 @@ List all modules
 # semanage module \-l
 Disable unconfined module
 # semanage module \-\-disable unconfined
-Install custom apache policy module
-# semanage module \-a myapache
+Install custom apache policy module (same as #semodule -i myapache.pp)
+# semanage module \-a myapache.pp
 
 .SH "SEE ALSO"
 .BR selinux (8),
diff --git a/python/semanage/semanage-node.8 b/python/semanage/semanage-node.8
index a0098221..c78d6c3e 100644
--- a/python/semanage/semanage-node.8
+++ b/python/semanage/semanage-node.8
@@ -7,12 +7,14 @@
 .SH "DESCRIPTION"
 semanage is used to configure certain elements of
 SELinux policy without requiring modification to or recompilation
-from policy sources.  semanage controls the ipaddress to node type definitions.
+from policy sources.
+.B semanage node
+controls the IP address to node type definitions.
 
 .SH "OPTIONS"
 .TP
 .I \-h, \-\-help
-show this help message and exit
+Show this help message and exit
 .TP
 .I   \-n, \-\-noheading
 Do not print heading when listing the specified object type
@@ -54,5 +56,13 @@ SELinux type for the object
 MLS/MCS Security Range (MLS/MCS Systems only) SELinux Range for SELinux login mapping defaults to the SELinux user record range. SELinux Range for SELinux user defaults to s0.
 .TP
 .I   \-p PROTO, \-\-proto PROTO
-
 Protocol for the specified port (tcp|udp) or internet protocol version for the specified node (ipv4|ipv6).
+
+.SH "EXAMPLE"
+.nf
+Apply type node_t to ipv4 node 127.0.0.2
+# semanage node \-a \-t node_t \-p ipv4 \-M 255.255.255.255 127.0.0.2
+
+.SH "SEE ALSO"
+.BR selinux (8),
+.BR semanage (8)
diff --git a/python/semanage/semanage-permissive.8 b/python/semanage/semanage-permissive.8
index 5c3364fa..0414a850 100644
--- a/python/semanage/semanage-permissive.8
+++ b/python/semanage/semanage-permissive.8
@@ -5,12 +5,14 @@
 .B semanage permissive [\-h] [\-n] [\-N] [\-S STORE] (\-\-add TYPE | \-\-delete TYPE | \-\-deleteall | \-\-extract | \-\-list)
 
 .SH "DESCRIPTION"
-semanage is used to configure certain elements of SELinux policy without requiring modification to or recompilation from policy sources.  semanage permissive adds or removes a SELinux Policy permissive module.
+semanage is used to configure certain elements of SELinux policy without requiring modification to or recompilation from policy sources.
+.B semanage permissive
+adds or removes a SELinux Policy permissive module. Please note that this command can make any domain permissive, but can only remove the permissive property from domains where it was added by semanage permissive ("semanage permissive -d" can only be used on types listed as "Customized Permissive Types" by "semanage permissive -l").
 
 .SH "OPTIONS"
 .TP
 .I  \-h, \-\-help
-show this help message and exit
+Show this help message and exit
 .TP
 .I   \-a, \-\-add
 Add a record of the specified object type
@@ -38,7 +40,7 @@ Select an alternate SELinux Policy Store to manage
 
 .SH EXAMPLE
 .nf
-List all permissive modules
+List all permissive domains ("Builtin Permissive Types" where set by the system policy, or a custom policy module)
 # semanage permissive \-l
 Make httpd_t (Web Server) a permissive domain
 # semanage permissive \-a httpd_t
diff --git a/python/semanage/semanage-port.8 b/python/semanage/semanage-port.8
index 12ec14c2..c6048660 100644
--- a/python/semanage/semanage-port.8
+++ b/python/semanage/semanage-port.8
@@ -5,12 +5,14 @@
 .B semanage port [\-h] [\-n] [\-N] [\-S STORE] [ \-\-add \-t TYPE \-p PROTOCOL \-r RANGE port_name | port_range | \-\-delete \-p PROTOCOL port_name | port_range | \-\-deleteall  | \-\-extract  | \-\-list [\-C] | \-\-modify \-t TYPE \-p PROTOCOL \-r RANGE port_name | port_range ]
 
 .SH "DESCRIPTION"
-semanage is used to configure certain elements of SELinux policy without requiring modification to or recompilation from policy sources.  semanage port controls the port number to port type definitions.
+semanage is used to configure certain elements of SELinux policy without requiring modification to or recompilation from policy sources.
+.B semanage port
+controls the port number to port type definitions.
 
 .SH "OPTIONS"
 .TP
 .I  \-h, \-\-help
-show this help message and exit
+Show this help message and exit
 .TP
 .I   \-n, \-\-noheading
 Do not print heading when listing the specified object type
@@ -55,9 +57,9 @@ Protocol for the specified port (tcp|udp|dccp|sctp) or internet protocol version
 .nf
 List all port definitions
 # semanage port \-l
-Allow Apache to listen on tcp port 81
+Allow Apache to listen on tcp port 81 (i.e. assign tcp port 81 label http_port_t, which apache is allowed to listen on)
 # semanage port \-a \-t http_port_t \-p tcp 81
-Allow sshd to listen on tcp port 8991
+Allow sshd to listen on tcp port 8991 (i.e. assign tcp port 8991 label ssh_port_t, which sshd is allowed to listen on)
 # semanage port \-a \-t ssh_port_t \-p tcp 8991
 
 .SH "SEE ALSO"
diff --git a/python/semanage/semanage-user.8 b/python/semanage/semanage-user.8
index 23fec698..50d50bea 100644
--- a/python/semanage/semanage-user.8
+++ b/python/semanage/semanage-user.8
@@ -7,12 +7,14 @@
 .SH "DESCRIPTION"
 semanage is used to configure certain elements of
 SELinux policy without requiring modification to or recompilation
-from policy sources.  semanage user controls the mapping between an SELinux User and the roles and MLS/MCS levels.
+from policy sources.
+.B semanage user
+controls the mapping between an SELinux User and the roles and MLS/MCS levels.
 
 .SH "OPTIONS"
 .TP
 .I   \-h, \-\-help
-show this help message and exit
+Show this help message and exit
 .TP
 .I   \-n, \-\-noheading
 Do not print heading when listing the specified object type
@@ -59,7 +61,7 @@ List SELinux users
 # semanage user \-l
 Modify groups for staff_u user
 # semanage user \-m \-R "system_r unconfined_r staff_r" staff_u
-Add level for TopSecret Users
+Assign user topsecret_u role staff_r and range s0\-TopSecret
 # semanage user \-a \-R "staff_r" \-rs0\-TopSecret topsecret_u
 
 .SH "SEE ALSO"
-- 
2.40.0

