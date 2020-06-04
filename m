Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6C7E1EEAC5
	for <lists+selinux@lfdr.de>; Thu,  4 Jun 2020 21:00:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729467AbgFDTA5 (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Thu, 4 Jun 2020 15:00:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729463AbgFDTA5 (ORCPT
        <rfc822;selinux@vger.kernel.org>); Thu, 4 Jun 2020 15:00:57 -0400
Received: from mail-oo1-xc41.google.com (mail-oo1-xc41.google.com [IPv6:2607:f8b0:4864:20::c41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 222A9C08C5C0
        for <selinux@vger.kernel.org>; Thu,  4 Jun 2020 12:00:56 -0700 (PDT)
Received: by mail-oo1-xc41.google.com with SMTP id v26so418996oof.7
        for <selinux@vger.kernel.org>; Thu, 04 Jun 2020 12:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pqjDlXJJDXCFyXNVSbQhCAmTRd1vq+DUODabY7vKoUY=;
        b=ZDBxpsqntQ3n8Gw6n8i9fDiIvg9w9lxClhGiWr70uYMlIiceD2sSqBWuwVH96xRMUV
         W4zUQKffHdjmg6EAScYJJCrOa6rJfWlj0i8494XrHdYC2FN1q8AEofA5ulCSTIEtzOKo
         nCrrRAP/02uglFT+ZTncVG4ajU+kgB2aOFNuYNiEhoiRBq1DecjsJhOWbZG2c/auijG2
         60bL+nZbERce5dOiRHORh30YlppAQFT1nudsOifdQ24baWAsDTxOuFYkkK1T4DJxbwya
         lPlRqsXzdc5ueXBCY8kpjXrBZFeT5kq8GbSokca50GoyEK2GkAm5L6vV1RGI08mnREyG
         D8qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pqjDlXJJDXCFyXNVSbQhCAmTRd1vq+DUODabY7vKoUY=;
        b=mrxfvuP9hH/aXgavEShLfGsK502vngzDvBQbjbElKhzsE/yd2Oo1PpEcUutHAr93SV
         JCbW07DDfMe4XewHoVreGJ8/jjuJ33TS1Ab9SJScLMhGpGG1YWeHt1qaCh6OtmJpUV8W
         NeOU4yu0HwLclyVfnaB24iIVRHB0uPrmFCPfKdVICl2uadDox6NPZLZ6nIZsRZarCYOU
         s8qA+DAfFLa50aA4bhu/vpP6RzMw4/Ica5XQc8QFNObgCA4j7aXUFDd1ktaJXrqSeRkR
         99th6/fydPZMVdLpHb+D4sexUiRsdPcia16f7kKt3lT9NsQVBzvGMndiqQRT0J5u1m66
         tKPw==
X-Gm-Message-State: AOAM530Gh/QR7MNn9XMWcKL8IzACXvJ9DLUMNLceu+riKrI1ZHrHqDR2
        5ddu2JCERcbminAB+qyGrsNo+Jad23QafHgwdY2Ly9/7
X-Google-Smtp-Source: ABdhPJzF1RqYkLBZPJuU5xIcgDnt/OWvC7lYrKjNxx5K+kJjNs4ETbIxnTdBY9QpOKGYeKueqLU2G1AXJq1KcRuOTvM=
X-Received: by 2002:a4a:e74a:: with SMTP id n10mr4740937oov.71.1591297255513;
 Thu, 04 Jun 2020 12:00:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200531201834.4295-1-toiwoton@gmail.com>
In-Reply-To: <20200531201834.4295-1-toiwoton@gmail.com>
From:   Stephen Smalley <stephen.smalley.work@gmail.com>
Date:   Thu, 4 Jun 2020 15:00:44 -0400
Message-ID: <CAEjxPJ4c5kgnvD-wNXiTGDr=EcZXJGqJKS2n89_ht9T=8oyB_g@mail.gmail.com>
Subject: Re: [PATCH v2] semanage bash completion: handle semanage module
To:     Topi Miettinen <toiwoton@gmail.com>
Cc:     SElinux list <selinux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Sun, May 31, 2020 at 4:25 PM Topi Miettinen <toiwoton@gmail.com> wrote:
>
> List modules for bash completion of `semanage module`.
>
> Signed-off-by: Topi Miettinen <toiwoton@gmail.com>

Acked-by: Stephen Smalley <stephen.smalley.work@gmail.com>

Only caveat is that this can only work if running as root, e.g. sudo
semanage module -d <TAB> will produce an error message from the shell
but I guess that is true in general.
