Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5F54F46658
	for <lists+selinux@lfdr.de>; Fri, 14 Jun 2019 19:53:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727341AbfFNRxl (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Fri, 14 Jun 2019 13:53:41 -0400
Received: from mga06.intel.com ([134.134.136.31]:53258 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726701AbfFNRxk (ORCPT <rfc822;selinux@vger.kernel.org>);
        Fri, 14 Jun 2019 13:53:40 -0400
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 14 Jun 2019 10:53:39 -0700
X-ExtLoop1: 1
Received: from sjchrist-coffee.jf.intel.com (HELO linux.intel.com) ([10.54.74.36])
  by orsmga001.jf.intel.com with ESMTP; 14 Jun 2019 10:53:39 -0700
Date:   Fri, 14 Jun 2019 10:53:39 -0700
From:   Sean Christopherson <sean.j.christopherson@intel.com>
To:     "Xing, Cedric" <cedric.xing@intel.com>
Cc:     Stephen Smalley <sds@tycho.nsa.gov>,
        "linux-security-module@vger.kernel.org" 
        <linux-security-module@vger.kernel.org>,
        "selinux@vger.kernel.org" <selinux@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-sgx@vger.kernel.org" <linux-sgx@vger.kernel.org>,
        "jarkko.sakkinen@linux.intel.com" <jarkko.sakkinen@linux.intel.com>,
        "luto@kernel.org" <luto@kernel.org>,
        "jmorris@namei.org" <jmorris@namei.org>,
        "serge@hallyn.com" <serge@hallyn.com>,
        "paul@paul-moore.com" <paul@paul-moore.com>,
        "eparis@parisplace.org" <eparis@parisplace.org>,
        "jethro@fortanix.com" <jethro@fortanix.com>,
        "Hansen, Dave" <dave.hansen@intel.com>,
        "tglx@linutronix.de" <tglx@linutronix.de>,
        "torvalds@linux-foundation.org" <torvalds@linux-foundation.org>,
        "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
        "nhorman@redhat.com" <nhorman@redhat.com>,
        "pmccallum@redhat.com" <pmccallum@redhat.com>,
        "Ayoun, Serge" <serge.ayoun@intel.com>,
        "Katz-zamir, Shay" <shay.katz-zamir@intel.com>,
        "Huang, Haitao" <haitao.huang@intel.com>,
        "andriy.shevchenko@linux.intel.com" 
        <andriy.shevchenko@linux.intel.com>,
        "Svahn, Kai" <kai.svahn@intel.com>, "bp@alien8.de" <bp@alien8.de>,
        "josh@joshtriplett.org" <josh@joshtriplett.org>,
        "Huang, Kai" <kai.huang@intel.com>,
        "rientjes@google.com" <rientjes@google.com>,
        "Roberts, William C" <william.c.roberts@intel.com>,
        "Tricca, Philip B" <philip.b.tricca@intel.com>
Subject: Re: [RFC PATCH v1 2/3] LSM/x86/sgx: Implement SGX specific hooks in
 SELinux
Message-ID: <20190614175339.GA29126@linux.intel.com>
References: <cover.1560131039.git.cedric.xing@intel.com>
 <a382d46f66756e13929ca9244479dd9f689c470e.1560131039.git.cedric.xing@intel.com>
 <b6f099cd-c0eb-d5cf-847d-27a15ac5ceaf@tycho.nsa.gov>
 <20190611220243.GB3416@linux.intel.com>
 <8d99d8fb-a921-286a-8cf0-cd522e09b37c@tycho.nsa.gov>
 <20190614004600.GF18385@linux.intel.com>
 <960B34DE67B9E140824F1DCDEC400C0F65504665@ORSMSX116.amr.corp.intel.com>
 <20190614174556.GJ12191@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190614174556.GJ12191@linux.intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Fri, Jun 14, 2019 at 10:45:56AM -0700, Sean Christopherson wrote:
> The state tracking of #2/#3 doesn't scare me, it's purely the auditing.
> Holding an audit message for an indeterminate amount of time is a
> nightmare.
> 
> Here's a thought.  What if we simply require FILE__EXECUTE or AA_EXEC_MAP
> to load any enclave page from a file?  Alternatively, we could add an SGX
> specific file policity, e.g. FILE__ENCLAVELOAD and AA_MAY_LOAD_ENCLAVE.
> As in my other email, SELinux's W^X restrictions can be tied to the process,
> i.e. they can be checked at mmap()/mprotect() without throwing a wrench in
> auditing.

We would also need to require VM_MAYEXEC on all enclave pages, or forego
enforcing path_noexec() for enclaves.
