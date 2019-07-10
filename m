Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DB62F63D47
	for <lists+selinux@lfdr.de>; Tue,  9 Jul 2019 23:26:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729084AbfGIV0m (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Tue, 9 Jul 2019 17:26:42 -0400
Received: from mga01.intel.com ([192.55.52.88]:31382 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726428AbfGIV0m (ORCPT <rfc822;selinux@vger.kernel.org>);
        Tue, 9 Jul 2019 17:26:42 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 09 Jul 2019 14:26:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,472,1557212400"; 
   d="scan'208";a="168109808"
Received: from bxing-desk.ccr.corp.intel.com (HELO [134.134.148.187]) ([134.134.148.187])
  by orsmga003.jf.intel.com with ESMTP; 09 Jul 2019 14:26:41 -0700
Subject: Re: [RFC PATCH v3 4/4] x86/sgx: Implement SGX specific hooks in
 SELinux
To:     Sean Christopherson <sean.j.christopherson@intel.com>
Cc:     linux-sgx@vger.kernel.org, linux-security-module@vger.kernel.org,
        selinux@vger.kernel.org
References: <cover.1561588012.git.cedric.xing@intel.com>
 <cover.1562542383.git.cedric.xing@intel.com>
 <3a9efc8d3c27490dbcfe802ce3facddd62f47872.1562542383.git.cedric.xing@intel.com>
 <20190709013335.GB24799@linux.intel.com>
From:   "Xing, Cedric" <cedric.xing@intel.com>
Message-ID: <379be516-ed71-0946-0a7b-c33d95e5c2f0@intel.com>
Date:   Tue, 9 Jul 2019 14:26:41 -0700
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190709013335.GB24799@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On 7/8/2019 6:33 PM, Sean Christopherson wrote:
> On Sun, Jul 07, 2019 at 04:41:34PM -0700, Cedric Xing wrote:
>> +static int enclave_mprotect(struct vm_area_struct *vma, size_t prot)
>> +{
>> +	struct ema_map *m;
>> +	int rc;
>> +
>> +	/* is vma an enclave vma ? */
>> +	if (!vma->vm_file)
>> +		return 0;
>> +	m = ema_get_map(vma->vm_file);
>> +	if (!m)
>> +		return 0;
>> +
>> +	/* WX requires EXECMEM */
>> +	if ((prot && PROT_WRITE) && (prot & PROT_EXEC)) {
>> +		rc = avc_has_perm(&selinux_state, current_sid(), current_sid(),
>> +				  SECCLASS_PROCESS, PROCESS__EXECMEM, NULL);
>> +		if (rc)
>> +			return rc;
>> +	}
>> +
>> +	rc = ema_lock_map(m);
>> +	if (rc)
>> +		return rc;
>> +
>> +	if ((prot & PROT_EXEC) && !(vma->vm_flags & VM_EXEC))
>> +		rc = ema_apply_to_range(m, vma->vm_start, vma->vm_end,
>> +					ema__chk_X_cb, vma->vm_file);
>> +	if (!rc && (prot & PROT_WRITE) && !(vma->vm_flags & VM_WRITE))
>> +		rc = ema_apply_to_range(m, vma->vm_start, vma->vm_end,
>> +					ema__set_M_cb, NULL);
> 
> Not tracking whether a page has been mapped X and having ema__chk_W_cb()
> allows an application to circumvent W^X policies by spinning up a helper
> process.

See my response in another email.

This problem has nothing to do with the architecture, but is just a 
policy choice. Your patch of EXECDIRTY is another possible policy, by 
combining (or *not* distinguishing) W->X and X->W into a single WX 
"maximal protection".

> Ignoring that issue, this approach suffers from the same race condition I
> pointed out a while back[1].  If process A maps a page W and process B
> maps the same page X, then the result of ema__chk_X_cb() depends on the
> order of mprotect() calls between A and B.
> 
> [1] https://lore.kernel.org/linux-security-module/20190614200123.GA32570@linux.intel.com/

You seem to be talking about the same problem in both places.

>> +	ema_unlock_map(m);
>> +
>> +	return rc;
>> +}
