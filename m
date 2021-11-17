Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1D3F453DF3
	for <lists+selinux@lfdr.de>; Wed, 17 Nov 2021 02:58:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232642AbhKQCBY (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Tue, 16 Nov 2021 21:01:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232628AbhKQCBY (ORCPT
        <rfc822;selinux@vger.kernel.org>); Tue, 16 Nov 2021 21:01:24 -0500
Received: from mail-qv1-xf4a.google.com (mail-qv1-xf4a.google.com [IPv6:2607:f8b0:4864:20::f4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D762AC061764
        for <selinux@vger.kernel.org>; Tue, 16 Nov 2021 17:58:25 -0800 (PST)
Received: by mail-qv1-xf4a.google.com with SMTP id n4-20020a0ce944000000b003bdcabf4cdfso1157262qvo.16
        for <selinux@vger.kernel.org>; Tue, 16 Nov 2021 17:58:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:cc;
        bh=caymuj0MGZCptln9VP4sHWU9D/RHZZIA+lbDSv4W7ok=;
        b=b/fh0XJxqafyv9gl1yZedFfi5zsajwqjK2zxACnx0pWf5P2vKvj9M/vt0QY8/8XiYt
         OcjCdGB5EVbawiItfV8N5xJLb4YciC1ec1luYWBeVcAYGJsHaRO8ZjLRWm4jxJs/dCbp
         U63DLfZiahYLTG4Rsy9J5aUJcGGbCqanUoaHlCp8GvWyTPZYTNj14YlC5R+EvOM+wHhr
         8HEk753sk1mRjZ+z8+k2tUytJOk4u12jYh3COQOKQHlSDqK1dxj1AMtBDaXPYBAvUxfX
         MPsV6dQrGJ0YlLa4lTcT3d2wC+p677qtHWyaVX6HfQ0ba5Sa0Nst7Q0/91CWCG4NIe32
         2yKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:cc;
        bh=caymuj0MGZCptln9VP4sHWU9D/RHZZIA+lbDSv4W7ok=;
        b=uuR9HrjezguWHxlmhTp0u//tpGoiFaXa/905X5irZTyR08RPAkEeQ9H4jcYL4XM+/R
         QgWJVj/nFlqlUTxGLHawwXg4RxaVfjfsHOzYmYTXj56KcL/R7io0IsIeoi3A7Fomv6jc
         WwtrH2joXV5md1UBOgXWfMTWPKx7joTF7YzfGzAt+pwvs5v99rgk6rUpSg7m2S3P8mJG
         p/vsBtPe4AbvhZ30Z2XJCmy4hOPfFSIwaYzmn7UwMgGjlU7Kv5CXB/Ju1GSYkK2Kg4mA
         OXcMPb0R+NSB0hbWQLjBdNiAnRy8tACOL+nXl6M7q67jdDdIyXbDCToVZd7ImLlySCnU
         nMxQ==
X-Gm-Message-State: AOAM5304DTARK8RZR7R3nuvr0V7fJmDvTPT4o8nLPQTM23+EL4kkMHXn
        wM18NqfQe1KzCW/Q8wAHzMloVaI1+TR0
X-Google-Smtp-Source: ABdhPJxBUPweJJY1+GgjaWTueZl7r8rLT33zDT9CZEWPJcotxU7v3nj++XPJdokw9KvwTukqUAIxF/x78Zxm
X-Received: from dvandertop.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:2862])
 (user=dvander job=sendgmr) by 2002:a05:622a:293:: with SMTP id
 z19mr6613270qtw.46.1637114305033; Tue, 16 Nov 2021 17:58:25 -0800 (PST)
Date:   Wed, 17 Nov 2021 01:58:02 +0000
Message-Id: <20211117015806.2192263-1-dvander@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.34.0.rc1.387.gb447b232ab-goog
Subject: [PATCH v19 0/4] overlayfs override_creds=off & nested get xattr fix
From:   David Anderson <dvander@google.com>
Cc:     David Anderson <dvander@google.com>,
        Mark Salyzyn <salyzyn@android.com>,
        Miklos Szeredi <miklos@szeredi.hu>,
        Jonathan Corbet <corbet@lwn.net>,
        Vivek Goyal <vgoyal@redhat.com>,
        "Eric W . Biederman" <ebiederm@xmission.com>,
        Amir Goldstein <amir73il@gmail.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Stephen Smalley <sds@tycho.nsa.gov>,
        John Stultz <john.stultz@linaro.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, linux-unionfs@vger.kernel.org,
        linux-security-module@vger.kernel.org, kernel-team@android.com,
        selinux@vger.kernel.org, paulmoore@microsoft.com,
        Luca.Boccassi@microsoft.com
Content-Type: text/plain; charset="UTF-8"
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Mark Salyzyn (3):
  Add flags option to get xattr method paired to __vfs_getxattr
  overlayfs: handle XATTR_NOSECURITY flag for get xattr method
  overlayfs: override_creds=off option bypass creator_cred

Mark Salyzyn + John Stultz (1):
  overlayfs: inode_owner_or_capable called during execv

The first three patches address fundamental security issues that should
be solved regardless of the override_creds=off feature.

The fourth adds the feature depends on these other fixes.

By default, all access to the upper, lower and work directories is the
recorded mounter's MAC and DAC credentials.  The incoming accesses are
checked against the caller's credentials.

If the principles of least privilege are applied for sepolicy, the
mounter's credentials might not overlap the credentials of the caller's
when accessing the overlayfs filesystem.  For example, a file that a
lower DAC privileged caller can execute, is MAC denied to the
generally higher DAC privileged mounter, to prevent an attack vector.

We add the option to turn off override_creds in the mount options; all
subsequent operations after mount on the filesystem will be only the
caller's credentials.  The module boolean parameter and mount option
override_creds is also added as a presence check for this "feature",
existence of /sys/module/overlay/parameters/overlay_creds

Signed-off-by: Mark Salyzyn <salyzyn@android.com>
Signed-off-by: David Anderson <dvander@google.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Vivek Goyal <vgoyal@redhat.com>
Cc: Eric W. Biederman <ebiederm@xmission.com>
Cc: Amir Goldstein <amir73il@gmail.com>
Cc: Randy Dunlap <rdunlap@infradead.org>
Cc: Stephen Smalley <sds@tycho.nsa.gov>
Cc: John Stultz <john.stultz@linaro.org>
Cc: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-fsdevel@vger.kernel.org
Cc: linux-unionfs@vger.kernel.org
Cc: linux-security-module@vger.kernel.org
Cc: kernel-team@android.com
Cc: selinux@vger.kernel.org
Cc: paulmoore@microsoft.com
Cc: Luca.Boccassi@microsoft.com

---

v19
- rebase.

v18
- rebase + fix minor cut and paste error for inode argument in __vfs_getxattr

v17
- correct some zero-day build failures.
- fix up documentation

v16
- rebase and merge of two patches.
- add adjustment to deal with execv when overrides is off.

v15
- Revert back to v4 with fixes from on the way from v5-v14. The single
  structure argument passing to address the complaints about too many
  arguments was rejected by the community.
- Drop the udner discussion fix for an additional CAP_DAC_READ_SEARCH
  check. Can address that independently.
- ToDo: upstream test frame for thes security fixes (currently testing
  is all in Android).

v14:
- Rejoin, rebase and a few adjustments.

v13:
- Pull out first patch and try to get it in alone feedback, some
  Acks, and then <crickets> because people forgot why we were doing i.

v12:
- Restore squished out patch 2 and 3 in the series,
  then change algorithm to add flags argument.
  Per-thread flag is a large security surface.

v11:
- Squish out v10 introduced patch 2 and 3 in the series,
  then and use per-thread flag instead for nesting.
- Switch name to ovl_do_vds_getxattr for __vds_getxattr wrapper.
- Add sb argument to ovl_revert_creds to match future work.

v10:
- Return NULL on CAP_DAC_READ_SEARCH
- Add __get xattr method to solve sepolicy logging issue
- Drop unnecessary sys_admin sepolicy checking for administrative
  driver internal xattr functions.

v6:
- Drop CONFIG_OVERLAY_FS_OVERRIDE_CREDS.
- Do better with the documentation, drop rationalizations.
- pr_warn message adjusted to report consequences.

v5:
- beefed up the caveats in the Documentation
- Is dependent on
  "overlayfs: check CAP_DAC_READ_SEARCH before issuing exportfs_decode_fh"
  "overlayfs: check CAP_MKNOD before issuing vfs_whiteout"
- Added prwarn when override_creds=off

v4:
- spelling and grammar errors in text

v3:
- Change name from caller_credentials / creator_credentials to the
  boolean override_creds.
- Changed from creator to mounter credentials.
- Updated and fortified the documentation.
- Added CONFIG_OVERLAY_FS_OVERRIDE_CREDS

v2:
- Forward port changed attr to stat, resulting in a build error.
- altered commit message.

David Anderson (4):
  Add flags option to get xattr method paired to __vfs_getxattr
  overlayfs: handle XATTR_NOSECURITY flag for get xattr method
  overlayfs: override_creds=off option bypass creator_cred
  overlayfs: inode_owner_or_capable called during execv

 Documentation/filesystems/locking.rst   |  2 +-
 Documentation/filesystems/overlayfs.rst | 26 ++++++++++++++-
 fs/9p/acl.c                             |  3 +-
 fs/9p/xattr.c                           |  3 +-
 fs/afs/xattr.c                          | 10 +++---
 fs/attr.c                               |  2 +-
 fs/btrfs/xattr.c                        |  3 +-
 fs/ceph/xattr.c                         |  3 +-
 fs/cifs/xattr.c                         |  2 +-
 fs/ecryptfs/inode.c                     |  6 ++--
 fs/ecryptfs/mmap.c                      |  5 +--
 fs/erofs/xattr.c                        |  3 +-
 fs/ext2/xattr_security.c                |  2 +-
 fs/ext2/xattr_trusted.c                 |  2 +-
 fs/ext2/xattr_user.c                    |  2 +-
 fs/ext4/xattr_hurd.c                    |  2 +-
 fs/ext4/xattr_security.c                |  2 +-
 fs/ext4/xattr_trusted.c                 |  2 +-
 fs/ext4/xattr_user.c                    |  2 +-
 fs/f2fs/xattr.c                         |  4 +--
 fs/fuse/xattr.c                         |  4 +--
 fs/gfs2/xattr.c                         |  3 +-
 fs/hfs/attr.c                           |  2 +-
 fs/hfsplus/xattr.c                      |  3 +-
 fs/hfsplus/xattr_security.c             |  3 +-
 fs/hfsplus/xattr_trusted.c              |  3 +-
 fs/hfsplus/xattr_user.c                 |  3 +-
 fs/inode.c                              |  7 +++--
 fs/internal.h                           |  3 +-
 fs/jffs2/security.c                     |  3 +-
 fs/jffs2/xattr_trusted.c                |  3 +-
 fs/jffs2/xattr_user.c                   |  3 +-
 fs/jfs/xattr.c                          |  5 +--
 fs/kernfs/inode.c                       |  3 +-
 fs/nfs/nfs4proc.c                       |  9 ++++--
 fs/ntfs3/xattr.c                        |  2 +-
 fs/ocfs2/xattr.c                        |  9 ++++--
 fs/open.c                               |  2 +-
 fs/orangefs/xattr.c                     |  3 +-
 fs/overlayfs/copy_up.c                  |  2 +-
 fs/overlayfs/dir.c                      | 17 +++++-----
 fs/overlayfs/file.c                     | 25 ++++++++-------
 fs/overlayfs/inode.c                    | 29 ++++++++---------
 fs/overlayfs/namei.c                    |  6 ++--
 fs/overlayfs/overlayfs.h                |  7 +++--
 fs/overlayfs/ovl_entry.h                |  1 +
 fs/overlayfs/readdir.c                  |  8 ++---
 fs/overlayfs/super.c                    | 34 ++++++++++++++++----
 fs/overlayfs/util.c                     | 13 ++++++--
 fs/posix_acl.c                          |  2 +-
 fs/reiserfs/xattr_security.c            |  3 +-
 fs/reiserfs/xattr_trusted.c             |  3 +-
 fs/reiserfs/xattr_user.c                |  3 +-
 fs/squashfs/xattr.c                     |  2 +-
 fs/ubifs/xattr.c                        |  3 +-
 fs/xattr.c                              | 42 +++++++++++++------------
 fs/xfs/xfs_xattr.c                      |  3 +-
 include/linux/lsm_hook_defs.h           |  3 +-
 include/linux/security.h                |  6 ++--
 include/linux/xattr.h                   |  6 ++--
 include/uapi/linux/xattr.h              |  7 +++--
 mm/shmem.c                              |  3 +-
 net/socket.c                            |  3 +-
 security/commoncap.c                    | 11 ++++---
 security/integrity/evm/evm_main.c       | 13 +++++---
 security/security.c                     |  5 +--
 security/selinux/hooks.c                | 19 ++++++-----
 security/smack/smack_lsm.c              | 18 ++++++-----
 68 files changed, 289 insertions(+), 167 deletions(-)

-- 
2.34.0.rc1.387.gb447b232ab-goog

