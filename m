Return-Path: <selinux+bounces-609-lists+selinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 45ED68523AE
	for <lists+selinux@lfdr.de>; Tue, 13 Feb 2024 01:31:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6A3661C20905
	for <lists+selinux@lfdr.de>; Tue, 13 Feb 2024 00:31:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9E0B57861;
	Tue, 13 Feb 2024 00:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0BgbwLlK"
X-Original-To: selinux@vger.kernel.org
Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EE6E56461
	for <selinux@vger.kernel.org>; Tue, 13 Feb 2024 00:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707783592; cv=none; b=VZI17coS5vlXttqGa4Z/ZrsI8LJqVrijjlc10N94Us/ttdXGKfPAgQeFa8AbL6JThfyBZB+gYDNG4RIt0Z9Fejo/8+WCKU3Me815HfxtOhz9SOKI/sfa7OVzzD/eO+RKMlEuyb7664PVAlkCxAbrf2L91IEetMY7SRU+17XPlYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707783592; c=relaxed/simple;
	bh=A5bhvrPdjKTfnTdVO1aPAt2lC1s11dRsOATT6DQ0RO4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=fjNeVQspQTJoryvGXGBm2hJg084GqbpJXUFsE19M9Dms7Imy+DvMMuSSc2x2sm6HyQw+RAyFdyJQ6I5OtQ2dUYOUagHc8q6Cbf8nzXoHKCF3oaj+Ib8Pwxwb7nmt9VuHV+3fi6pNE7aV0Pks+2lKmsCimHAMNvFpG7of9ioJez8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--lokeshgidra.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0BgbwLlK; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--lokeshgidra.bounces.google.com
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-dc6b269686aso6087982276.1
        for <selinux@vger.kernel.org>; Mon, 12 Feb 2024 16:19:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1707783589; x=1708388389; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=p0acLNL0hrBdsLJihHiNr7h0MABVTrAouOJnKfhyS/s=;
        b=0BgbwLlK1FgK10EV7ODEFKhP7x4ZskNNNw+FF2QO57GFsLHnoaMLrNHGFVwp2EKBBa
         531V8rUEWyLaOXfPV+KANXUXKbcxTeVm9UxDex504tWesGj/RqeihEU3swTQrdcPj9ko
         jDv8toRjhfd4o25aqoVwI+P1tNQjiTmWW8ksyP09Sl0msPylr7UBjXPgEQ7fTHWesdSf
         giBM+cXXceJEeHckw0pqb3TzXtJUqGo4BvBYB40HFIFt/5rrFP1vCYZ3HiiEtopzZl5Y
         t1u7465AxfJtIY9F5l6pKuPe6+dWcp/nGeAXURfCJwPsmq6sXcat7RrKJvf3IIuCaR+C
         R94Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707783589; x=1708388389;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p0acLNL0hrBdsLJihHiNr7h0MABVTrAouOJnKfhyS/s=;
        b=eSM9vvBj6DmPXImEpt89gnYG0MTpNEbwk0M+y5ek2LNKjfe9vPoMS0V4O0vSKRpZn7
         y7/60NGJDpsSzF56paj4wNc7jLTUUewgI+tQYDP9y1zbandmH/IRzNWYfQK/Rrx3Zccv
         lwQTzDsaSZP2sT+WTsbymTeHlqwWicm+U+HYKj7GzQCdxQ7Yxr4Z0XNpn7cLtrTRoRng
         nxMxwQOc73TpKkDRuJGh1S9nQ+w+YVjbdHboo+CFD40inMvKY5QgDiAwaVv841x8AF7f
         tTO863J8e4Y8bd0uCBU30LrL0vMrMAzbRWmNUeUDuWHiHBUhwksyzqx9tLIbwz8JDJuY
         2/Jw==
X-Forwarded-Encrypted: i=1; AJvYcCUNXK5dlkfGTsF0IpP7xp3mJ0AHlItM9JrL6gjfm98h8uMp95kDxuig2+zNU//WcAyBE907zNxZ2hqxFZl3v9OD+CzO2FKs5w==
X-Gm-Message-State: AOJu0YyL9ILAdHFslRxYAHsVUbPMFJ+mio1AJ2C1uGI0wF0z+4OnM+u4
	NW9Kt3BT/VXj2Y3ujmDo4+djuua1atbzxSthuD6rD90GcMYOBI5v2+bV+whK7Sy/A63XO2m7/24
	uHVxA5BMOZgWMzoCe8xhYuw==
