Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D9E10102BD4
	for <lists+selinux@lfdr.de>; Tue, 19 Nov 2019 19:41:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727016AbfKSSlE (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Tue, 19 Nov 2019 13:41:04 -0500
Received: from mail.kernel.org ([198.145.29.99]:52776 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726994AbfKSSlE (ORCPT <rfc822;selinux@vger.kernel.org>);
        Tue, 19 Nov 2019 13:41:04 -0500
Received: from localhost.localdomain (236.31.169.217.in-addr.arpa [217.169.31.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5A8FD223E4;
        Tue, 19 Nov 2019 18:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1574188863;
        bh=xA0ajxnB6VzJLOi7+RioMph7fWev++IdvBzPPGwcjBI=;
        h=From:To:Cc:Subject:Date:From;
        b=AO993QY7QtiT1Hl0P/Em9VuQAv8EvAoj29/5f2+psplZ/sKQmURkOku2fqsXj71As
         +F/YLPM/XUAkkgW8hSnv73SueCx+8f6OTTjnkM79j2lB0fnVs/Xe8Sc4EAPMwItZba
         HZp2KIsfFgu2x2Arta6P0Ed86k2rh98j0/hYHN78=
From:   Will Deacon <will@kernel.org>
To:     selinux@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Will Deacon <will@kernel.org>,
        Paul Moore <paul@paul-moore.com>,
        Ondrej Mosnacek <omosnace@redhat.com>,
        Stephen Smalley <sds@tycho.nsa.gov>,
        Jeffrey Vander Stoep <jeffv@google.com>
Subject: [RFC PATCH 0/2] Avoid blocking in selinux inode callbacks on RCU walk
Date:   Tue, 19 Nov 2019 18:40:55 +0000
Message-Id: <20191119184057.14961-1-will@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Hi all,

While debugging a KASAN report in the selinux access vector cache hash
table, I noticed that it looks like we may block in the inode_follow_link()
and inode_permission() callbacks, even when called from the VFS layer as
part of an RCU-protected path walk.

These two patches attempt to fix that, but since I found this by
inspection and I'm not familiar with this code, I'm sending as an RFC in
case I missed something that means this cannot happen.

Comments very welcome,

Will

Cc: Paul Moore <paul@paul-moore.com>
Cc: Ondrej Mosnacek <omosnace@redhat.com>
Cc: Stephen Smalley <sds@tycho.nsa.gov>
Cc: Jeffrey Vander Stoep <jeffv@google.com>

--->8

Will Deacon (2):
  selinux: Don't call avc_compute_av() from RCU path walk
  selinux: Propagate RCU walk status from 'security_inode_follow_link()'

 security/selinux/avc.c         | 21 +++++++++++++--------
 security/selinux/hooks.c       |  5 +++--
 security/selinux/include/avc.h | 12 ++++++++----
 3 files changed, 24 insertions(+), 14 deletions(-)

-- 
2.24.0.432.g9d3f5f5b63-goog

