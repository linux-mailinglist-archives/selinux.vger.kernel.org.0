Return-Path: <selinux+bounces-647-lists+selinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 90CF7854931
	for <lists+selinux@lfdr.de>; Wed, 14 Feb 2024 13:27:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4719928250A
	for <lists+selinux@lfdr.de>; Wed, 14 Feb 2024 12:27:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 940271B97C;
	Wed, 14 Feb 2024 12:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bKMMHUq5"
X-Original-To: selinux@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 267EE2C19D
	for <selinux@vger.kernel.org>; Wed, 14 Feb 2024 12:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707913639; cv=none; b=e4Nu8tuhAdyknBDCR7W+NaZoDfXp4JqVZCxMlu9B2kOWdMz1A6mCo47F1kFSHAwmJn05ftUyqc9Tidb8HhptD7T5w+NuQmYsrU1mnWYDUd3VInF6zSn8QkxowyE8SMEuPeyZFRNs1WcqGMXVvFdoKYeeX4dUVvNkWeunOmg18VQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707913639; c=relaxed/simple;
	bh=Qbvr7nDP8FANY0HdxtxSWkgNLiUpcPFzx8MpZazFTic=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VI8QCUiHk3C6wAmBUsON5FHR+l1N4hti0d9KQ+d1lMB9H0jhvDYaRH49GcHIkvQgj/2P/nbkSLdBvwEtb6huKHhAfWojOfUFoYx9EnUqQhGI+XQJGppXR7Fn8KJ/izZzxqEs84zebPfwo22n+OgqcMRF/ecOhJmRVkW8kjNVAtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bKMMHUq5; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707913635;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iv775jahZszMMHopszNlXcJ1tY+eG0uBwytwVygTcNQ=;
	b=bKMMHUq5pWCXjayDxw/htYhac+RwS5AZx3O32mlLLKVbbPkVqeWzOrz6yaPUoUdNfP6Qgv
	g0P3wp9Dm7IY24IgLvnJBJ3eV0vA+DXVldrLVZ8OXENrIvB3RaYcNF1zkDnXAjwGU7pG8l
	UcBJl24DwpX7Fyj9lsc+pIaxv6NwpgU=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-60-iIFXq1k2MnWXYl7UxaT9BQ-1; Wed,
 14 Feb 2024 07:27:13 -0500
X-MC-Unique: iIFXq1k2MnWXYl7UxaT9BQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CF2443811F23
	for <selinux@vger.kernel.org>; Wed, 14 Feb 2024 12:27:11 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.45.225.6])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 59F48492BC6
	for <selinux@vger.kernel.org>; Wed, 14 Feb 2024 12:27:11 +0000 (UTC)
From: Vit Mojzis <vmojzis@redhat.com>
To: selinux@vger.kernel.org
Subject: [PATCH v2] python/semanage: Allow modifying records on "add"
Date: Wed, 14 Feb 2024 13:08:40 +0100
Message-ID: <20240214122706.522873-1-vmojzis@redhat.com>
In-Reply-To: <CAP+JOzQiC5AVpc7UreV4tafG3PnNCz8O7o4QrD=dLnLdO2oxCw@mail.gmail.com>
References: <CAP+JOzQiC5AVpc7UreV4tafG3PnNCz8O7o4QrD=dLnLdO2oxCw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: selinux@vger.kernel.org
List-Id: <selinux.vger.kernel.org>
List-Subscribe: <mailto:selinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:selinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9

When trying to add a record with a key that already exists, modify
the existing record instead.

Also, fix "semanage -m -e" (add_equal was called instead of
modify_equal), which meant that existing local equivalency couldn't be
modified (though a user could remove it and add a modified
equivalency).

Fixes:
  https://github.com/SELinuxProject/selinux/issues/412
  When a port or login definition present in the policy is modified
  using "semanage port -m", "semanage export" exports the command as
  "port -a" instead of "port -m". This results in "semanage import"
  failing (port already defined). The same is true for port, user,
  login, ibpkey, ibendport, node, interface and fcontext.

Signed-off-by: Vit Mojzis <vmojzis@redhat.com>
---
Added "self.validate" for nodeRecord since it modifies address, mask and
protocol values.

