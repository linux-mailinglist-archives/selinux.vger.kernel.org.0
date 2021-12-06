Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F372468F57
	for <lists+selinux@lfdr.de>; Mon,  6 Dec 2021 03:45:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234932AbhLFCso (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Sun, 5 Dec 2021 21:48:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234922AbhLFCsn (ORCPT
        <rfc822;selinux@vger.kernel.org>); Sun, 5 Dec 2021 21:48:43 -0500
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B647AC0613F8
        for <selinux@vger.kernel.org>; Sun,  5 Dec 2021 18:45:15 -0800 (PST)
Received: by mail-ed1-x52c.google.com with SMTP id z5so37242222edd.3
        for <selinux@vger.kernel.org>; Sun, 05 Dec 2021 18:45:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wAqLEhawabMbQV194y5YFmZq2jiOl3Yl5uRuU1ILn/c=;
        b=E5qnU4tVTah85BsdBfEOSw8FvPnK0S2mHV4cqaySt2ugRRQ9RJz0RjTQ3jtsXRcg0T
         B8oE0Be0HDi65rxNyEsGA7fGY93pmUuaptb4LnK/oanKBGiOj+PZbdR4kAfvDSn+ACnD
         qjLAruh1qWxbXQ5aRfd2XeXmlaXJ8Ea8yJxCJ5Hd97wa0cWLEN+xUCTThKLbqArl2XTc
         3nje08+L8SZ25fCoIn7hjFIsBko6pXGK0IBrjRFMZki8ePUfD2Vxjw7XBpACYvFxgZoc
         exWY6w1wHXQqDwcHsNqf7MXGEoQCZoXhL79TqjipWv7zT/1+JaTG7TAA6LrloVtwJnXJ
         tm6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wAqLEhawabMbQV194y5YFmZq2jiOl3Yl5uRuU1ILn/c=;
        b=uRu/MRgw1XzRminwVplH67grPwp+jTncrlPwW8OxH4FlnyZ5tWEV5cJP2wsFWE2U5n
         XyD6fO61zvxKCmlPW6nyZLj570TqVpKaiRwzfzQL4j9JW9ziOOADapy5SVUNkjxp14WJ
         mMoD5hPFfUr4nU2/q2sY+dpHwadjVXVuNVfGm2LbZjgTLGKq/tLhE8lo0TU+9wDOAqVE
         FfdR0ofAVV1JVtDjEC1Os+SZiQkOCC84C/YJmC/B9V4fT5JdZwzhLutZzbUYayu7nZtp
         lIjbzVjV65Wp8bjzs+MFR98RDKDdkmcqaUQqORe1IM3lh+oFX21yNSDtRzFT1HNmrdNM
         11LA==
X-Gm-Message-State: AOAM531hu7OXpIlwNEBwS3+YxpxBYM/9fDe7JQpS7A80qpvULGCib+Kf
        gdxsSi5zkiHOBNw4VCQZHxQablHRlkYO3mGNfoZd
X-Google-Smtp-Source: ABdhPJzUhTmcpWp+XkxysnbAKVRGWDWT+G+5mAL1GAUbzyGljvtUoDC5K0rY89HkFvjdEPc1fkJ2KYEXpZ73b/o9pKw=
X-Received: by 2002:a05:6402:4311:: with SMTP id m17mr50512266edc.103.1638758714336;
 Sun, 05 Dec 2021 18:45:14 -0800 (PST)
MIME-Version: 1.0
References: <20211124014332.36128-1-casey@schaufler-ca.com> <20211124014332.36128-25-casey@schaufler-ca.com>
In-Reply-To: <20211124014332.36128-25-casey@schaufler-ca.com>
From:   Paul Moore <paul@paul-moore.com>
Date:   Sun, 5 Dec 2021 21:45:03 -0500
Message-ID: <CAHC9VhS+jaTFbca7OFxoZ6uoUyaRoxjtm0m-K92px=61XUja5Q@mail.gmail.com>
Subject: Re: [PATCH v30 24/28] Audit: Add framework for auxiliary records
To:     Casey Schaufler <casey@schaufler-ca.com>
Cc:     casey.schaufler@intel.com, jmorris@namei.org,
        linux-security-module@vger.kernel.org, selinux@vger.kernel.org,
        linux-audit@redhat.com, keescook@chromium.org,
        john.johansen@canonical.com, penguin-kernel@i-love.sakura.ne.jp,
        sds@tycho.nsa.gov, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Tue, Nov 23, 2021 at 9:10 PM Casey Schaufler <casey@schaufler-ca.com> wrote:
>
> Add a list for auxiliary record data to the audit_buffer structure.
> Add the audit_stamp information to the audit_buffer as there's no
> guarantee that there will be an audit_context containing the stamp
> associated with the event. At audit_log_end() time create auxiliary
> records (none are currently defined) as have been added to the list.
>
> Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
> ---
>  kernel/audit.c   | 85 ++++++++++++++++++++++++++++++++++++++++++------
>  kernel/audit.h   |  1 +
>  kernel/auditsc.c |  2 ++
>  3 files changed, 78 insertions(+), 10 deletions(-)

...

> diff --git a/kernel/audit.c b/kernel/audit.c
> index 069cd4c81a61..2b22498d3532 100644
> --- a/kernel/audit.c
> +++ b/kernel/audit.c
> @@ -2393,6 +2403,61 @@ void audit_log_end(struct audit_buffer *ab)
>                 wake_up_interruptible(&kauditd_wait);
>         } else
>                 audit_log_lost("rate limit exceeded");
> +}
> +
> +/**
> + * audit_log_end - end one audit record
> + * @ab: the audit_buffer
> + *
> + * Let __audit_log_end() handle the message while the buffer housekeeping
> + * is done here.
> + * If there are other records that have been deferred for the event
> + * create them here.
> + */
> +void audit_log_end(struct audit_buffer *ab)
> +{
> +       struct audit_context_entry *entry;
> +       struct audit_context mcontext;
> +       struct audit_context *mctx;
> +       struct audit_buffer *mab;
> +       struct list_head *l;
> +       struct list_head *n;
> +
> +       if (!ab)
> +               return;
> +
> +       __audit_log_end(ab);
> +
> +       if (list_empty(&ab->aux_records)) {
> +               audit_buffer_free(ab);
> +               return;
> +       }
> +
> +       if (ab->ctx == NULL) {
> +               mcontext.context = AUDIT_CTX_AUXRECORD;

More on this below, but I don't think we need, or want, the line above.

> diff --git a/kernel/audit.h b/kernel/audit.h
> index 56560846f3b0..f87da8e0a5a4 100644
> --- a/kernel/audit.h
> +++ b/kernel/audit.h
> @@ -112,6 +112,7 @@ struct audit_context {
>                 AUDIT_CTX_UNUSED,       /* audit_context is currently unused */
>                 AUDIT_CTX_SYSCALL,      /* in use by syscall */
>                 AUDIT_CTX_URING,        /* in use by io_uring */
> +               AUDIT_CTX_AUXRECORD,    /* in use for auxiliary records */
>         } context;

We shouldn't need to do this here, and I wouldn't recommend this as a
solution even if we were running into problems in audit_log_exit().
The "context" field in the audit_context struct is to identify the
execution context of the task which is generating the audit record(s).

I'm trying to think of a case in this patchset where you would find
"audit_context->context == AUDIT_CTX_AUXRECORD" and I keep coming up
blank, are you certain you hit that case with the code you posted
here?  If so, could you help me understand that situation?

--
paul moore
www.paul-moore.com
