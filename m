Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0BA0519193A
	for <lists+selinux@lfdr.de>; Tue, 24 Mar 2020 19:34:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727398AbgCXSeE (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Tue, 24 Mar 2020 14:34:04 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:43777 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727382AbgCXSeE (ORCPT
        <rfc822;selinux@vger.kernel.org>); Tue, 24 Mar 2020 14:34:04 -0400
Received: by mail-wr1-f65.google.com with SMTP id b2so22779645wrj.10
        for <selinux@vger.kernel.org>; Tue, 24 Mar 2020 11:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2JQuu+pMvh0ZfrQCuaV/cJ/KafXOSKcvaiH2mueD8s4=;
        b=VQt5ssB5k4OM9ZbHRsUqNaUk4Rqx5Ypk4BiBjKJDUgpw1nASbgdi53HqDHCBgeOfOw
         ZQCQ1f1Eb+YA5y2RoFIytN+/vpRO7iIDZQwQPqW5mt3K5InfrRBX5rPiYWjSmsaHmbgF
         jMlrKat9NLwIHNs+Qz6wZVa7sz6+6c8lYktjNsEuPSeg0tQXIojC3NgdxOYmnq0XDBnm
         d0xDAnkvi8kSRqOTjgwYDxG3+FkEGn1JG6Ny55capS2KaWDCL65uU4mc+5LhZzodM8E1
         C9CV1G3JPIlCy4KW+Xj4hVtM41bT2LOk1hrvDnsV7/i/p/FbM1I16dn2oPPtFfJ6bSwk
         HOuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2JQuu+pMvh0ZfrQCuaV/cJ/KafXOSKcvaiH2mueD8s4=;
        b=Nrwaa4W/5FbWjD3cipywVbN7axNqVQNUiqM9mDrPODpyJbwvwbmuX85CJnN1nkabgL
         V7M16BOXfdpZT/y+j7BBoYmKEPkcBq2J2SRsxl5H5/CqjkBzF4OACC6iHNt0k10eQ36F
         AslHwdYQi+uBf8usB0DPiaMJ/Q7uCAC81ktyOhWJP/AXS2D3jodvcjGIvhRTXMla/LSr
         QvmYGuXj+wDVBOf3IiL8Vh657Ux+NIgkQQyc7rdas2MRVbjvGz44VjQLEZIF/GCoMmlm
         4RVG4CbBPVuYjTnJOSe1M55EKevVmHTmBb/pSJAnzGGxL7MiQJw4jcoyXE90bDWbsZSo
         F25g==
X-Gm-Message-State: ANhLgQ2cLT3WzWzOpJxq3AzMT8WDexeIT4Y6DckGA59O2QzO0mcn8v5w
        cqONBqJKqcgOknH9Fx9oaFwpToA/8Aw/EaVXWG+OHw==
X-Google-Smtp-Source: ADFU+vujf+zhSzBlpNI72B7FwIsZZWTVZ4gjhXSekliIerFXjgVcbDzgx5RXOi6rGSBcZeNc819E5tyhvq1/uA5EpPo=
X-Received: by 2002:a5d:4290:: with SMTP id k16mr16450229wrq.406.1585074842270;
 Tue, 24 Mar 2020 11:34:02 -0700 (PDT)
MIME-Version: 1.0
References: <CAFPpqQERRB3ZJv-+gytzt5AE6y0o+UE3vF+cBb=OAaFrcRKn=Q@mail.gmail.com>
 <CAEjxPJ5uwCJ_-r9Pa_bdO7yM5AovNAomfT4pkeXCWaDNdgwAWQ@mail.gmail.com>
In-Reply-To: <CAEjxPJ5uwCJ_-r9Pa_bdO7yM5AovNAomfT4pkeXCWaDNdgwAWQ@mail.gmail.com>
From:   Ted Toth <txtoth@gmail.com>
Date:   Tue, 24 Mar 2020 13:33:51 -0500
Message-ID: <CAFPpqQFahwi-s+HO2kBYu_WaZXLZWWMYRk1RUntNjLjUs-Fg=w@mail.gmail.com>
Subject: Re: testing for disable-dontaudit in C code
To:     Stephen Smalley <stephen.smalley.work@gmail.com>
Cc:     SELinux <selinux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Tue, Mar 24, 2020 at 11:39 AM Stephen Smalley
<stephen.smalley.work@gmail.com> wrote:
>
> On Tue, Mar 24, 2020 at 11:15 AM Ted Toth <txtoth@gmail.com> wrote:
> >
> > Is there a way to test whether semodule has be run with
> > disable-dontaudit? Or better yet a netlink socket event?
>
> Something like this?
>
> $ make LDLIBS+=-lsemanage checkdisabledontaudit
> $ sudo semodule -DB
> $ sudo ./checkdisabledontaudit
> dontaudits disabled
> $ sudo semodule -B
> $ sudo ./checkdisabledontaudit
> dontaudits enabled
>
> There isn't a specific netlink notification, although you could
> register for the selinux policyload
> notifications and check at that time.

Exactly, thank you.

Ted
