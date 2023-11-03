Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3FE037DFE59
	for <lists+selinux@lfdr.de>; Fri,  3 Nov 2023 04:24:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229552AbjKCDYO (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Thu, 2 Nov 2023 23:24:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229459AbjKCDYN (ORCPT
        <rfc822;selinux@vger.kernel.org>); Thu, 2 Nov 2023 23:24:13 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7424ECE
        for <selinux@vger.kernel.org>; Thu,  2 Nov 2023 20:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698981847; x=1730517847;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qevbOORYaNKMMtHMZyeUuKR8VSssz2nTvoos7xUtnk8=;
  b=ek16CDddi88j3ngj+Kjf+kEspDiZMQpx9Bz8zDmmZt/5g8eQlqmrmi0H
   MF+CXIFhKs0b1wiyWzUJILbMtZ6yz0itVZk9tcU52OVZ2uIVznNwXg2Mb
   eYdK8R2DU+XnNoqgQ2w2klnkGAdtCX7S6PY32VwbRBJ601gw9qf9cq0nz
   xNHRu7iHo0uOHpuguU62oQ/uCmf/bGSypiudovug1P8pL3rEtdfIug5bp
   1O4YhIW8E8Lj1Jp0UuQS1afmpk61afhEWopiVMjLn2C6CmRBh7SufSFx3
   nPFDpHEcZKXx1VzHm+fcJmczHYk7TTRQMGYeQckj9De2n8lgiR7FbJTk9
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="373910047"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; 
   d="scan'208";a="373910047"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2023 20:24:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="796496474"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; 
   d="scan'208";a="796496474"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 02 Nov 2023 20:24:05 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qykmw-00029Y-35;
        Fri, 03 Nov 2023 03:24:03 +0000
Date:   Fri, 3 Nov 2023 11:22:58 +0800
From:   kernel test robot <lkp@intel.com>
To:     Paul Moore <paul@paul-moore.com>
Cc:     oe-kbuild-all@lists.linux.dev, selinux@vger.kernel.org
Subject: [pcmoore-selinux:main 1/1] README.orig: warning: ignored by one of
 the .gitignore files
Message-ID: <202311031110.Q4t4JjhA-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/selinux.git main
head:   2a72d54d4f2843e438b411d33442cc98485c63bb
commit: 2a72d54d4f2843e438b411d33442cc98485c63bb [1/1] selinux: add a SELinux specific README.md and SECURITY.md
config: i386-allnoconfig (https://download.01.org/0day-ci/archive/20231103/202311031110.Q4t4JjhA-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231103/202311031110.Q4t4JjhA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311031110.Q4t4JjhA-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> README.orig: warning: ignored by one of the .gitignore files
   tools/perf/util/bpf_skel/vmlinux/vmlinux.h: warning: ignored by one of the .gitignore files
   tools/testing/selftests/arm64/tags/.gitignore: warning: ignored by one of the .gitignore files
   tools/testing/selftests/arm64/tags/Makefile: warning: ignored by one of the .gitignore files
   tools/testing/selftests/arm64/tags/run_tags_test.sh: warning: ignored by one of the .gitignore files
   tools/testing/selftests/arm64/tags/tags_test.c: warning: ignored by one of the .gitignore files
   tools/testing/selftests/kvm/.gitignore: warning: ignored by one of the .gitignore files
   tools/testing/selftests/kvm/Makefile: warning: ignored by one of the .gitignore files
   tools/testing/selftests/kvm/config: warning: ignored by one of the .gitignore files
   tools/testing/selftests/kvm/settings: warning: ignored by one of the .gitignore files

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
