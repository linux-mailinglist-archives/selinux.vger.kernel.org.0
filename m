Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 381FC26AC33
	for <lists+selinux@lfdr.de>; Tue, 15 Sep 2020 20:39:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728014AbgIOSjV (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Tue, 15 Sep 2020 14:39:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727666AbgIOSiv (ORCPT
        <rfc822;selinux@vger.kernel.org>); Tue, 15 Sep 2020 14:38:51 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C52C8C06174A
        for <selinux@vger.kernel.org>; Tue, 15 Sep 2020 11:38:50 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id e22so4060839edq.6
        for <selinux@vger.kernel.org>; Tue, 15 Sep 2020 11:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qEsf3xFiIddLDKhq/tbPypo1Eyq9uXrwuTwP67FZJBg=;
        b=1+rL6wKb48qQJcBvWyP0X+TjsdB2TYbc6pVkLuNicvBlJCpm+Sj9R+cocxfD/UBoXG
         eM8nQ4swu7S71iSxp6vZixeppbrIHHHP6EJZLJJvoPrd12hbiXVKyg3h51WgkoHwyyW2
         P6GPH8mrdUuSBk6uUt0niYGIqkEw8k1VvbJQkGx3iWjYmZqulu9Af7Sd0/YXHQ3M4tR9
         zB9aJdbaqlFuLkcYqqRPKwI0XH8BeABBKhmkSW5B4Y9wM3qlcyDagjjt8/Jrf1jvAg9M
         NG6ScZvQDIqjgEraRdBci8+mPYDLzut89ky4EN8MqoOyf9X/AjHykGQc6yxdICY96jQ4
         wukA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qEsf3xFiIddLDKhq/tbPypo1Eyq9uXrwuTwP67FZJBg=;
        b=JNtVFeO8isbJ3svis8tVumKLwxTtqU9X2H6WEgtTFz3u2KJ1j5j3D3ZOXgSmmUBQc8
         Y2JWB1AFT7dQYJ+j2E64JOADMzn0mYQhN/bJSkQgw/EAcerjtN3SqpkOzjHYRnJG3bWB
         RBvMABxuibUqRBHxAqMeNrdHlDiNthWdGxbJ9Q5+3oxACtK9EcVzcZYzNjSRgMCu3Dxz
         YVuKT7QxTuzNT1FtatT/EEql6pW961+87WHyaoCeKxpMdbxvPu2SIXXRPd/OxBwrMBrh
         Q6EtR4N2Wm0cgVJTKpiOTjbchENmRD+aTh4Nqtk8P2LuWfIqKpSSEc07svv6Di1HQ5Uw
         1zNQ==
X-Gm-Message-State: AOAM531tc3HqhyzvqHVcFDRnnCICFog4h5ZGTXHnoWQbMYA2h2TVijRM
        F55cQBilFH7GLl6QnVcSW3g9lZZF2c+G2hEc7bGjiyIJneI4
X-Google-Smtp-Source: ABdhPJwliMhs3ia/GgGLGP6txYMtEL3KaLtRm7LPrwJeVo4Qssz+mrdUIvKMHDQtQmnNJq9cbqpX69aPax0F4S/aQkE=
X-Received: by 2002:aa7:ce97:: with SMTP id y23mr24575347edv.128.1600195126950;
 Tue, 15 Sep 2020 11:38:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200914173157.4655-1-nramas@linux.microsoft.com>
In-Reply-To: <20200914173157.4655-1-nramas@linux.microsoft.com>
From:   Paul Moore <paul@paul-moore.com>
Date:   Tue, 15 Sep 2020 14:38:35 -0400
Message-ID: <CAHC9VhSYY03rkNsijouC3xAR23hvNNFwtvAB2_YFeDMVvdLj9w@mail.gmail.com>
Subject: Re: [PATCH v4] selinux: Add helper functions to get and set checkreqprot
To:     Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
Cc:     Stephen Smalley <stephen.smalley.work@gmail.com>,
        selinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Mon, Sep 14, 2020 at 1:32 PM Lakshmi Ramasubramanian
<nramas@linux.microsoft.com> wrote:
>
> checkreqprot data member in selinux_state struct is accessed directly by
> SELinux functions to get and set. This could cause unexpected read or
> write access to this data member due to compiler optimizations and/or
> compiler's reordering of access to this field.
>
> Add helper functions to get and set checkreqprot data member in
> selinux_state struct. These helper functions use READ_ONCE and
> WRITE_ONCE macros to ensure atomic read or write of memory for
> this data member.
>
> Signed-off-by: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
> Suggested-by: Stephen Smalley <stephen.smalley.work@gmail.com>
> Suggested-by: Paul Moore <paul@paul-moore.com>
> ---
>  security/selinux/hooks.c            |  6 +++---
>  security/selinux/include/security.h | 10 ++++++++++
>  security/selinux/selinuxfs.c        |  5 +++--
>  3 files changed, 16 insertions(+), 5 deletions(-)

Merged into selinux/next, thanks Lakshmi!

-- 
paul moore
www.paul-moore.com
