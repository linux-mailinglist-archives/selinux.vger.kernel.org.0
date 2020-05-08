Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC7FB1CB3AD
	for <lists+selinux@lfdr.de>; Fri,  8 May 2020 17:42:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727777AbgEHPmV (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Fri, 8 May 2020 11:42:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727992AbgEHPmV (ORCPT
        <rfc822;selinux@vger.kernel.org>); Fri, 8 May 2020 11:42:21 -0400
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com [IPv6:2607:f8b0:4864:20::743])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2E83C05BD43
        for <selinux@vger.kernel.org>; Fri,  8 May 2020 08:42:20 -0700 (PDT)
Received: by mail-qk1-x743.google.com with SMTP id g185so1962853qke.7
        for <selinux@vger.kernel.org>; Fri, 08 May 2020 08:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kVo1mY/DMNLasz0Yg+FHeeNO9TG8+NKwfYFPYdCFNBI=;
        b=E7WLPng7q0rd3nVybkj53qoi5NgFNYfWDcty5m371O5rAJT7ErUXIjrx5w/smAINjh
         bp7dRzxIvNdr+mKkKFTzB2KqCe2en9HUTM6jxC2XBT2KSSMa7VWkj9UkJdFAKgKKjHf3
         Mz/yXWUkhnkgjAUUyvW4oZ5+QjOXMKhZ/tbiXL7xH+TlSdj7QdrMsWZt149X/2Qx4j7K
         4B1rPqGxemrw2XiTx5dad+dzU0SSqZbvqoJWR0j2BBK/4Tg7rxokyaw/CHdNswv+oQUP
         OR/ZXnihk30PSfNlA4vKt9uaSk5/+gpYOLZEZF4dPJvlzrdO/lFKC2IBNtP1DvVmIg//
         TI4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kVo1mY/DMNLasz0Yg+FHeeNO9TG8+NKwfYFPYdCFNBI=;
        b=G+ZBAILqeoXWV+c2/QgxD1cvSds++IXTwgNCsdGbKI1j57tE4pPVv0vm4/9OAsMQTu
         7CKlAV83gukVGoB/6HgOeUAYcY981oofMoNguZHNCbm9/Z2vR4+DGSJw75yvBt8p4hmi
         n03vFt3eKMIcuu865NsGoHrk3zKIDYZ3AHagSWKq+pOCa4hjXnLMqVJJmbBH0fFeuZ3y
         hOo7C5TwSOxE/8nSsbD+NdlS3wozwMmtZ2I3ol8X73q8QTe4pX76DkzCNQkKCNnx3V+p
         m4TGJIZNG5bOdiCHhuOxhLn9CTKlGLjkolm7UWeLD5BJWyN1qLvIfyL/0fR2kmaz+47J
         DO+Q==
X-Gm-Message-State: AGi0Pua81d+npwoUIFr+uk53oh4upXUZ7InCys3UW+Are5yUQhYm+4hp
        B8Dd0hKR0mdh8KghrAygXLFUauHB
X-Google-Smtp-Source: APiQypISyVwF5FCDkqvu8JrA3rzFZTbEpzImOj24ZpXZWG6+4evH9J6RpJZ0s01dYK2yT6w0Guq/SA==
X-Received: by 2002:a37:a7c8:: with SMTP id q191mr3354378qke.214.1588952539816;
        Fri, 08 May 2020 08:42:19 -0700 (PDT)
Received: from a-gady2p56i3do.evoforge.org (ec2-52-70-167-183.compute-1.amazonaws.com. [52.70.167.183])
        by smtp.gmail.com with ESMTPSA id g5sm309055qkl.114.2020.05.08.08.42.19
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 08 May 2020 08:42:19 -0700 (PDT)
From:   Stephen Smalley <stephen.smalley.work@gmail.com>
To:     selinux@vger.kernel.org
Cc:     omosnace@redhat.com, paul@paul-moore.com,
        Stephen Smalley <stephen.smalley.work@gmail.com>
Subject: [PATCH v4 testsuite 03/15] test_ibendport.te: use dev_rw_infiniband_mgmt_dev()
Date:   Fri,  8 May 2020 11:41:26 -0400
Message-Id: <20200508154138.24217-4-stephen.smalley.work@gmail.com>
X-Mailer: git-send-email 2.23.1
In-Reply-To: <20200508154138.24217-1-stephen.smalley.work@gmail.com>
References: <20200508154138.24217-1-stephen.smalley.work@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Switch the Infiniband test policy to use the appropriate policy
interface if defined rather than hardcoding a reference to the
type, neither of which exist in Debian policy.  Drop the dead
hardcoded reference on bin_t since it is no longer used anywhere
outside of an interface.

Signed-off-by: Stephen Smalley <stephen.smalley.work@gmail.com>
---
 policy/test_ibendport.te | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/policy/test_ibendport.te b/policy/test_ibendport.te
index 2a02c57..b909b4f 100644
--- a/policy/test_ibendport.te
+++ b/policy/test_ibendport.te
@@ -3,11 +3,6 @@
 # Policy for testing Infiniband Pkey access.
 #
 
-gen_require(`
-	type bin_t;
-	type infiniband_mgmt_device_t;
-')
-
 attribute ibendportdomain;
 
 # Domain for process.
@@ -27,7 +22,9 @@ dev_rw_sysfs(test_ibendport_manage_subnet_t)
 
 corecmd_bin_entry_type(test_ibendport_manage_subnet_t)
 
-allow test_ibendport_manage_subnet_t infiniband_mgmt_device_t:chr_file { read write open ioctl};
+ifdef(`dev_rw_infiniband_mgmt_dev', `
+dev_rw_infiniband_mgmt_dev(test_ibendport_manage_subnet_t)
+')
 
 ifdef(`corenet_ib_access_unlabeled_pkeys',`
 corenet_ib_access_unlabeled_pkeys(test_ibendport_manage_subnet_t)
-- 
2.23.1

