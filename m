Return-Path: <selinux+bounces-2402-lists+selinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 166499D9A05
	for <lists+selinux@lfdr.de>; Tue, 26 Nov 2024 15:56:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 993F9B215B3
	for <lists+selinux@lfdr.de>; Tue, 26 Nov 2024 14:56:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7C3D1D5ADA;
	Tue, 26 Nov 2024 14:56:36 +0000 (UTC)
X-Original-To: selinux@vger.kernel.org
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 036C622334
	for <selinux@vger.kernel.org>; Tue, 26 Nov 2024 14:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732632996; cv=none; b=SFs/eX2SsHlcG+6oHPjV8JBIHRK0JcCWDDnhixv3t0MSWRbDhBC+6R9/KJPcFcoI2M06SWwbT2U4NEgMIbhSNqaV2EIOZfta5lz0+MJavGP49AVpV8lvAcGFz//yK1qaVfEZShKKZao/aqU3BogV4UWH0UDpiGCacMVbTTPQv8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732632996; c=relaxed/simple;
	bh=aOOYKT10tH1WVnCOZfHvvkL/b8rVz/jrXxN+CDHATvM=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=M0dYe1EWct4UkmYkD/MaSt7l4Jxd36AAhZdED8IOTVJUQvSPVZ1P0TDmCcqS+EpNwGxEAceYezmmMcxzuVT5IUOFxlDNKSbGuzWGDcq+eA0Z2YuSUzsXV99Yr3hkxOWdRU+Jtsknmy+yGfixLvtXR9uW2XnxYZDGdm1WBcPe4Xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3a7c49026a8so259195ab.3
        for <selinux@vger.kernel.org>; Tue, 26 Nov 2024 06:56:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732632994; x=1733237794;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zLGSE5caNRk2QkwXrM/kk0si8FBo8dLVBWYLw6jzDHU=;
        b=vzygCqt9e9Qf8nvlcb2I/4SIT0foDnSUWvOVEzzsP3yf30YSt8L1G2MZ+ngCYZN0gU
         vhAxxBkV/LVstmxSAnXI7UjcSw13JCYoKjoCDby7NtiP8uICstkC8faGy6g+zHdOvGG5
         arfHT2DsWrOT5ADoouyMJMWyRfgPoOrmSh5TJEBhDKI7svpaN7mB5QdngOv2jbSf+DXU
         5Ex6LqrcuSTucRBu3i3TN/FeH5LQim5uO53mboriWKsXPHQk8njfq2s1l1tZ+NWvPdC4
         a0RTJCycU05unNcH/kp831pKVDOeyXfwr2qYnlIwM99aYHMI2DxXkQaozpLFhQQD1Lks
         kK+A==
X-Forwarded-Encrypted: i=1; AJvYcCVWbTykAGx86Sk5k15fgd9aSFB9xq6mCuA+ao8eHNForvh4seUr9CCPKBbkgKa8ZU7UbJB99FRv@vger.kernel.org
X-Gm-Message-State: AOJu0YzP+gtSTT7d9vQrH3eXt9bVuDFnvKVQNaOMajmIS1Qosr8ZpSdr
	d3NFoLgQo6az/XPQ6Slki+JSaqWhqJC4c7BcFgqmPnqDmx7LdR8fq2gf/tQq+9siPSnmSHJy7Cr
	T48MTiMpN9zS7ZRQiIKDRksa7AusvhMEvfzz+BXTlY9J/zoQI5gR+PNc=
X-Google-Smtp-Source: AGHT+IGosmNAdckzCfYwFvUBjs+GM7k3Zb6ovC8Hl9uhZ1jDJKK2o1Eb7RLZDggTp20SAer1lPNqCNJgx8TPCyMb6rOVOycd+saL
Precedence: bulk
X-Mailing-List: selinux@vger.kernel.org
List-Id: <selinux.vger.kernel.org>
List-Subscribe: <mailto:selinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:selinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1fe1:b0:3a7:8720:9e9f with SMTP id
 e9e14a558f8ab-3a79ad0f8a8mr197922655ab.2.1732632994157; Tue, 26 Nov 2024
 06:56:34 -0800 (PST)
