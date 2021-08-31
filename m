Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46EB03FCA4D
	for <lists+selinux@lfdr.de>; Tue, 31 Aug 2021 16:45:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239130AbhHaOqJ (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Tue, 31 Aug 2021 10:46:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232214AbhHaOp2 (ORCPT
        <rfc822;selinux@vger.kernel.org>); Tue, 31 Aug 2021 10:45:28 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90068C0612A4
        for <selinux@vger.kernel.org>; Tue, 31 Aug 2021 07:44:17 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id dm15so27189541edb.10
        for <selinux@vger.kernel.org>; Tue, 31 Aug 2021 07:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZgczlerqsLLyl2VhT0frihVj435uIvC1cuXaGZGKBOI=;
        b=vZnH7ZNB8UX++P9uCn5rQiuS1KJDPUjiSAvxsYaqrGtgX4eBg7GHDhggOyskZpJCNJ
         l54tySrGWs+VGlp2ibgfUetYZO5z9JWmsqcqQAbA4fNx6dgMzZ4yGFUi42SXqCROzi3g
         FS9XZXeeyeyvrgx57qZFe/82GbC4fNokogIHI8XnksgwLntZT9VJnnqkWrKuW75Cnvsf
         +7e1G9kohqRq+nrQHuIAj87Tghsw3vDATIqBceH6jYq1aOqfVXsPdLVX3WaBcQK3GN4p
         c6550BzBTBRy+H9PqzgSx+/D8kyYY8+KbY3RT+uhXQYjsXUqt063Wwk7D37opRPywhBH
         PkzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZgczlerqsLLyl2VhT0frihVj435uIvC1cuXaGZGKBOI=;
        b=sq8lFu2Uc4o/AyctLXMrqFzi/XCSNCSm1o30O6FgotAJoPrSmh1VMewhPwPpOQ6W8+
         5zOdYCiTVIDlSKldQQmxKThLzGeV9Uh8YdT7OXNWLohujfdWHfSqrSOZLobNWTcE1TTZ
         dbznzcRM1vWWQAqaL+NbtbVIsr+8XZ60XK+dy6jq4I2kfgmo7J32dIeC8OaspkaqBKgF
         WK3zbmfRpM5JzNPZTT+Rwdfd31JafN5L9gg87j0525uzFf07rwpB0LWLKVUkGkCibXUu
         AEigYH8kat2b0wJs+rH49NhLt3XDYT3Cz5lTP1MrcXigMQuCFMwS4wObNED2kQFX/ggt
         LhFw==
X-Gm-Message-State: AOAM533/DMVzK46w3zGWwWnlQrYH0J0aIpLjVMW/LV+FSw/DaH3+3ajx
        rJYj21IrYvqylJRN0Ztg3nceqpQjJmp+PdBrfPAF
X-Google-Smtp-Source: ABdhPJxbttl+pKPJFUUvqGQMjsVPM20zpWUvXsGRTjRdvPPkDxQWNi7BI9HiCjmjrGOfcCWQfO3dlyXR34/S8Enb9H4=
X-Received: by 2002:a50:ed09:: with SMTP id j9mr29852978eds.164.1630421056093;
 Tue, 31 Aug 2021 07:44:16 -0700 (PDT)
MIME-Version: 1.0
References: <162871480969.63873.9434591871437326374.stgit@olly> <162871494794.63873.18299137802334845525.stgit@olly>
In-Reply-To: <162871494794.63873.18299137802334845525.stgit@olly>
From:   Paul Moore <paul@paul-moore.com>
Date:   Tue, 31 Aug 2021 10:44:05 -0400
Message-ID: <CAHC9VhSPW0R=AQGCaz9HNO5mXmCtscto-7O=9Af9B_EuCa5W=A@mail.gmail.com>
Subject: Re: [RFC PATCH v2 9/9] Smack: Brutalist io_uring support with debug
To:     casey@schaufler-ca.com
Cc:     linux-security-module@vger.kernel.org, selinux@vger.kernel.org,
        linux-audit@redhat.com, io-uring@vger.kernel.org,
        linux-fsdevel@vger.kernel.org,
        Kumar Kartikeya Dwivedi <memxor@gmail.com>,
        Jens Axboe <axboe@kernel.dk>,
        Pavel Begunkov <asml.silence@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Wed, Aug 11, 2021 at 4:49 PM Paul Moore <paul@paul-moore.com> wrote:
>
> From: Casey Schaufler <casey@schaufler-ca.com>
>
> Add Smack privilege checks for io_uring. Use CAP_MAC_OVERRIDE
> for the override_creds case and CAP_MAC_ADMIN for creating a
> polling thread. These choices are based on conjecture regarding
> the intent of the surrounding code.
>
> Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
> [PM: make the smack_uring_* funcs static]
> Signed-off-by: Paul Moore <paul@paul-moore.com>
>
> ---
> v2:
> - made the smack_uring_* funcs static
> v1:
> - initial draft
> ---
>  security/smack/smack_lsm.c |   64 ++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 64 insertions(+)
>
> diff --git a/security/smack/smack_lsm.c b/security/smack/smack_lsm.c
> index 223a6da0e6dc..7fb094098f38 100644
> --- a/security/smack/smack_lsm.c
> +++ b/security/smack/smack_lsm.c
> @@ -4691,6 +4691,66 @@ static int smack_dentry_create_files_as(struct dentry *dentry, int mode,
>         return 0;
>  }
>
> +#ifdef CONFIG_IO_URING
> +/**
> + * smack_uring_override_creds - Is io_uring cred override allowed?
> + * @new: the target creds
> + *
> + * Check to see if the current task is allowed to override it's credentials
> + * to service an io_uring operation.
> + */
> +static int smack_uring_override_creds(const struct cred *new)
> +{
> +       struct task_smack *tsp = smack_cred(current_cred());
> +       struct task_smack *nsp = smack_cred(new);
> +
> +#if 1
> +       if (tsp->smk_task == nsp->smk_task)
> +               pr_info("%s: Smack matches %s\n", __func__,
> +                       tsp->smk_task->smk_known);
> +       else
> +               pr_info("%s: Smack override check %s to %s\n", __func__,
> +                       tsp->smk_task->smk_known, nsp->smk_task->smk_known);
> +#endif

Casey, with the idea of posting a v3 towards the end of the merge
window next week, without the RFC tag and with the intention of
merging it into -next during the first/second week of the -rcX phase,
do you have any objections to me removing the debug code (#if 1 ...
#endif) from your patch?  Did you have any other changes?


--
paul moore
www.paul-moore.com
