Return-Path: <selinux+bounces-450-lists+selinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 289348414AE
	for <lists+selinux@lfdr.de>; Mon, 29 Jan 2024 21:53:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 14EB21C23B70
	for <lists+selinux@lfdr.de>; Mon, 29 Jan 2024 20:53:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E832F1552F2;
	Mon, 29 Jan 2024 20:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dl+dgurI"
X-Original-To: selinux@vger.kernel.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2C9A157E68
	for <selinux@vger.kernel.org>; Mon, 29 Jan 2024 20:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706561581; cv=none; b=sawEt1Vzedpr8H4+GgyI1K95hlBPQtysqbq5q0PUY0VUGUqtse+N2xpgHZ5R8k8vug6say5n/lbKukSPRBI8WamsY7/PfeMmftldUiJkMDz8+fmAW1hx1u2H/ql2DoHRee6HtkXdM8z+Z0t3WU8TmyGKC14rYqmjbHyUoQHXjPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706561581; c=relaxed/simple;
	bh=g7ZdhbpANJOVaevIQeVK+1toHfMHWwU67h7ybvCN+o8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=YiIo3IoYglAktbC8wTKQGQco3BlDneR/meQqYE+SdbI0Yin4hwscG8TaSAPgZ+w2bPhWNf7JIPp3MqTF8Zc0nzbp+nkF+OmKKnAzqE0uNGKnqJIErA3j5X3BNzeaDk96M/sUNi7RqBGtjwwghGO4Xi82kUufeMYpE9KasV/t1NI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dl+dgurI; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-602cf7dfeb1so30489347b3.0
        for <selinux@vger.kernel.org>; Mon, 29 Jan 2024 12:52:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1706561579; x=1707166379; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I6c3s6W4387xNYwMOxxsc37wD0YgKnZOAa+81n+g6fc=;
        b=dl+dgurIbZvND2akGla+RUfx4Z/iMMaB1xdE3xM30VIYWSjO0zadL5auVYxEhugnQq
         YkWtkoFR+Se6KSC9Ao3+CLAHQmy/MWgRBqEoJiGlht1mm1szP9xLogGAOW29eaJA/WyY
         8nPI0LhLzJ6KC5gump+XEnyZAArN17bMAhNPEjhwCtB9AhfwuCIKE+tQixMLrEIHJfwD
         iEXwA/0eHwOAuo5qKFP8jJcLHgAM1cfv8173XOB4MM0lrt8lH5UnKV817tjHHKI+8UdR
         gvklh6C+mPp5Gdxn02SwZzk2vI5/w41kymzoHzCsTO0sXCz/rnDkmNPopGqzfqWzYkDS
         n1tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706561579; x=1707166379;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I6c3s6W4387xNYwMOxxsc37wD0YgKnZOAa+81n+g6fc=;
        b=owHxmFow6q2+nMzeGH3l11dKLXIzWkRZ6V0YnWy0zzW9axNiddN24IjDUuHCAROI8d
         Jgjw7xucA6jSkXhNNuSFWEptqrB2IiR4CJo3LOf03qi+A8mq5gkWLNY8tvLORHvz2SfT
         qZwUvq6RiSD4sDMt3PKYZmihWWykT8aCw/EWYViThHJD4WLr6FvBZKYQci3ORGUpZ2QX
         ixvuo0vWoO8ICZsxdsBRsQ2oymvlnkg2xsoR2IDPlTIENB125q6FtRXjrjPSOjfeyzeA
         yZKuz9fkertUNbl/1cJlMVMHg2NRLDqoIet4YSdbImgac2YKM6zCdQLRjAudlOOCnuLy
         YevA==
X-Gm-Message-State: AOJu0Yz/nzEIOVwKzNdtnxV8K05jA6yBw2q7SpiO4KeFSFPA+y4aCqbR
	yxB8Std4+h69NgdOufdL5nEXBC27gbwBEU0JybmmLGjg6CQGhh3YfL4yliUSxukIEdYAdvAJ3Pd
	LN707kycrSkwWlPVFY4djkRlZOwj1gJmmr3th
