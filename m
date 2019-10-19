Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 16714DD81B
	for <lists+selinux@lfdr.de>; Sat, 19 Oct 2019 12:27:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725810AbfJSK1C (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Sat, 19 Oct 2019 06:27:02 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:50686 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725535AbfJSK1C (ORCPT <rfc822;selinux@vger.kernel.org>);
        Sat, 19 Oct 2019 06:27:02 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 76657405C63B
        for <selinux@vger.kernel.org>; Sat, 19 Oct 2019 10:27:01 +0000 (UTC)
Received: from slave.localdomain.com (unknown [10.64.242.22])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 99CE4100724A;
        Sat, 19 Oct 2019 10:27:00 +0000 (UTC)
From:   Masatake YAMATO <yamato@redhat.com>
To:     selinux@vger.kernel.org
Cc:     yamato@redhat.com
Subject: [PATCH v2 1/3] checkpolicy: remove a redundant if-condition
Date:   Sat, 19 Oct 2019 19:26:54 +0900
Message-Id: <20191019102656.22972-1-yamato@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]); Sat, 19 Oct 2019 10:27:01 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]); Sat, 19 Oct 2019 10:27:01 +0000 (UTC) for IP:'10.11.54.3' DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com' HELO:'smtp.corp.redhat.com' FROM:'yamato@redhat.com' RCPT:''
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Inner if-condition in following code is redundant:

	if (outfile) {
		/* ... just referring outfile ... */
		if (outfile) {
			do_something();
		}
	}

We can simplify this to:

	if (outfile) {
		/* ... just referring outfile ... */
		do_something();
	}

Signed-off-by: Masatake YAMATO <yamato@redhat.com>
---
 checkpolicy/checkpolicy.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/checkpolicy/checkpolicy.c b/checkpolicy/checkpolicy.c
index f928ec06..e18de171 100644
--- a/checkpolicy/checkpolicy.c
+++ b/checkpolicy/checkpolicy.c
@@ -682,9 +682,7 @@ int main(int argc, char **argv)
 			}
 		}
 
-		if (outfile) {
-			fclose(outfp);
-		}
+		fclose(outfp);
 	} else if (cil) {
 		fprintf(stderr, "%s:  No file to write CIL was specified\n", argv[0]);
 		exit(1);
-- 
2.21.0

