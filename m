Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 594FE60F04
	for <lists+selinux@lfdr.de>; Sat,  6 Jul 2019 07:04:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725934AbfGFFEf (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Sat, 6 Jul 2019 01:04:35 -0400
Received: from mga06.intel.com ([134.134.136.31]:36387 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725909AbfGFFEf (ORCPT <rfc822;selinux@vger.kernel.org>);
        Sat, 6 Jul 2019 01:04:35 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 05 Jul 2019 22:04:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,457,1557212400"; 
   d="scan'208";a="155403210"
Received: from bxing-desk.ccr.corp.intel.com (HELO [134.134.148.187]) ([134.134.148.187])
  by orsmga007.jf.intel.com with ESMTP; 05 Jul 2019 22:04:34 -0700
Subject: Re: [RFC PATCH v2 0/3] security/x86/sgx: SGX specific LSM hooks
To:     Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Cc:     linux-sgx@vger.kernel.org, linux-security-module@vger.kernel.org,
        selinux@vger.kernel.org, casey.schaufler@intel.com,
        jmorris@namei.org, luto@kernel.org, jethro@fortanix.com,
        greg@enjellic.com, sds@tycho.nsa.gov,
        sean.j.christopherson@intel.com
References: <20190619222401.14942-1-sean.j.christopherson@intel.com>
 <cover.1561588012.git.cedric.xing@intel.com>
 <20190703231650.bhnkn34ccrzdwwhz@linux.intel.com>
From:   "Xing, Cedric" <cedric.xing@intel.com>
Message-ID: <415f8ae7-93d4-129e-4169-ffc7059398e5@intel.com>
Date:   Fri, 5 Jul 2019 22:04:31 -0700
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190703231650.bhnkn34ccrzdwwhz@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On 7/3/2019 4:16 PM, Jarkko Sakkinen wrote:
> On Thu, Jun 27, 2019 at 11:56:18AM -0700, Cedric Xing wrote:
> 
> I think it is fine to have these patch sets as a discussion starters but
> it does not make any sense to me to upstream LSM changes with the SGX
> foundations.

Guess LSM is a gating factor, because otherwise SGX could be abused to 
make executable EPC from pages that are otherwise not allowed to be 
executable. Am I missing anything?

> 
> This is exactly the same situation as with KVM changes. The patch set is
> already way too big to fit to the standards [1].
> 
> The eye should be on whether the uapi (e.g. device files, ioctl's) will
> work for LSM's in a legit way. Do we need more of these different
> flavors of experimental LSM changes or can we make some conclusions with
> the real issue we are trying to deal with?
> 
> [1] "Do not send more than 15 patches at once to the vger mailing lists!!!"
>      https://www.kernel.org/doc/html/v4.17/process/submitting-patches.html#select-the-recipients-for-your-patch
> 
> /Jarkko
> 

