Return-Path: <selinux+bounces-559-lists+selinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 09E1684EA63
	for <lists+selinux@lfdr.de>; Thu,  8 Feb 2024 22:24:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F21061C241D3
	for <lists+selinux@lfdr.de>; Thu,  8 Feb 2024 21:24:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B5424F202;
	Thu,  8 Feb 2024 21:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BVJoV+hD"
X-Original-To: selinux@vger.kernel.org
Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89B454F1F5
	for <selinux@vger.kernel.org>; Thu,  8 Feb 2024 21:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707427339; cv=none; b=krh4VsyEG7CP4QRf2I2AE2GoPXr3FFRRN/ze9D/OzOTl+pS+a0BxsLzw9FUcRqWNZ4YQoGkxcsxqW2dqlJZ/Qo4Knhd7B1oFB48cG03tVuqnr/ZLvTYbTSoPo73ZGIRD9lFTvVwuHTAR8Tdh+Hf0Dtv9uRT/cY8Wu9mvfPWRYA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707427339; c=relaxed/simple;
	bh=z41+dvNtRXeKCs53H9ygm12hU6JxKhETApVU+NXe4U4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=o9zfDLFAGfjFTJWX1E86vsEcJotJSnocoYGfDdtUvrBwH/Gj0jKLhmMFM9j2rLBEEcKHNUPzBlPFHsdzXIJfOm3LtWs9Aipm0IUnP8o1h7uiGPCuRb1EcCYUzVA2vmnfVwhYjI09sKHrB11y7J5Jrg62AIsaOmR44u1BmGfy/9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--lokeshgidra.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BVJoV+hD; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--lokeshgidra.bounces.google.com
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-60492d6bfc0so5646207b3.2
        for <selinux@vger.kernel.org>; Thu, 08 Feb 2024 13:22:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1707427335; x=1708032135; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=FeTp34JzZtDcGzw26Xy4JuyVdUXeLDl6wgD9/498E4U=;
        b=BVJoV+hD4R0hxsMHv8UySiQtBEyXUxlscxVHWN4PiVIieIeuQ4ODp6L4TlQZap4vYU
         7kphAzxFH/bfog49Pg2pydlcK7UUub1Sg0z0tYte53drvCvzXFJ0X60Ik3FwvA67PUHV
         uspFukHOGu9AUOPBCNyvQPxOQq3kvzt+SsUYCMT2zdJC3VBk2lrQND4HgI+zLNkYZjYo
         B3G8ztZt3NNW7Nny2kjyBzFFP4zFKvGMyULXB0D7XSyJvjhsDC4NdeXCUs1s+A9XMfs9
         ZcdU3bHMA9BGysVlkW8zu0XmEFbdrI7DUT5ym84ubfBujxuAFSw+cRji6gVT/E2KKaB/
         VSSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707427335; x=1708032135;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FeTp34JzZtDcGzw26Xy4JuyVdUXeLDl6wgD9/498E4U=;
        b=rXIqXsaXkZqLVQgyCx2sSl0kngiVvt+woLiHXhix5mVjc5ptYIZUK82NPmYLNmq0k0
         yeduA2n5S+EllrbeO+ID6v9BEOVP/53AuW8Btw5oA4KZQ7lSJm2X5UpaHrn+poEfCOM1
         EdKwrTTIhQm9QAnk9eyoVLRDXLqq59irMK3ALe4n49Mniro2G5bLXDGZYbbsnAEFIPB9
         s2DkIbOyY0Pln5TzzB4SSBrhLEZslisAQ3JeAGr5gJ1DJjjV/TAwORaAYEq7PzohDDUS
         XOyJvYGSr3om+9YdndBEaW8eGPWN+Ov73jE6eqFNxgArr5dPol1tKcQ3AMKfbmmbHkqj
         w4pg==
X-Gm-Message-State: AOJu0Yz//MruZ+IxL+F/g54BKOt0uTaxfUkE4nnY4EJG3vyGnbO8Yslq
	YRRt76xHQ5w9uOkpYcSObCRjNC8+DNYgvn9gOB+irzayN1qeZdBf+vGAnwIQ8scejrFWUyKpOIq
	ksOCMgbamjhAvfMURQYwN3Q==
X-Google-Smtp-Source: AGHT+IEU/rITDSgvPlrw4EgfUfRceJKqlUTpaOVq6aKKDnlTmsQYo2lPuV1sCIYnSwJGgLrvzLIw+YSJUuAsvhO0Tw==
X-Received: from lg.mtv.corp.google.com ([2620:15c:211:202:e9ba:42a8:6aba:f5d5])
 (user=lokeshgidra job=sendgmr) by 2002:a81:4e85:0:b0:602:d545:a3bb with SMTP
 id c127-20020a814e85000000b00602d545a3bbmr93801ywb.1.1707427335604; Thu, 08
 Feb 2024 13:22:15 -0800 (PST)
Date: Thu,  8 Feb 2024 13:22:02 -0800
In-Reply-To: <20240208212204.2043140-1-lokeshgidra@google.com>
Precedence: bulk
X-Mailing-List: selinux@vger.kernel.org
List-Id: <selinux.vger.kernel.org>
List-Subscribe: <mailto:selinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:selinux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240208212204.2043140-1-lokeshgidra@google.com>
X-Mailer: git-send-email 2.43.0.687.g38aa6559b0-goog
Message-ID: <20240208212204.2043140-2-lokeshgidra@google.com>
Subject: [PATCH v4 1/3] userfaultfd: move userfaultfd_ctx struct to header file
From: Lokesh Gidra <lokeshgidra@google.com>
To: akpm@linux-foundation.org
Cc: lokeshgidra@google.com, linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, selinux@vger.kernel.org, surenb@google.com, 
	kernel-team@android.com, aarcange@redhat.com, peterx@redhat.com, 
	david@redhat.com, axelrasmussen@google.com, bgeffon@google.com, 
	willy@infradead.org, jannh@google.com, kaleshsingh@google.com, 
	ngeoffray@google.com, timmurray@google.com, rppt@kernel.org, 
	Liam.Howlett@oracle.com
