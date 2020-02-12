Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2F600159F2A
	for <lists+selinux@lfdr.de>; Wed, 12 Feb 2020 03:41:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727639AbgBLCl1 (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Tue, 11 Feb 2020 21:41:27 -0500
Received: from mail-ed1-f67.google.com ([209.85.208.67]:40170 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727609AbgBLCl1 (ORCPT
        <rfc822;selinux@vger.kernel.org>); Tue, 11 Feb 2020 21:41:27 -0500
Received: by mail-ed1-f67.google.com with SMTP id p3so604718edx.7
        for <selinux@vger.kernel.org>; Tue, 11 Feb 2020 18:41:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4mxgsuujbkVm0UYDymtnXLk7tRjATrw9oP4lV2FQnJA=;
        b=ElRRqXJIrVBLRrQlDF6LLby9xa6n7dorDKvwW5eSWJ8gMmOFcQmbnqyCHNJYw69HV0
         xAWsCYXX5Su7K3EFuMKMyShQauFr82bHUS8fvUrNJg0SfCdv0S5uGUaoEPc8SGjgqSib
         HcQiOyyiBcp+XYlonAXenInCsutUDTZGNjDZj1eCd08nuyT1hM9YlfTL9slMw1/1I+lT
         ID8kbqezcuzE0yP6xq4CKMlMWNuLJ/GRT2XKVPV8rLpQnC3bnTmzkjdzVgVFZ5+AVs2M
         YTRtJsJ3WS5YaqUOEtGd2ERwIrkcG3yi3RVCie2Cl+8UTRtMhxfndAoKJ1qNRZ/+cPAv
         a6mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4mxgsuujbkVm0UYDymtnXLk7tRjATrw9oP4lV2FQnJA=;
        b=DkYjforuAPNvIE2tVTaZjQho3dHMDK26HJ4FsdFsFdnoFTEHsg/Zr+uu+IqahkCHhZ
         q1/SMxLikz6rdU0SHOwBGgYH3kaf4LRKs2KIymaOEOGqz5kxEV4Uh3acmZiBpcF/JYQ3
         8nYvpVFvYUW5wv6L7iX0BSfz29Rb7a6wT9JdFXKEBBoQXyTpolpJwed7OA78h3Xaxkv+
         5chisT1k534FzZTb1OE3ytc6IIUCRnz54nuICm4k9rtlnqdFDu3QGUOG3+M71wO2Bzal
         P1MSgOHmk60sq3nZSLzR7gxBYMpp3N2J3T/F7A8yhy/wUmC/FR/ODo9DRel3QhLxQ8yp
         lGAQ==
X-Gm-Message-State: APjAAAUjI3oXQ2CsZY3TAe3d92ccRggx7HRT5ftgCSKu1t5g3C30FPMw
        ZsMJiw07js7F6N8t7ZkxZgjRdakpkndEY4jk+C7OiDDeoQ==
X-Google-Smtp-Source: APXvYqwvrKHCwWcbrSuiRYMcZFclntmq3U9DbpVPTfFDI/upuh2Iql9tdMnL09g/b15/khGWQCEE7fEnqxzBYorQsIw=
X-Received: by 2002:a05:6402:61a:: with SMTP id n26mr8163491edv.135.1581475285579;
 Tue, 11 Feb 2020 18:41:25 -0800 (PST)
MIME-Version: 1.0
References: <20200203112723.405341-1-omosnace@redhat.com> <20200203112723.405341-3-omosnace@redhat.com>
In-Reply-To: <20200203112723.405341-3-omosnace@redhat.com>
From:   Paul Moore <paul@paul-moore.com>
Date:   Tue, 11 Feb 2020 21:41:14 -0500
Message-ID: <CAHC9VhQ2F=C0+bWFBHYWTj-QC+9HG-APTTujqGk77+-Jwb72hg@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] selinux: convert cond_list to array
To:     Ondrej Mosnacek <omosnace@redhat.com>
Cc:     selinux@vger.kernel.org, Stephen Smalley <sds@tycho.nsa.gov>
Content-Type: text/plain; charset="UTF-8"
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Mon, Feb 3, 2020 at 6:27 AM Ondrej Mosnacek <omosnace@redhat.com> wrote:
>
> Since it is fixed-size after allocation and we know the size beforehand,
> using a plain old array is simpler and more efficient.
>
> While there, also fix signedness of some related variables/parameters.
>
> Signed-off-by: Ondrej Mosnacek <omosnace@redhat.com>
> ---
>  security/selinux/include/conditional.h |  8 ++--
>  security/selinux/selinuxfs.c           |  4 +-
>  security/selinux/ss/conditional.c      | 54 ++++++++++----------------
>  security/selinux/ss/conditional.h      |  3 +-
>  security/selinux/ss/policydb.c         |  2 +-
>  security/selinux/ss/policydb.h         |  3 +-
>  security/selinux/ss/services.c         | 28 ++++++-------
>  7 files changed, 43 insertions(+), 59 deletions(-)

Merged into selinux/next, thanks Ondrej.

-- 
paul moore
www.paul-moore.com
