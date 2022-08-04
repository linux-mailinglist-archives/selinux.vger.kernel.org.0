Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 27345589EA5
	for <lists+selinux@lfdr.de>; Thu,  4 Aug 2022 17:27:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239955AbiHDP1C (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Thu, 4 Aug 2022 11:27:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239880AbiHDP1A (ORCPT
        <rfc822;selinux@vger.kernel.org>); Thu, 4 Aug 2022 11:27:00 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id B8E0D2127A
        for <selinux@vger.kernel.org>; Thu,  4 Aug 2022 08:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1659626818;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=UwVPMHNGaFZ81vFKHr3nYXqw8Kj/v9CVpEE3w8x/Lig=;
        b=IuYWtnRwAJLvnQg+jB3qVTTJLUaGyTau5hRYcaAnAgVoKytrXjlW+bDTtk6GzUlgKcJBOu
        jefbREOg5hp/qZVNtIfBd5Sxp7NzEgLJRYuLCVSBteZ9CxPYk1zha+ccmD5h+oAyjKpRR7
        qwfvw2yxW7AVBS7v07I+0xYobJ3FC0E=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-526-OqRHtPYhM2Gz9Xwe5BTvKA-1; Thu, 04 Aug 2022 11:26:53 -0400
X-MC-Unique: OqRHtPYhM2Gz9Xwe5BTvKA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C31D43800C36;
        Thu,  4 Aug 2022 15:26:52 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.33.36.10])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 1E9B9403D0D0;
        Thu,  4 Aug 2022 15:26:50 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH] nfs: Fix automount superblock LSM init problem,
 preventing sb sharing
From:   David Howells <dhowells@redhat.com>
To:     viro@zeniv.linux.org.uk
Cc:     Trond Myklebust <trond.myklebust@hammerspace.com>,
        Anna Schumaker <anna@kernel.org>,
        Scott Mayhew <smayhew@redhat.com>,
        Jeff Layton <jlayton@kernel.org>,
        Paul Moore <paul@paul-moore.com>,
        Casey Schaufler <casey@schaufler-ca.com>,
        linux-nfs@vger.kernel.org, selinux@vger.kernel.org,
        linux-security-module@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, dwysocha@redhat.com,
        dhowells@redhat.com, linux-kernel@vger.kernel.org
Date:   Thu, 04 Aug 2022 16:26:49 +0100
Message-ID: <165962680944.3334508.6610023900349142034.stgit@warthog.procyon.org.uk>
User-Agent: StGit/1.4
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

When NFS superblocks are created by automounting, their LSM parameters
aren't set in the fs_context struct prior to sget_fc() being called,
leading to failure to match existing superblocks.

Fix this by adding a new LSM hook to load fc->security for submount
creation when alloc_fs_context() is creating the fs_context for it.

However, this uncovers a further bug: nfs_get_root() initialises the
superblock security manually by calling security_sb_set_mnt_opts() or
security_sb_clone_mnt_opts() - but then vfs_get_tree() calls
security_sb_set_mnt_opts(), which can lead to SELinux, at least,
complaining.

Fix that by adding a flag to the fs_context that suppresses the
security_sb_set_mnt_opts() call in vfs_get_tree().  This can be set by NFS
when it sets the LSM context on the new superblock.

The first bug leads to messages like the following appearing in dmesg:

	NFS: Cache volume key already in use (nfs,4.2,2,108,106a8c0,1,,,,100000,100000,2ee,3a98,1d4c,3a98,1)

