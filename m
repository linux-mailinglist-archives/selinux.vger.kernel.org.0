Return-Path: <selinux+bounces-3176-lists+selinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 899B5A78601
	for <lists+selinux@lfdr.de>; Wed,  2 Apr 2025 03:04:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F376518939B1
	for <lists+selinux@lfdr.de>; Wed,  2 Apr 2025 01:02:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0626D515;
	Wed,  2 Apr 2025 01:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jw0ctSdv"
X-Original-To: selinux@vger.kernel.org
Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39C4712D1F1
	for <selinux@vger.kernel.org>; Wed,  2 Apr 2025 01:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743555718; cv=none; b=Z2yZMP0/+xb/Lf8pznlC6ofa/eP/i2qXIOjfnD4OK+6Gq5d6484GL0dROlyeCTuAaueWU/JrghauTK7Bn9Xe+V5TLcj4Jn1kLRXnG0clV4JkAfvbXisaoOkJsroVs7p4j/DhsbZk3zJbsiZe7Z0IHR915J+aw3yhVXpg3vrfGCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743555718; c=relaxed/simple;
	bh=pf/Wxat+/NPfI37Zar4WQcMkZ4ZqokiWR/A9/aBhFHU=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=WCds1kraehhkJsGKQb61HT7XvrIiQ4+U89M59zTnXwcAOr33DmudOi9mwINxiT3cjllgzD6NNE544gCnFkXisIT0D4bHyb8huqNKILbo0/PGk5Sn7dkvBsx2qeQYOPxSuodlGESb9v0lLYWWp+Ru5KaTsh3SMFS/BlCfOi7V8BE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--inseob.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jw0ctSdv; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--inseob.bounces.google.com
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2ff62f96b10so581928a91.0
        for <selinux@vger.kernel.org>; Tue, 01 Apr 2025 18:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743555716; x=1744160516; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OR2fI1hDKABbNQD81/LlJ5p4DTr3sStjM1E4DIiHiUw=;
        b=jw0ctSdvwYoObBysPn94zSSchHbmNKWZa2GI0TwnX/zqNJsEhsLkocxLOwY7b9jllk
         amQ8XQxsZDbHBOhIfCrqCE1BsI97Un433jIpVHLWL+9uuGp0jwcj+fahvH4Wv/8KKs9H
         o4DWF4TqFpfK8Cu6cSQigY2nhOVHO+ctMeAXulTft/i5H6spZyd3SFNhCgUi0r3HW6Gz
         8t/KN2qy1Qwp3rS7q8JCClqG9ey3x0F3PUik8ODdmJOOx31D0XSu8OhIqpRYI+3mPrMF
         63OVjtETBOdpFIlsVA47Q+AN+kAbwIZ9MJAoARflN4FuUZkV+D47RjdG66ANlcETsVyv
         aPwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743555716; x=1744160516;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OR2fI1hDKABbNQD81/LlJ5p4DTr3sStjM1E4DIiHiUw=;
        b=MhtcaOfMPN/5yhIqm7YV6D25cjI5ZcrUPYHnKbpzqAYvQ+UbiqxwjoCqLSlKaYKfJT
         Ls4M4FGhajlCl3CIXkE65CedP9KRtgFB4q6SPuC6aofLtB7TdaM4seq5nmgJUQ/+Tkt7
         oxtOCYYmalm4wG98/dTWdatUraKWFuucqMVSVPTf9iyj4k0OWRW7aLoCBe0/XF+DiuiZ
         /wiIIXUcE0AquCBRj+hAaU8tTIPTon9h11F8IRGfTf2vIyLMM/kE4dhB7dYDEQhMnzh7
         xsAbmUfXjqeInIsF/SFBWesPhLHpCcaps5rikYpYkkTGPUR+HzpK9kfwi4Wlz26svwO/
         kcRA==
