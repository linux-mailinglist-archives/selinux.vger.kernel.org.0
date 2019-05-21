Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DD2FA258D1
	for <lists+selinux@lfdr.de>; Tue, 21 May 2019 22:25:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727046AbfEUUZn (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Tue, 21 May 2019 16:25:43 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:37917 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726766AbfEUUZm (ORCPT
        <rfc822;selinux@vger.kernel.org>); Tue, 21 May 2019 16:25:42 -0400
Received: by mail-lj1-f195.google.com with SMTP id 14so1040780ljj.5
        for <selinux@vger.kernel.org>; Tue, 21 May 2019 13:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aJbiCM3sAnu96zwGMZCWsM8aWQ92sSi8m6orE38DFZk=;
        b=rmU2Rm4hWCG9dh4z1UDw8TuPwNGrMwGYE4YZxZPSi3u3YF9zZNSddvK/JWhIraou0z
         BT4qsTsizwSvJP74KyPevtKMvPX9T6xTJRBVuFFbjrXrvkkUHapTm8WZQxz3rmi5PkbC
         VSFjkisKM8JYA44VSh9hfjovIlkIMiShMYCvUb2w46N+14d/eqHsVYSVp4tFYJVemkwC
         kvODdXiNUU90MkWFgZUi5ejfoTAvUHaU/eIQBkqwFqmXc2wSkOiBEBEkAKxYH4KTOnqj
         Eg/ofv1hLap2rQKMUm6lUD7DFqK5B3Orwrc1LUGwZ3Fg2SbHRTJX9jUFh6xUl4wc0N3u
         0ntg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aJbiCM3sAnu96zwGMZCWsM8aWQ92sSi8m6orE38DFZk=;
        b=Y7qKhLpiGKfwXhRDN5FHNvDbf353xHNcOkqUd6nz+SJDmso5mfMmWe0vAW0raplW8L
         7YJj2tM6dBf7a5EieM7cuP8LtC4W+FCdAAP8Xu8QpT3y1EoBgGHibat6z6tETkwo+BLz
         oot+7pxd4WWXp1dXoWPlFO4zBANtKGW5Cw099ug/DtvBJ6UBUjgm9Rkg38utxXSfhiGe
         PM8GuCuMbm5/xR4BKBGfGzcKsiKzRrFbdXscIN+B8tCalHokgGsXpmGszetw9TR1naIO
         w6NHF2i7Jh0i7gkZu1dNAAAyAJF+t/B+99w23n6mkZ1fjn+Ou6yTgECgFbp1AcRJndxw
         DHZg==
X-Gm-Message-State: APjAAAXtOZW9VMyn5mYVRdhU+qKhhOlWnQNQcNlSYsMbsbDIjdT6GZBC
        xB0V4qVqQauP2JCUt4U+r8J+dYeRSzGcVboARqF/RJoWjw==
X-Google-Smtp-Source: APXvYqxv45yxxiNhMEv+fw/m6juAsokTuZsBLGeaFPfLkhXvQJmsugAOjFdA6l3uHJd29XGaZQIVnXEAbfUvQIzEKWQ=
X-Received: by 2002:a2e:1412:: with SMTP id u18mr8029792ljd.197.1558470340691;
 Tue, 21 May 2019 13:25:40 -0700 (PDT)
MIME-Version: 1.0
References: <20190504195906.8146-1-omosnace@redhat.com> <CAHC9VhRwsNuDhN6y8Lx38TYPFW3WDr7TP3J2t5XAy9jqgFq=gw@mail.gmail.com>
In-Reply-To: <CAHC9VhRwsNuDhN6y8Lx38TYPFW3WDr7TP3J2t5XAy9jqgFq=gw@mail.gmail.com>
From:   Paul Moore <paul@paul-moore.com>
Date:   Tue, 21 May 2019 16:25:29 -0400
Message-ID: <CAHC9VhTJ1sw0A=+n+OZgzouNUnEZQ6=FePu9gLqYPOwvjOovAw@mail.gmail.com>
Subject: Re: [PATCH] selinux: remove some no-op BUG_ONs
To:     Ondrej Mosnacek <omosnace@redhat.com>
Cc:     selinux@vger.kernel.org, Stephen Smalley <sds@tycho.nsa.gov>
Content-Type: text/plain; charset="UTF-8"
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Wed, May 8, 2019 at 5:51 PM Paul Moore <paul@paul-moore.com> wrote:
> On Sat, May 4, 2019 at 3:59 PM Ondrej Mosnacek <omosnace@redhat.com> wrote:
> >
> > Since acdf52d97f82 ("selinux: convert to kvmalloc"), these check whether
> > an address-of value is NULL, which is pointless.
> >
> > Signed-off-by: Ondrej Mosnacek <omosnace@redhat.com>
> > ---
> >  security/selinux/ss/services.c | 4 ----
> >  1 file changed, 4 deletions(-)
>
> This looks fine to me, I'll queue this up for after the merge window closes.

Just merged into selinux/next, thanks.

-- 
paul moore
www.paul-moore.com
