Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 66A4C6120C
	for <lists+selinux@lfdr.de>; Sat,  6 Jul 2019 17:57:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726922AbfGFP5e (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Sat, 6 Jul 2019 11:57:34 -0400
Received: from rgout05.bt.lon5.cpcloud.co.uk ([65.20.0.182]:6752 "EHLO
        rgout05.bt.lon5.cpcloud.co.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726446AbfGFP5d (ORCPT
        <rfc822;selinux@vger.kernel.org>); Sat, 6 Jul 2019 11:57:33 -0400
X-OWM-Source-IP: 86.147.205.157 (GB)
X-OWM-Env-Sender: richard_c_haines@btinternet.com
X-RazorGate-Vade-Classification: clean
X-RazorGate-Vade-Verdict: clean 0
X-VadeSecure-score: verdict=clean score=0/300, class=clean
X-SNCR-VADESECURE: CLEAN
X-RazorGate-Vade-Verdict: clean 0
X-RazorGate-Vade-Classification: clean
X-RazorGate-Vade: gggruggvucftvghtrhhoucdtuddrgeduvddrfeeigdekkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemuceutffkvffkuffjvffgnffgvefqofdpqfgfvfenuceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomheptfhitghhrghrugcujfgrihhnvghsuceorhhitghhrghruggptggphhgrihhnvghssegsthhinhhtvghrnhgvthdrtghomheqnecukfhppeekiedrudegjedrvddthedrudehjeenucfrrghrrghmpehhvghloheplhhotggrlhhhohhsthdrlhhotggrlhguohhmrghinhdpihhnvghtpeekiedrudegjedrvddthedrudehjedpmhgrihhlfhhrohhmpeeorhhitghhrghruggptggphhgrihhnvghssegsthhinhhtvghrnhgvthdrtghomheqpdhrtghpthhtohepoehnihgtohhlrghsrdhiohhoshhssehmgeigrdhorhhgqedprhgtphhtthhopeeorhhitghhrghruggptggphhgrihhnvghssegsthhinhhtvghrnhgvthdrtghomheqpdhrtghpthhtohepoehsughssehthigthhhordhnshgrrdhgohhvqedprhgtphhtthhopeeoshgvlhhinhhugiesvhhgvghrrdhkvghrnhgvlhdrohhrgheqpdhrtghpthhtohepoeiguhhntghhrghnghesghhoohhglhgvrdgtohhmqeenucevlhhushhtvghrufhiiigvpedt
X-RazorGate-Vade-Classification: clean
X-RazorGate-Vade-Verdict: clean 0
X-VadeSecure-score: verdict=clean score=0/300, class=clean
X-SNCR-VADESECURE: CLEAN
X-RazorGate-Vade-Verdict: clean 0
X-RazorGate-Vade-Classification: clean
X-RazorGate-Vade: gggruggvucftvghtrhhoucdtuddrgeduvddrfeeigdeltdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemuceutffkvffkuffjvffgnffgvefqofdpqfgfvfenuceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomheptfhitghhrghrugcujfgrihhnvghsuceorhhitghhrghruggptggphhgrihhnvghssegsthhinhhtvghrnhgvthdrtghomheqnecukfhppeekiedrudegjedrvddthedrudehjeenucfrrghrrghmpehhvghloheplhhotggrlhhhohhsthdrlhhotggrlhguohhmrghinhdpihhnvghtpeekiedrudegjedrvddthedrudehjedpmhgrihhlfhhrohhmpeeorhhitghhrghruggptggphhgrihhnvghssegsthhinhhtvghrnhgvthdrtghomheqpdhrtghpthhtohepoehsvghlihhnuhigsehvghgvrhdrkhgvrhhnvghlrdhorhhgqeenucevlhhushhtvghrufhiiigvpedt
X-RazorGate-Vade-Classification: clean
X-RazorGate-Vade-Verdict: clean 0
X-VadeSecure-score: verdict=clean score=0/300, class=clean
X-SNCR-VADESECURE: CLEAN
X-RazorGate-Vade-Verdict: clean 0
X-RazorGate-Vade-Classification: clean
X-RazorGate-Vade: gggruggvucftvghtrhhoucdtuddrgeduvddrfeeigdelvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemuceutffkvffkuffjvffgnffgvefqofdpqfgfvfenuceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomheptfhitghhrghrugcujfgrihhnvghsuceorhhitghhrghruggptggphhgrihhnvghssegsthhinhhtvghrnhgvthdrtghomheqnecukfhppeekiedrudegjedrvddthedrudehjeenucfrrghrrghmpehhvghloheplhhotggrlhhhohhsthdrlhhotggrlhguohhmrghinhdpihhnvghtpeekiedrudegjedrvddthedrudehjedpmhgrihhlfhhrohhmpeeorhhitghhrghruggptggphhgrihhnvghssegsthhinhhtvghrnhgvthdrtghomheqpdhrtghpthhtohepoehsvghlihhnuhigsehvghgvrhdrkhgvrhhnvghlrdhorhhgqeenucevlhhushhtvghrufhiiigvpedt
X-RazorGate-Vade-Classification: clean
X-RazorGate-Vade-Verdict: clean 0
X-VadeSecure-score: verdict=clean score=0/300, class=clean
X-SNCR-VADESECURE: CLEAN
X-RazorGate-Vade-Verdict: clean 0
X-RazorGate-Vade-Classification: clean
X-RazorGate-Vade: gggruggvucftvghtrhhoucdtuddrgeduvddrfeeigdelhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemuceutffkvffkuffjvffgnffgvefqofdpqfgfvfenuceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomheptfhitghhrghrugcujfgrihhnvghsuceorhhitghhrghruggptggphhgrihhnvghssegsthhinhhtvghrnhgvthdrtghomheqnecukfhppeekiedrudegjedrvddthedrudehjeenucfrrghrrghmpehhvghloheplhhotggrlhhhohhsthdrlhhotggrlhguohhmrghinhdpihhnvghtpeekiedrudegjedrvddthedrudehjedpmhgrihhlfhhrohhmpeeorhhitghhrghruggptggphhgrihhnvghssegsthhinhhtvghrnhgvthdrtghomheqpdhrtghpthhtohepoehsvghlihhnuhigsehvghgvrhdrkhgvrhhnvghlrdhorhhgqeenucevlhhushhtvghrufhiiigvpedt
Received: from localhost.localdomain (86.147.205.157) by rgout05.bt.lon5.cpcloud.co.uk (9.0.019.26-1) (authenticated as richard_c_haines@btinternet.com)
        id 5C24804F11ED602F; Sat, 6 Jul 2019 16:21:20 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=btinternet.com; s=btcpcloud; t=1562428653; 
        bh=Zgua94MQaA/VBicPl+gZOLDwmOLWZrCteOW1/jfNBm8=;
        h=From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version;
        b=lmMtuM850tFDhUMKuIUhIXw3UpXfQjWtLeFpALy2FkynQELoKFK4Czt6j4s/pqcFahb+Zl4B3W8k6JcZLH67bs7OIoruiRX4Q+v+uTC2TRqmc0Eh5Z9AQgMJIOiHog4yl/FhNM2JeaWR2hipoVgM2NAGv+BXHiE2F+v2++4OPpQ=
From:   Richard Haines <richard_c_haines@btinternet.com>
To:     selinux@vger.kernel.org, sds@tycho.nsa.gov
Cc:     xunchang@google.com, nicolas.iooss@m4x.org,
        Richard Haines <richard_c_haines@btinternet.com>
Subject: [PATCH V4 2/2] setfiles: Update utilities for the new digest scheme
Date:   Sat,  6 Jul 2019 16:21:15 +0100
Message-Id: <20190706152115.8490-3-richard_c_haines@btinternet.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190706152115.8490-1-richard_c_haines@btinternet.com>
References: <20190706152115.8490-1-richard_c_haines@btinternet.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Update restorecon_xattr and man pages for new digest scheme
managed by selinux_restorecon(3).

Note that the Russian man pages require updating.

Signed-off-by: Richard Haines <richard_c_haines@btinternet.com>
---
V2 Change
Keep restorecon(8) and setfiles(8) as they were for compatibility

 policycoreutils/setfiles/restorecon.8       | 10 +++++-----
 policycoreutils/setfiles/restorecon_xattr.8 | 20 +++++++++-----------
 policycoreutils/setfiles/restorecon_xattr.c |  2 +-
 policycoreutils/setfiles/setfiles.8         | 10 +++++-----
 4 files changed, 20 insertions(+), 22 deletions(-)

diff --git a/policycoreutils/setfiles/restorecon.8 b/policycoreutils/setfiles/restorecon.8
index 0f81db4..bbfc83f 100644
--- a/policycoreutils/setfiles/restorecon.8
+++ b/policycoreutils/setfiles/restorecon.8
@@ -100,7 +100,7 @@ section for further details.
 .B \-D
 Set or update any directory SHA1 digests. Use this option to
 enable usage of the
-.IR security.restorecon_last
+.IR security.sehash
 extended attribute.
 .TP
 .B \-m
@@ -184,10 +184,10 @@ option to
 .B restorecon
 will cause it to store a SHA1 digest of the default specfiles set in an extended
 attribute named
-.IR security.restorecon_last
-on the directory specified in each
+.IR security.sehash
+on each directory specified in
 .IR pathname \ ...
-once the relabeling has been completed successfully. This digest will be
+once the relabeling has been completed successfully. These digests will be
 checked should
 .B restorecon
 .B \-D
@@ -204,7 +204,7 @@ option will ignore the SHA1 digest from each directory specified in
 and provided the
 .B \-n
 option is NOT set and recursive mode is set, files will be relabeled as
-required with the digest then being updated provided there are no errors.
+required with the digests then being updated provided there are no errors.
 
 .SH "AUTHOR"
 This man page was written by Dan Walsh <dwalsh@redhat.com>.
diff --git a/policycoreutils/setfiles/restorecon_xattr.8 b/policycoreutils/setfiles/restorecon_xattr.8
index 65b28ea..e04528e 100644
--- a/policycoreutils/setfiles/restorecon_xattr.8
+++ b/policycoreutils/setfiles/restorecon_xattr.8
@@ -1,7 +1,7 @@
 .TH "restorecon_xattr" "8" "24 Sept 2016" "" "SELinux User Command"
 .SH "NAME"
 restorecon_xattr \- manage
-.I security.restorecon_last
+.I security.sehash
 extended attribute entries added by
 .BR setfiles (8)
 or
@@ -24,7 +24,7 @@ or
 .SH "DESCRIPTION"
 .B restorecon_xattr
 will display the SHA1 digests added to extended attributes
-.I security.restorecon_last
+.I security.sehash
 or delete the attribute completely. These attributes are set by
 .BR restorecon (8)
 or
@@ -43,7 +43,7 @@ from.
 and
 .B TMPFS
 filesystems do not support the
-.I security.restorecon_last
+.I security.sehash
 extended attribute and are automatically excluded from searches.
 .sp
 By default
@@ -62,12 +62,12 @@ option.
 .TP
 .B \-d
 delete all non-matching
-.I security.restorecon_last
+.I security.sehash
 directory digest entries.
 .TP
 .B \-D
 delete all
-.I security.restorecon_last
+.I security.sehash
 directory digest entries.
 .TP
 .B \-m
@@ -87,7 +87,10 @@ Do not append "Match" or "No Match" to displayed digests.
 recursively descend directories.
 .TP
 .B \-v
-display SHA1 digest generated by specfile set.
+display SHA1 digest generated by specfile set (Note that this digest is not
+used to match the
+.I security.sehash
+directory digest entries, and is shown for reference only).
 .TP
 .B \-e
 .I directory
@@ -101,11 +104,6 @@ an optional
 .I specfile
 containing file context entries as described in
 .BR file_contexts (5).
-This will be used by
-.BR selabel_open (3)
-to retrieve the set of labeling entries, with the SHA1 digest being
-retrieved by
-.BR selabel_digest (3).
 If the option is not specified, then the default file_contexts will be used.
 
 .SH "ARGUMENTS"
diff --git a/policycoreutils/setfiles/restorecon_xattr.c b/policycoreutils/setfiles/restorecon_xattr.c
index 91c087f..59b1f74 100644
--- a/policycoreutils/setfiles/restorecon_xattr.c
+++ b/policycoreutils/setfiles/restorecon_xattr.c
@@ -27,7 +27,7 @@ static __attribute__((__noreturn__)) void usage(const char *progname)
 		"-D  Delete all digest entries.\n\t"
 		"-e  Directory to exclude (repeat option for more than one directory).\n\t"
 		"-f  Optional specfile for calculating the digest.\n\t"
-		"pathname  Path to search for xattr \"security.restorecon_last\" entries.\n\n",
+		"pathname  Path to search for xattr \"security.sehash\" entries.\n\n",
 		progname);
 	exit(-1);
 }
