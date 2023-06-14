Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D47BC72DE06
	for <lists+selinux@lfdr.de>; Tue, 13 Jun 2023 11:45:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241852AbjFMJpT (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Tue, 13 Jun 2023 05:45:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240118AbjFMJon (ORCPT
        <rfc822;selinux@vger.kernel.org>); Tue, 13 Jun 2023 05:44:43 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0069EDF
        for <selinux@vger.kernel.org>; Tue, 13 Jun 2023 02:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686649443;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=qDp11YZPOeTXm9ThNaryzKHFvWS3DqzLtnpPUV8X2HE=;
        b=EnlwJxrDcPfOuHF01fXMhqDBdInqqhjl28L9MIwkSfVznBb+G2RDsOjnf/fY98kO6l7XWx
        YXP8WIYdBOz4kZEBEYUTCyk4PjQWlWSt+OqJReHKMuGaHTB4NZtrzpVcbI1AZIW3IJrcqM
        o7EYbIUx2/7e+gGJgRHTZLObEAVVks8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-344-8w_jDdI2MG2dfRaOar3I_w-1; Tue, 13 Jun 2023 05:44:01 -0400
X-MC-Unique: 8w_jDdI2MG2dfRaOar3I_w-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D2EB685A5AA
        for <selinux@vger.kernel.org>; Tue, 13 Jun 2023 09:44:00 +0000 (UTC)
Received: from P1.redhat.com (unknown [10.45.225.217])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 01CDE492CA6;
        Tue, 13 Jun 2023 09:43:59 +0000 (UTC)
From:   Petr Lautrbach <lautrbach@redhat.com>
To:     selinux@vger.kernel.org
Cc:     vmojzis@redhat.com, Petr Lautrbach <lautrbach@redhat.com>
Subject: [PATCH v3 1/4] python: improve format strings for proper localization
Date:   Tue, 13 Jun 2023 11:42:42 +0200
Message-ID: <20230613094346.2667592-2-lautrbach@redhat.com>
In-Reply-To: <20230613094346.2667592-1-lautrbach@redhat.com>
References: <20230612162155.2604483-5-lautrbach@redhat.com>
 <20230613094346.2667592-1-lautrbach@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

If a string contains more than one unnamed argument it's hard for
translators to proper localize as they don't know which value is
represented by a unnamed argument. It also blocks them to use a
different order of arguments which would make better sense in other
languages.

Fixes:

    $ xgettext --default-domain=python -L Python --keyword=_ --keyword=N_ ../audit2allow/audit2allow ../chcat/chcat ../semanage/semanage ../semanage/seobject.py ../sepolgen/src/sepolgen/interfaces.py ../sepolicy/sepolicy/generate.py ../sepolicy/sepolicy/gui.py ../sepolicy/sepolicy/__init__.py ../sepolicy/sepolicy/interface.py ../sepolicy/sepolicy.py
    ../chcat/chcat:220: warning: 'msgid' format string with unnamed arguments cannot be properly localized:
                                 The translator cannot reorder the arguments.
                                 Please consider using a format string with named arguments,
                                 and a mapping instead of a tuple for the arguments.
    ../semanage/seobject.py:1178: warning: 'msgid' format string with unnamed arguments cannot be properly localized:
                                           The translator cannot reorder the arguments.
                                           Please consider using a format string with named arguments,
                                           and a mapping instead of a tuple for the arguments.
    ...

Signed-off-by: Petr Lautrbach <lautrbach@redhat.com>
---
 python/chcat/chcat          |   6 +-
 python/semanage/seobject.py | 130 ++++++++++++++++++------------------
 2 files changed, 68 insertions(+), 68 deletions(-)

diff --git a/python/chcat/chcat b/python/chcat/chcat
index 68718ec5f102..3ff387d88c59 100755
--- a/python/chcat/chcat
+++ b/python/chcat/chcat
@@ -125,7 +125,7 @@ def chcat_add(orig, newcat, objects, login_ind):
 
         if len(clist) > 1:
             if cat in clist[1:]:
-                print(_("%s is already in %s") % (f, orig))
+                print(_("{target} is already in {category}").format(target=f, category=orig)
                 continue
             clist.append(cat)
             cats = clist[1:]
@@ -207,7 +207,7 @@ def chcat_remove(orig, newcat, objects, login_ind):
 
         if len(clist) > 1:
             if cat not in clist[1:]:
-                print(_("%s is not in %s") % (f, orig))
+                print(_("{target} is not in {category}").format(target=f, category=orig))
                 continue
             clist.remove(cat)
             if len(clist) > 1:
@@ -217,7 +217,7 @@ def chcat_remove(orig, newcat, objects, login_ind):
             else:
                 cat = ""
         else:
-            print(_("%s is not in %s") % (f, orig))
+            print(_("{target} is not in {category}").format(target=f, category=orig))
             continue
 
         if len(cat) == 0:
diff --git a/python/semanage/seobject.py b/python/semanage/seobject.py
index d82da4942987..2b1eb44ce8a3 100644
--- a/python/semanage/seobject.py
+++ b/python/semanage/seobject.py
@@ -843,7 +843,7 @@ class seluserRecords(semanageRecords):
         for r in roles:
             rc = semanage_user_add_role(self.sh, u, r)
             if rc < 0:
-                raise ValueError(_("Could not add role %s for %s") % (r, name))
+                raise ValueError(_("Could not add role {role} for {name}").format(role=r, name=name))
 
         if is_mls_enabled == 1:
             rc = semanage_user_set_mlsrange(self.sh, u, serange)
@@ -855,7 +855,7 @@ class seluserRecords(semanageRecords):
                 raise ValueError(_("Could not set MLS level for %s") % name)
         rc = semanage_user_set_prefix(self.sh, u, prefix)
         if rc < 0:
-            raise ValueError(_("Could not add prefix %s for %s") % (r, prefix))
+            raise ValueError(_("Could not add prefix {prefix} for {role}").format(role=r, prefix=prefix))
         (rc, key) = semanage_user_key_extract(self.sh, u)
         if rc < 0:
             raise ValueError(_("Could not extract key for %s") % name)
@@ -1088,7 +1088,7 @@ class portRecords(semanageRecords):
 
         (rc, k) = semanage_port_key_create(self.sh, low, high, proto_d)
         if rc < 0:
-            raise ValueError(_("Could not create a key for %s/%s") % (proto, port))
+            raise ValueError(_("Could not create a key for {proto}/{port}").format(proto=proto, port=port))
         return (k, proto_d, low, high)
 
     def __add(self, port, proto, serange, type):
@@ -1110,44 +1110,44 @@ class portRecords(semanageRecords):
 
         (rc, exists) = semanage_port_exists(self.sh, k)
         if rc < 0:
-            raise ValueError(_("Could not check if port %s/%s is defined") % (proto, port))
+            raise ValueError(_("Could not check if port {proto}/{port} is defined").format(proto=proto, port=port))
         if exists:
-            raise ValueError(_("Port %s/%s already defined") % (proto, port))
+            raise ValueError(_("Port {proto}/{port} already defined").format(proto=proto, port=port))
 
         (rc, p) = semanage_port_create(self.sh)
         if rc < 0:
-            raise ValueError(_("Could not create port for %s/%s") % (proto, port))
+            raise ValueError(_("Could not create port for {proto}/{port}").format(proto=proto, port=port))
 
         semanage_port_set_proto(p, proto_d)
         semanage_port_set_range(p, low, high)
         (rc, con) = semanage_context_create(self.sh)
         if rc < 0:
-            raise ValueError(_("Could not create context for %s/%s") % (proto, port))
+            raise ValueError(_("Could not create context for {proto}/{port}").format(proto=proto, port=port))
 
         rc = semanage_context_set_user(self.sh, con, "system_u")
         if rc < 0:
-            raise ValueError(_("Could not set user in port context for %s/%s") % (proto, port))
+            raise ValueError(_("Could not set user in port context for {proto}/{port}").format(proto=proto, port=port))
 
         rc = semanage_context_set_role(self.sh, con, "object_r")
         if rc < 0:
-            raise ValueError(_("Could not set role in port context for %s/%s") % (proto, port))
+            raise ValueError(_("Could not set role in port context for {proto}/{port}").format(proto=proto, port=port))
 
         rc = semanage_context_set_type(self.sh, con, type)
         if rc < 0:
-            raise ValueError(_("Could not set type in port context for %s/%s") % (proto, port))
+            raise ValueError(_("Could not set type in port context for {proto}/{port}").format(proto=proto, port=port))
 
         if (is_mls_enabled == 1) and (serange != ""):
             rc = semanage_context_set_mls(self.sh, con, serange)
             if rc < 0:
-                raise ValueError(_("Could not set mls fields in port context for %s/%s") % (proto, port))
+                raise ValueError(_("Could not set mls fields in port context for {proto}/{port}").format(proto=proto, port=port))
 
         rc = semanage_port_set_con(self.sh, p, con)
         if rc < 0:
-            raise ValueError(_("Could not set port context for %s/%s") % (proto, port))
+            raise ValueError(_("Could not set port context for {proto}/{port}").format(proto=proto, port=port))
 
         rc = semanage_port_modify_local(self.sh, k, p)
         if rc < 0:
-            raise ValueError(_("Could not add port %s/%s") % (proto, port))
+            raise ValueError(_("Could not add port {proto}/{port}").format(proto=proto, port=port))
 
         semanage_context_free(con)
         semanage_port_key_free(k)
@@ -1175,13 +1175,13 @@ class portRecords(semanageRecords):
 
         (rc, exists) = semanage_port_exists(self.sh, k)
         if rc < 0:
-            raise ValueError(_("Could not check if port %s/%s is defined") % (proto, port))
+            raise ValueError(_("Could not check if port {proto}/{port} is defined").format(proto=proto, port=port))
         if not exists:
-            raise ValueError(_("Port %s/%s is not defined") % (proto, port))
+            raise ValueError(_("Port {proto}/{port} is not defined").format(proto=proto, port=port))
 
         (rc, p) = semanage_port_query(self.sh, k)
         if rc < 0:
-            raise ValueError(_("Could not query port %s/%s") % (proto, port))
+            raise ValueError(_("Could not query port {proto}/{port}").format(proto=proto, port=port))
 
         con = semanage_port_get_con(p)
 
@@ -1195,7 +1195,7 @@ class portRecords(semanageRecords):
 
         rc = semanage_port_modify_local(self.sh, k, p)
         if rc < 0:
-            raise ValueError(_("Could not modify port %s/%s") % (proto, port))
+            raise ValueError(_("Could not modify port {proto}/{port}").format(proto=proto, port=port))
 
         semanage_port_key_free(k)
         semanage_port_free(p)
@@ -1241,19 +1241,19 @@ class portRecords(semanageRecords):
         (k, proto_d, low, high) = self.__genkey(port, proto)
         (rc, exists) = semanage_port_exists(self.sh, k)
         if rc < 0:
-            raise ValueError(_("Could not check if port %s/%s is defined") % (proto, port))
+            raise ValueError(_("Could not check if port {proto}/{port} is defined").format(proto=proto, port=port))
         if not exists:
-            raise ValueError(_("Port %s/%s is not defined") % (proto, port))
+            raise ValueError(_("Port {proto}/{port} is not defined").format(proto=proto, port=port))
 
         (rc, exists) = semanage_port_exists_local(self.sh, k)
         if rc < 0:
-            raise ValueError(_("Could not check if port %s/%s is defined") % (proto, port))
+            raise ValueError(_("Could not check if port {proto}/{port} is defined").format(proto=proto, port=port))
         if not exists:
-            raise ValueError(_("Port %s/%s is defined in policy, cannot be deleted") % (proto, port))
+            raise ValueError(_("Port {proto}/{port} is defined in policy, cannot be deleted").format(proto=proto, port=port))
 
         rc = semanage_port_del_local(self.sh, k)
         if rc < 0:
-            raise ValueError(_("Could not delete port %s/%s") % (proto, port))
+            raise ValueError(_("Could not delete port {proto}/{port}").format(proto=proto, port=port))
 
         semanage_port_key_free(k)
 
@@ -1362,7 +1362,7 @@ class ibpkeyRecords(semanageRecords):
 
         (rc, k) = semanage_ibpkey_key_create(self.sh, subnet_prefix, low, high)
         if rc < 0:
-            raise ValueError(_("Could not create a key for %s/%s") % (subnet_prefix, pkey))
+            raise ValueError(_("Could not create a key for {subnet_prefix}/{pkey}").format(subnet_prefix=subnet_prefix, pkey=pkey))
         return (k, subnet_prefix, low, high)
 
     def __add(self, pkey, subnet_prefix, serange, type):
@@ -1384,44 +1384,44 @@ class ibpkeyRecords(semanageRecords):
 
         (rc, exists) = semanage_ibpkey_exists(self.sh, k)
         if rc < 0:
-            raise ValueError(_("Could not check if ibpkey %s/%s is defined") % (subnet_prefix, pkey))
+            raise ValueError(_("Could not check if ibpkey {subnet_prefix}/{pkey} is defined").formnat(subnet_prefix=subnet_prefix, pkey=pkey))
         if exists:
-            raise ValueError(_("ibpkey %s/%s already defined") % (subnet_prefix, pkey))
+            raise ValueError(_("ibpkey {subnet_prefix}/{pkey} already defined").format(subnet_prefix=subnet_prefix, pkey=pkey))
 
         (rc, p) = semanage_ibpkey_create(self.sh)
         if rc < 0:
-            raise ValueError(_("Could not create ibpkey for %s/%s") % (subnet_prefix, pkey))
+            raise ValueError(_("Could not create ibpkey for {subnet_prefix}/{pkey}").format(subnet_prefix=subnet_prefix, pkey=pkey))
 
         semanage_ibpkey_set_subnet_prefix(self.sh, p, subnet_prefix)
         semanage_ibpkey_set_range(p, low, high)
         (rc, con) = semanage_context_create(self.sh)
         if rc < 0:
-            raise ValueError(_("Could not create context for %s/%s") % (subnet_prefix, pkey))
+            raise ValueError(_("Could not create context for {subnet_prefix}/{pkey}").format(subnet_prefix=subnet_prefix, pkey=pkey))
 
         rc = semanage_context_set_user(self.sh, con, "system_u")
         if rc < 0:
-            raise ValueError(_("Could not set user in ibpkey context for %s/%s") % (subnet_prefix, pkey))
+            raise ValueError(_("Could not set user in ibpkey context for {subnet_prefix}/{pkey}").format(subnet_prefix=subnet_prefix, pkey=pkey))
 
         rc = semanage_context_set_role(self.sh, con, "object_r")
         if rc < 0:
-            raise ValueError(_("Could not set role in ibpkey context for %s/%s") % (subnet_prefix, pkey))
+            raise ValueError(_("Could not set role in ibpkey context for {subnet_prefix}/{pkey}").format(subnet_prefix=subnet_prefix, pkey=pkey))
 
         rc = semanage_context_set_type(self.sh, con, type)
         if rc < 0:
-            raise ValueError(_("Could not set type in ibpkey context for %s/%s") % (subnet_prefix, pkey))
+            raise ValueError(_("Could not set type in ibpkey context for {subnet_prefix}/{pkey}").format(subnet_prefix=subnet_prefix, pkey=pkey))
 
         if (is_mls_enabled == 1) and (serange != ""):
             rc = semanage_context_set_mls(self.sh, con, serange)
             if rc < 0:
-                raise ValueError(_("Could not set mls fields in ibpkey context for %s/%s") % (subnet_prefix, pkey))
+                raise ValueError(_("Could not set mls fields in ibpkey context for {subnet_prefix}/{pkey}").format(subnet_prefix=subnet_prefix, pkey=pkey))
 
         rc = semanage_ibpkey_set_con(self.sh, p, con)
         if rc < 0:
-            raise ValueError(_("Could not set ibpkey context for %s/%s") % (subnet_prefix, pkey))
+            raise ValueError(_("Could not set ibpkey context for {subnet_prefix}/{pkey}").format(subnet_prefix=subnet_prefix, pkey=pkey))
 
         rc = semanage_ibpkey_modify_local(self.sh, k, p)
         if rc < 0:
-            raise ValueError(_("Could not add ibpkey %s/%s") % (subnet_prefix, pkey))
+            raise ValueError(_("Could not add ibpkey {subnet_prefix}/{pkey}").format(subnet_prefix=subnet_prefix, pkey=pkey))
 
         semanage_context_free(con)
         semanage_ibpkey_key_free(k)
@@ -1448,13 +1448,13 @@ class ibpkeyRecords(semanageRecords):
 
         (rc, exists) = semanage_ibpkey_exists(self.sh, k)
         if rc < 0:
-            raise ValueError(_("Could not check if ibpkey %s/%s is defined") % (subnet_prefix, pkey))
+            raise ValueError(_("Could not check if ibpkey {subnet_prefix}/{pkey} is defined").format(subnet_prefix=subnet_prefix, pkey=pkey))
         if not exists:
-            raise ValueError(_("ibpkey %s/%s is not defined") % (subnet_prefix, pkey))
+            raise ValueError(_("ibpkey {subnet_prefix}/{pkey} is not defined").format(subnet_prefix=subnet_prefix, pkey=pkey))
 
         (rc, p) = semanage_ibpkey_query(self.sh, k)
         if rc < 0:
-            raise ValueError(_("Could not query ibpkey %s/%s") % (subnet_prefix, pkey))
+            raise ValueError(_("Could not query ibpkey {subnet_prefix}/{pkey}").format(subnet_prefix=subnet_prefix, pkey=pkey))
 
         con = semanage_ibpkey_get_con(p)
 
@@ -1465,7 +1465,7 @@ class ibpkeyRecords(semanageRecords):
 
         rc = semanage_ibpkey_modify_local(self.sh, k, p)
         if rc < 0:
-            raise ValueError(_("Could not modify ibpkey %s/%s") % (subnet_prefix, pkey))
+            raise ValueError(_("Could not modify ibpkey {subnet_prefix}/{pkey}").format(subnet_prefix=subnet_prefix, pkey=pkey))
 
         semanage_ibpkey_key_free(k)
         semanage_ibpkey_free(p)
@@ -1502,19 +1502,19 @@ class ibpkeyRecords(semanageRecords):
         (k, subnet_prefix, low, high) = self.__genkey(pkey, subnet_prefix)
         (rc, exists) = semanage_ibpkey_exists(self.sh, k)
         if rc < 0:
-            raise ValueError(_("Could not check if ibpkey %s/%s is defined") % (subnet_prefix, pkey))
+            raise ValueError(_("Could not check if ibpkey {subnet_prefix}/{pkey} is defined").format(subnet_prefix=subnet_prefix, pkey=pkey))
         if not exists:
-            raise ValueError(_("ibpkey %s/%s is not defined") % (subnet_prefix, pkey))
+            raise ValueError(_("ibpkey {subnet_prefix}/{pkey} is not defined").format(subnet_prefix=subnet_prefix, pkey=pkey))
 
         (rc, exists) = semanage_ibpkey_exists_local(self.sh, k)
         if rc < 0:
-            raise ValueError(_("Could not check if ibpkey %s/%s is defined") % (subnet_prefix, pkey))
+            raise ValueError(_("Could not check if ibpkey {subnet_prefix}/{pkey} is defined").format(subnet_prefix=subnet_prefix, pkey=pkey))
         if not exists:
-            raise ValueError(_("ibpkey %s/%s is defined in policy, cannot be deleted") % (subnet_prefix, pkey))
+            raise ValueError(_("ibpkey {subnet_prefix}/{pkey} is defined in policy, cannot be deleted").format(subnet_prefix=subnet_prefix, pkey=pkey))
 
         rc = semanage_ibpkey_del_local(self.sh, k)
         if rc < 0:
-            raise ValueError(_("Could not delete ibpkey %s/%s") % (subnet_prefix, pkey))
+            raise ValueError(_("Could not delete ibpkey {subnet_prefix}/{pkey}").format(subnet_prefix=subnet_prefix, pkey=pkey))
 
         semanage_ibpkey_key_free(k)
 
@@ -1617,7 +1617,7 @@ class ibendportRecords(semanageRecords):
 
         (rc, k) = semanage_ibendport_key_create(self.sh, ibdev_name, port)
         if rc < 0:
-            raise ValueError(_("Could not create a key for ibendport %s/%s") % (ibdev_name, ibendport))
+            raise ValueError(_("Could not create a key for ibendport {ibdev_name}/{ibendport}").format(ibdev_name=ibdev_name, ibendport=ibendport))
         return (k, ibdev_name, port)
 
     def __add(self, ibendport, ibdev_name, serange, type):
@@ -1638,44 +1638,44 @@ class ibendportRecords(semanageRecords):
 
         (rc, exists) = semanage_ibendport_exists(self.sh, k)
         if rc < 0:
-            raise ValueError(_("Could not check if ibendport %s/%s is defined") % (ibdev_name, port))
+            raise ValueError(_("Could not check if ibendport {ibdev_name}/{port} is defined").format(ibdev_name=ibdev_name, port=port))
         if exists:
-            raise ValueError(_("ibendport %s/%s already defined") % (ibdev_name, port))
+            raise ValueError(_("ibendport {ibdev_name}/{port} already defined").format(ibdev_name=ibdev_name, port=port))
 
         (rc, p) = semanage_ibendport_create(self.sh)
         if rc < 0:
-            raise ValueError(_("Could not create ibendport for %s/%s") % (ibdev_name, port))
+            raise ValueError(_("Could not create ibendport for {ibdev_name}/{port}").format(ibdev_name=ibdev_name, port=port))
 
         semanage_ibendport_set_ibdev_name(self.sh, p, ibdev_name)
         semanage_ibendport_set_port(p, port)
         (rc, con) = semanage_context_create(self.sh)
         if rc < 0:
-            raise ValueError(_("Could not create context for %s/%s") % (ibdev_name, port))
+            raise ValueError(_("Could not create context for {ibendport}/{port}").format(ibdev_name=ibdev_name, port=port))
 
         rc = semanage_context_set_user(self.sh, con, "system_u")
         if rc < 0:
-            raise ValueError(_("Could not set user in ibendport context for %s/%s") % (ibdev_name, port))
+            raise ValueError(_("Could not set user in ibendport context for {ibdev_name}/{port}").format(ibdev_name=ibdev_name, port=port))
 
         rc = semanage_context_set_role(self.sh, con, "object_r")
         if rc < 0:
-            raise ValueError(_("Could not set role in ibendport context for %s/%s") % (ibdev_name, port))
+            raise ValueError(_("Could not set role in ibendport context for {ibdev_name}/{port}").format(ibdev_name=ibdev_name, port=port))
 
         rc = semanage_context_set_type(self.sh, con, type)
         if rc < 0:
-            raise ValueError(_("Could not set type in ibendport context for %s/%s") % (ibdev_name, port))
+            raise ValueError(_("Could not set type in ibendport context for {ibdev_name}/{port}").format(ibdev_name=ibdev_name, port=port))
 
         if (is_mls_enabled == 1) and (serange != ""):
             rc = semanage_context_set_mls(self.sh, con, serange)
             if rc < 0:
-                raise ValueError(_("Could not set mls fields in ibendport context for %s/%s") % (ibdev_name, port))
+                raise ValueError(_("Could not set mls fields in ibendport context for {ibdev_name}/{port}").format(ibdev_name=ibdev_name, port=port))
 
         rc = semanage_ibendport_set_con(self.sh, p, con)
         if rc < 0:
-            raise ValueError(_("Could not set ibendport context for %s/%s") % (ibdev_name, port))
+            raise ValueError(_("Could not set ibendport context for {ibdev_name}/{port}").format(ibdev_name=ibdev_name, port=port))
 
         rc = semanage_ibendport_modify_local(self.sh, k, p)
         if rc < 0:
-            raise ValueError(_("Could not add ibendport %s/%s") % (ibdev_name, port))
+            raise ValueError(_("Could not add ibendport {ibdev_name}/{port}").format(ibdev_name=ibdev_name, port=port))
 
         semanage_context_free(con)
         semanage_ibendport_key_free(k)
@@ -1702,13 +1702,13 @@ class ibendportRecords(semanageRecords):
 
         (rc, exists) = semanage_ibendport_exists(self.sh, k)
         if rc < 0:
-            raise ValueError(_("Could not check if ibendport %s/%s is defined") % (ibdev_name, ibendport))
+            raise ValueError(_("Could not check if ibendport {ibdev_name}/{ibendport} is defined").format(ibdev_name=ibdev_name, ibendport=ibendport))
         if not exists:
-            raise ValueError(_("ibendport %s/%s is not defined") % (ibdev_name, ibendport))
+            raise ValueError(_("ibendport {ibdev_name}/{ibendport} is not defined").format(ibdev_name=ibdev_name, ibendport=ibendport))
 
         (rc, p) = semanage_ibendport_query(self.sh, k)
         if rc < 0:
-            raise ValueError(_("Could not query ibendport %s/%s") % (ibdev_name, ibendport))
+            raise ValueError(_("Could not query ibendport {ibdev_name}/{ibendport}").format(ibdev_name=ibdev_name, ibendport=ibendport))
 
         con = semanage_ibendport_get_con(p)
 
@@ -1719,7 +1719,7 @@ class ibendportRecords(semanageRecords):
 
         rc = semanage_ibendport_modify_local(self.sh, k, p)
         if rc < 0:
-            raise ValueError(_("Could not modify ibendport %s/%s") % (ibdev_name, ibendport))
+            raise ValueError(_("Could not modify ibendport {ibdev_name}/{ibendport}").format(ibdev_name=ibdev_name, ibendport=ibendport))
 
         semanage_ibendport_key_free(k)
         semanage_ibendport_free(p)
@@ -1741,11 +1741,11 @@ class ibendportRecords(semanageRecords):
             port = semanage_ibendport_get_port(ibendport)
             (k, ibdev_name, port) = self.__genkey(str(port), ibdev_name)
             if rc < 0:
-                raise ValueError(_("Could not create a key for %s/%d") % (ibdevname, port))
+                raise ValueError(_("Could not create a key for {ibdev_name}/{port}").format(ibdev_name=ibdev_name, port=port))
 
             rc = semanage_ibendport_del_local(self.sh, k)
             if rc < 0:
-                raise ValueError(_("Could not delete the ibendport %s/%d") % (ibdev_name, port))
+                raise ValueError(_("Could not delete the ibendport {ibdev_name}/{port}").format(ibdev_name=ibdev_name, port=port))
             semanage_ibendport_key_free(k)
 
         self.commit()
@@ -1754,19 +1754,19 @@ class ibendportRecords(semanageRecords):
         (k, ibdev_name, port) = self.__genkey(ibendport, ibdev_name)
         (rc, exists) = semanage_ibendport_exists(self.sh, k)
         if rc < 0:
-            raise ValueError(_("Could not check if ibendport %s/%s is defined") % (ibdev_name, ibendport))
+            raise ValueError(_("Could not check if ibendport {ibdev_name}/{ibendport} is defined").format(ibdev_name=ibdev_name, ibendport=ibendport))
         if not exists:
-            raise ValueError(_("ibendport %s/%s is not defined") % (ibdev_name, ibendport))
+            raise ValueError(_("ibendport {ibdev_name}/{ibendport} is not defined").format(ibdev_name=ibdev_name, ibendport=ibendport))
 
         (rc, exists) = semanage_ibendport_exists_local(self.sh, k)
         if rc < 0:
-            raise ValueError(_("Could not check if ibendport %s/%s is defined") % (ibdev_name, ibendport))
+            raise ValueError(_("Could not check if ibendport {ibdev_name}/{ibendport} is defined").format(ibdev_name=ibdev_name, ibendport=ibendport))
         if not exists:
-            raise ValueError(_("ibendport %s/%s is defined in policy, cannot be deleted") % (ibdev_name, ibendport))
+            raise ValueError(_("ibendport {ibdev_name}/{ibendport} is defined in policy, cannot be deleted").format(ibdev_name=ibdev_name, ibendport=ibendport))
 
         rc = semanage_ibendport_del_local(self.sh, k)
         if rc < 0:
-            raise ValueError(_("Could not delete ibendport %s/%s") % (ibdev_name, ibendport))
+            raise ValueError(_("Could not delete ibendport {ibdev_name}/{ibendport}").format(ibdev_name=ibdev_name, ibendport=ibendport))
 
         semanage_ibendport_key_free(k)
 
@@ -2765,7 +2765,7 @@ class booleanRecords(semanageRecords):
                 try:
                     boolname, val = b.split("=")
                 except ValueError:
-                    raise ValueError(_("Bad format %s: Record %s" % (name, b)))
+                    raise ValueError(_("Bad format {filename}: Record {record}").format(filename=name, record=b))
                 self.__mod(boolname.strip(), val.strip())
             fd.close()
         else:
-- 
2.41.0.rc2

