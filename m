Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 611B22C9188
	for <lists+selinux@lfdr.de>; Mon, 30 Nov 2020 23:52:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728157AbgK3WvC (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Mon, 30 Nov 2020 17:51:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729392AbgK3WvB (ORCPT
        <rfc822;selinux@vger.kernel.org>); Mon, 30 Nov 2020 17:51:01 -0500
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3510DC0613D6
        for <selinux@vger.kernel.org>; Mon, 30 Nov 2020 14:50:21 -0800 (PST)
Received: by mail-lj1-x230.google.com with SMTP id y7so20713862lji.8
        for <selinux@vger.kernel.org>; Mon, 30 Nov 2020 14:50:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kinvolk.io; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1bDJzC+7/EeDz8Z4TYtcl8pVmXB1VZfQyZ+oFPIZuXs=;
        b=FjoZwlqRl25v3f0bwesiLG6VMDJ0cdT+WZsk9oJG7qotZdfQy3Bnzm/ErkRC6KEF0Q
         V8tXzsGFOERVPlB9fDDUrXunF4OR96Byp7o91ITmQ4f6ghX4OplZA9VRfMBWotgDeDXS
         4fMHVDZZFkLBQZtMZ9inRIOYwvw2PRu8hX+wE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1bDJzC+7/EeDz8Z4TYtcl8pVmXB1VZfQyZ+oFPIZuXs=;
        b=MfeaLdcOpdXPWZXBeyM5+1mMfqW51l2xXn7jyMjHCzS9/Fb62gt0Y9YijwCCbaqHxX
         YaZHb2Mbotya1pmEmUdVMk+kNdE/+TJ8YjMxrK5IOydAVBuMylrhqGWB2IrShVjyaD/a
         RdFkyIqI8oCcgnjfHpvIvn/LI2jn40YqIRW2aM2w+V5boYgD2j1ggAEk7DwcVdvIHCUY
         ObCMXCvnWpLOBBe+l7GSHTxWRDNf5rghDsPnpNAtWb0hHjnuy9suYfaNrvaIKKDreHRt
         6n0iS7rzJQpehM/vYRpnaTTDvcWzbwFaQ+ftoupGgbi5C2LhgMjksoOpb4htXaFM94cg
         VqzA==
X-Gm-Message-State: AOAM530oEwEu3dcUtZDCRq8/viimB4LPi5JZbdLBTK5i13YpND6B+8R/
        CYcitx4YrnJ1d9Rq3SqUZyicSKePsNfcqeScJ1xkjw==
X-Google-Smtp-Source: ABdhPJyMsQBDmsS07l72ppmPq7n5DMn6hdGTx4GyLQK7ar2TSxkO0y0Q1aohyJmtrB+4dMWzWOlvHMr1zq5pbE7LHlg=
X-Received: by 2002:a2e:b386:: with SMTP id f6mr10646917lje.320.1606776619482;
 Mon, 30 Nov 2020 14:50:19 -0800 (PST)
MIME-Version: 1.0
References: <20201128213527.2669807-1-christian.brauner@ubuntu.com> <20201128213527.2669807-33-christian.brauner@ubuntu.com>
In-Reply-To: <20201128213527.2669807-33-christian.brauner@ubuntu.com>
From:   =?UTF-8?Q?Mauricio_V=C3=A1squez_Bernal?= <mauricio@kinvolk.io>
Date:   Mon, 30 Nov 2020 17:50:08 -0500
Message-ID: <CAHap4zu3wjCqjbxaXbsPqz2Q_oNRm0Q=xQMudPStwN8h92Stcw@mail.gmail.com>
Subject: Re: [PATCH v3 32/38] fat: handle idmapped mounts
To:     Christian Brauner <christian.brauner@ubuntu.com>
Cc:     Alexander Viro <viro@zeniv.linux.org.uk>,
        Christoph Hellwig <hch@infradead.org>,
        linux-fsdevel@vger.kernel.org, Andy Lutomirski <luto@kernel.org>,
        Mimi Zohar <zohar@linux.ibm.com>,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        Andreas Dilger <adilger.kernel@dilger.ca>,
        containers@lists.linux-foundation.org,
        Christoph Hellwig <hch@lst.de>,
        Tycho Andersen <tycho@tycho.ws>,
        Paul Moore <paul@paul-moore.com>,
        Jonathan Corbet <corbet@lwn.net>, smbarber@chromium.org,
        linux-ext4@vger.kernel.org, Mrunal Patel <mpatel@redhat.com>,
        Kees Cook <keescook@chromium.org>,
        Arnd Bergmann <arnd@arndb.de>, selinux@vger.kernel.org,
        Josh Triplett <josh@joshtriplett.org>,
        Seth Forshee <seth.forshee@canonical.com>,
        Aleksa Sarai <cyphar@cyphar.com>,
        Lennart Poettering <lennart@poettering.net>,
        OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
        Geoffrey Thomas <geofft@ldpreload.com>,
        David Howells <dhowells@redhat.com>,
        John Johansen <john.johansen@canonical.com>,
        Theodore Tso <tytso@mit.edu>,
        Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
        Stephen Smalley <stephen.smalley.work@gmail.com>,
        fstests@vger.kernel.org, linux-security-module@vger.kernel.org,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        linux-api@vger.kernel.org,
        Casey Schaufler <casey@schaufler-ca.com>,
        Alban Crequy <alban@kinvolk.io>,
        linux-integrity@vger.kernel.org, Todd Kjos <tkjos@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

>
> mount2 --idmap both:1000:1001:1
>

Nit: missing arguments to mount2.
