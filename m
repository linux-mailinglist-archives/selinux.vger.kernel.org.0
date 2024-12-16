Return-Path: <selinux+bounces-2542-lists+selinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A389F3675
	for <lists+selinux@lfdr.de>; Mon, 16 Dec 2024 17:46:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B441C188C03B
	for <lists+selinux@lfdr.de>; Mon, 16 Dec 2024 16:46:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8A1A20ADE8;
	Mon, 16 Dec 2024 16:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=seltendoof.de header.i=@seltendoof.de header.b="CjKA0z2n"
X-Original-To: selinux@vger.kernel.org
Received: from server02.seltendoof.de (server02.seltendoof.de [168.119.48.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B6DD20A5EB;
	Mon, 16 Dec 2024 16:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.48.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734367315; cv=none; b=kHLN+UBjRDT1jY5D+f6Xr6u+2xWn1DkfTrQTzjpHFzrGQxx9tjXolPUT6k1QUDItXjU5vEq3hrCNJ6b/gzRkLnhZ00hH25k8fbBkdMqx/9uRtLZjNiOptJf+8AnZECkSYA9JUbv8+031k9rW/TkoU9a/aw6qyUIbgP+nV2VOqAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734367315; c=relaxed/simple;
	bh=Aoo2TUyVMCRqWGQNdXqp4UdITl9PGjDQT6gFlTVAUiU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qjakq8LjvKqZU6VINuCB0gUFlxhk1g9LrRFIMxJUl+tWwzueKJWB3nKfnYfHGpV7NqNnQHJwGTXVa+ZQNjWkkPWh3pfkKcYkLpq22HlzbjqNoGr1LdL1/hHo19u5u6tBIBwKri2QqnaRLmxnJ9+t+u55WgMne338otR6Jf1cCfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=seltendoof.de; spf=pass smtp.mailfrom=seltendoof.de; dkim=pass (2048-bit key) header.d=seltendoof.de header.i=@seltendoof.de header.b=CjKA0z2n; arc=none smtp.client-ip=168.119.48.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=seltendoof.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=seltendoof.de
From: =?UTF-8?q?Christian=20G=C3=B6ttsche?= <cgoettsche@seltendoof.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seltendoof.de;
	s=2023072701; t=1734367312;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vON9japLNEO+Zm4m72u5Sr35uELFkN8ik8KW4BXu24Y=;
	b=CjKA0z2n4jyVC22oLsLzPln5TuKSBOOjlM/s4aQQ1nD3wWtiY3iUkZa5c5z/oE5y1vDzdn
	1hweFEBDRnNzKQfu1DTNDVDC6cCGowXGprKVGL+N7adDbgz7Sqnb5y4oG9TbAdvgaIuxFX
	fMWBtYS3Yl5VxdZdDS8N2GzuzdEe61zO1MXQy7zP+2uby0UqcjN4Uqeb/25uxrkFUMtscR
	xvLWqFpMpo8dTSBXTVewt0tTo3a9w+a151Iu9optYqglsJm1cSNazb+rErnxiWW0YC9B32
	9l121xYVyWQSa2S4Id8rcsVIjaIH3RTE54QG54iNQAQfZCrAy09ncB7S2iz/EA==
To: selinux@vger.kernel.org
Cc: =?UTF-8?q?Christian=20G=C3=B6ttsche?= <cgzones@googlemail.com>,
	Paul Moore <paul@paul-moore.com>,
	Stephen Smalley <stephen.smalley.work@gmail.com>,
	Ondrej Mosnacek <omosnace@redhat.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	=?UTF-8?q?Thi=C3=A9baud=20Weksteen?= <tweek@google.com>,
	=?UTF-8?q?Bram=20Bonn=C3=A9?= <brambonne@google.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Eric Suen <ericsu@linux.microsoft.com>,
	Canfeng Guo <guocanfeng@uniontech.com>
Subject: [RFC PATCH v2 15/22] selinux: introduce ebitmap_highest_set_bit()
Date: Mon, 16 Dec 2024 17:40:13 +0100
Message-ID: <20241216164055.96267-15-cgoettsche@seltendoof.de>
In-Reply-To: <20241216164055.96267-1-cgoettsche@seltendoof.de>
References: <20241216164055.96267-1-cgoettsche@seltendoof.de>
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

Introduce an ebitmap function to calculate the highest set bit.

Signed-off-by: Christian Göttsche <cgzones@googlemail.com>
---
 security/selinux/ss/ebitmap.c | 27 +++++++++++++++++++++++++++
 security/selinux/ss/ebitmap.h |  1 +
 2 files changed, 28 insertions(+)

diff --git a/security/selinux/ss/ebitmap.c b/security/selinux/ss/ebitmap.c
index 43bc19e21960..5d6b5b72b3e5 100644
--- a/security/selinux/ss/ebitmap.c
+++ b/security/selinux/ss/ebitmap.c
@@ -257,6 +257,33 @@ int ebitmap_contains(const struct ebitmap *e1, const struct ebitmap *e2,
 	return 1;
 }
 
+u32 ebitmap_highest_set_bit(const struct ebitmap *e)
+{
+	const struct ebitmap_node *n;
+	unsigned long unit;
+	u32 pos = 0;
+
+	n = e->node;
+	if (!n)
+		return 0;
+
+	while (n->next)
+		n = n->next;
+
+	for (unsigned int i = EBITMAP_UNIT_NUMS; i > 0; i--) {
+		unit = n->maps[i - 1];
+		if (unit == 0)
+			continue;
+
+		pos = (i - 1) * EBITMAP_UNIT_SIZE;
+		while (unit >>= 1)
+			pos++;
+		break;
+	}
+
+	return n->startbit + pos;
+}
+
 int ebitmap_get_bit(const struct ebitmap *e, u32 bit)
 {
 	const struct ebitmap_node *n;
diff --git a/security/selinux/ss/ebitmap.h b/security/selinux/ss/ebitmap.h
index c9569998f287..12bb359e83ff 100644
--- a/security/selinux/ss/ebitmap.h
+++ b/security/selinux/ss/ebitmap.h
@@ -126,6 +126,7 @@ int ebitmap_and(struct ebitmap *dst, const struct ebitmap *e1,
 		const struct ebitmap *e2);
 int ebitmap_contains(const struct ebitmap *e1, const struct ebitmap *e2,
 		     u32 last_e2bit);
+u32 ebitmap_highest_set_bit(const struct ebitmap *e);
 int ebitmap_get_bit(const struct ebitmap *e, u32 bit);
 int ebitmap_set_bit(struct ebitmap *e, u32 bit, int value);
 void ebitmap_destroy(struct ebitmap *e);
-- 
2.45.2


