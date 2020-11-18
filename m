Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B59662B7B30
	for <lists+selinux@lfdr.de>; Wed, 18 Nov 2020 11:25:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727468AbgKRKXu (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Wed, 18 Nov 2020 05:23:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33895 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725787AbgKRKXt (ORCPT
        <rfc822;selinux@vger.kernel.org>); Wed, 18 Nov 2020 05:23:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1605695028;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=KN+5HUvP+A8cHl8FssYWxNr+Y8vHNPdppniK1yZaF7I=;
        b=fkZWmiTG3xsNEaXntDjP5XfAmQo/wmmUW1/SySDlxQnGGPxeRIu4i2DeYd2lVo7OCrvER4
        YhTfA10JW1NXp/1K4vhPbAR0/pJ+GuQTURD7AnMtM+KBvbeSW9CgOgljzrgPOLgS+HKRQn
        50yS9rT1hDdGKhnYbsRqDWIpbt83N0I=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-465-m3ZAFyviP2yIojHKdNdwcw-1; Wed, 18 Nov 2020 05:23:46 -0500
X-MC-Unique: m3ZAFyviP2yIojHKdNdwcw-1
Received: by mail-wm1-f71.google.com with SMTP id q17so678694wmc.1
        for <selinux@vger.kernel.org>; Wed, 18 Nov 2020 02:23:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KN+5HUvP+A8cHl8FssYWxNr+Y8vHNPdppniK1yZaF7I=;
        b=a/fkuQ1B0VyHt6HgaP85UhQi6DCIFw3KM0EFkgmfJWAyCdvtAx4Snoy4qY6ywRc0nY
         WvOXMKr7tbKebB66e0MEud5PHQmM4knHLdyUD2fhedpOd4TYYVS4ePcr6cZKosuV13On
         IXHzAZLkOjb4y8k64jAA0XLMMaHXRfcvknmYOX0XMDgXKdd0kXddYxI+Qe0UsPR8yNuG
         9lZXJ35Pep7wnu4heN2o/T7n1W/z0OJ/gzJyiEQVGT4Qiz9RZRiqsQCJ7WeMps9BGKfS
         CmgGHUiPq9f0Nkb3SJSnu3piRgmCkLRrqODPTXZ3Z0hBiycnsoOA/4uv2oQH4U2HsFWt
         dFNQ==
X-Gm-Message-State: AOAM531jnfW68WpUkCjv1YoZQYzQheCsV5h5h/pCJyS3gBrGqkKgG/HI
        BDgeJC1AHJnsCL/8zsYhI50r27rOS5MX0YgD7P5KCmeYXconVLjnELrh6jq8VLvTEPhlXbLNsXM
        4u7ipI40KUDuuKFukxw==
X-Received: by 2002:adf:bb06:: with SMTP id r6mr3981298wrg.286.1605695025095;
        Wed, 18 Nov 2020 02:23:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyqSfm3c6hSSQi8nwMO35nbH3ss8MJuxoX0cI6MOjeBwOLrdBzI63FCbVBsLIR2tDA/rY4fVA==
X-Received: by 2002:adf:bb06:: with SMTP id r6mr3981283wrg.286.1605695024863;
        Wed, 18 Nov 2020 02:23:44 -0800 (PST)
Received: from omos.redhat.com ([2a02:8308:b103:4000:e83d:a4fb:e589:6902])
        by smtp.gmail.com with ESMTPSA id l13sm33879751wrm.24.2020.11.18.02.23.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2020 02:23:44 -0800 (PST)
From:   Ondrej Mosnacek <omosnace@redhat.com>
To:     linux-fsdevel@vger.kernel.org
Cc:     David Howells <dhowells@redhat.com>,
        Al Viro <viro@zeniv.linux.org.uk>, linux-btrfs@vger.kernel.org,
        linux-security-module@vger.kernel.org, selinux@vger.kernel.org,
        Paul Moore <paul@paul-moore.com>,
        Stephen Smalley <stephen.smalley.work@gmail.com>,
        Richard Haines <richard_c_haines@btinternet.com>
Subject: [PATCH] vfs: fix fsconfig(2) LSM mount option handling for btrfs
Date:   Wed, 18 Nov 2020 11:23:42 +0100
Message-Id: <20201118102342.154277-1-omosnace@redhat.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

When SELinux security options are passed to btrfs via fsconfig(2) rather
than via mount(2), the operation aborts with an error. What happens is
roughly this sequence:

1. vfs_parse_fs_param() eats away the LSM options and parses them into
   fc->security.
2. legacy_get_tree() finds nothing in ctx->legacy_data, passes this
   nothing to btrfs.
[here btrfs calls another layer of vfs_kern_mount(), but let's ignore
 that for simplicity]
3. btrfs calls security_sb_set_mnt_opts() with empty options.
4. vfs_get_tree() then calls its own security_sb_set_mnt_opts() with the
   options stashed in fc->security.
5. SELinux doesn't like that different options were used for the same
   superblock and returns -EINVAL.

In the case of mount(2), the options are parsed by
legacy_parse_monolithic(), which skips the eating away of security
opts because of the FS_BINARY_MOUNTDATA flag, so they are passed to the
FS via ctx->legacy_data. The second call to security_sb_set_mnt_opts()
(from vfs_get_tree()) now passes empty opts, but the non-empty -> empty
sequence is allowed by SELinux for the FS_BINARY_MOUNTDATA case.

It is a total mess, but the only sane fix for now seems to be to skip
processing the security opts in vfs_parse_fs_param() if the fc has
legacy opts set AND the fs specfies the FS_BINARY_MOUNTDATA flag. This
combination currently matches only btrfs and coda. For btrfs this fixes
the fsconfig(2) behavior, and for coda it makes setting security opts
via fsconfig(2) fail the same way as it would with mount(2) (because
FS_BINARY_MOUNTDATA filesystems are expected to call the mount opts LSM
hooks themselves, but coda never cared enough to do that). I believe
that is an acceptable state until both filesystems (or at least btrfs)
are converted to the new mount API (at which point btrfs won't need to
pretend it takes binary mount data any more and also won't need to call
the LSM hooks itself, assuming it will pass the fc->security information
properly).

Note that we can't skip LSM opts handling in vfs_parse_fs_param() solely
based on FS_BINARY_MOUNTDATA because that would break NFS.

See here for the original report and reproducer:
https://lore.kernel.org/selinux/c02674c970fa292610402aa866c4068772d9ad4e.camel@btinternet.com/

Reported-by: Richard Haines <richard_c_haines@btinternet.com>
Fixes: 3e1aeb00e6d1 ("vfs: Implement a filesystem superblock creation/configuration context")
Signed-off-by: Ondrej Mosnacek <omosnace@redhat.com>
---
 fs/fs_context.c | 28 ++++++++++++++++++++++------
 1 file changed, 22 insertions(+), 6 deletions(-)

diff --git a/fs/fs_context.c b/fs/fs_context.c
index 2834d1afa6e80..cfc5ee2e381ef 100644
--- a/fs/fs_context.c
+++ b/fs/fs_context.c
@@ -106,12 +106,28 @@ int vfs_parse_fs_param(struct fs_context *fc, struct fs_parameter *param)
 	if (ret != -ENOPARAM)
 		return ret;
 
-	ret = security_fs_context_parse_param(fc, param);
-	if (ret != -ENOPARAM)
-		/* Param belongs to the LSM or is disallowed by the LSM; so
-		 * don't pass to the FS.
-		 */
-		return ret;
+	/*
+	 * In the legacy+binary mode, skip the security_fs_context_parse_param()
+	 * call and let the legacy handler process also the security options.
+	 * It will format them into the monolithic string, where the FS can
+	 * process them (with FS_BINARY_MOUNTDATA it is expected to do it).
+	 *
+	 * Currently, this matches only btrfs and coda. Coda is broken with
+	 * fsconfig(2) anyway, because it does actually take binary data. Btrfs
+	 * only *pretends* to take binary data to work around the SELinux's
+	 * no-remount-with-different-options check, so this allows it to work
+	 * with fsconfig(2) properly.
+	 *
+	 * Once btrfs is ported to the new mount API, this hack can be reverted.
+	 */
+	if (fc->ops != &legacy_fs_context_ops || !(fc->fs_type->fs_flags & FS_BINARY_MOUNTDATA)) {
+		ret = security_fs_context_parse_param(fc, param);
+		if (ret != -ENOPARAM)
+			/* Param belongs to the LSM or is disallowed by the LSM;
+			 * so don't pass to the FS.
+			 */
+			return ret;
+	}
 
 	if (fc->ops->parse_param) {
 		ret = fc->ops->parse_param(fc, param);
-- 
2.26.2

