Return-Path: <selinux+bounces-2406-lists+selinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3079A9DA138
	for <lists+selinux@lfdr.de>; Wed, 27 Nov 2024 04:50:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8E847B237ED
	for <lists+selinux@lfdr.de>; Wed, 27 Nov 2024 03:50:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A94B984A3E;
	Wed, 27 Nov 2024 03:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amazon.com header.i=@amazon.com header.b="lvLYBmHl"
X-Original-To: selinux@vger.kernel.org
Received: from smtp-fw-33001.amazon.com (smtp-fw-33001.amazon.com [207.171.190.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C34E81114;
	Wed, 27 Nov 2024 03:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=207.171.190.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732679426; cv=none; b=JAY8dUWYMe97x3vjze9Rh22bQ7QwdY+6ruwWhUNUFwCgHorw2aBlOt33skT61zrbrZUBVERtdi0SLZ16/Q5YHUZKlHwkl9YheEVcYcMCF6z/RHqlZSCTS4ksUsHXnEKElOcGo39kNrhRvO6xxceverOHe8a3XP2B9st2A41HwYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732679426; c=relaxed/simple;
	bh=6I6hK+UF7K7xKhyziwcH3k8FIM1vLaczV9xXJBgaSL8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tyR5NMXhOXrzYr9RgpT4yjFJRRbNG0aAm21G1yUcQCsWyH8NQYn53X2TptTpEcD5h2Ryb5KtPI/RCgAEZQC6VmC6doFgLRWWwdHpQWD1Y1MiT6IMr8dJcebLYgQXz5Z42GVFPFA2sC63sdA/fqPTzXF9WsOOj1A+cNFhUB7oJxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.co.jp; dkim=pass (1024-bit key) header.d=amazon.com header.i=@amazon.com header.b=lvLYBmHl; arc=none smtp.client-ip=207.171.190.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.co.jp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1732679425; x=1764215425;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=o4cYpsbHFcdXVfTEbM3aqYGS89y2HXD/LZ/sYVPWj3w=;
  b=lvLYBmHl7bHiw6E6ID85aLwfbw07epQF8tgGTggeaBrptNRZOTNqnFB/
   5BorLJYkvk8Fja34EdzLcy9cU2V9wKB27esjyWrtB/nAxl54yF3H/5cCB
   HGW9oLZyD2SKTRMfcCjAffOkuXx3hCwh+3uwxz6kQyMuU4sLWqsiVuKzx
   w=;
X-IronPort-AV: E=Sophos;i="6.12,188,1728950400"; 
   d="scan'208";a="388681893"
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.25.36.210])
  by smtp-border-fw-33001.sea14.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2024 03:50:02 +0000
Received: from EX19MTAUWA002.ant.amazon.com [10.0.21.151:43796]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.10.101:2525] with esmtp (Farcaster)
 id 74ddd146-9a08-4169-9545-8a7e019c06cb; Wed, 27 Nov 2024 03:50:01 +0000 (UTC)
