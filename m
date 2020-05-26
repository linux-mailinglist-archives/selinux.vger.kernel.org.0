Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26F271D57EB
	for <lists+selinux@lfdr.de>; Fri, 15 May 2020 19:30:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726183AbgEORar (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Fri, 15 May 2020 13:30:47 -0400
Received: from mga14.intel.com ([192.55.52.115]:41449 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726170AbgEORar (ORCPT <rfc822;selinux@vger.kernel.org>);
        Fri, 15 May 2020 13:30:47 -0400
IronPort-SDR: 4HG7o9zPwnAJz3I8OFeRMehiJrN7JUlZFgBttmNBKvJarQ3RsLxXsgc6lmehjL9eLESiX0Zg3+
 IFGeFuVyyJZA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2020 10:30:46 -0700
IronPort-SDR: +86fATh2NRC13UdoyXURXOv0kcF61L0vrRuEET8Fh5SY2r+QtA71CDIzMz6fCaSpOEkNMPvBOM
 kB+E6evk89RA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,396,1583222400"; 
   d="scan'208";a="410535099"
Received: from fhanchek-mobl1.amr.corp.intel.com (HELO localhost.localdomain) ([10.254.64.199])
  by orsmga004.jf.intel.com with ESMTP; 15 May 2020 10:30:45 -0700
From:   william.c.roberts@intel.com
To:     selinux@vger.kernel.org
Cc:     William Roberts <william.c.roberts@intel.com>
Subject: [PATCH] README: add pkg kernel-devel to dnf command
Date:   Fri, 15 May 2020 12:30:42 -0500
Message-Id: <20200515173042.12666-1-william.c.roberts@intel.com>
X-Mailer: git-send-email 2.17.1
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

From: William Roberts <william.c.roberts@intel.com>

The text above states that kernel-devel is needed, but it's missing from
the dnf command.

Signed-off-by: William Roberts <william.c.roberts@intel.com>
---
 README.md | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/README.md b/README.md
index 1f7e5d92a100..a73e9cc0c06d 100644
--- a/README.md
+++ b/README.md
@@ -77,7 +77,8 @@ following command:
 		kernel-devel \
 		quota \
 		xfsprogs-devel \
-		libuuid-devel
+		libuuid-devel \
+		kernel-devel-$(uname -r)
 
 #### Debian
 
-- 
2.17.1