X-Google-Smtp-Source: AGHT+IGabpi1FIUpjHhIJoV9U+X03FKg2G8P1VhpeQN7NaunrFQnnnBYd6dTBFPSRWclcvT+yNmGkJoRbVyzmNPGQg==
X-Received: from lg.mtv.corp.google.com ([2620:15c:211:202:fd80:ef0f:6359:fc4c])
 (user=lokeshgidra job=sendgmr) by 2002:a05:6902:1005:b0:dcb:c2c0:b319 with
 SMTP id w5-20020a056902100500b00dcbc2c0b319mr91815ybt.9.1707783589269; Mon,
 12 Feb 2024 16:19:49 -0800 (PST)
Date: Mon, 12 Feb 2024 16:19:20 -0800
In-Reply-To: <20240213001920.3551772-1-lokeshgidra@google.com>
Precedence: bulk
X-Mailing-List: selinux@vger.kernel.org
List-Id: <selinux.vger.kernel.org>
List-Subscribe: <mailto:selinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:selinux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240213001920.3551772-1-lokeshgidra@google.com>
X-Mailer: git-send-email 2.43.0.687.g38aa6559b0-goog
Message-ID: <20240213001920.3551772-4-lokeshgidra@google.com>
Subject: [PATCH v5 3/3] userfaultfd: use per-vma locks in userfaultfd operations
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

All userfaultfd operations, except write-protect, opportunistically use
per-vma locks to lock vmas. On failure, attempt again inside mmap_lock
critical section.

Write-protect operation requires mmap_lock as it iterates over multiple
vmas.

Signed-off-by: Lokesh Gidra <lokeshgidra@google.com>
---
 fs/userfaultfd.c              |  13 +-
 include/linux/userfaultfd_k.h |   5 +-
 mm/userfaultfd.c              | 392 ++++++++++++++++++++++++++--------
 3 files changed, 312 insertions(+), 98 deletions(-)

