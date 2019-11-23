Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 38894107EEA
	for <lists+selinux@lfdr.de>; Sat, 23 Nov 2019 15:42:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726836AbfKWOmy (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Sat, 23 Nov 2019 09:42:54 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:51261 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726487AbfKWOmy (ORCPT
        <rfc822;selinux@vger.kernel.org>); Sat, 23 Nov 2019 09:42:54 -0500
Received: by mail-wm1-f66.google.com with SMTP id g206so10299257wme.1
        for <selinux@vger.kernel.org>; Sat, 23 Nov 2019 06:42:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JiN9ggkfIuVu0OGKess2DVy6m+d5mKdoKAeluR7GZDE=;
        b=Dwmqv1NrmFiEDhLDtQXiMHmYW/kEDlxsIk8PyuWA7OAD6R5QJ8uSkkaKoL/47m4rH3
         LAnUfIveyZqV2tZ4ANe+qPu/6ixWwaNVoES1423n5DQ36glUuhh28d+FYrJDrOQAzDL5
         MgDZ3vZdnl/FBUoDF/PEDH7hms3JGrt0GhPXQFFyxDX14EdByNwQa+W8Y5tKG1NBrWpl
         ZV359grvDOh1dmpbhyk6SWb0d8uXlTAQfmM2ll+bSCcsYnnLNzhyTP8o05vCnhBfd80Z
         Iyn3lvQY97w9/u0azu3w/fd2cd1zl6t+8mETSMBPIlCPrLcN9hfMyZOd49gtAQqT0XW/
         D4Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JiN9ggkfIuVu0OGKess2DVy6m+d5mKdoKAeluR7GZDE=;
        b=jj94xn680GAG49k71VpO45gJPSnVFELAa82/maw8XADN/4nDKlAUueiYeUW/9XhB1S
         H03W1DlzDf5e14fR0WEV4RgBh3fcOmUArPiezGzHDImx3vx5pk89fRj3e3SLqIEBuKDu
         Pp1I1ubPX80nO0u1XpkNJDcC49lW+i4fYzKfFA+vAOVKFlADWrOq2OnpXA4FF2vRQeql
         k5jt9Wpqxka9l/8TJrBKSjYJQOyRjTmSlymCxPi38pZ60pHllytQxYwv940prBO8w71I
         8uIFwsCJDgwxDh9YSHjR3R2+NeOw6ewPWWGRiZwSAKNgVtdthABVGPGdDPKg4Rbtzihp
         f4Jg==
X-Gm-Message-State: APjAAAUhrz1zoZO8IRFW7VwxE+hcFX62JqiX8nrMZ7v80HUp7KBU1Vk1
        06kOLJfoCwI5Tt6ArXgPHoV5Z6KS
X-Google-Smtp-Source: APXvYqzHPnZNKfqBuVJn6qazyq32rozKpYzAT3/nFzhhclUcUFRBXlnlSCt7iBWUWXy4IWYfpaM00Q==
X-Received: by 2002:a1c:7d01:: with SMTP id y1mr2688123wmc.157.1574520172044;
        Sat, 23 Nov 2019 06:42:52 -0800 (PST)
Received: from brutus.lan (brutus.defensec.nl. [2001:985:d55d::438])
        by smtp.gmail.com with ESMTPSA id o187sm2112090wmo.20.2019.11.23.06.42.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Nov 2019 06:42:51 -0800 (PST)
From:   Dominick Grift <dac.override@gmail.com>
To:     selinux@vger.kernel.org
Cc:     Dominick Grift <dac.override@gmail.com>
Subject: [RFC 1/3] libsemanage: fall back to valid "object_r" role instead of "user" prefix string
Date:   Sat, 23 Nov 2019 15:42:43 +0100
Message-Id: <20191123144245.3079306-2-dac.override@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191123144245.3079306-1-dac.override@gmail.com>
References: <20191123144245.3079306-1-dac.override@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

There are a few references to the "user" prefix that have to be changed to a valid role so that cil_resolve_userprefix can be made to validate the given role.
Fortunately object_r is alway's there. I do not like to hard-code identifiers but I see no other option.

Signed-off-by: Dominick Grift <dac.override@gmail.com>
---
 libsemanage/src/genhomedircon.c | 2 +-
 libsemanage/src/user_record.c   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/libsemanage/src/genhomedircon.c b/libsemanage/src/genhomedircon.c
index d08c88de..6a21223d 100644
--- a/libsemanage/src/genhomedircon.c
+++ b/libsemanage/src/genhomedircon.c
@@ -85,7 +85,7 @@
 #define TEMPLATE_USERID "%{USERID}"
 
 #define FALLBACK_SENAME "user_u"
-#define FALLBACK_PREFIX "user"
+#define FALLBACK_PREFIX "object_r"
 #define FALLBACK_LEVEL "s0"
 #define FALLBACK_NAME "[^/]+"
 #define FALLBACK_UIDGID "[0-9]+"
diff --git a/libsemanage/src/user_record.c b/libsemanage/src/user_record.c
index 45239250..91228eb8 100644
--- a/libsemanage/src/user_record.c
+++ b/libsemanage/src/user_record.c
@@ -240,7 +240,7 @@ int semanage_user_create(semanage_handle_t * handle,
 		goto err;
 
 	/* Initialize the prefix for migration purposes */
-	if (semanage_user_extra_set_prefix(handle, tmp_user->extra, "user") < 0)
+	if (semanage_user_extra_set_prefix(handle, tmp_user->extra, "object_r") < 0)
 		goto err;
 
 	*user_ptr = tmp_user;
@@ -349,7 +349,7 @@ hidden int semanage_user_join(semanage_handle_t * handle,
 		    < 0)
 			goto err;
 		if (semanage_user_extra_set_prefix
-		    (handle, tmp_user->extra, "user") < 0)
+		    (handle, tmp_user->extra, "object_r") < 0)
 			goto err;
 	}
 
-- 
2.24.0

