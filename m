Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 130C424FF40
	for <lists+selinux@lfdr.de>; Mon, 24 Aug 2020 15:45:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726024AbgHXNpD (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Mon, 24 Aug 2020 09:45:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725921AbgHXNpC (ORCPT
        <rfc822;selinux@vger.kernel.org>); Mon, 24 Aug 2020 09:45:02 -0400
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com [IPv6:2607:f8b0:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 007A4C061573
        for <selinux@vger.kernel.org>; Mon, 24 Aug 2020 06:45:01 -0700 (PDT)
Received: by mail-oi1-x243.google.com with SMTP id j7so8245582oij.9
        for <selinux@vger.kernel.org>; Mon, 24 Aug 2020 06:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=D2ydMSIOrGYi6x/2LSw1PpmLVdMdv71BZXsQMiuVC2Q=;
        b=hGHvg+Xcv6Q6lZ51QE3SN54icZeAiOCneRdJBU8bLJqbMwznYlHJbPNgnmRnej38ww
         DjHqkowESVOCpj5NuGUoc//Qf8qh3nQj3BhU6v49iN5ItFnhdtX8RyHTguepc4npnbiA
         qU/CIVjH+5BgIlBn02EzPyC+1HIUHBTixNjwqPmvLmd6YS0/QXbYW4vhyctaTvTFiLdZ
         LFHOwpEXH+RXQcBEj+W8Y0Ua5bbqeIIjM1nAm0K2DU4mu2icdDmA6NGlYaiOQsfharq+
         UDAvvQUSw0XNE97rRVpYEq1oAYoAwqKRT6kQnt1dflp3R3DVUePjSlvnO5Dinb7fWm9I
         ZsFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=D2ydMSIOrGYi6x/2LSw1PpmLVdMdv71BZXsQMiuVC2Q=;
        b=YMGGBEh/YP5RSK/WoL0+0HPd4oWGzaRwT6XwbctV3Fk4DlvhDY/PFNZCqIJjwF9PaY
         p2EIr6nZo5WUJyoKs98uoJr9/rOwqRz8ex5DpyrAVrMhmVtiBhqrg+nQU2ftqHekMAdy
         pEXIB1mB/5i80nL47yyh0H6mC9bbLB/dzEtyndtKp53bpNpbmJFuD5m3IDdeBew2FTe2
         PjPbx79XA5FZGF14zAmLguPpjxsnfYiGRnscIDfI6nJbI4Szv2710FJTw9ShL7qDE1Fu
         dIspFbZh122mwlp6xFgp+BaS1tB4MIWlt/MdG4H1MlpIwMjGaq/gugvfHeXuoPLNVahG
         naYg==
X-Gm-Message-State: AOAM531efcwmKplEbu8vX3jw7Hr9B9siLIIpEG8YKaCuYZxEF3hOthyL
        QU51VAJAVUapZodcBSt/7TvqHPSRoErtAEtPWXI=
X-Google-Smtp-Source: ABdhPJyQKc4YMq+j5Ct25hYtxAUfVsRs2NjauMr263Ezij6qjr098sixf4aaR2VEYjk2cwKooaKLh20o5/OJQIE/mrk=
X-Received: by 2002:aca:fd44:: with SMTP id b65mr2926697oii.160.1598276700772;
 Mon, 24 Aug 2020 06:45:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200819150534.18026-1-cgzones@googlemail.com>
In-Reply-To: <20200819150534.18026-1-cgzones@googlemail.com>
From:   Stephen Smalley <stephen.smalley.work@gmail.com>
Date:   Mon, 24 Aug 2020 09:44:50 -0400
Message-ID: <CAEjxPJ4mOzWbj6ynsis-fvo4uigAPDw2WOcZ0vnyp+gPzB78mw@mail.gmail.com>
Subject: Re: [PATCH 1/2] sepolgen: print extended permissions in hexadecimal
To:     =?UTF-8?Q?Christian_G=C3=B6ttsche?= <cgzones@googlemail.com>
Cc:     SElinux list <selinux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Wed, Aug 19, 2020 at 11:06 AM Christian G=C3=B6ttsche
<cgzones@googlemail.com> wrote:
>
> All tools like ausearch(8) or sesearch(1) and online documentation[1]
> use hexadecimal values for extended permissions.
> Hence use them, e.g. for audit2allow output, as well.
>
> [1]: https://github.com/strace/strace/blob/master/linux/64/ioctls_inc.h
>
> Signed-off-by: Christian G=C3=B6ttsche <cgzones@googlemail.com>

Acked-by: Stephen Smalley <stephen.smalley.work@gmail.com>
