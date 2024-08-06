Return-Path: <selinux+bounces-1587-lists+selinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 656A9949C19
	for <lists+selinux@lfdr.de>; Wed,  7 Aug 2024 01:11:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DBB49B28D63
	for <lists+selinux@lfdr.de>; Tue,  6 Aug 2024 23:11:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD33F17B406;
	Tue,  6 Aug 2024 23:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d1tdHXXG"
X-Original-To: selinux@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55FC017A931;
	Tue,  6 Aug 2024 23:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722985804; cv=none; b=ugv9zDJsowP1m2EwOJRmeanz4y07XmUZ8NDvbh60HhnUPv7oUWfVTAD7bBQyFml1RKN7MlD5mkcN6jJqrzRmjpZJZwq+z+xAL+HDFENNhztlbyngw1SqqrGkqMwyTWWpOFQ2pADt+7ec/YAJaPyt6w96Xcntr4R35N/pTPMRT8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722985804; c=relaxed/simple;
	bh=JOwNCNr3/IEbe6BdNnnrPTwJINMvSZj5yZCINdET7DM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E2MXNK/YWdfyXIWsiU7bqfe7wakufUCkRrB/fxSZktD0H0LQ5+Fn6YEJHuuJ1wd3y1YZZ+QaB2AQ6hH4a96aeTHGS6XVXnvFKtla5b/m5THobPrz9cCOye8XHtAsptYjAtbW+Sxz53EjYgIO8/+Gq88YqnLXmqkXbGLbUNIboYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d1tdHXXG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id BC8D9C4AF1C;
	Tue,  6 Aug 2024 23:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722985803;
	bh=JOwNCNr3/IEbe6BdNnnrPTwJINMvSZj5yZCINdET7DM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=d1tdHXXGxre4WSP+5XHhbrZaAFl9Q1axTlOCxWPyt0PC+zHC5BPvvBMCXPxJ5VQPQ
	 D/MKgQHR6vbSQV3xdkFAZ/FjkZFAGbq2Mhb5PonaeTYS7pTdpS3TKqZcqo+TzgG+Uw
	 fpzPYYvGH8RF4B8nDZDoBPruy+MECvLKlGrh/gif7Kofoz15Xs5ofSpukwv4A6lgXC
	 6b0fkVNKMKXF5pf05LOBnSUX58K9ml4QGZ+UQUC/UJzNI7jmYDK+UoOJgLqDwPCBrh
	 +uomJrEsMpLCrEGtUP6Kk1JIJ65rwcpNSVxo+XEvqZ93peIKWNNwnPJdTWXcKGtneW
	 aF6P7uexYQfhA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF56DC49EA1;
	Tue,  6 Aug 2024 23:10:03 +0000 (UTC)
From: Daniel Gomez via B4 Relay <devnull+da.gomez.samsung.com@kernel.org>
Date: Wed, 07 Aug 2024 01:09:25 +0200
Subject: [PATCH 11/12] tty/vt: conmakehash requires linux/limits.h
Precedence: bulk
X-Mailing-List: selinux@vger.kernel.org
List-Id: <selinux.vger.kernel.org>
List-Subscribe: <mailto:selinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:selinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240807-macos-build-support-v1-11-4cd1ded85694@samsung.com>
References: <20240807-macos-build-support-v1-0-4cd1ded85694@samsung.com>
In-Reply-To: <20240807-macos-build-support-v1-0-4cd1ded85694@samsung.com>
To: Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
 Lucas De Marchi <lucas.demarchi@intel.com>, 
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 William Hubbs <w.d.hubbs@gmail.com>, Chris Brannon <chris@the-brannons.com>, 
 Kirk Reiser <kirk@reisers.ca>, 
 Samuel Thibault <samuel.thibault@ens-lyon.org>, 
 Paul Moore <paul@paul-moore.com>, 
 Stephen Smalley <stephen.smalley.work@gmail.com>, 
 Ondrej Mosnacek <omosnace@redhat.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 James Morse <james.morse@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 speakup@linux-speakup.org, selinux@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 linux-serial@vger.kernel.org, llvm@lists.linux.dev, 
 Finn Behrens <me@kloenk.dev>, 
 "Daniel Gomez (Samsung)" <d+samsung@kruces.com>, gost.dev@samsung.com, 
 Daniel Gomez <da.gomez@samsung.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1722985800; l=1705;
 i=da.gomez@samsung.com; s=20240621; h=from:subject:message-id;
 bh=GlY+ZLQcYSKSN3SyY915ZDHwX28gVnVDJorFIIf1+Jo=;
 b=TXC+qEwbi6LwhRfspoNf9uCJM5mS5rpVYHpZ3bnRG1KFrfzm+UI/apLoI43ShxbZHbpUUEVBL
 CkbYZiLdsfUA4G8wSWyMc3cIK3tGKT6BD0jGlYhjBBXl1eg0MflhqKS
X-Developer-Key: i=da.gomez@samsung.com; a=ed25519;
 pk=BqYk31UHkmv0WZShES6pIZcdmPPGay5LbzifAdZ2Ia4=
X-Endpoint-Received: by B4 Relay for da.gomez@samsung.com/20240621 with
 auth_id=175
X-Original-From: Daniel Gomez <da.gomez@samsung.com>
Reply-To: da.gomez@samsung.com

From: Daniel Gomez <da.gomez@samsung.com>

macOS hosts do not provide the linux/limits.h header required for
conmakehash. To address this, ensure that usr/include is included in
the conmakehash HOSTCFLAGS. This will provide the necessary header for
successful compilation on macOS.

Fixes error:
HOSTCC  drivers/tty/vt/conmakehash - due to target missing
  clang -Wp,-MMD,drivers/tty/vt/.conmakehash.d -Wall
-Wmissing-prototypes -Wstrict-prototypes -O2 -fomit-frame-pointer
-std=gnu11   -I ./scripts/include     -o drivers/tty/vt/conmakehash
drivers/tty/vt/conmakehash.c
drivers/tty/vt/conmakehash.c:15:10: fatal error: 'linux/
   limits.h' file not found 15 | #include <linux/limits.h>    |
   ^~~~~~~~~~~~~~~~
1 error generated.
make[5]: *** [scripts/Makefile.host:116: drivers/tty/vt/conmakehash]
Error 1
make[4]: *** [scripts/Makefile.build:485: drivers/tty/vt] Error 2
make[3]: *** [scripts/Makefile.build:485: drivers/tty] Error 2
make[2]: *** [scripts/Makefile.build:485: drivers] Error 2
make[1]: *** [/Volumes/src/kernel/linux-next/Makefile:1925: .] Error 2
make: *** [Makefile:224: __sub-make] Error 2

Signed-off-by: Daniel Gomez <da.gomez@samsung.com>
---
 drivers/tty/vt/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/tty/vt/Makefile b/drivers/tty/vt/Makefile
index 2c8ce8b592ed..d266895357e5 100644
--- a/drivers/tty/vt/Makefile
+++ b/drivers/tty/vt/Makefile
@@ -13,6 +13,7 @@ obj-$(CONFIG_CONSOLE_TRANSLATIONS)	+= consolemap.o consolemap_deftbl.o
 clean-files := consolemap_deftbl.c defkeymap.c
 
 hostprogs += conmakehash
+HOSTCFLAGS_conmakehash.o = -I$(srctree)/usr/include
 
 quiet_cmd_conmk = CONMK   $@
       cmd_conmk = $(obj)/conmakehash $< > $@

-- 
Git-146)



