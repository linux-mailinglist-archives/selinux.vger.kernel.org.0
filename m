Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BA56B5C3B8
	for <lists+selinux@lfdr.de>; Mon,  1 Jul 2019 21:36:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726442AbfGATgS (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Mon, 1 Jul 2019 15:36:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:37330 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726691AbfGATgS (ORCPT <rfc822;selinux@vger.kernel.org>);
        Mon, 1 Jul 2019 15:36:18 -0400
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 42E1A21851
        for <selinux@vger.kernel.org>; Mon,  1 Jul 2019 19:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1562009777;
        bh=nJFYnrBEZtuf8KB7H1QIaum2Qn7mnpL1puwV+pE5jEc=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=fiZeMw/Rfz/rrJZlmV2VFJXeN+SNNLueIdsgNgx9hQY5nUXI1UxDDVaHFv050z02O
         LOAd/x3A4gb3ieYCE7/ZQdqr4FQFc3QmTuCCg/7dVdIvzX894yV0uVZjlBdB0wBdo/
         9P21UXH+rV53ysJY9G4FI3lXJH8ddMcrhkmHx2b8=
Received: by mail-wm1-f54.google.com with SMTP id c6so753318wml.0
        for <selinux@vger.kernel.org>; Mon, 01 Jul 2019 12:36:17 -0700 (PDT)
X-Gm-Message-State: APjAAAUqR0rZsE1cRntIsiVN/hUDTQGVHu90j1XK2NzANrAJGzShKdWg
        VPD8JWPe5hiaT/wcHnt4+vKXpF4GozUD5pkgzG4azQ==
X-Google-Smtp-Source: APXvYqyJS4h7bJYUQstwrUG1roDEOHkZFLjfTg3s9qiM72VVpVAxczPzwr3mSuSP6b1DutLlRCvvy3Uue+yurpRWwR8=
X-Received: by 2002:a1c:1a56:: with SMTP id a83mr512606wma.161.1562009775779;
 Mon, 01 Jul 2019 12:36:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190619222401.14942-1-sean.j.christopherson@intel.com>
 <cover.1561588012.git.cedric.xing@intel.com> <72420cff8fa944b64e57df8d25c63bd30f8aacfa.1561588012.git.cedric.xing@intel.com>
 <CALCETrWQUEEwAAdPrVQMengKDhX3-fVrtJwaP2i=mWD+s+B8vg@mail.gmail.com>
 <960B34DE67B9E140824F1DCDEC400C0F6551D4B3@ORSMSX116.amr.corp.intel.com>
 <CALCETrUR=W3rfmG+qHydm0FQvASSYRt_V72v5WeQ4KWT7tjEdA@mail.gmail.com> <960B34DE67B9E140824F1DCDEC400C0F6551D5FA@ORSMSX116.amr.corp.intel.com>
In-Reply-To: <960B34DE67B9E140824F1DCDEC400C0F6551D5FA@ORSMSX116.amr.corp.intel.com>
From:   Andy Lutomirski <luto@kernel.org>
Date:   Mon, 1 Jul 2019 12:36:04 -0700
X-Gmail-Original-Message-ID: <CALCETrUAme7ujK3j-6gg1=_FtVGY3ZM8WBg9_9Sn-keywd7Smg@mail.gmail.com>
Message-ID: <CALCETrUAme7ujK3j-6gg1=_FtVGY3ZM8WBg9_9Sn-keywd7Smg@mail.gmail.com>
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

On Mon, Jul 1, 2019 at 11:31 AM Xing, Cedric <cedric.xing@intel.com> wrote:
> I intended to say the major reason I objected Sean's approach was its ina=
bility to support SGX2 smoothly - as #PF driven EAUG requires non-existent =
pages to be mmap()'ed, otherwise vm_ops->fault wouldn't be dispatched so EA=
UG couldn't be issued in response to #PF.

I still think that, if the kernel wants to support #PF-driven EAUG, it
should be an opt-in thing.  It would be something like
SGX_IOC_ADD_LAZY_EAUG_PAGES or similar.  If it's done that way, then
the driver needs to learn how to track ranges of pages efficiently,
which is another reason to consider leaving all the fancy page / page
range tracking in the driver.

I don't think it's a good idea for a page fault on any non-EADDed page
in ELRANGE to automatically populate the page.
