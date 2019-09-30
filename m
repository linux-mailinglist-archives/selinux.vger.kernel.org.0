Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7579DC26A0
	for <lists+selinux@lfdr.de>; Mon, 30 Sep 2019 22:40:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729686AbfI3Uia (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Mon, 30 Sep 2019 16:38:30 -0400
Received: from mx1.polytechnique.org ([129.104.30.34]:44085 "EHLO
        mx1.polytechnique.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726576AbfI3Uia (ORCPT
        <rfc822;selinux@vger.kernel.org>); Mon, 30 Sep 2019 16:38:30 -0400
Received: from localhost.localdomain (85-168-38-217.rev.numericable.fr [85.168.38.217])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by ssl.polytechnique.org (Postfix) with ESMTPSA id A7AF1564866
        for <selinux@vger.kernel.org>; Mon, 30 Sep 2019 22:22:37 +0200 (CEST)
From:   Nicolas Iooss <nicolas.iooss@m4x.org>
To:     selinux@vger.kernel.org
Subject: [PATCH 2/2] libsemanage/tests: check that string pointers are not NULL before comparing them
Date:   Mon, 30 Sep 2019 22:22:11 +0200
Message-Id: <20190930202211.781578-2-nicolas.iooss@m4x.org>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190930202211.781578-1-nicolas.iooss@m4x.org>
References: <20190930202211.781578-1-nicolas.iooss@m4x.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AV-Checked: ClamAV using ClamSMTP at svoboda.polytechnique.org (Mon Sep 30 22:22:37 2019 +0200 (CEST))
X-Spam-Flag: No, tests=bogofilter, spamicity=0.000000, queueID=E0092564867
X-Org-Mail: nicolas.iooss.2010@polytechnique.org
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

This silences many issues reported by Infer static analyzer about
possible NULL pointer dereferences.

Signed-off-by: Nicolas Iooss <nicolas.iooss@m4x.org>
---
 libsemanage/tests/test_utilities.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/libsemanage/tests/test_utilities.c b/libsemanage/tests/test_utilities.c
index fa3a077f5e92..33609401920c 100644
--- a/libsemanage/tests/test_utilities.c
+++ b/libsemanage/tests/test_utilities.c
@@ -145,16 +145,19 @@ void test_semanage_split_on_space(void)
 		return;
 	}
 	temp = semanage_split_on_space(str);
+	CU_ASSERT_PTR_NOT_NULL_FATAL(temp);
 	CU_ASSERT_STRING_EQUAL(temp, "bar    baz");
 	free(str);
 	str = temp;
 
 	temp = semanage_split_on_space(str);
+	CU_ASSERT_PTR_NOT_NULL_FATAL(temp);
 	CU_ASSERT_STRING_EQUAL(temp, "baz");
 	free(str);
 	str = temp;
 
 	temp = semanage_split_on_space(str);
+	CU_ASSERT_PTR_NOT_NULL_FATAL(temp);
 	CU_ASSERT_STRING_EQUAL(temp, "");
 	free(str);
 	free(temp);
@@ -171,21 +174,25 @@ void test_semanage_split(void)
 		return;
 	}
 	temp = semanage_split(str, NULL);
+	CU_ASSERT_PTR_NOT_NULL_FATAL(temp);
 	CU_ASSERT_STRING_EQUAL(temp, "foo2   foo:bar:");
 	free(str);
 	str = temp;
 
 	temp = semanage_split(str, "");
+	CU_ASSERT_PTR_NOT_NULL_FATAL(temp);
 	CU_ASSERT_STRING_EQUAL(temp, "foo:bar:");
 	free(str);
 	str = temp;
 
 	temp = semanage_split(str, ":");
+	CU_ASSERT_PTR_NOT_NULL_FATAL(temp);
 	CU_ASSERT_STRING_EQUAL(temp, "bar:");
 	free(str);
 	str = temp;
 
 	temp = semanage_split(str, ":");
+	CU_ASSERT_PTR_NOT_NULL_FATAL(temp);
 	CU_ASSERT_STRING_EQUAL(temp, "");
 	free(str);
 	free(temp);
@@ -301,14 +308,17 @@ void test_semanage_findval(void)
 		CU_FAIL_FATAL("Temporary file was not created, aborting test.");
 	}
 	tok = semanage_findval(fname, "one", NULL);
+	CU_ASSERT_PTR_NOT_NULL_FATAL(tok);
 	CU_ASSERT_STRING_EQUAL(tok, "");
 	free(tok);
 	rewind(fptr);
 	tok = semanage_findval(fname, "one", "");
+	CU_ASSERT_PTR_NOT_NULL_FATAL(tok);
 	CU_ASSERT_STRING_EQUAL(tok, "");
 	free(tok);
 	rewind(fptr);
 	tok = semanage_findval(fname, "sigma", "=");
+	CU_ASSERT_PTR_NOT_NULL_FATAL(tok);
 	CU_ASSERT_STRING_EQUAL(tok, "foo");
 	free(tok);
 }
-- 
2.22.0

