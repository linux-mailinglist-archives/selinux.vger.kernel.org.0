Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 136A14390A2
	for <lists+selinux@lfdr.de>; Mon, 25 Oct 2021 09:55:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230268AbhJYH6L (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Mon, 25 Oct 2021 03:58:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39267 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229498AbhJYH6L (ORCPT
        <rfc822;selinux@vger.kernel.org>); Mon, 25 Oct 2021 03:58:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1635148549;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=HaP6doBxD9Jv1Cm2ztaSXVICaEyRQuexJoV+q8tgM3o=;
        b=GJFsw9IDW7eLDFYXxl2aULi7U61cKDMxnCkMveDChKR7a9lNf0bPmGFHXQ5amRiDOhbkv7
        F7cCrekWRUR0SrEOfsbPa2GvsUta9n1jn/AY3x7OCoN0+kbpWO0fXguVDIjdOnPIzOSh7c
        sevDgb+doFr9VfdH5t1G20Gcue+t2Cg=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-385-6cHZl8YrPjKk-gYpq5JnOA-1; Mon, 25 Oct 2021 03:55:47 -0400
X-MC-Unique: 6cHZl8YrPjKk-gYpq5JnOA-1
Received: by mail-yb1-f200.google.com with SMTP id h185-20020a256cc2000000b005bdce4db0easo16065972ybc.12
        for <selinux@vger.kernel.org>; Mon, 25 Oct 2021 00:55:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HaP6doBxD9Jv1Cm2ztaSXVICaEyRQuexJoV+q8tgM3o=;
        b=DZAJhT5mf8V9KHUvGAg03RmKrYC+xbT+unNvzexaULAMWrwMgl9kscasuMM84HQhxE
         PSzOoCdh7Z/Hzdn7PL0NpwfivCgPzSKQVxcErqJMX6pevOIlSoHjPenlY+aPjiIgqx9y
         bjcwcneQJ+67I9VdY4hQzvee649L33hGwjq9FtIX3q0cSssyJiLs8+T//Knv/coDqlk6
         Pd3zEM2HttqxO/J9x2+60t1So3PokpHquDN91f0HOb0Hut/WyNiGFxS8VVKBi+D21hST
         9c+6jJmB94ff7hYmeZmGtm5ui1y8Zda3YeXq/C6nCZfod55M0JUwaSafRtv2x0e3S5Fh
         JAwA==
X-Gm-Message-State: AOAM531jBQbuQ/5vbY6eYNEkXR3VVKvd8xzgRh4rWwZPGz0+RFm95uri
        B4gs8HJslphl+L6anNxR51vS0H55bQvDwS9HhYocYnpYoKA0kgLqZvsLYF/k/TrHtUR2cz/wINg
        +p2aRpcjEZnw1uNnZJhXpw5UYzo/Bo1Af3w==
X-Received: by 2002:a25:3b16:: with SMTP id i22mr16104534yba.467.1635148547336;
        Mon, 25 Oct 2021 00:55:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxQw0oj27SWyE9xLBVuhd8Wl9gLIz3ENrF6wNdaHq8P1pN33qBVs/7UZHdeiuqKxnM8N6EFqfHGvFU6FiORm38=
X-Received: by 2002:a25:3b16:: with SMTP id i22mr16104517yba.467.1635148547139;
 Mon, 25 Oct 2021 00:55:47 -0700 (PDT)
MIME-Version: 1.0
References: <20211021153846.745289-1-omosnace@redhat.com> <YXGNZTJPxL9Q/GHt@t14s.localdomain>
 <CADvbK_eHsAjih9bAiH3d2cwkaizuYnn6gL85V6LdpWUrenMAxg@mail.gmail.com>
In-Reply-To: <CADvbK_eHsAjih9bAiH3d2cwkaizuYnn6gL85V6LdpWUrenMAxg@mail.gmail.com>
From:   Ondrej Mosnacek <omosnace@redhat.com>
Date:   Mon, 25 Oct 2021 09:55:36 +0200
Message-ID: <CAFqZXNuPwbwTD4KqQfc1+RtLswR3a=j4aFMYPf7rnxkkZMLvMA@mail.gmail.com>
Subject: Re: [PATCH] sctp: initialize endpoint LSM labels also on the client side
To:     Xin Long <lucien.xin@gmail.com>
Cc:     Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>,
        Vlad Yasevich <vyasevich@gmail.com>,
        Neil Horman <nhorman@tuxdriver.com>,
        "linux-sctp @ vger . kernel . org" <linux-sctp@vger.kernel.org>,
        network dev <netdev@vger.kernel.org>,
        SElinux list <selinux@vger.kernel.org>,
        LSM List <linux-security-module@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Richard Haines <richard_c_haines@btinternet.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Fri, Oct 22, 2021 at 8:33 AM Xin Long <lucien.xin@gmail.com> wrote:
> On Thu, Oct 21, 2021 at 11:55 PM Marcelo Ricardo Leitner
> <marcelo.leitner@gmail.com> wrote:
> >
> > On Thu, Oct 21, 2021 at 05:38:46PM +0200, Ondrej Mosnacek wrote:
> > > The secid* fields in struct sctp_endpoint are used to initialize the
> > > labels of a peeloff socket created from the given association. Currently
> > > they are initialized properly when a new association is created on the
> > > server side (upon receiving an INIT packet), but not on the client side.
> >
> > +Cc Xin
> Thanks Marcelo,
>
> security_sctp_assoc_request() is not supposed to call on the client side,
> as we can see on TCP. The client side's labels should be set to the
> connection by selinux_inet_conn_request(). But we can't do it based
> on the current hooks.
>
> The root problem is that the current hooks incorrectly treat sctp_endpoint
> in SCTP as request_sock in TCP, while it should've been sctp_association.
> We need a bigger change on the current security sctp code.
>
> I will post the patch series in hand, please take a look.

Thanks, your patches indeed seem to do the right thing and they also
do pass selinux-testsuite with the added client peeloff tests (as also
confirmed by Richard already). I have just a few minor comments, which
I'll send as replies to the individual patches.

--
Ondrej Mosnacek
Software Engineer, Linux Security - SELinux kernel
Red Hat, Inc.

