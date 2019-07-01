Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 69D9C51AF1
	for <lists+selinux@lfdr.de>; Mon, 24 Jun 2019 20:48:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726285AbfFXSsm (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Mon, 24 Jun 2019 14:48:42 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:50508 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726375AbfFXSsm (ORCPT
        <rfc822;selinux@vger.kernel.org>); Mon, 24 Jun 2019 14:48:42 -0400
Received: from static-50-53-46-226.bvtn.or.frontiernet.net ([50.53.46.226] helo=[192.168.192.153])
        by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_128_CBC_SHA1:16)
        (Exim 4.76)
        (envelope-from <john.johansen@canonical.com>)
        id 1hfU13-0000tu-LL; Mon, 24 Jun 2019 18:48:34 +0000
From:   John Johansen <john.johansen@canonical.com>
Subject: [PATCH v3 15/24] LSM: Specify which LSM to display
To:     Casey Schaufler <casey@schaufler-ca.com>,
        casey.schaufler@intel.com, jmorris@namei.org,
        linux-security-module@vger.kernel.org, selinux@vger.kernel.org
Cc:     keescook@chromium.org, penguin-kernel@i-love.sakura.ne.jp,
        paul@paul-moore.com, sds@tycho.nsa.gov
References: <20190621185233.6766-1-casey@schaufler-ca.com>
 <20190621185233.6766-16-casey@schaufler-ca.com>
