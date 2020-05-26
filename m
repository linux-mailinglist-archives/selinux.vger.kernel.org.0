Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1F5C1ACEFE
	for <lists+selinux@lfdr.de>; Thu, 16 Apr 2020 19:47:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391311AbgDPRoO (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Thu, 16 Apr 2020 13:44:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2389772AbgDPRoI (ORCPT
        <rfc822;selinux@vger.kernel.org>); Thu, 16 Apr 2020 13:44:08 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDF99C061A0C
        for <selinux@vger.kernel.org>; Thu, 16 Apr 2020 10:44:07 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id f12so5500846edn.12
        for <selinux@vger.kernel.org>; Thu, 16 Apr 2020 10:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=lHUznoxru5R12GXaDmKNX8aXkplH6wFoA+QlOqPeLdI=;
        b=d3YpuIAXek8wojwJPlX+mVEi3yrr57eFKzsLxMLgsJXoYIurH7nVZ/mjDHM2gKUNrb
         BNl4EH9u92DBGQi5nZ3n0wyRZY0uR4VbVzZuwU64I+KyXeHKAXnv84oW6HnILOjliE/2
         2l5wOeruQkOj98wCk5oWwrLKuQOWqQg1DEOtsearRpsE76PoOyAltDhjYcY1Uq+nGo+1
         XlNPJp9Bc4GboEfZPwuUDRigqNmrT1fR3jQeQZNTvvoNStDZ4bQTCCqRoJ+ByeYrGgI/
         B6DiXpJ5stBdqm0xq9RZkZvmh3Fgd9BCCdZFITb7q0eH5YXOc2AoTmfb/sKavW+V5n5X
         /b1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=lHUznoxru5R12GXaDmKNX8aXkplH6wFoA+QlOqPeLdI=;
        b=k/47dzqNGcgudRBJ5Q6tohQ9fpv/nGw5pZpbbXvzrmDGZDyYjjGMZTmmfH/SdtWCHW
         EPBOfjBHIYp/CQQCLXw+6jOWcpPZVCOk9dDULWQ0p03P5gaUo6YWAAjG/0u3Twnyt6T7
         qS1Z0jNLI4cJuKGHLTlrQhwNo1mDNVhOBgWXQBNRwRPzpmohgtjfUitV9TkuekyxbtdK
         3e7E9QSfOFurh0H3r/9rBZL/CUJEs/ok/BQvKNTMYFfqQpIUggW19ocSU/E7aFfRmHkc
         YXyLpuXP0QUXvozCdlO+uTjKD+TWde7C+HU0LRZoBhzdQXhdJGgF4c1rW13akcmk25RB
         7/hA==
X-Gm-Message-State: AGi0PuYWAZudEilqC4qHVk1pklvQVfXSrC9/zww5Ubye3isTNsK20Jen
        j1KNmxhM6BD7HxiwQilT4/ACbWKSSdFZNtRY3Ndn
X-Google-Smtp-Source: APiQypJflJcsD5E5bvXwMy2efxg/kPt1RTDrCEezvZ+HNOokTDmdHJAaS9dz6ehK5wvShhDpAsPpwUKgeE0HZtOM/Kc=
X-Received: by 2002:a05:6402:1b0b:: with SMTP id by11mr12141670edb.269.1587059046433;
 Thu, 16 Apr 2020 10:44:06 -0700 (PDT)
MIME-Version: 1.0
From:   Paul Moore <paul@paul-moore.com>
Date:   Thu, 16 Apr 2020 13:43:55 -0400
Message-ID: <CAHC9VhRNYDwZttwD0Pc3JctBg7puvc+UsuZG082CdPVrarQoDg@mail.gmail.com>
Subject: [GIT PULL] SELinux fixes for v5.7 (#1)
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     selinux@vger.kernel.org, linux-security-module@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Hi Linus,

One small SELinux fix for v5.7-rcX to ensure we cleanup properly on an
error condition.  Please merge for the next -rcX release.

Thanks,
-Paul

--
The following changes since commit c753924b628551564b6eea3c9896e4a95aa25ed9:

 selinux: clean up indentation issue with assignment statement
   (2020-03-30 19:57:07 -0400)

are available in the Git repository at:

 git://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/selinux.git
   tags/selinux-pr-20200416

for you to fetch changes up to af15f14c8cfcee515f4e9078889045ad63efefe3:

 selinux: free str on error in str_read() (2020-04-15 17:23:16 -0400)

----------------------------------------------------------------
selinux/stable-5.7 PR 20200416

----------------------------------------------------------------
Ondrej Mosnacek (1):
     selinux: free str on error in str_read()

security/selinux/ss/policydb.c | 8 ++++----
1 file changed, 4 insertions(+), 4 deletions(-)

-- 
paul moore
www.paul-moore.com
