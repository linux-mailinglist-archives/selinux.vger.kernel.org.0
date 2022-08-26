Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 065115A22E7
	for <lists+selinux@lfdr.de>; Fri, 26 Aug 2022 10:24:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234771AbiHZIY4 (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Fri, 26 Aug 2022 04:24:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234047AbiHZIYz (ORCPT
        <rfc822;selinux@vger.kernel.org>); Fri, 26 Aug 2022 04:24:55 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC35E26DE;
        Fri, 26 Aug 2022 01:24:51 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 7CD49CE2E55;
        Fri, 26 Aug 2022 08:24:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A5EEC433D6;
        Fri, 26 Aug 2022 08:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1661502287;
        bh=+jzumE2iihAxeQEonKOKxScGJn9ZPj+nw9enXCc+QtQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Ys42Mx8r8upFvSFk445r/IrgH3nEMKqQX26Ty2+eBBDSG2BhlsP+MNsjWTsMG/nQK
         9seFPRAlnsuyM6MthcyNIXU1SB6t8yuleLwVt2FQvWM61JRid0oGijYKuqoEFOHsD6
         Qn1V3eV1gLHiIfmj42Veuqt3MvWn6wazgKAzFWDtQsG2uyOrvabuP4Ec+rfGYOrZ/G
         4bqjb+m4n4mHIcVK22cPdIjK0zA3iM/jy0JG1WkYuxCX+dUREg4zMmcUji80lMVGm6
         3QFhmewk1faQnvvfy0PLTtTQR/rBo+seO/dKiQeA9EMtRxk3vUqP2zPgbBDxSD2EgV
         5bXHkQUA8Bpyw==
Date:   Fri, 26 Aug 2022 10:24:39 +0200
From:   Christian Brauner <brauner@kernel.org>
To:     David Howells <dhowells@redhat.com>
Cc:     viro@zeniv.linux.org.uk, Jeff Layton <jlayton@kernel.org>,
        Trond Myklebust <trond.myklebust@hammerspace.com>,
        Anna Schumaker <anna@kernel.org>,
        Scott Mayhew <smayhew@redhat.com>,
        Paul Moore <paul@paul-moore.com>,
        Casey Schaufler <casey@schaufler-ca.com>,
        linux-nfs@vger.kernel.org, selinux@vger.kernel.org,
        linux-security-module@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, dwysocha@redhat.com,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] vfs, security: Fix automount superblock LSM init
 problem, preventing NFS sb sharing