diff --git a/fs/userfaultfd.c b/fs/userfaultfd.c
index c00a021bcce4..60dcfafdc11a 100644
--- a/fs/userfaultfd.c
+++ b/fs/userfaultfd.c
@@ -2005,17 +2005,8 @@ static int userfaultfd_move(struct userfaultfd_ctx *ctx,
 		return -EINVAL;
 
 	if (mmget_not_zero(mm)) {
-		mmap_read_lock(mm);
-
-		/* Re-check after taking map_changing_lock */
-		down_read(&ctx->map_changing_lock);
-		if (likely(!atomic_read(&ctx->mmap_changing)))
-			ret = move_pages(ctx, mm, uffdio_move.dst, uffdio_move.src,
-					 uffdio_move.len, uffdio_move.mode);
-		else
-			ret = -EAGAIN;
-		up_read(&ctx->map_changing_lock);
-		mmap_read_unlock(mm);
+		ret = move_pages(ctx, uffdio_move.dst, uffdio_move.src,
+				 uffdio_move.len, uffdio_move.mode);
 		mmput(mm);
 	} else {
 		return -ESRCH;
diff --git a/include/linux/userfaultfd_k.h b/include/linux/userfaultfd_k.h
index 3210c3552976..05d59f74fc88 100644
--- a/include/linux/userfaultfd_k.h
+++ b/include/linux/userfaultfd_k.h
@@ -138,9 +138,8 @@ extern long uffd_wp_range(struct vm_area_struct *vma,
 /* move_pages */
 void double_pt_lock(spinlock_t *ptl1, spinlock_t *ptl2);
 void double_pt_unlock(spinlock_t *ptl1, spinlock_t *ptl2);
-ssize_t move_pages(struct userfaultfd_ctx *ctx, struct mm_struct *mm,
-		   unsigned long dst_start, unsigned long src_start,
-		   unsigned long len, __u64 flags);
+ssize_t move_pages(struct userfaultfd_ctx *ctx, unsigned long dst_start,
+		   unsigned long src_start, unsigned long len, __u64 flags);
 int move_pages_huge_pmd(struct mm_struct *mm, pmd_t *dst_pmd, pmd_t *src_pmd, pmd_t dst_pmdval,
 			struct vm_area_struct *dst_vma,
 			struct vm_area_struct *src_vma,
diff --git a/mm/userfaultfd.c b/mm/userfaultfd.c
index 74aad0831e40..eb7ff220f315 100644
--- a/mm/userfaultfd.c
+++ b/mm/userfaultfd.c
@@ -20,19 +20,11 @@
 #include "internal.h"
 
 static __always_inline
-struct vm_area_struct *find_dst_vma(struct mm_struct *dst_mm,
-				    unsigned long dst_start,
-				    unsigned long len)
+bool validate_dst_vma(struct vm_area_struct *dst_vma, unsigned long dst_end)
 {
-	/*
-	 * Make sure that the dst range is both valid and fully within a
-	 * single existing vma.
-	 */
-	struct vm_area_struct *dst_vma;
-
-	dst_vma = find_vma(dst_mm, dst_start);
-	if (!range_in_vma(dst_vma, dst_start, dst_start + len))
-		return NULL;
+	/* Make sure that the dst range is fully within dst_vma. */
+	if (dst_end > dst_vma->vm_end)
+		return false;
 
 	/*
 	 * Check the vma is registered in uffd, this is required to
@@ -40,10 +32,118 @@ struct vm_area_struct *find_dst_vma(struct mm_struct *dst_mm,
 	 * time.
 	 */
 	if (!dst_vma->vm_userfaultfd_ctx.ctx)
-		return NULL;
+		return false;
+
+	return true;
+}
+
+static __always_inline
+struct vm_area_struct *find_vma_and_prepare_anon(struct mm_struct *mm,
+						 unsigned long addr)
+{
+	struct vm_area_struct *vma;
+
+	mmap_assert_locked(mm);
+	vma = vma_lookup(mm, addr);
+	if (!vma)
+		vma = ERR_PTR(-ENOENT);
+	else if (!(vma->vm_flags & VM_SHARED) && anon_vma_prepare(vma))
+		vma = ERR_PTR(-ENOMEM);
+
+	return vma;
+}
+
+#ifdef CONFIG_PER_VMA_LOCK
+/*
+ * lock_vma() - Lookup and lock vma corresponding to @address.
+ * @mm: mm to search vma in.
+ * @address: address that the vma should contain.
+ *
+ * Should be called without holding mmap_lock. vma should be unlocked after use
+ * with unlock_vma().
+ *
+ * Return: A locked vma containing @address, -ENOENT if no vma is found, or
+ * -ENOMEM if anon_vma couldn't be allocated.
+ */
+static struct vm_area_struct *lock_vma(struct mm_struct *mm,
+				       unsigned long address)
+{
+	struct vm_area_struct *vma;
+
+	vma = lock_vma_under_rcu(mm, address);
+	if (vma) {
+		/*
+		 * lock_vma_under_rcu() only checks anon_vma for private
+		 * anonymous mappings. But we need to ensure it is assigned in
+		 * private file-backed vmas as well.
+		 */
+		if (!(vma->vm_flags & VM_SHARED) && !vma->anon_vma)
+			vma_end_read(vma);
+		else
+			return vma;
+	}
+
+	mmap_read_lock(mm);
+	vma = find_vma_and_prepare_anon(mm, address);
+	if (!IS_ERR(vma)) {
+		/*
+		 * We cannot use vma_start_read() as it may fail due to
+		 * false locked (see comment in vma_start_read()). We
+		 * can avoid that by directly locking vm_lock under
+		 * mmap_lock, which guarantees that nobody can lock the
+		 * vma for write (vma_start_write()) under us.
+		 */
+		down_read(&vma->vm_lock->lock);
+	}
+
+	mmap_read_unlock(mm);
+	return vma;
+}
+
+static void unlock_vma(struct vm_area_struct *vma)
+{
+	vma_end_read(vma);
+}
+
+static struct vm_area_struct *find_and_lock_dst_vma(struct mm_struct *dst_mm,
+						    unsigned long dst_start,
+						    unsigned long len)
+{
+	struct vm_area_struct *dst_vma;
 
-	return dst_vma;
+	dst_vma = lock_vma(dst_mm, dst_start);
+	if (IS_ERR(dst_vma) || validate_dst_vma(dst_vma, dst_start + len))
+		return dst_vma;
+
+	unlock_vma(dst_vma);
+	return ERR_PTR(-ENOENT);
+}
+
+#else
+
+static struct vm_area_struct *lock_mm_and_find_dst_vma(struct mm_struct *dst_mm,
+						       unsigned long dst_start,
+						       unsigned long len)
+{
+	struct vm_area_struct *dst_vma;
+	int err;
+
+	mmap_read_lock(dst_mm);
+	dst_vma = find_vma_and_prepare_anon(dst_mm, dst_start);
+	if (IS_ERR(dst_vma)) {
+		err = PTR_ERR(dst_vma);
+		goto out_unlock;
+	}
+
+	if (validate_dst_vma(dst_vma, dst_start + len))
+		return dst_vma;
+
+	err = -ENOENT;
+out_unlock:
+	mmap_read_unlock(dst_mm);
+	return ERR_PTR(err);
 }
+#endif
 
 /* Check if dst_addr is outside of file's size. Must be called with ptl held. */
 static bool mfill_file_over_size(struct vm_area_struct *dst_vma,
@@ -350,7 +450,8 @@ static pmd_t *mm_alloc_pmd(struct mm_struct *mm, unsigned long address)
 #ifdef CONFIG_HUGETLB_PAGE
 /*
  * mfill_atomic processing for HUGETLB vmas.  Note that this routine is
- * called with mmap_lock held, it will release mmap_lock before returning.
+ * called with either vma-lock or mmap_lock held, it will release the lock
+ * before returning.
  */
 static __always_inline ssize_t mfill_atomic_hugetlb(
 					      struct userfaultfd_ctx *ctx,
@@ -361,7 +462,6 @@ static __always_inline ssize_t mfill_atomic_hugetlb(
 					      uffd_flags_t flags)
 {
 	struct mm_struct *dst_mm = dst_vma->vm_mm;
-	int vm_shared = dst_vma->vm_flags & VM_SHARED;
 	ssize_t err;
 	pte_t *dst_pte;
 	unsigned long src_addr, dst_addr;
@@ -380,7 +480,11 @@ static __always_inline ssize_t mfill_atomic_hugetlb(
 	 */
 	if (uffd_flags_mode_is(flags, MFILL_ATOMIC_ZEROPAGE)) {
 		up_read(&ctx->map_changing_lock);
+#ifdef CONFIG_PER_VMA_LOCK
+		unlock_vma(dst_vma);
+#else
 		mmap_read_unlock(dst_mm);
+#endif
 		return -EINVAL;
 	}
 
@@ -403,24 +507,32 @@ static __always_inline ssize_t mfill_atomic_hugetlb(
 	 * retry, dst_vma will be set to NULL and we must lookup again.
 	 */
 	if (!dst_vma) {
+#ifdef CONFIG_PER_VMA_LOCK
+		dst_vma = find_and_lock_dst_vma(dst_mm, dst_start, len);
+#else
+		dst_vma = lock_mm_and_find_dst_vma(dst_mm, dst_start, len);
+#endif
+		if (IS_ERR(dst_vma)) {
+			err = PTR_ERR(dst_vma);
+			goto out;
+		}
+
 		err = -ENOENT;
-		dst_vma = find_dst_vma(dst_mm, dst_start, len);
-		if (!dst_vma || !is_vm_hugetlb_page(dst_vma))
-			goto out_unlock;
+		if (!is_vm_hugetlb_page(dst_vma))
+			goto out_unlock_vma;
 
 		err = -EINVAL;
 		if (vma_hpagesize != vma_kernel_pagesize(dst_vma))
-			goto out_unlock;
-
-		vm_shared = dst_vma->vm_flags & VM_SHARED;
-	}
+			goto out_unlock_vma;
 
-	/*
-	 * If not shared, ensure the dst_vma has a anon_vma.
-	 */
-	err = -ENOMEM;
-	if (!vm_shared) {
-		if (unlikely(anon_vma_prepare(dst_vma)))
+		/*
+		 * If memory mappings are changing because of non-cooperative
+		 * operation (e.g. mremap) running in parallel, bail out and
+		 * request the user to retry later
+		 */
+		down_read(&ctx->map_changing_lock);
+		err = -EAGAIN;
+		if (atomic_read(&ctx->mmap_changing))
 			goto out_unlock;
 	}
 
@@ -465,7 +577,11 @@ static __always_inline ssize_t mfill_atomic_hugetlb(
 
 		if (unlikely(err == -ENOENT)) {
 			up_read(&ctx->map_changing_lock);
+#ifdef CONFIG_PER_VMA_LOCK
+			unlock_vma(dst_vma);
+#else
 			mmap_read_unlock(dst_mm);
+#endif
 			BUG_ON(!folio);
 
 			err = copy_folio_from_user(folio,
@@ -474,17 +590,6 @@ static __always_inline ssize_t mfill_atomic_hugetlb(
 				err = -EFAULT;
 				goto out;
 			}
-			mmap_read_lock(dst_mm);
-			down_read(&ctx->map_changing_lock);
-			/*
-			 * If memory mappings are changing because of non-cooperative
-			 * operation (e.g. mremap) running in parallel, bail out and
-			 * request the user to retry later
-			 */
-			if (atomic_read(&ctx->mmap_changing)) {
-				err = -EAGAIN;
-				break;
-			}
 
 			dst_vma = NULL;
 			goto retry;
@@ -505,7 +610,12 @@ static __always_inline ssize_t mfill_atomic_hugetlb(
 
 out_unlock:
 	up_read(&ctx->map_changing_lock);
+out_unlock_vma:
+#ifdef CONFIG_PER_VMA_LOCK
+	unlock_vma(dst_vma);
+#else
 	mmap_read_unlock(dst_mm);
+#endif
 out:
 	if (folio)
 		folio_put(folio);
@@ -597,7 +707,19 @@ static __always_inline ssize_t mfill_atomic(struct userfaultfd_ctx *ctx,
 	copied = 0;
 	folio = NULL;
 retry:
-	mmap_read_lock(dst_mm);
+	/*
+	 * Make sure the vma is not shared, that the dst range is
+	 * both valid and fully within a single existing vma.
+	 */
+#ifdef CONFIG_PER_VMA_LOCK
+	dst_vma = find_and_lock_dst_vma(dst_mm, dst_start, len);
+#else
+	dst_vma = lock_mm_and_find_dst_vma(dst_mm, dst_start, len);
+#endif
+	if (IS_ERR(dst_vma)) {
+		err = PTR_ERR(dst_vma);
+		goto out;
+	}
 
 	/*
 	 * If memory mappings are changing because of non-cooperative
@@ -609,15 +731,6 @@ static __always_inline ssize_t mfill_atomic(struct userfaultfd_ctx *ctx,
 	if (atomic_read(&ctx->mmap_changing))
 		goto out_unlock;
 
-	/*
-	 * Make sure the vma is not shared, that the dst range is
-	 * both valid and fully within a single existing vma.
-	 */
-	err = -ENOENT;
-	dst_vma = find_dst_vma(dst_mm, dst_start, len);
-	if (!dst_vma)
-		goto out_unlock;
-
 	err = -EINVAL;
 	/*
 	 * shmem_zero_setup is invoked in mmap for MAP_ANONYMOUS|MAP_SHARED but
@@ -647,16 +760,6 @@ static __always_inline ssize_t mfill_atomic(struct userfaultfd_ctx *ctx,
 	    uffd_flags_mode_is(flags, MFILL_ATOMIC_CONTINUE))
 		goto out_unlock;
 
-	/*
-	 * Ensure the dst_vma has a anon_vma or this page
-	 * would get a NULL anon_vma when moved in the
-	 * dst_vma.
-	 */
-	err = -ENOMEM;
-	if (!(dst_vma->vm_flags & VM_SHARED) &&
-	    unlikely(anon_vma_prepare(dst_vma)))
-		goto out_unlock;
-
 	while (src_addr < src_start + len) {
 		pmd_t dst_pmdval;
 
@@ -699,7 +802,11 @@ static __always_inline ssize_t mfill_atomic(struct userfaultfd_ctx *ctx,
 			void *kaddr;
 
 			up_read(&ctx->map_changing_lock);
+#ifdef CONFIG_PER_VMA_LOCK
+			unlock_vma(dst_vma);
+#else
 			mmap_read_unlock(dst_mm);
+#endif
 			BUG_ON(!folio);
 
 			kaddr = kmap_local_folio(folio, 0);
@@ -730,7 +837,11 @@ static __always_inline ssize_t mfill_atomic(struct userfaultfd_ctx *ctx,
 
 out_unlock:
 	up_read(&ctx->map_changing_lock);
+#ifdef CONFIG_PER_VMA_LOCK
+	unlock_vma(dst_vma);
+#else
 	mmap_read_unlock(dst_mm);
+#endif
 out:
 	if (folio)
 		folio_put(folio);
@@ -1267,27 +1378,119 @@ static int validate_move_areas(struct userfaultfd_ctx *ctx,
 	if (!vma_is_anonymous(src_vma) || !vma_is_anonymous(dst_vma))
 		return -EINVAL;
 
+	return 0;
+}
+
+static __always_inline
+long find_vmas_mm_locked(struct mm_struct *mm,
+			 unsigned long dst_start,
+			 unsigned long src_start,
+			 struct vm_area_struct **dst_vmap,
+			 struct vm_area_struct **src_vmap)
+{
+	struct vm_area_struct *vma;
+
+	mmap_assert_locked(mm);
+	vma = find_vma_and_prepare_anon(mm, dst_start);
+	if (IS_ERR(vma))
+		return PTR_ERR(vma);
+
+	*dst_vmap = vma;
+	/* Skip finding src_vma if src_start is in dst_vma */
+	if (src_start >= vma->vm_start && src_start < vma->vm_end)
+		goto out_success;
+
+	vma = vma_lookup(mm, src_start);
+	if (!vma)
+		return -ENOENT;
+out_success:
+	*src_vmap = vma;
+	return 0;
+}
+
+#ifdef CONFIG_PER_VMA_LOCK
+static long find_and_lock_vmas(struct mm_struct *mm,
+			       unsigned long dst_start,
+			       unsigned long src_start,
+			       struct vm_area_struct **dst_vmap,
+			       struct vm_area_struct **src_vmap)
+{
+	struct vm_area_struct *vma;
+	long err;
+
+	vma = lock_vma(mm, dst_start);
+	if (IS_ERR(vma))
+		return PTR_ERR(vma);
+
+	*dst_vmap = vma;
 	/*
-	 * Ensure the dst_vma has a anon_vma or this page
-	 * would get a NULL anon_vma when moved in the
-	 * dst_vma.
+	 * Skip finding src_vma if src_start is in dst_vma. This also ensures
+	 * that we don't lock the same vma twice.
 	 */
-	if (unlikely(anon_vma_prepare(dst_vma)))
-		return -ENOMEM;
+	if (src_start >= vma->vm_start && src_start < vma->vm_end) {
+		*src_vmap = vma;
+		return 0;
+	}
 
-	return 0;
+	/*
+	 * Using lock_vma() to get src_vma can lead to following deadlock:
+	 *
+	 * Thread1				Thread2
+	 * -------				-------
+	 * vma_start_read(dst_vma)
+	 *					mmap_write_lock(mm)
+	 *					vma_start_write(src_vma)
+	 * vma_start_read(src_vma)
+	 * mmap_read_lock(mm)
+	 *					vma_start_write(dst_vma)
+	 */
+	*src_vmap = lock_vma_under_rcu(mm, src_start);
+	if (likely(*src_vmap))
+		return 0;
+
+	/* Undo any locking and retry in mmap_lock critical section */
+	vma_end_read(*dst_vmap);
+
+	mmap_read_lock(mm);
+	err = find_vmas_mm_locked(mm, dst_start, src_start, dst_vmap, src_vmap);
+	if (!err) {
+		/*
+		 * See comment in lock_vma() as to why not using
+		 * vma_start_read() here.
+		 */
+		down_read(&(*dst_vmap)->vm_lock->lock);
+		if (*dst_vmap != *src_vmap)
+			down_read(&(*src_vmap)->vm_lock->lock);
+	}
+	mmap_read_unlock(mm);
+	return err;
+}
+#else
+static long lock_mm_and_find_vmas(struct mm_struct *mm,
+				  unsigned long dst_start,
+				  unsigned long src_start,
+				  struct vm_area_struct **dst_vmap,
+				  struct vm_area_struct **src_vmap)
+{
+	long err;
+
+	mmap_read_lock(mm);
+	err = find_vmas_mm_locked(mm, dst_start, src_start, dst_vmap, src_vmap);
+	if (err)
+		mmap_read_unlock(mm);
+	return err;
 }
+#endif
 
 /**
  * move_pages - move arbitrary anonymous pages of an existing vma
  * @ctx: pointer to the userfaultfd context
- * @mm: the address space to move pages
  * @dst_start: start of the destination virtual memory range
  * @src_start: start of the source virtual memory range
  * @len: length of the virtual memory range
  * @mode: flags from uffdio_move.mode
  *
- * Must be called with mmap_lock held for read.
+ * It will either use the mmap_lock in read mode or per-vma locks
  *
  * move_pages() remaps arbitrary anonymous pages atomically in zero
  * copy. It only works on non shared anonymous pages because those can
@@ -1355,10 +1558,10 @@ static int validate_move_areas(struct userfaultfd_ctx *ctx,
  * could be obtained. This is the only additional complexity added to
  * the rmap code to provide this anonymous page remapping functionality.
  */
-ssize_t move_pages(struct userfaultfd_ctx *ctx, struct mm_struct *mm,
-		   unsigned long dst_start, unsigned long src_start,
-		   unsigned long len, __u64 mode)
+ssize_t move_pages(struct userfaultfd_ctx *ctx, unsigned long dst_start,
+		   unsigned long src_start, unsigned long len, __u64 mode)
 {
+	struct mm_struct *mm = ctx->mm;
 	struct vm_area_struct *src_vma, *dst_vma;
 	unsigned long src_addr, dst_addr;
 	pmd_t *src_pmd, *dst_pmd;
@@ -1376,28 +1579,40 @@ ssize_t move_pages(struct userfaultfd_ctx *ctx, struct mm_struct *mm,
 	    WARN_ON_ONCE(dst_start + len <= dst_start))
 		goto out;
 
+#ifdef CONFIG_PER_VMA_LOCK
+	err = find_and_lock_vmas(mm, dst_start, src_start,
+				 &dst_vma, &src_vma);
+#else
+	err = lock_mm_and_find_vmas(mm, dst_start, src_start,
+				    &dst_vma, &src_vma);
+#endif
+	if (err)
+		goto out;
+
+	/* Re-check after taking map_changing_lock */
+	err = -EAGAIN;
+	down_read(&ctx->map_changing_lock);
+	if (likely(atomic_read(&ctx->mmap_changing)))
+		goto out_unlock;
 	/*
 	 * Make sure the vma is not shared, that the src and dst remap
 	 * ranges are both valid and fully within a single existing
 	 * vma.
 	 */
-	src_vma = find_vma(mm, src_start);
-	if (!src_vma || (src_vma->vm_flags & VM_SHARED))
-		goto out;
-	if (src_start < src_vma->vm_start ||
-	    src_start + len > src_vma->vm_end)
-		goto out;
+	err = -EINVAL;
+	if (src_vma->vm_flags & VM_SHARED)
+		goto out_unlock;
+	if (src_start + len > src_vma->vm_end)
+		goto out_unlock;
 
-	dst_vma = find_vma(mm, dst_start);
-	if (!dst_vma || (dst_vma->vm_flags & VM_SHARED))
-		goto out;
-	if (dst_start < dst_vma->vm_start ||
-	    dst_start + len > dst_vma->vm_end)
-		goto out;
+	if (dst_vma->vm_flags & VM_SHARED)
+		goto out_unlock;
+	if (dst_start + len > dst_vma->vm_end)
+		goto out_unlock;
 
 	err = validate_move_areas(ctx, src_vma, dst_vma);
 	if (err)
-		goto out;
+		goto out_unlock;
 
 	for (src_addr = src_start, dst_addr = dst_start;
 	     src_addr < src_start + len;) {
@@ -1514,6 +1729,15 @@ ssize_t move_pages(struct userfaultfd_ctx *ctx, struct mm_struct *mm,
 		moved += step_size;
 	}
 
+out_unlock:
+	up_read(&ctx->map_changing_lock);
+#ifdef CONFIG_PER_VMA_LOCK
+	unlock_vma(src_vma);
+	if (src_vma != dst_vma)
+		unlock_vma(dst_vma);
+#else
+	mmap_read_unlock(mm);
+#endif
 out:
 	VM_WARN_ON(moved < 0);
 	VM_WARN_ON(err > 0);
-- 
2.43.0.687.g38aa6559b0-goog


