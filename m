Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 148AB184948
	for <lists+selinux@lfdr.de>; Fri, 13 Mar 2020 15:27:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726551AbgCMO10 (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Fri, 13 Mar 2020 10:27:26 -0400
Received: from mail-qk1-f195.google.com ([209.85.222.195]:37384 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726406AbgCMO10 (ORCPT
        <rfc822;selinux@vger.kernel.org>); Fri, 13 Mar 2020 10:27:26 -0400
Received: by mail-qk1-f195.google.com with SMTP id z25so7870072qkj.4
        for <selinux@vger.kernel.org>; Fri, 13 Mar 2020 07:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=3iADymvBkWK6kf1LDGIc4QMbyppxKgQPV6oobjbBAp0=;
        b=AWyOmIp3uLENv6GVMTHKiSmUqiM5rmrDlhrb6mmp1TEaPG3RKF6vwyc7Pixajtm+h2
         hp6wbb7qWTKsKuGvF94IlVvT+MgoMlU5JXuRKI6+xWecR4vBxzpzGkoyoPVP5FvHd6PM
         YUH8qnytXvfa2nwn3OGS9nTawnV7wXeNG577AgX3ozDcKwtVI3mBQv3vzBgFlo0Hnx83
         ReZ/eV5DsD6ZhYM9WaHhKz3PNp7QGiSQXFed5gVxOdyd+KVPXx91qpIyAjjQ4KPr8QF0
         ul9K1coNpyse8mvtVcfQIPd5CC2i1OLDEGxrE85ihhMtin1xI9BV9BFCJ895WNDoFOqd
         wf6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=3iADymvBkWK6kf1LDGIc4QMbyppxKgQPV6oobjbBAp0=;
        b=ksujnNDea5IVEFHv+mu2EBLaGQvZX89z7BsZkKuvKJwC0vRn2BaAnoYPLfp05rKNTB
         58zfzWMyMYlfq53X6uLCQyGHLi+VUspgNlz6Va8ksZRQa4owfE9EjpA7ao1n8PJNIMHC
         IE0hRvNr00XBA3x+MBm9xnoYgwxfst1d1KR5Ht+JRkQV4Ca+0SSLTXxcZ+zuk+NIKmbk
         wAJn6eBkxwghZeo4S1mDrc0ry4JRJqB5hPw1SLXcBie5KR0IBu/x09yMGqVfVAFv7m+i
         nwcGnuzZ81XRaqhtDxs4ipMhU9a1t6bG7K7j4Dp9VaBJRm0KS4F4PFTLARDReh8gxEX5
         nSgw==
X-Gm-Message-State: ANhLgQ07tNfHzPgMWOhB2VYBP1mGvdByhoQI0GglkoCBkneg9aNDfb3K
        yMbLGtRBTl4uZr5EljVms9Y=
X-Google-Smtp-Source: ADFU+vtdsrUV5J9KzzQNqgzYG4T6gC1DFLt+JJq6h4OkBmhMKru1Y5TeWM/0TqMCsnFq+DQEZCaVkQ==
X-Received: by 2002:a37:5907:: with SMTP id n7mr13313069qkb.227.1584109641348;
        Fri, 13 Mar 2020 07:27:21 -0700 (PDT)
Received: from r21-ubuntu-01.ltsnet.net ([65.127.220.137])
        by smtp.gmail.com with ESMTPSA id a15sm2906139qko.122.2020.03.13.07.27.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2020 07:27:20 -0700 (PDT)
From:   Stephen Smalley <stephen.smalley.work@gmail.com>
To:     paul@paul-moore.com
Cc:     selinux@vger.kernel.org, Stephen Smalley <sds@tycho.nsa.gov>
Subject: [RFC PATCH 2/5] selinux-testsuite: add tests/sandbox/nodir_rx_allow.cil
Date:   Fri, 13 Mar 2020 10:26:52 -0400
Message-Id: <20200313142655.29424-2-stephen.smalley.work@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200313142655.29424-1-stephen.smalley.work@gmail.com>
References: <20200313142655.29424-1-stephen.smalley.work@gmail.com>
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

From: Stephen Smalley <sds@tycho.nsa.gov>

Signed-off-by: Stephen Smalley <sds@tycho.nsa.gov>
---
 tests/sandbox/nodir_rx_allow.cil | 612 +++++++++++++++++++++++++++++++
 1 file changed, 612 insertions(+)
 create mode 100644 tests/sandbox/nodir_rx_allow.cil

diff --git a/tests/sandbox/nodir_rx_allow.cil b/tests/sandbox/nodir_rx_allow.cil
new file mode 100644
index 0000000..cc31660
--- /dev/null
+++ b/tests/sandbox/nodir_rx_allow.cil
@@ -0,0 +1,612 @@
+; This information is NOT compiled into a sandbox policy, it is here just to
+; make the cil compiler happy. For now, we leave it here with dummy information.
+(sid SID)
+(sidorder (SID))
+(user USER)
+(role ROLE)
+(category CAT)
+(categoryorder (CAT))
+(sensitivity SENS)
+(sensitivityorder (SENS))
+(sensitivitycategory SENS (CAT))
+(roletype ROLE test_sandbox_dir_t)
+(userrole USER ROLE)
+(userlevel USER (SENS))
+(userrange USER ((SENS)(SENS (CAT))))
+(sidcontext SID (USER ROLE test_sandbox_dir_t ((SENS)(SENS))))
+
+; type: test_sandbox_nodir_t
+; perms: rx
+; mode: allow
+
+(class security (compute_av compute_create compute_member check_context load_policy compute_relabel compute_user setenforce setbool setsecparam setcheckreqprot read_policy validate_trans))
+(class process (fork transition sigchld sigkill sigstop signull signal ptrace getsched setsched getsession getpgid setpgid getcap setcap share getattr setexec setfscreate noatsecure siginh setrlimit rlimitinh dyntransition setcurrent execmem execstack execheap setkeycreate setsockcreate getrlimit))
+(class system (ipc_info syslog_read syslog_mod syslog_console module_request module_load halt reboot status start stop enable disable reload undefined))
+(class capability ())
+(class filesystem (mount remount unmount getattr relabelfrom relabelto transition associate quotamod quotaget))
+(class file (execute_no_trans entrypoint execmod open audit_access))
+(class dir (add_name remove_name reparent search rmdir open audit_access execmod))
+(class fd (use))
+(class lnk_file (open audit_access execmod))
+(class chr_file (execute_no_trans entrypoint execmod open audit_access))
+(class blk_file (open audit_access execmod))
+(class sock_file (open audit_access execmod))
+(class fifo_file (open audit_access execmod))
+(class socket ())
+(class tcp_socket (connectto newconn acceptfrom node_bind name_connect))
+(class udp_socket (node_bind))
+(class rawip_socket (node_bind))
+(class netif (tcp_recv tcp_send udp_recv udp_send rawip_recv rawip_send dccp_recv dccp_send ingress egress))
+(class netlink_socket ())
+(class packet_socket ())
+(class key_socket ())
+(class unix_stream_socket (connectto newconn acceptfrom))
+(class unix_dgram_socket ())
+(class sem ())
+(class msg (send receive))
+(class msgq (enqueue))
+(class shm (lock))
+(class ipc ())
+(class passwd (passwd chfn chsh rootok crontab))
+(class x_drawable (create destroy read write blend getattr setattr list_child add_child remove_child list_property get_property set_property manage override show hide send receive))
+(class x_screen (getattr setattr hide_cursor show_cursor saver_getattr saver_setattr saver_hide saver_show))
+(class x_gc (create destroy getattr setattr use))
+(class x_font (create destroy getattr add_glyph remove_glyph use))
+(class x_colormap (create destroy read write getattr add_color remove_color install uninstall use))
+(class x_property (create destroy read write append getattr setattr))
+(class x_selection (read write getattr setattr))
+(class x_cursor (create destroy read write getattr setattr use))
+(class x_client (destroy getattr setattr manage))
+(class x_device ())
+(class x_server (getattr setattr record debug grab manage))
+(class x_extension (query use))
+(class netlink_route_socket (nlmsg_read nlmsg_write))
+(class netlink_firewall_socket (nlmsg_read nlmsg_write))
+(class netlink_tcpdiag_socket (nlmsg_read nlmsg_write))
+(class netlink_nflog_socket ())
+(class netlink_xfrm_socket (nlmsg_read nlmsg_write))
+(class netlink_selinux_socket ())
+(class netlink_audit_socket (nlmsg_read nlmsg_write nlmsg_relay nlmsg_readpriv nlmsg_tty_audit))
+(class netlink_ip6fw_socket (nlmsg_read nlmsg_write))
+(class netlink_dnrt_socket ())
+(class dbus (acquire_svc send_msg))
+(class nscd (getpwd getgrp gethost getstat admin shmempwd shmemgrp shmemhost getserv shmemserv getnetgrp shmemnetgrp))
+(class association (sendto recvfrom setcontext polmatch))
+(class netlink_kobject_uevent_socket ())
+(class appletalk_socket ())
+(class packet (send recv relabelto flow_in flow_out forward_in forward_out))
+(class key (view read write search link setattr create))
+(class context (translate contains))
+(class dccp_socket (node_bind name_connect))
+(class memprotect (mmap_zero))
+(class db_database (access install_module load_module get_param set_param))
+(class db_table (select update insert delete lock))
+(class db_procedure (execute entrypoint install))
+(class db_column (select update insert))
+(class db_tuple (relabelfrom relabelto use select update insert delete))
+(class db_blob (read write import export))
+(class peer (recv))
+(class capability2 (epolwakeup))
+(class x_resource (read write))
+(class x_event (send receive))
+(class x_synthetic_event (send receive))
+(class x_application_data (paste paste_after_confirm copy))
+(class kernel_service (use_as_override create_files_as))
+(class tun_socket (attach_queue))
+(class binder (impersonate call set_context_mgr transfer))
+(class netlink_iscsi_socket ())
+(class netlink_fib_lookup_socket ())
+(class netlink_connector_socket ())
+(class netlink_netfilter_socket ())
+(class netlink_generic_socket ())
+(class netlink_scsitransport_socket ())
+(class netlink_rdma_socket ())
+(class netlink_crypto_socket ())
+(class x_pointer ())
+(class infiniband_pkey (access))
+(class infiniband_endport (manage_subnet))
+(class db_schema (search add_name remove_name))
+(class db_view (expand))
+(class db_sequence (get_value next_value set_value))
+(class db_language (implement execute))
+(class service (start stop status reload enable disable))
+(class proxy (read))
+(class cap_userns ())
+(class cap2_userns ())
+(class process2 (nnp_transition nosuid_transition))
+(class sctp_socket (node_bind name_connect association))
+(class icmp_socket (node_bind))
+(class ax25_socket ())
+(class ipx_socket ())
+(class netrom_socket ())
+(class bridge_socket ())
+(class atmpvc_socket ())
+(class x25_socket ())
+(class rose_socket ())
+(class decnet_socket ())
+(class atmsvc_socket ())
+(class rds_socket ())
+(class irda_socket ())
+(class pppox_socket ())
+(class llc_socket ())
+(class ib_socket ())
+(class mpls_socket ())
+(class can_socket ())
+(class tipc_socket ())
+(class bluetooth_socket ())
+(class iucv_socket ())
+(class rxrpc_socket ())
+(class phonet_socket ())
+(class ieee802154_socket ())
+(class caif_socket ())
+(class alg_socket ())
+(class nfc_socket ())
+(class vsock_socket ())
+(class kcm_socket ())
+(class qipcrtr_socket ())
+(class smc_socket ())
+(class bpf (map_create map_read map_write prog_load prog_run))
+(class xdp_socket ())
+(class sandbox (operate load_policy unload_policy list))
+(classorder (security process system capability filesystem file dir fd
+lnk_file chr_file blk_file sock_file fifo_file socket tcp_socket
+udp_socket rawip_socket netif netlink_socket packet_socket key_socket
+unix_stream_socket unix_dgram_socket sem msg msgq shm ipc passwd
+x_drawable x_screen x_gc x_font x_colormap x_property x_selection
+x_cursor x_client x_device x_server x_extension netlink_route_socket
+netlink_firewall_socket netlink_tcpdiag_socket netlink_nflog_socket
+netlink_xfrm_socket netlink_selinux_socket netlink_audit_socket
+netlink_ip6fw_socket netlink_dnrt_socket dbus nscd association
+netlink_kobject_uevent_socket appletalk_socket packet key context
+dccp_socket memprotect db_database db_table db_procedure db_column
+db_tuple db_blob peer capability2 x_resource x_event x_synthetic_event
+x_application_data kernel_service tun_socket binder
+netlink_iscsi_socket netlink_fib_lookup_socket
+netlink_connector_socket netlink_netfilter_socket
+netlink_generic_socket netlink_scsitransport_socket
+netlink_rdma_socket netlink_crypto_socket x_pointer infiniband_pkey
+infiniband_endport db_schema db_view db_sequence db_language service
+proxy cap_userns cap2_userns process2 sctp_socket icmp_socket
+ax25_socket ipx_socket netrom_socket bridge_socket atmpvc_socket
+x25_socket rose_socket decnet_socket atmsvc_socket rds_socket
+irda_socket pppox_socket llc_socket ib_socket mpls_socket can_socket
+tipc_socket bluetooth_socket iucv_socket rxrpc_socket phonet_socket
+ieee802154_socket caif_socket alg_socket nfc_socket vsock_socket
+kcm_socket qipcrtr_socket smc_socket bpf xdp_socket sandbox))
+(classcommon capability cap)
+(classcommon file file)
+(classcommon dir file)
+(classcommon lnk_file file)
+(classcommon chr_file file)
+(classcommon blk_file file)
+(classcommon sock_file file)
+(classcommon fifo_file file)
+(classcommon socket socket)
+(classcommon tcp_socket socket)
+(classcommon udp_socket socket)
+(classcommon rawip_socket socket)
+(classcommon netlink_socket socket)
+(classcommon packet_socket socket)
+(classcommon key_socket socket)
+(classcommon unix_stream_socket socket)
+(classcommon unix_dgram_socket socket)
+(classcommon sem ipc)
+(classcommon msgq ipc)
+(classcommon shm ipc)
+(classcommon ipc ipc)
+(classcommon x_device x_device)
+(classcommon netlink_route_socket socket)
+(classcommon netlink_firewall_socket socket)
+(classcommon netlink_tcpdiag_socket socket)
+(classcommon netlink_nflog_socket socket)
+(classcommon netlink_xfrm_socket socket)
+(classcommon netlink_selinux_socket socket)
+(classcommon netlink_audit_socket socket)
+(classcommon netlink_ip6fw_socket socket)
+(classcommon netlink_dnrt_socket socket)
+(classcommon netlink_kobject_uevent_socket socket)
+(classcommon appletalk_socket socket)
+(classcommon dccp_socket socket)
+(classcommon db_database database)
+(classcommon db_table database)
+(classcommon db_procedure database)
+(classcommon db_column database)
+(classcommon db_blob database)
+(classcommon capability2 cap2)
+(classcommon tun_socket socket)
+(classcommon netlink_iscsi_socket socket)
+(classcommon netlink_fib_lookup_socket socket)
+(classcommon netlink_connector_socket socket)
+(classcommon netlink_netfilter_socket socket)
+(classcommon netlink_generic_socket socket)
+(classcommon netlink_scsitransport_socket socket)
+(classcommon netlink_rdma_socket socket)
+(classcommon netlink_crypto_socket socket)
+(classcommon x_pointer x_device)
+(classcommon db_schema database)
+(classcommon db_view database)
+(classcommon db_sequence database)
+(classcommon db_language database)
+(classcommon cap_userns cap)
+(classcommon cap2_userns cap2)
+(classcommon sctp_socket socket)
+(classcommon icmp_socket socket)
+(classcommon ax25_socket socket)
+(classcommon ipx_socket socket)
+(classcommon netrom_socket socket)
+(classcommon bridge_socket socket)
+(classcommon atmpvc_socket socket)
+(classcommon x25_socket socket)
+(classcommon rose_socket socket)
+(classcommon decnet_socket socket)
+(classcommon atmsvc_socket socket)
+(classcommon rds_socket socket)
+(classcommon irda_socket socket)
+(classcommon pppox_socket socket)
+(classcommon llc_socket socket)
+(classcommon ib_socket socket)
+(classcommon mpls_socket socket)
+(classcommon can_socket socket)
+(classcommon tipc_socket socket)
+(classcommon bluetooth_socket socket)
+(classcommon iucv_socket socket)
+(classcommon rxrpc_socket socket)
+(classcommon phonet_socket socket)
+(classcommon ieee802154_socket socket)
+(classcommon caif_socket socket)
+(classcommon alg_socket socket)
+(classcommon nfc_socket socket)
+(classcommon vsock_socket socket)
+(classcommon kcm_socket socket)
+(classcommon qipcrtr_socket socket)
+(classcommon smc_socket socket)
+(classcommon xdp_socket socket)
+(common cap (chown dac_override dac_read_search fowner fsetid kill setgid setuid setpcap linux_immutable net_bind_service net_broadcast net_admin net_raw ipc_lock ipc_owner sys_module sys_rawio sys_chroot sys_ptrace sys_pacct sys_admin sys_boot sys_nice sys_resource sys_time sys_tty_config mknod lease audit_write audit_control setfcap))
+(common file (ioctl read write create getattr setattr lock relabelfrom relabelto append map unlink link rename execute swapon quotaon mounton))
+(common socket (ioctl read write create getattr setattr lock relabelfrom relabelto append map bind connect listen accept getopt setopt shutdown recvfrom sendto recv_msg send_msg name_bind))
+(common ipc (create destroy getattr setattr read write associate unix_read unix_write))
+(common x_device (getattr setattr use read write getfocus setfocus bell force_cursor freeze grab manage list_property get_property set_property add remove create destroy))
+(common database (create drop getattr setattr relabelfrom relabelto))
+(common cap2 (mac_override mac_admin syslog wake_alarm block_suspend audit_read))
+
+
+
+(type unlabeled_t)
+(type abrt_dump_oops_t)
+(type abrt_helper_exec_t)
+(type abrt_helper_t)
+(type abrt_t)
+(type abrt_var_cache_t)
+(type abrt_var_run_t)
+(type admin_home_t)
+(type afs_cache_t)
+(type afs_t)
+(type base_file_type)
+(type base_ro_file_type)
+(type bin_t)
+(type cpu_online_t)
+(type crond_t)
+(type device_t)
+(type devicekit_power_t)
+(type devtty_t)
+(type domain)
+(type etc_t)
+(type file_type)
+(type fonts_cache_t)
+(type fonts_t)
+(type install_t)
+(type ipsec_spd_t)
+(type kernel_t)
+(type kmsg_device_t)
+(type ld_so_cache_t)
+(type ld_so_t)
+(type lib_t)
+(type livecd_t)
+(type locale_t)
+(type machineid_t)
+(type man_cache_t)
+(type man_t)
+(type mandb_cache_t)
+(type mnt_t)
+(type netlabel_peer_t)
+(type null_device_t)
+(type pidfile)
+(type pkcs11_modules_conf_t)
+(type prelink_exec_t)
+(type proc_t)
+(type puppet_tmp_t)
+(type rkhunter_var_lib_t)
+(type rolekit_t)
+(type root_t)
+(type rpm_log_t)
+(type rpm_script_tmp_t)
+(type rpm_t)
+(type rpm_tmp_t)
+(type security_t)
+(type selinux_config_t)
+(type setrans_t)
+(type setrans_var_run_t)
+(type sosreport_tmp_t)
+(type spc_t)
+(type sshd_t)
+(type sysadm_t)
+(type sysctl_crypto_t)
+(type sysctl_kernel_t)
+(type sysctl_t)
+(type sysctl_vm_overcommit_t)
+(type sysctl_vm_t)
+(type sysfs_t)
+(type system_cronjob_t)
+(type textrel_shlib_t)
+(type tmp_t)
+(type tmpfile)
+(type tmpfs_t)
+(type unconfined_domain_type)
+(type unconfined_t)
+(type urandom_device_t)
+(type usr_t)
+(type var_lib_t)
+(type var_log_t)
+(type var_run_t)
+(type var_t)
+(type vmtools_unconfined_t)
+(type console_device_t)
+(type init_t)
+(type initrc_t)
+(type test_sandbox_dir_t)
+(type test_sandbox_nodir_t)
+(type user_devpts_t)
+(type devpts_t)
+(type home_root_t)
+(type passwd_file_t)
+(type privfd)
+(type ptynode)
+(type random_device_t)
+(type sssd_public_t)
+(type sssd_t)
+(type sssd_var_lib_t)
+(type test_file_t)
+(type tty_device_t)
+(type ttynode)
+(type zero_device_t)
+
+(allow test_sandbox_nodir_t unlabeled_t (association (recvfrom sendto)))
+(allow test_sandbox_nodir_t unlabeled_t (dccp_socket (recvfrom)))
+(allow test_sandbox_nodir_t unlabeled_t (peer (recv)))
+(allow test_sandbox_nodir_t unlabeled_t (rawip_socket (recvfrom)))
+(allow test_sandbox_nodir_t unlabeled_t (tcp_socket (recvfrom)))
+(allow test_sandbox_nodir_t unlabeled_t (udp_socket (recvfrom)))
+(allow test_sandbox_nodir_t abrt_dump_oops_t (process (sigchld)))
+(allow test_sandbox_nodir_t abrt_helper_exec_t (file (execute execute_no_trans getattr ioctl map open read)))
+(allow test_sandbox_nodir_t abrt_helper_t (process (transition)))
+(allow test_sandbox_nodir_t abrt_t (dir (getattr ioctl lock open read search)))
+(allow test_sandbox_nodir_t abrt_t (fifo_file (append getattr ioctl lock read write)))
+(allow test_sandbox_nodir_t abrt_t (file (getattr ioctl lock open read)))
+(allow test_sandbox_nodir_t abrt_t (lnk_file (getattr read)))
+(allow test_sandbox_nodir_t abrt_t (process (getattr signull)))
+(allow test_sandbox_nodir_t abrt_var_cache_t (file (append getattr)))
+(allow test_sandbox_nodir_t abrt_var_run_t (dir (getattr open search)))
+(allow test_sandbox_nodir_t abrt_var_run_t (file (getattr ioctl lock open read)))
+(allow test_sandbox_nodir_t admin_home_t (dir (getattr open search)))
+(allow test_sandbox_nodir_t admin_home_t (lnk_file (getattr read)))
+(allow test_sandbox_nodir_t afs_cache_t (file (read write)))
+(allow test_sandbox_nodir_t afs_t (udp_socket (read write)))
+(allow test_sandbox_nodir_t base_file_type (dir (getattr open search)))
+(allow test_sandbox_nodir_t base_ro_file_type (dir (getattr ioctl lock open read search)))
+(allow test_sandbox_nodir_t base_ro_file_type (file (getattr ioctl lock open read)))
+(allow test_sandbox_nodir_t base_ro_file_type (lnk_file (getattr read)))
+(allow test_sandbox_nodir_t bin_t (dir (getattr open search)))
+(allow test_sandbox_nodir_t bin_t (lnk_file (getattr read)))
+(allow test_sandbox_nodir_t bin_t (file (entrypoint)))
+(allow test_sandbox_nodir_t cpu_online_t (dir (getattr open search)))
+(allow test_sandbox_nodir_t cpu_online_t (file (getattr ioctl lock open read)))
+(allow test_sandbox_nodir_t crond_t (fifo_file (append getattr ioctl lock read write)))
+(allow test_sandbox_nodir_t device_t (dir (getattr ioctl lock open read search)))
+(allow test_sandbox_nodir_t device_t (dir (getattr open search)))
+(allow test_sandbox_nodir_t device_t (dir (getattr open search)))
+(allow test_sandbox_nodir_t device_t (lnk_file (getattr read)))
+(allow test_sandbox_nodir_t devicekit_power_t (dbus (send_msg)))
+(allow test_sandbox_nodir_t devtty_t (chr_file (append getattr ioctl lock open read write)))
+(allow test_sandbox_nodir_t domain (fd (use)))
+(allow test_sandbox_nodir_t domain (key (link search)))
+(allow test_sandbox_nodir_t etc_t (dir (getattr ioctl lock open read search)))
+(allow test_sandbox_nodir_t etc_t (lnk_file (getattr read)))
+(allow test_sandbox_nodir_t file_type (blk_file (map)))
+(allow test_sandbox_nodir_t file_type (chr_file (map)))
+(allow test_sandbox_nodir_t file_type (file (map)))
+(allow test_sandbox_nodir_t file_type (lnk_file (map)))
+(allow test_sandbox_nodir_t fonts_cache_t (dir (getattr ioctl lock open read search)))
+(allow test_sandbox_nodir_t fonts_cache_t (file (getattr ioctl lock map open read)))
+(allow test_sandbox_nodir_t fonts_cache_t (lnk_file (getattr read)))
+(allow test_sandbox_nodir_t fonts_t (dir (getattr ioctl lock open read search)))
+(allow test_sandbox_nodir_t fonts_t (file (getattr ioctl lock map open read)))
+(allow test_sandbox_nodir_t fonts_t (lnk_file (getattr read)))
+(allow test_sandbox_nodir_t init_t (process (sigchld signull)))
+(allow test_sandbox_nodir_t install_t (process (sigchld)))
+(allow test_sandbox_nodir_t ipsec_spd_t (association (polmatch)))
+(allow test_sandbox_nodir_t kernel_t (system (module_request)))
+(allow test_sandbox_nodir_t kmsg_device_t (chr_file (append getattr ioctl lock open write)))
+(allow test_sandbox_nodir_t ld_so_cache_t (file (getattr ioctl lock map open read)))
+(allow test_sandbox_nodir_t ld_so_t (file (execute getattr ioctl map open read)))
+(allow test_sandbox_nodir_t ld_so_t (lnk_file (getattr read)))
+(allow test_sandbox_nodir_t lib_t (dir (getattr ioctl lock open read search)))
+(allow test_sandbox_nodir_t lib_t (file (execute getattr ioctl lock map open read)))
+(allow test_sandbox_nodir_t lib_t (lnk_file (getattr read)))
+(allow test_sandbox_nodir_t livecd_t (process (sigchld)))
+(allow test_sandbox_nodir_t locale_t (dir (getattr ioctl lock open read search)))
+(allow test_sandbox_nodir_t locale_t (file (getattr ioctl lock map open read)))
+(allow test_sandbox_nodir_t locale_t (lnk_file (getattr read)))
+(allow test_sandbox_nodir_t machineid_t (file (getattr ioctl lock open read)))
+(allow test_sandbox_nodir_t man_cache_t (dir (getattr ioctl lock open read search)))
+(allow test_sandbox_nodir_t man_cache_t (file (getattr ioctl lock open read)))
+(allow test_sandbox_nodir_t man_cache_t (lnk_file (getattr read)))
+(allow test_sandbox_nodir_t man_t (dir (getattr ioctl lock open read search)))
+(allow test_sandbox_nodir_t man_t (file (getattr ioctl lock open read)))
+(allow test_sandbox_nodir_t man_t (lnk_file (getattr read)))
+(allow test_sandbox_nodir_t mandb_cache_t (dir (getattr open search)))
+(allow test_sandbox_nodir_t mandb_cache_t (file (getattr ioctl lock open read)))
+(allow test_sandbox_nodir_t mnt_t (dir (getattr open search)))
+(allow test_sandbox_nodir_t netlabel_peer_t (peer (recv)))
+(allow test_sandbox_nodir_t netlabel_peer_t (tcp_socket (recvfrom)))
+(allow test_sandbox_nodir_t null_device_t (chr_file (append getattr ioctl lock open read write)))
+(allow test_sandbox_nodir_t pidfile (sock_file (append getattr open write)))
+(allow test_sandbox_nodir_t pkcs11_modules_conf_t (dir (getattr ioctl lock open read search)))
+(allow test_sandbox_nodir_t pkcs11_modules_conf_t (file (getattr ioctl lock map open read)))
+(allow test_sandbox_nodir_t prelink_exec_t (file (execute execute_no_trans getattr ioctl lock map open read)))
+(allow test_sandbox_nodir_t proc_t (dir (getattr open search)))
+(allow test_sandbox_nodir_t proc_t (dir (getattr open search)))
+(allow test_sandbox_nodir_t proc_t (dir (getattr open search)))
+(allow test_sandbox_nodir_t proc_t (lnk_file (getattr read)))
+(allow test_sandbox_nodir_t puppet_tmp_t (file (append getattr ioctl lock read write)))
+(allow test_sandbox_nodir_t rkhunter_var_lib_t (dir (getattr open search)))
+(allow test_sandbox_nodir_t rkhunter_var_lib_t (file (append getattr ioctl lock open)))
+(allow test_sandbox_nodir_t rolekit_t (dbus (send_msg)))
+(allow test_sandbox_nodir_t root_t (dir (getattr ioctl lock open read search)))
+(allow test_sandbox_nodir_t root_t (lnk_file (getattr ioctl lock read)))
+(allow test_sandbox_nodir_t rpm_log_t (dir (getattr open search)))
+(allow test_sandbox_nodir_t rpm_script_tmp_t (dir (getattr open search)))
+(allow test_sandbox_nodir_t rpm_script_tmp_t (fifo_file (append getattr ioctl lock read write)))
+(allow test_sandbox_nodir_t rpm_script_tmp_t (file (getattr ioctl lock open read)))
+(allow test_sandbox_nodir_t rpm_script_tmp_t (lnk_file (getattr read)))
+(allow test_sandbox_nodir_t rpm_t (fd (use)))
+(allow test_sandbox_nodir_t rpm_t (fifo_file (getattr ioctl lock open read)))
+(allow test_sandbox_nodir_t rpm_tmp_t (file (append getattr)))
+(allow test_sandbox_nodir_t security_t (dir (getattr open search)))
+(allow test_sandbox_nodir_t security_t (filesystem (getattr)))
+(allow test_sandbox_nodir_t security_t (lnk_file (getattr read)))
+(allow test_sandbox_nodir_t selinux_config_t (dir (getattr open search)))
+(allow test_sandbox_nodir_t setrans_t (context (translate)))
+(allow test_sandbox_nodir_t setrans_t (unix_stream_socket (connectto)))
+(allow test_sandbox_nodir_t setrans_var_run_t (dir (getattr open search)))
+(allow test_sandbox_nodir_t setrans_var_run_t (sock_file (append getattr open write)))
+(allow test_sandbox_nodir_t sosreport_tmp_t (dir (getattr open search)))
+(allow test_sandbox_nodir_t sosreport_tmp_t (file (append getattr ioctl lock open)))
+(allow test_sandbox_nodir_t spc_t (process (sigchld)))
+(allow test_sandbox_nodir_t spc_t (unix_stream_socket (connectto)))
+(allow test_sandbox_nodir_t sshd_t (fifo_file (append getattr ioctl lock read write)))
+(allow test_sandbox_nodir_t sysadm_t (process (sigchld)))
+(allow test_sandbox_nodir_t sysctl_crypto_t (dir (getattr ioctl lock open read search)))
+(allow test_sandbox_nodir_t sysctl_crypto_t (file (getattr ioctl lock open read)))
+(allow test_sandbox_nodir_t sysctl_kernel_t (dir (getattr ioctl lock open read search)))
+(allow test_sandbox_nodir_t sysctl_kernel_t (dir (getattr open search)))
+(allow test_sandbox_nodir_t sysctl_kernel_t (file (getattr ioctl lock open read)))
+(allow test_sandbox_nodir_t sysctl_t (dir (getattr open search)))
+(allow test_sandbox_nodir_t sysctl_t (dir (getattr open search)))
+(allow test_sandbox_nodir_t sysctl_t (dir (getattr open search)))
+(allow test_sandbox_nodir_t sysctl_vm_overcommit_t (dir (getattr open search)))
+(allow test_sandbox_nodir_t sysctl_vm_overcommit_t (file (getattr ioctl lock open read)))
+(allow test_sandbox_nodir_t sysctl_vm_t (dir (getattr open search)))
+(allow test_sandbox_nodir_t sysfs_t (dir (getattr open search)))
+(allow test_sandbox_nodir_t system_cronjob_t (fifo_file (append getattr ioctl lock read write)))
+(allow test_sandbox_nodir_t textrel_shlib_t (dir (getattr ioctl lock open read search)))
+(allow test_sandbox_nodir_t textrel_shlib_t (file (execmod execute getattr ioctl map open read)))
+(allow test_sandbox_nodir_t textrel_shlib_t (lnk_file (getattr read)))
+(allow test_sandbox_nodir_t tmp_t (dir (getattr open search)))
+(allow test_sandbox_nodir_t tmp_t (lnk_file (getattr read)))
+(allow test_sandbox_nodir_t tmpfile (file (append getattr ioctl lock open read)))
+(allow test_sandbox_nodir_t tmpfs_t (dir (getattr open search)))
+(allow test_sandbox_nodir_t unconfined_domain_type (association (recvfrom)))
+(allow test_sandbox_nodir_t unconfined_domain_type (peer (recv)))
+(allow test_sandbox_nodir_t unconfined_domain_type (tcp_socket (recvfrom)))
+(allow test_sandbox_nodir_t unconfined_t (fd (use)))
+(allow test_sandbox_nodir_t unconfined_t (process (sigchld)))
+(allow test_sandbox_nodir_t unconfined_t (process (sigchld)))
+(allow test_sandbox_nodir_t unlabeled_t (packet (recv send)))
+(allow test_sandbox_nodir_t urandom_device_t (chr_file (getattr ioctl lock open read)))
+(allow test_sandbox_nodir_t urandom_device_t (chr_file (getattr ioctl lock open read)))
+(allow test_sandbox_nodir_t usr_t (dir (getattr ioctl lock open read search)))
+(allow test_sandbox_nodir_t var_lib_t (dir (getattr open search)))
+(allow test_sandbox_nodir_t var_log_t (dir (getattr open search)))
+(allow test_sandbox_nodir_t var_run_t (dir (getattr ioctl lock open read search)))
+(allow test_sandbox_nodir_t var_run_t (lnk_file (getattr read)))
+(allow test_sandbox_nodir_t var_t (dir (getattr open search)))
+(allow test_sandbox_nodir_t var_t (lnk_file (getattr read)))
+(allow test_sandbox_nodir_t vmtools_unconfined_t (dbus (send_msg)))
+(allow test_sandbox_nodir_t zero_device_t (chr_file (append getattr ioctl lock map open read write)))
+(allow test_sandbox_nodir_t bin_t (file (entrypoint execute getattr ioctl lock map open read)))
+(allow test_sandbox_nodir_t console_device_t (chr_file (ioctl read write)))
+(allow test_sandbox_nodir_t init_t (fd (use)))
+(allow test_sandbox_nodir_t initrc_t (fd (use)))
+(allow test_sandbox_nodir_t test_sandbox_nodir_t (association (sendto)))
+(allow test_sandbox_nodir_t test_sandbox_nodir_t (capability (dac_override dac_read_search)))
+(allow test_sandbox_nodir_t test_sandbox_nodir_t (dir (getattr ioctl lock open read search)))
+(allow test_sandbox_nodir_t test_sandbox_nodir_t (fd (use)))
+(allow test_sandbox_nodir_t test_sandbox_nodir_t (fifo_file (append create getattr ioctl link lock open read rename setattr unlink write)))
+(allow test_sandbox_nodir_t test_sandbox_nodir_t (fifo_file (append getattr ioctl lock open read write)))
+(allow test_sandbox_nodir_t test_sandbox_nodir_t (file (append getattr ioctl lock open read write)))
+(allow test_sandbox_nodir_t test_sandbox_nodir_t (lnk_file (getattr ioctl lock read)))
+(allow test_sandbox_nodir_t test_sandbox_nodir_t (peer (recv)))
+(allow test_sandbox_nodir_t test_sandbox_nodir_t (process (dyntransition fork getattr getcap getpgid getrlimit getsched getsession noatsecure rlimitinh setcap setcurrent setexec setpgid setsched setsockcreate share sigchld siginh sigkill signal signull sigstop transition)))
+(allow test_sandbox_nodir_t test_sandbox_nodir_t (sem (associate create destroy getattr read setattr unix_read unix_write write)))
+(allow test_sandbox_nodir_t test_sandbox_nodir_t (shm (associate create destroy getattr lock read setattr unix_read unix_write write)))
+(allow test_sandbox_nodir_t test_sandbox_nodir_t (unix_dgram_socket (append bind connect create getattr getopt ioctl lock read sendto setattr setopt shutdown write)))
+(allow test_sandbox_nodir_t test_sandbox_nodir_t (unix_stream_socket (accept append bind connect create getattr getopt ioctl listen lock read setattr setopt shutdown write)))
+(allow test_sandbox_nodir_t unconfined_t (fd (use)))
+(allow test_sandbox_nodir_t unconfined_t (fifo_file (getattr ioctl read write)))
+(allow test_sandbox_nodir_t unconfined_t (process (sigchld)))
+(allow test_sandbox_nodir_t user_devpts_t (chr_file (getattr ioctl read write)))
+(allow test_sandbox_nodir_t bin_t (dir (getattr ioctl lock open read search)))
+(allow test_sandbox_nodir_t console_device_t (chr_file (append getattr ioctl lock open read write)))
+(allow test_sandbox_nodir_t device_t (dir (getattr ioctl lock open read search)))
+(allow test_sandbox_nodir_t device_t (lnk_file (getattr read)))
+(allow test_sandbox_nodir_t devpts_t (chr_file (append getattr ioctl lock open read write)))
+(allow test_sandbox_nodir_t devpts_t (dir (getattr ioctl lock open read search)))
+(allow test_sandbox_nodir_t devtty_t (chr_file (append getattr ioctl lock open read write)))
+(allow test_sandbox_nodir_t etc_t (dir (getattr ioctl lock open read search)))
+(allow test_sandbox_nodir_t etc_t (file (getattr ioctl lock open read)))
+(allow test_sandbox_nodir_t etc_t (lnk_file (getattr read)))
+(allow test_sandbox_nodir_t home_root_t (dir (getattr ioctl lock open read search)))
+(allow test_sandbox_nodir_t home_root_t (lnk_file (getattr read)))
+(allow test_sandbox_nodir_t init_t (dbus (send_msg)))
+(allow test_sandbox_nodir_t ld_so_cache_t (file (getattr ioctl lock map open read)))
+(allow test_sandbox_nodir_t ld_so_t (file (execute getattr ioctl map open read)))
+(allow test_sandbox_nodir_t ld_so_t (lnk_file (getattr read)))
+(allow test_sandbox_nodir_t lib_t (dir (getattr ioctl lock open read search)))
+(allow test_sandbox_nodir_t lib_t (file (execute getattr ioctl lock map open read)))
+(allow test_sandbox_nodir_t lib_t (lnk_file (getattr read)))
+(allow test_sandbox_nodir_t locale_t (dir (getattr ioctl lock open read search)))
+(allow test_sandbox_nodir_t locale_t (file (getattr ioctl lock map open read)))
+(allow test_sandbox_nodir_t locale_t (lnk_file (getattr read)))
+(allow test_sandbox_nodir_t null_device_t (chr_file (append getattr ioctl lock open read write)))
+(allow test_sandbox_nodir_t passwd_file_t (file (getattr ioctl lock open read)))
+(allow test_sandbox_nodir_t privfd (fd (use)))
+(allow test_sandbox_nodir_t proc_t (file (getattr open read)))
+(allow test_sandbox_nodir_t ptynode (chr_file (append getattr ioctl lock open read write)))
+(allow test_sandbox_nodir_t random_device_t (chr_file (getattr ioctl lock open read)))
+(allow test_sandbox_nodir_t root_t (dir (getattr ioctl lock open read search)))
+(allow test_sandbox_nodir_t security_t (dir (getattr ioctl lock open read search)))
+(allow test_sandbox_nodir_t security_t (file (append getattr ioctl lock map open read write)))
+(allow test_sandbox_nodir_t security_t (lnk_file (getattr read)))
+(allow test_sandbox_nodir_t security_t (security (check_context compute_av compute_create compute_relabel compute_user)))
+(allow test_sandbox_nodir_t selinux_config_t (dir (getattr ioctl lock open read search)))
+(allow test_sandbox_nodir_t selinux_config_t (file (getattr ioctl lock open read)))
+(allow test_sandbox_nodir_t selinux_config_t (lnk_file (getattr read)))
+(allow test_sandbox_nodir_t sssd_public_t (dir (getattr ioctl lock open read search)))
+(allow test_sandbox_nodir_t sssd_public_t (file (getattr ioctl lock map open read)))
+(allow test_sandbox_nodir_t sssd_t (unix_stream_socket (connectto)))
+(allow test_sandbox_nodir_t sssd_var_lib_t (dir (getattr open search)))
+(allow test_sandbox_nodir_t sssd_var_lib_t (sock_file (append getattr open write)))
+(allow test_sandbox_nodir_t sysfs_t (dir (getattr open search)))
+(allow test_sandbox_nodir_t sysfs_t (filesystem (getattr)))
+(allow test_sandbox_nodir_t test_file_t (dir (getattr open search)))
+(allow test_sandbox_nodir_t test_file_t (file (getattr ioctl lock open read)))
+(allow test_sandbox_nodir_t test_file_t (lnk_file (getattr read)))
+(allow test_sandbox_nodir_t textrel_shlib_t (dir (getattr ioctl lock open read search)))
+(allow test_sandbox_nodir_t textrel_shlib_t (file (execmod execute getattr ioctl map open read)))
+(allow test_sandbox_nodir_t textrel_shlib_t (lnk_file (getattr read)))
+(allow test_sandbox_nodir_t tmp_t (dir (getattr open search)))
+(allow test_sandbox_nodir_t tmp_t (lnk_file (getattr read)))
+(allow test_sandbox_nodir_t tmpfs_t (dir (getattr open search)))
+(allow test_sandbox_nodir_t tty_device_t (chr_file (append getattr ioctl lock open read write)))
+(allow test_sandbox_nodir_t ttynode (chr_file (append getattr ioctl lock open read write)))
+(allow test_sandbox_nodir_t usr_t (dir (getattr ioctl lock open read search)))
+(allow test_sandbox_nodir_t var_lib_t (dir (getattr open search)))
+(allow test_sandbox_nodir_t var_run_t (dir (getattr ioctl lock open read search)))
+(allow test_sandbox_nodir_t var_run_t (lnk_file (getattr read)))
+(allow test_sandbox_nodir_t var_t (dir (getattr ioctl lock open read search)))
+(allow test_sandbox_nodir_t var_t (lnk_file (getattr read)))
+(allow test_sandbox_nodir_t bin_t (file (execmod getattr execute ioctl map open read)))
+(allow test_sandbox_nodir_t zero_device_t (chr_file (append getattr ioctl lock open read write)))
+
+(allow test_sandbox_nodir_t test_sandbox_dir_t (dir (getattr open read search)))
+(allow test_sandbox_nodir_t test_sandbox_dir_t (file (getattr)))
-- 
2.17.1

