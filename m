Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EED75B6E97
	for <lists+selinux@lfdr.de>; Wed, 18 Sep 2019 23:04:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387641AbfIRVE5 (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Wed, 18 Sep 2019 17:04:57 -0400
Received: from mx1.polytechnique.org ([129.104.30.34]:55403 "EHLO
        mx1.polytechnique.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727165AbfIRVE5 (ORCPT
        <rfc822;selinux@vger.kernel.org>); Wed, 18 Sep 2019 17:04:57 -0400
Received: from localhost.localdomain (85-168-38-217.rev.numericable.fr [85.168.38.217])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by ssl.polytechnique.org (Postfix) with ESMTPSA id 01C1C564955
        for <selinux@vger.kernel.org>; Wed, 18 Sep 2019 23:04:54 +0200 (CEST)
From:   Nicolas Iooss <nicolas.iooss@m4x.org>
To:     selinux@vger.kernel.org
Subject: [PATCH 1/1] libselinux: ensure strlen() is not called on NULL
Date:   Wed, 18 Sep 2019 23:04:50 +0200
Message-Id: <20190918210450.8692-1-nicolas.iooss@m4x.org>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AV-Checked: ClamAV using ClamSMTP at svoboda.polytechnique.org (Wed Sep 18 23:04:55 2019 +0200 (CEST))
X-Spam-Flag: No, tests=bogofilter, spamicity=0.000000, queueID=3E8E7564956
X-Org-Mail: nicolas.iooss.2010@polytechnique.org
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

When compile_regex() calls regex_prepare_data() and this function fails
in the following condition:

    *regex = regex_data_create();
    if (!(*regex))
        return -1;

... error_data has been zero-ed and compile_regex() calls:

    regex_format_error(&error_data,
        regex_error_format_buffer,
        sizeof(regex_error_format_buffer));

This leads to a call to strlen(error_data->error_buffer), where
error_data->error_buffer is NULL.

Avoid this by checking that error_data->error_buffer is not NULL before
calling strlen().

This issue has been found using clang's static analyzer:
https://337-118970575-gh.circle-artifacts.com/0/output-scan-build/2019-09-01-181851-6152-1/report-0b122b.html#EndPath

Signed-off-by: Nicolas Iooss <nicolas.iooss@m4x.org>
---
 libselinux/src/regex.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/libselinux/src/regex.c b/libselinux/src/regex.c
index a6fcbbfec1f3..f967efe4a32f 100644
--- a/libselinux/src/regex.c
+++ b/libselinux/src/regex.c
@@ -546,7 +546,7 @@ void regex_format_error(struct regex_error_data const *error_data, char *buffer,
 	if (rc < 0)
 		abort();
 
-	if ((size_t)rc < strlen(error_data->error_buffer))
+	if (error_data->error_buffer && (size_t)rc < strlen(error_data->error_buffer))
 		goto truncated;
 #endif
 
-- 
2.22.0