Signed-off-by: David Howells <dhowells@redhat.com>
Fixes: 9bc61ab18b1d ("vfs: Introduce fs_context, switch vfs_kern_mount() to it.")
Fixes: 779df6a5480f ("NFS: Ensure security label is set for root inode)
cc: Trond Myklebust <trond.myklebust@hammerspace.com>
cc: Anna Schumaker <anna@kernel.org>
cc: Alexander Viro <viro@zeniv.linux.org.uk>
cc: Scott Mayhew <smayhew@redhat.com>
cc: Jeff Layton <jlayton@kernel.org>
cc: Paul Moore <paul@paul-moore.com>
cc: Casey Schaufler <casey@schaufler-ca.com>
cc: linux-nfs@vger.kernel.org
cc: selinux@vger.kernel.org
cc: linux-security-module@vger.kernel.org
cc: linux-fsdevel@vger.kernel.org
---

 fs/fs_context.c               |    4 ++++
 fs/nfs/getroot.c              |    1 +
 fs/super.c                    |   10 ++++++----
 include/linux/fs_context.h    |    1 +
 include/linux/lsm_hook_defs.h |    1 +
 include/linux/lsm_hooks.h     |    6 +++++-
 include/linux/security.h      |    6 ++++++
 security/security.c           |    5 +++++
 security/selinux/hooks.c      |   29 +++++++++++++++++++++++++++++
 9 files changed, 58 insertions(+), 5 deletions(-)

diff --git a/fs/fs_context.c b/fs/fs_context.c
index 24ce12f0db32..22248b8a88a8 100644
--- a/fs/fs_context.c
+++ b/fs/fs_context.c
@@ -282,6 +282,10 @@ static struct fs_context *alloc_fs_context(struct file_system_type *fs_type,
 		break;
 	}
 
+	ret = security_fs_context_init(fc, reference);
+	if (ret < 0)
+		goto err_fc;
+
 	/* TODO: Make all filesystems support this unconditionally */
 	init_fs_context = fc->fs_type->init_fs_context;
 	if (!init_fs_context)
diff --git a/fs/nfs/getroot.c b/fs/nfs/getroot.c
index 11ff2b2e060f..651bffb0067e 100644
--- a/fs/nfs/getroot.c
+++ b/fs/nfs/getroot.c
@@ -144,6 +144,7 @@ int nfs_get_root(struct super_block *s, struct fs_context *fc)
 	}
 	if (error)
 		goto error_splat_root;
+	fc->lsm_set = true;
 	if (server->caps & NFS_CAP_SECURITY_LABEL &&
 		!(kflags_out & SECURITY_LSM_NATIVE_LABELS))
 		server->caps &= ~NFS_CAP_SECURITY_LABEL;
diff --git a/fs/super.c b/fs/super.c
index 60f57c7bc0a6..a1c440336fd9 100644
--- a/fs/super.c
+++ b/fs/super.c
@@ -1519,10 +1519,12 @@ int vfs_get_tree(struct fs_context *fc)
 	smp_wmb();
 	sb->s_flags |= SB_BORN;
 
