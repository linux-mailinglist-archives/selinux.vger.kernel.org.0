Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4231D3BA8F5
	for <lists+selinux@lfdr.de>; Sat,  3 Jul 2021 16:32:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229671AbhGCOeb (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Sat, 3 Jul 2021 10:34:31 -0400
Received: from mx1.polytechnique.org ([129.104.30.34]:43726 "EHLO
        mx1.polytechnique.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229904AbhGCOeX (ORCPT
        <rfc822;selinux@vger.kernel.org>); Sat, 3 Jul 2021 10:34:23 -0400
Received: from localhost.localdomain (85-168-38-217.rev.numericable.fr [85.168.38.217])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by ssl.polytechnique.org (Postfix) with ESMTPSA id AF5EF564DD4
        for <selinux@vger.kernel.org>; Sat,  3 Jul 2021 16:31:48 +0200 (CEST)
From:   Nicolas Iooss <nicolas.iooss@m4x.org>
To:     selinux@vger.kernel.org
Subject: [PATCH 6/6] mcstrans: silence -Wextra-semi-stmt warning
Date:   Sat,  3 Jul 2021 16:31:22 +0200
Message-Id: <20210703143122.1441578-6-nicolas.iooss@m4x.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210703143122.1441578-1-nicolas.iooss@m4x.org>
References: <20210703143122.1441578-1-nicolas.iooss@m4x.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AV-Checked: ClamAV using ClamSMTP at svoboda.polytechnique.org (Sat Jul  3 16:31:48 2021 +0200 (CEST))
X-Spam-Flag: No, tests=bogofilter, spamicity=0.000004, queueID=D05F2564DE3
X-Org-Mail: nicolas.iooss.2010@polytechnique.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Ubuntu 20.04, when building with clang -Werror -Wextra-semi-stmt
(which is not the default build configuration), the compiler reports:

      mcstransd.c:72:35: error: empty expression statement has no effect;
      remove unnecessary ';' to silence this warning
      [-Werror,-Wextra-semi-stmt]
              log_debug("%s\n", "cleanup_exit");
                                               ^

Replace the empty log_debug substitution with a do { ... } while (0)
construction to silence this warning.

Signed-off-by: Nicolas Iooss <nicolas.iooss@m4x.org>
---
 mcstrans/src/mcstrans.c  | 2 +-
 mcstrans/src/mcstransd.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/mcstrans/src/mcstrans.c b/mcstrans/src/mcstrans.c
index c0fc14e40d2f..e92dfddb0d20 100644
--- a/mcstrans/src/mcstrans.c
+++ b/mcstrans/src/mcstrans.c
@@ -43,7 +43,7 @@
 #ifdef DEBUG
 #define log_debug(fmt, ...) fprintf(stderr, fmt, __VA_ARGS__)
 #else
-#define log_debug(fmt, ...) ;
+#define log_debug(fmt, ...) do {} while (0)
 #endif
 
 static unsigned int maxbit=0;
diff --git a/mcstrans/src/mcstransd.c b/mcstrans/src/mcstransd.c
index 07c052fd4998..59c152e73be1 100644
--- a/mcstrans/src/mcstransd.c
+++ b/mcstrans/src/mcstransd.c
@@ -40,7 +40,7 @@
 //#define log_debug(fmt, ...) syslog(LOG_DEBUG, fmt, __VA_ARGS__)
 #define log_debug(fmt, ...) fprintf(stderr, fmt, __VA_ARGS__)
 #else
-#define log_debug(fmt, ...) ;
+#define log_debug(fmt, ...) do {} while (0)
 #endif
 
 extern int init_translations(void);
-- 
2.32.0