X-Google-Smtp-Source: AGHT+IFsvWEBOjwKNfU98Gkus8OdnxSxEchA0Au3vF4bBczhIurYe1orO9DpBz0Qhfjl4r/TxUKxl7wHiS6jD0NH8zk=
X-Received: by 2002:a0d:db11:0:b0:603:cafe:dafc with SMTP id
 d17-20020a0ddb11000000b00603cafedafcmr2558695ywe.30.1706561578276; Mon, 29
 Jan 2024 12:52:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: selinux@vger.kernel.org
List-Id: <selinux.vger.kernel.org>
List-Subscribe: <mailto:selinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:selinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240129193512.123145-1-lokeshgidra@google.com>
 <20240129193512.123145-4-lokeshgidra@google.com> <20240129203626.uq5tdic4z5qua5qy@revolver>
In-Reply-To: <20240129203626.uq5tdic4z5qua5qy@revolver>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 29 Jan 2024 12:52:45 -0800
Message-ID: <CAJuCfpFS=h8h1Tgn55Hv+cr9bUFFoUvejiFQsHGN5yT7utpDMg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] userfaultfd: use per-vma locks in userfaultfd operations
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, Lokesh Gidra <lokeshgidra@google.com>, 
	akpm@linux-foundation.org, linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, selinux@vger.kernel.org, surenb@google.com, 
	kernel-team@android.com, aarcange@redhat.com, peterx@redhat.com, 
	david@redhat.com, axelrasmussen@google.com, bgeffon@google.com, 
	willy@infradead.org, jannh@google.com, kaleshsingh@google.com, 
	ngeoffray@google.com, timmurray@google.com, rppt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 29, 2024 at 12:36=E2=80=AFPM Liam R. Howlett
<Liam.Howlett@oracle.com> wrote:
>
> * Lokesh Gidra <lokeshgidra@google.com> [240129 14:35]:
> > All userfaultfd operations, except write-protect, opportunistically use
> > per-vma locks to lock vmas. If we fail then fall back to locking
> > mmap-lock in read-mode.
> >
> > Write-protect operation requires mmap_lock as it iterates over multiple=
 vmas.
