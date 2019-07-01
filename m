Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6099535FEB
	for <lists+selinux@lfdr.de>; Wed,  5 Jun 2019 17:10:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728507AbfFEPK1 (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Wed, 5 Jun 2019 11:10:27 -0400
Received: from mga09.intel.com ([134.134.136.24]:9770 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728483AbfFEPK1 (ORCPT <rfc822;selinux@vger.kernel.org>);
        Wed, 5 Jun 2019 11:10:27 -0400
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 05 Jun 2019 08:10:26 -0700
X-ExtLoop1: 1
Received: from araresx-wtg1.ger.corp.intel.com (HELO localhost) ([10.252.46.102])
  by fmsmga006.fm.intel.com with ESMTP; 05 Jun 2019 08:10:19 -0700
Date:   Wed, 5 Jun 2019 18:10:18 +0300
From:   Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
To:     Andy Lutomirski <luto@kernel.org>
Cc:     Sean Christopherson <sean.j.christopherson@intel.com>,
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
Subject: Re: [RFC PATCH 7/9] x86/sgx: Enforce noexec filesystem restriction
 for enclaves
Message-ID: <20190605151006.GI11331@linux.intel.com>
References: <20190531233159.30992-1-sean.j.christopherson@intel.com>
 <20190531233159.30992-8-sean.j.christopherson@intel.com>
 <20190604162555.GC3811@linux.intel.com>
 <CALCETrUqcQNbRvBe2UqQih8RHnuwn3KaC=xJU1cRsaEVsCQUgw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALCETrUqcQNbRvBe2UqQih8RHnuwn3KaC=xJU1cRsaEVsCQUgw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Tue, Jun 04, 2019 at 01:25:10PM -0700, Andy Lutomirski wrote:
> On Tue, Jun 4, 2019 at 9:26 AM Jarkko Sakkinen
> <jarkko.sakkinen@linux.intel.com> wrote:
> >
> > On Fri, May 31, 2019 at 04:31:57PM -0700, Sean Christopherson wrote:
> > > Do not allow an enclave page to be mapped with PROT_EXEC if the source
> > > page is backed by a file on a noexec file system.
> > >
> > > Signed-off-by: Sean Christopherson <sean.j.christopherson@intel.com>
> >
> > Why don't you just check in sgx_encl_add_page() that whether the path
> > comes from noexec and deny if SECINFO contains X?
> >
> 
> SECINFO seems almost entirely useless for this kind of thing because
> of SGX2.  I'm thinking that SECINFO should be completely ignored for
> anything other than its required architectural purpose.

Not exactly sure why using it to pass the RWX bits to EADD ioctl would
cause anything to SGX2 support.

/Jarkko
