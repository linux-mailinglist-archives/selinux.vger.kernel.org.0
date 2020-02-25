Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F4A016EFA2
	for <lists+selinux@lfdr.de>; Tue, 25 Feb 2020 21:02:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731690AbgBYUCt (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Tue, 25 Feb 2020 15:02:49 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:43787 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731702AbgBYUCs (ORCPT
        <rfc822;selinux@vger.kernel.org>); Tue, 25 Feb 2020 15:02:48 -0500
Received: by mail-pl1-f194.google.com with SMTP id p11so233354plq.10
        for <selinux@vger.kernel.org>; Tue, 25 Feb 2020 12:02:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=pc/+g3osm/weoUsazCj+HpjXMuRGJTtyWnawdWS70NE=;
        b=CrnOp0KCAw/HlN9PuTXrao+qW5NUbs7z36g9b1ZZjIjWmVNgoZ992GxiQce9O+pjlP
         vvoud/f/pjHXhCoL+7jFPZ4Eb+MSVjNPTe6EZbh/Bz5Z3HFQr/ocLHTGYWGqqmDNcTei
         cZBpGvQFrgyWL2K9qZb7/xEyhINw55R/hhDnZq0/fbGaKpDhW32uvjgjvwhAMp5hbv3R
         L8Q0Sv59Isqmd4ktj12TJyu8Q9oDYav4RIkSeB6zAkFd20z54wevu9ynnr0hA3iW2OH1
         JV26HTlZMULgDbxMS8XWgvLeP1Z5oMre9nLuLR8uXf0utFQq2lL8rjxBal8rclR83TGW
         wYRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=pc/+g3osm/weoUsazCj+HpjXMuRGJTtyWnawdWS70NE=;
        b=CjbqBRhixP4dgvFLsUpDiD2Pki1ioCr7ToWKl7ktzWg/81icPHnuoW950jfltuOpHS
         fxOLaer1L0e/pLq5646ysuL3pVoo/M6HGcWhGaCY6/ZUY4z8jzF0MC5mLcYYyxU44Fud
         pRgKKU7JTi1oN8IjPQsZi11HM4VWHO90lq3xOOGWRLn9hxIn5twHdGrvSvpG3+tIUfKF
         Ib2ESzkHClw/+3fBNisFpxH4Dhne3KyXQ6zrSBW2adgl0zMIcLoX0Hfkkeu4lReXNAgm
         KSo9o3JYg1B+WMphH7mDYbknJ33ETA5o+4QO3WFSmhK0hz+DeDx+1a37ceHeJZVpnCUY
         g7UA==
X-Gm-Message-State: APjAAAVAakUFwMlajdtewOy69VXSTr/tARLVpkcOW/K5cCj3m5+HZjNK
        evLnFyTACer1QxjR+a0inmk=
X-Google-Smtp-Source: APXvYqyTwlMHPOeLWbiiSJ3LSeqLfniKMwH3csKrgkITZ3VRPkMLvu9gOtRfKrIbPoTnMnPo25kRJg==
X-Received: by 2002:a17:90a:b10b:: with SMTP id z11mr801970pjq.132.1582660966894;
        Tue, 25 Feb 2020 12:02:46 -0800 (PST)
Received: from localhost.localdomain (fmdmzpr03-ext.fm.intel.com. [192.55.54.38])
        by smtp.gmail.com with ESMTPSA id v29sm10636362pgc.72.2020.02.25.12.02.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2020 12:02:46 -0800 (PST)
From:   bill.c.roberts@gmail.com
X-Google-Original-From: william.c.roberts@intel.com
To:     sds@tycho.nsa.gov, plautrba@redhat.com, selinux@vger.kernel.org
Cc:     William Roberts <william.c.roberts@intel.com>
Subject: [PATCH 05/17] rpm_execcon: annotate deprecated
Date:   Tue, 25 Feb 2020 14:02:07 -0600
Message-Id: <20200225200219.6163-6-william.c.roberts@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200225200219.6163-1-william.c.roberts@intel.com>
References: <20200225200219.6163-1-william.c.roberts@intel.com>
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

From: William Roberts <william.c.roberts@intel.com>

Signed-off-by: William Roberts <william.c.roberts@intel.com>
---
 libselinux/include/selinux/selinux.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/libselinux/include/selinux/selinux.h b/libselinux/include/selinux/selinux.h
index e5c8fdf3e4fb..e531f927be1e 100644
--- a/libselinux/include/selinux/selinux.h
+++ b/libselinux/include/selinux/selinux.h
@@ -629,7 +629,8 @@ extern int setexecfilecon(const char *filename, const char *fallback_type);
 /* Execute a helper for rpm in an appropriate security context. */
 extern int rpm_execcon(unsigned int verified,
 		       const char *filename,
-		       char *const argv[], char *const envp[]);
+		       char *const argv[], char *const envp[])
+	__attribute__((deprecated("Use setexecfilecon and execve")));
 #endif
 
 /* Returns whether a file context is customizable, and should not 
-- 
2.17.1

