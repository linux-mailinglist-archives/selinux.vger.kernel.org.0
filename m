Return-Path: <selinux+bounces-653-lists+selinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F34D8555A5
	for <lists+selinux@lfdr.de>; Wed, 14 Feb 2024 23:20:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5367E1C219E4
	for <lists+selinux@lfdr.de>; Wed, 14 Feb 2024 22:20:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEC5614199D;
	Wed, 14 Feb 2024 22:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tmGEpW8U"
X-Original-To: selinux@vger.kernel.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C285913DBAA
	for <selinux@vger.kernel.org>; Wed, 14 Feb 2024 22:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707949231; cv=none; b=lgfpWbzXgF5tineT9H7zUh78hpO6W6VEV/g6TJfl9nyAJyPnOUMib+4m0dJLDGuLoKjHV7c2Lrw5Cdwi5zY18RhmmA0dX/usNWWXjRnalUker9+m+3qSYgLPU4lxxpMJfGFn4UpFzB68e+kpU8+aR+pPKyKjMDGyRjDqOQf7Jp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707949231; c=relaxed/simple;
	bh=B5FUhziHHDuwr5gMs0Ey17oRZU3NE1F6H9AFhIT2Pn4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LWVsLivXV91xaOhKN2Ip/1/yUJMK434++y2gblaj60fd4d0BTJrsJh1iHoMd6bQruiaw2A0wPtczvNgiwvA3/3LFMDwm1aE3EcNjvuyjKETB6+nMBy4PxzScjaM7dA0s2aN7dixLNOjBSnY8LuLv3chxommXhe+NPJ8/6g78Ab8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tmGEpW8U; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-dc6d8bd612dso191396276.1
        for <selinux@vger.kernel.org>; Wed, 14 Feb 2024 14:20:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1707949228; x=1708554028; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uOM/r4HN7pADLZzfeWpcViqmr7kF+YraAtjiyXm5wfM=;
        b=tmGEpW8UVr8N8j4I2VOA4xDajJQfIcpnujlZnqJNIIBsKPprLahQJpbUqRw4K69t1n
         1TpeUOGg1OsdwHfTOXOTgaxJ8T/m52B7ppVND+nhukHDM944VXd+z01ef3GQvV1gQArk
         zLRawyiHjV2rVin6u5QWpCMsUYXEDIffWNi0ZRG+GJZrxLH5yxXpgHesnkBeqWTIAwT2
         c7FvZGzyrnDMzjwz0kjWQH8XK96i4ApvX9yYd9wjdNkEMz5lR41Ck6q1UftdpLGVauhK
         QSn10vh8F4fZHKdeUERdI7JBL1lBgs2/utyL5oFj78LLuz/wJsIOI5sazsNHydWJZAHT
         peYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707949228; x=1708554028;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uOM/r4HN7pADLZzfeWpcViqmr7kF+YraAtjiyXm5wfM=;
        b=LLc3C0wRlj3vRxj3WFf+r5JfDvCpxmt5z6Nl6i1KdjvG5OAtFmblEADRguVVCqUNYL
         8HigTB6zW3zBq4tn0xK5I49+AcdZs2n9AP3hiIbMCGGzraw9LLhKzUpZCtzuS4VunmSR
         RPZ+ewQsc1tocgZ0dZEQS+z7KmMbSWKbWbrYzEGbAHG4UXtBHFSbwW/To+kb5OuaXlXq
         3miV673md/3a1wrcxUvfCi/cRe01oiyeXjMdYztjB97VT3q22SfHYC9T1xep1VJnxJIm
         u48AxUjI8GSh6zPB5CHwSgMHsE1Z/sh17yvlNgqAU3UE2R5ytTmZnS95lcosOb4eOjk5
         tjbQ==
X-Forwarded-Encrypted: i=1; AJvYcCXgWT9mPtY3pMngVtM8slrRDoH59YG+wNQM6iqSKP8rbngT4D+kAY7p0oujVYm9TgkTlRW8plfxO1F7ES6Q1FA/yETK2wRN+g==
X-Gm-Message-State: AOJu0Yx9sh8jpKcl/IRKP10iAQIjiT/kab//NW5LSRfTfX74gJ79m+42
	D+qPRIBkWYRPXGBMBNmkWiCQXr7/oYwWqcJiBQ6UeNK05ST93LpL8mDjTKGLdMqt+6IZEu7DdX1
	FBDO6xiZhLNtNOOh5nc65lETlbyjrKCBdGFx3J/iE1+3oCTdCPsYmzUuU7k9XnTCxwFRJ/0hRvO
	/sAv3H/ZNEKkOXOESAvCI=
