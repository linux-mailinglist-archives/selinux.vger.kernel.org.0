Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1099E280E9C
	for <lists+selinux@lfdr.de>; Fri,  2 Oct 2020 10:20:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725993AbgJBIUJ (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Fri, 2 Oct 2020 04:20:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:53982 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725961AbgJBIUJ (ORCPT
        <rfc822;selinux@vger.kernel.org>); Fri, 2 Oct 2020 04:20:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1601626807;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Jgq0b1/vTi11e2NcKJr8ZbC21JkdTlCWhkmSM9nUcZU=;
        b=TLXt0mrEIiSWmsCdeG9xdMOKZ0oAsVYIVE0wkC2sTOTRJneoMhKOEnLy2MBlt+KgZYPfsS
        TgOKVIesNWDeYmP1ZhYlJNude3ximHY0Tr/GY9KF5bjm2I5r4vQ6Uo6tYybe92OWGXmNO5
        uEeTHkJDI1D4jG4lGwfo/2RVKeGEPhU=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-494-44rL_285PXKhLIXZnRlG4A-1; Fri, 02 Oct 2020 04:20:05 -0400
X-MC-Unique: 44rL_285PXKhLIXZnRlG4A-1
Received: by mail-lf1-f69.google.com with SMTP id 20so274576lfg.23
        for <selinux@vger.kernel.org>; Fri, 02 Oct 2020 01:20:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Jgq0b1/vTi11e2NcKJr8ZbC21JkdTlCWhkmSM9nUcZU=;
        b=pCfTiijWYKj+ZFjh2spM3IfCUzBAaAJq0n3Ast9549ssTWXAAbRdN/egPIqSLNnvkm
         g92gsiXyhjRgcZoqSH7ZJSHEB82gcXzUogPP73DLPcD8xZDJyAZsDJGFIPx3RSecvqiB
         wJvZPSbO3REDpdx1vLiHR7cO/cCybpEPcpO1SpAqUvWym15p+vn5fkLx1Y7As7vMgLxX
         L61A/KNA5KUuTGhs7LGPNKCJfa+YGji8fabCvbklgCjUd4EPFS49k/LqqH0jHSP5kPax
         M76OGWRDLBeHm0199hbkXpQzTdqYlL+Ds48shaUJ2E7/j/32Mh2Tb90lgQJ0z3FU5y/H
         7XbQ==
X-Gm-Message-State: AOAM5321zFQo0beRaxTND6xkvyWiCSmL44nqFv+DDBKdHtiCXmfn3q1/
        21KEVV14RCGcrlLYxH50ki704mkgKtWQioiUQ0U7B017NXA7fdXGG0pYEWSAYwFCzxEpQuwkdUB
        mRN2uXiRsdouw/uud46HIpD78g3Mqd0cn5w==
X-Received: by 2002:a2e:9815:: with SMTP id a21mr389302ljj.311.1601626803843;
        Fri, 02 Oct 2020 01:20:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwydepDlOpYeyJe6RkBpyRAMQTsDtagMcnAGiztw3lhNXRrLlYpXmb+gf2/YP+KgEgasGU2mmnYOFI99zJwHNk=
X-Received: by 2002:a2e:9815:: with SMTP id a21mr389294ljj.311.1601626803607;
 Fri, 02 Oct 2020 01:20:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200922085902.18315-1-richard_c_haines@btinternet.com> <CAFqZXNuO4kxFSum5-XVfNY+v8L84OMHaFyrMqyB8quWpyvPvhA@mail.gmail.com>
In-Reply-To: <CAFqZXNuO4kxFSum5-XVfNY+v8L84OMHaFyrMqyB8quWpyvPvhA@mail.gmail.com>
From:   Ondrej Mosnacek <omosnace@redhat.com>
Date:   Fri, 2 Oct 2020 10:19:52 +0200
Message-ID: <CAFqZXNtgBR7cKo61L51T9ANFHzFboW=NMtGZskFV4zxaSHp0jg@mail.gmail.com>
Subject: Re: [PATCH V2 1/1] selinux-testsuite: Update SCTP asconf client/server
To:     Richard Haines <richard_c_haines@btinternet.com>
Cc:     SElinux list <selinux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Tue, Sep 22, 2020 at 2:15 PM Ondrej Mosnacek <omosnace@redhat.com> wrote:
> On Tue, Sep 22, 2020 at 10:59 AM Richard Haines
> <richard_c_haines@btinternet.com> wrote:
> > The main changes have been to sctp_asconf_params_client.c and
> > sctp_asconf_params_server.c to make them more reliable for running the
> > client and server on different systems.
> >
> > Updated common code in sctp_common.c for sctp event handling and updated
> > relevant programs to use handle_event()
> >
> > Removed obsolete code/policy.
> >
> > Signed-off-by: Richard Haines <richard_c_haines@btinternet.com>
> > ---
> > V2 Changes: Indent line, fix typo and increase timer to 3 secs as per
> > Ondrej comments.
> >
> >  policy/test_sctp.te                    |  75 ++++-
> >  tests/sctp/.gitignore                  |   1 -
> >  tests/sctp/Makefile                    |   3 +-
> >  tests/sctp/sctp_asconf_params_client.c | 322 ++++++++-----------
> >  tests/sctp/sctp_asconf_params_server.c | 275 +++++++++-------
> >  tests/sctp/sctp_common.c               | 189 ++++++++++-
> >  tests/sctp/sctp_common.h               |  12 +-
> >  tests/sctp/sctp_peeloff_server.c       |  42 +--
> >  tests/sctp/sctp_server.c               |   4 +-
> >  tests/sctp/sctp_set_peer_addr.c        | 415 -------------------------
> >  tests/sctp/test                        |  70 ++++-
> >  11 files changed, 623 insertions(+), 785 deletions(-)
> >  delete mode 100644 tests/sctp/sctp_set_peer_addr.c
>
> Acked-by: Ondrej Mosnacek <omosnace@redhat.com>

And now applied, thanks!

-- 
Ondrej Mosnacek
Software Engineer, Platform Security - SELinux kernel
Red Hat, Inc.

