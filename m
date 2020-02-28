Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D41EE1738E2
	for <lists+selinux@lfdr.de>; Fri, 28 Feb 2020 14:50:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726714AbgB1Nub (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Fri, 28 Feb 2020 08:50:31 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:34745 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725892AbgB1Nub (ORCPT
        <rfc822;selinux@vger.kernel.org>); Fri, 28 Feb 2020 08:50:31 -0500
Received: by mail-oi1-f194.google.com with SMTP id g6so1180877oiy.1
        for <selinux@vger.kernel.org>; Fri, 28 Feb 2020 05:50:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DhUyHdXrLlAN0C2Tu57tKPKBkhkQP1wUpAtdluyKRuc=;
        b=ZJ/Ls2cyVS5ty37IPPDrzg83LDWO9XbbFYnsnfposfEuG7aYeJp5mbno9Ut4mEAT0W
         l7/4sfiso75jYCLeR8FI3SDOhHcuy6+CylQVPc9RNjzaAk84P1wEubuqMaRVFTFQqLqg
         AXo5nSX3odZZV2Jw0QnMCvY85nLrVyqHdHc/KI+FX7BpCdgYNbKwaLgqSii9wBWhtOrg
         CW//dm+ruqV/lPKKOOJ2AIeKgX42cqBZtYUWurpOngON3gKuNu4RpwJPFfg2SsGDWglG
         5xhnnmg5n4zm+O4WF8otop6JegxAqIP0n9zQQkhFzo2vq95zN5CT7fitk/uqWnm8N9d6
         I4Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DhUyHdXrLlAN0C2Tu57tKPKBkhkQP1wUpAtdluyKRuc=;
        b=ExBJm6wQR16dzQVqF73bFgw9c/nEYmM9eY7C7gb+76vTrLkSoUG2EaQ2Ye4p9P/kzP
         l6OmZhciDwbgMXu33h44K0mwqdHNDUpgAljXDZkoC5+KIZIiXsfD89bNKT6PYz5OddDH
         Cd1zNE5PHnCZaeTypqS/CAZ/LZuEc3NtMKpx4DvuTl0OsksHGINANvT86zL/0N8jxD+q
         OqQvx2nVmfK92tU2pn14SckoFl+k9gK9RC96MANkglWOpXMEh+DxeuSpo0wazZc45vkh
         CJ3awbPje3W3Q42lHyszqKF2znp/+nrAMINYR6FUuNVmME+D2Hc63ggNenjE6WDDzLJM
         ZM9Q==
X-Gm-Message-State: APjAAAU2E5PDlAKDd6i56zlXkLYaOi9f6ZcDg07uZcEilb6ljwxpS3qG
        tDqkpFFBTDLniZ6d1JkvWpwXYyA/Iy8OwsHS0rZeLLa/
X-Google-Smtp-Source: APXvYqzqQomC7vmvDEG6kp/Ks3Ln+okw+bxSgr4AvrBabBZBFjv0/+4Q+MRXPUgjw6QLmABkiiVYcx0IjSu/0hLu8Ms=
X-Received: by 2002:a54:4086:: with SMTP id i6mr3182635oii.65.1582897830529;
 Fri, 28 Feb 2020 05:50:30 -0800 (PST)
MIME-Version: 1.0
References: <20200227230129.31166-1-william.c.roberts@intel.com> <20200227230129.31166-3-william.c.roberts@intel.com>
In-Reply-To: <20200227230129.31166-3-william.c.roberts@intel.com>
From:   Stephen Smalley <stephen.smalley.work@gmail.com>
Date:   Fri, 28 Feb 2020 08:51:47 -0500
Message-ID: <CAEjxPJ7bLsGHQ4-wz19ntft=GYvWMLL5bZd8hAimbu1hzc5+Ew@mail.gmail.com>
Subject: Re: [PATCH 2/3] Makefile: add -fno-semantic-interposition
To:     William Roberts <bill.c.roberts@gmail.com>
Cc:     SElinux list <selinux@vger.kernel.org>,
        Ulrich Drepper <drepper@redhat.com>,
        Ondrej Mosnacek <omosnace@redhat.com>,
        Petr Lautrbach <plautrba@redhat.com>,
        William Roberts <william.c.roberts@intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Thu, Feb 27, 2020 at 6:01 PM <bill.c.roberts@gmail.com> wrote:
>
> From: William Roberts <william.c.roberts@intel.com>
>
> Add -fno-semantic-interposition to CFLAGS. This will restore
> the DSO infrastructures protections to insure internal callers
> of exported symbols call into libselinux and not something laoding first
> in the library list.
>
> Clang has this enabled by default.
>
> Signed-off-by: William Roberts <william.c.roberts@intel.com>

I'm fine with this but since Nicolas pointed out the option of using
-Bsymbolic to
the linker as an alternative to hidden_def/hidden_proto in
https://github.com/SELinuxProject/selinux/issues/204#issuecomment-591092288
I was wondering how they differ.  I guess -Bsymbolic only affects the
linker while -fno-semantic-interposition
permits the compiler to further optimize the code.
