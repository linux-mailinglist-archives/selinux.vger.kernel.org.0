Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F2A6A586EA2
	for <lists+selinux@lfdr.de>; Mon,  1 Aug 2022 18:35:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233092AbiHAQfm (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Mon, 1 Aug 2022 12:35:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233106AbiHAQfS (ORCPT
        <rfc822;selinux@vger.kernel.org>); Mon, 1 Aug 2022 12:35:18 -0400
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A74038D
        for <selinux@vger.kernel.org>; Mon,  1 Aug 2022 09:35:10 -0700 (PDT)
Received: by mail-oi1-x22e.google.com with SMTP id u9so13619515oiv.12
        for <selinux@vger.kernel.org>; Mon, 01 Aug 2022 09:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=Fto1MpscWUFMNnBCFYXAwkIBHHJszVTIcxuhyhUimb8=;
        b=FI+OTAEIYz2VsoXDkzo0BCE6i9UMDcLbhJ8KfQlM/Yb9whP/Aso6fJ6y77PQwhSnmh
         LxrcRuG9r+1+NvdtFo31ZVrKx3dxqveIXaUH1MX9/P2cjvo8vJJiQImvUd5srpvFqSjX
         gWd329LBF4+LFX44YhtcZ3a9uJTsRResZet1+XcU1+rNQD/w9pcinpKpIdIqvt9yl5gw
         iXliFpwyHfGGnu7OpXt6GjUGhpaateed5310JLq6R84x7GmQyYp1iRpuyOIIhQXgRxzD
         S3YHp7JVREAfFsiFCf0AWwsBF5mWhs1fqm12YsQRTrLC8OkjHs5jWq2wHG7W89qukPgb
         shyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=Fto1MpscWUFMNnBCFYXAwkIBHHJszVTIcxuhyhUimb8=;
        b=h/Ejxd+oZ+Ipkv0RXFDaDFfDV8FxJCN9U4PynDYwMZxAgRdRv7CH5f1GXRAjoE5yNl
         D5FvCZGOouysSIeQu/+7YISbBFl9vlHULWEecpFj1Y+67+c6aUW+VwP1WHaHciSLdc+W
         1sEH3XbRlUxfsQWjVFb2dlG2GcpFTBKVp6sz//KFVBPexbUtT82Q4ztowpuPNuTdkm+s
         ji9RZWPnrNyrGoSRBrtMwV/nUH+wfqfh9z4ZLeZvoY5y/DiaVYtX64f2FApiAvbVILpU
         hciIW+qkRxj8WhbWhxrPb4yApX1yxSVFLHpP2kw5UldNGSBSWqqjdR63dHSd5Q5kzD60
         zM1Q==
X-Gm-Message-State: AJIora/cxsXXLSVdWHT153LCefu2DOZ4ebO6HwwCZtNvDVL3bMDiecmj
        5F8vVa619nbobKX71zGaAcABm1WKS09Lb7Aidy7C
X-Google-Smtp-Source: AGRyM1sRwoHyAz1+k6JJUYUkUrZCg+t9c/gxOPl7fh2C55+kVa8+g83QHhkhNo8kDmE2GSBbgnazRbcpMAgwbTLYWjE=
X-Received: by 2002:a05:6808:3087:b0:33a:a6ae:7bf7 with SMTP id
 bl7-20020a056808308700b0033aa6ae7bf7mr7223113oib.41.1659371710188; Mon, 01
 Aug 2022 09:35:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220721172808.585539-1-fred@cloudflare.com> <20220722061137.jahbjeucrljn2y45@kafai-mbp.dhcp.thefacebook.com>
 <18225d94bf0.28e3.85c95baa4474aabc7814e68940a78392@paul-moore.com>
 <a4db1154-94bc-9833-1665-a88a5eee48de@cloudflare.com> <9eee1d03-3153-67d3-fe21-14fcb5fe8d27@schaufler-ca.com>
In-Reply-To: <9eee1d03-3153-67d3-fe21-14fcb5fe8d27@schaufler-ca.com>
From:   Paul Moore <paul@paul-moore.com>
Date:   Mon, 1 Aug 2022 12:34:59 -0400
Message-ID: <CAHC9VhS9NN9a0=4ANwOf1e74+mKMD5BwE+rKhXcno3dtrZ7GVg@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] Introduce security_create_user_ns()
To:     Casey Schaufler <casey@schaufler-ca.com>
Cc:     Frederick Lawler <fred@cloudflare.com>,
        Martin KaFai Lau <kafai@fb.com>, kpsingh@kernel.org,
        revest@chromium.org, jackmanb@chromium.org, ast@kernel.org,
        daniel@iogearbox.net, andrii@kernel.org, songliubraving@fb.com,
        yhs@fb.com, john.fastabend@gmail.com, jmorris@namei.org,
        serge@hallyn.com, stephen.smalley.work@gmail.com,
        eparis@parisplace.org, shuah@kernel.org, brauner@kernel.org,
        ebiederm@xmission.com, bpf@vger.kernel.org,
        linux-security-module@vger.kernel.org, selinux@vger.kernel.org,
        linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org, kernel-team@cloudflare.com,
        cgzones@googlemail.com, karl@bigbadwolfsecurity.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Mon, Aug 1, 2022 at 11:25 AM Casey Schaufler <casey@schaufler-ca.com> wrote:
