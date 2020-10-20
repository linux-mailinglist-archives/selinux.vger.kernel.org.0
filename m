Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4440E28D72B
	for <lists+selinux@lfdr.de>; Wed, 14 Oct 2020 01:49:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729932AbgJMXtN (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Tue, 13 Oct 2020 19:49:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:32790 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727154AbgJMXtM (ORCPT <rfc822;selinux@vger.kernel.org>);
        Tue, 13 Oct 2020 19:49:12 -0400
Subject: Re: [GIT PULL] SELinux patches for v5.10
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602632952;
        bh=Ueg0XU8hW2fh5lXUYkDbLgnfafOTTo2ainV8J+wTuNk=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=1nbPLwmZ+mSGwcjK95H6ClwEoMHiy+ELmXoi20iLqdDQdjlcXcxO3OSlaR0VT+V5P
         5hfh75FukN32jEERu7wg2CG8Z1t8XfxOhoDI+W58ofDNv/zww+2vnRZLiBa8aDNvt0
         ZyPo7COgpowc/MjfrhK09SOlZixyicFnIHiw/W8E=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <CAHC9VhShMEWOQFWOnbDuZDN9D397QbZaSuGs95AddSc_LQA1rg@mail.gmail.com>
References: <CAHC9VhShMEWOQFWOnbDuZDN9D397QbZaSuGs95AddSc_LQA1rg@mail.gmail.com>
X-PR-Tracked-List-Id: <selinux.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAHC9VhShMEWOQFWOnbDuZDN9D397QbZaSuGs95AddSc_LQA1rg@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/selinux.git tags/selinux-pr-20201012
X-PR-Tracked-Commit-Id: 0d50f059c4cdc9e436f6f4db8779ac0795bfdadf
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 7b540812cc0635e6c7e508359115c7cb6886fd2f
Message-Id: <160263295237.20088.758458421273668951.pr-tracker-bot@kernel.org>
Date:   Tue, 13 Oct 2020 23:49:12 +0000
To:     Paul Moore <paul@paul-moore.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        selinux@vger.kernel.org, linux-security-module@vger.kernel.org,
        linux-kernel@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

The pull request you sent on Mon, 12 Oct 2020 21:15:09 -0400:

> git://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/selinux.git tags/selinux-pr-20201012

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/7b540812cc0635e6c7e508359115c7cb6886fd2f

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
