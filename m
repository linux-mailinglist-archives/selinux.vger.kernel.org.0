Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 12FD864EA3
	for <lists+selinux@lfdr.de>; Thu, 11 Jul 2019 00:16:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727705AbfGJWQn (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Wed, 10 Jul 2019 18:16:43 -0400
Received: from mga11.intel.com ([192.55.52.93]:57323 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726245AbfGJWQn (ORCPT <rfc822;selinux@vger.kernel.org>);
        Wed, 10 Jul 2019 18:16:43 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 10 Jul 2019 15:16:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,476,1557212400"; 
   d="scan'208";a="364619917"
Received: from teutenbb-mobl1.ger.corp.intel.com (HELO localhost) ([10.252.50.108])
  by fmsmga005.fm.intel.com with ESMTP; 10 Jul 2019 15:16:39 -0700
Date:   Thu, 11 Jul 2019 01:16:38 +0300
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
Subject: Re: [RFC PATCH v4 00/12] security: x86/sgx: SGX vs. LSM
Message-ID: <20190710221638.bwnwtcozpv44ojdg@linux.intel.com>
References: <20190619222401.14942-1-sean.j.christopherson@intel.com>
 <20190705160549.tzsck5ho5kvtdhit@linux.intel.com>
 <20190708172930.GA20791@linux.intel.com>
 <20190709162203.gzyvulah5u7eksip@linux.intel.com>
 <20190709170917.GD25369@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190709170917.GD25369@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: NeoMutt/20180716
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Just some questions on these.

On Tue, Jul 09, 2019 at 10:09:17AM -0700, Sean Christopherson wrote:
>   - FILE__ENCLAVE_EXECUTE: equivalent to FILE__EXECUTE, required to gain X
>                            on an enclave page loaded from a regular file

One thing that I have hard time to perceive is that whether the process
or the target object has them. So would this be in the files extended
attribute or does process need to possess this or both?


>   - PROCESS2__ENCLAVE_EXECDIRTY: hybrid of EXECMOD and EXECUTE+WRITE,
>                                  required to gain W->X on an enclave page

Still puzzling with EXECMOD given that how it is documented in
https://selinuxproject.org/page/ObjectClassesPerms. If anything in that
document is out of date, would be nice if it was updated.

>   - PROCESS2__ENCLAVE_EXECANON: subset of EXECMEM, required to gain X on
>                                 an enclave page that is loaded from an
>                                 anonymous mapping
>
>   - PROCESS2__ENCLAVE_MAPWX: subset of EXECMEM, required to gain WX on an
>                              enclave page

I guess these three belong to the process and are not attached to file.

How in SELinux anyway process in the first place acquires any SELinux
permissions? I guess getty or whatever login process can set its perms
before setuid() et al somehow (I don't know how) because they run as
root?

/Jarkko
