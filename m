Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32F9C1C1E10
	for <lists+selinux@lfdr.de>; Fri,  1 May 2020 21:51:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726405AbgEATvU (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Fri, 1 May 2020 15:51:20 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:58634 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726377AbgEATvT (ORCPT
        <rfc822;selinux@vger.kernel.org>); Fri, 1 May 2020 15:51:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1588362678;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=s4R8huL+DY5qznfGLFwoyRq/hVfJS/ePnuccb29e8DE=;
        b=V7pLVP1BaqU9VNh/69d9SpIdnLc7guR2RJU/2kwtYrOrkvFybw/2KWjIMNXSFZdHBjLVXU
        47DbJI9BonZSOg1zFeVVf86Y+JG2ec1uwhMtMkp+q/pFDBx0M8StF1GGbsqlCmmBmAs2iS
        Nss/hWpJAPYX/+S0ETcwAtUXN9QTjOg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-202-AGxpRuKTM6W4mCblg0brtA-1; Fri, 01 May 2020 15:51:16 -0400
X-MC-Unique: AGxpRuKTM6W4mCblg0brtA-1
Received: by mail-wm1-f71.google.com with SMTP id v185so361932wmg.0
        for <selinux@vger.kernel.org>; Fri, 01 May 2020 12:51:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=s4R8huL+DY5qznfGLFwoyRq/hVfJS/ePnuccb29e8DE=;
        b=VQR3tDCMhohIsPIGEv4mR8inu/rhBmLrGajBN3w6EZHWP3+budhFZhaOL5gnFoiB3j
         wqjk7deWOjIsg3cx7PCt56AjW9y8+NQGxyZ+wnz2XqVKH0NYoc0Ng5M5kmw9PGyklN64
         agHt4NITYpnhlxD11OxCkrrUdl00E42Zpm00+mg5f5gWWvu81AJEX1I2sx9hp8Wg+/98
         /IP/2wJsXh30MXuF7YPCYBdcFXwZwHjkKKEigQlfxfXS5B1/cGbMZb/1D5h4BIu+3Ifk
         kNlLNTlS8vvnbyje2BoTYeM7MO6XnKCNHL/CpvZMp+CbpwCN41UbuF2Ef3af1KyMWa77
         ISfA==
X-Gm-Message-State: AGi0Pubnl6Zd2tD4VNEHVhvu403AExY51bNR6R2a3fvuE6H13Zf0fcmY
        rNl4VDj1a4Sn87/JUByAa2z8i4UbYhoKDrZoHqCAmtiHzCwcNJ/CTiLo2SF2QXeVhsODMFgZB3z
        nrCevVW9IgCb+bGfKiQ==
X-Received: by 2002:a5d:4ac9:: with SMTP id y9mr6124290wrs.182.1588362674736;
        Fri, 01 May 2020 12:51:14 -0700 (PDT)
X-Google-Smtp-Source: APiQypIMCIpphYfLtabnfC9Vtc0kottgVu4tSaFbbsFwtCh4oI2U+BWXjlBIgI3gifvTl8FRreaGTQ==
X-Received: by 2002:a5d:4ac9:: with SMTP id y9mr6124263wrs.182.1588362674467;
        Fri, 01 May 2020 12:51:14 -0700 (PDT)
Received: from omos.redhat.com ([2a02:8308:b13f:2100:f695:3ae5:c8bf:2f57])
        by smtp.gmail.com with ESMTPSA id h137sm1034348wme.0.2020.05.01.12.51.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2020 12:51:13 -0700 (PDT)
From:   Ondrej Mosnacek <omosnace@redhat.com>
To:     selinux@vger.kernel.org, Paul Moore <paul@paul-moore.com>
Cc:     Wei Yongjun <weiyongjun1@huawei.com>,
        kernel-janitors@vger.kernel.org,
        Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH] selinux: fix return value on error in policydb_read()
Date:   Fri,  1 May 2020 21:51:11 +0200
Message-Id: <20200501195111.3335258-1-omosnace@redhat.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

The value of rc is still zero from the last assignment when the error
path is taken. Fix it by setting it to -ENOMEM before the
hashtab_create() call.

Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Fixes: e67b2ec9f617 ("selinux: store role transitions in a hash table")
Signed-off-by: Ondrej Mosnacek <omosnace@redhat.com>
---
 security/selinux/ss/policydb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/security/selinux/ss/policydb.c b/security/selinux/ss/policydb.c
index 1c0041576643..9f7ce3e037d1 100644
--- a/security/selinux/ss/policydb.c
+++ b/security/selinux/ss/policydb.c
@@ -2540,6 +2540,7 @@ int policydb_read(struct policydb *p, void *fp)
 		goto bad;
 	nel = le32_to_cpu(buf[0]);
 
+	rc = -ENOMEM;
 	p->role_tr = hashtab_create(role_trans_hash, role_trans_cmp, nel);
 	if (!p->role_tr)
 		goto bad;
-- 
2.25.4