X-Farcaster-Flow-ID: 74ddd146-9a08-4169-9545-8a7e019c06cb
Received: from EX19D004ANA001.ant.amazon.com (10.37.240.138) by
 EX19MTAUWA002.ant.amazon.com (10.250.64.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.34;
 Wed, 27 Nov 2024 03:50:01 +0000
Received: from 6c7e67c6786f.amazon.com (10.119.13.144) by
 EX19D004ANA001.ant.amazon.com (10.37.240.138) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.35;
 Wed, 27 Nov 2024 03:49:57 +0000
From: Kuniyuki Iwashima <kuniyu@amazon.com>
To: <edumazet@google.com>
CC: <brianvv@google.com>, <davem@davemloft.net>, <eric.dumazet@gmail.com>,
	<kuba@kernel.org>, <kuniyu@amazon.com>, <netdev@vger.kernel.org>,
	<omosnace@redhat.com>, <pabeni@redhat.com>, <paul@paul-moore.com>,
	<selinux@vger.kernel.org>, <stephen.smalley.work@gmail.com>,
	<syzbot+2d9f5f948c31dcb7745e@syzkaller.appspotmail.com>
Subject: Re: [PATCH net] selinux: use sk_to_full_sk() in selinux_ip_output()
Date: Wed, 27 Nov 2024 12:49:50 +0900
Message-ID: <20241127034950.19842-1-kuniyu@amazon.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20241126145911.4187198-1-edumazet@google.com>
References: <20241126145911.4187198-1-edumazet@google.com>
Precedence: bulk
X-Mailing-List: selinux@vger.kernel.org
List-Id: <selinux.vger.kernel.org>
List-Subscribe: <mailto:selinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:selinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D045UWA003.ant.amazon.com (10.13.139.46) To
 EX19D004ANA001.ant.amazon.com (10.37.240.138)

From: Eric Dumazet <edumazet@google.com>
Date: Tue, 26 Nov 2024 14:59:11 +0000
> In blamed commit, TCP started to attach timewait sockets to
> some skbs.
> 
> syzbot reported that selinux_ip_output() was not expecting them yet.
> 
> Note that using sk_to_full_sk() is still allowing the
> following sk_listener() check to work as before.
> 
> BUG: KASAN: slab-out-of-bounds in selinux_sock security/selinux/include/objsec.h:207 [inline]
> BUG: KASAN: slab-out-of-bounds in selinux_ip_output+0x1e0/0x1f0 security/selinux/hooks.c:5761
> Read of size 8 at addr ffff88804e86e758 by task syz-executor347/5894
> 
> CPU: 0 UID: 0 PID: 5894 Comm: syz-executor347 Not tainted 6.12.0-syzkaller-05480-gfcc79e1714e8 #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/30/2024
> Call Trace:
>  <IRQ>
>   __dump_stack lib/dump_stack.c:94 [inline]
>   dump_stack_lvl+0x116/0x1f0 lib/dump_stack.c:120
>   print_address_description mm/kasan/report.c:377 [inline]
>   print_report+0xc3/0x620 mm/kasan/report.c:488
>   kasan_report+0xd9/0x110 mm/kasan/report.c:601
>   selinux_sock security/selinux/include/objsec.h:207 [inline]
>   selinux_ip_output+0x1e0/0x1f0 security/selinux/hooks.c:5761
>   nf_hook_entry_hookfn include/linux/netfilter.h:154 [inline]
>   nf_hook_slow+0xbb/0x200 net/netfilter/core.c:626
>   nf_hook+0x386/0x6d0 include/linux/netfilter.h:269
>   __ip_local_out+0x339/0x640 net/ipv4/ip_output.c:119
>   ip_local_out net/ipv4/ip_output.c:128 [inline]
>   ip_send_skb net/ipv4/ip_output.c:1505 [inline]
>   ip_push_pending_frames+0xa0/0x5b0 net/ipv4/ip_output.c:1525
>   ip_send_unicast_reply+0xd0e/0x1650 net/ipv4/ip_output.c:1672
>   tcp_v4_send_ack+0x976/0x13f0 net/ipv4/tcp_ipv4.c:1024
>   tcp_v4_timewait_ack net/ipv4/tcp_ipv4.c:1077 [inline]
>   tcp_v4_rcv+0x2f96/0x4390 net/ipv4/tcp_ipv4.c:2428
>   ip_protocol_deliver_rcu+0xba/0x4c0 net/ipv4/ip_input.c:205
>   ip_local_deliver_finish+0x316/0x570 net/ipv4/ip_input.c:233
>   NF_HOOK include/linux/netfilter.h:314 [inline]
>   NF_HOOK include/linux/netfilter.h:308 [inline]
>   ip_local_deliver+0x18e/0x1f0 net/ipv4/ip_input.c:254
>   dst_input include/net/dst.h:460 [inline]
>   ip_rcv_finish net/ipv4/ip_input.c:447 [inline]
>   NF_HOOK include/linux/netfilter.h:314 [inline]
>   NF_HOOK include/linux/netfilter.h:308 [inline]
>   ip_rcv+0x2c3/0x5d0 net/ipv4/ip_input.c:567
>   __netif_receive_skb_one_core+0x199/0x1e0 net/core/dev.c:5672
>   __netif_receive_skb+0x1d/0x160 net/core/dev.c:5785
>   process_backlog+0x443/0x15f0 net/core/dev.c:6117
>   __napi_poll.constprop.0+0xb7/0x550 net/core/dev.c:6877
>   napi_poll net/core/dev.c:6946 [inline]
>   net_rx_action+0xa94/0x1010 net/core/dev.c:7068
>   handle_softirqs+0x213/0x8f0 kernel/softirq.c:554
>   do_softirq kernel/softirq.c:455 [inline]
>   do_softirq+0xb2/0xf0 kernel/softirq.c:442
>  </IRQ>
>  <TASK>
>   __local_bh_enable_ip+0x100/0x120 kernel/softirq.c:382
>   local_bh_enable include/linux/bottom_half.h:33 [inline]
>   rcu_read_unlock_bh include/linux/rcupdate.h:919 [inline]
>   __dev_queue_xmit+0x8af/0x43e0 net/core/dev.c:4461
>   dev_queue_xmit include/linux/netdevice.h:3168 [inline]
>   neigh_hh_output include/net/neighbour.h:523 [inline]
>   neigh_output include/net/neighbour.h:537 [inline]
>   ip_finish_output2+0xc6c/0x2150 net/ipv4/ip_output.c:236
>   __ip_finish_output net/ipv4/ip_output.c:314 [inline]
>   __ip_finish_output+0x49e/0x950 net/ipv4/ip_output.c:296
>   ip_finish_output+0x35/0x380 net/ipv4/ip_output.c:324
>   NF_HOOK_COND include/linux/netfilter.h:303 [inline]
>   ip_output+0x13b/0x2a0 net/ipv4/ip_output.c:434
>   dst_output include/net/dst.h:450 [inline]
>   ip_local_out+0x33e/0x4a0 net/ipv4/ip_output.c:130
>   __ip_queue_xmit+0x777/0x1970 net/ipv4/ip_output.c:536
>   __tcp_transmit_skb+0x2b39/0x3df0 net/ipv4/tcp_output.c:1466
>   tcp_transmit_skb net/ipv4/tcp_output.c:1484 [inline]
>   tcp_write_xmit+0x12b1/0x8560 net/ipv4/tcp_output.c:2827
>   __tcp_push_pending_frames+0xaf/0x390 net/ipv4/tcp_output.c:3010
>   tcp_send_fin+0x154/0xc70 net/ipv4/tcp_output.c:3616
>   __tcp_close+0x96b/0xff0 net/ipv4/tcp.c:3130
>   tcp_close+0x28/0x120 net/ipv4/tcp.c:3221
>   inet_release+0x13c/0x280 net/ipv4/af_inet.c:435
>   __sock_release net/socket.c:640 [inline]
>   sock_release+0x8e/0x1d0 net/socket.c:668
>   smc_clcsock_release+0xb7/0xe0 net/smc/smc_close.c:34
>   __smc_release+0x5c2/0x880 net/smc/af_smc.c:301
>   smc_release+0x1fc/0x5f0 net/smc/af_smc.c:344
>   __sock_release+0xb0/0x270 net/socket.c:640
>   sock_close+0x1c/0x30 net/socket.c:1408
>   __fput+0x3f8/0xb60 fs/file_table.c:450
>   __fput_sync+0xa1/0xc0 fs/file_table.c:535
>   __do_sys_close fs/open.c:1550 [inline]
>   __se_sys_close fs/open.c:1535 [inline]
>   __x64_sys_close+0x86/0x100 fs/open.c:1535
>   do_syscall_x64 arch/x86/entry/common.c:52 [inline]
>   do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> RIP: 0033:0x7f6814c9ae10
> Code: ff f7 d8 64 89 02 48 c7 c0 ff ff ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 66 90 80 3d b1 e2 07 00 00 74 17 b8 03 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 48 c3 0f 1f 80 00 00 00 00 48 83 ec 18 89 7c
> RSP: 002b:00007fffb2389758 EFLAGS: 00000202 ORIG_RAX: 0000000000000003
> RAX: ffffffffffffffda RBX: 0000000000000004 RCX: 00007f6814c9ae10
> RDX: 0000000000000010 RSI: 0000000020000000 RDI: 0000000000000003
> RBP: 00000000000f4240 R08: 0000000000000001 R09: 0000000000000001
> R10: 0000000000000001 R11: 0000000000000202 R12: 00007fffb23897b0
> R13: 00000000000141c3 R14: 00007fffb238977c R15: 00007fffb2389790
>  </TASK>
> 
> Fixes: 79636038d37e ("ipv4: tcp: give socket pointer to control skbs")
> Reported-by: syzbot+2d9f5f948c31dcb7745e@syzkaller.appspotmail.com
> Closes: https://lore.kernel.org/lkml/6745e1a2.050a0220.1286eb.001c.GAE@google.com/T/#u
> Signed-off-by: Eric Dumazet <edumazet@google.com>

Reviewed-by: Kuniyuki Iwashima <kuniyu@amazon.com>

