Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 19E601A5D66
	for <lists+selinux@lfdr.de>; Sun, 12 Apr 2020 10:10:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726614AbgDLIKO (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Sun, 12 Apr 2020 04:10:14 -0400
Received: from mx1.polytechnique.org ([129.104.30.34]:49100 "EHLO
        mx1.polytechnique.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726658AbgDLIKN (ORCPT
        <rfc822;selinux@vger.kernel.org>); Sun, 12 Apr 2020 04:10:13 -0400
Received: from localhost.localdomain (85-168-38-217.rev.numericable.fr [85.168.38.217])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by ssl.polytechnique.org (Postfix) with ESMTPSA id E68A15600AC
        for <selinux@vger.kernel.org>; Sun, 12 Apr 2020 10:10:12 +0200 (CEST)
From:   Nicolas Iooss <nicolas.iooss@m4x.org>
To:     selinux@vger.kernel.org
Subject: [PATCH 3/3] libselinux: make context_*_set() return -1 when an error occurs
Date:   Sun, 12 Apr 2020 10:10:01 +0200
Message-Id: <20200412081001.23246-3-nicolas.iooss@m4x.org>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200412081001.23246-1-nicolas.iooss@m4x.org>
References: <20200412081001.23246-1-nicolas.iooss@m4x.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AV-Checked: ClamAV using ClamSMTP at svoboda.polytechnique.org (Sun Apr 12 10:10:13 2020 +0200 (CEST))
X-Spam-Flag: No, tests=bogofilter, spamicity=0.000001, queueID=2E4DC5600AF
X-Org-Mail: nicolas.iooss.2010@polytechnique.org
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

In libselinux, most functions set errno and return -1 when an error
occurs. But some functions return 1 instead, such as context_type_set(),
context_role_set(), etc. This increases the difficulty of writing Python
bindings of these functions without much benefit.

Return -1 instead (errno was already set).

Signed-off-by: Nicolas Iooss <nicolas.iooss@m4x.org>
---
 libselinux/src/context.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/libselinux/src/context.c b/libselinux/src/context.c
index 090264a49eb1..ce4258806c53 100644
--- a/libselinux/src/context.c
+++ b/libselinux/src/context.c
@@ -151,14 +151,14 @@ static int set_comp(context_private_t * n, int idx, const char *str)
 	if (str) {
 		t = (char *)malloc(strlen(str) + 1);
 		if (!t) {
-			return 1;
+			return -1;
 		}
 		for (p = str; *p; p++) {
 			if (*p == '\t' || *p == '\n' || *p == '\r' ||
 			    ((*p == ':' || *p == ' ') && idx != COMP_RANGE)) {
 				free(t);
 				errno = EINVAL;
-				return 1;
+				return -1;
 			}
 		}
 		strcpy(t, str);
-- 
2.26.0

