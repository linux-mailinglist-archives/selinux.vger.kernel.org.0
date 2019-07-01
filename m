Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2F3B75C269
	for <lists+selinux@lfdr.de>; Mon,  1 Jul 2019 19:58:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729964AbfGAR6l (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Mon, 1 Jul 2019 13:58:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:59570 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730091AbfGAR6l (ORCPT <rfc822;selinux@vger.kernel.org>);
        Mon, 1 Jul 2019 13:58:41 -0400
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id AC36221871
        for <selinux@vger.kernel.org>; Mon,  1 Jul 2019 17:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1562003920;
        bh=MetAdyarSKTBJkO5uYdT/hRU450ey2r95NLtOZ84sdc=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=dbTehWxJ5K07UUIyk+Z8X76/3AG3UPTwodFrCQMejhGVcAzB2sH7gub6I9AjMNh80
         TUB2ynqEAjVkl5fmsYYZOrC9gJucrQ2cBGBuqiihfsH4UdxE83fmK9Lai2ZzBoq8to
         LjYOhKWOtTJzwB56X1sK6MYTrJRvtGdIeoAEJiXg=
Received: by mail-wm1-f48.google.com with SMTP id 207so414902wma.1
        for <selinux@vger.kernel.org>; Mon, 01 Jul 2019 10:58:40 -0700 (PDT)
X-Gm-Message-State: APjAAAU0fzlrh1edSGVwfxjQl20kmi70fBxc9uXiRn8+VbvUkOA4AU0r
        5yry+OcKKqOXgWy+QIqUTLWoA7zhQ0E2G93OswhIbQ==
X-Google-Smtp-Source: APXvYqxUCv5mNi3OtEgiMmm0gzi6Xev4R0Dx2/u+UMzQUMByuCDRQ7tWfzDw6qe1jvmRcbgxN1wMYiJjaJj7xcLp1n4=
X-Received: by 2002:a1c:1a56:: with SMTP id a83mr298968wma.161.1562003919163;
 Mon, 01 Jul 2019 10:58:39 -0700 (PDT)
MIME-Version: 1.0
References: <20190619222401.14942-1-sean.j.christopherson@intel.com>
 <cover.1561588012.git.cedric.xing@intel.com> <72420cff8fa944b64e57df8d25c63bd30f8aacfa.1561588012.git.cedric.xing@intel.com>
 <CALCETrWQUEEwAAdPrVQMengKDhX3-fVrtJwaP2i=mWD+s+B8vg@mail.gmail.com> <960B34DE67B9E140824F1DCDEC400C0F6551D4B3@ORSMSX116.amr.corp.intel.com>
In-Reply-To: <960B34DE67B9E140824F1DCDEC400C0F6551D4B3@ORSMSX116.amr.corp.intel.com>
From:   Andy Lutomirski <luto@kernel.org>
Date:   Mon, 1 Jul 2019 10:58:28 -0700
X-Gmail-Original-Message-ID: <CALCETrUR=W3rfmG+qHydm0FQvASSYRt_V72v5WeQ4KWT7tjEdA@mail.gmail.com>
Message-ID: <CALCETrUR=W3rfmG+qHydm0FQvASSYRt_V72v5WeQ4KWT7tjEdA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 1/3] x86/sgx: Add SGX specific LSM hooks
To:     "Xing, Cedric" <cedric.xing@intel.com>
Cc:     Andy Lutomirski <luto@kernel.org>,
        "linux-sgx@vger.kernel.org" <linux-sgx@vger.kernel.org>,
        LSM List <linux-security-module@vger.kernel.org>,
        "selinux@vger.kernel.org" <selinux@vger.kernel.org>,
        "Schaufler, Casey" <casey.schaufler@intel.com>,
        James Morris <jmorris@namei.org>,
        Jethro Beekman <jethro@fortanix.com>,
        "Dr. Greg Wettstein" <greg@enjellic.com>,
        Stephen Smalley <sds@tycho.nsa.gov>,
        Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        "Christopherson, Sean J" <sean.j.christopherson@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Mon, Jul 1, 2019 at 10:11 AM Xing, Cedric <cedric.xing@intel.com> wrote:
>
> Hi Andy,
>
> > From: Andy Lutomirski [mailto:luto@kernel.org]
> > Sent: Saturday, June 29, 2019 4:47 PM
> >
> > Just on a very cursory review, this seems like it's creating a bunch of
> > complexity (a whole new library and data structure), and I'm not
> > convinced the result is any better than Sean's version.
>
> The new EMA data structure is to track enclave pages by range. Yes, Sean =
avoided that by storing similar information in the existing encl_page struc=
ture inside SGX subsystem. But as I pointed out, his code has to iterate th=
rough *every* page in range so mprotect() will be very slow if the range is=
 large. So he would end up introducing something similar to achieve the sam=
e performance.

It seems odd to stick it in security/ if it only has one user, though.
Also, if it wasn't in security/, then the security folks would stop
complaining :)


>
> And that's not the most important point. The major problem in his patch l=
ies in SGX2 support, as #PF driven EAUG cannot be supported (or he'd have t=
o amend his code accordingly, which will add complexity and tip your scale)=
.
>

Why can't it be?
