Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A03E370153
	for <lists+selinux@lfdr.de>; Fri, 30 Apr 2021 21:37:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230356AbhD3TiC (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Fri, 30 Apr 2021 15:38:02 -0400
Received: from mx1.polytechnique.org ([129.104.30.34]:35801 "EHLO
        mx1.polytechnique.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229534AbhD3TiB (ORCPT
        <rfc822;selinux@vger.kernel.org>); Fri, 30 Apr 2021 15:38:01 -0400
Received: from localhost.localdomain (85-168-38-217.rev.numericable.fr [85.168.38.217])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by ssl.polytechnique.org (Postfix) with ESMTPSA id E3279564EFE
        for <selinux@vger.kernel.org>; Fri, 30 Apr 2021 21:37:11 +0200 (CEST)
From:   Nicolas Iooss <nicolas.iooss@m4x.org>
To:     selinux@vger.kernel.org
Subject: [PATCH] libselinux: silence -Wstringop-overflow warning from gcc 10.3.1
Date:   Fri, 30 Apr 2021 21:37:02 +0200
Message-Id: <20210430193702.42974-1-nicolas.iooss@m4x.org>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-AV-Checked: ClamAV using ClamSMTP at svoboda.polytechnique.org (Fri Apr 30 21:37:12 2021 +0200 (CEST))
X-Spam-Flag: No, tests=bogofilter, spamicity=0.000021, queueID=2C3B4564EFF
X-Org-Mail: nicolas.iooss.2010@polytechnique.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

When building libselinux on Fedora 33 with gcc 10.3.1, the compiler
reports:

    label_file.c: In function ‘lookup_all.isra’:
    label_file.c:940:4: error: ‘strncpy’ specified bound depends on the
    length of the source argument [-Werror=stringop-overflow=]
      940 |    strncpy(clean_key, key, len - 1);
          |    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    label_file.c:927:8: note: length computed here
      927 |  len = strlen(key);
          |        ^~~~~~~~~~~
    cc1: all warnings being treated as errors

As clean_key is the result of malloc(len), there is no issue here. But
using strncpy can be considered as strange, because the size of the
string is already known and the NUL terminator is always added later, in
function ‘lookup_all.isra.

Replace strncpy with memcpy to silence this gcc false-positive warning.

Signed-off-by: Nicolas Iooss <nicolas.iooss@m4x.org>
---
 libselinux/src/label_file.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/libselinux/src/label_file.c b/libselinux/src/label_file.c
index 726394ca4332..cfce23e0119e 100644
--- a/libselinux/src/label_file.c
+++ b/libselinux/src/label_file.c
@@ -909,7 +909,7 @@ static const struct spec **lookup_all(struct selabel_handle *rec,
 			if (!clean_key)
 				goto finish;
 
-			strncpy(clean_key, key, len - 1);
+			memcpy(clean_key, key, len - 1);
 		}
 
 		clean_key[len - 1] = '\0';
-- 
2.31.0

