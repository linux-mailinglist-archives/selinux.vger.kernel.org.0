Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1850C1DE83B
	for <lists+selinux@lfdr.de>; Fri, 22 May 2020 15:41:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729604AbgEVNl4 (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Fri, 22 May 2020 09:41:56 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:35983 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729399AbgEVNlz (ORCPT
        <rfc822;selinux@vger.kernel.org>); Fri, 22 May 2020 09:41:55 -0400
Received: from ip5f5af183.dynamic.kabel-deutschland.de ([95.90.241.131] helo=wittgenstein)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <christian.brauner@ubuntu.com>)
        id 1jc7vR-0000m4-O7; Fri, 22 May 2020 13:41:25 +0000
Date:   Fri, 22 May 2020 15:41:24 +0200
From:   Christian Brauner <christian.brauner@ubuntu.com>
To:     Adrian Reber <areber@redhat.com>
Cc:     Eric Biederman <ebiederm@xmission.com>,
        Pavel Emelyanov <ovzxemul@gmail.com>,
        Oleg Nesterov <oleg@redhat.com>,
        Dmitry Safonov <0x7f454c46@gmail.com>,
        Andrei Vagin <avagin@gmail.com>,
        Nicolas Viennot <Nicolas.Viennot@twosigma.com>,
        =?utf-8?B?TWljaGHFgiBDxYJhcGnFhHNraQ==?= <mclapinski@google.com>,
        Kamil Yurtsever <kyurtsever@google.com>,
        Dirk Petersen <dipeit@gmail.com>,
        Christine Flood <chf@redhat.com>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Radostin Stoyanov <rstoyanov1@gmail.com>,
        Cyrill Gorcunov <gorcunov@openvz.org>,
        Serge Hallyn <serge@hallyn.com>,
        Stephen Smalley <stephen.smalley.work@gmail.com>,
        Sargun Dhillon <sargun@sargun.me>,
        Arnd Bergmann <arnd@arndb.de>,
        Aaron Goidel <acgoide@tycho.nsa.gov>,
        linux-security-module@vger.kernel.org,
        linux-kernel@vger.kernel.org, selinux@vger.kernel.org,
        Eric Paris <eparis@parisplace.org>,
        Jann Horn <jannh@google.com>
