Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EFF225B5571
	for <lists+selinux@lfdr.de>; Mon, 12 Sep 2022 09:40:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229789AbiILHk4 (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Mon, 12 Sep 2022 03:40:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229539AbiILHkr (ORCPT
        <rfc822;selinux@vger.kernel.org>); Mon, 12 Sep 2022 03:40:47 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 579721409D
        for <selinux@vger.kernel.org>; Mon, 12 Sep 2022 00:40:46 -0700 (PDT)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
        by smtp-out2.suse.de (Postfix) with ESMTP id BE7761FA77
        for <selinux@vger.kernel.org>; Mon, 12 Sep 2022 07:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1662968444; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
         mime-version:mime-version:content-type:content-type;
        bh=SD/6JEseukZjf7wlpfiY3XZ9cyChFr6K/Y1Y1pmFPZc=;
        b=d/8CzEsoQSvoNdE6tt7hJZ77OlMtaumBPgluaZndeFESh7YktPEo8oEdzw5D++hQdyq5IF
        vSrtGx1V5fTOigYFiYk/KtTAsQSHpB/acFx8lJug/YYPwQRB9y88ICKm67tUCUidMomAcR
        EmBRRf5MfBXr60n2cLyB94x1gUralOM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1662968444;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
         mime-version:mime-version:content-type:content-type;
        bh=SD/6JEseukZjf7wlpfiY3XZ9cyChFr6K/Y1Y1pmFPZc=;
        b=IM6DUqU+b1NzSTSzCXuEJLvJJXaQyLBEhYAdqRu8zuflv0RObTToIOEcUC7zlUsJ1c78wF
        8DChAiTN23ty88Cg==
Received: from suse.com (unknown [10.163.25.22])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by relay2.suse.de (Postfix) with ESMTPS id AD8E82C141
        for <selinux@vger.kernel.org>; Mon, 12 Sep 2022 07:40:44 +0000 (UTC)
Date:   Mon, 12 Sep 2022 09:40:43 +0200
From:   Johannes Segitz <jsegitz@suse.de>
To:     selinux@vger.kernel.org
Subject: [PATCH] python/chcat: Don't fail on missing translation files
Message-ID: <20220912074043.GB5803@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Exception handling was not in line with other files, causing chcat to
fail if translation files were not available

Signed-off-by: Johannes Segitz <jsegitz@suse.de>
---
 python/chcat/chcat | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/python/chcat/chcat b/python/chcat/chcat
index e779fcc6..1b93e99b 100755
--- a/python/chcat/chcat
+++ b/python/chcat/chcat
@@ -40,7 +40,7 @@ try:
                     localedir="/usr/share/locale",
                     **kwargs)
     _ = t.gettext
-except ImportError:
+except:
     try:
         import builtins
         builtins.__dict__['_'] = str
--
2.35.3
