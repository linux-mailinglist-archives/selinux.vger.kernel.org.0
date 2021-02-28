Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 712923271A3
	for <lists+selinux@lfdr.de>; Sun, 28 Feb 2021 09:49:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230175AbhB1ItC (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Sun, 28 Feb 2021 03:49:02 -0500
Received: from mx1.polytechnique.org ([129.104.30.34]:56120 "EHLO
        mx1.polytechnique.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230125AbhB1ItA (ORCPT
        <rfc822;selinux@vger.kernel.org>); Sun, 28 Feb 2021 03:49:00 -0500
Received: from localhost.localdomain (85-168-38-217.rev.numericable.fr [85.168.38.217])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by ssl.polytechnique.org (Postfix) with ESMTPSA id 0C61856126E
        for <selinux@vger.kernel.org>; Sun, 28 Feb 2021 09:48:19 +0100 (CET)
From:   Nicolas Iooss <nicolas.iooss@m4x.org>
To:     selinux@vger.kernel.org
Subject: [PATCH 1/1] restorecond: invalidate local_lock_fd properly when closing it
Date:   Sun, 28 Feb 2021 09:48:09 +0100
Message-Id: <20210228084809.8387-1-nicolas.iooss@m4x.org>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AV-Checked: ClamAV using ClamSMTP at svoboda.polytechnique.org (Sun Feb 28 09:48:19 2021 +0100 (CET))
X-Spam-Flag: No, tests=bogofilter, spamicity=0.001685, queueID=3F586561274
X-Org-Mail: nicolas.iooss.2010@polytechnique.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

If flock(local_lock_fd,...) fails, in function local_server(), the file
descriptor to the lock file is closed but local_lock_fd is not reset to
-1. This leads to server() calling end_local_server(), which closes the
file descriptor again.

Fix this double-close issue by setting local_lock_fd to -1 after closing
it.

This issue was found by using Facebook's Infer static analyzer.

Signed-off-by: Nicolas Iooss <nicolas.iooss@m4x.org>
---
 restorecond/user.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/restorecond/user.c b/restorecond/user.c
index a24b8407b048..47b86823ff79 100644
--- a/restorecond/user.c
+++ b/restorecond/user.c
@@ -230,9 +230,10 @@ static int local_server(void) {
 		return -1;
 	}
 	if (flock(local_lock_fd, LOCK_EX | LOCK_NB) < 0) {
-		close(local_lock_fd);
 		if (debug_mode)
 			perror("flock");
+		close(local_lock_fd);
+		local_lock_fd = -1;
 		return -1;
 	}
 	/* watch for stdin/terminal going away */
-- 
2.30.0

