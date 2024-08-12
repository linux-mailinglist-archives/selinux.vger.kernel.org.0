Return-Path: <selinux+bounces-1657-lists+selinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E4EBE94F071
	for <lists+selinux@lfdr.de>; Mon, 12 Aug 2024 16:50:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 745DC1F21BA8
	for <lists+selinux@lfdr.de>; Mon, 12 Aug 2024 14:50:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2887183CCD;
	Mon, 12 Aug 2024 14:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=digikod.net header.i=@digikod.net header.b="zPjRs31M"
X-Original-To: selinux@vger.kernel.org
Received: from smtp-bc0e.mail.infomaniak.ch (smtp-bc0e.mail.infomaniak.ch [45.157.188.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 389FD183CBB
	for <selinux@vger.kernel.org>; Mon, 12 Aug 2024 14:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.157.188.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723474203; cv=none; b=s1d4uNRRjBWRVax44WmRjE8fqfZAL+i9y4ZFxXB4EZTVt0Qi3HjYXzQ3ZiPjLcGxdMs1ilEZXXlOFY7pFd7enuNa7WmaY513Gx7ldjWWuoZwNNiJ45g4A4229sUmPjAhCKQpnTpV/IJn/0rOqpFAJqDirRRgQO58pzVuVUKYyx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723474203; c=relaxed/simple;
	bh=i7Y5+K7zVtDYddrBfpRCDDpgnvj/fKZF7Il9NSXzZ38=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=omVx7jY9WjY4/veTLoK1KkXP4ZX0T2JF3c40t03QYAItmlMc1EPdxvxTFWmeHYrIJuNkKboICXK9BsXCGxLHZOQucXAehyU/cBRepxpw/8QAbpkQAXZrLgx2VI3XXbtd3IKvCQVE7Y/r8g8eMF2sL2ff4HYwJaYawjXrwxhacsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=digikod.net; spf=pass smtp.mailfrom=digikod.net; dkim=pass (1024-bit key) header.d=digikod.net header.i=@digikod.net header.b=zPjRs31M; arc=none smtp.client-ip=45.157.188.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=digikod.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=digikod.net
Received: from smtp-4-0000.mail.infomaniak.ch (smtp-4-0000.mail.infomaniak.ch [10.7.10.107])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4WjHVP2M5Hz2v6;
	Mon, 12 Aug 2024 16:49:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digikod.net;
	s=20191114; t=1723474189;
	bh=BV2B1HqhE7zSfgT2JaRQENk16SuqrGAGLuDB5GJTR88=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=zPjRs31M1lecptsi661AZaLDE2RA7UvBth2QHCG6fgOV1QBDwJBBwS3WEYhqG8hjd
	 rAX8Z5f7SBPnV4fTjLngA8JABozInfJ9k7uJ+bFNAD2+eY1yTwK44YRjBvxFj59EfL
	 cm7I2nOi9IFQ5UUHRl8WHdbJt9YFCBqPjKp4kt/o=
Received: from unknown by smtp-4-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4WjHVN1qJKz65M;
	Mon, 12 Aug 2024 16:49:48 +0200 (CEST)
From: =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>
To: Christian Brauner <brauner@kernel.org>,
	Paul Moore <paul@paul-moore.com>
Cc: =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	selinux@vger.kernel.org,
	Jan Kara <jack@suse.cz>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Casey Schaufler <casey@schaufler-ca.com>,
	James Morris <jmorris@namei.org>,
	Jann Horn <jannh@google.com>,
	Ondrej Mosnacek <omosnace@redhat.com>,
	"Serge E . Hallyn" <serge@hallyn.com>,
	Stephen Smalley <stephen.smalley.work@gmail.com>
Subject: [PATCH] fs,security: Fix file_set_fowner LSM hook inconsistencies
Date: Mon, 12 Aug 2024 16:49:35 +0200
Message-ID: <20240812144936.1616628-1-mic@digikod.net>
In-Reply-To: <CAHC9VhQsTH4Q8uWfk=SLwQ0LWJDK5od9OdhQ2UBUzxBx+6O8Gg@mail.gmail.com>
References: <CAHC9VhQsTH4Q8uWfk=SLwQ0LWJDK5od9OdhQ2UBUzxBx+6O8Gg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: selinux@vger.kernel.org
List-Id: <selinux.vger.kernel.org>
List-Subscribe: <mailto:selinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:selinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Infomaniak-Routing: alpha

The fcntl's F_SETOWN command sets the process that handle SIGIO/SIGURG
for the related file descriptor.  Before this change, the
file_set_fowner LSM hook was used to store this information.  However,
there are three issues with this approach:

- Because security_file_set_fowner() only get one argument, all hook
  implementations ignore the VFS logic which may not actually change the
  process that handles SIGIO (e.g. TUN, TTY, dnotify).

- Because security_file_set_fowner() is called before f_modown() without
  lock (e.g. f_owner.lock), concurrent F_SETOWN commands could result to
  a race condition and inconsistent LSM states (e.g. SELinux's fown_sid)
  compared to struct fown_struct's UID/EUID.

- Because the current hook implementations does not use explicit atomic
  operations, they may create inconsistencies.  It would help to
  completely remove this constraint, as well as the requirements of the
  RCU read-side critical section for the hook.

Fix these issues by replacing f_owner.uid and f_owner.euid with a new
f_owner.cred [1].  This also saves memory by removing dedicated LSM
blobs, and simplifies code by removing the file_set_fowner LSM hook.

This changes enables to remove the smack_file_alloc_security
implementation, Smack's file blob, and SELinux's
file_security_struct->fown_sid field.

As for the UID/EUID, f_owner.cred is not always updated.  Because the
file_set_fowner hook is removed, the fowner credentials now have the
same semantic as what is used by the VFS.

Before this change, f_owner's UID/EUID were initialized to zero
(i.e. GLOBAL_ROOT_UID), but to simplify code, f_owner's cred is now
initialized with the file descriptor creator's credentials (i.e.
file->f_cred), which is more consistent and simplifies LSMs logic.  The
sigio_perm()'s semantic does not need any change because SIGIO/SIGURG
are only sent when a process is explicitly set with __f_setown().

Rename f_modown() to __f_setown() to simplify code.

Cc: Al Viro <viro@zeniv.linux.org.uk>
Cc: Casey Schaufler <casey@schaufler-ca.com>
Cc: Christian Brauner <brauner@kernel.org>
Cc: James Morris <jmorris@namei.org>
Cc: Jann Horn <jannh@google.com>
Cc: Ondrej Mosnacek <omosnace@redhat.com>
Cc: Paul Moore <paul@paul-moore.com>
Cc: Serge E. Hallyn <serge@hallyn.com>
Cc: Stephen Smalley <stephen.smalley.work@gmail.com>
Link: https://lore.kernel.org/r/20240809-explosionsartig-ablesen-b039dbc6ce82@brauner [1]
Signed-off-by: Mickaël Salaün <mic@digikod.net>
---
 fs/fcntl.c                        | 44 +++++++++++++++----------------
 fs/file_table.c                   |  3 +++
 include/linux/fs.h                |  2 +-
 include/linux/lsm_hook_defs.h     |  1 -
 include/linux/security.h          |  1 -
 security/security.c               | 14 ----------
 security/selinux/hooks.c          | 22 +++-------------
 security/selinux/include/objsec.h |  1 -
 security/smack/smack.h            |  6 -----
 security/smack/smack_lsm.c        | 39 +--------------------------
 10 files changed, 29 insertions(+), 104 deletions(-)

diff --git a/fs/fcntl.c b/fs/fcntl.c
index 300e5d9ad913..4832d6b6759c 100644
--- a/fs/fcntl.c
+++ b/fs/fcntl.c
@@ -87,8 +87,8 @@ static int setfl(int fd, struct file * filp, unsigned int arg)
 	return error;
 }
 
-static void f_modown(struct file *filp, struct pid *pid, enum pid_type type,
-                     int force)
+void __f_setown(struct file *filp, struct pid *pid, enum pid_type type,
+		int force)
 {
 	write_lock_irq(&filp->f_owner.lock);
 	if (force || !filp->f_owner.pid) {
@@ -96,21 +96,14 @@ static void f_modown(struct file *filp, struct pid *pid, enum pid_type type,
 		filp->f_owner.pid = get_pid(pid);
 		filp->f_owner.pid_type = type;
 
-		if (pid) {
-			const struct cred *cred = current_cred();
-			filp->f_owner.uid = cred->uid;
-			filp->f_owner.euid = cred->euid;
-		}
+		if (pid)
+			put_cred(rcu_replace_pointer(
+				filp->f_owner.cred,
+				get_cred_rcu(current_cred()),
+				lockdep_is_held(&filp->f_owner.lock)));
 	}
 	write_unlock_irq(&filp->f_owner.lock);
 }
-
-void __f_setown(struct file *filp, struct pid *pid, enum pid_type type,
-		int force)
-{
-	security_file_set_fowner(filp);
-	f_modown(filp, pid, type, force);
-}
 EXPORT_SYMBOL(__f_setown);
 
 int f_setown(struct file *filp, int who, int force)
@@ -146,7 +139,7 @@ EXPORT_SYMBOL(f_setown);
 
 void f_delown(struct file *filp)
 {
-	f_modown(filp, NULL, PIDTYPE_TGID, 1);
+	__f_setown(filp, NULL, PIDTYPE_TGID, 1);
 }
 
 pid_t f_getown(struct file *filp)
@@ -249,13 +242,15 @@ static int f_getowner_uids(struct file *filp, unsigned long arg)
 {
 	struct user_namespace *user_ns = current_user_ns();
 	uid_t __user *dst = (void __user *)arg;
+	const struct cred *fown_cred;
 	uid_t src[2];
 	int err;
 
-	read_lock_irq(&filp->f_owner.lock);
-	src[0] = from_kuid(user_ns, filp->f_owner.uid);
-	src[1] = from_kuid(user_ns, filp->f_owner.euid);
-	read_unlock_irq(&filp->f_owner.lock);
+	rcu_read_lock();
+	fown_cred = rcu_dereference(filp->f_owner->cred);
+	src[0] = from_kuid(user_ns, fown_cred->uid);
+	src[1] = from_kuid(user_ns, fown_cred->euid);
+	rcu_read_unlock();
 
 	err  = put_user(src[0], &dst[0]);
 	err |= put_user(src[1], &dst[1]);
@@ -737,14 +732,17 @@ static const __poll_t band_table[NSIGPOLL] = {
 static inline int sigio_perm(struct task_struct *p,
                              struct fown_struct *fown, int sig)
 {
-	const struct cred *cred;
+	const struct cred *cred, *fown_cred;
 	int ret;
 
 	rcu_read_lock();
+	fown_cred = rcu_dereference(fown->cred);
 	cred = __task_cred(p);
-	ret = ((uid_eq(fown->euid, GLOBAL_ROOT_UID) ||
-		uid_eq(fown->euid, cred->suid) || uid_eq(fown->euid, cred->uid) ||
-		uid_eq(fown->uid,  cred->suid) || uid_eq(fown->uid,  cred->uid)) &&
+	ret = ((uid_eq(fown_cred->euid, GLOBAL_ROOT_UID) ||
+		uid_eq(fown_cred->euid, cred->suid) ||
+		uid_eq(fown_cred->euid, cred->uid) ||
+		uid_eq(fown_cred->uid, cred->suid) ||
+		uid_eq(fown_cred->uid, cred->uid)) &&
 	       !security_file_send_sigiotask(p, fown, sig));
 	rcu_read_unlock();
 	return ret;
diff --git a/fs/file_table.c b/fs/file_table.c
index 4f03beed4737..d28b76aef4f3 100644
--- a/fs/file_table.c
+++ b/fs/file_table.c
@@ -66,6 +66,7 @@ static inline void file_free(struct file *f)
 	if (likely(!(f->f_mode & FMODE_NOACCOUNT)))
 		percpu_counter_dec(&nr_files);
 	put_cred(f->f_cred);
+	put_cred(f->f_owner.cred);
 	if (unlikely(f->f_mode & FMODE_BACKING)) {
 		path_put(backing_file_user_path(f));
 		kfree(backing_file(f));
@@ -149,9 +150,11 @@ static int init_file(struct file *f, int flags, const struct cred *cred)
 	int error;
 
 	f->f_cred = get_cred(cred);
+	f->f_owner.cred = get_cred(cred);
 	error = security_file_alloc(f);
 	if (unlikely(error)) {
 		put_cred(f->f_cred);
+		put_cred(f->f_owner.cred);
 		return error;
 	}
 
diff --git a/include/linux/fs.h b/include/linux/fs.h
index 0283cf366c2a..345e8ff6d49a 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -942,7 +942,7 @@ struct fown_struct {
 	rwlock_t lock;          /* protects pid, uid, euid fields */
 	struct pid *pid;	/* pid or -pgrp where SIGIO should be sent */
 	enum pid_type pid_type;	/* Kind of process group SIGIO should be sent to */
-	kuid_t uid, euid;	/* uid/euid of process setting the owner */
+	const struct cred __rcu *cred;/* cred of process setting the owner */
 	int signum;		/* posix.1b rt signal to be delivered on IO */
 };
 
diff --git a/include/linux/lsm_hook_defs.h b/include/linux/lsm_hook_defs.h
index 44488b1ab9a9..974bcc1c8f8f 100644
--- a/include/linux/lsm_hook_defs.h
+++ b/include/linux/lsm_hook_defs.h
@@ -196,7 +196,6 @@ LSM_HOOK(int, 0, file_mprotect, struct vm_area_struct *vma,
 LSM_HOOK(int, 0, file_lock, struct file *file, unsigned int cmd)
 LSM_HOOK(int, 0, file_fcntl, struct file *file, unsigned int cmd,
 	 unsigned long arg)
-LSM_HOOK(void, LSM_RET_VOID, file_set_fowner, struct file *file)
 LSM_HOOK(int, 0, file_send_sigiotask, struct task_struct *tsk,
 	 struct fown_struct *fown, int sig)
 LSM_HOOK(int, 0, file_receive, struct file *file)
diff --git a/include/linux/security.h b/include/linux/security.h
index de3af33e6ff5..20357efa4a77 100644
--- a/include/linux/security.h
+++ b/include/linux/security.h
@@ -415,7 +415,6 @@ int security_file_mprotect(struct vm_area_struct *vma, unsigned long reqprot,
 			   unsigned long prot);
 int security_file_lock(struct file *file, unsigned int cmd);
 int security_file_fcntl(struct file *file, unsigned int cmd, unsigned long arg);
-void security_file_set_fowner(struct file *file);
 int security_file_send_sigiotask(struct task_struct *tsk,
 				 struct fown_struct *fown, int sig);
 int security_file_receive(struct file *file);
diff --git a/security/security.c b/security/security.c
index e5ca08789f74..34e7f5c86af5 100644
--- a/security/security.c
+++ b/security/security.c
@@ -2898,20 +2898,6 @@ int security_file_fcntl(struct file *file, unsigned int cmd, unsigned long arg)
 	return call_int_hook(file_fcntl, file, cmd, arg);
 }
 
-/**
- * security_file_set_fowner() - Set the file owner info in the LSM blob
- * @file: the file
- *
- * Save owner security information (typically from current->security) in
- * file->f_security for later use by the send_sigiotask hook.
- *
- * Return: Returns 0 on success.
- */
-void security_file_set_fowner(struct file *file)
-{
-	call_void_hook(file_set_fowner, file);
-}
-
 /**
  * security_file_send_sigiotask() - Check if sending SIGIO/SIGURG is allowed
  * @tsk: target task
diff --git a/security/selinux/hooks.c b/security/selinux/hooks.c
index 7eed331e90f0..a8f5ed66808d 100644
--- a/security/selinux/hooks.c
+++ b/security/selinux/hooks.c
@@ -3644,8 +3644,6 @@ static int selinux_file_alloc_security(struct file *file)
 	u32 sid = current_sid();
 
 	fsec->sid = sid;
-	fsec->fown_sid = sid;
-
 	return 0;
 }
 
@@ -3918,33 +3916,20 @@ static int selinux_file_fcntl(struct file *file, unsigned int cmd,
 	return err;
 }
 
-static void selinux_file_set_fowner(struct file *file)
-{
-	struct file_security_struct *fsec;
-
-	fsec = selinux_file(file);
-	fsec->fown_sid = current_sid();
-}
-
 static int selinux_file_send_sigiotask(struct task_struct *tsk,
 				       struct fown_struct *fown, int signum)
 {
-	struct file *file;
 	u32 sid = task_sid_obj(tsk);
 	u32 perm;
-	struct file_security_struct *fsec;
-
-	/* struct fown_struct is never outside the context of a struct file */
-	file = container_of(fown, struct file, f_owner);
-
-	fsec = selinux_file(file);
+	const struct task_security_struct *tsec =
+		selinux_cred(rcu_dereference(fown->cred));
 
 	if (!signum)
 		perm = signal_to_av(SIGIO); /* as per send_sigio_to_task */
 	else
 		perm = signal_to_av(signum);
 
-	return avc_has_perm(fsec->fown_sid, sid,
+	return avc_has_perm(tsec->sid, sid,
 			    SECCLASS_PROCESS, perm, NULL);
 }
 
@@ -7202,7 +7187,6 @@ static struct security_hook_list selinux_hooks[] __ro_after_init = {
 	LSM_HOOK_INIT(file_mprotect, selinux_file_mprotect),
 	LSM_HOOK_INIT(file_lock, selinux_file_lock),
 	LSM_HOOK_INIT(file_fcntl, selinux_file_fcntl),
-	LSM_HOOK_INIT(file_set_fowner, selinux_file_set_fowner),
 	LSM_HOOK_INIT(file_send_sigiotask, selinux_file_send_sigiotask),
 	LSM_HOOK_INIT(file_receive, selinux_file_receive),
 
diff --git a/security/selinux/include/objsec.h b/security/selinux/include/objsec.h
index dea1d6f3ed2d..d55b7f8d3a3d 100644
--- a/security/selinux/include/objsec.h
+++ b/security/selinux/include/objsec.h
@@ -56,7 +56,6 @@ struct inode_security_struct {
 
 struct file_security_struct {
 	u32 sid; /* SID of open file description */
-	u32 fown_sid; /* SID of file owner (for SIGIO) */
 	u32 isid; /* SID of inode at the time of file open */
 	u32 pseqno; /* Policy seqno at the time of file open */
 };
diff --git a/security/smack/smack.h b/security/smack/smack.h
index 041688e5a77a..06bac00cc796 100644
--- a/security/smack/smack.h
+++ b/security/smack/smack.h
@@ -328,12 +328,6 @@ static inline struct task_smack *smack_cred(const struct cred *cred)
 	return cred->security + smack_blob_sizes.lbs_cred;
 }
 
-static inline struct smack_known **smack_file(const struct file *file)
-{
-	return (struct smack_known **)(file->f_security +
-				       smack_blob_sizes.lbs_file);
-}
-
 static inline struct inode_smack *smack_inode(const struct inode *inode)
 {
 	return inode->i_security + smack_blob_sizes.lbs_inode;
diff --git a/security/smack/smack_lsm.c b/security/smack/smack_lsm.c
index f5cbec1e6a92..280a3da4c232 100644
--- a/security/smack/smack_lsm.c
+++ b/security/smack/smack_lsm.c
@@ -1650,26 +1650,6 @@ static void smack_inode_getsecid(struct inode *inode, u32 *secid)
  * label changing that SELinux does.
  */
 
-/**
- * smack_file_alloc_security - assign a file security blob
- * @file: the object
- *
- * The security blob for a file is a pointer to the master
- * label list, so no allocation is done.
- *
- * f_security is the owner security information. It
- * isn't used on file access checks, it's for send_sigio.
- *
- * Returns 0
- */
-static int smack_file_alloc_security(struct file *file)
-{
-	struct smack_known **blob = smack_file(file);
-
-	*blob = smk_of_current();
-	return 0;
-}
-
 /**
  * smack_file_ioctl - Smack check on ioctls
  * @file: the object
@@ -1888,18 +1868,6 @@ static int smack_mmap_file(struct file *file,
 	return rc;
 }
 
-/**
- * smack_file_set_fowner - set the file security blob value
- * @file: object in question
- *
- */
-static void smack_file_set_fowner(struct file *file)
-{
-	struct smack_known **blob = smack_file(file);
-
-	*blob = smk_of_current();
-}
-
 /**
  * smack_file_send_sigiotask - Smack on sigio
  * @tsk: The target task
@@ -1914,7 +1882,6 @@ static void smack_file_set_fowner(struct file *file)
 static int smack_file_send_sigiotask(struct task_struct *tsk,
 				     struct fown_struct *fown, int signum)
 {
-	struct smack_known **blob;
 	struct smack_known *skp;
 	struct smack_known *tkp = smk_of_task(smack_cred(tsk->cred));
 	const struct cred *tcred;
@@ -1928,8 +1895,7 @@ static int smack_file_send_sigiotask(struct task_struct *tsk,
 	file = container_of(fown, struct file, f_owner);
 
 	/* we don't log here as rc can be overriden */
-	blob = smack_file(file);
-	skp = *blob;
+	skp = smk_of_task(smack_cred(rcu_dereference(fown->cred)));
 	rc = smk_access(skp, tkp, MAY_DELIVER, NULL);
 	rc = smk_bu_note("sigiotask", skp, tkp, MAY_DELIVER, rc);
 
@@ -5014,7 +4980,6 @@ static int smack_uring_cmd(struct io_uring_cmd *ioucmd)
 
 struct lsm_blob_sizes smack_blob_sizes __ro_after_init = {
 	.lbs_cred = sizeof(struct task_smack),
-	.lbs_file = sizeof(struct smack_known *),
 	.lbs_inode = sizeof(struct inode_smack),
 	.lbs_ipc = sizeof(struct smack_known *),
 	.lbs_msg_msg = sizeof(struct smack_known *),
@@ -5065,14 +5030,12 @@ static struct security_hook_list smack_hooks[] __ro_after_init = {
 	LSM_HOOK_INIT(inode_listsecurity, smack_inode_listsecurity),
 	LSM_HOOK_INIT(inode_getsecid, smack_inode_getsecid),
 
-	LSM_HOOK_INIT(file_alloc_security, smack_file_alloc_security),
 	LSM_HOOK_INIT(file_ioctl, smack_file_ioctl),
 	LSM_HOOK_INIT(file_ioctl_compat, smack_file_ioctl),
 	LSM_HOOK_INIT(file_lock, smack_file_lock),
 	LSM_HOOK_INIT(file_fcntl, smack_file_fcntl),
 	LSM_HOOK_INIT(mmap_file, smack_mmap_file),
 	LSM_HOOK_INIT(mmap_addr, cap_mmap_addr),
-	LSM_HOOK_INIT(file_set_fowner, smack_file_set_fowner),
 	LSM_HOOK_INIT(file_send_sigiotask, smack_file_send_sigiotask),
 	LSM_HOOK_INIT(file_receive, smack_file_receive),
 
-- 
2.45.2


