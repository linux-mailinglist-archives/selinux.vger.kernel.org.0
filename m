Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACA9333A7C8
	for <lists+selinux@lfdr.de>; Sun, 14 Mar 2021 21:22:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234014AbhCNUSW (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Sun, 14 Mar 2021 16:18:22 -0400
Received: from mx1.polytechnique.org ([129.104.30.34]:48188 "EHLO
        mx1.polytechnique.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233756AbhCNURp (ORCPT
        <rfc822;selinux@vger.kernel.org>); Sun, 14 Mar 2021 16:17:45 -0400
Received: from localhost.localdomain (85-168-38-217.rev.numericable.fr [85.168.38.217])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by ssl.polytechnique.org (Postfix) with ESMTPSA id 576D45646B2
        for <selinux@vger.kernel.org>; Sun, 14 Mar 2021 21:17:44 +0100 (CET)
From:   Nicolas Iooss <nicolas.iooss@m4x.org>
To:     selinux@vger.kernel.org
Subject: [PATCH 1/6] libsepol/cil: fix out-of-bound read of a file context pattern ending with "\"
Date:   Sun, 14 Mar 2021 21:16:46 +0100
Message-Id: <20210314201651.474432-1-nicolas.iooss@m4x.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AV-Checked: ClamAV using ClamSMTP at svoboda.polytechnique.org (Sun Mar 14 21:17:44 2021 +0100 (CET))
X-Spam-Flag: No, tests=bogofilter, spamicity=0.000024, queueID=A219D5646B4
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
 libsepol/cil/src/cil_post.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/libsepol/cil/src/cil_post.c b/libsepol/cil/src/cil_post.c
index a55df1ea5bb0..5f9cf4efd242 100644
--- a/libsepol/cil/src/cil_post.c
+++ b/libsepol/cil/src/cil_post.c
@@ -179,6 +179,12 @@ void cil_post_fc_fill_data(struct fc_data *fc, char *path)
 			break;
 		case '\\':
 			c++;
+			if (path[c] == '\0') {
+				if (!fc->meta) {
+					fc->stem_len++;
+				}
+				return;
+			}
 			/* FALLTHRU */
 		default:
 			if (!fc->meta) {
-- 
2.30.2

