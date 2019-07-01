Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F333F35101
	for <lists+selinux@lfdr.de>; Tue,  4 Jun 2019 22:32:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726807AbfFDUc0 (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Tue, 4 Jun 2019 16:32:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:60408 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726793AbfFDUcY (ORCPT <rfc822;selinux@vger.kernel.org>);
        Tue, 4 Jun 2019 16:32:24 -0400
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E83512085A
        for <selinux@vger.kernel.org>; Tue,  4 Jun 2019 20:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1559679923;
        bh=9sDZU19/Kb3jU11bUCd3XZ92C4kNtHvwtUFMEx9ULmw=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=YznqkV5OPlnaq+Ug+Uiu3Omc0QBbSzhN+xqkGs7jbVcRZCmGQDKPgfQHQvmoqFCEz
         B2mt+gJcoMcz63SfC4huy1JwgW2Ul3NPzBdXUG1IBouA46iNQdkhcGPflg0S8u2Nu7
         WXsIPVqVJ5bwn7ri6Rl1lZbR2/YYt4wM913gwXhk=
Received: by mail-wr1-f43.google.com with SMTP id o12so10066146wrj.9
        for <selinux@vger.kernel.org>; Tue, 04 Jun 2019 13:25:22 -0700 (PDT)
X-Gm-Message-State: APjAAAU8rfIjf/LnhZ+sHDsajE/ziFwn1ENRWv1xZMIAooInUzTRTF2+
        LXClu80nte+ZTHKso+LiPjRe4IWh04+XEzQQgeoFVA==
X-Google-Smtp-Source: APXvYqysczE0WCFAw9A2ekaDQXIExESkgzbRePbJWfnmPHTmIpwjyZf8K5tnfHa6NYctc+YamSt9R5W/FajQBcCOU+c=
X-Received: by 2002:a5d:6207:: with SMTP id y7mr3944378wru.265.1559679921568;
 Tue, 04 Jun 2019 13:25:21 -0700 (PDT)
MIME-Version: 1.0
References: <20190531233159.30992-1-sean.j.christopherson@intel.com>
 <20190531233159.30992-8-sean.j.christopherson@intel.com> <20190604162555.GC3811@linux.intel.com>
In-Reply-To: <20190604162555.GC3811@linux.intel.com>
From:   Andy Lutomirski <luto@kernel.org>
Date:   Tue, 4 Jun 2019 13:25:10 -0700
X-Gmail-Original-Message-ID: <CALCETrUqcQNbRvBe2UqQih8RHnuwn3KaC=xJU1cRsaEVsCQUgw@mail.gmail.com>
Message-ID: <CALCETrUqcQNbRvBe2UqQih8RHnuwn3KaC=xJU1cRsaEVsCQUgw@mail.gmail.com>
Subject: Re: [RFC PATCH 7/9] x86/sgx: Enforce noexec filesystem restriction
 for enclaves
To:     Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Cc:     Sean Christopherson <sean.j.christopherson@intel.com>,
        Andy Lutomirski <luto@kernel.org>,
        Cedric Xing <cedric.xing@intel.com>,
        Stephen Smalley <sds@tycho.nsa.gov>,
        James Morris <jmorris@namei.org>,
        "Serge E . Hallyn" <serge@hallyn.com>,
        LSM List <linux-security-module@vger.kernel.org>,
        Paul Moore <paul@paul-moore.com>,
        Eric Paris <eparis@parisplace.org>, selinux@vger.kernel.org,
        Jethro Beekman <jethro@fortanix.com>,
        Dave Hansen <dave.hansen@intel.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        LKML <linux-kernel@vger.kernel.org>, X86 ML <x86@kernel.org>,
        linux-sgx@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>, nhorman@redhat.com,
        npmccallum@redhat.com, Serge Ayoun <serge.ayoun@intel.com>,
        Shay Katz-zamir <shay.katz-zamir@intel.com>,
        Haitao Huang <haitao.huang@intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kai Svahn <kai.svahn@intel.com>,
        Borislav Petkov <bp@alien8.de>,
        Josh Triplett <josh@joshtriplett.org>,
        Kai Huang <kai.huang@intel.com>,
        David Rientjes <rientjes@google.com>,
        William Roberts <william.c.roberts@intel.com>,
        Philip Tricca <philip.b.tricca@intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Tue, Jun 4, 2019 at 9:26 AM Jarkko Sakkinen
<jarkko.sakkinen@linux.intel.com> wrote:
>
> On Fri, May 31, 2019 at 04:31:57PM -0700, Sean Christopherson wrote:
> > Do not allow an enclave page to be mapped with PROT_EXEC if the source
> > page is backed by a file on a noexec file system.
> >
> > Signed-off-by: Sean Christopherson <sean.j.christopherson@intel.com>
>
> Why don't you just check in sgx_encl_add_page() that whether the path
> comes from noexec and deny if SECINFO contains X?
>

SECINFO seems almost entirely useless for this kind of thing because
of SGX2.  I'm thinking that SECINFO should be completely ignored for
anything other than its required architectural purpose.
