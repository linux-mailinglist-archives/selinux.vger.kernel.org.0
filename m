Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EC33C3BB51
	for <lists+selinux@lfdr.de>; Mon, 10 Jun 2019 19:48:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388411AbfFJRrz convert rfc822-to-8bit (ORCPT
        <rfc822;lists+selinux@lfdr.de>); Mon, 10 Jun 2019 13:47:55 -0400
Received: from mga11.intel.com ([192.55.52.93]:49726 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387643AbfFJRrz (ORCPT <rfc822;selinux@vger.kernel.org>);
        Mon, 10 Jun 2019 13:47:55 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 10 Jun 2019 10:47:54 -0700
X-ExtLoop1: 1
Received: from orsmsx107.amr.corp.intel.com ([10.22.240.5])
  by orsmga005.jf.intel.com with ESMTP; 10 Jun 2019 10:47:53 -0700
Received: from orsmsx160.amr.corp.intel.com (10.22.226.43) by
 ORSMSX107.amr.corp.intel.com (10.22.240.5) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Mon, 10 Jun 2019 10:47:53 -0700
Received: from orsmsx116.amr.corp.intel.com ([169.254.7.166]) by
 ORSMSX160.amr.corp.intel.com ([169.254.13.69]) with mapi id 14.03.0415.000;
 Mon, 10 Jun 2019 10:47:53 -0700
From:   "Xing, Cedric" <cedric.xing@intel.com>
To:     "Christopherson, Sean J" <sean.j.christopherson@intel.com>,
        "Jarkko Sakkinen" <jarkko.sakkinen@linux.intel.com>
CC:     Andy Lutomirski <luto@kernel.org>,
        Stephen Smalley <sds@tycho.nsa.gov>,
        James Morris <jmorris@namei.org>,
        "Serge E . Hallyn" <serge@hallyn.com>,
        LSM List <linux-security-module@vger.kernel.org>,
        Paul Moore <paul@paul-moore.com>,
        Eric Paris <eparis@parisplace.org>,
        "selinux@vger.kernel.org" <selinux@vger.kernel.org>,
        Jethro Beekman <jethro@fortanix.com>,
        "Hansen, Dave" <dave.hansen@intel.com>,
        "Thomas Gleixner" <tglx@linutronix.de>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        LKML <linux-kernel@vger.kernel.org>, X86 ML <x86@kernel.org>,
        "linux-sgx@vger.kernel.org" <linux-sgx@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        "nhorman@redhat.com" <nhorman@redhat.com>,
        "npmccallum@redhat.com" <npmccallum@redhat.com>,
        "Ayoun, Serge" <serge.ayoun@intel.com>,
        "Katz-zamir, Shay" <shay.katz-zamir@intel.com>,
        "Huang, Haitao" <haitao.huang@intel.com>,
        "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
        "Svahn, Kai" <kai.svahn@intel.com>, Borislav Petkov <bp@alien8.de>,
        Josh Triplett <josh@joshtriplett.org>,
        "Huang, Kai" <kai.huang@intel.com>,
        David Rientjes <rientjes@google.com>,
        "Roberts, William C" <william.c.roberts@intel.com>,
        "Tricca, Philip B" <philip.b.tricca@intel.com>
Subject: RE: [RFC PATCH v2 1/5] mm: Introduce vm_ops->may_mprotect()
Thread-Topic: [RFC PATCH v2 1/5] mm: Introduce vm_ops->may_mprotect()
Thread-Index: AQHVHA01/2g2StwB+UmAXBpwpA92D6aVeUUAgAAN64D//6b7AA==
Date:   Mon, 10 Jun 2019 17:47:52 +0000
Message-ID: <960B34DE67B9E140824F1DCDEC400C0F654FFD59@ORSMSX116.amr.corp.intel.com>
References: <20190606021145.12604-1-sean.j.christopherson@intel.com>
 <20190606021145.12604-2-sean.j.christopherson@intel.com>
 <20190610150600.GA3752@linux.intel.com>
 <20190610155549.GB15995@linux.intel.com>
In-Reply-To: <20190610155549.GB15995@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiYzM0YTFiOWItZTQxNy00N2YxLTg4NjEtNzdmZjc4ODE1N2EwIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoicWhaTjFJMVVqenc2R1JyZHdBTkplRTlsOFZQZWV6YkM5eGl0YXh4TmZcL1VnaVFVQlRcL005U1Jpa2ZaVEh6XC9PTyJ9
x-ctpclassification: CTP_NT
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.22.254.138]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

> From: Christopherson, Sean J
> Sent: Monday, June 10, 2019 8:56 AM
> 
> > > As a result, LSM policies cannot be meaningfully applied, e.g. an
> > > LSM can deny access to the EPC as a whole, but can't deny PROT_EXEC
> > > on page that originated in a non-EXECUTE file (which is long gone by
> > > the time
> > > mprotect() is called).
> >
> > I have hard time following what is paragraph is trying to say.
> >
> > > By hooking mprotect(), SGX can make explicit LSM upcalls while an
> > > enclave is being built, i.e. when the kernel has a handle to origin
> > > of each enclave page, and enforce the result of the LSM policy
> > > whenever userspace maps the enclave page in the future.
> >
> > "LSM policy whenever calls mprotect()"? I'm no sure why you mean by
> > mapping here and if there is any need to talk about future. Isn't this
> > needed now?
> 
> Future is referring to the timeline of a running kernel, not the future
> of the kernel code.
> 
> Rather than trying to explain all of the above with words, I'll provide
> code examples to show how ->may_protect() will be used by SGX and why it
> is the preferred solution.

The LSM concept is to separate security policy enforcement from the rest of the kernel. For modules, the "official" way is to use VM_MAY* flags to limit allowable permissions, while LSM uses security_file_mprotect(). I guess that's why we didn't have .may_mprotect() in the first place. What you are doing is enforcing some security policy outside of LSM, which is dirty from architecture perspective.
