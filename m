Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6F62437837
	for <lists+selinux@lfdr.de>; Thu,  6 Jun 2019 17:37:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729191AbfFFPhj (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Thu, 6 Jun 2019 11:37:39 -0400
Received: from mga18.intel.com ([134.134.136.126]:14081 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729173AbfFFPhi (ORCPT <rfc822;selinux@vger.kernel.org>);
        Thu, 6 Jun 2019 11:37:38 -0400
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 06 Jun 2019 08:37:37 -0700
X-ExtLoop1: 1
Received: from harend-mobl.ger.corp.intel.com (HELO localhost) ([10.252.33.8])
  by fmsmga008.fm.intel.com with ESMTP; 06 Jun 2019 08:37:24 -0700
Date:   Thu, 6 Jun 2019 18:37:23 +0300
From:   Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
To:     Andy Lutomirski <luto@amacapital.net>
Cc:     "Xing, Cedric" <cedric.xing@intel.com>,
        Andy Lutomirski <luto@kernel.org>,
        "Christopherson, Sean J" <sean.j.christopherson@intel.com>,
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
Subject: Re: [RFC PATCH 2/9] x86/sgx: Do not naturally align MAP_FIXED address
Message-ID: <20190606153710.GB25112@linux.intel.com>
References: <20190531233159.30992-1-sean.j.christopherson@intel.com>
 <20190531233159.30992-3-sean.j.christopherson@intel.com>
 <20190604114951.GC30594@linux.intel.com>
 <CALCETrVe0jhAWAFmx+NFEjJcijSJv2LDVC7cUXi0w99kNKjh_g@mail.gmail.com>
 <960B34DE67B9E140824F1DCDEC400C0F654EDBDE@ORSMSX116.amr.corp.intel.com>
 <20190605151653.GK11331@linux.intel.com>
 <5A85C1D7-A159-437E-B42A-3F4254E07305@amacapital.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5A85C1D7-A159-437E-B42A-3F4254E07305@amacapital.net>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Wed, Jun 05, 2019 at 01:14:04PM -0700, Andy Lutomirski wrote:
> 
> 
> > On Jun 5, 2019, at 8:17 AM, Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com> wrote:
> > 
> >> On Tue, Jun 04, 2019 at 10:10:22PM +0000, Xing, Cedric wrote:
> >> A bit off topic here. This mmap()/mprotect() discussion reminds me a
> >> question (guess for Jarkko): Now that vma->vm_file->private_data keeps
> >> a pointer to the enclave, why do we store it again in vma->vm_private?
> >> It isn't a big deal but non-NULL vm_private does prevent mprotect()
> >> from merging adjacent VMAs. 
> > 
> > Same semantics as with a regular mmap i.e. you can close the file and
> > still use the mapping.
> > 
> > 
> 
> The file should be properly refcounted — vm_file should not go away while it’s mapped.

Right, makes sense. It is easy one to change essentially just removing
internal refcount from sgx_encl and using file for the same. I'll update
this to my tree along with the changes to remove LKM/ACPI bits ASAP.

/Jarkko
