Return-Path: <selinux+bounces-5216-lists+selinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EF586BC9860
	for <lists+selinux@lfdr.de>; Thu, 09 Oct 2025 16:34:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ECF72188C59E
	for <lists+selinux@lfdr.de>; Thu,  9 Oct 2025 14:34:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B47562D1F4E;
	Thu,  9 Oct 2025 14:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ky8tX54M"
X-Original-To: selinux@vger.kernel.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02E4F246774
	for <selinux@vger.kernel.org>; Thu,  9 Oct 2025 14:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760020461; cv=none; b=UwwIP9urJjV0AQIEeOy9eqcZ5U0aZYdi3cZGXMXaAdUP2D/Lfe6s8hY6d2TYPAOb8JrJtSW1ru8tjvtND/w810i8XenpJJz1iaCHBt/G6KyrTLqb3CbsU6uaQX8RKcOYBups39gVfH1Wmj0FYJL97Es79COuQS2f1NhXB9U/XQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760020461; c=relaxed/simple;
	bh=YhAnblp4nQL4zjPI0NfQ41OC7Tedi+bBs5j0dG8UBn4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aadykkWgwfNLwosKy+CvW6bGjYubJMBg7NaM14MhzAKjKPZLEnyg6/83dZQD+JqcrQI8lSDobo8NOC4a8zpz7qPMGQZ8eLhOZOXjC7/ibX1XezeMBEltF3tw9CqXn8qeB3HRCA4zZ359/9CopsjLdIyRdc7stoZoCV8t0a/E514=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ky8tX54M; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3306eb96da1so897361a91.1
        for <selinux@vger.kernel.org>; Thu, 09 Oct 2025 07:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760020459; x=1760625259; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PXhOvAzmzc0GvVnS1tQnnQLU3R7CgJXBguM6XCQyMzM=;
        b=Ky8tX54MtlfsYcpg7LgdV6bz4QGjPJKXgxsuF+YceMzWRjp7Ni6Ph6rnCWuTytzh+5
         FPgfCoQtkR477qBhcn3D821p6Qxix/dsEcepFuY0MtQg86m5YaB7WJLCUDkttQcfEQ61
         7tnYK4pUwM4ZBvRY2ecq5+c1UATQGUHkbPAcltuy0YxFiwluUmakoLe2gc4sdOYGG4t0
         GqL9nSZQ8p21PK/w7iS0icYp+xfiGWOHWP1nb34+DjKxzsEimjRqJb/gnjLAHsmCUmjI
         8ki1MDQpuSsS2c6d29GGQ/tQJMm5RHSf1hwg3kfgG9Y1ejvqAB9taapBuMRGk/CXLL9e
         pfDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760020459; x=1760625259;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PXhOvAzmzc0GvVnS1tQnnQLU3R7CgJXBguM6XCQyMzM=;
        b=Vf7yVpypjCnOZxCT2Gr70/9L/3xlnhv7FIU1PLD7DJ/lTjJ8gJg/mOJoBtV65hKXeo
         9klo8VJ71sDbalzMQbjEU1Psu99TxPNyr/VYbH+T8AUoHw/FMOg/JBy44SgttVZdG4wh
         ltFaBjDHQHFQJ5BNEX++A7uV6q2HIEOgkYkgNhRsYM9Am5+OOB2A4XeeEQZXMmfZEoP1
         HtPOnFyNksQv7MkLVWnXq7qyIhFIRYdv1ODDwgiCbc13iDUs1ap90acK7ZzWsjXtf42v
         v4HCd+61OXoE/ds2Q+hbFLTD6idr5Hps8OCZSwpcgPD48QggAMetSdHNrQPOffjy3GQx
         xjuA==
X-Forwarded-Encrypted: i=1; AJvYcCWAeAmnQ8ptsd//lm/s3ZtX+QJROOeMR6SrR82oVGgX53UJt9xjC83AYvy/7RjrkQ/VceTK5Ih0@vger.kernel.org
X-Gm-Message-State: AOJu0Yxc0kXKmTC/WJUvfsxpW6Pzb663opuC1aTnNgsnksZTv5LaTYFu
	UWlmBSRvjWuJwLNajVQPnlcf89gkH/bMlxADNrlO7Et4g95o9HYiStpNsxQf3KC1/8Hih4NvDzl
	0jY0m6WMX01Xm+1yNJe8KUIePKPH5YsQ=
X-Gm-Gg: ASbGncv6klyOOmPr7Gw4idWegAPuW4NtYj0IZZiEG9suglb7EriBkTG19Vzug5fXPRp
	7FOqcrmeYWH7JyhmPVc7yDCu0S3h+et7rCFo+snCPP+aiGR3bDyfFUV62kCgSFSrjjrIaoHiflb
	Evt47lbnMjj485measHf+g4VCMNtARz/SPRUMrZLBVcwqAlGUPiTKNk1pm7hPopPcKmb2HjOE/I
	2DPvsxD8eRoWx0u0Z3T1e6rTxtVvC8=
