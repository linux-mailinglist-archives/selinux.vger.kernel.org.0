Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 397565EF8E
	for <lists+selinux@lfdr.de>; Thu,  4 Jul 2019 01:16:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727193AbfGCXQ5 (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Wed, 3 Jul 2019 19:16:57 -0400
Received: from mga18.intel.com ([134.134.136.126]:50625 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726988AbfGCXQ5 (ORCPT <rfc822;selinux@vger.kernel.org>);
        Wed, 3 Jul 2019 19:16:57 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 03 Jul 2019 16:16:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,448,1557212400"; 
   d="scan'208";a="175088689"
Received: from elsaidmo-mobl2.ger.corp.intel.com (HELO localhost) ([10.249.33.22])
  by orsmga002.jf.intel.com with ESMTP; 03 Jul 2019 16:16:51 -0700
Date:   Thu, 4 Jul 2019 02:16:50 +0300
From:   Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
To:     Cedric Xing <cedric.xing@intel.com>
Cc:     linux-sgx@vger.kernel.org, linux-security-module@vger.kernel.org,
        selinux@vger.kernel.org, casey.schaufler@intel.com,
        jmorris@namei.org, luto@kernel.org, jethro@fortanix.com,
        greg@enjellic.com, sds@tycho.nsa.gov,
        sean.j.christopherson@intel.com
Subject: Re: [RFC PATCH v2 0/3] security/x86/sgx: SGX specific LSM hooks
Message-ID: <20190703231650.bhnkn34ccrzdwwhz@linux.intel.com>
References: <20190619222401.14942-1-sean.j.christopherson@intel.com>
 <cover.1561588012.git.cedric.xing@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1561588012.git.cedric.xing@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: NeoMutt/20180716
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Thu, Jun 27, 2019 at 11:56:18AM -0700, Cedric Xing wrote:

I think it is fine to have these patch sets as a discussion starters but
it does not make any sense to me to upstream LSM changes with the SGX
foundations.

This is exactly the same situation as with KVM changes. The patch set is
already way too big to fit to the standards [1].

The eye should be on whether the uapi (e.g. device files, ioctl's) will
work for LSM's in a legit way. Do we need more of these different
flavors of experimental LSM changes or can we make some conclusions with
the real issue we are trying to deal with?

[1] "Do not send more than 15 patches at once to the vger mailing lists!!!"
    https://www.kernel.org/doc/html/v4.17/process/submitting-patches.html#select-the-recipients-for-your-patch

/Jarkko
