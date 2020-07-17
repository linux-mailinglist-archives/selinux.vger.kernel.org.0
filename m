Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC4BC224262
	for <lists+selinux@lfdr.de>; Fri, 17 Jul 2020 19:44:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728155AbgGQRoN (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Fri, 17 Jul 2020 13:44:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728135AbgGQRnV (ORCPT
        <rfc822;selinux@vger.kernel.org>); Fri, 17 Jul 2020 13:43:21 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE231C0619E1
        for <selinux@vger.kernel.org>; Fri, 17 Jul 2020 10:43:20 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id s189so7012951pgc.13
        for <selinux@vger.kernel.org>; Fri, 17 Jul 2020 10:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=siVKXGctQ3dO2KPSHl+rKOslA+wryyAoJYcV4WQeVJo=;
        b=Tmm6nSHbPKRl2sjL7rqd6IMWd8+Ao488rWzXMHK6PYowJb99i5crj5hEdXwes361IV
         QEbrASaiv+K4tkNmpmXDzYxBULuszuAd7xqA/p2LrvhXPmj12zlj0V01jxePHP1YmnBF
         /BEprQuL1j2EaB+QveFUNG0u24VvNuK/X5n5s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=siVKXGctQ3dO2KPSHl+rKOslA+wryyAoJYcV4WQeVJo=;
        b=DI/8JOM8RELc3J/3VgtRODjI5YLlsQlL3+A0QUM3fot/AajVRlbRg03ftUJ2lJfD27
         3sQAqX3PQ2iz1V0SEHBtxdMGUrQ8pFSlOpTiEX+2Sa0gsEtiOPE3RFGGkdjoRFIGlTg+
         896wf9RIykdzaWy5tISkYovZdwoL8lkX78/g+w8JI/LbBGrYorkvEdpHz+/h8CuVFn46
         4IBfjMaAjUpY37jYw/qzKUvHS2eWh5RaTQLdtM5cdDcNIQ9Cah8OB72hMjUwbq6KdCJq
         zDj1QysasQ0WeWN3WRy4gnDqDCI6+zMYwqbEvD5dbu7EQC/xoPF2bKT6iIrTvMm2z/Dm
         wOVw==
X-Gm-Message-State: AOAM531JMSLZkDTjCLjjZmdbVu59xHVOHsvcP65nxmLeOU9ciprNaQ2n
        uU20CKlJdk+Rz7KrH1VIRVASVw==
X-Google-Smtp-Source: ABdhPJz/xetOK7en2fF4Zu+3IBSwNDuUY0iPaJMSprgcgHxUke4sPufdX6LRUVXSj5dWeYuwMrYDWA==
X-Received: by 2002:a63:4d3:: with SMTP id 202mr9705880pge.14.1595007800180;
        Fri, 17 Jul 2020 10:43:20 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id gv16sm3473959pjb.5.2020.07.17.10.43.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2020 10:43:17 -0700 (PDT)
From:   Kees Cook <keescook@chromium.org>
To:     Scott Branden <scott.branden@broadcom.com>
Cc:     Kees Cook <keescook@chromium.org>,
        Mimi Zohar <zohar@linux.ibm.com>,
        Matthew Wilcox <willy@infradead.org>,
        James Morris <jmorris@namei.org>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Jessica Yu <jeyu@kernel.org>,
        Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
        "Serge E. Hallyn" <serge@hallyn.com>,
        Casey Schaufler <casey@schaufler-ca.com>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Matthew Garrett <matthewgarrett@google.com>,
        David Howells <dhowells@redhat.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        "Joel Fernandes (Google)" <joel@joelfernandes.org>,
        KP Singh <kpsingh@google.com>, Dave Olsthoorn <dave@bewaar.me>,
        Hans de Goede <hdegoede@redhat.com>,
        Peter Jones <pjones@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Stephen Boyd <stephen.boyd@linaro.org>,
        Paul Moore <paul@paul-moore.com>,
        Stephen Smalley <stephen.smalley.work@gmail.com>,
        linux-security-module@vger.kernel.org,
        linux-integrity@vger.kernel.org, selinux@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, kexec@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 08/13] fs/kernel_read_file: Add file_size output argument
Date:   Fri, 17 Jul 2020 10:43:03 -0700
Message-Id: <20200717174309.1164575-9-keescook@chromium.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200717174309.1164575-1-keescook@chromium.org>
References: <20200717174309.1164575-1-keescook@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

