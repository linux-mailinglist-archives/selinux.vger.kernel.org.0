Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A9B7221B24
	for <lists+selinux@lfdr.de>; Fri, 17 May 2019 18:05:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729023AbfEQQFG (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Fri, 17 May 2019 12:05:06 -0400
Received: from mga09.intel.com ([134.134.136.24]:10643 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728482AbfEQQFG (ORCPT <rfc822;selinux@vger.kernel.org>);
        Fri, 17 May 2019 12:05:06 -0400
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 17 May 2019 09:05:05 -0700
X-ExtLoop1: 1
Received: from sjchrist-coffee.jf.intel.com (HELO linux.intel.com) ([10.54.74.36])
  by orsmga006.jf.intel.com with ESMTP; 17 May 2019 09:05:05 -0700
Date:   Fri, 17 May 2019 09:05:05 -0700
From:   Sean Christopherson <sean.j.christopherson@intel.com>
To:     Andy Lutomirski <luto@kernel.org>
Cc:     "Xing, Cedric" <cedric.xing@intel.com>,
        James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>,
        LSM List <linux-security-module@vger.kernel.org>,
        Paul Moore <paul@paul-moore.com>,
        Stephen Smalley <sds@tycho.nsa.gov>,
        Eric Paris <eparis@parisplace.org>,
        "selinux@vger.kernel.org" <selinux@vger.kernel.org>,
        Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        Jethro Beekman <jethro@fortanix.com>,
        "Hansen, Dave" <dave.hansen@intel.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        "Dr. Greg" <greg@enjellic.com>,
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
        David Rientjes <rientjes@google.com>
Subject: Re: SGX vs LSM (Re: [PATCH v20 00/28] Intel SGX1 support)
Message-ID: <20190517160505.GB15006@linux.intel.com>
References: <20190515013031.GF1977@linux.intel.com>
 <CALCETrXf8mSK45h7sTK5Wf+pXLVn=Bjsc_RLpgO-h-qdzBRo5Q@mail.gmail.com>
 <alpine.LRH.2.21.1905160543070.19802@namei.org>
 <CALCETrX_Q6qwNRNF0TL2tgfm1j6DKLX7NVHHmWbMFtk3WnHDKw@mail.gmail.com>
 <alpine.LRH.2.21.1905160844130.29250@namei.org>
 <CALCETrX2ovRx3Rre+1_xC-q6CiybyLjQ-gmB4FZF_qCZ-Qd+4A@mail.gmail.com>
 <960B34DE67B9E140824F1DCDEC400C0F654E38CD@ORSMSX116.amr.corp.intel.com>
 <CALCETrUfmyQ7ivNzQic0FyPXe1fmAnoK093jnz0i8DRn2LvdSA@mail.gmail.com>
 <960B34DE67B9E140824F1DCDEC400C0F654E3FB9@ORSMSX116.amr.corp.intel.com>
 <CALCETrXmyau8Gq-wKHZ5FdNGF+mqd7a+q+HAVR2sqvXA6av9BA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALCETrXmyau8Gq-wKHZ5FdNGF+mqd7a+q+HAVR2sqvXA6av9BA@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Thu, May 16, 2019 at 05:35:16PM -0700, Andy Lutomirski wrote:
> On Thu, May 16, 2019 at 3:23 PM Xing, Cedric <cedric.xing@intel.com> wrote:
> > And if you are with me on that bigger picture, the next question is: what
> > should be the default behavior of security_sgx_mprot() for
> > existing/non-SGX-aware LSM modules/policies? I'd say a reasonable default
> > is to allow R, RW and RX, but not anything else. It'd suffice to get rid of
> > EXECMEM/EXECMOD requirements on enclave applications. For SGX1, EPCM
> > permissions are immutable so it really doesn't matter what
> > security_sgx_mprot() does. For SGX2 and beyond, there's still time and new
> > SGX-aware LSM modules/policies will probably have emerged by then.
> 
> I hadn't thought about the SGX1 vs SGX2 difference.  If the driver
> initially only wants to support SGX1, then I guess we really could get
> away with constraining the EPC flags based on the source page
> permission and not restricting mprotect() and mmap() permissions on
> /dev/sgx/enclave at all.

No, SGX1 vs SGX2 support in the kernel is irrelevant.  Well, unless the
driver simply refuses to load on SGX2 hardware, but I don't think anyone
wants to go that route.  There is no enabling or attribute bit required
to execute ENCLU[EMODPE], e.g. an enclave can effect RW->RWX in the EPCM
on SGX2 hardware regardless of what the kernel is doing.

IMO the kernel should ignore the EPCM from an LSM perspective.
