Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A31134103D
	for <lists+selinux@lfdr.de>; Thu, 18 Mar 2021 23:15:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230297AbhCRWOj (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Thu, 18 Mar 2021 18:14:39 -0400
Received: from mx1.polytechnique.org ([129.104.30.34]:58857 "EHLO
        mx1.polytechnique.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232077AbhCRWOi (ORCPT
        <rfc822;selinux@vger.kernel.org>); Thu, 18 Mar 2021 18:14:38 -0400
Received: from localhost.localdomain (85-168-38-217.rev.numericable.fr [85.168.38.217])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by ssl.polytechnique.org (Postfix) with ESMTPSA id 85F54561266
        for <selinux@vger.kernel.org>; Thu, 18 Mar 2021 23:14:36 +0100 (CET)
From:   Nicolas Iooss <nicolas.iooss@m4x.org>
To:     selinux@vger.kernel.org
Subject: [PATCH v2] libsepol/cil: fix out-of-bound read of a file context pattern ending with "\"
Date:   Thu, 18 Mar 2021 23:14:10 +0100
Message-Id: <20210318221410.18945-1-nicolas.iooss@m4x.org>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AV-Checked: ClamAV using ClamSMTP at svoboda.polytechnique.org (Thu Mar 18 23:14:36 2021 +0100 (CET))
X-Spam-Flag: No, tests=bogofilter, spamicity=0.000008, queueID=BE5D356126A
X-Org-Mail: nicolas.iooss.2010@polytechnique.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

OSS-Fuzz found a Heap-buffer-overflow in the CIL compiler when trying to
compile the following policy:

    (sid SID)
    (sidorder(SID))
    (filecon "\" any ())
    (filecon "" any ())

When cil_post_fc_fill_data() processes "\", it goes beyond the NUL
terminator of the string. Fix this by returning when '\0' is read after
a backslash.

Fixes: https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=28484
Signed-off-by: Nicolas Iooss <nicolas.iooss@m4x.org>
---
 libsepol/cil/src/cil_post.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/libsepol/cil/src/cil_post.c b/libsepol/cil/src/cil_post.c
index d2ecbd430aa3..8ebf0fe74e80 100644
--- a/libsepol/cil/src/cil_post.c
+++ b/libsepol/cil/src/cil_post.c
@@ -186,6 +186,16 @@ static void cil_post_fc_fill_data(struct fc_data *fc, const char *path)
 			break;
 		case '\\':
 			c++;
+			if (path[c] == '\0') {
+				/* Count an ending backslash as a character, like refpolicy:
+				 * https://github.com/SELinuxProject/refpolicy/blob/RELEASE_2_20210203/support/fc_sort.py#L38-L61
+				 */
+				if (!fc->meta) {
+					fc->stem_len++;
+				}
+				fc->str_len++;
+				return;
+			}
 			/* FALLTHRU */
 		default:
 			if (!fc->meta) {
-- 
2.31.0

