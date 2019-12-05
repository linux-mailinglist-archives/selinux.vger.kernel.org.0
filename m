Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A80E81146FC
	for <lists+selinux@lfdr.de>; Thu,  5 Dec 2019 19:37:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729290AbfLEShh (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Thu, 5 Dec 2019 13:37:37 -0500
Received: from mga05.intel.com ([192.55.52.43]:17076 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726028AbfLEShh (ORCPT <rfc822;selinux@vger.kernel.org>);
        Thu, 5 Dec 2019 13:37:37 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 05 Dec 2019 10:37:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,282,1571727600"; 
   d="scan'208";a="386269950"
Received: from linux.intel.com ([10.54.29.200])
  by orsmga005.jf.intel.com with ESMTP; 05 Dec 2019 10:37:36 -0800
Received: from [10.252.11.4] (abudanko-mobl.ccr.corp.intel.com [10.252.11.4])
        by linux.intel.com (Postfix) with ESMTP id 0CC7F5804A0;
        Thu,  5 Dec 2019 10:37:31 -0800 (PST)
Subject: Re: [PATCH v1 0/3] Introduce CAP_SYS_PERFMON capability for secure
 Perf users groups
To:     Casey Schaufler <casey@schaufler-ca.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Ingo Molnar <mingo@redhat.com>
Cc:     Jiri Olsa <jolsa@redhat.com>, Andi Kleen <ak@linux.intel.com>,
        elena.reshetova@intel.com,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jann Horn <jannh@google.com>,
        Kees Cook <keescook@chromium.org>,
        Stephane Eranian <eranian@google.com>,
        Namhyung Kim <namhyung@kernel.org>,
        linux-security-module@vger.kernel.org, selinux@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>
References: <283f09a5-33bd-eac3-bdfd-83d775045bf9@linux.intel.com>
 <1e836f34-eda3-542d-f7ce-9a3e87ac5e2e@schaufler-ca.com>
 <d0c6f000-4757-02d8-b114-a35cbb9566ed@linux.intel.com>
 <a81248c5-971a-9d3f-6df4-e6335384fe7f@schaufler-ca.com>
From:   Alexey Budankov <alexey.budankov@linux.intel.com>
Organization: Intel Corp.
Message-ID: <b17c013e-9474-5034-3859-3c3e02e10bc7@linux.intel.com>
Date:   Thu, 5 Dec 2019 21:37:30 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <a81248c5-971a-9d3f-6df4-e6335384fe7f@schaufler-ca.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On 05.12.2019 20:33, Casey Schaufler wrote:
> On 12/5/2019 9:05 AM, Alexey Budankov wrote:
>> Hello Casey,
>>  
>> On 05.12.2019 19:49, Casey Schaufler wrote:
>>> On 12/5/2019 8:15 AM, Alexey Budankov wrote:
>>>> Currently access to perf_events functionality [1] beyond the scope permitted
>>>> by perf_event_paranoid [1] kernel setting is allowed to a privileged process
>>>> [2] with CAP_SYS_ADMIN capability enabled in the process effective set [3].
>>>>
>>>> This patch set introduces CAP_SYS_PERFMON capability devoted to secure performance
>>>> monitoring activity so that CAP_SYS_PERFMON would assist CAP_SYS_ADMIN in its
>>>> governing role for perf_events based performance monitoring of a system.
>>>>
>>>> CAP_SYS_PERFMON aims to harden system security and integrity when monitoring
>>>> performance using perf_events subsystem by processes and Perf privileged users
>>>> [2], thus decreasing attack surface that is available to CAP_SYS_ADMIN
>>>> privileged processes [3].
>>> Are there use cases where you would need CAP_SYS_PERFMON where you
>>> would not also need CAP_SYS_ADMIN? If you separate a new capability
>> Actually, there are. Perf tool that has record, stat and top modes could run with
>> CAP_SYS_PERFMON capability as mentioned below and provide system wide performance
>> data. Currently for that to work the tool needs to be granted with CAP_SYS_ADMIN.
> 
> The question isn't whether the tool could use the capability, it's whether
> the tool would also need CAP_SYS_ADMIN to be useful. Are there existing
> tools that could stop using CAP_SYS_ADMIN in favor of CAP_SYS_PERFMON?
> My bet is that any tool that does performance monitoring is going to need
> CAP_SYS_ADMIN for other reasons.

Yes, sorry. The tool is perf tool (part of kernel tree). If its binary is granted 
CAP_SYS_ADMIN capability then the tool can collect performance data in system wide 
mode for some group of unprivileged users.

This patch allows replacing CAP_SYS_ADMIN by CAP_SYS_PERFMON e.g. for perf tool and 
then the tool being granted CAP_SYS_PERFMON could still provide performance data
in system wide scope for the same group of unprivileged users.

Hope it's got clearer. Feel free to ask more.

Thanks,
Alexey

> 
>>
>>> from CAP_SYS_ADMIN but always have to use CAP_SYS_ADMIN in conjunction
>>> with the new capability it is all rather pointless.
>>>
>>> The scope you've defined for this CAP_SYS_PERFMON is very small.
>>> Is there a larger set of privilege checks that might be applicable
>>> for it?
>> CAP_SYS_PERFMON could be applied broadly, though, this patch set enables record
>> and stat mode use cases for system wide performance monitoring in kernel and
>> user modes.
> 
> The granularity of capabilities is something we have to watch
> very carefully. Sure, CAP_SYS_ADMIN covers a lot of things, but
> if we broke it up "properly" we'd have hundreds of capabilities.
> If you want control that finely we have SELinux.
> 
>>
>> Thanks,
>> Alexey
>>
>>>  
>>>
>>>> CAP_SYS_PERFMON aims to take over CAP_SYS_ADMIN credentials related to
>>>> performance monitoring functionality of perf_events and balance amount of
>>>> CAP_SYS_ADMIN credentials in accordance with the recommendations provided in
>>>> the man page for CAP_SYS_ADMIN [3]: "Note: this capability is overloaded;
>>>> see Notes to kernel developers, below."
>>>>
>>>> For backward compatibility reasons performance monitoring functionality of 
>>>> perf_events subsystem remains available under CAP_SYS_ADMIN but its usage for
>>>> secure performance monitoring use cases is discouraged with respect to the
>>>> introduced CAP_SYS_PERFMON capability.
>>>>
>>>> In the suggested implementation CAP_SYS_PERFMON enables Perf privileged users
>>>> [2] to conduct secure performance monitoring using perf_events in the scope
>>>> of available online CPUs when executing code in kernel and user modes.
>>>>
>>>> Possible alternative solution to this capabilities balancing, system security
>>>> hardening task could be to use the existing CAP_SYS_PTRACE capability to govern
>>>> perf_events' performance monitoring functionality, since process debugging is
>>>> similar to performance monitoring with respect to providing insights into
>>>> process memory and execution details. However CAP_SYS_PTRACE still provides
>>>> users with more credentials than are required for secure performance monitoring
>>>> using perf_events subsystem and this excess is avoided by using the dedicated
>>>> CAP_SYS_PERFMON capability.
>>>>
>>>> libcap library utilities [4], [5] and Perf tool can be used to apply
>>>> CAP_SYS_PERFMON capability for secure performance monitoring beyond the scope
>>>> permitted by system wide perf_event_paranoid kernel setting and below are the
>>>> steps to evaluate the advancement suggested by the patch set:
>>>>
>>>>   - patch, build and boot the kernel
>>>>   - patch, build Perf tool e.g. to /home/user/perf
>>>>   ...
>>>>   # git clone git://git.kernel.org/pub/scm/libs/libcap/libcap.git libcap
>>>>   # pushd libcap
>>>>   # patch libcap/include/uapi/linux/capabilities.h with [PATCH 1/3]
>>>>   # make
>>>>   # pushd progs
>>>>   # ./setcap "cap_sys_perfmon,cap_sys_ptrace,cap_syslog=ep" /home/user/perf
>>>>   # ./setcap -v "cap_sys_perfmon,cap_sys_ptrace,cap_syslog=ep" /home/user/perf
>>>>   /home/user/perf: OK
>>>>   # ./getcap /home/user/perf
>>>>   /home/user/perf = cap_sys_ptrace,cap_syslog,cap_sys_perfmon+ep
>>>>   # echo 2 > /proc/sys/kernel/perf_event_paranoid
>>>>   # cat /proc/sys/kernel/perf_event_paranoid 
>>>>   2
>>>>   ...
>>>>   $ /home/user/perf top
>>>>     ... works as expected ...
>>>>   $ cat /proc/`pidof perf`/status
>>>>   Name:	perf
>>>>   Umask:	0002
>>>>   State:	S (sleeping)
>>>>   Tgid:	2958
>>>>   Ngid:	0
>>>>   Pid:	2958
>>>>   PPid:	9847
>>>>   TracerPid:	0
>>>>   Uid:	500	500	500	500
>>>>   Gid:	500	500	500	500
>>>>   FDSize:	256
>>>>   ...
>>>>   CapInh:	0000000000000000
>>>>   CapPrm:	0000004400080000
>>>>   CapEff:	0000004400080000 => 01000100 00000000 00001000 00000000 00000000
>>>>                                      cap_sys_perfmon,cap_sys_ptrace,cap_syslog
>>>>   CapBnd:	0000007fffffffff
>>>>   CapAmb:	0000000000000000
>>>>   NoNewPrivs:	0
>>>>   Seccomp:	0
>>>>   Speculation_Store_Bypass:	thread vulnerable
>>>>   Cpus_allowed:	ff
>>>>   Cpus_allowed_list:	0-7
>>>>   ...
>>>>
>>>> Usage of cap_sys_perfmon effectively avoids unused credentials excess:
>>>> - with cap_sys_admin:
>>>>   CapEff:	0000007fffffffff => 01111111 11111111 11111111 11111111 11111111
>>>> - with cap_sys_perfmon:
>>>>   CapEff:	0000004400080000 => 01000100 00000000 00001000 00000000 00000000
>>>>                                     38   34               19
>>>>                            sys_perfmon   syslog           sys_ptrace
>>>>
>>>> The patch set is for tip perf/core repository:
>>>>   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip perf/core
>>>>   tip sha1: ceb9e77324fa661b1001a0ae66f061b5fcb4e4e6
>>>>
>>>> [1] http://man7.org/linux/man-pages/man2/perf_event_open.2.html
>>>> [2] https://www.kernel.org/doc/html/latest/admin-guide/perf-security.html
>>>> [3] http://man7.org/linux/man-pages/man7/capabilities.7.html
>>>> [4] http://man7.org/linux/man-pages/man8/setcap.8.html
>>>> [5] https://git.kernel.org/pub/scm/libs/libcap/libcap.git
>>>> [6] https://sites.google.com/site/fullycapable/, posix_1003.1e-990310.pdf
>>>>
>>>> ---
>>>> Alexey Budankov (3):
>>>>   capabilities: introduce CAP_SYS_PERFMON to kernel and user space
>>>>   perf/core: apply CAP_SYS_PERFMON to CPUs and kernel monitoring
>>>>   perf tool: extend Perf tool with CAP_SYS_PERFMON support
>>>>
>>>>  include/linux/perf_event.h          |  6 ++++--
>>>>  include/uapi/linux/capability.h     | 10 +++++++++-
>>>>  security/selinux/include/classmap.h |  4 ++--
>>>>  tools/perf/design.txt               |  3 ++-
>>>>  tools/perf/util/cap.h               |  4 ++++
>>>>  tools/perf/util/evsel.c             | 10 +++++-----
>>>>  tools/perf/util/util.c              | 15 +++++++++++++--
>>>>  7 files changed, 39 insertions(+), 13 deletions(-)
>>>>
>>>
> 
> 
