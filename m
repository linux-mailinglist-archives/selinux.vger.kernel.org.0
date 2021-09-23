Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 335004167A0
	for <lists+selinux@lfdr.de>; Thu, 23 Sep 2021 23:42:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243376AbhIWVoS (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Thu, 23 Sep 2021 17:44:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:48618 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243303AbhIWVoR (ORCPT <rfc822;selinux@vger.kernel.org>);
        Thu, 23 Sep 2021 17:44:17 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 502E46105A;
        Thu, 23 Sep 2021 21:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632433365;
        bh=bxTb3RgtJ4wGjKinnSfJNXvs88kI8RX/pq4e05mMrNI=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=t2FXb8lEIo8vre9WsqMZ70x+7N5eVBzlS/e3ka7gpVKlJwZCCWM/YD5l8JouDGAgD
         JwqJW4ygo5n6eD6vNwiAEcbBonhIWfxslLi0NfbmvfQPzYnFS0o6UY6aawSsSM0EuD
         b/OBKner0Xi7QTJFEBWXlDjv4yUGO62mYh3SbOsQaY8zNkOUqfusY5Ql6cNqxORtQT
         XTedyxvUtzpIHQOOZBBcJXwTFuP+7VEEFKRvzMOJE8A+3q7KpaABnLDufX2rKX0yV2
         IvXhdTDbCfqrV0z0uQ+LzWRqnCOn8Gegwhbew2fWrlChyxPta3XugsmidNgiOFHXf9
         mxruYwLOjlwyQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 40B4F60A5B;
        Thu, 23 Sep 2021 21:42:45 +0000 (UTC)
Subject: Re: [GIT PULL] SELinux/Smack fixes for v5.15 (#2)
From:   pr-tracker-bot@kernel.org
In-Reply-To: <CAHC9VhSDOQpQPfzMfvEd+hCZeyJiZ4WbvjjG7rGgYAUS=7vZBQ@mail.gmail.com>
References: <CAHC9VhSDOQpQPfzMfvEd+hCZeyJiZ4WbvjjG7rGgYAUS=7vZBQ@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAHC9VhSDOQpQPfzMfvEd+hCZeyJiZ4WbvjjG7rGgYAUS=7vZBQ@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/selinux.git tags/selinux-pr-20210923
X-PR-Tracked-Commit-Id: a3727a8bac0a9e77c70820655fd8715523ba3db7
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 831c9bd3dafc811bd5f740777fd1ef92b08bb0e4
Message-Id: <163243336520.317.5690752781785293221.pr-tracker-bot@kernel.org>
Date:   Thu, 23 Sep 2021 21:42:45 +0000
To:     Paul Moore <paul@paul-moore.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        selinux@vger.kernel.org, linux-security-module@vger.kernel.org,
        linux-kernel@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

The pull request you sent on Thu, 23 Sep 2021 16:24:21 -0400:

> git://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/selinux.git tags/selinux-pr-20210923

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/831c9bd3dafc811bd5f740777fd1ef92b08bb0e4

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
