Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A671A1059DC
	for <lists+selinux@lfdr.de>; Thu, 21 Nov 2019 19:44:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726803AbfKUSos (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Thu, 21 Nov 2019 13:44:48 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:59229 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726279AbfKUSos (ORCPT
        <rfc822;selinux@vger.kernel.org>); Thu, 21 Nov 2019 13:44:48 -0500
Received: from static-50-53-33-191.bvtn.or.frontiernet.net ([50.53.33.191] helo=[192.168.192.153])
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <john.johansen@canonical.com>)
        id 1iXrRa-00039g-8d; Thu, 21 Nov 2019 18:44:42 +0000
Subject: Re: [PATCH v11 11/25] LSM: Use lsmblob in security_cred_getsecid
To:     Casey Schaufler <casey@schaufler-ca.com>,
        casey.schaufler@intel.com, jmorris@namei.org,
        linux-security-module@vger.kernel.org, selinux@vger.kernel.org
Cc:     keescook@chromium.org, penguin-kernel@i-love.sakura.ne.jp,
        paul@paul-moore.com, sds@tycho.nsa.gov
References: <20191113181925.2437-1-casey@schaufler-ca.com>
 <20191113181925.2437-12-casey@schaufler-ca.com>
From:   John Johansen <john.johansen@canonical.com>
Openpgp: preference=signencrypt
Autocrypt: addr=john.johansen@canonical.com; prefer-encrypt=mutual; keydata=
 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
Organization: Canonical
Message-ID: <ebb26837-8934-093e-c639-d648f399b658@canonical.com>
Date:   Thu, 21 Nov 2019 10:44:39 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191113181925.2437-12-casey@schaufler-ca.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On 11/13/19 10:19 AM, Casey Schaufler wrote:
> Change the security_cred_getsecid() interface to fill in a
> lsmblob instead of a u32 secid. The associated data elements
> in the audit sub-system are changed from a secid to a lsmblob
> to accommodate multiple possible LSM audit users.
> 
> Reviewed-by: Kees Cook <keescook@chromium.org>
> Reviewed-by: John Johansen <john.johansen@canonical.com>
> Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
> cc: linux-integrity@vger.kernel.org

Acked-by: John Johansen <john.johansen@canonical.com>


