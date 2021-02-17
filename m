Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D494A31D5D0
	for <lists+selinux@lfdr.de>; Wed, 17 Feb 2021 08:43:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231782AbhBQHjp (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Wed, 17 Feb 2021 02:39:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231792AbhBQHjE (ORCPT
        <rfc822;selinux@vger.kernel.org>); Wed, 17 Feb 2021 02:39:04 -0500
Received: from agnus.defensec.nl (agnus.defensec.nl [IPv6:2001:985:d55d::711])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id C3FF1C06174A
        for <selinux@vger.kernel.org>; Tue, 16 Feb 2021 23:38:23 -0800 (PST)
Received: from brutus.. (brutus.lan [IPv6:2001:985:d55d::438])
        by agnus.defensec.nl (Postfix) with ESMTPSA id 8B56D2A0CF2;
        Wed, 17 Feb 2021 08:38:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 agnus.defensec.nl 8B56D2A0CF2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=defensec.nl;
        s=default; t=1613547501;
        bh=sAyu7NCbhT1YUHZC+jFQ+5/QixkU5ma5R86Zn1d7VpA=;
        h=From:To:Cc:Subject:Date:From;
        b=KRp2jeTZ76sBPPpkdFsfbLAIz+KyqNbfYR+6QulRKkprAMQWAaSKhCBl2lHAvAr6Z
         A9v5kmtenDOsrPn5n/et+MTlPX+xAokqVG+6wW3mgUdtJfP/kMgadZsALX8NbI5GfZ
         Tq9fOloakg/jhJiaA+nY9uXSKM6JCH3/sq/zambQ=
From:   Dominick Grift <dominick.grift@defensec.nl>
To:     selinux@vger.kernel.org
Cc:     Dominick Grift <dominick.grift@defensec.nl>
Subject: [PATCH] secilc: fixes cil_role_statements.md example
Date:   Wed, 17 Feb 2021 08:37:28 +0100
Message-Id: <20210217073728.1137112-1-dominick.grift@defensec.nl>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Signed-off-by: Dominick Grift <dominick.grift@defensec.nl>
---
 secilc/docs/cil_role_statements.md | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/secilc/docs/cil_role_statements.md b/secilc/docs/cil_role_statements.md
index ee6a5868..2e1b4047 100644
--- a/secilc/docs/cil_role_statements.md
+++ b/secilc/docs/cil_role_statements.md
@@ -339,7 +339,7 @@ In this example the role `test` cannot have greater privileges than `unconfined.
 ```secil
     (role test)
 
-    (unconfined
+    (block unconfined
         (role role)
         (rolebounds role .test)
     )
-- 
2.30.1

