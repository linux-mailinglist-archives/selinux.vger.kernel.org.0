Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 10D41B9EB9
	for <lists+selinux@lfdr.de>; Sat, 21 Sep 2019 17:50:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393508AbfIUPuI (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Sat, 21 Sep 2019 11:50:08 -0400
Received: from mail-io1-f71.google.com ([209.85.166.71]:44038 "EHLO
        mail-io1-f71.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389131AbfIUPuH (ORCPT
        <rfc822;selinux@vger.kernel.org>); Sat, 21 Sep 2019 11:50:07 -0400
Received: by mail-io1-f71.google.com with SMTP id m3so15831168ion.11
        for <selinux@vger.kernel.org>; Sat, 21 Sep 2019 08:50:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=e1WwvsIOYgkKP6m2QdsEqob6hucr8LgwvJH9je6vT4o=;
        b=jwKSC73RCWUWZ9mDJDC4oiQhKqXiTRG0iusdejFQKgdF4rVuZkraFEVsJZ71mxMI9N
         AUE+CdrBPIOJNMLchEbfmYaYOOU50bcTrpZZwHkyHVPTNVKMq0v1pjxHOZ3/y9gXccy/
         ZtwozzPqNLhB6shDQZwFzQQTb1W7wgOQF/guPfAOcHWdnKPWj0AIF6lfE5nsTWFHFgHC
         oZ0ojGeEG1UoLB0lVxaunTOl1uuw0/KIykz0xM+3vCFKXpk/9IDbp8qrDXQWMpvdTzBZ
         fwGeJKtiRXfWZJU19h5AowtNPabcBGa4A6qxZCbMqeh9R0JxSJK4NeETaaXG1wGJ1+0r
         26Yw==
X-Gm-Message-State: APjAAAWYLuGjFcstY6fvc868mFgHB6V3czBBTTjJrffAk1RSSk1CWgdm
        NoYPHdbs3oY7/wDcngiENkrDwlIzJGD0iUnSlwJlqiMzqG2x
X-Google-Smtp-Source: APXvYqytDHK6Dr2YK7Ap6GUTihvNdQJ786D0hVc+JqFAK50SjmBDdxPD3xsJORDF0yRO3OvNJPMW6N/jlodpy18MHHirkaWBA2Yi
MIME-Version: 1.0
X-Received: by 2002:a6b:b643:: with SMTP id g64mr8423961iof.149.1569081006755;
 Sat, 21 Sep 2019 08:50:06 -0700 (PDT)
Date:   Sat, 21 Sep 2019 08:50:06 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000000814c405931224fc@google.com>
Subject: WARNING: locking bug in selinux_netlbl_socket_connect
From:   syzbot <syzbot+5fa07e4e18e4eb1ccb12@syzkaller.appspotmail.com>
To:     eparis@parisplace.org, linux-kernel@vger.kernel.org,
        paul@paul-moore.com, sds@tycho.nsa.gov, selinux@vger.kernel.org,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Hello,

syzbot found the following crash on:

HEAD commit:    f97c81dc Merge tag 'armsoc-late' of git://git.kernel.org/p..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=127b709d600000
kernel config:  https://syzkaller.appspot.com/x/.config?x=10283c2b00ab4cd7
dashboard link: https://syzkaller.appspot.com/bug?extid=5fa07e4e18e4eb1ccb12
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=12996841600000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+5fa07e4e18e4eb1ccb12@syzkaller.appspotmail.com

WARNING: CPU: 0 PID: 10315 at kernel/locking/lockdep.c:840  
look_up_lock_class kernel/locking/lockdep.c:840 [inline]
WARNING: CPU: 0 PID: 10315 at kernel/locking/lockdep.c:840  
register_lock_class+0x206/0x1850 kernel/locking/lockdep.c:1185
Kernel panic - not syncing: panic_on_warn set ...
CPU: 0 PID: 10315 Comm: syz-executor.0 Not tainted 5.3.0+ #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
Call Trace:
  __dump_stack lib/dump_stack.c:77 [inline]
  dump_stack+0x172/0x1f0 lib/dump_stack.c:113
  panic+0x2dc/0x755 kernel/panic.c:219
  __warn.cold+0x20/0x4c kernel/panic.c:576
  report_bug+0x263/0x2b0 lib/bug.c:186
  fixup_bug arch/x86/kernel/traps.c:179 [inline]
  fixup_bug arch/x86/kernel/traps.c:174 [inline]
  do_error_trap+0x11b/0x200 arch/x86/kernel/traps.c:272
  do_invalid_op+0x37/0x50 arch/x86/kernel/traps.c:291
  invalid_op+0x23/0x30 arch/x86/entry/entry_64.S:1028
RIP: 0010:look_up_lock_class kernel/locking/lockdep.c:840 [inline]
RIP: 0010:register_lock_class+0x206/0x1850 kernel/locking/lockdep.c:1185
Code: fc ff df 48 89 fa 48 c1 ea 03 80 3c 02 00 0f 85 aa 10 00 00 4c 3b 7b  
18 44 8b 35 d5 de 55 09 74 0b 48 81 3b a0 65 06 8a 74 02 <0f> 0b 45 85 ed  
0f 84 71 03 00 00 f6 85 70 ff ff ff 01 0f 85 64 03
RSP: 0018:ffff888096777a48 EFLAGS: 00010002
RAX: dffffc0000000000 RBX: ffff888093ff78e0 RCX: 0000000000000000
RDX: 1ffff110127fef1f RSI: 0000000000000000 RDI: ffff888093ff78f8
RBP: ffff888096777b10 R08: 1ffff11012ceef51 R09: ffffffff8aaea0e0
R10: ffffffff8a7753c8 R11: 0000000000000000 R12: ffffffff8a7b5d20
R13: 0000000000000000 R14: 0000000000000000 R15: ffffffff884766e0
  __lock_acquire+0xf4/0x4e70 kernel/locking/lockdep.c:3837
  lock_acquire+0x190/0x410 kernel/locking/lockdep.c:4487
  __raw_spin_lock_bh include/linux/spinlock_api_smp.h:135 [inline]
  _raw_spin_lock_bh+0x33/0x50 kernel/locking/spinlock.c:175
  spin_lock_bh include/linux/spinlock.h:343 [inline]
  lock_sock_nested+0x41/0x120 net/core/sock.c:2929
  lock_sock include/net/sock.h:1522 [inline]
  selinux_netlbl_socket_connect+0x20/0xc0 security/selinux/netlabel.c:607
  selinux_socket_connect+0x6a/0x90 security/selinux/hooks.c:4745
  security_socket_connect+0x77/0xc0 security/security.c:1958
  __sys_connect+0x19d/0x330 net/socket.c:1824
  __do_sys_connect net/socket.c:1839 [inline]
  __se_sys_connect net/socket.c:1836 [inline]
  __x64_sys_connect+0x73/0xb0 net/socket.c:1836
  do_syscall_64+0xfa/0x760 arch/x86/entry/common.c:290
  entry_SYSCALL_64_after_hwframe+0x49/0xbe
RIP: 0033:0x459a09
Code: fd b7 fb ff c3 66 2e 0f 1f 84 00 00 00 00 00 66 90 48 89 f8 48 89 f7  
48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff  
ff 0f 83 cb b7 fb ff c3 66 2e 0f 1f 84 00 00 00 00
RSP: 002b:00007fc302ec5c78 EFLAGS: 00000246 ORIG_RAX: 000000000000002a
RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 0000000000459a09
RDX: 000000000000001c RSI: 0000000020000080 RDI: 0000000000000005
RBP: 000000000075bf20 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 00007fc302ec66d4
R13: 00000000004bff42 R14: 00000000004d1eb0 R15: 00000000ffffffff
Kernel Offset: disabled
Rebooting in 86400 seconds..


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this bug, for details see:
https://goo.gl/tpsmEJ#testing-patches
