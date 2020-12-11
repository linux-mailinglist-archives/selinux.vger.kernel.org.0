Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4FFD2D6B73
	for <lists+selinux@lfdr.de>; Fri, 11 Dec 2020 00:38:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728571AbgLJXCQ (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Thu, 10 Dec 2020 18:02:16 -0500
Received: from linux.microsoft.com ([13.77.154.182]:34560 "EHLO
        linux.microsoft.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731559AbgLJXBz (ORCPT
        <rfc822;selinux@vger.kernel.org>); Thu, 10 Dec 2020 18:01:55 -0500
Received: from sequoia (162-237-133-238.lightspeed.rcsntx.sbcglobal.net [162.237.133.238])
        by linux.microsoft.com (Postfix) with ESMTPSA id 0893C20B717A;
        Thu, 10 Dec 2020 14:38:55 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 0893C20B717A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
        s=default; t=1607639937;
        bh=zCKDPK/Mols2hyMNyMd1n0ZAchRN1KoGVSt3lHhjwgI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TtVYhy8/vlk0tai1qcfmIrPfRn/7N0V3tXw8VmeVhSonUhtWUwgeUnsBiYzn91XEU
         V7DP0tM6jSB268GVMOq5Kaivt562tKg5dYdVIIyC72J0koU1634mp88CqlOk47gtf0
         J2/Mr+1nY7BWfMfkBw8XpPWwc0AQIzNTQVNjQ3c4=
Date:   Thu, 10 Dec 2020 16:38:54 -0600
From:   Tyler Hicks <tyhicks@linux.microsoft.com>
To:     Tushar Sugandhi <tusharsu@linux.microsoft.com>
Cc:     zohar@linux.ibm.com, stephen.smalley.work@gmail.com,
        casey@schaufler-ca.com, agk@redhat.com, snitzer@redhat.com,
        gmazyland@gmail.com, paul@paul-moore.com, sashal@kernel.org,
        jmorris@namei.org, nramas@linux.microsoft.com,
        linux-integrity@vger.kernel.org, selinux@vger.kernel.org,
        linux-security-module@vger.kernel.org,
        linux-kernel@vger.kernel.org, dm-devel@redhat.com
Subject: Re: [PATCH v7 2/8] IMA: add support to measure buffer data hash
Message-ID: <20201210223854.GG489768@sequoia>
References: <20201209194212.5131-1-tusharsu@linux.microsoft.com>
 <20201209194212.5131-3-tusharsu@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201209194212.5131-3-tusharsu@linux.microsoft.com>
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On 2020-12-09 11:42:06, Tushar Sugandhi wrote:
> The original IMA buffer data measurement sizes were small (e.g. boot
> command line), but the new buffer data measurement use cases have data 
> sizes that are a lot larger.  Just as IMA measures the file data hash,
> not the file data, IMA should similarly support the option for measuring 
> the hash of the buffer data.
> 
> Measuring in-memory buffer-data/buffer-data-hash is different than
> measuring file-data/file-data-hash. For the file, IMA stores the
> measurements in both measurement log and the file's extended attribute -
> which can later be used for appraisal as well. For buffer, the
> measurements are only stored in the IMA log, since the buffer has no
> extended attributes associated with it.
> 
> Introduce a boolean parameter measure_buf_hash to support measuring
> hash of a buffer, which would be much smaller, instead of the buffer
> itself.
> 
> Signed-off-by: Tushar Sugandhi <tusharsu@linux.microsoft.com>
> ---
>  security/integrity/ima/ima.h                 |  3 +-
>  security/integrity/ima/ima_appraise.c        |  2 +-
>  security/integrity/ima/ima_asymmetric_keys.c |  2 +-
>  security/integrity/ima/ima_main.c            | 36 +++++++++++++++++---
>  security/integrity/ima/ima_queue_keys.c      |  3 +-
>  5 files changed, 38 insertions(+), 8 deletions(-)
> 
> diff --git a/security/integrity/ima/ima.h b/security/integrity/ima/ima.h
> index e5622ce8cbb1..fa3044a7539f 100644
> --- a/security/integrity/ima/ima.h
> +++ b/security/integrity/ima/ima.h
> @@ -268,7 +268,8 @@ void ima_store_measurement(struct integrity_iint_cache *iint, struct file *file,
>  			   struct ima_template_desc *template_desc);
>  void process_buffer_measurement(struct inode *inode, const void *buf, int size,
>  				const char *eventname, enum ima_hooks func,
> -				int pcr, const char *func_data);
> +				int pcr, const char *func_data,
> +				bool measure_buf_hash);
>  void ima_audit_measurement(struct integrity_iint_cache *iint,
>  			   const unsigned char *filename);
>  int ima_alloc_init_template(struct ima_event_data *event_data,
> diff --git a/security/integrity/ima/ima_appraise.c b/security/integrity/ima/ima_appraise.c
> index 8361941ee0a1..46ffa38bab12 100644
> --- a/security/integrity/ima/ima_appraise.c
> +++ b/security/integrity/ima/ima_appraise.c
> @@ -352,7 +352,7 @@ int ima_check_blacklist(struct integrity_iint_cache *iint,
>  		if ((rc == -EPERM) && (iint->flags & IMA_MEASURE))
>  			process_buffer_measurement(NULL, digest, digestsize,
>  						   "blacklisted-hash", NONE,
> -						   pcr, NULL);
> +						   pcr, NULL, false);
>  	}
>  
>  	return rc;
> diff --git a/security/integrity/ima/ima_asymmetric_keys.c b/security/integrity/ima/ima_asymmetric_keys.c
> index 1c68c500c26f..a74095793936 100644
> --- a/security/integrity/ima/ima_asymmetric_keys.c
> +++ b/security/integrity/ima/ima_asymmetric_keys.c
> @@ -60,5 +60,5 @@ void ima_post_key_create_or_update(struct key *keyring, struct key *key,
>  	 */
>  	process_buffer_measurement(NULL, payload, payload_len,
>  				   keyring->description, KEY_CHECK, 0,
> -				   keyring->description);
> +				   keyring->description, false);
>  }
> diff --git a/security/integrity/ima/ima_main.c b/security/integrity/ima/ima_main.c
> index e76ef4bfd0f4..03aad13e9e70 100644
> --- a/security/integrity/ima/ima_main.c
> +++ b/security/integrity/ima/ima_main.c
> @@ -779,7 +779,7 @@ int ima_post_load_data(char *buf, loff_t size,
>  }
>  
>  /*
> - * process_buffer_measurement - Measure the buffer to ima log.
> + * process_buffer_measurement - Measure the buffer or the buffer data hash
>   * @inode: inode associated with the object being measured (NULL for KEY_CHECK)
>   * @buf: pointer to the buffer that needs to be added to the log.
>   * @size: size of buffer(in bytes).
> @@ -787,12 +787,23 @@ int ima_post_load_data(char *buf, loff_t size,
>   * @func: IMA hook
>   * @pcr: pcr to extend the measurement
>   * @func_data: private data specific to @func, can be NULL.
> + * @measure_buf_hash: measure buffer hash
>   *
> - * Based on policy, the buffer is measured into the ima log.
> + * Measure the buffer into the IMA log, and extend the @pcr.
> + *
> + * Determine what buffers are allowed to be measured, based on the policy rules
> + * and the IMA hook passed using @func.
> + *
> + * Use @func_data, if provided, to match against the measurement policy rule
> + * data for @func.
> + *
> + * If @measure_buf_hash is set to true - measure hash of the buffer data,
> + * else measure the buffer data itself.
>   */
>  void process_buffer_measurement(struct inode *inode, const void *buf, int size,
>  				const char *eventname, enum ima_hooks func,
> -				int pcr, const char *func_data)
> +				int pcr, const char *func_data,
> +				bool measure_buf_hash)
>  {
>  	int ret = 0;
>  	const char *audit_cause = "ENOMEM";
> @@ -807,6 +818,8 @@ void process_buffer_measurement(struct inode *inode, const void *buf, int size,
>  		struct ima_digest_data hdr;
>  		char digest[IMA_MAX_DIGEST_SIZE];
>  	} hash = {};
> +	char buf_hash[IMA_MAX_DIGEST_SIZE];
> +	int buf_hash_len = hash_digest_size[ima_hash_algo];
>  	int violation = 0;
>  	int action = 0;
>  	u32 secid;
> @@ -849,6 +862,20 @@ void process_buffer_measurement(struct inode *inode, const void *buf, int size,
>  		goto out;
>  	}
>  
> +	if (measure_buf_hash) {
> +		memcpy(buf_hash, hash.hdr.digest, buf_hash_len);
> +
> +		ret = ima_calc_buffer_hash(buf_hash, buf_hash_len,
> +					   iint.ima_hash);
> +		if (ret < 0) {
> +			audit_cause = "measure_buf_hash_error";
> +			goto out;
> +		}
> +
> +		event_data.buf = buf_hash;
> +		event_data.buf_len = buf_hash_len;
> +	}
> +
>  	ret = ima_alloc_init_template(&event_data, &entry, template);
>  	if (ret < 0) {
>  		audit_cause = "alloc_entry";

A few more lines below, not present in this context, is a call to
ima_store_template() with buf as the fourth parameter passed in. That
parameter eventually makes its way to integrity_audit_message() and ends
up as part of an audit message as the value of the "name=" field. This
is usually a filename, the name of a key, or a kexec cmdline. In the
case of measuring SELinux policy, do we want the entire buf to be
included in the audit message?

Tyler

> @@ -890,7 +917,8 @@ void ima_kexec_cmdline(int kernel_fd, const void *buf, int size)
>  		return;
>  
>  	process_buffer_measurement(file_inode(f.file), buf, size,
> -				   "kexec-cmdline", KEXEC_CMDLINE, 0, NULL);
> +				   "kexec-cmdline", KEXEC_CMDLINE, 0, NULL,
> +				   false);
>  	fdput(f);
>  }
>  
> diff --git a/security/integrity/ima/ima_queue_keys.c b/security/integrity/ima/ima_queue_keys.c
> index 69a8626a35c0..c2f2ad34f9b7 100644
> --- a/security/integrity/ima/ima_queue_keys.c
> +++ b/security/integrity/ima/ima_queue_keys.c
> @@ -162,7 +162,8 @@ void ima_process_queued_keys(void)
>  						   entry->payload_len,
>  						   entry->keyring_name,
>  						   KEY_CHECK, 0,
> -						   entry->keyring_name);
> +						   entry->keyring_name,
> +						   false);
>  		list_del(&entry->list);
>  		ima_free_key_entry(entry);
>  	}
> -- 
> 2.17.1
> 
