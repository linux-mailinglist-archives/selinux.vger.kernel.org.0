Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 428972509D3
	for <lists+selinux@lfdr.de>; Mon, 24 Aug 2020 22:13:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725946AbgHXUNO (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Mon, 24 Aug 2020 16:13:14 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:44477 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725904AbgHXUNL (ORCPT
        <rfc822;selinux@vger.kernel.org>); Mon, 24 Aug 2020 16:13:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1598299989;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=085e+q9kmvLUY77X5jS0gpxi/0kahwKf8wLEQa7ugZg=;
        b=Hdx3bl5zcft1wSgP4oXApdWoSf9YBD+mzQKaFfSZlrhlNT9+Uz0hb6/oNXlt0MxnCNpIG1
        RGRck+ob9Ml0e3cqaDnQXNptD2dVvGbBW2afK3tVgvHNQGh2O+Xc709SMA/Rb8zd95yZsu
        Qllv45rHo3a+KVmOvnMJGB4UGH2QNLI=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-395-lfws2cGcP22UHQw_MwryUw-1; Mon, 24 Aug 2020 16:13:08 -0400
X-MC-Unique: lfws2cGcP22UHQw_MwryUw-1
Received: by mail-lj1-f200.google.com with SMTP id t9so3142451ljt.13
        for <selinux@vger.kernel.org>; Mon, 24 Aug 2020 13:13:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=085e+q9kmvLUY77X5jS0gpxi/0kahwKf8wLEQa7ugZg=;
        b=tUbSdm2HpmWw/4PiKnjZfvZqu0NIjw/GFQSTWpzp/S4yUK333uw9s+TYEbOgvFN09H
         Q61sLXVO0mFj/qNX3wabHWnBeNE4FYSzsB7xdCyKtGe4ZDdS0u4lKykTmBAovAjCegf9
         OjsCP6mEln1Ucj/ljDKTH0y6asQSR7VuL19FgDZibJFTEoiFWE5siaY5WE/bHg3q+Pez
         y+iRhS5zx875XZtABprThqynRY9HOXx1BifC7cb+J3qtLjAfJswBU38JdGWvTC1wwf8T
         nXZPU9gyULrB4IIY0iJG85Nqp/sKWaJqEyMq5897oMOTyEbwQdFH9pdHAWxtQ2VIsEjT
         wOHw==
X-Gm-Message-State: AOAM5334f/qaRLzO+w/qmrUcyQ9Aw7mGSYxEwYS14M+G4NnV5owzusoY
        MXdO87QtycfuMHNtC2IkuuhbQqKzR+x6k7sHcKGyR2h6W+I5uNlhQZcU5vvavo4oMorWz1gftWy
        wZIQ3Y08J5fbTNWUWOLoH/KsU5CasprVshw==
X-Received: by 2002:a2e:9550:: with SMTP id t16mr3079927ljh.372.1598299986332;
        Mon, 24 Aug 2020 13:13:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwA/5i55m66OPge2HUbmLe1lpb6eQ7fE0mAhYpq/DlFFIPTFydnmVaoDSJmazxYa0kvprriIU+7IY2BJRW7PJ8=
X-Received: by 2002:a2e:9550:: with SMTP id t16mr3079916ljh.372.1598299986135;
 Mon, 24 Aug 2020 13:13:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200824155210.1481720-1-omosnace@redhat.com> <20200824155210.1481720-2-omosnace@redhat.com>
In-Reply-To: <20200824155210.1481720-2-omosnace@redhat.com>
From:   Ondrej Mosnacek <omosnace@redhat.com>
Date:   Mon, 24 Aug 2020 22:12:55 +0200
Message-ID: <CAFqZXNvvSAvr_8yHxEdG1s+3JVA=UQgSxSHS4Foagx2bj3qc5g@mail.gmail.com>
Subject: Re: [PATCH 1/2] selinux: switch unnecessary GFP_ATOMIC allocs to GFP_KERNEL
To:     SElinux list <selinux@vger.kernel.org>,
        Paul Moore <paul@paul-moore.com>
Cc:     Stephen Smalley <stephen.smalley.work@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Mon, Aug 24, 2020 at 5:52 PM Ondrej Mosnacek <omosnace@redhat.com> wrote:
> There seems to be no reason to use GFP_ATOMIC in these cases.
>
> Signed-off-by: Ondrej Mosnacek <omosnace@redhat.com>
> ---
>  security/selinux/hooks.c       |  6 +++---
>  security/selinux/ss/policydb.c | 10 +++++-----
>  2 files changed, 8 insertions(+), 8 deletions(-)

I found at least one more unjustified GFP_ATOMIC in services.c, so
I'll probably respin this patch so it is all in one commit. I didn't
bother looking at services.c at first, since most of the allocations
there are bound to GFP_ATOMIC due to the policy read lock being held.

-- 
Ondrej Mosnacek
Software Engineer, Platform Security - SELinux kernel
Red Hat, Inc.

