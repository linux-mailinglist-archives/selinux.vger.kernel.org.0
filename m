Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6279513A937
	for <lists+selinux@lfdr.de>; Tue, 14 Jan 2020 13:28:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726038AbgANM2L (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Tue, 14 Jan 2020 07:28:11 -0500
Received: from mailomta27-sa.btinternet.com ([213.120.69.33]:53919 "EHLO
        sa-prd-fep-043.btinternet.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725854AbgANM2L (ORCPT
        <rfc822;selinux@vger.kernel.org>); Tue, 14 Jan 2020 07:28:11 -0500
Received: from sa-prd-rgout-005.btmx-prd.synchronoss.net ([10.2.38.8])
          by sa-prd-fep-043.btinternet.com with ESMTP
          id <20200114122808.VFVX22185.sa-prd-fep-043.btinternet.com@sa-prd-rgout-005.btmx-prd.synchronoss.net>;
          Tue, 14 Jan 2020 12:28:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=btinternet.com; s=btmx201904; t=1579004888; 
        bh=nIGb3tiDZu8nmpwQFn7Y1tBndvGQ904j9YBKYOEKTEQ=;
        h=From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version;
        b=Nu/KQAOBFITDtxJUc7oxKCl94FaEpa07KuGqHq+G9XTODoGScw10/rp/YOuraBXTUCZosrVEwmsOyTEdjsXDv9wBDW6goxXwQllPNKSAxbGHKhihGNA0MneXy/emIsW64QAvWh9tfrLUkLbvthCx/+kdR11qkLqJN8x4j3fQwlXT6c9xUFh6OrV76twgy2Je21TWC4x2I0GQK74xxQ0f4TgW+pIRPdH3rvIy5FNxXFBcl7VAl+/jSLK4QX2F7b8lXRm2r8G1R2O244hFJnXbxlPKH/7dbEB4i7z4ih/R7EmfK6WRqzf+DMP8iRBz9WptmhTsd+pepKS3u1dx0LZIRg==
Authentication-Results: btinternet.com;
    auth=pass (PLAIN) smtp.auth=richard_c_haines@btinternet.com
X-Originating-IP: [31.49.60.240]
X-OWM-Source-IP: 31.49.60.240 (GB)
X-OWM-Env-Sender: richard_c_haines@btinternet.com
X-VadeSecure-score: verdict=clean score=0/300, class=clean
X-RazorGate-Vade: gggruggvucftvghtrhhoucdtuddrgedugedrtddtgddvvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemuceutffkvffkuffjvffgnffgvefqofdpqfgfvfenuceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomheptfhitghhrghrugcujfgrihhnvghsuceorhhitghhrghruggptggphhgrihhnvghssegsthhinhhtvghrnhgvthdrtghomheqnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepfedurdegledriedtrddvgedtnecurfgrrhgrmhephhgvlhhopehlohgtrghlhhhoshhtrdhlohgtrghlughomhgrihhnpdhinhgvthepfedurdegledriedtrddvgedtpdhmrghilhhfrhhomhepoehrihgthhgrrhgupggtpghhrghinhgvshessghtihhnthgvrhhnvghtrdgtohhmqedprhgtphhtthhopeeorhhitghhrghruggptggphhgrihhnvghssegsthhinhhtvghrnhgvthdrtghomhequcfqtfevrffvpehrfhgtkedvvdenrhhitghhrghruggptggphhgrihhnvghssegsthhinhhtvghrnhgvthdrtghomhdprhgtphhtthhopeeoshgvlhhinhhugiesvhhgvghrrdhkvghrnhgvlhdrohhrgheqnecuvehluhhsthgvrhfuihiivgeptd
X-RazorGate-Vade-Verdict: clean 0
X-RazorGate-Vade-Classification: clean
Received: from localhost.localdomain (31.49.60.240) by sa-prd-rgout-005.btmx-prd.synchronoss.net (5.8.337) (authenticated as richard_c_haines@btinternet.com)
        id 5D8362CD14989CA1; Tue, 14 Jan 2020 12:28:08 +0000
From:   Richard Haines <richard_c_haines@btinternet.com>
To:     selinux@vger.kernel.org
Cc:     Richard Haines <richard_c_haines@btinternet.com>
Subject: [PATCH V4 0/1] selinux-testsuite: Add filesystem tests
Date:   Tue, 14 Jan 2020 12:28:03 +0000
Message-Id: <20200114122804.321628-1-richard_c_haines@btinternet.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

These tests should cover all the areas in selinux/hooks.c that touch
the 'filesystem' class. Each hooks.c function is listed in the 'test'
script as there are some permissions that are checked in multiple places.

Tested on Fedora 31 and Rawhide (5.5 for the new watch perm).

V4 Changes:
1) Test non-name based type transition rule.
2) Test two different name-based type transition rules that only differ 
   in name.
