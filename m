Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A29348A21E
	for <lists+selinux@lfdr.de>; Mon, 12 Aug 2019 17:20:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727436AbfHLPUO (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Mon, 12 Aug 2019 11:20:14 -0400
Received: from UHIL19PA36.eemsg.mail.mil ([214.24.21.195]:13681 "EHLO
        UHIL19PA36.eemsg.mail.mil" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727385AbfHLPUO (ORCPT
        <rfc822;selinux@vger.kernel.org>); Mon, 12 Aug 2019 11:20:14 -0400
X-EEMSG-check-017: 11852288|UHIL19PA36_ESA_OUT02.csd.disa.mil
X-IronPort-AV: E=Sophos;i="5.64,377,1559520000"; 
   d="scan'208";a="11852288"
Received: from emsm-gh1-uea11.ncsc.mil ([214.29.60.3])
  by UHIL19PA36.eemsg.mail.mil with ESMTP/TLS/DHE-RSA-AES256-SHA256; 12 Aug 2019 15:20:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tycho.nsa.gov; i=@tycho.nsa.gov; q=dns/txt;
  s=tycho.nsa.gov; t=1565623211; x=1597159211;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Rdcq6BOBNcV44kaMfueZ8HQF9WKRarvSvNPTC1kWnnQ=;
  b=YqyMNQXhDbliDoQn0lrsB8Evgo6KE0a1t51+h3gGsiVa2gln9IWmGmVZ
   YDskfQd5ms3zGE2MSbFHBluUP4IV6GQSh0V6X7lt011Zd0T8W23sqVYxZ
   U8KL3XYEmV72n7KMIzATiOUnLbN8I6ExxewHCOin+l8ttQMYKRRdhV5vv
   KJ3MMeH9s4NKvfWLnIlyOV+iJT75P1ufPfy4lB3V0RQdhE75TijImeAv5
   kBfV6naD2JpVVMQBej2bxNz4RyqgZZgN2H+Qvlolbu8ZBkU9NIu0GiFKX
   /7MD8DW6GnQgh9fzEnbodVF/FpK/tGHIcMx6ogFhqzSyjV9Nkeffi6rsN
   w==;
X-IronPort-AV: E=Sophos;i="5.64,377,1559520000"; 
   d="scan'208";a="31348155"
IronPort-PHdr: =?us-ascii?q?9a23=3A/43wHh++v5EVKf9uRHKM819IXTAuvvDOBiVQ1K?=
 =?us-ascii?q?B+0O4VIJqq85mqBkHD//Il1AaPAdyBrase16GG7ejJYi8p2d65qncMcZhBBV?=
 =?us-ascii?q?cuqP49uEgeOvODElDxN/XwbiY3T4xoXV5h+GynYwAOQJ6tL1LdrWev4jEMBx?=
 =?us-ascii?q?7xKRR6JvjvGo7Vks+7y/2+94fcbglVmjaxe65+IAu5oAnetcQbgJZpJ7osxB?=
 =?us-ascii?q?fOvnZGYfldy3lyJVKUkRb858Ow84Bm/i9Npf8v9NNOXLvjcaggQrNWEDopM2?=
 =?us-ascii?q?Yu5M32rhbDVheA5mEdUmoNjBVFBRXO4QzgUZfwtiv6sfd92DWfMMbrQ704RS?=
 =?us-ascii?q?iu4qF2QxLzliwJKyA2/33WisxojaJUvhShpwBkw4XJZI2ZLedycr/Bcd8fQ2?=
 =?us-ascii?q?dOUNxRVyhcCY2iaYUBAfcKMeJBo4Xjo1YCqB2zDhSuCuzy0D9Fnn/407Mn3e?=
 =?us-ascii?q?ovEg/I2wMvEd0VvXjIr9j4LrseXPqpwKXUyzjIcvNY2S366IjNah0sveuDXa?=
 =?us-ascii?q?h3ccrX1EIhFgTFjlSNpoP7OzOey+MAvHKH4OpvUuKvinMopB9qrzizxsYjlo?=
 =?us-ascii?q?nJhoUPxlDC7iV22pw5JdK/SE5leNOpFoZbuSKCN4ZuX88vTG5ltDw6x7Ebo5?=
 =?us-ascii?q?K3YicHxIo9yxLCbfGMbpKG7Qj5VOmLJDd1nHdleLWiiBms6UWg0ej8VtWs0F?=
 =?us-ascii?q?ZNsypFjsHAtnAT2BzX7ciKUud98V272TaOygDT8ftIIVw0lKXHK54hxaQ8lp?=
 =?us-ascii?q?wPvkTYAiD6gkD2jK6Sdkk8++io7froYqn+q5OBOIJ5hRvyP6QzlsClH+g1PR?=
 =?us-ascii?q?YCU3KG9eik0b3s50z5QLFEjv0slanZtYjXKt4Hqa62BA9V05ss5AikAje60N?=
 =?us-ascii?q?UXgXkHLFVfdBKBlIjmIUvCIP//Dfehm1isiitkx+jaPr39BZXANmTMn636fb?=
 =?us-ascii?q?lj609R0xEzwsxf551OF7EBLvbzVVHrtNDBEhA2KRa4zPrgCNV4zokeQ36AAr?=
 =?us-ascii?q?eFMKPOtl+F/uYvI+iKZI8ItzfxMvsl6OD0jX8/h1AdebKk3YUYaH+mBPRqOU?=
 =?us-ascii?q?aZbmT2gtcHD2gKuhAyTOvwiF2NSTRTfWq9X7og5jEnD4KrFYXDRoWqgLybxi?=
 =?us-ascii?q?e7H4ZWa3tACl+WFHfnaYSEV+0LaCKILc9riiYEWqS5S489yRGusxf3xKBiLu?=
 =?us-ascii?q?rV4C0Vt5zu1Nlx5+DImhEy8CZ7D8WZ022XU250mWYITScs3K9juUx91kuD0a?=
 =?us-ascii?q?9gjvxaD9Nc+/BJXxwhNZ7B1Ox1Fcr+VR7Af92RUlapXs2mAS0tTtI229IBfk?=
 =?us-ascii?q?Z9G9Ksjx/d2yqqB6QVmqeRBJMq763c32L+J9pnx3na06khikEsQtFTOm2+mq?=
 =?us-ascii?q?5/6w/TCpbNk0WYkaaqaKsd0DfD9GeY0GWBol9YXxB0UajeQ3AfaVXZrc7j6k?=
 =?us-ascii?q?PBUbCuE7InPRVFycKYLatKcNLph01cRPj/INTef36xm2CoCBaMx7OMapfqem?=
 =?us-ascii?q?oE0CXGFkcLjx0T/WyHNQgiBiatumfeDDtzGlLyZ0Pj7/JzqG20TkAq1QGGdU?=
 =?us-ascii?q?5h2KSv+h4Tm/OcT+kf3rUeuCcusz90Bkqy38rKC9qcoApsZL5cbs054FdG02?=
 =?us-ascii?q?LZqgN8M4e+L6BtmFEeaR57v0Dw2BVtDIVPj8wqoGktzApoJqKSyElBeC+A3Z?=
 =?us-ascii?q?DsJr3XLXH//Ai1ZK7L3lHTy86W9b0S6PQ8slnjuQapFk0483p5ydVaz3yc5p?=
 =?us-ascii?q?CZRDYVBIr4T0If7xFno/TfZS4n6sXf0ng/H7Ozt2rr0sguAqMKzResctMXZK?=
 =?us-ascii?q?qPGwjzH8AyG9mlKOtsnUOgKB0DIrYBp+YPI8q6eq7ei+aQN+F6kWfj1D4W7Q?=
 =?us-ascii?q?=3D=3D?=
X-IPAS-Result: =?us-ascii?q?A2B5AwCXglFd/wHyM5BmHgEGBwaBVgYLAYFoBSqBPzIql?=
 =?us-ascii?q?BQBAQaCNIhskSEJAQEBAQEBAQEBGxkBAgEBhD+CcCM3Bg4BBAEBAQQBAQMBC?=
 =?us-ascii?q?QEBbIUzgjopAYMUCwFEAoFRglcMP4F3FKxrM4hrgUmBNIcLZoNzF3iBB4ERg?=
 =?us-ascii?q?l1zg34SGIV/BJQ8lwsJgh+LX4hHDBuCMItFikinZiKBWCsIAhgIIQ+DJ4ESg?=
 =?us-ascii?q?TwXFY4pIwMwgQYBAYwHDRcHgiUBAQ?=
Received: from tarius.tycho.ncsc.mil ([144.51.242.1])
  by emsm-gh1-uea11.NCSC.MIL with ESMTP; 12 Aug 2019 15:20:08 +0000
Received: from moss-callisto.infosec.tycho.ncsc.mil (moss-callisto [192.168.25.136])
        by tarius.tycho.ncsc.mil (8.14.4/8.14.4) with ESMTP id x7CFK7Yi005551;
        Mon, 12 Aug 2019 11:20:08 -0400
From:   Aaron Goidel <acgoide@tycho.nsa.gov>
To:     paul@paul-moore.com
Cc:     selinux@vger.kernel.org, linux-security-module@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, dhowells@redhat.com, jack@suse.cz,
        amir73il@gmail.com, jmorris@namei.org, sds@tycho.nsa.gov,
        linux-kernel@vger.kernel.org, Aaron Goidel <acgoide@tycho.nsa.gov>,
        Casey Schaufler <casey@schaufler-ca.com>
Subject: [PATCH v3] fanotify, inotify, dnotify, security: add security hook for fs notifications
Date:   Mon, 12 Aug 2019 11:20:00 -0400
Message-Id: <20190812152000.18050-1-acgoide@tycho.nsa.gov>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

As of now, setting watches on filesystem objects has, at most, applied a
check for read access to the inode, and in the case of fanotify, requires
CAP_SYS_ADMIN. No specific security hook or permission check has been
provided to control the setting of watches. Using any of inotify, dnotify,
or fanotify, it is possible to observe, not only write-like operations, but
even read access to a file. Modeling the watch as being merely a read from
the file is insufficient for the needs of SELinux. This is due to the fact
that read access should not necessarily imply access to information about
when another process reads from a file. Furthermore, fanotify watches grant
more power to an application in the form of permission events. While
notification events are solely, unidirectional (i.e. they only pass
information to the receiving application), permission events are blocking.
Permission events make a request to the receiving application which will
then reply with a decision as to whether or not that action may be
completed. This causes the issue of the watching application having the
ability to exercise control over the triggering process. Without drawing a
distinction within the permission check, the ability to read would imply
the greater ability to control an application. Additionally, mount and
superblock watches apply to all files within the same mount or superblock.
Read access to one file should not necessarily imply the ability to watch
all files accessed within a given mount or superblock.

In order to solve these issues, a new LSM hook is implemented and has been
placed within the system calls for marking filesystem objects with inotify,
fanotify, and dnotify watches. These calls to the hook are placed at the
point at which the target path has been resolved and are provided with the
path struct, the mask of requested notification events, and the type of
object on which the mark is being set (inode, superblock, or mount). The
mask and obj_type have already been translated into common FS_* values
shared by the entirety of the fs notification infrastructure. The path
struct is passed rather than just the inode so that the mount is available,
particularly for mount watches. This also allows for use of the hook by
pathname-based security modules. However, since the hook is intended for
use even by inode based security modules, it is not placed under the
CONFIG_SECURITY_PATH conditional. Otherwise, the inode-based security
modules would need to enable all of the path hooks, even though they do not
use any of them.

This only provides a hook at the point of setting a watch, and presumes
that permission to set a particular watch implies the ability to receive
all notification about that object which match the mask. This is all that
is required for SELinux. If other security modules require additional hooks
or infrastructure to control delivery of notification, these can be added
by them. It does not make sense for us to propose hooks for which we have
no implementation. The understanding that all notifications received by the
requesting application are all strictly of a type for which the application
has been granted permission shows that this implementation is sufficient in
its coverage.

Security modules wishing to provide complete control over fanotify must
also implement a security_file_open hook that validates that the access
requested by the watching application is authorized. Fanotify has the issue
that it returns a file descriptor with the file mode specified during
fanotify_init() to the watching process on event. This is already covered
by the LSM security_file_open hook if the security module implements
checking of the requested file mode there. Otherwise, a watching process
can obtain escalated access to a file for which it has not been authorized.

The selinux_path_notify hook implementation works by adding five new file
permissions: watch, watch_mount, watch_sb, watch_reads, and watch_with_perm
(descriptions about which will follow), and one new filesystem permission:
watch (which is applied to superblock checks). The hook then decides which
subset of these permissions must be held by the requesting application
based on the contents of the provided mask and the obj_type. The
selinux_file_open hook already checks the requested file mode and therefore
ensures that a watching process cannot escalate its access through
fanotify.

The watch, watch_mount, and watch_sb permissions are the baseline
permissions for setting a watch on an object and each are a requirement for
any watch to be set on a file, mount, or superblock respectively. It should
be noted that having either of the other two permissions (watch_reads and
watch_with_perm) does not imply the watch, watch_mount, or watch_sb
permission. Superblock watches further require the filesystem watch
permission to the superblock. As there is no labeled object in view for
mounts, there is no specific check for mount watches beyond watch_mount to
the inode. Such a check could be added in the future, if a suitable labeled
object existed representing the mount.

The watch_reads permission is required to receive notifications from
read-exclusive events on filesystem objects. These events include accessing
a file for the purpose of reading and closing a file which has been opened
read-only. This distinction has been drawn in order to provide a direct
indication in the policy for this otherwise not obvious capability. Read
access to a file should not necessarily imply the ability to observe read
events on a file.

Finally, watch_with_perm only applies to fanotify masks since it is the
only way to set a mask which allows for the blocking, permission event.
This permission is needed for any watch which is of this type. Though
fanotify requires CAP_SYS_ADMIN, this is insufficient as it gives implicit
trust to root, which we do not do, and does not support least privilege.

Signed-off-by: Aaron Goidel <acgoide@tycho.nsa.gov>
Acked-by: Casey Schaufler <casey@schaufler-ca.com>
Acked-by: Jan Kara <jack@suse.cz>
---
v3:
  - fixed comment style in security hook

v2:
  - move initialization of obj_type up to remove duplicate work
  - convert inotify and fanotify flags to common FS_* flags
---
 fs/notify/dnotify/dnotify.c         | 15 +++++++--
 fs/notify/fanotify/fanotify_user.c  | 19 ++++++++++--
 fs/notify/inotify/inotify_user.c    | 14 +++++++--
 include/linux/lsm_hooks.h           |  9 +++++-
 include/linux/security.h            | 10 ++++--
 security/security.c                 |  6 ++++
 security/selinux/hooks.c            | 47 +++++++++++++++++++++++++++++
 security/selinux/include/classmap.h |  5 +--
 8 files changed, 113 insertions(+), 12 deletions(-)

diff --git a/fs/notify/dnotify/dnotify.c b/fs/notify/dnotify/dnotify.c
index 250369d6901d..87a7f61bc91c 100644
--- a/fs/notify/dnotify/dnotify.c
+++ b/fs/notify/dnotify/dnotify.c
@@ -22,6 +22,7 @@
 #include <linux/sched/signal.h>
 #include <linux/dnotify.h>
 #include <linux/init.h>
+#include <linux/security.h>
 #include <linux/spinlock.h>
 #include <linux/slab.h>
 #include <linux/fdtable.h>
@@ -288,6 +289,17 @@ int fcntl_dirnotify(int fd, struct file *filp, unsigned long arg)
 		goto out_err;
 	}
 
