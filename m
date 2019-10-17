Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 87E17DA5EA
	for <lists+selinux@lfdr.de>; Thu, 17 Oct 2019 09:05:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392640AbfJQHFW (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Thu, 17 Oct 2019 03:05:22 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:56638 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2390918AbfJQHFW (ORCPT <rfc822;selinux@vger.kernel.org>);
        Thu, 17 Oct 2019 03:05:22 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id EC859405C63A
        for <selinux@vger.kernel.org>; Thu, 17 Oct 2019 07:05:21 +0000 (UTC)
Received: from slave.localdomain.com (unknown [10.64.193.217])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 2F25C2166BA1;
        Thu, 17 Oct 2019 07:05:20 +0000 (UTC)
From:   Masatake YAMATO <yamato@redhat.com>
To:     selinux@vger.kernel.org
Cc:     yamato@redhat.com
Subject: [PATCH 1/3] checkpolicy: remove a redundant if-condition
Date:   Thu, 17 Oct 2019 16:05:11 +0900
Message-Id: <20191017070513.13445-1-yamato@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]); Thu, 17 Oct 2019 07:05:21 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]); Thu, 17 Oct 2019 07:05:21 +0000 (UTC) for IP:'10.11.54.6' DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com' HELO:'smtp.corp.redhat.com' FROM:'yamato@redhat.com' RCPT:''
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

