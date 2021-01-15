Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 306C32F82C8
	for <lists+selinux@lfdr.de>; Fri, 15 Jan 2021 18:46:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725923AbhAORp2 (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Fri, 15 Jan 2021 12:45:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51067 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725946AbhAORp2 (ORCPT
        <rfc822;selinux@vger.kernel.org>); Fri, 15 Jan 2021 12:45:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1610732641;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=Tyk+XUKuUhBpf0TcrmLm4g0VHSsyZ1b9KM+hnKhbYTs=;
        b=beZPka8RuNmQNJMzvXnHnGfkRH/cSAIkWRIP2Z8dbgrSQWdaHlsc3PyB0czX7iABbx704y
        Xw3ZygYMbuHT1CectEOePqdG2M4hTx2CmORFh4J9rcWy8bJpLXOWSFPem8iRxaoNzt5AHO
        8k19lv8J5JFRxgaWKDIToM8oK/v+Xvw=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-38-p0XTNzunP-iQdwNMgMlbSA-1; Fri, 15 Jan 2021 12:44:00 -0500
X-MC-Unique: p0XTNzunP-iQdwNMgMlbSA-1
Received: by mail-ej1-f72.google.com with SMTP id lw15so3886113ejb.7
        for <selinux@vger.kernel.org>; Fri, 15 Jan 2021 09:43:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Tyk+XUKuUhBpf0TcrmLm4g0VHSsyZ1b9KM+hnKhbYTs=;
        b=oS42ZnU2ywVXZ+dQn/+trjC6uhePxlMMxGrjGmbqcQjEZZeyJsaKXnSd66V8u27kcU
         z4vO9oS0J2X3Lv4slCHMNRpxkDSK8JyWzP8qe9rVJXU3fAHxaAVhOIQofA41gsY3v+qe
         MlQ31IA9JrCPPD2MJ96GFpR+wPcwqNQck/rhss9J2CcRwMMVK5wbS+FYhI7N++ZjV5cy
         G7tgebFq76UZtg6ENwkRpzyV3Bm/nPSGCUB45MRWqLUZrtG80uGYFCgI5s5TdSl0lGRa
         mXEfNxoadj0MdA55Uk+6lAoIK/PqF1ErgPteBV1njLzlXmNd4dtDppkdD7FLwRHJHY+o
         KIrQ==
X-Gm-Message-State: AOAM532ACpWyVI+BnizLdlUbNs9kRavxWzLDyqX+93arhPDfSfPr2XxQ
        5d40nZ+WkYGGDTmVsPoJXI+BGk/H4ROG47WteANpX7WIlZuIOXYTG7qyy+UNeHp7V9glRIRKdaR
        T3D1+F5vKBTs4q9EfmQ==
X-Received: by 2002:a17:906:af92:: with SMTP id mj18mr9287068ejb.290.1610732638696;
        Fri, 15 Jan 2021 09:43:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxsn0zz9t4rpo3MQAzVYHc7JsrMrRKrqprK3YStrjTRhLBmoPn8x51DJyxSYyEOp8bN2E1Hlg==
X-Received: by 2002:a17:906:af92:: with SMTP id mj18mr9287060ejb.290.1610732638474;
        Fri, 15 Jan 2021 09:43:58 -0800 (PST)
Received: from omos.redhat.com ([2a02:8308:b105:dd00:277b:6436:24db:9466])
        by smtp.gmail.com with ESMTPSA id g17sm4010343edb.39.2021.01.15.09.43.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jan 2021 09:43:57 -0800 (PST)
From:   Ondrej Mosnacek <omosnace@redhat.com>
To:     linux-nfs@vger.kernel.org,
        Trond Myklebust <trond.myklebust@hammerspace.com>,
        Anna Schumaker <anna.schumaker@netapp.com>
Cc:     linux-security-module@vger.kernel.org, selinux@vger.kernel.org,
        David Quigley <dpquigl@davequigley.com>
Subject: [PATCH] NFSv4.2: fix return value of _nfs4_get_security_label()
Date:   Fri, 15 Jan 2021 18:43:56 +0100
Message-Id: <20210115174356.408688-1-omosnace@redhat.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

An xattr 'get' handler is expected to return the length of the value on
success, yet _nfs4_get_security_label() (and consequently also
nfs4_xattr_get_nfs4_label(), which is used as an xattr handler) returns
just 0 on success.

Fix this by returning label.len instead, which contains the length of
the result.

Fixes: aa9c2669626c ("NFS: Client implementation of Labeled-NFS")
Signed-off-by: Ondrej Mosnacek <omosnace@redhat.com>
---
 fs/nfs/nfs4proc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/nfs/nfs4proc.c b/fs/nfs/nfs4proc.c
index 2f4679a62712a..28465d8aada64 100644
--- a/fs/nfs/nfs4proc.c
+++ b/fs/nfs/nfs4proc.c
@@ -5971,7 +5971,7 @@ static int _nfs4_get_security_label(struct inode *inode, void *buf,
 		return ret;
 	if (!(fattr.valid & NFS_ATTR_FATTR_V4_SECURITY_LABEL))
 		return -ENOENT;
-	return 0;
+	return label.len;
 }
 
 static int nfs4_get_security_label(struct inode *inode, void *buf,
-- 
2.29.2

