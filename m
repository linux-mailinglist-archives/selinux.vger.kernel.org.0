Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC3A26330D7
	for <lists+selinux@lfdr.de>; Tue, 22 Nov 2022 00:42:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232023AbiKUXmp (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Mon, 21 Nov 2022 18:42:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232025AbiKUXmP (ORCPT
        <rfc822;selinux@vger.kernel.org>); Mon, 21 Nov 2022 18:42:15 -0500
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0C96DDFA4
        for <selinux@vger.kernel.org>; Mon, 21 Nov 2022 15:41:32 -0800 (PST)
Received: by mail-pf1-x430.google.com with SMTP id 140so12762991pfz.6
        for <selinux@vger.kernel.org>; Mon, 21 Nov 2022 15:41:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zZc5xOP0xJFdkWXLW4Eh/g4pOZDZTjhdnyoqBFnt7HE=;
        b=jNx+HyVlbe/WRUrPdLAtxuIfOIMsgVI4ZaDCOO44XHmIolfTb+INLlJKz8tdLq+nqS
         J3IbGMH3IFSwq4Dfs85xCc21Gz7CgRkDgfNjLpcRUm8YIKFId9K0951jzYNemy+bY0vU
         mfTMwsOnG1epdDm84gswuKxBCblcJcAf0GlElKhqMJExgupt3aFgNAur5R2ocPLXScin
         mcNPmdUUpm2ikx4BJjBRMAfD1LOiJz7utyg5AmNvJnnXDpBcrfp40W23Nq5rR4IlofYo
         AfUEPweAnBMqsGrsakOiWUSPQ+ZL1mUlmsG+WX0OXoi8VI30SMj10JY2V8Fm4SAlmI/1
         uvDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zZc5xOP0xJFdkWXLW4Eh/g4pOZDZTjhdnyoqBFnt7HE=;
        b=SNaoJ3pWwv6bh0aa1G5cXobOFb1yZEKYI9iEblmvRsjJqhTp0UN7AyhaFoC8n3sbEP
         yT2auePzd+r+7JUPYVDXcCxV5IBAAD4Z3WtYNgVgg8Nz6WlWSLQqx/H2Opyy9zcgfq+p
         DZUQWLAWmbQA8q/Zlr95R+Zntf/znZRhHvNBPo2vKFmVsllMcuyMNYHgvzJVzrhufD9u
         ecZBGLdXl1SAlfrD8Yb6PPDOC0IYgzS/fXiN9Oh+8cNcMUS729qyzpsJH5fl48q3ISdC
         DvO2CaC/r8AX0HpNSxIjOPlIDU+41K/LYjxaTx12fZ33pYdhscccNKVwlwk9dtg1nZtB
         KCsA==
X-Gm-Message-State: ANoB5pmqkfxhxWMody9VjzFxRulZCaWO3kSoh9b0UMSVRsW6vETh+Rw0
        DT/ZerLzlRlu5Cu2Ak6sY/xoN4+WXdoeNUbZoThW
X-Google-Smtp-Source: AA0mqf5sBQNs28sOBqrnhm1swUcszLklYtHexIa7tffAXM23323DKBFj1U6ylewxwYn+kM0hFFlZjc7knH3ByZlnilU=
X-Received: by 2002:a63:1f63:0:b0:460:ec46:3645 with SMTP id
 q35-20020a631f63000000b00460ec463645mr20336089pgm.92.1669074088835; Mon, 21
 Nov 2022 15:41:28 -0800 (PST)
MIME-Version: 1.0
References: <20221110094639.3086409-1-roberto.sassu@huaweicloud.com> <20221110094639.3086409-2-roberto.sassu@huaweicloud.com>
In-Reply-To: <20221110094639.3086409-2-roberto.sassu@huaweicloud.com>
From:   Paul Moore <paul@paul-moore.com>
Date:   Mon, 21 Nov 2022 18:41:17 -0500
Message-ID: <CAHC9VhQ9WftDrF1R--ZYJXOv-YbVU-Pr1Ob_deDwEWm8OcQ-TA@mail.gmail.com>
Subject: Re: [PATCH v4 1/5] reiserfs: Add missing calls to reiserfs_security_free()
To:     Roberto Sassu <roberto.sassu@huaweicloud.com>
Cc:     zohar@linux.ibm.com, dmitry.kasatkin@gmail.com, jmorris@namei.org,
        serge@hallyn.com, stephen.smalley.work@gmail.com,
        eparis@parisplace.org, casey@schaufler-ca.com,
        linux-integrity@vger.kernel.org,
        linux-security-module@vger.kernel.org, selinux@vger.kernel.org,
        reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org,
        keescook@chromium.org, nicolas.bouchinet@clip-os.org,
        Roberto Sassu <roberto.sassu@huawei.com>,
        stable@vger.kernel.org, Jeff Mahoney <jeffm@suse.com>,
        Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Thu, Nov 10, 2022 at 4:47 AM Roberto Sassu
<roberto.sassu@huaweicloud.com> wrote:
>
> From: Roberto Sassu <roberto.sassu@huawei.com>
>
> Commit 57fe60df6241 ("reiserfs: add atomic addition of selinux attributes
> during inode creation") defined reiserfs_security_free() to free the name
> and value of a security xattr allocated by the active LSM through
> security_old_inode_init_security(). However, this function is not called
> in the reiserfs code.
>
> Thus, add a call to reiserfs_security_free() whenever
> reiserfs_security_init() is called, and initialize value to NULL, to avoid
> to call kfree() on an uninitialized pointer.
>
> Finally, remove the kfree() for the xattr name, as it is not allocated
> anymore.
>
> Fixes: 57fe60df6241 ("reiserfs: add atomic addition of selinux attributes during inode creation")
> Cc: stable@vger.kernel.org
> Cc: Jeff Mahoney <jeffm@suse.com>
> Cc: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
> Reported-by: Mimi Zohar <zohar@linux.ibm.com>
> Reported-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
> Signed-off-by: Roberto Sassu <roberto.sassu@huawei.com>
> ---
>  fs/reiserfs/namei.c          | 4 ++++
>  fs/reiserfs/xattr_security.c | 2 +-
>  2 files changed, 5 insertions(+), 1 deletion(-)

If I'm understanding this patch correctly, this is a standalone
bugfix, right?  Any reason this shouldn't be merged now, independent
of the rest of patches in this patchset?

> diff --git a/fs/reiserfs/namei.c b/fs/reiserfs/namei.c
> index 3d7a35d6a18b..b916859992ec 100644
> --- a/fs/reiserfs/namei.c
> +++ b/fs/reiserfs/namei.c
> @@ -696,6 +696,7 @@ static int reiserfs_create(struct user_namespace *mnt_userns, struct inode *dir,
>
>  out_failed:
>         reiserfs_write_unlock(dir->i_sb);
> +       reiserfs_security_free(&security);
>         return retval;
>  }
>
> @@ -779,6 +780,7 @@ static int reiserfs_mknod(struct user_namespace *mnt_userns, struct inode *dir,
>
>  out_failed:
>         reiserfs_write_unlock(dir->i_sb);
> +       reiserfs_security_free(&security);
>         return retval;
>  }
>
> @@ -878,6 +880,7 @@ static int reiserfs_mkdir(struct user_namespace *mnt_userns, struct inode *dir,
>         retval = journal_end(&th);
>  out_failed:
>         reiserfs_write_unlock(dir->i_sb);
> +       reiserfs_security_free(&security);
>         return retval;
>  }
>
> @@ -1194,6 +1197,7 @@ static int reiserfs_symlink(struct user_namespace *mnt_userns,
>         retval = journal_end(&th);
>  out_failed:
>         reiserfs_write_unlock(parent_dir->i_sb);
> +       reiserfs_security_free(&security);
>         return retval;
>  }
>
> diff --git a/fs/reiserfs/xattr_security.c b/fs/reiserfs/xattr_security.c
> index 8965c8e5e172..857a65b05726 100644
> --- a/fs/reiserfs/xattr_security.c
> +++ b/fs/reiserfs/xattr_security.c
> @@ -50,6 +50,7 @@ int reiserfs_security_init(struct inode *dir, struct inode *inode,
>         int error;
>
>         sec->name = NULL;
> +       sec->value = NULL;
>
>         /* Don't add selinux attributes on xattrs - they'll never get used */
>         if (IS_PRIVATE(dir))
> @@ -95,7 +96,6 @@ int reiserfs_security_write(struct reiserfs_transaction_handle *th,
>
>  void reiserfs_security_free(struct reiserfs_security_handle *sec)
>  {
> -       kfree(sec->name);
>         kfree(sec->value);
>         sec->name = NULL;
>         sec->value = NULL;
> --
> 2.25.1
>


-- 
paul-moore.com