Content-Type: text/plain; charset="UTF-8"

Moving the struct to userfaultfd_k.h to be accessible from
mm/userfaultfd.c. There are no other changes in the struct.

This is required to prepare for using per-vma locks in userfaultfd
operations.

Signed-off-by: Lokesh Gidra <lokeshgidra@google.com>
Reviewed-by: Mike Rapoport (IBM) <rppt@kernel.org>
---
 fs/userfaultfd.c              | 39 -----------------------------------
 include/linux/userfaultfd_k.h | 39 +++++++++++++++++++++++++++++++++++
 2 files changed, 39 insertions(+), 39 deletions(-)

diff --git a/fs/userfaultfd.c b/fs/userfaultfd.c
index 05c8e8a05427..58331b83d648 100644
--- a/fs/userfaultfd.c
+++ b/fs/userfaultfd.c
@@ -50,45 +50,6 @@ static struct ctl_table vm_userfaultfd_table[] = {
 
 static struct kmem_cache *userfaultfd_ctx_cachep __ro_after_init;
 
-/*
- * Start with fault_pending_wqh and fault_wqh so they're more likely
- * to be in the same cacheline.
- *
- * Locking order:
- *	fd_wqh.lock
- *		fault_pending_wqh.lock
- *			fault_wqh.lock
- *		event_wqh.lock
- *
- * To avoid deadlocks, IRQs must be disabled when taking any of the above locks,
- * since fd_wqh.lock is taken by aio_poll() while it's holding a lock that's
- * also taken in IRQ context.
- */
-struct userfaultfd_ctx {
-	/* waitqueue head for the pending (i.e. not read) userfaults */
-	wait_queue_head_t fault_pending_wqh;
-	/* waitqueue head for the userfaults */
-	wait_queue_head_t fault_wqh;
-	/* waitqueue head for the pseudo fd to wakeup poll/read */
-	wait_queue_head_t fd_wqh;
-	/* waitqueue head for events */
-	wait_queue_head_t event_wqh;
-	/* a refile sequence protected by fault_pending_wqh lock */
-	seqcount_spinlock_t refile_seq;
-	/* pseudo fd refcounting */
-	refcount_t refcount;
-	/* userfaultfd syscall flags */
-	unsigned int flags;
-	/* features requested from the userspace */
-	unsigned int features;
-	/* released */
-	bool released;
-	/* memory mappings are changing because of non-cooperative event */
-	atomic_t mmap_changing;
-	/* mm with one ore more vmas attached to this userfaultfd_ctx */
-	struct mm_struct *mm;
-};
-
 struct userfaultfd_fork_ctx {
 	struct userfaultfd_ctx *orig;
 	struct userfaultfd_ctx *new;
diff --git a/include/linux/userfaultfd_k.h b/include/linux/userfaultfd_k.h
index e4056547fbe6..691d928ee864 100644
--- a/include/linux/userfaultfd_k.h
+++ b/include/linux/userfaultfd_k.h
@@ -36,6 +36,45 @@
 #define UFFD_SHARED_FCNTL_FLAGS (O_CLOEXEC | O_NONBLOCK)
 #define UFFD_FLAGS_SET (EFD_SHARED_FCNTL_FLAGS)
 
+/*
+ * Start with fault_pending_wqh and fault_wqh so they're more likely
+ * to be in the same cacheline.
+ *
+ * Locking order:
+ *	fd_wqh.lock
+ *		fault_pending_wqh.lock
+ *			fault_wqh.lock
+ *		event_wqh.lock
+ *
+ * To avoid deadlocks, IRQs must be disabled when taking any of the above locks,
+ * since fd_wqh.lock is taken by aio_poll() while it's holding a lock that's
+ * also taken in IRQ context.
+ */
+struct userfaultfd_ctx {
+	/* waitqueue head for the pending (i.e. not read) userfaults */
+	wait_queue_head_t fault_pending_wqh;
+	/* waitqueue head for the userfaults */
+	wait_queue_head_t fault_wqh;
+	/* waitqueue head for the pseudo fd to wakeup poll/read */
+	wait_queue_head_t fd_wqh;
+	/* waitqueue head for events */
+	wait_queue_head_t event_wqh;
+	/* a refile sequence protected by fault_pending_wqh lock */
+	seqcount_spinlock_t refile_seq;
+	/* pseudo fd refcounting */
+	refcount_t refcount;
+	/* userfaultfd syscall flags */
+	unsigned int flags;
+	/* features requested from the userspace */
+	unsigned int features;
+	/* released */
+	bool released;
+	/* memory mappings are changing because of non-cooperative event */
+	atomic_t mmap_changing;
+	/* mm with one ore more vmas attached to this userfaultfd_ctx */
+	struct mm_struct *mm;
+};
+
 extern vm_fault_t handle_userfault(struct vm_fault *vmf, unsigned long reason);
 
 /* A combined operation mode + behavior flags. */
-- 
2.43.0.687.g38aa6559b0-goog