Message-ID: <20220826082439.wdestxwkeccsyqtp@wittgenstein>
References: <166133579016.3678898.6283195019480567275.stgit@warthog.procyon.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <166133579016.3678898.6283195019480567275.stgit@warthog.procyon.org.uk>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Wed, Aug 24, 2022 at 11:09:50AM +0100, David Howells wrote:
> When NFS superblocks are created by automounting, their LSM parameters
> aren't set in the fs_context struct prior to sget_fc() being called,
> leading to failure to match existing superblocks.
> 
> Fix this by adding a new LSM hook to load fc->security for submount
> creation when alloc_fs_context() is creating the fs_context for it.
> 
> However, this uncovers a further bug: nfs_get_root() initialises the
> superblock security manually by calling security_sb_set_mnt_opts() or
> security_sb_clone_mnt_opts() - but then vfs_get_tree() calls
> security_sb_set_mnt_opts(), which can lead to SELinux, at least,
> complaining.
> 
> Fix that by adding a flag to the fs_context that suppresses the
> security_sb_set_mnt_opts() call in vfs_get_tree().  This can be set by NFS
> when it sets the LSM context on the new superblock.
> 
> The first bug leads to messages like the following appearing in dmesg:
> 
> 	NFS: Cache volume key already in use (nfs,4.2,2,108,106a8c0,1,,,,100000,100000,2ee,3a98,1d4c,3a98,1)
> 
> Changes
> =======
> ver #4)
>  - When doing a FOR_SUBMOUNT mount, don't set the root label in SELinux or
>    Smack.
> 
> ver #3)
>  - Made LSM parameter extraction dependent on fc->purpose ==
>    FS_CONTEXT_FOR_SUBMOUNT.  Shouldn't happen on FOR_RECONFIGURE.
> 
> ver #2)
>  - Added Smack support
>  - Made LSM parameter extraction dependent on reference != NULL.
> 
> Signed-off-by: David Howells <dhowells@redhat.com>
> Fixes: 9bc61ab18b1d ("vfs: Introduce fs_context, switch vfs_kern_mount() to it.")
> Fixes: 779df6a5480f ("NFS: Ensure security label is set for root inode)
> Tested-by: Jeff Layton <jlayton@kernel.org>
> cc: Trond Myklebust <trond.myklebust@hammerspace.com>
> cc: Anna Schumaker <anna@kernel.org>
> cc: Alexander Viro <viro@zeniv.linux.org.uk>
> cc: Scott Mayhew <smayhew@redhat.com>
> cc: Jeff Layton <jlayton@kernel.org>
> cc: Paul Moore <paul@paul-moore.com>
> cc: Casey Schaufler <casey@schaufler-ca.com>
> cc: linux-nfs@vger.kernel.org
> cc: selinux@vger.kernel.org
> cc: linux-security-module@vger.kernel.org
> cc: linux-fsdevel@vger.kernel.org
> Link: https://lore.kernel.org/r/165962680944.3334508.6610023900349142034.stgit@warthog.procyon.org.uk/ # v1
> Link: https://lore.kernel.org/r/165962729225.3357250.14350728846471527137.stgit@warthog.procyon.org.uk/ # v2
> Link: https://lore.kernel.org/r/165970659095.2812394.6868894171102318796.stgit@warthog.procyon.org.uk/ # v3
> ---
> 
>  fs/fs_context.c               |    4 +++
>  fs/nfs/getroot.c              |    1 +
>  fs/super.c                    |   10 +++++---
>  include/linux/fs_context.h    |    1 +
>  include/linux/lsm_hook_defs.h |    1 +
>  include/linux/lsm_hooks.h     |    6 ++++-
>  include/linux/security.h      |    6 +++++
>  security/security.c           |    5 ++++
>  security/selinux/hooks.c      |   27 +++++++++++++++++++++
>  security/smack/smack_lsm.c    |   54 +++++++++++++++++++++++++++++++++++++++++
>  10 files changed, 110 insertions(+), 5 deletions(-)
> 
> diff --git a/fs/fs_context.c b/fs/fs_context.c
> index 24ce12f0db32..22248b8a88a8 100644
> --- a/fs/fs_context.c
> +++ b/fs/fs_context.c
> @@ -282,6 +282,10 @@ static struct fs_context *alloc_fs_context(struct file_system_type *fs_type,
>  		break;
>  	}
>  
> +	ret = security_fs_context_init(fc, reference);
> +	if (ret < 0)
> +		goto err_fc;
> +
>  	/* TODO: Make all filesystems support this unconditionally */
>  	init_fs_context = fc->fs_type->init_fs_context;
>  	if (!init_fs_context)
> diff --git a/fs/nfs/getroot.c b/fs/nfs/getroot.c
> index 11ff2b2e060f..651bffb0067e 100644
> --- a/fs/nfs/getroot.c
> +++ b/fs/nfs/getroot.c
> @@ -144,6 +144,7 @@ int nfs_get_root(struct super_block *s, struct fs_context *fc)
>  	}
>  	if (error)
>  		goto error_splat_root;
> +	fc->lsm_set = true;
>  	if (server->caps & NFS_CAP_SECURITY_LABEL &&
>  		!(kflags_out & SECURITY_LSM_NATIVE_LABELS))
>  		server->caps &= ~NFS_CAP_SECURITY_LABEL;
> diff --git a/fs/super.c b/fs/super.c
> index 734ed584a946..94666c0c92a4 100644
> --- a/fs/super.c
> +++ b/fs/super.c
> @@ -1552,10 +1552,12 @@ int vfs_get_tree(struct fs_context *fc)
>  	smp_wmb();
>  	sb->s_flags |= SB_BORN;
>  
> -	error = security_sb_set_mnt_opts(sb, fc->security, 0, NULL);
> -	if (unlikely(error)) {
> -		fc_drop_locked(fc);
> -		return error;
> +	if (!(fc->lsm_set)) {
> +		error = security_sb_set_mnt_opts(sb, fc->security, 0, NULL);
> +		if (unlikely(error)) {
> +			fc_drop_locked(fc);
> +			return error;
> +		}
>  	}
>  
>  	/*
> diff --git a/include/linux/fs_context.h b/include/linux/fs_context.h
> index 13fa6f3df8e4..3876dd96bb20 100644
> --- a/include/linux/fs_context.h
> +++ b/include/linux/fs_context.h
> @@ -110,6 +110,7 @@ struct fs_context {
>  	bool			need_free:1;	/* Need to call ops->free() */
>  	bool			global:1;	/* Goes into &init_user_ns */
>  	bool			oldapi:1;	/* Coming from mount(2) */
> +	bool			lsm_set:1;	/* security_sb_set/clone_mnt_opts() already done */
>  };
>  
>  struct fs_context_operations {
> diff --git a/include/linux/lsm_hook_defs.h b/include/linux/lsm_hook_defs.h
> index 806448173033..40ac14d772da 100644
> --- a/include/linux/lsm_hook_defs.h
> +++ b/include/linux/lsm_hook_defs.h
> @@ -54,6 +54,7 @@ LSM_HOOK(int, 0, bprm_creds_from_file, struct linux_binprm *bprm, struct file *f
>  LSM_HOOK(int, 0, bprm_check_security, struct linux_binprm *bprm)
>  LSM_HOOK(void, LSM_RET_VOID, bprm_committing_creds, struct linux_binprm *bprm)
>  LSM_HOOK(void, LSM_RET_VOID, bprm_committed_creds, struct linux_binprm *bprm)
> +LSM_HOOK(int, 0, fs_context_init, struct fs_context *fc, struct dentry *reference)
>  LSM_HOOK(int, 0, fs_context_dup, struct fs_context *fc,
>  	 struct fs_context *src_sc)
>  LSM_HOOK(int, -ENOPARAM, fs_context_parse_param, struct fs_context *fc,
> diff --git a/include/linux/lsm_hooks.h b/include/linux/lsm_hooks.h
> index 84a0d7e02176..aec42d6287b5 100644
> --- a/include/linux/lsm_hooks.h
> +++ b/include/linux/lsm_hooks.h
> @@ -87,8 +87,12 @@
>   * Security hooks for mount using fs_context.
>   *	[See also Documentation/filesystems/mount_api.rst]
>   *
> + * @fs_context_init:
> + *	Initialise fc->security.  This is initialised to NULL by the caller.
> + *	@fc indicates the new filesystem context.
> + *	@dentry indicates a reference for submount/remount
>   * @fs_context_dup:
> - *	Allocate and attach a security structure to sc->security.  This pointer
> + *	Allocate and attach a security structure to fc->security.  This pointer
>   *	is initialised to NULL by the caller.
>   *	@fc indicates the new filesystem context.
>   *	@src_fc indicates the original filesystem context.
> diff --git a/include/linux/security.h b/include/linux/security.h
> index 1bc362cb413f..e7dfe38df72d 100644
> --- a/include/linux/security.h
> +++ b/include/linux/security.h
> @@ -291,6 +291,7 @@ int security_bprm_creds_from_file(struct linux_binprm *bprm, struct file *file);
>  int security_bprm_check(struct linux_binprm *bprm);
>  void security_bprm_committing_creds(struct linux_binprm *bprm);
>  void security_bprm_committed_creds(struct linux_binprm *bprm);
> +int security_fs_context_init(struct fs_context *fc, struct dentry *reference);
>  int security_fs_context_dup(struct fs_context *fc, struct fs_context *src_fc);
>  int security_fs_context_parse_param(struct fs_context *fc, struct fs_parameter *param);
>  int security_sb_alloc(struct super_block *sb);
> @@ -622,6 +623,11 @@ static inline void security_bprm_committed_creds(struct linux_binprm *bprm)
>  {
>  }
>  
> +static inline int security_fs_context_init(struct fs_context *fc,
> +					   struct dentry *reference)
> +{
> +	return 0;
> +}
>  static inline int security_fs_context_dup(struct fs_context *fc,
>  					  struct fs_context *src_fc)
>  {
> diff --git a/security/security.c b/security/security.c
> index 14d30fec8a00..7b677087c4eb 100644
> --- a/security/security.c
> +++ b/security/security.c
> @@ -880,6 +880,11 @@ void security_bprm_committed_creds(struct linux_binprm *bprm)
>  	call_void_hook(bprm_committed_creds, bprm);
>  }
>  
> +int security_fs_context_init(struct fs_context *fc, struct dentry *reference)
> +{
> +	return call_int_hook(fs_context_init, 0, fc, reference);
> +}
> +
>  int security_fs_context_dup(struct fs_context *fc, struct fs_context *src_fc)
>  {
>  	return call_int_hook(fs_context_dup, 0, fc, src_fc);
> diff --git a/security/selinux/hooks.c b/security/selinux/hooks.c
> index 79573504783b..c09dcf6df2b6 100644
> --- a/security/selinux/hooks.c
> +++ b/security/selinux/hooks.c
> @@ -2765,6 +2765,32 @@ static int selinux_umount(struct vfsmount *mnt, int flags)
>  				   FILESYSTEM__UNMOUNT, NULL);
>  }
>  
> +static int selinux_fs_context_init(struct fs_context *fc,
> +				   struct dentry *reference)
> +{
> +	const struct superblock_security_struct *sbsec;
> +	const struct inode_security_struct *root_isec;
> +	struct selinux_mnt_opts *opts;
> +
> +	if (fc->purpose == FS_CONTEXT_FOR_SUBMOUNT) {
> +		opts = kzalloc(sizeof(*opts), GFP_KERNEL);
> +		if (!opts)
> +			return -ENOMEM;
> +
> +		root_isec = backing_inode_security(reference->d_sb->s_root);
> +		sbsec = selinux_superblock(reference->d_sb);
> +		if (sbsec->flags & FSCONTEXT_MNT)
> +			opts->fscontext_sid	= sbsec->sid;
> +		if (sbsec->flags & CONTEXT_MNT)
> +			opts->context_sid	= sbsec->mntpoint_sid;
> +		if (sbsec->flags & DEFCONTEXT_MNT)
> +			opts->defcontext_sid	= sbsec->def_sid;
> +		fc->security = opts;
> +	}
> +
> +	return 0;
> +}
> +
>  static int selinux_fs_context_dup(struct fs_context *fc,
>  				  struct fs_context *src_fc)
>  {
> @@ -7236,6 +7262,7 @@ static struct security_hook_list selinux_hooks[] __lsm_ro_after_init = {
>  	/*
>  	 * PUT "CLONING" (ACCESSING + ALLOCATING) HOOKS HERE
>  	 */
> +	LSM_HOOK_INIT(fs_context_init, selinux_fs_context_init),
>  	LSM_HOOK_INIT(fs_context_dup, selinux_fs_context_dup),
>  	LSM_HOOK_INIT(fs_context_parse_param, selinux_fs_context_parse_param),
>  	LSM_HOOK_INIT(sb_eat_lsm_opts, selinux_sb_eat_lsm_opts),
> diff --git a/security/smack/smack_lsm.c b/security/smack/smack_lsm.c
> index 001831458fa2..8665428481d3 100644
> --- a/security/smack/smack_lsm.c
> +++ b/security/smack/smack_lsm.c
> @@ -612,6 +612,59 @@ static int smack_add_opt(int token, const char *s, void **mnt_opts)
>  	return -EINVAL;
>  }
>  
> +/**
> + * smack_fs_context_init - Initialise security data for a filesystem context
> + * @fc: The filesystem context.
> + * @reference: Reference dentry (automount/reconfigure) or NULL
> + *
> + * Returns 0 on success or -ENOMEM on error.
> + */
> +static int smack_fs_context_init(struct fs_context *fc,
> +				 struct dentry *reference)
> +{
> +	struct superblock_smack *sbsp;
> +	struct smack_mnt_opts *ctx;
> +	struct inode_smack *isp;
> +
> +	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
> +	if (!ctx)
> +		return -ENOMEM;
> +	fc->security = ctx;
> +
> +	if (fc->purpose == FS_CONTEXT_FOR_SUBMOUNT) {
> +		sbsp = smack_superblock(reference->d_sb);
> +		isp = smack_inode(reference->d_sb->s_root->d_inode);
> +
> +		if (sbsp->smk_default) {
> +			ctx->fsdefault = kstrdup(sbsp->smk_default->smk_known, GFP_KERNEL);
> +			if (!ctx->fsdefault)
> +				return -ENOMEM;
> +		}
> +
> +		if (sbsp->smk_floor) {
> +			ctx->fsfloor = kstrdup(sbsp->smk_floor->smk_known, GFP_KERNEL);
> +			if (!ctx->fsfloor)
> +				return -ENOMEM;
> +		}
> +
> +		if (sbsp->smk_hat) {
> +			ctx->fshat = kstrdup(sbsp->smk_hat->smk_known, GFP_KERNEL);
> +			if (!ctx->fshat)
> +				return -ENOMEM;
> +		}
> +
> +		if (isp->smk_flags & SMK_INODE_TRANSMUTE) {
> +			if (sbsp->smk_root) {
> +				ctx->fstransmute = kstrdup(sbsp->smk_root->smk_known, GFP_KERNEL);
> +				if (!ctx->fstransmute)
> +					return -ENOMEM;

Just curious, how's freeing that worked for this case? Is all of that
memory dropped in ops->free() somehow?
