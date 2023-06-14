Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C2F1371A079
	for <lists+selinux@lfdr.de>; Thu,  1 Jun 2023 16:40:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232941AbjFAOkZ (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Thu, 1 Jun 2023 10:40:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233532AbjFAOkX (ORCPT
        <rfc822;selinux@vger.kernel.org>); Thu, 1 Jun 2023 10:40:23 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10780196
        for <selinux@vger.kernel.org>; Thu,  1 Jun 2023 07:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1685630368;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=XZK6BHP4xVwIIppXQ4xd3VFSKwCeAUV1MBdw0ankKOk=;
        b=dkChLGlMbz0leK1lglpunauVzZMmTWs4kmnYa7XY6S2WZ9iw26eUTdM5moAmqBKKu7a6/z
        56XzVv+QJsVfbPfs0zAhvb9CwnQF1pnj855FZEXSr8HSyj3QAFFNfYzlwK9BoiCm4AuMtZ
        UItVw2Ep7R0nKGzr/EjPd8tDOA2tIxg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-516-0WBElp5lMmCFMk3Mds1Awg-1; Thu, 01 Jun 2023 10:39:27 -0400
X-MC-Unique: 0WBElp5lMmCFMk3Mds1Awg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BBB79185A78B
        for <selinux@vger.kernel.org>; Thu,  1 Jun 2023 14:39:26 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.45.226.133])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 5C35314171BB
        for <selinux@vger.kernel.org>; Thu,  1 Jun 2023 14:39:26 +0000 (UTC)
From:   Vit Mojzis <vmojzis@redhat.com>
To:     selinux@vger.kernel.org
Subject: [PATCH v2 3/5] sandbox: Add examples to man pages
Date:   Thu,  1 Jun 2023 16:39:13 +0200
Message-Id: <20230601143915.2051922-3-vmojzis@redhat.com>
In-Reply-To: <20230601143915.2051922-1-vmojzis@redhat.com>
References: <87ttvsk0qx.fsf@redhat.com>
 <20230601143915.2051922-1-vmojzis@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

While at it, remove trailing whitespaces.

Signed-off-by: Vit Mojzis <vmojzis@redhat.com>
---
 sandbox/sandbox.8   | 28 ++++++++++++++++++----------
 sandbox/seunshare.8 | 21 ++++++++++++++-------
 2 files changed, 32 insertions(+), 17 deletions(-)

diff --git a/sandbox/sandbox.8 b/sandbox/sandbox.8
index 1ee0ecea..095b9e27 100644
--- a/sandbox/sandbox.8
+++ b/sandbox/sandbox.8
@@ -11,12 +11,12 @@ sandbox \- Run cmd under an SELinux sandbox
 .br
 .SH DESCRIPTION
 .PP
-Run the 
-.I cmd 
+Run the
+.I cmd
 application within a tightly confined SELinux domain.  The default sandbox domain only allows applications the ability to read and write stdin, stdout and any other file descriptors handed to it. It is not allowed to open any other files.  The \-M option will mount an alternate homedir and tmpdir to be used by the sandbox.
 
-If you have the 
-.I policycoreutils-sandbox 
+If you have the
+.I policycoreutils-sandbox
 package installed, you can use the \-X option and the \-M option.
 .B sandbox \-X
 allows you to run X applications within a sandbox.  These applications will start up their own X Server and create a temporary home directory and /tmp.  The default SELinux policy does not allow any capabilities or network access.  It also prevents all access to the users other processes and files.  Files specified on the command that are in the home directory or /tmp will be copied into the sandbox directories.
@@ -78,27 +78,35 @@ Run a full desktop session, Requires level, and home and tmpdir.
 Specifies the windowsize when creating an X based Sandbox. The default windowsize is 1000x700.
 .TP
 \fB\-W\fR \fB\-\-windowmanager\fR
-Select alternative window manager to run within 
+Select alternative window manager to run within
 .B sandbox \-X.
 Default to /usr/bin/openbox.
 .TP
