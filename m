Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 789CE114190
	for <lists+selinux@lfdr.de>; Thu,  5 Dec 2019 14:36:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729165AbfLENg4 (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Thu, 5 Dec 2019 08:36:56 -0500
Received: from USAT19PA20.eemsg.mail.mil ([214.24.22.194]:48836 "EHLO
        USAT19PA20.eemsg.mail.mil" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726954AbfLENgz (ORCPT
        <rfc822;selinux@vger.kernel.org>); Thu, 5 Dec 2019 08:36:55 -0500
X-EEMSG-check-017: 57319867|USAT19PA20_ESA_OUT01.csd.disa.mil
X-IronPort-AV: E=Sophos;i="5.69,281,1571702400"; 
   d="scan'208";a="57319867"
Received: from emsm-gh1-uea11.ncsc.mil ([214.29.60.3])
  by USAT19PA20.eemsg.mail.mil with ESMTP/TLS/DHE-RSA-AES256-SHA256; 05 Dec 2019 13:36:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tycho.nsa.gov; i=@tycho.nsa.gov; q=dns/txt;
  s=tycho.nsa.gov; t=1575553013; x=1607089013;
  h=subject:to:references:from:message-id:date:mime-version:
   in-reply-to:content-transfer-encoding;
  bh=J5fK+Hyl3mcF9aGpl6ivSbjpcstqstQzu35onRROaGo=;
  b=GBE3HkR2EBwU+a3lQ2LlycG6LzQCnu/QEu/3UrfGtXnW2sGvwNOGU1Qk
   xVxkn65m+3REw/qdeGTZQdncfLlG9nrUCKXEOBZJW/6Kbb/r+S5OKVBxC
   YK1qBWuIcV3tBPFYWTUuIR6NEJpClHHCdpP21ko9QN7nB0qYxP53kb6Yz
   QeDj0VyRDfzRnSoc3DBTlsfLM80PIEnQ3BIKyWFPF46ePTdN7IQwWFhtE
   c5ZfRU6+lItrx5BCrmRF+BUMaSYXrQe/ILvRCFUBJGElPIgo1YmGLubn/
   zo0FbMwpjBXfMO8dKabYPUQv6pojVNIeKtjQvmzdaAjYPQfXReIN/Wu4M
   w==;
X-IronPort-AV: E=Sophos;i="5.69,281,1571702400"; 
   d="scan'208";a="36370477"
IronPort-PHdr: =?us-ascii?q?9a23=3AMweBcRbrP/O3NDwKAqcXz1b/LSx+4OfEezUN45?=
 =?us-ascii?q?9isYplN5qZrsi6bnLW6fgltlLVR4KTs6sC17ON9fmwACddud6oizMrSNR0TR?=
 =?us-ascii?q?gLiMEbzUQLIfWuLgnFFsPsdDEwB89YVVVorDmROElRH9viNRWJ+iXhpTEdFQ?=
 =?us-ascii?q?/iOgVrO+/7BpDdj9it1+C15pbffxhEiCCybL9vIhi6txjdu8oLjYdtKqs91g?=
 =?us-ascii?q?bCr2dVdehR2W5mP0+YkQzm5se38p5j8iBQtOwk+sVdT6j0fLk2QKJBAjg+PG?=
 =?us-ascii?q?87+MPktR/YTQuS/XQcSXkZkgBJAwfe8h73WIr6vzbguep83CmaOtD2TawxVD?=
 =?us-ascii?q?+/4apnVAPkhSEaPDMi7mrZltJ/g75aoBK5phxw3YjUYJ2ONPFjeq/RZM4WSX?=
 =?us-ascii?q?ZdUspUUSFODJm8b48SBOQfO+hWoZT2q18XoRawAQSgAeXiwSJKiHDrx603y/?=
 =?us-ascii?q?kvHx/I3AIgHNwAvnrbo9r3O6gOXu6417XIwDfZYv9KxTvw5orFfxY8qv+MR7?=
 =?us-ascii?q?Jwds/RxFEyGQPZkFqQsYzlMC2T1u8Qrmab6vBvVeari2E5qwB6vz+ixtwxhY?=
 =?us-ascii?q?nSnY8V1lDF+jl5wIYyP9G4TlV7bsS+HJtfsCGaKZJ7T8U/SG9roCY30qAKtJ?=
 =?us-ascii?q?G0cSQQyJkr2gTTZ+KIfoSW+B7vSeCcKipiin1/YrKwnROy/FClyu37S8a7zk?=
 =?us-ascii?q?5HrjFAktnQrnAN0AHT6tSfRvt94Eih3TGP2hjP6u5eO0A0lLfbK4U7zr4xkJ?=
 =?us-ascii?q?oTv0PDHjTol0rqlqOWakUl9fSo6+TgeLnmoIOTN5RohQ3kN6Qum8i/Dfw5Mg?=
 =?us-ascii?q?gIQWeb5fyx2KDs8ED2WrlHjuA6nrPHvJ3VO8gXvLO1DxdQ0ok56ha/Czmm0M?=
 =?us-ascii?q?4fnXkCNF9FYw+Ij5PyNlHSIPH3Efe/g1O2nDdt3PDJJKftAprKLnjdiLvhZ6?=
 =?us-ascii?q?py61ZAyAovytBS/4hUCrAdL/LzQEDxrsHXAQclPAOsw+boEtR91oUAVmKUGa?=
 =?us-ascii?q?KWK7/SsV6O5uIzPeaMfokVtyjhK/Q/+/Huino5k0cHfaa1xZsXdGy4HvN+Lk?=
 =?us-ascii?q?WCf3XshtYBEWEXvgsxV+HqllKCXiBJZ3qoXKIz+Cs7CIS4AofHXIyth6aB3C?=
 =?us-ascii?q?joVqFRM1pHAVCFC3ugV4yFXfoXIHaII8RhmyYIYrOWS4Yg0xy1nAXmyrx7I/?=
 =?us-ascii?q?DS9zFevpXmgpw9/ODXlBcv5RRqAMmHlWKAVWd5miUPXTBl8rp4pBlG1lqb0a?=
 =?us-ascii?q?V+y8ddHNhX6uIBBhw2LrbA3ud6DJb0QQuHcdCXHgX1Cu66CC08G4pii+QFZF?=
 =?us-ascii?q?xwTpD71UHO?=
X-IPAS-Result: =?us-ascii?q?A2AIAADsBuld/wHyM5BlGgEBAQEBAQEBAQMBAQEBEQEBA?=
 =?us-ascii?q?QICAQEBAYFsAwEBAQELAYFzgW0gEiqEK4kDhmMGgTeJaY9JgXsJAQEBAQEBA?=
 =?us-ascii?q?QEBNwEBhEACgjY2Bw4CEAEBAQQBAQEBAQUDAQFshUOCOykBgm4BBSMEEVELG?=
 =?us-ascii?q?AICJgICVwYBDAYCAQGCUww/gkcDCSWvEX8zhU+DMIFIgQ4oAYwweYEHgREnD?=
 =?us-ascii?q?4JdPoIbgi6DEIJeBI0miUtGdJYfgjiCOZMbBhuCQYwtizgtjh2cJAYsgVgrC?=
 =?us-ascii?q?AIYCCEPgydQERSMcheOQSMDMJFoAQE?=
Received: from tarius.tycho.ncsc.mil (HELO tarius.infosec.tycho.ncsc.mil) ([144.51.242.1])
  by emsm-gh1-uea11.NCSC.MIL with ESMTP; 05 Dec 2019 13:36:51 +0000
Received: from moss-pluto.infosec.tycho.ncsc.mil (moss-pluto [192.168.25.131])
        by tarius.infosec.tycho.ncsc.mil (8.14.7/8.14.4) with ESMTP id xB5Dae6Z192790;
        Thu, 5 Dec 2019 08:36:42 -0500
Subject: Re: [V3 PATCH 1/1] selinux-testsuite: Add perf_event tests
To:     Richard Haines <richard_c_haines@btinternet.com>,
        selinux@vger.kernel.org
References: <20191205103331.4040-1-richard_c_haines@btinternet.com>
From:   Stephen Smalley <sds@tycho.nsa.gov>
Message-ID: <11d7bac2-c7d6-d187-2a3f-351c5848f907@tycho.nsa.gov>
Date:   Thu, 5 Dec 2019 08:37:07 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191205103331.4040-1-richard_c_haines@btinternet.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On 12/5/19 5:33 AM, Richard Haines wrote:
> Test perf_event permissions.
> 
> Signed-off-by: Richard Haines <richard_c_haines@btinternet.com>

Acked-by: Stephen Smalley <sds@tycho.nsa.gov>

> ---
> V2 Changes:
> Remove neverallows from policy
> Check /proc/sys/kernel/perf_event_paranoid, if < 2 then bypass the
> capability { sys_admin } test.
> V3 Changes:
> Remove allow_map() and device_t:chr_file rules as not required.
> 
>   defconfig                     |   6 ++
>   policy/Makefile               |   4 +
>   policy/test_perf_event.te     |  89 +++++++++++++++++
>   tests/Makefile                |   4 +
>   tests/perf_event/.gitignore   |   1 +
>   tests/perf_event/Makefile     |   7 ++
>   tests/perf_event/perf_event.c | 178 ++++++++++++++++++++++++++++++++++
>   tests/perf_event/test         |  93 ++++++++++++++++++
>   8 files changed, 382 insertions(+)
>   create mode 100644 policy/test_perf_event.te
>   create mode 100644 tests/perf_event/.gitignore
>   create mode 100644 tests/perf_event/Makefile
>   create mode 100644 tests/perf_event/perf_event.c
>   create mode 100755 tests/perf_event/test
> 
> diff --git a/defconfig b/defconfig
> index 0574f1d..2d9c092 100644
> --- a/defconfig
> +++ b/defconfig
> @@ -78,3 +78,9 @@ CONFIG_KEY_DH_OPERATIONS=y
>   # Test key management socket.
>   # This is not required for SELinux operation itself.
>   CONFIG_NET_KEY=m
> +
> +# Test perf events.
> +# This is not required for SELinux operation itself.
> +CONFIG_HAVE_PERF_EVENTS=y
> +CONFIG_PERF_EVENTS=y
> +CONFIG_TRACEPOINTS=y
> diff --git a/policy/Makefile b/policy/Makefile
> index dda2e16..3f60991 100644
> --- a/policy/Makefile
> +++ b/policy/Makefile
> @@ -101,6 +101,10 @@ ifeq ($(shell grep -q module_load $(POLDEV)/include/support/all_perms.spt && ech
>   TARGETS+=test_module_load.te
>   endif
>   
> +ifeq ($(shell grep -q perf_event $(POLDEV)/include/support/all_perms.spt && echo true),true)
> +TARGETS += test_perf_event.te
> +endif
> +
>   ifeq (x$(DISTRO),$(filter x$(DISTRO),xRHEL4 xRHEL5 xRHEL6))
>   TARGETS:=$(filter-out test_overlayfs.te test_mqueue.te test_ibpkey.te, $(TARGETS))
>   endif
> diff --git a/policy/test_perf_event.te b/policy/test_perf_event.te
> new file mode 100644
> index 0000000..2732ecb
> --- /dev/null
> +++ b/policy/test_perf_event.te
> @@ -0,0 +1,89 @@
> +#
> +######### Check watch_queue for key changes policy module ##########
> +#
> +attribute perfdomain;
> +
> +################# Allow perf_event { * } ##########################
> +type test_perf_t;
> +domain_type(test_perf_t)
> +unconfined_runs_test(test_perf_t)
> +typeattribute test_perf_t testdomain;
> +typeattribute test_perf_t perfdomain;
> +
> +allow test_perf_t self:capability { sys_admin };
> +allow test_perf_t self:perf_event { open cpu kernel tracepoint read write };
> +
> +################# Deny capability { sys_admin } ##########################
> +type test_perf_no_admin_t;
> +domain_type(test_perf_no_admin_t)
> +unconfined_runs_test(test_perf_no_admin_t)
> +typeattribute test_perf_no_admin_t testdomain;
> +typeattribute test_perf_no_admin_t perfdomain;
> +
> +allow test_perf_no_admin_t self:perf_event { open cpu kernel tracepoint read write };
> +
> +################# Deny perf_event { open } ##########################
> +type test_perf_no_open_t;
> +domain_type(test_perf_no_open_t)
> +unconfined_runs_test(test_perf_no_open_t)
> +typeattribute test_perf_no_open_t testdomain;
> +typeattribute test_perf_no_open_t perfdomain;
> +
> +allow test_perf_no_open_t self:capability { sys_admin };
> +allow test_perf_no_open_t self:perf_event { cpu kernel tracepoint read write };
> +
> +################# Deny perf_event { cpu } ##########################
> +type test_perf_no_cpu_t;
> +domain_type(test_perf_no_cpu_t)
> +unconfined_runs_test(test_perf_no_cpu_t)
> +typeattribute test_perf_no_cpu_t testdomain;
> +typeattribute test_perf_no_cpu_t perfdomain;
> +
> +allow test_perf_no_cpu_t self:capability { sys_admin };
> +allow test_perf_no_cpu_t self:perf_event { open kernel tracepoint read write };
> +
> +################# Deny perf_event { kernel } ##########################
> +type test_perf_no_kernel_t;
> +domain_type(test_perf_no_kernel_t)
> +unconfined_runs_test(test_perf_no_kernel_t)
> +typeattribute test_perf_no_kernel_t testdomain;
> +typeattribute test_perf_no_kernel_t perfdomain;
> +
> +allow test_perf_no_kernel_t self:capability { sys_admin };
> +allow test_perf_no_kernel_t self:perf_event { open cpu tracepoint read write };
> +
> +################# Deny perf_event { tracepoint } ##########################
> +type test_perf_no_tracepoint_t;
> +domain_type(test_perf_no_tracepoint_t)
> +unconfined_runs_test(test_perf_no_tracepoint_t)
> +typeattribute test_perf_no_tracepoint_t testdomain;
> +typeattribute test_perf_no_tracepoint_t perfdomain;
> +
> +allow test_perf_no_tracepoint_t self:capability { sys_admin };
> +allow test_perf_no_tracepoint_t self:perf_event { open cpu kernel read write };
> +
> +################# Deny perf_event { read } ##########################
> +type test_perf_no_read_t;
> +domain_type(test_perf_no_read_t)
> +unconfined_runs_test(test_perf_no_read_t)
> +typeattribute test_perf_no_read_t testdomain;
> +typeattribute test_perf_no_read_t perfdomain;
> +
> +allow test_perf_no_read_t self:capability { sys_admin };
> +allow test_perf_no_read_t self:perf_event { open cpu kernel tracepoint write };
> +
> +################# Deny perf_event { write } ##########################
> +type test_perf_no_write_t;
> +domain_type(test_perf_no_write_t)
> +unconfined_runs_test(test_perf_no_write_t)
> +typeattribute test_perf_no_write_t testdomain;
> +typeattribute test_perf_no_write_t perfdomain;
> +
> +allow test_perf_no_write_t self:capability { sys_admin };
> +allow test_perf_no_write_t self:perf_event { open cpu kernel tracepoint read };
> +
> +#
> +########### Allow these domains to be entered from sysadm domain ############
> +#
> +miscfiles_domain_entry_test_files(perfdomain)
> +userdom_sysadm_entry_spec_domtrans_to(perfdomain)
> diff --git a/tests/Makefile b/tests/Makefile
> index 0d33fbf..8f66996 100644
> --- a/tests/Makefile
> +++ b/tests/Makefile
> @@ -79,6 +79,10 @@ SUBDIRS+=module_load
>   endif
>   endif
>   
> +ifeq ($(shell grep -q perf_event $(POLDEV)/include/support/all_perms.spt && echo true),true)
> +SUBDIRS += perf_event
> +endif
> +
>   ifeq ($(DISTRO),RHEL4)
>       SUBDIRS:=$(filter-out bounds dyntrace dyntrans inet_socket mmap nnp_nosuid overlay unix_socket, $(SUBDIRS))
>   endif
> diff --git a/tests/perf_event/.gitignore b/tests/perf_event/.gitignore
> new file mode 100644
> index 0000000..8c2f931
> --- /dev/null
> +++ b/tests/perf_event/.gitignore
> @@ -0,0 +1 @@
> +perf_event
> diff --git a/tests/perf_event/Makefile b/tests/perf_event/Makefile
> new file mode 100644
> index 0000000..988424c
> --- /dev/null
> +++ b/tests/perf_event/Makefile
> @@ -0,0 +1,7 @@
> +TARGETS = perf_event
> +LDLIBS += -lselinux
> +
> +all: $(TARGETS)
> +
> +clean:
> +	rm -f $(TARGETS)
> diff --git a/tests/perf_event/perf_event.c b/tests/perf_event/perf_event.c
> new file mode 100644
> index 0000000..8983f02
> --- /dev/null
> +++ b/tests/perf_event/perf_event.c
> @@ -0,0 +1,178 @@
> +#include <stdlib.h>
> +#include <stdio.h>
> +#include <unistd.h>
> +#include <string.h>
> +#include <unistd.h>
> +#include <errno.h>
> +#include <stdbool.h>
> +#include <asm/unistd.h>
> +#include <sys/mman.h>
> +#include <sys/ioctl.h>
> +#include <linux/perf_event.h>
> +#include <selinux/selinux.h>
> +
> +enum {
> +	PERF_FILE_MMAP,
> +	PERF_FILE,
> +	PERF_MMAP
> +} read_type;
> +
> +static void print_usage(char *progname)
> +{
> +	fprintf(stderr,
> +		"usage:  %s [-f|-m] [-v]\n"
> +		"Where:\n\t"
> +		"-f  Read perf_event info using read(2)\n\t"
> +		"-m  Read perf_event info using mmap(2)\n\t"
> +		"    Default is to use read(2) and mmap(2)\n\t"
> +		"-v  Print information\n", progname);
> +	exit(-1);
> +}
> +
> +static long perf_event_open(struct perf_event_attr *hw_event, pid_t pid,
> +			    int cpu, int group_fd, unsigned long flags)
> +{
> +	return syscall(__NR_perf_event_open, hw_event, pid, cpu,
> +		       group_fd, flags);
> +}
> +
> +int main(int argc, char **argv)
> +{
> +	int opt, result, page_size, mmap_size, fd;
> +	long long count;
> +	bool verbose = false;
> +	char *context;
> +	void *base;
> +	struct perf_event_attr pe_attr;
> +	struct perf_event_mmap_page *pe_page;
> +
> +	read_type = PERF_FILE_MMAP;
> +
> +	while ((opt = getopt(argc, argv, "fmv")) != -1) {
> +		switch (opt) {
> +		case 'f':
> +			read_type = PERF_FILE;
> +			break;
> +		case 'm':
> +			read_type = PERF_MMAP;
> +			break;
> +		case 'v':
> +			verbose = true;
> +			break;
> +		default:
> +			print_usage(argv[0]);
> +		}
> +	}
> +
> +	if (verbose) {
> +		result = getcon(&context);
> +		if (result < 0) {
> +			fprintf(stderr, "Failed to obtain process context\n");
> +			exit(-1);
> +		}
> +		printf("Process context:\n\t%s\n", context);
> +		free(context);
> +	}
> +
> +	/* Test perf_event { open cpu kernel tracepoint } */
> +	memset(&pe_attr, 0, sizeof(struct perf_event_attr));
> +	pe_attr.type = PERF_TYPE_HARDWARE | PERF_TYPE_TRACEPOINT;
> +	pe_attr.size = sizeof(struct perf_event_attr);
> +	pe_attr.config = PERF_COUNT_HW_INSTRUCTIONS;
> +	pe_attr.disabled = 1;
> +	pe_attr.exclude_hv = 1;
> +
> +	fd = perf_event_open(&pe_attr, -1, 1, -1, 0);
> +	if (fd < 0) {
> +		fprintf(stderr, "Failed perf_event_open(): %s\n",
> +			strerror(errno));
> +		if (errno == EACCES)
> +			exit(1);
> +		else
> +			exit(-1);
> +	}
> +
> +	/* Test perf_event { write }; */
> +	result = ioctl(fd, PERF_EVENT_IOC_RESET, 0);
> +	if (result < 0) {
> +		fprintf(stderr, "Failed ioctl(PERF_EVENT_IOC_RESET): %s\n",
> +			strerror(errno));
> +		if (errno == EACCES)
> +			result = 2;
> +		goto err;
> +	}
> +
> +	result = ioctl(fd, PERF_EVENT_IOC_ENABLE, 0);
> +	if (result < 0) {
> +		fprintf(stderr, "Failed ioctl(PERF_EVENT_IOC_ENABLE): %s\n",
> +			strerror(errno));
> +		if (errno == EACCES)
> +			result = 3;
> +		goto err;
> +	}
> +
> +	result = ioctl(fd, PERF_EVENT_IOC_DISABLE, 0);
> +	if (result < 0) {
> +		fprintf(stderr, "Failed ioctl(PERF_EVENT_IOC_DISABLE): %s\n",
> +			strerror(errno));
> +		if (errno == EACCES)
> +			result = 4;
> +		goto err;
> +	}
> +
> +	/* Test mmap(2) perf_event { read } */
> +	if (read_type == PERF_MMAP || read_type == PERF_FILE_MMAP) {
> +		page_size = sysconf(_SC_PAGESIZE);
> +		if (page_size < 0) {
> +			fprintf(stderr, "Failed sysconf(_SC_PAGESIZE): %s\n",
> +				strerror(errno));
> +			if (errno == EACCES)
> +				result = 5;
> +			else
> +				result = -1;
> +			goto err;
> +		}
> +		mmap_size = page_size * 2;
> +
> +		base = mmap(NULL, mmap_size, PROT_READ | PROT_WRITE,
> +			    MAP_SHARED, fd, 0);
> +		if (base == MAP_FAILED) {
> +			fprintf(stderr, "Failed mmap(): %s\n", strerror(errno));
> +			if (errno == EACCES)
> +				result = 6;
> +			else
> +				result = -1;
> +			goto err;
> +		}
> +
> +		if (verbose) {
> +			pe_page = base;
> +			printf("perf mmap(2) return value: %lld\n",
> +			       pe_page->offset);
> +		}
> +
> +		munmap(base, mmap_size);
> +	}
> +
> +	/* Test read(2) perf_event { read } */
> +	if (read_type == PERF_FILE || read_type == PERF_FILE_MMAP) {
> +		result = read(fd, &count, sizeof(long long));
> +		if (result < 0) {
> +			fprintf(stderr, "Failed read(): %s\n", strerror(errno));
> +			if (errno == EACCES)
> +				result = 7;
> +			goto err;
> +		}
> +
> +		if (verbose)
> +			printf("perf read(2) return value: %lld\n", count);
> +
> +		close(fd);
> +	}
> +
> +	return 0;
> +
> +err:
> +	close(fd);
> +	return result;
> +}
> diff --git a/tests/perf_event/test b/tests/perf_event/test
> new file mode 100755
> index 0000000..1c2e4a9
> --- /dev/null
> +++ b/tests/perf_event/test
> @@ -0,0 +1,93 @@
> +#!/usr/bin/perl
> +use Test::More;
> +
> +BEGIN {
> +    $basedir = $0;
> +    $basedir =~ s|(.*)/[^/]*|$1|;
> +
> +    $test_count = 8;
> +    $sys_admin  = 0;
> +
> +    # allow info to be shown during tests
> +    $v = $ARGV[0];
> +    if ($v) {
> +        if ( $v ne "-v" ) {
> +            plan skip_all => "Invalid option (use -v)";
> +        }
> +    }
> +    else {
> +        $v = " ";
> +    }
> +
> +    $level = `cat /proc/sys/kernel/perf_event_paranoid`;
> +    chomp($level);
> +    if ( $level >= 2 ) {    # These tests require CAP_SYS_ADMIN
> +        $test_count += 1;
> +        $sys_admin = 1;
> +    }
> +
> +    if ( $v eq "-v" ) {
> +        print "Paranoid level: $level\n";
> +        if ( $level < 0 ) {
> +            print "\tNot paranoid\n";
> +        }
> +        elsif ( $level eq 0 ) {
> +            print "\tDisallow raw tracepoint/ftrace without CAP_SYS_ADMIN\n";
> +        }
> +        elsif ( $level eq 1 ) {
> +            print "\tDisallow CPU event access without CAP_SYS_ADMIN\n";
> +        }
> +        elsif ( $level eq 2 ) {
> +            print "\tDisallow kernel profiling without CAP_SYS_ADMIN\n";
> +        }
> +        else {
> +            print "\tUndefined level\n";
> +        }
> +    }
> +
> +    plan tests => $test_count;
> +}
> +
> +# perf_event { open cpu kernel tracepoint read write };
> +print "Test perf_event\n";
> +$result = system "runcon -t test_perf_t $basedir/perf_event $v";
> +ok( $result eq 0 );
> +
> +if ($sys_admin) {
> +
> +    # Deny capability { sys_admin } - EACCES perf_event_open(2)
> +    $result =
> +      system "runcon -t test_perf_no_admin_t $basedir/perf_event $v 2>&1";
> +    ok( $result >> 8 eq 1 );
> +}
> +
> +# Deny perf_event { open } - EACCES perf_event_open(2)
> +$result = system "runcon -t test_perf_no_open_t $basedir/perf_event $v 2>&1";
> +ok( $result >> 8 eq 1 );
> +
> +# Deny perf_event { cpu } - EACCES perf_event_open(2)
> +$result = system "runcon -t test_perf_no_cpu_t $basedir/perf_event $v 2>&1";
> +ok( $result >> 8 eq 1 );
> +
> +# Deny perf_event { kernel } - EACCES perf_event_open(2)
> +$result = system "runcon -t test_perf_no_kernel_t $basedir/perf_event $v 2>&1";
> +ok( $result >> 8 eq 1 );
> +
> +# Deny perf_event { tracepoint } - EACCES perf_event_open(2)
> +$result =
> +  system "runcon -t test_perf_no_tracepoint_t $basedir/perf_event $v 2>&1";
> +ok( $result >> 8 eq 1 );
> +
> +# Deny perf_event { read } - EACCES mmap(2)
> +$result = system "runcon -t test_perf_no_read_t $basedir/perf_event -m $v 2>&1";
> +ok( $result >> 8 eq 6 );
> +
> +# Deny perf_event { read } - EACCES read(2)
> +$result = system "runcon -t test_perf_no_read_t $basedir/perf_event -f $v 2>&1";
> +ok( $result >> 8 eq 7 );
> +
> +# Deny perf_event { write } - EACCES ioctl(2) write
> +$result = system "runcon -t test_perf_no_write_t $basedir/perf_event $v 2>&1";
> +ok( $result >> 8 eq 2 );
> +
> +exit;
> 