Fixes:
 #semanage node -a -M 255.255.255.0 -p ipv4 -t node_t 192.168.0.123
 Traceback (most recent call last):
  File "/usr/sbin/semanage", line 976, in <module>
    do_parser()
  File "/usr/sbin/semanage", line 951, in do_parser
    args.func(args)
  File "/usr/sbin/semanage", line 642, in handleNode
    OBJECT.add(args.node, args.netmask, args.proto, args.range, args.type)
  File "/usr/lib/python3.9/site-packages/seobject.py", line 1999, in add
    if self.__exists(addr, mask, proto):
  File "/usr/lib/python3.9/site-packages/seobject.py", line 2007, in __exists
    (rc, k) = semanage_node_key_create(self.sh, addr, mask, proto)
  File "/usr/lib64/python3.9/site-packages/semanage.py", line 1013, in semanage_node_key_create
    return _semanage.semanage_node_key_create(handle, addr, mask, proto)
 TypeError: in method 'semanage_node_key_create', argument 4 of type 'int'

 python/semanage/semanage    |   2 +-
 python/semanage/seobject.py | 208 +++++++++++++++++++++++++-----------
 2 files changed, 147 insertions(+), 63 deletions(-)

diff --git a/python/semanage/semanage b/python/semanage/semanage
index 4fdb490f..b269b9fc 100644
--- a/python/semanage/semanage
+++ b/python/semanage/semanage
@@ -322,7 +322,7 @@ def handleFcontext(args):
             OBJECT.add(args.file_spec, args.type, args.ftype, args.range, args.seuser)
     if args.action == "modify":
         if args.equal:
-            OBJECT.add_equal(args.file_spec, args.equal)
+            OBJECT.modify_equal(args.file_spec, args.equal)
         else:
             OBJECT.modify(args.file_spec, args.type, args.ftype, args.range, args.seuser)
     if args.action == "delete":
diff --git a/python/semanage/seobject.py b/python/semanage/seobject.py
index cc944ae2..12133b53 100644
--- a/python/semanage/seobject.py
+++ b/python/semanage/seobject.py
@@ -557,11 +557,6 @@ class loginRecords(semanageRecords):
         if rc < 0:
             raise ValueError(_("Could not create a key for %s") % name)
 
-        (rc, exists) = semanage_seuser_exists(self.sh, k)
-        if rc < 0:
-            raise ValueError(_("Could not check if login mapping for %s is defined") % name)
-        if exists:
-            raise ValueError(_("Login mapping for %s is already defined") % name)
         if name[0] == '%':
             try:
                 grp.getgrnam(name[1:])
@@ -600,11 +595,29 @@ class loginRecords(semanageRecords):
     def add(self, name, sename, serange):
         try:
             self.begin()
-            self.__add(name, sename, serange)
+            # Add a new mapping, or modify an existing one
+            if self.__exists(name):
+                print(_("Login mapping for %s is already defined, modifying instead") % name)
+                self.__modify(name, sename, serange)
+            else:
+                self.__add(name, sename, serange)
             self.commit()
         except ValueError as error:
             raise error
 
+    # check if login mapping for given user exists
+    def __exists(self, name):
+        (rc, k) = semanage_seuser_key_create(self.sh, name)
+        if rc < 0:
+            raise ValueError(_("Could not create a key for %s") % name)
+
+        (rc, exists) = semanage_seuser_exists(self.sh, k)
+        if rc < 0:
+            raise ValueError(_("Could not check if login mapping for %s is defined") % name)
+        semanage_seuser_key_free(k)
+
+        return exists
+
     def __modify(self, name, sename="", serange=""):
         rec, self.oldsename, self.oldserange = selinux.getseuserbyname(name)
         if sename == "" and serange == "":
@@ -821,12 +834,6 @@ class seluserRecords(semanageRecords):
         if rc < 0:
             raise ValueError(_("Could not create a key for %s") % name)
 
-        (rc, exists) = semanage_user_exists(self.sh, k)
-        if rc < 0:
-            raise ValueError(_("Could not check if SELinux user %s is defined") % name)
-        if exists:
-            raise ValueError(_("SELinux user %s is already defined") % name)
-
         (rc, u) = semanage_user_create(self.sh)
         if rc < 0:
             raise ValueError(_("Could not create SELinux user for %s") % name)
@@ -866,12 +873,28 @@ class seluserRecords(semanageRecords):
     def add(self, name, roles, selevel, serange, prefix):
         try:
             self.begin()
