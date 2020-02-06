Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F0DF5154DCA
	for <lists+selinux@lfdr.de>; Thu,  6 Feb 2020 22:17:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727542AbgBFVRX (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Thu, 6 Feb 2020 16:17:23 -0500
Received: from mail-pg1-f201.google.com ([209.85.215.201]:44450 "EHLO
        mail-pg1-f201.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726765AbgBFVRX (ORCPT
        <rfc822;selinux@vger.kernel.org>); Thu, 6 Feb 2020 16:17:23 -0500
Received: by mail-pg1-f201.google.com with SMTP id o21so137781pgm.11
        for <selinux@vger.kernel.org>; Thu, 06 Feb 2020 13:17:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=6zFcQXxOd0AoSDoUqg6z5isQ/0sW7jX3LPLgTPoylbY=;
        b=vP4Bf8wHbtqzl59NmCRJTaPR2n5wX4ZSrXrJNID22SE8DI55UfIBhBJh3luYclTmHA
         6e1aPnCGZt9aluu6/yuB4QOEGRi/vd75bY80CqYK3NRmimEjHTd44VL3InyfFxAtRbWr
         Nppf17834U0//WH8jjkqkffz9CpSvfJF+l2cXIm6iUbiIME2GoY9N1rbEKsmaHTyOYRU
         TWkJVCvaFoHovqGTp/ssYzmB2KYd3cRJRpIbl8BFSxCOgriT7scP7xKCnjCZvzv4VyWo
         nKLuBdDmjP7JKyEGSVXIE8rBuHZzDdY7BVR5GAiYJ40PBmjje8DTZ0j1t60/jJN4wh1F
         BxuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=6zFcQXxOd0AoSDoUqg6z5isQ/0sW7jX3LPLgTPoylbY=;
        b=JYK6WHOUn+/bCTGEV0s4lImpl2xpoDmGL32Tz01MAr+F3vGoBv+/DX0KoXiZ0Xks3J
         0JSLltpaxJIpLMBju2OWWQwirrE3v0KjbwyGI7BL2Ff0bGCakILiXeExQXZpt7ogdZP9
         9fsjOjkXqpUXzuM8+sl+cUKdH+TGoCGa9UfRqpbvupvdV0bFIFTFeLOGB3oAGF8yB8PH
         HP8lE/U0VGjbPVSWo6Oj7bstfZW4JcRuf7wWSOgLoejgOAOcWCuL3gddxLpMndHRJ9ab
         S5JoZQdXC6fMUE14NpcG1sLMJCIF/AiK3eccVn2nOmHnApscpsSpCQ+OwWZ2O2dS3flO
         sqBw==
X-Gm-Message-State: APjAAAUitSEbnaCYzcyiknHGJ0833ZqRgopuFqeT6ZsR9FC/4DT4GvEm
        WWPT+s8OvfBQoDo2o1THzB7DRYRMQVUm/Uw=
X-Google-Smtp-Source: APXvYqzPVS9brXynVC6CJDUEfyYzzmFRTdnK/23UvbznArAKwqWH9tbV7OeVpsvavmtAlSJC0jjyrYSMAAOSKRo=
X-Received: by 2002:a63:381a:: with SMTP id f26mr6083736pga.40.1581023841400;
 Thu, 06 Feb 2020 13:17:21 -0800 (PST)
Date:   Thu,  6 Feb 2020 13:14:31 -0800
Message-Id: <20200206211430.150615-1-smoreland@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
Subject: [PATCH v2] security: selinux: allow per-file labeling for bpffs
From:   Steven Moreland <smoreland@google.com>
To:     paul@paul-moore.com, sds@tycho.nsa.gov, eparis@parisplace.org,
        keescook@chromium.org, anton@enomsg.org, ccross@android.com,
        tony.luck@intel.com, selinux@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-team@android.com
Cc:     "Connor O'Brien" <connoro@google.com>,
        Steven Moreland <smoreland@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

From: Connor O'Brien <connoro@google.com>

Add support for genfscon per-file labeling of bpffs files. This allows
for separate permissions for different pinned bpf objects, which may
be completely unrelated to each other.

Signed-off-by: Connor O'Brien <connoro@google.com>
Signed-off-by: Steven Moreland <smoreland@google.com>
---
 security/selinux/hooks.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/security/selinux/hooks.c b/security/selinux/hooks.c
index 116b4d644f68..d7b11188dc8d 100644
--- a/security/selinux/hooks.c
+++ b/security/selinux/hooks.c
@@ -750,7 +750,8 @@ static int selinux_set_mnt_opts(struct super_block *sb,
 	if (strcmp(sb->s_type->name, "proc") == 0)
 		sbsec->flags |= SE_SBPROC | SE_SBGENFS;
 
-	if (!strcmp(sb->s_type->name, "debugfs") ||
+	if (!strcmp(sb->s_type->name, "bpf") ||
+	    !strcmp(sb->s_type->name, "debugfs") ||
 	    !strcmp(sb->s_type->name, "tracefs") ||
 	    !strcmp(sb->s_type->name, "pstore"))
 		sbsec->flags |= SE_SBGENFS;
-- 
2.25.0.341.g760bfbb309-goog

v1 -> v2
- Rebased to be on upstream selinux tree
- Removed Android specific 'Change-Id'

