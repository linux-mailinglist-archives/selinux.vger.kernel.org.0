Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A460E6AA7A
	for <lists+selinux@lfdr.de>; Tue, 16 Jul 2019 16:17:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387773AbfGPORC (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Tue, 16 Jul 2019 10:17:02 -0400
Received: from mail.hallyn.com ([178.63.66.53]:44990 "EHLO mail.hallyn.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727849AbfGPORC (ORCPT <rfc822;selinux@vger.kernel.org>);
        Tue, 16 Jul 2019 10:17:02 -0400
Received: by mail.hallyn.com (Postfix, from userid 1001)
        id 09C5490B; Tue, 16 Jul 2019 09:16:58 -0500 (CDT)
Date:   Tue, 16 Jul 2019 09:16:58 -0500
From:   "Serge E. Hallyn" <serge@hallyn.com>
To:     Nicholas Franck <nhfran2@tycho.nsa.gov>
Cc:     paul@paul-moore.com, selinux@vger.kernel.org,
        linux-security-module@vger.kernel.org, luto@amacapital.net,
        jmorris@namei.org, sds@tycho.nsa.gov, keescook@chromium.org,
        serge@hallyn.com, john.johansen@canonical.com,
        casey@schaufler-ca.com, mortonm@chromium.org
Subject: Re: [RFC PATCH] security,capability: pass object information to
 security_capable
Message-ID: <20190716141658.GA5133@mail.hallyn.com>
References: <20190712173404.14417-1-nhfran2@tycho.nsa.gov>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190712173404.14417-1-nhfran2@tycho.nsa.gov>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Fri, Jul 12, 2019 at 01:34:04PM -0400, Nicholas Franck wrote:
> At present security_capable does not pass any object information
> and therefore can neither audit the particular object nor take it
> into account. Augment the security_capable interface to support
> passing supplementary data. Use this facility initially to convey
> the inode for capability checks relevant to inodes. This only
> addresses capable_wrt_inode_uidgid calls; other capability checks
> relevant to inodes will be addressed in subsequent changes. In the
> future, this will be further extended to pass object information for
> other capability checks such as the target task for CAP_KILL.
> 
> In SELinux this new information is leveraged here to include the inode
> in the audit message. In the future, it could also be used to perform
> a per inode capability checks.
> 
> It would be possible to fold the existing opts argument into this new
> supplementary data structure. This was omitted from this change to
> minimize changes.
> 
> Signed-off-by: Nicholas Franck <nhfran2@tycho.nsa.gov>

One comment below, but overall

Acked-by: Serge Hallyn <serge@hallyn.com>

> ---
>  include/linux/capability.h             |  7 ++++++
>  include/linux/lsm_audit.h              |  5 +++-
>  include/linux/lsm_hooks.h              |  3 ++-
>  include/linux/security.h               | 23 +++++++++++++-----
>  kernel/capability.c                    | 33 ++++++++++++++++++--------
>  kernel/seccomp.c                       |  2 +-
>  security/apparmor/capability.c         |  8 ++++---
>  security/apparmor/include/capability.h |  4 +++-
>  security/apparmor/ipc.c                |  2 +-
>  security/apparmor/lsm.c                |  5 ++--
>  security/apparmor/resource.c           |  2 +-
>  security/commoncap.c                   | 11 +++++----
>  security/lsm_audit.c                   | 21 ++++++++++++++--
>  security/safesetid/lsm.c               |  3 ++-
>  security/security.c                    |  5 ++--
>  security/selinux/hooks.c               | 20 +++++++++-------
>  security/smack/smack_access.c          |  2 +-
>  17 files changed, 110 insertions(+), 46 deletions(-)
> 
> diff --git a/include/linux/capability.h b/include/linux/capability.h
> index ecce0f43c73a..f72de64c179d 100644
> --- a/include/linux/capability.h
> +++ b/include/linux/capability.h
> @@ -211,6 +211,8 @@ extern bool capable(int cap);
>  extern bool ns_capable(struct user_namespace *ns, int cap);
>  extern bool ns_capable_noaudit(struct user_namespace *ns, int cap);
>  extern bool ns_capable_setid(struct user_namespace *ns, int cap);
> +extern bool ns_capable_inode(struct user_namespace *ns, int cap,
> +			     const struct inode *inode);
>  #else
>  static inline bool has_capability(struct task_struct *t, int cap)
>  {
> @@ -246,6 +248,11 @@ static inline bool ns_capable_setid(struct user_namespace *ns, int cap)
>  {
>  	return true;
>  }
> +static bool ns_capable_inode(struct user_namespace *ns, int cap,
> +			     const struct inode *inode)
> +{
> +	return true;
> +}
>  #endif /* CONFIG_MULTIUSER */
>  extern bool privileged_wrt_inode_uidgid(struct user_namespace *ns, const struct inode *inode);
>  extern bool capable_wrt_inode_uidgid(const struct inode *inode, int cap);
> diff --git a/include/linux/lsm_audit.h b/include/linux/lsm_audit.h
> index 915330abf6e5..15d2a62639f0 100644
> --- a/include/linux/lsm_audit.h
> +++ b/include/linux/lsm_audit.h
> @@ -79,7 +79,10 @@ struct common_audit_data {
>  		struct dentry *dentry;
>  		struct inode *inode;
>  		struct lsm_network_audit *net;
> -		int cap;
> +		struct  {
> +			int cap;
> +			struct cap_aux_data *cad;
> +		} cap_struct;
>  		int ipc_id;
>  		struct task_struct *tsk;
>  #ifdef CONFIG_KEYS
> diff --git a/include/linux/lsm_hooks.h b/include/linux/lsm_hooks.h
> index 47f58cfb6a19..b2a37d613030 100644
> --- a/include/linux/lsm_hooks.h
> +++ b/include/linux/lsm_hooks.h
> @@ -1469,7 +1469,8 @@ union security_list_options {
>  	int (*capable)(const struct cred *cred,
>  			struct user_namespace *ns,
>  			int cap,
> -			unsigned int opts);
> +			unsigned int opts,
> +			struct cap_aux_data *cad);
>  	int (*quotactl)(int cmds, int type, int id, struct super_block *sb);
>  	int (*quota_on)(struct dentry *dentry);
>  	int (*syslog)(int type);
> diff --git a/include/linux/security.h b/include/linux/security.h
> index 659071c2e57c..8fce5e69dc52 100644
> --- a/include/linux/security.h
> +++ b/include/linux/security.h
> @@ -77,9 +77,18 @@ enum lsm_event {
>  	LSM_POLICY_CHANGE,
>  };
>  
> +
> +struct cap_aux_data {
> +	char type;
> +#define CAP_AUX_DATA_INODE	1
> +	union	{
> +		const struct inode *inode;
> +	} u;
> +};
> +
>  /* These functions are in security/commoncap.c */
>  extern int cap_capable(const struct cred *cred, struct user_namespace *ns,
> -		       int cap, unsigned int opts);
> +		       int cap, unsigned int opts, struct cap_aux_data *cad);
>  extern int cap_settime(const struct timespec64 *ts, const struct timezone *tz);
>  extern int cap_ptrace_access_check(struct task_struct *child, unsigned int mode);
>  extern int cap_ptrace_traceme(struct task_struct *parent);
> @@ -215,9 +224,10 @@ int security_capset(struct cred *new, const struct cred *old,
>  		    const kernel_cap_t *inheritable,
>  		    const kernel_cap_t *permitted);
>  int security_capable(const struct cred *cred,
> -		       struct user_namespace *ns,
> -		       int cap,
> -		       unsigned int opts);
> +		     struct user_namespace *ns,
> +		     int cap,
> +		     unsigned int opts,
> +		     struct cap_aux_data *cad);
>  int security_quotactl(int cmds, int type, int id, struct super_block *sb);
>  int security_quota_on(struct dentry *dentry);
>  int security_syslog(int type);
> @@ -478,9 +488,10 @@ static inline int security_capset(struct cred *new,
>  static inline int security_capable(const struct cred *cred,
>  				   struct user_namespace *ns,
>  				   int cap,
> -				   unsigned int opts)
> +				   unsigned int opts,
> +				   struct cap_aux_data *cad)
>  {
> -	return cap_capable(cred, ns, cap, opts);
> +	return cap_capable(cred, ns, cap, opts, NULL);
>  }
>  
>  static inline int security_quotactl(int cmds, int type, int id,
> diff --git a/kernel/capability.c b/kernel/capability.c
> index 1444f3954d75..c3723443904a 100644
> --- a/kernel/capability.c
> +++ b/kernel/capability.c
> @@ -297,7 +297,7 @@ bool has_ns_capability(struct task_struct *t,
>  	int ret;
>  
>  	rcu_read_lock();
> -	ret = security_capable(__task_cred(t), ns, cap, CAP_OPT_NONE);
> +	ret = security_capable(__task_cred(t), ns, cap, CAP_OPT_NONE, NULL);
>  	rcu_read_unlock();
>  
>  	return (ret == 0);
> @@ -338,7 +338,7 @@ bool has_ns_capability_noaudit(struct task_struct *t,
>  	int ret;
>  
>  	rcu_read_lock();
> -	ret = security_capable(__task_cred(t), ns, cap, CAP_OPT_NOAUDIT);
> +	ret = security_capable(__task_cred(t), ns, cap, CAP_OPT_NOAUDIT, NULL);
>  	rcu_read_unlock();
>  
>  	return (ret == 0);
> @@ -363,7 +363,8 @@ bool has_capability_noaudit(struct task_struct *t, int cap)
>  
>  static bool ns_capable_common(struct user_namespace *ns,
>  			      int cap,
> -			      unsigned int opts)
> +			      unsigned int opts,
> +			      struct cap_aux_data *cad)
>  {
>  	int capable;
>  
> @@ -372,7 +373,7 @@ static bool ns_capable_common(struct user_namespace *ns,
>  		BUG();
>  	}
>  
> -	capable = security_capable(current_cred(), ns, cap, opts);
> +	capable = security_capable(current_cred(), ns, cap, opts, cad);
>  	if (capable == 0) {
>  		current->flags |= PF_SUPERPRIV;
>  		return true;
> @@ -393,7 +394,7 @@ static bool ns_capable_common(struct user_namespace *ns,
>   */
>  bool ns_capable(struct user_namespace *ns, int cap)
>  {
> -	return ns_capable_common(ns, cap, CAP_OPT_NONE);
> +	return ns_capable_common(ns, cap, CAP_OPT_NONE, NULL);
>  }
>  EXPORT_SYMBOL(ns_capable);
>  
> @@ -411,7 +412,7 @@ EXPORT_SYMBOL(ns_capable);
>   */
>  bool ns_capable_noaudit(struct user_namespace *ns, int cap)
>  {
> -	return ns_capable_common(ns, cap, CAP_OPT_NOAUDIT);
> +	return ns_capable_common(ns, cap, CAP_OPT_NOAUDIT, NULL);
>  }
>  EXPORT_SYMBOL(ns_capable_noaudit);
>  
> @@ -430,7 +431,7 @@ EXPORT_SYMBOL(ns_capable_noaudit);
>   */
>  bool ns_capable_setid(struct user_namespace *ns, int cap)
>  {
> -	return ns_capable_common(ns, cap, CAP_OPT_INSETID);
> +	return ns_capable_common(ns, cap, CAP_OPT_INSETID, NULL);
>  }
>  EXPORT_SYMBOL(ns_capable_setid);
>  
> @@ -470,7 +471,7 @@ bool file_ns_capable(const struct file *file, struct user_namespace *ns,
>  	if (WARN_ON_ONCE(!cap_valid(cap)))
>  		return false;
>  
> -	if (security_capable(file->f_cred, ns, cap, CAP_OPT_NONE) == 0)
> +	if (security_capable(file->f_cred, ns, cap, CAP_OPT_NONE, NULL) == 0)
>  		return true;
>  
>  	return false;
> @@ -503,7 +504,8 @@ bool capable_wrt_inode_uidgid(const struct inode *inode, int cap)
>  {
>  	struct user_namespace *ns = current_user_ns();
>  
> -	return ns_capable(ns, cap) && privileged_wrt_inode_uidgid(ns, inode);
> +	return ns_capable_inode(ns, cap, inode) &&
> +		privileged_wrt_inode_uidgid(ns, inode);
>  }
>  EXPORT_SYMBOL(capable_wrt_inode_uidgid);
>  
> @@ -524,7 +526,18 @@ bool ptracer_capable(struct task_struct *tsk, struct user_namespace *ns)
>  	cred = rcu_dereference(tsk->ptracer_cred);
>  	if (cred)
>  		ret = security_capable(cred, ns, CAP_SYS_PTRACE,
> -				       CAP_OPT_NOAUDIT);
> +				       CAP_OPT_NOAUDIT, NULL);
>  	rcu_read_unlock();
>  	return (ret == 0);
>  }
> +
> +bool ns_capable_inode(struct user_namespace *ns, int cap,
> +			const struct inode *inode)
> +{
> +	struct cap_aux_data cad;
> +
> +	cad.type = CAP_AUX_DATA_INODE;
> +	cad.u.inode = inode;
> +	return ns_capable_common(ns, cap, CAP_OPT_NONE, &cad);
> +}
> +EXPORT_SYMBOL(ns_capable_inode);
> diff --git a/kernel/seccomp.c b/kernel/seccomp.c
> index 811b4a86cdf6..d59dd7079ece 100644
> --- a/kernel/seccomp.c
> +++ b/kernel/seccomp.c
> @@ -446,7 +446,7 @@ static struct seccomp_filter *seccomp_prepare_filter(struct sock_fprog *fprog)
>  	 */
>  	if (!task_no_new_privs(current) &&
>  	    security_capable(current_cred(), current_user_ns(),
> -				     CAP_SYS_ADMIN, CAP_OPT_NOAUDIT) != 0)
> +			     CAP_SYS_ADMIN, CAP_OPT_NOAUDIT, NULL) != 0)
>  		return ERR_PTR(-EACCES);
>  
>  	/* Allocate a new seccomp_filter */
> diff --git a/security/apparmor/capability.c b/security/apparmor/capability.c
> index 752f73980e30..c45192a16733 100644
> --- a/security/apparmor/capability.c
> +++ b/security/apparmor/capability.c
> @@ -50,7 +50,7 @@ static void audit_cb(struct audit_buffer *ab, void *va)
>  	struct common_audit_data *sa = va;
>  
>  	audit_log_format(ab, " capname=");
> -	audit_log_untrustedstring(ab, capability_names[sa->u.cap]);
> +	audit_log_untrustedstring(ab, capability_names[sa->u.cap_struct.cap]);
>  }
>  
>  /**
> @@ -148,13 +148,15 @@ static int profile_capable(struct aa_profile *profile, int cap,
>   *
>   * Returns: 0 on success, or else an error code.
>   */
> -int aa_capable(struct aa_label *label, int cap, unsigned int opts)
> +int aa_capable(struct aa_label *label, int cap, unsigned int opts,
> +	       struct cap_aux_data *cad)
>  {
>  	struct aa_profile *profile;
>  	int error = 0;
>  	DEFINE_AUDIT_DATA(sa, LSM_AUDIT_DATA_CAP, OP_CAPABLE);
>  
> -	sa.u.cap = cap;
> +	sa.u.cap_struct.cap = cap;
> +	sa.u.cap_struct.cad = cad;
>  	error = fn_for_each_confined(label, profile,
>  			profile_capable(profile, cap, opts, &sa));
>  
> diff --git a/security/apparmor/include/capability.h b/security/apparmor/include/capability.h
> index 1b3663b6ab12..d888f09d76d1 100644
> --- a/security/apparmor/include/capability.h
> +++ b/security/apparmor/include/capability.h
> @@ -20,6 +20,7 @@
>  #include "apparmorfs.h"
>  
>  struct aa_label;
> +struct cap_aux_data;
>  
>  /* aa_caps - confinement data for capabilities
>   * @allowed: capabilities mask
> @@ -40,7 +41,8 @@ struct aa_caps {
>  
>  extern struct aa_sfs_entry aa_sfs_entry_caps[];
>  
> -int aa_capable(struct aa_label *label, int cap, unsigned int opts);
> +int aa_capable(struct aa_label *label, int cap, unsigned int opts,
> +	       struct cap_aux_data *cad);
>  
>  static inline void aa_free_cap_rules(struct aa_caps *caps)
>  {
> diff --git a/security/apparmor/ipc.c b/security/apparmor/ipc.c
> index aacd1e95cb59..deb5267ca695 100644
> --- a/security/apparmor/ipc.c
> +++ b/security/apparmor/ipc.c
> @@ -108,7 +108,7 @@ static int profile_tracer_perm(struct aa_profile *tracer,
>  	aad(sa)->peer = tracee;
>  	aad(sa)->request = 0;
>  	aad(sa)->error = aa_capable(&tracer->label, CAP_SYS_PTRACE,
> -				    CAP_OPT_NONE);
> +				    CAP_OPT_NONE, NULL);
>  
>  	return aa_audit(AUDIT_APPARMOR_AUTO, tracer, sa, audit_ptrace_cb);
>  }
> diff --git a/security/apparmor/lsm.c b/security/apparmor/lsm.c
> index 87500bde5a92..82790accb679 100644
> --- a/security/apparmor/lsm.c
> +++ b/security/apparmor/lsm.c
> @@ -172,14 +172,15 @@ static int apparmor_capget(struct task_struct *target, kernel_cap_t *effective,
>  }
>  
>  static int apparmor_capable(const struct cred *cred, struct user_namespace *ns,
> -			    int cap, unsigned int opts)
> +			    int cap, unsigned int opts,
> +			    struct cap_aux_data *cad)
>  {
>  	struct aa_label *label;
>  	int error = 0;
>  
>  	label = aa_get_newest_cred_label(cred);
>  	if (!unconfined(label))
> -		error = aa_capable(label, cap, opts);
> +		error = aa_capable(label, cap, opts, cad);
>  	aa_put_label(label);
>  
>  	return error;
> diff --git a/security/apparmor/resource.c b/security/apparmor/resource.c
> index 552ed09cb47e..9b3d4b4437f2 100644
> --- a/security/apparmor/resource.c
> +++ b/security/apparmor/resource.c
> @@ -124,7 +124,7 @@ int aa_task_setrlimit(struct aa_label *label, struct task_struct *task,
>  	 */
>  
>  	if (label != peer &&
> -	    aa_capable(label, CAP_SYS_RESOURCE, CAP_OPT_NOAUDIT) != 0)
> +	    aa_capable(label, CAP_SYS_RESOURCE, CAP_OPT_NOAUDIT, NULL) != 0)
>  		error = fn_for_each(label, profile,
>  				audit_resource(profile, resource,
>  					       new_rlim->rlim_max, peer,
> diff --git a/security/commoncap.c b/security/commoncap.c
> index c477fb673701..1860ea50f473 100644
> --- a/security/commoncap.c
> +++ b/security/commoncap.c
> @@ -68,7 +68,7 @@ static void warn_setuid_and_fcaps_mixed(const char *fname)
>   * kernel's capable() and has_capability() returns 1 for this case.
>   */
>  int cap_capable(const struct cred *cred, struct user_namespace *targ_ns,
> -		int cap, unsigned int opts)
> +		int cap, unsigned int opts, struct cap_aux_data *cad)
>  {
>  	struct user_namespace *ns = targ_ns;
>  
> @@ -226,7 +226,7 @@ static inline int cap_inh_is_capped(void)
>  	 * capability
>  	 */
>  	if (cap_capable(current_cred(), current_cred()->user_ns,
> -			CAP_SETPCAP, CAP_OPT_NONE) == 0)
> +			CAP_SETPCAP, CAP_OPT_NONE, NULL) == 0)
>  		return 0;
>  	return 1;
>  }
> @@ -1211,7 +1211,8 @@ int cap_task_prctl(int option, unsigned long arg2, unsigned long arg3,
>  		    || (cap_capable(current_cred(),
>  				    current_cred()->user_ns,
>  				    CAP_SETPCAP,
> -				    CAP_OPT_NONE) != 0)			/*[4]*/
> +				    CAP_OPT_NONE,
> +				    NULL) != 0)				/*[4]*/
>  			/*
>  			 * [1] no changing of bits that are locked
>  			 * [2] no unlocking of locks
> @@ -1307,7 +1308,7 @@ int cap_vm_enough_memory(struct mm_struct *mm, long pages)
>  	int cap_sys_admin = 0;
>  
>  	if (cap_capable(current_cred(), &init_user_ns,
> -				CAP_SYS_ADMIN, CAP_OPT_NOAUDIT) == 0)
> +				CAP_SYS_ADMIN, CAP_OPT_NOAUDIT, NULL) == 0)
>  		cap_sys_admin = 1;
>  
>  	return cap_sys_admin;
> @@ -1328,7 +1329,7 @@ int cap_mmap_addr(unsigned long addr)
>  
>  	if (addr < dac_mmap_min_addr) {
>  		ret = cap_capable(current_cred(), &init_user_ns, CAP_SYS_RAWIO,
> -				  CAP_OPT_NONE);
> +				  CAP_OPT_NONE, NULL);
>  		/* set PF_SUPERPRIV if it turns out we allow the low mmap */
>  		if (ret == 0)
>  			current->flags |= PF_SUPERPRIV;
> diff --git a/security/lsm_audit.c b/security/lsm_audit.c
> index 33028c098ef3..4871b2508a4a 100644
> --- a/security/lsm_audit.c
> +++ b/security/lsm_audit.c
> @@ -229,9 +229,26 @@ static void dump_common_audit_data(struct audit_buffer *ab,
>  	case LSM_AUDIT_DATA_IPC:
>  		audit_log_format(ab, " key=%d ", a->u.ipc_id);
>  		break;
> -	case LSM_AUDIT_DATA_CAP:
> -		audit_log_format(ab, " capability=%d ", a->u.cap);
> +	case LSM_AUDIT_DATA_CAP: {
> +		const struct inode *inode;
> +
> +		if (a->u.cap_struct.cad) {
> +			switch (a->u.cap_struct.cad->type) {
> +			case CAP_AUX_DATA_INODE: {

Putting a { after the 'case:' seems weird to me, and leads to the suspicion
arousing two brackets in a row on same indent level down below.

> +				inode = a->u.cap_struct.cad->u.inode;
> +
> +				audit_log_format(ab, " dev=");
> +				audit_log_untrustedstring(ab,
> +					inode->i_sb->s_id);
> +				audit_log_format(ab, " ino=%lu",
> +					inode->i_ino);
> +				break;
> +			}
> +			}
> +		}
> +		audit_log_format(ab, " capability=%d ", a->u.cap_struct.cap);
>  		break;
> +	}
>  	case LSM_AUDIT_DATA_PATH: {
>  		struct inode *inode;
>  
