Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B1A31E50EC
	for <lists+selinux@lfdr.de>; Thu, 28 May 2020 00:07:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725880AbgE0WH4 (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Wed, 27 May 2020 18:07:56 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:43571 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725385AbgE0WH4 (ORCPT
        <rfc822;selinux@vger.kernel.org>); Wed, 27 May 2020 18:07:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1590617274;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=zNJpipoY+gQLxN3A3JBmzruP7Yeu37oVuRdd9q8XnRs=;
        b=JoJ1E/RFZ6KQsXrPfOzeHa/mWTGRpFB3bdJtJpj0C9sR2pdKCaAhJHvLvpOr5jGAYRbfFu
        SdEWCvBu9ZwYsc/ILwuBuSuhyYk8itMvFgk9o65hgxuTPc3wmKICFUnP+kQtWqhKYlYOji
        nnGfr+wONhlY/Xm895LGJE3H9fLP+TA=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-308-sIJaWUIRNLiRV-Q0tj41jw-1; Wed, 27 May 2020 18:07:49 -0400
X-MC-Unique: sIJaWUIRNLiRV-Q0tj41jw-1
Received: by mail-qk1-f197.google.com with SMTP id w14so885283qkb.0
        for <selinux@vger.kernel.org>; Wed, 27 May 2020 15:07:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zNJpipoY+gQLxN3A3JBmzruP7Yeu37oVuRdd9q8XnRs=;
        b=O0lqqRkP+7jB0M7uzJqL0ssNW1dbtEmhSNGI53xhJYfwKogoNkPJjwxOQKaUYbjJdg
         ZvcRowfKYDZxOQ6iq4D/eqWs2zHh+FOYcMM+32c3AeXD+rUhCWuIsHOpKVURngW4s9MT
         StQWhC8m2DpBz7vZUsvLpCb3jdMJu/B5Ngv3G8hNNqU4biWYKO1J8f6b18RfYAI6+yif
         +kN0ApzfxxaoN74l8LyH3ptviGLJxikopZZtJX4fXNuNz03/4gNqhMzRSSUhjb00Wv2/
         5HJogR+dX2e2gyjBtcLkGmdpjtiBCyTx2iJXruS90qe7Z4iWx6WHM2cRHyq0wvnxcbno
         xifg==
X-Gm-Message-State: AOAM533t12HtReOIZioSMmob5N7nQyFnjlklivQF0htEvBAmnWMUQiCP
        pJClu2uQlOgL5SwzUe4tK80K9EUmPFb8VRdb8KVDxywskrkQx4Qwl7Vz+iFC7NFB8XIQ4jGqLGy
        kAd4oFmiVUvZjolx2ig==
X-Received: by 2002:a37:8c45:: with SMTP id o66mr6271452qkd.392.1590617268663;
        Wed, 27 May 2020 15:07:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwMwWWZgeQqD6DtzxxheoHejT+JF59jzugxxIbnxreoSvmQErfp+3C3nEiMWUcCDdzWjITW3g==
X-Received: by 2002:a37:8c45:: with SMTP id o66mr6271423qkd.392.1590617268290;
        Wed, 27 May 2020 15:07:48 -0700 (PDT)
Received: from pet.redhat.com (107-190-106-186.cpe.teksavvy.com. [107.190.106.186])
        by smtp.gmail.com with ESMTPSA id a82sm3380256qkb.29.2020.05.27.15.07.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2020 15:07:47 -0700 (PDT)
From:   Jonathan Lebon <jlebon@redhat.com>
To:     selinux@vger.kernel.org
Cc:     Jonathan Lebon <jlebon@redhat.com>
Subject: [PATCH] selinux: allow reading labels before policy is loaded
Date:   Wed, 27 May 2020 18:06:54 -0400
Message-Id: <20200527220653.188794-1-jlebon@redhat.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

This patch does for `getxattr` what commit 3e3e24b42043 ("selinux: allow
labeling before policy is loaded") did for `setxattr`; it allows
querying the current SELinux label on disk before the policy is loaded.

One of the motivations described in that commit message also drives this
patch: for Fedora CoreOS (and eventually RHEL CoreOS), we want to be
able to move the root filesystem for example, from xfs to ext4 on RAID,
on first boot, at initrd time.[1]

Because such an operation works at the filesystem level, we need to be
able to read the SELinux labels first from the original root, and apply
them to the files of the new root. The previous commit enabled the
second part of this process; this commit enables the first part.

[1] https://github.com/coreos/fedora-coreos-tracker/issues/94

Signed-off-by: Jonathan Lebon <jlebon@redhat.com>
---
 security/selinux/hooks.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/security/selinux/hooks.c b/security/selinux/hooks.c
index 0b4e32161b7..a2caf6e2313 100644
--- a/security/selinux/hooks.c
+++ b/security/selinux/hooks.c
@@ -3334,7 +3334,11 @@ static int selinux_inode_getsecurity(struct inode *inode, const char *name, void
 	char *context = NULL;
 	struct inode_security_struct *isec;
 
-	if (strcmp(name, XATTR_SELINUX_SUFFIX))
+	/* If we're not initialized yet, then we can't validate contexts, so
+	 * just let vfs_getxattr fall back to using the on-disk xattr.
+	 */
+	if (!selinux_initialized(&selinux_state) ||
+	    strcmp(name, XATTR_SELINUX_SUFFIX))
 		return -EOPNOTSUPP;
 
 	/*
-- 
2.25.4

