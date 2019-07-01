Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 625E84DE5B
	for <lists+selinux@lfdr.de>; Fri, 21 Jun 2019 03:16:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725936AbfFUBQ0 (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Thu, 20 Jun 2019 21:16:26 -0400
Received: from mga14.intel.com ([192.55.52.115]:64919 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725906AbfFUBQ0 (ORCPT <rfc822;selinux@vger.kernel.org>);
        Thu, 20 Jun 2019 21:16:26 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 20 Jun 2019 18:16:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,398,1557212400"; 
   d="scan'208";a="160840397"
Received: from mudigirx-mobl1.gar.corp.intel.com (HELO localhost) ([10.252.61.12])
  by fmsmga008.fm.intel.com with ESMTP; 20 Jun 2019 18:16:19 -0700
Date:   Fri, 21 Jun 2019 04:16:18 +0300
From:   Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
To:     Sean Christopherson <sean.j.christopherson@intel.com>
Cc:     linux-sgx@vger.kernel.org, linux-security-module@vger.kernel.org,
        selinux@vger.kernel.org,
        Bill Roberts <william.c.roberts@intel.com>,
        Casey Schaufler <casey.schaufler@intel.com>,
        James Morris <jmorris@namei.org>,
        Dave Hansen <dave.hansen@intel.com>,
        Cedric Xing <cedric.xing@intel.com>,
        Andy Lutomirski <luto@kernel.org>,
        Jethro Beekman <jethro@fortanix.com>,
        "Dr . Greg Wettstein" <greg@enjellic.com>,
        Stephen Smalley <sds@tycho.nsa.gov>
Subject: Re: [RFC PATCH v4 04/12] x86/sgx: Require userspace to define
 enclave pages' protection bits
Message-ID: <20190621011618.GH20474@linux.intel.com>
References: <20190619222401.14942-1-sean.j.christopherson@intel.com>
 <20190619222401.14942-5-sean.j.christopherson@intel.com>
 <20190621010753.GG20474@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190621010753.GG20474@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Fri, Jun 21, 2019 at 04:07:53AM +0300, Jarkko Sakkinen wrote:
> /**
>  * sgx_calc_vma_prot_intersection() - Calculate intersection of the permissions
>  *				      for a VMA
>  * @encl:	an enclave
>  * @vma:	a VMA inside the enclave
>  *
>  * Iterate through the page addresses inside the VMA and calculate a bitmask
>  * of permissions that all pages have in common. Page addresses that do
>  * not have an associated enclave page are interpreted to zero
>  * permissions.
>  */
> 
> > +static unsigned long sgx_allowed_rwx(struct sgx_encl *encl,
> > +				     struct vm_area_struct *vma)
> 
> Suggestion for the name: sgx_calc_vma_prot_intersection()

And have you thought off caching these results?

I.e. hold the result for each VMA and only recalculate when the old
value is dirty. Just a random thought, zero analysis but though that
good to mention anyway.

/Jarkko
