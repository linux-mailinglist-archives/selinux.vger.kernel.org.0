Return-Path: <selinux+bounces-862-lists+selinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 811DA8713A5
	for <lists+selinux@lfdr.de>; Tue,  5 Mar 2024 03:32:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EF4171F21DA5
	for <lists+selinux@lfdr.de>; Tue,  5 Mar 2024 02:32:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13C9926AD6;
	Tue,  5 Mar 2024 02:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W/14cjAT"
X-Original-To: selinux@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B056ECA73;
	Tue,  5 Mar 2024 02:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709605967; cv=none; b=Wf/sRVAi+orinMm3gjdl7+mDD5u6mI4d3DXTjGXpHZUaZBcqUaECtbVIuH03oTcrXZczoOelATqYr5SFISr7N22rReMYR3aHAnoB8/EEcmffXskd+odbPyWUIMiPWO5/Clb3JJ2jQZ81ajQwmmD2FMO8TGoLdRqobA1ei/9gnSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709605967; c=relaxed/simple;
	bh=yY5gHzv5WMdiEu0N8UmQxGITXeYmT7y53Uo78QWiTZY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GzDuiqinlKINrJGw0SARJPm2gUcW3CROvKMiAxKkOEKd0rNvi91T2PFxI6LBcYuF84IRSiELmQYjoicX3V4krCk6W5a8vNg0Q6XN0L/mrwTWpSF6J8L4ZCxr/ksbXVMlFyfFfKHZ0CVP7HUAEEkoYx1CAqvxWdiDUJvLj3UMo4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W/14cjAT; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a45670f9508so184422366b.0;
        Mon, 04 Mar 2024 18:32:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709605963; x=1710210763; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8AFJ63mpNEcqUQ/joGBhKupLwnIuOU6ihPVYIbFroOs=;
        b=W/14cjATtAbFxGM+9Ec72R0Fjr+oyCVy5O9JwA3PkP0HzEVlgCjugVDYnPoniJarii
         9917dKGS2jKlYiSm5MhMZYCFUta3KNLN+8Va4a48hGA+OLnQKODVw9WoTPxO9oBVakQ5
         iibjbDClDCj2vXntoqXkyyyISZvs+Q9hhv2PGr2Iz7rxbBGB5iroKl0hWCG9/XBiAIla
         2UbKF+Q/k2EI7UpkkWdk0ziMQH4Uimu8LbWzi2uOVRZ2bYQqgkHzswNMk5a2sj4mplEg
         09OH8cXEh76MtLjij1dxsf4l/BtJ0SyTxN39AlJz9UkKrh3Z2n0BJ1dPhxuIpWUXL697
         yP+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709605963; x=1710210763;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8AFJ63mpNEcqUQ/joGBhKupLwnIuOU6ihPVYIbFroOs=;
        b=XJLY9DB/J/UqDydkpF9/HRzyT+HDqu5179106/Ry0RsQ1gPWqSb6YrFT9ifH5xmmtM
         jwtaQV6O65RsypdblOLwmiHvUoNVlr+e2DIsH28kPBKeyE7BVRR2Pg1mVWCDOGYEPtAh
         FfPns6Uh0bFpdI5tQXHqfXxLXIyyxEU5GZuu8g7iZrNtwa0JjhjinlMKh90VeuA/glSi
         gGvwCm6sDJEZRHGuwNUk9UY/q5IDkiI4usmj1nkOf59hjcpQxErrQ7C1cUUwobJuTVaH
         nWhbsfMIYGf8CWI2sp/w++3Mzx85s+qSTMXh0k2cGLvBs8DZnZHCsIByIb+0gLpUs8y0
         zLQw==
X-Forwarded-Encrypted: i=1; AJvYcCVwF8y5a0iSJ7EONCNbW7260OFDV4O32Ia5mKRCPqm35SSMqlMEIAMhyv7gaFouQ7gNZVArtlTCKn68XTyUIhiNhhzClirZz3yP2LyKmAFv871Dd185Hnex2P6h1wL1LDrecvHg7g==
X-Gm-Message-State: AOJu0YxRhGAdAdMh2uBioJvB8rrQOY5Cx4KK5iJYIc8R9KM6/GFti7XX
	CSRoOhRdzZmLdaSmr7Ds9JfNrzAzb/t0m1KO0Nz2JpuXqL8si/ECJpHr9+8DS4don8PxDlKmd0L
	+7HQe1eWXYizlfn0hFA5/wiHzIuc=
