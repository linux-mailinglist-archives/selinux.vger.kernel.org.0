Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E11A5222259
	for <lists+selinux@lfdr.de>; Thu, 16 Jul 2020 14:28:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728422AbgGPM16 (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Thu, 16 Jul 2020 08:27:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727081AbgGPM15 (ORCPT
        <rfc822;selinux@vger.kernel.org>); Thu, 16 Jul 2020 08:27:57 -0400
X-Greylist: delayed 339 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 16 Jul 2020 05:27:57 PDT
Received: from ithil.bigon.be (ithil.bigon.be [IPv6:2001:bc8:25f1:100::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9BDFC061755
        for <selinux@vger.kernel.org>; Thu, 16 Jul 2020 05:27:57 -0700 (PDT)
Received: from localhost (localhost [IPv6:::1])
        by ithil.bigon.be (Postfix) with ESMTP id 70C8C1FDF2
        for <selinux@vger.kernel.org>; Thu, 16 Jul 2020 14:22:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bigon.be; h=
        content-transfer-encoding:mime-version:x-mailer:message-id:date
        :date:subject:subject:from:from:received:received:received; s=
        key1; t=1594902134; x=1596716535; bh=X5vGz4Z43aCB68NQuTJ25sI0f0c
        s9wS1TkYMr7dku+g=; b=co0lpTRx+YJTNngUdRxrC4VCTGCBLzqHw+CAWdgMeRZ
        wtA68QNwoGy1zSDLFDtS2XCd9LsCuzLY5/gJjrrKZN60NH8BxASwSE/NkNpJAl4q
        cY1fYJdNiuGtUm1bJiul6poez8OZ65mPqzkjz8IbHOV22NSDpJdqQOCfkeJvBkk8
        =
Received: from ithil.bigon.be ([IPv6:::1])
        by localhost (ithil.bigon.be [IPv6:::1]) (amavisd-new, port 10026)
        with ESMTP id deS99sviHRiP for <selinux@vger.kernel.org>;
        Thu, 16 Jul 2020 14:22:14 +0200 (CEST)
Received: from edoras.bigon.be (unknown [IPv6:2a02:a03f:65b8:4300:746b:cff:67dc:4fbd])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: bigon@bigon.be)
        by ithil.bigon.be (Postfix) with ESMTPSA
        for <selinux@vger.kernel.org>; Thu, 16 Jul 2020 14:22:14 +0200 (CEST)
Received: from bigon (uid 1000)
        (envelope-from bigon@bigon.be)
        id 20112
        by edoras.bigon.be (DragonFly Mail Agent v0.12);
        Thu, 16 Jul 2020 14:22:13 +0200
From:   Laurent Bigonville <bigon@debian.org>
To:     selinux@vger.kernel.org
Subject: [PATCH] restorecond: Set X-GNOME-HiddenUnderSystemd=true in restorecond.desktop file
Date:   Thu, 16 Jul 2020 14:22:13 +0200
Message-Id: <20200716122213.454087-1-bigon@debian.org>
X-Mailer: git-send-email 2.28.0.rc0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

From: Laurent Bigonville <bigon@bigon.be>

This completely inactivate the .desktop file incase the user session is
managed by systemd as restorecond also provide a service file

Signed-off-by: Laurent Bigonville <bigon@bigon.be>
---
 restorecond/restorecond.desktop | 1 +
 1 file changed, 1 insertion(+)

diff --git a/restorecond/restorecond.desktop b/restorecond/restorecond.desktop
index af728680..7df85472 100644
--- a/restorecond/restorecond.desktop
+++ b/restorecond/restorecond.desktop
@@ -5,3 +5,4 @@ Comment=Fix file context in owned by the user
 Type=Application
 StartupNotify=false
 X-GNOME-Autostart-enabled=false
+X-GNOME-HiddenUnderSystemd=true
-- 
2.28.0.rc0

