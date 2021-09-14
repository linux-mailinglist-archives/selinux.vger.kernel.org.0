Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 757E240AE33
	for <lists+selinux@lfdr.de>; Tue, 14 Sep 2021 14:50:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232979AbhINMwD (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Tue, 14 Sep 2021 08:52:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232902AbhINMwD (ORCPT
        <rfc822;selinux@vger.kernel.org>); Tue, 14 Sep 2021 08:52:03 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 401C7C061574
        for <selinux@vger.kernel.org>; Tue, 14 Sep 2021 05:50:46 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id z94so13508189ede.8
        for <selinux@vger.kernel.org>; Tue, 14 Sep 2021 05:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=VaHOaiP8+U4rpuL3cP9P9jqDOOWzBBi0VtCS3a1Rcmw=;
        b=go98Ck5udomYFOq7Qo6jWchKsyLHo2rP7cKjD2XiOkc/7k9+f62JHMkHgLr5uqhNtv
         HIOaZ23yb9iK8M2P7guwASRbRmqimexlYllj/4EJfcyj9W2PPkP4vt9vQjfyDkpxAHP7
         HW/wQkg6u41/Fk01YjDHFuWbFmGyBvXyiEnrUTXoJMlgz3EmACh1r7/jHzLCnVdo94+6
         i3pVOJZsdgOqlUQym2y8y+C0IjVBAPRJcpthyW7K0/6LK+wSreF+hNjfmNpwTQsoCsUY
         V1QvjV1lZ9892RMbwgCx6q6LpkvxCOCmOUkS3Kh72gmAPBRDxO+QghHBnqYnpe0+9o8q
         0ycg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VaHOaiP8+U4rpuL3cP9P9jqDOOWzBBi0VtCS3a1Rcmw=;
        b=wqXKxoUPMsHIWxdgeMNLNANwLoQ3FO7PpLahdJi1mGitekD+TBOUg7pOil6AJprx0S
         zpjk/Ds0P2x4ALXIilD8H01aWXJOqJEI9yXd3n+0/bvxzMznGV/IjNVgrhlCVxdU77RB
         sV0wpHLOzr2kC8rmPEhrbGrHCF1VEZVf8NCHA/rCH4pYedgefsnFizglPrnIt55UQNN9
         3KtvgGvrvq8Gv5o8b10/WSQdkOA9+9nwYTIDDhqpdzwSd+mGtL1b1hjBU9khRxhdnOKp
         KV5EgkIbfLxoqHg8Gjt+EADfTTfUNJ9IUo0Walo406DZWtSFMbGIRrg5xtYgLVbD/3zk
         lV4w==
X-Gm-Message-State: AOAM532JkJKyUoJarW6hPV4hMJCyGbaAUZXo3ajZUz1HPpzdosklmbrM
        0+l3tjP4bDOcKa+WXM1CHYVti1WQdVo=
X-Google-Smtp-Source: ABdhPJwTrI1lPmcjaIIK0nT1ohpBPrmvwMq85hcwQMT+ERpxfeUen3d2Lf16aaOMAcZmSGRgCblD/w==
X-Received: by 2002:a05:6402:905:: with SMTP id g5mr11703898edz.125.1631623844837;
        Tue, 14 Sep 2021 05:50:44 -0700 (PDT)
Received: from debianHome.localdomain (dynamic-077-003-237-250.77.3.pool.telefonica.de. [77.3.237.250])
        by smtp.gmail.com with ESMTPSA id r8sm5567865eds.39.2021.09.14.05.50.44
        for <selinux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Sep 2021 05:50:44 -0700 (PDT)
From:   =?UTF-8?q?Christian=20G=C3=B6ttsche?= <cgzones@googlemail.com>
To:     selinux@vger.kernel.org
Subject: [PATCH 04/13] checkpolicy: misc checkmodule tweaks
Date:   Tue, 14 Sep 2021 14:48:19 +0200
Message-Id: <20210914124828.19488-5-cgzones@googlemail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210914124828.19488-1-cgzones@googlemail.com>
References: <20210914124828.19488-1-cgzones@googlemail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Add missing argument in usage message.
Drop redundant includes `optarg` and `optind`, which are declared in
<getopt.h>.
Use consistent quit style by using `exit(1)`.
Mark read-only options struct const.
Check closing file streams after writing, which can signal a failed
write or sync to disk and should be checked.

Signed-off-by: Christian Göttsche <cgzones@googlemail.com>
---
 checkpolicy/checkmodule.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/checkpolicy/checkmodule.c b/checkpolicy/checkmodule.c
index 316b2898..3432608b 100644
--- a/checkpolicy/checkmodule.c
+++ b/checkpolicy/checkmodule.c
@@ -34,9 +34,6 @@
 #include "checkpolicy.h"
 #include "parse_util.h"
 
-extern char *optarg;
-extern int optind;
-
 static sidtab_t sidtab;
 
 extern int mlspol;
@@ -126,7 +123,7 @@ static int write_binary_policy(policydb_t * p, FILE *outfp)
 
 static __attribute__((__noreturn__)) void usage(const char *progname)
 {
-	printf("usage:  %s [-h] [-V] [-b] [-C] [-E] [-U handle_unknown] [-m] [-M] [-o FILE] [INPUT]\n", progname);
+	printf("usage:  %s [-h] [-V] [-b] [-C] [-E] [-U handle_unknown] [-m] [-M] [-o FILE] [-c VERSION] [INPUT]\n", progname);
 	printf("Build base and policy modules.\n");
 	printf("Options:\n");
 	printf("  INPUT      build module from INPUT (else read from \"%s\")\n",
@@ -155,7 +152,7 @@ int main(int argc, char **argv)
 	int ch;
 	int show_version = 0;
 	policydb_t modpolicydb;
-	struct option long_options[] = {
+	const struct option long_options[] = {
 		{"help", no_argument, NULL, 'h'},
 		{"output", required_argument, NULL, 'o'},
 		{"binary", no_argument, NULL, 'b'},
@@ -271,7 +268,7 @@ int main(int argc, char **argv)
 	} else {
 		if (policydb_init(&modpolicydb)) {
 			fprintf(stderr, "%s: out of memory!\n", argv[0]);
-			return -1;
+			exit(1);
 		}
 
 		modpolicydb.policy_type = policy_type;
@@ -283,7 +280,7 @@ int main(int argc, char **argv)
 		}
 
 		if (hierarchy_check_constraints(NULL, &modpolicydb)) {
-			return -1;
+			exit(1);
 		}
 	}
 
@@ -336,7 +333,7 @@ int main(int argc, char **argv)
 		FILE *outfp = fopen(outfile, "w");
 
 		if (!outfp) {
-			perror(outfile);
+			fprintf(stderr, "%s:  error opening %s:  %s\n", argv[0], outfile, strerror(errno));
 			exit(1);
 		}
 
@@ -352,7 +349,10 @@ int main(int argc, char **argv)
 			}
 		}
 
-		fclose(outfp);
+		if (fclose(outfp)) {
+			fprintf(stderr, "%s:  error closing %s:  %s\n", argv[0], outfile, strerror(errno));
+			exit(1);
+		}
 	} else if (cil) {
 		fprintf(stderr, "%s:  No file to write CIL was specified\n", argv[0]);
 		exit(1);
-- 
2.33.0

