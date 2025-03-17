Return-Path: <selinux+bounces-3083-lists+selinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8001DA6467F
	for <lists+selinux@lfdr.de>; Mon, 17 Mar 2025 10:03:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6556D3A9822
	for <lists+selinux@lfdr.de>; Mon, 17 Mar 2025 09:03:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 136D721D5A7;
	Mon, 17 Mar 2025 09:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Iyv38QIH"
X-Original-To: selinux@vger.kernel.org
Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 909ED21E096
	for <selinux@vger.kernel.org>; Mon, 17 Mar 2025 09:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742202214; cv=none; b=kABqPX6E3+NQkgv0gfWiQ2GHPSqasECe/GEWZnN5Ys5QWqlYCInb0PnDz9a7oEIiYvMRz3gInVoyQ+PDChhWMOwwJcZUevptgUTAUovAPgfMMOIY/+CtDXxLSjRqzrjzd6tcewyteV9+BJT4KEtyMt+XSZf96AwC2rkifNGC7zE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742202214; c=relaxed/simple;
	bh=pf/Wxat+/NPfI37Zar4WQcMkZ4ZqokiWR/A9/aBhFHU=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=HsjFpH+jLmIfFqAUN3m4nRSxSV+VxyeSh9qsOAib+Su/CVNAW4M59zshVSLq8lritAaz1kAy7CCfm2g1rZ2iksEqVWiMOpt5i6JzWwlIYeeu1g1VrpsB5Ek8MltIDUNwNuU6Tm8E+MaqigGyZyOiA7tyjYKmMAapp6C9CGoFDLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--inseob.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Iyv38QIH; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--inseob.bounces.google.com
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2ff798e8c90so2695439a91.1
        for <selinux@vger.kernel.org>; Mon, 17 Mar 2025 02:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742202212; x=1742807012; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OR2fI1hDKABbNQD81/LlJ5p4DTr3sStjM1E4DIiHiUw=;
        b=Iyv38QIHiNL12h9MPdgePo2O/mMRH1p08r17/gGySEtGLHyTbgPVoGTQ4+isbbNlPx
         IusPwXHXD4p0DgjjcqAoQLgGQ+YmLQFXkv+hJfeZYJBeSfjADXTRDCQtmZUe2VffLWzs
         MpbVIjwkOY3NJdJXIHTSPlCQHybFMkeWDvMHkfmNPcXDU7H/rEeeg2J/h8HUcfX9nTRf
         i+/KAPw5jhFckUwC0V6n0jxH6suurnrUUaZIOja4yGlpANNH5OdfGKBqkuWqoZg8ZQJt
         AZCTyF1h6zkNiS6oSEEFr/F+aA6Ec9edvjiMO1E5nCpQvfzv5/dylBC5oLA6wOyMHkcp
         m7XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742202212; x=1742807012;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OR2fI1hDKABbNQD81/LlJ5p4DTr3sStjM1E4DIiHiUw=;
        b=VJy7p66munyf+gOXqbRGEDRShYOldKkSII4uy3y7PSyu62wDlqy1wLh3QvOIukLRRY
         Da3mB0zAEzyuoIUcIVwHf2wP53NueVDUoIX6MdXUU5cN+Bc4+D8P8AENHwIGrRet3CqO
         cBAIiYkjvRdrp+jaR/7vwhGl9vGVOrDz5UKGOG1yVjZx54oyJnvDQ0959W6Lr3g0mBxN
         13Yt56zCQCLIGKESbUF3z6Lstz+/w9Es5/eb1MmApsHORCMCW23MHRTmEEztItPsf9C/
         ffG0qEtgo1UbToxz5EanHUk6Dd49ySz1VhJ+tgFUoAkwnYl0jTKvk25FqUfXTI0gc0pH
         lK0w==
X-Gm-Message-State: AOJu0YwUXk+onNa0Sq/tfpWmGzUAEVXu0PpgYm2vWhNJC+rIpKFMVeJY
	p0HC/3QVn31mlHLXPNq+SOgAIDT344bfa9s9JU2c69Jl3sL4Goy9Ex5bqWEBlzTgZpvBk2lWJro
	m5jX+4pk8hxAdL4Gsj1UJE8l55J8siJ3GETcULWhiGb0RVWal2VwPfgo6gJDXd+fdow3jpTyIJo
	xXJqs82d853YZsaD+Om2IRZ+3BK0KlI1TlqA==
X-Google-Smtp-Source: AGHT+IGqeH8Y6AV520Xs4ZLgKq8obW47Uikz7bm3pChpAdFhGU46PToHVX3XKwL1ZAQ4X0AL0SZSqL+qCEc=
X-Received: from pjbsl14.prod.google.com ([2002:a17:90b:2e0e:b0:2f7:d453:e587])
 (user=inseob job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:fd11:b0:2ff:702f:7172
 with SMTP id 98e67ed59e1d1-30151d8174emr15171647a91.33.1742202211666; Mon, 17
 Mar 2025 02:03:31 -0700 (PDT)
Date: Mon, 17 Mar 2025 18:03:24 +0900
Precedence: bulk
X-Mailing-List: selinux@vger.kernel.org
List-Id: <selinux.vger.kernel.org>
List-Subscribe: <mailto:selinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:selinux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.rc1.451.g8f38331e32-goog
Message-ID: <20250317090324.2761865-1-inseob@google.com>
Subject: [PATCH] libsepol: Print line markers also for allow rules
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