diff --git a/policycoreutils/setfiles/setfiles.8 b/policycoreutils/setfiles/setfiles.8
index ccaaf4d..c9f8be0 100644
--- a/policycoreutils/setfiles/setfiles.8
+++ b/policycoreutils/setfiles/setfiles.8
@@ -90,7 +90,7 @@ section for further details.
 .B \-D
 Set or update any directory SHA1 digests. Use this option to
 enable usage of the
-.IR security.restorecon_last
+.IR security.sehash
 extended attribute.
 .TP
 .B \-l
@@ -228,10 +228,10 @@ option to
 will cause it to store a SHA1 digest of the
 .B spec_file
 set in an extended attribute named
-.IR security.restorecon_last
-on the directory specified in each
+.IR security.sehash
+on each directory specified in
 .IR pathname \ ...
-once the relabeling has been completed successfully. This digest will be
+once the relabeling has been completed successfully. These digests will be
 checked should
 .B setfiles
 .B \-D
@@ -250,7 +250,7 @@ option will ignore the SHA1 digest from each directory specified in
 .IR pathname \ ...
 and provided the
 .B \-n
-option is NOT set, files will be relabeled as required with the digest then
+option is NOT set, files will be relabeled as required with the digests then
 being updated provided there are no errors.
 
 .SH "AUTHOR"
-- 
2.21.0

