Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65C5A2668EE
	for <lists+selinux@lfdr.de>; Fri, 11 Sep 2020 21:36:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725832AbgIKTgV (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Fri, 11 Sep 2020 15:36:21 -0400
Received: from linux.microsoft.com ([13.77.154.182]:56084 "EHLO
        linux.microsoft.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725776AbgIKTgP (ORCPT
        <rfc822;selinux@vger.kernel.org>); Fri, 11 Sep 2020 15:36:15 -0400
Received: from chpebeni.pebenito.net (pool-108-15-23-247.bltmmd.fios.verizon.net [108.15.23.247])
        by linux.microsoft.com (Postfix) with ESMTPSA id BB27620716FE
        for <selinux@vger.kernel.org>; Fri, 11 Sep 2020 12:36:14 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com BB27620716FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
        s=default; t=1599852975;
        bh=xmrvIik7c48YvpeV3mPokVwZiA70uTfegAwdurM1JAQ=;
        h=From:To:Subject:Date:From;
        b=XjqDWlN72OQRpGcY0UHf9dGrKY4sFJEKFKUh2jagt4iclNIVTZwhpZ48luyJ+IC38
         Z3mRrC35S59/eJq9kkUqPIV9sHM0UzQ2mQhDe8/+e1v8tffq+XLQCycRj5r7CDrdxA
         PSibYOF9v/UCNrMmeiXwJkHFnjtY2u5mQ1jnkSiU=
From:   Chris PeBenito <chpebeni@linux.microsoft.com>
To:     selinux@vger.kernel.org
Subject: [PATCH 1/1] libselinux: Fix selabel_lookup() for the root dir.
Date:   Fri, 11 Sep 2020 15:35:34 -0400
Message-Id: <20200911193534.427521-1-chpebeni@linux.microsoft.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

9e4480b introduced a change for removing trailing slashes from
selabel_lookup() for files contexts.  However, it turns the root directory
lookup "/" into an empty string.

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

