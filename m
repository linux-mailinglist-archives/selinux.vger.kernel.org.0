Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 674E0266942
	for <lists+selinux@lfdr.de>; Fri, 11 Sep 2020 21:56:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725796AbgIKT4f (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Fri, 11 Sep 2020 15:56:35 -0400
Received: from linux.microsoft.com ([13.77.154.182]:58576 "EHLO
        linux.microsoft.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725778AbgIKT4d (ORCPT
        <rfc822;selinux@vger.kernel.org>); Fri, 11 Sep 2020 15:56:33 -0400
Received: from chpebeni.pebenito.net (pool-108-15-23-247.bltmmd.fios.verizon.net [108.15.23.247])
        by linux.microsoft.com (Postfix) with ESMTPSA id 0DC7720716FE
        for <selinux@vger.kernel.org>; Fri, 11 Sep 2020 12:56:32 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 0DC7720716FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
        s=default; t=1599854193;
        bh=+NhIQk80o7AZSfb6nMHMLMpstq8i8pmZQrbsp4bhXfY=;
        h=From:To:Subject:Date:From;
        b=p7UuGsBeMlaS/vkD0TuzEF4lpGZFgOs4JfWRqpl3bLgAxQdN0wskfyeCD7Mwi0FRr
         uZELBT0Rl9LraDFpacau0+/k1/+3YqY30qcvR/YTkgfKyH8RuVkO3O1XsNMjn93bhQ
         3+0ummqjEKG1P8/07mCsSiqecfAxZGocrCiNH10k=
From:   Chris PeBenito <chpebeni@linux.microsoft.com>
To:     selinux@vger.kernel.org
Subject: [PATCH v2 1/1] libselinux: Fix selabel_lookup() for the root dir.
Date:   Fri, 11 Sep 2020 15:56:14 -0400
Message-Id: <20200911195614.429223-1-chpebeni@linux.microsoft.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

9e4480b921bb ("Remove trailing slash on selabel_file lookups.") introduced
a bug which turns the root directory lookup "/" into an empty string.

v2: Fix commit message

Signed-off-by: Chris PeBenito <chpebeni@linux.microsoft.com>
---
 libselinux/src/label_file.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/libselinux/src/label_file.c b/libselinux/src/label_file.c
index 6eeeea68..726394ca 100644
--- a/libselinux/src/label_file.c
+++ b/libselinux/src/label_file.c
@@ -902,7 +902,7 @@ static const struct spec **lookup_all(struct selabel_handle *rec,
 		goto finish;
 	}
 
-	if (key[len - 1] == '/') {
+	if (len > 1 && key[len - 1] == '/') {
 		/* reuse clean_key from above if available */
 		if (!clean_key) {
 			clean_key = (char *) malloc(len);
-- 
2.26.2

