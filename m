Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 74C26718B99
	for <lists+selinux@lfdr.de>; Wed, 31 May 2023 23:11:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230109AbjEaVLK (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Wed, 31 May 2023 17:11:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229821AbjEaVLI (ORCPT
        <rfc822;selinux@vger.kernel.org>); Wed, 31 May 2023 17:11:08 -0400
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE3E712F
        for <selinux@vger.kernel.org>; Wed, 31 May 2023 14:11:02 -0700 (PDT)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-55db055b412so22074897b3.0
        for <selinux@vger.kernel.org>; Wed, 31 May 2023 14:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1685567462; x=1688159462;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tBVvWrCiTxtzHEDX16BAY1j+7bSgZNwLuSAk5FN/PvE=;
        b=TwLEaj52ZRYp1qrngqFFdT+akHp+jZIAWRAdGud0wjJdUD4VkESfBuc6KLIlfu8B5T
         DgNKWh06VarQ4XX9e9KMMm5PtqzyNgpUqCbt+Y8S1Q1C/8aNlhBqc13ZylPQKggZDYKX
         pnyoa4nRSnRPzUQ+qcNq1rQIeUKcZajMCXWourOAY8fqZmfv6B6JDsArMK4fTRZ6xPAY
         OCIo4rSLKXNOBSDrnnzZgrwxLFPxBYv8VHimlaWGUv5g6K4vtJEQXv/gS7lHmDOBbTat
         e9iWQpf/s0j6qomZp10nGeexnSsquf5XQShkTy8HKjgy6fmopr2RE0RKe/jGwqehsCzS
         Qbgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685567462; x=1688159462;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tBVvWrCiTxtzHEDX16BAY1j+7bSgZNwLuSAk5FN/PvE=;
        b=HY3OQ3Y7Y1GUxNbwkCGS1oBeVyCSWZG/m6bdQCYmyQHbc5JhPNG7GLFMUgJ/OSY/B4
         +0LmjRpTXubTy9c4OkBHwgRsZWu5NcN4V3XirXDmtUdTZugEwynFN2zOG9ZQEAf6BRpq
         cwU1JlYUhfl6p46STuzlgttRsTitiDdTISY8O8zuriwrJT+bW1dIYggvZnEvhoa6qHqe
         nrpOCLsnknDixSSkMFuF0rzSNyHBa3B7ZShITTQHzaJi4Xibe9k1qSxf4oOrkhRQ/M9m
         aNxy2Jwt6Y89Ig8TpBzVJvNsXkAdnoEDPtCFglWWsMheIZfONFxm6DZAPVgGBaB8CFxO
         nwvg==
X-Gm-Message-State: AC+VfDy4YGWYy7OkK6Q6OKBwQidE28oejTUGtQN37/TIDQDRFcSlHh4p
        AoRBeMn4dUuH2HaYE3+byLHkcI4oXN1FBwPmT1M5
X-Google-Smtp-Source: ACHHUZ5boVf27k0iS5jfVFPwokYp9Hw5Z8flmgxYi0TeT/CNKztyX3P6jG/zcmXClc1Sq25xkYFiyrh068Lne5GH+OA=
X-Received: by 2002:a05:690c:ed5:b0:565:34bb:9009 with SMTP id
 cs21-20020a05690c0ed500b0056534bb9009mr24254648ywb.16.1685567462010; Wed, 31
 May 2023 14:11:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230531110506.142951-1-gongruiqi@huaweicloud.com> <fe6a0f1e-6378-a4f2-f995-46799ed5248e@schaufler-ca.com>
In-Reply-To: <fe6a0f1e-6378-a4f2-f995-46799ed5248e@schaufler-ca.com>
From:   Paul Moore <paul@paul-moore.com>
Date:   Wed, 31 May 2023 17:10:51 -0400
Message-ID: <CAHC9VhQHUKXLejiMvETYE_PJz3cyHPF5z+T1ifUCD9ezMztcSQ@mail.gmail.com>
Subject: Re: [PATCH] LSM: Infrastructure management of the sock
To:     Casey Schaufler <casey@schaufler-ca.com>
Cc:     "GONG, Ruiqi" <gongruiqi@huaweicloud.com>,
        John Johansen <john.johansen@canonical.com>,
        James Morris <jmorris@namei.org>,
        "Serge E . Hallyn" <serge@hallyn.com>,
        Stephen Smalley <stephen.smalley.work@gmail.com>,
        Eric Paris <eparis@parisplace.org>,
        linux-kernel@vger.kernel.org, apparmor@lists.ubuntu.com,
        linux-security-module@vger.kernel.org, selinux@vger.kernel.org,
        Kees Cook <keescook@chromium.org>,
        Wang Weiyang <wangweiyang2@huawei.com>,
        Xiu Jianfeng <xiujianfeng@huawei.com>, gongruiqi1@huawei.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Wed, May 31, 2023 at 10:00=E2=80=AFAM Casey Schaufler <casey@schaufler-c=
a.com> wrote:
> On 5/31/2023 4:05 AM, GONG, Ruiqi wrote:
> > As the security infrastructure has taken over the management of multipl=
e
> > *_security blobs that are accessed by multiple security modules, and
> > sk->sk_security shares the same situation, move its management out of
> > individual security modules and into the security infrastructure as
> > well. The infrastructure does the memory allocation, and each relavant
> > module uses its own share.
>
> Do you have a reason to make this change? The LSM infrastructure
> manages other security blobs to enable multiple concurrently active
> LSMs to use the blob. If only one LSM on a system can use the
> socket blob there's no reason to move the management.

I think an argument could be made for consistent handling of security
blobs, but with the LSM stacking work in development the argument for
merging this patch needs to be a lot stronger than just "consistency".

--=20
paul-moore.com
