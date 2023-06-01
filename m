Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 76FB071A078
	for <lists+selinux@lfdr.de>; Thu,  1 Jun 2023 16:40:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233772AbjFAOkZ (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Thu, 1 Jun 2023 10:40:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233655AbjFAOkV (ORCPT
        <rfc822;selinux@vger.kernel.org>); Thu, 1 Jun 2023 10:40:21 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47F3D192
        for <selinux@vger.kernel.org>; Thu,  1 Jun 2023 07:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1685630366;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=j7KvTgiYbvvf/Qv0EvYIjCz835JJ+blCd+jyl5D10Vw=;
        b=KAZuLsCCrex5y6VSkLFqpRLHjcV/I/GscUXiLaE1vminGOWTCkqMsbBSd9aWaVoNE/IIGy
        GW56Ar+/m7QTqVvvCsRrDgzOEgekUEJLMrzHvZuWC8nU9RxEDzPx9bu86IkbtkE+bMoc29
        fJWcjv2fesyETpSKlW9CgD6mSvJJLoI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-440-3fQKDt_8MY6n6ZX8UgxnDA-1; Thu, 01 Jun 2023 10:39:25 -0400
X-MC-Unique: 3fQKDt_8MY6n6ZX8UgxnDA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B3AFF3C11C81
        for <selinux@vger.kernel.org>; Thu,  1 Jun 2023 14:39:24 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.45.226.133])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 47E1014171BB
        for <selinux@vger.kernel.org>; Thu,  1 Jun 2023 14:39:24 +0000 (UTC)
From:   Vit Mojzis <vmojzis@redhat.com>
To:     selinux@vger.kernel.org
Subject: [PATCH v2 2/5] python/sepolicy: Improve man pages
Date:   Thu,  1 Jun 2023 16:39:12 +0200
Message-Id: <20230601143915.2051922-2-vmojzis@redhat.com>
In-Reply-To: <20230601143915.2051922-1-vmojzis@redhat.com>
References: <87ttvsk0qx.fsf@redhat.com>
 <20230601143915.2051922-1-vmojzis@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

- Add missing options
- Add examples
- Emphasize keywords
- Remove trailing whitespaces

Signed-off-by: Vit Mojzis <vmojzis@redhat.com>
---
 python/sepolicy/sepolicy-booleans.8    | 15 +++++++++---
 python/sepolicy/sepolicy-communicate.8 | 14 ++++++++---
 python/sepolicy/sepolicy-generate.8    | 34 ++++++++++++--------------
 python/sepolicy/sepolicy-gui.8         |  4 +--
 python/sepolicy/sepolicy-interface.8   | 18 +++++++++++---
 python/sepolicy/sepolicy-manpage.8     | 25 ++++++++++++++-----
 python/sepolicy/sepolicy-network.8     | 17 ++++++-------
 python/sepolicy/sepolicy-transition.8  | 19 +++++++++-----
 8 files changed, 96 insertions(+), 50 deletions(-)

diff --git a/python/sepolicy/sepolicy-booleans.8 b/python/sepolicy/sepolicy-booleans.8
index f8d8b56d..7f4b18e7 100644
--- a/python/sepolicy/sepolicy-booleans.8
+++ b/python/sepolicy/sepolicy-booleans.8
@@ -8,12 +8,16 @@ sepolicy-booleans \- Query SELinux Policy to see description of booleans
 .B sepolicy booleans [\-h] [ \-a | \-b booleanname ... ]
 
 .SH "DESCRIPTION"
-sepolicy booleans will show all booleans and their descriptions, or you can 
-choose individual booleans to display
+.B sepolicy booleans
+will show all booleans and their descriptions, or you can
+choose individual booleans to display.
+Please make sure that selinux-policy-devel is present in your system since it contains boolean descriptions extracted from the policy source code. Otherwise
+.B sepolicy booleans
+will only show descriptions generated based on boolean names.
 
 .SH "OPTIONS"
 .TP
