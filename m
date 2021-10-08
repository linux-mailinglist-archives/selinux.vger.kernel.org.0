Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72A824272E4
	for <lists+selinux@lfdr.de>; Fri,  8 Oct 2021 23:13:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243339AbhJHVOx (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Fri, 8 Oct 2021 17:14:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231721AbhJHVOt (ORCPT
        <rfc822;selinux@vger.kernel.org>); Fri, 8 Oct 2021 17:14:49 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C33DC061570
        for <selinux@vger.kernel.org>; Fri,  8 Oct 2021 14:12:53 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id y12so27969911eda.4
        for <selinux@vger.kernel.org>; Fri, 08 Oct 2021 14:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EbVIsJCQSO+vbMr39E67OTfH62jkz85HI8YV0eMVgIY=;
        b=T7Z+PBZZ38/6eeh/G0tV6G+yxjOETQG+WszM1muqiScaLBeF+ZqJusgY97w/t0aTO3
         +MI1AGLBQEIWws+2qXERwclzdSHvOyGM7RvutJ6OjcI7wphFhBL8D5d5R9wT+v/lKNUB
         RPO1tE0qnxQiqKveu0tAXLppvxkNPbIAXXLwxZmmyTdBM2cKXrAx05BsmTQiQWyiKieo
         8UluRsflN+2B2C34sdt78fRGMCCkYjzFOnqjur3cgIrnOhZXe2MMxQHhg+TLsVrM2pDw
         DT5a17au43scpkF9zLSKfbSqon56fcuuQng06yVjEfMY5U05F0x/WSFA6+HITs3i5nPO
         Kjdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EbVIsJCQSO+vbMr39E67OTfH62jkz85HI8YV0eMVgIY=;
        b=i/0GPN7nCoMgRhXcM7owS6/UNDDRATloBiubbb2b7aLWnnyXHZZNrVvAHO0NwzKu89
         3pyVa1PjY26VsRXejHXAmgG6/WR7YhnGSqeNSSt1loZNLg5wpoVCk/9ivxt75iE/7MQ4
         DJaPS0S4scf3XcoueXAJOZCpzbahnV/EQMLDwgriICK13ZlZYtS/ctAHISqonP0WwXlN
         FNcHlxFgclwfgjDjCapZDBWijyZHDpa2s8UQsY/yLOKA1IKch7LW/cGjG71o5g7j40Yz
         BzqC4gkyyRX7PwzfsgDgzgbEt8bgTikDNwLBIFNkL9f2RmPIBvc+aTfXHZ9CBqXI6dbQ
         cU3Q==
X-Gm-Message-State: AOAM533HumxdrWKQzgTq/tfvJVGK6T85ug5irruqYaCBOR5K/ONubrJn
        11f6KW0d64Ym4YHemee2bHs50FkkADrLejuELBvr
X-Google-Smtp-Source: ABdhPJxgroJYCNaXqAYWnw5dFNkqDUN49FqbTznbw+BDWQCcH7lTpM7uryrWhhByaIb7UK+S2FmjYrhHEtPE4oeuQhs=
X-Received: by 2002:a17:907:7601:: with SMTP id jx1mr7240204ejc.69.1633727571022;
 Fri, 08 Oct 2021 14:12:51 -0700 (PDT)
MIME-Version: 1.0
References: <20211007004629.1113572-1-tkjos@google.com> <20211007004629.1113572-4-tkjos@google.com>
In-Reply-To: <20211007004629.1113572-4-tkjos@google.com>
From:   Paul Moore <paul@paul-moore.com>
Date:   Fri, 8 Oct 2021 17:12:39 -0400
Message-ID: <CAHC9VhTRTcZW9eyXXvAN7T=ZCQ_zwH5iBz+d0h2ntf7=XHE-Vw@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] binder: use euid from cred instead of using task
To:     Todd Kjos <tkjos@google.com>, casey@schaufler-ca.com
Cc:     gregkh@linuxfoundation.org, arve@android.com, tkjos@android.com,
        maco@android.com, christian@brauner.io,
        James Morris <jmorris@namei.org>,
        Serge Hallyn <serge@hallyn.com>,
        Stephen Smalley <stephen.smalley.work@gmail.com>,
        Eric Paris <eparis@parisplace.org>, keescook@chromium.org,
        jannh@google.com, Jeffrey Vander Stoep <jeffv@google.com>,
        zohar@linux.ibm.com, linux-security-module@vger.kernel.org,
        selinux@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org, joel@joelfernandes.org,
        kernel-team@android.com, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Wed, Oct 6, 2021 at 8:46 PM Todd Kjos <tkjos@google.com> wrote:
>
> Set a transaction's sender_euid from the 'struct cred'
> saved at binder_open() instead of looking up the euid
> from the binder proc's 'struct task'. This ensures
> the euid is associated with the security context that
> of the task that opened binder.
>
> Fixes: 457b9a6f09f0 ("Staging: android: add binder driver")
> Signed-off-by: Todd Kjos <tkjos@google.com>
> Suggested-by: Stephen Smalley <stephen.smalley.work@gmail.com>
> Cc: stable@vger.kernel.org # 4.4+
> ---
> v3: added this patch to series
>
>  drivers/android/binder.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

This is an interesting ordering of the patches.  Unless I'm missing
something I would have expected patch 3/3 to come first, followed by
2/3, with patch 1/3 at the end; basically the reverse of what was
posted here.

My reading of the previous thread was that Casey has made his peace
with these changes so unless anyone has any objections I'll plan on
merging 2/3 and 3/3 into selinux/stable-5.15 and merging 1/3 into
selinux/next.

> diff --git a/drivers/android/binder.c b/drivers/android/binder.c
> index 989afd0804ca..26382e982c5e 100644
> --- a/drivers/android/binder.c
> +++ b/drivers/android/binder.c
> @@ -2711,7 +2711,7 @@ static void binder_transaction(struct binder_proc *proc,
>                 t->from = thread;
>         else
>                 t->from = NULL;
> -       t->sender_euid = task_euid(proc->tsk);
> +       t->sender_euid = proc->cred->euid;
>         t->to_proc = target_proc;
>         t->to_thread = target_thread;
>         t->code = tr->code;
> --
> 2.33.0.800.g4c38ced690-goog

--
paul moore
www.paul-moore.com
