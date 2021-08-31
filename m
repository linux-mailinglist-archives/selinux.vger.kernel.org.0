Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CC393FCE28
	for <lists+selinux@lfdr.de>; Tue, 31 Aug 2021 22:06:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234672AbhHaUHc (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Tue, 31 Aug 2021 16:07:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:40308 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229476AbhHaUHc (ORCPT <rfc822;selinux@vger.kernel.org>);
        Tue, 31 Aug 2021 16:07:32 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 64D886054E;
        Tue, 31 Aug 2021 20:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630440396;
        bh=671R0W6BoCjcyUP/o/JoH6eMm1f7i+EfnB0Bg1vlmGM=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=itRBkDwkaBRAuY7xkfKbKo30MXVU4KAa+v/i4/Fn3D60oxe271TD/OkKrRJCWEMBQ
         csTS9vBqGWhpmin30dK51akwV92pdMu4BY2ZsJpgU5au0sItBqPzCbAU2EF93b62od
         2F6fzCEbPaFmMNlIgT/IP/eKqNACi282LEbDMp4zAQTBA3yXsXLlNouePYQ/XYO38c
         4C8Ovj+aXI4lrpdz+GosEP7iLA4Wl67XqPOeZ9VidspEZv1xiG0oyDyDrQE5A7Nv3E
         AAJcsbkz8TYIcY7nhaWqfLZePHXIPotxkY5c6s4yAjXHJ9NO24GVtBwsNWNtcYkyPQ
         y/nmZmfbHuuBw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 56C6C60A6F;
        Tue, 31 Aug 2021 20:06:36 +0000 (UTC)
Subject: Re: [GIT PULL] SELinux patches for v5.15
From:   pr-tracker-bot@kernel.org
In-Reply-To: <CAHC9VhQDQ2WF+gsRdC+3g6FLa19nvbka99zE0s_ZbupucpmJmQ@mail.gmail.com>
References: <CAHC9VhQDQ2WF+gsRdC+3g6FLa19nvbka99zE0s_ZbupucpmJmQ@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAHC9VhQDQ2WF+gsRdC+3g6FLa19nvbka99zE0s_ZbupucpmJmQ@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/selinux.git tags/selinux-pr-20210830
X-PR-Tracked-Commit-Id: 893c47d1964f5c9b00c5468f2cd1a1e9351fbb6a
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: befa491ce6954adadb181c464d0318925f18e499
Message-Id: <163044039629.15638.5361450733762426279.pr-tracker-bot@kernel.org>
Date:   Tue, 31 Aug 2021 20:06:36 +0000
To:     Paul Moore <paul@paul-moore.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        selinux@vger.kernel.org, linux-security-module@vger.kernel.org,
        linux-kernel@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

The pull request you sent on Mon, 30 Aug 2021 12:36:41 -0400:

> git://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/selinux.git tags/selinux-pr-20210830

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/befa491ce6954adadb181c464d0318925f18e499

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
