Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D3FE6BD265
	for <lists+selinux@lfdr.de>; Tue, 24 Sep 2019 21:09:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2441865AbfIXTJR (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Tue, 24 Sep 2019 15:09:17 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37898 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2441864AbfIXTJR (ORCPT <rfc822;selinux@vger.kernel.org>);
        Tue, 24 Sep 2019 15:09:17 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 14AF6C05168C
        for <selinux@vger.kernel.org>; Tue, 24 Sep 2019 19:09:17 +0000 (UTC)
Received: from workstation.redhat.com (ovpn-204-49.brq.redhat.com [10.40.204.49])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 468F7600C8;
        Tue, 24 Sep 2019 19:09:16 +0000 (UTC)
From:   Petr Lautrbach <plautrba@redhat.com>
To:     selinux@vger.kernel.org
Cc:     Petr Lautrbach <plautrba@redhat.com>
Subject: [PATCH 2/2] policycoreutils/fixfiles: Force full relabel when SELinux is disabled
Date:   Tue, 24 Sep 2019 21:08:54 +0200
Message-Id: <20190924190854.245105-2-plautrba@redhat.com>
In-Reply-To: <20190924190854.245105-1-plautrba@redhat.com>
References: <20190924190854.245105-1-plautrba@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]); Tue, 24 Sep 2019 19:09:17 +0000 (UTC)
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

The previous check used getfilecon to check whether / slash contains a label,
but getfilecon fails only when SELinux is disabled. Therefore it's better to
check this using selinuxenabled.

Signed-off-by: Petr Lautrbach <plautrba@redhat.com>
---
 policycoreutils/scripts/fixfiles | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/policycoreutils/scripts/fixfiles b/policycoreutils/scripts/fixfiles
index 678fca40..ab0848ff 100755
--- a/policycoreutils/scripts/fixfiles
+++ b/policycoreutils/scripts/fixfiles
@@ -313,8 +313,8 @@ case "$1" in
 	> /.autorelabel || exit $?
 	[ -z "$FORCEFLAG" ] || echo -n "$FORCEFLAG " >> /.autorelabel
 	[ -z "$BOOTTIME" ] || echo -N $BOOTTIME >> /.autorelabel
-	# Force full relabel if / does not have a label on it
-	getfilecon / > /dev/null 2>&1  || echo -F >/.autorelabel
+	# Force full relabel if SELinux is not enabled
+	selinuxenabled || echo -F > /.autorelabel
 	echo "System will relabel on next boot"
 	;;
     *)
-- 
2.23.0

