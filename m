Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3EFB1344EFD
	for <lists+selinux@lfdr.de>; Mon, 22 Mar 2021 19:48:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231379AbhCVSsO (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Mon, 22 Mar 2021 14:48:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:34424 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231296AbhCVSrn (ORCPT <rfc822;selinux@vger.kernel.org>);
        Mon, 22 Mar 2021 14:47:43 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 6DD74619B4;
        Mon, 22 Mar 2021 18:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616438863;
        bh=16NGPkheO/zqkXUZ710+536dbEAXn75YDauKYzg52I4=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=qhwkewh23UkOVbGdNX0z0s5lvFJrQLD9aFAOGFc5/U7raLRtxogJSKbafAvamtR8u
         Cg8TFmqoCAIL+2BTu91+nem+BhDubvE+TH0/vPR3GHNyTtkHZj0Mxo+adXA3/L2HJ4
         gWSQHM+wjlorU3R4gRTYTVYWu2o1Zbq6MXpKXCnwMLIO/Pgl5Op8rIT/f5qVGqqIEJ
         L/4KJ8X9aRF/Fgrv/JYFb7Ka4UEMiw0nWr6dcK1susbitMCk/HqeK3bpk0n6zWTayV
         q8OsuUhQf2FFdz4gHkDCSkX3T63eGkuDhJ1dvkqP4fhYRtbBA9+013lEUw9QRl4VGS
         EeuSiglivGXWg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 567B460074;
        Mon, 22 Mar 2021 18:47:43 +0000 (UTC)
Subject: Re: [GIT PULL] SELinux fixes for v5.12 (#1)
From:   pr-tracker-bot@kernel.org
In-Reply-To: <CAHC9VhRQmoo45x8nLH-C-+L=+6W7Jtjm-ex8vgLjNhPmFTyDJg@mail.gmail.com>
References: <CAHC9VhRQmoo45x8nLH-C-+L=+6W7Jtjm-ex8vgLjNhPmFTyDJg@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-security-module.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAHC9VhRQmoo45x8nLH-C-+L=+6W7Jtjm-ex8vgLjNhPmFTyDJg@mail.gmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/selinux.git tags/selinux-pr-20210322
X-PR-Tracked-Commit-Id: ee5de60a08b7d8d255722662da461ea159c15538
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 84196390620ac0e5070ae36af84c137c6216a7dc
Message-Id: <161643886329.20004.1836600600831072016.pr-tracker-bot@kernel.org>
Date:   Mon, 22 Mar 2021 18:47:43 +0000
To:     Paul Moore <paul@paul-moore.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        selinux@vger.kernel.org, linux-security-module@vger.kernel.org,
        linux-kernel@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

The pull request you sent on Mon, 22 Mar 2021 12:51:58 -0400:

> https://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/selinux.git tags/selinux-pr-20210322

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/84196390620ac0e5070ae36af84c137c6216a7dc

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
