Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 93ECC29F87
	for <lists+selinux@lfdr.de>; Fri, 24 May 2019 22:03:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391730AbfEXUDf (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Fri, 24 May 2019 16:03:35 -0400
Received: from mga11.intel.com ([192.55.52.93]:59357 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2391612AbfEXUDf (ORCPT <rfc822;selinux@vger.kernel.org>);
        Fri, 24 May 2019 16:03:35 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 24 May 2019 13:03:34 -0700
X-ExtLoop1: 1
Received: from sjchrist-coffee.jf.intel.com (HELO linux.intel.com) ([10.54.74.36])
  by fmsmga001.fm.intel.com with ESMTP; 24 May 2019 13:03:33 -0700
Date:   Fri, 24 May 2019 13:03:33 -0700
From:   Sean Christopherson <sean.j.christopherson@intel.com>
To:     Andy Lutomirski <luto@kernel.org>
Cc:     "Xing, Cedric" <cedric.xing@intel.com>,
        Stephen Smalley <sds@tycho.nsa.gov>,
        Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>,
        LSM List <linux-security-module@vger.kernel.org>,
        Paul Moore <paul@paul-moore.com>,
        Eric Paris <eparis@parisplace.org>,
        "selinux@vger.kernel.org" <selinux@vger.kernel.org>,
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
Message-ID: <20190524200333.GF365@linux.intel.com>
References: <20190523141752.GA12078@linux.intel.com>
 <CALCETrUzx3LPAKCLFf75P-XshAkRcr+JLET3LA_kHDs9MA11FA@mail.gmail.com>
 <20190523234044.GC12078@linux.intel.com>
 <CALCETrV4DVEfW6EJ6DnQGGYDJAiA5M1QcuYJTiroumOM+D6Jjg@mail.gmail.com>
 <960B34DE67B9E140824F1DCDEC400C0F654E8956@ORSMSX116.amr.corp.intel.com>
 <dda0912b-cb15-3c07-d368-345159e995f7@tycho.nsa.gov>
 <20190524174243.GA365@linux.intel.com>
 <20190524175458.GB365@linux.intel.com>
 <960B34DE67B9E140824F1DCDEC400C0F654E8E1D@ORSMSX116.amr.corp.intel.com>
 <CALCETrUw5sEr-MHPMU4CzEzkrejDs-JOThHB9Buhoxo5-rdpRw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALCETrUw5sEr-MHPMU4CzEzkrejDs-JOThHB9Buhoxo5-rdpRw@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Fri, May 24, 2019 at 12:37:44PM -0700, Andy Lutomirski wrote:
> On Fri, May 24, 2019 at 11:34 AM Xing, Cedric <cedric.xing@intel.com> wrote:
> >
> > If "initial permissions" for enclaves are less restrictive than shared
> > objects, then it'd become a backdoor for circumventing LSM when enclave
> > whitelisting is *not* in place. For example, an adversary may load a page,
> > which would otherwise never be executable, as an executable page in EPC.
> >
> > In the case a RWX page is needed, the calling process has to have a RWX
> > page serving as the source for EADD so PROCESS__EXECMEM will have been
> > checked. For SGX2, changing an EPC page to RWX is subject to FILE__EXECMEM
> > on /dev/sgx/enclave, which I see as a security benefit because it only
> > affects the enclave but not the whole process hosting it.
> 
> So the permission would be like FILE__EXECMOD on the source enclave
> page, because it would be mapped MAP_ANONYMOUS, PROT_WRITE?
> MAP_SHARED, PROT_WRITE isn't going to work because that means you can
> modify the file.

Was this in response to Cedric's comment, or to my comment?

> I'm starting to think that looking at the source VMA permission bits
> or source PTE permission bits is putting a bit too much policy into
> the driver as opposed to the LSM.  How about delegating the whole
> thing to an LSM hook?  The EADD operation would invoke a new hook,
> something like:
> 
> int security_enclave_load_bytes(void *source_addr, struct
> vm_area_struct *source_vma, loff_t source_offset, unsigned int
> maxperm);
> 
> Then you don't have to muck with mapping anything PROT_EXEC.  Instead
> you load from a mapping of a file and the LSM applies whatever policy
> it feels appropriate.  If the first pass gets something wrong, the
> application or library authors can take it up with the SELinux folks
> without breaking the whole ABI :)
> 
> (I'm proposing passing in the source_vma because this hook would be
> called with mmap_sem held for read to avoid a TOCTOU race.)
> 
> If we go this route, the only substantial change to the existing
> driver that's needed for an initial upstream merge is the maxperm
> mechanism and whatever hopefully minimal API changes are needed to
> allow users to conveniently set up the mappings.  And we don't need to
> worry about how to hack around mprotect() calling into the LSM,
> because the LSM will actually be aware of SGX and can just do the
> right thing.

This doesn't address restricting which processes can run which enclaves,
it only allows restricting the build flow.  Or are you suggesting this
be done in addition to whitelisting sigstructs?

What's the value prop beyond whitelisting sigstructs?  Realistically, I
doubt LSMs/users will want to take the performance hit of scanning the
source bytes every time an enclave is loaded.

We could add seomthing like security_enclave_mprotect() in lieu of abusing
security_file_mprotect(), but passing the full source bytes seems a bit
much.
