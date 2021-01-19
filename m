Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68B882FBCAC
	for <lists+selinux@lfdr.de>; Tue, 19 Jan 2021 17:40:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387558AbhASQi4 (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Tue, 19 Jan 2021 11:38:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730852AbhASQiZ (ORCPT
        <rfc822;selinux@vger.kernel.org>); Tue, 19 Jan 2021 11:38:25 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70613C061757
        for <selinux@vger.kernel.org>; Tue, 19 Jan 2021 08:37:44 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id 23so29927514lfg.10
        for <selinux@vger.kernel.org>; Tue, 19 Jan 2021 08:37:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ES449hdWMtYad74szx11yCoGR+t7UITURVp8riaGvWo=;
        b=XWboQX0HkgI2/TUt2QsCGh6kBG3nqtswgvfXOSgF6V2M0ApcV/GDQCF4eZ/JYMWTb2
         a8gucUJQEu4dadBC04xtPaFXL673Rvs9mLRgEcUfc03n1j7bXQ/IoAmnzd6q1VkrslHX
         tEhs5mUMVstbb3UKj5pVvIfC2S0h2fGUKctorm3uEOP5y7gAlO5jku9VlDV6bmoAkRm/
         vRi+GO7tYB5g/8Jbd1jtuvdPMIq75hMkAdUGkunnWW3Q7Jx8Ch/DIlWKKQU6Zi8znv65
         L5379r2sFBTXwSkMbraQFywo1fNf2ND+rnrHyGgjzxE57VDckHB3yQKmm4OXcn3qzRCW
         3glA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ES449hdWMtYad74szx11yCoGR+t7UITURVp8riaGvWo=;
        b=peXD2TBa2jEw5617BhSKTg28BGeV7/hNAcwK4wUwLk9FDK475gne5xJES7YdBUgkJ1
         n46dKmHB9TUOwSu2wP1MviEriR9u+G7yDI+/FrIqz8HPj/DqsJfyaYxqjJ/dU0DqJt8/
         W159QB6/j5e/iPso7+d1xeUdv2LU5btIYqM71X8QWk+jBqPNmzEVr6f8RF2eMgXWZWiT
         /px+Z3nwVIP1QjxJQSpkfJgDHXVA/M8h197/uWFL3xP0OU8i85pLg1Eo4q0Ly+n2LC1u
         xLNugsuf0loHHvVhNnInFIeYS0/jZPtxjIWRzoeaHO+awQO1oykNg6glsKEXvHsQJ1IZ
         awxg==
X-Gm-Message-State: AOAM53061zZHmFghbsJUYX3yEwiJtUBJHIst9bTBDV8hktLeUVeZomAg
        hzZ+c8tacSZuod8fFABPV+YhYuhG0RyKMYAxbuE=
X-Google-Smtp-Source: ABdhPJybO1s7fgLjl4sFD9IwLLjUus4LJU7SCP4SKlYxNIJIFkWb/xJ3/xLj0CuCWi6zHhjIVmUpWM0DCbbdeMLMWUQ=
X-Received: by 2002:a19:3f87:: with SMTP id m129mr2205590lfa.560.1611074263025;
 Tue, 19 Jan 2021 08:37:43 -0800 (PST)
MIME-Version: 1.0
References: <20210119090651.321390-1-omosnace@redhat.com>
In-Reply-To: <20210119090651.321390-1-omosnace@redhat.com>
From:   Stephen Smalley <stephen.smalley.work@gmail.com>
Date:   Tue, 19 Jan 2021 11:37:31 -0500
Message-ID: <CAEjxPJ45e-Uz72gWCKZ_22dkMMuy_E-yRx4CpBbHOZ2kmEYS7Q@mail.gmail.com>
Subject: Re: [PATCH testsuite] Makefile: unload policy when testsuite fails
To:     Ondrej Mosnacek <omosnace@redhat.com>
Cc:     SElinux list <selinux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Tue, Jan 19, 2021 at 7:01 AM Ondrej Mosnacek <omosnace@redhat.com> wrote:
>
> Make sure that the test policy is properly unloaded when `make test`
> fails, to prevent it from accidentally lingering on the system after a
> failed test.
>
> Signed-off-by: Ondrej Mosnacek <omosnace@redhat.com>

Not saying that you can't change it but the current behavior was
intentional; it made it easier to quickly re-run the failing test(s)
by hand in order to get more verbose output as per the README.
