Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 90C2AB3FDA
	for <lists+selinux@lfdr.de>; Mon, 16 Sep 2019 19:59:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731992AbfIPR7A (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Mon, 16 Sep 2019 13:59:00 -0400
Received: from UPDC19PA20.eemsg.mail.mil ([214.24.27.195]:57213 "EHLO
        UPDC19PA20.eemsg.mail.mil" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727039AbfIPR7A (ORCPT
        <rfc822;selinux@vger.kernel.org>); Mon, 16 Sep 2019 13:59:00 -0400
X-EEMSG-check-017: 14343857|UPDC19PA20_ESA_OUT02.csd.disa.mil
X-IronPort-AV: E=Sophos;i="5.64,513,1559520000"; 
   d="scan'208";a="14343857"
Received: from emsm-gh1-uea10.ncsc.mil ([214.29.60.2])
  by UPDC19PA20.eemsg.mail.mil with ESMTP/TLS/DHE-RSA-AES256-SHA256; 16 Sep 2019 17:58:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tycho.nsa.gov; i=@tycho.nsa.gov; q=dns/txt;
  s=tycho.nsa.gov; t=1568656730; x=1600192730;
  h=subject:to:references:from:message-id:date:mime-version:
   in-reply-to:content-transfer-encoding;
  bh=P60IxBD+uYe4jI12PyxEg96g2ApQFR3jzwMWvnpa5ro=;
  b=Vo2nux0XAG9CUQbQxHt+++/lIRNgqYXfkb+udd/3PRRnNOCAh6WW6H8X
   tGhg4kadMlgpJk1DTmMfE74Q7LfVCVOwFu8jk5wQOHJOBFP9MpSFAL4KB
   A80zcyvmEeLDZ13D+8vhsLOFeQ891MbMj6ZfW3+HYtZ2DeDHh+jDgmIGU
   e8p8r0DLW9x73rgF6VedDVlmfxYNv2EQCUeWVARX16drqCoxlbvnaZIRq
   iIF3tRiXQXkmLw6tracDITeZXabp/8dldlIWLQqVNqLDjKR1e73lFsuDI
   lEZHoLLJA3r1DPv1Kn4Td6+LQzyxcH5T7wfN0/al5ra+/Jv1XWplwtRIF
   A==;
X-IronPort-AV: E=Sophos;i="5.64,513,1559520000"; 
   d="scan'208";a="27964212"
IronPort-PHdr: =?us-ascii?q?9a23=3Apkc1FxD+Q2IKEmkvBaB5UyQJP3N1i/DPJgcQr6?=
 =?us-ascii?q?AfoPdwSP37pMmwAkXT6L1XgUPTWs2DsrQY0rGQ6vurADVQqdbZ6TZeKcYKD0?=
 =?us-ascii?q?dEwewt3CUYSPafDkP6KPO4JwcbJ+9lEGFfwnegLEJOE9z/bVCB6le77DoVBw?=
 =?us-ascii?q?mtfVEtfre9FYHdldm42P6v8JPPfQpImCC9YbRvJxmqsAndrMYbjZZsJ6or1x?=
 =?us-ascii?q?fErHREd/lLyW5rOFmfmwrw6tqq8JNs7ihcpegt+9JcXan/Yq81UaFWADM6Pm?=
 =?us-ascii?q?4v+cblrwPDTQyB5nsdVmUZjB9FCBXb4R/5Q5n8rDL0uvJy1yeGM8L2S6s0WS?=
 =?us-ascii?q?m54KdwVBDokiYHOCUn/2zRl8d9kbhUoBOlpxx43o7UfISYP+dwc6/BYd8XQ3?=
 =?us-ascii?q?dKU91PXCJdHIyzc4oPD/IAPelGqYn9u0AOpga6CQW1Ge/j1iNEinrw0KI0ye?=
 =?us-ascii?q?QhFRzN0hImEdwArX/YqMz5OakWXOywyqTD0DfNYO5M2Trl9YbGbB4hr/GPU7?=
 =?us-ascii?q?x+f8XexksgGB/KgFiLtYzoPSmY2vgRv2WV7edtU/+khW49qwF2pzii3toiip?=
 =?us-ascii?q?XXiYINylDL6yN5y5soK929UkF7ZdqkH4VQtiqHMIZ2Wd4tQ3pztSYmyrwJpZ?=
 =?us-ascii?q?67fC8QxJQh3B7QceaLc4eP4hL9TeucJypzinF9eL+nmhq//ketxvf8W8Wpyl?=
 =?us-ascii?q?pGsCVInsfWunwQ0RHY99KJReFn/ki73DaCzwXT6uZZLk8qjafbMJshwqIolp?=
 =?us-ascii?q?oUrETDAjf6mEXog6+ScUUp4vSo5P79YrXnu5+cLJV4ih3+M6symsy/Bv40Mg?=
 =?us-ascii?q?4SUGiA5euwzrjj/Uz9QLlSj/02lLfWsIzCKMgGqaO0DBVZ34Y+5xqlETur38?=
 =?us-ascii?q?oUkWMaIF5dfRKIlYnpO1XAIPDiCve/hkyhkCx2yPDdJbDhHpXMIWTDkLfmZ7?=
 =?us-ascii?q?p97VVcxxApwdBQ4JJUFKkNIOjvVU/pqNzYEhg5PhSuw+bmFNp91pkRWXiSDa?=
 =?us-ascii?q?CBLKzdqV+I6fguI+mKeoAVoy3wJOM55/7vi385hUESfbOv3ZQJdHC0BOhpI0?=
 =?us-ascii?q?KcYXD0mNcODX8KvhYiTOztkFCCSiBcZ3KzX6I6+zE6B5mrDZnMRo+zmryNxi?=
 =?us-ascii?q?S7EYNMZmBAFF+MFW3kd4KeW/cDcCiSONNukiQYVbi9TI8szQmuuxXny7pjNe?=
 =?us-ascii?q?fU4jcXtY/n1NRs4u3TkhYy9SZqAMiHz26NSGR0zSs0QGoM3at/qFZxgneK0K?=
 =?us-ascii?q?51mLQMD91Y5/pTXjAxAp7Vzup3EPj4RgPHYtqTTlu6BN6hBGd1Bsk8x94Ifl?=
 =?us-ascii?q?ZVBdqvlFbA0jCsDrtTkKaEQNQs+7/Y92D4OsI4znHBzqRnhF4jEeVVMmjzvb?=
 =?us-ascii?q?Jy7wjeAcbylkydk6u7PfAH0DXl6HaIzW3IulpRFgF3T/OWDjgkekLKoIGhtQ?=
 =?us-ascii?q?v5RLi0BOFia1AQxA=3D=3D?=
X-IPAS-Result: =?us-ascii?q?A2AdAQBAzH9d/wHyM5BmHAEBAQQBAQcEAQGBVQUBAQsBg?=
 =?us-ascii?q?W0qbVIBMiqEIY8JTQEBAQEBAQaBNolzjyyBewkBAQEBAQEBAQEjEQECAQGEP?=
 =?us-ascii?q?wKCbyM2Bw4CDAEBAQQBAQEBAQUDAQFshS4MgjopAYJmAQEBAQIBGgkVUQsYA?=
 =?us-ascii?q?gImAgJXBgEMBgIBAYJfPwGBagMJBQ+tNIEyhUyDN4FJgQwoAYt3GHiBB4ERJ?=
 =?us-ascii?q?4JrPoIagXM3gwuCWASMXYkUgTKVR4Isgi6EV411BhuCNXGKe4p4LY1cmwMNJ?=
 =?us-ascii?q?IFYKwgCGAghD4MnCYJFF4dXhmckAzCBBgEBjRoogiwBAQ?=
Received: from tarius.tycho.ncsc.mil ([144.51.242.1])
  by EMSM-GH1-UEA10.NCSC.MIL with ESMTP; 16 Sep 2019 17:58:48 +0000
Received: from moss-pluto.infosec.tycho.ncsc.mil (moss-pluto [192.168.25.131])
        by tarius.tycho.ncsc.mil (8.14.4/8.14.4) with ESMTP id x8GHwkv7027576;
        Mon, 16 Sep 2019 13:58:47 -0400
Subject: Re: [PATCH] selinux-testsuite: Add key and key_socket tests
To:     Richard Haines <richard_c_haines@btinternet.com>,
        selinux@vger.kernel.org, paul@paul-moore.com
References: <20190909131701.29588-1-richard_c_haines@btinternet.com>
From:   Stephen Smalley <sds@tycho.nsa.gov>
Message-ID: <39c10e04-a7cc-bfbf-ae6d-9e27ea332ff2@tycho.nsa.gov>
Date:   Mon, 16 Sep 2019 13:58:46 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190909131701.29588-1-richard_c_haines@btinternet.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On 9/9/19 9:17 AM, Richard Haines wrote:
> Test all permissions associated with the key and key_socket classes.
> 
> Note that kernel 5.3 commit keys: Fix request_key() lack of Link perm
> check on found key ("504b69eb3c95180bc59f1ae9096ad4b10bbbf254")
> added an additional check for link perm on request_key(). The tests
> will support earlier kernels.

I'm not sure why you coupled key and key_socket together; they don't 
have anything to do with each other, and were introduced in very 
different kernel and probably refpolicy releases.  I would recommend 
splitting them.  SECCLASS_KEY and its permission checks were introduced 
in Linux v2.6.18; SECCLASS_KEY_SOCKET was part of the original SELinux 
merge for Linux 2.6.0.

You only appear to be testing self access, not permission checks between 
a process and a keyring created by another process in a different 
security context.

1 test fails for me,
keys/test ................... Failed KEYCTL_SESSION_TO_PARENT: Operation 
not permitted
keys/test ................... 1/13
#   Failed test at keys/test line 38.
# Looks like you failed 1 test of 13.
keys/test ................... Dubious, test returned 1 (wstat 256, 0x100)

> 
> Signed-off-by: Richard Haines <richard_c_haines@btinternet.com>
> ---
>   README.md                   |   3 +-
>   defconfig                   |   8 ++
>   policy/Makefile             |   4 +
>   policy/test_keys.te         | 161 ++++++++++++++++++++++++
>   tests/Makefile              |   4 +
>   tests/keys/.gitignore       |   3 +
>   tests/keys/Makefile         |   8 ++
>   tests/keys/key_sock.c       |  67 ++++++++++
>   tests/keys/keyctl.c         | 241 ++++++++++++++++++++++++++++++++++++
>   tests/keys/keyctl_relabel.c |  93 ++++++++++++++
>   tests/keys/test             |  98 +++++++++++++++
>   11 files changed, 689 insertions(+), 1 deletion(-)
>   create mode 100644 policy/test_keys.te
>   create mode 100644 tests/keys/.gitignore
>   create mode 100644 tests/keys/Makefile
>   create mode 100644 tests/keys/key_sock.c
>   create mode 100644 tests/keys/keyctl.c
>   create mode 100644 tests/keys/keyctl_relabel.c
>   create mode 100755 tests/keys/test
> 
> diff --git a/README.md b/README.md
> index 26784f8..fe72a91 100644
> --- a/README.md
> +++ b/README.md
> @@ -65,7 +65,8 @@ following command:
>   		netlabel_tools \
>   		iptables \
>   		lksctp-tools-devel \
> -		attr
> +		attr \
> +		keyutils-libs-devel
>   
>   The testsuite requires a pre-existing base policy configuration of SELinux,
>   using either the old example policy or the reference policy as the baseline.
> diff --git a/defconfig b/defconfig
> index d7f0ea5..c00e291 100644
> --- a/defconfig
> +++ b/defconfig
> @@ -62,3 +62,11 @@ CONFIG_ANDROID_BINDER_IPC=y
>   # This will configure the Dynamically Allocated Binder Devices added
>   # to 5.0+ kernels:
>   CONFIG_ANDROID_BINDERFS=y
> +
> +# Key implementations.
> +# These are enabled to test the key and key_socket controls in
> +# tests/keys; they are not required for SELinux operation itself.
> +CONFIG_KEYS=y
> +CONFIG_KEYS_COMPAT=y
> +CONFIG_KEY_DH_OPERATIONS=y
> +CONFIG_NET_KEY=m
> diff --git a/policy/Makefile b/policy/Makefile
> index 305b572..9258a93 100644
> --- a/policy/Makefile
> +++ b/policy/Makefile
> @@ -71,6 +71,10 @@ ifeq ($(shell grep -q corenet_sctp_bind_all_nodes $(POLDEV)/include/kernel/coren
>   TARGETS += test_sctp.te
>   endif
>   
> +ifeq ($(shell grep -q key_socket $(POLDEV)/include/support/all_perms.spt && echo true),true)
> +TARGETS += test_keys.te
> +endif
> +
>   ifeq (x$(DISTRO),$(filter x$(DISTRO),xRHEL4 xRHEL5 xRHEL6))
>   TARGETS:=$(filter-out test_overlayfs.te test_mqueue.te, $(TARGETS))
>   endif
> diff --git a/policy/test_keys.te b/policy/test_keys.te
> new file mode 100644
> index 0000000..9c65ec8
> --- /dev/null
> +++ b/policy/test_keys.te
> @@ -0,0 +1,161 @@
> +#
> +################# KEY selinux-testsuite policy module ######################
> +#
> +attribute keydomain;
> +
> +#
> +############################## Define Macro ################################
> +#
> +# Do not use domain_type() macro as it has allow 'key { link search }'
> +# in base module so 'allow domain self:key ~{ link search };' will not work
> +# here. Add these instead to allow key perms to be controlled by this module:
> +#
> +define(`key_domain_type',`
> +	allow $1 proc_t:dir { search };
> +	allow $1 proc_t:lnk_file { read };
> +	allow $1 self:dir { search };
> +	allow $1 self:file { open read write };
> +')
> +
> +#
> +####################### Main key class tests #####################
> +#
> +type test_key_t;
> +key_domain_type(test_key_t)
> +unconfined_runs_test(test_key_t)
> +typeattribute test_key_t testdomain;
> +typeattribute test_key_t keydomain;
> +
> +allow test_key_t self:process { setkeycreate };
> +allow test_key_t self:key { create write search read view link setattr };
> +
> +# Set new context on a keyring:
> +type test_newcon_key_t;
> +key_domain_type(test_newcon_key_t)
> +unconfined_runs_test(test_newcon_key_t)
> +typeattribute test_newcon_key_t testdomain;
> +typeattribute test_newcon_key_t keydomain;
> +
> +allow test_key_t test_newcon_key_t:key { create write search view };
> +
> +################# Deny process { setkeycreate } #######################
> +type test_no_setkeycreate_t;
> +key_domain_type(test_no_setkeycreate_t)
> +unconfined_runs_test(test_no_setkeycreate_t)
> +typeattribute test_no_setkeycreate_t testdomain;
> +typeattribute test_no_setkeycreate_t keydomain;
> +
> +###################### Deny key { create } ###########################
> +type test_key_no_create_t;
> +key_domain_type(test_key_no_create_t)
> +unconfined_runs_test(test_key_no_create_t)
> +typeattribute test_key_no_create_t testdomain;
> +typeattribute test_key_no_create_t keydomain;
> +
> +allow test_key_no_create_t self:process { setkeycreate };
> +allow test_key_no_create_t self:key { write search read view link setattr };
> +
> +###################### Deny key { write } ###########################
> +type test_key_no_write_t;
> +key_domain_type(test_key_no_write_t)
> +unconfined_runs_test(test_key_no_write_t)
> +typeattribute test_key_no_write_t testdomain;
> +typeattribute test_key_no_write_t keydomain;
> +
> +allow test_key_no_write_t self:process { setkeycreate };
> +allow test_key_no_write_t self:key { create search read view link setattr };
> +
> +###################### Deny key { search } ###########################
> +type test_key_no_search_t;
> +key_domain_type(test_key_no_search_t)
> +unconfined_runs_test(test_key_no_search_t)
> +typeattribute test_key_no_search_t testdomain;
> +typeattribute test_key_no_search_t keydomain;
> +
> +allow test_key_no_search_t self:process { setkeycreate };
> +allow test_key_no_search_t self:key { create write read view link setattr };
> +
> +###################### Deny key { view } ###########################
> +type test_key_no_view_t;
> +key_domain_type(test_key_no_view_t)
> +unconfined_runs_test(test_key_no_view_t)
> +typeattribute test_key_no_view_t testdomain;
> +typeattribute test_key_no_view_t keydomain;
> +
> +allow test_key_no_view_t self:process { setkeycreate };
> +allow test_key_no_view_t self:key { create write search read link setattr };
> +
> +###################### Deny key { read } ###########################
> +type test_key_no_read_t;
> +key_domain_type(test_key_no_read_t)
> +unconfined_runs_test(test_key_no_read_t)
> +typeattribute test_key_no_read_t testdomain;
> +typeattribute test_key_no_read_t keydomain;
> +
> +allow test_key_no_read_t self:process { setkeycreate };
> +allow test_key_no_read_t self:key { create write search view link setattr };
> +
> +###################### Deny key { link } ###########################
> +type test_key_no_link_t;
> +key_domain_type(test_key_no_link_t)
> +unconfined_runs_test(test_key_no_link_t)
> +typeattribute test_key_no_link_t testdomain;
> +typeattribute test_key_no_link_t keydomain;
> +
> +allow test_key_no_link_t self:process { setkeycreate };
> +allow test_key_no_link_t self:key { create write search read view setattr };
> +
> +###################### Deny key { setattr } ###########################
> +type test_key_no_setattr_t;
> +key_domain_type(test_key_no_setattr_t)
> +unconfined_runs_test(test_key_no_setattr_t)
> +typeattribute test_key_no_setattr_t testdomain;
> +typeattribute test_key_no_setattr_t keydomain;
> +
> +allow test_key_no_setattr_t self:process { setkeycreate };
> +allow test_key_no_setattr_t self:key { create write search read view link };
> +
> +#
> +######################## Test key_socket class ###########################
> +#
> +type test_key_sock_t;
> +domain_type(test_key_sock_t)
> +unconfined_runs_test(test_key_sock_t)
> +typeattribute test_key_sock_t testdomain;
> +typeattribute test_key_sock_t keydomain;
> +
> +# key_socket rules:
> +allow test_key_sock_t self:rawip_socket { create };
> +allow test_key_sock_t self:capability { net_admin };
> +allow test_key_sock_t self:key_socket { create write };
> +# For CONFIG_NET_KEY=m
> +allow test_key_sock_t kernel_t:system { module_request };
> +
> +################## Deny capability { net_admin } ##########################
> +type test_key_sock_no_net_admin_t;
> +domain_type(test_key_sock_no_net_admin_t)
> +unconfined_runs_test(test_key_sock_no_net_admin_t)
> +typeattribute test_key_sock_no_net_admin_t testdomain;
> +typeattribute test_key_sock_no_net_admin_t keydomain;
> +
> +# key_socket rules:
> +allow test_key_sock_no_net_admin_t self:rawip_socket { create };
> +allow test_key_sock_no_net_admin_t self:key_socket { create write };
> +
> +####################### Deny key_socket { create } ##########################
> +type test_key_sock_no_create_t;
> +domain_type(test_key_sock_no_create_t)
> +unconfined_runs_test(test_key_sock_no_create_t)
> +typeattribute test_key_sock_no_create_t testdomain;
> +typeattribute test_key_sock_no_create_t keydomain;
> +
> +# key_socket rules:
> +allow test_key_sock_no_create_t self:rawip_socket { create };
> +allow test_key_sock_no_create_t self:capability { net_admin };
> +allow test_key_sock_no_create_t self:key_socket { write };
> +
> +#
> +########### Allow these domains to be entered from sysadm domain ############
> +#
> +miscfiles_domain_entry_test_files(keydomain)
> +userdom_sysadm_entry_spec_domtrans_to(keydomain)
> diff --git a/tests/Makefile b/tests/Makefile
> index 63aa325..d1dbf38 100644
> --- a/tests/Makefile
> +++ b/tests/Makefile
> @@ -42,6 +42,10 @@ ifeq ($(shell grep -q binder $(POLDEV)/include/support/all_perms.spt && test -e
>   SUBDIRS += binder
>   endif
>   
> +ifeq ($(shell grep -q key_socket $(POLDEV)/include/support/all_perms.spt && test -e $(INCLUDEDIR)/keyutils.h && echo true),true)
> +SUBDIRS += keys
> +endif
> +
>   ifeq ($(shell grep "^SELINUX_INFINIBAND_ENDPORT_TEST=" infiniband_endport/ibendport_test.conf | cut -d'=' -f 2),1)
>   SUBDIRS += infiniband_endport
>   endif
> diff --git a/tests/keys/.gitignore b/tests/keys/.gitignore
> new file mode 100644
> index 0000000..4a0a48d
> --- /dev/null
> +++ b/tests/keys/.gitignore
> @@ -0,0 +1,3 @@
> +keyctl
> +keyctl_relabel
> +key_sock
> diff --git a/tests/keys/Makefile b/tests/keys/Makefile
> new file mode 100644
> index 0000000..3a00df5
> --- /dev/null
> +++ b/tests/keys/Makefile
> @@ -0,0 +1,8 @@
> +TARGETS = keyctl key_sock keyctl_relabel
> +
> +LDLIBS += -lselinux -lkeyutils
> +
> +all: $(TARGETS)
> +
> +clean:
> +	rm -f $(TARGETS)
> diff --git a/tests/keys/key_sock.c b/tests/keys/key_sock.c
> new file mode 100644
> index 0000000..8ac1f45
> --- /dev/null
> +++ b/tests/keys/key_sock.c
> @@ -0,0 +1,67 @@
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <string.h>
> +#include <unistd.h>
> +#include <errno.h>
> +#include <stdbool.h>
> +#include <sys/socket.h>
> +#include <linux/pfkeyv2.h>
> +#include <selinux/selinux.h>
> +
> +static void usage(char *progname)
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
> +
> +	while ((opt = getopt(argc, argv, "v")) != -1) {
> +		switch (opt) {
> +		case 'v':
> +			verbose = true;
> +			break;
> +		default:
> +			usage(argv[0]);
> +		}
> +	}
> +
> +	result = getcon(&context);
> +	if (result < 0) {
> +		fprintf(stderr, "Failed to obtain process context\n");
> +		exit(-1);
> +	}
> +	if (verbose)
> +		printf("Process context: %s\n", context);
> +
> +	sock = socket(PF_KEY, SOCK_RAW, PF_KEY_V2);
> +	if (sock < 0) {
> +		fprintf(stderr, "Failed to open PF_KEY socket: %s\n",
> +			strerror(errno));
> +		exit(errno);
> +	}
> +	if (verbose)
> +		printf("Opened PF_KEY socket\n");
> +
> +	/* Write nothing to socket for test, expect EMSGSIZE error */
> +	result = write(sock, NULL, 0);
> +	if (result < 0 && errno == EMSGSIZE) {
> +		result = 0;
> +		if (verbose)
> +			printf("Written to PF_KEY socket\n");
> +	} else if (result < 0 && errno != EMSGSIZE) {
> +		result = -1;
> +		fprintf(stderr, "Failed write to PF_KEY socket: %s\n",
> +			strerror(errno));
> +	}
> +
> +	close(sock);
> +	return result;
> +}
> diff --git a/tests/keys/keyctl.c b/tests/keys/keyctl.c
> new file mode 100644
> index 0000000..6d85be7
> --- /dev/null
> +++ b/tests/keys/keyctl.c
> @@ -0,0 +1,241 @@
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <string.h>
> +#include <unistd.h>
> +#include <errno.h>
> +#include <stdbool.h>
> +#include <keyutils.h>
> +#include <selinux/selinux.h>
> +
> +/* This is used as the payload for each add_key() */
> +static const char payload[] =
> +	" -----BEGIN PUBLIC KEY-----\nMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDN4FHsPjlJf03r9KfNt1Ma9/D6\nQDEiR/cfhZrNUPgHRrC+E4dj52VJSonPFJ6HaLlUi5pZq2t1LqPNrMfFKCNn12m+\nWw4aduBJM7u1RUPSNxrlfDAJZkdtNALOO/ds3U93hZrxOYNetzbnjILDu5JT1nbI\n4aC60SkdlCw1TxmvXwIDAQAB\n-----END PUBLIC KEY-----\n";
> +
> +static void usage(char *progname)
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
> +	int opt, result;
> +	char *context, *keycreate_con;
> +	char r_con[256];
> +	bool verbose = false;
> +	key_serial_t retrieved, search, link, compute, newring,
> +		     private, prime, base, test_key;
> +	struct keyctl_dh_params params;
> +
> +	while ((opt = getopt(argc, argv, "v")) != -1) {
> +		switch (opt) {
> +		case 'v':
> +			verbose = true;
> +			break;
> +		default:
> +			usage(argv[0]);
> +		}
> +	}
> +
> +	result = getcon(&context);
> +	if (result < 0) {
> +		fprintf(stderr, "Failed to obtain process context\n");
> +		exit(1);
> +	}
> +	if (verbose)
> +		printf("Process context: %s\n", context);
> +
> +	result = getkeycreatecon(&keycreate_con);
> +	if (result < 0) {
> +		fprintf(stderr, "Failed to obtain keycreate context\n");
> +		exit(2);
> +	}
> +	if (verbose)
> +		printf("Current keycreate context: %s\n", keycreate_con);
> +	free(keycreate_con);
> +
> +	/* Set context requires process { setkeycreate } and key { create } */
> +	result = setkeycreatecon(context);
> +	if (result < 0) {
> +		fprintf(stderr, "Failed setkeycreatecon(): %s\n",
> +			strerror(errno));
> +		exit(3);
> +	}
> +	if (verbose)
> +		printf("Set keycreate context: %s\n", context);
> +	free(context);
> +
> +	result = getkeycreatecon(&keycreate_con);
> +	if (result < 0) {
> +		fprintf(stderr, "Failed to obtain keycreate context\n");
> +		exit(4);
> +	}
> +	if (verbose)
> +		printf("New keycreate context: %s\n", keycreate_con);
> +	free(keycreate_con);
> +
> +	/*
> +	 * Add three keys as these will be required by the
> +	 * keyctl(KEYCTL_DH_COMPUTE, ..) function.
> +	 * These require key { create write } permissions.
> +	 */
> +	private = add_key("user", "private", payload, strlen(payload),
> +			  KEY_SPEC_PROCESS_KEYRING);
> +	if (private < 0) {
> +		fprintf(stderr, "Failed add_key(private): %s\n",
> +			strerror(errno));
> +		exit(5);
> +	}
> +
> +	prime = add_key("user", "prime", payload, strlen(payload),
> +			KEY_SPEC_PROCESS_KEYRING);
> +	if (prime < 0) {
> +		fprintf(stderr, "Failed add_key(prime): %s\n",
> +			strerror(errno));
> +		exit(6);
> +	}
> +
> +	base = add_key("user", "base", payload, strlen(payload),
> +		       KEY_SPEC_PROCESS_KEYRING);
> +	if (base < 0) {
> +		fprintf(stderr, "Failed add_key(base): %s\n",
> +			strerror(errno));
> +		exit(7);
> +	}
> +
> +	if (verbose) {
> +		printf("Private key ID: 0x%x\n", private);
> +		printf("Prime key ID:   0x%x\n", prime);
> +		printf("Base key ID:    0x%x\n", base);
> +	}
> +
> +	/* Requires key { search }. From kernel 5.3 also requires { link } */
> +	retrieved = request_key("user", "private", NULL,
> +				KEY_SPEC_PROCESS_KEYRING);
> +	if (retrieved < 0) {
> +		fprintf(stderr, "Failed to request 'private' key: %s\n",
> +			strerror(errno));
> +		exit(8);
> +	}
> +
> +	/* Requires key { search } */
> +	search = keyctl(KEYCTL_SEARCH, KEY_SPEC_PROCESS_KEYRING, "user",
> +			"base", 0);
> +	if (search < 0) {
> +		fprintf(stderr, "Failed to find 'base' key: %s\n",
> +			strerror(errno));
> +		exit(9);
> +	}
> +
> +	/* Requires key { view } */
> +	result = keyctl(KEYCTL_GET_SECURITY, search, r_con, sizeof(r_con));
> +	if (result < 0) {
> +		fprintf(stderr, "Failed to obtain key context: %s\n",
> +			strerror(errno));
> +		exit(10);
> +	}
> +
> +	if (verbose) {
> +		printf("Requested 'private' key ID: 0x%x\n", retrieved);
> +		printf("Searched 'base' key ID:     0x%x\n", search);
> +		printf("Searched 'base' key context:\n\t%s\n", r_con);
> +	}
> +
> +	/* Compute DH key, only obtain the length for test, not the key. */
> +	params.priv = private;
> +	params.prime = prime;
> +	params.base = base;
> +
> +	/* Requires key { create read write } */
> +	compute = keyctl(KEYCTL_DH_COMPUTE, &params, NULL, 0, 0);
> +	if (compute < 0) {
> +		fprintf(stderr, "Failed KEYCTL_DH_COMPUTE: %s\n",
> +			strerror(errno));
> +		exit(11);
> +	}
> +	if (verbose)
> +		printf("KEYCTL_DH_COMPUTE key ID size: %d\n", compute);
> +
> +	/* To test key { link }, need to generate a new keyring ID first */
> +	newring = add_key("keyring", "my-keyring", NULL, 0,
> +			  KEY_SPEC_THREAD_KEYRING);
> +	if (newring < 0) {
> +		fprintf(stderr, "Failed to add new keyring: %s\n",
> +			strerror(errno));
> +		exit(12);
> +	}
> +	if (verbose)
> +		printf("New keyring ID: 0x%x\n", newring);
> +
> +	/* Requires key { write link } */
> +	link = keyctl(KEYCTL_LINK, base, newring);
> +	if (link < 0) {
> +		fprintf(stderr, "Failed KEYCTL_LINK: %s\n",
> +			strerror(errno));
> +		exit(13);
> +	}
> +	if (verbose)
> +		printf("Link key ID:    0x%x\n", newring);
> +
> +	/* Requires key { setattr } */
> +	link = keyctl(KEYCTL_RESTRICT_KEYRING, newring, NULL, NULL);
> +	if (link < 0) {
> +		fprintf(stderr, "Failed KEYCTL_RESTRICT_KEYRING: %s\n",
> +			strerror(errno));
> +		exit(14);
> +	}
> +	if (verbose)
> +		printf("Restricted keyring\n");
> +
> +	/* Requires key { search } from 5.X key { inval } */
> +	test_key = keyctl(KEYCTL_INVALIDATE, private);
> +	if (test_key < 0) {
> +		fprintf(stderr, "Failed KEYCTL_INVALIDATE(private): %s\n",
> +			strerror(errno));
> +		exit(15);
> +	}
> +	if (verbose)
> +		printf("Invalidated 'private' key\n");
> +
> +	/* Requires key { write setattr } from 5.X key { revoke } */
> +	test_key = keyctl(KEYCTL_REVOKE, prime);
> +	if (test_key < 0) {
> +		fprintf(stderr, "Failed KEYCTL_REVOKE(prime): %s\n",
> +			strerror(errno));
> +		exit(16);
> +	}
> +	if (verbose)
> +		printf("Revoked 'prime' key\n");
> +
> +	/* Requires key { write } from 5.X key { clear } */
> +	test_key = keyctl(KEYCTL_CLEAR, newring);
> +	if (test_key < 0) {
> +		fprintf(stderr, "Failed KEYCTL_CLEAR(newring): %s\n",
> +			strerror(errno));
> +		exit(17);
> +	}
> +	if (verbose)
> +		printf("Cleared 'newring' keyring\n");
> +
> +	/* To test key { join }, need to join session first */
> +	test_key = keyctl(KEYCTL_JOIN_SESSION_KEYRING, "user");
> +	if (test_key < 0) {
> +		fprintf(stderr, "Failed KEYCTL_JOIN_SESSION_KEYRING,: %s\n",
> +			strerror(errno));
> +		exit(18);
> +	}
> +	/* Requires key { link } from 5.X key { join } */
> +	test_key = keyctl(KEYCTL_SESSION_TO_PARENT);
> +	if (test_key < 0) {
> +		fprintf(stderr, "Failed KEYCTL_SESSION_TO_PARENT: %s\n",
> +			strerror(errno));
> +		exit(19);
> +	}
> +	if (verbose)
> +		printf("Joined session to parent\n");
> +
> +	return 0;
> +}
> diff --git a/tests/keys/keyctl_relabel.c b/tests/keys/keyctl_relabel.c
> new file mode 100644
> index 0000000..0276c7a
> --- /dev/null
> +++ b/tests/keys/keyctl_relabel.c
> @@ -0,0 +1,93 @@
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <string.h>
> +#include <unistd.h>
> +#include <errno.h>
> +#include <stdbool.h>
> +#include <keyutils.h>
> +#include <selinux/selinux.h>
> +
> +static void usage(char *progname)
> +{
> +	fprintf(stderr,
> +		"usage:  %s [-v] newcon\n"
> +		"Where:\n\t"
> +		"-v      Print information.\n\t"
> +		"newcon  New keyring context.\n", progname);
> +	exit(-1);
> +}
> +
> +int main(int argc, char *argv[])
> +{
> +	int opt, result;
> +	char *context, *keycreate_con;
> +	char r_con[256];
> +	bool verbose = false;
> +	key_serial_t newring;
> +
> +	while ((opt = getopt(argc, argv, "v")) != -1) {
> +		switch (opt) {
> +		case 'v':
> +			verbose = true;
> +			break;
> +		default:
> +			usage(argv[0]);
> +		}
> +	}
> +
> +	if (optind >= argc)
> +		usage(argv[0]);
> +
> +	result = getcon(&context);
> +	if (result < 0) {
> +		fprintf(stderr, "Failed to obtain process context\n");
> +		exit(1);
> +	}
> +	if (verbose)
> +		printf("Process context: %s\n", context);
> +	free(context);
> +
> +	result = setkeycreatecon(argv[optind]);
> +	if (result < 0) {
> +		fprintf(stderr, "Failed setkeycreatecon(): %s\n",
> +			strerror(errno));
> +		exit(2);
> +	}
> +
> +	result = getkeycreatecon(&keycreate_con);
> +	if (result < 0) {
> +		fprintf(stderr, "Failed to obtain keycreate context\n");
> +		exit(3);
> +	}
> +	if (verbose)
> +		printf("New keycreate context: %s\n", keycreate_con);
> +	free(keycreate_con);
> +
> +	newring = add_key("keyring", "my-keyring", NULL, 0,
> +			  KEY_SPEC_THREAD_KEYRING);
> +	if (newring < 0) {
> +		fprintf(stderr, "Failed to add new keyring: %s\n",
> +			strerror(errno));
> +		exit(4);
> +	}
> +
> +	result = keyctl(KEYCTL_GET_SECURITY, newring, r_con, sizeof(r_con));
> +	if (result < 0) {
> +		fprintf(stderr, "Failed to obtain key context: %s\n",
> +			strerror(errno));
> +		exit(5);
> +	}
> +
> +	if (strcmp(argv[optind], r_con)) {
> +		fprintf(stderr, "Relabel error - expected: %s got: %s\n",
> +			argv[optind], r_con);
> +		exit(6);
> +	}
> +
> +	if (verbose) {
> +		printf("'my-keyring' key ID: 0x%x\n", newring);
> +		printf("'my-keyring' context:\n\t%s\n", r_con);
> +	}
> +
> +	return 0;
> +}
> diff --git a/tests/keys/test b/tests/keys/test
> new file mode 100755
> index 0000000..4916e7c
> --- /dev/null
> +++ b/tests/keys/test
> @@ -0,0 +1,98 @@
> +#!/usr/bin/perl
> +use Test::More;
> +
> +BEGIN {
> +    $basedir = $0;
> +    $basedir =~ s|(.*)/[^/]*|$1|;
> +
> +    $test_count = 13;
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
> +    # From kernel 5.3 request_key() requires additional check of key { link }
> +    $kvercur = `uname -r`;
> +    chomp($kvercur);
> +    $kverminstream = "5.3";
> +    $test_link_53  = 0;
> +
> +    $result = `$basedir/../kvercmp $kvercur $kverminstream`;
> +    if ( $result >= 0 ) {
> +        $test_link_53 = 1;
> +    }
> +
> +    plan tests => $test_count;
> +}
> +
> +############ Test keyctl #############
> +print "Test key class permissions\n";
> +$result = system "runcon -t test_key_t $basedir/keyctl $v";
> +ok( $result eq 0 );
> +
> +# Deny process { setkeycreate }
> +$result = system "runcon -t test_no_setkeycreate_t $basedir/keyctl $v 2>&1";
> +ok( $result >> 8 eq 3 );
> +
> +# Deny key { create }
> +$result = system "runcon -t test_key_no_create_t $basedir/keyctl $v 2>&1";
> +ok( $result >> 8 eq 3 );
> +
> +# Deny key { write }
> +$result = system "runcon -t test_key_no_write_t $basedir/keyctl $v 2>&1";
> +ok( $result >> 8 eq 5 );
> +
> +# Deny key { search }
> +$result = system "runcon -t test_key_no_search_t $basedir/keyctl $v 2>&1";
> +ok( $result >> 8 eq 8 );
> +
> +# Deny key { view }
> +$result = system "runcon -t test_key_no_view_t $basedir/keyctl $v 2>&1";
> +ok( $result >> 8 eq 10 );
> +
> +# Deny key { read }
> +$result = system "runcon -t test_key_no_read_t $basedir/keyctl $v 2>&1";
> +ok( $result >> 8 eq 11 );
> +
> +# Deny key { link }
> +$result = system "runcon -t test_key_no_link_t $basedir/keyctl $v 2>&1";
> +if ($test_link_53) {
> +    ok( $result >> 8 eq 8 );
> +}
> +else {
> +    ok( $result >> 8 eq 13 );
> +}
> +
> +# Deny key { setattr }
> +$result = system "runcon -t test_key_no_setattr_t $basedir/keyctl $v 2>&1";
> +ok( $result >> 8 eq 14 );
> +
> +########### Change keyring context ##############
> +print "Change keyring context\n";
> +$result = system
> +"runcon -t test_key_t $basedir/keyctl_relabel $v system_u:system_r:test_newcon_key_t:s0";
> +ok( $result eq 0 );
> +
> +############ Test key_socket #############
> +print "Test key_socket class\n";
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
> +exit;
> 