X-Google-Smtp-Source: AGHT+IFdUBCmJgvYl3MuNc33T023yEGppVa5KJcmliDDDHJtkYiW/jZtn8TOdZxFKOuwGmXnDXX1gtxoUzyHyEw3H60=
X-Received: by 2002:a17:907:1048:b0:a43:56d0:caa7 with SMTP id
 oy8-20020a170907104800b00a4356d0caa7mr6388845ejb.70.1709605962717; Mon, 04
 Mar 2024 18:32:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: selinux@vger.kernel.org
List-Id: <selinux.vger.kernel.org>
List-Subscribe: <mailto:selinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:selinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAEkJfYOh-5_KzWih=qUxynbn=mMz=UfnPi6UftbyT8+MTDP0jg@mail.gmail.com>
 <CAHC9VhQ3crxcLXbT3fw2k7jYJFKy1VOm25npKpD9ZrwmwKzvJw@mail.gmail.com>
 <CAJ2a_DcSurcF5_G-DjXL_0X=utasy2y8oJ_ywCms-Qhyy6GORQ@mail.gmail.com> <CAHC9VhQVqokvnnqLPc8tv0jpewnUKqnWeAzQs-sMj3BLrY5=CA@mail.gmail.com>
In-Reply-To: <CAHC9VhQVqokvnnqLPc8tv0jpewnUKqnWeAzQs-sMj3BLrY5=CA@mail.gmail.com>
From: Sam Sun <samsun1006219@gmail.com>
Date: Tue, 5 Mar 2024 10:32:31 +0800
Message-ID: <CAEkJfYOTNdu2rK-7F58sg7XuYk+trdGDBjYo-y0SusxmSeCkFA@mail.gmail.com>
Subject: Re: [Bug] WARNING: zero-size vmalloc in sel_write_load
To: Paul Moore <paul@paul-moore.com>
Cc: =?UTF-8?Q?Christian_G=C3=B6ttsche?= <cgzones@googlemail.com>, 
	linux-kernel@vger.kernel.org, "xrivendell7@gmail.com" <xrivendell7@gmail.com>, 
	syzkaller@googlegroups.com, selinux@vger.kernel.org, omosnace@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 5, 2024 at 4:45=E2=80=AFAM Paul Moore <paul@paul-moore.com> wro=
te:
>
> On Mon, Mar 4, 2024 at 3:11=E2=80=AFPM Christian G=C3=B6ttsche
> <cgzones@googlemail.com> wrote:
> > On Mon, 4 Mar 2024 at 20:19, Paul Moore <paul@paul-moore.com> wrote:
> > > On Mon, Mar 4, 2024 at 9:08=E2=80=AFAM Sam Sun <samsun1006219@gmail.c=
om> wrote:
> > > >
> > > > Dear developers and maintainers,
> > > >
> > > > We encountered a warning in function sel_write_load(). It is tested=
 on
