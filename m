Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CCBD3195973
	for <lists+selinux@lfdr.de>; Fri, 27 Mar 2020 16:02:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727185AbgC0PC3 (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Fri, 27 Mar 2020 11:02:29 -0400
Received: from mail-il1-f177.google.com ([209.85.166.177]:40296 "EHLO
        mail-il1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727560AbgC0PC3 (ORCPT
        <rfc822;selinux@vger.kernel.org>); Fri, 27 Mar 2020 11:02:29 -0400
Received: by mail-il1-f177.google.com with SMTP id j9so9043415ilr.7
        for <selinux@vger.kernel.org>; Fri, 27 Mar 2020 08:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rzCdHje3jfGVXR3HDkfIxKMEE0e9YPeOHknziuN5EOU=;
        b=XmqC8LZx7GnvwyW0QrrJHlZPp3PDNfSwjZ+wPaw85S+f8mDnPyO5LnUKEu5UapguEa
         RdEwjIGNOkf2Sp82a4Fjf2q83mX5aqgaWrpD1d3Gh239gAGZTOfocTCzG9WAsGD5wmRI
         PBt4voSZbzkF5MZ117vbKIeciTrxPe8eB2/ShzK0I3ayzC9gBs2hhFgnW5DR6yOv7S2t
         VtBaC6iaUrRVzZtvCbkf1dHTd1kqtpdYys3rpv96siMIUSCzJzM1lBAA6xQCM1KdOMiB
         A+5Uv824YqCfIQMXRr6n08hSXGvuZM6ugSt3p8PP0K4insfnGqB1K1UCKcQwigs0qHPG
         g0Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rzCdHje3jfGVXR3HDkfIxKMEE0e9YPeOHknziuN5EOU=;
        b=i1/igLOR/C1kCv6Dvxf+OPXrNMxHoA2vLropd+uKTfGH2pZAnBqn2W1/JHfZIsnP2a
         gnW9SC+j04UZ5kkr4QbitiVBWp8nEnvH3Vm11NA4eFRtfvYPiIoQTvXiRA+j7UQNK+UP
         /GUA6uYDaYl64lZA+H9wgRK88HIFfC9J+jEbTFmVMT+l/oHyUiQgFlcIUa+B0DJvad/9
         3CT4eGsZcJC8lwaZoGaNUoJjz48GJLUU/rHaKA20PX84DCG53L0roUsG5N3X/hJK3+OK
         6BOfS717ZtN+JbeQP/dz0a1qtTzBsP3gaE0hzfpt1IwCAV1i9DeRa2j99J9v0Rfbm8o4
         lKyQ==
X-Gm-Message-State: ANhLgQ3dBe/vBCMIsSVVZYqVEck+Mc/X7X9q6FF7yLtrtit9pJ2t4htl
        iCMM7AG2GiTf6g5G1yKoKFJ+aU+zZt7WxkGq/zU=
X-Google-Smtp-Source: ADFU+vsFkuWo5PaFp9yyUE75V5/n1OCj1wQLKmQk2nMZW6xv0VUvzVJPJyNRlfm0WGiQrGShB8pmpsbbpLPHcsH/a8k=
X-Received: by 2002:a92:d687:: with SMTP id p7mr6324719iln.163.1585321347888;
 Fri, 27 Mar 2020 08:02:27 -0700 (PDT)
MIME-Version: 1.0
References: <CAGB+Vh7VOy_y2W7rxmaWAOyBQxQz5foFNL1T2hog0er4mnEQ4g@mail.gmail.com>
 <20200326154641.7253-1-william.c.roberts@intel.com> <CAFftDdp8Us2aSmAD5Q+MR3y6WvR2QAbC+_tFGmCwZbWh+0CBTA@mail.gmail.com>
 <CAGB+Vh5P-VKru1-ztYRBe4sr7OdeOpAzATGEBHkj6Q6i6s3mYw@mail.gmail.com>
 <CAFftDdqqjgCBgN+LsV0d0ejHz5mBhuMgLhCHankaCDexFFEY2A@mail.gmail.com>
 <CAFftDdrLuq3Dg+jgB=xW8e+r6WE1qB3iQrpAmLFDta2K+aUP4Q@mail.gmail.com> <CAEjxPJ4HX05X=25Ose1v2jKdS8hqzPUJJaRXo9XX=inZ4Yh2oA@mail.gmail.com>
In-Reply-To: <CAEjxPJ4HX05X=25Ose1v2jKdS8hqzPUJJaRXo9XX=inZ4Yh2oA@mail.gmail.com>
From:   William Roberts <bill.c.roberts@gmail.com>
Date:   Fri, 27 Mar 2020 10:02:16 -0500
Message-ID: <CAFftDdqdf1PSMti+MN10inqZM9NyQa1-0DEEkDZF2BqGUQu-AA@mail.gmail.com>
Subject: Re: cil: Fix DISABLE_SYMVER support and drop last dso.h
To:     Stephen Smalley <stephen.smalley.work@gmail.com>
Cc:     Joshua Brindle <joshua.brindle@crunchydata.com>,
        Ondrej Mosnacek <omosnace@redhat.com>,
        SElinux list <selinux@vger.kernel.org>,
        William Roberts <william.c.roberts@intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Fri, Mar 27, 2020 at 9:46 AM Stephen Smalley
<stephen.smalley.work@gmail.com> wrote:
>
> On Fri, Mar 27, 2020 at 10:27 AM William Roberts
> <bill.c.roberts@gmail.com> wrote:
> >
> > On Thu, Mar 26, 2020 at 11:18 AM William Roberts
> > <bill.c.roberts@gmail.com> wrote:
> > >
> > > > > Josh can you run this on Mac build, I don't have one anymore.
> > > > >
> > > >
> > > > LGTM
> > > >
> > > > Acked-by: Joshua Brindle <joshua.brindle@crunchydata.com>
> > > Thanks!
> > >
> > > Staged: https://github.com/SELinuxProject/selinux/pull/214
> > >
> > > Will merge tomorrow afternoon unless I hear otherwise.
> > Merged: https://github.com/SELinuxProject/selinux/pull/214
>
> Please remember to update patchwork (status -> Accepted) when you merge a patch.
I never even used patchwork, will do and done. But I still want to
grumble, I wish we moved out
of 1960's development.
