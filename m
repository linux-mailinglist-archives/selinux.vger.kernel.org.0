Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 31606697D05
	for <lists+selinux@lfdr.de>; Wed, 15 Feb 2023 14:19:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234230AbjBONTY (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Wed, 15 Feb 2023 08:19:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234214AbjBONTP (ORCPT
        <rfc822;selinux@vger.kernel.org>); Wed, 15 Feb 2023 08:19:15 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0B701B335
        for <selinux@vger.kernel.org>; Wed, 15 Feb 2023 05:18:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1676467091;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=GNRAJRBJk78AMaY6LlG/1w5pM2z+pgxQDuRTg4kTHH0=;
        b=FxlL2Sx6/AqRcwO0kC8JNN50hePqfBFQB7VXOcPHumt7Rt3RXnIe7Y4wxt0ZHl1SO7U84u
        JeUp8YX+FGutWVre9WIGBCKItBOhtD0pHWpSgkdYpKsAmWZap9grz/wb7pDOnjDe5e3pfg
        VruDC+qDsGXnmqD/9bSp33qttbszkq8=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-408-mA3DEoh3NhK25Y15FtcG0A-1; Wed, 15 Feb 2023 08:18:10 -0500
X-MC-Unique: mA3DEoh3NhK25Y15FtcG0A-1
Received: by mail-ej1-f72.google.com with SMTP id 19-20020a170906309300b008b14b9cb779so497763ejv.6
        for <selinux@vger.kernel.org>; Wed, 15 Feb 2023 05:18:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GNRAJRBJk78AMaY6LlG/1w5pM2z+pgxQDuRTg4kTHH0=;
        b=ZXnkMVLcPv46ll9CNPztlJmwayE9xt48NgwJyI/wNPIJ/1njIbNRDr2eQG1C21LkyX
         7D0daYVlABJ2XEa1FnA7wyCKVYdmNVqIhUzTH5WK50Qb22ix/Zy84ifmzDhttQ3RUD3S
         gxOBGyFGg8jP9Cr6I/rYQAarJyVQpnKst8/wHGUmXq59JEeYR9J0e8hRZgN4oJzUeCZJ
         TQVqCls+jB6FpAL1p2Mq/RN47ibYHINEVTY1yS9C4qffQu/g12M0jY52oI76e5S6ax9n
         8RayXhUwiu7wgO8stwHHn+osiaf46/jdeVWCzGrdGrv5s9gXPOYy8WebGwUcMdQapfiE
         KyUA==
X-Gm-Message-State: AO0yUKVkGhnYGU1o/ehK+kI2fOOeZ8eujeFHQ9x7D4au8WLgr0Ta+PXS
        1CtE6HUbry6atIgvjZKGQyvPqwzwbQ14qmu0Cp8MB1whYtDV1kiJn/+YhaC+Pr406gJhed7x6Ww
        ZWAH4y5KQwutI7/AlgPYLBAaREg==
X-Received: by 2002:a17:906:8306:b0:8b1:1f2d:ecf1 with SMTP id j6-20020a170906830600b008b11f2decf1mr2014793ejx.67.1676467089433;
        Wed, 15 Feb 2023 05:18:09 -0800 (PST)
X-Google-Smtp-Source: AK7set8KlViSY3Z6xGJ6y8G+OxoXecpesAwBikFFZKOpNWQbGo6ZdFQcN2Po50SGN4gTW6bGcum1DA==
X-Received: by 2002:a17:906:8306:b0:8b1:1f2d:ecf1 with SMTP id j6-20020a170906830600b008b11f2decf1mr2014779ejx.67.1676467089220;
        Wed, 15 Feb 2023 05:18:09 -0800 (PST)
Received: from localhost.localdomain (nat-pool-brq-t.redhat.com. [213.175.37.10])
        by smtp.gmail.com with ESMTPSA id w8-20020a50c448000000b0049668426aa6sm9438241edf.24.2023.02.15.05.18.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Feb 2023 05:18:08 -0800 (PST)
From:   Ondrej Mosnacek <omosnace@redhat.com>
To:     "Eric W. Biederman" <ebiederm@xmission.com>,
        Andrew Morton <akpm@linux-foundation.org>
Cc:     linux-security-module@vger.kernel.org, selinux@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] kernel/sys.c: fix and improve control flow in __sys_setres[ug]id()
Date:   Wed, 15 Feb 2023 14:18:07 +0100
Message-Id: <20230215131807.293556-1-omosnace@redhat.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

1. First determine if CAP_SET[UG]ID is required and only then call
   ns_capable_setid(), to avoid bogus LSM (SELinux) denials.
2. Do the capability check before prepare_creds() as an optimization.
3. Check for a no-op early as an optimization.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Ondrej Mosnacek <omosnace@redhat.com>
---
 kernel/sys.c | 69 ++++++++++++++++++++++++++++++----------------------
 1 file changed, 40 insertions(+), 29 deletions(-)

diff --git a/kernel/sys.c b/kernel/sys.c
index 5fd54bf0e8867..6fd88686cd06f 100644
--- a/kernel/sys.c
+++ b/kernel/sys.c
@@ -664,6 +664,7 @@ long __sys_setresuid(uid_t ruid, uid_t euid, uid_t suid)
 	struct cred *new;
 	int retval;
 	kuid_t kruid, keuid, ksuid;