-            self.__add(name, roles, selevel, serange, prefix)
+            if self.__exists(name):
+                print(_("SELinux user %s is already defined, modifying instead") % name)
+                self.__modify(name, roles, selevel, serange, prefix)
+            else:
+                self.__add(name, roles, selevel, serange, prefix)
             self.commit()
         except ValueError as error:
             self.mylog.commit(0)
             raise error
 
+    def __exists(self, name):
+        (rc, k) = semanage_user_key_create(self.sh, name)
+        if rc < 0:
+            raise ValueError(_("Could not create a key for %s") % name)
+
+        (rc, exists) = semanage_user_exists(self.sh, k)
+        if rc < 0:
+            raise ValueError(_("Could not check if SELinux user %s is defined") % name)
+        semanage_user_key_free(k)
+
+        return exists
+
     def __modify(self, name, roles=[], selevel="", serange="", prefix=""):
         oldserole = ""
         oldserange = ""
@@ -1103,12 +1126,6 @@ class portRecords(semanageRecords):
 
         (k, proto_d, low, high) = self.__genkey(port, proto)
 
-        (rc, exists) = semanage_port_exists(self.sh, k)
-        if rc < 0:
-            raise ValueError(_("Could not check if port {proto}/{port} is defined").format(proto=proto, port=port))
-        if exists:
-            raise ValueError(_("Port {proto}/{port} already defined").format(proto=proto, port=port))
-
         (rc, p) = semanage_port_create(self.sh)
         if rc < 0:
             raise ValueError(_("Could not create port for {proto}/{port}").format(proto=proto, port=port))
@@ -1152,9 +1169,23 @@ class portRecords(semanageRecords):
 
     def add(self, port, proto, serange, type):
         self.begin()
-        self.__add(port, proto, serange, type)
+        if self.__exists(port, proto):
+            print(_("Port {proto}/{port} already defined, modifying instead").format(proto=proto, port=port))
+            self.__modify(port, proto, serange, type)
+        else:
+            self.__add(port, proto, serange, type)
         self.commit()
 
+    def __exists(self, port, proto):
+        (k, proto_d, low, high) = self.__genkey(port, proto)
+
+        (rc, exists) = semanage_port_exists(self.sh, k)
+        if rc < 0:
+            raise ValueError(_("Could not check if port {proto}/{port} is defined").format(proto=proto, port=port))
+        semanage_port_key_free(k)
+
+        return exists
+
     def __modify(self, port, proto, serange, setype):
         if serange == "" and setype == "":
             if is_mls_enabled == 1:
@@ -1377,12 +1408,6 @@ class ibpkeyRecords(semanageRecords):
 
         (k, subnet_prefix, low, high) = self.__genkey(pkey, subnet_prefix)
 
-        (rc, exists) = semanage_ibpkey_exists(self.sh, k)
-        if rc < 0:
-            raise ValueError(_("Could not check if ibpkey {subnet_prefix}/{pkey} is defined").formnat(subnet_prefix=subnet_prefix, pkey=pkey))
-        if exists:
-            raise ValueError(_("ibpkey {subnet_prefix}/{pkey} already defined").format(subnet_prefix=subnet_prefix, pkey=pkey))
-
         (rc, p) = semanage_ibpkey_create(self.sh)
         if rc < 0:
             raise ValueError(_("Could not create ibpkey for {subnet_prefix}/{pkey}").format(subnet_prefix=subnet_prefix, pkey=pkey))
@@ -1424,9 +1449,23 @@ class ibpkeyRecords(semanageRecords):
 
     def add(self, pkey, subnet_prefix, serange, type):
         self.begin()
-        self.__add(pkey, subnet_prefix, serange, type)
+        if self.__exists(pkey, subnet_prefix):
+            print(_("ibpkey {subnet_prefix}/{pkey} already defined, modifying instead").format(subnet_prefix=subnet_prefix, pkey=pkey))
+            self.__modify(pkey, subnet_prefix, serange, type)
+        else:
+            self.__add(pkey, subnet_prefix, serange, type)
         self.commit()
 