Date: Tue, 26 Nov 2024 06:56:34 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6745e1a2.050a0220.1286eb.001c.GAE@google.com>
Subject: [syzbot] [selinux?] KASAN: slab-out-of-bounds Read in selinux_ip_output
From: syzbot <syzbot+2d9f5f948c31dcb7745e@syzkaller.appspotmail.com>
To: brianvv@google.com, edumazet@google.com, kuba@kernel.org, 
	kuniyu@amazon.com, linux-kernel@vger.kernel.org, omosnace@redhat.com, 
	paul@paul-moore.com, selinux@vger.kernel.org, stephen.smalley.work@gmail.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    fcc79e1714e8 Merge tag 'net-next-6.13' of git://git.kernel..
git tree:       upstream
console+strace: https://syzkaller.appspot.com/x/log.txt?x=10c606e8580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=2c04b80691ccbb7
dashboard link: https://syzkaller.appspot.com/bug?extid=2d9f5f948c31dcb7745e
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1221675f980000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=136dd930580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/f68aa5d85643/disk-fcc79e17.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/ad99781945ae/vmlinux-fcc79e17.xz
kernel image: https://storage.googleapis.com/syzbot-assets/4c4059c60213/bzImage-fcc79e17.xz

The issue was bisected to:

commit 79636038d37e7bd4d078238f2a3f002cab4423bc
Author: Eric Dumazet <edumazet@google.com>
Date:   Thu Oct 10 17:48:17 2024 +0000

    ipv4: tcp: give socket pointer to control skbs

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1235175f980000
final oops:     https://syzkaller.appspot.com/x/report.txt?x=1135175f980000
console output: https://syzkaller.appspot.com/x/log.txt?x=1635175f980000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+2d9f5f948c31dcb7745e@syzkaller.appspotmail.com
Fixes: 79636038d37e ("ipv4: tcp: give socket pointer to control skbs")

==================================================================
BUG: KASAN: slab-out-of-bounds in selinux_sock security/selinux/include/objsec.h:207 [inline]
BUG: KASAN: slab-out-of-bounds in selinux_ip_output+0x1e0/0x1f0 security/selinux/hooks.c:5761
Read of size 8 at addr ffff88804e86e758 by task syz-executor347/5894

