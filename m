Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 086F16C7FAF
	for <lists+selinux@lfdr.de>; Fri, 24 Mar 2023 15:17:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229484AbjCXOR0 (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Fri, 24 Mar 2023 10:17:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230100AbjCXOR0 (ORCPT
        <rfc822;selinux@vger.kernel.org>); Fri, 24 Mar 2023 10:17:26 -0400
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1BA01E5EC
        for <selinux@vger.kernel.org>; Fri, 24 Mar 2023 07:17:20 -0700 (PDT)
Received: by mail-yb1-xb2d.google.com with SMTP id z83so2348981ybb.2
        for <selinux@vger.kernel.org>; Fri, 24 Mar 2023 07:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1679667440;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qyz70q0exwlxpG0yMPJfrMAVsSG+06PVBNztaJhtJqo=;
        b=AOQvr9b4IDlun2P9WBqyFgYrZnRMnWkZbi7nKD1h77svDtysp3k2+svumSz94wRohI
         DHZZwnayCvXPboUZHbIPyaInyWGXe1MZU80EoiXvTGptGU5x9ycbCOmJQPEv5+ToeKhI
         M28EIQd9BR39cjtGdwuyZiW6Z7sHOCN3XEb/+rDt/zaSbv28B5BeAQweq/nnqcNzKhfQ
         8dNPfrfNpTMGHcndWQbl5qRBpRC+A5GBdNdTaoP1dpsA4MjG2imDAtn4mnZCDF0V7zF9
         v0rIKu1s/EOQIUsfRTFmsVupWgV2UUt+PQt8qEAWmu6B4mKm/O6meI3joa44DP3+Dbq0
         WgiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679667440;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qyz70q0exwlxpG0yMPJfrMAVsSG+06PVBNztaJhtJqo=;
        b=xxqhlsfNP+ka3AwVeIKA2eh5T9i/rzH4ZzyhPO6axtK7kvxYoBp/D2HxMTOBLFWjda
         x6dP2jj/ZZNNOyH2lGXPG9w0RS36XTHORXKJbSv0WtaWpOQTe8Fk3BYPgtyidAlhMmxi
         qHw/4lJKT9BAhC0v7dFH67YQsTF/8u15K0XAUYn4P8Cmp6+5yTGHuN2AiFEt1ANQEH+m
         z5GPGx1pvAq7aTdFn/MWx8HvUVfyM8be+INbuEHpJc1J+z5mTB/GMJDMoXkU72hBvR/x
         oMzYI1GW9BOLcW8vw6UufwMOVsDG/feAx5/ua9Rk5GASNwZkefO/R/gA+sSLh6gXrlGm
         z+8w==
X-Gm-Message-State: AAQBX9duCjXRysuDGtTGHlSTAAuoPaCjUiE/h4toZUhuKeNxuRrBjBF+
        aTkmQBLq+3aOIJqIvaZU491cpI041Mj9tHvXB/6T
X-Google-Smtp-Source: AKy350amz4iSWC/J6MBpFaFbKcK0anHYtISoEVuIwiCetg7GwG+iRm9rYxlweWMrGHUcXR2/Z4SwCvWYK/Z/pHw7RwU=
X-Received: by 2002:a05:6902:1586:b0:b76:ceb2:661b with SMTP id
 k6-20020a056902158600b00b76ceb2661bmr1495681ybu.3.1679667440030; Fri, 24 Mar
 2023 07:17:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230314081720.4158676-1-roberto.sassu@huaweicloud.com>
 <20230314081720.4158676-5-roberto.sassu@huaweicloud.com> <CAHC9VhTD3EyDiJs9+NQrgp84JcUs_sx8WONtRk2YYH4m1C8nVw@mail.gmail.com>
 <5d8d802a-7664-fdf0-52ef-5817634d870d@schaufler-ca.com>
In-Reply-To: <5d8d802a-7664-fdf0-52ef-5817634d870d@schaufler-ca.com>
From:   Paul Moore <paul@paul-moore.com>
Date:   Fri, 24 Mar 2023 10:17:09 -0400
Message-ID: <CAHC9VhRxsY6B3dL7db4b8bfznEz6rK2qiaDug4Hc_ywvU3vB5A@mail.gmail.com>
Subject: Re: [PATCH v8 4/6] security: Allow all LSMs to provide xattrs for
 inode_init_security hook
To:     Casey Schaufler <casey@schaufler-ca.com>
Cc:     Roberto Sassu <roberto.sassu@huaweicloud.com>, mark@fasheh.com,
        jlbec@evilplan.org, joseph.qi@linux.alibaba.com,
        zohar@linux.ibm.com, dmitry.kasatkin@gmail.com, jmorris@namei.org,
        serge@hallyn.com, stephen.smalley.work@gmail.com,
        eparis@parisplace.org, ocfs2-devel@oss.oracle.com,
        reiserfs-devel@vger.kernel.org, linux-integrity@vger.kernel.org,
        linux-security-module@vger.kernel.org, selinux@vger.kernel.org,
        linux-kernel@vger.kernel.org, keescook@chromium.org,
        nicolas.bouchinet@clip-os.org,
        Roberto Sassu <roberto.sassu@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Thu, Mar 23, 2023 at 9:01=E2=80=AFPM Casey Schaufler <casey@schaufler-ca=
.com> wrote:
> On 3/23/2023 5:09 PM, Paul Moore wrote:
> > On Tue, Mar 14, 2023 at 4:19=E2=80=AFAM Roberto Sassu
> > <roberto.sassu@huaweicloud.com> wrote:

...

> >> diff --git a/include/linux/lsm_hooks.h b/include/linux/lsm_hooks.h
> >> index c2be66c669a..75a2f85b49d 100644
> >> --- a/include/linux/lsm_hooks.h
> >> +++ b/include/linux/lsm_hooks.h
> >> @@ -63,6 +63,7 @@ struct lsm_blob_sizes {
> >>         int     lbs_ipc;
> >>         int     lbs_msg_msg;
> >>         int     lbs_task;
> >> +       int     lbs_xattr; /* number of xattr slots in new_xattrs arra=
y */
> >
> > No need for the comment, we don't do it for the other fields.
>
> I asked for the comment. lbs_xattr is the number of entries, which is
> different from the other fields. The other fields contain blob sizes in
> bytes. Inconsistent behavior should be noted.

Fair enough.  Since that's the case, let's encode something in the
field name itself so that every user has a slight reminder that it is
a count and not a size.  How about 'lbs_xattr_count' or similar?

--=20
paul-moore.com