-.I                \-h, \-\-help       
+.I                \-h, \-\-help
 Display help message
 .TP
 .I                \-a, \-\-all
@@ -22,6 +26,11 @@ Display all boolean descriptions
 .I                \-b, \-\-boolean
 boolean to get description
 
+.SH EXAMPLE
+.nf
+List descriptions of samba_create_home_dirs and samba_enable_home_dirs booleans
+# sepolicy booleans -b samba_create_home_dirs samba_enable_home_dirs
+
 .SH "AUTHOR"
 This man page was written by Daniel Walsh <dwalsh@redhat.com>
 
diff --git a/python/sepolicy/sepolicy-communicate.8 b/python/sepolicy/sepolicy-communicate.8
index 050aa475..5ecf6eff 100644
--- a/python/sepolicy/sepolicy-communicate.8
+++ b/python/sepolicy/sepolicy-communicate.8
@@ -8,7 +8,9 @@ sepolicy-communicate \- Generate a report showing if two SELinux Policy Domains
 .B sepolicy communicate [\-h] \-s SOURCE \-t TARGET [\-c TCLASS] [\-S SOURCEACCESS] [\-T TARGETACCESS]
 
 .SH "DESCRIPTION"
-Use sepolicy communicate to examine SELinux Policy to if a source SELinux Domain can communicate with a target SELinux Domain.
+Use
+.B sepolicy communicate
+to examine SELinux Policy and determine if a source SELinux Domain can communicate with a target SELinux Domain.
 The default command looks to see if there are any file types that the source domain can write, which the target domain can read.
 
 .SH "OPTIONS"
@@ -16,7 +18,7 @@ The default command looks to see if there are any file types that the source dom
 .I                \-c, \-\-class
 Specify the SELinux class which the source domain will attempt to communicate with the target domain.  (Default file)
 .TP
-.I                \-h, \-\-help       
+.I                \-h, \-\-help
 Display help message
 .TP
 .I                \-s, \-\-source
@@ -31,9 +33,15 @@ Specify the target SELinux domain type.
 .I                \-T, \-\-targetaccess
 Specify the list of accesses used by the target SELinux domain type to receive communications from the source domain. Default Open, Read.
 
+.SH EXAMPLE
+.nf
+List types that can be used to communicate between samba daemon and apache server
+# sepolicy communicate -s httpd_t -t smbd_t
+Consider a type to be accessible by the source domain when it can be opened and appended to (as opposed to opened and written to)
+# sepolicy communicate -s httpd_t -t smbd_t -S open,append
+
 .SH "AUTHOR"
 This man page was written by Daniel Walsh <dwalsh@redhat.com>
 
 .SH "SEE ALSO"
 sepolicy(8), selinux(8)
-
diff --git a/python/sepolicy/sepolicy-generate.8 b/python/sepolicy/sepolicy-generate.8
index 0c5f998f..72d0e8e4 100644
--- a/python/sepolicy/sepolicy-generate.8
+++ b/python/sepolicy/sepolicy-generate.8
@@ -57,32 +57,29 @@ path. \fBsepolicy generate\fP will use the rpm payload of the
 application along with \fBnm \-D APPLICATION\fP to help it generate
 types and policy rules for your policy files.
 
-.B Type Enforcing File NAME.te
+.B NAME.te
 .br
-This file can be used to define all the types rules for a particular domain.
+This file can be used to define all the types enforcement rules for a particular domain.
 
 .I Note:
-Policy generated by \fBsepolicy generate\fP will automatically add a permissive DOMAIN to your te file.  When you are satisfied that your policy works, you need to remove the permissive line from the te file to run your domain in enforcing mode.
+Policy generated by \fBsepolicy generate\fP will automatically add a \fIpermissive DOMAIN\fP to your \fB.te\fP file. When you are satisfied that your policy works, you need to remove the permissive line from the \fB.te\fP file to run your domain in enforcing mode.
 
-.B Interface File NAME.if
+.B NAME.if
 .br
