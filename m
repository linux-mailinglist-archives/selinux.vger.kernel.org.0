Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 728CE202D78
	for <lists+selinux@lfdr.de>; Mon, 22 Jun 2020 00:45:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726391AbgFUWpZ (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Sun, 21 Jun 2020 18:45:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:54476 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726101AbgFUWpZ (ORCPT <rfc822;selinux@vger.kernel.org>);
        Sun, 21 Jun 2020 18:45:25 -0400
Subject: Re: [GIT PULL] SELinux fixes for v5.8 (#1)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592779524;
        bh=v9sThbH5EcvCkWHw/jIBC0C8a06oazJihP2nFqUEG3w=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=YhXcHL9tCfhs3fdUusZp6vT2xgjvAffeCIZH0M35D/8bPxubrXvynSXH7ev0JtpWk
         wqJO8ZcXUGH4FvOLvwvOsRrpcZJjGOqzeZMVrIqOH3A9RnpI1WGWwXyiBAINMWkPGK
         NswVirKOMhndSTZyl/WxqTr9vXe0AsrwS1V62TY0=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <CAHC9VhQbP754KV8RsaBgnxmuy8gWeL-YccRqQOc8R7DrvtZBvA@mail.gmail.com>
References: <CAHC9VhQbP754KV8RsaBgnxmuy8gWeL-YccRqQOc8R7DrvtZBvA@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAHC9VhQbP754KV8RsaBgnxmuy8gWeL-YccRqQOc8R7DrvtZBvA@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/selinux.git
 tags/selinux-pr-20200621
X-PR-Tracked-Commit-Id: 8231b0b9c322c894594fb42eb0eb9f93544a6acc
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 817d914d17651c188f28a284261ff6091d80ad2c
Message-Id: <159277952464.24881.15037005159620440574.pr-tracker-bot@kernel.org>
Date:   Sun, 21 Jun 2020 22:45:24 +0000
To:     Paul Moore <paul@paul-moore.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        selinux@vger.kernel.org, linux-security-module@vger.kernel.org,
        linux-kernel@vger.kernel.org
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

The pull request you sent on Sun, 21 Jun 2020 16:54:16 -0400:

> git://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/selinux.git tags/selinux-pr-20200621

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/817d914d17651c188f28a284261ff6091d80ad2c

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
