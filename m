Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6904624C27B
	for <lists+selinux@lfdr.de>; Thu, 20 Aug 2020 17:47:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729319AbgHTPrs (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Thu, 20 Aug 2020 11:47:48 -0400
Received: from linux.microsoft.com ([13.77.154.182]:48538 "EHLO
        linux.microsoft.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729210AbgHTPro (ORCPT
        <rfc822;selinux@vger.kernel.org>); Thu, 20 Aug 2020 11:47:44 -0400
Received: from chpebeni.pebenito.net (pool-108-15-23-247.bltmmd.fios.verizon.net [108.15.23.247])
        by linux.microsoft.com (Postfix) with ESMTPSA id 5430920B4908
        for <selinux@vger.kernel.org>; Thu, 20 Aug 2020 08:47:44 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 5430920B4908
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
        s=default; t=1597938464;
        bh=20c9qFgdFc5gXQ6kpTizOIJEmpfZaPvGCL7LskAvpuY=;
        h=From:To:Subject:Date:From;
        b=EcgYZ+vK/rzuUj8sM5lp55kBDgm3WFmtwvx4cS84Aibsr5ljfxfNfgUsIRSexXxuZ
         CbnZgFY5JLfs4AS1ZUmdOWkuEKsYklKrCr54prnvDIe+E0gVI1ACGFkwTJIjvm3uN2
         akZ4ZSy2fErPtSnqOChoRpInw7/la08Fr8VtZePs=
From:   Chris PeBenito <chpebeni@linux.microsoft.com>
To:     selinux@vger.kernel.org
Subject: [PATCH 1/1] libselinux: Remove trailing slash on selabel_file lookups.
Date:   Thu, 20 Aug 2020 11:47:26 -0400
Message-Id: <20200820154726.210419-1-chpebeni@linux.microsoft.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Having a trailing slash on an selabel file lookup can yield a different
result.

For example:
/path/foo(/.*)?   user:role:type1
/path/foo/bar  -d user:role:type2

A lookup of "/path/foo/bar/" would yield user:role:type1 instead of
user:role:type2, which is unlike typical Linux behaviors where trailing
slashes are ignored.

Many callers already strip the trailing slash before the lookup or users
revise the file contexts to work around this.  Fix it comprehensively.

Signed-off-by: Chris PeBenito <chpebeni@linux.microsoft.com>
---
 libselinux/src/label_file.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/libselinux/src/label_file.c b/libselinux/src/label_file.c
index 412904d1..42d9d485 100644
--- a/libselinux/src/label_file.c
+++ b/libselinux/src/label_file.c
@@ -853,7 +853,7 @@ static const struct spec **lookup_all(struct selabel_handle *rec,
 {
 	struct saved_data *data = (struct saved_data *)rec->data;
 	struct spec *spec_arr = data->spec_arr;
-	int i, rc, file_stem;
+	int i, rc, file_stem, len;
 	mode_t mode = (mode_t)type;
 	char *clean_key = NULL;
 	const char *prev_slash, *next_slash;
@@ -894,6 +894,22 @@ static const struct spec **lookup_all(struct selabel_handle *rec,
 		key = clean_key;
 	}
 
+	/* remove trailing slash */
+	len = strlen(key);
+	if (key[len - 1] == '/') {
+		/* reuse clean_key from above if available */
+		if (!clean_key) {
+			clean_key = (char *) malloc(len);
+			if (!clean_key)
+				goto finish;
+
+			strncpy(clean_key, key, len - 1);
+		}
+
+		clean_key[len - 1] = '\0';
+		key = clean_key;
+	}
+
 	sub = selabel_sub_key(data, key);
 	if (sub)
 		key = sub;
-- 
2.26.2

