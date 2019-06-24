Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4640251B84
	for <lists+selinux@lfdr.de>; Mon, 24 Jun 2019 21:40:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728401AbfFXTkL (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Mon, 24 Jun 2019 15:40:11 -0400
Received: from mx1.polytechnique.org ([129.104.30.34]:38320 "EHLO
        mx1.polytechnique.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726414AbfFXTkL (ORCPT
        <rfc822;selinux@vger.kernel.org>); Mon, 24 Jun 2019 15:40:11 -0400
X-Greylist: delayed 477 seconds by postgrey-1.27 at vger.kernel.org; Mon, 24 Jun 2019 15:40:10 EDT
Received: from localhost.localdomain (85-168-38-217.rev.numericable.fr [85.168.38.217])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by ssl.polytechnique.org (Postfix) with ESMTPSA id A37C95647AC
        for <selinux@vger.kernel.org>; Mon, 24 Jun 2019 21:32:11 +0200 (CEST)
From:   Nicolas Iooss <nicolas.iooss@m4x.org>
To:     selinux@vger.kernel.org
Subject: [PATCH 1/1] libsepol: include module.c internal header in module_to_cil.c
Date:   Mon, 24 Jun 2019 21:31:54 +0200
Message-Id: <20190624193154.8453-1-nicolas.iooss@m4x.org>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AV-Checked: ClamAV using ClamSMTP at svoboda.polytechnique.org (Mon Jun 24 21:32:11 2019 +0200 (CEST))
X-Spam-Flag: No, tests=bogofilter, spamicity=0.000000, queueID=E6CA95647D9
X-Org-Mail: nicolas.iooss.2010@polytechnique.org
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

In module_to_cil.c, sepol_ppfile_to_module_package() calls functions
from module.c without including the internal header. This makes building
libsepol with "gcc -flto -fuse-ld=gold" fails when linking libsepol.so:

    /tmp/ccHYAKVZ.ltrans21.ltrans.o:<artificial>:function
    sepol_ppfile_to_module_package: error: undefined reference to
    'sepol_module_package_free'
    /tmp/ccHYAKVZ.ltrans21.ltrans.o:<artificial>:function
    sepol_ppfile_to_module_package: error: undefined reference to
    'sepol_module_package_create'
    /tmp/ccHYAKVZ.ltrans21.ltrans.o:<artificial>:function
    sepol_ppfile_to_module_package: error: undefined reference to
    'sepol_module_package_create'
    collect2: error: ld returned 1 exit status

Fixes: https://github.com/SELinuxProject/selinux/issues/165

Signed-off-by: Nicolas Iooss <nicolas.iooss@m4x.org>
---
 libsepol/src/module_to_cil.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/libsepol/src/module_to_cil.c b/libsepol/src/module_to_cil.c
index da62c8aaf0ef..1af166c9abd0 100644
--- a/libsepol/src/module_to_cil.c
+++ b/libsepol/src/module_to_cil.c
@@ -54,6 +54,7 @@
 
 #include "kernel_to_common.h"
 #include "private.h"
+#include "module_internal.h"
 
 #ifdef __GNUC__
 #  define UNUSED(x) UNUSED_ ## x __attribute__((__unused__))
-- 
2.22.0

