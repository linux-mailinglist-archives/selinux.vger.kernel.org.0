Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A05C2819A4
	for <lists+selinux@lfdr.de>; Fri,  2 Oct 2020 19:39:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726224AbgJBRjQ (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Fri, 2 Oct 2020 13:39:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388358AbgJBRin (ORCPT
        <rfc822;selinux@vger.kernel.org>); Fri, 2 Oct 2020 13:38:43 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A4B0C0613AE
        for <selinux@vger.kernel.org>; Fri,  2 Oct 2020 10:38:41 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id q123so1773257pfb.0
        for <selinux@vger.kernel.org>; Fri, 02 Oct 2020 10:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+iQNrYs3FwbgO/D5wBu/XH+65XZOVsrx8jBX4xhrznE=;
        b=EDfqStII1nyquW6vCDUJ0Tjh5LqLIxTDOCBsRG+Y5BOdp3rp+5tjRqeEdCtoyMHPmx
         MyVLigCKUXuy8gVZ4U6zpvuk9pmCPNlcQ2lULK3/4ExxQylIYS0LevTl1aWHi9IX8858
         bhAQjK9Gpnc8WDPfEOCWZjhiE9R39MQAiqYfY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+iQNrYs3FwbgO/D5wBu/XH+65XZOVsrx8jBX4xhrznE=;
        b=VMgOLH3TRlr3aDEVv1nyf33QIEj6hHdshZX7uEtm55S+67f23YkDiVjQ99LmEYUptI
         M9d0yhpFR8R2VlJXb4qL4xWCpGe6/wRdC0EAQfquIevVmi3yiaoz/LPC9haTxgAP2izV
         drsL+HKyEwt7mWqz3hYdniYYMx1a7HIq/l/c8Rv8KvQgupeoAXnN9fIg7EOOWvwZyRzG
         yb1gK26O5uHjK8bz8sjNDyNMdiSKOtToBBi/eA/yRRffFLTWxMEiK6tZO1uSqS181WBm
         d8H0t7XBl7bbV5mrLZnheuV+8hcZN7Y8f12vyb1l8XmDU6dC9diavhcVZ/htwMoblrYB
         Eqow==
X-Gm-Message-State: AOAM530HTM7QONwAxCtEwLU4Gfh1Zs6oz/nzxGoO6w3oGY3gMJJAv95X
        9xb4z80ZqqsJ6wmzqJ50wOf4Og==
X-Google-Smtp-Source: ABdhPJyTPCXP4kCQY9q8tHg/I40D0cpppwMhWrbNdfV+VWl5wPSAP7pjwzJcV4nQvitE40P+5c9z6Q==
X-Received: by 2002:a63:5b04:: with SMTP id p4mr3258880pgb.121.1601660320583;
        Fri, 02 Oct 2020 10:38:40 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id q18sm2653154pfg.158.2020.10.02.10.38.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2020 10:38:36 -0700 (PDT)
From:   Kees Cook <keescook@chromium.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Kees Cook <keescook@chromium.org>,
        Scott Branden <scott.branden@broadcom.com>,
        Mimi Zohar <zohar@linux.ibm.com>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Takashi Iwai <tiwai@suse.de>, Jessica Yu <jeyu@kernel.org>,
        SeongJae Park <sjpark@amazon.de>,
        KP Singh <kpsingh@chromium.org>, linux-efi@vger.kernel.org,
        linux-security-module@vger.kernel.org,
        linux-integrity@vger.kernel.org, selinux@vger.kernel.org,
        linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 12/16] IMA: Add support for file reads without contents
Date:   Fri,  2 Oct 2020 10:38:24 -0700
Message-Id: <20201002173828.2099543-13-keescook@chromium.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201002173828.2099543-1-keescook@chromium.org>
References: <20201002173828.2099543-1-keescook@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

From: Scott Branden <scott.branden@broadcom.com>

When the kernel_read_file LSM hook is called with contents=false, IMA
can appraise the file directly, without requiring a filled buffer. When
such a buffer is available, though, IMA can continue to use it instead
of forcing a double read here.

Signed-off-by: Scott Branden <scott.branden@broadcom.com>
Link: https://lore.kernel.org/lkml/20200706232309.12010-10-scott.branden@broadcom.com/
Signed-off-by: Kees Cook <keescook@chromium.org>
Reviewed-by: Mimi Zohar <zohar@linux.ibm.com>
---
 security/integrity/ima/ima_main.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/security/integrity/ima/ima_main.c b/security/integrity/ima/ima_main.c
index 939f53d02627..82c9d62bcb11 100644
--- a/security/integrity/ima/ima_main.c
+++ b/security/integrity/ima/ima_main.c
@@ -613,11 +613,8 @@ void ima_post_path_mknod(struct dentry *dentry)
 int ima_read_file(struct file *file, enum kernel_read_file_id read_id,
 		  bool contents)
 {
-	/* Reject all partial reads during appraisal. */
-	if (!contents) {
-		if (ima_appraise & IMA_APPRAISE_ENFORCE)
-			return -EACCES;
-	}
+	enum ima_hooks func;
+	u32 secid;
 
 	/*
 	 * Do devices using pre-allocated memory run the risk of the
@@ -626,7 +623,20 @@ int ima_read_file(struct file *file, enum kernel_read_file_id read_id,
 	 * buffers? It may be desirable to include the buffer address
 	 * in this API and walk all the dma_map_single() mappings to check.
 	 */
-	return 0;
+
+	/*
+	 * There will be a call made to ima_post_read_file() with
+	 * a filled buffer, so we don't need to perform an extra
+	 * read early here.
+	 */
+	if (contents)
+		return 0;
+
+	/* Read entire file for all partial reads. */
+	func = read_idmap[read_id] ?: FILE_CHECK;
+	security_task_getsecid(current, &secid);
+	return process_measurement(file, current_cred(), secid, NULL,
+				   0, MAY_READ, func);
 }
 
 const int read_idmap[READING_MAX_ID] = {
-- 
2.25.1

