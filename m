Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F40B962672
	for <lists+selinux@lfdr.de>; Mon,  8 Jul 2019 18:34:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727850AbfGHQec (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Mon, 8 Jul 2019 12:34:32 -0400
Received: from mga11.intel.com ([192.55.52.93]:53919 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727811AbfGHQec (ORCPT <rfc822;selinux@vger.kernel.org>);
        Mon, 8 Jul 2019 12:34:32 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 08 Jul 2019 09:34:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,466,1557212400"; 
   d="scan'208";a="248869192"
Received: from sjchrist-coffee.jf.intel.com (HELO linux.intel.com) ([10.54.74.165])
  by orsmga001.jf.intel.com with ESMTP; 08 Jul 2019 09:34:31 -0700
Date:   Mon, 8 Jul 2019 09:34:31 -0700
From:   Sean Christopherson <sean.j.christopherson@intel.com>
To:     "Xing, Cedric" <cedric.xing@intel.com>
Cc:     Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        "linux-sgx@vger.kernel.org" <linux-sgx@vger.kernel.org>,
        "linux-security-module@vger.kernel.org" 
        <linux-security-module@vger.kernel.org>,
        "selinux@vger.kernel.org" <selinux@vger.kernel.org>,
        "Roberts, William C" <william.c.roberts@intel.com>,
        "Schaufler, Casey" <casey.schaufler@intel.com>,
        James Morris <jmorris@namei.org>,
        "Hansen, Dave" <dave.hansen@intel.com>,
        Andy Lutomirski <luto@kernel.org>,
        Jethro Beekman <jethro@fortanix.com>,
        "Dr . Greg Wettstein" <greg@enjellic.com>,
        Stephen Smalley <sds@tycho.nsa.gov>
Subject: Re: [RFC PATCH v4 04/12] x86/sgx: Require userspace to define
 enclave pages' protection bits
Message-ID: <20190708163431.GF20433@linux.intel.com>
References: <20190619222401.14942-1-sean.j.christopherson@intel.com>
 <20190619222401.14942-5-sean.j.christopherson@intel.com>
 <960B34DE67B9E140824F1DCDEC400C0F65518451@ORSMSX116.amr.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <960B34DE67B9E140824F1DCDEC400C0F65518451@ORSMSX116.amr.corp.intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Fri, Jun 21, 2019 at 09:42:54AM -0700, Xing, Cedric wrote:
> > From: Christopherson, Sean J
> > Sent: Wednesday, June 19, 2019 3:24 PM
> > 
> > diff --git a/arch/x86/include/uapi/asm/sgx.h b/arch/x86/include/uapi/asm/sgx.h index
> > 6dba9f282232..67a3babbb24d 100644
> > --- a/arch/x86/include/uapi/asm/sgx.h
> > +++ b/arch/x86/include/uapi/asm/sgx.h
> > @@ -35,15 +35,17 @@ struct sgx_enclave_create  {
> >   * @src:	address for the page data
> >   * @secinfo:	address for the SECINFO data
> >   * @mrmask:	bitmask for the measured 256 byte chunks
> > + * @prot:	maximal PROT_{READ,WRITE,EXEC} protections for the page
> >   */
> >  struct sgx_enclave_add_page {
> >  	__u64	addr;
> >  	__u64	src;
> >  	__u64	secinfo;
> > -	__u64	mrmask;
> > +	__u16	mrmask;
> > +	__u8	prot;
> > +	__u8	pad;
> >  };
> 
> Given EPCM permissions cannot change in SGX1, these maximal PROT_* flags can
> be the same as EPCM permissions, so don't have to be specified by user code
> until SGX2. Given we don't have a clear picture on how SGX2 will work yet, I
> think we shall take "prot" off until it is proven necessary.

I'm ok with deriving the maximal protections from SECINFO, so long as we
acknowledge that we're preventing userspace from utilizing EMODPE (until
the kernel supports SGX2).

> > diff --git a/arch/x86/kernel/cpu/sgx/driver/main.c
> > b/arch/x86/kernel/cpu/sgx/driver/main.c
> > index 29384cdd0842..dabfe2a7245a 100644
> > --- a/arch/x86/kernel/cpu/sgx/driver/main.c
> > +++ b/arch/x86/kernel/cpu/sgx/driver/main.c
> > @@ -93,15 +93,64 @@ static long sgx_compat_ioctl(struct file *filep, unsigned int cmd,  }
> > #endif
> > 
> > +/*
> > + * Returns the AND of VM_{READ,WRITE,EXEC} permissions across all pages
> > + * covered by the specific VMA.  A non-existent (or yet to be added)
> > +enclave
> > + * page is considered to have no RWX permissions, i.e. is inaccessible.
> > + */
> > +static unsigned long sgx_allowed_rwx(struct sgx_encl *encl,
> > +				     struct vm_area_struct *vma)
> > +{
> > +	unsigned long allowed_rwx = VM_READ | VM_WRITE | VM_EXEC;
> > +	unsigned long idx, idx_start, idx_end;
> > +	struct sgx_encl_page *page;
> > +
> > +	idx_start = PFN_DOWN(vma->vm_start);
> > +	idx_end = PFN_DOWN(vma->vm_end - 1);
> > +
> > +	for (idx = idx_start; idx <= idx_end; ++idx) {
> > +		/*
> > +		 * No need to take encl->lock, vm_prot_bits is set prior to
> > +		 * insertion and never changes, and racing with adding pages is
> > +		 * a userspace bug.
> > +		 */
> > +		rcu_read_lock();
> > +		page = radix_tree_lookup(&encl->page_tree, idx);
> > +		rcu_read_unlock();
> 
> This loop iterates through every page in the range, which could be very slow
> if the range is large.

At this point I'm shooting for functional correctness and minimal code
changes.  Optimizations will be in order at some point, just not now.

> > +
> > +		/* Do not allow R|W|X to a non-existent page. */
> > +		if (!page)
> > +			allowed_rwx = 0;
> > +		else
> > +			allowed_rwx &= page->vm_prot_bits;
> > +		if (!allowed_rwx)
> > +			break;
> > +	}
> > +
> > +	return allowed_rwx;
> > +}
> > +
> >  static int sgx_mmap(struct file *file, struct vm_area_struct *vma)  {
> >  	struct sgx_encl *encl = file->private_data;
> > +	unsigned long allowed_rwx;
> >  	int ret;
> > 
> > +	allowed_rwx = sgx_allowed_rwx(encl, vma);
> > +	if (vma->vm_flags & (VM_READ | VM_WRITE | VM_EXEC) & ~allowed_rwx)
> > +		return -EACCES;
> > +
> >  	ret = sgx_encl_mm_add(encl, vma->vm_mm);
> >  	if (ret)
> >  		return ret;
> > 
> > +	if (!(allowed_rwx & VM_READ))
> > +		vma->vm_flags &= ~VM_MAYREAD;
> > +	if (!(allowed_rwx & VM_WRITE))
> > +		vma->vm_flags &= ~VM_MAYWRITE;
> > +	if (!(allowed_rwx & VM_EXEC))
> > +		vma->vm_flags &= ~VM_MAYEXEC;
> > +
> 
> Say a range comprised of a RW sub-range and a RX sub-range is being mmap()'ed
> as R here. It'd succeed but mprotect(<RW sub-range>, RW) afterwards will fail
> because VM_MAYWRITE is cleared here. However, if those two sub-ranges are
> mapped by separate mmap() calls then the same mprotect() would succeed. The
> inconsistence here is unexpected and unprecedented.

Boo, I thought I was being super clever.

> >  	vma->vm_ops = &sgx_vm_ops;
> >  	vma->vm_flags |= VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP | VM_IO;
> >  	vma->vm_private_data = encl;
> 
