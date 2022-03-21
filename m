Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC05A4E24C2
	for <lists+selinux@lfdr.de>; Mon, 21 Mar 2022 11:58:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346533AbiCUK7m (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Mon, 21 Mar 2022 06:59:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344310AbiCUK7i (ORCPT
        <rfc822;selinux@vger.kernel.org>); Mon, 21 Mar 2022 06:59:38 -0400
X-Greylist: delayed 297 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 21 Mar 2022 03:58:09 PDT
Received: from markus.defensec.nl (markus.defensec.nl [IPv6:2a10:3781:2099::123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 871231A838
        for <selinux@vger.kernel.org>; Mon, 21 Mar 2022 03:58:07 -0700 (PDT)
Received: from brutus.. (brutus.lan [IPv6:2a10:3781:2099::438])
        by markus.defensec.nl (Postfix) with ESMTPSA id 6C028FC0729;
        Mon, 21 Mar 2022 11:53:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=defensec.nl;
        s=default; t=1647859985;
        bh=MlD1H0mBcrly5/3Qs58LWk5S1/iYrXlk7IyVg9ckBpg=;
        h=From:To:Cc:Subject:Date:From;
        b=MEkh19K5wf1GC3HSgIpeZsCVAouCw8eTfsQst98o/OqeIUvxdQAQ16/EeRwzlx/3a
         JUUnKulzhozubidibkO3DY6zsTwvbdNmujuao6jCbPOq8u1YLt4kGwgq4A9G9xgvo0
         xwYlRzjUwOnl7E8zhXu0YbAFe5OHuB40MU62QJnY=
From:   Dominick Grift <dominick.grift@defensec.nl>
To:     selinux@vger.kernel.org
Cc:     Dominick Grift <dominick.grift@defensec.nl>
Subject: [PATCH] optional statement is not valid in if and require statement
Date:   Mon, 21 Mar 2022 11:52:50 +0100
Message-Id: <20220321105250.148231-1-dominick.grift@defensec.nl>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_05,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

the conditional-policy-statements chapter describes which statements
are allowed in if statements and optional is not one of them

Signed-off-by: Dominick Grift <dominick.grift@defensec.nl>
---
 src/modular_policy_statements.md | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/modular_policy_statements.md b/src/modular_policy_statements.md
index e62e6ac..508d531 100644
--- a/src/modular_policy_statements.md
+++ b/src/modular_policy_statements.md
@@ -190,7 +190,7 @@ Conditional Policy Statements
 
 | *if* Statement          | *optional* Statement    | *require* Statement     |
 | ----------------------- | ----------------------- | ----------------------- |
-| Yes                     | Yes                     | Yes                     |
+| No                      | Yes                     | No                      |
 
 **Examples:**
 
-- 
2.35.1

