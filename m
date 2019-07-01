Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 22A923B8EA
	for <lists+selinux@lfdr.de>; Mon, 10 Jun 2019 18:05:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403858AbfFJQF1 (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Mon, 10 Jun 2019 12:05:27 -0400
Received: from mga12.intel.com ([192.55.52.136]:6422 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2403847AbfFJQF1 (ORCPT <rfc822;selinux@vger.kernel.org>);
        Mon, 10 Jun 2019 12:05:27 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 10 Jun 2019 09:05:26 -0700
X-ExtLoop1: 1
Received: from cmargarx-wtg.ger.corp.intel.com (HELO localhost) ([10.249.34.77])
  by fmsmga006.fm.intel.com with ESMTP; 10 Jun 2019 09:05:16 -0700
Date:   Mon, 10 Jun 2019 19:05:16 +0300
From:   Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
To:     Sean Christopherson <sean.j.christopherson@intel.com>
Cc:     Andy Lutomirski <luto@kernel.org>,
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
Subject: Re: [RFC PATCH v2 4/5] LSM: x86/sgx: Introduce ->enclave_load() hook
 for Intel SGX
Message-ID: <20190610160423.GD3752@linux.intel.com>
References: <20190606021145.12604-1-sean.j.christopherson@intel.com>
 <20190606021145.12604-5-sean.j.christopherson@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190606021145.12604-5-sean.j.christopherson@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Wed, Jun 05, 2019 at 07:11:44PM -0700, Sean Christopherson wrote:
> enclave_load() is roughly analogous to the existing file_mprotect().
> 
> Due to the nature of SGX and its Enclave Page Cache (EPC), all enclave
> VMAs are backed by a single file, i.e. /dev/sgx/enclave, that must be
> MAP_SHARED.  Furthermore, all enclaves need read, write and execute
> VMAs.  As a result, the existing/standard call to file_mprotect() does
> not provide any meaningful security for enclaves since an LSM can only
> deny/grant access to the EPC as a whole.
> 
> security_enclave_load() is called when SGX is first loading an enclave
> page, i.e. copying a page from normal memory into the EPC.  Although
> the prototype for enclave_load() is similar to file_mprotect(), e.g.
> SGX could theoretically use file_mprotect() and set reqprot=prot, a
> separate hook is desirable as the semantics of an enclave's protection
> bits are different than those of vmas, e.g. an enclave page tracks the
> maximal set of protections, whereas file_mprotect() operates on the
> actual protections being provided.  In other words, LSMs will likely
> want to implement different policies for enclave page protections.
> 
> Note, extensive discussion yielded no sane alternative to some form of
> SGX specific LSM hook[1].
> 
> [1] https://lkml.kernel.org/r/CALCETrXf8mSK45h7sTK5Wf+pXLVn=Bjsc_RLpgO-h-qdzBRo5Q@mail.gmail.com
> 
> Signed-off-by: Sean Christopherson <sean.j.christopherson@intel.com>

4/5 and 5/5 should only be added after upstreaming SGX.

/Jarkko
