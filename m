Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 15B23694D4
	for <lists+selinux@lfdr.de>; Mon, 15 Jul 2019 16:54:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392258AbfGOOyI (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Mon, 15 Jul 2019 10:54:08 -0400
Received: from ithil.bigon.be ([163.172.57.153]:37762 "EHLO ithil.bigon.be"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2391549AbfGOOyG (ORCPT <rfc822;selinux@vger.kernel.org>);
        Mon, 15 Jul 2019 10:54:06 -0400
X-Greylist: delayed 540 seconds by postgrey-1.27 at vger.kernel.org; Mon, 15 Jul 2019 10:54:06 EDT
Received: from localhost (localhost [IPv6:::1])
        by ithil.bigon.be (Postfix) with ESMTP id 48E271FEA6
        for <selinux@vger.kernel.org>; Mon, 15 Jul 2019 16:45:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bigon.be; h=
        content-transfer-encoding:mime-version:x-mailer:message-id:date
        :date:subject:subject:from:from:received:received:received; s=
        key2; t=1563201904; x=1565016305; bh=SrZJpFyPHLUeP3/PUKTCtQdnCS5
        5fohHoRFw590mTDQ=; b=MlxqdElUltZC6glN3wo9FMWiUlORPbNDiuu8/fGK7Iw
        Hig2/OTs6ALhntltJohQ5+vYDYHr1Rp6xqUGSZ/ugsMcepZrAZptRBk4uS0Ov0Qv
        8bYeb9oLeJLSy3i0GwEXj+Zvk56D5Woqxd301RlMcsZAYUetDCzo+zQ81HaMukOE
        =
Received: from ithil.bigon.be ([IPv6:::1])
        by localhost (ithil.bigon.be [IPv6:::1]) (amavisd-new, port 10026)
        with ESMTP id MJLHU3FX5xpf for <selinux@vger.kernel.org>;
        Mon, 15 Jul 2019 16:45:04 +0200 (CEST)
Received: from edoras.bigon.be (mail2.vdab.be [193.53.238.200])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bigon@bigon.be)
        by ithil.bigon.be (Postfix) with ESMTPSA
        for <selinux@vger.kernel.org>; Mon, 15 Jul 2019 16:45:04 +0200 (CEST)
Received: from bigon (uid 1000)
        (envelope-from bigon@bigon.be)
        id 61208
        by edoras.bigon.be (DragonFly Mail Agent v0.11);
        Mon, 15 Jul 2019 16:45:02 +0200
From:   Laurent Bigonville <bigon@debian.org>
To:     selinux@vger.kernel.org
Subject: [PATCH 1/3] Add documentation key in systemd .service files
Date:   Mon, 15 Jul 2019 16:45:00 +0200
Message-Id: <20190715144502.30547-1-bigon@debian.org>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

From: Laurent Bigonville <bigon@bigon.be>

Signed-off-by: Laurent Bigonville <bigon@bigon.be>
---
 mcstrans/src/mcstrans.service   | 1 +
 restorecond/restorecond.service | 1 +
 2 files changed, 2 insertions(+)

diff --git a/mcstrans/src/mcstrans.service b/mcstrans/src/mcstrans.service
index 8976b970..09529432 100644
--- a/mcstrans/src/mcstrans.service
+++ b/mcstrans/src/mcstrans.service
@@ -1,5 +1,6 @@
 [Unit]
 Description=Translates SELinux MCS/MLS labels to human readable form
+Documentation=man:mcstransd(8)
 ConditionSecurity=selinux
 
 [Service]
diff --git a/restorecond/restorecond.service b/restorecond/restorecond.service
index 6bce99d3..0e4ea72d 100644
--- a/restorecond/restorecond.service
+++ b/restorecond/restorecond.service
@@ -1,5 +1,6 @@
 [Unit]
 Description=Restorecon maintaining path file context
+Documentation=man:restorecond(8)
 ConditionPathExists=/etc/selinux/restorecond.conf
 ConditionSecurity=selinux
 
-- 
2.22.0