3) Creating ext4 filesystems with inodes > 128 bytes using -I 256.
4) Use kernel_setsched() macro.

V3 Changes:
1) Lots of minor updates.
2) Add 'udevadm settle' as suggested by Ondrej to resolve udisks(8) issue.
3) Add stopping udisks(8) daemon as a '-d' option.
4) Add file quotaon test.
5) Add test for name type_transition rule.
6) Fix setfscreatecon(3) test to create a directory and check context.
7) Use kernel_dontaudit_setsched() as explained in [1].

[1] https://lore.kernel.org/selinux/f863a91987c1926a4351f3edf968c9003197fead.camel@btinternet.com/

V2 Changes:
1) If udisks(8) daemon is running, stop then restart after tests. The tests
   run faster and stops the annoying habit of adding mounts to the 'files'
   app on the desktop. Supports /usr/bin/systemctl or /usr/sbin/service
   More importantly it stops interferance with the '*context=' tests as it
   can cause intermittent failures. Tested by running 'test' in a continuous
   loop with udisks enabled, and then again disabled.
   Loop 200 times, with udisks failed between 1 to 70 iterations, without
   udisks, no failures.
2) Add "#define QFMT_VFS_V0 2" to quotas_test.c to fix a RHEL/CentOS 7 and
   below build issue.
3) Build new file context based on the original in
   create_file_change_context.c
4) Use "runcon `id -Z` quotacheck ..." to resolve RHEL-6 test run issue.
5) Fix free() contexts in create_file_change_context.c and
   check_mount_context.c

To test fanotify fs watch perm on 5.5+:
1) Build the testsuite policy first:
make -C policy load

2) Add the following CIL statements to watch.cil and install:
semodule -i watch.cil

(common filesystem (watch))
(classcommon filesystem filesystem)
(allow test_filesystem_t self(filesystem (watch)))
; Until 'fs_watch_all_fs(test_filesystem_t)' in Policy use:
(allow test_filesystem_t fs_t (filesystem (watch)))
; Required if notify policy enabled
;(allow test_filesystem_t self (dir (watch_sb)))

3) Edit /usr/share/selinux/devel/include/support/all_perms.spt
   and insert the 'watch' permission at:

define(`all_filesystem_perms',`{ mount remount ..... watch }')

Richard Haines (1):
  selinux-testsuite: Add filesystem tests

 defconfig                                     |   6 +
 policy/Makefile                               |   4 +
 policy/test_filesystem.te                     | 356 +++++++
 tests/Makefile                                |   7 +
 tests/filesystem/.gitignore                   |  11 +
 tests/filesystem/Makefile                     |  16 +
 tests/filesystem/check_file_context.c         |  75 ++
 tests/filesystem/check_mount_context.c        | 127 +++
 tests/filesystem/create_file.c                | 117 +++
 tests/filesystem/create_file_change_context.c | 146 +++
 tests/filesystem/fanotify_fs.c                |  79 ++
 tests/filesystem/fs_relabel.c                 | 138 +++
 tests/filesystem/grim_reaper.c                |  89 ++
 tests/filesystem/mount.c                      | 130 +++
 tests/filesystem/quotas_test.c                | 143 +++
 tests/filesystem/statfs_test.c                |  65 ++
 tests/filesystem/test                         | 941 ++++++++++++++++++
 tests/filesystem/umount.c                     |  84 ++
 18 files changed, 2534 insertions(+)
 create mode 100644 policy/test_filesystem.te
 create mode 100644 tests/filesystem/.gitignore
 create mode 100644 tests/filesystem/Makefile
 create mode 100644 tests/filesystem/check_file_context.c
 create mode 100644 tests/filesystem/check_mount_context.c
 create mode 100644 tests/filesystem/create_file.c
 create mode 100644 tests/filesystem/create_file_change_context.c
 create mode 100644 tests/filesystem/fanotify_fs.c
 create mode 100644 tests/filesystem/fs_relabel.c
 create mode 100644 tests/filesystem/grim_reaper.c
 create mode 100644 tests/filesystem/mount.c
 create mode 100644 tests/filesystem/quotas_test.c
 create mode 100644 tests/filesystem/statfs_test.c
 create mode 100755 tests/filesystem/test
 create mode 100644 tests/filesystem/umount.c

-- 
2.24.1

