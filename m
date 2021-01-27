Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9BB0D304EB6
	for <lists+selinux@lfdr.de>; Wed, 27 Jan 2021 02:23:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404610AbhA0AxK (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Tue, 26 Jan 2021 19:53:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48889 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2394837AbhAZSob (ORCPT
        <rfc822;selinux@vger.kernel.org>); Tue, 26 Jan 2021 13:44:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1611686584;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=KGHdetCJush3K+fWXeFM7UR5m16TdWTXEUMSsFL3aak=;
        b=IOHd9nb9SejSwFo9OMWAcnRJcc7ZxgRYEHMtT2XJzzJTyX5Ej7FGkYi2tjKJa9aHxersuB
        g0YO4i0GOzkx/76QhMVg7mfOdK4RHaaoWtSiLhs7g9KPN5ys9GaPy7CBFQ8dPFdN5PLCvw
        8PNWtjH2blfrv7/0xAhVRjfGiDolfV4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-277-5chqgj35MoeUn93n_XVp9Q-1; Tue, 26 Jan 2021 13:43:00 -0500
X-MC-Unique: 5chqgj35MoeUn93n_XVp9Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 28C111005504;
        Tue, 26 Jan 2021 18:42:58 +0000 (UTC)
Received: from madcap2.tricolour.ca (unknown [10.10.110.8])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 76BE65D761;
        Tue, 26 Jan 2021 18:42:49 +0000 (UTC)
Date:   Tue, 26 Jan 2021 13:42:46 -0500
From:   Richard Guy Briggs <rgb@redhat.com>
To:     Casey Schaufler <casey@schaufler-ca.com>
Cc:     casey.schaufler@intel.com, jmorris@namei.org,
        linux-security-module@vger.kernel.org, selinux@vger.kernel.org,
        linux-audit@redhat.com, keescook@chromium.org,
        john.johansen@canonical.com, penguin-kernel@i-love.sakura.ne.jp,
        paul@paul-moore.com, sds@tycho.nsa.gov,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v24 21/25] audit: add support for non-syscall auxiliary
 records
Message-ID: <20210126184246.GM1762914@madcap2.tricolour.ca>
References: <20210126164108.1958-1-casey@schaufler-ca.com>
 <20210126164108.1958-22-casey@schaufler-ca.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210126164108.1958-22-casey@schaufler-ca.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On 2021-01-26 08:41, Casey Schaufler wrote:
> Standalone audit records have the timestamp and serial number generated
> on the fly and as such are unique, making them standalone.  This new
> function audit_alloc_local() generates a local audit context that will
> be used only for a standalone record and its auxiliary record(s).  The
> context is discarded immediately after the local associated records are
> produced.
> 
> Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
> Cc: linux-audit@redhat.com
> To: Richard Guy Briggs <rgb@redhat.com>

This has been minorly bothering me for several revisions...  Is there a
way for the development/authorship to be accurately reflected
if/when this patch is merged before the contid patch set?