+	bool ruid_new, euid_new, suid_new;
 
 	kruid = make_kuid(ns, ruid);
 	keuid = make_kuid(ns, euid);
@@ -678,25 +679,29 @@ long __sys_setresuid(uid_t ruid, uid_t euid, uid_t suid)
 	if ((suid != (uid_t) -1) && !uid_valid(ksuid))
 		return -EINVAL;
 
+	old = current_cred();
+
+	/* check for no-op */
+	if ((ruid == (uid_t) -1 || uid_eq(kruid, old->uid)) &&
+	    (euid == (uid_t) -1 || (uid_eq(keuid, old->euid) &&
+				    uid_eq(keuid, old->fsuid))) &&
+	    (suid == (uid_t) -1 || uid_eq(ksuid, old->suid)))
+		return 0;
+
+	ruid_new = ruid != (uid_t) -1        && !uid_eq(kruid, old->uid) &&
+		   !uid_eq(kruid, old->euid) && !uid_eq(kruid, old->suid);
+	euid_new = euid != (uid_t) -1        && !uid_eq(keuid, old->uid) &&
+		   !uid_eq(keuid, old->euid) && !uid_eq(keuid, old->suid);
+	suid_new = suid != (uid_t) -1        && !uid_eq(ksuid, old->uid) &&
+		   !uid_eq(ksuid, old->euid) && !uid_eq(ksuid, old->suid);
+	if ((ruid_new || euid_new || suid_new) &&
+	    !ns_capable_setid(old->user_ns, CAP_SETUID))
+		return -EPERM;
+
 	new = prepare_creds();
 	if (!new)
 		return -ENOMEM;
 
-	old = current_cred();
-
-	retval = -EPERM;
-	if (!ns_capable_setid(old->user_ns, CAP_SETUID)) {
-		if (ruid != (uid_t) -1        && !uid_eq(kruid, old->uid) &&
-		    !uid_eq(kruid, old->euid) && !uid_eq(kruid, old->suid))
-			goto error;
-		if (euid != (uid_t) -1        && !uid_eq(keuid, old->uid) &&
-		    !uid_eq(keuid, old->euid) && !uid_eq(keuid, old->suid))
-			goto error;
-		if (suid != (uid_t) -1        && !uid_eq(ksuid, old->uid) &&
-		    !uid_eq(ksuid, old->euid) && !uid_eq(ksuid, old->suid))
-			goto error;
-	}
-
 	if (ruid != (uid_t) -1) {
 		new->uid = kruid;
 		if (!uid_eq(kruid, old->uid)) {
@@ -761,6 +766,7 @@ long __sys_setresgid(gid_t rgid, gid_t egid, gid_t sgid)
 	struct cred *new;
 	int retval;
 	kgid_t krgid, kegid, ksgid;
+	bool rgid_new, egid_new, sgid_new;
 
 	krgid = make_kgid(ns, rgid);
 	kegid = make_kgid(ns, egid);
@@ -773,23 +779,28 @@ long __sys_setresgid(gid_t rgid, gid_t egid, gid_t sgid)
 	if ((sgid != (gid_t) -1) && !gid_valid(ksgid))
 		return -EINVAL;
 
+	old = current_cred();
+
+	/* check for no-op */
+	if ((rgid == (gid_t) -1 || gid_eq(krgid, old->gid)) &&
+	    (egid == (gid_t) -1 || (gid_eq(kegid, old->egid) &&
+				    gid_eq(kegid, old->fsgid))) &&
+	    (sgid == (gid_t) -1 || gid_eq(ksgid, old->sgid)))
+		return 0;
+
+	rgid_new = rgid != (gid_t) -1        && !gid_eq(krgid, old->gid) &&
+		   !gid_eq(krgid, old->egid) && !gid_eq(krgid, old->sgid);
+	egid_new = egid != (gid_t) -1        && !gid_eq(kegid, old->gid) &&
+		   !gid_eq(kegid, old->egid) && !gid_eq(kegid, old->sgid);
+	sgid_new = sgid != (gid_t) -1        && !gid_eq(ksgid, old->gid) &&
+		   !gid_eq(ksgid, old->egid) && !gid_eq(ksgid, old->sgid);
+	if ((rgid_new || egid_new || sgid_new) &&
+	    !ns_capable_setid(old->user_ns, CAP_SETGID))
+		return -EPERM;
+
 	new = prepare_creds();
 	if (!new)
 		return -ENOMEM;
-	old = current_cred();
-
-	retval = -EPERM;
-	if (!ns_capable_setid(old->user_ns, CAP_SETGID)) {
-		if (rgid != (gid_t) -1        && !gid_eq(krgid, old->gid) &&
-		    !gid_eq(krgid, old->egid) && !gid_eq(krgid, old->sgid))
-			goto error;
-		if (egid != (gid_t) -1        && !gid_eq(kegid, old->gid) &&
-		    !gid_eq(kegid, old->egid) && !gid_eq(kegid, old->sgid))
-			goto error;
-		if (sgid != (gid_t) -1        && !gid_eq(ksgid, old->gid) &&
-		    !gid_eq(ksgid, old->egid) && !gid_eq(ksgid, old->sgid))
-			goto error;
-	}
 
 	if (rgid != (gid_t) -1)
 		new->gid = krgid;
-- 
2.39.1