X-Google-Smtp-Source: AGHT+IHOL663pWr46WocmPW2wlIVN0B7WkTD89CvQvPN/LQyhLH5wFx4dsirIpAB3mrR8Sc5iM40ZSGOERwP+Vdq6vk=
X-Received: by 2002:a25:c741:0:b0:dcd:5187:a033 with SMTP id
 w62-20020a25c741000000b00dcd5187a033mr3875411ybe.2.1707949227299; Wed, 14 Feb
 2024 14:20:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: selinux@vger.kernel.org
List-Id: <selinux.vger.kernel.org>
List-Subscribe: <mailto:selinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:selinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240213215741.3816570-1-lokeshgidra@google.com>
 <20240213215741.3816570-4-lokeshgidra@google.com> <855ee176-e628-489f-a3ee-cf0573cf5506@arm.com>
In-Reply-To: <855ee176-e628-489f-a3ee-cf0573cf5506@arm.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 14 Feb 2024 14:20:14 -0800
Message-ID: <CAJuCfpFt7KOzzBV6hGO9TVHup3BaTRNQzjhz78MJEFPnn+Bhdg@mail.gmail.com>
Subject: Re: [PATCH v6 3/3] userfaultfd: use per-vma locks in userfaultfd operations
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Lokesh Gidra <lokeshgidra@google.com>, akpm@linux-foundation.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, selinux@vger.kernel.org, 
	kernel-team@android.com, aarcange@redhat.com, peterx@redhat.com, 
	david@redhat.com, axelrasmussen@google.com, bgeffon@google.com, 
	willy@infradead.org, jannh@google.com, kaleshsingh@google.com, 
	ngeoffray@google.com, timmurray@google.com, rppt@kernel.org, 
	Liam.Howlett@oracle.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-ccpol: medium

On Wed, Feb 14, 2024 at 2:12=E2=80=AFPM Ryan Roberts <ryan.roberts@arm.com>=
 wrote:
>
> On 13/02/2024 21:57, Lokesh Gidra wrote:
> > All userfaultfd operations, except write-protect, opportunistically use
> > per-vma locks to lock vmas. On failure, attempt again inside mmap_lock
> > critical section.
> >
> > Write-protect operation requires mmap_lock as it iterates over multiple
> > vmas.
>
> Hi,
>
> I'm seeing the below OOPS when running on arm64 against mm-unstable. It c=
an be reliably reproduced by running the `uffd-unit-tests` mm selftest. Bis=
ecting mm-unstable leads to this patch:
>
> # bad: [649936c3db47f8f75b9b927e4edf5922a0f240a6] mm: add swappiness=3D a=
rg to memory.reclaim
> git bisect bad 649936c3db47f8f75b9b927e4edf5922a0f240a6
> # good: [54be6c6c5ae8e0d93a6c4641cb7528eb0b6ba478] Linux 6.8-rc3
> git bisect good 54be6c6c5ae8e0d93a6c4641cb7528eb0b6ba478
> # good: [10794cd18bb46c91c75fac44e551201cfe006baf] mm: zswap: warn when r=
eferencing a dead entry
> git bisect good 10794cd18bb46c91c75fac44e551201cfe006baf
> # good: [cb769b427edc7f46c7c764daa3421725bffdf315] mm-memcg-use-larger-ba=
tches-for-proactive-reclaim-v4
> git bisect good cb769b427edc7f46c7c764daa3421725bffdf315
> # good: [cfc5c1be4010c9972bc3f3d991235e8ea6928672] mm/z3fold: remove unne=
eded spinlock
> git bisect good cfc5c1be4010c9972bc3f3d991235e8ea6928672
> # good: [31094bce101651acb4747ab25d614bc893d65c89] kasan/test: avoid gcc =
warning for intentional overflow
> git bisect good 31094bce101651acb4747ab25d614bc893d65c89
> # bad: [55be0b2cd1fbf00e036e2e48ee0999599135af66] zram: do not allocate p=
hysically contiguous strm buffers
> git bisect bad 55be0b2cd1fbf00e036e2e48ee0999599135af66
> # good: [b11ca4a0a13024c0175dde56f9bd848803eddcd2] mm/mglru: improve swap=
piness handling
> git bisect good b11ca4a0a13024c0175dde56f9bd848803eddcd2
> # good: [22e7ccd57a1220afcd7c4da1f3005fd04d70014e] userfaultfd: move user=
faultfd_ctx struct to header file
> git bisect good 22e7ccd57a1220afcd7c4da1f3005fd04d70014e
> # bad: [0a0d05338f13e64c9fb7ccd8f8d1793aaf33ec7d] userfaultfd: use per-vm=
a locks in userfaultfd operations
> git bisect bad 0a0d05338f13e64c9fb7ccd8f8d1793aaf33ec7d
> # good: [8459e1c7acbe4442c6c0eef59825da1339e0a3cf] userfaultfd: protect m=
map_changing with rw_sem in userfaulfd_ctx
> git bisect good 8459e1c7acbe4442c6c0eef59825da1339e0a3cf
> # first bad commit: [0a0d05338f13e64c9fb7ccd8f8d1793aaf33ec7d] userfaultf=
d: use per-vma locks in userfaultfd operations
>
> This is the oops:

