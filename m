Return-Path: <selinux+bounces-2385-lists+selinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BBFA79D843C
	for <lists+selinux@lfdr.de>; Mon, 25 Nov 2024 12:19:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 58969B35B06
	for <lists+selinux@lfdr.de>; Mon, 25 Nov 2024 11:18:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C66D198A32;
	Mon, 25 Nov 2024 11:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=seltendoof.de header.i=@seltendoof.de header.b="D13nBEBr"
X-Original-To: selinux@vger.kernel.org
Received: from server02.seltendoof.de (server02.seltendoof.de [168.119.48.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57BC719645D
	for <selinux@vger.kernel.org>; Mon, 25 Nov 2024 11:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.48.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732533528; cv=none; b=uA854UT0256ZfdBpDpbmXjx/F2VzScrCzPH/zLOSic5Y0RfRkZFALS077ZVsOVuL11JaRbdXcl+/QcJ3LvylttpyiiyGLiqNcvWh5isvA2cr9pg3O7HCTdvCqQHri0YIEi2cow2UzQN7gG0dqwkY/Wm8zyGSVtqHzEKqBpTW4sI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732533528; c=relaxed/simple;
	bh=X5Kv3uLcQyzfZKVX4gz3VF8MsXUD9CbSDl/XTwCWRkI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZpZTKyWTOHcX1uF4kJSuzdMhDZJ+fAEuFFNcmmP54Rz0PKtoMTWTHUvw/Voe6X+RVJGV6n8gpqIY8tLVBEA98F8oaCaSy9SDvVN9r062pwcPAkSrepxuxyRYStWyWgr/S7tMKrY4yboKCG3cEQMVULOJUctjwj/YAYduI6epIwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=seltendoof.de; spf=pass smtp.mailfrom=seltendoof.de; dkim=pass (2048-bit key) header.d=seltendoof.de header.i=@seltendoof.de header.b=D13nBEBr; arc=none smtp.client-ip=168.119.48.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=seltendoof.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=seltendoof.de
From: =?UTF-8?q?Christian=20G=C3=B6ttsche?= <cgoettsche@seltendoof.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seltendoof.de;
	s=2023072701; t=1732533525;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h1OrDkm2suvUFvmfQlICwBamz2979XqKgU6gkhaLD9w=;
	b=D13nBEBrFfsRBVUOH3QMqZ0RNrz5DNMfD7+4mKd8iF0du4gNMlPJ5NJOCxysrb+LmF5hVQ
	96FxUvKJPWnGAnrDJpFM2C2vMEDEpg6w2rGWX3whDAUXhbCwcgcOtGhvfs83VlYYvtT5MH
	1CNjMdOGkKoIZ56XhAnuZyfY0BvzHjedQ4p7PqUgWMZbBAOkX2sgqz7f8TY1bp7SLrDdMp
	kUwGFU5lHTVeo9oXCoJpyjc0GmNgbFIrEFBwy24fbTcB6m6S0z5JeSekv2CfOWYNnIV63t
	/u+VdQ+dlYli95cF+5VQbyshMqUmjxr1dd2JEigpNmI2JnG2BerkHyvSyinlag==
To: selinux@vger.kernel.org
Cc: =?UTF-8?q?Christian=20G=C3=B6ttsche?= <cgzones@googlemail.com>
Subject: [PATCH v2 5/9] libsemanage: check closing written files
Date: Mon, 25 Nov 2024 12:18:36 +0100
Message-ID: <20241125111840.63845-5-cgoettsche@seltendoof.de>
In-Reply-To: <20241125111840.63845-1-cgoettsche@seltendoof.de>
References: <20241125111840.63845-1-cgoettsche@seltendoof.de>
Reply-To: cgzones@googlemail.com
Precedence: bulk
X-Mailing-List: selinux@vger.kernel.org
List-Id: <selinux.vger.kernel.org>
List-Subscribe: <mailto:selinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:selinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Christian Göttsche <cgzones@googlemail.com>

Check that closing a file that has been written to is successful, to
avoid potential unsuccessful writes/syncs.

Signed-off-by: Christian Göttsche <cgzones@googlemail.com>
---
 libsemanage/src/database_file.c  |  5 ++++-
 libsemanage/src/direct_api.c     | 15 +++++++++------
 libsemanage/src/genhomedircon.c  |  3 ++-
 libsemanage/src/semanage_store.c | 18 +++++++++++++-----
 4 files changed, 28 insertions(+), 13 deletions(-)

diff --git a/libsemanage/src/database_file.c b/libsemanage/src/database_file.c
index 47814254..214dbe6c 100644
--- a/libsemanage/src/database_file.c
+++ b/libsemanage/src/database_file.c
@@ -149,7 +149,10 @@ static int dbase_file_flush(semanage_handle_t * handle, dbase_file_t * dbase)
 	}
 
 	dbase_llist_set_modified(&dbase->llist, 0);
-	fclose(str);
+	if (fclose(str) != 0 && errno != EINTR) {
+		str = NULL;
+		goto err;
+	}
 	return STATUS_SUCCESS;
 
       err:
diff --git a/libsemanage/src/direct_api.c b/libsemanage/src/direct_api.c
index 0e7ef4da..87c7627d 100644
--- a/libsemanage/src/direct_api.c
+++ b/libsemanage/src/direct_api.c
@@ -467,7 +467,10 @@ static int write_file(semanage_handle_t * sh,
 		close(out);
 		return -1;
 	}
-	close(out);
+	if (close(out) == -1 && errno != EINTR) {
+		ERR(sh, "Error while closing %s.", filename);
+		return -1;
+	}
 	return 0;
 }
 
