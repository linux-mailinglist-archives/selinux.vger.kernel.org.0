Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 68C2CFC8D9
	for <lists+selinux@lfdr.de>; Thu, 14 Nov 2019 15:25:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726977AbfKNOZI (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Thu, 14 Nov 2019 09:25:08 -0500
Received: from USFB19PA36.eemsg.mail.mil ([214.24.26.199]:13534 "EHLO
        USFB19PA36.eemsg.mail.mil" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726307AbfKNOZI (ORCPT
        <rfc822;selinux@vger.kernel.org>); Thu, 14 Nov 2019 09:25:08 -0500
X-EEMSG-check-017: 26763624|USFB19PA36_ESA_OUT06.csd.disa.mil
X-IronPort-AV: E=Sophos;i="5.68,304,1569283200"; 
   d="scan'208";a="26763624"
Received: from emsm-gh1-uea10.ncsc.mil ([214.29.60.2])
  by USFB19PA36.eemsg.mail.mil with ESMTP/TLS/DHE-RSA-AES256-SHA256; 14 Nov 2019 14:24:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tycho.nsa.gov; i=@tycho.nsa.gov; q=dns/txt;
  s=tycho.nsa.gov; t=1573741481; x=1605277481;
  h=subject:to:references:from:message-id:date:mime-version:
   in-reply-to:content-transfer-encoding;
  bh=aV7tCOG0RXfNFjH+7Wv+YmLpjFXw39w5GLYb1caNeUs=;
  b=hldEvl9KZzduuDlI/PX1GVq8AGl5Geler1SEUBDRuuclnmKf8E0KLprE
   PyZ3pw1bvGPAZ2QGTgzbcF4fnO1YQzpP275bRaLdqDeq3Z4hMfBKCnZ45
   C3S+N0cG0bOh2xJvoHbZeJMmaKyrlgPk9BbUk5O09gARF8WCpfT9+0qpY
   9s3tHFtGAc17PvN0gB0y/UDbMis6+llr33TEKJD1VfNvK2JA1bscSxaBr
   SuRTNt9eMvKo5f5HlG/nljj2uLczamT9uUpSNdgApWLVw7tAyztN5Tker
   2QfWFYbSTJTDiKX3Y6ppdK55RqGXaQl2TUSR1i6A2n7vkIUX6VLPiq1Rl
   g==;
X-IronPort-AV: E=Sophos;i="5.68,304,1569283200"; 
   d="scan'208";a="30101657"
IronPort-PHdr: =?us-ascii?q?9a23=3AInbJvRNvQk72qUO1aMwl6mtUPXoX/o7sNwtQ0K?=
 =?us-ascii?q?IMzox0I/7/rarrMEGX3/hxlliBBdydt6sfzbON6Ou+ASQp2tWoiDg6aptCVh?=
 =?us-ascii?q?sI2409vjcLJ4q7M3D9N+PgdCcgHc5PBxdP9nC/NlVJSo6lPwWB6nK94iQPFR?=
 =?us-ascii?q?rhKAF7Ovr6GpLIj8Swyuu+54Dfbx9HiTagb75+Ngi6oAvfu8UZgIZuNrs6xw?=
 =?us-ascii?q?fUrHdPZ+lY335jK0iJnxb76Mew/Zpj/DpVtvk86cNOUrj0crohQ7BAAzsoL2?=
 =?us-ascii?q?465MvwtRneVgSP/WcTUn8XkhVTHQfI6gzxU4rrvSv7sup93zSaPdHzQLspVz?=
 =?us-ascii?q?mu87tnRRn1gyocKTU37H/YhdBxjKJDoRKuuRp/w5LPYIqIMPZyZ77Rcc8GSW?=
 =?us-ascii?q?ZEWMteWTZBAoehZIURCeQPM/tTo43kq1YAqRayAA+hD/7txDBVnH/7xbA03f?=
 =?us-ascii?q?ovEQ/G3wIuEdwBv3vWo9rpO6kfSvy1wavSwDnfc/9b1zXw5Y7VeR4hu/GMWr?=
 =?us-ascii?q?dwfNLMx0kzCQzFllWQppLjPziIy+oNtnKU7+5kVe2xi28stgZ8oiOyycc3kY?=
 =?us-ascii?q?TJmoIUxUzE9SV+2oo1I8a4R1Rhbd6rF5tQqTiXOo1rSc0hW2FloDs2x7IJtJ?=
 =?us-ascii?q?KhfCUG1Y4rywDQZvCZaYSE/xTuX/uLLzhinnJqYre/ig638Uin1+LzSNG50E?=
 =?us-ascii?q?1PripZitnMsW0N1wDL5siHVPR9+kCh1C6T1w/J8OFEIF00lbHBJ549wr8/ip?=
 =?us-ascii?q?oTsUPZEi/whEr2l7OZel8h+uip7+TrerTmppmCOI9okgzyL6sjl8OlDek4Lw?=
 =?us-ascii?q?QCRXaX9Oui2LH54EH1WLBKgec3kqndvpDaP8MbpquhDg9Oz4kj8A2yDyum0d?=
 =?us-ascii?q?sEnXkHK0hJeBScj4fzIV3OL/f4Demnj1S2jDhr3+zGPqHmApjVNHjDkavufb?=
 =?us-ascii?q?Zn5E5G1QU81cxQ6IpUCr4bIfLzXFH+tMfDAxAiLwy0wuDnCMlj2YMEX2KAHL?=
 =?us-ascii?q?OZPLnOvl+P4+IlO/OMa5MNuDbhN/gl4ObjjWQnll8ZfKmp24YXaX+jE/R4LE?=
 =?us-ascii?q?WWf2Dsjs0CEWgUpAo+SvLliFmYXT5UfXayUPF02jZuMoOtDY7ZSsiNib2H0T?=
 =?us-ascii?q?zzSodXbWBPEFy7GkDofoSCVuwkYj6TJNNsiDoJSf6qTIp3kVm1uQv7zad3Bv?=
 =?us-ascii?q?Tb9zdetp/50tVxoerJmkIc7ztxWv+B3nmNQmc8pWYBQzs7zegrukBm4kuS2q?=
 =?us-ascii?q?h/xfpDHJpc4O0fAVRyDoLV0+EvU4O6YQnGZNrcDQ/9E9g=3D?=
X-IPAS-Result: =?us-ascii?q?A2DfAADWYc1d/wHyM5BlGgEBAQEBAQEBAQMBAQEBEQEBA?=
 =?us-ascii?q?QICAQEBAYF+gXQsgUEyKoQpjwtUBoE2iWaPXIFnCQEBAQEBAQEBATQBAgEBh?=
 =?us-ascii?q?EACgiAkOBMCDgEBAQQBAQEBAQUDAQFshUOCOykBgm0BBSMVUQsYAgImAgJXB?=
 =?us-ascii?q?gEMBgIBAYJfP4JHAwklsmWBMoVOg0aBSIEOKIwVGHiBB4ERJ4JrPoIbghIYg?=
 =?us-ascii?q?xCCXgSNGYk9RXSWD4I0gjaTEAYbgj6MG4srLY4anBUigVgrCAIYCCEPgydQE?=
 =?us-ascii?q?RSRJheOQSMDMIEFAQGREQEB?=
Received: from tarius.tycho.ncsc.mil ([144.51.242.1])
  by EMSM-GH1-UEA10.NCSC.MIL with ESMTP; 14 Nov 2019 14:24:40 +0000
Received: from moss-pluto.infosec.tycho.ncsc.mil (moss-pluto [192.168.25.131])
        by tarius.tycho.ncsc.mil (8.14.4/8.14.4) with ESMTP id xAEEOdY5027013;
        Thu, 14 Nov 2019 09:24:39 -0500
Subject: Re: [PATCH V2] selinux-testsuite: Add key_socket tests
To:     Richard Haines <richard_c_haines@btinternet.com>,
        selinux@vger.kernel.org
References: <20191112171557.3067-1-richard_c_haines@btinternet.com>
From:   Stephen Smalley <sds@tycho.nsa.gov>
Message-ID: <fcd7dcc3-899f-2cb7-54d6-1f82100ed0e2@tycho.nsa.gov>
Date:   Thu, 14 Nov 2019 09:24:39 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20191112171557.3067-1-richard_c_haines@btinternet.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On 11/12/19 12:15 PM, Richard Haines wrote:
> Test relevant key management socket permissions.
> 
> Signed-off-by: Richard Haines <richard_c_haines@btinternet.com>

Acked-by: Stephen Smalley <sds@tycho.nsa.gov>

> ---
> V2 Change: Rework error handling
> 
>   defconfig                   |   4 ++
>   policy/Makefile             |   4 ++
>   policy/test_key_socket.te   |  75 ++++++++++++++++++++
>   tests/Makefile              |   4 ++
>   tests/key_socket/.gitignore |   1 +
>   tests/key_socket/Makefile   |   7 ++
>   tests/key_socket/key_sock.c | 137 ++++++++++++++++++++++++++++++++++++
>   tests/key_socket/test       |  45 ++++++++++++
>   8 files changed, 277 insertions(+)
>   create mode 100644 policy/test_key_socket.te
>   create mode 100644 tests/key_socket/.gitignore
>   create mode 100644 tests/key_socket/Makefile
>   create mode 100644 tests/key_socket/key_sock.c
>   create mode 100755 tests/key_socket/test
> 
> diff --git a/defconfig b/defconfig
> index b13075d..0574f1d 100644
> --- a/defconfig
> +++ b/defconfig
> @@ -74,3 +74,7 @@ CONFIG_BPF_SYSCALL=y
>   CONFIG_KEYS=y
>   CONFIG_KEYS_COMPAT=y
>   CONFIG_KEY_DH_OPERATIONS=y
> +
> +# Test key management socket.
> +# This is not required for SELinux operation itself.
> +CONFIG_NET_KEY=m
> diff --git a/policy/Makefile b/policy/Makefile
> index ff65153..ad94c43 100644
> --- a/policy/Makefile
> +++ b/policy/Makefile
> @@ -90,6 +90,10 @@ ifeq ($(shell grep -q all_file_perms.*watch $(POLDEV)/include/support/all_perms.
>   TARGETS+=test_notify.te
>   endif
>   
> +ifeq ($(shell grep -q key_socket $(POLDEV)/include/support/all_perms.spt && echo true),true)
> +TARGETS += test_key_socket.te
> +endif
> +
>   ifeq (x$(DISTRO),$(filter x$(DISTRO),xRHEL4 xRHEL5 xRHEL6))
>   TARGETS:=$(filter-out test_overlayfs.te test_mqueue.te test_ibpkey.te, $(TARGETS))
>   endif
> diff --git a/policy/test_key_socket.te b/policy/test_key_socket.te
> new file mode 100644
> index 0000000..5c36c72
> --- /dev/null
> +++ b/policy/test_key_socket.te
> @@ -0,0 +1,75 @@
> +#
> +############## Test key management socket 'key_socket' #####################
> +#
> +attribute keysockdomain;
> +
> +type test_key_sock_t;
> +domain_type(test_key_sock_t)
> +unconfined_runs_test(test_key_sock_t)
> +typeattribute test_key_sock_t testdomain;
> +typeattribute test_key_sock_t keysockdomain;
> +
> +# key_socket rules:
> +allow test_key_sock_t self:rawip_socket { create };
> +allow test_key_sock_t self:capability { net_admin };
> +allow test_key_sock_t self:key_socket { create write read setopt };
> +# For CONFIG_NET_KEY=m
> +allow test_key_sock_t kernel_t:system { module_request };
> +
> +################## Deny capability { net_admin } ##########################
> +#
> +# Note that when capability { net_admin } is removed for the test
> +# there will not be an audit message in the log as the Fedora policy
> +# is built with 'hide_broken_symptoms' that adds the following:
> +#   dontaudit test_key_sock_no_net_admin_t self:capability { net_admin sys_module };
> +#
> +type test_key_sock_no_net_admin_t;
> +domain_type(test_key_sock_no_net_admin_t)
> +unconfined_runs_test(test_key_sock_no_net_admin_t)
> +typeattribute test_key_sock_no_net_admin_t testdomain;
> +typeattribute test_key_sock_no_net_admin_t keysockdomain;
> +
> +allow test_key_sock_no_net_admin_t self:rawip_socket { create };
> +allow test_key_sock_no_net_admin_t self:key_socket { create write read setopt };
> +allow test_key_sock_no_net_admin_t kernel_t:system { module_request };
> +
> +####################### Deny key_socket { create } ##########################
> +type test_key_sock_no_create_t;
> +domain_type(test_key_sock_no_create_t)
> +unconfined_runs_test(test_key_sock_no_create_t)
> +typeattribute test_key_sock_no_create_t testdomain;
> +typeattribute test_key_sock_no_create_t keysockdomain;
> +
> +allow test_key_sock_no_create_t self:rawip_socket { create };
> +allow test_key_sock_no_create_t self:capability { net_admin };
> +allow test_key_sock_no_create_t self:key_socket { write read setopt };
> +
> +####################### Deny key_socket { write } ##########################
> +type test_key_sock_no_write_t;
> +domain_type(test_key_sock_no_write_t)
> +unconfined_runs_test(test_key_sock_no_write_t)
> +typeattribute test_key_sock_no_write_t testdomain;
> +typeattribute test_key_sock_no_write_t keysockdomain;
> +
> +allow test_key_sock_no_write_t self:rawip_socket { create };
> +allow test_key_sock_no_write_t self:capability { net_admin };
> +allow test_key_sock_no_write_t self:key_socket { create read setopt };
> +allow test_key_sock_no_write_t kernel_t:system { module_request };
> +
> +####################### Deny key_socket { read } ##########################
> +type test_key_sock_no_read_t;
> +domain_type(test_key_sock_no_read_t)
> +unconfined_runs_test(test_key_sock_no_read_t)
> +typeattribute test_key_sock_no_read_t testdomain;
> +typeattribute test_key_sock_no_read_t keysockdomain;
> +
> +allow test_key_sock_no_read_t self:rawip_socket { create };
> +allow test_key_sock_no_read_t self:capability { net_admin };
> +allow test_key_sock_no_read_t self:key_socket { create write setopt };
> +allow test_key_sock_no_read_t kernel_t:system { module_request };
> +
> +#
> +########### Allow these domains to be entered from sysadm domain ############
> +#
> +miscfiles_domain_entry_test_files(keysockdomain)
> +userdom_sysadm_entry_spec_domtrans_to(keysockdomain)
> diff --git a/tests/Makefile b/tests/Makefile
> index 0021590..cca6648 100644
> --- a/tests/Makefile
> +++ b/tests/Makefile
> @@ -52,6 +52,10 @@ ifeq ($(shell grep -q all_key_perms $(POLDEV)/include/support/all_perms.spt && e
>   SUBDIRS += keys
>   endif
>   
> +ifeq ($(shell grep -q key_socket $(POLDEV)/include/support/all_perms.spt && test -e $(INCLUDEDIR)/keyutils.h && echo true),true)
> +SUBDIRS += key_socket
> +endif
> +
>   ifeq ($(shell grep "^SELINUX_INFINIBAND_ENDPORT_TEST=" infiniband_endport/ibendport_test.conf | cut -d'=' -f 2),1)
>   SUBDIRS += infiniband_endport
>   endif
> diff --git a/tests/key_socket/.gitignore b/tests/key_socket/.gitignore
> new file mode 100644
> index 0000000..1a532c0
> --- /dev/null
> +++ b/tests/key_socket/.gitignore
> @@ -0,0 +1 @@
> +key_sock
> diff --git a/tests/key_socket/Makefile b/tests/key_socket/Makefile
> new file mode 100644
> index 0000000..e5e6a58
> --- /dev/null
> +++ b/tests/key_socket/Makefile
> @@ -0,0 +1,7 @@
> +TARGETS = key_sock
> +LDLIBS += -lselinux
> +
> +all: $(TARGETS)
> +
> +clean:
> +	rm -f $(TARGETS)
> diff --git a/tests/key_socket/key_sock.c b/tests/key_socket/key_sock.c
> new file mode 100644
> index 0000000..29beb0e
> --- /dev/null
> +++ b/tests/key_socket/key_sock.c
> @@ -0,0 +1,137 @@
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <string.h>
> +#include <stdint.h>
> +#include <unistd.h>
> +#include <errno.h>
> +#include <stdbool.h>
> +#include <sys/socket.h>
> +#include <linux/pfkeyv2.h>
> +#include <selinux/selinux.h>
> +
> +static void print_usage(char *progname)
> +{
> +	fprintf(stderr,
> +		"usage:  %s [-v]\n"
> +		"Where:\n\t"
> +		"-v  Print information.\n", progname);
> +	exit(-1);
> +}
> +
> +int main(int argc, char *argv[])
> +{
> +	char *context;
> +	int opt, sock, result;
> +	bool verbose = false;
> +	struct timeval tm;
> +	struct sadb_msg w_msg, r_msg;
> +	int mlen = sizeof(struct sadb_msg);
> +
> +	while ((opt = getopt(argc, argv, "v")) != -1) {
> +		switch (opt) {
> +		case 'v':
> +			verbose = true;
> +			break;
> +		default:
> +			print_usage(argv[0]);
> +		}
> +	}
> +
> +	result = getcon(&context);
> +	if (result < 0) {
> +		fprintf(stderr, "Failed to obtain process context\n");
> +		exit(-1);
> +	}
> +
> +	if (verbose)
> +		printf("Process context:\n\t%s\n", context);
> +
> +	free(context);
> +
> +	sock = socket(PF_KEY, SOCK_RAW, PF_KEY_V2);
> +	if (sock < 0) {
> +		fprintf(stderr, "Failed to open key management socket: %s\n",
> +			strerror(errno));
> +		/* Return errno as denying net_admin=EPERM, create=EACCES */
> +		exit(errno);
> +	}
> +
> +	if (verbose)
> +		printf("Opened key management socket\n");
> +
> +	/* Set socket timeout for read in case no response from kernel */
> +	tm.tv_sec = 3;
> +	tm.tv_usec = 0;
> +	result = setsockopt(sock, SOL_SOCKET, SO_RCVTIMEO, &tm, sizeof(tm));
> +	if (result < 0) {
> +		fprintf(stderr, "Failed setsockopt SO_RCVTIMEO: %s\n",
> +			strerror(errno));
> +		close(sock);
> +		exit(-1);
> +	}
> +
> +	if (verbose)
> +		printf("setsocketopt: SO_RCVTIMEO - %ld seconds\n", tm.tv_sec);
> +
> +	memset(&w_msg, 0, mlen);
> +	w_msg.sadb_msg_version = PF_KEY_V2;
> +	w_msg.sadb_msg_type = SADB_FLUSH;
> +	w_msg.sadb_msg_satype = SADB_SATYPE_AH;
> +	/* sadb_msg_len contains length in 64-bit words */
> +	w_msg.sadb_msg_len = (mlen / sizeof(uint64_t));
> +	w_msg.sadb_msg_seq = 99;
> +	w_msg.sadb_msg_pid = getpid();
> +
> +	result = write(sock, &w_msg, mlen);
> +	if (result < 0) {
> +		fprintf(stderr, "Failed write to key management socket: %s\n",
> +			strerror(errno));
> +		close(sock);
> +		exit(errno); /* Return errno to test if EACCES */
> +	}
> +
> +	if (verbose) {
> +		printf("Write sadb_msg data to key management socket:\n");
> +		printf("\tver: PF_KEY_V2 type: SADB_FLUSH sa_type: SADB_SATYPE_AH\n");
> +		printf("\tseq: %d pid: %d\n", w_msg.sadb_msg_seq,
> +		       w_msg.sadb_msg_pid);
> +	}
> +
> +	memset(&r_msg, 0, mlen);
> +
> +	result = read(sock, &r_msg, mlen);
> +	if (result < 0) {
> +		fprintf(stderr, "Failed to read key management socket: %s\n",
> +			strerror(errno));
> +		close(sock);
> +		exit(errno); /* Return errno to test if EACCES */
> +	}
> +
> +	if (r_msg.sadb_msg_version != w_msg.sadb_msg_version ||
> +	    r_msg.sadb_msg_type != w_msg.sadb_msg_type ||
> +	    r_msg.sadb_msg_satype != w_msg.sadb_msg_satype ||
> +	    r_msg.sadb_msg_seq != w_msg.sadb_msg_seq ||
> +	    r_msg.sadb_msg_pid != getpid()) {
> +		fprintf(stderr, "Failed to read correct sadb_msg data:\n");
> +		fprintf(stderr, "\tSent - ver: %d type: %d sa_type: %d seq: %d pid: %d\n",
> +			w_msg.sadb_msg_version, w_msg.sadb_msg_type,
> +			w_msg.sadb_msg_satype, w_msg.sadb_msg_seq,
> +			w_msg.sadb_msg_pid);
> +		fprintf(stderr, "\tRecv - ver: %d type: %d sa_type: %d seq: %d pid: %d\n",
> +			r_msg.sadb_msg_version, r_msg.sadb_msg_type,
> +			r_msg.sadb_msg_satype, r_msg.sadb_msg_seq,
> +			r_msg.sadb_msg_pid);
> +		close(sock);
> +		exit(-1);
> +	}
> +
> +	if (verbose) {
> +		printf("Read sadb_msg data from key management socket:\n");
> +		printf("\tver: PF_KEY_V2 type: SADB_FLUSH sa_type: SADB_SATYPE_AH\n");
> +		printf("\tseq: %d pid: %d\n", r_msg.sadb_msg_seq,
> +		       r_msg.sadb_msg_pid);
> +	}
> +
> +	close(sock);
> +	return 0;
> +}
> diff --git a/tests/key_socket/test b/tests/key_socket/test
> new file mode 100755
> index 0000000..a13327f
> --- /dev/null
> +++ b/tests/key_socket/test
> @@ -0,0 +1,45 @@
> +#!/usr/bin/perl
> +use Test::More;
> +
> +BEGIN {
> +    $basedir = $0;
> +    $basedir =~ s|(.*)/[^/]*|$1|;
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
> +    plan tests => 5;
> +}
> +
> +############ Test key_socket #############
> +print "Test key management key_socket\n";
> +$result = system "runcon -t test_key_sock_t $basedir/key_sock $v";
> +ok( $result eq 0 );
> +
> +# Deny capability { net_admin } - EPERM
> +$result =
> +  system "runcon -t test_key_sock_no_net_admin_t $basedir/key_sock $v 2>&1";
> +ok( $result >> 8 eq 1 );
> +
> +# Deny key_socket { create } - EACCES
> +$result =
> +  system "runcon -t test_key_sock_no_create_t $basedir/key_sock $v 2>&1";
> +ok( $result >> 8 eq 13 );
> +
> +# Deny key_socket { write } - EACCES
> +$result = system "runcon -t test_key_sock_no_write_t $basedir/key_sock $v 2>&1";
> +ok( $result >> 8 eq 13 );
> +
> +# Deny key_socket { read } - EACCES
> +$result = system "runcon -t test_key_sock_no_read_t $basedir/key_sock $v 2>&1";
> +ok( $result >> 8 eq 13 );
> +
> +exit;
> 

