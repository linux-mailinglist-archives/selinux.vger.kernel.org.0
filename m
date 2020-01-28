Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1DDC014C208
	for <lists+selinux@lfdr.de>; Tue, 28 Jan 2020 22:19:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726402AbgA1VT3 (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Tue, 28 Jan 2020 16:19:29 -0500
Received: from namei.org ([65.99.196.166]:60442 "EHLO namei.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726211AbgA1VT2 (ORCPT <rfc822;selinux@vger.kernel.org>);
        Tue, 28 Jan 2020 16:19:28 -0500
Received: from localhost (localhost [127.0.0.1])
        by namei.org (8.14.4/8.14.4) with ESMTP id 00SLGD0G004501;
        Tue, 28 Jan 2020 21:16:14 GMT
Date:   Wed, 29 Jan 2020 08:16:13 +1100 (AEDT)
From:   James Morris <jmorris@namei.org>
To:     Alexey Budankov <alexey.budankov@linux.intel.com>
cc:     Peter Zijlstra <peterz@infradead.org>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Ingo Molnar <mingo@redhat.com>,
        "benh@kernel.crashing.org" <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        "james.bottomley@hansenpartnership.com" 
        <james.bottomley@hansenpartnership.com>,
        Serge Hallyn <serge@hallyn.com>, Will Deacon <will@kernel.org>,
        Robert Richter <rric@kernel.org>,
        Alexei Starovoitov <ast@kernel.org>,
        "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
        Jiri Olsa <jolsa@redhat.com>, Andi Kleen <ak@linux.intel.com>,
        Stephane Eranian <eranian@google.com>,
        Igor Lubashev <ilubashe@akamai.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Namhyung Kim <namhyung@kernel.org>,
        Song Liu <songliubraving@fb.com>,
        Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "linux-security-module@vger.kernel.org" 
        <linux-security-module@vger.kernel.org>,
        "selinux@vger.kernel.org" <selinux@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
        "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
        "linux-perf-users@vger.kernel.org" <linux-perf-users@vger.kernel.org>,
        oprofile-list@lists.sf.net
Subject: Re: [PATCH v6 01/10] capabilities: introduce CAP_PERFMON to kernel
 and user space
In-Reply-To: <62274abc-6067-9121-9397-c9b626ca5f7a@linux.intel.com>
Message-ID: <alpine.LRH.2.21.2001290815420.2204@namei.org>
References: <74d524ab-ac11-a7b8-1052-eba10f117e09@linux.intel.com> <62274abc-6067-9121-9397-c9b626ca5f7a@linux.intel.com>
User-Agent: Alpine 2.21 (LRH 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Tue, 28 Jan 2020, Alexey Budankov wrote:

> 
> Signed-off-by: Alexey Budankov <alexey.budankov@linux.intel.com>
> ---
>  include/linux/capability.h          | 4 ++++
>  include/uapi/linux/capability.h     | 8 +++++++-
>  security/selinux/include/classmap.h | 4 ++--
>  3 files changed, 13 insertions(+), 3 deletions(-)


Acked-by: James Morris <jamorris@linux.microsoft.com>


-- 
James Morris
<jmorris@namei.org>