Openpgp: preference=signencrypt
Autocrypt: addr=john.johansen@canonical.com; prefer-encrypt=mutual; keydata=
 xsFNBE5mrPoBEADAk19PsgVgBKkImmR2isPQ6o7KJhTTKjJdwVbkWSnNn+o6Up5knKP1f49E
 BQlceWg1yp/NwbR8ad+eSEO/uma/K+PqWvBptKC9SWD97FG4uB4/caomLEU97sLQMtnvGWdx
 rxVRGM4anzWYMgzz5TZmIiVTZ43Ou5VpaS1Vz1ZSxP3h/xKNZr/TcW5WQai8u3PWVnbkjhSZ
 PHv1BghN69qxEPomrJBm1gmtx3ZiVmFXluwTmTgJOkpFol7nbJ0ilnYHrA7SX3CtR1upeUpM
 a/WIanVO96WdTjHHIa43fbhmQube4txS3FcQLOJVqQsx6lE9B7qAppm9hQ10qPWwdfPy/+0W
 6AWtNu5ASiGVCInWzl2HBqYd/Zll93zUq+NIoCn8sDAM9iH+wtaGDcJywIGIn+edKNtK72AM
 gChTg/j1ZoWH6ZeWPjuUfubVzZto1FMoGJ/SF4MmdQG1iQNtf4sFZbEgXuy9cGi2bomF0zvy
 BJSANpxlKNBDYKzN6Kz09HUAkjlFMNgomL/cjqgABtAx59L+dVIZfaF281pIcUZzwvh5+JoG
 eOW5uBSMbE7L38nszooykIJ5XrAchkJxNfz7k+FnQeKEkNzEd2LWc3QF4BQZYRT6PHHga3Rg
 ykW5+1wTMqJILdmtaPbXrF3FvnV0LRPcv4xKx7B3fGm7ygdoowARAQABzR1Kb2huIEpvaGFu
 c2VuIDxqb2huQGpqbXgubmV0PsLBegQTAQoAJAIbAwULCQgHAwUVCgkICwUWAgMBAAIeAQIX
 gAUCTo0YVwIZAQAKCRAFLzZwGNXD2LxJD/9TJZCpwlncTgYeraEMeDfkWv8c1IsM1j0AmE4V
 tL+fE780ZVP9gkjgkdYSxt7ecETPTKMaZSisrl1RwqU0oogXdXQSpxrGH01icu/2n0jcYSqY
 KggPxy78BGs2LZq4XPfJTZmHZGnXGq/eDr/mSnj0aavBJmMZ6jbiPz6yHtBYPZ9fdo8btczw
 P41YeWoIu26/8II6f0Xm3VC5oAa8v7Rd+RWZa8TMwlhzHExxel3jtI7IzzOsnmE9/8Dm0ARD
 5iTLCXwR1cwI/J9BF/S1Xv8PN1huT3ItCNdatgp8zqoJkgPVjmvyL64Q3fEkYbfHOWsaba9/
 kAVtBNz9RTFh7IHDfECVaToujBd7BtPqr+qIjWFadJD3I5eLCVJvVrrolrCATlFtN3YkQs6J
 n1AiIVIU3bHR8Gjevgz5Ll6SCGHgRrkyRpnSYaU/uLgn37N6AYxi/QAL+by3CyEFLjzWAEvy
 Q8bq3Iucn7JEbhS/J//dUqLoeUf8tsGi00zmrITZYeFYARhQMtsfizIrVDtz1iPf/ZMp5gRB
 niyjpXn131cm3M3gv6HrQsAGnn8AJru8GDi5XJYIco/1+x/qEiN2nClaAOpbhzN2eUvPDY5W
 0q3bA/Zp2mfG52vbRI+tQ0Br1Hd/vsntUHO903mMZep2NzN3BZ5qEvPvG4rW5Zq2DpybWc7B
 TQROZqz6ARAAoqw6kkBhWyM1fvgamAVjeZ6nKEfnRWbkC94L1EsJLup3Wb2X0ABNOHSkbSD4
 pAuC2tKF/EGBt5CP7QdVKRGcQzAd6b2c1Idy9RLw6w4gi+nn/d1Pm1kkYhkSi5zWaIg0m5RQ
 Uk+El8zkf5tcE/1N0Z5OK2JhjwFu5bX0a0l4cFGWVQEciVMDKRtxMjEtk3SxFalm6ZdQ2pp2
 822clnq4zZ9mWu1d2waxiz+b5Ia4weDYa7n41URcBEUbJAgnicJkJtCTwyIxIW2KnVyOrjvk
 QzIBvaP0FdP2vvZoPMdlCIzOlIkPLgxE0IWueTXeBJhNs01pb8bLqmTIMlu4LvBELA/veiaj
 j5s8y542H/aHsfBf4MQUhHxO/BZV7h06KSUfIaY7OgAgKuGNB3UiaIUS5+a9gnEOQLDxKRy/
 a7Q1v9S+Nvx+7j8iH3jkQJhxT6ZBhZGRx0gkH3T+F0nNDm5NaJUsaswgJrqFZkUGd2Mrm1qn
 KwXiAt8SIcENdq33R0KKKRC80Xgwj8Jn30vXLSG+NO1GH0UMcAxMwy/pvk6LU5JGjZR73J5U
 LVhH4MLbDggD3mPaiG8+fotTrJUPqqhg9hyUEPpYG7sqt74Xn79+CEZcjLHzyl6vAFE2W0kx
 lLtQtUZUHO36afFv8qGpO3ZqPvjBUuatXF6tvUQCwf3H6XMAEQEAAcLBXwQYAQoACQUCTmas
 +gIbDAAKCRAFLzZwGNXD2D/XD/0ddM/4ai1b+Tl1jznKajX3kG+MeEYeI4f40vco3rOLrnRG
 FOcbyyfVF69MKepie4OwoI1jcTU0ADecnbWnDNHpr0SczxBMro3bnrLhsmvjunTYIvssBZtB
 4aVJjuLILPUlnhFqa7fbVq0ZQjbiV/rt2jBENdm9pbJZ6GjnpYIcAbPCCa/ffL4/SQRSYHXo
 hGiiS4y5jBTmK5ltfewLOw02fkexH+IJFrrGBXDSg6n2Sgxnn++NF34fXcm9piaw3mKsICm+
 0hdNh4afGZ6IWV8PG2teooVDp4dYih++xX/XS8zBCc1O9w4nzlP2gKzlqSWbhiWpifRJBFa4
 WtAeJTdXYd37j/BI4RWWhnyw7aAPNGj33ytGHNUf6Ro2/jtj4tF1y/QFXqjJG/wGjpdtRfbt
 UjqLHIsvfPNNJq/958p74ndACidlWSHzj+Op26KpbFnmwNO0psiUsnhvHFwPO/vAbl3RsR5+
 0Ro+hvs2cEmQuv9r/bDlCfpzp2t3cK+rhxUqisOx8DZfz1BnkaoCRFbvvvk+7L/fomPntGPk
 qJciYE8TGHkZw1hOku+4OoM2GB5nEDlj+2TF/jLQ+EipX9PkPJYvxfRlC6dK8PKKfX9KdfmA
 IcgHfnV1jSn+8yH2djBPtKiqW0J69aIsyx7iV/03paPCjJh7Xq9vAzydN5U/UA==
Organization: Canonical
Message-ID: <eb2c3cd3-0de4-807a-ec67-3f11a83cb100@canonical.com>
Date:   Mon, 24 Jun 2019 11:48:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190621185233.6766-16-casey@schaufler-ca.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On 6/21/19 11:52 AM, Casey Schaufler wrote:
> Create a new entry "display" in /proc/.../attr for controlling
> which LSM security information is displayed for a process.
> The name of an active LSM that supplies hooks for human readable
> data may be written to "display" to set the value. The name of
> the LSM currently in use can be read from "display".
> At this point there can only be one LSM capable of display
> active.
> 
> Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>


