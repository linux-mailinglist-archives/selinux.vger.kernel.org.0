Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DEA68116DD9
	for <lists+selinux@lfdr.de>; Mon,  9 Dec 2019 14:21:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727708AbfLINV3 (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Mon, 9 Dec 2019 08:21:29 -0500
Received: from UHIL19PA40.eemsg.mail.mil ([214.24.21.199]:29284 "EHLO
        UHIL19PA40.eemsg.mail.mil" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727513AbfLINV3 (ORCPT
        <rfc822;selinux@vger.kernel.org>); Mon, 9 Dec 2019 08:21:29 -0500
X-EEMSG-check-017: 55469982|UHIL19PA40_ESA_OUT06.csd.disa.mil
X-IronPort-AV: E=Sophos;i="5.69,294,1571702400"; 
   d="scan'208";a="55469982"
Received: from emsm-gh1-uea11.ncsc.mil ([214.29.60.3])
  by UHIL19PA40.eemsg.mail.mil with ESMTP/TLS/DHE-RSA-AES256-SHA256; 09 Dec 2019 13:21:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tycho.nsa.gov; i=@tycho.nsa.gov; q=dns/txt;
  s=tycho.nsa.gov; t=1575897680; x=1607433680;
  h=subject:to:references:from:message-id:date:mime-version:
   in-reply-to:content-transfer-encoding;
  bh=ozC74xdAdOy2YBgolvafvUoju8PC9S6gaBneaiRIJ/U=;
  b=CyyrcOB40kKKNAMd80j8xzivdZqxNAcbBEU4SbKtDrpiFVXkGL5jDm50
   CsWTxztt9q6cshu8RpCQoMjKichsOTAETNWMErEKqNdy28qv7DHwH4lQa
   fQTua95DlStTAVZ+/XhdvqMFNI9sHLF3SLtLLCDgikOo4QeNFIDtSogcz
   M5Cxp2We8RqRYY7l5t4ADhxEC3n5HhY/fSo4S+RaThlCYGlzHCLe8V5xq
   bi39DgH+iqzSQ0ep/c6rJ9V418e9wNNxOo2aAGDcQGNJpR9Mh6XHHAXpU
   eMvoAxa4peZCAfJa2WItqZGVBVylLZR7SlhuSNgRBoNM2cUXy+NMwnL8b
   w==;
X-IronPort-AV: E=Sophos;i="5.69,294,1571702400"; 
   d="scan'208";a="36485604"
IronPort-PHdr: =?us-ascii?q?9a23=3AR5ARAh1apGY5YX6psmDT+DRfVm0co7zxezQtwd?=
 =?us-ascii?q?8ZseMfKfad9pjvdHbS+e9qxAeQG9mCsLQd2rKd7viocFdDyK7JiGoFfp1IWk?=
 =?us-ascii?q?1NouQttCtkPvS4D1bmJuXhdS0wEZcKflZk+3amLRodQ56mNBXdrXKo8DEdBA?=
 =?us-ascii?q?j0OxZrKeTpAI7SiNm82/yv95HJbAhEmTSwbalvIBiysQnduckbjZd/Iast1x?=
 =?us-ascii?q?XFpWdFdf5Lzm1yP1KTmBj85sa0/JF99ilbpuws+c1dX6jkZqo0VbNXAigoPG?=
 =?us-ascii?q?Az/83rqALMTRCT6XsGU2UZiQRHDg7Y5xznRJjxsy/6tu1g2CmGOMD9UL45VS?=
 =?us-ascii?q?i+46ptVRTlkzkMOSIn/27Li8xwlKNbrwynpxxj2I7ffYWZOONjcq/BYd8WQG?=
 =?us-ascii?q?xMUchLVyxFH4iycY0BAeQcNupctoXwqV8DoR64CAKxBu3g1yVIi2fr06Mk3e?=
 =?us-ascii?q?QvEQLI0gIuEN0BsnvbsNr7ObwOUe231qTE0SnPYv1U1Dr79YPGcgohofaJXb?=
 =?us-ascii?q?9obMTR1VcgFxvFjlqOr4zuIi6b1uEXvGif6+pvS+KugHMgpgFqvzev3dwhip?=
 =?us-ascii?q?XJh40JylDE8j91wIAuJdKiUkJ7btmkEIVJuiycKoB4QdsiTnl1tCs1xbAKo5?=
 =?us-ascii?q?62cDUQxJg5yBPTdeaLf5WO7xn+TuieOy14i2hgeL+nghay9lWvxfPkW8mv1V?=
 =?us-ascii?q?ZKsjJFkt7RtnARzxDT6taISv96/kq5xTaAzRrT6uBZIUAvj6bbKpghwrA3lp?=
 =?us-ascii?q?oIr0vMAjX6mFn2jaCKdkUk/fKk6+L7bbX9upCQLYp0igD6Mqg2m8y/B/o3Mh?=
 =?us-ascii?q?QWUmSG9umx26fv8E3kTLlQkPE7nbfVvIrHKcgDo662GQ5V0oIt6xalCDem1c?=
 =?us-ascii?q?wVnWIaI1JeYx+Hk4joNE3OIPD/F/u/hU+sny1xy/DJOb3hHI3BLmLfn7f5Yb?=
 =?us-ascii?q?Z990lcxRI0zdBa4JJUEbcBL+jvVUDvr9HYFAE2PBG0w+n9FNVxzJ8RWWWKAq?=
 =?us-ascii?q?WBKqPdrUeI5v4zI+mLfIIVoyjyK/wk5/7okH84lkQQfbem3ZQJcnC0BPdmLF?=
 =?us-ascii?q?uDYXrqnNgBFX0Gvg0kTOzlkFeCSyJcZ26uX6Ig4TE2EJqmAp3eRoCpm7GBxD?=
 =?us-ascii?q?20HoBSZmxfD1CMFnDod5+aVPsWdC2SJcphwXQ4Uu2GTYM72BPmkQjhzbNsI+?=
 =?us-ascii?q?mcriodsonl3dN4z/femRE76Xp/CMHLlymWQmV1mH4YbyE50bo5okFnzFqHl6?=
 =?us-ascii?q?9ijLgQLdVO47tsVQAgONaI1+VnD/jqUx/FO9KOT0yrBN6hBGdiYMg2xoo1f0?=
 =?us-ascii?q?tlG9ikxivG1i6uDq5dw6eHH7Qo46nc2D73PM87xHHYgvpyx2I6S9dCYDX1zp?=
 =?us-ascii?q?V08BLeUsuQyBSU?=
X-IPAS-Result: =?us-ascii?q?A2AaAwADSe5d/wHyM5BkHAEBAQEBBwEBEQEEBAEBgX6Bd?=
 =?us-ascii?q?IFtIBIqhAKJA4ZpBoESJYEBiGiPXoFnCQEBAQEBAQEBATcBAYRAAoI9OBMCE?=
 =?us-ascii?q?AEBAQQBAQEBAQUDAQFshUOCOykBgm0BAQEBAgEjFVELDgoCAiYCAlcGAQwGA?=
 =?us-ascii?q?gEBF4I8DD+CUwUgqjl1gTKFT4MwgUiBDiiMMnmBB4ERJwwDgig1PoQDLoMog?=
 =?us-ascii?q?l4EjREkiUNGlxuCOII7ihGJFAYCGYJCh3OEQIs9jkqcPCKBWCsIAhgIIQ87g?=
 =?us-ascii?q?mxQERSMcheOQSMDMIxfgjIBAQ?=
Received: from tarius.tycho.ncsc.mil (HELO tarius.infosec.tycho.ncsc.mil) ([144.51.242.1])
  by emsm-gh1-uea11.NCSC.MIL with ESMTP; 09 Dec 2019 13:21:19 +0000
Received: from moss-pluto.infosec.tycho.ncsc.mil (moss-pluto [192.168.25.131])
        by tarius.infosec.tycho.ncsc.mil (8.14.7/8.14.4) with ESMTP id xB9DL449058785;
        Mon, 9 Dec 2019 08:21:06 -0500
Subject: Re: [PATCH] selinux: reorder hooks to make runtime disable less
 broken
To:     Ondrej Mosnacek <omosnace@redhat.com>, selinux@vger.kernel.org,
        Paul Moore <paul@paul-moore.com>
References: <20191209075756.123157-1-omosnace@redhat.com>
From:   Stephen Smalley <sds@tycho.nsa.gov>
Message-ID: <23671223-f841-564c-6ae8-0401bce0fa20@tycho.nsa.gov>
Date:   Mon, 9 Dec 2019 08:21:56 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191209075756.123157-1-omosnace@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On 12/9/19 2:57 AM, Ondrej Mosnacek wrote:
> Commit b1d9e6b0646d ("LSM: Switch to lists of hooks") switched the LSM
> infrastructure to use per-hook lists, which meant that removing the
> hooks for a given module was no longer atomic. Even though the commit
> clearly documents that modules implementing runtime revmoval of hooks
> (only SELinux attempts this madness) need to take special precautions to
> avoid race conditions, SELinux has never addressed this.
> 
> By inserting an artificial delay between the loop iterations of
> security_delete_hooks() (I used 100 ms), booting to a state where
> SELinux is enabled, but policy is not yet loaded, and running these
> commands:
> 
>      while true; do ping -c 1 <some IP>; done &
>      echo -n 1 >/sys/fs/selinux/disable
>      kill %1
>      wait
> 
> ...I was able to trigger NULL pointer dereferences in various places. I
> also have a report of someone getting panics on a stock RHEL-8 kernel
> after setting SELINUX=disabled in /etc/selinux/config and rebooting
> (without adding "selinux=0" to kernel command-line).
> 
> Reordering the SELinux hooks such that those that allocate structures
> are removed last seems to prevent these panics. It is very much possible
> that this doesn't make the runtime disable completely race-free, but at
> least it makes the operation much less fragile.
> 
> An alternative (and safer) solution would be to add NULL checks to each
> hook, but doing this just to support the runtime disable hack doesn't
> seem to be worth the effort...

Personally, I would prefer to just get rid of runtime disable 
altogether; it also precludes making the hooks read-only after 
initialization.  IMHO, selinux=0 is the proper way to disable SELinux if 
necessary.  I believe there is an open bugzilla on Fedora related to 
this issue, since runtime disable was originally introduced for Fedora.

> 
> Fixes: b1d9e6b0646d ("LSM: Switch to lists of hooks")
> Signed-off-by: Ondrej Mosnacek <omosnace@redhat.com>
> ---
>   security/selinux/hooks.c | 97 +++++++++++++++++++++++++++-------------
>   1 file changed, 66 insertions(+), 31 deletions(-)
> 
> diff --git a/security/selinux/hooks.c b/security/selinux/hooks.c
> index 116b4d644f68..5075be8eea2a 100644
> --- a/security/selinux/hooks.c
> +++ b/security/selinux/hooks.c
> @@ -6864,6 +6864,21 @@ static int selinux_perf_event_write(struct perf_event *event)
>   }
>   #endif
>   
> +/*
> + * IMPORTANT NOTE: When adding new hooks, please be careful to keep this order:
> + * 1. any hooks that don't belong to (2.) or (3.) below,
> + * 2. hooks that both access structures allocated by other hooks, and allocate
> + *    structures that can be later accessed by other hooks (mostly "cloning"
> + *    hooks),
> + * 3. hooks that only allocate structures that can be later accessed by other
> + *    hooks ("allocating" hooks).
> + *
> + * Please follow block comment delimiters in the list to keep this order.
> + *
> + * This ordering is needed for SELinux runtime disable to work at least somewhat
> + * safely. Breaking the ordering rules above might lead to NULL pointer derefs
> + * when disabling SELinux at runtime.
> + */
>   static struct security_hook_list selinux_hooks[] __lsm_ro_after_init = {
>   	LSM_HOOK_INIT(binder_set_context_mgr, selinux_binder_set_context_mgr),
>   	LSM_HOOK_INIT(binder_transaction, selinux_binder_transaction),
> @@ -6886,12 +6901,7 @@ static struct security_hook_list selinux_hooks[] __lsm_ro_after_init = {
>   	LSM_HOOK_INIT(bprm_committing_creds, selinux_bprm_committing_creds),
>   	LSM_HOOK_INIT(bprm_committed_creds, selinux_bprm_committed_creds),
>   
> -	LSM_HOOK_INIT(fs_context_dup, selinux_fs_context_dup),
> -	LSM_HOOK_INIT(fs_context_parse_param, selinux_fs_context_parse_param),
> -
> -	LSM_HOOK_INIT(sb_alloc_security, selinux_sb_alloc_security),
>   	LSM_HOOK_INIT(sb_free_security, selinux_sb_free_security),
> -	LSM_HOOK_INIT(sb_eat_lsm_opts, selinux_sb_eat_lsm_opts),
>   	LSM_HOOK_INIT(sb_free_mnt_opts, selinux_free_mnt_opts),
>   	LSM_HOOK_INIT(sb_remount, selinux_sb_remount),
>   	LSM_HOOK_INIT(sb_kern_mount, selinux_sb_kern_mount),
> @@ -6901,12 +6911,10 @@ static struct security_hook_list selinux_hooks[] __lsm_ro_after_init = {
>   	LSM_HOOK_INIT(sb_umount, selinux_umount),
>   	LSM_HOOK_INIT(sb_set_mnt_opts, selinux_set_mnt_opts),
>   	LSM_HOOK_INIT(sb_clone_mnt_opts, selinux_sb_clone_mnt_opts),
> -	LSM_HOOK_INIT(sb_add_mnt_opt, selinux_add_mnt_opt),
>   
>   	LSM_HOOK_INIT(dentry_init_security, selinux_dentry_init_security),
>   	LSM_HOOK_INIT(dentry_create_files_as, selinux_dentry_create_files_as),
>   
> -	LSM_HOOK_INIT(inode_alloc_security, selinux_inode_alloc_security),
>   	LSM_HOOK_INIT(inode_free_security, selinux_inode_free_security),
>   	LSM_HOOK_INIT(inode_init_security, selinux_inode_init_security),
>   	LSM_HOOK_INIT(inode_create, selinux_inode_create),
> @@ -6978,21 +6986,15 @@ static struct security_hook_list selinux_hooks[] __lsm_ro_after_init = {
>   	LSM_HOOK_INIT(ipc_permission, selinux_ipc_permission),
>   	LSM_HOOK_INIT(ipc_getsecid, selinux_ipc_getsecid),
>   
> -	LSM_HOOK_INIT(msg_msg_alloc_security, selinux_msg_msg_alloc_security),
> -
> -	LSM_HOOK_INIT(msg_queue_alloc_security,
> -			selinux_msg_queue_alloc_security),
>   	LSM_HOOK_INIT(msg_queue_associate, selinux_msg_queue_associate),
>   	LSM_HOOK_INIT(msg_queue_msgctl, selinux_msg_queue_msgctl),
>   	LSM_HOOK_INIT(msg_queue_msgsnd, selinux_msg_queue_msgsnd),
>   	LSM_HOOK_INIT(msg_queue_msgrcv, selinux_msg_queue_msgrcv),
>   
> -	LSM_HOOK_INIT(shm_alloc_security, selinux_shm_alloc_security),
>   	LSM_HOOK_INIT(shm_associate, selinux_shm_associate),
>   	LSM_HOOK_INIT(shm_shmctl, selinux_shm_shmctl),
>   	LSM_HOOK_INIT(shm_shmat, selinux_shm_shmat),
>   
> -	LSM_HOOK_INIT(sem_alloc_security, selinux_sem_alloc_security),
>   	LSM_HOOK_INIT(sem_associate, selinux_sem_associate),
>   	LSM_HOOK_INIT(sem_semctl, selinux_sem_semctl),
>   	LSM_HOOK_INIT(sem_semop, selinux_sem_semop),
> @@ -7003,13 +7005,11 @@ static struct security_hook_list selinux_hooks[] __lsm_ro_after_init = {
>   	LSM_HOOK_INIT(setprocattr, selinux_setprocattr),
>   
>   	LSM_HOOK_INIT(ismaclabel, selinux_ismaclabel),
> -	LSM_HOOK_INIT(secid_to_secctx, selinux_secid_to_secctx),
>   	LSM_HOOK_INIT(secctx_to_secid, selinux_secctx_to_secid),
>   	LSM_HOOK_INIT(release_secctx, selinux_release_secctx),
>   	LSM_HOOK_INIT(inode_invalidate_secctx, selinux_inode_invalidate_secctx),
>   	LSM_HOOK_INIT(inode_notifysecctx, selinux_inode_notifysecctx),
>   	LSM_HOOK_INIT(inode_setsecctx, selinux_inode_setsecctx),
> -	LSM_HOOK_INIT(inode_getsecctx, selinux_inode_getsecctx),
>   
>   	LSM_HOOK_INIT(unix_stream_connect, selinux_socket_unix_stream_connect),
>   	LSM_HOOK_INIT(unix_may_send, selinux_socket_unix_may_send),
> @@ -7032,7 +7032,6 @@ static struct security_hook_list selinux_hooks[] __lsm_ro_after_init = {
>   	LSM_HOOK_INIT(socket_getpeersec_stream,
>   			selinux_socket_getpeersec_stream),
>   	LSM_HOOK_INIT(socket_getpeersec_dgram, selinux_socket_getpeersec_dgram),
> -	LSM_HOOK_INIT(sk_alloc_security, selinux_sk_alloc_security),
>   	LSM_HOOK_INIT(sk_free_security, selinux_sk_free_security),
>   	LSM_HOOK_INIT(sk_clone_security, selinux_sk_clone_security),
>   	LSM_HOOK_INIT(sk_getsecid, selinux_sk_getsecid),
> @@ -7047,7 +7046,6 @@ static struct security_hook_list selinux_hooks[] __lsm_ro_after_init = {
>   	LSM_HOOK_INIT(secmark_refcount_inc, selinux_secmark_refcount_inc),
>   	LSM_HOOK_INIT(secmark_refcount_dec, selinux_secmark_refcount_dec),
>   	LSM_HOOK_INIT(req_classify_flow, selinux_req_classify_flow),
> -	LSM_HOOK_INIT(tun_dev_alloc_security, selinux_tun_dev_alloc_security),
>   	LSM_HOOK_INIT(tun_dev_free_security, selinux_tun_dev_free_security),
>   	LSM_HOOK_INIT(tun_dev_create, selinux_tun_dev_create),
>   	LSM_HOOK_INIT(tun_dev_attach_queue, selinux_tun_dev_attach_queue),
> @@ -7057,17 +7055,11 @@ static struct security_hook_list selinux_hooks[] __lsm_ro_after_init = {
>   	LSM_HOOK_INIT(ib_pkey_access, selinux_ib_pkey_access),
>   	LSM_HOOK_INIT(ib_endport_manage_subnet,
>   		      selinux_ib_endport_manage_subnet),
> -	LSM_HOOK_INIT(ib_alloc_security, selinux_ib_alloc_security),
>   	LSM_HOOK_INIT(ib_free_security, selinux_ib_free_security),
>   #endif
>   #ifdef CONFIG_SECURITY_NETWORK_XFRM
> -	LSM_HOOK_INIT(xfrm_policy_alloc_security, selinux_xfrm_policy_alloc),
> -	LSM_HOOK_INIT(xfrm_policy_clone_security, selinux_xfrm_policy_clone),
>   	LSM_HOOK_INIT(xfrm_policy_free_security, selinux_xfrm_policy_free),
>   	LSM_HOOK_INIT(xfrm_policy_delete_security, selinux_xfrm_policy_delete),
> -	LSM_HOOK_INIT(xfrm_state_alloc, selinux_xfrm_state_alloc),
> -	LSM_HOOK_INIT(xfrm_state_alloc_acquire,
> -			selinux_xfrm_state_alloc_acquire),
>   	LSM_HOOK_INIT(xfrm_state_free_security, selinux_xfrm_state_free),
>   	LSM_HOOK_INIT(xfrm_state_delete_security, selinux_xfrm_state_delete),
>   	LSM_HOOK_INIT(xfrm_policy_lookup, selinux_xfrm_policy_lookup),
> @@ -7077,14 +7069,12 @@ static struct security_hook_list selinux_hooks[] __lsm_ro_after_init = {
>   #endif
>   
>   #ifdef CONFIG_KEYS
> -	LSM_HOOK_INIT(key_alloc, selinux_key_alloc),
>   	LSM_HOOK_INIT(key_free, selinux_key_free),
>   	LSM_HOOK_INIT(key_permission, selinux_key_permission),
>   	LSM_HOOK_INIT(key_getsecurity, selinux_key_getsecurity),
>   #endif
>   
>   #ifdef CONFIG_AUDIT
> -	LSM_HOOK_INIT(audit_rule_init, selinux_audit_rule_init),
>   	LSM_HOOK_INIT(audit_rule_known, selinux_audit_rule_known),
>   	LSM_HOOK_INIT(audit_rule_match, selinux_audit_rule_match),
>   	LSM_HOOK_INIT(audit_rule_free, selinux_audit_rule_free),
> @@ -7094,19 +7084,64 @@ static struct security_hook_list selinux_hooks[] __lsm_ro_after_init = {
>   	LSM_HOOK_INIT(bpf, selinux_bpf),
>   	LSM_HOOK_INIT(bpf_map, selinux_bpf_map),
>   	LSM_HOOK_INIT(bpf_prog, selinux_bpf_prog),
> -	LSM_HOOK_INIT(bpf_map_alloc_security, selinux_bpf_map_alloc),
> -	LSM_HOOK_INIT(bpf_prog_alloc_security, selinux_bpf_prog_alloc),
>   	LSM_HOOK_INIT(bpf_map_free_security, selinux_bpf_map_free),
>   	LSM_HOOK_INIT(bpf_prog_free_security, selinux_bpf_prog_free),
>   #endif
>   
>   #ifdef CONFIG_PERF_EVENTS
>   	LSM_HOOK_INIT(perf_event_open, selinux_perf_event_open),
> -	LSM_HOOK_INIT(perf_event_alloc, selinux_perf_event_alloc),
>   	LSM_HOOK_INIT(perf_event_free, selinux_perf_event_free),
>   	LSM_HOOK_INIT(perf_event_read, selinux_perf_event_read),
>   	LSM_HOOK_INIT(perf_event_write, selinux_perf_event_write),
>   #endif
> +
> +	/*
> +	 * PUT "CLONING" (ACCESSING + ALLOCATING) HOOKS HERE
> +	 */
> +	LSM_HOOK_INIT(fs_context_dup, selinux_fs_context_dup),
> +	LSM_HOOK_INIT(fs_context_parse_param, selinux_fs_context_parse_param),
> +	LSM_HOOK_INIT(sb_eat_lsm_opts, selinux_sb_eat_lsm_opts),
> +	LSM_HOOK_INIT(sb_add_mnt_opt, selinux_add_mnt_opt),
> +#ifdef CONFIG_SECURITY_NETWORK_XFRM
> +	LSM_HOOK_INIT(xfrm_policy_clone_security, selinux_xfrm_policy_clone),
> +#endif
> +
> +	/*
> +	 * PUT "ALLOCATING" HOOKS HERE
> +	 */
> +	LSM_HOOK_INIT(msg_msg_alloc_security, selinux_msg_msg_alloc_security),
> +	LSM_HOOK_INIT(msg_queue_alloc_security,
> +		      selinux_msg_queue_alloc_security),
> +	LSM_HOOK_INIT(shm_alloc_security, selinux_shm_alloc_security),
> +	LSM_HOOK_INIT(sb_alloc_security, selinux_sb_alloc_security),
> +	LSM_HOOK_INIT(inode_alloc_security, selinux_inode_alloc_security),
> +	LSM_HOOK_INIT(sem_alloc_security, selinux_sem_alloc_security),
> +	LSM_HOOK_INIT(secid_to_secctx, selinux_secid_to_secctx),
> +	LSM_HOOK_INIT(inode_getsecctx, selinux_inode_getsecctx),
> +	LSM_HOOK_INIT(sk_alloc_security, selinux_sk_alloc_security),
> +	LSM_HOOK_INIT(tun_dev_alloc_security, selinux_tun_dev_alloc_security),
> +#ifdef CONFIG_SECURITY_INFINIBAND
> +	LSM_HOOK_INIT(ib_alloc_security, selinux_ib_alloc_security),
> +#endif
> +#ifdef CONFIG_SECURITY_NETWORK_XFRM
> +	LSM_HOOK_INIT(xfrm_policy_alloc_security, selinux_xfrm_policy_alloc),
> +	LSM_HOOK_INIT(xfrm_state_alloc, selinux_xfrm_state_alloc),
> +	LSM_HOOK_INIT(xfrm_state_alloc_acquire,
> +		      selinux_xfrm_state_alloc_acquire),
> +#endif
> +#ifdef CONFIG_KEYS
> +	LSM_HOOK_INIT(key_alloc, selinux_key_alloc),
> +#endif
> +#ifdef CONFIG_AUDIT
> +	LSM_HOOK_INIT(audit_rule_init, selinux_audit_rule_init),
> +#endif
> +#ifdef CONFIG_BPF_SYSCALL
> +	LSM_HOOK_INIT(bpf_map_alloc_security, selinux_bpf_map_alloc),
> +	LSM_HOOK_INIT(bpf_prog_alloc_security, selinux_bpf_prog_alloc),
> +#endif
> +#ifdef CONFIG_PERF_EVENTS
> +	LSM_HOOK_INIT(perf_event_alloc, selinux_perf_event_alloc),
> +#endif
>   };
>   
>   static __init int selinux_init(void)
> @@ -7287,14 +7322,14 @@ int selinux_disable(struct selinux_state *state)
>   
>   	selinux_enabled = 0;
>   
> +	/* Unregister netfilter hooks. */
> +	selinux_nf_ip_exit();
> +
>   	security_delete_hooks(selinux_hooks, ARRAY_SIZE(selinux_hooks));
>   
>   	/* Try to destroy the avc node cache */
>   	avc_disable();
>   
> -	/* Unregister netfilter hooks. */
> -	selinux_nf_ip_exit();
> -
>   	/* Unregister selinuxfs. */
>   	exit_sel_fs();
>   
> 