@@ -839,7 +842,7 @@ static int semanage_direct_write_langext(semanage_handle_t *sh,
 		goto cleanup;
 	}
 
-	if (fclose(fp) != 0) {
+	if (fclose(fp) != 0 && errno != EINTR) {
 		ERR(sh, "Unable to close %s module ext file.", modinfo->name);
 		fp = NULL;
 		ret = -1;
@@ -1216,7 +1219,7 @@ static int semanage_direct_commit(semanage_handle_t * sh)
 		FILE *touch;
 		touch = fopen(path, "we");
 		if (touch != NULL) {
-			if (fclose(touch) != 0) {
+			if (fclose(touch) != 0 && errno != EINTR) {
 				ERR(sh, "Error attempting to create disable_dontaudit flag.");
 				goto cleanup;
 			}
@@ -1248,7 +1251,7 @@ static int semanage_direct_commit(semanage_handle_t * sh)
 		FILE *touch;
 		touch = fopen(path, "we");
 		if (touch != NULL) {
-			if (fclose(touch) != 0) {
+			if (fclose(touch) != 0 && errno != EINTR) {
 				ERR(sh, "Error attempting to create preserve_tunable flag.");
 				goto cleanup;
 			}
@@ -2120,7 +2123,7 @@ static int semanage_direct_set_enabled(semanage_handle_t *sh,
 
 			ret = fclose(fp);
 			fp = NULL;
-			if (ret != 0) {
+			if (ret != 0 && errno != EINTR) {
 				ERR(sh,
 				    "Unable to close disabled file for module %s",
 				    modkey->name);
@@ -2321,7 +2324,7 @@ static int semanage_direct_get_module_info(semanage_handle_t *sh,
 	free(tmp);
 	tmp = NULL;
 
-	if (fclose(fp) != 0) {
+	if (fclose(fp) != 0 && errno != EINTR) {
 		fp = NULL;
 		ERR(sh,
 		    "Unable to close %s module lang ext file.",
diff --git a/libsemanage/src/genhomedircon.c b/libsemanage/src/genhomedircon.c
index 4949bc75..19543799 100644
--- a/libsemanage/src/genhomedircon.c
+++ b/libsemanage/src/genhomedircon.c
@@ -1429,7 +1429,8 @@ int semanage_genhomedircon(semanage_handle_t * sh,
 
 done:
 	if (out != NULL)
-		fclose(out);
+		if (fclose(out) != 0 && errno != EINTR)
+			retval = STATUS_ERR;
 
 	while (s.fallback)
 		pop_user_entry(&(s.fallback));
diff --git a/libsemanage/src/semanage_store.c b/libsemanage/src/semanage_store.c
index cdb495cb..e44efc16 100644
--- a/libsemanage/src/semanage_store.c
+++ b/libsemanage/src/semanage_store.c
@@ -717,7 +717,7 @@ int semanage_copy_file(semanage_handle_t *sh, const char *src, const char *dst,
 		errsv = errno;
 		retval = -1;
 	}
-	if (close(out) < 0) {
+	if (close(out) < 0 && errno != EINTR) {
 		errsv = errno;
 		retval = -1;
 	}
@@ -1536,9 +1536,11 @@ int semanage_split_fc(semanage_handle_t * sh)
 	if (file_con)
 		fclose(file_con);
 	if (fc >= 0)
-		close(fc);
+		if (close(fc) == -1 && errno != EINTR)
+			retval = -1;
 	if (hd >= 0)
-		close(hd);
+		if (close(hd) == -1 && errno != EINTR)
+			retval = -1;
 
 	return retval;
 
@@ -1732,7 +1734,11 @@ static int semanage_commit_sandbox(semanage_handle_t * sh)
 		close(fd);
 		return -1;
 	}
-	close(fd);
+	if (close(fd) == -1 && errno != EINTR) {
+		ERR(sh, "Error while closing commit number file %s.",
+		    commit_filename);
+		return -1;
+	}
 
 	/* sync changes in sandbox to filesystem */
 	fd = open(sandbox, O_DIRECTORY | O_CLOEXEC);
@@ -2157,7 +2163,9 @@ int semanage_write_policydb(semanage_handle_t * sh, sepol_policydb_t * out,
 
       cleanup:
 	if (outfile != NULL) {
-		fclose(outfile);
+		if (fclose(outfile) != 0 && errno != EINTR) {
+			retval = STATUS_ERR;
+		}
 	}
 	umask(mask);
 	sepol_policy_file_free(pf);
-- 
2.45.2


