Return-Path: <selinux+bounces-2245-lists+selinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A6AF9C408B
	for <lists+selinux@lfdr.de>; Mon, 11 Nov 2024 15:17:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 04FB8280DEB
	for <lists+selinux@lfdr.de>; Mon, 11 Nov 2024 14:17:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A79C19F12A;
	Mon, 11 Nov 2024 14:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=seltendoof.de header.i=@seltendoof.de header.b="AlI/nUxu"
X-Original-To: selinux@vger.kernel.org
Received: from server02.seltendoof.de (server02.seltendoof.de [168.119.48.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96E9E19EED6
	for <selinux@vger.kernel.org>; Mon, 11 Nov 2024 14:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.48.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731334640; cv=none; b=MElEltne0veFNNbtroRxuC1KDjVHTMSmn3MU6YU2kcar3UigeDHsoTuwFZ11IJDcbRSj1Us9rE43I3QpgEJb5KI/EBPfSsvBkV+spPEybI59Z+IV/KxjiESqRSjY9MfSxq/yAxjxLOibuvBcqRfAbwlR4fjjZCLiyfbyoTUismo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731334640; c=relaxed/simple;
	bh=7sjc6Dsskv5B18PWOkXBKrKqkoPyxP7Mt7y02y6q37M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=H/KOHq+fBfw55L4TWa+CmX3nuFSA2AxYQev8Vb0KQNkOsHcrxETB3WOCDxRIyyb671QUmd/DO94S/SaDy/iHnTDADkqBTSl1y2Yb++Q4QWP+z6+4XyCJ/4FyVsQTZ3PsWxQgHOjTMboeAMSL7fHoyuGkqINydEQ4vIMwvbZozOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=seltendoof.de; spf=pass smtp.mailfrom=seltendoof.de; dkim=pass (2048-bit key) header.d=seltendoof.de header.i=@seltendoof.de header.b=AlI/nUxu; arc=none smtp.client-ip=168.119.48.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=seltendoof.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=seltendoof.de
From: =?UTF-8?q?Christian=20G=C3=B6ttsche?= <cgoettsche@seltendoof.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seltendoof.de;
	s=2023072701; t=1731334634;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=33CHAP1zhbiyo4kOYHii8nGEsk+kYP1Aj5+X9dLA9Vc=;
	b=AlI/nUxuY9FrdxrK2ltuUTAwxmNsf+Bi8w1KfvlMJHwh666/48t3ZsFR6uGjchPjwAfbUC
	Q4XtPWaoZ9gE2q1jtbMT6B3LnARIyYBUKfemZMXuiQITBeY/PQC+HPlrVhYgx7ahI4zVQ/
	dJTWbIF+no69oENJwhWi1D6dszBVM5VZkxXujJpxk4j/HwjBriddE4kiPXQaZk4VfeRZgT
	XnCtfLyjh6GZ3eSsAVYWO1VWi1hEytFlWsERYoHx6xthA3/hCrFKKof4WISwo7l8YnV/Xl
	omzfMHlrn1TSOY9blWvFPJsr2UrWJuINxTFfUx2IdtHOO83hSvzyHasUXJ4U9Q==
To: selinux@vger.kernel.org
Cc: =?UTF-8?q?Christian=20G=C3=B6ttsche?= <cgzones@googlemail.com>
Subject: [PATCH 08/47] libsemanage: drop duplicate include
Date: Mon, 11 Nov 2024 15:16:27 +0100
Message-ID: <20241111141706.38039-8-cgoettsche@seltendoof.de>
In-Reply-To: <20241111141706.38039-1-cgoettsche@seltendoof.de>
References: <20241111141706.38039-1-cgoettsche@seltendoof.de>
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

Signed-off-by: Christian Göttsche <cgzones@googlemail.com>
---
 libsemanage/src/modules.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/libsemanage/src/modules.c b/libsemanage/src/modules.c
index c3bd90ac..eeb85be6 100644
--- a/libsemanage/src/modules.c
+++ b/libsemanage/src/modules.c
@@ -40,7 +40,6 @@
 #include <ctype.h>
 
 #include "handle.h"
-#include "modules.h"
 #include "sha256.h"
 #include "debug.h"
 
-- 
2.45.2


