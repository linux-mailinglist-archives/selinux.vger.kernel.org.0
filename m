Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B0722C919F
	for <lists+selinux@lfdr.de>; Mon, 30 Nov 2020 23:53:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388739AbgK3WxE (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Mon, 30 Nov 2020 17:53:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388755AbgK3WxD (ORCPT
        <rfc822;selinux@vger.kernel.org>); Mon, 30 Nov 2020 17:53:03 -0500
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4234BC0613CF
        for <selinux@vger.kernel.org>; Mon, 30 Nov 2020 14:52:17 -0800 (PST)
Received: by mail-lf1-x144.google.com with SMTP id j205so25114590lfj.6
        for <selinux@vger.kernel.org>; Mon, 30 Nov 2020 14:52:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kinvolk.io; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PQg0SNNWkwV7My6wc0FC7IpKl7QLq5MHv/j5j0aPpNA=;
        b=QuqQG9ADdDmV18jCrPnWfHcW15X5FNFPRcNOsTuadXp0R1ofszUYyn14cFgcYm1xt9
         Ohx+O/XrOQeBzi2yNeMof2W9YaRXAoKumW+LWK+qJSn1igYlensrTdITOtBIwPZWx8hE
         yhr6LcaDWCZeMzfGxo8TOF8bDqi5UbWdB4uhs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PQg0SNNWkwV7My6wc0FC7IpKl7QLq5MHv/j5j0aPpNA=;
        b=bh9qr7ALYSPYn4mdcw6S879rA/Vyoicx1Z64lQWW+7tKdbwoX5J0qlXjCU50bLIgHp
         VUat1nJDtDu5hK0IbDltPGkarRcEX5djmZiDyE5VudIFT9NeErppdR/Sny+gb77uGve8
         79xvlvsRNUpPXiOilqb/HywKPnMsbH9HJ9szInnahMuOs2ovYk/BQlZknYw2sBPeLubg
         wy+jGKXIi+lBhucry1ZcYHnbj2bPnXOPqOQybO679kakYokLqYKCMBqoCcBC5YL13Y/0
         guNEGkaKYmm2q6kckQHC+ZeIFquv5kNlNX/8yeF+J5APoaSobzKJOQZuLr3Q+A4N5i0X
         Vq2Q==
X-Gm-Message-State: AOAM5334shSt52MEuUv3QI2BjR2i4hVGPZStszw7GJ+YB7a0pyPFeMpR
        T/d56W74VVar4O+zyB4z2UphHKrpTQf20RCIbguyLQ==
X-Google-Smtp-Source: ABdhPJz6lQl/wsVF1Ne7U27EUw+OIPqS46oDCHQlHg6Xbv5haiwWr87dAhx/ApTPrUOy9koOzRi6b9gPinDiWazEth4=
X-Received: by 2002:a19:8684:: with SMTP id i126mr841376lfd.561.1606776735655;
 Mon, 30 Nov 2020 14:52:15 -0800 (PST)
MIME-Version: 1.0
References: <20201128213527.2669807-1-christian.brauner@ubuntu.com> <20201128213527.2669807-34-christian.brauner@ubuntu.com>
In-Reply-To: <20201128213527.2669807-34-christian.brauner@ubuntu.com>
From:   =?UTF-8?Q?Mauricio_V=C3=A1squez_Bernal?= <mauricio@kinvolk.io>
Date:   Mon, 30 Nov 2020 17:52:04 -0500
Message-ID: <CAHap4zvDuSpZzeyZPc61mQURu_0oGKjkiROohYXkAFYyD85Vvw@mail.gmail.com>
Subject: Re: [PATCH v3 33/38] ext4: support idmapped mounts
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

> diff --git a/fs/ext4/Kconfig b/fs/ext4/Kconfig
> index 619dd35ddd48..5918c05cfe5b 100644
> --- a/fs/ext4/Kconfig
> +++ b/fs/ext4/Kconfig
> @@ -118,3 +118,12 @@ config EXT4_KUNIT_TESTS
>           to the KUnit documentation in Documentation/dev-tools/kunit/.
>
>           If unsure, say N.
> +
> +config EXT4_IDMAP_MOUNTS
> +       bool "Support vfs idmapped mounts in ext4"
> +       depends on EXT4_FS
> +       default n
> +       help
> +         The vfs allows to expose a filesystem at different mountpoints with
> +         differnet idmappings. Allow ext4 to be exposed through idmapped

s/differnet/different/g
