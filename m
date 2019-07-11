Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D023264E43
	for <lists+selinux@lfdr.de>; Thu, 11 Jul 2019 00:00:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727581AbfGJWA6 (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Wed, 10 Jul 2019 18:00:58 -0400
Received: from mga06.intel.com ([134.134.136.31]:43851 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726245AbfGJWA6 (ORCPT <rfc822;selinux@vger.kernel.org>);
        Wed, 10 Jul 2019 18:00:58 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 10 Jul 2019 15:00:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,476,1557212400"; 
   d="scan'208";a="171049098"
Received: from teutenbb-mobl1.ger.corp.intel.com (HELO localhost) ([10.252.50.108])
  by orsmga006.jf.intel.com with ESMTP; 10 Jul 2019 15:00:52 -0700
Date:   Thu, 11 Jul 2019 01:00:51 +0300
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
Message-ID: <20190710220051.vzeq5yi3u2zn7z2s@linux.intel.com>
References: <20190619222401.14942-1-sean.j.christopherson@intel.com>
 <20190705160549.tzsck5ho5kvtdhit@linux.intel.com>
 <20190708172930.GA20791@linux.intel.com>
 <20190709162203.gzyvulah5u7eksip@linux.intel.com>
 <20190709170917.GD25369@linux.intel.com>
 <20190710201930.ly7ykediuy35cjze@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190710201930.ly7ykediuy35cjze@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: NeoMutt/20180716
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Wed, Jul 10, 2019 at 11:19:30PM +0300, Jarkko Sakkinen wrote:
> Still, we need a documentation reference to reflect the narrative
> for these changes, seriously. It cannot be that SELinux is widely
> deployed and it completely lacks documentation for its basic
> objects, can it?

I found one good reference:

https://selinuxpTroject.org/page/ObjectClassesPerms

It describes EXECMOD as:

"Make executable a file mapping that has been modified by copy-on-write.
(Text relocation)"

This makes me wonder how EXECMOD even connects to this discussion?
Enclave is never a COW mapping. Seems like there is a huge diff on
how SELinux's official documentation describes it and how it is
described here...

/Jarkko
