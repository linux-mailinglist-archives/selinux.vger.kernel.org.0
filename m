Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A70FE194425
	for <lists+selinux@lfdr.de>; Thu, 26 Mar 2020 17:18:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727989AbgCZQSU (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Thu, 26 Mar 2020 12:18:20 -0400
Received: from mail-il1-f181.google.com ([209.85.166.181]:34894 "EHLO
        mail-il1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727916AbgCZQSU (ORCPT
        <rfc822;selinux@vger.kernel.org>); Thu, 26 Mar 2020 12:18:20 -0400
Received: by mail-il1-f181.google.com with SMTP id 7so5908363ill.2
        for <selinux@vger.kernel.org>; Thu, 26 Mar 2020 09:18:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WabK7CepEoGZUzIc6Ui2gZbbBNbj1tZGAwQR/42lpew=;
        b=YjdzmzBxS0zdJraAQeU/AWUCqj8esRBfO5RLDFPJBDBVGPoTAbryFBNNN/s2nEv4Qz
         JiM678WO98z/LMtkckvfw9GbtbT8oDjM/j4fBxGCHUgtbuabfkOuonzh1qqMI0yWlvMq
         tAmnkWHka/ELlkNBeOEwp0/PkKsWD5PL+Dnexti4XW2EfUwqZVZxt5HjPazdpDNdpW2S
         CoUambocblv1DMLSTg1LUzdpJO0KeUCiANZeWxRu5IW1sHf9pkmi2rKVqXb32cLNRGp+
         yHU/9wG8eq/yVkb1McuUGrfmVQeeK7FoTv0oWuswTrCxHrHastIW7BAOhMWeDXaRedQ0
         06MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WabK7CepEoGZUzIc6Ui2gZbbBNbj1tZGAwQR/42lpew=;
        b=p9yL0uFWsVyzlKLRgR8/9ZxoNPG361XWzojDbKTShCfoVenh5kL3+MTK6dXJn97K7/
         yDtmXQVpsl32sQLwBzN211nafcVwq9rzV5501YWTGgykbI92llehVwFIiFGg343StMWo
         qkFVHPXtBAbWky7n8EAf9ovZYUQyGC8BCys+WRF2FvtElvj+IS1nRy/oF4FsjWc9fhJK
         4R0JvVM/9kViJMX3esOojDxTXLDcyMrt9c9O1UB4ryN03z1n65C7X9RBes91yb+73IV/
         uap/5eSsgqESdaz3M6ka8VIjerAqagxsK7JI03QI9maZINu7L+HGHVqak4Y42uKzxHSl
         KaSw==
X-Gm-Message-State: ANhLgQ157ZKFARLflHIkBIx7203b9zg91ePtzi3sbYHTkBGkgUi/XYKW
        iE9o+M3GgU0X+l0uDCSz9zJs4Y5nhbTfUca1v0k=
X-Google-Smtp-Source: ADFU+vv2fFEEyKbmhLzurmWFet6UV1oWd0k0/xwfnCnHnNcmfTBBd3mP0cMUatB1ST8GwOfysEyKa1B6qwZ7xRxZTCc=
X-Received: by 2002:a92:2452:: with SMTP id k79mr9499529ilk.174.1585239499459;
 Thu, 26 Mar 2020 09:18:19 -0700 (PDT)
MIME-Version: 1.0
References: <CAGB+Vh7VOy_y2W7rxmaWAOyBQxQz5foFNL1T2hog0er4mnEQ4g@mail.gmail.com>
 <20200326154641.7253-1-william.c.roberts@intel.com> <CAFftDdp8Us2aSmAD5Q+MR3y6WvR2QAbC+_tFGmCwZbWh+0CBTA@mail.gmail.com>
 <CAGB+Vh5P-VKru1-ztYRBe4sr7OdeOpAzATGEBHkj6Q6i6s3mYw@mail.gmail.com>
In-Reply-To: <CAGB+Vh5P-VKru1-ztYRBe4sr7OdeOpAzATGEBHkj6Q6i6s3mYw@mail.gmail.com>
From:   William Roberts <bill.c.roberts@gmail.com>
Date:   Thu, 26 Mar 2020 11:18:08 -0500
Message-ID: <CAFftDdqqjgCBgN+LsV0d0ejHz5mBhuMgLhCHankaCDexFFEY2A@mail.gmail.com>
Subject: Re: cil: Fix DISABLE_SYMVER support and drop last dso.h
To:     Joshua Brindle <joshua.brindle@crunchydata.com>
Cc:     Ondrej Mosnacek <omosnace@redhat.com>,
        SElinux list <selinux@vger.kernel.org>,
        Stephen Smalley <stephen.smalley.work@gmail.com>,
        William Roberts <william.c.roberts@intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

> > Josh can you run this on Mac build, I don't have one anymore.
> >
>
> LGTM
>
> Acked-by: Joshua Brindle <joshua.brindle@crunchydata.com>
Thanks!

Staged: https://github.com/SELinuxProject/selinux/pull/214

Will merge tomorrow afternoon unless I hear otherwise.