X-Gm-Message-State: AOJu0YzH1okR05pHsQL3AcSPg9BgJGx4yqf6gG7gP6zfKBlZnvdEV9H9
	CwQAKb0mFyD6/3B1pGNqcPAcvKH3FU1yd0MGeRy+GJvnLt466Ag/Hwiziw9nWp2pqhf1Hf4poTk
	5Y0ayT+oTnFowvU07aLu9kcfHTUIdumvbCka1hANHriVsd/mYwyH9owS7MtTtiGMNivEsskM48h
	Qn1IiJCGeDRo7Zcfu9NaOjxgdHyJZ7HL9cPw==
X-Google-Smtp-Source: AGHT+IFb+e8GhGJZVmkWGCKFMGfxCVyu/CXLP7MtEF7Ng3FjUAvK8dL2dhOafD3LIcLhoPoFckgZ1PznJ/w=
X-Received: from pgbdp7.prod.google.com ([2002:a05:6a02:f07:b0:af1:6dd2:2c79])
 (user=inseob job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:2ea2:b0:1f3:1ba1:266a
 with SMTP id adf61e73a8af0-200e5d5d69dmr151904637.0.1743555716194; Tue, 01
 Apr 2025 18:01:56 -0700 (PDT)
Date: Wed,  2 Apr 2025 10:01:46 +0900
Precedence: bulk
X-Mailing-List: selinux@vger.kernel.org
List-Id: <selinux.vger.kernel.org>
List-Subscribe: <mailto:selinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:selinux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.472.ge94155a9ec-goog
Message-ID: <20250402010146.898864-1-inseob@google.com>
Subject: [PATCH RESEND] libsepol: Print line markers also for allow rules
From: Inseob Kim <inseob@google.com>
To: selinux@vger.kernel.org
Cc: tweek@google.com, jeffv@google.com, Inseob Kim <inseob@google.com>
Content-Type: text/plain; charset="UTF-8"

Currently, only line markers for neverallow rules are printed. This
makes people difficult to debug a neverallow failure with cil files
generated by checkpolicy.

This change additionally prints line markers for allow and allowxperm
statements to make debugging easier.

Signed-off-by: Inseob Kim <inseob@google.com>
---
 libsepol/src/module_to_cil.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/libsepol/src/module_to_cil.c b/libsepol/src/module_to_cil.c
index ae9a2b5d..76fe4739 100644
--- a/libsepol/src/module_to_cil.c
+++ b/libsepol/src/module_to_cil.c
@@ -1196,7 +1196,7 @@ static int avrule_list_to_cil(int indent, struct policydb *pdb, struct avrule *a
 	struct type_set *ts;
 
 	for (avrule = avrule_list; avrule != NULL; avrule = avrule->next) {
-		if ((avrule->specified & (AVRULE_NEVERALLOW|AVRULE_XPERMS_NEVERALLOW)) &&
+		if ((avrule->specified & (AVRULE_ALLOWED|AVRULE_XPERMS_ALLOWED|AVRULE_NEVERALLOW|AVRULE_XPERMS_NEVERALLOW)) &&
 		    avrule->source_filename) {
 			cil_println(0, ";;* lmx %lu %s\n",avrule->source_line, avrule->source_filename);
 		}
@@ -1264,7 +1264,7 @@ static int avrule_list_to_cil(int indent, struct policydb *pdb, struct avrule *a
 		names_destroy(&snames, &num_snames);
 		names_destroy(&tnames, &num_tnames);
 
-		if ((avrule->specified & (AVRULE_NEVERALLOW|AVRULE_XPERMS_NEVERALLOW)) &&
+		if ((avrule->specified & (AVRULE_ALLOWED|AVRULE_XPERMS_ALLOWED|AVRULE_NEVERALLOW|AVRULE_XPERMS_NEVERALLOW)) &&
 		    avrule->source_filename) {
 			cil_println(0, ";;* lme\n");
 		}
-- 
2.49.0.rc1.451.g8f38331e32-goog


