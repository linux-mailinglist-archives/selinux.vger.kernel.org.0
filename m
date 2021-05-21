Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D295C38D040
	for <lists+selinux@lfdr.de>; Fri, 21 May 2021 23:50:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229907AbhEUVv7 (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Fri, 21 May 2021 17:51:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229937AbhEUVv5 (ORCPT
        <rfc822;selinux@vger.kernel.org>); Fri, 21 May 2021 17:51:57 -0400
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com [IPv6:2607:f8b0:4864:20::72e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 681E1C06138D
        for <selinux@vger.kernel.org>; Fri, 21 May 2021 14:50:33 -0700 (PDT)
Received: by mail-qk1-x72e.google.com with SMTP id i67so21300892qkc.4
        for <selinux@vger.kernel.org>; Fri, 21 May 2021 14:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
        h=subject:from:to:date:message-id:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=nqTYSxcbdFhLeehGXcGD2BgJgX1rjG2Wtkqyf5lYwxs=;
        b=bCFSuOY106xTmbrlMmlMrtItsMWp3Hrouloy7nRctAo9P0YrEyWroH4Ep1Wjx4QIiv
         UMEuUWBpuTHsO7andG1cDqSvIm5IK+x1RgyHplBq8wnv1ZpWWO016Qp2B5dCKcita4Ih
         5jLyY8pFF1+7i33CjNYLETuFBSlX0txwhjTvm8kQh9dFZnrad8MBgrlvJ2Y882UKwLJz
         vBtWK/ECSTO3lm1kzFQDCa+YS2zoravl75Ym/ZrQ6yW0gxDhyJeBeGom1foDF7bQW6Vt
         vs3Bp/Iwjp4Fj1raR1G0++c8ebRn1pMYE5JpNeJG+IUXEjzW+qVY9VoV5qkQN70LTEMj
         Z2NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:date:message-id:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=nqTYSxcbdFhLeehGXcGD2BgJgX1rjG2Wtkqyf5lYwxs=;
        b=nd1PSwgQ+zlS7+b1BMuVU8Wk19iJ70Vq/PoFSmkHooKLZU30FvOXatkDClqnjTxiNg
         aT0gDXNUuHDqUDKdoq2q0qoeEEs8dllLse1j/glv6Reef5B0+7e5Pyha/nR38kinpmrD
         Pmw2FpwK60MXTKfDq8xGr2YD7W7PE80D7g2DyLw6oQd4Y4nS7Sj2ECRnPKlTV2V+cTEB
         ffyY5BPD2H8FiQtZ38Uk0RqMGXhXVrJTvIbF0dFKsSYowWmA3ovk2civDzxXh0d8OBic
         solnSVCDGTs9CWz4FfP7BPPADKIzpAlmpo6/JvwIdzaWOPyGikaG08JLrn1hS0EgxRQK
         mpXw==
X-Gm-Message-State: AOAM531kfT3X4/GChzU+MShYn6/ABNeJ2f7Yw+wCKeh+PP053Q9Pds5z
        jlc4S/RyOdQKOlzavPik95oW
X-Google-Smtp-Source: ABdhPJzzqQ3A/ENC4p3Z2YDJQeOswRLu6mmSuT0tmeMEw4hgI4BgJLg6GP2bt6rxQX4t1+reaZa3rA==
X-Received: by 2002:a05:620a:4090:: with SMTP id f16mr15272263qko.225.1621633832501;
        Fri, 21 May 2021 14:50:32 -0700 (PDT)
Received: from localhost (pool-96-237-52-188.bstnma.fios.verizon.net. [96.237.52.188])
        by smtp.gmail.com with ESMTPSA id e5sm5317173qtg.96.2021.05.21.14.50.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 May 2021 14:50:32 -0700 (PDT)
Subject: [RFC PATCH 8/9] selinux: add support for the io_uring access controls
From:   Paul Moore <paul@paul-moore.com>
To:     linux-security-module@vger.kernel.org, selinux@vger.kernel.org,
        linux-audit@redhat.com, io-uring@vger.kernel.org,
        linux-fsdevel@vger.kernel.org,
        Kumar Kartikeya Dwivedi <memxor@gmail.com>,
        Jens Axboe <axboe@kernel.dk>,
        Alexander Viro <viro@zeniv.linux.org.uk>
Date:   Fri, 21 May 2021 17:50:31 -0400
Message-ID: <162163383147.8379.1567341725602837940.stgit@sifl>
In-Reply-To: <162163367115.8379.8459012634106035341.stgit@sifl>
References: <162163367115.8379.8459012634106035341.stgit@sifl>
User-Agent: StGit/1.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

WARNING - This is a work in progress, this patch, including the
description, may be incomplete or even incorrect.  You have been
warned.

This patch implements two new io_uring access controls, specifically
support for controlling the io_uring "personalities" and
IORING_SETUP_SQPOLL.  Controlling the sharing of io_urings themselves
is handled via the normal file/inode labeling and sharing mechanisms.

The io_uring { override_creds } permission restricts which domains
the subject domain can use to override it's own credentials.
Granting a domain the io_uring { override_creds } permission allows
it to impersonate another domain in io_uring operations.

The io_uring { sqpoll } permission restricts which domains can create
asynchronous io_uring polling threads.  This is important from a
security perspective as operations queued by this asynchronous thread
inherit the credentials of the thread creator by default; if an
io_uring is shared across process/domain boundaries this could result
in one domain impersonating another.  Controlling the creation of
sqpoll threads, and the sharing of io_urings across processes, allow
policy authors to restrict the ability of one domain to impersonate
another via io_uring.

As a quick summary, this patch adds a new object class with two
permissions:

 io_uring { override_creds sqpoll }

These permissions can be seen in the two simple policy statements
below:

  allow domA_t domB_t : io_uring { override_creds };
  allow domA_t self : io_uring { sqpoll };

Signed-off-by: Paul Moore <paul@paul-moore.com>
---
 security/selinux/hooks.c            |   67 +++++++++++++++++++++++++++++++++++
 security/selinux/include/classmap.h |    2 +
 2 files changed, 69 insertions(+)

diff --git a/security/selinux/hooks.c b/security/selinux/hooks.c
index eaea837d89d1..696130972e4d 100644
--- a/security/selinux/hooks.c
+++ b/security/selinux/hooks.c
@@ -7115,6 +7115,68 @@ static int selinux_perf_event_write(struct perf_event *event)
 }
 #endif
 
+#ifdef CONFIG_IO_URING
+
+#if 1
+/* XXX - dump_creds() is for debugging only, remove before committing */
+static void dump_creds(const struct cred *cred)
+{
+	u32 secid;
+	char *ctx = NULL;
+	unsigned int ctx_len = 0;
+
+	security_cred_getsecid(cred, &secid);
+	if (secid)
+		security_secid_to_secctx(secid, &ctx, &ctx_len);
+
+	printk(KERN_ERR "CRED: ->security is %s\n", (ctx ? : "(error)"));
+
+	if (ctx)
+		security_release_secctx(ctx, ctx_len);
+}
+#endif
+
+/**
+ * selinux_uring_override_creds - check the requested cred override
+ * @new: the target creds
+ *
+ * Check to see if the current task is allowed to override it's credentials
+ * to service an io_uring operation.
+ */
+int selinux_uring_override_creds(const struct cred *new)
+{
+#if 1
+	/* XXX - debug only code, remove before committing */
+	pr_err("PMD: selinux_uring_override_creds()\n");
+	pr_err("PMD: >>> CURRENT\n");
+	dump_creds(current_cred());
+	pr_err("PMD: >>> NEW\n");
+	dump_creds(new);
+#endif
+	return avc_has_perm(&selinux_state, current_sid(), cred_sid(new),
+			    SECCLASS_IO_URING, IO_URING__OVERRIDE_CREDS, NULL);
+}
+
+/**
+ * selinux_uring_sqpoll - check if a io_uring polling thread can be created
+ *
+ * Check to see if the current task is allowed to create a new io_uring
+ * kernel polling thread.
+ */
+int selinux_uring_sqpoll(void)
+{
+	int sid = current_sid();
+#if 1
+	/* XXX - debug only code, remove before committing */
+	pr_err("PMD: selinux_uring_sqpoll()\n");
+	pr_err("PMD: >>> CURRENT\n");
+	dump_creds(current_cred());
+#endif
+	return avc_has_perm(&selinux_state, sid, sid,
+			    SECCLASS_IO_URING, IO_URING__SQPOLL, NULL);
+}
+#endif /* CONFIG_IO_URING */
+
 /*
  * IMPORTANT NOTE: When adding new hooks, please be careful to keep this order:
  * 1. any hooks that don't belong to (2.) or (3.) below,
@@ -7353,6 +7415,11 @@ static struct security_hook_list selinux_hooks[] __lsm_ro_after_init = {
 	LSM_HOOK_INIT(perf_event_write, selinux_perf_event_write),
 #endif
 
+#ifdef CONFIG_IO_URING
+	LSM_HOOK_INIT(uring_override_creds, selinux_uring_override_creds),
+	LSM_HOOK_INIT(uring_sqpoll, selinux_uring_sqpoll),
+#endif
+
 	LSM_HOOK_INIT(locked_down, selinux_lockdown),
 
 	/*
diff --git a/security/selinux/include/classmap.h b/security/selinux/include/classmap.h
index 62d19bccf3de..3314ad72279d 100644
--- a/security/selinux/include/classmap.h
+++ b/security/selinux/include/classmap.h
@@ -252,6 +252,8 @@ struct security_class_mapping secclass_map[] = {
 	  { "integrity", "confidentiality", NULL } },
 	{ "anon_inode",
 	  { COMMON_FILE_PERMS, NULL } },
+	{ "io_uring",
+	  { "override_creds", "sqpoll", NULL } },
 	{ NULL }
   };
 

