Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19A4228A655
	for <lists+selinux@lfdr.de>; Sun, 11 Oct 2020 10:30:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729266AbgJKI36 (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Sun, 11 Oct 2020 04:29:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729277AbgJKI3u (ORCPT
        <rfc822;selinux@vger.kernel.org>); Sun, 11 Oct 2020 04:29:50 -0400
Received: from mail-qt1-x84a.google.com (mail-qt1-x84a.google.com [IPv6:2607:f8b0:4864:20::84a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 154A1C0613D5
        for <selinux@vger.kernel.org>; Sun, 11 Oct 2020 01:29:49 -0700 (PDT)
Received: by mail-qt1-x84a.google.com with SMTP id b41so7170135qtk.21
        for <selinux@vger.kernel.org>; Sun, 11 Oct 2020 01:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=5MfBywdxMmsLRrplRDwjfeuNu4Dz7M8KwUBLUxZj6xM=;
        b=hBpVS7uF0dFqV+usm5krJoTk8tnGXulcNhG8ZJQffqmJqiN/AvtuYAFH4gdM7krAf4
         5Ib1hQdSL0DUZPWL/z++LUKJy8IxhRA2w+QAOv+LfPQ+YYpRjzQJCwvNAhRpalFO4xOi
         G1z50NqD9K8274QcDS0hen8+XCV+tHgIznVBklGHdqiIPwoQxL5C0i7MkxNIwkRG22U6
         Ij6bvdO2B1/sNNhUACdwbsUxlVO81o2w0f/1AnH0QaUZztaPK6x/m8VnhMqW9Z1mKI0J
         BpTIQ9S8uKzPLmbXjTbUkvX2IRP7yrhbXvxq1icfcGr1nkiWu5ZAhEt7iMG4AaDY3q2/
         VvUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=5MfBywdxMmsLRrplRDwjfeuNu4Dz7M8KwUBLUxZj6xM=;
        b=f6D88Cjadbzd/S04Zl39eiFVW0zNYHcxNL0BD+S5IWtVMhqGbtuw1XBX1xGvpbwgzm
         qsYkzvaZfJFhhWRyswz0FSm1PNMuVEoWWdnIp7QOnmY5SWMOoI2KbVIURVExMZTxhJEa
         k+PuZG5r7kcyacyKOzbu0XsYi0D6aMxO7UipRQj+jDzEif89Iq8ZIbPVvHbrSo7M07m4
         Rz4SHs08mGLh9AOGexn6PT8jr1unr3KMUJ+Uu6LVc2sw7d+FgTQwKqOTqqMJbFnMJj7T
         gngj/rQXEe3DjTYps5PyOhlipAPk8zAEgWihMpfto8yzEk1JWpdwJeURhgw42W/69Wk6
         hyFw==
X-Gm-Message-State: AOAM533gE7e9jckdLM/f5kF1dqutahb5gkWI/617vdy0TuZDsaoP4fH+
        XfYliwZDPcph+fJjXBE0g8l181ts/heGgd7kpQ==
X-Google-Smtp-Source: ABdhPJyXMlomivJVMqBM7X/DtGr65xVnyJaAqT/5gaTPmnqZk1jHkrChs/crGvAIfh7DexwBcSTGjZePaDlyt9H15Q==
Sender: "lokeshgidra via sendgmr" <lokeshgidra@lg.mtv.corp.google.com>
X-Received: from lg.mtv.corp.google.com ([2620:15c:211:202:f693:9fff:fef4:29dd])
 (user=lokeshgidra job=sendgmr) by 2002:a0c:b6d7:: with SMTP id
 h23mr20732427qve.17.1602404988144; Sun, 11 Oct 2020 01:29:48 -0700 (PDT)
Date:   Sun, 11 Oct 2020 01:29:36 -0700
In-Reply-To: <20201011082936.4131726-1-lokeshgidra@google.com>
Message-Id: <20201011082936.4131726-4-lokeshgidra@google.com>
Mime-Version: 1.0
References: <20201011082936.4131726-1-lokeshgidra@google.com>
X-Mailer: git-send-email 2.28.0.1011.ga647a8990f-goog
Subject: [PATCH v10 3/3] Use secure anon inodes for userfaultfd
From:   Lokesh Gidra <lokeshgidra@google.com>
To:     Alexander Viro <viro@zeniv.linux.org.uk>,
        James Morris <jmorris@namei.org>,
        Stephen Smalley <stephen.smalley.work@gmail.com>,
        Casey Schaufler <casey@schaufler-ca.com>,
        Eric Biggers <ebiggers@kernel.org>
Cc:     "Serge E. Hallyn" <serge@hallyn.com>,
        Paul Moore <paul@paul-moore.com>,
        Eric Paris <eparis@parisplace.org>,
        Lokesh Gidra <lokeshgidra@google.com>,
        Daniel Colascione <dancol@dancol.org>,
        Kees Cook <keescook@chromium.org>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        KP Singh <kpsingh@google.com>,
        David Howells <dhowells@redhat.com>,
        Thomas Cedeno <thomascedeno@google.com>,
        Anders Roxell <anders.roxell@linaro.org>,
        Sami Tolvanen <samitolvanen@google.com>,
        Matthew Garrett <matthewgarrett@google.com>,
        Aaron Goidel <acgoide@tycho.nsa.gov>,
        Randy Dunlap <rdunlap@infradead.org>,
        "Joel Fernandes (Google)" <joel@joelfernandes.org>,
        YueHaibing <yuehaibing@huawei.com>,
        Christian Brauner <christian.brauner@ubuntu.com>,
        Alexei Starovoitov <ast@kernel.org>,
        Alexey Budankov <alexey.budankov@linux.intel.com>,
        Adrian Reber <areber@redhat.com>,
        Aleksa Sarai <cyphar@cyphar.com>,
        linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-security-module@vger.kernel.org, selinux@vger.kernel.org,
        kaleshsingh@google.com, calin@google.com, surenb@google.com,
        nnk@google.com, jeffv@google.com, kernel-team@android.com,
        Daniel Colascione <dancol@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

From: Daniel Colascione <dancol@google.com>

This change gives userfaultfd file descriptors a real security
context, allowing policy to act on them.

Signed-off-by: Daniel Colascione <dancol@google.com>

[Remove owner inode from userfaultfd_ctx]
[Use anon_inode_getfd_secure() instead of anon_inode_getfile_secure()
 in userfaultfd syscall]
[Use inode of file in userfaultfd_read() in resolve_userfault_fork()]

Signed-off-by: Lokesh Gidra <lokeshgidra@google.com>
---
 fs/userfaultfd.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/fs/userfaultfd.c b/fs/userfaultfd.c
index 0e4a3837da52..918535b49475 100644
--- a/fs/userfaultfd.c
+++ b/fs/userfaultfd.c
@@ -978,14 +978,14 @@ static __poll_t userfaultfd_poll(struct file *file, poll_table *wait)
 
 static const struct file_operations userfaultfd_fops;
 
-static int resolve_userfault_fork(struct userfaultfd_ctx *ctx,
-				  struct userfaultfd_ctx *new,
+static int resolve_userfault_fork(struct userfaultfd_ctx *new,
+				  struct inode *inode,
 				  struct uffd_msg *msg)
 {
 	int fd;
 
-	fd = anon_inode_getfd("[userfaultfd]", &userfaultfd_fops, new,
-			      O_RDWR | (new->flags & UFFD_SHARED_FCNTL_FLAGS));
+	fd = anon_inode_getfd_secure("[userfaultfd]", &userfaultfd_fops, new,
+			O_RDWR | (new->flags & UFFD_SHARED_FCNTL_FLAGS), inode);
 	if (fd < 0)
 		return fd;
 
@@ -995,7 +995,7 @@ static int resolve_userfault_fork(struct userfaultfd_ctx *ctx,
 }
 
 static ssize_t userfaultfd_ctx_read(struct userfaultfd_ctx *ctx, int no_wait,
-				    struct uffd_msg *msg)
+				    struct uffd_msg *msg, struct inode *inode)
 {
 	ssize_t ret;
 	DECLARE_WAITQUEUE(wait, current);
@@ -1106,7 +1106,7 @@ static ssize_t userfaultfd_ctx_read(struct userfaultfd_ctx *ctx, int no_wait,
 	spin_unlock_irq(&ctx->fd_wqh.lock);
 
 	if (!ret && msg->event == UFFD_EVENT_FORK) {
-		ret = resolve_userfault_fork(ctx, fork_nctx, msg);
+		ret = resolve_userfault_fork(fork_nctx, inode, msg);
 		spin_lock_irq(&ctx->event_wqh.lock);
 		if (!list_empty(&fork_event)) {
 			/*
@@ -1166,6 +1166,7 @@ static ssize_t userfaultfd_read(struct file *file, char __user *buf,
 	ssize_t _ret, ret = 0;
 	struct uffd_msg msg;
 	int no_wait = file->f_flags & O_NONBLOCK;
+	struct inode *inode = file_inode(file);
 
 	if (ctx->state == UFFD_STATE_WAIT_API)
 		return -EINVAL;
@@ -1173,7 +1174,7 @@ static ssize_t userfaultfd_read(struct file *file, char __user *buf,
 	for (;;) {
 		if (count < sizeof(msg))
 			return ret ? ret : -EINVAL;
-		_ret = userfaultfd_ctx_read(ctx, no_wait, &msg);
+		_ret = userfaultfd_ctx_read(ctx, no_wait, &msg, inode);
 		if (_ret < 0)
 			return ret ? ret : _ret;
 		if (copy_to_user((__u64 __user *) buf, &msg, sizeof(msg)))
@@ -1995,8 +1996,8 @@ SYSCALL_DEFINE1(userfaultfd, int, flags)
 	/* prevent the mm struct to be freed */
 	mmgrab(ctx->mm);
 
-	fd = anon_inode_getfd("[userfaultfd]", &userfaultfd_fops, ctx,
-			      O_RDWR | (flags & UFFD_SHARED_FCNTL_FLAGS));
+	fd = anon_inode_getfd_secure("[userfaultfd]", &userfaultfd_fops, ctx,
+			O_RDWR | (flags & UFFD_SHARED_FCNTL_FLAGS), NULL);
 	if (fd < 0) {
 		mmdrop(ctx->mm);
 		kmem_cache_free(userfaultfd_ctx_cachep, ctx);
-- 
2.28.0.1011.ga647a8990f-goog

