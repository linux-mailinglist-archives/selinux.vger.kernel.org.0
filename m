Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3BBF264656
	for <lists+selinux@lfdr.de>; Thu, 10 Sep 2020 14:50:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730321AbgIJMtr (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Thu, 10 Sep 2020 08:49:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730834AbgIJMmP (ORCPT
        <rfc822;selinux@vger.kernel.org>); Thu, 10 Sep 2020 08:42:15 -0400
Received: from mail-oo1-xc44.google.com (mail-oo1-xc44.google.com [IPv6:2607:f8b0:4864:20::c44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5879DC061573
        for <selinux@vger.kernel.org>; Thu, 10 Sep 2020 05:41:55 -0700 (PDT)
Received: by mail-oo1-xc44.google.com with SMTP id k13so1400905oor.2
        for <selinux@vger.kernel.org>; Thu, 10 Sep 2020 05:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xepubvZ44IOciur8Dkfx9HIfuZleemUgS1r/G+1Tav0=;
        b=T0dm/KmEN5wSdqKjfwzo15fscPCPcJHXfafxFz+m0FMBcDHz6omdIObtl65GCV5Hum
         ShilFrygiVl9fVETmZ716QN3mMu6D+LX5PegzQXykDtuJp4mjVE/gAcTPZodjvcJnXsm
         bbj3rD08n3iJxfPP0rg+gu+bDiKiKKxfjQw+RmyDpNcN+MqwfEaKlqP0Tw1Tc4qTyqRP
         UYtu2mcfThvUdCzGqXnd2PgAYGO4n0zOrHLel2BW/2gO1G7muAlthozMeNLwDso2n36/
         USTN/5YwjLoaNfh0z3LFZ6jqr4mSBjK2XnkxXt0S9fplT6Jqoy05JX4p0JvZX3wpJeVu
         EA4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xepubvZ44IOciur8Dkfx9HIfuZleemUgS1r/G+1Tav0=;
        b=Lcqtk7NcYk/Eg4JsrpG0SpTVtT6rvpdbDVM6IYXN/mcAyvYozQ+KWhPBMQZVaXS969
         OFi/eUSpndOeOXshdaFSpOwlPJsJIg8nq0BQAksh7wjZ8xOS2CMN5tLedoRrFUthEHxG
         lASl8xNAMLOfB2ZDSjxwsNhwIlO8kyldMcKFCoWTwJnA9Zc+ZJg8+rNUU0dWXvxKfQy4
         Dr5piG9guzQ00yZ3Tl8PUvitSCqEZ9m8QdSrQQ7g3tD7v5U+ELu8iUTmIwN+RAULH8Tf
         GpRYrgnyUDNCpPRM8DE+IvaFPAsWcNqUs0g43Afi1TO5nIFpMUiJIn+DytXBHETceggr
         VpXg==
X-Gm-Message-State: AOAM533jmJ80jQvMaTFzImZ1Nuj5JcD4r8u2Llk+vjb0OMR5UqWyMcBF
        KXs6XP3RBUU+2Q8C34WVMGJJPy5cTRBrgDSGQWIitALFSgY=
X-Google-Smtp-Source: ABdhPJxFepLjGSTFMZcKIx+ygKl/Zw3IDteurZCVCuOwx6g9BRd28kQnOI8Z88qtgT/xFcSHbxPdpanpgARvn76tUfQ=
X-Received: by 2002:a4a:d0ad:: with SMTP id t13mr4317570oor.58.1599741714667;
 Thu, 10 Sep 2020 05:41:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200909222822.23198-1-nramas@linux.microsoft.com>
In-Reply-To: <20200909222822.23198-1-nramas@linux.microsoft.com>
From:   Stephen Smalley <stephen.smalley.work@gmail.com>
Date:   Thu, 10 Sep 2020 08:41:43 -0400
Message-ID: <CAEjxPJ623H08Mg8ArezFBRWwqDNwBRkUGH5WBtWmHMF4BpS8tg@mail.gmail.com>
Subject: Re: [PATCH v2] selinux: Add helper functions to get and set checkreqprot
To:     Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
Cc:     Paul Moore <paul@paul-moore.com>, Sasha Levin <sashal@kernel.org>,
        James Morris <jmorris@namei.org>,
        SElinux list <selinux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Wed, Sep 9, 2020 at 6:28 PM Lakshmi Ramasubramanian
<nramas@linux.microsoft.com> wrote:
>
> checkreqprot data member in selinux_state struct is accessed directly by
> SELinux functions to get and set. This could cause unexpected read or
> write access to this data member due to compiler optimizations and/or
> compiler's reordering of access to this field.
>
> Add helper functions to get and set checkreqprot data member in
> selinux_state struct. These helper functions use READ_ONCE and
> WRITE_ONCE macros to ensure atomic read or write of memory for
> this data member.
>
> Signed-off-by: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
> Suggested-by: Stephen Smalley <stephen.smalley.work@gmail.com>

Acked-by: Stephen Smalley <stephen.smalley.work@gmail.com>
