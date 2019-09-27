Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 47DC9C07CB
	for <lists+selinux@lfdr.de>; Fri, 27 Sep 2019 16:43:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727616AbfI0Omr (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Fri, 27 Sep 2019 10:42:47 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53422 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726251AbfI0Omr (ORCPT <rfc822;selinux@vger.kernel.org>);
        Fri, 27 Sep 2019 10:42:47 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 0106518C428D
        for <selinux@vger.kernel.org>; Fri, 27 Sep 2019 14:42:47 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.43.12.184])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 7BE6F5C21A
        for <selinux@vger.kernel.org>; Fri, 27 Sep 2019 14:42:46 +0000 (UTC)
From:   Vit Mojzis <vmojzis@redhat.com>
To:     selinux@vger.kernel.org
Subject: [PATCH] python/semaange: fix moduleRecords.customized()
Date:   Fri, 27 Sep 2019 16:42:43 +0200
Message-Id: <20190927144243.3479-1-vmojzis@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.62]); Fri, 27 Sep 2019 14:42:47 +0000 (UTC)
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Return value of "customized" has to be iterable.

Fixes:
   "semanage export" with no modules in the system (eg. monolithic policy)
   crashes:

   Traceback (most recent call last):
     File "/usr/sbin/semanage", line 970, in <module>
       do_parser()
     File "/usr/sbin/semanage", line 949, in do_parser
       args.func(args)
     File "/usr/sbin/semanage", line 771, in handleExport
       for c in OBJECT.customized():
   TypeError: 'NoneType' object is not iterable

Signed-off-by: Vit Mojzis <vmojzis@redhat.com>
---
 python/semanage/seobject.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/python/semanage/seobject.py b/python/semanage/seobject.py
index 5e9e3eb5..f4c29854 100644
--- a/python/semanage/seobject.py
+++ b/python/semanage/seobject.py
@@ -380,7 +380,7 @@ class moduleRecords(semanageRecords):
     def customized(self):
         all = self.get_all()
         if len(all) == 0:
-            return
+            return []
         return ["-d %s" % x[0] for x in [t for t in all if t[1] == 0]]
 
     def list(self, heading=1, locallist=0):
-- 
2.21.0

