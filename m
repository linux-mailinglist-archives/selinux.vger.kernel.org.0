Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0702E3511C
	for <lists+selinux@lfdr.de>; Tue,  4 Jun 2019 22:36:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726312AbfFDUgu (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Tue, 4 Jun 2019 16:36:50 -0400
Received: from mga01.intel.com ([192.55.52.88]:44647 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726033AbfFDUgu (ORCPT <rfc822;selinux@vger.kernel.org>);
        Tue, 4 Jun 2019 16:36:50 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 04 Jun 2019 13:36:50 -0700
X-ExtLoop1: 1
Received: from sjchrist-coffee.jf.intel.com (HELO linux.intel.com) ([10.54.74.36])
  by fmsmga001.fm.intel.com with ESMTP; 04 Jun 2019 13:36:49 -0700
Date:   Tue, 4 Jun 2019 13:36:49 -0700
From:   Sean Christopherson <sean.j.christopherson@intel.com>
To:     Andy Lutomirski <luto@kernel.org>
Cc:     Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
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
Subject: Re: [RFC PATCH 8/9] LSM: x86/sgx: Introduce ->enclave_load() hook
 for Intel SGX
Message-ID: <20190604203649.GC7775@linux.intel.com>
References: <20190531233159.30992-1-sean.j.christopherson@intel.com>
 <20190531233159.30992-9-sean.j.christopherson@intel.com>
 <CALCETrXf3ujAn6uOwWMU8SRZOvBRb8ALvo_LQvwxc899mrakwQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALCETrXf3ujAn6uOwWMU8SRZOvBRb8ALvo_LQvwxc899mrakwQ@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Tue, Jun 04, 2019 at 01:29:10PM -0700, Andy Lutomirski wrote:
> On Fri, May 31, 2019 at 4:32 PM Sean Christopherson
> <sean.j.christopherson@intel.com> wrote:
> >  static int sgx_encl_add_page(struct sgx_encl *encl, unsigned long addr,
> > diff --git a/include/linux/lsm_hooks.h b/include/linux/lsm_hooks.h
> > index 47f58cfb6a19..0562775424a0 100644
> > --- a/include/linux/lsm_hooks.h
> > +++ b/include/linux/lsm_hooks.h
> > @@ -1446,6 +1446,14 @@
> >   * @bpf_prog_free_security:
> >   *     Clean up the security information stored inside bpf prog.
> >   *
> > + * Security hooks for Intel SGX enclaves.
> > + *
> > + * @enclave_load:
> > + *     On success, returns 0 and optionally adjusts @allowed_prot
> > + *     @vma: the source memory region of the enclave page being loaded.
> > + *     @prot: the initial protection of the enclave page.
> 
> What do you mean "initial"?  The page is always mapped PROT_NONE when
> this is called, right?  I feel like I must be missing something here.

Initial protection in the EPCM.  Yet another reason to ignore SECINFO.
