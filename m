Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3EB142FD020
	for <lists+selinux@lfdr.de>; Wed, 20 Jan 2021 13:34:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728147AbhATMVI (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Wed, 20 Jan 2021 07:21:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:58006 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731218AbhATK2j (ORCPT
        <rfc822;selinux@vger.kernel.org>); Wed, 20 Jan 2021 05:28:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1611138433;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=ffS8S8L1otNyAbuEaEZS4yVSUQyIthca2YYdYR8JpFQ=;
        b=K778xtcoDG1iNxkf757zYynhMxYQMPAkSEWmyEOtqSpFQwNn63SdacpjnsIE4X7p5Z9JKL
        nTYf2OfZJr+R9z3xaa7zPUwwDRxgQx+bV5BP0yLvl+JPq7kMA1f6cPCWCyiWjdTdUayWvE
        DjamOpiJESh4MtOCkCU9+y/pBOegJXw=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-118-6VnK15TKPOGB0naLu0FZ9g-1; Wed, 20 Jan 2021 05:27:11 -0500
X-MC-Unique: 6VnK15TKPOGB0naLu0FZ9g-1
Received: by mail-lj1-f199.google.com with SMTP id a2so6415714ljm.23
        for <selinux@vger.kernel.org>; Wed, 20 Jan 2021 02:27:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ffS8S8L1otNyAbuEaEZS4yVSUQyIthca2YYdYR8JpFQ=;
        b=rv8m42L+dBGZuPhbLS8uResrxV+p3OwDjaq9LwE64pc9yzs9TWJ4y2IS/tc1Zz7KMU
         eM2hXEy3oDm3j6YjNFOn2ptOtKMB3g+K7MFQxexappdlnws+h26oywRy1Y4bWDmN/i96
         ANq1rS7dLajhb238Ap/MW8UaJmcTGfnEt4E2lT71GD/5p9IoNtOpGzdszjt+MSHTDJzJ
         J6qh0MRgdHZZzE0C2UfroTYmBgyhuT36tUlUZrMO6uXNmFliljCyVBIeZ3g4+a1KgzQJ
         L7o1gX77xZTaAgkAeE0Ao3OSH6zCqqEd3wDDrKP3UsobpPH+PSs4MEuduTwMCisZS3b6
         En1A==
X-Gm-Message-State: AOAM530E3l3GZvVoIPUE/S00mtugVr3z84WJ5aFqI7A/rWqMEJVsd0S/
        Q1N2jswyw9YtEdLsCvl9Da0kPhSni/yS3IZjWD2UFANTmfSGiJAQA7wnWJOiPcxtldJTcjeSgzK
        9hO5z1kEXkEoJmcFTyXfyiNrPQ/qwrJ1bJg==
X-Received: by 2002:a19:6b0e:: with SMTP id d14mr3711274lfa.210.1611138429973;
        Wed, 20 Jan 2021 02:27:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyx8IWGrOPLX4vfYI/cS4nQ29Gv2LcHJY4KkNydmt1LlqY+NZrNnOxAi1OQ7a7ZCDXCiuf/cef1n3kHCIAg5wo=
X-Received: by 2002:a19:6b0e:: with SMTP id d14mr3711270lfa.210.1611138429791;
 Wed, 20 Jan 2021 02:27:09 -0800 (PST)
MIME-Version: 1.0
References: <20210119090651.321390-1-omosnace@redhat.com> <CAEjxPJ45e-Uz72gWCKZ_22dkMMuy_E-yRx4CpBbHOZ2kmEYS7Q@mail.gmail.com>
In-Reply-To: <CAEjxPJ45e-Uz72gWCKZ_22dkMMuy_E-yRx4CpBbHOZ2kmEYS7Q@mail.gmail.com>
From:   Ondrej Mosnacek <omosnace@redhat.com>
Date:   Wed, 20 Jan 2021 11:26:59 +0100
Message-ID: <CAFqZXNtXAJYmTOw4B1dxYnAmv+2cee4Le9tOR_a7xXqz176d+Q@mail.gmail.com>
Subject: Re: [PATCH testsuite] Makefile: unload policy when testsuite fails
To:     Stephen Smalley <stephen.smalley.work@gmail.com>
Cc:     SElinux list <selinux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Tue, Jan 19, 2021 at 5:37 PM Stephen Smalley
<stephen.smalley.work@gmail.com> wrote:
> On Tue, Jan 19, 2021 at 7:01 AM Ondrej Mosnacek <omosnace@redhat.com> wrote:
> >
> > Make sure that the test policy is properly unloaded when `make test`
> > fails, to prevent it from accidentally lingering on the system after a
> > failed test.
> >
> > Signed-off-by: Ondrej Mosnacek <omosnace@redhat.com>
>
> Not saying that you can't change it but the current behavior was
> intentional; it made it easier to quickly re-run the failing test(s)
> by hand in order to get more verbose output as per the README.

Okay, that makes sense. I would expect the simple invocation to always
clean up after itself, but then other people can expect the opposite,
so I'll rather keep the status quo.

-- 
Ondrej Mosnacek
Software Engineer, Platform Security - SELinux kernel
Red Hat, Inc.

