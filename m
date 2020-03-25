Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 88BCE192B8B
	for <lists+selinux@lfdr.de>; Wed, 25 Mar 2020 15:54:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727452AbgCYOyO (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Wed, 25 Mar 2020 10:54:14 -0400
Received: from mail-il1-f194.google.com ([209.85.166.194]:35095 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726969AbgCYOyN (ORCPT
        <rfc822;selinux@vger.kernel.org>); Wed, 25 Mar 2020 10:54:13 -0400
Received: by mail-il1-f194.google.com with SMTP id 7so2115098ill.2
        for <selinux@vger.kernel.org>; Wed, 25 Mar 2020 07:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eCUs5JEPxgtPkeo57oeSHCxysnTDuHuiQyJVhCr3t7E=;
        b=jtFj8gSeBmbNV5itsS8ZY5AL/EiMTcqyUSyayRAKYjeeZ7DEWSbyWaM3RIvJU/NHbn
         pKqC7KFOt3xz9DQeNL+8XbuIgudFFpOcUwKX+64giVhnvodoGTEwZp/2enXC0YhM+kQW
         jMXSctyJ7A/zty4lTNatCoVA985vgZJ8jsSbL5h2Kx9WBwpAgT82HnqqkxQPeLYfTwmo
         p9w0covUKbc/MaA5sFnNCzOsJ1y/zh16XEVw1ImCHD+oXdql1CkVtQFZP3mTw6i2tdLq
         qYZCs75ETcbspp4bwpQmrKMjp0Uyf+k1KbAeUuub6+b4VtAYIaTP4acdL86mnSSAzKPf
         JT6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eCUs5JEPxgtPkeo57oeSHCxysnTDuHuiQyJVhCr3t7E=;
        b=EsZ0u07J9ZVN1KbfcTuajikMLjPoOkirM/rH9/MNuvI6l6S5w+U3s0hdeBnGKHIG9W
         vctkAbRK27j4SknA3SCTDZZZJFBv8UCJhHUTcjaWxftvuApmusGY34z9eaShgxSzIBwb
         iKPxfCuNe/j98UuWXaZBV80liyEtVMN28r4isdISZNV+a8HaLY0YdkDGL7S7oj1v/GID
         mT3hajaElYxuZ2dxUQwsO5RwcjV90jIiMkC5EL6i9ce5nlLv1CIWw9CT/zRn0C+GtnnB
         +c/o/9OMNWL0265YX/TvzkYUzqDk/7FeZs9BarUr3YbY/qEDj1GozfepO3vi4CNpRftI
         TyUA==
X-Gm-Message-State: ANhLgQ0UFQNMmYzF/4eSl4cCraRfqBjzQbHWU5R+aExseG9OVaO0jqzX
        xUy7WNXcqnq4SzVGZUM8K3Eb3y0QzIi6ldh8WVI=
X-Google-Smtp-Source: ADFU+vtfSuYomjQO3D9lt0kCBrEonzUm9bpDwxLYL/2YRoZTKpLaVCuvxhjmgImy65tvsrU0K8+ElEC6fyuhqpLS78A=
X-Received: by 2002:a92:bf06:: with SMTP id z6mr3962855ilh.141.1585148053273;
 Wed, 25 Mar 2020 07:54:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200323175037.19170-1-william.c.roberts@intel.com>
 <20200323175037.19170-5-william.c.roberts@intel.com> <CAEjxPJ71--8A6Edm1FN+RSfCp-dCbtVHnqC8Kr9hgZ=qs=9otA@mail.gmail.com>
In-Reply-To: <CAEjxPJ71--8A6Edm1FN+RSfCp-dCbtVHnqC8Kr9hgZ=qs=9otA@mail.gmail.com>
From:   William Roberts <bill.c.roberts@gmail.com>
Date:   Wed, 25 Mar 2020 09:54:02 -0500
Message-ID: <CAFftDdouSw67-AhMDjsg5aAG0MvuiuZhXaY0iwHZ1+2PJzDVVQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] libsemanage: cleanup linker map file
To:     Stephen Smalley <stephen.smalley.work@gmail.com>
Cc:     Ulrich Drepper <drepper@redhat.com>,
        Nicolas Iooss <nicolas.iooss@m4x.org>,
        Ondrej Mosnacek <omosnace@redhat.com>,
        Petr Lautrbach <plautrba@redhat.com>,
        SElinux list <selinux@vger.kernel.org>,
        William Roberts <william.c.roberts@intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Tue, Mar 24, 2020 at 8:11 AM Stephen Smalley
<stephen.smalley.work@gmail.com> wrote:
>
> On Mon, Mar 23, 2020 at 1:50 PM <bill.c.roberts@gmail.com> wrote:
> >
> > From: William Roberts <william.c.roberts@intel.com>
> >
> > The linker map file had inconsistent style in the 1_1 versions.
> > Drop the mixed tabs and spaces and use the consistent spacing indent
> > of two spaces.
> >
> > Signed-off-by: William Roberts <william.c.roberts@intel.com>
>
> For all four,
> Acked-by: Stephen Smalley <stephen.smalley.work@gmail.com>
Merged: https://github.com/SELinuxProject/selinux/pull/213