Subject: Re: [PATCH] capabilities: Introduce CAP_RESTORE
Message-ID: <20200522134124.dr6j7b3iwa337nxu@wittgenstein>
References: <20200522055350.806609-1-areber@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200522055350.806609-1-areber@redhat.com>
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Fri, May 22, 2020 at 07:53:50AM +0200, Adrian Reber wrote:
> This enables CRIU to checkpoint and restore a process as non-root.
> 
> Over the last years CRIU upstream has been asked a couple of time if it
> is possible to checkpoint and restore a process as non-root. The answer
> usually was: 'almost'.
> 
> The main blocker to restore a process was that selecting the PID of the
> restored process, which is necessary for CRIU, is guarded by CAP_SYS_ADMIN.
> 
> In the last two years the questions about checkpoint/restore as non-root
> have increased and especially in the last few months we have seen
> multiple people inventing workarounds.
> 
> The use-cases so far and their workarounds:
> 
>  * Checkpoint/Restore in an HPC environment in combination with
>    a resource manager distributing jobs. Users are always running
>    as non root, but there was the desire to provide a way to
>    checkpoint and restore long running jobs.
>    Workaround: setuid wrapper to start CRIU as root as non-root
>    https://github.com/FredHutch/slurm-examples/blob/master/checkpointer/lib/checkpointer/checkpointer-suid.c
>  * Another use case to checkpoint/restore processes as non-root
>    uses as workaround a non privileged process which cycles through
>    PIDs by calling fork() as fast as possible with a rate of
>    100,000 pids/s instead of writing to ns_last_pid
>    https://github.com/twosigma/set_ns_last_pid
>  * Fast Java startup using checkpoint/restore.
>    We have been in contact with JVM developers who are integrating
>    CRIU into a JVM to decrease the startup time.
>    Workaround so far: patch out CAP_SYS_ADMIN checks in the kernel
>  * Container migration as non root. There are people already
>    using CRIU to migrate containers as non-root. The solution
>    there is to run it in a user namespace. So if you are able
>    to carefully setup your environment with the namespaces
>    it is already possible to restore a container/process as non-root.
>    Unfortunately it is not always possible to setup an environment
>    in such a way and for easier access to non-root based container
>    migration this patch is also required.
> 
> There are probably a few more things guarded by CAP_SYS_ADMIN required
> to run checkpoint/restore as non-root, but by applying this patch I can
> already checkpoint and restore processes as non-root. As there are
> already multiple workarounds I would prefer to do it correctly in the
> kernel to avoid that CRIU users are starting to invent more workarounds.
> 
> I have used the following tests to verify that this change works as
> expected by setting the new capability CAP_RESTORE on the two resulting
> test binaries:
> 
> $ cat ns_last_pid.c
>  // http://efiop-notes.blogspot.com/2014/06/how-to-set-pid-using-nslastpid.html
>  #include <stdio.h>
>  #include <stdlib.h>
>  #include <string.h>
>  #include <sys/file.h>
>  #include <sys/types.h>
>  #include <unistd.h>
> 
> int main(int argc, char *argv[])
> {
> 	pid_t pid, new_pid;
> 	char buf[32];
> 	int fd;
> 
> 	if (argc != 2)
> 		return 1;
> 
> 	printf("Opening ns_last_pid...\n");
> 	fd = open("/proc/sys/kernel/ns_last_pid", O_RDWR | O_CREAT, 0644);
> 	if (fd < 0) {
> 		perror("Cannot open ns_last_pid");
> 		return 1;
> 	}
> 
> 	printf("Locking ns_last_pid...\n");
> 	if (flock(fd, LOCK_EX)) {
> 		close(fd);
> 		printf("Cannot lock ns_last_pid\n");
> 		return 1;
> 	}
> 
> 	pid = atoi(argv[1]);
> 	snprintf(buf, sizeof(buf), "%d", pid - 1);
> 	printf("Writing pid-1 to ns_last_pid...\n");
> 	if (write(fd, buf, strlen(buf)) != strlen(buf)) {
> 		printf("Cannot write to buf\n");
> 		return 1;
> 	}
> 
> 	printf("Forking...\n");
> 	new_pid = fork();
> 	if (new_pid == 0) {
> 		printf("I am the child!\n");
> 		exit(0);
> 	} else if (new_pid == pid)
> 		printf("I am the parent. My child got the pid %d!\n", new_pid);
> 	else
> 		printf("pid (%d) does not match expected pid (%d)\n", new_pid, pid);
> 
> 	printf("Cleaning up...\n");
> 	if (flock(fd, LOCK_UN))
> 		printf("Cannot unlock\n");
> 	close(fd);
> 	return 0;
> }
> $ id -u; /home/libcap/ns_last_pid 300000
> 1001
> Opening ns_last_pid...
> Locking ns_last_pid...
> Writing pid-1 to ns_last_pid...
> Forking...
> I am the parent. My child got the pid 300000!
> I am the child!
> Cleaning up...
> 
> For the clone3() based approach:
> $ cat clone3_set_tid.c
>  #define _GNU_SOURCE
>  #include <linux/sched.h>
>  #include <stdint.h>
>  #include <stdio.h>
>  #include <stdlib.h>
>  #include <string.h>
>  #include <sys/types.h>
>  #include <sys/stat.h>
>  #include <sys/syscall.h>
>  #include <unistd.h>
> 
>  #define ptr_to_u64(ptr) ((__u64)((uintptr_t)(ptr)))
> 
> int main(int argc, char *argv[])
> {
> 	struct clone_args c_args = { };
> 	pid_t pid, new_pid;
> 
> 	if (argc != 2)
> 		return 1;
> 
> 	pid = atoi(argv[1]);
> 	c_args.set_tid = ptr_to_u64(&pid);
> 	c_args.set_tid_size = 1;
> 
> 	printf("Forking...\n");
> 	new_pid = syscall(__NR_clone3, &c_args, sizeof(c_args));
> 	if (new_pid == 0) {
> 		printf("I am the child!\n");
> 		exit(0);
> 	} else if (new_pid == pid)
> 		printf("I am the parent. My child got the pid %d!\n", new_pid);
> 	else
> 		printf("pid (%d) does not match expected pid (%d)\n", new_pid, pid);
> 	printf("Done\n");
> 
> 	return 0;
> }
> $ id -u; /home/libcap/clone3_set_tid 300000
> 1001
> Forking...
> I am the parent. My child got the pid 300000!
> Done
> I am the child!
> 
> Signed-off-by: Adrian Reber <areber@redhat.com>
> ---
>  include/linux/capability.h          | 5 +++++
>  include/uapi/linux/capability.h     | 9 ++++++++-
>  kernel/pid.c                        | 2 +-
>  kernel/pid_namespace.c              | 2 +-
>  security/selinux/include/classmap.h | 5 +++--
>  5 files changed, 18 insertions(+), 5 deletions(-)
> 
> diff --git a/include/linux/capability.h b/include/linux/capability.h
> index b4345b38a6be..1278313cb2bc 100644
> --- a/include/linux/capability.h
> +++ b/include/linux/capability.h
> @@ -261,6 +261,11 @@ static inline bool bpf_capable(void)
>  	return capable(CAP_BPF) || capable(CAP_SYS_ADMIN);
>  }
>  
> +static inline bool restore_ns_capable(struct user_namespace *ns)
> +{
> +	return ns_capable(ns, CAP_RESTORE) || ns_capable(ns, CAP_SYS_ADMIN);
> +}
> +

When did everyone start putting their favorite little helpers in here?
I see both bpf_capable() and perform_capable() are going to be in
linux/capability.h if linux-next is to be believed. Seems they could
very well go in their own bpf headers.
Anyway, if everyone is fine with putting specific helpers in
capability.h then ok.


>  /* audit system wants to get cap info from files as well */
>  extern int get_vfs_caps_from_disk(const struct dentry *dentry, struct cpu_vfs_cap_data *cpu_caps);
>  
> diff --git a/include/uapi/linux/capability.h b/include/uapi/linux/capability.h
> index c7372180a0a9..4bcc4e3d41ff 100644
> --- a/include/uapi/linux/capability.h
> +++ b/include/uapi/linux/capability.h
> @@ -406,7 +406,14 @@ struct vfs_ns_cap_data {
>   */
>  #define CAP_BPF			39
>  
> -#define CAP_LAST_CAP         CAP_BPF
> +
> +/* Allow checkpoint/restore related operations */
> +/* Allow PID selection during clone3() */
> +/* Allow writing to ns_last_pid */
> +
> +#define CAP_RESTORE		40

Thinking about what Adrian said this should probably really be:

CAP_CHECKPOINT_RESTORE

I initially thought that might be too long but our config option is the
same name CONFIG_CHECKPOINT_RESTORE so seems ok and other capabilities
have similar long names (CAP_DAC_READ_SEARCH, CAP_NET_BIND_SERVICE come
to mind)

> +
> +#define CAP_LAST_CAP         CAP_RESTORE
>  
>  #define cap_valid(x) ((x) >= 0 && (x) <= CAP_LAST_CAP)
>  
> diff --git a/kernel/pid.c b/kernel/pid.c
> index 3122043fe364..bbc26f2bcff6 100644
> --- a/kernel/pid.c
> +++ b/kernel/pid.c
> @@ -198,7 +198,7 @@ struct pid *alloc_pid(struct pid_namespace *ns, pid_t *set_tid,
>  			if (tid != 1 && !tmp->child_reaper)
>  				goto out_free;
>  			retval = -EPERM;
> -			if (!ns_capable(tmp->user_ns, CAP_SYS_ADMIN))
> +			if (!restore_ns_capable(tmp->user_ns))
>  				goto out_free;
>  			set_tid_size--;
>  		}
> diff --git a/kernel/pid_namespace.c b/kernel/pid_namespace.c
> index 0e5ac162c3a8..f58186b31ce6 100644
> --- a/kernel/pid_namespace.c
> +++ b/kernel/pid_namespace.c
> @@ -269,7 +269,7 @@ static int pid_ns_ctl_handler(struct ctl_table *table, int write,
>  	struct ctl_table tmp = *table;
>  	int ret, next;
>  
> -	if (write && !ns_capable(pid_ns->user_ns, CAP_SYS_ADMIN))
> +	if (write && !restore_ns_capable(pid_ns->user_ns))
>  		return -EPERM;
>  
>  	/*
> diff --git a/security/selinux/include/classmap.h b/security/selinux/include/classmap.h
> index 98e1513b608a..f8b8f12a6ebd 100644
> --- a/security/selinux/include/classmap.h
> +++ b/security/selinux/include/classmap.h
> @@ -27,9 +27,10 @@
>  	    "audit_control", "setfcap"
>  
>  #define COMMON_CAP2_PERMS  "mac_override", "mac_admin", "syslog", \
> -		"wake_alarm", "block_suspend", "audit_read", "perfmon", "bpf"
> +		"wake_alarm", "block_suspend", "audit_read", "perfmon", "bpf", \
> +		"restore"
>  
> -#if CAP_LAST_CAP > CAP_BPF
> +#if CAP_LAST_CAP > CAP_RESTORE
>  #error New capability defined, please update COMMON_CAP2_PERMS.
>  #endif
>  
> 
> base-commit: e8f3274774b45b5f4e9e3d5cad7ff9f43ae3add5
> -- 
> 2.26.2
> 
