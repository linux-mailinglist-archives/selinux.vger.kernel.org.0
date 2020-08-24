Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B9E224FEAF
	for <lists+selinux@lfdr.de>; Mon, 24 Aug 2020 15:19:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725780AbgHXNTI (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Mon, 24 Aug 2020 09:19:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726599AbgHXNTB (ORCPT
        <rfc822;selinux@vger.kernel.org>); Mon, 24 Aug 2020 09:19:01 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF71EC061575
        for <selinux@vger.kernel.org>; Mon, 24 Aug 2020 06:18:59 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id w14so7508420eds.0
        for <selinux@vger.kernel.org>; Mon, 24 Aug 2020 06:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bJWErSjc52UoeFEQkRSKVNZc4I4fzP79JfPH731UsnE=;
        b=hIRKJ6DwuWlq4T7J443eRGx9eUQOQpmSBxukbG0DEASvvZCedw8IslaCccGWQwrgEH
         AwyM2l8bp5YvoliWedJgPR8BeEOf2U6jZEymYy0EbBfl0DcjcRRUrKuFDjfOf37Bo+7t
         sAgToAIY+V8khaWFnLFupoSl+rpRRjtslV18QvZ/LQYpT6awykOdV05okqYHQMDlmjED
         i4/mFJrrChLk4k1+A4D995tsRp/OkbPDDRiE1q2zQ1Jb0NAD8B/V9qhnIJb7mMC/KfK1
         W36ZPIoVAB+j1iNs+eTQr+RKknPP8FB9tBN+IDYBxUbD9AsYdPmAmrcCENII0uwUIh/p
         ElZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bJWErSjc52UoeFEQkRSKVNZc4I4fzP79JfPH731UsnE=;
        b=jY/IvfBQaBYTHqAy3WZmTSnqpNV2NN3jydIFsrgt1rgnBIvOhcHh8gyPKs640VHZSN
         ICoi24BT/wAEmsa1XUBcIonVkPcY+aO/v+8bpv6SJmEUJ/pcOJKmkU4M17/Kt/Kvpu2d
         GQ1dXDMCJ3KXT+zqdy02gXcSJmzg3r4SKVYqQPaHd3uz3aOZw1E88IIQxuAR5T2cjsv1
         niAjHLHPNrMtykmHXAExru8xsUsQIvusM1meyafu/e8nV8l/IjwbxR8UyMFV38xZuZbr
         3M92Eze33yYGKcEJ3i2ieEBdNOhvUFYhZWZJI74p/IWAGTPaupEpSqSchYY/sUS8lsCb
         yDUA==
X-Gm-Message-State: AOAM533NOrzNeosgfB66l8ccO5i9QSTKRV5qpjx/8ZA7qmV5uerpVPNW
        5FUgpdjbazFNkvsaY0ApdHFq7D1BHAc=
X-Google-Smtp-Source: ABdhPJyA7A1wzwubY88LN31N076a3k8DDLbMDGL+gYps+op3jtU/0SREF3b1DM7mmJnf5VpAPEbh1w==
X-Received: by 2002:a50:ec90:: with SMTP id e16mr5442232edr.234.1598275137676;
        Mon, 24 Aug 2020 06:18:57 -0700 (PDT)
Received: from debianHome.localdomain (x4d01ad51.dyn.telefonica.de. [77.1.173.81])
        by smtp.gmail.com with ESMTPSA id p3sm9369834edx.75.2020.08.24.06.18.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2020 06:18:57 -0700 (PDT)
From:   =?UTF-8?q?Christian=20G=C3=B6ttsche?= <cgzones@googlemail.com>
To:     selinux@vger.kernel.org
Cc:     Mike Palmiotto <mike.palmiotto@crunchydata.com>
Subject: [PATCH 3/3] libselinux: initialize last_policyload in selinux_status_open()
Date:   Mon, 24 Aug 2020 15:18:41 +0200
Message-Id: <20200824131841.55687-3-cgzones@googlemail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200824131841.55687-1-cgzones@googlemail.com>
References: <20200824131841.55687-1-cgzones@googlemail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

If not initialized to the current policyload count, an enforcing change
will trigger policyload-callbacks in selinux_status_updated().

Signed-off-by: Christian Göttsche <cgzones@googlemail.com>
---
 libselinux/src/sestatus.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/libselinux/src/sestatus.c b/libselinux/src/sestatus.c
index 62a864b1..dcd7f2dc 100644
--- a/libselinux/src/sestatus.c
+++ b/libselinux/src/sestatus.c
@@ -289,6 +289,7 @@ int selinux_status_open(int fallback)
 	}
 	selinux_status_fd = fd;
 	last_seqno = (uint32_t)(-1);
+	sestatus_save_access(policyload, last_policyload);
 
 	/* No need to use avc threads if the kernel status page is available */
 	avc_using_threads = 0;
-- 
2.28.0