-This file defines the interfaces for the types generated in the te file, which can be used by other policy domains.
+This file defines the interfaces for the types generated in the \fB.te\fP file, which can be used by other policy domains.
 
-.B File Context NAME.fc
+.B NAME.fc
 .br
-This file defines the default file context for the system, it takes the file types created in the te file and associates
+This file defines the default file context for the system, it takes the file types created in the \fB.te\fP file and associates
 file paths to the types.  Tools like restorecon and RPM will use these paths to put down labels.
 
-.B RPM Spec File NAME_selinux.spec
+.B NAME_selinux.spec
 .br
-This file is an RPM SPEC file that can be used to install the SELinux policy on to machines and setup the labeling. The spec file also installs the interface file and a man page describing the policy.  You can use \fBsepolicy manpage \-d NAME\fP to generate the man page.
+This file is an RPM SPEC file that can be used to install the SELinux policy on to machines and setup the labeling. The spec file also installs the interface file and a man page describing the policy. You can use \fBsepolicy manpage \-d NAME\fP to generate the man page.
 
-.B Shell File NAME.sh
+.B NAME.sh
 .br
-This is a helper shell script to compile, install and fix the labeling on your test system.  It will also generate a man page based on the installed policy, and
-compile and build an RPM suitable to be installed on other machines
-
-If a generate is possible, this tool will print out all generate paths from the source domain to the target domain
+This is a helper shell script to compile, install and fix the labeling on your test system. It will also generate a man page based on the installed policy, and compile and build an RPM suitable to be installed on other machines.
 
 .SH "OPTIONS"
 .TP
@@ -97,10 +94,11 @@ Specify alternate name of policy. The policy will default to the executable or n
 .TP
 .I                \-p, \-\-path
 Specify the directory to store the created policy files. (Default to current working directory )
+.TP
 optional arguments:
 .TP
 .I                \-r, \-\-role
-Enter role(s) to which this admin user will transition.
+Enter role(s) to which this admin user will transition
 .TP
 .I                \-t, \-\-type
 Enter type(s) for which you will generate new definition and rule(s)
@@ -109,12 +107,12 @@ Enter type(s) for which you will generate new definition and rule(s)
 SELinux user(s) which will transition to this domain
 .TP
 .I                \-w, \-\-writepath
-Path(s) which the confined processes need to write
+Path(s) which the confined processes need to write to
 .TP
 .I                \-a, \-\-admin
 Domain(s) which the confined admin will administrate
 .TP
-.I  \-\-admin_user 
+.I  \-\-admin_user
 Generate Policy for Administrator Login User Role
 .TP
 .I  \-\-application
@@ -142,7 +140,7 @@ Generate Policy for Internet Services Daemon
 Generate Policy for Standard Init Daemon (Default)
 .TP
 .I  \-\-newtype
-Generate new policy for new types to add to an existing policy.
+Generate new policy for new types to add to an existing policy
 .TP
 .I  \-\-sandbox
 Generate Policy for Sandbox
diff --git a/python/sepolicy/sepolicy-gui.8 b/python/sepolicy/sepolicy-gui.8
index ed744cdb..65b69fab 100644
--- a/python/sepolicy/sepolicy-gui.8
+++ b/python/sepolicy/sepolicy-gui.8
@@ -11,7 +11,7 @@ Common options
 .br
 
 .SH "DESCRIPTION"
-Use \fBsepolicy gui\fP to run a the graphical user interface, which
+Use \fBsepolicy gui\fP to run the graphical user interface, which
 allows you to explore how SELinux confines different process domains.
 
 .SH "OPTIONS"
@@ -20,7 +20,7 @@ allows you to explore how SELinux confines different process domains.
 Display help message
 .TP
 .I                \-d, \-\-domain
-Initialize gui to the selected domain.
+Initialize gui to the selected domain
 
 .SH "AUTHOR"
 This man page was written by Daniel Walsh <dwalsh@redhat.com>
