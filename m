Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF36B1FF421
	for <lists+selinux@lfdr.de>; Thu, 18 Jun 2020 16:03:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726008AbgFRODY (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Thu, 18 Jun 2020 10:03:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725987AbgFRODX (ORCPT
        <rfc822;selinux@vger.kernel.org>); Thu, 18 Jun 2020 10:03:23 -0400
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com [IPv6:2607:f8b0:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12D62C06174E
        for <selinux@vger.kernel.org>; Thu, 18 Jun 2020 07:03:22 -0700 (PDT)
Received: by mail-oi1-x244.google.com with SMTP id p70so5127935oic.12
        for <selinux@vger.kernel.org>; Thu, 18 Jun 2020 07:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iVoP6uePzzmv5nXWOGFqWxQiZaEL81EC0qqnLxva5No=;
        b=D9T10Deun3TKhlmlhtpArdCWuTU+ap6WRzTyp/hZhIZGxgMd++dCQbjuIcKmlLITuR
         X3z/IrjeJvPRwpKvYgN50uVw/yNNOaN3jFw3jvB0Dil/pdctUAHDO+xp/TcdbN95okQY
         n/4HNqaKugGmsfR1QQmg7GaeMJuqsp4eSZIU7GhAnwTdh5oQtrRzCMpzHu7cllRT0VY1
         hoAyGlBQu6JNX8PTEmT3b40HbbL9nXyND5GVcNVdTj4Mqo7MD9+q222V2G2spBOX9cn8
         RWllHFuG9FBn0u6hLTdJwjptwzU2RG9d9b1EkFN4goB9KjdikZzCNk17rvjlRB+m8Gvx
         oiKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iVoP6uePzzmv5nXWOGFqWxQiZaEL81EC0qqnLxva5No=;
        b=rtkxWJ0DSCPS6lJkO0IRJdAL8etTXdy55kgRRffHC1OqtWijwijoLDR3GPk0C+vw90
         vmvMz1M7656WCeyiIzQDooyZ3e9H8oq9FPlY2q3teXcYV7RUcCQsmjRVPpiUU2qNDWOo
         V7EJI8jzTYhl+RxZOY0FLH1GOsGoLckzL0Tv5rdjkbJ6KcoLd3ydvpt7b4afjP0muCTf
         Rgi/qfDv4Msw4M+eS8S3/ULaME/LJuPjMbP0lRDZkpZl4quPDogqwJvmUuteGBsD+8uI
         TArkRZO0jHINk9NOFXfy19K5y30VGLG3HBtEB7ZubajlK4/fRTuIH1BGfFipqZi8yMTZ
         FSfg==
X-Gm-Message-State: AOAM533bR/8GTSK+ioSoUkW8FgS113KnbNun9L/vVFGt/AbIa0/oz+c4
        eYVIft07BDCFO/c/rMQUTpGZPs5FS6HptDEM/vN/AYnP
X-Google-Smtp-Source: ABdhPJx2BQNXnJdWaUD+UXy0lODsH4c8nm+s+A2/gbXICvKnFJjQlkZ/VLL4EvMD5tV5ddzoQzGjPgFtqaOMS7HOWWc=
X-Received: by 2002:aca:ec97:: with SMTP id k145mr2928286oih.92.1592489001270;
 Thu, 18 Jun 2020 07:03:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200617192309.69595-1-stephen.smalley.work@gmail.com>
In-Reply-To: <20200617192309.69595-1-stephen.smalley.work@gmail.com>
From:   Stephen Smalley <stephen.smalley.work@gmail.com>
Date:   Thu, 18 Jun 2020 10:03:10 -0400
Message-ID: <CAEjxPJ6EHbCh+S1D8dm61Mw7YkMDHELNHVwKEtinNciaoTzYoQ@mail.gmail.com>
Subject: Re: [PATCH] selinux: log error messages on required process class / permissions
To:     SElinux list <selinux@vger.kernel.org>
Cc:     Ondrej Mosnacek <omosnace@redhat.com>,
        Paul Moore <paul@paul-moore.com>,
        bauen1 <j2468h@googlemail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Wed, Jun 17, 2020 at 3:23 PM Stephen Smalley
<stephen.smalley.work@gmail.com> wrote:
>
> In general SELinux no longer treats undefined object classes or permissions
> in the policy as a fatal error, instead handling them in accordance with
> handle_unknown. However, the process class and process transition and
> dyntransition permissions are still required to be defined due to
> dependencies on these definitions for default labeling behaviors,
> role and range transitions in older policy versions that lack an explicit
> class field, and role allow checking.  Log error messages in these cases
> since otherwise the policy load will fail silently with no indication
> to the user as to the underlying cause.  While here, fix the checking for
> process transition / dyntransition so that omitting either permission is
> handled as an error; both are needed in order to ensure that role allow
> checking is consistently applied.
>
> Reported-by: bauen1 <j2468h@googlemail.com>
> Signed-off-by: Stephen Smalley <stephen.smalley.work@gmail.com>

BTW I considered and even put together an initial patch to instead
make the process class and transition permissions optional but thought
it was unnecessary complexity for no real gain.  One would end up with
a system where new processes would be treated like objects for
labeling (e.g. object_r for the role, inherit type from related object
in this case the executable file) and role allow rules would be
unenforceable.  I suppose we could change the test of the process
class to be based on the kernel value rather than the policy value,
which would at least provide sane defaults for labeling.
