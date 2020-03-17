Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C9BA2188CFE
	for <lists+selinux@lfdr.de>; Tue, 17 Mar 2020 19:20:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726287AbgCQSUI (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Tue, 17 Mar 2020 14:20:08 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:45705 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726189AbgCQSUH (ORCPT
        <rfc822;selinux@vger.kernel.org>); Tue, 17 Mar 2020 14:20:07 -0400
Received: by mail-ot1-f68.google.com with SMTP id e9so15493829otr.12
        for <selinux@vger.kernel.org>; Tue, 17 Mar 2020 11:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hxRIW/bxEO4aCDnM+sUZArHCqadG8Bub5dKDmrr5pDA=;
        b=WthQaNe+pX+Mq1Oy+md887obhAENdzkbgqxTnGNj/4QpcA7KFeZ0MsUfd4298QRpcc
         yDBnbmjHEAmbxVqUkeYELKX40Cro7s9PRKrrT4r4ZnsPAnapEzs0wIhpmCQV69R3GArP
         bS1lYbGjq3Qufcyhc5j8UctYHilnnA6ZUx+LlVG6xyhmNWUqtxs1VNVBP3TtyNYcPNY+
         qnNuMc13afJ/Wl4T9gRINLpxqeTtPqtxEY1cR8y8EQ5bdySCGgTbyFpmsgApTVJGyd6F
         cRYsyffYPsVELDHJfkRiqARaA0A1Eyb53PWiUl5ZmXUeo+9WT3sTFmfsorDSOg+hGaPx
         fZBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hxRIW/bxEO4aCDnM+sUZArHCqadG8Bub5dKDmrr5pDA=;
        b=gMZnhiqha1nKaRIm3QslV3w+DQke9QqaCzl1M5u0GSnnOmaMu6DxAbgZoqhbjRZmzi
         MAaomiuipj+Ui+RHOvFbBy9nF7L/IMZF37oLBpcVq/kMPnxc5ybq3LuxJNwy4oTG5zFW
         GlgPA4oYjdTI6iwBHHza2bZ3wlY6zsVS1J9QxA0FkEKiN0vB58LFRgbFjeHYPzEkaYSq
         LyTEFOTnv6ZQ9iiOg3X9Gv8dwlWb2BnSDPEYnUyeG6O290vzpA6AHlgWey7OeVtpLOqa
         rHCDTnDQ3r0UeMlXghjsa/aBAOEbXLxtWZQpKpDvPeNEH1IVdxO35zfg8jSo9jwI3laB
         ECzw==
X-Gm-Message-State: ANhLgQ38UOrukq96aik2qmjP92xUNGm323jlUC29qZhsP4GGuAkPdyta
        Pqw5flqfotUyjlM9nUVkrJ5hUQrT2YA/a5DzMPukXLeT
X-Google-Smtp-Source: ADFU+vv9vIEHbJho0zBGYV27TCp1vvTiKi5UPF6gq9U6UTKNqzwy5meOWscUo1qYpKqsB6PXvAFUIcCPkMlNOSrdUME=
X-Received: by 2002:a9d:383:: with SMTP id f3mr474418otf.165.1584469206952;
 Tue, 17 Mar 2020 11:20:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200227160257.340737-1-omosnace@redhat.com> <20200227160257.340737-2-omosnace@redhat.com>
In-Reply-To: <20200227160257.340737-2-omosnace@redhat.com>
From:   Stephen Smalley <stephen.smalley.work@gmail.com>
Date:   Tue, 17 Mar 2020 14:19:56 -0400
Message-ID: <CAEjxPJ7=e_RT0sEFr8i4pNyKmz2F3zVfScswWp6vwzO3CH3eGw@mail.gmail.com>
Subject: Re: [PATCH 1/3] libsepol: skip unnecessary check in build_type_map()
To:     Ondrej Mosnacek <omosnace@redhat.com>
Cc:     SElinux list <selinux@vger.kernel.org>,
        Stephen Smalley <sds@tycho.nsa.gov>,
        James Carter <jwcart2@tycho.nsa.gov>
Content-Type: text/plain; charset="UTF-8"
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Thu, Feb 27, 2020 at 11:03 AM Ondrej Mosnacek <omosnace@redhat.com> wrote:
>
> I copy-pasted it from a different part of the code, which had to deal
> with policydb that isn't final yet. Since we only deal with the final
> kernel policy here, we can skip the check for the type datum being NULL.
>
> Signed-off-by: Ondrej Mosnacek <omosnace@redhat.com>

Acked-by: Stephen Smalley <stephen.smalley.work@gmail.com>
