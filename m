Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2316D44C94
	for <lists+selinux@lfdr.de>; Thu, 13 Jun 2019 21:48:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728304AbfFMTse (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Thu, 13 Jun 2019 15:48:34 -0400
Received: from mga18.intel.com ([134.134.136.126]:56847 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727156AbfFMTse (ORCPT <rfc822;selinux@vger.kernel.org>);
        Thu, 13 Jun 2019 15:48:34 -0400
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 13 Jun 2019 12:48:33 -0700
X-ExtLoop1: 1
Received: from sjchrist-coffee.jf.intel.com (HELO linux.intel.com) ([10.54.74.36])
  by orsmga002.jf.intel.com with ESMTP; 13 Jun 2019 12:48:33 -0700
Date:   Thu, 13 Jun 2019 12:48:33 -0700
From:   Sean Christopherson <sean.j.christopherson@intel.com>
To:     Stephen Smalley <sds@tycho.nsa.gov>
Cc:     "Xing, Cedric" <cedric.xing@intel.com>,
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
Message-ID: <20190613194833.GB18385@linux.intel.com>
References: <cover.1560131039.git.cedric.xing@intel.com>
 <a382d46f66756e13929ca9244479dd9f689c470e.1560131039.git.cedric.xing@intel.com>
 <b6f099cd-c0eb-d5cf-847d-27a15ac5ceaf@tycho.nsa.gov>
 <960B34DE67B9E140824F1DCDEC400C0F65502A85@ORSMSX116.amr.corp.intel.com>
 <b7f3decf-b1d2-01b1-6294-ccf9ba2d5df4@tycho.nsa.gov>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b7f3decf-b1d2-01b1-6294-ccf9ba2d5df4@tycho.nsa.gov>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Thu, Jun 13, 2019 at 02:00:29PM -0400, Stephen Smalley wrote:
> On 6/11/19 6:55 PM, Xing, Cedric wrote:
> >You are right that there are SGX specific stuff. More precisely, SGX
> >enclaves don't have access to anything except memory, so there are only 3
> >questions that need to be answered for each enclave page: 1) whether X is
> >allowed; 2) whether W->X is allowed and 3 whether WX is allowed. This
> >proposal tries to cache the answers to those questions upon creation of each
> >enclave page, meaning it involves a) figuring out the answers and b)
> >"remember" them for every page. #b is generic, mostly captured in
> >intel_sgx.c, and could be shared among all LSM modules; while #a is SELinux
> >specific. I could move intel_sgx.c up one level in the directory hierarchy
> >if that's what you'd suggest.
> >
> >By "SGX", did you mean the SGX subsystem being upstreamed? It doesn’t track
> >that state. In practice, there's no way for SGX to track it because there's
> >no vm_ops->may_mprotect() callback. It doesn't follow the philosophy of
> >Linux either, as mprotect() doesn't track it for regular memory. And it
> >doesn't have a use without LSM, so I believe it makes more sense to track it
> >inside LSM.
> 
> Yes, the SGX driver/subsystem.  I had the impression from Sean that it does
> track this kind of per-page state already in some manner, but possibly he
> means it does under a given proposal and not in the current driver.

Yeah, under a given proposal.  SGX has per-page tracking, adding new flags
is fairly easy.  Philosophical objections aside, adding .may_mprotect() is
trivial.

> Even the #b remembering might end up being SELinux-specific if we also have
> to remember the original inputs used to compute the answer so that we can
> audit that information when access is denied later upon mprotect().  At the
> least we'd need it to save some opaque data and pass it to a callback into
> SELinux to perform that auditing.
