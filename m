Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BA07FCF9AC
	for <lists+selinux@lfdr.de>; Tue,  8 Oct 2019 14:22:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730316AbfJHMWX (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Tue, 8 Oct 2019 08:22:23 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39478 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730301AbfJHMWX (ORCPT <rfc822;selinux@vger.kernel.org>);
        Tue, 8 Oct 2019 08:22:23 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 3C60730B2502
        for <selinux@vger.kernel.org>; Tue,  8 Oct 2019 12:22:23 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.43.12.184])
        by smtp.corp.redhat.com (Postfix) with ESMTP id B2E4819C68
        for <selinux@vger.kernel.org>; Tue,  8 Oct 2019 12:22:22 +0000 (UTC)
From:   Vit Mojzis <vmojzis@redhat.com>
To:     selinux@vger.kernel.org
Subject: [PATCH 2/2] python/semanage: Add support for DCCP and SCTP protocols
Date:   Tue,  8 Oct 2019 14:22:13 +0200
Message-Id: <20191008122213.9227-2-vmojzis@redhat.com>
In-Reply-To: <20191008122213.9227-1-vmojzis@redhat.com>
References: <20191008122213.9227-1-vmojzis@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.41]); Tue, 08 Oct 2019 12:22:23 +0000 (UTC)
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Fixes:
   # semanage port -a -p sctp -t port_t 1234
   ValueError: Protocol udp or tcp is required
   # semanage port -d -p sctp -t port_t 1234
   ValueError: Protocol udp or tcp is required

Signed-off-by: Vit Mojzis <vmojzis@redhat.com>
---
 python/semanage/seobject.py | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/python/semanage/seobject.py b/python/semanage/seobject.py
index f4c29854..dc413ca5 100644
--- a/python/semanage/seobject.py
+++ b/python/semanage/seobject.py
@@ -1058,13 +1058,15 @@ class portRecords(semanageRecords):
             pass
 
     def __genkey(self, port, proto):
-        if proto == "tcp":
-            proto_d = SEMANAGE_PROTO_TCP
+        protocols = {"tcp": SEMANAGE_PROTO_TCP,
+                     "udp": SEMANAGE_PROTO_UDP,
+                     "sctp": SEMANAGE_PROTO_SCTP,
+                     "dccp": SEMANAGE_PROTO_DCCP}
+
+        if proto in protocols.keys():
+            proto_d = protocols[proto]
         else:
-            if proto == "udp":
-                proto_d = SEMANAGE_PROTO_UDP
-            else:
-                raise ValueError(_("Protocol udp or tcp is required"))
+            raise ValueError(_("Protocol has to be one of udp, tcp, dccp or sctp"))
         if port == "":
             raise ValueError(_("Port is required"))
 
-- 
2.21.0