That's a call to mmap_assert_locked() from inside
move_pages_huge_pmd(). Since move_pages() are now happening under VMA
lock this call should be replaced with vma_assert_locked().

>
> [   21.280142] mm ffff049340ed0000 task_size 281474976710656
> [   21.280142] get_unmapped_area ffffb3dbdc725e48
> [   21.280142] mmap_base 281474842492928 mmap_legacy_base 0
> [   21.280142] pgd ffff04935829a000 mm_users 3 mm_count 4 pgtables_bytes =
98304 map_count 21
> [   21.280142] hiwater_rss 2167 hiwater_vm 8234 total_vm 4a44 locked_vm 0
> [   21.280142] pinned_vm 0 data_vm 4835 exec_vm 1c6 stack_vm 21
> [   21.280142] start_code aaaaaaaa0000 end_code aaaaaaab1b28 start_data a=
aaaaaac2a60 end_data aaaaaaac3410
> [   21.280142] start_brk aaaaaaac5000 brk aaaaaaae6000 start_stack ffffff=
fff6b0
> [   21.280142] arg_start fffffffff8c7 arg_end fffffffff8e2 env_start ffff=
fffff8e2 env_end ffffffffffdd
> [   21.280142] binfmt ffffb3dbdf2f8cf8 flags 82008d
> [   21.280142] ioctx_table 0000000000000000
> [   21.280142] owner ffff049311f02280 exe_file ffff049355314c00
> [   21.280142] notifier_subscriptions 0000000000000000
> [   21.280142] numa_next_scan 4294897864 numa_scan_offset 0 numa_scan_seq=
 0
