Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F220B129BB3
	for <lists+selinux@lfdr.de>; Tue, 24 Dec 2019 00:03:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726833AbfLWXDT (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Mon, 23 Dec 2019 18:03:19 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:38840 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726846AbfLWXDR (ORCPT
        <rfc822;selinux@vger.kernel.org>); Mon, 23 Dec 2019 18:03:17 -0500
Received: by mail-lf1-f67.google.com with SMTP id r14so13786668lfm.5
        for <selinux@vger.kernel.org>; Mon, 23 Dec 2019 15:03:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MgW9n/m4gcYISQYozZa4aSF4iNn8BHSm10X5adtcj/E=;
        b=wJreOXHn5uk1YuFvki6L16MpfoJQayaMtM2qOj8R9DNPY2D2xyhOf/Mq5Cbo6fC42g
         1P0hImFFJBWNmY4BfguVj5cp90g/UGfkkaeHzeyL2FXREPewt0aa8b97/kuyGdewG843
         3M+hwTqoe4ctJVhYAXb8k6KTKvaVClDMBQz8jXJnEsirhk5TEYgowxDfcRqxVg2dSf2P
         pYP4FRMBysXfwUOcKhO6a7wH0GE+W28O+DI+lmxsLjeDPLQ0daJ3pzKgefgmKiiF70Wa
         2PcWj55+lgtMmyFKO4uXOv4nJrWBkmCWFnkdeseGvLHQwzSigRc5V1Sgum9PiVqftioC
         A7cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MgW9n/m4gcYISQYozZa4aSF4iNn8BHSm10X5adtcj/E=;
        b=tYFoUSFqGQfOWS8B7UMK2SBFf34m0LQS7ONfE8eTiICT099kf9AQHywl8xarXQN5ZQ
         FWnt0yWHAhn9+Ajvu43mYAttWPmCbJXNe71WyIAQQoCxGy8MFt3Xdb017CWTirZj6zsG
         eflVyR4qQWfcp1FRB77nbpbOG5T3JINN79lHIjLxT/LAh9d2xx3n1P2AyF/07fNd/lp/
         l6cD/9JzOh8B1HdXsR1N+/ImzOc7MIcKjPQmGpolMOjc16kDkewuOEnb8T/mYOlEfDHp
         IlVEXcpYG8rzTZb20OdgTiSpz1AA6xMcJ8iiPCzJ2NzN8dN+B16ZV4EukzvIdYcOWxjC
         CRbQ==
X-Gm-Message-State: APjAAAW4XruJ+/XIhryaPPmDhGXj+vDEf97arIaoMm0ifq4fVwg0nT2c
        iS5g27Va6QpCskZ0UDrqAEwWEhC2OAfbnGbv4jhbC5g=
X-Google-Smtp-Source: APXvYqxSh8JRtgJP3kXsVYH5qFYKVqiSG53d9jEFEN1BvT0WyoHP2+3PXgofkjT5qFzJmOYDEbLXBcIOvkxXz/8PlGg=
X-Received: by 2002:a19:86d7:: with SMTP id i206mr17447598lfd.119.1577142194497;
 Mon, 23 Dec 2019 15:03:14 -0800 (PST)
MIME-Version: 1.0
References: <157714208320.505827.13006028554511851520.stgit@chester>
In-Reply-To: <157714208320.505827.13006028554511851520.stgit@chester>
From:   Paul Moore <paul@paul-moore.com>
Date:   Mon, 23 Dec 2019 18:03:03 -0500
Message-ID: <CAHC9VhTdDGehupfYGmuijRw9BZv2eu289t-fbn_qUdTftU_70A@mail.gmail.com>
Subject: Re: [PATCH] selinux: ensure the policy has been loaded before reading
 the sidtab stats
To:     selinux@vger.kernel.org
Cc:     Jeff Vander Stoep <jeffv@google.com>, linux-kernel@vger.kernel.org,
        lkp@lists.01.org
Content-Type: text/plain; charset="UTF-8"
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Mon, Dec 23, 2019 at 6:01 PM Paul Moore <paul@paul-moore.com> wrote:
>
> Check to make sure we have loaded a policy before we query the
> sidtab's hash stats.  Failure to do so could result in a kernel
> panic/oops due to a dereferenced NULL pointer.
>
> Fixes: 66f8e2f03c02 ("selinux: sidtab reverse lookup hash table")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Paul Moore <paul@paul-moore.com>
> ---
>  security/selinux/ss/services.c |    6 ++++++
>  1 file changed, 6 insertions(+)

Merged into selinux/next.

-- 
paul moore
www.paul-moore.com
