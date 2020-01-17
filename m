Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AD2A814012E
	for <lists+selinux@lfdr.de>; Fri, 17 Jan 2020 01:56:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733290AbgAQA4v (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Thu, 16 Jan 2020 19:56:51 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:35106 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733306AbgAQA4v (ORCPT
        <rfc822;selinux@vger.kernel.org>); Thu, 16 Jan 2020 19:56:51 -0500
Received: by mail-lf1-f68.google.com with SMTP id 15so17046588lfr.2
        for <selinux@vger.kernel.org>; Thu, 16 Jan 2020 16:56:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oyvosXzEB2IL3iJAWLfHwSnuFrj405AnxnEHJ7so3Wc=;
        b=LIfpeQ5T6CxLTwViwmzdZl2GmUqFUKYyZByCd7dc+MedxGcC0d60pN2YNq/0Ti7fHC
         SHqBfJvFXTJKXrPJ920hy7WaBBz49GXpfPWGkojew68St6ZyOHNYNXyVNmUNo1x6W1aV
         qi0jiq+Or+Ohe9TYWO6sJU9QRIFey0ciP9RqTTtyzq9xRkZ3okqWDh3Q67UqBn3RnjCQ
         tFq5kI81M7xpJJZjKaBkL6LLW8QF0QslgvJhIbuP4ERgcZgb9nmIOkrQa+e/yTZepwSm
         tZRk1VDQ5B4QiDC89O0FPBHruJdi9Iji/no9vOUztZvaueTs7BOauej0C6gL3yfo/P/R
         VmOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oyvosXzEB2IL3iJAWLfHwSnuFrj405AnxnEHJ7so3Wc=;
        b=IC7JXeseXFey6zJnTAiFZbOtVTweEmYJS8ys2qJ40QZPqOeNq1MZO4vrlmnkkgjfLR
         Q1YtV6mdWLpo0dpe9AXrsF20VEmwJHHHXk+INomVopfBdM/uboyzMqS0MvsLYkr7UgrM
         w0tegHJsimbpWbW6j1ypkAwhhbiqtRrHGhI7mvNhSW3f19i99WqX4x+rg1TLLG0lSYLl
         bhU8H0WfZmHHiskruPaRLFzQ0GuEdwhv39VlJHoFPecgmZv2DqSCuii8SzYGeq5hY8Fp
         dxv6wpOrantufSXQJ+ZtaLr24uGBCudfVhN4nrPPop9h6Pe9MvanGivjGbiXH4NMM8vP
         fncQ==
X-Gm-Message-State: APjAAAVr9XOplop3RpPYeYkghJuBuTKqGCDWJNAnLKid5SIH3Nl+Gnm2
        IZqobP77v3/OfzLQC+2zFbA8Al/+v2Wg3jr+T505
X-Google-Smtp-Source: APXvYqzRZK8aZ2fqUgQJAWgLxbZ9jMuZ0wDc55PXcAgS81OoanzFt1df2lGo2TkY3D2VyxqmUJWwpf3pHbiIUt0B5VQ=
X-Received: by 2002:ac2:5f59:: with SMTP id 25mr3858949lfz.193.1579222608926;
 Thu, 16 Jan 2020 16:56:48 -0800 (PST)
MIME-Version: 1.0
References: <20200116120439.303034-1-omosnace@redhat.com> <bfa5a08c-9e72-5de5-4f57-c89debd94590@schaufler-ca.com>
 <CAHC9VhSGW9OwTPf1yHLea3oN6bRrpawsF4kSSgK1NkX9sXn5cQ@mail.gmail.com> <de3d7e3c-c37b-7051-f1ab-cb8e767cbfba@schaufler-ca.com>
In-Reply-To: <de3d7e3c-c37b-7051-f1ab-cb8e767cbfba@schaufler-ca.com>
From:   Paul Moore <paul@paul-moore.com>
Date:   Thu, 16 Jan 2020 19:56:38 -0500
Message-ID: <CAHC9VhQGgRVpygrqXS0EupXA5fWjJfO6reKJuxTCE3L7bxdp3w@mail.gmail.com>
Subject: Re: [PATCH 0/6] selinux: Assorted simplifications and cleanups
To:     Casey Schaufler <casey@schaufler-ca.com>
Cc:     Ondrej Mosnacek <omosnace@redhat.com>, selinux@vger.kernel.org,
        Stephen Smalley <sds@tycho.nsa.gov>
Content-Type: text/plain; charset="UTF-8"
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Thu, Jan 16, 2020 at 7:49 PM Casey Schaufler <casey@schaufler-ca.com> wrote:
> On 1/16/2020 3:59 PM, Paul Moore wrote:
> > On Thu, Jan 16, 2020 at 6:09 PM Casey Schaufler <casey@schaufler-ca.com> wrote:
> >> On 1/16/2020 4:04 AM, Ondrej Mosnacek wrote:
> >>> This series contains some simplifications that I discovered while
> >>> working on another patch. I believe they also save some run time
> >>> (although not in any perf-critical paths) and some memory overhead.
> >>>
> >>> The first patch is a cleanup in security_load_policy()
> >> It's a real nuisance that the security server code uses the
> >> prefix "security_". If you're making significant changes in
> >> the security server it would be really nice to clean up the
> >> namespace collision.
> > For all the people lurking on the mailing list reading Casey's
> > response, *please* do not do this (without discussion).  That change
> > has the potential to wreck a development cycle.
>
> Of course discussion is critical, and breaking a development cycle
> would be a Bad Thing. I only suggested this because I'm seeing a bit
> of clean-up I would consider to be in the same vein. I was not
> advocating disruption. Carry on.

FWIW, the cleanup you've seen lately has been mostly removing empty
wrapper functions and changing how we allocate/manage things; what you
are proposing is mostly a bulk rename which is quite different in my
mind.

-- 
paul moore
www.paul-moore.com