+	/*
+	 * convert the userspace DN_* "arg" to the internal FS_*
+	 * defined in fsnotify
+	 */
+	mask = convert_arg(arg);
+
+	error = security_path_notify(&filp->f_path, mask,
+			FSNOTIFY_OBJ_TYPE_INODE);
+	if (error)
+		goto out_err;
+
 	/* expect most fcntl to add new rather than augment old */
 	dn = kmem_cache_alloc(dnotify_struct_cache, GFP_KERNEL);
 	if (!dn) {
@@ -302,9 +314,6 @@ int fcntl_dirnotify(int fd, struct file *filp, unsigned long arg)
 		goto out_err;
 	}
 
-	/* convert the userspace DN_* "arg" to the internal FS_* defines in fsnotify */
-	mask = convert_arg(arg);
-
 	/* set up the new_fsn_mark and new_dn_mark */
 	new_fsn_mark = &new_dn_mark->fsn_mark;
 	fsnotify_init_mark(new_fsn_mark, dnotify_group);
diff --git a/fs/notify/fanotify/fanotify_user.c b/fs/notify/fanotify/fanotify_user.c
index a90bb19dcfa2..8b4e2ad6d208 100644
--- a/fs/notify/fanotify/fanotify_user.c
+++ b/fs/notify/fanotify/fanotify_user.c
@@ -528,7 +528,8 @@ static const struct file_operations fanotify_fops = {
 };
 
 static int fanotify_find_path(int dfd, const char __user *filename,
-			      struct path *path, unsigned int flags)
+			      struct path *path, unsigned int flags, __u64 mask,
+			      unsigned int obj_type)
 {
 	int ret;
 
@@ -567,8 +568,15 @@ static int fanotify_find_path(int dfd, const char __user *filename,
 
 	/* you can only watch an inode if you have read permissions on it */
 	ret = inode_permission(path->dentry->d_inode, MAY_READ);
+	if (ret) {
+		path_put(path);
+		goto out;
+	}
+
+	ret = security_path_notify(path, mask, obj_type);
 	if (ret)
 		path_put(path);
+
 out:
 	return ret;
 }
@@ -931,6 +939,7 @@ static int do_fanotify_mark(int fanotify_fd, unsigned int flags, __u64 mask,
 	__kernel_fsid_t __fsid, *fsid = NULL;
 	u32 valid_mask = FANOTIFY_EVENTS | FANOTIFY_EVENT_FLAGS;
 	unsigned int mark_type = flags & FANOTIFY_MARK_TYPE_BITS;
+	unsigned int obj_type;
 	int ret;
 
 	pr_debug("%s: fanotify_fd=%d flags=%x dfd=%d pathname=%p mask=%llx\n",
@@ -945,8 +954,13 @@ static int do_fanotify_mark(int fanotify_fd, unsigned int flags, __u64 mask,
 
 	switch (mark_type) {
 	case FAN_MARK_INODE:
+		obj_type = FSNOTIFY_OBJ_TYPE_INODE;
+		break;
 	case FAN_MARK_MOUNT:
+		obj_type = FSNOTIFY_OBJ_TYPE_VFSMOUNT;
+		break;
 	case FAN_MARK_FILESYSTEM:
+		obj_type = FSNOTIFY_OBJ_TYPE_SB;
 		break;
 	default:
 		return -EINVAL;
@@ -1014,7 +1028,8 @@ static int do_fanotify_mark(int fanotify_fd, unsigned int flags, __u64 mask,
 		goto fput_and_out;
 	}
 
-	ret = fanotify_find_path(dfd, pathname, &path, flags);
+	ret = fanotify_find_path(dfd, pathname, &path, flags,
+			(mask & ALL_FSNOTIFY_EVENTS), obj_type);
 	if (ret)
 		goto fput_and_out;
 
diff --git a/fs/notify/inotify/inotify_user.c b/fs/notify/inotify/inotify_user.c
index 7b53598c8804..408e9917ed42 100644
--- a/fs/notify/inotify/inotify_user.c
+++ b/fs/notify/inotify/inotify_user.c
@@ -39,6 +39,7 @@
 #include <linux/poll.h>
 #include <linux/wait.h>
 #include <linux/memcontrol.h>
+#include <linux/security.h>
 
 #include "inotify.h"
 #include "../fdinfo.h"
@@ -342,7 +343,8 @@ static const struct file_operations inotify_fops = {
 /*
  * find_inode - resolve a user-given path to a specific inode
  */
-static int inotify_find_inode(const char __user *dirname, struct path *path, unsigned flags)
+static int inotify_find_inode(const char __user *dirname, struct path *path,
+						unsigned int flags, __u64 mask)
 {
 	int error;
 
@@ -351,8 +353,15 @@ static int inotify_find_inode(const char __user *dirname, struct path *path, uns
 		return error;
 	/* you can only watch an inode if you have read permissions on it */
 	error = inode_permission(path->dentry->d_inode, MAY_READ);
+	if (error) {
+		path_put(path);
+		return error;
+	}
+	error = security_path_notify(path, mask,
+				FSNOTIFY_OBJ_TYPE_INODE);
 	if (error)
 		path_put(path);
+
 	return error;
 }
 
@@ -744,7 +753,8 @@ SYSCALL_DEFINE3(inotify_add_watch, int, fd, const char __user *, pathname,
 	if (mask & IN_ONLYDIR)
 		flags |= LOOKUP_DIRECTORY;
 
-	ret = inotify_find_inode(pathname, &path, flags);
+	ret = inotify_find_inode(pathname, &path, flags,
+			(mask & IN_ALL_EVENTS));
 	if (ret)
 		goto fput_and_out;
 
diff --git a/include/linux/lsm_hooks.h b/include/linux/lsm_hooks.h
index 47f58cfb6a19..ead98af9c602 100644
--- a/include/linux/lsm_hooks.h
+++ b/include/linux/lsm_hooks.h
@@ -339,6 +339,9 @@
  *	Check for permission to change root directory.
  *	@path contains the path structure.
  *	Return 0 if permission is granted.
+ * @path_notify:
+ *	Check permissions before setting a watch on events as defined by @mask,
+ *	on an object at @path, whose type is defined by @obj_type.
  * @inode_readlink:
  *	Check the permission to read the symbolic link.
  *	@dentry contains the dentry structure for the file link.
@@ -1535,7 +1538,9 @@ union security_list_options {
 	int (*path_chown)(const struct path *path, kuid_t uid, kgid_t gid);
 	int (*path_chroot)(const struct path *path);
 #endif
-
+	/* Needed for inode based security check */
+	int (*path_notify)(const struct path *path, u64 mask,
+				unsigned int obj_type);
 	int (*inode_alloc_security)(struct inode *inode);
 	void (*inode_free_security)(struct inode *inode);
 	int (*inode_init_security)(struct inode *inode, struct inode *dir,
@@ -1860,6 +1865,8 @@ struct security_hook_heads {
 	struct hlist_head path_chown;
 	struct hlist_head path_chroot;
 #endif
+	/* Needed for inode based modules as well */
+	struct hlist_head path_notify;
 	struct hlist_head inode_alloc_security;
 	struct hlist_head inode_free_security;
 	struct hlist_head inode_init_security;
diff --git a/include/linux/security.h b/include/linux/security.h
index 659071c2e57c..7d9c1da1f659 100644
--- a/include/linux/security.h
+++ b/include/linux/security.h
@@ -259,7 +259,8 @@ int security_dentry_create_files_as(struct dentry *dentry, int mode,
 					struct qstr *name,
 					const struct cred *old,
 					struct cred *new);
-
+int security_path_notify(const struct path *path, u64 mask,
+					unsigned int obj_type);
 int security_inode_alloc(struct inode *inode);
 void security_inode_free(struct inode *inode);
 int security_inode_init_security(struct inode *inode, struct inode *dir,
@@ -387,7 +388,6 @@ int security_ismaclabel(const char *name);
 int security_secid_to_secctx(u32 secid, char **secdata, u32 *seclen);
 int security_secctx_to_secid(const char *secdata, u32 seclen, u32 *secid);
 void security_release_secctx(char *secdata, u32 seclen);
-
 void security_inode_invalidate_secctx(struct inode *inode);
 int security_inode_notifysecctx(struct inode *inode, void *ctx, u32 ctxlen);
 int security_inode_setsecctx(struct dentry *dentry, void *ctx, u32 ctxlen);
@@ -621,6 +621,12 @@ static inline int security_move_mount(const struct path *from_path,
 	return 0;
 }
 
+static inline int security_path_notify(const struct path *path, u64 mask,
+				unsigned int obj_type)
+{
+	return 0;
+}
+
 static inline int security_inode_alloc(struct inode *inode)
 {
 	return 0;
diff --git a/security/security.c b/security/security.c
index 613a5c00e602..30687e1366b7 100644
--- a/security/security.c
+++ b/security/security.c
@@ -871,6 +871,12 @@ int security_move_mount(const struct path *from_path, const struct path *to_path
 	return call_int_hook(move_mount, 0, from_path, to_path);
 }
 
+int security_path_notify(const struct path *path, u64 mask,
+				unsigned int obj_type)
+{
+	return call_int_hook(path_notify, 0, path, mask, obj_type);
+}
+
 int security_inode_alloc(struct inode *inode)
 {
 	int rc = lsm_inode_alloc(inode);
diff --git a/security/selinux/hooks.c b/security/selinux/hooks.c
index f77b314d0575..d55571c585ff 100644
--- a/security/selinux/hooks.c
+++ b/security/selinux/hooks.c
@@ -92,6 +92,8 @@
 #include <linux/kernfs.h>
 #include <linux/stringhash.h>	/* for hashlen_string() */
 #include <uapi/linux/mount.h>
+#include <linux/fsnotify.h>
+#include <linux/fanotify.h>
 
 #include "avc.h"
 #include "objsec.h"
@@ -3261,6 +3263,50 @@ static int selinux_inode_removexattr(struct dentry *dentry, const char *name)
 	return -EACCES;
 }
 
+static int selinux_path_notify(const struct path *path, u64 mask,
+						unsigned int obj_type)
+{
+	int ret;
+	u32 perm;
+
+	struct common_audit_data ad;
+
+	ad.type = LSM_AUDIT_DATA_PATH;
+	ad.u.path = *path;
+
+	/*
+	 * Set permission needed based on the type of mark being set.
+	 * Performs an additional check for sb watches.
+	 */
+	switch (obj_type) {
+	case FSNOTIFY_OBJ_TYPE_VFSMOUNT:
+		perm = FILE__WATCH_MOUNT;
+		break;
+	case FSNOTIFY_OBJ_TYPE_SB:
+		perm = FILE__WATCH_SB;
+		ret = superblock_has_perm(current_cred(), path->dentry->d_sb,
+						FILESYSTEM__WATCH, &ad);
+		if (ret)
+			return ret;
+		break;
+	case FSNOTIFY_OBJ_TYPE_INODE:
+		perm = FILE__WATCH;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	/* blocking watches require the file:watch_with_perm permission */
+	if (mask & (ALL_FSNOTIFY_PERM_EVENTS))
+		perm |= FILE__WATCH_WITH_PERM;
+
+	/* watches on read-like events need the file:watch_reads permission */
+	if (mask & (FS_ACCESS | FS_ACCESS_PERM | FS_CLOSE_NOWRITE))
+		perm |= FILE__WATCH_READS;
+
+	return path_has_perm(current_cred(), path, perm);
+}
+
 /*
  * Copy the inode security context value to the user.
  *
@@ -6798,6 +6844,7 @@ static struct security_hook_list selinux_hooks[] __lsm_ro_after_init = {
 	LSM_HOOK_INIT(inode_getsecid, selinux_inode_getsecid),
 	LSM_HOOK_INIT(inode_copy_up, selinux_inode_copy_up),
 	LSM_HOOK_INIT(inode_copy_up_xattr, selinux_inode_copy_up_xattr),
+	LSM_HOOK_INIT(path_notify, selinux_path_notify),
 
 	LSM_HOOK_INIT(kernfs_init_security, selinux_kernfs_init_security),
 
diff --git a/security/selinux/include/classmap.h b/security/selinux/include/classmap.h
index 201f7e588a29..32e9b03be3dd 100644
--- a/security/selinux/include/classmap.h
+++ b/security/selinux/include/classmap.h
@@ -7,7 +7,8 @@
 
 #define COMMON_FILE_PERMS COMMON_FILE_SOCK_PERMS, "unlink", "link", \
     "rename", "execute", "quotaon", "mounton", "audit_access", \
-    "open", "execmod"
+	"open", "execmod", "watch", "watch_mount", "watch_sb", \
+	"watch_with_perm", "watch_reads"
 
 #define COMMON_SOCK_PERMS COMMON_FILE_SOCK_PERMS, "bind", "connect", \
     "listen", "accept", "getopt", "setopt", "shutdown", "recvfrom",  \
@@ -60,7 +61,7 @@ struct security_class_mapping secclass_map[] = {
 	{ "filesystem",
 	  { "mount", "remount", "unmount", "getattr",
 	    "relabelfrom", "relabelto", "associate", "quotamod",
-	    "quotaget", NULL } },
+	    "quotaget", "watch", NULL } },
 	{ "file",
 	  { COMMON_FILE_PERMS,
 	    "execute_no_trans", "entrypoint", NULL } },
-- 
2.21.0

