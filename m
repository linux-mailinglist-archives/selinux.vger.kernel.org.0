Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 907E4694D3
	for <lists+selinux@lfdr.de>; Mon, 15 Jul 2019 16:54:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392260AbfGOOyH (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Mon, 15 Jul 2019 10:54:07 -0400
Received: from ithil.bigon.be ([163.172.57.153]:37764 "EHLO ithil.bigon.be"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2392258AbfGOOyH (ORCPT <rfc822;selinux@vger.kernel.org>);
        Mon, 15 Jul 2019 10:54:07 -0400
Received: from localhost (localhost [IPv6:::1])
        by ithil.bigon.be (Postfix) with ESMTP id 4D3CE1FED5
        for <selinux@vger.kernel.org>; Mon, 15 Jul 2019 16:45:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bigon.be; h=
        content-transfer-encoding:content-type:content-type:mime-version
        :references:in-reply-to:x-mailer:message-id:date:date:subject
        :subject:from:from:received:received:received; s=key2; t=
        1563201904; x=1565016305; bh=Vd4GG41nuM6CvzdnQKQyHYGgtF8mNrRC5Cw
        YjJVmFBQ=; b=ViNLypGe17qEtlS1RIfuLYPxGFSeAkTZnE97mSEiwZ1NsODbHcf
        76KCw/AM6MKpA13rrUUsdCuOkmtLaYTdAnMrC3jGi6KTZisZPXKT+rYu49CB/SQ0
        V9m3Qr0Va2LxS/slIJIRRqOs0s15A69UwLGjmmjtJQTEWacM4P/arpRY=
Received: from ithil.bigon.be ([IPv6:::1])
        by localhost (ithil.bigon.be [IPv6:::1]) (amavisd-new, port 10026)
        with ESMTP id Wr6lLYC9A-fa for <selinux@vger.kernel.org>;
        Mon, 15 Jul 2019 16:45:04 +0200 (CEST)
Received: from edoras.bigon.be (mail2.vdab.be [193.53.238.200])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bigon@bigon.be)
        by ithil.bigon.be (Postfix) with ESMTPSA
        for <selinux@vger.kernel.org>; Mon, 15 Jul 2019 16:45:04 +0200 (CEST)
Received: from bigon (uid 1000)
        (envelope-from bigon@bigon.be)
        id 640dd
        by edoras.bigon.be (DragonFly Mail Agent v0.11);
        Mon, 15 Jul 2019 16:45:02 +0200
From:   Laurent Bigonville <bigon@debian.org>
To:     selinux@vger.kernel.org
Subject: [PATCH 3/3] mcstrans: Add reference to setools.conf man page in the daemon one
Date:   Mon, 15 Jul 2019 16:45:02 +0200
Message-Id: <20190715144502.30547-3-bigon@debian.org>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190715144502.30547-1-bigon@debian.org>
References: <20190715144502.30547-1-bigon@debian.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

From: Laurent Bigonville <bigon@bigon.be>

Signed-off-by: Laurent Bigonville <bigon@bigon.be>
---
 mcstrans/man/man8/mcstransd.8    | 2 +-
 mcstrans/man/ru/man8/mcstransd.8 | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/mcstrans/man/man8/mcstransd.8 b/mcstrans/man/man8/mcstransd.8
index 64774a52..9a5922ba 100644
--- a/mcstrans/man/man8/mcstransd.8
+++ b/mcstrans/man/man8/mcstransd.8
@@ -29,4 +29,4 @@ The program was enhanced/rewritten by Joe Nall <joe@nall.com>.
 /etc/selinux/{SELINUXTYPE}/setrans.conf 
 
 .SH "SEE ALSO"
-.BR mcs (8),
+.BR setrans.conf (5), mcs (8)
diff --git a/mcstrans/man/ru/man8/mcstransd.8 b/mcstrans/man/ru/man8/mcstransd.8
index 90247c32..4cd68c17 100644
--- a/mcstrans/man/ru/man8/mcstransd.8
+++ b/mcstrans/man/ru/man8/mcstransd.8
@@ -23,7 +23,7 @@ mcstransd \- внутренняя служба MCS (мультикатегори
 /etc/selinux/{SELINUXTYPE}/setrans.conf 
 
 .SH "СМОТРИТЕ ТАКЖЕ"
-.BR mcs (8)
+.BR setrans.conf (5), mcs (8)
 
 .SH "АВТОРЫ"
 Эта man-страница написана Dan Walsh <dwalsh@redhat.com>.
-- 
2.22.0