CPU: 0 UID: 0 PID: 5894 Comm: syz-executor347 Not tainted 6.12.0-syzkaller-05480-gfcc79e1714e8 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/30/2024
Call Trace:
 <IRQ>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x116/0x1f0 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:377 [inline]
 print_report+0xc3/0x620 mm/kasan/report.c:488
 kasan_report+0xd9/0x110 mm/kasan/report.c:601
 selinux_sock security/selinux/include/objsec.h:207 [inline]
 selinux_ip_output+0x1e0/0x1f0 security/selinux/hooks.c:5761
 nf_hook_entry_hookfn include/linux/netfilter.h:154 [inline]
 nf_hook_slow+0xbb/0x200 net/netfilter/core.c:626
 nf_hook+0x386/0x6d0 include/linux/netfilter.h:269
 __ip_local_out+0x339/0x640 net/ipv4/ip_output.c:119
 ip_local_out net/ipv4/ip_output.c:128 [inline]
 ip_send_skb net/ipv4/ip_output.c:1505 [inline]
 ip_push_pending_frames+0xa0/0x5b0 net/ipv4/ip_output.c:1525
 ip_send_unicast_reply+0xd0e/0x1650 net/ipv4/ip_output.c:1672
 tcp_v4_send_ack+0x976/0x13f0 net/ipv4/tcp_ipv4.c:1024
 tcp_v4_timewait_ack net/ipv4/tcp_ipv4.c:1077 [inline]
 tcp_v4_rcv+0x2f96/0x4390 net/ipv4/tcp_ipv4.c:2428
 ip_protocol_deliver_rcu+0xba/0x4c0 net/ipv4/ip_input.c:205
 ip_local_deliver_finish+0x316/0x570 net/ipv4/ip_input.c:233
 NF_HOOK include/linux/netfilter.h:314 [inline]
 NF_HOOK include/linux/netfilter.h:308 [inline]
 ip_local_deliver+0x18e/0x1f0 net/ipv4/ip_input.c:254
 dst_input include/net/dst.h:460 [inline]
 ip_rcv_finish net/ipv4/ip_input.c:447 [inline]
 NF_HOOK include/linux/netfilter.h:314 [inline]
 NF_HOOK include/linux/netfilter.h:308 [inline]
 ip_rcv+0x2c3/0x5d0 net/ipv4/ip_input.c:567
 __netif_receive_skb_one_core+0x199/0x1e0 net/core/dev.c:5672
 __netif_receive_skb+0x1d/0x160 net/core/dev.c:5785
 process_backlog+0x443/0x15f0 net/core/dev.c:6117
 __napi_poll.constprop.0+0xb7/0x550 net/core/dev.c:6877
 napi_poll net/core/dev.c:6946 [inline]
 net_rx_action+0xa94/0x1010 net/core/dev.c:7068
 handle_softirqs+0x213/0x8f0 kernel/softirq.c:554
 do_softirq kernel/softirq.c:455 [inline]
 do_softirq+0xb2/0xf0 kernel/softirq.c:442
 </IRQ>
 <TASK>
 __local_bh_enable_ip+0x100/0x120 kernel/softirq.c:382
 local_bh_enable include/linux/bottom_half.h:33 [inline]
 rcu_read_unlock_bh include/linux/rcupdate.h:919 [inline]
 __dev_queue_xmit+0x8af/0x43e0 net/core/dev.c:4461
 dev_queue_xmit include/linux/netdevice.h:3168 [inline]
 neigh_hh_output include/net/neighbour.h:523 [inline]
 neigh_output include/net/neighbour.h:537 [inline]
 ip_finish_output2+0xc6c/0x2150 net/ipv4/ip_output.c:236
 __ip_finish_output net/ipv4/ip_output.c:314 [inline]
 __ip_finish_output+0x49e/0x950 net/ipv4/ip_output.c:296
 ip_finish_output+0x35/0x380 net/ipv4/ip_output.c:324
 NF_HOOK_COND include/linux/netfilter.h:303 [inline]
 ip_output+0x13b/0x2a0 net/ipv4/ip_output.c:434
 dst_output include/net/dst.h:450 [inline]
 ip_local_out+0x33e/0x4a0 net/ipv4/ip_output.c:130
 __ip_queue_xmit+0x777/0x1970 net/ipv4/ip_output.c:536
 __tcp_transmit_skb+0x2b39/0x3df0 net/ipv4/tcp_output.c:1466
 tcp_transmit_skb net/ipv4/tcp_output.c:1484 [inline]
 tcp_write_xmit+0x12b1/0x8560 net/ipv4/tcp_output.c:2827
 __tcp_push_pending_frames+0xaf/0x390 net/ipv4/tcp_output.c:3010
 tcp_send_fin+0x154/0xc70 net/ipv4/tcp_output.c:3616
 __tcp_close+0x96b/0xff0 net/ipv4/tcp.c:3130
 tcp_close+0x28/0x120 net/ipv4/tcp.c:3221
 inet_release+0x13c/0x280 net/ipv4/af_inet.c:435
 __sock_release net/socket.c:640 [inline]
 sock_release+0x8e/0x1d0 net/socket.c:668
 smc_clcsock_release+0xb7/0xe0 net/smc/smc_close.c:34
 __smc_release+0x5c2/0x880 net/smc/af_smc.c:301
 smc_release+0x1fc/0x5f0 net/smc/af_smc.c:344
 __sock_release+0xb0/0x270 net/socket.c:640
 sock_close+0x1c/0x30 net/socket.c:1408
 __fput+0x3f8/0xb60 fs/file_table.c:450
 __fput_sync+0xa1/0xc0 fs/file_table.c:535
 __do_sys_close fs/open.c:1550 [inline]
 __se_sys_close fs/open.c:1535 [inline]
 __x64_sys_close+0x86/0x100 fs/open.c:1535
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f6814c9ae10
Code: ff f7 d8 64 89 02 48 c7 c0 ff ff ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 66 90 80 3d b1 e2 07 00 00 74 17 b8 03 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 48 c3 0f 1f 80 00 00 00 00 48 83 ec 18 89 7c
RSP: 002b:00007fffb2389758 EFLAGS: 00000202 ORIG_RAX: 0000000000000003
RAX: ffffffffffffffda RBX: 0000000000000004 RCX: 00007f6814c9ae10
RDX: 0000000000000010 RSI: 0000000020000000 RDI: 0000000000000003
RBP: 00000000000f4240 R08: 0000000000000001 R09: 0000000000000001
R10: 0000000000000001 R11: 0000000000000202 R12: 00007fffb23897b0
R13: 00000000000141c3 R14: 00007fffb238977c R15: 00007fffb2389790
 </TASK>

