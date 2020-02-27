Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4538E1724B7
	for <lists+selinux@lfdr.de>; Thu, 27 Feb 2020 18:12:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729500AbgB0RMj (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Thu, 27 Feb 2020 12:12:39 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:36088 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728389AbgB0RMi (ORCPT
        <rfc822;selinux@vger.kernel.org>); Thu, 27 Feb 2020 12:12:38 -0500
Received: by mail-ot1-f68.google.com with SMTP id j20so3654866otq.3
        for <selinux@vger.kernel.org>; Thu, 27 Feb 2020 09:12:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qeNByKSzp02vBAE7CQ7YKpnnlAXHOv08LeYTzEfzjSg=;
        b=aaNLPZpOFVksRE+1W//GL39WYcjJHlVyC/OtKavkwuGKZimaf/y9E3FUi3OdjhyKeo
         Np7YgBJ6/8u1oXFZ8q9XlBI1K9RAO+bP4dE954XQyKJ39ArrMCfo2AdMP971QsXSPAaf
         lBBKb9zVpJzIQQlHXfnXe9OLzF/ETHotYE+yB5Huo/fKWD15w9zmmaf2M2edkFhCy2v4
         O+tc5LsLMI1bi4+qBOP+3wWODR69s/GkRZ4FSP14bBUtPU1Gn4wXB8xdUzC4lSD62wfs
         OSr+p3shW0m7+IO6MAUs+9cIf13U9H6uMoVSahROcq24NiQs2iSt3Bnh2tHZyA/ql7ja
         D/Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qeNByKSzp02vBAE7CQ7YKpnnlAXHOv08LeYTzEfzjSg=;
        b=ltw6Pn2TDVsSOWhZ9oIcUg3HaF1SCUX1u/N9bp6O73Oq9AXM9fD4d1rWTWuZskR6ui
         V/c2zTIL3fgaHxB4LQCTwfVI4aKRukQeTiQkfXXiJpMDK0IuXdu686MuA3rtLsuI9Wk9
         6U8d6TPwwHr7BoXVV7FdoEcIAgX+imuyFxZT532sTslyOq0gkPjpaS5c+DwsEMNcxcUN
         QC21nYZHWWOkj5ZkiBbvVMjMUv3GWLrm7YfEAauU8oqRS/47PTwxhT8cWXioibQTtDIT
         e3Q4HEuQPVcPt1BkI0uIHj0TeHYx9Ycn56jj7i89IlKv9UkoK1c+c3OQJj9gA57CYleK
         u7Mw==
X-Gm-Message-State: APjAAAUo7yBDFW0ZbjdvSF+f5QNLIy6w86QKUfXCnUZRqXjrsrr3RAk9
        V1U/cb/klYfw12W75kx38mG/pDxMdaEKAnxCs6upAQ==
X-Google-Smtp-Source: APXvYqwzEYqu0cwf/BuGagiwc6d9GxglDi87dkP2jOcPJlqGphYrDVkmoDgpux/Q9P38QuiHiWQAmRtVP49S5/h1fBY=
X-Received: by 2002:a05:6830:140b:: with SMTP id v11mr612807otp.340.1582823558043;
 Thu, 27 Feb 2020 09:12:38 -0800 (PST)
MIME-Version: 1.0
References: <20200221131825.91499-1-richard_c_haines@btinternet.com> <CAB9W1A0Cyg577HvJ8hnhWbvC697QSLmym07hi=Faip1j0gdLRQ@mail.gmail.com>
In-Reply-To: <CAB9W1A0Cyg577HvJ8hnhWbvC697QSLmym07hi=Faip1j0gdLRQ@mail.gmail.com>
From:   Stephen Smalley <stephen.smalley.work@gmail.com>
Date:   Thu, 27 Feb 2020 12:13:46 -0500
Message-ID: <CAEjxPJ6ii71KmnynLTjG5bO5iR7Ova0b9LqaVKgaoA1DjLB9vA@mail.gmail.com>
Subject: Re: [PATCH V2] selinux-testsuite: Allow nfs test script to close cleanly
To:     Stephen Smalley <stephen.smalley@gmail.com>
Cc:     Richard Haines <richard_c_haines@btinternet.com>,
        selinux@vger.kernel.org, Ondrej Mosnacek <omosnace@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Tue, Feb 25, 2020 at 9:06 AM Stephen Smalley
<stephen.smalley@gmail.com> wrote:
>
> On Fri, Feb 21, 2020 at 8:18 AM Richard Haines
> <richard_c_haines@btinternet.com> wrote:
> >
> > Whenever a failure, close NFS cleanly.
> >
> > Signed-off-by: Richard Haines <richard_c_haines@btinternet.com>
>
> I'm not much of a shell programmer but this looks good to me.
>
> Acked-by: Stephen Smalley <sds@tycho.nsa.gov>

Applied.
