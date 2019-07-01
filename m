Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3F5A233985
	for <lists+selinux@lfdr.de>; Mon,  3 Jun 2019 22:08:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726608AbfFCUIH (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Mon, 3 Jun 2019 16:08:07 -0400
Received: from mga04.intel.com ([192.55.52.120]:65148 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725876AbfFCUIG (ORCPT <rfc822;selinux@vger.kernel.org>);
        Mon, 3 Jun 2019 16:08:06 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 03 Jun 2019 13:08:05 -0700
X-ExtLoop1: 1
Received: from sjchrist-coffee.jf.intel.com (HELO linux.intel.com) ([10.54.74.36])
  by fmsmga007.fm.intel.com with ESMTP; 03 Jun 2019 13:08:04 -0700
Date:   Mon, 3 Jun 2019 13:08:04 -0700
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
Subject: Re: [RFC PATCH 3/9] x86/sgx: Allow userspace to add multiple pages
 in single ioctl()
Message-ID: <20190603200804.GG13384@linux.intel.com>
References: <20190531233159.30992-1-sean.j.christopherson@intel.com>
 <20190531233159.30992-4-sean.j.christopherson@intel.com>
 <960B34DE67B9E140824F1DCDEC400C0F654ECBBD@ORSMSX116.amr.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <960B34DE67B9E140824F1DCDEC400C0F654ECBBD@ORSMSX116.amr.corp.intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Sun, Jun 02, 2019 at 11:26:09PM -0700, Xing, Cedric wrote:
> > From: Christopherson, Sean J
> > Sent: Friday, May 31, 2019 4:32 PM
> > 
> > +/**
> > + * sgx_ioc_enclave_add_pages - handler for %SGX_IOC_ENCLAVE_ADD_PAGES
> > + *
> > + * @filep:	open file to /dev/sgx
> > + * @cmd:	the command value
> > + * @arg:	pointer to an &sgx_enclave_add_page instance
> > + *
> > + * Add a range of pages to an uninitialized enclave (EADD), and
> > +optionally
> > + * extend the enclave's measurement with the contents of the page (EEXTEND).
> > + * The range of pages must be virtually contiguous.  The SECINFO and
> > + * measurement maskare applied to all pages, i.e. pages with different
> > + * properties must be added in separate calls.
> > + *
> > + * EADD and EEXTEND are done asynchronously via worker threads.  A
> > +successful
> > + * sgx_ioc_enclave_add_page() only indicates the pages have been added
> > +to the
> > + * work queue, it does not guarantee adding the pages to the enclave
> > +will
> > + * succeed.
> > + *
> > + * Return:
> > + *   0 on success,
> > + *   -errno otherwise
> > + */
> > +static long sgx_ioc_enclave_add_pages(struct file *filep, unsigned int cmd,
> > +				      unsigned long arg)
> > +{
> > +	struct sgx_enclave_add_pages *addp = (void *)arg;
> > +	struct sgx_encl *encl = filep->private_data;
> > +	struct sgx_secinfo secinfo;
> > +	unsigned int i;
> > +	int ret;
> > +
> > +	if (copy_from_user(&secinfo, (void __user *)addp->secinfo,
> > +			   sizeof(secinfo)))
> > +		return -EFAULT;
> > +
> > +	for (i = 0, ret = 0; i < addp->nr_pages && !ret; i++) {
> > +		if (signal_pending(current))
> > +			return -ERESTARTSYS;
> 
> If interrupted, how would user mode code know how many pages have been EADD'ed?

Hmm, updating nr_pages would be fairly simple and shouldn't confuse
userspace, e.g. as opposed to overloading the return value.

> > +
> > +		if (need_resched())
> > +			cond_resched();
> > +
> > +		ret = sgx_encl_add_page(encl, addp->addr + i*PAGE_SIZE,
> > +					addp->src + i*PAGE_SIZE,
> > +					&secinfo, addp->mrmask);
> > +	}
> >  	return ret;
> >  }
> > 
> > @@ -823,8 +845,8 @@ long sgx_ioctl(struct file *filep, unsigned int cmd, unsigned long arg)
> >  	case SGX_IOC_ENCLAVE_CREATE:
> >  		handler = sgx_ioc_enclave_create;
> >  		break;
> > -	case SGX_IOC_ENCLAVE_ADD_PAGE:
> > -		handler = sgx_ioc_enclave_add_page;
> > +	case SGX_IOC_ENCLAVE_ADD_PAGES:
> > +		handler = sgx_ioc_enclave_add_pages;
> >  		break;
> >  	case SGX_IOC_ENCLAVE_INIT:
> >  		handler = sgx_ioc_enclave_init;
> > --
> > 2.21.0
> 