> ---
>  include/linux/security.h          |  2 +-
>  kernel/audit.c                    | 19 +++++++-----------
>  kernel/audit.h                    |  5 +++--
>  kernel/auditsc.c                  | 33 +++++++++++--------------------
>  security/integrity/ima/ima_main.c |  8 ++++----
>  security/security.c               | 12 ++++++++---
>  6 files changed, 36 insertions(+), 43 deletions(-)
> 
> diff --git a/include/linux/security.h b/include/linux/security.h
> index a845254fc415..f7bc7aef95cb 100644
> --- a/include/linux/security.h
> +++ b/include/linux/security.h
> @@ -434,7 +434,7 @@ int security_cred_alloc_blank(struct cred *cred, gfp_t gfp);
>  void security_cred_free(struct cred *cred);
>  int security_prepare_creds(struct cred *new, const struct cred *old, gfp_t gfp);
>  void security_transfer_creds(struct cred *new, const struct cred *old);
> -void security_cred_getsecid(const struct cred *c, u32 *secid);
> +void security_cred_getsecid(const struct cred *c, struct lsmblob *blob);
>  int security_kernel_act_as(struct cred *new, struct lsmblob *blob);
>  int security_kernel_create_files_as(struct cred *new, struct inode *inode);
>  int security_kernel_module_request(char *kmod_name);
> diff --git a/kernel/audit.c b/kernel/audit.c
> index fd29186ae977..ba9f78e36d1e 100644
> --- a/kernel/audit.c
> +++ b/kernel/audit.c
> @@ -124,7 +124,7 @@ static u32	audit_backlog_wait_time = AUDIT_BACKLOG_WAIT_TIME;
>  /* The identity of the user shutting down the audit system. */
>  kuid_t		audit_sig_uid = INVALID_UID;
>  pid_t		audit_sig_pid = -1;
> -u32		audit_sig_sid = 0;
> +struct lsmblob	audit_sig_lsm;
>  
>  /* Records can be lost in several ways:
>     0) [suppressed in audit_alloc]
> @@ -1416,23 +1416,21 @@ static int audit_receive_msg(struct sk_buff *skb, struct nlmsghdr *nlh)
>  	}
>  	case AUDIT_SIGNAL_INFO:
>  		len = 0;
> -		if (audit_sig_sid) {
> -			struct lsmblob blob;
> -
> -			lsmblob_init(&blob, audit_sig_sid);
> -			err = security_secid_to_secctx(&blob, &ctx, &len);
> +		if (lsmblob_is_set(&audit_sig_lsm)) {
> +			err = security_secid_to_secctx(&audit_sig_lsm, &ctx,
> +						       &len);
>  			if (err)
>  				return err;
>  		}
>  		sig_data = kmalloc(sizeof(*sig_data) + len, GFP_KERNEL);
>  		if (!sig_data) {
> -			if (audit_sig_sid)
> +			if (lsmblob_is_set(&audit_sig_lsm))
>  				security_release_secctx(ctx, len);
>  			return -ENOMEM;
>  		}
>  		sig_data->uid = from_kuid(&init_user_ns, audit_sig_uid);
>  		sig_data->pid = audit_sig_pid;
> -		if (audit_sig_sid) {
> +		if (lsmblob_is_set(&audit_sig_lsm)) {
>  			memcpy(sig_data->ctx, ctx, len);
>  			security_release_secctx(ctx, len);
>  		}
> @@ -2274,7 +2272,6 @@ int audit_set_loginuid(kuid_t loginuid)
>  int audit_signal_info(int sig, struct task_struct *t)
>  {
>  	kuid_t uid = current_uid(), auid;
> -	struct lsmblob blob;
>  
>  	if (auditd_test_task(t) &&
>  	    (sig == SIGTERM || sig == SIGHUP ||
> @@ -2285,9 +2282,7 @@ int audit_signal_info(int sig, struct task_struct *t)
>  			audit_sig_uid = auid;
>  		else
>  			audit_sig_uid = uid;
> -		security_task_getsecid(current, &blob);
> -		/* scaffolding until audit_sig_sid is converted */
> -		audit_sig_sid = blob.secid[0];
> +		security_task_getsecid(current, &audit_sig_lsm);
>  	}
>  
>  	return audit_signal_info_syscall(t);
> diff --git a/kernel/audit.h b/kernel/audit.h
> index 6fb7160412d4..af9bc09e656c 100644
> --- a/kernel/audit.h
> +++ b/kernel/audit.h
> @@ -9,6 +9,7 @@
>  #include <linux/fs.h>
>  #include <linux/audit.h>
>  #include <linux/skbuff.h>
> +#include <linux/security.h>
>  #include <uapi/linux/mqueue.h>
>  #include <linux/tty.h>
>  
> @@ -134,7 +135,7 @@ struct audit_context {
>  	kuid_t		    target_auid;
>  	kuid_t		    target_uid;
>  	unsigned int	    target_sessionid;
> -	u32		    target_sid;
> +	struct lsmblob   target_lsm;
>  	char		    target_comm[TASK_COMM_LEN];
>  
>  	struct audit_tree_refs *trees, *first_trees;
> @@ -329,7 +330,7 @@ extern char *audit_unpack_string(void **bufp, size_t *remain, size_t len);
>  
>  extern pid_t audit_sig_pid;
>  extern kuid_t audit_sig_uid;
> -extern u32 audit_sig_sid;
> +extern struct lsmblob audit_sig_lsm;
>  
>  extern int audit_filter(int msgtype, unsigned int listtype);
>  
> diff --git a/kernel/auditsc.c b/kernel/auditsc.c
> index 5752e51883d5..c1e3ac8eb1ad 100644
> --- a/kernel/auditsc.c
> +++ b/kernel/auditsc.c
> @@ -112,7 +112,7 @@ struct audit_aux_data_pids {
>  	kuid_t			target_auid[AUDIT_AUX_PIDS];
>  	kuid_t			target_uid[AUDIT_AUX_PIDS];
>  	unsigned int		target_sessionid[AUDIT_AUX_PIDS];
> -	u32			target_sid[AUDIT_AUX_PIDS];
> +	struct lsmblob	target_lsm[AUDIT_AUX_PIDS];
>  	char 			target_comm[AUDIT_AUX_PIDS][TASK_COMM_LEN];
>  	int			pid_count;
>  };
> @@ -957,14 +957,14 @@ static inline void audit_free_context(struct audit_context *context)
>  }
>  
>  static int audit_log_pid_context(struct audit_context *context, pid_t pid,
> -				 kuid_t auid, kuid_t uid, unsigned int sessionid,
> -				 u32 sid, char *comm)
> +				 kuid_t auid, kuid_t uid,
> +				 unsigned int sessionid,
> +				 struct lsmblob *blob, char *comm)
>  {
>  	struct audit_buffer *ab;
>  	char *ctx = NULL;
>  	u32 len;
>  	int rc = 0;
> -	struct lsmblob blob;
>  
>  	ab = audit_log_start(context, GFP_KERNEL, AUDIT_OBJ_PID);
>  	if (!ab)
> @@ -973,9 +973,8 @@ static int audit_log_pid_context(struct audit_context *context, pid_t pid,
>  	audit_log_format(ab, "opid=%d oauid=%d ouid=%d oses=%d", pid,
>  			 from_kuid(&init_user_ns, auid),
>  			 from_kuid(&init_user_ns, uid), sessionid);
> -	if (sid) {
> -		lsmblob_init(&blob, sid);
> -		if (security_secid_to_secctx(&blob, &ctx, &len)) {
> +	if (lsmblob_is_set(blob)) {
> +		if (security_secid_to_secctx(blob, &ctx, &len)) {
>  			audit_log_format(ab, " obj=(none)");
>  			rc = 1;
>  		} else {
> @@ -1546,7 +1545,7 @@ static void audit_log_exit(void)
>  						  axs->target_auid[i],
>  						  axs->target_uid[i],
>  						  axs->target_sessionid[i],
> -						  axs->target_sid[i],
> +						  &axs->target_lsm[i],
>  						  axs->target_comm[i]))
>  				call_panic = 1;
>  	}
> @@ -1555,7 +1554,7 @@ static void audit_log_exit(void)
>  	    audit_log_pid_context(context, context->target_pid,
>  				  context->target_auid, context->target_uid,
>  				  context->target_sessionid,
> -				  context->target_sid, context->target_comm))
> +				  &context->target_lsm, context->target_comm))
>  			call_panic = 1;
>  
>  	if (context->pwd.dentry && context->pwd.mnt) {
> @@ -1733,7 +1732,7 @@ void __audit_syscall_exit(int success, long return_code)
>  	context->aux = NULL;
>  	context->aux_pids = NULL;
>  	context->target_pid = 0;
> -	context->target_sid = 0;
> +	lsmblob_init(&context->target_lsm, 0);
>  	context->sockaddr_len = 0;
>  	context->type = 0;
>  	context->fds[0] = -1;
> @@ -2384,15 +2383,12 @@ int __audit_sockaddr(int len, void *a)
>  void __audit_ptrace(struct task_struct *t)
>  {
>  	struct audit_context *context = audit_context();
> -	struct lsmblob blob;
>  
>  	context->target_pid = task_tgid_nr(t);
>  	context->target_auid = audit_get_loginuid(t);
>  	context->target_uid = task_uid(t);
>  	context->target_sessionid = audit_get_sessionid(t);
> -	security_task_getsecid(t, &blob);
> -	/* scaffolding - until target_sid is converted */
> -	context->target_sid = blob.secid[0];
> +	security_task_getsecid(t, &context->target_lsm);
>  	memcpy(context->target_comm, t->comm, TASK_COMM_LEN);
>  }
>  
> @@ -2408,7 +2404,6 @@ int audit_signal_info_syscall(struct task_struct *t)
>  	struct audit_aux_data_pids *axp;
>  	struct audit_context *ctx = audit_context();
>  	kuid_t t_uid = task_uid(t);
> -	struct lsmblob blob;
>  
>  	if (!audit_signals || audit_dummy_context())
>  		return 0;
> @@ -2420,9 +2415,7 @@ int audit_signal_info_syscall(struct task_struct *t)
>  		ctx->target_auid = audit_get_loginuid(t);
>  		ctx->target_uid = t_uid;
>  		ctx->target_sessionid = audit_get_sessionid(t);
> -		security_task_getsecid(t, &blob);
> -		/* scaffolding until target_sid is converted */
> -		ctx->target_sid = blob.secid[0];
> +		security_task_getsecid(t, &ctx->target_lsm);
>  		memcpy(ctx->target_comm, t->comm, TASK_COMM_LEN);
>  		return 0;
>  	}
> @@ -2443,9 +2436,7 @@ int audit_signal_info_syscall(struct task_struct *t)
>  	axp->target_auid[axp->pid_count] = audit_get_loginuid(t);
>  	axp->target_uid[axp->pid_count] = t_uid;
>  	axp->target_sessionid[axp->pid_count] = audit_get_sessionid(t);
> -	security_task_getsecid(t, &blob);
> -	/* scaffolding until target_sid is converted */
> -	axp->target_sid[axp->pid_count] = blob.secid[0];
> +	security_task_getsecid(t, &axp->target_lsm[axp->pid_count]);
>  	memcpy(axp->target_comm[axp->pid_count], t->comm, TASK_COMM_LEN);
>  	axp->pid_count++;
>  
> diff --git a/security/integrity/ima/ima_main.c b/security/integrity/ima/ima_main.c
> index cac654c2faaf..305a00a6b087 100644
> --- a/security/integrity/ima/ima_main.c
> +++ b/security/integrity/ima/ima_main.c
> @@ -408,7 +408,6 @@ int ima_file_mmap(struct file *file, unsigned long prot)
>  int ima_bprm_check(struct linux_binprm *bprm)
>  {
>  	int ret;
> -	u32 secid;
>  	struct lsmblob blob;
>  
>  	security_task_getsecid(current, &blob);
> @@ -418,9 +417,10 @@ int ima_bprm_check(struct linux_binprm *bprm)
>  	if (ret)
>  		return ret;
>  
> -	security_cred_getsecid(bprm->cred, &secid);
> -	return process_measurement(bprm->file, bprm->cred, secid, NULL, 0,
> -				   MAY_EXEC, CREDS_CHECK);
> +	security_cred_getsecid(bprm->cred, &blob);
> +	/* scaffolding until process_measurement changes */
> +	return process_measurement(bprm->file, bprm->cred, blob.secid[0],
> +				   NULL, 0, MAY_EXEC, CREDS_CHECK);
>  }
>  
>  /**
> diff --git a/security/security.c b/security/security.c
> index bd279a24adfc..3aba440624f9 100644
> --- a/security/security.c
> +++ b/security/security.c
> @@ -1615,10 +1615,16 @@ void security_transfer_creds(struct cred *new, const struct cred *old)
>  	call_void_hook(cred_transfer, new, old);
>  }
>  
> -void security_cred_getsecid(const struct cred *c, u32 *secid)
> +void security_cred_getsecid(const struct cred *c, struct lsmblob *blob)
>  {
> -	*secid = 0;
> -	call_void_hook(cred_getsecid, c, secid);
> +	struct security_hook_list *hp;
> +
> +	lsmblob_init(blob, 0);
> +	hlist_for_each_entry(hp, &security_hook_heads.cred_getsecid, list) {
> +		if (WARN_ON(hp->lsmid->slot < 0 || hp->lsmid->slot >= lsm_slot))
> +			continue;
> +		hp->hook.cred_getsecid(c, &blob->secid[hp->lsmid->slot]);
> +	}
>  }
>  EXPORT_SYMBOL(security_cred_getsecid);
>  
> 

