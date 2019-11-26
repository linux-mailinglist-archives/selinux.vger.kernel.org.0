Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 44EAE10A5F4
	for <lists+selinux@lfdr.de>; Tue, 26 Nov 2019 22:24:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726975AbfKZVYs (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Tue, 26 Nov 2019 16:24:48 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:35747 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727080AbfKZVYs (ORCPT
        <rfc822;selinux@vger.kernel.org>); Tue, 26 Nov 2019 16:24:48 -0500
Received: by mail-lf1-f68.google.com with SMTP id r15so12388772lff.2
        for <selinux@vger.kernel.org>; Tue, 26 Nov 2019 13:24:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=CEw4jOKJMhZKkV1eMwS5PwtPdwRdezpWN4q2D1I8RcQ=;
        b=P8OkylXHnYtaFsX0ZAt6YVDE1F/70OWbvpOyAYcvZqQzqknAR9g8gGZ2TYaEjOHSYQ
         HbCGP8Jndnii5OlXD/woTraA53oLxVhRb1bNuhe8rvY+TmkNUnWAmreD1Qt99QODvGOR
         ZCawShyATDXHd39MV2le8O6Ag+O32rN80sc3AweYxNq0jYDGHoMB9DwFKLt4uu5B9J1X
         rp+YDlOB66hqUxe3Rtf4ExpKvx7dfY8F9G3pTaQt7hZLfN3HOyUskGttnzNttuqf+HE0
         TRpUh6aQrCNeC+QdZtPyb92pCABvm85yuCn4X+4OXyMoovIGdILj0lwJvO/C6GZ6NEZO
         pXRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=CEw4jOKJMhZKkV1eMwS5PwtPdwRdezpWN4q2D1I8RcQ=;
        b=KzCQV4yJl7l/aMaVKlbQ14AKzf8yfmxvpcLqs5fNtFAC73uT3oAPgp9uo5GM9n+muB
         +ZBLc163dXTyI9wzU4xqF572JGYq1s1Snb/SUHfbcj3Bdg1jh4+BoeIHeWVxo5J6MvJh
         p9dE7kRLskjEnya8/anbLl6hMzwchGdKX9UeumCP+456GV+skyESbepyt8IVN2/+ZBA4
         b/09ccYWTot0GjPyXVLgYxM3etUSYZMyXVsqMLWln9mAIzqgZwlU+OLPGYMOgXITllLj
         C4FkuCz4W9Bhhi59RYDwzPPfPijEzdKSpDMnBI76aMaNAh5/AAeEev1VoZo2iNbd5Jmq
         HSJg==
X-Gm-Message-State: APjAAAVAJPOGfVJAbVPi/I4DGRBLKbi2ZXnlnjVDFxkiH5Edm2Wj6oWJ
        cENYJ6jHMpCCpSrtMzT2IDRLd0RY5P2bt4daUBS4
X-Google-Smtp-Source: APXvYqwFNl6yq6//E6s3XI9PZjL79hQnR/gAzxOZT2E5dSQFA8kbY+SjBp/nt0uaxPrc123dbcH7FjUuGxAlIpqw0w4=
X-Received: by 2002:ac2:428d:: with SMTP id m13mr20422790lfh.64.1574803485662;
 Tue, 26 Nov 2019 13:24:45 -0800 (PST)
MIME-Version: 1.0
From:   Paul Moore <paul@paul-moore.com>
Date:   Tue, 26 Nov 2019 16:24:34 -0500
Message-ID: <CAHC9VhRj-vx8AnP5tKcq9joNqWSHRv1bk+3e7DGU9mxjN+fVFg@mail.gmail.com>
Subject: [GIT PULL] SELinux patches for v5.5
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     selinux@vger.kernel.org, linux-security-module@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Hi Linus,

Only three SELinux patches for v5.5, all passing the test suite and
listed below, please merge them for v5.5.

- Remove the size limit on SELinux policies, the limitation was a
lingering vestige and no longer necessary.

- Allow file labeling before the policy is loaded.  This should ease
some of the burden when the policy is initially loaded (no need to
relabel files), but it should also help enable some new system
concepts which dynamically create the root filesystem in the initrd.

- Add support for the "greatest lower bound" policy construct which is
defined as the intersection of the MLS range of two SELinux labels.

Thanks,
-Paul
--
The following changes since commit 54ecb8f7028c5eb3d740bb82b0f1d90f2df63c5c:

 Linux 5.4-rc1 (2019-09-30 10:35:40 -0700)

are available in the Git repository at:

 git://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/selinux.git
   tags/selinux-pr-20191126

for you to fetch changes up to 42345b68c2e3e2b6549fc34b937ff44240dfc3b6:

 selinux: default_range glblub implementation (2019-10-07 19:01:35 -0400)

----------------------------------------------------------------
selinux/stable-5.5 PR 20191126

----------------------------------------------------------------
Jonathan Lebon (1):
     selinux: allow labeling before policy is loaded

Joshua Brindle (1):
     selinux: default_range glblub implementation

zhanglin (1):
     selinux: remove load size limit

security/selinux/hooks.c            | 12 ++++++++++++
security/selinux/include/security.h |  3 ++-
security/selinux/selinuxfs.c        |  4 ----
security/selinux/ss/context.h       | 32 ++++++++++++++++++++++++++++++++
security/selinux/ss/ebitmap.c       | 18 ++++++++++++++++++
security/selinux/ss/ebitmap.h       |  1 +
security/selinux/ss/mls.c           |  3 +++
security/selinux/ss/policydb.c      |  5 +++++
security/selinux/ss/policydb.h      |  1 +
9 files changed, 74 insertions(+), 5 deletions(-)

-- 
paul moore
www.paul-moore.com
