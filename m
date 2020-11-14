Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF0602B30C5
	for <lists+selinux@lfdr.de>; Sat, 14 Nov 2020 21:51:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726387AbgKNUvT (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Sat, 14 Nov 2020 15:51:19 -0500
Received: from mail.kernel.org ([198.145.29.99]:35060 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726150AbgKNUvK (ORCPT <rfc822;selinux@vger.kernel.org>);
        Sat, 14 Nov 2020 15:51:10 -0500
Subject: Re: [GIT PULL] SELinux fixes for v5.10 (#1)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605387070;
        bh=Jyh8xtofEGhNJn7rbMmW5xm0qu/vehYTr+0u9RH6PiE=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=xafOFXa3RpIGGeD1U+3b6BycnrJQbMJXsSSRj3OdzuM3QdYXaG3+7KOqqqvkRSqRd
         IqZC5pw0M5qd+YrTAiNIjWXgBW7uPRcBv0X2Xt+7E3te8GSliFGy//l7rEiJv6MAaL
         yyUOyJCwKmhY9cuktDxJ8XN8rlcVjKqLZCrGdk+s=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <CAHC9VhSrJLtasTbE+smvHYMxD3B018TCLx74y9RQ0pk8jDaX4w@mail.gmail.com>
References: <CAHC9VhSrJLtasTbE+smvHYMxD3B018TCLx74y9RQ0pk8jDaX4w@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAHC9VhSrJLtasTbE+smvHYMxD3B018TCLx74y9RQ0pk8jDaX4w@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/selinux.git tags/selinux-pr-20201113
X-PR-Tracked-Commit-Id: c350f8bea271782e2733419bd2ab9bf4ec2051ef
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 30636a59f4c1a40720156079cabcad60351949f2
Message-Id: <160538707042.24878.8206734712012963156.pr-tracker-bot@kernel.org>
Date:   Sat, 14 Nov 2020 20:51:10 +0000
To:     Paul Moore <paul@paul-moore.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        selinux@vger.kernel.org, linux-security-module@vger.kernel.org,
        linux-kernel@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

The pull request you sent on Fri, 13 Nov 2020 18:29:23 -0500:

> git://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/selinux.git tags/selinux-pr-20201113

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/30636a59f4c1a40720156079cabcad60351949f2

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