diff --git a/python/sepolicy/sepolicy-interface.8 b/python/sepolicy/sepolicy-interface.8
index 3e74ea62..a70a9306 100644
--- a/python/sepolicy/sepolicy-interface.8
+++ b/python/sepolicy/sepolicy-interface.8
@@ -5,10 +5,10 @@ sepolicy-interface \- Print interface information based on the installed SELinux
 .SH "SYNOPSIS"
 
 .br
-.B sepolicy interface  [\-h] [\-c] [\-v] [\-a | \-u | \-l | \-i INTERFACE [INTERFACE ... ]]
+.B sepolicy interface  [\-h] [\-c] [\-v] [\-f FILE] [\-a | \-u | \-l | \-i INTERFACE [INTERFACE ... ]]
 
 .SH "DESCRIPTION"
-Use sepolicy interface to print interfaces information based on SELinux Policy.
+Use \fBsepolicy interface\fP to print interface information based on SELinux Policy.
 
 .SH "OPTIONS"
 .TP
@@ -18,7 +18,7 @@ List all domains with admin interface
 .I                \-c, \-\-compile
 Test compile of interfaces
 .TP
-.I                \-h, \-\-help       
+.I                \-h, \-\-help
 Display help message
 .TP
 .I                \-i, \-\-interface
@@ -32,6 +32,18 @@ List all domains with SELinux user role interface
 .TP
 .I                \-v, \-\-verbose
 Display extended information about the interface including parameters and description if available.
+.TP
+.I                \-f, \-\-file
+Interface file to be explored
+
+.SH EXAMPLE
+.nf
+Show description of given interface
+# sepolicy interface -vi samba_rw_config
+List interfaces in given interface file and show their description
+# sepolicy interface -f my_policy.if -lv
+Run compile test for all interfaces in given file
+# sepolicy interface -f my_policy.if -lc
 
 .SH "AUTHOR"
 This man page was written by Daniel Walsh <dwalsh@redhat.com>
diff --git a/python/sepolicy/sepolicy-manpage.8 b/python/sepolicy/sepolicy-manpage.8
index c05c9430..4991f645 100644
--- a/python/sepolicy/sepolicy-manpage.8
+++ b/python/sepolicy/sepolicy-manpage.8
@@ -8,27 +8,40 @@ sepolicy-manpage \- Generate a man page based on the installed SELinux Policy
 .B sepolicy manpage [\-w] [\-h] [\-p PATH ] [\-r ROOTDIR ] [\-a | \-d ]
 
 .SH "DESCRIPTION"
-Use sepolicy manpage to generate manpages based on SELinux Policy.
+Use \fBsepolicy manpage\fP to generate manpages based on SELinux Policy.
 
 .SH "OPTIONS"
 .TP
-.I                \-a, \-\-all        
+.I                \-a, \-\-all
 Generate Man Pages for All Domains
 .TP
-.I                \-d, \-\-domain     
+.I                \-d, \-\-domain
 Generate a Man Page for the specified domain. (Supports multiple commands)
 .TP
-.I                \-h, \-\-help       
+.I                \-h, \-\-help
 Display help message
 .TP
+.I                \-o, \-\-os
+Specify the name of the OS to be used in the man page (only affects HTML man pages)
+.TP
 .I                \-p, \-\-path
 Specify the directory to store the created man pages. (Default to /tmp)
 .TP
 .I                \-r, \-\-root
-Specify alternate root directory to generate man pages from. (Default to /)
+Specify alternative root directory to generate man pages from. (Default to /)
+.TP
+.I                \-\-source_files
+Use file_contexts and policy.xml files from the specified root directory (the alternative root needs to include both files)
 .TP
 .I                \-w, \-\-web
-Generate an additional HTML man pages for the specified domain(s).
+Generate an additional HTML man pages for the specified domain(s)
+
+.SH EXAMPLE
+.nf
+Generate man pages for all available domains
+# sepolicy manpage -a
+Generate an HTML man page for domain alsa_t, setting the OS name to "My_distro"
+# sepolicy manpage -o My_distro -d alsa_t -w
 
 .SH "AUTHOR"
 This man page was written by Daniel Walsh <dwalsh@redhat.com>
