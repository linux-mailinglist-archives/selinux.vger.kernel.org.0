Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 99B347C6BA
	for <lists+selinux@lfdr.de>; Wed, 31 Jul 2019 17:35:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727221AbfGaPfc (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Wed, 31 Jul 2019 11:35:32 -0400
Received: from usfb19pa16.eemsg.mail.mil ([214.24.26.87]:20972 "EHLO
        usfb19pa16.eemsg.mail.mil" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725209AbfGaPfc (ORCPT
        <rfc822;selinux@vger.kernel.org>); Wed, 31 Jul 2019 11:35:32 -0400
X-EEMSG-check-017: 228070121|USFB19PA16_EEMSG_MP12.csd.disa.mil
Received: from emsm-gh1-uea10.ncsc.mil ([214.29.60.2])
  by usfb19pa16.eemsg.mail.mil with ESMTP/TLS/DHE-RSA-AES256-SHA256; 31 Jul 2019 15:34:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tycho.nsa.gov; i=@tycho.nsa.gov; q=dns/txt;
  s=tycho.nsa.gov; t=1564587296; x=1596123296;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=wmQYZl7L0O7gKz82H3gFijvT+1v7ehJjWfdaXfWvcxY=;
  b=A1WyWhcFPs7YsPMvFTfVeBbLztX3gaGytrgl6hWwlTR9fFTDICw+M5PT
   pfGdpjjwQTDZolRcrBfPM1SAZ3KoXEOPewvzzdi8+xLlrXvV6oKbjV7py
   CEL7wFznuNk479knp+3iKdUckykd5DCwPAUlQOyHKlv3GZXTa1EW3EbKE
   3gTHMs4WjxBiIL0NiztSj+mleary/KziBYWDp/3viTKWSdWWmZD6okKnM
   ZYkw32JqdMcu/NMjxN91soL27ojMUthJpoLlVtXijWjwPNe0caCLJxsbs
   eZlQ3PiIMuzpBvxNtTIkrY9S1+rIHNDvKfyRzC8CqUm8L8hkYoYMSjygL
   A==;
X-IronPort-AV: E=Sophos;i="5.64,330,1559520000"; 
   d="scan'208";a="26301905"
IronPort-PHdr: =?us-ascii?q?9a23=3AKNvhIRJeuJmy4eYlzdmcpTZWNBhigK39O0sv0r?=
 =?us-ascii?q?FitYgXKP/yrarrMEGX3/hxlliBBdydt6sezbuL+PC/EUU7or+5+EgYd5JNUx?=
 =?us-ascii?q?JXwe43pCcHRPC/NEvgMfTxZDY7FskRHHVs/nW8LFQHUJ2mPw6arXK99yMdFQ?=
 =?us-ascii?q?viPgRpOOv1BpTSj8Oq3Oyu5pHfeQpFiCejbb9oKBi7rQrdu8oUjIB/Nqs/1x?=
 =?us-ascii?q?zFr2dSde9L321oP1WTnxj95se04pFu9jlbtuwi+cBdT6j0Zrw0QrNEAjsoNW?=
 =?us-ascii?q?A1/9DrugLYTQST/HscU34ZnQRODgPY8Rz1RJbxsi/9tupgxCmXOND9QL4oVT?=
 =?us-ascii?q?i+6apgVRHniD0DNzUk7m/ZjMJ+h79frB64pxFyx4vYbYeIP/R8Y6zdZ8sXS2?=
 =?us-ascii?q?pfUMhMWSJPAYSyYIQAAecaIepVrJPwq0cUoBeiGQWhAv7kxD9Shn/x2K03y/?=
 =?us-ascii?q?gsHhvc3AwnGdIFrXXarNL0NKgPT++1yLTDwDLZYPxK1jf974nIfQ0/rvyXQb?=
 =?us-ascii?q?JxcdbeyUkoFw/fiFWQspbqMyma1uQKrWiW9uxtXv+shW4/swx9vzeiy8g2ho?=
 =?us-ascii?q?TJm44Z0E7I+CpnzIovONG1TlNwb8S+H5tKrS6aMpN7QsYlQ251pik30qYGuZ?=
 =?us-ascii?q?unfCgSz5Qn2gLfZ+SHc4eW5hLjU/6cIStii3J/ebK/mg2y/VK8yuz8Ssa00F?=
 =?us-ascii?q?FKojBDktbQrXACywbf6s2GSvt55kuh2DCP2B7P6uxcPEw5mqXWJ4Qhz7ItjJ?=
 =?us-ascii?q?Yfr0vOEjHslEnrlKOWc18r+ums6+TpeLXmoZqcOpduhQ7iPaQunc2/DvkmPQ?=
 =?us-ascii?q?UVQ2ia+fiz1L3k/UHjRrVKlec5nrPWsJDdO8QXvrS5DBNN0oY/9xa/CC+r0N?=
 =?us-ascii?q?AZnXkBMVJEdwuLj4v3NFHUJvD3E/O/jk+ykDdk2f/GJKftApbTIXjZlrfuY7?=
 =?us-ascii?q?J951RbyAopwtBV/4hUBa0ZIPLvRk/xs8TVDh08Mwyz2ebnEtR91pgFVGKJGK?=
 =?us-ascii?q?CZNb3dsV6S6uIoOemMa5cfuCzhJPg9+/7ukXg5lEcHcqms3JsXcnK1E/pnI0?=
 =?us-ascii?q?WdenfsjdIBHn0Lvgo6VuDllFqCUTtLbXaoQ608/i07CJ6hDYrbRICimqCO3C?=
 =?us-ascii?q?SgE51Ne2BGEU6DHW30eISFQ/0Mcj6dItd9kjwYUrisU5Iu1RGptA701bVnKu?=
 =?us-ascii?q?7U+jYDuJL5ytd6+u3Tmgsu9TBuE8ud1GSNRXlunmwUXz82wLx/oUtlx1eH0K?=
 =?us-ascii?q?h4heFYFNNK6/NHSQc1KIDTz/JkBND2QQ/BYNiJR0i8Qtm8AjE+UMgxw9kQbE?=
 =?us-ascii?q?Z5AdmiiQrD3yWyCb8Pi7OLHIA08r7b33XpI8Z9ynDG1LQujlU/WctAK3Gphr?=
 =?us-ascii?q?Nl9wjSG47Ik1yVl6OtdasBwS7N8HmMwHGQvEFXTgFwS7/JXXMBaUvMq9T2+E?=
 =?us-ascii?q?fCQ6WpCbQ9PQtL0dSCJbdSat31kVVGQ+/uOM/AbGK1mmewAwuIx7yXYYr0dG?=
 =?us-ascii?q?USwj/dBFIHkw8N53aGMxYxBiO7r2LZFjxuGkrlY1nw/ulmtHO7Ukg0whmSb0?=
 =?us-ascii?q?J7yrq1/gUYheSGRPMO2rIIoSIhqzJzHFanwd3aEcaPpw1kfPYUXdRo+F5a0U?=
 =?us-ascii?q?rBvhF5e5mnKLpvwFUZdldZpUTrgjx+EIJG2ectrX8nyEImIKmX11JNehuEzJ?=
 =?us-ascii?q?vwPfvRMWC08xexPf2FkmrC2cqbr/9coM8zrE/u6UT0R0c=3D?=
X-IPAS-Result: =?us-ascii?q?A2BGCQCIs0Fd/wHyM5BlHgEGBwaBZ4FoBSqBPzIqlCwGg?=
 =?us-ascii?q?jSIZJEcCQEBAQEBAQEBARsZAQIBAYRAglAjOBMBAwEBAQQBAQEBBQEBbIUqg?=
 =?us-ascii?q?jopgxULAUQCgVGCVww/gXcUrhUziGuBSIE0hwlmg3EXeIEHgRGCXXODfhIYh?=
 =?us-ascii?q?X8ElCaWZgmCHItPiD4MG4IuizWKMgGnMiGBWCsIAhgIIQ+DJ4ESgTwXFI4pI?=
 =?us-ascii?q?wMwgQYBAYt5DRcHgiUBAQ?=
Received: from tarius.tycho.ncsc.mil ([144.51.242.1])
  by EMSM-GH1-UEA10.NCSC.MIL with ESMTP; 31 Jul 2019 15:34:54 +0000
Received: from moss-callisto.infosec.tycho.ncsc.mil (moss-callisto [192.168.25.136])
        by tarius.tycho.ncsc.mil (8.14.4/8.14.4) with ESMTP id x6VFYoWe019077;
        Wed, 31 Jul 2019 11:34:52 -0400
From:   Aaron Goidel <acgoide@tycho.nsa.gov>
To:     paul@paul-moore.com
Cc:     selinux@vger.kernel.org, linux-security-module@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, dhowells@redhat.com, jack@suse.cz,
        amir73il@gmail.com, jmorris@namei.org, sds@tycho.nsa.gov,
        linux-kernel@vger.kernel.org, Aaron Goidel <acgoide@tycho.nsa.gov>
Subject: [PATCH] fanotify, inotify, dnotify, security: add security hook for fs notifications
Date:   Wed, 31 Jul 2019 11:34:43 -0400
Message-Id: <20190731153443.4984-1-acgoide@tycho.nsa.gov>
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
---
 fs/notify/dnotify/dnotify.c         | 15 +++++++--
 fs/notify/fanotify/fanotify_user.c  | 27 +++++++++++++++--
 fs/notify/inotify/inotify_user.c    | 13 ++++++--
 include/linux/lsm_hooks.h           |  9 +++++-
 include/linux/security.h            | 10 ++++--
 security/security.c                 |  6 ++++
 security/selinux/hooks.c            | 47 +++++++++++++++++++++++++++++
 security/selinux/include/classmap.h |  5 +--
 8 files changed, 120 insertions(+), 12 deletions(-)

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
index a90bb19dcfa2..b83f27021f54 100644
--- a/fs/notify/fanotify/fanotify_user.c
+++ b/fs/notify/fanotify/fanotify_user.c
@@ -528,9 +528,10 @@ static const struct file_operations fanotify_fops = {
 };
 
 static int fanotify_find_path(int dfd, const char __user *filename,
-			      struct path *path, unsigned int flags)
+			      struct path *path, unsigned int flags, __u64 mask)
 {
 	int ret;
+	unsigned int obj_type;
 
 	pr_debug("%s: dfd=%d filename=%p flags=%x\n", __func__,
 		 dfd, filename, flags);
@@ -567,8 +568,30 @@ static int fanotify_find_path(int dfd, const char __user *filename,
 
 	/* you can only watch an inode if you have read permissions on it */
 	ret = inode_permission(path->dentry->d_inode, MAY_READ);
+	if (ret) {
+		path_put(path);
+		goto out;
+	}
+
+	switch (flags & FANOTIFY_MARK_TYPE_BITS) {
+	case FAN_MARK_MOUNT:
+		obj_type = FSNOTIFY_OBJ_TYPE_VFSMOUNT;
+		break;
+	case FAN_MARK_FILESYSTEM:
+		obj_type = FSNOTIFY_OBJ_TYPE_SB;
+		break;
+	case FAN_MARK_INODE:
+		obj_type = FSNOTIFY_OBJ_TYPE_INODE;
+		break;
+	default:
+		ret = -EINVAL;
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
@@ -1014,7 +1037,7 @@ static int do_fanotify_mark(int fanotify_fd, unsigned int flags, __u64 mask,
 		goto fput_and_out;
 	}
 
-	ret = fanotify_find_path(dfd, pathname, &path, flags);
+	ret = fanotify_find_path(dfd, pathname, &path, flags, mask);
 	if (ret)
 		goto fput_and_out;
 
diff --git a/fs/notify/inotify/inotify_user.c b/fs/notify/inotify/inotify_user.c
index 7b53598c8804..e0d593c2d437 100644
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
 
@@ -744,7 +753,7 @@ SYSCALL_DEFINE3(inotify_add_watch, int, fd, const char __user *, pathname,
 	if (mask & IN_ONLYDIR)
 		flags |= LOOKUP_DIRECTORY;
 
-	ret = inotify_find_inode(pathname, &path, flags);
+	ret = inotify_find_inode(pathname, &path, flags, mask);
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
index c61787b15f27..a1aaf79421df 100644
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
+	// check if the mask is requesting ability to set a blocking watch
+	if (mask & (ALL_FSNOTIFY_PERM_EVENTS))
+		perm |= FILE__WATCH_WITH_PERM; // if so, check that permission
+
+	// is the mask asking to watch file reads?
+	if (mask & (FS_ACCESS | FS_ACCESS_PERM | FS_CLOSE_NOWRITE))
+		perm |= FILE__WATCH_READS; // check that permission as well
+
+	return path_has_perm(current_cred(), path, perm);
+}
+
 /*
  * Copy the inode security context value to the user.
  *
@@ -6797,6 +6843,7 @@ static struct security_hook_list selinux_hooks[] __lsm_ro_after_init = {
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

