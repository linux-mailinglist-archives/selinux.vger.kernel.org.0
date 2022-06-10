Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC4A8546EFC
	for <lists+selinux@lfdr.de>; Fri, 10 Jun 2022 23:06:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350784AbiFJVGa (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Fri, 10 Jun 2022 17:06:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348166AbiFJVG0 (ORCPT
        <rfc822;selinux@vger.kernel.org>); Fri, 10 Jun 2022 17:06:26 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C170A2A955
        for <selinux@vger.kernel.org>; Fri, 10 Jun 2022 14:06:24 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id q12-20020a17090a304c00b001e2d4fb0eb4so3388779pjl.4
        for <selinux@vger.kernel.org>; Fri, 10 Jun 2022 14:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AVhfbIukOKEVFvNF87H3xskC9Oa1vruUMas0TKGSYm0=;
        b=nUaBKVT5J8mwmiDpTKFhYMr5X6B97KvxMCWwwWjCo69v2K9ZvUkTEC5pE8DyMQG1mU
         JNFVAkbelc/drapO000q+0h0xtP5KanI5Z1wF+j0iYcWFcmL66vgbkyZsfMb0xV14Wrz
         n9YCGn9EmO0MoppPxe9cAtWTqQpvKEf9rTAcXycm8s/y2L5sMuXmXX9WI7n5pMD2V9DL
         pOw5uJ6CSSBSiiZKbwLOvzafe3tnkgR9ohmxQ/04zaTeiGXbFUxahNfU9xiBU7tQHqhv
         eR6ZN6RiS0RuxU8DIaPHvmJE/3xCM9nDZN4SQuRvqmMCezf/4MOxVabPuhq4m477txoq
         h3OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AVhfbIukOKEVFvNF87H3xskC9Oa1vruUMas0TKGSYm0=;
        b=JC4feb8JDUJOEKwHYQSoTeNyR4m/6weVf1tj/8pvbfIE8GV1C2YORxnE5XhpT7qqET
         wTpEnKNtiVNj1kY5faiZ7RJ5au6B7bFY0f1u40wD5IDoBZhZNeEWiV3JfHrU+2LmrFQK
         92HXcXeTOjeEm+RMEslBOtwxHIHaRtMYEAfN6bfgEp2dy2XnvfR8Fb1roYqKqGK1Xt0w
         niZaZdMUJ7C5/CqQvCZHVV9xe0FHLrFynNKOTQ3dau/0O3+5MSSib9YTGgKfYKqn6tRW
         JyO30IV6OY7Z1ljUTEsUqGKI90wgU868/po/DbgwnIVQeDcVOvJGYPSLosdSW5MtfxWI
         cpHg==
X-Gm-Message-State: AOAM53110amNPqEvnKfE2M4/FSAXWtM6P1EJdrCBljxRyZEejv0wT1cw
        T7XVOeJxy80nc7/TkVROf9TFZ4umKrXNaPNABv0Y
X-Google-Smtp-Source: ABdhPJzIMHgsZ4tZhpk9aRuapm/Sl7e4TCz9bkJJUYRDpM0VclwMSgMCBCsHtkFgTHE9/eqfYCAPhNwufAxTaQy/2io=
X-Received: by 2002:a17:902:f54b:b0:163:e2fd:10a5 with SMTP id
 h11-20020a170902f54b00b00163e2fd10a5mr47483065plf.28.1654895184250; Fri, 10
 Jun 2022 14:06:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220609230146.319210-1-casey@schaufler-ca.com> <20220609230146.319210-28-casey@schaufler-ca.com>
In-Reply-To: <20220609230146.319210-28-casey@schaufler-ca.com>
From:   Paul Moore <paul@paul-moore.com>
Date:   Fri, 10 Jun 2022 17:06:13 -0400
Message-ID: <CAHC9VhR4xUpe4fQrUqvUfH_zaBSzfCS2yZ62XHN2+ugKg=Kd4g@mail.gmail.com>
Subject: Re: [PATCH v36 27/33] Audit: Add record for multiple task security contexts
To:     Casey Schaufler <casey@schaufler-ca.com>
Cc:     casey.schaufler@intel.com, jmorris@namei.org,
        linux-security-module@vger.kernel.org, selinux@vger.kernel.org,
        linux-audit@redhat.com, keescook@chromium.org,
        john.johansen@canonical.com, penguin-kernel@i-love.sakura.ne.jp,
        stephen.smalley.work@gmail.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Thu, Jun 9, 2022 at 7:16 PM Casey Schaufler <casey@schaufler-ca.com> wrote:
>
> Create a new audit record AUDIT_MAC_TASK_CONTEXTS.
> An example of the MAC_TASK_CONTEXTS (1420) record is:
>
>     type=MAC_TASK_CONTEXTS[1420]
>     msg=audit(1600880931.832:113)
>     subj_apparmor=unconfined
>     subj_smack=_
>
> When an audit event includes a AUDIT_MAC_TASK_CONTEXTS record
> the "subj=" field in other records in the event will be "subj=?".
> An AUDIT_MAC_TASK_CONTEXTS record is supplied when the system has
> multiple security modules that may make access decisions based
> on a subject security context.
>
> Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
> ---
>  include/uapi/linux/audit.h |  1 +
>  kernel/audit.c             | 42 +++++++++++++++++++++++++++++++-------
>  2 files changed, 36 insertions(+), 7 deletions(-)

Acked-by: Paul Moore <paul@paul-moore.com>

-- 
paul-moore.com
