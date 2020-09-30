Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6FE4427DDCB
	for <lists+selinux@lfdr.de>; Wed, 30 Sep 2020 03:33:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729365AbgI3BdU (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Tue, 29 Sep 2020 21:33:20 -0400
Received: from smtpbgsg1.qq.com ([54.254.200.92]:35767 "EHLO smtpbgsg1.qq.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729322AbgI3BdU (ORCPT <rfc822;selinux@vger.kernel.org>);
        Tue, 29 Sep 2020 21:33:20 -0400
X-QQ-mid: bizesmtp20t1601429574tjxe7o8j
Received: from localhost.localdomain (unknown [110.53.188.237])
        by esmtp6.qq.com (ESMTP) with 
        id ; Wed, 30 Sep 2020 09:32:49 +0800 (CST)
X-QQ-SSF: 01400000002000F0D000B00A0000000
X-QQ-FEAT: gDbwoeOnDAEXUpeNLJFccHZemlJdFlT1aOC6Z/RFGwzL8HUOEvlshzsXbtoEg
        8QXzCWmiw4Yhwrq4jBwekC2weLSkF7NQ/E0YGt7aGrx78OJB8ZYBENdT9zL7KdzjmqFrc9u
        DX5lymeFN0XA9Mu2uLeeS+QICogA3HKayKLkiJqjMW+ps2rrKStEy6yXQZhgS02b+1NT78v
        YWVImBMVcuTODef3hVKZppYAktTi0q05UYLpRqjoa0ggbkMhkkn9IdS9Ninb1c/XhNZtK3z
        OB25wXW/rFuJreDH5bQkHHiapPPMROg9bw4EIPfFmrwa14wVWIDnTgNGNYkGFwnPCtQeHvC
        9BgDupfhnQ9rs2REoQ=
X-QQ-GoodBg: 2
From:   rentianyue@tj.kylinos.cn
To:     Paul Moore <paul@paul-moore.com>,
        Stephen Smalley <stephen.smalley.work@gmail.com>,
        Eric Paris <eparis@parisplace.org>,
        Andreas Gruenbacher <agruenba@redhat.com>
Cc:     yangzhao@kylinos.cn, selinux@vger.kernel.org,
        Tianyue Ren <rentianyue@kylinos.cn>
Subject: [PATCH v2 0/1] selinux: fix error initialization in inode_doinit_with_dentry()
Date:   Wed, 30 Sep 2020 09:31:45 +0800
Message-Id: <20200930013146.48339-1-rentianyue@tj.kylinos.cn>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tj.kylinos.cn:qybgforeign:qybgforeign6
X-QQ-Bgrelay: 1
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

From: Tianyue Ren <rentianyue@kylinos.cn>

I think there is a error initialization for isec->sid when the dentry is NULL,
when we do "remount -o rw,remount ${rootmnt}" action before selinux policy loading.It's
leading kernel getting wrong security label "unlabeled_t" when the userspace access
files such as /etc/fstab.

This patch lets the label be invalid before it's initializated correctly.

v2: Modify the patch description

Tianyue Ren (1):
  selinux: fix error initialization in inode_doinit_with_dentry()

 security/selinux/hooks.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

-- 
2.28.0



