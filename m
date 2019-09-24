Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3B1BBBC1DA
	for <lists+selinux@lfdr.de>; Tue, 24 Sep 2019 08:41:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394008AbfIXGlf (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Tue, 24 Sep 2019 02:41:35 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48472 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389156AbfIXGlf (ORCPT <rfc822;selinux@vger.kernel.org>);
        Tue, 24 Sep 2019 02:41:35 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 40169308FB9D
        for <selinux@vger.kernel.org>; Tue, 24 Sep 2019 06:41:35 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.43.12.184])
        by smtp.corp.redhat.com (Postfix) with ESMTP id BB2C35D9CA
        for <selinux@vger.kernel.org>; Tue, 24 Sep 2019 06:41:34 +0000 (UTC)
From:   Vit Mojzis <vmojzis@redhat.com>
To:     selinux@vger.kernel.org
Subject: [PATCH] policycoreutils/fixfiles: Fix "verify" option
Date:   Tue, 24 Sep 2019 08:41:30 +0200
Message-Id: <20190924064130.20399-1-vmojzis@redhat.com>
In-Reply-To: <f9727681-817e-ba7a-7ba7-7837bf7f0212@tycho.nsa.gov>
References: <f9727681-817e-ba7a-7ba7-7837bf7f0212@tycho.nsa.gov>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]); Tue, 24 Sep 2019 06:41:35 +0000 (UTC)
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

"restorecon -n" (used in the "restore" function) has to be used with
"-v" to display the files whose labels would be changed.

Fixes:
   Fixfiles verify does not report misslabelled files unless "-v" option is
   used.

Signed-off-by: Vit Mojzis <vmojzis@redhat.com>
---
 policycoreutils/scripts/fixfiles | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/policycoreutils/scripts/fixfiles b/policycoreutils/scripts/fixfiles
index 5be9ba6e..1a31e061 100755
--- a/policycoreutils/scripts/fixfiles
+++ b/policycoreutils/scripts/fixfiles
@@ -302,7 +302,7 @@ process() {
 case "$1" in
     restore) restore Relabel;;
     check) VERBOSE="-v"; restore Check -n;;
-    verify) restore Verify -n;;
+    verify) VERBOSE="-v"; restore Verify -n;;
     relabel) relabel;;
     onboot)
 	if [ "$RESTORE_MODE" != DEFAULT ]; then
-- 
2.21.0