In preparation for adding partial read support, add an optional output
argument to kernel_read_file*() that reports the file size so callers
can reason more easily about their reading progress.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/base/firmware_loader/main.c |  1 +
 fs/kernel_read_file.c               | 19 +++++++++++++------
 include/linux/kernel_read_file.h    |  4 ++++
 kernel/kexec_file.c                 |  4 ++--
 kernel/module.c                     |  2 +-
 security/integrity/digsig.c         |  2 +-
 security/integrity/ima/ima_fs.c     |  2 +-
 7 files changed, 23 insertions(+), 11 deletions(-)

diff --git a/drivers/base/firmware_loader/main.c b/drivers/base/firmware_loader/main.c
index ea419c7d3d34..3439a533927c 100644
--- a/drivers/base/firmware_loader/main.c
+++ b/drivers/base/firmware_loader/main.c
@@ -495,6 +495,7 @@ fw_get_filesystem_firmware(struct device *device, struct fw_priv *fw_priv,
 
 		/* load firmware files from the mount namespace of init */
 		rc = kernel_read_file_from_path_initns(path, &buffer, msize,
+						       NULL,
 						       READING_FIRMWARE);
 		if (rc < 0) {
 			if (rc != -ENOENT)
diff --git a/fs/kernel_read_file.c b/fs/kernel_read_file.c
index e21a76001fff..2e29c38eb4df 100644
--- a/fs/kernel_read_file.c
+++ b/fs/kernel_read_file.c
@@ -14,6 +14,8 @@
  *		@buf_size will be ignored)
  * @buf_size	size of buf, if already allocated. If @buf not
  *		allocated, this is the largest size to allocate.
+ * @file_size	if non-NULL, the full size of @file will be
+ *		written here.
  * @id		the kernel_read_file_id identifying the type of
  *		file contents being read (for LSMs to examine)
  *
@@ -22,7 +24,8 @@
  *
  */
 int kernel_read_file(struct file *file, void **buf,
-		     size_t buf_size, enum kernel_read_file_id id)
+		     size_t buf_size, size_t *file_size,
+		     enum kernel_read_file_id id)
 {
 	loff_t i_size, pos;
 	ssize_t bytes = 0;
@@ -49,6 +52,8 @@ int kernel_read_file(struct file *file, void **buf,
 		ret = -EFBIG;
 		goto out;
 	}
+	if (file_size)
+		*file_size = i_size;
 
 	if (!*buf)
 		*buf = allocated = vmalloc(i_size);
@@ -91,7 +96,8 @@ int kernel_read_file(struct file *file, void **buf,
 EXPORT_SYMBOL_GPL(kernel_read_file);
 
 int kernel_read_file_from_path(const char *path, void **buf,
-			       size_t buf_size, enum kernel_read_file_id id)
+			       size_t buf_size, size_t *file_size,
+			       enum kernel_read_file_id id)
 {
 	struct file *file;
 	int ret;
@@ -103,14 +109,14 @@ int kernel_read_file_from_path(const char *path, void **buf,
 	if (IS_ERR(file))
 		return PTR_ERR(file);
 
-	ret = kernel_read_file(file, buf, buf_size, id);
+	ret = kernel_read_file(file, buf, buf_size, file_size, id);
 	fput(file);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(kernel_read_file_from_path);
 
 int kernel_read_file_from_path_initns(const char *path, void **buf,
-				      size_t buf_size,
+				      size_t buf_size, size_t *file_size,
 				      enum kernel_read_file_id id)
 {
 	struct file *file;
@@ -129,13 +135,14 @@ int kernel_read_file_from_path_initns(const char *path, void **buf,
 	if (IS_ERR(file))
 		return PTR_ERR(file);
 
-	ret = kernel_read_file(file, buf, buf_size, id);
+	ret = kernel_read_file(file, buf, buf_size, file_size, id);
 	fput(file);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(kernel_read_file_from_path_initns);
 
 int kernel_read_file_from_fd(int fd, void **buf, size_t buf_size,
+			     size_t *file_size,
 			     enum kernel_read_file_id id)
 {
 	struct fd f = fdget(fd);
@@ -144,7 +151,7 @@ int kernel_read_file_from_fd(int fd, void **buf, size_t buf_size,
 	if (!f.file)
 		goto out;
 
-	ret = kernel_read_file(f.file, buf, buf_size, id);
+	ret = kernel_read_file(f.file, buf, buf_size, file_size, id);
 out:
 	fdput(f);
 	return ret;
diff --git a/include/linux/kernel_read_file.h b/include/linux/kernel_read_file.h
index 910039e7593e..023293eaf948 100644
--- a/include/linux/kernel_read_file.h
+++ b/include/linux/kernel_read_file.h
@@ -37,15 +37,19 @@ static inline const char *kernel_read_file_id_str(enum kernel_read_file_id id)
 
 int kernel_read_file(struct file *file,
 		     void **buf, size_t buf_size,
+		     size_t *file_size,
 		     enum kernel_read_file_id id);
 int kernel_read_file_from_path(const char *path,
 			       void **buf, size_t buf_size,
+			       size_t *file_size,
 			       enum kernel_read_file_id id);
 int kernel_read_file_from_path_initns(const char *path,
 				      void **buf, size_t buf_size,
+				      size_t *file_size,
 				      enum kernel_read_file_id id);
 int kernel_read_file_from_fd(int fd,
 			     void **buf, size_t buf_size,
+			     size_t *file_size,
 			     enum kernel_read_file_id id);
 
 #endif /* _LINUX_KERNEL_READ_FILE_H */
diff --git a/kernel/kexec_file.c b/kernel/kexec_file.c
index a201bbb19158..7b0ecdc621aa 100644
--- a/kernel/kexec_file.c
+++ b/kernel/kexec_file.c
@@ -222,7 +222,7 @@ kimage_file_prepare_segments(struct kimage *image, int kernel_fd, int initrd_fd,
 	void *ldata;
 
 	ret = kernel_read_file_from_fd(kernel_fd, &image->kernel_buf,
-				       INT_MAX, READING_KEXEC_IMAGE);
+				       INT_MAX, NULL, READING_KEXEC_IMAGE);
 	if (ret < 0)
 		return ret;
 	image->kernel_buf_len = ret;
@@ -242,7 +242,7 @@ kimage_file_prepare_segments(struct kimage *image, int kernel_fd, int initrd_fd,
 	/* It is possible that there no initramfs is being loaded */
 	if (!(flags & KEXEC_FILE_NO_INITRAMFS)) {
 		ret = kernel_read_file_from_fd(initrd_fd, &image->initrd_buf,
-					       INT_MAX,
+					       INT_MAX, NULL,
 					       READING_KEXEC_INITRAMFS);
 		if (ret < 0)
 			goto out;
diff --git a/kernel/module.c b/kernel/module.c
index b6fd4f51cc30..860d713dd910 100644
--- a/kernel/module.c
+++ b/kernel/module.c
@@ -4001,7 +4001,7 @@ SYSCALL_DEFINE3(finit_module, int, fd, const char __user *, uargs, int, flags)
 		      |MODULE_INIT_IGNORE_VERMAGIC))
 		return -EINVAL;
 
-	err = kernel_read_file_from_fd(fd, &hdr, INT_MAX,
+	err = kernel_read_file_from_fd(fd, &hdr, INT_MAX, NULL,
 				       READING_MODULE);
 	if (err < 0)
 		return err;
diff --git a/security/integrity/digsig.c b/security/integrity/digsig.c
index 04f779c4f5ed..8a523dfd7fd7 100644
--- a/security/integrity/digsig.c
+++ b/security/integrity/digsig.c
@@ -175,7 +175,7 @@ int __init integrity_load_x509(const unsigned int id, const char *path)
 	int rc;
 	key_perm_t perm;
 
-	rc = kernel_read_file_from_path(path, &data, INT_MAX,
+	rc = kernel_read_file_from_path(path, &data, INT_MAX, NULL,
 					READING_X509_CERTIFICATE);
 	if (rc < 0) {
 		pr_err("Unable to open file: %s (%d)", path, rc);
diff --git a/security/integrity/ima/ima_fs.c b/security/integrity/ima/ima_fs.c
index 8695170d0e5c..cff04083e598 100644
--- a/security/integrity/ima/ima_fs.c
+++ b/security/integrity/ima/ima_fs.c
@@ -284,7 +284,7 @@ static ssize_t ima_read_policy(char *path)
 	datap = path;
 	strsep(&datap, "\n");
 
-	rc = kernel_read_file_from_path(path, &data, INT_MAX, READING_POLICY);
+	rc = kernel_read_file_from_path(path, &data, INT_MAX, NULL, READING_POLICY);
 	if (rc < 0) {
 		pr_err("Unable to open file: %s (%d)", path, rc);
 		return rc;
-- 
2.25.1

