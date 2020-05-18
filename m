Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFB371D7CA3
	for <lists+selinux@lfdr.de>; Mon, 18 May 2020 17:20:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728255AbgERPUM (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Mon, 18 May 2020 11:20:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727063AbgERPUM (ORCPT
        <rfc822;selinux@vger.kernel.org>); Mon, 18 May 2020 11:20:12 -0400
Received: from mail-oo1-xc42.google.com (mail-oo1-xc42.google.com [IPv6:2607:f8b0:4864:20::c42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46F54C061A0C
        for <selinux@vger.kernel.org>; Mon, 18 May 2020 08:20:11 -0700 (PDT)
Received: by mail-oo1-xc42.google.com with SMTP id p67so2100452ooa.11
        for <selinux@vger.kernel.org>; Mon, 18 May 2020 08:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7vQ57Ads4npffer4CMAu9MTSDpQ2tAYEVuJIGAQQSV8=;
        b=i4ONP/ocCHMdYKKDMTGvwZQXLAUn/bXYEViOhr6gxkFGg4KBkUny3rJkx5Mt8eIKmD
         3Lhz+dGk6EdiC9+Ui5U91lQwlv6OnXaiuyYeHme55JlEAkqFYh1ATbx96FZctKvOiSmG
         MO0YvgoM/bX86YW0AqxHQBnTi6kVOPQFdJ8krjdoCExHp6Tee7VvK5XZBYwEtOG8Hl+T
         npneq3ULhUTILdFgBewOTkRGp3JRLseQ1l1eaqqkkgwwN82wEwbGP8wzdvbtu7jL5Xs1
         PWkwHaf/ri+YbnoqJZ56FSFWx8PBZLaSS89HqF32gHFcqKHGks4ujx/bsOvMPWegoNh4
         +0/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7vQ57Ads4npffer4CMAu9MTSDpQ2tAYEVuJIGAQQSV8=;
        b=S++NeXB69OEO/+yQneLWwM52IXIuP/kD4D+zwlzmQeryMuw4cy+Xh+N67Nz0qO2azp
         6UueTu2YuoKQuH+oDzAo1bOnkfUxydbLq9W9I0X0gtSJo4+FCMALmQODouQWd/FbmD2U
         AtIqDFQkGzRiF0TMtN5W5SkbBvyqcVBStaxtMxatv72JFjnnl64gM4abz9a7EJrGYeI3
         lq5XHhsejiazIdCsAS1XZ23R47liQoCvkgW75+wQqI6EKDyTmj+k8KOWZ1qjyRX2AXz8
         MMuMuVmB1eePf/5OexRllPaVKGKcx5XrSZJrDBH9Bmpe+v64Slfr/GF4ey70EDy3UwBh
         Yu/g==
X-Gm-Message-State: AOAM5316Ifr5YqFtMlPeZ+K7IRp+EuZH3UVS3OcDImQbwQesuJfcYsF5
        NV1Qlw6jfJlksoUpCofPOzDV1S70Nt0FxxLF07JcPuFBo/Q=
X-Google-Smtp-Source: ABdhPJyCnhnD17W4IXg5EAJlS44WgJWlUQ7kNF6jwHQSYc14yXxqZvq2B2fokA2o7xSoNbQFG2JsCawSVk826xBEunE=
X-Received: by 2002:a4a:b4c1:: with SMTP id g1mr13364245ooo.58.1589815210690;
 Mon, 18 May 2020 08:20:10 -0700 (PDT)
MIME-Version: 1.0
References: <CAGeouKHKm+Bzk6=gX_GEJc=faTB8tzwQ7txKVEhdbzK1sf-Z1A@mail.gmail.com>
In-Reply-To: <CAGeouKHKm+Bzk6=gX_GEJc=faTB8tzwQ7txKVEhdbzK1sf-Z1A@mail.gmail.com>
From:   Stephen Smalley <stephen.smalley.work@gmail.com>
Date:   Mon, 18 May 2020 11:19:59 -0400
Message-ID: <CAEjxPJ5_4z+O6fthtjLFLncR0Q2ETdfhcdtqOGj8eBSZ5sBt=Q@mail.gmail.com>
Subject: Re: [PATCH] Add restorecon -x to not cross FS boundaries
To:     Peter Whittaker <pww@edgekeep.com>
Cc:     SElinux list <selinux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Fri, May 15, 2020 at 4:09 PM Peter Whittaker <pww@edgekeep.com> wrote:
>
> Folks, the following patch adds a -x option to restorecon to prevent
> it from crossing filesystem boundaries, as requested in
> https://github.com/SELinuxProject/selinux/issues/208.
>
> As per Stephen Smalley's suggestion, this is accomplished using
> r_opts.xdev = SELINUX_RESTORECON_XDEV;
>
> Please do let me know if there are any errors in this, it's been over
> two decades since I've lurked in majordomo lists and about as long
> since I've contributed a patch via email. (In particular, I am having
> issues with sending plaintext, so spaces in the patch are munged; any
> pointers on correcting than in the gmail web client would be more than
> welcome.)

Send your patch via git send-email instead.  You can have it send via
gmail's smtp server as per the documentation
(https://git-scm.com/docs/git-send-email).  Alternatively use a mail
client that is known to work,
https://www.kernel.org/doc/html/latest/process/email-clients.html.
