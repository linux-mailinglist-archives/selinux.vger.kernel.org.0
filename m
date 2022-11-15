Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 41957629C1C
	for <lists+selinux@lfdr.de>; Tue, 15 Nov 2022 15:28:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230466AbiKOO2X (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Tue, 15 Nov 2022 09:28:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232544AbiKOO2L (ORCPT
        <rfc822;selinux@vger.kernel.org>); Tue, 15 Nov 2022 09:28:11 -0500
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FFCF2CE26
        for <selinux@vger.kernel.org>; Tue, 15 Nov 2022 06:28:01 -0800 (PST)
Received: from dggpeml500026.china.huawei.com (unknown [172.30.72.57])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4NBT6M38w0zRpKk
        for <selinux@vger.kernel.org>; Tue, 15 Nov 2022 22:27:39 +0800 (CST)
Received: from dggpeml500008.china.huawei.com (7.185.36.147) by
 dggpeml500026.china.huawei.com (7.185.36.106) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 15 Nov 2022 22:27:57 +0800
Received: from huawei.com (10.175.104.170) by dggpeml500008.china.huawei.com
 (7.185.36.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Tue, 15 Nov
 2022 22:27:57 +0800
From:   Jie Lu <lujie54@huawei.com>
To:     <selinux@vger.kernel.org>
Subject: [PATCH] libselinux: fix memory leaks on the audit2why module init
Date:   Tue, 15 Nov 2022 19:55:36 +0800
Message-ID: <20221115115536.2647075-1-lujie54@huawei.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.104.170]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpeml500008.china.huawei.com (7.185.36.147)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Signed-off-by: Jie Lu <lujie54@huawei.com>
---
 libselinux/src/audit2why.c | 32 +++++++++++++++++++++++---------
 1 file changed, 23 insertions(+), 9 deletions(-)

diff --git a/libselinux/src/audit2why.c b/libselinux/src/audit2why.c
index 44a9a341..ba1a66eb 100644
--- a/libselinux/src/audit2why.c
+++ b/libselinux/src/audit2why.c
@@ -191,7 +191,7 @@ static PyObject *finish(PyObject *self __attribute__((unused)), PyObject *args)
 
 static int __policy_init(const char *init_path)
 {
-	FILE *fp;
+	FILE *fp = NULL;
 	const char *curpolicy;
 	char errormsg[PATH_MAX+1024+20];
 	struct sepol_policy_file *pf = NULL;
@@ -235,18 +235,17 @@ static int __policy_init(const char *init_path)
 		snprintf(errormsg, sizeof(errormsg), 
 			 "policydb_init failed: %m\n");
 		PyErr_SetString( PyExc_RuntimeError, errormsg);
-		fclose(fp);
-		return 1;
+		goto err;
 	}
 	sepol_policy_file_set_fp(pf, fp);	
 	if (sepol_policydb_read(avc->policydb, pf)) {
 		snprintf(errormsg, sizeof(errormsg), 
 			 "invalid binary policy %s\n", curpolicy);
 		PyErr_SetString( PyExc_ValueError, errormsg);
-		fclose(fp);
-		return 1;
+		goto err;
 	}
 	fclose(fp);
+	fp = NULL;
 	sepol_set_policydb(&avc->policydb->p);
 	avc->handle = sepol_handle_create();
 	/* Turn off messages */
@@ -256,13 +255,13 @@ static int __policy_init(const char *init_path)
 			      avc->policydb, &cnt);
 	if (rc < 0) {
 		PyErr_SetString( PyExc_RuntimeError, "unable to get bool count\n");
-		return 1;
+		goto err;
 	}
 
 	boollist = calloc(cnt, sizeof(*boollist));
 	if (!boollist) {
 		PyErr_SetString( PyExc_MemoryError, "Out of memory\n");
-		return 1;
+		goto err;
 	}
 
 	sepol_bool_iterate(avc->handle, avc->policydb,
@@ -273,11 +272,26 @@ static int __policy_init(const char *init_path)
 	rc = sepol_sidtab_init(&sidtab);
 	if (rc < 0) {
 		PyErr_SetString( PyExc_RuntimeError, "unable to init sidtab\n");
-		free(boollist);
-		return 1;
+		goto err;
 	}
 	sepol_set_sidtab(&sidtab);
 	return 0;
+
+err:
+	if (boollist)
+		free(boollist);
+	if (avc){
+		if (avc->handle)
+			sepol_handle_destroy(avc->handle);
+		if (avc->policydb)
+			sepol_policydb_free(avc->policydb);
+		free(avc);
+	}
+	if (pf)
+		sepol_policy_file_free(pf);
+	if (fp)
+		fclose(fp);
+	return 1;
 }
 
 static PyObject *init(PyObject *self __attribute__((unused)), PyObject *args) {
-- 
2.27.0

