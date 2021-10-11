Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D95684298F6
	for <lists+selinux@lfdr.de>; Mon, 11 Oct 2021 23:33:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235294AbhJKVff (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Mon, 11 Oct 2021 17:35:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230114AbhJKVfe (ORCPT
        <rfc822;selinux@vger.kernel.org>); Mon, 11 Oct 2021 17:35:34 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E389EC061570
        for <selinux@vger.kernel.org>; Mon, 11 Oct 2021 14:33:33 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id w19so12880631edd.2
        for <selinux@vger.kernel.org>; Mon, 11 Oct 2021 14:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GGoeVfz6OToFDd2j2G5lbQgP/Z/GdhCpDi+ufur7oeE=;
        b=Mq0m5Xj0EIW9KQayGt47Wid8m2/y3C0+he9zd+pv9/BVQrByW2jeqsDk26w8giHJFp
         RyBPr79fPF2JLVPMFCgdiV9TYRAOAR8li5ucmX7NCHHokbh2xqjr11yAzW0uh4zTeFHS
         5srV58tAbEENRyCVmS6rTeyrgWzw5wZpL9KwPXBMsOicKR53b7hrdYGjlStYNJzjrwII
         a9jrE2ND8gNxujmSrVfvwX9vPFWJGRBCcT4/c/qVDGZwvBE3POvfs87DlVxSSYX9PkQ5
         7E+ID/16RUI0DjtyQyGjSUylCBXioY+y+swnoWsugIa6bCSwukf/U7XxX2s433TYf8WQ
         RdGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GGoeVfz6OToFDd2j2G5lbQgP/Z/GdhCpDi+ufur7oeE=;
        b=KzMylFZU5792ixUi+7kKNamE7r1yuiv6IjbHIFsLTskASPgYchrMauLNvSCn0+0syN
         f/64JDJNBau7R3n1vNuhCNsG8caHiZzamTkMCazgwvTbkmxuYX4xWaJrQQjboYqeHtpO
         mhiTdEYYF8ozFJ2fmOHhFLvYnHhYdxkljEFatOPiKpHqDIUfMVzOgmp/Kvu+v+LdBQoR
         Xip5weu9rha7IVC9LDiGT8Wa+sMKtLRUYTSY3l2GHDELXA5ij6s5UzO5Kpg7zO4iM5QJ
         tujmC/A2GZMBFe4emRooyyt3OADnJStXi7lMqnElxMSRUHDWS0YvUOo0K1TIB52+TGYN
         /4Pg==
X-Gm-Message-State: AOAM531LFbIpGH7r6l5P7ycURbwk/vTuxWMqvU4CgVb8GnTZJsJLbPMF
        XuqhLBp7kop2FOqW9W4mxTDutXON9lTxz9VlgQCv/UrdqQ==
X-Google-Smtp-Source: ABdhPJx9AGRTTYFCiQKOTA6jSrrQf8NQGirG9ufQKc9MzXqqtVvRPEka65LpUbML3Hzub2vP+riRnQA01bq2XN6Yfr4=
X-Received: by 2002:a50:e1cd:: with SMTP id m13mr45973619edl.93.1633988012430;
 Mon, 11 Oct 2021 14:33:32 -0700 (PDT)
MIME-Version: 1.0
References: <20211007004629.1113572-1-tkjos@google.com> <20211007004629.1113572-3-tkjos@google.com>
In-Reply-To: <20211007004629.1113572-3-tkjos@google.com>
From:   Paul Moore <paul@paul-moore.com>
Date:   Mon, 11 Oct 2021 17:33:21 -0400
Message-ID: <CAHC9VhSDnwapGk6Pvn5iuKv0zCtZSbfnGAkZwKcxVYLVRH6CLg@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] binder: use cred instead of task for getsecid
To:     Todd Kjos <tkjos@google.com>
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
        kernel-team@android.com, kernel test robot <lkp@intel.com>,
        stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Wed, Oct 6, 2021 at 8:46 PM Todd Kjos <tkjos@google.com> wrote:
>
> Use the 'struct cred' saved at binder_open() to lookup
> the security ID via security_cred_getsecid(). This
> ensures that the security context that opened binder
> is the one used to generate the secctx.
>
> Fixes: ec74136ded79 ("binder: create node flag to request sender's
> security context")
> Signed-off-by: Todd Kjos <tkjos@google.com>
> Suggested-by: Stephen Smalley <stephen.smalley.work@gmail.com>
> Reported-by: kernel test robot <lkp@intel.com>
> Cc: stable@vger.kernel.org # 5.4+
> ---
> v3: added this patch to series
> v4: fix build-break for !CONFIG_SECURITY
>
>  drivers/android/binder.c | 11 +----------
>  include/linux/security.h |  4 ++++
>  2 files changed, 5 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/android/binder.c b/drivers/android/binder.c
> index ca599ebdea4a..989afd0804ca 100644
> --- a/drivers/android/binder.c
> +++ b/drivers/android/binder.c
> @@ -2722,16 +2722,7 @@ static void binder_transaction(struct binder_proc *proc,
>                 u32 secid;
>                 size_t added_size;
>
> -               /*
> -                * Arguably this should be the task's subjective LSM secid but
> -                * we can't reliably access the subjective creds of a task
> -                * other than our own so we must use the objective creds, which
> -                * are safe to access.  The downside is that if a task is
> -                * temporarily overriding it's creds it will not be reflected
> -                * here; however, it isn't clear that binder would handle that
> -                * case well anyway.
> -                */
> -               security_task_getsecid_obj(proc->tsk, &secid);
> +               security_cred_getsecid(proc->cred, &secid);
>                 ret = security_secid_to_secctx(secid, &secctx, &secctx_sz);
>                 if (ret) {
>                         return_error = BR_FAILED_REPLY;
> diff --git a/include/linux/security.h b/include/linux/security.h
> index 6344d3362df7..f02cc0211b10 100644
> --- a/include/linux/security.h
> +++ b/include/linux/security.h
> @@ -1041,6 +1041,10 @@ static inline void security_transfer_creds(struct cred *new,
>  {
>  }
>
> +static inline void security_cred_getsecid(const struct cred *c, u32 *secid)
> +{
> +}

Since security_cred_getsecid() doesn't return an error code we should
probably set the secid to 0 in this case, for example:

  static inline void security_cred_getsecid(...)
  {
    *secid = 0;
  }

-- 
paul moore
www.paul-moore.com
