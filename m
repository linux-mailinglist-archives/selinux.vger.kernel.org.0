Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7991C181D14
	for <lists+selinux@lfdr.de>; Wed, 11 Mar 2020 17:01:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729989AbgCKQBT (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Wed, 11 Mar 2020 12:01:19 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:45561 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729841AbgCKQBT (ORCPT
        <rfc822;selinux@vger.kernel.org>); Wed, 11 Mar 2020 12:01:19 -0400
Received: by mail-oi1-f193.google.com with SMTP id v19so2365965oic.12
        for <selinux@vger.kernel.org>; Wed, 11 Mar 2020 09:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LbBnRgXMlnuciZtlUiYV6QJYQp0LgccQrAgfPE0GLSI=;
        b=QZN4h6btGyOqFkPVuCilgAMGjxVRfDqSOj6V0Z5SGNDcWlP9pYq/vi3fSWr2Ecpr2v
         ss26kZPs+Q13clEPk93CaE49C/eIuglHiNWgf2AnybTgNjGxP+HEzKqTU7RILUcwaftS
         V/qBsNXO3EPxETaOgb4+2/PL1Wjnat/VKqBKpfnP/7+66hzoLR7jOtkkQ6nMlu5z70HS
         bH3Sh5/d6bGHRqiQarY/E00dRGDYrZnwqS7v3dVXsL4ertCp0azEK3t9fWc2gfrx/8hq
         7v63LiYLY9Nc/FFdpzYgbTpYK2j7OsEUVEwM+20fJPiEwNTabALVKOg49fVlS/S7RIrx
         tPmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LbBnRgXMlnuciZtlUiYV6QJYQp0LgccQrAgfPE0GLSI=;
        b=lsWYfSgsedF/qXhaOUTmzJiFdBeD8XkFHKC1RVutzvIeA9KEoj4buFLfsz0gq2J59d
         2XAnFzCxZlBSkEgSd3y9uQnWacLybzS5VDj24iTcMZCcuL+VqC0nRrY2qYlS5plgWs8C
         ZUt7QpoFWViZq//Gdxu1PA3lytGPTVv6NdBEu0+vwnqdpJ1cEqkMSNdogaGp4nfBvCv4
         VNibZVfXCV7GhNcIx1YXTfWHIPot5OXUq/fM1FJDjYj+GqNEuEyIlc52znKF10rUaGw1
         5cosXuBwkAhXm7s9P3ZEVnEXv9SmK9ckKRSZAIVKAjf+0swSJ9ufs/YEnt/MZyn3jAhL
         iqYg==
X-Gm-Message-State: ANhLgQ0uvzMENy96tjJntiiLi++eR9BIME5KzDy0FSFRrbJsTqhGa5aI
        BOTbaPBlWmXhMd0XtlIDD13WpLGs865/lR4NvUM6A5wZ
X-Google-Smtp-Source: ADFU+vtfkuIrhHdpOG31kRD8wjQwQV91wlqy+mWRH1KNUcZ/ukJ09+zYyDcdKePne2hxxd40jFFCtnBSIW5v4xA3e3M=
X-Received: by 2002:aca:5191:: with SMTP id f139mr2544813oib.140.1583942477981;
 Wed, 11 Mar 2020 09:01:17 -0700 (PDT)
MIME-Version: 1.0
References: <20200310162456.32240-1-richard_c_haines@btinternet.com>
In-Reply-To: <20200310162456.32240-1-richard_c_haines@btinternet.com>
From:   Stephen Smalley <stephen.smalley.work@gmail.com>
Date:   Wed, 11 Mar 2020 12:02:07 -0400
Message-ID: <CAEjxPJ69FMkO=X4fxMvgF1F7rsv9ZsEaJemgFzkuvzRWrgfUNg@mail.gmail.com>
Subject: Re: [RFC V3 PATCH 0/2] selinux-testsuite: Use native filesystem for tests
To:     Richard Haines <richard_c_haines@btinternet.com>
Cc:     SElinux list <selinux@vger.kernel.org>,
        Stephen Smalley <sds@tycho.nsa.gov>,
        Scott Mayhew <smayhew@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Tue, Mar 10, 2020 at 12:25 PM Richard Haines
<richard_c_haines@btinternet.com> wrote:
>
> If you test on the selinux-next kernel (that has the XFS patch [1]) with
> the "NFS: Ensure security label is set for root inode" patch [2], then all
> tests should pass. Anything else will give varying amounts of fails.
>
> The filesystem types tested are: ext4, xfs, vfat and nfs4.
>
> I've revamped the nfs.sh to handle tests that require specific mount
> options, these plus many more are now in tests/nfs_filesystem. This only
> gets run by nfs.sh.
>
> There are two minor workarounds involving multiple mounts returning EBUSY.
> These are either bugs or features.
>
> Not tested on travis.
>
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/patch/security/selinux?id=e4cfa05e9bfe286457082477b32ecd17737bdbce
> [2] https://lore.kernel.org/selinux/20200303225837.1557210-1-smayhew@redhat.com/

Even with the patches above applied, I am seeing failures during the
tests/nfs_filesystem tests:
...
filesystem/test ............. ok
fs_filesystem/test .......... ok
All tests successful.
Files=63, Tests=623, 153 wallclock secs ( 0.30 usr  0.82 sys +  2.47
cusr 41.75 csys = 45.34 CPU)
Result: PASS
make: Leaving directory '/mnt/selinux-testsuite/tests'
Run 'filesystem' tests with mount context option:
    fscontext=system_u:object_r:test_filesystem_file_t:s0
filesystem/test .. ok
All tests successful.
Files=1, Tests=30,  8 wallclock secs ( 0.03 usr  0.05 sys +  0.27 cusr
 4.88 csys =  5.23 CPU)
Result: PASS
Run 'fs_filesystem' tests with mount context option:
    fscontext=system_u:object_r:test_filesystem_file_t:s0
fs_filesystem/test .. ok
All tests successful.
Files=1, Tests=29,  9 wallclock secs ( 0.04 usr  0.05 sys +  0.26 cusr
 5.13 csys =  5.48 CPU)
Result: PASS
Run NFS context specific tests
nfs_filesystem/test .. 1/56 Failed mount(2): Permission denied

#   Failed test 'Using mount(2)'
#   at nfs_filesystem/test line 73.
getfilecon(3) Failed: No such file or directory

#   Failed test at nfs_filesystem/test line 79.
Failed umount(2): Invalid argument

#   Failed test 'Using mount(2)'
#   at nfs_filesystem/test line 84.
Failed mount(2): Permission denied
nfs_filesystem/test .. 5/56
#   Failed test 'Using mount(2)'
#   at nfs_filesystem/test line 100.

#   Failed test at nfs_filesystem/test line 110.
creat(2) Failed: No such file or directory

#   Failed test at nfs_filesystem/test line 117.
Failed umount(2): Invalid argument

#   Failed test 'Using mount(2)'
#   at nfs_filesystem/test line 122.
Failed mount(2): Permission denied

#   Failed test 'Using mount(2)'
#   at nfs_filesystem/test line 149.
open(2) Failed: No such file or directory

#   Failed test at nfs_filesystem/test line 154.
Failed umount(2): Invalid argument

#   Failed test 'Using mount(2)'
#   at nfs_filesystem/test line 159.
Failed mount(2): Permission denied
nfs_filesystem/test .. 17/56
#   Failed test 'Using mount(2)'
#   at nfs_filesystem/test line 237.

#   Failed test 'Using mount(2)'
#   at nfs_filesystem/test line 242.
Failed umount(2): Invalid argument

#   Failed test 'Using mount(2)'
#   at nfs_filesystem/test line 247.
Failed mount(2): Permission denied

#   Failed test 'Using mount(2)'
#   at nfs_filesystem/test line 261.

#   Failed test 'Using mount(2)'
#   at nfs_filesystem/test line 266.
Failed umount(2): Invalid argument

#   Failed test 'Using mount(2)'
#   at nfs_filesystem/test line 271.
Failed mount(2): Permission denied

#   Failed test 'Using mount(2) - got mnt_t instead of etc_t'
#   at nfs_filesystem/test line 286.
Failed umount(2): Invalid argument

#   Failed test 'Using mount(2)'
#   at nfs_filesystem/test line 296.
Failed mount(2): Permission denied

#   Failed test 'Using mount(2) - got mnt_t instead of etc_t'
#   at nfs_filesystem/test line 313.
Failed umount(2): Invalid argument

#   Failed test 'Using mount(2)'
#   at nfs_filesystem/test line 323.
Failed mount(2): Permission denied

#   Failed test 'Using mount(2) - got mnt_t instead of nfs_t'
#   at nfs_filesystem/test line 338.
Failed umount(2): Invalid argument

#   Failed test 'Using mount(2)'
#   at nfs_filesystem/test line 348.
nfs_filesystem/test .. 29/56 Failed move_mount(2): Permission denied

#   Failed test 'Using fsmount(2)'
#   at nfs_filesystem/test line 73.
getfilecon(3) Failed: No such file or directory

#   Failed test at nfs_filesystem/test line 79.
Failed umount(2): Invalid argument

#   Failed test 'Using fsmount(2)'
#   at nfs_filesystem/test line 84.
Failed move_mount(2): Permission denied

#   Failed test 'Using fsmount(2)'
#   at nfs_filesystem/test line 100.
nfs_filesystem/test .. 34/56
#   Failed test at nfs_filesystem/test line 110.
creat(2) Failed: No such file or directory

#   Failed test at nfs_filesystem/test line 117.
Failed umount(2): Invalid argument

#   Failed test 'Using fsmount(2)'
#   at nfs_filesystem/test line 122.
Failed move_mount(2): Permission denied

#   Failed test 'Using fsmount(2)'
#   at nfs_filesystem/test line 149.
open(2) Failed: No such file or directory

#   Failed test at nfs_filesystem/test line 154.
Failed umount(2): Invalid argument

#   Failed test 'Using fsmount(2)'
#   at nfs_filesystem/test line 159.
nfs_filesystem/test .. 41/56 Failed move_mount(2): Permission denied
nfs_filesystem/test .. 45/56
#   Failed test 'Using fsmount(2)'
#   at nfs_filesystem/test line 237.

#   Failed test 'Using fsmount(2)'
#   at nfs_filesystem/test line 242.
Failed umount(2): Invalid argument

#   Failed test 'Using fsmount(2)'
#   at nfs_filesystem/test line 247.
Failed move_mount(2): Permission denied

#   Failed test 'Using fsmount(2)'
#   at nfs_filesystem/test line 261.

#   Failed test 'Using fsmount(2)'
#   at nfs_filesystem/test line 266.
Failed umount(2): Invalid argument

#   Failed test 'Using fsmount(2)'
#   at nfs_filesystem/test line 271.
Failed move_mount(2): Permission denied
nfs_filesystem/test .. 51/56
#   Failed test 'Using fsmount(2) - got mnt_t instead of etc_t'
#   at nfs_filesystem/test line 286.
Failed umount(2): Invalid argument

#   Failed test 'Using fsmount(2)'
#   at nfs_filesystem/test line 296.
Failed move_mount(2): Permission denied

#   Failed test 'Using fsmount(2) - got mnt_t instead of etc_t'
#   at nfs_filesystem/test line 313.
Failed umount(2): Invalid argument

#   Failed test 'Using fsmount(2)'
#   at nfs_filesystem/test line 323.
Failed move_mount(2): Permission denied
nfs_filesystem/test .. 55/56
#   Failed test 'Using fsmount(2) - got mnt_t instead of nfs_t'
#   at nfs_filesystem/test line 338.
Failed umount(2): Invalid argument

#   Failed test 'Using fsmount(2)'
#   at nfs_filesystem/test line 348.
# Looks like you failed 44 tests of 56.
nfs_filesystem/test .. Dubious, test returned 44 (wstat 11264, 0x2c00)
Failed 44/56 subtests

Test Summary Report
-------------------
nfs_filesystem/test (Wstat: 11264 Tests: 56 Failed: 44)
  Failed tests:  2-8, 10-12, 17-28, 30-36, 38-40, 45-56
  Non-zero exit status: 44
Files=1, Tests=56,  8 wallclock secs ( 0.04 usr  0.04 sys +  0.20 cusr
 4.63 csys =  4.91 CPU)
Result: FAIL
Failed 1/1 test programs. 44/56 subtests failed.
Error on line: 100 - Closing down NFS
umount: /mnt/selinux-testsuite: not mounted.
