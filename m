Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 514B5159D2E
	for <lists+selinux@lfdr.de>; Wed, 12 Feb 2020 00:27:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727955AbgBKX1u (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Tue, 11 Feb 2020 18:27:50 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:35590 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727613AbgBKX1t (ORCPT
        <rfc822;selinux@vger.kernel.org>); Tue, 11 Feb 2020 18:27:49 -0500
Received: by mail-oi1-f196.google.com with SMTP id b18so225907oie.2
        for <selinux@vger.kernel.org>; Tue, 11 Feb 2020 15:27:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GQIwR4Iey9SqyBTPvSIcnQ+YLAZloOW5xwQXPpKs1II=;
        b=G3HXWmkUh7/VrPilWhIVjW3UV+g8eJl02dzhNI3d+SbmhX1jd4vIutW00Wj6m5O7f2
         TuEEj0dNJtb1UVq8JHB/LsiqNmYDZuJRJh13TM7elLPNfECfyG9Z2mBSbIY4k8GTBddP
         2IC7xRFEwSSiRreWHJMw2NnajFUF/35Ju9c1nvpVov5WKkmJURlKRMbMTleNzcanyphe
         eKA7eJY9h6lWxc3lo6CMOZHji76uqTFOEpZ/m8bS6WOQR8avyYKkEsB40XBQXXguLpZV
         WSf4TDl0XEdAYh1x6VoE2reAKHFv3A3y0D5dx/xOGZ02qrKxgtFWEcsmNVfoHVjsm/h2
         BRXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GQIwR4Iey9SqyBTPvSIcnQ+YLAZloOW5xwQXPpKs1II=;
        b=YVu9jRZ9wSMPoHay8Iuj+99aPuIIHI4Xyslqojq/22hQ7UuOuuRIQ61F78MLm2WWiv
         mqyVuY9uEL9g/X6TBtU3iPA5WHgJp3Ln0IQjM+OPSB/QvBfHfUs2VVvm/8CkDD1evBTl
         rkUtLl9O/cVsQpv+EJJ0quhia+foSzin4eewvCxIHJ5jRRf0pt/4wPISL0u2bRzKyZIs
         bSTsGTGuDHxdWFGaVMClOrw7TVhPwDq5lTjgHqzkQJTFTjmtazLzgWa9eYWGQBgGy2aK
         NPaTXyIV5ZbSMhaOaA86mBC9Wx3xTLHFbGxIpCrf9PmBYcjW+8/e48zLgDFSiah/qYr/
         rWqA==
X-Gm-Message-State: APjAAAU460e6UF+VBwELAQ7sZFsPNljLL1nlIfWAmKLcidTerXXrry+8
        ZZEVTYTzn0TTpnSmUQWarT+ts/6cWZ0IMcBOWV6s2Q==
X-Google-Smtp-Source: APXvYqzSGcHx5/Yxew+5ozGYgh0EE+OqTNrd+dP5sbaiJ9qdiJ1cWbqh0cflcsziBg8+feMu8WSsPFqrRRfAxEzAOlY=
X-Received: by 2002:aca:8d5:: with SMTP id 204mr4255305oii.141.1581463667061;
 Tue, 11 Feb 2020 15:27:47 -0800 (PST)
MIME-Version: 1.0
References: <20200211225547.235083-1-dancol@google.com> <9ae20f6e-c5c0-4fd7-5b61-77218d19480b@schaufler-ca.com>
In-Reply-To: <9ae20f6e-c5c0-4fd7-5b61-77218d19480b@schaufler-ca.com>
From:   Daniel Colascione <dancol@google.com>
Date:   Tue, 11 Feb 2020 15:27:10 -0800
Message-ID: <CAKOZueuh2MR4UKi60-GVgPkXjncHx8J=mTTjRquB82CfS7DxBA@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] Harden userfaultfd
To:     Casey Schaufler <casey@schaufler-ca.com>
Cc:     Tim Murray <timmurray@google.com>, Nosh Minwalla <nosh@google.com>,
        Nick Kralevich <nnk@google.com>,
        Lokesh Gidra <lokeshgidra@google.com>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Linux API <linux-api@vger.kernel.org>, selinux@vger.kernel.org,
        LSM List <linux-security-module@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Tue, Feb 11, 2020 at 3:13 PM Casey Schaufler <casey@schaufler-ca.com> wrote:
>
> On 2/11/2020 2:55 PM, Daniel Colascione wrote:
> > Userfaultfd in unprivileged contexts could be potentially very
> > useful. We'd like to harden userfaultfd to make such unprivileged use
> > less risky. This patch series allows SELinux to manage userfaultfd
> > file descriptors and allows administrators to limit userfaultfd to
> > servicing user-mode faults, increasing the difficulty of using
> > userfaultfd in exploit chains invoking delaying kernel faults.
> >
> > A new anon_inodes interface allows callers to opt into SELinux
> > management of anonymous file objects. In this mode, anon_inodes
> > creates new ephemeral inodes for anonymous file objects instead of
> > reusing a singleton dummy inode. A new LSM hook gives security modules
> > an opportunity to configure and veto these ephemeral inodes.
> >
> > Existing anon_inodes users must opt into the new functionality.
> >
> > Daniel Colascione (6):
> >   Add a new flags-accepting interface for anonymous inodes
> >   Add a concept of a "secure" anonymous file
> >   Teach SELinux about a new userfaultfd class
> >   Wire UFFD up to SELinux
> >   Let userfaultfd opt out of handling kernel-mode faults
> >   Add a new sysctl for limiting userfaultfd to user mode faults
>
> This must be posted to the linux Security Module list
> <linux-security-module@vger.kernel.org>

Added. I thought selinux@ was sufficient.
