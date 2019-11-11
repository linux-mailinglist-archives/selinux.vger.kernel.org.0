Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 042C5F7371
	for <lists+selinux@lfdr.de>; Mon, 11 Nov 2019 12:53:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726902AbfKKLxp (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Mon, 11 Nov 2019 06:53:45 -0500
Received: from mx1.polytechnique.org ([129.104.30.34]:41983 "EHLO
        mx1.polytechnique.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726810AbfKKLxp (ORCPT
        <rfc822;selinux@vger.kernel.org>); Mon, 11 Nov 2019 06:53:45 -0500
Received: from localhost.localdomain (85-168-38-217.rev.numericable.fr [85.168.38.217])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by ssl.polytechnique.org (Postfix) with ESMTPSA id C5392564718;
        Mon, 11 Nov 2019 12:53:41 +0100 (CET)
From:   Nicolas Iooss <nicolas.iooss@m4x.org>
To:     selinux@vger.kernel.org
Cc:     Michael Shigorin <mike@altlinux.org>
Subject: [PATCH 1/3] libselinux,libsemanage: never create -.o in exception.sh
Date:   Mon, 11 Nov 2019 12:53:13 +0100
Message-Id: <20191111115315.1173097-1-nicolas.iooss@m4x.org>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AV-Checked: ClamAV using ClamSMTP at svoboda.polytechnique.org (Mon Nov 11 12:53:42 2019 +0100 (CET))
X-Spam-Flag: No, tests=bogofilter, spamicity=0.000000, queueID=1FC5556471A
X-Org-Mail: nicolas.iooss.2010@polytechnique.org
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Files starting with "-" causes issues in commands such as "rm *.o". For
libselinux and libsemanage, when exception.sh fails to remove "-.o",
"make clean" fails with:

    rm: invalid option -- '.'
    Try 'rm ./-.o' to remove the file '-.o'.
    Try 'rm --help' for more information.

Fix this by making exception.sh create "temp.o" instead of "-.o".

Signed-off-by: Nicolas Iooss <nicolas.iooss@m4x.org>
---
 libselinux/src/exception.sh  | 6 +++---
 libsemanage/src/exception.sh | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/libselinux/src/exception.sh b/libselinux/src/exception.sh
index d6c8c71713ad..1a21e651c42f 100755
--- a/libselinux/src/exception.sh
+++ b/libselinux/src/exception.sh
@@ -15,10 +15,10 @@ echo "
 ;;
 esac
 }
-if ! ${CC:-gcc} -x c -c -I../include - -aux-info temp.aux < ../include/selinux/selinux.h
+if ! ${CC:-gcc} -x c -c -I../include -o temp.o - -aux-info temp.aux < ../include/selinux/selinux.h
 then
     # clang does not support -aux-info so fall back to gcc
-    gcc -x c -c -I../include - -aux-info temp.aux < ../include/selinux/selinux.h
+    gcc -x c -c -I../include -o temp.o - -aux-info temp.aux < ../include/selinux/selinux.h
 fi
 for i in `awk '/<stdin>.*extern int/ { print $6 }' temp.aux`; do except $i ; done 
-rm -f -- temp.aux -.o
+rm -f -- temp.aux temp.o
diff --git a/libsemanage/src/exception.sh b/libsemanage/src/exception.sh
index 97bc2ae879f2..fc1d4035a9cd 100644
--- a/libsemanage/src/exception.sh
+++ b/libsemanage/src/exception.sh
@@ -9,10 +9,10 @@ echo "
 }
 "
 }
-if ! ${CC:-gcc} -x c -c -I../include - -aux-info temp.aux < ../include/semanage/semanage.h
+if ! ${CC:-gcc} -x c -c -I../include -o temp.o - -aux-info temp.aux < ../include/semanage/semanage.h
 then
     # clang does not support -aux-info so fall back to gcc
-    gcc -x c -c -I../include - -aux-info temp.aux < ../include/semanage/semanage.h
+    gcc -x c -c -I../include -o temp.o - -aux-info temp.aux < ../include/semanage/semanage.h
 fi
 for i in `awk '/extern int/ { print $6 }' temp.aux`; do except $i ; done
-rm -f -- temp.aux -.o
+rm -f -- temp.aux temp.o
-- 
2.24.0

