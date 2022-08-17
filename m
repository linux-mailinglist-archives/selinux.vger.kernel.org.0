Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 641355977A4
	for <lists+selinux@lfdr.de>; Wed, 17 Aug 2022 22:17:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241804AbiHQUOC (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Wed, 17 Aug 2022 16:14:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241791AbiHQUOA (ORCPT
        <rfc822;selinux@vger.kernel.org>); Wed, 17 Aug 2022 16:14:00 -0400
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com [IPv6:2001:4860:4864:20::2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0009431359
        for <selinux@vger.kernel.org>; Wed, 17 Aug 2022 13:13:50 -0700 (PDT)
Received: by mail-oa1-x2d.google.com with SMTP id 586e51a60fabf-10e6bdbe218so16384610fac.10
        for <selinux@vger.kernel.org>; Wed, 17 Aug 2022 13:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=dJ8IG77j55H1PXNYWQwElNaeO+Yt2VRUDV15QZCsXTU=;
        b=bXzMpAom+iNQA0BuCag9cq5VVwaAwq1Ie5YLMV9VknHPR6HV+V41GRRQhsgyxCdFj2
         vW7D5Jdm2dZgMqcqQx17doKP/F1QeiYGYb+PeIEHi+jZDA2aT6BeitppO1VYgiTKRSf7
         UeIOrqI1Ftl/L+D2VKVJdxbh8vhrklESto0K+faY18HH6XZ0kwJq+SgvP0dctWEzH7BC
         pnMtIeUBPKffs7lEwvNq4BF6/+OeffJxqgCbFGX4FgZsJQtUV7oYu2Iq0bDZcrvnvYGe
         2ZgkhhrTqiMJaYMsQzIa6kmQoBhDSfgh9IRtDQLM2j3L2R4UAwu4NMU3mOtf5eVnv/zt
         r+kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=dJ8IG77j55H1PXNYWQwElNaeO+Yt2VRUDV15QZCsXTU=;
        b=BDQFPe//CWS62D/tv1d41d3nmGp7pBkQNls8soMkXMFLW2TOtdmYU+fRWhzKs4T/8W
         ltU4FrTcM0LmtRCgcagutrQJBKjvF155ST5twKdx+MAvDz+kudxaPMm1V/lKoDvEZY2F
         E2jmvdE8Tp0JkC2Zl7EbW5NsycVCBxo619hLoF1nBhmu/B2mHVZfKfuL8oKzZhSsScxR
         HmenV6lE4dAcalTcA6UEducKJd6BZ41YscZfDWs/iU5ON8OLVH629mfl20ZXpV49GbUs
         4jXRO+v5eFAabmLF0qlwgc3d8RVzpO2Kp3FYIX9cKeiWXh+ChvxcmW0WYS9uk6JpA+hB
         2vEQ==
X-Gm-Message-State: ACgBeo352COqx4POjNckrwRUkF1ja7DShO8hV1EfiZNVuU1olSKCO8AQ
        TqRPmwJbRChKK+8RRtJF9Y3DAS7bjSsKdq3pLUP8
X-Google-Smtp-Source: AA6agR6jouhnhpNv0eFAz246tMtgWuWICHG18FyQZvxKwfUdIoiyfcdd8MTuvYZD8yYZCFlduBkHpG31bg5ClvMFM8M=
X-Received: by 2002:a05:6870:a78d:b0:11c:437b:ec70 with SMTP id
 x13-20020a056870a78d00b0011c437bec70mr2668075oao.136.1660767230327; Wed, 17
 Aug 2022 13:13:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220815162028.926858-1-fred@cloudflare.com> <CAHC9VhTuxxRfJg=Ax5z87Jz6tq1oVRcppB444dHM2gP-FZrkTQ@mail.gmail.com>
 <8735dux60p.fsf@email.froward.int.ebiederm.org> <CAHC9VhSHJNLS-KJ-Rz1R12PQbqACSksLYLbymF78d5hMkSGc-g@mail.gmail.com>
 <871qte8wy3.fsf@email.froward.int.ebiederm.org>
In-Reply-To: <871qte8wy3.fsf@email.froward.int.ebiederm.org>
From:   Paul Moore <paul@paul-moore.com>
Date:   Wed, 17 Aug 2022 16:13:39 -0400
Message-ID: <CAHC9VhSU_sqMQwdoh0nAFdURqs_cVFbva8=otjcZUo8s+xyC9A@mail.gmail.com>
Subject: Re: [PATCH v5 0/4] Introduce security_create_user_ns()
To:     "Eric W. Biederman" <ebiederm@xmission.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Frederick Lawler <fred@cloudflare.com>, kpsingh@kernel.org,
        revest@chromium.org, jackmanb@chromium.org, ast@kernel.org,
        daniel@iogearbox.net, andrii@kernel.org, kafai@fb.com,
        songliubraving@fb.com, yhs@fb.com, john.fastabend@gmail.com,
        jmorris@namei.org, serge@hallyn.com,
        stephen.smalley.work@gmail.com, eparis@parisplace.org,
        shuah@kernel.org, brauner@kernel.org, casey@schaufler-ca.com,
        bpf@vger.kernel.org, linux-security-module@vger.kernel.org,
        selinux@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        kernel-team@cloudflare.com, cgzones@googlemail.com,
        karl@bigbadwolfsecurity.com, tixxdz@gmail.com
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

On Wed, Aug 17, 2022 at 3:58 PM Eric W. Biederman <ebiederm@xmission.com> wrote:
> Paul Moore <paul@paul-moore.com> writes:
>
> > At the end of the v4 patchset I suggested merging this into lsm/next
> > so it could get a full -rc cycle in linux-next, assuming no issues
> > were uncovered during testing
>
> What in the world can be uncovered in linux-next for code that has no in
> tree users.

The patchset provides both BPF LSM and SELinux implementations of the
hooks along with a BPF LSM test under tools/testing/selftests/bpf/.
If no one beats me to it, I plan to work on adding a test to the
selinux-testsuite as soon as I'm done dealing with other urgent
LSM/SELinux issues (io_uring CMD passthrough, SCTP problems, etc.); I
run these tests multiple times a week (multiple times a day sometimes)
against the -rcX kernels with the lsm/next, selinux/next, and
audit/next branches applied on top.  I know others do similar things.

-- 
paul-moore.com
