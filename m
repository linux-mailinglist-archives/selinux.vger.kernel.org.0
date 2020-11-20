Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2A672BB826
	for <lists+selinux@lfdr.de>; Fri, 20 Nov 2020 22:16:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728124AbgKTVQA (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Fri, 20 Nov 2020 16:16:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728041AbgKTVQA (ORCPT
        <rfc822;selinux@vger.kernel.org>); Fri, 20 Nov 2020 16:16:00 -0500
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3539C061A49
        for <selinux@vger.kernel.org>; Fri, 20 Nov 2020 13:15:59 -0800 (PST)
Received: by mail-pg1-x543.google.com with SMTP id q28so8398333pgk.1
        for <selinux@vger.kernel.org>; Fri, 20 Nov 2020 13:15:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=h3PVNgWJ4wv679ueVcfOMGTzPLuWakBRGW5tpcXVwpU=;
        b=dU4KoiHZzIEflMXxYsdAq02/ZtKHAbVYN3DUKz1jjW6FqozuzDqj1HhoL1AotmA6iH
         J0FPfOX8vroNiQrqM3+Mg92Tbbg8Ta4YWvs2XOfQEnQO7II6Vndq8Xm0uvHveSP/s0Nq
         YqotYUJAiv3Sjru2HYlJJBB0l/Fq8aCCvoJwg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=h3PVNgWJ4wv679ueVcfOMGTzPLuWakBRGW5tpcXVwpU=;
        b=XUD2d/THkl4MdLfIY5NElzmO53bMtdXj8TpP257AvFtKRzHDlLWdG3OtlspxcCxocE
         jyEZ/13go461wuYBt3WSgJuSWIUB3JvTNimZMaL7vV2rzBxUz329cAYvefEVouKi5ajB
         PhjJDTNmkNsAchDxCnoWdGPcNV7D8Dek22ymCW3rAUDsgoim0SK1LQaTe5k7mfPApXMt
         DY7HLEiS8QX2lEmEfc3gflxDD62+w35hWB6/kSjnN1ia5o3McbLNaSPUOCOWmKM2PwtO
         qxOm+inzV2GlhhO0TroOR3Dvq/ql6oPHauUwtStM0En5SkM7fWNB7xji70sFbS6mTwUp
         fvjQ==
X-Gm-Message-State: AOAM532J/RcdgH8IPumeo8SJN3QqKnCO7ywo/ImrTQtD8ZH2PjLqdLeG
        W8neG5op/UFFiiIOaFWfKdGT/A==
X-Google-Smtp-Source: ABdhPJxKoNsqmJfw8FXBuNWzYTFCvMP4QSPsIPE4HroDYde9n5FBnmXaYeQPf9Hkrj1TBoT0dMj64g==
X-Received: by 2002:aa7:8ac1:0:b029:197:7198:e943 with SMTP id b1-20020aa78ac10000b02901977198e943mr14806170pfd.58.1605906959108;
        Fri, 20 Nov 2020 13:15:59 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id k9sm4598556pfi.188.2020.11.20.13.15.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2020 13:15:58 -0800 (PST)
Date:   Fri, 20 Nov 2020 13:15:57 -0800
From:   Kees Cook <keescook@chromium.org>
To:     Christian Brauner <christian.brauner@ubuntu.com>
Cc:     Alexander Viro <viro@zeniv.linux.org.uk>,
        Christoph Hellwig <hch@infradead.org>,
        linux-fsdevel@vger.kernel.org,
        John Johansen <john.johansen@canonical.com>,
        James Morris <jmorris@namei.org>,
        Mimi Zohar <zohar@linux.ibm.com>,
        Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
        Stephen Smalley <stephen.smalley.work@gmail.com>,
        Casey Schaufler <casey@schaufler-ca.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Andreas Dilger <adilger.kernel@dilger.ca>,
        OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
        Geoffrey Thomas <geofft@ldpreload.com>,
        Mrunal Patel <mpatel@redhat.com>,
        Josh Triplett <josh@joshtriplett.org>,
        Andy Lutomirski <luto@kernel.org>,
        Theodore Tso <tytso@mit.edu>, Alban Crequy <alban@kinvolk.io>,
        Tycho Andersen <tycho@tycho.ws>,
        David Howells <dhowells@redhat.com>,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        Jann Horn <jannh@google.com>,
        Seth Forshee <seth.forshee@canonical.com>,
        =?iso-8859-1?Q?St=E9phane?= Graber <stgraber@ubuntu.com>,
        Aleksa Sarai <cyphar@cyphar.com>,
        Lennart Poettering <lennart@poettering.net>,
        "Eric W. Biederman" <ebiederm@xmission.com>, smbarber@chromium.org,
        Phil Estes <estesp@gmail.com>, Serge Hallyn <serge@hallyn.com>,
        Todd Kjos <tkjos@google.com>, Jonathan Corbet <corbet@lwn.net>,
        containers@lists.linux-foundation.org,
        linux-security-module@vger.kernel.org, linux-api@vger.kernel.org,
        linux-ext4@vger.kernel.org, linux-audit@redhat.com,
        linux-integrity@vger.kernel.org, selinux@vger.kernel.org,
        Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH v2 39/39] tests: add vfs/idmapped mounts test suite
Message-ID: <202011201300.B158F1E4B@keescook>
References: <20201115103718.298186-1-christian.brauner@ubuntu.com>
 <20201115103718.298186-40-christian.brauner@ubuntu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201115103718.298186-40-christian.brauner@ubuntu.com>
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Sun, Nov 15, 2020 at 11:37:18AM +0100, Christian Brauner wrote:
> This adds a whole test suite for idmapped mounts but in order to ensure that
> there are no regression for the vfs itself it also includes tests for correct
> functionality on non-idmapped mounts. The following tests are currently
> available with more to come in the future:

Awesome! :)

Some glitches in the build, though... something about the ordering or
the Make rules produces odd results on a failure:

$ make
gcc -g -I../../../../usr/include/ -Wall -O2 -pthread    xattr.c internal.h utils.c utils.h -lcap -o /home/kees/src/linux-build/seccomp/tools/testing/selftests/idmap_mounts/xattr
gcc -g -I../../../../usr/include/ -Wall -O2 -pthread    core.c internal.h utils.c utils.h -lcap -o /home/kees/src/linux-build/seccomp/tools/testing/selftests/idmap_mounts/core
core.c:19:10: fatal error: sys/acl.h: No such file or directory
   19 | #include <sys/acl.h>
      |          ^~~~~~~~~~~
compilation terminated.
make: *** [../lib.mk:139: /home/kees/src/linux-build/seccomp/tools/testing/selftests/idmap_mounts/core]
Error 1
$ make
make: Nothing to be done for 'all'.
$ file xattr core
xattr: ELF 64-bit LSB shared object, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, BuildID[sha1]=7a3c1951e54f20e657b4181c1be77c7183a54f81, for GNU/Linux 3.2.0, with debug_info, not stripped
core:  GCC precompiled header (version 014) for C

Even after I install libacl1-dev, I still get a "core" file output which
breaks attempts to build again. :)


Is there any way to have the test suite not depend on
__NR_mount_setattr? Running this test on older kernels fails everything.


-- 
Kees Cook
