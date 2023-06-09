Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A09D672A40F
	for <lists+selinux@lfdr.de>; Fri,  9 Jun 2023 22:06:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229827AbjFIUGN (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Fri, 9 Jun 2023 16:06:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229523AbjFIUGM (ORCPT
        <rfc822;selinux@vger.kernel.org>); Fri, 9 Jun 2023 16:06:12 -0400
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A61C435B5
        for <selinux@vger.kernel.org>; Fri,  9 Jun 2023 13:06:09 -0700 (PDT)
Received: by mail-ot1-x331.google.com with SMTP id 46e09a7af769-6b2b6910facso909813a34.1
        for <selinux@vger.kernel.org>; Fri, 09 Jun 2023 13:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1686341168; x=1688933168;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HhgUZ/b6d8SyK6wuMhy/QUdrYEmRpokDPNLka3VEsFM=;
        b=NMpC/mp9kDSPKq28g6LDQCDDNdNID/NGCD4PlXsPaupeI+dF9VZy9b2ejR281Q3k98
         rb8B22FPmmZ0RD4boaJzVR/s13NgyWQkfTqCJpoiQvLGx/u6K2eDihPxJgpaWCTPN9M4
         69YLB0faetThS7IigtDzx38Q/Cptxe1++JWyviikhxkBlY8rTQoVyr7EdInLRnwS+yoQ
         2kIvx+KBDoNXPuvn3sR39ADkFEecwxizVPVYt7ZeAqP/Vtt31UlnUdu2P/AgAsHIkhM4
         InASaCsWEX6YsVrMjZe4FIE5oVOrAfeLrdPnhopkUt4SfFhxVdvI4CaSbx4IB7fK6fJt
         npig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686341168; x=1688933168;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HhgUZ/b6d8SyK6wuMhy/QUdrYEmRpokDPNLka3VEsFM=;
        b=OxAzt6oeFtc2ioV8BJxq/VwMACl0xOzywoUkuy/AhAugty7Bodv2KwtitAamVU/WDb
         mFJm2D1L/GurlvFDH8o9SpbmW+yca1WpJpzozl3DLVPReQLbz4XthrBpNTlQKrnC/6iy
         Jqr8CDvEfLNeHG2g6k/FujEMvV9rpssdXiZ4QC8e27aT0BrstlfAwbedIiH1uu9xbwPG
         /Ir57ZYlpAJiyTqdewSpj/x0JNE9IKn2wUlcymLDUKNpxrnPxLUCYMOIVUFF8HrqIJo7
         L58HKkOL7QdOGw4WX1oH46JPfcWJvBd1aeXXEOrGu03vUwKJfiN1kv542CnZYTbv+5Oh
         Yx5w==
X-Gm-Message-State: AC+VfDwcHKtuN86UmZ1sA//L9FxJkiRQKqKRBswqgbWT6EkX322gRO68
        GFZjtkGM+fgAxxzqDvucuFSqMz/9QhM/EK5idX+s
X-Google-Smtp-Source: ACHHUZ46O13fZRr5wz1JZPgAzoj3AsioK3u9YBoDpoGeFFr4WNUgRnEFS4DSXi6Tlfcrxs+oLK/wnZQXgEqZ/V9Vh+s=
X-Received: by 2002:a05:6358:9f92:b0:129:bfd3:994 with SMTP id
 fy18-20020a0563589f9200b00129bfd30994mr1938185rwb.20.1686341168398; Fri, 09
 Jun 2023 13:06:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230603191518.1397490-1-roberto.sassu@huaweicloud.com>
In-Reply-To: <20230603191518.1397490-1-roberto.sassu@huaweicloud.com>
From:   Paul Moore <paul@paul-moore.com>
Date:   Fri, 9 Jun 2023 16:05:57 -0400
Message-ID: <CAHC9VhSzC0zV31XrEz06HKp=NNbz0XPT24ja0O1sZtNM_aXqHg@mail.gmail.com>
Subject: Re: [PATCH v11 0/4] evm: Do HMAC of multiple per LSM xattrs for new inodes
To:     Roberto Sassu <roberto.sassu@huaweicloud.com>
Cc:     zohar@linux.ibm.com, dmitry.kasatkin@gmail.com, jmorris@namei.org,
        serge@hallyn.com, stephen.smalley.work@gmail.com,
        eparis@parisplace.org, casey@schaufler-ca.com,
        linux-kernel@vger.kernel.org, linux-integrity@vger.kernel.org,
        linux-security-module@vger.kernel.org, selinux@vger.kernel.org,
        bpf@vger.kernel.org, kpsingh@kernel.org, keescook@chromium.org,
        nicolas.bouchinet@clip-os.org,
        Roberto Sassu <roberto.sassu@huawei.com>
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

On Sat, Jun 3, 2023 at 3:16=E2=80=AFPM Roberto Sassu
<roberto.sassu@huaweicloud.com> wrote:
>
> From: Roberto Sassu <roberto.sassu@huawei.com>
>
> One of the major goals of LSM stacking is to run multiple LSMs side by si=
de
> without interfering with each other. The ultimate decision will depend on
> individual LSM decision.
>
> Several changes need to be made to the LSM infrastructure to be able to
> support that. This patch set tackles one of them: gives to each LSM the
> ability to specify one or multiple xattrs to be set at inode creation
> time and, at the same time, gives to EVM the ability to access all those
> xattrs and calculate the HMAC on them ...

Thanks for sticking with this Roberto, I see a few
comments/suggestions on this patchset, but overall it is looking
pretty good; I'm hopeful we will be able to merge the next revision.

--=20
paul-moore.com
