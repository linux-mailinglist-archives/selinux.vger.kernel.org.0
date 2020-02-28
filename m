Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E5D7C173C8F
	for <lists+selinux@lfdr.de>; Fri, 28 Feb 2020 17:08:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725861AbgB1QIY (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Fri, 28 Feb 2020 11:08:24 -0500
Received: from mail-ed1-f66.google.com ([209.85.208.66]:37180 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725827AbgB1QIY (ORCPT
        <rfc822;selinux@vger.kernel.org>); Fri, 28 Feb 2020 11:08:24 -0500
Received: by mail-ed1-f66.google.com with SMTP id t7so3947544edr.4
        for <selinux@vger.kernel.org>; Fri, 28 Feb 2020 08:08:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=COJhm8WhQ6ISBRjpxHD2iQWfqKfKT7JaICGsD5eANT8=;
        b=zyUwcOFkmnykZoRo1IMDk44dKeT0ZTfbuOgpJRtqHroGtKz1WcSBm6dBcvIlHuR+1/
         tqoPpIL7nVCKla4gU7OpcO/r2H2I9boW5SgFdL4DsGdmc8Pdy+/Toto/jjBGqDBUUe0T
         OwYmXAXtrPrSlDBiHhC2Ksz0H8pFK476EUYVbw9EmIz8TZ0qzp46i5dLET4cuSjSseJP
         6dDrPKHzTFRNskSxCJZS/5sKFj76y6ZQ5gm3PMRdZJvLZvyanQjuxENNBH4VxE4Q8+cx
         U3wh5GBlcKX9G+P6xR4F3AWyDNrR1O0igPL3tFHl99C3zBOQDxMtD3br72Vux4bnSflj
         uw6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=COJhm8WhQ6ISBRjpxHD2iQWfqKfKT7JaICGsD5eANT8=;
        b=EIKEefVkXeWutSvQ41Nt6Ufp0wMpAr/oIUAyU47URmuX1MCzwlpZg72MHIB+oPzZhL
         5iCu9XPZCvbu70XjcYUMBSnsyhUJ6ONBw8mGNR5/GdPncFqA8KrET6v9WrOvTCXdLRNc
         NixJlG8Us9yR0Ogf8Ye+R4BiTnAqLxNRteV/WU0W/YKOVJBBgsgQRFoXVw+bgao8MOmy
         jCbtoHyNjqpRp6Tm9u2oayRD8YsQ4NBHFhFqRC8mgisiNuIuY5Gd4T9Rqtuk5Rrhxoyj
         WLPuT1iqPOLAFFd81S2c97JacFzYcj7XgS7cSmFVR6IcsmUIQQXI5ZEeUGpt2HZTRbFa
         exzA==
X-Gm-Message-State: APjAAAVQMMHoyzv/qOsEC9RTpzoilSWX376HdMYzuhP5bpoJY3blpamr
        +oi3iS5AcFmOpImcpBd/ZMofAT49scwFU5MVVCsw
X-Google-Smtp-Source: APXvYqwxBacl+x1hSURgM561GxFb7gLSmWud3lfM2J3zMWokFrUFgHZ0FXpbUlX5vERkgq10NcWM07viActJZgUZ2Tg=
X-Received: by 2002:a50:e108:: with SMTP id h8mr4600686edl.196.1582906101200;
 Fri, 28 Feb 2020 08:08:21 -0800 (PST)
MIME-Version: 1.0
References: <20200220181031.156674-1-richard_c_haines@btinternet.com>
 <20200220181031.156674-2-richard_c_haines@btinternet.com> <c5d6ae72-4f5d-fe41-c025-0eaa4616b7eb@tycho.nsa.gov>
 <CAHC9VhQ+pNTJjb=ipG_gsTSpv6-rEtWTL2sybrOnjyBJ+==2hw@mail.gmail.com> <103187.1582905135@warthog.procyon.org.uk>
In-Reply-To: <103187.1582905135@warthog.procyon.org.uk>
From:   Paul Moore <paul@paul-moore.com>
Date:   Fri, 28 Feb 2020 11:08:10 -0500
Message-ID: <CAHC9VhQDc2dPfv8FxMtYYLejYwrXQGA9EZz57YuaO15JUs2Mnw@mail.gmail.com>
Subject: Re: [RFC PATCH 1/1] selinux: Add support for new key permissions
To:     David Howells <dhowells@redhat.com>
Cc:     Richard Haines <richard_c_haines@btinternet.com>,
        selinux@vger.kernel.org, Stephen Smalley <sds@tycho.nsa.gov>
Content-Type: text/plain; charset="UTF-8"
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Fri, Feb 28, 2020 at 10:52 AM David Howells <dhowells@redhat.com> wrote:
> Paul Moore <paul@paul-moore.com> wrote:
>
> > Yes, you really need to revert this patch David, I mentioned this some
> > time ago when the linux-next conflict appeared.
>
> It is reverted.

Thank you.

[sorry, I forgot the reply-all]

> > Also, future patches like this *really* need to go in via the SELinux tree,
> > not the keys tree, as they affect the SELinux kernel ABI and if they aren't
> > merged via the same tree lots of bad things can happen if we aren't careful.
>
> Are you're willing to take the matching keyring changes with it?  The SELinux
> patch won't build without them - but they have to go in at the same time
> otherwise the keyrings part will malfunction.

Assuming they've got the right ACKs from any subsystems that are affected, sure.

-- 
paul moore
www.paul-moore.com
