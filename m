Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DD6FA12A409
	for <lists+selinux@lfdr.de>; Tue, 24 Dec 2019 20:36:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726224AbfLXTgK (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Tue, 24 Dec 2019 14:36:10 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:41421 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726184AbfLXTgJ (ORCPT
        <rfc822;selinux@vger.kernel.org>); Tue, 24 Dec 2019 14:36:09 -0500
Received: by mail-lf1-f66.google.com with SMTP id m30so15687393lfp.8
        for <selinux@vger.kernel.org>; Tue, 24 Dec 2019 11:36:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4Lme9Wyno1ygBZWQLeRNkRIxRgffFulfZDQ48FUsXuA=;
        b=f8OM+3XUqBeZKY+6zorTFgHHqvIbDxTbgy9NEbgemnUwj1/f9jJuj4G92IIfVYfVCg
         PbD8Qf2tvK/0gYEd4gaEH+WlMRL6lmknPlrPmZFtyeW8/5fMHGNBQxULMgwnDWq8xi+x
         Ixr8QzlWetXxmYXcK7ym0mhdwdc/1L8gmBpd97Iz7JiQQGe0rsAG4GzIHApC6bDLJanx
         Wb2MLrG2UX2Y4zwRypJJcnRB4/MxynyaphlnGYzpDefzcDeponubc/MHz2x1Yx8x862s
         5TcmBh+UqQ+MFP8nr5s5y85KTg5EyN3JwUscG390aqu5h83yri7LtXXsnW66Z5wrtpkf
         3D9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4Lme9Wyno1ygBZWQLeRNkRIxRgffFulfZDQ48FUsXuA=;
        b=OdB4l33cGPPaQDlob33wS3XGi3gsKI2Z3ySEF6l//ZPBn+OXkNvDwVGmlspNEtm3UC
         1dEl7Y9ABC1/EAn4DF5koLwheemuCY/l2cAjoDrS7lUow+/vRGu8n4zMrXX5lrZORL8P
         64tJCy2QGel+KvJpU1SNd6Vsv7mMTO5f4o7jkOgL8F/NjQbVLgrojDyuVP5J88VACV9P
         o5BKu5No8cGhZlRn1hruMmnHtlqBEXdW2q6CJ9Pwjgos3bEoSkS+ugD9zk1wu1tqmHN6
         wae2qO3PoX3e3zfPmpEZMP999ZAsKBIS6mvYkxGJod9CviW5UArrBi6DJW6nY5uiRiKg
         HsPg==
X-Gm-Message-State: APjAAAVwWbV/oTWI8JCFEeF02u1Blb/amYNx9/xtnoOW4I2OiBZNMKH8
        peHVhb89L1/vZ3n9Q+Brn6dhDpq9nsf7NLl8VOvB
X-Google-Smtp-Source: APXvYqyyd41paNWd67q+SotBLtkizccVMdu3Hz4Ze4VEpxhr+L2hhXbp6W/Ter6cuc+8yBX4JmRQ+64Igvaadkob3xQ=
X-Received: by 2002:a19:ae04:: with SMTP id f4mr20932323lfc.64.1577216167638;
 Tue, 24 Dec 2019 11:36:07 -0800 (PST)
MIME-Version: 1.0
References: <20191224124552.10452-1-yuehaibing@huawei.com>
In-Reply-To: <20191224124552.10452-1-yuehaibing@huawei.com>
From:   Paul Moore <paul@paul-moore.com>
Date:   Tue, 24 Dec 2019 14:35:56 -0500
Message-ID: <CAHC9VhQ17u_44L+oKVBu6ThatY4TmYa_hTL8JjGsmV=sxJ_FOg@mail.gmail.com>
Subject: Re: [PATCH -next] selinux: remove set but not used variable 'sidtab'
To:     YueHaibing <yuehaibing@huawei.com>
Cc:     Stephen Smalley <sds@tycho.nsa.gov>,
        Eric Paris <eparis@parisplace.org>, omosnace@redhat.com,
        rgb@redhat.com, keescook@chromium.org, casey@schaufler-ca.com,
        jeffv@google.com, kent.overstreet@gmail.com,
        selinux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Tue, Dec 24, 2019 at 7:46 AM YueHaibing <yuehaibing@huawei.com> wrote:
> security/selinux/ss/services.c: In function security_port_sid:
> security/selinux/ss/services.c:2346:17: warning: variable sidtab set but not used [-Wunused-but-set-variable]
> security/selinux/ss/services.c: In function security_ib_endport_sid:
> security/selinux/ss/services.c:2435:17: warning: variable sidtab set but not used [-Wunused-but-set-variable]
> security/selinux/ss/services.c: In function security_netif_sid:
> security/selinux/ss/services.c:2480:17: warning: variable sidtab set but not used [-Wunused-but-set-variable]
> security/selinux/ss/services.c: In function security_fs_use:
> security/selinux/ss/services.c:2831:17: warning: variable sidtab set but not used [-Wunused-but-set-variable]
>
> Since commit 66f8e2f03c02 ("selinux: sidtab reverse lookup hash table")
> 'sidtab' is not used any more, so remove it.
>
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  security/selinux/ss/services.c | 8 --------
>  1 file changed, 8 deletions(-)

Merged into selinux/next, thanks!

-- 
paul moore
www.paul-moore.com