X-Google-Smtp-Source: AGHT+IE0FyTWJTq8nNxDIDVzLQpkTa20O70x0XEV4iCcmNbD7lkGlBsmUhjy2yWOzTbNZdjdShvAmvMqn4yGx1F3t+I=
X-Received: by 2002:a17:90b:4d08:b0:335:2b15:7f46 with SMTP id
 98e67ed59e1d1-33b51386306mr9422330a91.21.1760020458863; Thu, 09 Oct 2025
 07:34:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: selinux@vger.kernel.org
List-Id: <selinux.vger.kernel.org>
List-Subscribe: <mailto:selinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:selinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251009134542.1529148-1-omosnace@redhat.com>
In-Reply-To: <20251009134542.1529148-1-omosnace@redhat.com>
From: Stephen Smalley <stephen.smalley.work@gmail.com>
Date: Thu, 9 Oct 2025 10:34:07 -0400
X-Gm-Features: AS18NWCuXR1l9gjzn2FNttABJQiTYMBIHxdHz9LK52jfaS2yv93GQY95p1KmfV8
Message-ID: <CAEjxPJ5FVGt0KR=wNmU=e_R5cD6T4K1VRabaZmDAWMd0ZNnPNA@mail.gmail.com>
Subject: Re: [PATCH] nbd: override creds to kernel when calling sock_{send,recv}msg()
To: Ondrej Mosnacek <omosnace@redhat.com>
Cc: Josef Bacik <josef@toxicpanda.com>, Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org, 
	nbd@other.debian.org, linux-security-module@vger.kernel.org, 
	selinux@vger.kernel.org, Ming Lei <ming.lei@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 9, 2025 at 9:45=E2=80=AFAM Ondrej Mosnacek <omosnace@redhat.com=
> wrote:
>
> sock_{send,recv}msg() internally calls security_socket_{send,recv}msg(),
> which does security checks (e.g. SELinux) for socket access against the
> current task. However, _sock_xmit() in drivers/block/nbd.c may be called
> indirectly from a userspace syscall, where the NBD socket access would
> be incorrectly checked against the calling userspace task (which simply
> tries to read/write a file that happens to reside on an NBD device).
>
> To fix this, temporarily override creds to kernel ones before calling
> the sock_*() functions. This allows the security modules to recognize
> this as internal access by the kernel, which will normally be allowed.
>
> A way to trigger the issue is to do the following (on a system with
> SELinux set to enforcing):
>
>     ### Create nbd device:
>     truncate -s 256M /tmp/testfile
>     nbd-server localhost:10809 /tmp/testfile
>
>     ### Connect to the nbd server:
>     nbd-client localhost
>
>     ### Create mdraid array
>     mdadm --create -l 1 -n 2 /dev/md/testarray /dev/nbd0 missing
>
>     ### Stop the array
>     mdadm --stop /dev/md/testarray
>
>     ### Disconnect the nbd device
>     nbd-client -d /dev/nbd0
>
>     ### Reconnect to nbd devices:
>     nbd-client localhost
>
> After these steps, assuming the SELinux policy doesn't allow the
> unexpected access pattern, errors will be visible on the kernel console:
>
> [   93.997980] nbd2: detected capacity change from 0 to 524288
> [  100.314271] md/raid1:md126: active with 1 out of 2 mirrors
> [  100.314301] md126: detected capacity change from 0 to 522240
> [  100.317288] block nbd2: Send control failed (result -13)           <--=
---
> [  100.317306] block nbd2: Request send failed, requeueing            <--=
---
> [  100.318765] block nbd2: Receive control failed (result -32)        <--=
---
> [  100.318783] block nbd2: Dead connection, failed to find a fallback
> [  100.318794] block nbd2: shutting down sockets
> [  100.318802] I/O error, dev nbd2, sector 2048 op 0x0:(READ) flags 0x0 p=
hys_seg 1 prio class 0
> [  100.318817] Buffer I/O error on dev md126, logical block 0, async page=
 read
> [  100.322000] I/O error, dev nbd2, sector 2048 op 0x0:(READ) flags 0x0 p=
hys_seg 1 prio class 0
> [  100.322016] Buffer I/O error on dev md126, logical block 0, async page=
 read
> [  100.323244] I/O error, dev nbd2, sector 2048 op 0x0:(READ) flags 0x0 p=
hys_seg 1 prio class 0
> [  100.323253] Buffer I/O error on dev md126, logical block 0, async page=
 read
> [  100.324436] I/O error, dev nbd2, sector 2048 op 0x0:(READ) flags 0x0 p=
hys_seg 1 prio class 0
> [  100.324444] Buffer I/O error on dev md126, logical block 0, async page=
 read
> [  100.325621] I/O error, dev nbd2, sector 2048 op 0x0:(READ) flags 0x0 p=
hys_seg 1 prio class 0
> [  100.325630] Buffer I/O error on dev md126, logical block 0, async page=
 read