-\fB\-X\fR 
+\fB\-X\fR
 Create an X based Sandbox for gui apps, temporary files for
 $HOME and /tmp, secondary Xserver, defaults to sandbox_x_t
 .TP
 \fB\-d\fR \fB\-\-dpi\fR
 Set the DPI value for the sandbox X Server. Defaults to the current X Sever DPI.
 .TP
-\fB\-C\fR \fB\-\-capabilities\fR Use capabilities within the
-sandbox. By default applications executed within the sandbox will not
-be allowed to use capabilities (setuid apps), with the \-C flag, you
-can use programs requiring capabilities.
+\fB\-C\fR \fB\-\-capabilities\fR
+Use capabilities within the sandbox. By default applications executed within the sandbox will not be allowed to use capabilities (setuid apps), with the \-C flag, you can use programs requiring capabilities.
 .PP
 .SH "SEE ALSO"
 .TP
 runcon(1), seunshare(8), selinux(8)
 .PP
 
+.SH EXAMPLE
+.nf
+Run a graphical application inside the sandbox
+# sandbox -X evince
+Run a graphical application that requires the use of network
+# sandbox ‑X ‑t sandbox_web_t firefox
+Preserve data from one session to the next
+# mkdir -p ~/sandbox/home ~/sandbox/tmp
+# sandbox -H ~/sandbox/home -T ~/sandbox/tmp -X libreoffice --writer
+
 .SH AUTHOR
 This manual page was written by
 .I Dan Walsh <dwalsh@redhat.com>
diff --git a/sandbox/seunshare.8 b/sandbox/seunshare.8
index 09cf7fea..5339a3b1 100644
--- a/sandbox/seunshare.8
+++ b/sandbox/seunshare.8
@@ -9,29 +9,36 @@ seunshare \- Run cmd with alternate homedir, tmpdir and/or SELinux context
 .PP
 Run the
 .I executable
-within the specified context, using the alternate home directory and /tmp directory.  The seunshare command unshares from the default namespace, then mounts the specified homedir and tmpdir over the default homedir and /tmp. Finally it tells the kernel to execute the application under the specified SELinux context.
+within the specified context, using custom home directory and /tmp directory. The seunshare command unshares from the default namespace, then mounts the specified homedir and tmpdir over the default homedir and /tmp. Finally it tells the kernel to execute the application under the specified SELinux context.
 
 .TP
 \fB\-h homedir\fR
-Alternate homedir to be used by the application.  Homedir must be owned by the user.
+Alternate homedir to be used by the application. Homedir must be owned by the user
 .TP
 \fB\-t\ tmpdir
-Use alternate temporary directory to mount on /tmp.  tmpdir must be owned by the user.
+Use alternate temporary directory to mount on /tmp. tmpdir must be owned by the user
 .TP
 \fB\-r\ runuserdir
-Use alternate temporary directory to mount on XDG_RUNTIME_DIR (/run/user/$UID). runuserdir must be owned by the user.
+Use alternate temporary directory to mount on XDG_RUNTIME_DIR (/run/user/$UID). runuserdir must be owned by the user
 .TP
 \fB\-C --capabilities\fR
-Allow apps executed within the namespace to use capabilities.  Default is no capabilities.
+Allow apps executed within the namespace to use capabilities. Default is no capabilities
 .TP
 \fB\-k --kill\fR
-Kill all processes with matching MCS level.
+Kill all processes with matching MCS level
 .TP
 \fB\-Z\ context
-Use alternate SELinux context while running the executable.
+Use alternate SELinux context while running the executable
 .TP
 \fB\-v\fR
 Verbose output
+
+.SH EXAMPLE
+.nf
+Run bash with temporary /home and /tmp directory
+# USERHOMEDIR=`mktemp -d /tmp/home.XXXXXX`; USERTEMPDIR=`mktemp -d /tmp/temp.XXXXXX`
+# seunshare -v -h ${USERHOMEDIR} -t ${USERTEMPDIR} -- /bin/bash
+
 .SH "SEE ALSO"
 .TP
 runcon(1), sandbox(8), selinux(8)
-- 
2.40.0

