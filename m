Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3645472992
	for <lists+selinux@lfdr.de>; Mon, 13 Dec 2021 11:24:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239679AbhLMKX0 (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Mon, 13 Dec 2021 05:23:26 -0500
Received: from mailomta17-re.btinternet.com ([213.120.69.110]:41161 "EHLO
        re-prd-fep-042.btinternet.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S239573AbhLMKQk (ORCPT
        <rfc822;selinux@vger.kernel.org>); Mon, 13 Dec 2021 05:16:40 -0500
Received: from re-prd-rgout-002.btmx-prd.synchronoss.net ([10.2.54.5])
          by re-prd-fep-042.btinternet.com with ESMTP
          id <20211213101637.EWCV12369.re-prd-fep-042.btinternet.com@re-prd-rgout-002.btmx-prd.synchronoss.net>;
          Mon, 13 Dec 2021 10:16:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=btinternet.com; s=btmx201904; t=1639390597; 
        bh=CmBj0ZX+cEJPL+DLBKIjG0SU6ob3J+pfhzHyFhfG4fo=;
        h=From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version;
        b=PwcGcCvO0K2fDzX156lgw85E8Ahr+64i1dOTQvKt08LgPFGnqNl+IBB0ktHONAFzmIFGVm8qqYLBKrtQBuLH1YkRvOc398CHvmHdhQf6GAvR4Adxf2e1Y6Xj5MQB45pvuoaZpqQwI1DPbeISceHORTg76gYQvk6YOd5hR+DduXEoVc4h5llhEMScatzfM7UsZ0qnnRM2vagsgBJGK/d+iQBvwEYKzczIcS6j67A/2H6eOgZ6gGJLW660lGIaRR2dO6w3N42Hg74FMe7+vAzG2fHM9gLmLhgKuUp7enFxRoX1KU1Y4JD6Of+ChgkyRwW1X3OQRLecGQpKMtHs71VyCA==
Authentication-Results: btinternet.com; none
X-SNCR-Rigid: 613A8DE80D18AF85
X-Originating-IP: [217.42.116.92]
X-OWM-Source-IP: 217.42.116.92 (GB)
X-OWM-Env-Sender: richard_c_haines@btinternet.com
X-VadeSecure-score: verdict=clean score=0/300, class=clean
X-RazorGate-Vade: gggruggvucftvghtrhhoucdtuddrgedvuddrkeekgddugecutefuodetggdotefrodftvfcurfhrohhfihhlvgemuceutffkvffkuffjvffgnffgvefqofdpqfgfvfenuceurghilhhouhhtmecufedtudenucenucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomheptfhitghhrghrugcujfgrihhnvghsuceorhhitghhrghruggptggphhgrihhnvghssegsthhinhhtvghrnhgvthdrtghomheqnecuggftrfgrthhtvghrnhepudeukefgueevudeitdelueeggeefheefffekhefgveegkeeiudeltdduvefgteetnecuffhomhgrihhnpehgihhthhhusgdrtghomhdpphhoshhtghhrvghsqhhlrdhorhhgnecukfhppedvudejrdegvddrudduiedrledvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehhvghloheplhhotggrlhhhohhsthdrlhhotggrlhguohhmrghinhdpihhnvghtpedvudejrdegvddrudduiedrledvpdhmrghilhhfrhhomheprhhitghhrghruggptggphhgrihhnvghssegsthhinhhtvghrnhgvthdrtghomhdprhgtphhtthhopegusghurhhgvghnvghrsehlihhnuhigrdhmihgtrhhoshhofhhtrdgtohhmpdhrtghpthhtohepphgruhhlsehprghulhdqmhhoohhrvgdrtghomhdprhgtphhtthhopehrihgthhgrrhgupggtpghhrghinhgvshessghtihhnthgvrhhnvghtrdgtohhmpdhrtghpthhtohepshgvlhhinhhugiesvhhgvghrrdhkvghr
        nhgvlhdrohhrgh
X-RazorGate-Vade-Verdict: clean 0
X-RazorGate-Vade-Classification: clean
X-SNCR-hdrdom: btinternet.com
Received: from localhost.localdomain (217.42.116.92) by re-prd-rgout-002.btmx-prd.synchronoss.net (5.8.716.04) (authenticated as richard_c_haines@btinternet.com)
        id 613A8DE80D18AF85; Mon, 13 Dec 2021 10:16:37 +0000
From:   Richard Haines <richard_c_haines@btinternet.com>
To:     selinux@vger.kernel.org
Cc:     paul@paul-moore.com, dburgener@linux.microsoft.com,
        Richard Haines <richard_c_haines@btinternet.com>
Subject: [PATCH V2 1/4] selinux-notebook: Make file links consistent
Date:   Mon, 13 Dec 2021 10:16:19 +0000
Message-Id: <20211213101622.29888-2-richard_c_haines@btinternet.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211213101622.29888-1-richard_c_haines@btinternet.com>
References: <20211213101622.29888-1-richard_c_haines@btinternet.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Before building EPUB book the file links to the notebook-examples
directory area needs to be consistent. This will allow sed to fix the path
during the build (as pandoc insists on defaulting to file:///EPUB/text).

Signed-off-by: Richard Haines <richard_c_haines@btinternet.com>
---
 src/bounds_rules.md     |  2 +-
 src/cil_overview.md     |  2 +-
 src/embedded_systems.md | 12 ++++++------
 src/network_support.md  |  4 ++--
 src/postgresql.md       |  6 +++---
 src/seandroid.md        |  4 ++--
 src/toc.md              |  2 +-
 7 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/src/bounds_rules.md b/src/bounds_rules.md
index 650f817..b3afb6c 100644
--- a/src/bounds_rules.md
+++ b/src/bounds_rules.md
@@ -11,7 +11,7 @@ policy. However only the *typebounds* rule is currently implemented by
 The CIL language does support *userbounds* and *rolebounds* but these are
 resolved at policy compile time, not via the kernel at run-time (i.e. they are
 NOT enforced by the SELinux kernel services). The
-[**CIL Reference Guide**](notebook-examples/selinux-policy/cil/CIL_Reference_Guide.pdf)
+[**CIL Reference Guide**](./notebook-examples/selinux-policy/cil/CIL_Reference_Guide.pdf)
 gives details.
 
 ## *typebounds*
diff --git a/src/cil_overview.md b/src/cil_overview.md
index ddb70f6..f39e156 100644
--- a/src/cil_overview.md
+++ b/src/cil_overview.md
@@ -6,7 +6,7 @@ have been documented within the CIL compiler source, available at:
 <https://github.com/SELinuxProject/selinux/tree/master/secilc/docs>
 
 A PDF version is included in this documentation:
-[**CIL Reference Guide**](notebook-examples/selinux-policy/cil/CIL_Reference_Guide.pdf)
+[**CIL Reference Guide**](./notebook-examples/selinux-policy/cil/CIL_Reference_Guide.pdf)
 
 The CIL compiler source can be found at:
 <https://github.com/SELinuxProject/selinux.git> within the *secilc* and
diff --git a/src/embedded_systems.md b/src/embedded_systems.md
index f2c5112..75821fe 100644
--- a/src/embedded_systems.md
+++ b/src/embedded_systems.md
@@ -342,7 +342,7 @@ cd refpolicy
 
 For the initial configuration, either replace the current *build.conf*
 file with the sample
-[***build.conf***](notebook-examples/embedded-policy/reference-policy/build.conf)
+[***build.conf***](./notebook-examples/embedded-policy/reference-policy/build.conf)
 or edit the current *build.conf* file to the requirements (e.g. MONOLITHIC = y)
 
 Install the source policy in the build directory:
@@ -367,7 +367,7 @@ make conf
 ```
 
 Replace the current *policy/modules.conf* with the sample
-[***modules.conf***](notebook-examples/embedded-policy/reference-policy/modules.conf)
+[***modules.conf***](./notebook-examples/embedded-policy/reference-policy/modules.conf)
 and run:
 
 ```
@@ -482,7 +482,7 @@ git checkout android-4.1.1_r1
 ```
 
 - Copy the text below into a
-  [*Makefile*](notebook-examples/embedded-policy/android-policy/android-4/Makefile)
+  [*Makefile*](./notebook-examples/embedded-policy/android-policy/android-4/Makefile)
   installed in the *sepolicy* directory.
 
 ```
@@ -517,9 +517,9 @@ Over time the Android policy locked down more and more processes and then
 became more complex as policy version control was required when upgrading.
 The **Brillo** release was their first IoT release and can be built using the
 instructions in the
-[*brillo/Makefile*](notebook-examples/embedded-policy/android-policy/brillo/Makefile)
+[*brillo/Makefile*](./notebook-examples/embedded-policy/android-policy/brillo/Makefile)
 To build a policy containing a device, follow the instructions in the
-[*brillo-device/Makefile*](notebook-examples/embedded-policy/android-policy/brillo-device/Makefile)
+[*brillo-device/Makefile*](./notebook-examples/embedded-policy/android-policy/brillo-device/Makefile)
 as a device policy must be obtained from the Android repository.
 
 Later Android split policy into private and public segments, they also used
@@ -527,7 +527,7 @@ CIL for some policy components as described in the
 [**Android - The SELinux Policy**](seandroid.md#the-selinux-policy) section.
 The **Android 10** release policy is an example where this split policy is used.
 This can be built using the instructions in the
-[*android-10/Makefile*](notebook-examples/embedded-policy/android-policy/android-10/Makefile).
+[*android-10/Makefile*](./notebook-examples/embedded-policy/android-policy/android-10/Makefile).
 
 [^fn_em_1]: An example of this integration is setting a new process context as
 shown in the Zygote code:
diff --git a/src/network_support.md b/src/network_support.md
index 21759bf..bec725e 100644
--- a/src/network_support.md
+++ b/src/network_support.md
@@ -349,7 +349,7 @@ netlabelctl calipso add pass doi:16
 **Figure 16:** - *MLS Systems on different networks communicating via a gateway*
 
 There are CIPSO/CALIPSO examples in the
-[***notebook-examples/network/netlabel***](notebook-examples/network/README.md)
+[***notebook-examples/network/netlabel***](./notebook-examples/network/README.md)
 section. The CALIPSO example ***netlabelctl**(8)* commands for loopback are:
 
 ```
@@ -518,7 +518,7 @@ firewall-cmd --add-service ipsec
 ```
 
 There are two simple examples in the
-[***notebook-examples/network/ipsec***](notebook-examples/network/README.md)
+[***notebook-examples/network/ipsec***](./notebook-examples/network/README.md)
 section. These use ***setkey**(8)* and commands directly
 and therefore do not require the IKE daemons.
 
diff --git a/src/postgresql.md b/src/postgresql.md
index 595a594..81a6d01 100644
--- a/src/postgresql.md
+++ b/src/postgresql.md
@@ -38,7 +38,7 @@ sequences. **Table 1: Database Security Context Information** shows a simple
 database with one table and two columns, each with their object class and
 associated security context (the [**Internal Tables**](#internal-tables)
 section shows these entries from the *testdb* database in the
-[**Notebook sepgsql Example**](notebook-examples/sepgsql/testdb-example.sql).
+[**Notebook sepgsql Example**](./notebook-examples/sepgsql/testdb-example.sql).
 The database object classes and permissions are described in
 [**Appendix A - Object Classes and Permissions**](object_classes_permissions.md#database-object-classes).
 
@@ -88,7 +88,7 @@ The [**https://www.postgresql.org/docs/11/sepgsql.html**](https://www.postgresql
 page contains all the information required to install the *sepgsql* extension.
 
 There are also instructions in the
-[**Notebook sepgsql Example - README**](notebook-examples/sepgsql/README.md)
+[**Notebook sepgsql Example - README**](./notebook-examples/sepgsql/README.md)
 that describes building the example database used in the sections below.
 
 ## *SECURITY LABEL* SQL Command
@@ -207,7 +207,7 @@ is shown in the table below and has been taken from
 
 These are entries taken from a '*SELECT * FROM pg_seclabel;*' command
 that refers to the example *testdb* database built using the
-[**Notebook - testdb-example.sql**](notebook-examples/sepgsql/testdb-example.sql):
+[**Notebook - testdb-example.sql**](./notebook-examples/sepgsql/testdb-example.sql):
 
 ```
 objoid  | classoid | objsubid | provider |          label
diff --git a/src/seandroid.md b/src/seandroid.md
index dc90513..b6cb8b6 100644
--- a/src/seandroid.md
+++ b/src/seandroid.md
@@ -210,7 +210,7 @@ The Android specific object classes are described in the
 [**Android Classes & Permissions**](#android-classes-permissions)
 section.
 
-The [**Embedded Systems - Building A Sample Android Policy**](embedded-systems#building-a-sample-android-policy)
+The [**Embedded Systems - Building A Sample Android Policy**](embedded-systems.md#building-a-sample-android-policy)
 section explains how to build basic Android policies. These can be explored
 without requiring the full AOSP source and build environment.
 
@@ -939,7 +939,7 @@ Usage:
 
 **insertkeys.py** - A helper script for mapping tags in the signature stanzas
 of *mac_permissions.xml* to public keys found in pem files (see the
-[***mac_permissions.xml***](mac_permissions.xml) file section).
+[***mac_permissions.xml***](#mac_permissions.xml) file section).
 The resulting *mac_permissions.xml* file will also be stripped of
 comments and whitespace.
 
diff --git a/src/toc.md b/src/toc.md
index f5778bd..a51732b 100644
--- a/src/toc.md
+++ b/src/toc.md
@@ -32,7 +32,7 @@
   - [Policy Configuration Files](policy_config_files.md#policy-configuration-files)
 - [SELinux Policy Languages](policy_languages.md#the-selinux-policy-languages)
   - [CIL Policy Language](cil_overview.md#cil-overview)
-    - [CIL Reference Guide](notebook-examples/selinux-policy/cil/CIL_Reference_Guide.pdf)
+    - [CIL Reference Guide](./notebook-examples/selinux-policy/cil/CIL_Reference_Guide.pdf)
   - [Kernel Policy Language](kernel_policy_language.md#kernel-policy-language)
     - [Policy Configuration Statements](policy_config_statements.md#policy-configuration-statements)
     - [Default Rules](default_rules.md#default-object-rules)
-- 
2.33.1

