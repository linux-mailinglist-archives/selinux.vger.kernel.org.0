Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 828073BD18
	for <lists+selinux@lfdr.de>; Mon, 10 Jun 2019 21:49:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389156AbfFJTtm (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Mon, 10 Jun 2019 15:49:42 -0400
Received: from mga02.intel.com ([134.134.136.20]:1644 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388901AbfFJTtm (ORCPT <rfc822;selinux@vger.kernel.org>);
        Mon, 10 Jun 2019 15:49:42 -0400
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 10 Jun 2019 12:49:41 -0700
X-ExtLoop1: 1
Received: from sjchrist-coffee.jf.intel.com (HELO linux.intel.com) ([10.54.74.36])
  by orsmga008.jf.intel.com with ESMTP; 10 Jun 2019 12:49:41 -0700
Date:   Mon, 10 Jun 2019 12:49:41 -0700
From:   Sean Christopherson <sean.j.christopherson@intel.com>
To:     "Xing, Cedric" <cedric.xing@intel.com>
Cc:     Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        Andy Lutomirski <luto@kernel.org>,
        Stephen Smalley <sds@tycho.nsa.gov>,
        James Morris <jmorris@namei.org>,
        "Serge E . Hallyn" <serge@hallyn.com>,
        LSM List <linux-security-module@vger.kernel.org>,
        Paul Moore <paul@paul-moore.com>,
        Eric Paris <eparis@parisplace.org>,
        "selinux@vger.kernel.org" <selinux@vger.kernel.org>,
        Jethro Beekman <jethro@fortanix.com>,
        "Hansen, Dave" <dave.hansen@intel.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        LKML <linux-kernel@vger.kernel.org>, X86 ML <x86@kernel.org>,
        "linux-sgx@vger.kernel.org" <linux-sgx@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        "nhorman@redhat.com" <nhorman@redhat.com>,
        "npmccallum@redhat.com" <npmccallum@redhat.com>,
        "Ayoun, Serge" <serge.ayoun@intel.com>,
        "Katz-zamir, Shay" <shay.katz-zamir@intel.com>,
        "Huang, Haitao" <haitao.huang@intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "Svahn, Kai" <kai.svahn@intel.com>, Borislav Petkov <bp@alien8.de>,
        Josh Triplett <josh@joshtriplett.org>,
        "Huang, Kai" <kai.huang@intel.com>,
        David Rientjes <rientjes@google.com>,
        "Roberts, William C" <william.c.roberts@intel.com>,
        "Tricca, Philip B" <philip.b.tricca@intel.com>
Subject: Re: [RFC PATCH v2 1/5] mm: Introduce vm_ops->may_mprotect()
Message-ID: <20190610194941.GK15995@linux.intel.com>
References: <20190606021145.12604-1-sean.j.christopherson@intel.com>
 <20190606021145.12604-2-sean.j.christopherson@intel.com>
 <20190610150600.GA3752@linux.intel.com>
 <20190610155549.GB15995@linux.intel.com>
 <960B34DE67B9E140824F1DCDEC400C0F654FFD59@ORSMSX116.amr.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <960B34DE67B9E140824F1DCDEC400C0F654FFD59@ORSMSX116.amr.corp.intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Mon, Jun 10, 2019 at 10:47:52AM -0700, Xing, Cedric wrote:
> > From: Christopherson, Sean J
> > Sent: Monday, June 10, 2019 8:56 AM
> > 
> > > > As a result, LSM policies cannot be meaningfully applied, e.g. an
> > > > LSM can deny access to the EPC as a whole, but can't deny PROT_EXEC
> > > > on page that originated in a non-EXECUTE file (which is long gone by
> > > > the time
> > > > mprotect() is called).
> > >
> > > I have hard time following what is paragraph is trying to say.
> > >
> > > > By hooking mprotect(), SGX can make explicit LSM upcalls while an
> > > > enclave is being built, i.e. when the kernel has a handle to origin
> > > > of each enclave page, and enforce the result of the LSM policy
> > > > whenever userspace maps the enclave page in the future.
> > >
> > > "LSM policy whenever calls mprotect()"? I'm no sure why you mean by
> > > mapping here and if there is any need to talk about future. Isn't this
> > > needed now?
> > 
> > Future is referring to the timeline of a running kernel, not the future
> > of the kernel code.
> > 
> > Rather than trying to explain all of the above with words, I'll provide
> > code examples to show how ->may_protect() will be used by SGX and why it
> > is the preferred solution.
> 
> The LSM concept is to separate security policy enforcement from the rest of
> the kernel. For modules, the "official" way is to use VM_MAY* flags to limit
> allowable permissions, while LSM uses security_file_mprotect().
> I guess that's why we didn't have .may_mprotect() in the first place.

Heh, so I've typed up about five different responses to this comment.  In
doing so, I think I've convinced myself that ->may_mprotect() is
unnecessary.  Rther than hook mprotect(), simply update the VM_MAY* flags
during mmap(), with all bits cleared if there isn't an associated enclave
page.  IIRC, the need to add ->may_protect() came about when we were
exploring more dynamic interplay between SGX and LSMs.

> What you are doing is enforcing some security policy outside of LSM, which
> is dirty from architecture perspective.

No, the enclave page protections are enforced regardless of LSM policy,
and in v2 those protections are immutable.  Yes, the explicit enclave
page protection bits are being added primarily for LSMs, but they don't
impact functionality other than at the security_enclave_load() touchpoint.
