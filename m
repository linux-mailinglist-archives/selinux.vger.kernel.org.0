Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07115232412
	for <lists+selinux@lfdr.de>; Wed, 29 Jul 2020 19:59:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728028AbgG2R7m (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Wed, 29 Jul 2020 13:59:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727884AbgG2R7E (ORCPT
        <rfc822;selinux@vger.kernel.org>); Wed, 29 Jul 2020 13:59:04 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23506C08C5DF
        for <selinux@vger.kernel.org>; Wed, 29 Jul 2020 10:59:03 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id l2so6994673pff.0
        for <selinux@vger.kernel.org>; Wed, 29 Jul 2020 10:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dge98+d3xjbY9IP5mQNDSECkvDjG9MOM+lU6BMHPuiA=;
        b=DWupj1kfarktDDqW8iV0U0Fl3rATkLnX92mmTciLVaQ0w0R4To89zPvTkL5ShbA8fz
         tLlRIKyxnoLPkrvn1FsKnQaFih1tMYIURcsugtNYl3v5j6qr4MgIjN1Uq4BtkK+V4C/r
         urPM2vEjgWKrA6FlUJFOGO2XKguldg1gijli8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dge98+d3xjbY9IP5mQNDSECkvDjG9MOM+lU6BMHPuiA=;
        b=POORBWATqpXzRZqJPkiDMB1RVMShasowxLLdAVIzHZjM8su1DYAhF4aDzxyOzRfRGi
         OK6IMklGPwbcm5SmNAaRTRIAvh2XIH4dvvpyi9kCzuzCLpbnu+XhmzD7cK5zN6v1LJBc
         tm4kIHlm+8hPPRkYd5D9lR1DYqyNx/YeNo9W0Y8668LbZAsAOHE+Od+9Iyj/Riz/k8Q5
         sx6Z0GNhPXC2yMbMowG3z2KSYqvB2AIeplK7AdtM6Knwm7JkvMn4ibI+MzC9QOV4K11Y
         GYwE0Dx4AeQN8FzvOhZOqAXSXCIR09mFeQTqLjZOBrY2W5ZKrC0yxN5alxbusM0m/wf+
         wwDA==
X-Gm-Message-State: AOAM532l1dOqj0UIhdkGpWucgLNf06NagXQCPnzivtvWcRqLIkbXSpTZ
        XDxLeVZ30UPu8QVLzl9XQzQUHg==
X-Google-Smtp-Source: ABdhPJzAjwYdqsQeLe2KNGjZnjR0XNZcsw5+JYPFJ80D6EHfefx62MFfkXPoJG3B9uAD4Jux3P7Grw==
X-Received: by 2002:a63:6cd:: with SMTP id 196mr30212447pgg.169.1596045542650;
        Wed, 29 Jul 2020 10:59:02 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id j19sm2771099pjy.40.2020.07.29.10.58.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2020 10:58:58 -0700 (PDT)
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
Subject: [PATCH v4 10/17] firmware_loader: Use security_post_load_data()
Date:   Wed, 29 Jul 2020 10:58:38 -0700
Message-Id: <20200729175845.1745471-11-keescook@chromium.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200729175845.1745471-1-keescook@chromium.org>
References: <20200729175845.1745471-1-keescook@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Now that security_post_load_data() is wired up, use it instead
of the NULL file argument style of security_post_read_file(),
and update the security_kernel_load_data() call to indicate that a
security_kernel_post_load_data() call is expected.

Wire up the IMA check to match earlier logic. Perhaps a generalized
change to ima_post_load_data() might look something like this:

    return process_buffer_measurement(buf, size,
                                      kernel_load_data_id_str(load_id),
                                      read_idmap[load_id] ?: FILE_CHECK,
                                      0, NULL);

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/base/firmware_loader/fallback.c       |  8 ++++----
 .../base/firmware_loader/fallback_platform.c  |  7 ++++++-
 security/integrity/ima/ima_main.c             | 20 +++++++++----------
 3 files changed, 20 insertions(+), 15 deletions(-)

diff --git a/drivers/base/firmware_loader/fallback.c b/drivers/base/firmware_loader/fallback.c
index a196aacce22c..7cfdfdcb819c 100644
--- a/drivers/base/firmware_loader/fallback.c
+++ b/drivers/base/firmware_loader/fallback.c
@@ -272,9 +272,9 @@ static ssize_t firmware_loading_store(struct device *dev,
 				dev_err(dev, "%s: map pages failed\n",
 					__func__);
 			else
-				rc = security_kernel_post_read_file(NULL,
-						fw_priv->data, fw_priv->size,
-						READING_FIRMWARE);
+				rc = security_kernel_post_load_data(fw_priv->data,
+						fw_priv->size,
+						LOADING_FIRMWARE);
 
 			/*
 			 * Same logic as fw_load_abort, only the DONE bit
@@ -613,7 +613,7 @@ static bool fw_run_sysfs_fallback(u32 opt_flags)
 		return false;
 
 	/* Also permit LSMs and IMA to fail firmware sysfs fallback */
-	ret = security_kernel_load_data(LOADING_FIRMWARE, false);
+	ret = security_kernel_load_data(LOADING_FIRMWARE, true);
 	if (ret < 0)
 		return false;
 
diff --git a/drivers/base/firmware_loader/fallback_platform.c b/drivers/base/firmware_loader/fallback_platform.c
index a12c79d47efc..4d1157af0e86 100644
--- a/drivers/base/firmware_loader/fallback_platform.c
+++ b/drivers/base/firmware_loader/fallback_platform.c
@@ -17,7 +17,7 @@ int firmware_fallback_platform(struct fw_priv *fw_priv, u32 opt_flags)
 	if (!(opt_flags & FW_OPT_FALLBACK_PLATFORM))
 		return -ENOENT;
 
-	rc = security_kernel_load_data(LOADING_FIRMWARE, false);
+	rc = security_kernel_load_data(LOADING_FIRMWARE, true);
 	if (rc)
 		return rc;
 
@@ -27,6 +27,11 @@ int firmware_fallback_platform(struct fw_priv *fw_priv, u32 opt_flags)
 
 	if (fw_priv->data && size > fw_priv->allocated_size)
 		return -ENOMEM;
+
+	rc = security_kernel_post_load_data((u8 *)data, size, LOADING_FIRMWARE);
+	if (rc)
+		return rc;
+
 	if (!fw_priv->data)
 		fw_priv->data = vmalloc(size);
 	if (!fw_priv->data)
diff --git a/security/integrity/ima/ima_main.c b/security/integrity/ima/ima_main.c
index 85000dc8595c..1a7bc4c7437d 100644
--- a/security/integrity/ima/ima_main.c
+++ b/security/integrity/ima/ima_main.c
@@ -648,15 +648,6 @@ int ima_post_read_file(struct file *file, void *buf, loff_t size,
 	enum ima_hooks func;
 	u32 secid;
 
-	if (!file && read_id == READING_FIRMWARE) {
-		if ((ima_appraise & IMA_APPRAISE_FIRMWARE) &&
-		    (ima_appraise & IMA_APPRAISE_ENFORCE)) {
-			pr_err("Prevent firmware loading_store.\n");
-			return -EACCES;	/* INTEGRITY_UNKNOWN */
-		}
-		return 0;
-	}
-
 	/* permit signed certs */
 	if (!file && read_id == READING_X509_CERTIFICATE)
 		return 0;
@@ -706,7 +697,7 @@ int ima_load_data(enum kernel_load_data_id id, bool contents)
 		}
 		break;
 	case LOADING_FIRMWARE:
-		if (ima_enforce && (ima_appraise & IMA_APPRAISE_FIRMWARE)) {
+		if (ima_enforce && (ima_appraise & IMA_APPRAISE_FIRMWARE) && !contents) {
 			pr_err("Prevent firmware sysfs fallback loading.\n");
 			return -EACCES;	/* INTEGRITY_UNKNOWN */
 		}
@@ -739,6 +730,15 @@ int ima_load_data(enum kernel_load_data_id id, bool contents)
  */
 int ima_post_load_data(char *buf, loff_t size, enum kernel_load_data_id load_id)
 {
+	if (load_id == LOADING_FIRMWARE) {
+		if ((ima_appraise & IMA_APPRAISE_FIRMWARE) &&
+		    (ima_appraise & IMA_APPRAISE_ENFORCE)) {
+			pr_err("Prevent firmware loading_store.\n");
+			return -EACCES; /* INTEGRITY_UNKNOWN */
+		}
+		return 0;
+	}
+
 	return 0;
 }
 
-- 
2.25.1

