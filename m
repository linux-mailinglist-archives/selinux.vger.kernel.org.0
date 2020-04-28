Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7EADC1BBC0B
	for <lists+selinux@lfdr.de>; Tue, 28 Apr 2020 13:12:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726458AbgD1LL7 (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Tue, 28 Apr 2020 07:11:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726345AbgD1LL7 (ORCPT
        <rfc822;selinux@vger.kernel.org>); Tue, 28 Apr 2020 07:11:59 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C41D4C03C1A9
        for <selinux@vger.kernel.org>; Tue, 28 Apr 2020 04:11:57 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id u6so20992378ljl.6
        for <selinux@vger.kernel.org>; Tue, 28 Apr 2020 04:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iObojrAHFYfx3DtW84AN0udp89OUHftdvgK3DzfqjfY=;
        b=uwoMFGboYjF89O9YJ9JD4ATEHUToqEyk023XOi+0ihTFOo0aKijKroxepvSt5eqa1H
         MGIUwuJ3QPdlwJxcn0cn2TunruOcLkwqWfkx4FkzIXODhK+KHCPb31mzBDuXZTIrm0PX
         WaVUMNNQBXMUOVG4R2wCq0gwQp7y1FOGkha5bz3DZ2Zio3rM6fHQtrJhX7AIQCj4MICO
         YnbcDBAaGnTy6MnNNomhKoyB9sCXwnRcYyLeTLYgclwVE7eTO3jGqYnXVpVh/dHYsgWn
         /Lac4WEzkGNn7pX1asaDszfXHCgd/vXJ5fz20Virjj8tuMiILBKdA1iLH7qaOuUFAEh9
         5SAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iObojrAHFYfx3DtW84AN0udp89OUHftdvgK3DzfqjfY=;
        b=OJsbp3Wbbcxro66Wdaldp75lEv4nGlU12bKMkukkZIL8M1ZdDln5XM69tzkLIk/phv
         9eGA3sUv7N0qgPUtqBvWxieWQQAE09ycyB4wMniR6IRqOEipIKnjbkooIlXgKB0VMwyD
         V0YOh/TMitsemFhUNz0Cwz0iVFt6QVugso60uuTie/e9bYJen2FJ0EJv2bOih3+s0/Sc
         52SMvr5wzuN6HM7Pn46Dn6kn/A3PRsEFNvLjjWmpv2Fo4Zl01hPcuTYbtNzxElFgbni9
         4T3PGjbTCjtERGrMWWD1BM+q0vZhLPjg3+p7qMDHh39TNpL0zovYLeZPUXDcOVgbr5Ya
         BP7w==
X-Gm-Message-State: AGi0PuZiu0yaZEOTs9+JzwVij1OJ7ztcRA/Y1RaTvREubQ4XgrLrjRfz
        BEUogMqUrW+o0WRFrSFXDyzV6y6Q
X-Google-Smtp-Source: APiQypLdlDkvRy60V6N2DaPwobEavruhS5UVEkusV4nLlldwvZ+5DCXSlozFSXjp8UOVtixokopVXg==
X-Received: by 2002:a2e:814e:: with SMTP id t14mr16984008ljg.204.1588072315956;
        Tue, 28 Apr 2020 04:11:55 -0700 (PDT)
Received: from localhost.localdomain (88-114-211-119.elisa-laajakaista.fi. [88.114.211.119])
        by smtp.gmail.com with ESMTPSA id g19sm1918141lfb.30.2020.04.28.04.11.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2020 04:11:55 -0700 (PDT)
From:   Topi Miettinen <toiwoton@gmail.com>
To:     selinux@vger.kernel.org
Cc:     Topi Miettinen <toiwoton@gmail.com>
Subject: [PATCH v2] libselinux: mount selinuxfs noexec and nosuid
Date:   Tue, 28 Apr 2020 14:11:42 +0300
Message-Id: <20200428111142.6072-1-toiwoton@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Mount selinuxfs with mount flags noexec and nosuid. It's not likely
that this has any effect, but it's visually more pleasing.

Option nodev can't be used because of /sys/fs/selinux/null device,
which is used by Android.

Signed-off-by: Topi Miettinen <toiwoton@gmail.com>
---
 libselinux/src/load_policy.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/libselinux/src/load_policy.c b/libselinux/src/load_policy.c
index fa1a3bf1..2aea826f 100644
--- a/libselinux/src/load_policy.c
+++ b/libselinux/src/load_policy.c
@@ -279,7 +279,8 @@ int selinux_init_load_policy(int *enforce)
 	const char *mntpoint = NULL;
 	/* First make sure /sys is mounted */
 	if (mount("sysfs", "/sys", "sysfs", 0, 0) == 0 || errno == EBUSY) {
-		if (mount(SELINUXFS, SELINUXMNT, SELINUXFS, 0, 0) == 0 || errno == EBUSY) {
+		/* MS_NODEV can't be set because of /sys/fs/selinux/null device, used by Android */
+		if (mount(SELINUXFS, SELINUXMNT, SELINUXFS, MS_NOEXEC | MS_NOSUID, 0) == 0 || errno == EBUSY) {
 			mntpoint = SELINUXMNT;
 		} else {
 			/* check old mountpoint */
-- 
2.26.2

