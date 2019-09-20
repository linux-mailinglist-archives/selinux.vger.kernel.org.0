Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6DDE6B8AAA
	for <lists+selinux@lfdr.de>; Fri, 20 Sep 2019 08:00:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404732AbfITGAG (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Fri, 20 Sep 2019 02:00:06 -0400
Received: from mx1.polytechnique.org ([129.104.30.34]:44940 "EHLO
        mx1.polytechnique.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404717AbfITGAG (ORCPT
        <rfc822;selinux@vger.kernel.org>); Fri, 20 Sep 2019 02:00:06 -0400
Received: from localhost.localdomain (85-168-38-217.rev.numericable.fr [85.168.38.217])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by ssl.polytechnique.org (Postfix) with ESMTPSA id 0034756128C
        for <selinux@vger.kernel.org>; Fri, 20 Sep 2019 08:00:02 +0200 (CEST)
From:   Nicolas Iooss <nicolas.iooss@m4x.org>
To:     selinux@vger.kernel.org
Subject: [PATCH v2 2/2] libselinux: do not add rc to pos twice
Date:   Fri, 20 Sep 2019 07:59:55 +0200
Message-Id: <20190920055955.2780-2-nicolas.iooss@m4x.org>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190920055955.2780-1-nicolas.iooss@m4x.org>
References: <20190920055955.2780-1-nicolas.iooss@m4x.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AV-Checked: ClamAV using ClamSMTP at svoboda.polytechnique.org (Fri Sep 20 08:00:03 2019 +0200 (CEST))
X-Spam-Flag: No, tests=bogofilter, spamicity=0.000000, queueID=3F980561295
X-Org-Mail: nicolas.iooss.2010@polytechnique.org
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

In regex_format_error(), when error_data->error_offset is zero, rc is
not updated and should not be added to pos again.

Signed-off-by: Nicolas Iooss <nicolas.iooss@m4x.org>
---
 libselinux/src/regex.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/libselinux/src/regex.c b/libselinux/src/regex.c
index c835dd1b0e5d..770bc3ea1310 100644
--- a/libselinux/src/regex.c
+++ b/libselinux/src/regex.c
@@ -552,10 +552,10 @@ void regex_format_error(struct regex_error_data const *error_data, char *buffer,
 #endif
 		if (rc < 0)
 			abort();
+		pos += rc;
+		if (pos >= buf_size)
+			goto truncated;
 	}
-	pos += rc;
-	if (pos >= buf_size)
-		goto truncated;
 
 #ifdef USE_PCRE2
 	rc = pcre2_get_error_message(error_data->error_code,
-- 
2.22.0

