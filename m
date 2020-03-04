Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 686A41792FA
	for <lists+selinux@lfdr.de>; Wed,  4 Mar 2020 16:09:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726275AbgCDPJv (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Wed, 4 Mar 2020 10:09:51 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:34813 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725795AbgCDPJu (ORCPT
        <rfc822;selinux@vger.kernel.org>); Wed, 4 Mar 2020 10:09:50 -0500
Received: by mail-oi1-f193.google.com with SMTP id g6so2419007oiy.1
        for <selinux@vger.kernel.org>; Wed, 04 Mar 2020 07:09:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+nL6uspM2J46VyikhGiJpN6Zh1NOS1+zGzMUpaj810c=;
        b=brSa49qvsujWCHr4qPDpkFTo9P+9cPkqLOag9tx/5ef++HDjC/3U+QNqzMlcA3AfMA
         V31DLZ0xGZ07qL0TrlAFfdzmwWWqqTKijmR4gOJa8yUpVGYJTE89x+SBKYwYTb6OIxQz
         MzFIgcJCkHgts2Rmvf3DTgE3gTGLpZAYeLtsaJYqwcF/lb97up8OBXkkZmLt2mGvdFXq
         R2eWAsnHimZgVET1hl/nNoHh1NNNDf1Pd4sVaoqGPXL6rv/wDpWxuZ2w4b5xRa3iOGiC
         9+wAaZtgq2biKOcQ8K6Zp5tYgdOdarAAzb8QImXCT9PiOYyiZu9nJYaTYqNWXWcYWnjC
         Rc9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+nL6uspM2J46VyikhGiJpN6Zh1NOS1+zGzMUpaj810c=;
        b=JitQ3cWYGtbc1wBNu+EzBsIQ3mYXQ6/w6z4717nSYTvvpy/Q4/1er7kueYAHwifgyS
         /gKHIlmeVqv/uLDiD5w44WNsKmGK7fUTXkC6lH+Ek0iKzl0J5PYouxDW1rAK2LkCR9hL
         Zt5o7CoM6o8wlTOcbhERYCqHGrOqSsU301byQ4iYoRlXZ9Omxx1KEa2sgqvIwS9x0K/P
         KyYJ7OcYEMV7xIFOCR/f4iK9oKNgc9B4xQ93dAUrq8p2PARSVh1hLm8LDhRfeKDoiycj
         Xx1emH35XwVJ/lK/MVBdHvdhvY6LPkHN1bqIriCey6e2mMFXP4/6yqhnS6k6UPLaGu0l
         GTbg==
X-Gm-Message-State: ANhLgQ3dK5ghp1UZRHYyN3TyQMTEeiYpPofvs3Qp9wiohypV9rl6FUMU
        FBs1vJcPXz9U76ltVcru1a3+FHcNPebSraoCoVJIrQ==
X-Google-Smtp-Source: ADFU+vsd7IGNSkGSi9iy3QoKolISrPFNQ5hAOAmk0gmA2J3sFGu6JvPHz7xjy5tvJk6KVbGPYacUVxwPcMzReyNKIYU=
X-Received: by 2002:aca:d40c:: with SMTP id l12mr2094776oig.65.1583334588401;
 Wed, 04 Mar 2020 07:09:48 -0800 (PST)
MIME-Version: 1.0
References: <20200304072940.GA1026144@brutus.lan> <20200304074251.GA1032355@brutus.lan>
 <CAEjxPJ4o114iFykhm-m7knLx2qfFoO_pnZt66im+Yk6pSbLBmg@mail.gmail.com>
 <20200304143650.GB1032355@brutus.lan> <CAEjxPJ4OPGWnc1uPDmqSuFnbFhzGYxenSyZ7WmxtnJ3Y2BdAzQ@mail.gmail.com>
In-Reply-To: <CAEjxPJ4OPGWnc1uPDmqSuFnbFhzGYxenSyZ7WmxtnJ3Y2BdAzQ@mail.gmail.com>
From:   Stephen Smalley <stephen.smalley.work@gmail.com>
Date:   Wed, 4 Mar 2020 10:10:52 -0500
Message-ID: <CAEjxPJ5T3jeAvF_EGfsctWxzRvda55LEnGd52ei2Z-LG_TDcAg@mail.gmail.com>
Subject: Re: strange pam selinux issue
To:     Stephen Smalley <stephen.smalley.work@gmail.com>
Cc:     SElinux list <selinux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Wed, Mar 4, 2020 at 9:46 AM Stephen Smalley
<stephen.smalley.work@gmail.com> wrote:
> This shows that your libselinux is still calling
> security_compute_user() from get_ordered_context_list().
> In this case, because the source context is allowed to transition to
> many other contexts, the result returned via
> /sys/fs/selinux/user would exceed the maximum size supported by the
> kernel interface (one page of contexts),
> and therefore it fails.  Then get_ordered_context_list() falls back to
> the failsafe_context.
>
> If you update to libselinux git, you will stop using
> security_compute_user() and hence /sys/fs/selinux/user entirely.

BTW, Fedora ran into this limit some time ago and prune outbound
transitions from init_t and perhaps other "unconfined"
domains to workaround it.  But getting rid of security_compute_user()
and /sys/fs/selinux/user is the better solution.