The buggy address belongs to the object at ffff88804e86e6e0
 which belongs to the cache tw_sock_TCPv6 of size 288
The buggy address is located 120 bytes inside of
 allocated 288-byte region [ffff88804e86e6e0, ffff88804e86e800)

The buggy address belongs to the physical page:
page: refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x4e86e
head: order:1 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
flags: 0xfff00000000040(head|node=0|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 00fff00000000040 ffff88802f7de780 dead000000000122 0000000000000000
raw: 0000000000000000 0000000080170017 00000001f5000000 0000000000000000
head: 00fff00000000040 ffff88802f7de780 dead000000000122 0000000000000000
head: 0000000000000000 0000000080170017 00000001f5000000 0000000000000000
head: 00fff00000000001 ffffea00013a1b81 ffffffffffffffff 0000000000000000
head: ffff888000000002 0000000000000000 00000000ffffffff 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 1, migratetype Unmovable, gfp_mask 0x52820(GFP_ATOMIC|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP), pid 5886, tgid 5886 (syz-executor347), ts 82226685563, free_ts 82225964204
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0x2d1/0x350 mm/page_alloc.c:1556
 prep_new_page mm/page_alloc.c:1564 [inline]
 get_page_from_freelist+0xfce/0x2f80 mm/page_alloc.c:3474
 __alloc_pages_noprof+0x223/0x25a0 mm/page_alloc.c:4751
 alloc_pages_mpol_noprof+0x2c9/0x610 mm/mempolicy.c:2265
 alloc_slab_page mm/slub.c:2412 [inline]
 allocate_slab mm/slub.c:2578 [inline]
 new_slab+0x2c9/0x410 mm/slub.c:2631
 ___slab_alloc+0xdac/0x1880 mm/slub.c:3818
 __slab_alloc.constprop.0+0x56/0xb0 mm/slub.c:3908
 __slab_alloc_node mm/slub.c:3961 [inline]
 slab_alloc_node mm/slub.c:4122 [inline]
 kmem_cache_alloc_noprof+0x2a7/0x2f0 mm/slub.c:4141
 inet_twsk_alloc+0x120/0x970 net/ipv4/inet_timewait_sock.c:188
 tcp_time_wait+0x5f/0xe10 net/ipv4/tcp_minisocks.c:309
 tcp_fin+0x418/0x500 net/ipv4/tcp_input.c:4604
 tcp_data_queue+0x1d61/0x4d80 net/ipv4/tcp_input.c:5290
 tcp_rcv_state_process+0xf6f/0x4c40 net/ipv4/tcp_input.c:6972
 tcp_v4_do_rcv+0x1ad/0xa90 net/ipv4/tcp_ipv4.c:1939
 tcp_v4_rcv+0x33a8/0x4390 net/ipv4/tcp_ipv4.c:2351
 ip_protocol_deliver_rcu+0xba/0x4c0 net/ipv4/ip_input.c:205
page last free pid 24 tgid 24 stack trace:
 reset_page_owner include/linux/page_owner.h:25 [inline]
 free_pages_prepare mm/page_alloc.c:1127 [inline]
 free_unref_page+0x661/0x1080 mm/page_alloc.c:2657
 rcu_do_batch kernel/rcu/tree.c:2567 [inline]
 rcu_core+0x79d/0x14d0 kernel/rcu/tree.c:2823
 handle_softirqs+0x213/0x8f0 kernel/softirq.c:554
 run_ksoftirqd kernel/softirq.c:943 [inline]
 run_ksoftirqd+0x3a/0x60 kernel/softirq.c:935
 smpboot_thread_fn+0x661/0xa30 kernel/smpboot.c:164
 kthread+0x2c1/0x3a0 kernel/kthread.c:389
 ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244

Memory state around the buggy address:
 ffff88804e86e600: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
 ffff88804e86e680: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
>ffff88804e86e700: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
                                                    ^
 ffff88804e86e780: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
 ffff88804e86e800: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
==================================================================


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
For information about bisection process see: https://goo.gl/tpsmEJ#bisection

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup

