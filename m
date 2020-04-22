Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D26ED1B4478
	for <lists+selinux@lfdr.de>; Wed, 22 Apr 2020 14:20:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729433AbgDVMTW (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Wed, 22 Apr 2020 08:19:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728896AbgDVMR7 (ORCPT
        <rfc822;selinux@vger.kernel.org>); Wed, 22 Apr 2020 08:17:59 -0400
Received: from Galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3C6BC08E934;
        Wed, 22 Apr 2020 05:17:57 -0700 (PDT)
Received: from [5.158.153.53] (helo=tip-bot2.lab.linutronix.de)
        by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
        (Exim 4.80)
        (envelope-from <tip-bot2@linutronix.de>)
        id 1jREJz-00087z-FX; Wed, 22 Apr 2020 14:17:43 +0200
Received: from [127.0.1.1] (localhost [IPv6:::1])
        by tip-bot2.lab.linutronix.de (Postfix) with ESMTP id 3EC781C0820;
        Wed, 22 Apr 2020 14:17:36 +0200 (CEST)
Date:   Wed, 22 Apr 2020 12:17:35 -0000
From:   "tip-bot2 for Alexey Budankov" <tip-bot2@linutronix.de>
Reply-to: linux-kernel@vger.kernel.org
To:     linux-tip-commits@vger.kernel.org
Subject: [tip: perf/core] perf tools: Support CAP_PERFMON capability
Cc:     Alexey Budankov <alexey.budankov@linux.intel.com>,
        James Morris <jamorris@linux.microsoft.com>,
        Jiri Olsa <jolsa@redhat.com>,
        Namhyung Kim <namhyung@kernel.org>,
        Arnaldo Carvalho de Melo <acme@redhat.com>,
        Alexei Starovoitov <ast@kernel.org>,
        Andi Kleen <ak@linux.intel.com>,
        Igor Lubashev <ilubashe@akamai.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Serge Hallyn <serge@hallyn.com>,
        Song Liu <songliubraving@fb.com>,
        Stephane Eranian <eranian@google.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        intel-gfx@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-man@vger.kernel.org, linux-security-module@vger.kernel.org,
        selinux@vger.kernel.org, x86 <x86@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
In-Reply-To: <a66d5648-2b8e-577e-e1f2-1d56c017ab5e@linux.intel.com>
References: <a66d5648-2b8e-577e-e1f2-1d56c017ab5e@linux.intel.com>
MIME-Version: 1.0
Message-ID: <158755785587.28353.3215429182209964022.tip-bot2@tip-bot2>
X-Mailer: tip-git-log-daemon
Robot-ID: <tip-bot2.linutronix.de>
Robot-Unsubscribe: Contact <mailto:tglx@linutronix.de> to get blacklisted from these emails
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Linutronix-Spam-Score: -1.0
X-Linutronix-Spam-Level: -
X-Linutronix-Spam-Status: No , -1.0 points, 5.0 required,  ALL_TRUSTED=-1,SHORTCIRCUIT=-0.0001
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

The following commit has been merged into the perf/core branch of tip:

Commit-ID:     6b3e0e2e04615df128b2d38fa1dd1fcb84f2504c
Gitweb:        https://git.kernel.org/tip/6b3e0e2e04615df128b2d38fa1dd1fcb84f2504c
Author:        Alexey Budankov <alexey.budankov@linux.intel.com>
AuthorDate:    Thu, 02 Apr 2020 11:47:35 +03:00
Committer:     Arnaldo Carvalho de Melo <acme@redhat.com>
CommitterDate: Thu, 16 Apr 2020 12:19:08 -03:00

perf tools: Support CAP_PERFMON capability

Extend error messages to mention CAP_PERFMON capability as an option to
substitute CAP_SYS_ADMIN capability for secure system performance
monitoring and observability operations. Make
perf_event_paranoid_check() and __cmd_ftrace() to be aware of
CAP_PERFMON capability.

CAP_PERFMON implements the principle of least privilege for performance
monitoring and observability operations (POSIX IEEE 1003.1e 2.2.2.39
principle of least privilege: A security design principle that states
that a process or program be granted only those privileges (e.g.,
capabilities) necessary to accomplish its legitimate function, and only
for the time that such privileges are actually required)

For backward compatibility reasons access to perf_events subsystem remains
open for CAP_SYS_ADMIN privileged processes but CAP_SYS_ADMIN usage for
secure perf_events monitoring is discouraged with respect to CAP_PERFMON
capability.

Committer testing:

Using a libcap with this patch:

  diff --git a/libcap/include/uapi/linux/capability.h b/libcap/include/uapi/linux/capability.h
  index 78b2fd4c8a95..89b5b0279b60 100644
  --- a/libcap/include/uapi/linux/capability.h
  +++ b/libcap/include/uapi/linux/capability.h
  @@ -366,8 +366,9 @@ struct vfs_ns_cap_data {

   #define CAP_AUDIT_READ       37

  +#define CAP_PERFMON	     38

  -#define CAP_LAST_CAP         CAP_AUDIT_READ
  +#define CAP_LAST_CAP         CAP_PERFMON

   #define cap_valid(x) ((x) >= 0 && (x) <= CAP_LAST_CAP)

Note that using '38' in place of 'cap_perfmon' works to some degree with
an old libcap, its only when cap_get_flag() is called that libcap
performs an error check based on the maximum value known for
capabilities that it will fail.

This makes determining the default of perf_event_attr.exclude_kernel to
fail, as it can't determine if CAP_PERFMON is in place.

Using 'perf top -e cycles' avoids the default check and sets
perf_event_attr.exclude_kernel to 1.

As root, with a libcap supporting CAP_PERFMON:

  # groupadd perf_users
  # adduser perf -g perf_users
  # mkdir ~perf/bin
  # cp ~acme/bin/perf ~perf/bin/
  # chgrp perf_users ~perf/bin/perf
  # setcap "cap_perfmon,cap_sys_ptrace,cap_syslog=ep" ~perf/bin/perf
  # getcap ~perf/bin/perf
  /home/perf/bin/perf = cap_sys_ptrace,cap_syslog,cap_perfmon+ep
  # ls -la ~perf/bin/perf
  -rwxr-xr-x. 1 root perf_users 16968552 Apr  9 13:10 /home/perf/bin/perf

As the 'perf' user in the 'perf_users' group:

  $ perf top -a --stdio
  Error:
  Failed to mmap with 1 (Operation not permitted)
  $

Either add the cap_ipc_lock capability to the perf binary or reduce the
ring buffer size to some smaller value:

  $ perf top -m10 -a --stdio
  rounding mmap pages size to 64K (16 pages)
  Error:
  Failed to mmap with 1 (Operation not permitted)
  $ perf top -m4 -a --stdio
  Error:
  Failed to mmap with 1 (Operation not permitted)
  $ perf top -m2 -a --stdio
   PerfTop: 762 irqs/sec  kernel:49.7%  exact: 100.0% lost: 0/0 drop: 0/0 [4000Hz cycles], (all, 4 CPUs)
  ------------------------------------------------------------------------------------------------------

     9.83%  perf                [.] __symbols__insert
     8.58%  perf                [.] rb_next
     5.91%  [kernel]            [k] module_get_kallsym
     5.66%  [kernel]            [k] kallsyms_expand_symbol.constprop.0
     3.98%  libc-2.29.so        [.] __GI_____strtoull_l_internal
     3.66%  perf                [.] rb_insert_color
     2.34%  [kernel]            [k] vsnprintf
     2.30%  [kernel]            [k] string_nocheck
     2.16%  libc-2.29.so        [.] _IO_getdelim
     2.15%  [kernel]            [k] number
     2.13%  [kernel]            [k] format_decode
     1.58%  libc-2.29.so        [.] _IO_feof
     1.52%  libc-2.29.so        [.] __strcmp_avx2
     1.50%  perf                [.] rb_set_parent_color
     1.47%  libc-2.29.so        [.] __libc_calloc
     1.24%  [kernel]            [k] do_syscall_64
     1.17%  [kernel]            [k] __x86_indirect_thunk_rax

  $ perf record -a sleep 1
  [ perf record: Woken up 1 times to write data ]
  [ perf record: Captured and wrote 0.552 MB perf.data (74 samples) ]
  $ perf evlist
  cycles
  $ perf evlist -v
  cycles: size: 120, { sample_period, sample_freq }: 4000, sample_type: IP|TID|TIME|CPU|PERIOD, read_format: ID, disabled: 1, inherit: 1, mmap: 1, comm: 1, freq: 1, task: 1, precise_ip: 3, sample_id_all: 1, exclude_guest: 1, mmap2: 1, comm_exec: 1, ksymbol: 1, bpf_event: 1
  $ perf report | head -20
  # To display the perf.data header info, please use --header/--header-only options.
  #
  #
  # Total Lost Samples: 0
  #
  # Samples: 74  of event 'cycles'
  # Event count (approx.): 15694834
  #
  # Overhead  Command          Shared Object               Symbol
  # ........  ...............  ..........................  ......................................
  #
      19.62%  perf             [kernel.vmlinux]            [k] strnlen_user
      13.88%  swapper          [kernel.vmlinux]            [k] intel_idle
      13.83%  ksoftirqd/0      [kernel.vmlinux]            [k] pfifo_fast_dequeue
      13.51%  swapper          [kernel.vmlinux]            [k] kmem_cache_free
       6.31%  gnome-shell      [kernel.vmlinux]            [k] kmem_cache_free
       5.66%  kworker/u8:3+ix  [kernel.vmlinux]            [k] delay_tsc
       4.42%  perf             [kernel.vmlinux]            [k] __set_cpus_allowed_ptr
       3.45%  kworker/2:1-eve  [kernel.vmlinux]            [k] shmem_truncate_range
       2.29%  gnome-shell      libgobject-2.0.so.0.6000.7  [.] g_closure_ref
  $

Signed-off-by: Alexey Budankov <alexey.budankov@linux.intel.com>
Reviewed-by: James Morris <jamorris@linux.microsoft.com>
Acked-by: Jiri Olsa <jolsa@redhat.com>
Acked-by: Namhyung Kim <namhyung@kernel.org>
Tested-by: Arnaldo Carvalho de Melo <acme@redhat.com>
Cc: Alexei Starovoitov <ast@kernel.org>
Cc: Andi Kleen <ak@linux.intel.com>
Cc: Igor Lubashev <ilubashe@akamai.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Serge Hallyn <serge@hallyn.com>
Cc: Song Liu <songliubraving@fb.com>
Cc: Stephane Eranian <eranian@google.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: intel-gfx@lists.freedesktop.org
Cc: linux-doc@vger.kernel.org
Cc: linux-man@vger.kernel.org
Cc: linux-security-module@vger.kernel.org
Cc: selinux@vger.kernel.org
Link: http://lore.kernel.org/lkml/a66d5648-2b8e-577e-e1f2-1d56c017ab5e@linux.intel.com
Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
---
 tools/perf/builtin-ftrace.c |  5 +++--
 tools/perf/design.txt       |  3 ++-
 tools/perf/util/cap.h       |  4 ++++
 tools/perf/util/evsel.c     | 10 +++++-----
 tools/perf/util/util.c      |  1 +
 5 files changed, 15 insertions(+), 8 deletions(-)

diff --git a/tools/perf/builtin-ftrace.c b/tools/perf/builtin-ftrace.c
index d5adc41..55eda54 100644
--- a/tools/perf/builtin-ftrace.c
+++ b/tools/perf/builtin-ftrace.c
@@ -284,10 +284,11 @@ static int __cmd_ftrace(struct perf_ftrace *ftrace, int argc, const char **argv)
 		.events = POLLIN,
 	};
 
-	if (!perf_cap__capable(CAP_SYS_ADMIN)) {
+	if (!(perf_cap__capable(CAP_PERFMON) ||
+	      perf_cap__capable(CAP_SYS_ADMIN))) {
 		pr_err("ftrace only works for %s!\n",
 #ifdef HAVE_LIBCAP_SUPPORT
-		"users with the SYS_ADMIN capability"
+		"users with the CAP_PERFMON or CAP_SYS_ADMIN capability"
 #else
 		"root"
 #endif
diff --git a/tools/perf/design.txt b/tools/perf/design.txt
index 0453ba2..a42fab3 100644
--- a/tools/perf/design.txt
+++ b/tools/perf/design.txt
@@ -258,7 +258,8 @@ gets schedule to. Per task counters can be created by any user, for
 their own tasks.
 
 A 'pid == -1' and 'cpu == x' counter is a per CPU counter that counts
-all events on CPU-x. Per CPU counters need CAP_SYS_ADMIN privilege.
+all events on CPU-x. Per CPU counters need CAP_PERFMON or CAP_SYS_ADMIN
+privilege.
 
 The 'flags' parameter is currently unused and must be zero.
 
diff --git a/tools/perf/util/cap.h b/tools/perf/util/cap.h
index 051dc59..ae52878 100644
--- a/tools/perf/util/cap.h
+++ b/tools/perf/util/cap.h
@@ -29,4 +29,8 @@ static inline bool perf_cap__capable(int cap __maybe_unused)
 #define CAP_SYSLOG	34
 #endif
 
+#ifndef CAP_PERFMON
+#define CAP_PERFMON	38
+#endif
+
 #endif /* __PERF_CAP_H */
diff --git a/tools/perf/util/evsel.c b/tools/perf/util/evsel.c
index eb880ef..d23db67 100644
--- a/tools/perf/util/evsel.c
+++ b/tools/perf/util/evsel.c
@@ -2523,14 +2523,14 @@ int perf_evsel__open_strerror(struct evsel *evsel, struct target *target,
 		 "You may not have permission to collect %sstats.\n\n"
 		 "Consider tweaking /proc/sys/kernel/perf_event_paranoid,\n"
 		 "which controls use of the performance events system by\n"
-		 "unprivileged users (without CAP_SYS_ADMIN).\n\n"
+		 "unprivileged users (without CAP_PERFMON or CAP_SYS_ADMIN).\n\n"
 		 "The current value is %d:\n\n"
 		 "  -1: Allow use of (almost) all events by all users\n"
 		 "      Ignore mlock limit after perf_event_mlock_kb without CAP_IPC_LOCK\n"
-		 ">= 0: Disallow ftrace function tracepoint by users without CAP_SYS_ADMIN\n"
-		 "      Disallow raw tracepoint access by users without CAP_SYS_ADMIN\n"
-		 ">= 1: Disallow CPU event access by users without CAP_SYS_ADMIN\n"
-		 ">= 2: Disallow kernel profiling by users without CAP_SYS_ADMIN\n\n"
+		 ">= 0: Disallow ftrace function tracepoint by users without CAP_PERFMON or CAP_SYS_ADMIN\n"
+		 "      Disallow raw tracepoint access by users without CAP_SYS_PERFMON or CAP_SYS_ADMIN\n"
+		 ">= 1: Disallow CPU event access by users without CAP_PERFMON or CAP_SYS_ADMIN\n"
+		 ">= 2: Disallow kernel profiling by users without CAP_PERFMON or CAP_SYS_ADMIN\n\n"
 		 "To make this setting permanent, edit /etc/sysctl.conf too, e.g.:\n\n"
 		 "	kernel.perf_event_paranoid = -1\n" ,
 				 target->system_wide ? "system-wide " : "",
diff --git a/tools/perf/util/util.c b/tools/perf/util/util.c
index d707c96..37a9492 100644
--- a/tools/perf/util/util.c
+++ b/tools/perf/util/util.c
@@ -290,6 +290,7 @@ int perf_event_paranoid(void)
 bool perf_event_paranoid_check(int max_level)
 {
 	return perf_cap__capable(CAP_SYS_ADMIN) ||
+			perf_cap__capable(CAP_PERFMON) ||
 			perf_event_paranoid() <= max_level;
 }
 