> ---
>  include/linux/audit.h |  8 ++++++++
>  kernel/audit.h        |  1 +
>  kernel/auditsc.c      | 33 ++++++++++++++++++++++++++++-----
>  3 files changed, 37 insertions(+), 5 deletions(-)
> 
> diff --git a/include/linux/audit.h b/include/linux/audit.h
> index 418a485af114..97cd7471e572 100644
> --- a/include/linux/audit.h
> +++ b/include/linux/audit.h
> @@ -289,6 +289,8 @@ static inline int audit_signal_info(int sig, struct task_struct *t)
>  				/* Public API */
>  extern int  audit_alloc(struct task_struct *task);
>  extern void __audit_free(struct task_struct *task);
> +extern struct audit_context *audit_alloc_local(gfp_t gfpflags);
> +extern void audit_free_context(struct audit_context *context);
>  extern void __audit_syscall_entry(int major, unsigned long a0, unsigned long a1,
>  				  unsigned long a2, unsigned long a3);
>  extern void __audit_syscall_exit(int ret_success, long ret_value);
> @@ -552,6 +554,12 @@ static inline void audit_log_nfcfg(const char *name, u8 af,
>  extern int audit_n_rules;
>  extern int audit_signals;
>  #else /* CONFIG_AUDITSYSCALL */
> ++static inline struct audit_context *audit_alloc_local(gfp_t gfpflags)
> +{
> +	return NULL;
> +}
> +static inline void audit_free_context(struct audit_context *context)
> +{ }
>  static inline int audit_alloc(struct task_struct *task)
>  {
>  	return 0;
> diff --git a/kernel/audit.h b/kernel/audit.h
> index ce41886807bb..3f2285e1c6e0 100644
> --- a/kernel/audit.h
> +++ b/kernel/audit.h
> @@ -99,6 +99,7 @@ struct audit_proctitle {
>  struct audit_context {
>  	int		    dummy;	/* must be the first element */
>  	int		    in_syscall;	/* 1 if task is in a syscall */
> +	bool		    local;	/* local context needed */
>  	enum audit_state    state, current_state;
>  	unsigned int	    serial;     /* serial number for record */
>  	int		    major;      /* syscall number */
> diff --git a/kernel/auditsc.c b/kernel/auditsc.c
> index de2b2ecb3aea..479b3933d788 100644
> --- a/kernel/auditsc.c
> +++ b/kernel/auditsc.c
> @@ -927,11 +927,13 @@ static inline void audit_free_aux(struct audit_context *context)
>  	}
>  }
>  
> -static inline struct audit_context *audit_alloc_context(enum audit_state state)
> +static inline struct audit_context *audit_alloc_context(enum audit_state state,
> +							gfp_t gfpflags)
>  {
>  	struct audit_context *context;
>  
> -	context = kzalloc(sizeof(*context), GFP_KERNEL);
> +	/* We can be called in atomic context via audit_tg() */
> +	context = kzalloc(sizeof(*context), gfpflags);
>  	if (!context)
>  		return NULL;
>  	context->state = state;
> @@ -967,7 +969,8 @@ int audit_alloc(struct task_struct *tsk)
>  		return 0;
>  	}
>  
> -	if (!(context = audit_alloc_context(state))) {
> +	context = audit_alloc_context(state, GFP_KERNEL);
> +	if (!context) {
>  		kfree(key);
>  		audit_log_lost("out of memory in audit_alloc");
>  		return -ENOMEM;
> @@ -979,8 +982,27 @@ int audit_alloc(struct task_struct *tsk)
>  	return 0;
>  }
>  
> -static inline void audit_free_context(struct audit_context *context)
> +struct audit_context *audit_alloc_local(gfp_t gfpflags)
>  {
> +	struct audit_context *context = NULL;
> +
> +	context = audit_alloc_context(AUDIT_RECORD_CONTEXT, gfpflags);
> +	if (!context) {
> +		audit_log_lost("out of memory in audit_alloc_local");
> +		goto out;
> +	}
> +	context->serial = audit_serial();
> +	ktime_get_coarse_real_ts64(&context->ctime);
> +	context->local = true;
> +out:
> +	return context;
> +}
> +EXPORT_SYMBOL(audit_alloc_local);
> +
> +void audit_free_context(struct audit_context *context)
> +{
> +	if (!context)
> +		return;
>  	audit_free_module(context);
>  	audit_free_names(context);
>  	unroll_tree_refs(context, NULL, 0);
> @@ -991,6 +1013,7 @@ static inline void audit_free_context(struct audit_context *context)
>  	audit_proctitle_free(context);
>  	kfree(context);
>  }
> +EXPORT_SYMBOL(audit_free_context);
>  
>  static int audit_log_pid_context(struct audit_context *context, pid_t pid,
>  				 kuid_t auid, kuid_t uid,
> @@ -2214,7 +2237,7 @@ EXPORT_SYMBOL_GPL(__audit_inode_child);
>  int auditsc_get_stamp(struct audit_context *ctx,
>  		       struct timespec64 *t, unsigned int *serial)
>  {
> -	if (!ctx->in_syscall)
> +	if (!ctx->in_syscall && !ctx->local)
>  		return 0;
>  	if (!ctx->serial)
>  		ctx->serial = audit_serial();
> -- 
> 2.25.4
> 

- RGB

--
Richard Guy Briggs <rgb@redhat.com>
Sr. S/W Engineer, Kernel Security, Base Operating Systems
Remote, Ottawa, Red Hat Canada
IRC: rgb, SunRaycer
Voice: +1.647.777.2635, Internal: (81) 32635

