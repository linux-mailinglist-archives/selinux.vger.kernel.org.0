Return-Path: <selinux+bounces-3071-lists+selinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B218A61221
	for <lists+selinux@lfdr.de>; Fri, 14 Mar 2025 14:11:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5110A462979
	for <lists+selinux@lfdr.de>; Fri, 14 Mar 2025 13:11:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8BDC1FA272;
	Fri, 14 Mar 2025 13:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=seltendoof.de header.i=@seltendoof.de header.b="OBeUqDm1"
X-Original-To: selinux@vger.kernel.org
Received: from server02.seltendoof.de (server02.seltendoof.de [168.119.48.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF9BF33062
	for <selinux@vger.kernel.org>; Fri, 14 Mar 2025 13:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.48.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741957870; cv=none; b=M5gfcNwNBMgXAHWLhhKjvgsuV744d/uwe1uTFyH0wCrrdRHrn+08SxIPU3uwvq/Mfx92ia/Bd6MWhue6UpMxttmhb/KkLBtAnZVdGXGIDlRhTHzO3Wb78Q7pqD+K4kp024lM8sAWVuV6YopuqFQfzOmOGQb6QtDhdkCKm51uXow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741957870; c=relaxed/simple;
	bh=6mJtMCynq3/qFJfbuwBFmL6N1mZMD0UPGwHP82/HUQY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XvRv8LUlxt3mx+nBr6Xir205d2N8EiikNlEU9ctoFWkUJPr1keyjljuod563IxsQnybFzfgGGaLthXXAAVxgfgNq+i0pojhugxVjC6cr0Pa7UsTosFS6XgodeedZVrXxH9UI5Okeirg4AFSRCG4t0Izfe4EMA1FOAd/TSCMow7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=seltendoof.de; spf=pass smtp.mailfrom=seltendoof.de; dkim=pass (2048-bit key) header.d=seltendoof.de header.i=@seltendoof.de header.b=OBeUqDm1; arc=none smtp.client-ip=168.119.48.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=seltendoof.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=seltendoof.de
From: =?UTF-8?q?Christian=20G=C3=B6ttsche?= <cgoettsche@seltendoof.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seltendoof.de;
	s=2023072701; t=1741957859;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W8dcfVRtMjJubp4rsFUjaEOXQkYrlFHgM6nWfwVWiio=;
	b=OBeUqDm1kxWeIQ+vR0FpFjtjtGNIQmbrLpY5ebbio4oGNtM9cg+xLsvlSP6qAVQh0lZjg2
	NoNnQFKJyZJUNykh41CYcAgmHaRyhH/AkhahAFjSigTdSXexpy65emspnyYgQPLiBocdlY
	K1NEc2AOAWRZ+NrM/YgR92Oupx53I+kSGgUQCy6JHs2rdn8vM6NcINI292JHrCpFED+RK6
	2PvSxvzTVMSUZdqHlkk/LmKp29JKT8sfdCQEjfLE0hBVkZwtVYeW0VwPRflU5aYZ5FSijy
	8jeJYRkDQeQD6dqOvJoTr/9dR18bjI+KM/yb89UFv4TdrMRxBflmuiBawfV3YA==
To: selinux@vger.kernel.org
Cc: =?UTF-8?q?Christian=20G=C3=B6ttsche?= <cgzones@googlemail.com>
Subject: [PATCH v2 3/4] libselinux: initialize regex arch string in a thread safe way
Date: Fri, 14 Mar 2025 14:10:52 +0100
Message-ID: <20250314131054.24450-2-cgoettsche@seltendoof.de>
In-Reply-To: <20250314131054.24450-1-cgoettsche@seltendoof.de>
References: <20250314131054.24450-1-cgoettsche@seltendoof.de>
Reply-To: =?UTF-8?q?Christian=20G=C3=B6ttsche?= <cgzones@googlemail.com>
Precedence: bulk
X-Mailing-List: selinux@vger.kernel.org
List-Id: <selinux.vger.kernel.org>
List-Subscribe: <mailto:selinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:selinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Christian Göttsche <cgzones@googlemail.com>

Synchronize the initialization of the regex architecture string.

Signed-off-by: Christian Göttsche <cgzones@googlemail.com>
---
 libselinux/src/regex.c | 46 ++++++++++++++++++++++++------------------
 1 file changed, 26 insertions(+), 20 deletions(-)

diff --git a/libselinux/src/regex.c b/libselinux/src/regex.c
index 182c8c89..976f00d4 100644
--- a/libselinux/src/regex.c
+++ b/libselinux/src/regex.c
@@ -30,32 +30,38 @@
 #endif
 
 #ifdef USE_PCRE2
-char const *regex_arch_string(void)
+static pthread_once_t once = PTHREAD_ONCE_INIT;
+static char arch_string_buffer[32];
+
+static void regex_arch_string_init(void)
 {
-	static char arch_string_buffer[32];
-	static char const *arch_string = "";
-	char const *endianness = NULL;
+	char const *endianness;
 	int rc;
 
-	if (arch_string[0] == '\0') {
-		if (__BYTE_ORDER__ == __ORDER_LITTLE_ENDIAN__)
-			endianness = "el";
-		else if (__BYTE_ORDER__ == __ORDER_BIG_ENDIAN__)
-			endianness = "eb";
+	if (__BYTE_ORDER__ == __ORDER_LITTLE_ENDIAN__)
+		endianness = "el";
+	else if (__BYTE_ORDER__ == __ORDER_BIG_ENDIAN__)
+		endianness = "eb";
+	else {
+		arch_string_buffer[0] = '\0';
+		return;
+	}
 
-		if (!endianness)
-			return NULL;
+	rc = snprintf(arch_string_buffer, sizeof(arch_string_buffer),
+			"%zu-%zu-%s", sizeof(void *),
+			sizeof(REGEX_ARCH_SIZE_T),
+			endianness);
+	if (rc < 0 || (size_t)rc >= sizeof(arch_string_buffer)) {
+		arch_string_buffer[0] = '\0';
+		return;
+	}
+}
 
-		rc = snprintf(arch_string_buffer, sizeof(arch_string_buffer),
-				"%zu-%zu-%s", sizeof(void *),
-				sizeof(REGEX_ARCH_SIZE_T),
-				endianness);
-		if (rc < 0)
-			abort();
+const char *regex_arch_string(void)
+{
+	__selinux_once(once, regex_arch_string_init);
 
-		arch_string = &arch_string_buffer[0];
-	}
-	return arch_string;
+	return arch_string_buffer[0] != '\0' ? arch_string_buffer : NULL;
 }
 
 struct regex_data {
-- 
2.47.2


