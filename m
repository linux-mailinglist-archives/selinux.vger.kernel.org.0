Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 38F2AD39DC
	for <lists+selinux@lfdr.de>; Fri, 11 Oct 2019 09:11:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727379AbfJKHLB (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Fri, 11 Oct 2019 03:11:01 -0400
Received: from mx1.redhat.com ([209.132.183.28]:32968 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726679AbfJKHLB (ORCPT <rfc822;selinux@vger.kernel.org>);
        Fri, 11 Oct 2019 03:11:01 -0400
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id C25104FCC7
        for <selinux@vger.kernel.org>; Fri, 11 Oct 2019 07:11:00 +0000 (UTC)
Received: by mail-oi1-f198.google.com with SMTP id 19so4278096oii.2
        for <selinux@vger.kernel.org>; Fri, 11 Oct 2019 00:11:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=b9TTFEt+fLm1IWDj1T+pfVFpsoq5pdlUlLwScOCeFUQ=;
        b=kOyjf6JB95WxZc/9XvsTNYVqOlRYJ9l/GEpYKMP7Vw8cfRJrT9iCC1z2B938PaeJ1s
         uiRD3OoQlFkoeZac6v7Wg023gRNpyQs4gMuriXSaH3ZvhRUuT5Fo4InW9vvg8MG03wuo
         oSbGzLa0yX3vHeBDeVaJJogUcbvCQn1hv8KbARB/OTZbpytlfX8en9mAdbSJmm7m7DwZ
         lAf9A/ne17MmKeyI+6n75hsfxDQ490kTfXybMzqaPqqS6gMOzc4FjFRHpE3X/7o8lPnd
         BSzyfE3JvhhQROQJ7wCKJG6D9wzycx/22LZn4LkLNASefhXTgsJcYW4UAnT+IIDEtpdn
         N9pw==
X-Gm-Message-State: APjAAAUej424lEgLjkA2zcSk4uTn6GBiM/SlVmRow8WPEBjxbUA0nvca
        91oOKqNikUPO47nvzLXd5SSB/2Zz5q1ORo6TU5sLiMjfaXLMX4sy2+wZWwPfBxtcd7PQS/XAt0d
        jKKHcQqsCZZL6amFwOW8PTfs+G23er6Y7pA==
X-Received: by 2002:a05:6830:1d9:: with SMTP id r25mr11262241ota.66.1570777860158;
        Fri, 11 Oct 2019 00:11:00 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyqfIGne3aQJzsg1RbouQxDoC0sPjvk6uE7MJuv10CtFbQsZ6JqybNqR9EEkdUeFM2mtUZTwSvSP4xfgpbQTf8=
X-Received: by 2002:a05:6830:1d9:: with SMTP id r25mr11262233ota.66.1570777859906;
 Fri, 11 Oct 2019 00:10:59 -0700 (PDT)
MIME-Version: 1.0
References: <20191011070716.198563-1-plautrba@redhat.com>
In-Reply-To: <20191011070716.198563-1-plautrba@redhat.com>
From:   Ondrej Mosnacek <omosnace@redhat.com>
Date:   Fri, 11 Oct 2019 09:10:51 +0200
Message-ID: <CAFqZXNs6aQNXHUx0e1=uU1bLk3jDx_FGDM3GVmATBukhW2ojkw@mail.gmail.com>
Subject: Re: [PATCH] libsepol: Use LIBSEPOL_3.0 and fix sepol_policydb_optimize
 symbol mapping
To:     Petr Lautrbach <plautrba@redhat.com>
Cc:     SElinux list <selinux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Fri, Oct 11, 2019 at 9:07 AM Petr Lautrbach <plautrba@redhat.com> wrote:
> There's a typo in commit b8213acff837101 ("libsepol: add a function to optimize
> kernel policy") which added new function sepol_policydb_optimize(), but there's
> sepol_optimize_policy in libsepol.map.
>
> LIBSEPOL_3.0 is used to follow the next release version libsepol-3.0
>
> Signed-off-by: Petr Lautrbach <plautrba@redhat.com>

Acked-by: Ondrej Mosnacek <omosnace@redhat.com>

Thanks for spotting it!

> ---
>  libsepol/src/libsepol.map.in | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/libsepol/src/libsepol.map.in b/libsepol/src/libsepol.map.in
> index 6358e51f..f4946a79 100644
> --- a/libsepol/src/libsepol.map.in
> +++ b/libsepol/src/libsepol.map.in
> @@ -60,7 +60,7 @@ LIBSEPOL_1.1 {
>         sepol_polcap_getname;
>  } LIBSEPOL_1.0;
>
> -LIBSEPOL_1.2 {
> +LIBSEPOL_3.0 {
>    global:
> -       sepol_optimize_policy;
> +       sepol_policydb_optimize;
>  } LIBSEPOL_1.1;
> --
> 2.23.0
>

-- 
Ondrej Mosnacek <omosnace at redhat dot com>
Software Engineer, Security Technologies
Red Hat, Inc.
