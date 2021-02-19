Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 127F331FA7F
	for <lists+selinux@lfdr.de>; Fri, 19 Feb 2021 15:25:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230091AbhBSOYt (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Fri, 19 Feb 2021 09:24:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:33402 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229553AbhBSOYs (ORCPT
        <rfc822;selinux@vger.kernel.org>); Fri, 19 Feb 2021 09:24:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1613744601;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=sol4uAMeNxmhZrGuEiBTThlfmZrkIIfaYGP2a+7fjn8=;
        b=fAprDYi0dgwlPK+Tq2f1V0UwC5fQxAH98+rrKFmag21MVS5N6KY4TTOnybmHaVQ7t1Eu8L
        32J4ikCSMjUnXA3LKe3NWI8Zo/KfcM7WE6TJftk6gUw/gLpnMN+IYWzdJLsxKrk6643LGL
        +2djigmyAaEEnjuo1lttPF3gNDeAOTw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-508-P0jTiXXZOpaLP5acCHfU8A-1; Fri, 19 Feb 2021 09:23:19 -0500
X-MC-Unique: P0jTiXXZOpaLP5acCHfU8A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7E80E1005501
        for <selinux@vger.kernel.org>; Fri, 19 Feb 2021 14:23:18 +0000 (UTC)
Received: from thinkpad-work.redhat.com (unknown [10.40.193.138])
        by smtp.corp.redhat.com (Postfix) with ESMTP id E70A51002391
        for <selinux@vger.kernel.org>; Fri, 19 Feb 2021 14:23:17 +0000 (UTC)
From:   Vit Mojzis <vmojzis@redhat.com>
To:     selinux@vger.kernel.org
Subject: [PATCH v2] gui: fix "file type" selection in fcontextPage
Date:   Fri, 19 Feb 2021 15:23:14 +0100
Message-Id: <20210219142314.1962469-1-vmojzis@redhat.com>
In-Reply-To: <CAFqZXNvzeyztWWyTzYMODc7DFPp6kLRu7vm=iavLPdu26hAB0w@mail.gmail.com>
References: <CAFqZXNvzeyztWWyTzYMODc7DFPp6kLRu7vm=iavLPdu26hAB0w@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

A change in seobject.py file_type_str_to_option made the "file type"
list not compatible with items in this ComboBox.
See: 317743bbe2a235a5c68f1066b4153e0726a3118f

Avoid this in the future by populating the ComboBox using keys from
file_type_str_to_option.

This change disables translations on the file types, but those cause
other issues (adding file context fails the same way as with 'socket
file' since the translated strings differ form
file_type_str_to_option.keys, 'properties' of a file context entry
shows no file type for the same reason).

Fixes:
 Traceback (most recent call last):
  File "/usr/share/system-config-selinux/system-config-selinux.py", line 136, in add
    self.tabs[self.notebook.get_current_page()].addDialog()
  File "/usr/share/system-config-selinux/semanagePage.py", line 143, in addDialog
    if self.add() is False:
  File "/usr/share/system-config-selinux/fcontextPage.py", line 195, in add
    (rc, out) = getstatusoutput("semanage fcontext -a -t %s -r %s -f '%s' '%s'" % (type, mls, seobject.file_type_str_to_option[ftype], fspec))
 KeyError: 'socket file'

Signed-off-by: Vit Mojzis <vmojzis@redhat.com>
---
Add missing "Signed-off-by".

 gui/fcontextPage.py          |  7 +++++++
 gui/system-config-selinux.ui | 26 --------------------------
 2 files changed, 7 insertions(+), 26 deletions(-)

diff --git a/gui/fcontextPage.py b/gui/fcontextPage.py
index 370bbee4..d26aa1b4 100644
--- a/gui/fcontextPage.py
+++ b/gui/fcontextPage.py
@@ -102,6 +102,13 @@ class fcontextPage(semanagePage):
         self.load()
         self.fcontextEntry = xml.get_object("fcontextEntry")
         self.fcontextFileTypeCombo = xml.get_object("fcontextFileTypeCombo")
+        # Populate file type combo_box
+        liststore = self.fcontextFileTypeCombo.get_model()
+        for ftype in seobject.file_type_str_to_option.keys():
+            iter = liststore.append()
+            liststore.set_value(iter, 0, ftype)
+        iter = liststore.get_iter_first()
+        self.fcontextFileTypeCombo.set_active_iter(iter)
         self.fcontextTypeEntry = xml.get_object("fcontextTypeEntry")
         self.fcontextMLSEntry = xml.get_object("fcontextMLSEntry")
 
diff --git a/gui/system-config-selinux.ui b/gui/system-config-selinux.ui
index 7cc1cc53..e7b84a64 100644
--- a/gui/system-config-selinux.ui
+++ b/gui/system-config-selinux.ui
@@ -401,32 +401,6 @@ Level</property>
       <!-- column-name gchararray -->
       <column type="gchararray"/>
     </columns>
-    <data>
-      <row>
-        <col id="0" translatable="yes">all files</col>
-      </row>
-      <row>
-        <col id="0" translatable="yes">regular file</col>
-      </row>
-      <row>
-        <col id="0" translatable="yes">directory</col>
-      </row>
-      <row>
-        <col id="0" translatable="yes">character device</col>
-      </row>
-      <row>
-        <col id="0" translatable="yes">block device</col>
-      </row>
-      <row>
-        <col id="0" translatable="yes">socket file</col>
-      </row>
-      <row>
-        <col id="0" translatable="yes">symbolic link</col>
-      </row>
-      <row>
-        <col id="0" translatable="yes">named pipe</col>
-      </row>
-    </data>
   </object>
   <object class="GtkDialog" id="fcontextDialog">
     <property name="can_focus">False</property>
-- 
2.29.2

