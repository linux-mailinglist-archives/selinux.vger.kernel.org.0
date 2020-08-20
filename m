Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B739924BA95
	for <lists+selinux@lfdr.de>; Thu, 20 Aug 2020 14:12:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728895AbgHTMMk (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Thu, 20 Aug 2020 08:12:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729578AbgHTMML (ORCPT
        <rfc822;selinux@vger.kernel.org>); Thu, 20 Aug 2020 08:12:11 -0400
Received: from mail-oo1-xc42.google.com (mail-oo1-xc42.google.com [IPv6:2607:f8b0:4864:20::c42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6274C061386;
        Thu, 20 Aug 2020 05:12:10 -0700 (PDT)
Received: by mail-oo1-xc42.google.com with SMTP id a6so350243oog.9;
        Thu, 20 Aug 2020 05:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gbP+k8yzt95moh/W3Im46GthGKIE9e5gU8Im8acLrow=;
        b=KJKGi42vgdM3b210Sn18zvdOyNhPTNRlyjUocs2LC5JOUzHLJz37oW3tyQYNwd93fa
         L+NgfBm+y6BnqKhTGHn5eKH6O6/dO6y/W5PKeHNqiaqhj3gCBP3rMyfVyvPEHn3xt+nw
         o7I92ZyTuSR+uJdmv9+cHla0ryyUqcoJF4w7FQELXK2sCoaVQMQNxIL3x7akCpc6tebG
         cpoZdH9P6d1Tc2i4MJ+e8qgVSd9k3dFL04dCjYWSTUtH09sAyZnpX35xBMmkxWOX94WN
         /GM5oUbIIYq0x/X+1b/d1AWT/lCA8GNFASGbcLSv02uI36fIPUfk0lbRyuEuBTeL4vuG
         eVpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gbP+k8yzt95moh/W3Im46GthGKIE9e5gU8Im8acLrow=;
        b=fKLkWecV8mHEguewFHX5+0HaRls4FMOl16UG61tJ0sIp7jCQZfVtSPOQXmtSo4+wF9
         h4AL64RjgIPLtwchte+RuyEf0fJ1XuoNCxuujetQ3F8+SlSckk4LjDuQVujEXQpKRsHT
         GEwyKo5S2uxmlilda+NfZav4piBZa39wRH3sac+VZZ0AUAZ6YaUgNNDy5DLcQNJ5itEX
         cqk2vzBntdsWDWKkphnI8RXqtjTHgLq8zjbFmDRFYWO82DjHOsYC7n9Bm7ixMPmE5pRs
         yW8V5ezO/7389FmA6MsYaLyj+e2YssqwPGkW/wEtgwWVKGbOoNLzZKAk6mBDed7zLpSe
         hBGQ==
X-Gm-Message-State: AOAM533KC+l4ajcFBg2qg9wGAzO87AOTbSqu3n4Ozkim5aeNr9v3GT0Y
        iboTR2I0WWQ7PitK85QtB4a9rgy8I+COKGfbbV4=
X-Google-Smtp-Source: ABdhPJzni8QcgXOYaJXwlkZc4heHC9kh1Ef4NcJSjgk/vzlEFtaUrPKtBoXK8MiyXtufelLu71nAc1VZD5YbT6WUJAc=
X-Received: by 2002:a4a:3b0f:: with SMTP id s15mr2120684oos.71.1597925530244;
 Thu, 20 Aug 2020 05:12:10 -0700 (PDT)
MIME-Version: 1.0
References: <alpine.DEB.2.22.394.2008201218350.2524@hadrien>
In-Reply-To: <alpine.DEB.2.22.394.2008201218350.2524@hadrien>
From:   Stephen Smalley <stephen.smalley.work@gmail.com>
Date:   Thu, 20 Aug 2020 08:11:59 -0400
Message-ID: <CAEjxPJ6a6Jn5WE73wY+wswDZ3O8y-LDoQgC9FEnwfNjeMM5tEQ@mail.gmail.com>
Subject: Re: [PATCH] selinux: fix memdup.cocci warnings
To:     Julia Lawall <julia.lawall@inria.fr>
Cc:     kbuild-all@lists.01.org, SElinux list <selinux@vger.kernel.org>,
        Paul Moore <paul@paul-moore.com>,
        Eric Paris <eparis@parisplace.org>,
        Ondrej Mosnacek <omosnace@redhat.com>,
        Tom Rix <trix@redhat.com>,
        Ethan Edwards <ethancarteredwards@gmail.com>,
        Wei Yongjun <weiyongjun1@huawei.com>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Thu, Aug 20, 2020 at 6:20 AM Julia Lawall <julia.lawall@inria.fr> wrote:
>
> From: kernel test robot <lkp@intel.com>
>
> Use kmemdup rather than duplicating its implementation
>
> Generated by: scripts/coccinelle/api/memdup.cocci
>
> Fixes: c7c556f1e81b ("selinux: refactor changing booleans")
> CC: Stephen Smalley <stephen.smalley.work@gmail.com>
> Signed-off-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Julia Lawall <julia.lawall@inria.fr>

Acked-by: Stephen Smalley <stephen.smalley.work@gmail.com>