+    def __exists(self, pkey, subnet_prefix):
+        (k, subnet_prefix, low, high) = self.__genkey(pkey, subnet_prefix)
+
+        (rc, exists) = semanage_ibpkey_exists(self.sh, k)
+        if rc < 0:
+            raise ValueError(_("Could not check if ibpkey {subnet_prefix}/{pkey} is defined").formnat(subnet_prefix=subnet_prefix, pkey=pkey))
+        semanage_ibpkey_key_free(k)
+
+        return exists
+
     def __modify(self, pkey, subnet_prefix, serange, setype):
         if serange == "" and setype == "":
             if is_mls_enabled == 1:
@@ -1631,12 +1670,6 @@ class ibendportRecords(semanageRecords):
             raise ValueError(_("Type %s is invalid, must be an ibendport type") % type)
         (k, ibendport, port) = self.__genkey(ibendport, ibdev_name)
 
-        (rc, exists) = semanage_ibendport_exists(self.sh, k)
-        if rc < 0:
-            raise ValueError(_("Could not check if ibendport {ibdev_name}/{port} is defined").format(ibdev_name=ibdev_name, port=port))
-        if exists:
-            raise ValueError(_("ibendport {ibdev_name}/{port} already defined").format(ibdev_name=ibdev_name, port=port))
-
         (rc, p) = semanage_ibendport_create(self.sh)
         if rc < 0:
             raise ValueError(_("Could not create ibendport for {ibdev_name}/{port}").format(ibdev_name=ibdev_name, port=port))
@@ -1678,9 +1711,23 @@ class ibendportRecords(semanageRecords):
 
     def add(self, ibendport, ibdev_name, serange, type):
         self.begin()
-        self.__add(ibendport, ibdev_name, serange, type)
+        if self.__exists(ibendport, ibdev_name):
+            print(_("ibendport {ibdev_name}/{port} already defined, modifying instead").format(ibdev_name=ibdev_name, port=port))
+            self.__modify(ibendport, ibdev_name, serange, type)
+        else:
+            self.__add(ibendport, ibdev_name, serange, type)
         self.commit()
 
+    def __exists(self, ibendport, ibdev_name):
+        (k, ibendport, port) = self.__genkey(ibendport, ibdev_name)
+
+        (rc, exists) = semanage_ibendport_exists(self.sh, k)
+        if rc < 0:
+            raise ValueError(_("Could not check if ibendport {ibdev_name}/{port} is defined").format(ibdev_name=ibdev_name, port=port))
+        semanage_ibendport_key_free(k)
+
+        return exists
+
     def __modify(self, ibendport, ibdev_name, serange, setype):
         if serange == "" and setype == "":
             if is_mls_enabled == 1:
@@ -1902,12 +1949,6 @@ class nodeRecords(semanageRecords):
         if rc < 0:
             raise ValueError(_("Could not create key for %s") % addr)
 
-        (rc, exists) = semanage_node_exists(self.sh, k)
-        if rc < 0:
-            raise ValueError(_("Could not check if addr %s is defined") % addr)
-        if exists:
-            raise ValueError(_("Addr %s already defined") % addr)
-
         (rc, node) = semanage_node_create(self.sh)
         if rc < 0:
             raise ValueError(_("Could not create addr for %s") % addr)
@@ -1955,9 +1996,27 @@ class nodeRecords(semanageRecords):
 
     def add(self, addr, mask, proto, serange, ctype):
         self.begin()
-        self.__add(addr, mask, proto, serange, ctype)
+        if self.__exists(addr, mask, proto):
+            print(_("Addr %s already defined, modifying instead") % addr)
+            self.__modify(addr, mask, proto, serange, ctype)
+        else:
+            self.__add(addr, mask, proto, serange, ctype)
         self.commit()
 
+    def __exists(self, addr, mask, proto):
+        addr, mask, proto, audit_proto = self.validate(addr, mask, proto)
+
+        (rc, k) = semanage_node_key_create(self.sh, addr, mask, proto)
+        if rc < 0:
+            raise ValueError(_("Could not create key for %s") % addr)
+
+        (rc, exists) = semanage_node_exists(self.sh, k)
+        if rc < 0:
+            raise ValueError(_("Could not check if addr %s is defined") % addr)
+        semanage_node_key_free(k)
+
+        return exists
+
     def __modify(self, addr, mask, proto, serange, setype):
         addr, mask, proto, audit_proto = self.validate(addr, mask, proto)
 
@@ -2111,12 +2170,6 @@ class interfaceRecords(semanageRecords):
         if rc < 0:
             raise ValueError(_("Could not create key for %s") % interface)
 
