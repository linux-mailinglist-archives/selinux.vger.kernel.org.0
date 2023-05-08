Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1CFD66FB887
	for <lists+selinux@lfdr.de>; Mon,  8 May 2023 22:53:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229560AbjEHUxQ (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Mon, 8 May 2023 16:53:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229492AbjEHUxP (ORCPT
        <rfc822;selinux@vger.kernel.org>); Mon, 8 May 2023 16:53:15 -0400
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 990A15BB5
        for <selinux@vger.kernel.org>; Mon,  8 May 2023 13:53:13 -0700 (PDT)
Received: by mail-yb1-xb2b.google.com with SMTP id 3f1490d57ef6-b9a6869dd3cso6826668276.2
        for <selinux@vger.kernel.org>; Mon, 08 May 2023 13:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1683579192; x=1686171192;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O4yGmI0zReXeT9uYxy8OKzLUssU3of7sjK1VlydCLwk=;
        b=aQkol6Rq8jv6TmDf+rZiiApaS1HhYq05mcCWYnNFCgsQdqGYO15CXTYDtUdl/x+hlR
         h4xnDiaZufqCdFM+utqTKRIfdwwf7hm9tgYFuHRJE5HrK33BIbtap+Z8fU/KLDzjzLIj
         06u+gmB09FGJ/21xvGsYToixiYDhyZzKvBPTOEvvkwz38j47JEaFOlAApNif7fH2k6Uu
         mSp2p+yk4TYkVDh5LJ/NV+pDl+WdADAb+8IwR3miOErFezmTwwQ3N7qJAqUYTkv6AWEV
         N513+8ldSJwRWaII5megoIpUQyPWiED1zsD3CYES7KBGH3JEKI6jAmhJF8c8xeyP64eK
         MfDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683579192; x=1686171192;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O4yGmI0zReXeT9uYxy8OKzLUssU3of7sjK1VlydCLwk=;
        b=TogG0AxijUbCetfPhLaRAW5OHXmRJygm2SfaanWvW36BxLqZZS9IqVHLB/PkAgdcQ8
         IBZBP60huFKVLx/CtD/xW5a+xflbVkVpme/VrGKwr9niE1CuRsDX0H0acpMWHIHDdQK9
         7+62uAzaXcAxHChh03qBX046OvHlakEdv9O6j77TF+oaY8zD5hZLjcv8G5gUNREpdO6A
         TUIFnPiWrIJQvxjWSghSoNtdTvc/eg9osX6f68o4o4gzccRe3zMxKx6mMC7TfUrrTk6V
         /kyQ8JYunisZPL0kfb3jdXPb+lEA/qYqE8UZkLOUeptgjANt/U8YFjHroklKOsq6KVct
         DMiQ==
X-Gm-Message-State: AC+VfDwBYebsKgW0BMY4UrCm/7V97Iq4Cl9T7G/RcTffkTedVGge2Gro
        /QzjhzIWttYyVZPY7M3FYcSQ5Kffr8nfpb41mIbI
X-Google-Smtp-Source: ACHHUZ5YSxi22kjly1UPvqYO4ABqBY5V1HYUkDRMqiNWw+cVuGsAe+FKzW/Xd6yR9zdmI1dCaCMJr84VnzNHyswtNMg=
X-Received: by 2002:a25:4209:0:b0:ba1:d995:5237 with SMTP id
 p9-20020a254209000000b00ba1d9955237mr12505755yba.2.1683579192658; Mon, 08 May
 2023 13:53:12 -0700 (PDT)
MIME-Version: 1.0
References: <20230420150503.22227-1-cgzones@googlemail.com> <20230420150503.22227-6-cgzones@googlemail.com>
In-Reply-To: <20230420150503.22227-6-cgzones@googlemail.com>
From:   Paul Moore <paul@paul-moore.com>
Date:   Mon, 8 May 2023 16:53:02 -0400
Message-ID: <CAHC9VhRz0=-MXKG49+x1aC-hR2GXMx3bhRvwEpJtbLOYp4MtHQ@mail.gmail.com>
Subject: Re: [PATCH 6/6] selinux: declare read-only data arrays const
To:     =?UTF-8?Q?Christian_G=C3=B6ttsche?= <cgzones@googlemail.com>
Cc:     Stephen Smalley <stephen.smalley.work@gmail.com>,
        Eric Paris <eparis@parisplace.org>, selinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Thu, Apr 20, 2023 at 11:05=E2=80=AFAM Christian G=C3=B6ttsche
<cgzones@googlemail.com> wrote:
>
> The array of mount tokens in only used in match_opt_prefix() and never
> modified.
>
> The array of symtab names is never modified and only used in the
> DEBUG_HASHES configuration as output.
>
> The array of files for the SElinux filesystem sub-directory `ss` is
> similar to the other `struct tree_descr` usages only read from to
> construct the containing entries.
>
> Signed-off-by: Christian G=C3=B6ttsche <cgzones@googlemail.com>
> ---
>  security/selinux/hooks.c       | 2 +-
>  security/selinux/selinuxfs.c   | 2 +-
>  security/selinux/ss/policydb.c | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)

Merged into selinux/next, thanks.

--=20
paul-moore.com