-	error = security_sb_set_mnt_opts(sb, fc->security, 0, NULL);
-	if (unlikely(error)) {
-		fc_drop_locked(fc);
-		return error;
+	if (!(fc->lsm_set)) {
+		error = security_sb_set_mnt_opts(sb, fc->security, 0, NULL);
+		if (unlikely(error)) {
+			fc_drop_locked(fc);
+			return error;
+		}
 	}
 
 	/*
diff --git a/include/linux/fs_context.h b/include/linux/fs_context.h
index 13fa6f3df8e4..3876dd96bb20 100644
--- a/include/linux/fs_context.h
+++ b/include/linux/fs_context.h
@@ -110,6 +110,7 @@ struct fs_context {
 	bool			need_free:1;	/* Need to call ops->free() */
 	bool			global:1;	/* Goes into &init_user_ns */
 	bool			oldapi:1;	/* Coming from mount(2) */
+	bool			lsm_set:1;	/* security_sb_set/clone_mnt_opts() already done */
 };
 
 struct fs_context_operations {
diff --git a/include/linux/lsm_hook_defs.h b/include/linux/lsm_hook_defs.h
index eafa1d2489fd..6d1c738e4a84 100644
--- a/include/linux/lsm_hook_defs.h
+++ b/include/linux/lsm_hook_defs.h
@@ -54,6 +54,7 @@ LSM_HOOK(int, 0, bprm_creds_from_file, struct linux_binprm *bprm, struct file *f
 LSM_HOOK(int, 0, bprm_check_security, struct linux_binprm *bprm)
 LSM_HOOK(void, LSM_RET_VOID, bprm_committing_creds, struct linux_binprm *bprm)
 LSM_HOOK(void, LSM_RET_VOID, bprm_committed_creds, struct linux_binprm *bprm)
+LSM_HOOK(int, 0, fs_context_init, struct fs_context *fc, struct dentry *reference)
 LSM_HOOK(int, 0, fs_context_dup, struct fs_context *fc,
 	 struct fs_context *src_sc)
 LSM_HOOK(int, -ENOPARAM, fs_context_parse_param, struct fs_context *fc,
diff --git a/include/linux/lsm_hooks.h b/include/linux/lsm_hooks.h
index 91c8146649f5..1782814c7c5b 100644
--- a/include/linux/lsm_hooks.h
+++ b/include/linux/lsm_hooks.h
@@ -87,8 +87,12 @@
  * Security hooks for mount using fs_context.
  *	[See also Documentation/filesystems/mount_api.rst]
  *
+ * @fs_context_init:
+ *	Initialise fc->security.  This is initialised to NULL by the caller.
+ *	@fc indicates the new filesystem context.
+ *	@dentry indicates a reference for submount/remount
  * @fs_context_dup:
- *	Allocate and attach a security structure to sc->security.  This pointer
+ *	Allocate and attach a security structure to fc->security.  This pointer
  *	is initialised to NULL by the caller.
  *	@fc indicates the new filesystem context.
  *	@src_fc indicates the original filesystem context.
diff --git a/include/linux/security.h b/include/linux/security.h
index 7fc4e9f49f54..94834f699b04 100644
--- a/include/linux/security.h
+++ b/include/linux/security.h
@@ -291,6 +291,7 @@ int security_bprm_creds_from_file(struct linux_binprm *bprm, struct file *file);
 int security_bprm_check(struct linux_binprm *bprm);
 void security_bprm_committing_creds(struct linux_binprm *bprm);
 void security_bprm_committed_creds(struct linux_binprm *bprm);
+int security_fs_context_init(struct fs_context *fc, struct dentry *reference);
 int security_fs_context_dup(struct fs_context *fc, struct fs_context *src_fc);
 int security_fs_context_parse_param(struct fs_context *fc, struct fs_parameter *param);
 int security_sb_alloc(struct super_block *sb);
@@ -620,6 +621,11 @@ static inline void security_bprm_committed_creds(struct linux_binprm *bprm)
 {
 }
 
+static inline int security_fs_context_init(struct fs_context *fc,
+					   struct dentry *reference)
+{
+	return 0;
+}
 static inline int security_fs_context_dup(struct fs_context *fc,
 					  struct fs_context *src_fc)
 {
diff --git a/security/security.c b/security/security.c
index 188b8f782220..e683027f9424 100644
--- a/security/security.c
+++ b/security/security.c
@@ -880,6 +880,11 @@ void security_bprm_committed_creds(struct linux_binprm *bprm)
 	call_void_hook(bprm_committed_creds, bprm);
 }
 
+int security_fs_context_init(struct fs_context *fc, struct dentry *reference)
+{
+	return call_int_hook(fs_context_init, 0, fc, reference);
+}
+
 int security_fs_context_dup(struct fs_context *fc, struct fs_context *src_fc)
 {
 	return call_int_hook(fs_context_dup, 0, fc, src_fc);
diff --git a/security/selinux/hooks.c b/security/selinux/hooks.c
index 1bbd53321d13..ddeaff4f3bb1 100644
--- a/security/selinux/hooks.c
+++ b/security/selinux/hooks.c
@@ -2768,6 +2768,34 @@ static int selinux_umount(struct vfsmount *mnt, int flags)
 				   FILESYSTEM__UNMOUNT, NULL);
 }
 
+static int selinux_fs_context_init(struct fs_context *fc,
+				   struct dentry *reference)
+{
+	const struct superblock_security_struct *sbsec;
+	const struct inode_security_struct *root_isec;
+	struct selinux_mnt_opts *opts;
+
+	if (fc->purpose == FS_CONTEXT_FOR_SUBMOUNT) {
+		opts = kzalloc(sizeof(*opts), GFP_KERNEL);
+		if (!opts)
+			return -ENOMEM;
+
+		root_isec = backing_inode_security(reference->d_sb->s_root);
+		sbsec = selinux_superblock(reference->d_sb);
+		if (sbsec->flags & FSCONTEXT_MNT)
+			opts->fscontext_sid	= sbsec->sid;
+		if (sbsec->flags & CONTEXT_MNT)
+			opts->context_sid	= sbsec->mntpoint_sid;
+		if (sbsec->flags & ROOTCONTEXT_MNT)
+			opts->rootcontext_sid	= root_isec->sid;
+		if (sbsec->flags & DEFCONTEXT_MNT)
+			opts->defcontext_sid	= sbsec->def_sid;
+		fc->security = opts;
+	}
+
+	return 0;
+}
+
 static int selinux_fs_context_dup(struct fs_context *fc,
 				  struct fs_context *src_fc)
 {
@@ -7239,6 +7267,7 @@ static struct security_hook_list selinux_hooks[] __lsm_ro_after_init = {
 	/*
 	 * PUT "CLONING" (ACCESSING + ALLOCATING) HOOKS HERE
 	 */
+	LSM_HOOK_INIT(fs_context_init, selinux_fs_context_init),
 	LSM_HOOK_INIT(fs_context_dup, selinux_fs_context_dup),
 	LSM_HOOK_INIT(fs_context_parse_param, selinux_fs_context_parse_param),
 	LSM_HOOK_INIT(sb_eat_lsm_opts, selinux_sb_eat_lsm_opts),


