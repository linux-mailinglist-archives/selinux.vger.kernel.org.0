Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB4692334F4
	for <lists+selinux@lfdr.de>; Thu, 30 Jul 2020 17:04:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729655AbgG3PE5 (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Thu, 30 Jul 2020 11:04:57 -0400
Received: from linux.microsoft.com ([13.77.154.182]:55546 "EHLO
        linux.microsoft.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726353AbgG3PE5 (ORCPT
        <rfc822;selinux@vger.kernel.org>); Thu, 30 Jul 2020 11:04:57 -0400
Received: from sequoia (162-237-133-238.lightspeed.rcsntx.sbcglobal.net [162.237.133.238])
        by linux.microsoft.com (Postfix) with ESMTPSA id 30B7220B4908;
        Thu, 30 Jul 2020 08:04:55 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 30B7220B4908
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
        s=default; t=1596121495;
        bh=v31BJTVHyQlJJEfYWsYP9CRDEvk6MrMJ0im0UMs3v4k=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZiWTUa81dt9xSPC+YdgQN8JvijlPXWjp4uwiWKdfWq9HFmTkV8T2HAO4JVZhoRVkz
         I0Tq7LBs9R/IJmOBlWtW0xo48qNtiQhGHuoHQ7pcSVUilytnTLtHw6WiCirwJIRD/A
         EwdugLBN1P1+CUc6EkG5GcA/dZYlEmNCL/k7lp4E=
Date:   Thu, 30 Jul 2020 10:04:53 -0500
From:   Tyler Hicks <tyhicks@linux.microsoft.com>
To:     Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
Cc:     zohar@linux.ibm.com, stephen.smalley.work@gmail.com,
        casey@schaufler-ca.com, sashal@kernel.org, jmorris@namei.org,
        linux-integrity@vger.kernel.org, selinux@vger.kernel.org,
        linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/4] IMA: Define IMA hooks to measure LSM state and
 policy
Message-ID: <20200730150453.GW4181@sequoia>
References: <20200730034724.3298-1-nramas@linux.microsoft.com>
 <20200730034724.3298-3-nramas@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200730034724.3298-3-nramas@linux.microsoft.com>
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On 2020-07-29 20:47:22, Lakshmi Ramasubramanian wrote:
> IMA subsystem needs to define IMA hooks that the security modules can
> call to measure state and policy data.
> 
> Define two new IMA hooks, namely ima_lsm_state() and ima_lsm_policy(),
> that the security modules can call to measure LSM state and LSM policy
> respectively. Return the status of the measurement operation from these
> two IMA hooks.
> 
> Signed-off-by: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>

Reviewed-by: Tyler Hicks <tyhicks@linux.microsoft.com>

Tyler

> ---
>  include/linux/ima.h               | 14 +++++++++
>  security/integrity/ima/ima.h      |  6 ++--
>  security/integrity/ima/ima_main.c | 50 ++++++++++++++++++++++++++-----
>  3 files changed, 60 insertions(+), 10 deletions(-)
> 
> diff --git a/include/linux/ima.h b/include/linux/ima.h
> index d15100de6cdd..442ca0dce3c8 100644
> --- a/include/linux/ima.h
> +++ b/include/linux/ima.h
> @@ -26,6 +26,10 @@ extern int ima_post_read_file(struct file *file, void *buf, loff_t size,
>  extern void ima_post_path_mknod(struct dentry *dentry);
>  extern int ima_file_hash(struct file *file, char *buf, size_t buf_size);
>  extern void ima_kexec_cmdline(int kernel_fd, const void *buf, int size);
> +extern int ima_measure_lsm_state(const char *lsm_event_name, const void *buf,
> +				 int size);
> +extern int ima_measure_lsm_policy(const char *lsm_event_name, const void *buf,
> +				  int size);
>  
>  #ifdef CONFIG_IMA_KEXEC
>  extern void ima_add_kexec_buffer(struct kimage *image);
> @@ -104,6 +108,16 @@ static inline int ima_file_hash(struct file *file, char *buf, size_t buf_size)
>  }
>  
>  static inline void ima_kexec_cmdline(int kernel_fd, const void *buf, int size) {}
> +static inline int ima_measure_lsm_state(const char *lsm_event_name,
> +					const void *buf, int size)
> +{
> +	return -EOPNOTSUPP;
> +}
> +static inline int ima_measure_lsm_policy(const char *lsm_event_name,
> +					 const void *buf, int size)
> +{
> +	return -EOPNOTSUPP;
> +}
>  #endif /* CONFIG_IMA */
>  
>  #ifndef CONFIG_IMA_KEXEC
> diff --git a/security/integrity/ima/ima.h b/security/integrity/ima/ima.h
> index 1b5f4b2f17d0..8ed9f5e1dd40 100644
> --- a/security/integrity/ima/ima.h
> +++ b/security/integrity/ima/ima.h
> @@ -267,9 +267,9 @@ void ima_store_measurement(struct integrity_iint_cache *iint, struct file *file,
>  			   struct evm_ima_xattr_data *xattr_value,
>  			   int xattr_len, const struct modsig *modsig, int pcr,
>  			   struct ima_template_desc *template_desc);
> -void process_buffer_measurement(struct inode *inode, const void *buf, int size,
> -				const char *eventname, enum ima_hooks func,
> -				int pcr, const char *keyring);
> +int process_buffer_measurement(struct inode *inode, const void *buf, int size,
> +			       const char *eventname, enum ima_hooks func,
> +			       int pcr, const char *keyring);
>  void ima_audit_measurement(struct integrity_iint_cache *iint,
>  			   const unsigned char *filename);
>  int ima_alloc_init_template(struct ima_event_data *event_data,
> diff --git a/security/integrity/ima/ima_main.c b/security/integrity/ima/ima_main.c
> index 8a91711ca79b..74d421e40c8f 100644
> --- a/security/integrity/ima/ima_main.c
> +++ b/security/integrity/ima/ima_main.c
> @@ -736,9 +736,9 @@ int ima_load_data(enum kernel_load_data_id id)
>   *
>   * Based on policy, the buffer is measured into the ima log.
>   */
> -void process_buffer_measurement(struct inode *inode, const void *buf, int size,
> -				const char *eventname, enum ima_hooks func,
> -				int pcr, const char *keyring)
> +int process_buffer_measurement(struct inode *inode, const void *buf, int size,
> +			       const char *eventname, enum ima_hooks func,
> +			       int pcr, const char *keyring)
>  {
>  	int ret = 0;
>  	const char *audit_cause = "ENOMEM";
> @@ -758,7 +758,7 @@ void process_buffer_measurement(struct inode *inode, const void *buf, int size,
>  	u32 secid;
>  
>  	if (!ima_policy_flag)
> -		return;
> +		return 0;
>  
>  	/*
>  	 * Both LSM hooks and auxilary based buffer measurements are
> @@ -772,7 +772,7 @@ void process_buffer_measurement(struct inode *inode, const void *buf, int size,
>  		action = ima_get_action(inode, current_cred(), secid, 0, func,
>  					&pcr, &template, keyring);
>  		if (!(action & IMA_MEASURE))
> -			return;
> +			return 0;
>  	}
>  
>  	if (!pcr)
> @@ -787,7 +787,7 @@ void process_buffer_measurement(struct inode *inode, const void *buf, int size,
>  			pr_err("template %s init failed, result: %d\n",
>  			       (strlen(template->name) ?
>  				template->name : template->fmt), ret);
> -			return;
> +			return ret;
>  		}
>  	}
>  
> @@ -819,7 +819,7 @@ void process_buffer_measurement(struct inode *inode, const void *buf, int size,
>  					func_measure_str(func),
>  					audit_cause, ret, 0, ret);
>  
> -	return;
> +	return ret;
>  }
>  
>  /**
> @@ -846,6 +846,42 @@ void ima_kexec_cmdline(int kernel_fd, const void *buf, int size)
>  	fdput(f);
>  }
>  
> +/**
> + * ima_measure_lsm_state - measure LSM specific state
> + * @lsm_event_name: LSM event
> + * @buf: pointer to buffer containing LSM specific state
> + * @size: Number of bytes in buf
> + *
> + * Buffers can only be measured, not appraised.
> + */
> +int ima_measure_lsm_state(const char *lsm_event_name, const void *buf,
> +			  int size)
> +{
> +	if (!lsm_event_name || !buf || !size)
> +		return -EINVAL;
> +
> +	return process_buffer_measurement(NULL, buf, size, lsm_event_name,
> +					  LSM_STATE, 0, NULL);
> +}
> +
> +/**
> + * ima_measure_lsm_policy - measure LSM specific policy
> + * @lsm_event_name: LSM event
> + * @buf: pointer to buffer containing LSM specific policy
> + * @size: Number of bytes in buf
> + *
> + * Buffers can only be measured, not appraised.
> + */
> +int ima_measure_lsm_policy(const char *lsm_event_name, const void *buf,
> +			   int size)
> +{
> +	if (!lsm_event_name || !buf || !size)
> +		return -EINVAL;
> +
> +	return process_buffer_measurement(NULL, buf, size, lsm_event_name,
> +					  LSM_POLICY, 0, NULL);
> +}
> +
>  static int __init init_ima(void)
>  {
>  	int error;
> -- 
> 2.27.0
