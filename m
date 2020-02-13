Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BFD7615BB1F
	for <lists+selinux@lfdr.de>; Thu, 13 Feb 2020 10:05:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729466AbgBMJFk (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Thu, 13 Feb 2020 04:05:40 -0500
Received: from mga04.intel.com ([192.55.52.120]:54713 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729459AbgBMJFk (ORCPT <rfc822;selinux@vger.kernel.org>);
        Thu, 13 Feb 2020 04:05:40 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 13 Feb 2020 01:05:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,436,1574150400"; 
   d="scan'208";a="267006589"
Received: from linux.intel.com ([10.54.29.200])
  by fmsmga002.fm.intel.com with ESMTP; 13 Feb 2020 01:05:33 -0800
Received: from [10.125.252.71] (abudanko-mobl.ccr.corp.intel.com [10.125.252.71])
        by linux.intel.com (Postfix) with ESMTP id 49A115802C1;
        Thu, 13 Feb 2020 01:05:25 -0800 (PST)
Subject: Re: [PATCH v5 01/10] capabilities: introduce CAP_PERFMON to kernel
 and user space
To:     Stephen Smalley <sds@tycho.nsa.gov>
Cc:     Alexei Starovoitov <alexei.starovoitov@gmail.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Ingo Molnar <mingo@redhat.com>,
        "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>,
        "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>,
        "rodrigo.vivi@intel.com" <rodrigo.vivi@intel.com>,
        "benh@kernel.crashing.org" <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        "james.bottomley@hansenpartnership.com" 
        <james.bottomley@hansenpartnership.com>,
        Serge Hallyn <serge@hallyn.com>,
        James Morris <jmorris@namei.org>,
        Will Deacon <will.deacon@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Robert Richter <rric@kernel.org>,
        Alexei Starovoitov <ast@kernel.org>,
        Jiri Olsa <jolsa@redhat.com>, Andi Kleen <ak@linux.intel.com>,
        Stephane Eranian <eranian@google.com>,
        Igor Lubashev <ilubashe@akamai.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Namhyung Kim <namhyung@kernel.org>,
        Song Liu <songliubraving@fb.com>,
        Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "linux-security-module@vger.kernel.org" 
        <linux-security-module@vger.kernel.org>,
        "selinux@vger.kernel.org" <selinux@vger.kernel.org>,
        "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
        "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        "linux-perf-users@vger.kernel.org" <linux-perf-users@vger.kernel.org>,
        oprofile-list@lists.sf.net, Andy Lutomirski <luto@amacapital.net>
References: <0548c832-7f4b-dc4c-8883-3f2b6d351a08@linux.intel.com>
 <9b77124b-675d-5ac7-3741-edec575bd425@linux.intel.com>
 <64cab472-806e-38c4-fb26-0ffbee485367@tycho.nsa.gov>
 <05297eff-8e14-ccdf-55a4-870c64516de8@linux.intel.com>
 <CAADnVQK-JzK-GUk4KOozn4c1xr=7TiCpB9Fi0QDC9nE6iVn8iQ@mail.gmail.com>
 <537bdb28-c9e4-f44f-d665-25250065a6bb@linux.intel.com>
 <63d9700f-231d-7973-5307-3e56a48c54cb@linux.intel.com>
 <d7213569-9578-7201-6106-f5ebc95bd6be@tycho.nsa.gov>
 <2e38c33d-f085-1320-8cc2-45f74b6ad86d@linux.intel.com>
 <dd6a1382-7b2f-a6e6-a1ac-009566d7f556@tycho.nsa.gov>
 <8141da2e-49cf-c02d-69e9-8a7cbdc91431@linux.intel.com>
 <7c367905-e8c9-7665-d923-c850e05c757a@tycho.nsa.gov>
 <280e6644-c129-15f6-ea5c-0f66bf764e0f@tycho.nsa.gov>
 <950cc6a4-5823-d607-1210-6f62c96cf67f@linux.intel.com>
 <46751eb9-deca-53cc-95fb-1602cfdf62a2@tycho.nsa.gov>
From:   Alexey Budankov <alexey.budankov@linux.intel.com>
Organization: Intel Corp.
Message-ID: <874115a9-fb11-b7f4-7e92-46aedc5f26af@linux.intel.com>
Date:   Thu, 13 Feb 2020 12:05:24 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <46751eb9-deca-53cc-95fb-1602cfdf62a2@tycho.nsa.gov>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org


On 12.02.2020 20:09, Stephen Smalley wrote:
> On 2/12/20 11:56 AM, Alexey Budankov wrote:
>>
>>
>> On 12.02.2020 18:45, Stephen Smalley wrote:
>>> On 2/12/20 10:21 AM, Stephen Smalley wrote:
>>>> On 2/12/20 8:53 AM, Alexey Budankov wrote:
>>>>> On 12.02.2020 16:32, Stephen Smalley wrote:
>>>>>> On 2/12/20 3:53 AM, Alexey Budankov wrote:
>>>>>>> Hi Stephen,
>>>>>>>
>>>>>>> On 22.01.2020 17:07, Stephen Smalley wrote:
>>>>>>>> On 1/22/20 5:45 AM, Alexey Budankov wrote:
>>>>>>>>>
>>>>>>>>> On 21.01.2020 21:27, Alexey Budankov wrote:
>>>>>>>>>>
>>>>>>>>>> On 21.01.2020 20:55, Alexei Starovoitov wrote:
>>>>>>>>>>> On Tue, Jan 21, 2020 at 9:31 AM Alexey Budankov
>>>>>>>>>>> <alexey.budankov@linux.intel.com> wrote:
>>>>>>>>>>>>
>>>>>>>>>>>>
>>>>>>>>>>>> On 21.01.2020 17:43, Stephen Smalley wrote:
>>>>>>>>>>>>> On 1/20/20 6:23 AM, Alexey Budankov wrote:
>>>>>>>>>>>>>>
>>>>>>> <SNIP>
>>>>>>>>>>>>>> Introduce CAP_PERFMON capability designed to secure system performance
>>>>>>>>>>>>>
>>>>>>>>>>>>> Why _noaudit()?  Normally only used when a permission failure is non-fatal to the operation.  Otherwise, we want the audit message.
>>>>>>>>>
>>>>>>>>> So far so good, I suggest using the simplest version for v6:
>>>>>>>>>
>>>>>>>>> static inline bool perfmon_capable(void)
>>>>>>>>> {
>>>>>>>>>        return capable(CAP_PERFMON) || capable(CAP_SYS_ADMIN);
>>>>>>>>> }
>>>>>>>>>
>>>>>>>>> It keeps the implementation simple and readable. The implementation is more
>>>>>>>>> performant in the sense of calling the API - one capable() call for CAP_PERFMON
>>>>>>>>> privileged process.
>>>>>>>>>
>>>>>>>>> Yes, it bloats audit log for CAP_SYS_ADMIN privileged and unprivileged processes,
>>>>>>>>> but this bloating also advertises and leverages using more secure CAP_PERFMON
>>>>>>>>> based approach to use perf_event_open system call.
>>>>>>>>
>>>>>>>> I can live with that.  We just need to document that when you see both a CAP_PERFMON and a CAP_SYS_ADMIN audit message for a process, try only allowing CAP_PERFMON first and see if that resolves the issue.  We have a similar issue with CAP_DAC_READ_SEARCH versus CAP_DAC_OVERRIDE.
>>>>>>>
>>>>>>> I am trying to reproduce this double logging with CAP_PERFMON.
>>>>>>> I am using the refpolicy version with enabled perf_event tclass [1], in permissive mode.
>>>>>>> When running perf stat -a I am observing this AVC audit messages:
>>>>>>>
>>>>>>> type=AVC msg=audit(1581496695.666:8691): avc:  denied  { open } for  pid=2779 comm="perf" scontext=user_u:user_r:user_systemd_t tcontext=user_u:user_r:user_systemd_t tclass=perf_event permissive=1
>>>>>>> type=AVC msg=audit(1581496695.666:8691): avc:  denied  { kernel } for  pid=2779 comm="perf" scontext=user_u:user_r:user_systemd_t tcontext=user_u:user_r:user_systemd_t tclass=perf_event permissive=1
>>>>>>> type=AVC msg=audit(1581496695.666:8691): avc:  denied  { cpu } for  pid=2779 comm="perf" scontext=user_u:user_r:user_systemd_t tcontext=user_u:user_r:user_systemd_t tclass=perf_event permissive=1
>>>>>>> type=AVC msg=audit(1581496695.666:8692): avc:  denied  { write } for  pid=2779 comm="perf" scontext=user_u:user_r:user_systemd_t tcontext=user_u:user_r:user_systemd_t tclass=perf_event permissive=1
>>>>>>>
>>>>>>> However there is no capability related messages around. I suppose my refpolicy should
>>>>>>> be modified somehow to observe capability related AVCs.
>>>>>>>
>>>>>>> Could you please comment or clarify on how to enable caps related AVCs in order
>>>>>>> to test the concerned logging.
>>>>>>
>>>>>> The new perfmon permission has to be defined in your policy; you'll have a message in dmesg about "Permission perfmon in class capability2 not defined in policy.".  You can either add it to the common cap2 definition in refpolicy/policy/flask/access_vectors and rebuild your policy or extract your base module as CIL, add it there, and insert the updated module.
>>>>>
>>>>> Yes, I already have it like this:
>>>>> common cap2
>>>>> {
>>>>> <------>mac_override<--># unused by SELinux
>>>>> <------>mac_admin
>>>>> <------>syslog
>>>>> <------>wake_alarm
>>>>> <------>block_suspend
>>>>> <------>audit_read
>>>>> <------>perfmon
>>>>> }
>>>>>
>>>>> dmesg stopped reporting perfmon as not defined but audit.log still doesn't report CAP_PERFMON denials.
>>>>> BTW, audit even doesn't report CAP_SYS_ADMIN denials, however perfmon_capable() does check for it.
>>>>
>>>> Some denials may be silenced by dontaudit rules; semodule -DB will strip those and semodule -B will restore them.  Other possibility is that the process doesn't have CAP_PERFMON in its effective set and therefore never reaches SELinux at all; denied first by the capability module.
>>>
>>> Also, the fact that your denials are showing up in user_systemd_t suggests that something is off in your policy or userspace/distro; I assume that is a domain type for the systemd --user instance, but your shell and commands shouldn't be running in that domain (user_t would be more appropriate for that).
>>
>> It is user_t for local terminal session:
>> ps -Z
>> LABEL                             PID TTY          TIME CMD
>> user_u:user_r:user_t            11317 pts/9    00:00:00 bash
>> user_u:user_r:user_t            11796 pts/9    00:00:00 ps
>>
>> For local terminal root session:
>> ps -Z
>> LABEL                             PID TTY          TIME CMD
>> user_u:user_r:user_su_t          2926 pts/3    00:00:00 bash
>> user_u:user_r:user_su_t         10995 pts/3    00:00:00 ps
>>
>> For remote ssh session:
>> ps -Z
>> LABEL                             PID TTY          TIME CMD
>> user_u:user_r:user_t             7540 pts/8    00:00:00 ps
>> user_u:user_r:user_systemd_t     8875 pts/8    00:00:00 bash
> 
> That's a bug in either your policy or your userspace/distro integration.  In any event, unless user_systemd_t is allowed all capability2 permissions by your policy, you should see the denials if CAP_PERFMON is set in the effective capability set of the process.
> 

That all seems to be true. After instrumentation, rebuilding and rebooting, in CAP_PERFMON case:

$ getcap perf
perf = cap_sys_ptrace,cap_syslog,cap_perfmon+ep

$ perf stat -a

type=AVC msg=audit(1581580399.165:784): avc:  denied  { open } for  pid=8859 comm="perf" scontext=user_u:user_r:user_t tcontext=user_u:user_r:user_t tclass=perf_event permissive=1
type=AVC msg=audit(1581580399.165:785): avc:  denied  { perfmon } for  pid=8859 comm="perf" capability=38  scontext=user_u:user_r:user_t tcontext=user_u:user_r:user_t tclass=capability2 permissive=1
type=AVC msg=audit(1581580399.165:786): avc:  denied  { kernel } for  pid=8859 comm="perf" scontext=user_u:user_r:user_t tcontext=user_u:user_r:user_t tclass=perf_event permissive=1
type=AVC msg=audit(1581580399.165:787): avc:  denied  { cpu } for  pid=8859 comm="perf" scontext=user_u:user_r:user_t tcontext=user_u:user_r:user_t tclass=perf_event permissive=1
type=AVC msg=audit(1581580399.165:788): avc:  denied  { write } for  pid=8859 comm="perf" scontext=user_u:user_r:user_t tcontext=user_u:user_r:user_t tclass=perf_event permissive=1
type=AVC msg=audit(1581580408.078:791): avc:  denied  { read } for  pid=8859 comm="perf" scontext=user_u:user_r:user_t tcontext=user_u:user_r:user_t tclass=perf_event permissive=1

dmesg:

[  137.877713] security_capable(0000000071f7ee6e, 000000009dd7a5fc, CAP_PERFMON, 0) = ?
[  137.877774] cread_has_capability(CAP_PERFMON) = 0
[  137.877775] prior avc_audit(CAP_PERFMON)
[  137.877779] security_capable(0000000071f7ee6e, 000000009dd7a5fc, CAP_PERFMON, 0) = 0

[  137.877784] security_capable(0000000071f7ee6e, 000000009dd7a5fc, CAP_PERFMON, 0) = ?
[  137.877785] cread_has_capability(CAP_PERFMON) = 0
[  137.877786] security_capable(0000000071f7ee6e, 000000009dd7a5fc, CAP_PERFMON, 0) = 0

[  137.877794] security_capable(0000000071f7ee6e, 000000009dd7a5fc, CAP_PERFMON, 0) = ?
[  137.877795] cread_has_capability(CAP_PERFMON) = 0
[  137.877796] security_capable(0000000071f7ee6e, 000000009dd7a5fc, CAP_PERFMON, 0) = 0

...

in CAP_SYS_ADMIN case:

$ getcap perf
perf = cap_sys_ptrace,cap_sys_admin,cap_syslog+ep

$ perf stat -a

type=AVC msg=audit(1581580747.928:835): avc:  denied  { open } for  pid=8927 comm="perf" scontext=user_u:user_r:user_t tcontext=user_u:user_r:user_t tclass=perf_event permissive=1
type=AVC msg=audit(1581580747.928:836): avc:  denied  { cpu } for  pid=8927 comm="perf" scontext=user_u:user_r:user_t tcontext=user_u:user_r:user_t tclass=perf_event permissive=1
type=AVC msg=audit(1581580747.928:837): avc:  denied  { kernel } for  pid=8927 comm="perf" scontext=user_u:user_r:user_t tcontext=user_u:user_r:user_t tclass=perf_event permissive=1
type=AVC msg=audit(1581580747.928:838): avc:  denied  { read } for  pid=8927 comm="perf" scontext=user_u:user_r:user_t tcontext=user_u:user_r:user_t tclass=perf_event permissive=1
type=AVC msg=audit(1581580747.928:839): avc:  denied  { write } for  pid=8927 comm="perf" scontext=user_u:user_r:user_t tcontext=user_u:user_r:user_t tclass=perf_event permissive=1
...

$ perf record -- ls
...
type=AVC msg=audit(1581580747.930:843): avc:  denied  { sys_ptrace } for  pid=8927 comm="perf" capability=19  scontext=user_u:user_r:user_t tcontext=user_u:user_r:user_t tclass=capability permissive=1
...

dmesg:

[  276.714266] security_capable(000000006b09ad8a, 000000009dd7a5fc, CAP_PERFMON, 0) = ?
[  276.714268] security_capable(000000006b09ad8a, 000000009dd7a5fc, CAP_PERFMON, 0) = -1

[  276.714269] security_capable(000000006b09ad8a, 000000009dd7a5fc, CAP_SYS_ADMIN, 0) = ?
[  276.714270] cread_has_capability(CAP_SYS_ADMIN) = 0
[  276.714270] security_capable(000000006b09ad8a, 000000009dd7a5fc, CAP_SYS_ADMIN, 0) = 0

[  276.714287] security_capable(000000006b09ad8a, 000000009dd7a5fc, CAP_PERFMON, 0) = ?
[  276.714287] security_capable(000000006b09ad8a, 000000009dd7a5fc, CAP_PERFMON, 0) = -1

[  276.714288] security_capable(000000006b09ad8a, 000000009dd7a5fc, CAP_SYS_ADMIN, 0) = ?
[  276.714288] cread_has_capability(CAP_SYS_ADMIN) = 0
[  276.714289] security_capable(000000006b09ad8a, 000000009dd7a5fc, CAP_SYS_ADMIN, 0) = 0

[  276.714294] security_capable(000000006b09ad8a, 000000009dd7a5fc, CAP_PERFMON, 0) = ?
[  276.714295] security_capable(000000006b09ad8a, 000000009dd7a5fc, CAP_PERFMON, 0) = -1

[  276.714295] security_capable(000000006b09ad8a, 000000009dd7a5fc, CAP_SYS_ADMIN, 0) = ?
[  276.714296] cread_has_capability(CAP_SYS_ADMIN) = 0
[  276.714296] security_capable(000000006b09ad8a, 000000009dd7a5fc, CAP_SYS_ADMIN, 0) = 0

...

in unprivileged case:

$ getcap perf
perf =

$ perf stat -a; perf record -a

...

dmesg:

[  947.275611] security_capable(00000000d3a75377, 000000009dd7a5fc, CAP_PERFMON, 0) = ?
[  947.275613] security_capable(00000000d3a75377, 000000009dd7a5fc, CAP_PERFMON, 0) = -1

[  947.275614] security_capable(00000000d3a75377, 000000009dd7a5fc, CAP_SYS_ADMIN, 0) = ?
[  947.275615] security_capable(00000000d3a75377, 000000009dd7a5fc, CAP_SYS_ADMIN, 0) = -1

[  947.275636] security_capable(00000000d3a75377, 000000009dd7a5fc, CAP_PERFMON, 0) = ?
[  947.275637] security_capable(00000000d3a75377, 000000009dd7a5fc, CAP_PERFMON, 0) = -1

[  947.275638] security_capable(00000000d3a75377, 000000009dd7a5fc, CAP_SYS_ADMIN, 0) = ?
[  947.275638] security_capable(00000000d3a75377, 000000009dd7a5fc, CAP_SYS_ADMIN, 0) = -1

...

So it looks like CAP_PERFMON and CAP_SYS_ADMIN are not ever logged by AVC simultaneously,
in the current LSM and perfmon_capable() implementations.

If perfmon is granted:
	perfmon is not logged by capabilities, perfmon is logged by AVC,
	no check for sys_admin by perfmon_capable().

If perfmon is not granted but sys_admin is granted:
	perfmon is not logged by capabilities, AVC logging is not called for perfmon,
	sys_admin is not logged by capabilities, sys_admin is not logged by AVC, for some intended reason?

No caps are granted:
	AVC logging is not called either for perfmon or for sys_admin.

BTW, is there a way to may be drop some AV cache so denials would appear in audit in the next AV access?

Well, I guess you have initially mentioned some case similar to this (note that ids are not the same but pids= are):

type=AVC msg=audit(1581580399.165:784): avc:  denied  { open } for  pid=8859 comm="perf" scontext=user_u:user_r:user_t tcontext=user_u:user_r:user_t tclass=perf_event permissive=1
type=AVC msg=audit(1581580399.165:785): avc:  denied  { perfmon } for  pid=8859 comm="perf" capability=38  scontext=user_u:user_r:user_t tcontext=user_u:user_r:user_t tclass=capability2 permissive=1
type=AVC msg=audit(          .   :   ): avc:  denied  { sys_admin } for  pid=8859 comm="perf" capability=21  scontext=user_u:user_r:user_t tcontext=user_u:user_r:user_t tclass=capability2 permissive=1
type=AVC msg=audit(1581580399.165:786): avc:  denied  { kernel } for  pid=8859 comm="perf" scontext=user_u:user_r:user_t tcontext=user_u:user_r:user_t tclass=perf_event permissive=1
type=AVC msg=audit(1581580399.165:787): avc:  denied  { cpu } for  pid=8859 comm="perf" scontext=user_u:user_r:user_t tcontext=user_u:user_r:user_t tclass=perf_event permissive=1
type=AVC msg=audit(1581580399.165:788): avc:  denied  { write } for  pid=8859 comm="perf" scontext=user_u:user_r:user_t tcontext=user_u:user_r:user_t tclass=perf_event permissive=1
type=AVC msg=audit(1581580408.078:791): avc:  denied  { read } for  pid=8859 comm="perf" scontext=user_u:user_r:user_t tcontext=user_u:user_r:user_t tclass=perf_event permissive=1

So the message could be like this:

"If audit logs for a process using perf_events related syscalls i.e. perf_event_open(), read(), write(),
 ioctl(), mmap() contain denials both for CAP_PERFMON and CAP_SYS_ADMIN capabilities then providing the
 process with CAP_PERFMON capability singly is the secure preferred approach to resolve access denials 
 to performance monitoring and observability operations."

~Alexey
