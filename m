Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 276163E1C9B
	for <lists+selinux@lfdr.de>; Thu,  5 Aug 2021 21:26:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242474AbhHET0P (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Thu, 5 Aug 2021 15:26:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:44578 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242698AbhHET0P (ORCPT <rfc822;selinux@vger.kernel.org>);
        Thu, 5 Aug 2021 15:26:15 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id EA8326056B;
        Thu,  5 Aug 2021 19:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628191561;
        bh=9KGkhmbV+QcetOo8YLW1YUGW7Qwk+14a2znCtBgJMLg=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=O2TNzuB1qRUtYDCCv2hBRpSFjT0D/irBjxkhEGtI/p7lUICzRs8egdADuPZPYoa/k
         JTU1IvVftkTvtOE7UZrgm74pP8m0NPZ2nQxjNOTopzKcMxq4PdJ8EWmTQP8HJG+5b/
         BqOXvL1v5cPJSuvXncwnogGee+0tvBr8G54XXPUiHcA+fDmljiZv1UnfRS7XFZVv4z
         rm7zfuKgkga569d3dkPYvhuUIfcLLVUoZ0OU60pK8VEfz/PqHsU/dFEHUeNxCfE2kY
         yoTpAQMB9WIeprhE0rC7GtohorHuK9/TfmVTSNeT4GrEgqR6pJ4HY5LcT9KTHb2IF6
         ++LAIdMw9pr1Q==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id DC88D609D7;
        Thu,  5 Aug 2021 19:26:00 +0000 (UTC)
Subject: Re: [GIT PULL] SELinux fixes for v5.14 (#1)
From:   pr-tracker-bot@kernel.org
In-Reply-To: <CAHC9VhSW0zVR7wB9dxR-AkQAMK_H_fKQ75tTbMLomkBQzfzciw@mail.gmail.com>
References: <CAHC9VhSW0zVR7wB9dxR-AkQAMK_H_fKQ75tTbMLomkBQzfzciw@mail.gmail.com>
X-PR-Tracked-List-Id: <selinux.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAHC9VhSW0zVR7wB9dxR-AkQAMK_H_fKQ75tTbMLomkBQzfzciw@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/selinux.git tags/selinux
X-PR-Tracked-Commit-Id: 4c156084daa8ee70978e4b150b5eb5fc7b1f15be
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 0b53abfc5f66449d42fb1738c1c191e29e3be2e4
Message-Id: <162819156084.13342.5530010847920224086.pr-tracker-bot@kernel.org>
Date:   Thu, 05 Aug 2021 19:26:00 +0000
To:     Paul Moore <paul@paul-moore.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        selinux@vger.kernel.org, linux-security-module@vger.kernel.org,
        linux-kernel@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

The pull request you sent on Thu, 5 Aug 2021 14:29:27 -0400:

> git://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/selinux.git tags/selinux

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/0b53abfc5f66449d42fb1738c1c191e29e3be2e4

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
