Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E545572749D
	for <lists+selinux@lfdr.de>; Thu,  8 Jun 2023 03:53:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232060AbjFHBxk (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Wed, 7 Jun 2023 21:53:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229454AbjFHBxj (ORCPT
        <rfc822;selinux@vger.kernel.org>); Wed, 7 Jun 2023 21:53:39 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 417ED2680
        for <selinux@vger.kernel.org>; Wed,  7 Jun 2023 18:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686189176;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=X/XJvCQ422I/WYtUCWDKieLvXugOS8ab+Zzy4zkAj+0=;
        b=DpCLd7JIKukSMKwxzI9XcVAR4+tREFcXdObaGcMbZVIBiaQAi32Zr0FQogu41p4POZoNnM
        QRAUv5HZknJiplx8BA6tshusi5QZ6RfeIe7op8Wt9qHEvKTn+82eJBEGSICfhlkCt6uPZ6
        T64JktqyE1VdkZIuaGoRtRT9Z28bukk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-626-mhsWc_UjPeWmkoYtYZk3XQ-1; Wed, 07 Jun 2023 21:52:54 -0400
X-MC-Unique: mhsWc_UjPeWmkoYtYZk3XQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8FCD2811E7C
        for <selinux@vger.kernel.org>; Thu,  8 Jun 2023 01:52:54 +0000 (UTC)
Received: from dev64.localdomain.com (unknown [10.64.240.9])
        by smtp.corp.redhat.com (Postfix) with ESMTP id DC5A9477F61;
        Thu,  8 Jun 2023 01:52:53 +0000 (UTC)
From:   Masatake YAMATO <yamato@redhat.com>
To:     selinux@vger.kernel.org
Cc:     yamato@redhat.com
Subject: [PATCH 2/4] dispol: delete an unnecessary empty line
Date:   Thu,  8 Jun 2023 10:52:39 +0900
Message-Id: <20230608015241.2454912-2-yamato@redhat.com>
In-Reply-To: <20230608015241.2454912-1-yamato@redhat.com>
References: <20230608015241.2454912-1-yamato@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Signed-off-by: Masatake YAMATO <yamato@redhat.com>
---
 checkpolicy/test/dispol.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/checkpolicy/test/dispol.c b/checkpolicy/test/dispol.c
index 50027e40..e0748e90 100644
--- a/checkpolicy/test/dispol.c
+++ b/checkpolicy/test/dispol.c
@@ -1,4 +1,3 @@
-
 /* Authors: Frank Mayer <mayerf@tresys.com> and Karl MacMillan <kmacmillan@tresys.com>
  *
  * Copyright (C) 2003 Tresys Technology, LLC
-- 
2.40.1

