Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 88C4D1795C4
	for <lists+selinux@lfdr.de>; Wed,  4 Mar 2020 17:54:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729717AbgCDQyY (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Wed, 4 Mar 2020 11:54:24 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:43004 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725765AbgCDQyY (ORCPT
        <rfc822;selinux@vger.kernel.org>); Wed, 4 Mar 2020 11:54:24 -0500
Received: by mail-ot1-f65.google.com with SMTP id 66so2673766otd.9
        for <selinux@vger.kernel.org>; Wed, 04 Mar 2020 08:54:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Mko5tCHXb9wOubxn95W0/k8MzI52agciYni1sb6mJdk=;
        b=E7cgsG55bO6lj7skjkAxmTPQEEDD4ogzX4UJe1pxag9P4hM9VkHUCN8PR99nx1MIZP
         nOYvuBtl3MWPHHI85c9nt/BHZ8OImbmQp66/aAgNSltsu+fG9gt7jVGPM+DtFcTQaeIq
         YPRvMeJANYuzqaCe7yX5TmwR6e4sF3jw5VJu21SvtAJuwNgNRio5bOKKoB/kIDcFiDP3
         9W2zvbbL7Fo0b4sBv0m87r6p4K2i/nvBGsloeKYSTXDdJ5pNK7QCNYCLVgNKBgr+OfN8
         aB79BdA+qRliutZqdAiysck0rXNkWBLngFA9djXi9bgxS3Fo3EJe5gArQNPJMBe8xUpK
         uExw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Mko5tCHXb9wOubxn95W0/k8MzI52agciYni1sb6mJdk=;
        b=PPSxuJdXSemCc5Et83Pxl0+GYb9MUqxDXQqmIvf3eO6Y8eKcGobUPZrhgRD5P/J0zS
         lSMeW46kcll8T0i8sVbU+BGMzmwd3LhtDb1x+9eCnhWcaV7bPzcieM3Sb6fmrrxHqkp3
         S7CmXjvAlKTOmRMrS0DiRHni8YEIevUpOgzOH+sPV9sBnAWGmAfXkBSLj4bEqA+/L1zw
         psOzkW9X130IDLPm9dST/MFVEzKw6teBi1N1l/ubT6ESiNObRODdXz61LiEpFIM8iu4Q
         EFHwwgOqjwgNzWJbO5LVg2r1OxqTwck4F3DZa0T7KyKZ4l6F8pNiUizPZCiBA30rPypa
         dBnQ==
X-Gm-Message-State: ANhLgQ1OX3LjMsB+dcfEVKTMklujfzoKVsbGK2o80muvDErYQVYCCniQ
        STn75XXDI53430pHOUNB+D4TUQQCyWTVN7WkwQs=
X-Google-Smtp-Source: ADFU+vtaAJBMUNOlSYvcsi7AqBWAhjrsK85vikWsmMLhxFSjWOLMyh1D8ywGiQdmciinn/nAh5qt+Pr3vLg+BFIQkn4=
X-Received: by 2002:a9d:6e85:: with SMTP id a5mr2951667otr.89.1583340861157;
 Wed, 04 Mar 2020 08:54:21 -0800 (PST)
MIME-Version: 1.0
References: <20200303085233.137371-1-omosnace@redhat.com>
In-Reply-To: <20200303085233.137371-1-omosnace@redhat.com>
From:   Stephen Smalley <stephen.smalley.work@gmail.com>
Date:   Wed, 4 Mar 2020 11:55:26 -0500
Message-ID: <CAEjxPJ5XHa2JLMf_BmhHV=LNBUe7qgM8Le6_PMX=jYjGb2OXvA@mail.gmail.com>
Subject: Re: [PATCH testsuite] tests: add test for default_range glblub support
To:     Ondrej Mosnacek <omosnace@redhat.com>
Cc:     SElinux list <selinux@vger.kernel.org>,
        Joshua Brindle <joshua.brindle@crunchydata.com>
Content-Type: text/plain; charset="UTF-8"
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Tue, Mar 3, 2020 at 3:54 AM Ondrej Mosnacek <omosnace@redhat.com> wrote:
>
> Adds a basic test for the "glblub" default_range mode introduced in
> kernel commit [1] and userspace commit [2]. The test vectors are taken
> from the original commit messages.
>
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=42345b68c2e3e2b6549fc34b937ff44240dfc3b6
> [2] https://github.com/SELinuxProject/selinux/commit/9ba35fe8c280b7c91ec65b138d9f13e44ededaa9
>
> Cc: Joshua Brindle <joshua.brindle@crunchydata.com>
> Signed-off-by: Ondrej Mosnacek <omosnace@redhat.com>

Acked-by: Stephen Smalley <sds@tycho.nsa.gov>
