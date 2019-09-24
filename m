Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C78E5BD277
	for <lists+selinux@lfdr.de>; Tue, 24 Sep 2019 21:15:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2441892AbfIXTPb (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Tue, 24 Sep 2019 15:15:31 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53306 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2441891AbfIXTPa (ORCPT <rfc822;selinux@vger.kernel.org>);
        Tue, 24 Sep 2019 15:15:30 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id C91D310DCC9F
        for <selinux@vger.kernel.org>; Tue, 24 Sep 2019 19:15:30 +0000 (UTC)
Received: from workstation.redhat.com (ovpn-204-49.brq.redhat.com [10.40.204.49])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 0F6C710018FF;
        Tue, 24 Sep 2019 19:15:29 +0000 (UTC)
From:   Petr Lautrbach <plautrba@redhat.com>
To:     selinux@vger.kernel.org
Cc:     Petr Lautrbach <plautrba@redhat.com>
Subject: [PATCH] python/semanage: Do not use default s0 range in "semanage login -a"
Date:   Tue, 24 Sep 2019 21:15:23 +0200
Message-Id: <20190924191523.246357-1-plautrba@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.64]); Tue, 24 Sep 2019 19:15:30 +0000 (UTC)
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Using the "s0" default means that new login mappings are always added with "s0"
range instead of the range of SELinux user.

Signed-off-by: Petr Lautrbach <plautrba@redhat.com>
---
 python/semanage/semanage | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/python/semanage/semanage b/python/semanage/semanage
index 1934a561..f4266cef 100644
--- a/python/semanage/semanage
+++ b/python/semanage/semanage
@@ -237,7 +237,7 @@ def parser_add_level(parser, name):
 
 
 def parser_add_range(parser, name):
-    parser.add_argument('-r', '--range', default="s0",
+    parser.add_argument('-r', '--range', default='',
                         help=_('''
 MLS/MCS Security Range (MLS/MCS Systems only)
 SELinux Range  for SELinux login mapping
-- 
2.23.0

