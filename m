Return-Path: <selinux+bounces-946-lists+selinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DDAB7886F22
	for <lists+selinux@lfdr.de>; Fri, 22 Mar 2024 15:56:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 99840282122
	for <lists+selinux@lfdr.de>; Fri, 22 Mar 2024 14:56:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87E4C48781;
	Fri, 22 Mar 2024 14:56:32 +0000 (UTC)
X-Original-To: selinux@vger.kernel.org
Received: from server02.seltendoof.de (server02.seltendoof.de [168.119.48.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF9B3481A5
	for <selinux@vger.kernel.org>; Fri, 22 Mar 2024 14:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.48.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711119392; cv=none; b=SOL/P+ncqXvIXIJG600FlGp6PC1h7AmLIl5A3Nfy4yGiv+P6uMtBByn2teT9vbcbjoAPcEH7PPJ63QU0JT2pFhDMnfD7y3ZL/a+bQpBDHuaAfa2LXe5m6FfNkmRo8oEbbi/mCNN+A9OFOmToYWa/hsDF0A+hjg6zIyO8kmqwMm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711119392; c=relaxed/simple;
	bh=gxQcX5XS05rm/d39mf8nu23DfHDZePJzMyU7BxqIti8=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=jqzRNkWjz40MG8sdnRsYWnIsEqC84YLsGmoq196Z4AqumVvZbKteapuLLiaQUs/py9RCyCrlp9CCu2m+zUTKXBzFgePeYW5BuKFd7zBR/kWsgnu2XpUMBBNPstKEolZs+4fOxCnqHPADlw5BZp68GVcyBAeuZ8MSczXKEvEfVaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com; spf=fail smtp.mailfrom=googlemail.com; arc=none smtp.client-ip=168.119.48.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=googlemail.com
From: =?UTF-8?q?Christian=20G=C3=B6ttsche?= <cgzones@googlemail.com>
To: selinux@vger.kernel.org
Subject: [PATCH v2] libselinux: avoid logs in get_ordered_context_list() without policy
Date: Fri, 22 Mar 2024 15:56:21 +0100
Message-ID: <20240322145621.61520-1-cgzones@googlemail.com>
Precedence: bulk
X-Mailing-List: selinux@vger.kernel.org
List-Id: <selinux.vger.kernel.org>
List-Subscribe: <mailto:selinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:selinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

If no policy has been loaded yet and thus the current context is still
"kernel" avoid logging failures in get_ordered_context_list(), like:

    get_ordered_context_list:  error in processing configuration file /etc/selinux/debian/contexts/users/root
    get_ordered_context_list:  error in processing configuration file /etc/selinux/debian/contexts/default_contexts

Move the context parsing from get_context_user() to its caller
get_ordered_context_list(), so an invalid context is not treated as an
get_context_user() failure and not logged.

Signed-off-by: Christian Göttsche <cgzones@googlemail.com>
---
v2:
  - move the context parsing from get_context_user() to its caller
  - add Signed-off-by
---
 libselinux/src/get_context_list.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/libselinux/src/get_context_list.c b/libselinux/src/get_context_list.c
index 7e23be05..0ad24654 100644
--- a/libselinux/src/get_context_list.c
+++ b/libselinux/src/get_context_list.c
@@ -130,7 +130,7 @@ static int is_in_reachable(char **reachable, const char *usercon_str)
 }
 
 static int get_context_user(FILE * fp,
-			     const char * fromcon,
+			     context_t fromcon,
 			     const char * user,
 			     char ***reachable,
 			     unsigned int *nreachable)
@@ -146,7 +146,6 @@ static int get_context_user(FILE * fp,
 	char **new_reachable = NULL;
 	char *usercon_str;
 	const char *usercon_str2;
-	context_t con;
 	context_t usercon;
 
 	int rc;
@@ -155,14 +154,10 @@ static int get_context_user(FILE * fp,
 
 	/* Extract the role and type of the fromcon for matching.
 	   User identity and MLS range can be variable. */
-	con = context_new(fromcon);
-	if (!con)
-		return -1;
-	fromrole = context_role_get(con);
-	fromtype = context_type_get(con);
-	fromlevel = context_range_get(con);
+	fromrole = context_role_get(fromcon);
+	fromtype = context_type_get(fromcon);
+	fromlevel = context_range_get(fromcon);
 	if (!fromrole || !fromtype) {
-		context_free(con);
 		return -1;
 	}
 
@@ -296,7 +291,6 @@ static int get_context_user(FILE * fp,
 	rc = 0;
 
       out:
-	context_free(con);
 	free(line);
 	return rc;
 }
@@ -418,6 +412,7 @@ int get_ordered_context_list(const char *user,
 	char *fname = NULL;
 	size_t fname_len;
 	const char *user_contexts_path = selinux_user_contexts_path();
+	context_t con = NULL;
 
 	if (!fromcon) {
 		/* Get the current context and use it for the starting context */
@@ -427,6 +422,10 @@ int get_ordered_context_list(const char *user,
 		fromcon = backup_fromcon;
 	}
 
+	con = context_new(fromcon);
+	if (!con)
+		goto failsafe;
+
 	/* Determine the ordering to apply from the optional per-user config
 	   and from the global config. */
 	fname_len = strlen(user_contexts_path) + strlen(user) + 2;
@@ -437,7 +436,7 @@ int get_ordered_context_list(const char *user,
 	fp = fopen(fname, "re");
 	if (fp) {
 		__fsetlocking(fp, FSETLOCKING_BYCALLER);
-		rc = get_context_user(fp, fromcon, user, &reachable, &nreachable);
+		rc = get_context_user(fp, con, user, &reachable, &nreachable);
 
 		fclose(fp);
 		if (rc < 0 && errno != ENOENT) {
@@ -451,7 +450,7 @@ int get_ordered_context_list(const char *user,
 	fp = fopen(selinux_default_context_path(), "re");
 	if (fp) {
 		__fsetlocking(fp, FSETLOCKING_BYCALLER);
-		rc = get_context_user(fp, fromcon, user, &reachable, &nreachable);
+		rc = get_context_user(fp, con, user, &reachable, &nreachable);
 		fclose(fp);
 		if (rc < 0 && errno != ENOENT) {
 			selinux_log(SELINUX_ERROR,
@@ -472,6 +471,7 @@ int get_ordered_context_list(const char *user,
 	else
 		freeconary(reachable);
 
+	context_free(con);
 	freecon(backup_fromcon);
 
 	return rc;
-- 
2.43.0