> > > > kernel 6.8.0-rc7. Bug report is listed below.
> > > >
> > > > ```
> > > > WARNING: CPU: 1 PID: 8109 at mm/vmalloc.c:3247
> > > > __vmalloc_node_range+0x10a0/0x1490 mm/vmalloc.c:3247
> > > > Modules linked in:
> > > > CPU: 1 PID: 8109 Comm: syz-executor370 Not tainted 6.7.0-rc7 #1
> > > > Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.15.0-=
1 04/01/2014
> > > > RIP: 0010:__vmalloc_node_range+0x10a0/0x1490 mm/vmalloc.c:3247
> > > > Code: 65 48 2b 04 25 28 00 00 00 0f 85 98 02 00 00 48 81 c4 70 01 0=
0
> > > > 00 4c 89 e0 5b 5d 41 5c 41 5d 41 5e 41 5f c3 e8 71 43 b7 ff 90 <0f>=
 0b
> > > > 90 45 31 e4 eb a1 e8 63 43 b7 ff 48 8b 4c 24 40 31 f6 45 31
> > > > RSP: 0018:ffffc90002adf9c0 EFLAGS: 00010293
> > > > RAX: 0000000000000000 RBX: dffffc0000000000 RCX: ffffffff81cdc194
> > > > RDX: ffff888022124ec0 RSI: ffffffff81cdd16f RDI: 0000000000000007
> > > > RBP: 0000000000000000 R08: 0000000000000007 R09: 0000000000000000
> > > > R10: 0000000000000000 R11: 0000000000000001 R12: ffff888107373a48
> > > > R13: dffffc0000000000 R14: 0000000000000000 R15: ffffc90002adfec8
> > > > FS:  00005555560953c0(0000) GS:ffff888135c00000(0000) knlGS:0000000=
000000000
> > > > CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > > > CR2: 0000000020000010 CR3: 000000010503d000 CR4: 0000000000750ef0
> > > > DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> > > > DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> > > > PKRU: 55555554
> > > > Call Trace:
> > > >  <TASK>
> > > >  __vmalloc_node mm/vmalloc.c:3385 [inline]
> > > >  vmalloc+0x6b/0x80 mm/vmalloc.c:3418
> > > >  sel_write_load+0x27f/0x19d0 security/selinux/selinuxfs.c:603
> > > >  vfs_write+0x2a9/0xd80 fs/read_write.c:582
> > > >  ksys_pwrite64 fs/read_write.c:699 [inline]
> > > >  __do_sys_pwrite64 fs/read_write.c:709 [inline]
> > > >  __se_sys_pwrite64 fs/read_write.c:706 [inline]
> > > >  __x64_sys_pwrite64+0x1f3/0x250 fs/read_write.c:706
> > > >  do_syscall_x64 arch/x86/entry/common.c:52 [inline]
> > > >  do_syscall_64+0x40/0x110 arch/x86/entry/common.c:83
> > > >  entry_SYSCALL_64_after_hwframe+0x63/0x6b
> > > > RIP: 0033:0x7f40e7728f8d
> > > > Code: 28 c3 e8 46 1e 00 00 66 0f 1f 44 00 00 f3 0f 1e fa 48 89 f8 4=
8
> > > > 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48>=
 3d
> > > > 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
> > > > RSP: 002b:00007fff5bf39508 EFLAGS: 00000246 ORIG_RAX: 0000000000000=
012
> > > > RAX: ffffffffffffffda RBX: 00007fff5bf39708 RCX: 00007f40e7728f8d
> > > > RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000003
> > > > RBP: 0000000000000001 R08: 0000000000000000 R09: 00007fff5bf39708
> > > > R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000001
> > > > R13: 00007fff5bf396f8 R14: 00007f40e77a6530 R15: 0000000000000001
> > > >  </TASK>
> > > > ```
> > > >
> > > > The cause of this bug is that in sel_write_load(), parameter "count=
"
> > > > is controlled by user, which could be zero. It is passed to vmalloc=
()
> > > > as an argument.
> > > >
> > > > If you have any questions, please contact us.
> > > > Reported by: Yue Sun <samsun1006219@gmail.com>
> > > > Reported by: xingwei lee <xrivendell7@gmail.com>
> > >
> > > Everything appears to be working as expected, vmalloc() caught the
> > > zero-length allocation request, emitted the warning, returned NULL to
> > > sel_write_load(), and sel_write_load() handled the error condition
> > > triggered by vmalloc(0) returning NULL.  Did you see any unexpected
> > > behavior beyond this warning message above?
> >
> > Probably because kernel warnings should not be reachable from
> > userspace ...
>
> My question was asking if the reporter was seeing any unexpected
> behavior *beyond* the warning message.  I wanted to make sure they
> weren't seeing anything else on their system that we should also take
> into account.
>

I didn't see any unexpected behavior beyond this warning message. You
are right, everything appears to be working as expected. Like
Christian said, I enabled kernel panic_on_warn config. I thought
kernel warning was something worthy to report, but I was wrong. In
future reports, I will check carefully to eliminate kernel warnings
like "vmalloc zero" and "page size alloc too large" if they don't have
unexpected behaviors. Sorry for wasting your time analyzing it, and
thanks for pointing out my mistake!

> > ... although in this case loading a policy is a highly
> > privileged operation - , because they mostly signal incorrect internal
> > state and can lead with the enabled option of panic_on_warn to system
> > halts.
> >
> > I have two suggestions:
> >
> > I. Can the documentation of vmalloc() mention that passing a size of 0
> > is discouraged?
>
> One could always submit a patch and see what happens, that's almost
> always the best way to get feedback.
>
> > II. Can the global SELinux state mutex in sel_write_load() be acquired
> > after the avc permission check, so that rouge processes with write
> > access to /load but not granted security { load_policy } can not pound
> > on that mutex?
>
> We need to make sure that there is not a window between the
> avc_has_perm() permission check and the actual policy load in
> security_load_policy() where another task could race and cause some
> unexpected behavior.  For that reason I think we need to take the
> mutex before the avc_has_perm() call, and we likely want to keep the
> vmalloc()/copy_from_user() after the permission check for the same
> reason you wanted to delay taking the mutex.
>
> We probably could consider moving the @ppos and @count sanity checks
> before the mutex.
>
> --
> paul-moore.com

Best Regards,
Yue