> On 8/1/2022 6:13 AM, Frederick Lawler wrote:
> > On 7/22/22 7:20 AM, Paul Moore wrote:
> >> On July 22, 2022 2:12:03 AM Martin KaFai Lau <kafai@fb.com> wrote:
> >>
> >>> On Thu, Jul 21, 2022 at 12:28:04PM -0500, Frederick Lawler wrote:
> >>>> While creating a LSM BPF MAC policy to block user namespace
> >>>> creation, we
> >>>> used the LSM cred_prepare hook because that is the closest hook to
> >>>> prevent
> >>>> a call to create_user_ns().
> >>>>
> >>>> The calls look something like this:
> >>>>
> >>>> cred = prepare_creds()
> >>>> security_prepare_creds()
> >>>> call_int_hook(cred_prepare, ...
> >>>> if (cred)
> >>>> create_user_ns(cred)
> >>>>
> >>>> We noticed that error codes were not propagated from this hook and
> >>>> introduced a patch [1] to propagate those errors.
> >>>>
> >>>> The discussion notes that security_prepare_creds()
> >>>> is not appropriate for MAC policies, and instead the hook is
> >>>> meant for LSM authors to prepare credentials for mutation. [2]
> >>>>
> >>>> Ultimately, we concluded that a better course of action is to
> >>>> introduce
> >>>> a new security hook for LSM authors. [3]
> >>>>
> >>>> This patch set first introduces a new security_create_user_ns()
> >>>> function
> >>>> and userns_create LSM hook, then marks the hook as sleepable in BPF.
> >>> Patch 1 and 4 still need review from the lsm/security side.
> >>
> >>
> >> This patchset is in my review queue and assuming everything checks
> >> out, I expect to merge it after the upcoming merge window closes.
> >>
> >> I would also need an ACK from the BPF LSM folks, but they're CC'd on
> >> this patchset.
> >
> > Based on last weeks comments, should I go ahead and put up v4 for
> > 5.20-rc1 when that drops, or do I need to wait for more feedback?
>
> As the primary consumer of this hook is BPF I would really expect their
> reviewed-by before accepting this.

We love all our in-tree LSMs equally.  As long as there is at least
one LSM which provides an implementation and has ACK'd the hook, and
no other LSMs have NACK'd the hook, then I have no problem merging it.
I doubt it will be necessary in this case, but if we need to tweak the
hook in the future we can definitely do that; we've done this in the
past when it has made sense.

As a reminder, the LSM hooks are *not* part of the "don't break
userspace" promise.  I know it gets a little muddy with the way the
BPF LSM works, but just as we don't want to allow one LSM to impact
the runtime controls on another, we don't want to allow one LSM to
freeze the hooks for everyone.

-- 
paul-moore.com
