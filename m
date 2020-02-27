Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AAE8E17233B
	for <lists+selinux@lfdr.de>; Thu, 27 Feb 2020 17:25:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730228AbgB0QXO (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Thu, 27 Feb 2020 11:23:14 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:42153 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729699AbgB0QXO (ORCPT
        <rfc822;selinux@vger.kernel.org>); Thu, 27 Feb 2020 11:23:14 -0500
Received: by mail-wr1-f65.google.com with SMTP id p18so4118139wre.9
        for <selinux@vger.kernel.org>; Thu, 27 Feb 2020 08:23:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=56uSMi/ZMwCmM/QvlFKGmcGHfeVYWormXD9fUzxQc4s=;
        b=aWN7zd2BFsTQLHJlkau7Zz05hFV2+YlloyX6R71TnzbxkUToNsIytSfyREwmpdA+bD
         uMSaBdQystjGEnhIBmsXaTLJTrq7V84ziwx6UhHbay/nkE49MWaHSqI/XwyI/4iL4pGh
         34Mj2ARtjTbWm9cAOmOGNIaYn98Jma42WITe80wPmgGYDf+bz/4QDVUYA2Z2+x8ddwDa
         OiyKfuU3ai1pJeVBQmc6MJ9FQF/aYFXzNPB3OR9WUVVMn1155xkGxMVdUl1QBl7lZ+6w
         ximOATWiRgHKovA7hYsapSNbi0kXk2wUDLcYWdz6bkpXBcQj5i9/0nntB0C9RXWKH+GE
         ZqYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=56uSMi/ZMwCmM/QvlFKGmcGHfeVYWormXD9fUzxQc4s=;
        b=VZrw9MMPkqJzTimq7MRQwcCEEHuN4sBoi2rdTkTSAbR8aqAHsyBRO5NvRsYvlILzle
         2dkRfYLmRsUhV+bJoN4YKKzLjlyiRtZ81jjyJn02N+M51mKe7ESqLqwpXtucLRxR6w9/
         46SSer6kfxiTEqZ+WofDuKzfXGSujwHLtuiithrNG7euQc1Xozp/yeu8flF2Zb0pYfmi
         Jj1i9vTuGFGye4+Kt+nSDAsykwLJlgYA9zfyk3C4wH7cwhjz5Z2zscs40ZM42w61kTnO
         ul2iGbmE5X04naf5JRM6wHmX1ojlrLozfFoZnDyxnW2UXA/tiol3qCsHRthhuVBWG4ot
         PaSg==
X-Gm-Message-State: APjAAAUYjcti7yhWoiIPw1D42zcqSLrpCQpry+HoeZmUbDn0LEp0EAlF
        jxCHHxjWAbkVQ7Am/POJ5kEKN7G+JKSSTh1QROs=
X-Google-Smtp-Source: APXvYqzRnOWm0U7OG9GmdN06FhH0R8//qByZaCwLnBq1jKBc57+LYOqWZWUOx+TPe1Qi+WZaTIw05B0vUwKgVEffTfs=
X-Received: by 2002:a5d:4bd0:: with SMTP id l16mr5940131wrt.271.1582820592003;
 Thu, 27 Feb 2020 08:23:12 -0800 (PST)
MIME-Version: 1.0
References: <20200221083819.1124890-1-plautrba@redhat.com>
In-Reply-To: <20200221083819.1124890-1-plautrba@redhat.com>
From:   Stephen Smalley <stephen.smalley@gmail.com>
Date:   Thu, 27 Feb 2020 11:24:19 -0500
Message-ID: <CAB9W1A2_hSh4j7_KP2Bbi57942yEJO9xy65XxPJxoFdckZRocg@mail.gmail.com>
Subject: Re: [PATCH] libselinux: deprecate security_compute_user(), update man pages
To:     Petr Lautrbach <plautrba@redhat.com>
Cc:     selinux@vger.kernel.org, Stephen Smalley <sds@tycho.nsa.gov>
Content-Type: text/plain; charset="UTF-8"
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Fri, Feb 21, 2020 at 3:40 AM Petr Lautrbach <plautrba@redhat.com> wrote:
>
> From: Stephen Smalley <sds@tycho.nsa.gov>
>
> commit 1f89c4e7879fcf6da5d8d1b025dcc03371f30fc9 ("libselinux: Eliminate
> use of security_compute_user()") eliminated the use of
> security_compute_user() by get_ordered_context_list().  Deprecate
> all use of security_compute_user() by updating the headers and man
> pages and logging a warning message on any calls to it.  Remove
> the example utility that called the interface. While here, also
> fix the documentation of correct usage of the user argument to these
> interfaces.
>
> Fixes: https://github.com/SELinuxProject/selinux/issues/70
> Signed-off-by: Stephen Smalley <sds@tycho.nsa.gov>
> Acked-by: Petr Lautrbach <plautrba@redhat.com>
> ---
>
> It looks like the original email didn't get to the mailing list. Therefore
> I'm resending it for a broader audience.

Can this be merged?
