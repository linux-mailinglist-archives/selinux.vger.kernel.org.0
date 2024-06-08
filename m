Return-Path: <selinux+bounces-1194-lists+selinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C1C39012F8
	for <lists+selinux@lfdr.de>; Sat,  8 Jun 2024 19:20:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AE26B28217A
	for <lists+selinux@lfdr.de>; Sat,  8 Jun 2024 17:20:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C14BAE57E;
	Sat,  8 Jun 2024 17:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=seltendoof.de header.i=@seltendoof.de header.b="LJT2GCAu"
X-Original-To: selinux@vger.kernel.org
Received: from server02.seltendoof.de (server02.seltendoof.de [168.119.48.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6C7C6AB8
	for <selinux@vger.kernel.org>; Sat,  8 Jun 2024 17:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.48.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717867232; cv=none; b=npHMhP966eUM6L2+z6q3n3114vD5fnugPJ1V5Uyo6EPpX/VrVOLb5suDRGd/KgKaA4tLMOaVvy28+9p4OQdduKrsNN7obCy1iwEuPAdYiqNxMKKn5GLChkxHfdQ2ZIxTvnSA00vUrQtyKejpme/wdcOnx/fdVDhcCDp2c+x+TSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717867232; c=relaxed/simple;
	bh=jABlOF9ldHqd8z+v9mq4YlNCstiQg03cGxqzzlZtM9M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jJk4y9IhWPbVq4RCdiBLfe+hguH5cMcYaJUoLvzAi+FNMeZVv28y/aFrlrXHGbiHw8g9+gy9G3NoGbSUjTLh7QmcKqRDIIA2NrpHu9BsGeDfebV1U13pUFaZbhq8LhflNjPkQv7KA+xvqKI0ivkBLCnAtR3hcxZtUvCJuZOn6zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=seltendoof.de; spf=pass smtp.mailfrom=seltendoof.de; dkim=pass (2048-bit key) header.d=seltendoof.de header.i=@seltendoof.de header.b=LJT2GCAu; arc=none smtp.client-ip=168.119.48.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=seltendoof.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=seltendoof.de
From: =?UTF-8?q?Christian=20G=C3=B6ttsche?= <cgoettsche@seltendoof.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seltendoof.de;
	s=2023072701; t=1717867229;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bah6xsPLl5c7HdloiGYu4AhGZC2oR7fs881nTLhE5kA=;
	b=LJT2GCAu1jubmiD/y8q14L0ieJsfbkQo2Aqfvba+Wy+MkV7Q4+ZYvAN94lDqBEqVfncuFp
	l1H6QWRoZvJ+DWvrCJgLbCRC6PRI2pZ2fD8+ERRlge8T+T9AVEHR1Qm8F0qCyMIvQFHhm2
	hFG+imeLX/WYgAtQultEE62kviJv0LKukqiebDFFbQSlkWcXXggQDiS1LYzcGm193p5319
	3ULnxM86c8cbkE/m7Gki1c6rPq035hirQISa+FpRDmEu5H24tGQ6tiozdE1pLaODmGace5
	MFmVeZ17aUDIbI8jBsOUpfLrPjqShH8Q1kzuD5UiiXFIv6otXUkJhbPenNkwwA==
To: selinux@vger.kernel.org
Cc: =?UTF-8?q?Christian=20G=C3=B6ttsche?= <cgzones@googlemail.com>
Subject: [PATCH 2/2] libselinux: constify avc_open(3) parameter
Date: Sat,  8 Jun 2024 19:20:25 +0200
Message-ID: <20240608172025.137795-2-cgoettsche@seltendoof.de>
In-Reply-To: <20240608172025.137795-1-cgoettsche@seltendoof.de>
References: <20240608172025.137795-1-cgoettsche@seltendoof.de>
Reply-To: cgzones@googlemail.com
Precedence: bulk
X-Mailing-List: selinux@vger.kernel.org
List-Id: <selinux.vger.kernel.org>
List-Subscribe: <mailto:selinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:selinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Christian Göttsche <cgzones@googlemail.com>

The option array passed to avc_open(3) is only read from.

Signed-off-by: Christian Göttsche <cgzones@googlemail.com>
---
 libselinux/include/selinux/avc.h | 2 +-
 libselinux/man/man3/avc_open.3   | 2 +-
 libselinux/src/avc.c             | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/libselinux/include/selinux/avc.h b/libselinux/include/selinux/avc.h
index 4bbd2382..1f79ba16 100644
--- a/libselinux/include/selinux/avc.h
+++ b/libselinux/include/selinux/avc.h
@@ -215,7 +215,7 @@ extern int avc_init(const char *msgprefix,
  * is set to "avc" and any callbacks desired should be specified via
  * selinux_set_callback().  Available options are listed above.
  */
-extern int avc_open(struct selinux_opt *opts, unsigned nopts);
+extern int avc_open(const struct selinux_opt *opts, unsigned nopts);
 
 /**
  * avc_cleanup - Remove unused SIDs and AVC entries.
diff --git a/libselinux/man/man3/avc_open.3 b/libselinux/man/man3/avc_open.3
index 55683bb6..74f85593 100644
--- a/libselinux/man/man3/avc_open.3
+++ b/libselinux/man/man3/avc_open.3
@@ -10,7 +10,7 @@ avc_open, avc_destroy, avc_reset, avc_cleanup \- userspace SELinux AVC setup and
 .br
 .B #include <selinux/avc.h>
 .sp
-.BI "int avc_open(struct selinux_opt *" options ", unsigned " nopt ");"
+.BI "int avc_open(const struct selinux_opt *" options ", unsigned " nopt ");"
 .sp
 .BI "void avc_destroy(void);"
 .sp
diff --git a/libselinux/src/avc.c b/libselinux/src/avc.c
index ce87ac16..7af5d192 100644
--- a/libselinux/src/avc.c
+++ b/libselinux/src/avc.c
@@ -225,7 +225,7 @@ static int avc_init_internal(const char *prefix,
 	return rc;
 }
 
-int avc_open(struct selinux_opt *opts, unsigned nopts)
+int avc_open(const struct selinux_opt *opts, unsigned nopts)
 {
 	avc_setenforce = 0;
 
-- 
2.45.1


