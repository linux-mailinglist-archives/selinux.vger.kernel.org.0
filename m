Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 18B6516EFAC
	for <lists+selinux@lfdr.de>; Tue, 25 Feb 2020 21:02:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731718AbgBYUC5 (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Tue, 25 Feb 2020 15:02:57 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:36971 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731214AbgBYUC5 (ORCPT
        <rfc822;selinux@vger.kernel.org>); Tue, 25 Feb 2020 15:02:57 -0500
Received: by mail-pf1-f193.google.com with SMTP id p14so122770pfn.4
        for <selinux@vger.kernel.org>; Tue, 25 Feb 2020 12:02:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=7S/uCKhpK9dYUlYBwzqU1D9vw0pquGyo7c6YOeVl25Q=;
        b=MKOtc9IHs2WzoGb12EJZfKE79Cw+8F38hhtzEZ5E1WiwGHmSRUEe7C2CghIfMDDohv
         Ls1lL3Cm7iwKcjnVL44ItvO62n3o5dCc3iUMHYt41AAhqZT1MQHJw5ZsC6cG+nIyxXVd
         rOTpwFc7lXTVJAEKU3hmedXYNQFWrxk7Tld9Uwc/7df8qbf3j35/yCJj57mJ5Zud4C/w
         gJ1m3+5rg0AFEWbQNuELGowAr/5NBCNFRciNDlybaGK7y0fUQEunxoEmF0W85hcJmOuW
         +q9Rg1sZUOwPYQ1W7Efojaic8vLXilZymJHF31pgdB5jS6vtKEZpui9rIKydK3SBEmMQ
         uBoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=7S/uCKhpK9dYUlYBwzqU1D9vw0pquGyo7c6YOeVl25Q=;
        b=ntbSJ77dXQPqQSFj9Tzr5Sc27J20eDSe0bNhN6Yz2Y+NP1bbAeeKtTfVu3vqKDaaub
         a1FEoeiEPOmlmdjAIQJSQD+1r07R8g2PYX6j6bIuALROpRvhp4hsCFQInM/3pbe6iK4f
         2tb3EllMDGFCLdx1fuoII/g1wlT3AjyfqRqi9of7PjHzdPcddvyhUIxpAYtXmJBE3naC
         T/0FI0otBDgj9BNAksRFlarxMIX+yyxj9XSROfb4FaNKzMwn1zbNipKrMPlhzH0SnFg4
         /6v1qvX7YALxTJJBpHz1oS0Tm4bjYkX8EbOQhm4gh0UDSn0Ad2slbLM/z3QBKoMUpHVl
         1a6g==
X-Gm-Message-State: APjAAAXWkICIN1iKGehyco0IVVWnOmnb2htM9fTm3X6AHtnos4Qw0r10
        TtKDn4bOkOXum0QdKH3zbME=
X-Google-Smtp-Source: APXvYqxSbR6WMR23timqQD3z+cztm08A43GkhATiEFOh00bx/syyX3+kZ96AWJDNnAx0QxkEgD0pmg==
X-Received: by 2002:a63:a1e:: with SMTP id 30mr233628pgk.238.1582660976360;
        Tue, 25 Feb 2020 12:02:56 -0800 (PST)
Received: from localhost.localdomain (fmdmzpr03-ext.fm.intel.com. [192.55.54.38])
        by smtp.gmail.com with ESMTPSA id v29sm10636362pgc.72.2020.02.25.12.02.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2020 12:02:55 -0800 (PST)
From:   bill.c.roberts@gmail.com
X-Google-Original-From: william.c.roberts@intel.com
To:     sds@tycho.nsa.gov, plautrba@redhat.com, selinux@vger.kernel.org
Cc:     William Roberts <william.c.roberts@intel.com>
Subject: [PATCH 10/17] matchpathcon_fini: annotate deprecated
Date:   Tue, 25 Feb 2020 14:02:12 -0600
Message-Id: <20200225200219.6163-11-william.c.roberts@intel.com>
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
index 20ac8498ac9c..26f8432cd4c3 100644
--- a/libselinux/include/selinux/selinux.h
+++ b/libselinux/include/selinux/selinux.h
@@ -465,7 +465,8 @@ extern int matchpathcon_init(const char *path)
 extern int matchpathcon_init_prefix(const char *path, const char *prefix);
 
 /* Free the memory allocated by matchpathcon_init. */
-extern void matchpathcon_fini(void);
+extern void matchpathcon_fini(void)
+   __attribute__ ((deprecated("Use selabel_close")));
 
 /* Resolve all of the symlinks and relative portions of a pathname, but NOT
  * the final component (same a realpath() unless the final component is a
-- 
2.17.1