> [  100.326813] I/O error, dev nbd2, sector 2048 op 0x0:(READ) flags 0x0 p=
hys_seg 1 prio class 0
> [  100.326822] Buffer I/O error on dev md126, logical block 0, async page=
 read
> [  100.326834]  md126: unable to read partition table
> [  100.329872] I/O error, dev nbd2, sector 0 op 0x0:(READ) flags 0x0 phys=
_seg 1 prio class 0
> [  100.329889] Buffer I/O error on dev nbd2, logical block 0, async page =
read
> [  100.331186] I/O error, dev nbd2, sector 0 op 0x0:(READ) flags 0x0 phys=
_seg 1 prio class 0
> [  100.331195] Buffer I/O error on dev nbd2, logical block 0, async page =
read
> [  100.332371] I/O error, dev nbd2, sector 0 op 0x0:(READ) flags 0x0 phys=
_seg 1 prio class 0
> [  100.332379] Buffer I/O error on dev nbd2, logical block 0, async page =
read
> [  100.333550] I/O error, dev nbd2, sector 0 op 0x0:(READ) flags 0x0 phys=
_seg 1 prio class 0
> [  100.333559] Buffer I/O error on dev nbd2, logical block 0, async page =
read
> [  100.334721]  nbd2: unable to read partition table
> [  100.350993]  nbd2: unable to read partition table
>
> The corresponding SELinux denial on Fedora/RHEL will look like this
> (assuming it's not silenced):
> type=3DAVC msg=3Daudit(1758104872.510:116): avc:  denied  { write } for  =
pid=3D1908 comm=3D"mdadm" laddr=3D::1 lport=3D32772 faddr=3D::1 fport=3D108=
09 scontext=3Dsystem_u:system_r:mdadm_t:s0-s0:c0.c1023 tcontext=3Dunconfine=
d_u:unconfined_r:unconfined_t:s0-s0:c0.c1023 tclass=3Dtcp_socket permissive=
=3D0
>
> Cc: Ming Lei <ming.lei@redhat.com>
> Link: https://bugzilla.redhat.com/show_bug.cgi?id=3D2348878
> Signed-off-by: Ondrej Mosnacek <omosnace@redhat.com>
> ---
>  drivers/block/nbd.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>
> diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
> index 6463d0e8d0cef..d50055c974a6b 100644
> --- a/drivers/block/nbd.c
> +++ b/drivers/block/nbd.c
> @@ -52,6 +52,7 @@
>  static DEFINE_IDR(nbd_index_idr);
>  static DEFINE_MUTEX(nbd_index_mutex);
>  static struct workqueue_struct *nbd_del_wq;
> +static struct cred *nbd_cred;
>  static int nbd_total_devices =3D 0;
>
>  struct nbd_sock {
> @@ -554,6 +555,7 @@ static int __sock_xmit(struct nbd_device *nbd, struct=
 socket *sock, int send,
>         int result;
>         struct msghdr msg =3D {} ;
>         unsigned int noreclaim_flag;
> +       const struct cred *old_cred;
>
>         if (unlikely(!sock)) {
>                 dev_err_ratelimited(disk_to_dev(nbd->disk),
> @@ -562,6 +564,8 @@ static int __sock_xmit(struct nbd_device *nbd, struct=
 socket *sock, int send,
>                 return -EINVAL;
>         }
>
> +       old_cred =3D override_creds(nbd_cred);
> +
>         msg.msg_iter =3D *iter;
>
>         noreclaim_flag =3D memalloc_noreclaim_save();
> @@ -586,6 +590,8 @@ static int __sock_xmit(struct nbd_device *nbd, struct=
 socket *sock, int send,
>
>         memalloc_noreclaim_restore(noreclaim_flag);
>
> +       revert_creds(old_cred);
> +
>         return result;
>  }
>
> @@ -2669,7 +2675,15 @@ static int __init nbd_init(void)
>                 return -ENOMEM;
>         }
>
> +       nbd_cred =3D prepare_kernel_cred(&init_task);
> +       if (!nbd_cred) {
> +               destroy_workqueue(nbd_del_wq);
> +               unregister_blkdev(NBD_MAJOR, "nbd");
> +               return -ENOMEM;
> +       }
> +
>         if (genl_register_family(&nbd_genl_family)) {
> +               put_cred(nbd_cred);
>                 destroy_workqueue(nbd_del_wq);
>                 unregister_blkdev(NBD_MAJOR, "nbd");
>                 return -EINVAL;
> @@ -2706,6 +2720,8 @@ static void __exit nbd_cleanup(void)
>
>         nbd_dbg_close();
>
> +       put_cred(nbd_cred);
> +

Should this be done at the end, after the workqueue is destroyed?

>         mutex_lock(&nbd_index_mutex);
>         idr_for_each(&nbd_index_idr, &nbd_exit_cb, &del_list);
>         mutex_unlock(&nbd_index_mutex);
> --
> 2.51.0
>
>

