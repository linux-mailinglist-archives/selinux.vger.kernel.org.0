Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DC891BC8B2
	for <lists+selinux@lfdr.de>; Tue, 24 Sep 2019 15:17:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729482AbfIXNRu (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Tue, 24 Sep 2019 09:17:50 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:35606 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728379AbfIXNRt (ORCPT
        <rfc822;selinux@vger.kernel.org>); Tue, 24 Sep 2019 09:17:49 -0400
Received: by mail-lj1-f196.google.com with SMTP id m7so1860872lji.2
        for <selinux@vger.kernel.org>; Tue, 24 Sep 2019 06:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=e5eEnaa3s99TqjcNTWFhVMAZ9L326EE/q94KG75MxAE=;
        b=yvhBZUFKOGSTsX1BSfMVlaE9f+v3vtGBKmVWMAxRA3EqhKA1pxynS2fDQEgqFT6pXn
         4GA/maxes7rHZNn4sLODh/r3c0lpq8lfBJ9M1mhOmE9DF5h4+e0xA1A5py3g+yNICl7J
         mLX2vWCMRWXNEE7ZSS1iUBSL72H8132i92lTKN844PoOBsQz8avhJjE0EUsovLuksbIH
         MFpSRm0nSE+otBrlGgl3YEhKPSR8QcUmLDEfpZ1Qkm6RwLORWESPY6+htozvEkpg32Is
         Va3ASMVOhVEepMWSZw0chNdp+M6xI8N8gwVdbgUBulAX2Pr0Qr5iyjPAAByfVs6yWBmY
         apSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=e5eEnaa3s99TqjcNTWFhVMAZ9L326EE/q94KG75MxAE=;
        b=Rpb6epINYJ9EdTVtoos/bhzCehOB3S7pPg+8lUCLCmOEhYNKQT1Exa9QWvfUPF/r+R
         oD8I8IaBGCCf9RCkkC/ZMrRdzPG0jp7kTrTE8RjFPVEeP/p7CTxyMoSH1UZPSk87k13S
         LPbertneKOfzRarMh9CNeNAaLcGwg5Z+d/Lm6PpxC6sstG4+HMexjN/xSGgU6/uwlolk
         C8lH+NzIhu1QX4bKIdCbdaTuT2vaH/JaDgv2Yr39rf4n5t3ZqqCodZi3sk2VCZs01a3C
         ntItjEMmfPFY1OrH8s+ODJb2ziR48TQJbLfp9+PGYfcFNU86aj0sZygUYR/tIqb07mUN
         N1RA==
X-Gm-Message-State: APjAAAWdIP8X/pSZSswPqaaXSCMiOXsFUUTWKfre1LtinNsyAHzhuz8E
        BFEnWXerdazFSxqc3vqoZ+ewoZognzFVMz+3xYAN
X-Google-Smtp-Source: APXvYqw/PJfajd2bC5IotgMMfs89CQIiV3FS8xSvUU2GqlOKK2f4lZrMpyrdXv+CdGAKa2fNllwH/VIGSuqfd2OY+OY=
X-Received: by 2002:a2e:9615:: with SMTP id v21mr1906928ljh.46.1569331066193;
 Tue, 24 Sep 2019 06:17:46 -0700 (PDT)
MIME-Version: 1.0
References: <0000000000000814c405931224fc@google.com> <CAHC9VhQGLFWk3zqywgsip9KgTmKNTiwxDG4+BdkDQwNZKJunQg@mail.gmail.com>
 <CACT4Y+ZqJJS+g=svSJDfd4Jo==kVFbJDCxrfRX2eyBH4hw2+-g@mail.gmail.com>
In-Reply-To: <CACT4Y+ZqJJS+g=svSJDfd4Jo==kVFbJDCxrfRX2eyBH4hw2+-g@mail.gmail.com>
From:   Paul Moore <paul@paul-moore.com>
Date:   Tue, 24 Sep 2019 09:17:35 -0400
Message-ID: <CAHC9VhSa7GeLMZu=DTL_h-wtbkg7y6R9WeSAwJa4tZTVXGoX5g@mail.gmail.com>
Subject: Re: WARNING: locking bug in selinux_netlbl_socket_connect
To:     Dmitry Vyukov <dvyukov@google.com>
Cc:     syzbot <syzbot+5fa07e4e18e4eb1ccb12@syzkaller.appspotmail.com>,
        Eric Paris <eparis@parisplace.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Stephen Smalley <sds@tycho.nsa.gov>, selinux@vger.kernel.org,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Tue, Sep 24, 2019 at 4:21 AM Dmitry Vyukov <dvyukov@google.com> wrote:
> On Tue, Sep 24, 2019 at 4:14 AM Paul Moore <paul@paul-moore.com> wrote:
> > On Sat, Sep 21, 2019 at 11:50 AM syzbot
> > <syzbot+5fa07e4e18e4eb1ccb12@syzkaller.appspotmail.com> wrote:
> > > Hello,
> > >
> > > syzbot found the following crash on:
> > >
> > > HEAD commit:    f97c81dc Merge tag 'armsoc-late' of git://git.kernel.org/p..
> > > git tree:       upstream
> > > console output: https://syzkaller.appspot.com/x/log.txt?x=127b709d600000
> > > kernel config:  https://syzkaller.appspot.com/x/.config?x=10283c2b00ab4cd7
> > > dashboard link: https://syzkaller.appspot.com/bug?extid=5fa07e4e18e4eb1ccb12
> > > compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> > > syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=12996841600000
> > >
> > > IMPORTANT: if you fix the bug, please add the following tag to the commit:
> > > Reported-by: syzbot+5fa07e4e18e4eb1ccb12@syzkaller.appspotmail.com
> > >
> > > WARNING: CPU: 0 PID: 10315 at kernel/locking/lockdep.c:840
> > > look_up_lock_class kernel/locking/lockdep.c:840 [inline]
> > > WARNING: CPU: 0 PID: 10315 at kernel/locking/lockdep.c:840
> > > register_lock_class+0x206/0x1850 kernel/locking/lockdep.c:1185
> > > Kernel panic - not syncing: panic_on_warn set ...
> > > CPU: 0 PID: 10315 Comm: syz-executor.0 Not tainted 5.3.0+ #0
> > > Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS
> > > Google 01/01/2011
> > > Call Trace:
> > >   __dump_stack lib/dump_stack.c:77 [inline]
> > >   dump_stack+0x172/0x1f0 lib/dump_stack.c:113
> > >   panic+0x2dc/0x755 kernel/panic.c:219
> > >   __warn.cold+0x20/0x4c kernel/panic.c:576
> > >   report_bug+0x263/0x2b0 lib/bug.c:186
> > >   fixup_bug arch/x86/kernel/traps.c:179 [inline]
> > >   fixup_bug arch/x86/kernel/traps.c:174 [inline]
> > >   do_error_trap+0x11b/0x200 arch/x86/kernel/traps.c:272
> > >   do_invalid_op+0x37/0x50 arch/x86/kernel/traps.c:291
> > >   invalid_op+0x23/0x30 arch/x86/entry/entry_64.S:1028
> > > RIP: 0010:look_up_lock_class kernel/locking/lockdep.c:840 [inline]
> > > RIP: 0010:register_lock_class+0x206/0x1850 kernel/locking/lockdep.c:1185
> > > Code: fc ff df 48 89 fa 48 c1 ea 03 80 3c 02 00 0f 85 aa 10 00 00 4c 3b 7b
> > > 18 44 8b 35 d5 de 55 09 74 0b 48 81 3b a0 65 06 8a 74 02 <0f> 0b 45 85 ed
> > > 0f 84 71 03 00 00 f6 85 70 ff ff ff 01 0f 85 64 03
> > > RSP: 0018:ffff888096777a48 EFLAGS: 00010002
> > > RAX: dffffc0000000000 RBX: ffff888093ff78e0 RCX: 0000000000000000
> > > RDX: 1ffff110127fef1f RSI: 0000000000000000 RDI: ffff888093ff78f8
> > > RBP: ffff888096777b10 R08: 1ffff11012ceef51 R09: ffffffff8aaea0e0
> > > R10: ffffffff8a7753c8 R11: 0000000000000000 R12: ffffffff8a7b5d20
> > > R13: 0000000000000000 R14: 0000000000000000 R15: ffffffff884766e0
> > >   __lock_acquire+0xf4/0x4e70 kernel/locking/lockdep.c:3837
> > >   lock_acquire+0x190/0x410 kernel/locking/lockdep.c:4487
> > >   __raw_spin_lock_bh include/linux/spinlock_api_smp.h:135 [inline]
> > >   _raw_spin_lock_bh+0x33/0x50 kernel/locking/spinlock.c:175
> > >   spin_lock_bh include/linux/spinlock.h:343 [inline]
> > >   lock_sock_nested+0x41/0x120 net/core/sock.c:2929
> > >   lock_sock include/net/sock.h:1522 [inline]
> > >   selinux_netlbl_socket_connect+0x20/0xc0 security/selinux/netlabel.c:607
> > >   selinux_socket_connect+0x6a/0x90 security/selinux/hooks.c:4745
> > >   security_socket_connect+0x77/0xc0 security/security.c:1958
> > >   __sys_connect+0x19d/0x330 net/socket.c:1824
> > >   __do_sys_connect net/socket.c:1839 [inline]
> > >   __se_sys_connect net/socket.c:1836 [inline]
> > >   __x64_sys_connect+0x73/0xb0 net/socket.c:1836
> > >   do_syscall_64+0xfa/0x760 arch/x86/entry/common.c:290
> > >   entry_SYSCALL_64_after_hwframe+0x49/0xbe
> > > RIP: 0033:0x459a09
> > > Code: fd b7 fb ff c3 66 2e 0f 1f 84 00 00 00 00 00 66 90 48 89 f8 48 89 f7
> > > 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff
> > > ff 0f 83 cb b7 fb ff c3 66 2e 0f 1f 84 00 00 00 00
> > > RSP: 002b:00007fc302ec5c78 EFLAGS: 00000246 ORIG_RAX: 000000000000002a
> > > RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 0000000000459a09
> > > RDX: 000000000000001c RSI: 0000000020000080 RDI: 0000000000000005
> > > RBP: 000000000075bf20 R08: 0000000000000000 R09: 0000000000000000
> > > R10: 0000000000000000 R11: 0000000000000246 R12: 00007fc302ec66d4
> > > R13: 00000000004bff42 R14: 00000000004d1eb0 R15: 00000000ffffffff
> > > Kernel Offset: disabled
> > > Rebooting in 86400 seconds..
> >
> > This doesn't appear to be related to selinux_netlbl_socket_connect();
> > I believe it should be okay to call lock_sock() in that context.
>
>
> FTR, this is this warning:
>
> static inline struct lock_class *
> look_up_lock_class(const struct lockdep_map *lock, unsigned int subclass)
> {
> ....
>                         /*
>                          * Huh! same key, different name? Did someone trample
>                          * on some memory? We're most confused.
>                          */
>                         WARN_ON_ONCE(class->name != lock->name &&
>                                      lock->key != &__lockdep_no_validate__);
>
>
> So something fishy happens here (stack overflow again?).

Yeah, when I saw that yesterday I figured it was something beyond the
usual connect() call path; something else is going on I think.  I
didn't see a reproducer for this, is that right?

-- 
paul moore
www.paul-moore.com
