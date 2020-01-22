Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8CC9E1458FA
	for <lists+selinux@lfdr.de>; Wed, 22 Jan 2020 16:47:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725868AbgAVPrF (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Wed, 22 Jan 2020 10:47:05 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:55985 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725924AbgAVPrF (ORCPT
        <rfc822;selinux@vger.kernel.org>); Wed, 22 Jan 2020 10:47:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1579708024;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=LYfRnkQJdMTx1mbzdd7g82oChTdJdhTvJ8PHrPBQXYE=;
        b=NmkSoyG35srm3EuFUZveo785NPZ82EedqKhVwclscc2xwQ49xVgyk12PKrUsp089smr5IT
        gA8O+ua7rBUNU/+SDIB/xCAO1kI6bE83Kjxi33XczMgeghImPylKo0OWBhPlGW96p4LX4X
        +BPARWmB4etRzCDIfQtRRGvw1ZncbjI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-43-mO4XHkb4PiWDFC2KSOoGAQ-1; Wed, 22 Jan 2020 10:47:01 -0500
X-MC-Unique: mO4XHkb4PiWDFC2KSOoGAQ-1
Received: by mail-wr1-f70.google.com with SMTP id f15so3297821wrr.2
        for <selinux@vger.kernel.org>; Wed, 22 Jan 2020 07:47:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LYfRnkQJdMTx1mbzdd7g82oChTdJdhTvJ8PHrPBQXYE=;
        b=kdh40lR2LykITynE+4AH0Up97VjElMp20GXQB/panydrnoQP8zxTVuItIfjBB6Fub6
         CwJbvA9RI6YoCMHvQLjK57CrzAMSYPu9TYpGawWnmyIcbvMZ41TzIgtrI5N+g1A0c89Q
         hdP4ALWu5f9/SeN8rLzc8QpEkTRgppbgPDtirsjbloiWt5+Wnqyba4GYKd5BawKQke3S
         TJD/c2FLuBe9gva/CSHrn5x1VkodtW5ttmKArfwTSoKDo6b5pN1NMaf0IdR7GkeDx+Ai
         qAT0Z8BOKqUk5AHRskepHryiJBNpxaVD+kB5yCtq0yYMRBExV+9RewJSFhjlTRwo0XTR
         TD/A==
X-Gm-Message-State: APjAAAXbeBDsUtZdgN/Vtwj7wFImjeVJ1MQ/HgiujRYNGK4AX4O6tWzr
        hm5y12PWFMJ7oQxuxT29ufMhHrHfy0W2XxFEfvPEGWRJC9K8vFD9OmjuCrix4TusdE9upp71GfC
        85KUWKx1U9NOrLVQdGA==
X-Received: by 2002:a1c:67c3:: with SMTP id b186mr3595316wmc.36.1579708020289;
        Wed, 22 Jan 2020 07:47:00 -0800 (PST)
X-Google-Smtp-Source: APXvYqydvImKur+0/nwMa05WNR2Frp23x6SbVj3dtJ77rAfQEnDgIzkj20cfnW0mnlC1JkTrzq8Xsg==
X-Received: by 2002:a1c:67c3:: with SMTP id b186mr3595306wmc.36.1579708020134;
        Wed, 22 Jan 2020 07:47:00 -0800 (PST)
Received: from omos.redhat.com (nat-pool-brq-t.redhat.com. [213.175.37.10])
        by smtp.gmail.com with ESMTPSA id c5sm4811788wmb.9.2020.01.22.07.46.59
        for <selinux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2020 07:46:59 -0800 (PST)
From:   Ondrej Mosnacek <omosnace@redhat.com>
To:     selinux@vger.kernel.org
Subject: [PATCH userspace 3/4] checkpolicy: remove unused te_assertions
Date:   Wed, 22 Jan 2020 16:46:54 +0100
Message-Id: <20200122154655.257233-4-omosnace@redhat.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200122154655.257233-1-omosnace@redhat.com>
References: <20200122154655.257233-1-omosnace@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

This variable is declared in a header file, but never defined or used.
Remove it.

Signed-off-by: Ondrej Mosnacek <omosnace@redhat.com>
---
 checkpolicy/checkpolicy.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/checkpolicy/checkpolicy.h b/checkpolicy/checkpolicy.h
index 3868f1fa..8fbc1b7d 100644
--- a/checkpolicy/checkpolicy.h
+++ b/checkpolicy/checkpolicy.h
@@ -13,8 +13,6 @@ typedef struct te_assert {
 	struct te_assert *next;
 } te_assert_t;
 
-te_assert_t *te_assertions;
-
 extern unsigned int policyvers;
 
 #endif
-- 
2.24.1

