Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B552A2A1096
	for <lists+selinux@lfdr.de>; Fri, 30 Oct 2020 22:53:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725796AbgJ3VxZ (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Fri, 30 Oct 2020 17:53:25 -0400
Received: from mx2.suse.de ([195.135.220.15]:60428 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725792AbgJ3VxZ (ORCPT <rfc822;selinux@vger.kernel.org>);
        Fri, 30 Oct 2020 17:53:25 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 21A9BAF39
        for <selinux@vger.kernel.org>; Fri, 30 Oct 2020 21:53:24 +0000 (UTC)
From:   "Bernhard M. Wiedemann" <bwiedemann@suse.de>
To:     selinux@vger.kernel.org
Cc:     "Bernhard M. Wiedemann" <bwiedemann@suse.de>
Subject: [PATCH] python/sepolicy: allow to override manpage date
Date:   Fri, 30 Oct 2020 22:53:09 +0100
Message-Id: <20201030215309.23606-1-bwiedemann@suse.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

in order to make builds reproducible.
See https://reproducible-builds.org/ for why this is good
and https://reproducible-builds.org/specs/source-date-epoch/
for the definition of this variable.

This patch was done while working on reproducible builds for openSUSE.

Signed-off-by: Bernhard M. Wiedemann <bwiedemann@suse.de>
---
 python/sepolicy/sepolicy/manpage.py | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/python/sepolicy/sepolicy/manpage.py b/python/sepolicy/sepolicy/manpage.py
index 3e8a3be9..2f847abb 100755
--- a/python/sepolicy/sepolicy/manpage.py
+++ b/python/sepolicy/sepolicy/manpage.py
@@ -39,6 +39,8 @@ typealias_types = {
 equiv_dict = {"smbd": ["samba"], "httpd": ["apache"], "virtd": ["virt", "libvirt"], "named": ["bind"], "fsdaemon": ["smartmon"], "mdadm": ["raid"]}
 
 equiv_dirs = ["/var"]
+man_date = time.strftime("%y-%m-%d", time.gmtime(
+        int(os.environ.get('SOURCE_DATE_EPOCH', time.time()))))
 modules_dict = None
 
 
@@ -569,7 +571,7 @@ class ManPage:
 
     def _typealias(self,typealias):
         self.fd.write('.TH  "%(typealias)s_selinux"  "8"  "%(date)s" "%(typealias)s" "SELinux Policy %(typealias)s"'
-                 % {'typealias':typealias, 'date': time.strftime("%y-%m-%d")})
+                 % {'typealias':typealias, 'date': man_date})
         self.fd.write(r"""
 .SH "NAME"
 %(typealias)s_selinux \- Security Enhanced Linux Policy for the %(typealias)s processes
@@ -588,7 +590,7 @@ man page for more details.
 
     def _header(self):
         self.fd.write('.TH  "%(domainname)s_selinux"  "8"  "%(date)s" "%(domainname)s" "SELinux Policy %(domainname)s"'
-                      % {'domainname': self.domainname, 'date': time.strftime("%y-%m-%d")})
+                      % {'domainname': self.domainname, 'date': man_date})
         self.fd.write(r"""
 .SH "NAME"
 %(domainname)s_selinux \- Security Enhanced Linux Policy for the %(domainname)s processes
-- 
2.26.2

