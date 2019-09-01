Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 841D9A4B0A
	for <lists+selinux@lfdr.de>; Sun,  1 Sep 2019 20:06:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729070AbfIASG4 (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Sun, 1 Sep 2019 14:06:56 -0400
Received: from mx1.polytechnique.org ([129.104.30.34]:46151 "EHLO
        mx1.polytechnique.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729071AbfIASG4 (ORCPT
        <rfc822;selinux@vger.kernel.org>); Sun, 1 Sep 2019 14:06:56 -0400
Received: from localhost.localdomain (85-168-38-217.rev.numericable.fr [85.168.38.217])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by ssl.polytechnique.org (Postfix) with ESMTPSA id E0C5C564884
        for <selinux@vger.kernel.org>; Sun,  1 Sep 2019 20:06:54 +0200 (CEST)
From:   Nicolas Iooss <nicolas.iooss@m4x.org>
To:     selinux@vger.kernel.org
Subject: [PATCH 5/9] libsepol: reset *p to NULL if sepol_module_package_create fails
Date:   Sun,  1 Sep 2019 20:06:32 +0200
Message-Id: <20190901180636.31586-6-nicolas.iooss@m4x.org>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190901180636.31586-1-nicolas.iooss@m4x.org>
References: <20190901180636.31586-1-nicolas.iooss@m4x.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AV-Checked: ClamAV using ClamSMTP at svoboda.polytechnique.org (Sun Sep  1 20:06:55 2019 +0200 (CEST))
X-Spam-Flag: No, tests=bogofilter, spamicity=0.000000, queueID=0D17E564880
X-Org-Mail: nicolas.iooss.2010@polytechnique.org
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

semodule-utils/semodule_link/semodule_link.c contains:

    static sepol_module_package_t *load_module(char *filename)
    {
        /* ... */
        if (sepol_module_package_create(&p)) {
            /* ... */
            goto bad;

    /* ... */
    bad:
        sepol_module_package_free(p);

When sepol_module_package_create() fails while having successfully
allocated p, it currently frees p without setting it back to NULL. This
causes a use-after-free in load_module().

Prevent this use-after-free by setting sepol_module_package_create's
argument back to NULL when an error happens.

This issue has been found using Infer static analyzer.

Signed-off-by: Nicolas Iooss <nicolas.iooss@m4x.org>
---
 libsepol/src/module.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/libsepol/src/module.c b/libsepol/src/module.c
index 219355f30d27..3b8a0a59ca68 100644
--- a/libsepol/src/module.c
+++ b/libsepol/src/module.c
@@ -124,8 +124,10 @@ int sepol_module_package_create(sepol_module_package_t ** p)
 		return -1;
 
 	rc = module_package_init(*p);
-	if (rc < 0)
+	if (rc < 0) {
 		free(*p);
+		*p = NULL;
+	}
 
 	return rc;
 }
-- 
2.22.0