> [   21.280142] tlb_flush_pending 0
> [   21.280142] def_flags: 0x0()
> [   21.283302] kernel BUG at include/linux/mmap_lock.h:66!
> [   21.283481] Internal error: Oops - BUG: 00000000f2000800 [#1] PREEMPT =
SMP
> [   21.283720] Modules linked in:
> [   21.283867] CPU: 3 PID: 1226 Comm: uffd-unit-tests Not tainted 6.8.0-r=
c3-00297-g0a0d05338f13 #19
> [   21.284306] Hardware name: linux,dummy-virt (DT)
> [   21.284495] pstate: 61400005 (nZCv daif +PAN -UAO -TCO +DIT -SSBS BTYP=
E=3D--)
> [   21.284833] pc : move_pages_huge_pmd+0x4d0/0x8a8
> [   21.285072] lr : move_pages_huge_pmd+0x4d0/0x8a8
> [   21.285289] sp : ffff800088573b30
> [   21.285439] x29: ffff800088573b30 x28: ffff049358292d78 x27: fffffc000=
0000000
> [   21.285770] x26: ffff049358292d78 x25: 0000fffff5e00000 x24: ffff04935=
9db3730
> [   21.286097] x23: 0000fffff6000000 x22: ffff049340ed0000 x21: ffff04935=
9db3678
> [   21.286422] x20: 0000000000000002 x19: fffffc124d60a480 x18: 000000000=
0000006
> [   21.286747] x17: 626c740a30207165 x16: 735f6e6163735f61 x15: 6d756e203=
0207465
> [   21.287084] x14: 7366666f5f6e6163 x13: 2928307830203a73 x12: 67616c665=
f666564
> [   21.287417] x11: 0a3020676e69646e x10: ffffb3dbdf28bff8 x9 : ffffb3dbd=
c620f80
> [   21.287745] x8 : 00000000ffffefff x7 : ffffb3dbdf28bff8 x6 : 80000000f=
ffff000
> [   21.288082] x5 : ffff04933ffdcd08 x4 : 0000000000000000 x3 : 000000000=
0000000
> [   21.288364] x2 : 0000000000000000 x1 : ffff049340106780 x0 : 000000000=
0000328
> [   21.288712] Call trace:
> [   21.288832]  move_pages_huge_pmd+0x4d0/0x8a8
> [   21.289058]  move_pages+0x8b8/0x13d8
> [   21.289205]  userfaultfd_ioctl+0x11e0/0x1e90
> [   21.289411]  __arm64_sys_ioctl+0xb4/0x100
> [   21.289579]  invoke_syscall+0x50/0x128
> [   21.289738]  el0_svc_common.constprop.0+0x48/0xf0
> [   21.289942]  do_el0_svc+0x24/0x38
> [   21.290078]  el0_svc+0x34/0xb8
> [   21.290219]  el0t_64_sync_handler+0x100/0x130
> [   21.290387]  el0t_64_sync+0x190/0x198
> [   21.290535] Code: 17ffff7e a90363f7 a9046bf9 97fde2a7 (d4210000)
> [   21.290776] ---[ end trace 0000000000000000 ]---
> [   21.290966] note: uffd-unit-tests[1226] exited with irqs disabled
> [   21.291254] note: uffd-unit-tests[1226] exited with preempt_count 2
> [   21.292864] ------------[ cut here ]------------
> [   21.293020] WARNING: CPU: 3 PID: 0 at kernel/context_tracking.c:128 ct=
_kernel_exit.constprop.0+0x108/0x120
> [   21.293711] Modules linked in:
> [   21.294070] CPU: 3 PID: 0 Comm: swapper/3 Tainted: G      D           =
 6.8.0-rc3-00297-g0a0d05338f13 #19
> [   21.295447] Hardware name: linux,dummy-virt (DT)
> [   21.295850] pstate: 214003c5 (nzCv DAIF +PAN -UAO -TCO +DIT -SSBS BTYP=
E=3D--)
> [   21.296152] pc : ct_kernel_exit.constprop.0+0x108/0x120
> [   21.296685] lr : ct_idle_enter+0x10/0x20
> [   21.296848] sp : ffff8000801b3dc0
> [   21.296983] x29: ffff8000801b3dc0 x28: 0000000000000000 x27: 000000000=
0000000
> [   21.297255] x26: 0000000000000000 x25: ffff049301496780 x24: 000000000=
0000000
> [   21.297533] x23: 0000000000000000 x22: ffff049301496780 x21: ffffb3dbd=
f209ae0
> [   21.297844] x20: ffffb3dbdf209a20 x19: ffff04933ffeace0 x18: ffff80008=
8573648
> [   21.298152] x17: ffffb3dbdf65def0 x16: 00000000d72145a7 x15: 00000000f=
1a17b35
> [   21.298439] x14: 0000000000000004 x13: ffffb3dbdf22c3a8 x12: 000000000=
0000000
> [   21.298738] x11: ffff0493541472a8 x10: 2b58349b7608bfc4 x9 : ffffb3dbd=
c57f43c
> [   21.299031] x8 : ffff049301497858 x7 : 00000000000001c1 x6 : 000000001=
eeeb49c
> [   21.299329] x5 : 4000000000000002 x4 : ffff50b7618d7000 x3 : ffff80008=
01b3dc0
> [   21.299615] x2 : ffffb3dbde713ce0 x1 : 4000000000000000 x0 : ffffb3dbd=
e713ce0
> [   21.299900] Call trace:
> [   21.299998]  ct_kernel_exit.constprop.0+0x108/0x120
> [   21.300460]  ct_idle_enter+0x10/0x20
> [   21.300690]  default_idle_call+0x3c/0x170
> [   21.300861]  do_idle+0x218/0x278
> [   21.300992]  cpu_startup_entry+0x3c/0x50
> [   21.301148]  secondary_start_kernel+0x130/0x158
> [   21.301329]  __secondary_switched+0xb8/0xc0
> [   21.301641] ---[ end trace 0000000000000000 ]---
>
>
> Can this series be removed from mm-unstable until fixed, please?
>
> Thanks,
> Ryan
>
>
> >
> > Signed-off-by: Lokesh Gidra <lokeshgidra@google.com>
> > ---
> >  fs/userfaultfd.c              |  13 +-
> >  include/linux/userfaultfd_k.h |   5 +-
> >  mm/userfaultfd.c              | 380 ++++++++++++++++++++++++++--------
> >  3 files changed, 296 insertions(+), 102 deletions(-)
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
> > index 74aad0831e40..4744d6a96f96 100644
> > --- a/mm/userfaultfd.c
> > +++ b/mm/userfaultfd.c
> > @@ -20,19 +20,11 @@
> >  #include "internal.h"
> >
> >  static __always_inline
> > -struct vm_area_struct *find_dst_vma(struct mm_struct *dst_mm,
> > -                                 unsigned long dst_start,
> > -                                 unsigned long len)
> > +bool validate_dst_vma(struct vm_area_struct *dst_vma, unsigned long ds=
t_end)
> >  {
> > -     /*
> > -      * Make sure that the dst range is both valid and fully within a
> > -      * single existing vma.
> > -      */
> > -     struct vm_area_struct *dst_vma;
> > -
> > -     dst_vma =3D find_vma(dst_mm, dst_start);
> > -     if (!range_in_vma(dst_vma, dst_start, dst_start + len))
> > -             return NULL;
> > +     /* Make sure that the dst range is fully within dst_vma. */
> > +     if (dst_end > dst_vma->vm_end)
> > +             return false;
> >
> >       /*
> >        * Check the vma is registered in uffd, this is required to
> > @@ -40,11 +32,122 @@ struct vm_area_struct *find_dst_vma(struct mm_stru=
ct *dst_mm,
> >        * time.
> >        */
> >       if (!dst_vma->vm_userfaultfd_ctx.ctx)
> > -             return NULL;
> > +             return false;
> > +
> > +     return true;
> > +}
> > +
> > +static __always_inline
> > +struct vm_area_struct *find_vma_and_prepare_anon(struct mm_struct *mm,
> > +                                              unsigned long addr)
> > +{
> > +     struct vm_area_struct *vma;
> > +
> > +     mmap_assert_locked(mm);
> > +     vma =3D vma_lookup(mm, addr);
> > +     if (!vma)
> > +             vma =3D ERR_PTR(-ENOENT);
> > +     else if (!(vma->vm_flags & VM_SHARED) &&
> > +              unlikely(anon_vma_prepare(vma)))
> > +             vma =3D ERR_PTR(-ENOMEM);
> > +
> > +     return vma;
> > +}
> > +
> > +#ifdef CONFIG_PER_VMA_LOCK
> > +/*
> > + * lock_vma() - Lookup and lock vma corresponding to @address.
> > + * @mm: mm to search vma in.
> > + * @address: address that the vma should contain.
> > + *
> > + * Should be called without holding mmap_lock. vma should be unlocked =
after use
> > + * with unlock_vma().
> > + *
> > + * Return: A locked vma containing @address, -ENOENT if no vma is foun=
d, or
> > + * -ENOMEM if anon_vma couldn't be allocated.
> > + */
> > +static struct vm_area_struct *lock_vma(struct mm_struct *mm,
> > +                                    unsigned long address)
> > +{
> > +     struct vm_area_struct *vma;
> > +
> > +     vma =3D lock_vma_under_rcu(mm, address);
> > +     if (vma) {
> > +             /*
> > +              * lock_vma_under_rcu() only checks anon_vma for private
> > +              * anonymous mappings. But we need to ensure it is assign=
ed in
> > +              * private file-backed vmas as well.
> > +              */
> > +             if (!(vma->vm_flags & VM_SHARED) && unlikely(!vma->anon_v=
ma))
> > +                     vma_end_read(vma);
> > +             else
> > +                     return vma;
> > +     }
> > +
> > +     mmap_read_lock(mm);
> > +     vma =3D find_vma_and_prepare_anon(mm, address);
> > +     if (!IS_ERR(vma)) {
> > +             /*
> > +              * We cannot use vma_start_read() as it may fail due to
> > +              * false locked (see comment in vma_start_read()). We
> > +              * can avoid that by directly locking vm_lock under
> > +              * mmap_lock, which guarantees that nobody can lock the
> > +              * vma for write (vma_start_write()) under us.
> > +              */
> > +             down_read(&vma->vm_lock->lock);
> > +     }
> > +
> > +     mmap_read_unlock(mm);
> > +     return vma;
> > +}
> > +
> > +static struct vm_area_struct *uffd_mfill_lock(struct mm_struct *dst_mm=
,
> > +                                           unsigned long dst_start,
> > +                                           unsigned long len)
> > +{
> > +     struct vm_area_struct *dst_vma;
> >
> > +     dst_vma =3D lock_vma(dst_mm, dst_start);
> > +     if (IS_ERR(dst_vma) || validate_dst_vma(dst_vma, dst_start + len)=
)
> > +             return dst_vma;
> > +
> > +     vma_end_read(dst_vma);
> > +     return ERR_PTR(-ENOENT);
> > +}
> > +
> > +static void uffd_mfill_unlock(struct vm_area_struct *vma)
> > +{
> > +     vma_end_read(vma);
> > +}
> > +
> > +#else
> > +
> > +static struct vm_area_struct *uffd_mfill_lock(struct mm_struct *dst_mm=
,
> > +                                           unsigned long dst_start,
> > +                                           unsigned long len)
> > +{
> > +     struct vm_area_struct *dst_vma;
> > +
> > +     mmap_read_lock(dst_mm);
> > +     dst_vma =3D find_vma_and_prepare_anon(dst_mm, dst_start);
> > +     if (IS_ERR(dst_vma))
> > +             goto out_unlock;
> > +
> > +     if (validate_dst_vma(dst_vma, dst_start + len))
> > +             return dst_vma;
> > +
> > +     dst_vma =3D ERR_PTR(-ENOENT);
> > +out_unlock:
> > +     mmap_read_unlock(dst_mm);
> >       return dst_vma;
> >  }
> >
> > +static void uffd_mfill_unlock(struct vm_area_struct *vma)
> > +{
> > +     mmap_read_unlock(vma->vm_mm);
> > +}
> > +#endif
> > +
> >  /* Check if dst_addr is outside of file's size. Must be called with pt=
l held. */
> >  static bool mfill_file_over_size(struct vm_area_struct *dst_vma,
> >                                unsigned long dst_addr)
> > @@ -350,7 +453,8 @@ static pmd_t *mm_alloc_pmd(struct mm_struct *mm, un=
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
> > @@ -361,7 +465,6 @@ static __always_inline ssize_t mfill_atomic_hugetlb=
(
> >                                             uffd_flags_t flags)
> >  {
> >       struct mm_struct *dst_mm =3D dst_vma->vm_mm;
> > -     int vm_shared =3D dst_vma->vm_flags & VM_SHARED;
> >       ssize_t err;
> >       pte_t *dst_pte;
> >       unsigned long src_addr, dst_addr;
> > @@ -380,7 +483,7 @@ static __always_inline ssize_t mfill_atomic_hugetlb=
(
> >        */
> >       if (uffd_flags_mode_is(flags, MFILL_ATOMIC_ZEROPAGE)) {
> >               up_read(&ctx->map_changing_lock);
> > -             mmap_read_unlock(dst_mm);
> > +             uffd_mfill_unlock(dst_vma);
> >               return -EINVAL;
> >       }
> >
> > @@ -403,24 +506,28 @@ static __always_inline ssize_t mfill_atomic_huget=
lb(
> >        * retry, dst_vma will be set to NULL and we must lookup again.
> >        */
> >       if (!dst_vma) {
> > +             dst_vma =3D uffd_mfill_lock(dst_mm, dst_start, len);
> > +             if (IS_ERR(dst_vma)) {
> > +                     err =3D PTR_ERR(dst_vma);
> > +                     goto out;
> > +             }
> > +
> >               err =3D -ENOENT;
> > -             dst_vma =3D find_dst_vma(dst_mm, dst_start, len);
> > -             if (!dst_vma || !is_vm_hugetlb_page(dst_vma))
> > -                     goto out_unlock;
> > +             if (!is_vm_hugetlb_page(dst_vma))
> > +                     goto out_unlock_vma;
> >
> >               err =3D -EINVAL;
> >               if (vma_hpagesize !=3D vma_kernel_pagesize(dst_vma))
> > -                     goto out_unlock;
> > -
> > -             vm_shared =3D dst_vma->vm_flags & VM_SHARED;
> > -     }
> > +                     goto out_unlock_vma;
> >
> > -     /*
> > -      * If not shared, ensure the dst_vma has a anon_vma.
> > -      */
> > -     err =3D -ENOMEM;
> > -     if (!vm_shared) {
> > -             if (unlikely(anon_vma_prepare(dst_vma)))
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
> >       }
> >
> > @@ -465,7 +572,7 @@ static __always_inline ssize_t mfill_atomic_hugetlb=
(
> >
> >               if (unlikely(err =3D=3D -ENOENT)) {
> >                       up_read(&ctx->map_changing_lock);
> > -                     mmap_read_unlock(dst_mm);
> > +                     uffd_mfill_unlock(dst_vma);
> >                       BUG_ON(!folio);
> >
> >                       err =3D copy_folio_from_user(folio,
> > @@ -474,17 +581,6 @@ static __always_inline ssize_t mfill_atomic_hugetl=
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
> > -                     if (atomic_read(&ctx->mmap_changing)) {
> > -                             err =3D -EAGAIN;
> > -                             break;
> > -                     }
> >
> >                       dst_vma =3D NULL;
> >                       goto retry;
> > @@ -505,7 +601,8 @@ static __always_inline ssize_t mfill_atomic_hugetlb=
(
> >
> >  out_unlock:
> >       up_read(&ctx->map_changing_lock);
> > -     mmap_read_unlock(dst_mm);
> > +out_unlock_vma:
> > +     uffd_mfill_unlock(dst_vma);
> >  out:
> >       if (folio)
> >               folio_put(folio);
> > @@ -597,7 +694,15 @@ static __always_inline ssize_t mfill_atomic(struct=
 userfaultfd_ctx *ctx,
> >       copied =3D 0;
> >       folio =3D NULL;
> >  retry:
> > -     mmap_read_lock(dst_mm);
> > +     /*
> > +      * Make sure the vma is not shared, that the dst range is
> > +      * both valid and fully within a single existing vma.
> > +      */
> > +     dst_vma =3D uffd_mfill_lock(dst_mm, dst_start, len);
> > +     if (IS_ERR(dst_vma)) {
> > +             err =3D PTR_ERR(dst_vma);
> > +             goto out;
> > +     }
> >
> >       /*
> >        * If memory mappings are changing because of non-cooperative
> > @@ -609,15 +714,6 @@ static __always_inline ssize_t mfill_atomic(struct=
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
> > @@ -647,16 +743,6 @@ static __always_inline ssize_t mfill_atomic(struct=
 userfaultfd_ctx *ctx,
> >           uffd_flags_mode_is(flags, MFILL_ATOMIC_CONTINUE))
> >               goto out_unlock;
> >
> > -     /*
> > -      * Ensure the dst_vma has a anon_vma or this page
> > -      * would get a NULL anon_vma when moved in the
> > -      * dst_vma.
> > -      */
> > -     err =3D -ENOMEM;
> > -     if (!(dst_vma->vm_flags & VM_SHARED) &&
> > -         unlikely(anon_vma_prepare(dst_vma)))
> > -             goto out_unlock;
> > -
> >       while (src_addr < src_start + len) {
> >               pmd_t dst_pmdval;
> >
> > @@ -699,7 +785,7 @@ static __always_inline ssize_t mfill_atomic(struct =
userfaultfd_ctx *ctx,
> >                       void *kaddr;
> >
> >                       up_read(&ctx->map_changing_lock);
> > -                     mmap_read_unlock(dst_mm);
> > +                     uffd_mfill_unlock(dst_vma);
> >                       BUG_ON(!folio);
> >
> >                       kaddr =3D kmap_local_folio(folio, 0);
> > @@ -730,7 +816,7 @@ static __always_inline ssize_t mfill_atomic(struct =
userfaultfd_ctx *ctx,
> >
> >  out_unlock:
> >       up_read(&ctx->map_changing_lock);
> > -     mmap_read_unlock(dst_mm);
> > +     uffd_mfill_unlock(dst_vma);
> >  out:
> >       if (folio)
> >               folio_put(folio);
> > @@ -1267,27 +1353,136 @@ static int validate_move_areas(struct userfaul=
tfd_ctx *ctx,
> >       if (!vma_is_anonymous(src_vma) || !vma_is_anonymous(dst_vma))
> >               return -EINVAL;
> >
> > +     return 0;
> > +}
> > +
> > +static __always_inline
> > +int find_vmas_mm_locked(struct mm_struct *mm,
> > +                     unsigned long dst_start,
> > +                     unsigned long src_start,
> > +                     struct vm_area_struct **dst_vmap,
> > +                     struct vm_area_struct **src_vmap)
> > +{
> > +     struct vm_area_struct *vma;
> > +
> > +     mmap_assert_locked(mm);
> > +     vma =3D find_vma_and_prepare_anon(mm, dst_start);
> > +     if (IS_ERR(vma))
> > +             return PTR_ERR(vma);
> > +
> > +     *dst_vmap =3D vma;
> > +     /* Skip finding src_vma if src_start is in dst_vma */
> > +     if (src_start >=3D vma->vm_start && src_start < vma->vm_end)
> > +             goto out_success;
> > +
> > +     vma =3D vma_lookup(mm, src_start);
> > +     if (!vma)
> > +             return -ENOENT;
> > +out_success:
> > +     *src_vmap =3D vma;
> > +     return 0;
> > +}
> > +
> > +#ifdef CONFIG_PER_VMA_LOCK
> > +static int uffd_move_lock(struct mm_struct *mm,
> > +                       unsigned long dst_start,
> > +                       unsigned long src_start,
> > +                       struct vm_area_struct **dst_vmap,
> > +                       struct vm_area_struct **src_vmap)
> > +{
> > +     struct vm_area_struct *vma;
> > +     int err;
> > +
> > +     vma =3D lock_vma(mm, dst_start);
> > +     if (IS_ERR(vma))
> > +             return PTR_ERR(vma);
> > +
> > +     *dst_vmap =3D vma;
> >       /*
> > -      * Ensure the dst_vma has a anon_vma or this page
> > -      * would get a NULL anon_vma when moved in the
> > -      * dst_vma.
> > +      * Skip finding src_vma if src_start is in dst_vma. This also ens=
ures
> > +      * that we don't lock the same vma twice.
> >        */
> > -     if (unlikely(anon_vma_prepare(dst_vma)))
> > -             return -ENOMEM;
> > +     if (src_start >=3D vma->vm_start && src_start < vma->vm_end) {
> > +             *src_vmap =3D vma;
> > +             return 0;
> > +     }
> >
> > -     return 0;
> > +     /*
> > +      * Using lock_vma() to get src_vma can lead to following deadlock=
:
> > +      *
> > +      * Thread1                              Thread2
> > +      * -------                              -------
> > +      * vma_start_read(dst_vma)
> > +      *                                      mmap_write_lock(mm)
> > +      *                                      vma_start_write(src_vma)
> > +      * vma_start_read(src_vma)
> > +      * mmap_read_lock(mm)
> > +      *                                      vma_start_write(dst_vma)
> > +      */
> > +     *src_vmap =3D lock_vma_under_rcu(mm, src_start);
> > +     if (likely(*src_vmap))
> > +             return 0;
> > +
> > +     /* Undo any locking and retry in mmap_lock critical section */
> > +     vma_end_read(*dst_vmap);
> > +
> > +     mmap_read_lock(mm);
> > +     err =3D find_vmas_mm_locked(mm, dst_start, src_start, dst_vmap, s=
rc_vmap);
> > +     if (!err) {
> > +             /*
> > +              * See comment in lock_vma() as to why not using
> > +              * vma_start_read() here.
> > +              */
> > +             down_read(&(*dst_vmap)->vm_lock->lock);
> > +             if (*dst_vmap !=3D *src_vmap)
> > +                     down_read(&(*src_vmap)->vm_lock->lock);
> > +     }
> > +     mmap_read_unlock(mm);
> > +     return err;
> > +}
> > +
> > +static void uffd_move_unlock(struct vm_area_struct *dst_vma,
> > +                          struct vm_area_struct *src_vma)
> > +{
> > +     vma_end_read(src_vma);
> > +     if (src_vma !=3D dst_vma)
> > +             vma_end_read(dst_vma);
> >  }
> >
> > +#else
> > +
> > +static int uffd_move_lock(struct mm_struct *mm,
> > +                       unsigned long dst_start,
> > +                       unsigned long src_start,
> > +                       struct vm_area_struct **dst_vmap,
> > +                       struct vm_area_struct **src_vmap)
> > +{
> > +     int err;
> > +
> > +     mmap_read_lock(mm);
> > +     err =3D find_vmas_mm_locked(mm, dst_start, src_start, dst_vmap, s=
rc_vmap);
> > +     if (err)
> > +             mmap_read_unlock(mm);
> > +     return err;
> > +}
> > +
> > +static void uffd_move_unlock(struct vm_area_struct *dst_vma,
> > +                          struct vm_area_struct *src_vma)
> > +{
> > +     mmap_assert_locked(src_vma->vm_mm);
> > +     mmap_read_unlock(dst_vma->vm_mm);
> > +}
> > +#endif
> > +
> >  /**
> >   * move_pages - move arbitrary anonymous pages of an existing vma
> >   * @ctx: pointer to the userfaultfd context
> > - * @mm: the address space to move pages
> >   * @dst_start: start of the destination virtual memory range
> >   * @src_start: start of the source virtual memory range
> >   * @len: length of the virtual memory range
> >   * @mode: flags from uffdio_move.mode
> >   *
> > - * Must be called with mmap_lock held for read.
> > + * It will either use the mmap_lock in read mode or per-vma locks
> >   *
> >   * move_pages() remaps arbitrary anonymous pages atomically in zero
> >   * copy. It only works on non shared anonymous pages because those can
> > @@ -1355,10 +1550,10 @@ static int validate_move_areas(struct userfault=
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
> > @@ -1376,28 +1571,34 @@ ssize_t move_pages(struct userfaultfd_ctx *ctx,=
 struct mm_struct *mm,
> >           WARN_ON_ONCE(dst_start + len <=3D dst_start))
> >               goto out;
> >
> > +     err =3D uffd_move_lock(mm, dst_start, src_start, &dst_vma, &src_v=
ma);
> > +     if (err)
> > +             goto out;
> > +
> > +     /* Re-check after taking map_changing_lock */
> > +     err =3D -EAGAIN;
> > +     down_read(&ctx->map_changing_lock);
> > +     if (likely(atomic_read(&ctx->mmap_changing)))
> > +             goto out_unlock;
> >       /*
> >        * Make sure the vma is not shared, that the src and dst remap
> >        * ranges are both valid and fully within a single existing
> >        * vma.
> >        */
> > -     src_vma =3D find_vma(mm, src_start);
> > -     if (!src_vma || (src_vma->vm_flags & VM_SHARED))
> > -             goto out;
> > -     if (src_start < src_vma->vm_start ||
> > -         src_start + len > src_vma->vm_end)
> > -             goto out;
> > +     err =3D -EINVAL;
> > +     if (src_vma->vm_flags & VM_SHARED)
> > +             goto out_unlock;
> > +     if (src_start + len > src_vma->vm_end)
> > +             goto out_unlock;
> >
> > -     dst_vma =3D find_vma(mm, dst_start);
> > -     if (!dst_vma || (dst_vma->vm_flags & VM_SHARED))
> > -             goto out;
> > -     if (dst_start < dst_vma->vm_start ||
> > -         dst_start + len > dst_vma->vm_end)
> > -             goto out;
> > +     if (dst_vma->vm_flags & VM_SHARED)
> > +             goto out_unlock;
> > +     if (dst_start + len > dst_vma->vm_end)
> > +             goto out_unlock;
> >
> >       err =3D validate_move_areas(ctx, src_vma, dst_vma);
> >       if (err)
> > -             goto out;
> > +             goto out_unlock;
> >
> >       for (src_addr =3D src_start, dst_addr =3D dst_start;
> >            src_addr < src_start + len;) {
> > @@ -1514,6 +1715,9 @@ ssize_t move_pages(struct userfaultfd_ctx *ctx, s=
truct mm_struct *mm,
> >               moved +=3D step_size;
> >       }
> >
> > +out_unlock:
> > +     up_read(&ctx->map_changing_lock);
> > +     uffd_move_unlock(dst_vma, src_vma);
> >  out:
> >       VM_WARN_ON(moved < 0);
> >       VM_WARN_ON(err > 0);
>
> --
> To unsubscribe from this group and stop receiving emails from it, send an=
 email to kernel-team+unsubscribe@android.com.
>