there is small issue, see below


Also I want to get rid of the list search for the display lsm
but that can come as a separate patch later


> ---
>  fs/proc/base.c      |   1 +
>  security/security.c | 110 +++++++++++++++++++++++++++++++++++---------
>  2 files changed, 90 insertions(+), 21 deletions(-)
> 
> diff --git a/fs/proc/base.c b/fs/proc/base.c
> index ddef482f1334..7bf70e041315 100644
> --- a/fs/proc/base.c
> +++ b/fs/proc/base.c
> @@ -2618,6 +2618,7 @@ static const struct pid_entry attr_dir_stuff[] = {
>  	ATTR(NULL, "fscreate",		0666),
>  	ATTR(NULL, "keycreate",		0666),
>  	ATTR(NULL, "sockcreate",	0666),
> +	ATTR(NULL, "display",		0666),
>  #ifdef CONFIG_SECURITY_SMACK
>  	DIR("smack",			0555,
>  	    proc_smack_attr_dir_inode_ops, proc_smack_attr_dir_ops),
> diff --git a/security/security.c b/security/security.c
> index aa8e1c73a062..92c5aa427b53 100644
> --- a/security/security.c
> +++ b/security/security.c
> @@ -46,7 +46,9 @@ static struct kmem_cache *lsm_file_cache;
>  static struct kmem_cache *lsm_inode_cache;
>  
>  char *lsm_names;
> -static struct lsm_blob_sizes blob_sizes __lsm_ro_after_init;
> +static struct lsm_blob_sizes blob_sizes __lsm_ro_after_init = {
> +	.lbs_task = sizeof(int),	/* slot number for the "display" LSM */
> +};
>  
>  /* Boot-time LSM user choice */
>  static __initdata const char *chosen_lsm_order;
> @@ -583,6 +585,8 @@ int lsm_inode_alloc(struct inode *inode)
>   */
>  static int lsm_task_alloc(struct task_struct *task)
>  {
> +	int *display;
> +
>  	if (blob_sizes.lbs_task == 0) {
>  		task->security = NULL;
>  		return 0;
> @@ -591,6 +595,15 @@ static int lsm_task_alloc(struct task_struct *task)
>  	task->security = kzalloc(blob_sizes.lbs_task, GFP_KERNEL);
>  	if (task->security == NULL)
>  		return -ENOMEM;
> +
> +	/*
> +	 * The start of the task blob contains the "display" LSM slot number.
> +	 * Start with it set to the invalid slot number, indicating that the
> +	 * default first registered LSM be displayed.
> +	 */
> +	display = task->security;
> +	*display = LSMBLOB_INVALID;
> +
>  	return 0;
>  }
>  
> @@ -1579,14 +1592,24 @@ int security_file_open(struct file *file)
>  
>  int security_task_alloc(struct task_struct *task, unsigned long clone_flags)
>  {
> +	int *odisplay = current->security;
> +	int *ndisplay;
>  	int rc = lsm_task_alloc(task);
>  
> -	if (rc)
> +	if (unlikely(rc))
>  		return rc;
> +
>  	rc = call_int_hook(task_alloc, 0, task, clone_flags);
> -	if (unlikely(rc))
> +	if (unlikely(rc)) {
>  		security_task_free(task);
> -	return rc;
> +		return rc;
> +	}
> +
> +	ndisplay = task->security;
> +	if (ndisplay && odisplay)
> +		*ndisplay = *odisplay;
> +
> +	return 0;
>  }
>  
>  void security_task_free(struct task_struct *task)
> @@ -1972,10 +1995,28 @@ int security_getprocattr(struct task_struct *p, const char *lsm, char *name,
>  				char **value)
>  {
>  	struct security_hook_list *hp;
> +	int *display = current->security;
> +
> +	if (!strcmp(name, "display")) {
> +		hlist_for_each_entry(hp, &security_hook_heads.secid_to_secctx,
> +				     list) {
> +			if (*display == LSMBLOB_INVALID ||
> +			    hp->slot == *display) {
> +				*value = kstrdup(hp->lsm, GFP_KERNEL);
> +				if (*value)
> +					return strlen(hp->lsm);
> +				return -ENOMEM;
> +			}
> +		}
> +		return -EINVAL;
> +	}
>  
>  	hlist_for_each_entry(hp, &security_hook_heads.getprocattr, list) {
>  		if (lsm != NULL && strcmp(lsm, hp->lsm))
>  			continue;
> +		if (lsm == NULL && *display != LSMBLOB_INVALID &&
> +		    *display != hp->slot)
> +			continue;
>  		return hp->hook.getprocattr(p, name, value);
>  	}
>  	return -EINVAL;
> @@ -1985,10 +2026,27 @@ int security_setprocattr(const char *lsm, const char *name, void *value,
>  			 size_t size)
>  {
>  	struct security_hook_list *hp;
> +	int *display = current->security;
> +	int len;
> +
> +	if (!strcmp(name, "display")) {
> +		hlist_for_each_entry(hp, &security_hook_heads.secid_to_secctx,
> +				     list) {
> +			len = strlen(hp->lsm);
> +			if (size >= len && !strncmp(value, hp->lsm, len)) {

This isn't quite right. It allows a value that contains a prefix of an lsm to match. That
is
  selinux2
etc would match to selinux. While it isn't a real problem atm. Its not something I
want as part of the user space API which would make it so we can't fix it.




> +				*display = hp->slot;
> +				return size;
> +			}
> +		}
> +		return -EINVAL;
> +	}
>  
>  	hlist_for_each_entry(hp, &security_hook_heads.setprocattr, list) {
>  		if (lsm != NULL && strcmp(lsm, hp->lsm))
>  			continue;
> +		if (lsm == NULL && *display != LSMBLOB_INVALID &&
> +		    *display != hp->slot)
> +			continue;
>  		return hp->hook.setprocattr(name, value, size);
>  	}
>  	return -EINVAL;
> @@ -2008,14 +2066,12 @@ EXPORT_SYMBOL(security_ismaclabel);
>  int security_secid_to_secctx(struct lsmblob *blob, char **secdata, u32 *seclen)
>  {
>  	struct security_hook_list *hp;
> -	int rc;
> +	int *display = current->security;
>  
> -	hlist_for_each_entry(hp, &security_hook_heads.secid_to_secctx, list) {
> -		rc = hp->hook.secid_to_secctx(blob->secid[hp->slot],
> -					      secdata, seclen);
> -		if (rc != 0)
> -			return rc;
> -	}
> +	hlist_for_each_entry(hp, &security_hook_heads.secid_to_secctx, list)
> +		if (*display == LSMBLOB_INVALID || *display == hp->slot)
> +			return hp->hook.secid_to_secctx(blob->secid[hp->slot],
> +							secdata, seclen);
>  	return 0;
>  }
>  EXPORT_SYMBOL(security_secid_to_secctx);
> @@ -2024,22 +2080,27 @@ int security_secctx_to_secid(const char *secdata, u32 seclen,
>  			     struct lsmblob *blob)
>  {
>  	struct security_hook_list *hp;
> -	int rc;
> +	int *display = current->security;
>  
>  	lsmblob_init(blob, 0);
> -	hlist_for_each_entry(hp, &security_hook_heads.secctx_to_secid, list) {
> -		rc = hp->hook.secctx_to_secid(secdata, seclen,
> -					      &blob->secid[hp->slot]);
> -		if (rc != 0)
> -			return rc;
> -	}
> +	hlist_for_each_entry(hp, &security_hook_heads.secctx_to_secid, list)
> +		if (*display == LSMBLOB_INVALID || *display == hp->slot)
> +			return hp->hook.secctx_to_secid(secdata, seclen,
> +							&blob->secid[hp->slot]);
>  	return 0;
>  }
>  EXPORT_SYMBOL(security_secctx_to_secid);
>  
>  void security_release_secctx(char *secdata, u32 seclen)
>  {
> -	call_void_hook(release_secctx, secdata, seclen);
> +	struct security_hook_list *hp;
> +	int *display = current->security;
> +
> +	hlist_for_each_entry(hp, &security_hook_heads.release_secctx, list)
> +		if (*display == LSMBLOB_INVALID || *display == hp->slot) {
> +			hp->hook.release_secctx(secdata, seclen);
> +			return;
> +		}
>  }
>  EXPORT_SYMBOL(security_release_secctx);
>  
> @@ -2164,8 +2225,15 @@ EXPORT_SYMBOL(security_sock_rcv_skb);
>  int security_socket_getpeersec_stream(struct socket *sock, char __user *optval,
>  				      int __user *optlen, unsigned len)
>  {
> -	return call_int_hook(socket_getpeersec_stream, -ENOPROTOOPT, sock,
> -				optval, optlen, len);
> +	int *display = current->security;
> +	struct security_hook_list *hp;
> +
> +	hlist_for_each_entry(hp, &security_hook_heads.socket_getpeersec_stream,
> +			     list)
> +		if (*display == LSMBLOB_INVALID || *display == hp->slot)
> +			return hp->hook.socket_getpeersec_stream(sock, optval,
> +								 optlen, len);
> +	return -ENOPROTOOPT;
>  }
>  
>  int security_socket_getpeersec_dgram(struct socket *sock, struct sk_buff *skb,
> 



