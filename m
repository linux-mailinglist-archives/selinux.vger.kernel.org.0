Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4ECCB36A0D4
	for <lists+selinux@lfdr.de>; Sat, 24 Apr 2021 13:18:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231665AbhDXLSy (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Sat, 24 Apr 2021 07:18:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231490AbhDXLSx (ORCPT
        <rfc822;selinux@vger.kernel.org>); Sat, 24 Apr 2021 07:18:53 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB617C061574;
        Sat, 24 Apr 2021 04:18:13 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id j6-20020a17090adc86b02900cbfe6f2c96so2642465pjv.1;
        Sat, 24 Apr 2021 04:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=c5D467EjUrL3DZxzh5hff+LlbgHJxoTGzshACk+bFsU=;
        b=hgbXm/QQDi9i27vr93N0nUt6Ru9QS1/G+w+nFQ/OtRDTX48qNPL2ZUEiMejii7VxmT
         RrMgKOXJaZh0Q7Hc04o3qKOCUSzMvbo8+vGCmo6uPxecKCoE77MuZ58LJ5OLJrrCoAm3
         f7d7HTWJ1gg6ElL5rS5BOYbLbT/AyteYhbrkOCRh6AeHLtpVYu8B5Zc4hCmktBkakAjF
         ztGY9aGKdv1vF3Vt203DiYTxzHaEV56GxjopfpJB0nyVujsO0rJ7prcLKaDYOOiFBdC9
         C5j6vCIUjJZsNXiGUpwl6z76G7ZUF2BruhwX4zsCU2rl96mEMpmCXlU0Lq6oz8X+puzu
         ZEhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=c5D467EjUrL3DZxzh5hff+LlbgHJxoTGzshACk+bFsU=;
        b=r/QJRRI08pAyvp46Nn5viSoZEGM5XGyWFd9I3cG3Fn1M5ufs5i/5YFY6/QBOI07Hiz
         gjH+IThhMnJeT9ky9pTFjCgCbHakVu9hwnANJR5KMQtmveWTm3VBxhFlGEUmat97yewt
         waJ8NBBIwpGZnF079J5Ot9D4V1m+XKXlGnJORgJ9ZfkTSMsJ5ufZgnGQeTy3vwu77hWR
         x6vMa+9E4wTJ7vimwm7He8KohxwfDmojQn+w3tKPXxgRq/xxyzHQk5xyC/zLWeht01Ct
         1UAYW3nBZjVSZQVrTaUJU2WH5DiUHbmUhJTGEUFYms9PagLzdI3ClcyltzoYUVenMbrq
         hyFg==
X-Gm-Message-State: AOAM5310bmApmKzZ3f4CKDKH3RzpGOxXPV/E8t7qWjlaUD0q9WB64eJd
        C9OB7HrRJU6lqESt6Y3MVQI=
X-Google-Smtp-Source: ABdhPJynSBPkMwpKCpf6OvHgJGWEiLCM4k7nOJdIFTd2nQq2sELu5jBSq9jgziV7Q5dRuN05pTjoBQ==
X-Received: by 2002:a17:90a:1b62:: with SMTP id q89mr11344828pjq.54.1619263093163;
        Sat, 24 Apr 2021 04:18:13 -0700 (PDT)
Received: from localhost.localdomain ([49.37.81.172])
        by smtp.gmail.com with ESMTPSA id ne22sm10023280pjb.5.2021.04.24.04.18.10
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 24 Apr 2021 04:18:12 -0700 (PDT)
From:   Souptick Joarder <jrdr.linux@gmail.com>
To:     paul@paul-moore.com, stephen.smalley.work@gmail.com,
        eparis@parisplace.org
Cc:     selinux@vger.kernel.org, linux-kernel@vger.kernel.org,
        Souptick Joarder <jrdr.linux@gmail.com>
Subject: [PATCH] selinux: Corrected comment to match kernel-doc comment
Date:   Sat, 24 Apr 2021 16:48:05 +0530
Message-Id: <1619263085-5047-1-git-send-email-jrdr.linux@gmail.com>
X-Mailer: git-send-email 1.9.1
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Kernel test robot throws below warning ->

security/selinux/avc.c:822: warning: This comment starts with '/**', but
isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst

Updated the comment to align with kernel-doc comment.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Souptick Joarder <jrdr.linux@gmail.com>
---
 security/selinux/avc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/security/selinux/avc.c b/security/selinux/avc.c
index ad451cf..04a886b 100644
--- a/security/selinux/avc.c
+++ b/security/selinux/avc.c
@@ -818,7 +818,7 @@ int __init avc_add_callback(int (*callback)(u32 event), u32 events)
 	return rc;
 }
 
-/**
+/*
  * avc_update_node Update an AVC entry
  * @event : Updating event
  * @perms : Permission mask bits
-- 
1.9.1

