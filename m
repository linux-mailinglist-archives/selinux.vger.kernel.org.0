Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 217981536C5
	for <lists+selinux@lfdr.de>; Wed,  5 Feb 2020 18:36:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727398AbgBERgj (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Wed, 5 Feb 2020 12:36:39 -0500
Received: from mga17.intel.com ([192.55.52.151]:55569 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726678AbgBERgj (ORCPT <rfc822;selinux@vger.kernel.org>);
        Wed, 5 Feb 2020 12:36:39 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 05 Feb 2020 09:36:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,406,1574150400"; 
   d="scan'208";a="220171665"
Received: from linux.intel.com ([10.54.29.200])
  by orsmga007.jf.intel.com with ESMTP; 05 Feb 2020 09:36:38 -0800
Received: from [10.252.5.149] (abudanko-mobl.ccr.corp.intel.com [10.252.5.149])
        by linux.intel.com (Postfix) with ESMTP id F2F875803E3;
        Wed,  5 Feb 2020 09:36:30 -0800 (PST)
Subject: [PATCH v6 09/10] drivers/perf: open access for CAP_PERFMON privileged
 process
From:   Alexey Budankov <alexey.budankov@linux.intel.com>
To:     James Morris <jmorris@namei.org>, Serge Hallyn <serge@hallyn.com>,
        Stephen Smalley <sds@tycho.nsa.gov>,
        Peter Zijlstra <peterz@infradead.org>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Ingo Molnar <mingo@redhat.com>,
        "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>,
        Alexei Starovoitov <ast@kernel.org>,
        Will Deacon <will@kernel.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>
Cc:     Andi Kleen <ak@linux.intel.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Stephane Eranian <eranian@google.com>,
        Igor Lubashev <ilubashe@akamai.com>,
        Jiri Olsa <jolsa@redhat.com>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
        "linux-security-module@vger.kernel.org" 
        <linux-security-module@vger.kernel.org>,
        "selinux@vger.kernel.org" <selinux@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
        "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
        oprofile-list@lists.sf.net
References: <576a6141-36d4-14c0-b395-8d195892b916@linux.intel.com>
Organization: Intel Corp.
Message-ID: <4fa7407f-0da8-fffa-dd79-2da0429055f6@linux.intel.com>
Date:   Wed, 5 Feb 2020 20:36:29 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <576a6141-36d4-14c0-b395-8d195892b916@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org


Open access to monitoring for CAP_PERFMON privileged process.
Providing the access under CAP_PERFMON capability singly, without
the rest of CAP_SYS_ADMIN credentials, excludes chances to misuse
the credentials and makes operation more secure.

CAP_PERFMON implements the principal of least privilege for performance
monitoring and observability operations (POSIX IEEE 1003.1e 2.2.2.39
principle of least privilege: A security design principle that states
that a process or program be granted only those privileges (e.g.,
capabilities) necessary to accomplish its legitimate function, and
only for the time that such privileges are actually required)

For backward compatibility reasons access to the monitoring remains
open for CAP_SYS_ADMIN privileged processes but CAP_SYS_ADMIN usage
for secure monitoring is discouraged with respect to CAP_PERFMON
capability.

Signed-off-by: Alexey Budankov <alexey.budankov@linux.intel.com>
---
 drivers/perf/arm_spe_pmu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/perf/arm_spe_pmu.c b/drivers/perf/arm_spe_pmu.c
index 4e4984a55cd1..5dff81bc3324 100644
--- a/drivers/perf/arm_spe_pmu.c
+++ b/drivers/perf/arm_spe_pmu.c
@@ -274,7 +274,7 @@ static u64 arm_spe_event_to_pmscr(struct perf_event *event)
 	if (!attr->exclude_kernel)
 		reg |= BIT(SYS_PMSCR_EL1_E1SPE_SHIFT);
 
-	if (IS_ENABLED(CONFIG_PID_IN_CONTEXTIDR) && capable(CAP_SYS_ADMIN))
+	if (IS_ENABLED(CONFIG_PID_IN_CONTEXTIDR) && perfmon_capable())
 		reg |= BIT(SYS_PMSCR_EL1_CX_SHIFT);
 
 	return reg;
@@ -700,7 +700,7 @@ static int arm_spe_pmu_event_init(struct perf_event *event)
 		return -EOPNOTSUPP;
 
 	reg = arm_spe_event_to_pmscr(event);
-	if (!capable(CAP_SYS_ADMIN) &&
+	if (!perfmon_capable() &&
 	    (reg & (BIT(SYS_PMSCR_EL1_PA_SHIFT) |
 		    BIT(SYS_PMSCR_EL1_CX_SHIFT) |
 		    BIT(SYS_PMSCR_EL1_PCT_SHIFT))))
-- 
2.20.1


