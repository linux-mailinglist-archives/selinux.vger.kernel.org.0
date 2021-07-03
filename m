Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BAA813BA8F6
	for <lists+selinux@lfdr.de>; Sat,  3 Jul 2021 16:32:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229999AbhGCOed (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Sat, 3 Jul 2021 10:34:33 -0400
Received: from mx1.polytechnique.org ([129.104.30.34]:47100 "EHLO
        mx1.polytechnique.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229900AbhGCOeX (ORCPT
        <rfc822;selinux@vger.kernel.org>); Sat, 3 Jul 2021 10:34:23 -0400
Received: from localhost.localdomain (85-168-38-217.rev.numericable.fr [85.168.38.217])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by ssl.polytechnique.org (Postfix) with ESMTPSA id 1B543564DD4
        for <selinux@vger.kernel.org>; Sat,  3 Jul 2021 16:31:48 +0200 (CEST)
From:   Nicolas Iooss <nicolas.iooss@m4x.org>
To:     selinux@vger.kernel.org
Subject: [PATCH 5/6] policycoreutils: silence -Wextra-semi-stmt warning
Date:   Sat,  3 Jul 2021 16:31:21 +0200
Message-Id: <20210703143122.1441578-5-nicolas.iooss@m4x.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210703143122.1441578-1-nicolas.iooss@m4x.org>
References: <20210703143122.1441578-1-nicolas.iooss@m4x.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AV-Checked: ClamAV using ClamSMTP at svoboda.polytechnique.org (Sat Jul  3 16:31:48 2021 +0200 (CEST))
X-Spam-Flag: No, tests=bogofilter, spamicity=0.000004, queueID=3FE17564DE3
X-Org-Mail: nicolas.iooss.2010@polytechnique.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Ubuntu 20.04, when building with clang -Werror -Wextra-semi-stmt
(which is not the default build configuration), the compiler reports:

      secon.c:686:3: error: empty expression statement has no effect;
      remove unnecessary ';' to silence this warning
      [-Werror,-Wextra-semi-stmt]
              };
               ^

Signed-off-by: Nicolas Iooss <nicolas.iooss@m4x.org>
---
 policycoreutils/newrole/newrole.c | 2 +-
 policycoreutils/secon/secon.c     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/policycoreutils/newrole/newrole.c b/policycoreutils/newrole/newrole.c
index 36e2ba9c25d9..0264531acef4 100644
--- a/policycoreutils/newrole/newrole.c
+++ b/policycoreutils/newrole/newrole.c
@@ -96,7 +96,7 @@
 #define USAGE_STRING "USAGE: newrole [ -r role ] [ -t type ] [ -l level ] [ -p ] [ -V ] [ -- args ]"
 
 #ifdef USE_PAM
-#define PAM_SERVICE_CONFIG "/etc/selinux/newrole_pam.conf";
+#define PAM_SERVICE_CONFIG "/etc/selinux/newrole_pam.conf"
 #endif
 
 #define DEFAULT_PATH "/usr/bin:/bin"
diff --git a/policycoreutils/secon/secon.c b/policycoreutils/secon/secon.c
index d257a9a1ca6c..a0957d0914e1 100644
--- a/policycoreutils/secon/secon.c
+++ b/policycoreutils/secon/secon.c
@@ -683,7 +683,7 @@ static void disp_con(const char *scon_raw)
 		color.range_bg = strtok(NULL, " ");
 
 		color.valid = 1;
-	};
+	}
 
 	if (!(con = context_new(scon)))
 		errx(EXIT_FAILURE, "Couldn't create context from: %s", scon);
-- 
2.32.0

