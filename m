Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B692B474389
	for <lists+selinux@lfdr.de>; Tue, 14 Dec 2021 14:34:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234435AbhLNNeN (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Tue, 14 Dec 2021 08:34:13 -0500
Received: from mga18.intel.com ([134.134.136.126]:20567 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229902AbhLNNeN (ORCPT <rfc822;selinux@vger.kernel.org>);
        Tue, 14 Dec 2021 08:34:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639488852; x=1671024852;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Cp/U7Rj0wRXM905zig+Cwu9+lszpYSZ77sj8obXe/qI=;
  b=hznXwlv6k1eXGhH55wXAragNfgEu0a8dcOK1qd5a8V9gLj/DA87UpW+1
   CzFDRBu6X8ejYtaBrcQSHpsg8qbJNWDHPRj7wFkBLdGXc8rib9JNQ1gaN
   9xEL1X933yEA1/h9g0fZa7N2KQkVd51yLXxgTFyvNZqn1u+DLVyBb69rw
   gw1LWUsX4tfp9O/mF7kY5zZ4YF14LKxtGA/4jeo1OlS1DEpHk0bBmLsi3
   zQC1tD3S3ogouq1WweZcN3xcEsCcAjpE/EekPUThEKB1yrIXl1zCUu+Z2
   UHNlclCwB+gxmPkfmDF23zqND15TxErd1NCoFV3+wG9ADSt1KXR9Y9amg
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10197"; a="225836066"
X-IronPort-AV: E=Sophos;i="5.88,205,1635231600"; 
   d="scan'208";a="225836066"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2021 05:34:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,205,1635231600"; 
   d="scan'208";a="545166088"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 14 Dec 2021 05:34:09 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mx7wW-0000MY-VW; Tue, 14 Dec 2021 13:34:08 +0000
Date:   Tue, 14 Dec 2021 21:33:10 +0800
From:   kernel test robot <lkp@intel.com>
To:     Casey Schaufler <casey@schaufler-ca.com>,
        casey.schaufler@intel.com, jmorris@namei.org,
        linux-security-module@vger.kernel.org, selinux@vger.kernel.org
Cc:     kbuild-all@lists.01.org, casey@schaufler-ca.com,
        linux-audit@redhat.com, keescook@chromium.org,
        john.johansen@canonical.com, penguin-kernel@i-love.sakura.ne.jp,
        paul@paul-moore.com
Subject: Re: [PATCH v31 01/28] integrity: disassociate ima_filter_rule from
 security_audit_rule
Message-ID: <202112142134.jipW98iP-lkp@intel.com>
References: <20211213234034.111891-2-casey@schaufler-ca.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211213234034.111891-2-casey@schaufler-ca.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Hi Casey,

I love your patch! Yet something to improve:

[auto build test ERROR on nf-next/master]
[also build test ERROR on nf/master linus/master jmorris-security/next-testing v5.16-rc5]
[cannot apply to pcmoore-audit/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Casey-Schaufler/integrity-disassociate-ima_filter_rule-from-security_audit_rule/20211214-084057
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pablo/nf-next.git master
config: openrisc-randconfig-r012-20211213 (https://download.01.org/0day-ci/archive/20211214/202112142134.jipW98iP-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/dcedf3ce1784c565747e19c7917ddbcd3422b821
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Casey-Schaufler/integrity-disassociate-ima_filter_rule-from-security_audit_rule/20211214-084057
        git checkout dcedf3ce1784c565747e19c7917ddbcd3422b821
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=openrisc SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   security/integrity/ima/ima_policy.c: In function 'ima_lsm_free_rule':
>> security/integrity/ima/ima_policy.c:360:17: error: implicit declaration of function 'ima_filter_rule_free'; did you mean 'ima_file_free'? [-Werror=implicit-function-declaration]
     360 |                 ima_filter_rule_free(entry->lsm[i].rule);
         |                 ^~~~~~~~~~~~~~~~~~~~
         |                 ima_file_free
   security/integrity/ima/ima_policy.c: In function 'ima_lsm_copy_rule':
>> security/integrity/ima/ima_policy.c:409:17: error: implicit declaration of function 'ima_filter_rule_init' [-Werror=implicit-function-declaration]
     409 |                 ima_filter_rule_init(nentry->lsm[i].type, Audit_equal,
         |                 ^~~~~~~~~~~~~~~~~~~~
   security/integrity/ima/ima_policy.c: In function 'ima_match_rules':
>> security/integrity/ima/ima_policy.c:625:30: error: implicit declaration of function 'ima_filter_rule_match' [-Werror=implicit-function-declaration]
     625 |                         rc = ima_filter_rule_match(osid, rule->lsm[i].type,
         |                              ^~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +360 security/integrity/ima/ima_policy.c

176377d97d6a3f Tyler Hicks      2020-08-11  354  
b169424551930a Janne Karhunen   2019-06-14  355  static void ima_lsm_free_rule(struct ima_rule_entry *entry)
b169424551930a Janne Karhunen   2019-06-14  356  {
b169424551930a Janne Karhunen   2019-06-14  357  	int i;
b169424551930a Janne Karhunen   2019-06-14  358  
b169424551930a Janne Karhunen   2019-06-14  359  	for (i = 0; i < MAX_LSM_RULES; i++) {
b8867eedcf76ca Tyler Hicks      2020-07-10 @360  		ima_filter_rule_free(entry->lsm[i].rule);
b169424551930a Janne Karhunen   2019-06-14  361  		kfree(entry->lsm[i].args_p);
b169424551930a Janne Karhunen   2019-06-14  362  	}
465aee77aae857 Tyler Hicks      2020-07-09  363  }
465aee77aae857 Tyler Hicks      2020-07-09  364  
465aee77aae857 Tyler Hicks      2020-07-09  365  static void ima_free_rule(struct ima_rule_entry *entry)
465aee77aae857 Tyler Hicks      2020-07-09  366  {
465aee77aae857 Tyler Hicks      2020-07-09  367  	if (!entry)
465aee77aae857 Tyler Hicks      2020-07-09  368  		return;
465aee77aae857 Tyler Hicks      2020-07-09  369  
465aee77aae857 Tyler Hicks      2020-07-09  370  	/*
465aee77aae857 Tyler Hicks      2020-07-09  371  	 * entry->template->fields may be allocated in ima_parse_rule() but that
465aee77aae857 Tyler Hicks      2020-07-09  372  	 * reference is owned by the corresponding ima_template_desc element in
465aee77aae857 Tyler Hicks      2020-07-09  373  	 * the defined_templates list and cannot be freed here
465aee77aae857 Tyler Hicks      2020-07-09  374  	 */
465aee77aae857 Tyler Hicks      2020-07-09  375  	kfree(entry->fsname);
176377d97d6a3f Tyler Hicks      2020-08-11  376  	ima_free_rule_opt_list(entry->keyrings);
465aee77aae857 Tyler Hicks      2020-07-09  377  	ima_lsm_free_rule(entry);
b169424551930a Janne Karhunen   2019-06-14  378  	kfree(entry);
b169424551930a Janne Karhunen   2019-06-14  379  }
b169424551930a Janne Karhunen   2019-06-14  380  
b169424551930a Janne Karhunen   2019-06-14  381  static struct ima_rule_entry *ima_lsm_copy_rule(struct ima_rule_entry *entry)
b169424551930a Janne Karhunen   2019-06-14  382  {
b169424551930a Janne Karhunen   2019-06-14  383  	struct ima_rule_entry *nentry;
483ec26eed42bf Janne Karhunen   2020-01-15  384  	int i;
b169424551930a Janne Karhunen   2019-06-14  385  
b169424551930a Janne Karhunen   2019-06-14  386  	/*
b169424551930a Janne Karhunen   2019-06-14  387  	 * Immutable elements are copied over as pointers and data; only
b169424551930a Janne Karhunen   2019-06-14  388  	 * lsm rules can change
b169424551930a Janne Karhunen   2019-06-14  389  	 */
f60c826d031817 Alex Dewar       2020-09-09  390  	nentry = kmemdup(entry, sizeof(*nentry), GFP_KERNEL);
f60c826d031817 Alex Dewar       2020-09-09  391  	if (!nentry)
f60c826d031817 Alex Dewar       2020-09-09  392  		return NULL;
f60c826d031817 Alex Dewar       2020-09-09  393  
c593642c8be046 Pankaj Bharadiya 2019-12-09  394  	memset(nentry->lsm, 0, sizeof_field(struct ima_rule_entry, lsm));
b169424551930a Janne Karhunen   2019-06-14  395  
b169424551930a Janne Karhunen   2019-06-14  396  	for (i = 0; i < MAX_LSM_RULES; i++) {
483ec26eed42bf Janne Karhunen   2020-01-15  397  		if (!entry->lsm[i].args_p)
b169424551930a Janne Karhunen   2019-06-14  398  			continue;
b169424551930a Janne Karhunen   2019-06-14  399  
b169424551930a Janne Karhunen   2019-06-14  400  		nentry->lsm[i].type = entry->lsm[i].type;
39e5993d0d452b Tyler Hicks      2020-07-09  401  		nentry->lsm[i].args_p = entry->lsm[i].args_p;
39e5993d0d452b Tyler Hicks      2020-07-09  402  		/*
39e5993d0d452b Tyler Hicks      2020-07-09  403  		 * Remove the reference from entry so that the associated
39e5993d0d452b Tyler Hicks      2020-07-09  404  		 * memory will not be freed during a later call to
39e5993d0d452b Tyler Hicks      2020-07-09  405  		 * ima_lsm_free_rule(entry).
39e5993d0d452b Tyler Hicks      2020-07-09  406  		 */
39e5993d0d452b Tyler Hicks      2020-07-09  407  		entry->lsm[i].args_p = NULL;
b169424551930a Janne Karhunen   2019-06-14  408  
b8867eedcf76ca Tyler Hicks      2020-07-10 @409  		ima_filter_rule_init(nentry->lsm[i].type, Audit_equal,
b169424551930a Janne Karhunen   2019-06-14  410  				     nentry->lsm[i].args_p,
b169424551930a Janne Karhunen   2019-06-14  411  				     &nentry->lsm[i].rule);
483ec26eed42bf Janne Karhunen   2020-01-15  412  		if (!nentry->lsm[i].rule)
483ec26eed42bf Janne Karhunen   2020-01-15  413  			pr_warn("rule for LSM \'%s\' is undefined\n",
aa0c0227d33171 Tyler Hicks      2020-07-09  414  				nentry->lsm[i].args_p);
b169424551930a Janne Karhunen   2019-06-14  415  	}
b169424551930a Janne Karhunen   2019-06-14  416  	return nentry;
b169424551930a Janne Karhunen   2019-06-14  417  }
b169424551930a Janne Karhunen   2019-06-14  418  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
