Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 99D9416EFAA
	for <lists+selinux@lfdr.de>; Tue, 25 Feb 2020 21:02:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731716AbgBYUCz (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Tue, 25 Feb 2020 15:02:55 -0500
Received: from mail-pl1-f196.google.com ([209.85.214.196]:33070 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731214AbgBYUCz (ORCPT
        <rfc822;selinux@vger.kernel.org>); Tue, 25 Feb 2020 15:02:55 -0500
Received: by mail-pl1-f196.google.com with SMTP id ay11so258568plb.0
        for <selinux@vger.kernel.org>; Tue, 25 Feb 2020 12:02:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=E2kmoY6zv92PvScAvn3kdHJOJSPBF0uxlk6MAV8q014=;
        b=AgJrCZmAs1za1sdzgmwRHWjlaaq7FNHOc6ENea0b+GEDEDSk3YlNcKUCy3iKXzQPtx
         b4nALYagijWywsee2TVx3JPaGPOjN9Eh3NNlBIzFfWkfD6fe8lA1jE2unRIVnYnZHF1f
         ltQrAiH6cR4pa+aGtg0zOZWVh2VYeLIT7taUETOi+ghbsnJv0KZhaCDk3reQfE2wL23n
         Hna6hIgYkG2lBV8q1DzUxR3RYNco8ju042JpAiTjl4ZxpuWc0YNUOVqGGdCEV8OKsION
         NmnsOxi/qVmVe6KpZ8fcZSWKJyiAxeId8GiO1Svsy3zp5I2FeWOjp3GjsGZ1AB8jsbRo
         OhzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=E2kmoY6zv92PvScAvn3kdHJOJSPBF0uxlk6MAV8q014=;
        b=sC6A9IYRSGFVMw/vXAq/0/aON+krYuQnkOAhahUQ41uVylncG5Vqh5O4dts9OX5NKp
         ntSaXQuhqJ1hOTKuWBF+GYu7v4ZPUCCw8G7/36Hk6dH9X06MHQpdHe6PVZEVKlxo9jSS
         bvH1Eplppy8bvsxtZ7UW3V1RyjQf3BuvFDoI/wod6GlfDEjFGrEQzHKrOX+pxfHW772H
         NtxSX5wOngaEV+A0dgluG2aYz2g7ubheadkazCxRy4PihtH9Tz1mIdxxaMTDPiOraaeg
         UgWDmcDwZUFCqQGuGbbspb8aicE+Zt++s0omNA1x6k9DY3y2g+XrjQFAzjZZrX/P8H82
         HGfw==
X-Gm-Message-State: APjAAAWpvB0bR5TObwX2Lb/El6zOxb8HQfHbdsvO+1r/sKhQlcjg74FN
        qllzdy9XieLmoBCzr9C0Z5Y=
X-Google-Smtp-Source: APXvYqy7fYsXfHNABnEI/6paGg/MD0qeGThA++E48IINiF2tG9VVP87jZhHJPZeLtJ9BV+XAX7BBLg==
X-Received: by 2002:a17:902:7283:: with SMTP id d3mr223433pll.118.1582660974642;
        Tue, 25 Feb 2020 12:02:54 -0800 (PST)
Received: from localhost.localdomain (fmdmzpr03-ext.fm.intel.com. [192.55.54.38])
        by smtp.gmail.com with ESMTPSA id v29sm10636362pgc.72.2020.02.25.12.02.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2020 12:02:54 -0800 (PST)
From:   bill.c.roberts@gmail.com
X-Google-Original-From: william.c.roberts@intel.com
To:     sds@tycho.nsa.gov, plautrba@redhat.com, selinux@vger.kernel.org
Cc:     William Roberts <william.c.roberts@intel.com>
Subject: [PATCH 09/17] matchpathcon_init: annotate deprecated
Date:   Tue, 25 Feb 2020 14:02:11 -0600
Message-Id: <20200225200219.6163-10-william.c.roberts@intel.com>
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
index 3704eabc7545..20ac8498ac9c 100644
--- a/libselinux/include/selinux/selinux.h
+++ b/libselinux/include/selinux/selinux.h
@@ -457,7 +457,8 @@ extern void set_matchpathcon_flags(unsigned int flags);
    function also checks for a 'path'.homedirs file and 
    a 'path'.local file and loads additional specifications 
    from them if present. */
-extern int matchpathcon_init(const char *path);
+extern int matchpathcon_init(const char *path)
+   __attribute__ ((deprecated("Use selabel_open with backend SELABEL_CTX_FILE")));
 
 /* Same as matchpathcon_init, but only load entries with
    regexes that have stems that are prefixes of 'prefix'. */
-- 
2.17.1