diff --git a/python/sepolicy/sepolicy-network.8 b/python/sepolicy/sepolicy-network.8
index dcddec75..6faf60ab 100644
--- a/python/sepolicy/sepolicy-network.8
+++ b/python/sepolicy/sepolicy-network.8
@@ -8,27 +8,27 @@ sepolicy-network \- Examine the SELinux Policy and generate a network report
 .B sepolicy network [\-h] (\-l | \-a application [application ...] | \-p PORT [PORT ...] | \-t TYPE [TYPE ...] | \-d DOMAIN [DOMAIN ...])
 
 .SH "DESCRIPTION"
-Use sepolicy network to examine SELinux Policy and generate network reports.
+Use \fBsepolicy network\fP to examine SELinux Policy and generate network reports.
 
 .SH "OPTIONS"
 .TP
 .I                \-a, \-\-application
-Generate a report listing the ports to which the specified init application is allowed to connect and or bind.
+Generate a report listing the ports to which the specified init application is allowed to connect and or bind
 .TP
-.I                \-d, \-\-domain     
-Generate a report listing the ports to which the specified domain is allowed to connect and or bind.
+.I                \-d, \-\-domain
+Generate a report listing the ports to which the specified domain is allowed to connect and or bind
 .TP
-.I                \-l, \-\-list        
+.I                \-l, \-\-list
 List all Network Port Types defined in SELinux Policy
 .TP
-.I                \-h, \-\-help       
+.I                \-h, \-\-help
 Display help message
 .TP
 .I                \-t, \-\-type
-Generate a report listing the port numbers associate with the specified SELinux port type.
+Generate a report listing the port numbers associate with the specified SELinux port type
 .TP
 .I                \-p, \-\-port
-Generate a report listing the SELinux port types associate with the specified port number.
+Generate a report listing the SELinux port types associate with the specified port number
 
 .SH "EXAMPLES"
 
@@ -88,4 +88,3 @@ This man page was written by Daniel Walsh <dwalsh@redhat.com>
 
 .SH "SEE ALSO"
 sepolicy(8), selinux(8), semanage(8)
-
diff --git a/python/sepolicy/sepolicy-transition.8 b/python/sepolicy/sepolicy-transition.8
index 897f0c4c..9f9ff5a5 100644
--- a/python/sepolicy/sepolicy-transition.8
+++ b/python/sepolicy/sepolicy-transition.8
@@ -11,21 +11,28 @@ sepolicy-transition \- Examine the SELinux Policy and generate a process transit
 .B sepolicy transition [\-h] \-s SOURCE \-t TARGET
 
 .SH "DESCRIPTION"
-sepolicy transition will show all domains that a give SELinux source domain can transition to, including the entrypoint.
+\fBsepolicy transition\fP will show all domains that a given SELinux source domain can transition to, including the entrypoint.
 
-If a target domain is given, sepolicy transition will examine policy for all transition paths from the source domain to the target domain, and will list the 
-paths.  If a transition is possible, this tool will print out all transition paths from the source domain to the target domain
+If a target domain is given, sepolicy transition will examine policy for all transition paths from the source domain to the target domain, and will list the
+paths.
 
 .SH "OPTIONS"
 .TP
-.I                \-h, \-\-help       
+.I                \-h, \-\-help
 Display help message
 .TP
 .I                \-s, \-\-source
-Specify the source SELinux domain type.
+Specify the source SELinux domain type
 .TP
 .I                \-t, \-\-target
-Specify the target SELinux domain type.
+Specify the target SELinux domain type
+
+.SH EXAMPLE
+.nf
+List all domain transition paths from init_t to httpd_t
+# sepolicy transition -s init_t -t httpd_t
+List all transitions available from samba domain, including entry points and booleans controlling each transition
+# sepolicy transition -s smbd_t
 
 .SH "AUTHOR"
 This man page was written by Daniel Walsh <dwalsh@redhat.com>
-- 
2.40.0