> >
> > Signed-off-by: Lokesh Gidra <lokeshgidra@google.com>
> > ---
> >  fs/userfaultfd.c              |  13 +--
> >  include/linux/userfaultfd_k.h |   5 +-
> >  mm/userfaultfd.c              | 175 +++++++++++++++++++++++-----------
> >  3 files changed, 122 insertions(+), 71 deletions(-)
> >
> > diff --git a/fs/userfaultfd.c b/fs/userfaultfd.c
> > index c00a021bcce4..60dcfafdc11a 100644
> > --- a/fs/userfaultfd.c
> > +++ b/fs/userfaultfd.c
> > @@ -2005,17 +2005,8 @@ static int userfaultfd_move(struct userfaultfd_c=
tx *ctx,
> >               return -EINVAL;
> >
> >       if (mmget_not_zero(mm)) {
> > -             mmap_read_lock(mm);
> > -
> > -             /* Re-check after taking map_changing_lock */
> > -             down_read(&ctx->map_changing_lock);
> > -             if (likely(!atomic_read(&ctx->mmap_changing)))
> > -                     ret =3D move_pages(ctx, mm, uffdio_move.dst, uffd=
io_move.src,
> > -                                      uffdio_move.len, uffdio_move.mod=
e);
> > -             else
> > -                     ret =3D -EAGAIN;
> > -             up_read(&ctx->map_changing_lock);
> > -             mmap_read_unlock(mm);
> > +             ret =3D move_pages(ctx, uffdio_move.dst, uffdio_move.src,
> > +                              uffdio_move.len, uffdio_move.mode);
> >               mmput(mm);
> >       } else {
> >               return -ESRCH;
> > diff --git a/include/linux/userfaultfd_k.h b/include/linux/userfaultfd_=
k.h
> > index 3210c3552976..05d59f74fc88 100644
> > --- a/include/linux/userfaultfd_k.h
> > +++ b/include/linux/userfaultfd_k.h
> > @@ -138,9 +138,8 @@ extern long uffd_wp_range(struct vm_area_struct *vm=
a,
> >  /* move_pages */
> >  void double_pt_lock(spinlock_t *ptl1, spinlock_t *ptl2);
> >  void double_pt_unlock(spinlock_t *ptl1, spinlock_t *ptl2);
> > -ssize_t move_pages(struct userfaultfd_ctx *ctx, struct mm_struct *mm,
> > -                unsigned long dst_start, unsigned long src_start,
> > -                unsigned long len, __u64 flags);
> > +ssize_t move_pages(struct userfaultfd_ctx *ctx, unsigned long dst_star=
t,
> > +                unsigned long src_start, unsigned long len, __u64 flag=
s);
> >  int move_pages_huge_pmd(struct mm_struct *mm, pmd_t *dst_pmd, pmd_t *s=
rc_pmd, pmd_t dst_pmdval,
> >                       struct vm_area_struct *dst_vma,
> >                       struct vm_area_struct *src_vma,
> > diff --git a/mm/userfaultfd.c b/mm/userfaultfd.c
> > index 6e2ca04ab04d..d55bf18b80db 100644
> > --- a/mm/userfaultfd.c
> > +++ b/mm/userfaultfd.c
> > @@ -19,20 +19,39 @@
> >  #include <asm/tlb.h>
> >  #include "internal.h"
> >
> > -static __always_inline
> > -struct vm_area_struct *find_dst_vma(struct mm_struct *dst_mm,
> > -                                 unsigned long dst_start,
> > -                                 unsigned long len)
> > +void unpin_vma(struct mm_struct *mm, struct vm_area_struct *vma, bool =
*mmap_locked)
> > +{
> > +     BUG_ON(!vma && !*mmap_locked);
> > +
> > +     if (*mmap_locked) {
> > +             mmap_read_unlock(mm);
> > +             *mmap_locked =3D false;
> > +     } else
> > +             vma_end_read(vma);
>
> You are missing braces here.
>
> This function is small so it could be inline, although I hope the
> compiler would get that right for us.
>
> I don't think this small helper is worth it, considering you are
> altering a pointer in here, which makes things harder to follow (not to
> mention the locking).  The only code that depends on this update is a
> single place, which already assigns a custom variable after the function
> return.
>
> > +}
> > +
> > +/*
> > + * Search for VMA and make sure it is stable either by locking it or t=
aking
> > + * mmap_lock.
>
> This function returns something that isn't documented and also sets a
> boolean which is passed in as a pointer which also is lacking from the
> documentation.
>
> > + */
> > +struct vm_area_struct *find_and_pin_dst_vma(struct mm_struct *dst_mm,
> > +                                         unsigned long dst_start,
> > +                                         unsigned long len,
> > +                                         bool *mmap_locked)
> >  {
> > +     struct vm_area_struct *dst_vma =3D lock_vma_under_rcu(dst_mm, dst=
_start);
>
> lock_vma_under_rcu() calls mas_walk(), which goes to dst_start for the
> VMA.  It is not possible for dst_start to be outside the range.
>
> > +     if (!dst_vma) {
>
> BUG_ON(mmap_locked) ?
>
> > +             mmap_read_lock(dst_mm);
> > +             *mmap_locked =3D true;
> > +             dst_vma =3D find_vma(dst_mm, dst_start);
>
> find_vma() walks to dst_start and searches upwards from that address.
> This is functionally different than what you have asked for above.  You
> will not see an issue as you have coded it - but it may be suboptimal
> since a start address lower than the VMA you are looking for can be
> found... however, later you check the range falls between the dst_start
> and dst_start + len.
>
> If you expect the dst_start to always be within the VMA range and not
> lower, then you should use vma_lookup().
>
> If you want to search upwards from dst_start for a VMA then you should
> move the range check below into this brace.
>
> > +     }
> > +
> >       /*
> >        * Make sure that the dst range is both valid and fully within a
> >        * single existing vma.
> >        */
> > -     struct vm_area_struct *dst_vma;
> > -
> > -     dst_vma =3D find_vma(dst_mm, dst_start);
> >       if (!range_in_vma(dst_vma, dst_start, dst_start + len))
> > -             return NULL;
> > +             goto unpin;
> >
> >       /*
> >        * Check the vma is registered in uffd, this is required to
> > @@ -40,9 +59,13 @@ struct vm_area_struct *find_dst_vma(struct mm_struct=
 *dst_mm,
> >        * time.
> >        */
> >       if (!dst_vma->vm_userfaultfd_ctx.ctx)
> > -             return NULL;
> > +             goto unpin;
> >
> >       return dst_vma;
> > +
> > +unpin:
> > +     unpin_vma(dst_mm, dst_vma, mmap_locked);
> > +     return NULL;
> >  }
> >
> >  /* Check if dst_addr is outside of file's size. Must be called with pt=
l held. */
> > @@ -350,7 +373,8 @@ static pmd_t *mm_alloc_pmd(struct mm_struct *mm, un=
signed long address)
> >  #ifdef CONFIG_HUGETLB_PAGE
> >  /*
> >   * mfill_atomic processing for HUGETLB vmas.  Note that this routine i=
s
> > - * called with mmap_lock held, it will release mmap_lock before return=
ing.
> > + * called with either vma-lock or mmap_lock held, it will release the =
lock
> > + * before returning.
> >   */
> >  static __always_inline ssize_t mfill_atomic_hugetlb(
> >                                             struct userfaultfd_ctx *ctx=
,
> > @@ -358,7 +382,8 @@ static __always_inline ssize_t mfill_atomic_hugetlb=
(
> >                                             unsigned long dst_start,
> >                                             unsigned long src_start,
> >                                             unsigned long len,
> > -                                           uffd_flags_t flags)
> > +                                           uffd_flags_t flags,
> > +                                           bool *mmap_locked)
> >  {
> >       struct mm_struct *dst_mm =3D dst_vma->vm_mm;
> >       int vm_shared =3D dst_vma->vm_flags & VM_SHARED;
> > @@ -380,7 +405,7 @@ static __always_inline ssize_t mfill_atomic_hugetlb=
(
> >        */
> >       if (uffd_flags_mode_is(flags, MFILL_ATOMIC_ZEROPAGE)) {
> >               up_read(&ctx->map_changing_lock);
> > -             mmap_read_unlock(dst_mm);
> > +             unpin_vma(dst_mm, dst_vma, mmap_locked);
> >               return -EINVAL;
> >       }
> >
> > @@ -404,12 +429,25 @@ static __always_inline ssize_t mfill_atomic_huget=
lb(
> >        */
> >       if (!dst_vma) {
> >               err =3D -ENOENT;
> > -             dst_vma =3D find_dst_vma(dst_mm, dst_start, len);
> > -             if (!dst_vma || !is_vm_hugetlb_page(dst_vma))
> > -                     goto out_unlock;
> > +             dst_vma =3D find_and_pin_dst_vma(dst_mm, dst_start,
> > +                                            len, mmap_locked);
> > +             if (!dst_vma)
> > +                     goto out;
> > +             if (!is_vm_hugetlb_page(dst_vma))
> > +                     goto out_unlock_vma;
> >
> >               err =3D -EINVAL;
> >               if (vma_hpagesize !=3D vma_kernel_pagesize(dst_vma))
> > +                     goto out_unlock_vma;
> > +
> > +             /*
> > +              * If memory mappings are changing because of non-coopera=
tive
> > +              * operation (e.g. mremap) running in parallel, bail out =
and
> > +              * request the user to retry later
> > +              */
> > +             down_read(&ctx->map_changing_lock);
> > +             err =3D -EAGAIN;
> > +             if (atomic_read(&ctx->mmap_changing))
> >                       goto out_unlock;
> >
> >               vm_shared =3D dst_vma->vm_flags & VM_SHARED;
> > @@ -465,7 +503,7 @@ static __always_inline ssize_t mfill_atomic_hugetlb=
(
> >
> >               if (unlikely(err =3D=3D -ENOENT)) {
> >                       up_read(&ctx->map_changing_lock);
> > -                     mmap_read_unlock(dst_mm);
> > +                     unpin_vma(dst_mm, dst_vma, mmap_locked);
> >                       BUG_ON(!folio);
> >
> >                       err =3D copy_folio_from_user(folio,
> > @@ -474,17 +512,6 @@ static __always_inline ssize_t mfill_atomic_hugetl=
b(
> >                               err =3D -EFAULT;
> >                               goto out;
> >                       }
> > -                     mmap_read_lock(dst_mm);
> > -                     down_read(&ctx->map_changing_lock);
> > -                     /*
> > -                      * If memory mappings are changing because of non=
-cooperative
> > -                      * operation (e.g. mremap) running in parallel, b=
ail out and
> > -                      * request the user to retry later
> > -                      */
> > -                     if (atomic_read(ctx->mmap_changing)) {
> > -                             err =3D -EAGAIN;
> > -                             break;
> > -                     }
>
> ... Okay, this is where things get confusing.
>
> How about this: Don't do this locking/boolean dance.
>
> Instead, do something like this:
> In mm/memory.c, below lock_vma_under_rcu(), but something like this
>
> struct vm_area_struct *lock_vma(struct mm_struct *mm,
>         unsigned long addr))    /* or some better name.. */
> {
>         struct vm_area_struct *vma;
>
>         vma =3D lock_vma_under_rcu(mm, addr);
>
>         if (vma)
>                 return vma;
>
>         mmap_read_lock(mm);
>         vma =3D lookup_vma(mm, addr);
>         if (vma)
>                 vma_start_read(vma); /* Won't fail */

Please don't assume vma_start_read() won't fail even when you have
mmap_read_lock(). See the comment in vma_start_read() about the
possibility of an overflow producing false negatives.

>
>         mmap_read_unlock(mm);
>         return vma;
> }
>
> Now, we know we have a vma that's vma locked if there is a vma.  The vma
> won't go away - you have it locked.  The mmap lock is held for even
> less time for your worse case, and the code gets easier to follow.
>
> Once you are done with the vma do a vma_end_read(vma).  Don't forget to
> do this!
>
> Now the comment above such a function should state that the vma needs to
> be vma_end_read(vma), or that could go undetected..  It might be worth
> adding a unlock_vma() counterpart to vma_end_read(vma) even.

Locking VMA while holding mmap_read_lock is an interesting usage
pattern I haven't seen yet. I think this should work quite well!

>
>
> >
> >                       dst_vma =3D NULL;
> >                       goto retry;
> > @@ -505,7 +532,8 @@ static __always_inline ssize_t mfill_atomic_hugetlb=
(
> >
> >  out_unlock:
> >       up_read(&ctx->map_changing_lock);
> > -     mmap_read_unlock(dst_mm);
> > +out_unlock_vma:
> > +     unpin_vma(dst_mm, dst_vma, mmap_locked);
> >  out:
> >       if (folio)
> >               folio_put(folio);
> > @@ -521,7 +549,8 @@ extern ssize_t mfill_atomic_hugetlb(struct userfaul=
tfd_ctx *ctx,
> >                                   unsigned long dst_start,
> >                                   unsigned long src_start,
> >                                   unsigned long len,
> > -                                 uffd_flags_t flags);
> > +                                 uffd_flags_t flags,
> > +                                 bool *mmap_locked);
>
> Just a thought, tabbing in twice for each argument would make this more
> compact.
>
>
> >  #endif /* CONFIG_HUGETLB_PAGE */
> >
> >  static __always_inline ssize_t mfill_atomic_pte(pmd_t *dst_pmd,
> > @@ -581,6 +610,7 @@ static __always_inline ssize_t mfill_atomic(struct =
userfaultfd_ctx *ctx,
> >       unsigned long src_addr, dst_addr;
> >       long copied;
> >       struct folio *folio;
> > +     bool mmap_locked =3D false;
> >
> >       /*
> >        * Sanitize the command parameters:
> > @@ -597,7 +627,14 @@ static __always_inline ssize_t mfill_atomic(struct=
 userfaultfd_ctx *ctx,
> >       copied =3D 0;
> >       folio =3D NULL;
> >  retry:
> > -     mmap_read_lock(dst_mm);
> > +     /*
> > +      * Make sure the vma is not shared, that the dst range is
> > +      * both valid and fully within a single existing vma.
> > +      */
> > +     err =3D -ENOENT;
> > +     dst_vma =3D find_and_pin_dst_vma(dst_mm, dst_start, len, &mmap_lo=
cked);
> > +     if (!dst_vma)
> > +             goto out;
> >
> >       /*
> >        * If memory mappings are changing because of non-cooperative
> > @@ -609,15 +646,6 @@ static __always_inline ssize_t mfill_atomic(struct=
 userfaultfd_ctx *ctx,
> >       if (atomic_read(&ctx->mmap_changing))
> >               goto out_unlock;
> >
> > -     /*
> > -      * Make sure the vma is not shared, that the dst range is
> > -      * both valid and fully within a single existing vma.
> > -      */
> > -     err =3D -ENOENT;
> > -     dst_vma =3D find_dst_vma(dst_mm, dst_start, len);
> > -     if (!dst_vma)
> > -             goto out_unlock;
> > -
> >       err =3D -EINVAL;
> >       /*
> >        * shmem_zero_setup is invoked in mmap for MAP_ANONYMOUS|MAP_SHAR=
ED but
> > @@ -638,8 +666,8 @@ static __always_inline ssize_t mfill_atomic(struct =
userfaultfd_ctx *ctx,
> >        * If this is a HUGETLB vma, pass off to appropriate routine
> >        */
> >       if (is_vm_hugetlb_page(dst_vma))
> > -             return  mfill_atomic_hugetlb(ctx, dst_vma, dst_start,
> > -                                          src_start, len, flags);
> > +             return  mfill_atomic_hugetlb(ctx, dst_vma, dst_start, src=
_start
> > +                                          len, flags, &mmap_locked);
> >
> >       if (!vma_is_anonymous(dst_vma) && !vma_is_shmem(dst_vma))
> >               goto out_unlock;
> > @@ -699,7 +727,8 @@ static __always_inline ssize_t mfill_atomic(struct =
userfaultfd_ctx *ctx,
> >                       void *kaddr;
> >
> >                       up_read(&ctx->map_changing_lock);
> > -                     mmap_read_unlock(dst_mm);
> > +                     unpin_vma(dst_mm, dst_vma, &mmap_locked);
> > +
> >                       BUG_ON(!folio);
> >
> >                       kaddr =3D kmap_local_folio(folio, 0);
> > @@ -730,7 +759,7 @@ static __always_inline ssize_t mfill_atomic(struct =
userfaultfd_ctx *ctx,
> >
> >  out_unlock:
> >       up_read(&ctx->map_changing_lock);
> > -     mmap_read_unlock(dst_mm);
> > +     unpin_vma(dst_mm, dst_vma, &mmap_locked);
> >  out:
> >       if (folio)
> >               folio_put(folio);
> > @@ -1285,8 +1314,6 @@ static int validate_move_areas(struct userfaultfd=
_ctx *ctx,
> >   * @len: length of the virtual memory range
> >   * @mode: flags from uffdio_move.mode
> >   *
> > - * Must be called with mmap_lock held for read.
> > - *
> >   * move_pages() remaps arbitrary anonymous pages atomically in zero
> >   * copy. It only works on non shared anonymous pages because those can
> >   * be relocated without generating non linear anon_vmas in the rmap
> > @@ -1353,15 +1380,16 @@ static int validate_move_areas(struct userfault=
fd_ctx *ctx,
> >   * could be obtained. This is the only additional complexity added to
> >   * the rmap code to provide this anonymous page remapping functionalit=
y.
> >   */
> > -ssize_t move_pages(struct userfaultfd_ctx *ctx, struct mm_struct *mm,
> > -                unsigned long dst_start, unsigned long src_start,
> > -                unsigned long len, __u64 mode)
> > +ssize_t move_pages(struct userfaultfd_ctx *ctx, unsigned long dst_star=
t,
> > +                unsigned long src_start, unsigned long len, __u64 mode=
)
> >  {
> > +     struct mm_struct *mm =3D ctx->mm;
> >       struct vm_area_struct *src_vma, *dst_vma;
> >       unsigned long src_addr, dst_addr;
> >       pmd_t *src_pmd, *dst_pmd;
> >       long err =3D -EINVAL;
> >       ssize_t moved =3D 0;
> > +     bool mmap_locked =3D false;
> >
> >       /* Sanitize the command parameters. */
> >       if (WARN_ON_ONCE(src_start & ~PAGE_MASK) ||
> > @@ -1374,28 +1402,52 @@ ssize_t move_pages(struct userfaultfd_ctx *ctx,=
 struct mm_struct *mm,
> >           WARN_ON_ONCE(dst_start + len <=3D dst_start))
> >               goto out;
>
> Ah, is this safe for rmap?  I think you need to leave this read lock.
>
> >
> > +     dst_vma =3D NULL;
> > +     src_vma =3D lock_vma_under_rcu(mm, src_start);
> > +     if (src_vma) {
> > +             dst_vma =3D lock_vma_under_rcu(mm, dst_start);
> > +             if (!dst_vma)
> > +                     vma_end_read(src_vma);
> > +     }
> > +
> > +     /* If we failed to lock both VMAs, fall back to mmap_lock */
> > +     if (!dst_vma) {
> > +             mmap_read_lock(mm);
> > +             mmap_locked =3D true;
> > +             src_vma =3D find_vma(mm, src_start);
> > +             if (!src_vma)
> > +                     goto out_unlock_mmap;
> > +             dst_vma =3D find_vma(mm, dst_start);
>
> Again, there is a difference in how find_vma and lock_vam_under_rcu
> works.
>
> > +             if (!dst_vma)
> > +                     goto out_unlock_mmap;
> > +     }
> > +
> > +     /* Re-check after taking map_changing_lock */
> > +     down_read(&ctx->map_changing_lock);
> > +     if (likely(atomic_read(&ctx->mmap_changing))) {
> > +             err =3D -EAGAIN;
> > +             goto out_unlock;
> > +     }
> >       /*
> >        * Make sure the vma is not shared, that the src and dst remap
> >        * ranges are both valid and fully within a single existing
> >        * vma.
> >        */
> > -     src_vma =3D find_vma(mm, src_start);
> > -     if (!src_vma || (src_vma->vm_flags & VM_SHARED))
> > -             goto out;
> > +     if (src_vma->vm_flags & VM_SHARED)
> > +             goto out_unlock;
> >       if (src_start < src_vma->vm_start ||
> >           src_start + len > src_vma->vm_end)
> > -             goto out;
> > +             goto out_unlock;
> >
> > -     dst_vma =3D find_vma(mm, dst_start);
> > -     if (!dst_vma || (dst_vma->vm_flags & VM_SHARED))
> > -             goto out;
> > +     if (dst_vma->vm_flags & VM_SHARED)
> > +             goto out_unlock;
> >       if (dst_start < dst_vma->vm_start ||
> >           dst_start + len > dst_vma->vm_end)
> > -             goto out;
> > +             goto out_unlock;
> >
> >       err =3D validate_move_areas(ctx, src_vma, dst_vma);
> >       if (err)
> > -             goto out;
> > +             goto out_unlock;
> >
> >       for (src_addr =3D src_start, dst_addr =3D dst_start;
> >            src_addr < src_start + len;) {
> > @@ -1512,6 +1564,15 @@ ssize_t move_pages(struct userfaultfd_ctx *ctx, =
struct mm_struct *mm,
> >               moved +=3D step_size;
> >       }
> >
> > +out_unlock:
> > +     up_read(&ctx->map_changing_lock);
> > +out_unlock_mmap:
> > +     if (mmap_locked)
> > +             mmap_read_unlock(mm);
> > +     else {
> > +             vma_end_read(dst_vma);
> > +             vma_end_read(src_vma);
> > +     }
> >  out:
> >       VM_WARN_ON(moved < 0);
> >       VM_WARN_ON(err > 0);
> > --
> > 2.43.0.429.g432eaa2c6b-goog
> >
> >

