Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3A3D262E99
	for <lists+selinux@lfdr.de>; Tue,  9 Jul 2019 05:20:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727523AbfGIDPI (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Mon, 8 Jul 2019 23:15:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:60996 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726928AbfGIDPI (ORCPT <rfc822;selinux@vger.kernel.org>);
        Mon, 8 Jul 2019 23:15:08 -0400
Subject: Re: [GIT PULL] SELinux patches for v5.3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1562642107;
        bh=UD5AJS0o2Oz7QrHl8e7s76+5e1eQEf5QyFJ2MnmL0CA=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=DWfVoGXzUVMKNBZTmBaiUGKhpSXceQelJPsoHlWhm7a7HiAqBV0vkoULqB8fyG+2P
         j1d6TtJLcBC1dRZ+iwt5cnbodvvVvquzwiZB14mY7UrO7OvlaFIqjVjfbPSvGl5z8M
         MIS8ZVmwNT7abZKl1zRnBWx6m8wbnj8OdLx5LPO4=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <CAHC9VhSERNCM2d42y8fBT236D62mco=B_ZM_vytEoBP1qicvCA@mail.gmail.com>
References: <CAHC9VhSERNCM2d42y8fBT236D62mco=B_ZM_vytEoBP1qicvCA@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAHC9VhSERNCM2d42y8fBT236D62mco=B_ZM_vytEoBP1qicvCA@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/selinux.git
 tags/selinux-pr-20190702
X-PR-Tracked-Commit-Id: ea74a685ad819aeed316a9bae3d2a5bf762da82d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 7c0f89634892693fc0b46f25e0a6d57bd6dd5698
Message-Id: <156264210736.2709.1861861527088813337.pr-tracker-bot@kernel.org>
Date:   Tue, 09 Jul 2019 03:15:07 +0000
To:     Paul Moore <paul@paul-moore.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        selinux@vger.kernel.org, linux-security-module@vger.kernel.org,
        linux-kernel@vger.kernel.org
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

The pull request you sent on Tue, 2 Jul 2019 13:28:37 -0400:

> git://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/selinux.git tags/selinux-pr-20190702

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/7c0f89634892693fc0b46f25e0a6d57bd6dd5698

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
