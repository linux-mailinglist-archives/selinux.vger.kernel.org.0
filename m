Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18CAF2356DC
	for <lists+selinux@lfdr.de>; Sun,  2 Aug 2020 14:09:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728014AbgHBMJN (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Sun, 2 Aug 2020 08:09:13 -0400
Received: from agnus.defensec.nl ([80.100.19.56]:49240 "EHLO agnus.defensec.nl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726578AbgHBMJN (ORCPT <rfc822;selinux@vger.kernel.org>);
        Sun, 2 Aug 2020 08:09:13 -0400
Received: from localhost.localdomain (brutus.lan [IPv6:2001:985:d55d::438])
        by agnus.defensec.nl (Postfix) with ESMTPSA id 3B20D2A1010;
        Sun,  2 Aug 2020 14:09:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 agnus.defensec.nl 3B20D2A1010
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=defensec.nl;
        s=default; t=1596370146;
        bh=37Fpgl3LEvQEq3gIy8ngQLy6xDX8rjO/I7ZGs+CdEH0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=h0H+XMOX/LlygVJubu+/dP/OfbnxArqQ4KjXQUTYyHwqGw/M9PfMk5AgMTTc/jjCK
         Ze7VxKyglKc0kftLz1x88hv0IidXr47moe2zcMe7y+dzBckr+5Ni6/CH5EcpkL9knc
         krLi9fjkCHrLd75sed9shjuJono8qdQQHUEdW+r0=
From:   Dominick Grift <dominick.grift@defensec.nl>
To:     selinux@vger.kernel.org
Cc:     Dominick Grift <dominick.grift@defensec.nl>
Subject: [SELinux-notebook PATCH v4] type_statements: document expandattribute
Date:   Sun,  2 Aug 2020 14:08:47 +0200
Message-Id: <20200802120847.218916-1-dominick.grift@defensec.nl>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <CAHC9VhS5x_YorZw5szDY3tDw=SHkhowujiivCDQy2GQRpASv1A@mail.gmail.com>
References: <CAHC9VhS5x_YorZw5szDY3tDw=SHkhowujiivCDQy2GQRpASv1A@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

This functionality was added for Androids Treble in 2017.

Signed-off-by: Dominick Grift <dominick.grift@defensec.nl>
---
v2: change expandtypeattribute to expandattribute
v3: overriden is overridden
v4: convert to markdown

 src/type_statements.md | 686 ++++++++++++++++++-----------------------
 1 file changed, 295 insertions(+), 391 deletions(-)

diff --git a/src/type_statements.md b/src/type_statements.md
index 61c7191..0d7c7c7 100644
--- a/src/type_statements.md
+++ b/src/type_statements.md
@@ -1,7 +1,7 @@
 # Type Statements
 
 These statements share the same namespace, therefore the general
-convention is to use `_t` as the final two characters of a type
+convention is to use *_t* as the final two characters of a type
 identifier to differentiate it from an attribute identifier as shown in
 the following examples:
 
@@ -13,12 +13,10 @@ type bin_t;              # A type identifier generally ends with _t
 attribute file_type;     # An attribute identifier generally ends with _type
 ```
 
-<br>
+## *type*
 
-## `type`
-
-The `type` statement declares the type identifier and any optional
-associated `alias` or `attribute` identifiers. Type identifiers are a
+The *type* statement declares the type identifier and any optional
+associated *alias* or *attribute* identifiers. Type identifiers are a
 component of the [**Security Context**](security_context.md#security-context).
 
 **The statement definition is:**
@@ -27,57 +25,44 @@ component of the [**Security Context**](security_context.md#security-context).
 
 **Where:**
 
-<table>
-<tbody>
-<tr>
-<td><code>type</code></td>
-<td>The <code>type</code> keyword.</td>
-</tr>
-<tr>
-<td><code>type_id</code></td>
-<td>The <code>type</code> identifier.</td>
-</tr>
-<tr>
-<td><code>alias</code></td>
-<td>Optional <code>alias</code> keyword that signifies alternate identifiers for the <code>type_id</code> that are declared in the <code>alias_id</code> list.</td>
-</tr>
-<tr>
-<td><code>alias_id</code></td>
-<td>One or more <code>alias</code> identifiers that have been previously declared by the <a href="#typealias"><code>typealias</code></a> statement. Multiple entries consist of a space separated list enclosed in braces '{}'.</td>
-</tr>
-<tr>
-<td><code>attribute_id</code></td>
-<td>One or more optional <code>attribute</code> identifiers that have been previously declared by the <a href="#attribute"><code>attribute</code></a> statement. Multiple entries consist of a comma ',' separated list, also note the lead comma.</td>
-</tr>
-</tbody>
-</table>
+*type*
+
+The *type* keyword.
+
+*type_id*
+
+The *type* identifier.
+
+*alias*
+
+Optional *alias* keyword that signifies alternate identifiers for the *type_id*
+that are declared in the *alias_id* list.
+
+*alias_id*
+
+One or more *alias* identifiers that have been previously declared by the
+[*typealias*](#typealias) statement. Multiple entries consist of a space
+separated list enclosed in braces '{}'.
+
+*attribute_id*
+
+One or more optional *attribute* identifiers that have been previously declared
+by the [*attribute*](#attribute) statement. Multiple entries consist of a comma
+',' separated list, also note the lead comma.
 
 **The statement is valid in:**
 
-<table style="text-align:center">
-<tbody>
-<tr style="background-color:#D3D3D3;">
-<td><strong>Monolithic Policy</strong></td>
-<td><strong>Base Policy</strong></td>
-<td><strong>Module Policy</strong></td>
-</tr>
-<tr>
-<td>Yes</td>
-<td>Yes</td>
-<td>Yes</td>
-</tr>
-<tr style="background-color:#D3D3D3;">
-<td><strong>Conditional Policy <code>if</code> Statement</strong></td>
-<td><strong><code>optional</code> Statement</strong></td>
-<td><strong><code>require</code> Statement</strong></td>
-</tr>
-<tr>
-<td>No</td>
-<td>Yes</td>
-<td>Yes</td>
-</tr>
-</tbody>
-</table>
+Policy Type
+
+| Monolithic Policy       | Base Policy             | Module Policy           |
+| ----------------------- | ----------------------- | ----------------------- |
+| Yes                     | Yes                     | Yes                     |
+
+Conditional Policy Statements
+
+| *if* statement          | *optional* Statement    | *require* Statement     |
+| ----------------------- | ----------------------- | ----------------------- |
+| No                      | Yes                     | Yes                     |
 
 **Examples:**
 
@@ -134,12 +119,10 @@ attribute server_packet_type; # declare attribute 2
 type ssh_server_packet_t, packet_type, server_packet_type;
 ```
 
-<br>
-
-## `attribute`
+## *attribute*
 
-An `attribute` statement declares an identifier that can then be used to
-refer to a group of `type` identifiers.
+An *attribute* statement declares an identifier that can then be used to
+refer to a group of *type* identifiers.
 
 **The statement definition is:**
 
@@ -147,45 +130,27 @@ refer to a group of `type` identifiers.
 
 **Where:**
 
-<table>
-<tbody>
-<tr>
-<td><code>attribute</code></td>
-<td>The <code>attribute</code> keyword.</td>
-</tr>
-<tr>
-<td><code>attribute_id</code></td>
-<td>The <code>attribute</code> identifier.</td>
-</tr>
-</tbody>
-</table>
+*attribute*
+
+The *attribute* keyword.
+
+*attribute_id*
+
+The *attribute* identifier.
 
 **The statement is valid in:**
 
-<table style="text-align:center">
-<tbody>
-<tr style="background-color:#D3D3D3;">
-<td><strong>Monolithic Policy</strong></td>
-<td><strong>Base Policy</strong></td>
-<td><strong>Module Policy</strong></td>
-</tr>
-<tr>
-<td>Yes</td>
-<td>Yes</td>
-<td>Yes</td>
-</tr>
-<tr style="background-color:#D3D3D3;">
-<td><strong>Conditional Policy <code>if</code> Statement</strong></td>
-<td><strong><code>optional</code> Statement</strong></td>
-<td><strong><code>require</code> Statement</strong></td>
-</tr>
-<tr>
-<td>No</td>
-<td>Yes</td>
-<td>Yes</td>
-</tr>
-</tbody>
-</table>
+Policy Type
+
+| Monolithic Policy       | Base Policy             | Module Policy           |
+| ----------------------- | ----------------------- | ----------------------- |
+| Yes                     | Yes                     | Yes                     |
+
+Conditional Policy Statements
+
+| *if* statement          | *optional* Statement    | *require* Statement     |
+| ----------------------- | ----------------------- | ----------------------- |
+| No                      | Yes                     | Yes                     |
 
 **Examples:**
 
@@ -199,11 +164,61 @@ attribute file_type;
 attribute non_security_file_type;
 ```
 
-<br>
+## *expandattribute*
+
+The *expandattribute* statement allows type attribute expansion
+compiler defaults to be overridden.
+
+**The statement definition is:**
+
+`expandattribute attribute_id default_value;`
+
+**Where:**
+
+*expandattribute*
+
+The *expandattribute* keyword.
 
-## `typeattribute`
+*attribute_id*
 
-The `typeattribute` statement allows the association of previously
+One or more *attribute* identifiers that have been previously declared by the
+[*attribute*](#attribute) statement. Multiple entries consist of a space
+separated list enclosed in braces '{}'.
+
+*default_value*
+
+Either true or false.
+
+**The statement is valid in:**
+
+Policy Type
+
+| Monolithic Policy       | Base Policy             | Module Policy           |
+| ----------------------- | ----------------------- | ----------------------- |
+| Yes                     | Yes                     | Yes                     |
+
+Conditional Policy Statements
+
+| *if* statement          | *optional* Statement    | *require* Statement     |
+| ----------------------- | ----------------------- | ----------------------- |
+| No                      | Yes                     | No                      |
+
+**Examples:**
+
+```
+# Using the expandattribute statement to forcibly expand a
+# previously declared domain attribute.
+
+# The previously declared attribute:
+attribute domain;
+
+# The attribute stripping using the expandattribute statement:
+expandattribute domain true;
+```
+
+## *typeattribute*
+
+The *typeattribute* statement allows the association of previously
 declared types to one or more previously declared attributes.
 
 **The statement definition is:**
@@ -212,49 +227,32 @@ declared types to one or more previously declared attributes.
 
 **Where:**
 
-<table>
-<tbody>
-<tr>
-<td><code>typeattribute</code></td>
-<td>The <code>typeattribute</code> keyword.</td>
-</tr>
-<tr>
-<td><code>type_id</code></td>
-<td>The identifier of a previously declared <code>type</code>.</td>
-</tr>
-<tr>
-<td><code>attribute_id</code></td>
-<td>One or more previously declared <code>attribute</code> identifiers. Multiple entries consist of a comma ',' separated list.</td>
-</tr>
-</tbody>
-</table>
+*typeattribute*
+
+The *typeattribute* keyword.
+
+*type_id*
+
+The identifier of a previously declared *type*.
+
+*attribute_id*
+
+One or more previously declared *attribute* identifiers. Multiple entries
+consist of a comma ',' separated list.
 
 **The statement is valid in:**
 
-<table style="text-align:center">
-<tbody>
-<tr style="background-color:#D3D3D3;">
-<td><strong>Monolithic Policy</strong></td>
-<td><strong>Base Policy</strong></td>
-<td><strong>Module Policy</strong></td>
-</tr>
-<tr>
-<td>Yes</td>
-<td>Yes</td>
-<td>Yes</td>
-</tr>
-<tr style="background-color:#D3D3D3;">
-<td><strong>Conditional Policy <code>if</code> Statement</strong></td>
-<td><strong><code>optional</code> Statement</strong></td>
-<td><strong><code>require</code> Statement</strong></td>
-</tr>
-<tr>
-<td>No</td>
-<td>Yes</td>
-<td>No</td>
-</tr>
-</tbody>
-</table>
+Policy Type
+
+| Monolithic Policy       | Base Policy             | Module Policy           |
+| ----------------------- | ----------------------- | ----------------------- |
+| Yes                     | Yes                     | Yes                     |
+
+Conditional Policy Statements
+
+| *if* statement          | *optional* Statement    | *require* Statement     |
+| ----------------------- | ----------------------- | ----------------------- |
+| No                      | Yes                     | No                      |
 
 **Examples:**
 
@@ -289,13 +287,11 @@ type setroubleshootd_exec_t;
 typeattribute setroubleshootd_exec_t file_type, non_security_file_type;
 ```
 
-<br>
+## *typealias*
 
-## `typealias`
-
-The `typealias` statement allows the association of a previously declared
-`type` to one or more `alias` identifiers (an alternative way is to use the
-`type` statement.
+The *typealias* statement allows the association of a previously declared
+*type* to one or more *alias* identifiers (an alternative way is to use the
+*type* statement.
 
 **The statement definition is:**
 
@@ -303,53 +299,36 @@ The `typealias` statement allows the association of a previously declared
 
 **Where:**
 
-<table>
-<tbody>
-<tr>
-<td><code>typealias</code></td>
-<td>The <code>typealias</code> keyword.</td>
-</tr>
-<tr>
-<td><code>type_id</code></td>
-<td>The identifier of a previously declared <code>type</code>.</td>
-</tr>
-<tr>
-<td><code>alias</code></td>
-<td>The <code>alias</code> keyword.</td>
-</tr>
-<tr>
-<td><code>alias_id</code></td>
-<td>One or more <code>alias</code> identifiers. Multiple entries consist of a space separated list enclosed in braces '{}'.</td>
-</tr>
-</tbody>
-</table>
+*typealias*
+
+The *typealias* keyword.
+
+*type_id*
+
+The identifier of a previously declared *type*.
+
+*alias*
+
+The *alias* keyword.
+
+*alias_id*
+
+One or more *alias* identifiers. Multiple entries consist of a space separated
+list enclosed in braces '{}'.
 
 **The statement is valid in:**
 
-<table style="text-align:center">
-<tbody>
-<tr style="background-color:#D3D3D3;">
-<td><strong>Monolithic Policy</strong></td>
-<td><strong>Base Policy</strong></td>
-<td><strong>Module Policy</strong></td>
-</tr>
-<tr>
-<td>Yes</td>
-<td>Yes</td>
-<td>Yes</td>
-</tr>
-<tr style="background-color:#D3D3D3;">
-<td><strong>Conditional Policy <code>if</code> Statement</strong></td>
-<td><strong><code>optional</code> Statement</strong></td>
-<td><strong><code>require</code> Statement</strong></td>
-</tr>
-<tr>
-<td>No</td>
-<td>Yes</td>
-<td>No</td>
-</tr>
-</tbody>
-</table>
+Policy Type
+
+| Monolithic Policy       | Base Policy             | Module Policy           |
+| ----------------------- | ----------------------- | ----------------------- |
+| Yes                     | Yes                     | Yes                     |
+
+Conditional Policy Statements
+
+| *if* statement          | *optional* Statement    | *require* Statement     |
+| ----------------------- | ----------------------- | ----------------------- |
+| No                      | Yes                     | No                      |
 
 **Examples:**
 
@@ -374,14 +353,12 @@ type netif_t;
 typealias netif_t alias { lo_netif_t netif_lo_t };
 ```
 
-<br>
+## *permissive*
 
-## `permissive`
-
-Policy version 23 introduced the `permissive` statement to allow the named
+Policy version 23 introduced the *permissive* statement to allow the named
 domain to run in permissive mode instead of running all SELinux domains
 in permissive mode (that was the only option prior to version 23). Note
-that the `permissive` statement only tests the source context for any
+that the *permissive* statement only tests the source context for any
 policy denial.
 
 **The statement definition is:**
@@ -390,45 +367,27 @@ policy denial.
 
 **Where:**
 
-<table>
-<tbody>
-<tr>
-<td><code>permissive</code></td>
-<td>The <code>permissive</code> keyword.</td>
-</tr>
-<tr>
-<td><code>type_id</code></td>
-<td>The <code>type</code> identifier of the domain that will be run in permissive mode.</td>
-</tr>
-</tbody>
-</table>
+*permissive*
+
+The *permissive* keyword.
+
+*type_id*
+
+The *type* identifier of the domain that will be run in permissive mode.
 
 **The statement is valid in:**
 
-<table style="text-align:center">
-<tbody>
-<tr style="background-color:#D3D3D3;">
-<td><strong>Monolithic Policy</strong></td>
-<td><strong>Base Policy</strong></td>
-<td><strong>Module Policy</strong></td>
-</tr>
-<tr>
-<td>Yes</td>
-<td>Yes</td>
-<td>Yes</td>
-</tr>
-<tr style="background-color:#D3D3D3;">
-<td><strong>Conditional Policy <code>if</code> Statement</strong></td>
-<td><strong><code>optional</code> Statement</strong></td>
-<td><strong><code>require</code> Statement</strong></td>
-</tr>
-<tr>
-<td>No</td>
-<td>Yes</td>
-<td>No</td>
-</tr>
-</tbody>
-</table>
+Policy Type
+
+| Monolithic Policy       | Base Policy             | Module Policy           |
+| ----------------------- | ----------------------- | ----------------------- |
+| Yes                     | Yes                     | Yes                     |
+
+Conditional Policy Statements
+
+| *if* statement          | *optional* Statement    | *require* Statement     |
+| ----------------------- | ----------------------- | ----------------------- |
+| No                      | Yes                     | No                      |
 
 **Examples:**
 
@@ -463,16 +422,13 @@ require {
 permissive unconfined_t;
 ```
 
-<br>
-
-
-## `type_transition`
+## *type_transition*
 
 The type_transition rule specifies the default type to be used for
 domain transistion or object creation. Kernels from 2.6.39 with Policy
 versions from 25 also support the 'name transition rule' extension. See the
 [**Computing Security Contexts**](computing_security_contexts.md#computing-security-contexts)
-section for more details. Note than an `allow` rule must be used to authorise
+section for more details. Note than an *allow* rule must be used to authorise
 the transition.
 
 **The statement definitions are:**
@@ -486,59 +442,46 @@ however, this is only appropriate for the file classes:
 
 **Where:**
 
-<table>
-<tbody>
-<tr>
-<td><code>type_transition</code></td>
-<td>The <code>type_transition</code> rule keyword.</td>
-</tr>
-<tr>
-<td><p><code>source_type</code></p>
-<p><code>target_type</code></p></td>
-<td><p>One or more source / target <code>type</code>, <code>typealias</code> or <code>attribute</code> identifiers. Multiple entries consist of a space separated list enclosed in braces '{}'. </p>
-<p>Entries can be excluded from the list by using the negative operator '-'.</p></td>
-</tr>
-<tr>
-<td><code>class</code></td>
-<td>One or more object classes. Multiple entries consist of a space separated list enclosed in braces '{}'.</td>
-</tr>
-<tr>
-<td><code>default_type</code></td>
-<td>A single <code>type</code> or <code>typealias</code> identifier that will become the default process <code>type</code> for a domain transition or the <code>type</code> for object transitions.</td>
-</tr>
-<tr>
-<td><code>object_name<code></td>
-<td>For the 'name transition' rule this is matched against the objects name (i.e. the last component of a path). If <code>object_name</code> exactly matches the object name, then use <code>default_type</code> for the <code>type</code>.</td>
-</tr>
-</tbody>
-</table>
+*type_transition*
+
+The *type_transition* rule keyword.
+
+*source_type*
+*target_type*
+
+One or more source / target *type*, *typealias* or *attribute* identifiers.
+Multiple entries consist of a space separated list enclosed in braces '{}'.
+Entries can be excluded from the list by using the negative operator '-'.
+
+*class*
+
+One or more object classes. Multiple entries consist of a space separated list
+enclosed in braces '{}'.
+
+*default_type*
+
+A single *type* or *typealias* identifier that will become the default process
+*type* for a domain transition or the *type* for object transitions.
+
+*object_name*
+
+For the 'name transition' rule this is matched against the objects name
+(i.e. the last component of a path). If *object_name* exactly matches the
+object name, then use *default_type* for the *type*.
 
 **The statement is valid in:**
 
-<table style="text-align:center">
-<tbody>
-<tr style="background-color:#D3D3D3;">
-<td><strong>Monolithic Policy</strong></td>
-<td><strong>Base Policy</strong></td>
-<td><strong>Module Policy</strong></td>
-</tr>
-<tr>
-<td>Yes</td>
-<td>Yes</td>
-<td>Yes</td>
-</tr>
-<tr style="background-color:#D3D3D3;">
-<td><strong>Conditional Policy <code>if</code> Statement</strong></td>
-<td><strong><code>optional</code> Statement</strong></td>
-<td><strong><code>require</code> Statement</strong></td>
-</tr>
-<tr>
-<td>Yes</td>
-<td>Yes</td>
-<td>No</td>
-</tr>
-</tbody>
-</table>
+Policy Type
+
+| Monolithic Policy       | Base Policy             | Module Policy           |
+| ----------------------- | ----------------------- | ----------------------- |
+| Yes                     | Yes                     | Yes                     |
+
+Conditional Policy Statements
+
+| *if* statement          | *optional* Statement    | *require* Statement     |
+| ----------------------- | ----------------------- | ----------------------- |
+| Yes                     | Yes                     | No                      |
 
 **Example - Domain Transition:**
 
@@ -607,14 +550,12 @@ type_transition unconfined_t etc_t : file system_conf_t eric;
 # an exact strcmp) it should be labeled system_conf_t.
 ```
 
-<br>
+## *type_change*
 
-## `type_change`
-
-The `type_change` rule specifies a default `type` when relabeling an
+The *type_change* rule specifies a default *type* when relabeling an
 existing object. For example userspace SELinux-aware applications would
-use ***security_compute_relabel**(3)* and `type_change` rules in
-policy to determine the new context to be applied. Note that an `allow`
+use ***security_compute_relabel**(3)* and *type_change* rules in
+policy to determine the new context to be applied. Note that an *allow*
 rule must be used to authorise access. See the
 [**Computing Security Contexts**](computing_security_contexts.md#computing-security-contexts)
 section for more details.
@@ -625,55 +566,38 @@ section for more details.
 
 **Where:**
 
-<table>
-<tbody>
-<tr>
-<td><code>type_change</code></td>
-<td>The <code>type_change</code> rule keyword.</td>
-</tr>
-<tr>
-<td><p><code>source_type</code></p>
-<p><code>target_type</code></p></td>
-<td><p>One or more source / target <code>type</code>, <code>typealias</code> or <code>attribute</code> identifiers. Multiple entries consist of a space separated list enclosed in braces '{}'. </p>
-<p>Entries can be excluded from the list by using the negative operator '-'.</p></td>
-</tr>
-<tr>
-<td><code>class</code></td>
-<td>One or more object classes. Multiple entries consist of a space separated list enclosed in braces '{}'.</td>
-</tr>
-<tr>
-<td><code>change_type</code></td>
-<td>A single <code>type</code> or <code>typealias</code> identifier that will become the new <code>type</code>. </td>
-</tr>
-</tbody>
-</table>
+*type_change*
+
+The *type_change* rule keyword.
+
+*source_type*
+*target_type*
+
+One or more source / target *type*, *typealias* or *attribute* identifiers.
+Multiple entries consist of a space separated list enclosed in braces '{}'.
+Entries can be excluded from the list by using the negative operator '-'.
+
+*class*
+
+One or more object classes. Multiple entries consist of a space separated list
+enclosed in braces '{}'.
+
+*change_type*
+A single *type* or *typealias* identifier that will become the new *type*.
 
 **The statement is valid in:**
 
-<table style="text-align:center">
-<tbody>
-<tr style="background-color:#D3D3D3;">
-<td><strong>Monolithic Policy</strong></td>
-<td><strong>Base Policy</strong></td>
-<td><strong>Module Policy</strong></td>
-</tr>
-<tr>
-<td>Yes</td>
-<td>Yes</td>
-<td>Yes</td>
-</tr>
-<tr style="background-color:#D3D3D3;">
-<td><strong>Conditional Policy <code>if</code> Statement</strong></td>
-<td><strong><code>optional</code> Statement</strong></td>
-<td><strong><code>require</code> Statement</strong></td>
-</tr>
-<tr>
-<td>Yes</td>
-<td>Yes</td>
-<td>No</td>
-</tr>
-</tbody>
-</table>
+Policy Type
+
+| Monolithic Policy       | Base Policy             | Module Policy           |
+| ----------------------- | ----------------------- | ----------------------- |
+| Yes                     | Yes                     | Yes                     |
+
+Conditional Policy Statements
+
+| *if* statement          | *optional* Statement    | *require* Statement     |
+| ----------------------- | ----------------------- | ----------------------- |
+| Yes                     | Yes                     | No                      |
 
 **Examples:**
 
@@ -694,15 +618,13 @@ type_change auditadm_t sysadm_devpts_t:chr_file auditadm_devpts_t;
 type_change staff_t server_ptynode:chr_file staff_devpts_t;
 ```
 
-<br>
+## *type_member*
 
-## `type_member`
-
-The `type_member` rule specifies a default type when creating a
+The *type_member* rule specifies a default type when creating a
 polyinstantiated object. For example a userspace SELinux-aware
 application would use ***avc_compute_member**(3)* or
-***security_compute_member**(3)* with `type_member` rules in policy
-to determine the context to be applied. Note that an `allow` rule must
+***security_compute_member**(3)* with *type_member* rules in policy
+to determine the context to be applied. Note that an *allow* rule must
 be used to authorise access. See the
 [**Computing Security Contexts**](computing_security_contexts.md#computing-security-contexts)
 section for more details.
@@ -713,55 +635,40 @@ section for more details.
 
 **Where:**
 
-<table>
-<tbody>
-<tr>
-<td><code>type_member</code></td>
-<td>The <code>type_member</code> rule keyword.</td>
-</tr>
-<tr>
-<td><p><code>source_type</code></p>
-<p><code>target_type</code></p></td>
-<td><p>One or more source / target <code>type</code>, <code>typealias</code> or <code>attribute</code> identifiers. Multiple entries consist of a space separated list enclosed in braces '{}'. </p>
-<p>Entries can be excluded from the list by using the negative operator '-'.</p></td>
-</tr>
-<tr>
-<td><code>class</code></td>
-<td>One or more object classes. Multiple entries consist of a space separated list enclosed in braces '{}'.</td>
-</tr>
-<tr>
-<td><code>member_type</code></td>
-<td>A single <code>type</code> or <code>typealias</code> identifier that will become the polyinstantiated <code>type</code>. </td>
-</tr>
-</tbody>
-</table>
+*type_member*
+
+The *type_member* rule keyword.
+
+*source_type*
+*target_type*
+
+One or more source / target *type*, *typealias* or *attribute* identifiers.
+Multiple entries consist of a space separated list enclosed in braces '{}'.
+Entries can be excluded from the list by using the negative operator '-'.
+
+*class*
+
+One or more object classes. Multiple entries consist of a space separated list
+enclosed in braces '{}'.
+
+*member_type*
+
+A single *type* or *typealias* identifier that will become the polyinstantiated
+*type*.
 
 **The statement is valid in:**
 
-<table style="text-align:center">
-<tbody>
-<tr style="background-color:#D3D3D3;">
-<td><strong>Monolithic Policy</strong></td>
-<td><strong>Base Policy</strong></td>
-<td><strong>Module Policy</strong></td>
-</tr>
-<tr>
-<td>Yes</td>
-<td>Yes</td>
-<td>Yes</td>
-</tr>
-<tr style="background-color:#D3D3D3;">
-<td><strong>Conditional Policy <code>if</code> Statement</strong></td>
-<td><strong><code>optional</code> Statement</strong></td>
-<td><strong><code>require</code> Statement</strong></td>
-</tr>
-<tr>
-<td>Yes</td>
-<td>Yes</td>
-<td>No</td>
-</tr>
-</tbody>
-</table>
+Policy Type
+
+| Monolithic Policy       | Base Policy             | Module Policy           |
+| ----------------------- | ----------------------- | ----------------------- |
+| Yes                     | Yes                     | Yes                     |
+
+Conditional Policy Statements
+
+| *if* statement          | *optional* Statement    | *require* Statement     |
+| ----------------------- | ----------------------- | ----------------------- |
+| Yes                     | Yes                     | No                      |
 
 **Example:**
 
@@ -774,9 +681,6 @@ section for more details.
 type_member sysadm_t user_home_dir_t:dir user_home_dir_t;
 ```
 
-
-<br>
-
 <!-- %CUTHERE% -->
 
 ---
-- 
2.28.0

