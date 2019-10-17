Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7D710DA5EC
	for <lists+selinux@lfdr.de>; Thu, 17 Oct 2019 09:05:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392745AbfJQHFe (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Thu, 17 Oct 2019 03:05:34 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:55926 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2390955AbfJQHFe (ORCPT <rfc822;selinux@vger.kernel.org>);
        Thu, 17 Oct 2019 03:05:34 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id EFEC28012661
        for <selinux@vger.kernel.org>; Thu, 17 Oct 2019 07:05:33 +0000 (UTC)
Received: from slave.localdomain.com (unknown [10.64.193.217])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 339302156A2F;
        Thu, 17 Oct 2019 07:05:33 +0000 (UTC)
From:   Masatake YAMATO <yamato@redhat.com>
To:     selinux@vger.kernel.org
Cc:     yamato@redhat.com
Subject: [PATCH 2/3] checkpolicy: update the description for -o option in the man page
Date:   Thu, 17 Oct 2019 16:05:12 +0900
Message-Id: <20191017070513.13445-2-yamato@redhat.com>
In-Reply-To: <20191017070513.13445-1-yamato@redhat.com>
References: <20191017070513.13445-1-yamato@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]); Thu, 17 Oct 2019 07:05:33 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]); Thu, 17 Oct 2019 07:05:33 +0000 (UTC) for IP:'10.11.54.6' DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com' HELO:'smtp.corp.redhat.com' FROM:'yamato@redhat.com' RCPT:''
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Write about policy.conf and CIL files.

Signed-off-by: Masatake YAMATO <yamato@redhat.com>
---
 checkpolicy/checkpolicy.8 | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/checkpolicy/checkpolicy.8 b/checkpolicy/checkpolicy.8
index 1552f497..db57751c 100644
--- a/checkpolicy/checkpolicy.8
+++ b/checkpolicy/checkpolicy.8
@@ -40,7 +40,8 @@ Enable the MLS policy when checking and compiling the policy.
 Specify the policy version, defaults to the latest.
 .TP
 .B \-o,\-\-output filename
-Write a binary policy file to the specified filename.
+Write a policy file (binary, policy.conf, or CIL policy)
+to the specified filename.
 .TP
 .B \-S,\-\-sort
 Sort ocontexts before writing out the binary policy. This option makes output of checkpolicy consistent with binary policies created by semanage and secilc.
-- 
2.21.0