-        (rc, exists) = semanage_iface_exists(self.sh, k)
-        if rc < 0:
-            raise ValueError(_("Could not check if interface %s is defined") % interface)
-        if exists:
-            raise ValueError(_("Interface %s already defined") % interface)
-
         (rc, iface) = semanage_iface_create(self.sh)
         if rc < 0:
             raise ValueError(_("Could not create interface for %s") % interface)
@@ -2163,9 +2216,25 @@ class interfaceRecords(semanageRecords):
 
     def add(self, interface, serange, ctype):
         self.begin()
-        self.__add(interface, serange, ctype)
+        if self.__exists(interface):
+            print(_("Interface %s already defined, modifying instead") % interface)
+            self.__modify(interface, serange, ctype)
+        else:
+            self.__add(interface, serange, ctype)
         self.commit()
 
+    def __exists(self, interface):
+        (rc, k) = semanage_iface_key_create(self.sh, interface)
+        if rc < 0:
+            raise ValueError(_("Could not create key for %s") % interface)
+
+        (rc, exists) = semanage_iface_exists(self.sh, k)
+        if rc < 0:
+            raise ValueError(_("Could not check if interface %s is defined") % interface)
+        semanage_iface_key_free(k)
+
+        return exists
+
     def __modify(self, interface, serange, setype):
         if serange == "" and setype == "":
             raise ValueError(_("Requires setype or serange"))
@@ -2353,7 +2422,13 @@ class fcontextRecords(semanageRecords):
             raise ValueError(_("Substitute %s is not valid. Substitute is not allowed to end with '/'") % substitute)
 
         if target in self.equiv.keys():
-            raise ValueError(_("Equivalence class for %s already exists") % target)
+            print(_("Equivalence class for %s already exists, modifying instead") % target)
+            self.equiv[target] = substitute
+            self.equal_ind = True
+            self.mylog.log_change("resrc=fcontext op=modify-equal %s %s" % (audit.audit_encode_nv_string("sglob", target, 0), audit.audit_encode_nv_string("tglob", substitute, 0)))
+            self.commit()
+            return
+
         self.validate(target)
 
         for fdict in (self.equiv, self.equiv_dist):
@@ -2429,18 +2504,6 @@ class fcontextRecords(semanageRecords):
         if rc < 0:
             raise ValueError(_("Could not create key for %s") % target)
 
-        (rc, exists) = semanage_fcontext_exists(self.sh, k)
-        if rc < 0:
-            raise ValueError(_("Could not check if file context for %s is defined") % target)
-
-        if not exists:
-            (rc, exists) = semanage_fcontext_exists_local(self.sh, k)
-            if rc < 0:
-                raise ValueError(_("Could not check if file context for %s is defined") % target)
-
-        if exists:
-            raise ValueError(_("File context for %s already defined") % target)
-
         (rc, fcontext) = semanage_fcontext_create(self.sh)
         if rc < 0:
             raise ValueError(_("Could not create file context for %s") % target)
@@ -2479,9 +2542,30 @@ class fcontextRecords(semanageRecords):
 
     def add(self, target, type, ftype="", serange="", seuser="system_u"):
         self.begin()
-        self.__add(target, type, ftype, serange, seuser)
+        if self.__exists(target, ftype):
+            print(_("File context for %s already defined, modifying instead") % target)
+            self.__modify(target, type, ftype, serange, seuser)
+        else:
+            self.__add(target, type, ftype, serange, seuser)
         self.commit()
 
+    def __exists(self, target, ftype):
+        (rc, k) = semanage_fcontext_key_create(self.sh, target, file_types[ftype])
+        if rc < 0:
+            raise ValueError(_("Could not create key for %s") % target)
+
+        (rc, exists) = semanage_fcontext_exists(self.sh, k)
+        if rc < 0:
+            raise ValueError(_("Could not check if file context for %s is defined") % target)
+
+        if not exists:
+            (rc, exists) = semanage_fcontext_exists_local(self.sh, k)
+            if rc < 0:
+                raise ValueError(_("Could not check if file context for %s is defined") % target)
+        semanage_fcontext_key_free(k)
+
+        return exists
+
     def __modify(self, target, setype, ftype, serange, seuser):
         if serange == "" and setype == "" and seuser == "":
             raise ValueError(_("Requires setype, serange or seuser"))
-- 
2.43.0


