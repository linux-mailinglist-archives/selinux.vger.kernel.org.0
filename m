Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C254AD39D4
	for <lists+selinux@lfdr.de>; Fri, 11 Oct 2019 09:07:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727557AbfJKHHj (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Fri, 11 Oct 2019 03:07:39 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53336 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726755AbfJKHHj (ORCPT <rfc822;selinux@vger.kernel.org>);
        Fri, 11 Oct 2019 03:07:39 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id A108030024DA
        for <selinux@vger.kernel.org>; Fri, 11 Oct 2019 07:07:39 +0000 (UTC)
Received: from workstation.redhat.com (ovpn-204-143.brq.redhat.com [10.40.204.143])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 030715DD7A;
        Fri, 11 Oct 2019 07:07:36 +0000 (UTC)
From:   Petr Lautrbach <plautrba@redhat.com>
To:     selinux@vger.kernel.org
Cc:     Petr Lautrbach <plautrba@redhat.com>
Subject: [PATCH] libsepol: Use LIBSEPOL_3.0 and fix sepol_policydb_optimize symbol mapping
Date:   Fri, 11 Oct 2019 09:07:17 +0200
Message-Id: <20191011070716.198563-1-plautrba@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]); Fri, 11 Oct 2019 07:07:39 +0000 (UTC)
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

There's a typo in commit b8213acff837101 ("libsepol: add a function to optimize
kernel policy") which added new function sepol_policydb_optimize(), but there's
sepol_optimize_policy in libsepol.map.

LIBSEPOL_3.0 is used to follow the next release version libsepol-3.0

Signed-off-by: Petr Lautrbach <plautrba@redhat.com>
---
 libsepol/src/libsepol.map.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/libsepol/src/libsepol.map.in b/libsepol/src/libsepol.map.in
index 6358e51f..f4946a79 100644
--- a/libsepol/src/libsepol.map.in
+++ b/libsepol/src/libsepol.map.in
@@ -60,7 +60,7 @@ LIBSEPOL_1.1 {
 	sepol_polcap_getname;
 } LIBSEPOL_1.0;
 
-LIBSEPOL_1.2 {
+LIBSEPOL_3.0 {
   global:
-	sepol_optimize_policy;
+	sepol_policydb_optimize;
 } LIBSEPOL_1.1;
-- 
2.23.0

