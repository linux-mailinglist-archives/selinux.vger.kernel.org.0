Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A17A2EA1D7
	for <lists+selinux@lfdr.de>; Wed, 30 Oct 2019 17:35:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726673AbfJ3QfA (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Wed, 30 Oct 2019 12:35:00 -0400
Received: from UCOL19PA35.eemsg.mail.mil ([214.24.24.195]:7990 "EHLO
        UCOL19PA35.eemsg.mail.mil" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726261AbfJ3Qe7 (ORCPT
        <rfc822;selinux@vger.kernel.org>); Wed, 30 Oct 2019 12:34:59 -0400
X-EEMSG-check-017: 43223596|UCOL19PA35_ESA_OUT02.csd.disa.mil
X-IronPort-AV: E=Sophos;i="5.68,248,1569283200"; 
   d="scan'208";a="43223596"
Received: from emsm-gh1-uea10.ncsc.mil ([214.29.60.2])
  by UCOL19PA35.eemsg.mail.mil with ESMTP/TLS/DHE-RSA-AES256-SHA256; 30 Oct 2019 16:32:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tycho.nsa.gov; i=@tycho.nsa.gov; q=dns/txt;
  s=tycho.nsa.gov; t=1572453174; x=1603989174;
  h=subject:from:to:cc:references:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=KoF/voHzvc01lzYdZ5BexlayLQi5oVoIIkw9xHvZ118=;
  b=qiWpCh+W0PSNWFuhZDfT+hf0RG0C+fgSIl1ix3MteVZ+Kq9Ic8qbJf9S
   gJKmiCeNUHXhWSqU6/idfQ/jhWHrsQYsy5FeCfpMc8UmORWifwkCPFvSM
   cjfnfg9QYzAqKhzdrINU8kt6sroTGUSxE6Rew2GCPZAsx2Hv44u6IkK89
   YpZ31kskPwenNrOjUDU/3mbPUW5oPZ5Pkh7ub4LyNDpmNxcvdPvHWO9Xq
   ZUtz86FELDLxmAzym6kaSYiWzhgcWWeUQCwvXFUbY9oFwRD96f73szk5e
   huXxK+U/gko6XcofodJR23OBec1MtkEImG7oMK6UL6/oplVTuoMbFtsDO
   g==;
X-IronPort-AV: E=Sophos;i="5.68,248,1569283200"; 
   d="scan'208";a="29567527"
IronPort-PHdr: =?us-ascii?q?9a23=3A9R2NwBZzyHUKpNCe2sKUUy7/LSx+4OfEezUN45?=
 =?us-ascii?q?9isYplN5qZpsyyZB7h7PlgxGXEQZ/co6odzbaP6Oa5ATdLscfJmUtBWaQEbw?=
 =?us-ascii?q?UCh8QSkl5oK+++Imq/EsTXaTcnFt9JTl5v8iLzG0FUHMHjew+a+SXqvnYdFR?=
 =?us-ascii?q?rlKAV6OPn+FJLMgMSrzeCy/IDYbxlViDanbr5+MRu7oR/MusUKj4ZuJaU8xx?=
 =?us-ascii?q?/UqXZUZupawn9lK0iOlBjm/Mew+5Bj8yVUu/0/8sNLTLv3caclQ7FGFToqK2?=
 =?us-ascii?q?866tHluhnFVguP+2ATUn4KnRpSAgjK9w/1U5HsuSbnrOV92S2aPcrrTbAoXD?=
 =?us-ascii?q?mp8qlmRAP0hCoBKjU063/chNBug61HoRKhvx1/zJDSYIGJL/p1Y6fRccoHSW?=
 =?us-ascii?q?ZdQspdUipMDY2mb4sLEuEPI+BWoYfgrFcKtBezCw2hCObpxzRVhHH5wLc63v?=
 =?us-ascii?q?w8Hw/GwgIgEdEAvnrao9r6NqgdTe+7wbLUzTjAdf5axSvx5YbKfx0nvPqCXa?=
 =?us-ascii?q?hwcc3UyUQ3Cg3FkkufqZTlPzyL0OQGrnWV7+96WuKrj24otQFwqSWoy8c3l4?=
 =?us-ascii?q?bJnZkYykzE9CplwIY1Ise0SEhgYdG+CpdQuCaaN5VvT84kXmpmtiE6yrgctp?=
 =?us-ascii?q?66eigH0Jsnxx/Da/yHboiH+QjvW/qWITd9gn9uZbGxhw6q/ES9xeDxWdO43V?=
 =?us-ascii?q?ZXoiZfjNXBuW4B2wbO5sWBV/Bz5F2u2SyV2ADW8uxEJEc0mrfFJJM52b4wk4?=
 =?us-ascii?q?YTsVzEHi/rhEX6lK+WeVsg+uiv8+nnfq/ppoWdN49pkQHyKLgum8yjDuQ4NQ?=
 =?us-ascii?q?gCRW6b9vin1LL/50H5RbRKjvkunqnYtpDVO9gbq7akDwJa3Ysv8RayAyq83N?=
 =?us-ascii?q?gGknQLMkhJdA+fg4jsIV7OIfT4Dfmlg1SrlTdm3+vGMaD6ApjWMnjCkKvufb?=
 =?us-ascii?q?Z660JGzgoz1spQ64hbCrEGPvL/QlXxu8DADh8lLwy0xP7qCNdj2YMQV2KPHL?=
 =?us-ascii?q?SUMKzVsV+P6eIvJ/eDaJUJtzb6Lvgv/+TugmMhmV8BYamp2oMaaGumEfRiIk?=
 =?us-ascii?q?WZZ2fsg9gaHGcUsQoxUvbqhEeBUTFNfXayWbwz5jUhBIKhF4fDSZingKad0y?=
 =?us-ascii?q?ejAp1WemdGB0iOEXfvaYWLQfEMZziRIsJ6nTwEUr+hS4Al1R6wrgP1171nLu?=
 =?us-ascii?q?/M8C0CqZ3jzMR15/HUlRwq8jx0CsOd03qLT25ugmwHWSQ73LphrkNgyleMy7?=
 =?us-ascii?q?R4j+ZEGtxU4vNDSh06OoLEz+xmF9DyXRrMfs+TR1a7RtWrGikxQcgsw98Kek?=
 =?us-ascii?q?p9HtKijhfZ3yW0GbMai7uLBJlnup7bilr8Kcg19X/A2KQ7x2I6RcZXfTmki6?=
 =?us-ascii?q?Bx6SDcAInGl0jfnKGvI+BUxyPJ9WGe3UKQs0xCFg19S6PIWTYYfESFg87+4x?=
 =?us-ascii?q?b5U7K2CbkhejBEwMqGJ7oCPsblln1aVfzjP5LYeGv3lGCuU0XbjoiQZZbnLj?=
 =?us-ascii?q?1OlB7WD1IJxkVKpieL?=
X-IPAS-Result: =?us-ascii?q?A2CfAAAuurld/wHyM5BcCBoBAQEBAQEBAQEDAQEBAREBA?=
 =?us-ascii?q?QECAgEBAQGBfYF0LGxVMiqEKI9ZAQEBBoERJX+IZIVFigWBEANUCQEBAQEBA?=
 =?us-ascii?q?QEBASsJAQIBAYRAAoNmJDgTAgwBAQEEAQEBAQEFAwEBbIU3DII7KQGCbQEFG?=
 =?us-ascii?q?gEIBAsBBUEQCQIYAgImAgJXBgEMBgIBAYJfPwGCUiUPlzObcX8ziQ+BSIEOK?=
 =?us-ascii?q?IwRGHiBB4ERJwyCKjU+gmICgTwNgyiCXgSMbxoKiluWAIIugjOEXY4bBhuCP?=
 =?us-ascii?q?HKLFosajkCILJMzIjeBISsIAhgIIQ87gmwJRxAUgw8CAReDUIVChS0lAzCBB?=
 =?us-ascii?q?QEBjWUBAQ?=
Received: from tarius.tycho.ncsc.mil ([144.51.242.1])
  by EMSM-GH1-UEA10.NCSC.MIL with ESMTP; 30 Oct 2019 16:32:53 +0000
Received: from moss-pluto.infosec.tycho.ncsc.mil (moss-pluto [192.168.25.131])
        by tarius.tycho.ncsc.mil (8.14.4/8.14.4) with ESMTP id x9UGWq7l005759;
        Wed, 30 Oct 2019 12:32:52 -0400
Subject: Re: [PATCH] selinux: sidtab: reverse lookup hash table
From:   Stephen Smalley <sds@tycho.nsa.gov>
To:     Jeff Vander Stoep <jeffv@google.com>, selinux@vger.kernel.org
Cc:     Jovana Knezevic <jovanak@google.com>,
        Ondrej Mosnacek <omosnace@redhat.com>,
        Paul Moore <paul@paul-moore.com>
References: <20191030101949.191788-1-jeffv@google.com>
 <b48c1e53-f51a-8e56-967b-79e2e8d6daa4@tycho.nsa.gov>
Message-ID: <6d623c38-320a-4660-2305-87dd562eb39a@tycho.nsa.gov>
Date:   Wed, 30 Oct 2019 12:32:52 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <b48c1e53-f51a-8e56-967b-79e2e8d6daa4@tycho.nsa.gov>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On 10/30/19 11:24 AM, Stephen Smalley wrote:
> On 10/30/19 6:19 AM, Jeff Vander Stoep wrote:
>> This replaces the reverse table lookup and reverse cache with a
>> hashtable which improves cache-miss reverese-lookup times from
>> O(n) to O(1) and maintains the same performance as a reverse
>> cache hit.
>>
>> This reduces the time needed to add a new sidtab entry from ~500us
>> to 5us on a Pixel 3 when there are ~10,000 sidtab entries.
>>
>> The implementation uses the kernel's generic hashtable API,
>> It uses the context's string represtation as the hash source,
>> and the kernels generic string hashing algorithm full_name_hash()
>> to reduce the string to a 32 bit value.
>>
>> This change also maintains the improvement introduced in commit
>> ee1a84fd which removed the need to keep the current sidtab locked
>> during policy reload. It does however introduce periodic locking of
>> the target sidtab while converting the hashtable. Sidtab entries
>> are never modified or removed, so the context struct stored in the
>> sid_to_context tree can also be used for the context_to_sid
>> hashtable to reduce memory usage.
>>
>> This bug was reported by:
>> - Stephen Smally on the selinux bug tracker.
>>    BUG: kernel softlockup due to too many SIDs/contexts #37
>>    https://github.com/SELinuxProject/selinux-kernel/issues/37
>> - Jovana Knezevic on Android's bugtracker.
>>    Bug: 140252993
>>    "During multi-user performance testing, we create and remove users
>>    many times. selinux_android_restorecon_pkgdir goes from 1ms to over
>>    20ms after about 200 user creations and removals. Accumulated over
>>    ~280 packages, that adds a significant time to user creation,
>>    making perf benchmarks unreliable."

Something went very wrong with my system after running the selinux 
testsuite; it started triggering entrypoint denials in various 
situations that should have not checked entrypoint at all.  I assume 
this means that security_transition_sid() started returning new, 
different SIDs for processes for the same context and therefore 
selinux_bprm_set_creds() applied an ENTRYPOINT check instead of an 
EXECUTE_NO_TRANS check.

>>
>> Signed-off-by: Jeff Vander Stoep <jeffv@google.com>
>> Reported-by: Stephen Smalley <sds@tycho.nsa.gov>
>> Reported-by: Jovana Knezevic <jovanak@google.com>
>> ---
>>   security/selinux/include/security.h |   1 +
>>   security/selinux/selinuxfs.c        |  27 +++
>>   security/selinux/ss/context.h       |   9 +
>>   security/selinux/ss/policydb.c      |   5 +
>>   security/selinux/ss/services.c      |  81 +++++---
>>   security/selinux/ss/services.h      |   4 +-
>>   security/selinux/ss/sidtab.c        | 283 ++++++++++++++++------------
>>   security/selinux/ss/sidtab.h        |  20 +-
>>   8 files changed, 283 insertions(+), 147 deletions(-)
>>
>> diff --git a/security/selinux/include/security.h 
>> b/security/selinux/include/security.h
>> index ae840634e3c7..8c0dbbd076c6 100644
>> --- a/security/selinux/include/security.h
>> +++ b/security/selinux/include/security.h
>> @@ -395,5 +395,6 @@ extern int selinux_nlmsg_lookup(u16 sclass, u16 
>> nlmsg_type, u32 *perm);
>>   extern void avtab_cache_init(void);
>>   extern void ebitmap_cache_init(void);
>>   extern void hashtab_cache_init(void);
>> +extern int security_sidtab_hash_stats(struct selinux_state *state, 
>> char *page);
>>   #endif /* _SELINUX_SECURITY_H_ */
>> diff --git a/security/selinux/selinuxfs.c b/security/selinux/selinuxfs.c
>> index ee94fa469c29..ebdec88d9ccb 100644
>> --- a/security/selinux/selinuxfs.c
>> +++ b/security/selinux/selinuxfs.c
>> @@ -1482,6 +1482,32 @@ static ssize_t sel_read_avc_hash_stats(struct 
>> file *filp, char __user *buf,
>>       return length;
>>   }
>> +static ssize_t sel_read_sidtab_hash_stats(struct file *filp, char 
>> __user *buf,
>> +                    size_t count, loff_t *ppos)
>> +{
>> +    struct selinux_fs_info *fsi = file_inode(filp)->i_sb->s_fs_info;
>> +    struct selinux_state *state = fsi->state;
>> +    char *page;
>> +    ssize_t length;
>> +
>> +    page = (char *)__get_free_page(GFP_KERNEL);
>> +    if (!page)
>> +        return -ENOMEM;
>> +
>> +    length = security_sidtab_hash_stats(state, page);
>> +    if (length >= 0)
>> +        length = simple_read_from_buffer(buf, count, ppos, page,
>> +                        length);
>> +    free_page((unsigned long)page);
>> +
>> +    return length;
>> +}
>> +
>> +static const struct file_operations sel_sidtab_hash_stats_ops = {
>> +    .read        = sel_read_sidtab_hash_stats,
>> +    .llseek        = generic_file_llseek,
>> +};
>> +
>>   static const struct file_operations sel_avc_cache_threshold_ops = {
>>       .read        = sel_read_avc_cache_threshold,
>>       .write        = sel_write_avc_cache_threshold,
>> @@ -1572,6 +1598,7 @@ static int sel_make_avc_files(struct dentry *dir)
>>           { "cache_threshold",
>>             &sel_avc_cache_threshold_ops, S_IRUGO|S_IWUSR },
>>           { "hash_stats", &sel_avc_hash_stats_ops, S_IRUGO },
>> +        { "sidtab_hash_stats", &sel_sidtab_hash_stats_ops, S_IRUGO },
> 
> Not sure that this belongs under /sys/fs/selinux/avc versus top-level or 
> a new sidtab dir since the sidtab is not part of the AVC.  Also, 
> checkpatch.pl whines about using S_IRUGO and prefers octal so maybe we 
> should be using octal for new files (@paul)?
> 
>>   #ifdef CONFIG_SECURITY_SELINUX_AVC_STATS
>>           { "cache_stats", &sel_avc_cache_stats_ops, S_IRUGO },
>>   #endif
>> diff --git a/security/selinux/ss/context.h 
>> b/security/selinux/ss/context.h
>> index 513e67f48878..01fea944177d 100644
>> --- a/security/selinux/ss/context.h
>> +++ b/security/selinux/ss/context.h
>> @@ -31,6 +31,7 @@ struct context {
>>       u32 len;        /* length of string in bytes */
>>       struct mls_range range;
>>       char *str;    /* string representation if context cannot be 
>> mapped. */
>> +    u32 hash;    /* a hash of the string representation */
>>   };
>>   static inline void mls_context_init(struct context *c)
>> @@ -168,6 +169,7 @@ static inline int context_cpy(struct context *dst, 
>> struct context *src)
>>           kfree(dst->str);
>>           return rc;
>>       }
>> +    dst->hash = src->hash;
>>       return 0;
>>   }
>> @@ -182,6 +184,8 @@ static inline void context_destroy(struct context *c)
>>   static inline int context_cmp(struct context *c1, struct context *c2)
>>   {
>> +    if (c1->hash && c2->hash && (c1->hash != c2->hash))
>> +        return 0;
>>       if (c1->len && c2->len)
>>           return (c1->len == c2->len && !strcmp(c1->str, c2->str));
>>       if (c1->len || c2->len)
>> @@ -192,5 +196,10 @@ static inline int context_cmp(struct context *c1, 
>> struct context *c2)
>>           mls_context_cmp(c1, c2));
>>   }
>> +static inline unsigned int context_compute_hash(const char *s)
>> +{
>> +    return full_name_hash(NULL, s, strlen(s));
>> +}
>> +
>>   #endif    /* _SS_CONTEXT_H_ */
>> diff --git a/security/selinux/ss/policydb.c 
>> b/security/selinux/ss/policydb.c
>> index e20624a68f5d..e369b0092cdf 100644
>> --- a/security/selinux/ss/policydb.c
>> +++ b/security/selinux/ss/policydb.c
>> @@ -878,6 +878,11 @@ int policydb_load_isids(struct policydb *p, 
>> struct sidtab *s)
>>               sidtab_destroy(s);
>>               goto out;
>>           }
>> +        rc = context_add_hash(p, &c->context[0]);
>> +        if (rc) {
>> +            sidtab_destroy(s);
>> +            goto out;
>> +        }
>>           rc = sidtab_set_initial(s, c->sid[0], &c->context[0]);
>>           if (rc) {
>> diff --git a/security/selinux/ss/services.c 
>> b/security/selinux/ss/services.c
>> index a5813c7629c1..29076c15cdf7 100644
>> --- a/security/selinux/ss/services.c
>> +++ b/security/selinux/ss/services.c
>> @@ -1257,6 +1257,11 @@ static int context_struct_to_string(struct 
>> policydb *p,
>>   #include "initial_sid_to_string.h"
>> +int security_sidtab_hash_stats(struct selinux_state *state, char *page)
>> +{
>> +    return sidtab_hash_stats(state->ss->sidtab, page);
>> +}
> 
> Should we be taking the policy read lock to avoid interleaving with 
> sidtab replacement on policy reload?
> 
>> +
>>   const char *security_get_initial_sid_context(u32 sid)
>>   {
>>       if (unlikely(sid > SECINITSID_NUM))
>> @@ -1384,6 +1389,8 @@ static int string_to_context_struct(struct 
>> policydb *pol,
>>       int rc = 0;
>>       context_init(ctx);
>> +    /* hash the string before it gets mutated */
>> +    ctx->hash = context_compute_hash(scontext);
>>       /* Parse the security context. */
>> @@ -1442,6 +1449,7 @@ static int string_to_context_struct(struct 
>> policydb *pol,
>>       rc = -EINVAL;
>>       if (!policydb_context_isvalid(pol, ctx))
>>           goto out;
>> +
>>       rc = 0;
>>   out:
>>       if (rc)
> 
> Try to avoid unrelated whitespace changes.
> 
>> @@ -1449,6 +1457,42 @@ static int string_to_context_struct(struct 
>> policydb *pol,
>>       return rc;
>>   }
>> +int context_add_hash(struct policydb *policydb,
>> +             struct context *context)
>> +{
>> +    int rc;
>> +    char *str;
>> +    int len;
>> +
>> +    if (context->str) {
>> +        context->hash = context_compute_hash(context->str);
>> +    } else {
>> +        rc = context_struct_to_string(policydb, context,
>> +                          &str, &len);
>> +        if (rc)
>> +            return rc;
>> +        context->hash = context_compute_hash(str);
>> +        kfree(str);
>> +    }
>> +    return 0;
>> +}
>> +
>> +static int context_to_sid(struct selinux_state *state,
>> +              struct context *context, u32 *sid)
>> +{
>> +    int rc;
>> +    struct sidtab *sidtab = state->ss->sidtab;
>> +    struct policydb *policydb = &state->ss->policydb;
>> +
>> +    if (!context->hash) {
>> +        rc = context_add_hash(policydb, context);
>> +        if (rc)
>> +            return rc;
>> +    }
>> +
>> +    return sidtab_context_to_sid(sidtab, context, sid);
>> +}
>> +
>>   static int security_context_to_sid_core(struct selinux_state *state,
>>                       const char *scontext, u32 scontext_len,
>>                       u32 *sid, u32 def_sid, gfp_t gfp_flags,
>> @@ -1501,7 +1545,7 @@ static int security_context_to_sid_core(struct 
>> selinux_state *state,
>>           str = NULL;
>>       } else if (rc)
>>           goto out_unlock;
>> -    rc = sidtab_context_to_sid(sidtab, &context, sid);
>> +    rc = context_to_sid(state, &context, sid);
>>       context_destroy(&context);
>>   out_unlock:
>>       read_unlock(&state->ss->policy_rwlock);
>> @@ -1805,7 +1849,7 @@ static int security_compute_sid(struct 
>> selinux_state *state,
>>               goto out_unlock;
>>       }
>>       /* Obtain the sid for the context. */
>> -    rc = sidtab_context_to_sid(sidtab, &newcontext, out_sid);
>> +    rc = context_to_sid(state, &newcontext, out_sid);
>>   out_unlock:
>>       read_unlock(&state->ss->policy_rwlock);
>>       context_destroy(&newcontext);
>> @@ -2033,6 +2077,10 @@ static int convert_context(struct context 
>> *oldc, struct context *newc, void *p)
>>               goto bad;
>>       }
>> +    rc = context_add_hash(args->newp, newc);
>> +    if (rc)
>> +        goto bad;
>> +
>>       return 0;
>>   bad:
>>       /* Map old representation to string and save it. */
>> @@ -2280,9 +2328,7 @@ int security_port_sid(struct selinux_state *state,
>>       if (c) {
>>           if (!c->sid[0]) {
>> -            rc = sidtab_context_to_sid(sidtab,
>> -                           &c->context[0],
>> -                           &c->sid[0]);
>> +            rc = context_to_sid(state, &c->context[0], &c->sid[0]);
>>               if (rc)
>>                   goto out;
>>           }
>> @@ -2374,9 +2420,7 @@ int security_ib_endport_sid(struct selinux_state 
>> *state,
>>       if (c) {
>>           if (!c->sid[0]) {
>> -            rc = sidtab_context_to_sid(sidtab,
>> -                           &c->context[0],
>> -                           &c->sid[0]);
>> +            rc = context_to_sid(state, &c->context[0], &c->sid[0]);
>>               if (rc)
>>                   goto out;
>>           }
>> @@ -2416,14 +2460,10 @@ int security_netif_sid(struct selinux_state 
>> *state,
>>       if (c) {
>>           if (!c->sid[0] || !c->sid[1]) {
>> -            rc = sidtab_context_to_sid(sidtab,
>> -                          &c->context[0],
>> -                          &c->sid[0]);
>> +            rc = context_to_sid(state, &c->context[0], &c->sid[0]);
>>               if (rc)
>>                   goto out;
>> -            rc = sidtab_context_to_sid(sidtab,
>> -                           &c->context[1],
>> -                           &c->sid[1]);
>> +            rc = context_to_sid(state, &c->context[1], &c->sid[1]);
>>               if (rc)
>>                   goto out;
>>           }
>> @@ -2601,7 +2641,7 @@ int security_get_user_sids(struct selinux_state 
>> *state,
>>                            &usercon))
>>                   continue;
>> -            rc = sidtab_context_to_sid(sidtab, &usercon, &sid);
>> +            rc = context_to_sid(state, &usercon, &sid);
>>               if (rc)
>>                   goto out_unlock;
>>               if (mynel < maxnel) {
>> @@ -2672,7 +2712,6 @@ static inline int __security_genfs_sid(struct 
>> selinux_state *state,
>>                          u32 *sid)
>>   {
>>       struct policydb *policydb = &state->ss->policydb;
>> -    struct sidtab *sidtab = state->ss->sidtab;
>>       int len;
>>       u16 sclass;
>>       struct genfs *genfs;
>> @@ -2707,7 +2746,7 @@ static inline int __security_genfs_sid(struct 
>> selinux_state *state,
>>           goto out;
>>       if (!c->sid[0]) {
>> -        rc = sidtab_context_to_sid(sidtab, &c->context[0], &c->sid[0]);
>> +        rc = context_to_sid(state, &c->context[0], &c->sid[0]);
>>           if (rc)
>>               goto out;
>>       }
>> @@ -2770,8 +2809,7 @@ int security_fs_use(struct selinux_state *state, 
>> struct super_block *sb)
>>       if (c) {
>>           sbsec->behavior = c->v.behavior;
>>           if (!c->sid[0]) {
>> -            rc = sidtab_context_to_sid(sidtab, &c->context[0],
>> -                           &c->sid[0]);
>> +            rc = context_to_sid(state, &c->context[0], &c->sid[0]);
>>               if (rc)
>>                   goto out;
>>           }
>> @@ -3026,8 +3064,7 @@ int security_sid_mls_copy(struct selinux_state 
>> *state,
>>               goto out_unlock;
>>           }
>>       }
>> -
>> -    rc = sidtab_context_to_sid(sidtab, &newcon, new_sid);
>> +    rc = context_to_sid(state, &newcon, new_sid);
>>   out_unlock:
>>       read_unlock(&state->ss->policy_rwlock);
>>       context_destroy(&newcon);
>> @@ -3620,7 +3657,7 @@ int security_netlbl_secattr_to_sid(struct 
>> selinux_state *state,
>>           if (!mls_context_isvalid(policydb, &ctx_new))
>>               goto out_free;
>> -        rc = sidtab_context_to_sid(sidtab, &ctx_new, sid);
>> +        rc = context_to_sid(state, &ctx_new, sid);
>>           if (rc)
>>               goto out_free;
>> diff --git a/security/selinux/ss/services.h 
>> b/security/selinux/ss/services.h
>> index 9a36de860368..fc40640a9725 100644
>> --- a/security/selinux/ss/services.h
>> +++ b/security/selinux/ss/services.h
>> @@ -8,7 +8,7 @@
>>   #define _SS_SERVICES_H_
>>   #include "policydb.h"
>> -#include "sidtab.h"
>> +#include "context.h"
>>   /* Mapping for a single class */
>>   struct selinux_mapping {
>> @@ -39,4 +39,6 @@ void services_compute_xperms_drivers(struct 
>> extended_perms *xperms,
>>   void services_compute_xperms_decision(struct extended_perms_decision 
>> *xpermd,
>>                       struct avtab_node *node);
>> +int context_add_hash(struct policydb *policydb, struct context 
>> *context);
>> +
>>   #endif    /* _SS_SERVICES_H_ */
>> diff --git a/security/selinux/ss/sidtab.c b/security/selinux/ss/sidtab.c
>> index 7d49994e8d5f..e4710f32b6d9 100644
>> --- a/security/selinux/ss/sidtab.c
>> +++ b/security/selinux/ss/sidtab.c
>> @@ -23,23 +23,32 @@ int sidtab_init(struct sidtab *s)
>>       memset(s->roots, 0, sizeof(s->roots));
>> -    /* max count is SIDTAB_MAX so valid index is always < SIDTAB_MAX */
>> -    for (i = 0; i < SIDTAB_RCACHE_SIZE; i++)
>> -        s->rcache[i] = SIDTAB_MAX;
>> -
>>       for (i = 0; i < SECINITSID_NUM; i++)
>>           s->isids[i].set = 0;
>>       s->count = 0;
>>       s->convert = NULL;
>> +    hash_init(s->context_to_sid);
>>       spin_lock_init(&s->lock);
>>       return 0;
>>   }
>> +static u32 context_to_sid(struct sidtab *s, struct context *context)
>> +{
>> +    struct sidtab_node *node;
>> +
>> +    hash_for_each_possible(s->context_to_sid, node, list, 
>> context->hash) {
>> +        if (context_cmp(node->context, context))
>> +            return node->sid;
>> +    }
>> +    return 0;
>> +}
>> +
>>   int sidtab_set_initial(struct sidtab *s, u32 sid, struct context 
>> *context)
>>   {
>>       struct sidtab_isid_entry *entry;
>> +    struct sidtab_node *node = NULL;
>>       int rc;
>>       if (sid == 0 || sid > SECINITSID_NUM)
>> @@ -52,9 +61,57 @@ int sidtab_set_initial(struct sidtab *s, u32 sid, 
>> struct context *context)
>>           return rc;
>>       entry->set = 1;
>> +
>> +    /*
>> +     * Multiple initial sids may map to the same context. Check that 
>> this
>> +     * context is not already represented in the context_to_sid 
>> hashtable
>> +     * to avoid duplicate entries and long linked lists upon hash
>> +     * collision.
>> +     */
>> +    if (!context_to_sid(s, context)) {
>> +        node = kzalloc(sizeof(struct sidtab_node), GFP_ATOMIC);
>> +        if (!node)
>> +            return -ENOMEM;
>> +        node->sid = sid;
>> +        node->context = &entry->context;
>> +        hash_add(s->context_to_sid, &node->list, context->hash);
>> +    }
>> +
>>       return 0;
>>   }
>> +int sidtab_hash_stats(struct sidtab *sidtab, char *page)
>> +{
>> +    int i;
>> +    int chain_len = 0;
>> +    int slots_used = 0;
>> +    int entries = 0;
>> +    int max_chain_len = 0;
>> +    int cur_bucket = 0;
>> +    struct sidtab_node *node;
>> +
>> +
>> +    hash_for_each(sidtab->context_to_sid, i, node, list) {
> 
> Safe for this to be entirely lock-free?
> 
>> +        entries++;
>> +        if (i == cur_bucket) {
>> +            chain_len++;
>> +            if (chain_len == 1)
>> +                slots_used++;
>> +        } else {
>> +            cur_bucket = i;
>> +            if (chain_len > max_chain_len)
>> +                max_chain_len = chain_len;
>> +            chain_len = 0;
>> +        }
>> +    }
>> +    if (chain_len > max_chain_len)
>> +        max_chain_len = chain_len;
>> +    return scnprintf(page, PAGE_SIZE, "%s:  %d entries and %d/%d 
>> buckets "
>> +             "used, longest chain length %d\n", "context_to_sid",
>> +             entries, slots_used, SIDTAB_HASH_BUCKETS,
>> +             max_chain_len);
> 
> Odd choice to pass "context_to_sid" as argument.  And probably can avoid 
> the checkpatch.pl warning here too.
> 
>> +}
>> +
>>   static u32 sidtab_level_from_count(u32 count)
>>   {
>>       u32 capacity = SIDTAB_LEAF_ENTRIES;
>> @@ -150,7 +207,7 @@ static struct context *sidtab_search_core(struct 
>> sidtab *s, u32 sid, int force)
>>       if (sid != 0) {
>>           if (sid > SECINITSID_NUM)
>> -            context = sidtab_lookup(s, sid - (SECINITSID_NUM + 1));
>> +            context = sidtab_lookup(s, sid_to_index(sid));
>>           else
>>               context = sidtab_lookup_initial(s, sid);
>>           if (context && (!context->len || force))
>> @@ -170,132 +227,70 @@ struct context *sidtab_search_force(struct 
>> sidtab *s, u32 sid)
>>       return sidtab_search_core(s, sid, 1);
>>   }
>> -static int sidtab_find_context(union sidtab_entry_inner entry,
>> -                   u32 *pos, u32 count, u32 level,
>> -                   struct context *context, u32 *index)
>> -{
>> -    int rc;
>> -    u32 i;
>> -
>> -    if (level != 0) {
>> -        struct sidtab_node_inner *node = entry.ptr_inner;
>> -
>> -        i = 0;
>> -        while (i < SIDTAB_INNER_ENTRIES && *pos < count) {
>> -            rc = sidtab_find_context(node->entries[i],
>> -                         pos, count, level - 1,
>> -                         context, index);
>> -            if (rc == 0)
>> -                return 0;
>> -            i++;
>> -        }
>> -    } else {
>> -        struct sidtab_node_leaf *node = entry.ptr_leaf;
>> -
>> -        i = 0;
>> -        while (i < SIDTAB_LEAF_ENTRIES && *pos < count) {
>> -            if (context_cmp(&node->entries[i].context, context)) {
>> -                *index = *pos;
>> -                return 0;
>> -            }
>> -            (*pos)++;
>> -            i++;
>> -        }
>> -    }
>> -    return -ENOENT;
>> -}
>> -
>> -static void sidtab_rcache_update(struct sidtab *s, u32 index, u32 pos)
>> -{
>> -    while (pos > 0) {
>> -        WRITE_ONCE(s->rcache[pos], READ_ONCE(s->rcache[pos - 1]));
>> -        --pos;
>> -    }
>> -    WRITE_ONCE(s->rcache[0], index);
>> -}
>> -
>> -static void sidtab_rcache_push(struct sidtab *s, u32 index)
>> -{
>> -    sidtab_rcache_update(s, index, SIDTAB_RCACHE_SIZE - 1);
>> -}
>> -
>> -static int sidtab_rcache_search(struct sidtab *s, struct context 
>> *context,
>> -                u32 *index)
>> -{
>> -    u32 i;
>> -
>> -    for (i = 0; i < SIDTAB_RCACHE_SIZE; i++) {
>> -        u32 v = READ_ONCE(s->rcache[i]);
>> -
>> -        if (v >= SIDTAB_MAX)
>> -            continue;
>> -
>> -        if (context_cmp(sidtab_do_lookup(s, v, 0), context)) {
>> -            sidtab_rcache_update(s, v, i);
>> -            *index = v;
>> -            return 0;
>> -        }
>> -    }
>> -    return -ENOENT;
>> -}
>> -
>> -static int sidtab_reverse_lookup(struct sidtab *s, struct context 
>> *context,
>> -                 u32 *index)
>> +int sidtab_context_to_sid(struct sidtab *s, struct context *context,
>> +              u32 *sid)
>>   {
>>       unsigned long flags;
>> -    u32 count, count_locked, level, pos;
>> +    u32 count;
>>       struct sidtab_convert_params *convert;
>>       struct context *dst, *dst_convert;
>> +    struct sidtab_node *dst_node, *dst_node_convert = NULL;
>>       int rc;
>> -    rc = sidtab_rcache_search(s, context, index);
>> -    if (rc == 0)
>> -        return 0;
>> -
>> -    /* read entries only after reading count */
>> -    count = smp_load_acquire(&s->count);
>> -    level = sidtab_level_from_count(count);
>> -
>> -    pos = 0;
>> -    rc = sidtab_find_context(s->roots[level], &pos, count, level,
>> -                 context, index);
>> -    if (rc == 0) {
>> -        sidtab_rcache_push(s, *index);
>> +    *sid = context_to_sid(s, context);
>> +    if (*sid)
>>           return 0;
>> -    }
>>       /* lock-free search failed: lock, re-search, and insert if not 
>> found */
>>       spin_lock_irqsave(&s->lock, flags);
>> +    *sid = context_to_sid(s, context);
>> +    if (*sid)
>> +        goto out_unlock;
>> +
> 
> rc never set here, used in out_unlock path.
> 
>>       convert = s->convert;
>> -    count_locked = s->count;
>> -    level = sidtab_level_from_count(count_locked);
>> -
>> -    /* if count has changed before we acquired the lock, then catch 
>> up */
>> -    while (count < count_locked) {
>> -        if (context_cmp(sidtab_do_lookup(s, count, 0), context)) {
>> -            sidtab_rcache_push(s, count);
>> -            *index = count;
>> -            rc = 0;
>> +    count = s->count;
>> +
>> +    rc = -ENOMEM;
>> +    dst_node = kzalloc(sizeof(struct sidtab_node), GFP_ATOMIC);
>> +    if (!dst_node)
>> +        goto out_unlock;
>> +
>> +    if (convert) {
>> +        dst_node_convert = kzalloc(sizeof(struct sidtab_node),
>> +                       GFP_ATOMIC);
>> +        if (!dst_node_convert) {
>> +            kfree(dst_node);
>>               goto out_unlock;
>>           }
>> -        ++count;
>>       }
>>       /* bail out if we already reached max entries */
>>       rc = -EOVERFLOW;
>> -    if (count >= SIDTAB_MAX)
>> +    if (count >= SIDTAB_MAX) {
>> +        kfree(dst_node);
>> +        kfree(dst_node_convert);
>>           goto out_unlock;
>> +    }
>>       /* insert context into new entry */
>>       rc = -ENOMEM;
>>       dst = sidtab_do_lookup(s, count, 1);
>> -    if (!dst)
>> +    if (!dst) {
>> +        kfree(dst_node);
>> +        kfree(dst_node_convert);
>>           goto out_unlock;
>> +    }
> 
> Generally we'd introduce another goto target for these repeated 
> sequences of free calls.  Just put it after the out_unlock sequence and 
> then it can jump back to out_unlock after the frees.
> 
>> +
>> +    dst_node->sid = index_to_sid(count);
>> +    dst_node->context = dst;
>>       rc = context_cpy(dst, context);
>> -    if (rc)
>> +    if (rc) {
>> +        kfree(dst_node);
>> +        kfree(dst_node_convert);
>>           goto out_unlock;
>> +    }
>>       /*
>>        * if we are building a new sidtab, we need to convert the context
>> @@ -306,25 +301,35 @@ static int sidtab_reverse_lookup(struct sidtab 
>> *s, struct context *context,
>>           dst_convert = sidtab_do_lookup(convert->target, count, 1);
>>           if (!dst_convert) {
>>               context_destroy(dst);
>> +            kfree(dst_node);
>> +            kfree(dst_node_convert);
>>               goto out_unlock;
>>           }
>>           rc = convert->func(context, dst_convert, convert->args);
>>           if (rc) {
>>               context_destroy(dst);
>> +            kfree(dst_node);
>> +            kfree(dst_node_convert);
>>               goto out_unlock;
>>           }
>> +        dst_node_convert->sid = index_to_sid(count);
>> +        dst_node_convert->context = dst_convert;
>>           /* at this point we know the insert won't fail */
>> +        spin_lock_irqsave(&convert->target->lock, flags);
>>           convert->target->count = count + 1;
>> +        hash_add(convert->target->context_to_sid,
>> +             &dst_node_convert->list, dst_convert->hash);
>> +        spin_unlock_irqrestore(&convert->target->lock, flags);
>>       }
>> +    hash_add(s->context_to_sid, &dst_node->list, context->hash);
>>       if (context->len)
>>           pr_info("SELinux:  Context %s is not valid (left unmapped).\n",
>>               context->str);
>> -    sidtab_rcache_push(s, count);
>> -    *index = count;
>> +    *sid = index_to_sid(count);
>>       /* write entries before writing new count */
>>       smp_store_release(&s->count, count + 1);
>> @@ -335,27 +340,41 @@ static int sidtab_reverse_lookup(struct sidtab 
>> *s, struct context *context,
>>       return rc;
>>   }
>> -int sidtab_context_to_sid(struct sidtab *s, struct context *context, 
>> u32 *sid)
>> +static int sidtab_convert_hashnode(struct sidtab *s, u32 index)
>>   {
>> -    int rc;
>> -    u32 i;
>> +    unsigned long flags;
>> +    struct context *context;
>> +    struct sidtab_node *node;
>> -    for (i = 0; i < SECINITSID_NUM; i++) {
>> -        struct sidtab_isid_entry *entry = &s->isids[i];
>> +    context = sidtab_do_lookup(s, index, 0);
>> -        if (entry->set && context_cmp(context, &entry->context)) {
>> -            *sid = i + 1;
>> -            return 0;
>> -        }
>> -    }
>> +    node = kzalloc(sizeof(struct sidtab_node), GFP_ATOMIC);
>> +    if (!node)
>> +        return -ENOMEM;
>> -    rc = sidtab_reverse_lookup(s, context, sid);
>> -    if (rc)
>> -        return rc;
>> -    *sid += SECINITSID_NUM + 1;
>> +    node->sid = index_to_sid(index);
>> +    node->context = context;
>> +    spin_lock_irqsave(&s->lock, flags);
>> +    hash_add(s->context_to_sid, &node->list, context->hash);
>> +    spin_unlock_irqrestore(&s->lock, flags);
>>       return 0;
>>   }
>> +static int sidtab_convert_hashtable(struct sidtab *s, u32 count)
>> +{
>> +    u32 i;
>> +    int rc = 0;
>> +
>> +    for (i = 0; i < count; i++) {
>> +        rc = sidtab_convert_hashnode(s, i);
>> +        if (rc)
>> +            break;
>> +
>> +        cond_resched();
>> +    }
>> +    return rc;
>> +}
>> +
>>   static int sidtab_convert_tree(union sidtab_entry_inner *edst,
>>                      union sidtab_entry_inner *esrc,
>>                      u32 *pos, u32 count, u32 level,
>> @@ -400,6 +419,7 @@ static int sidtab_convert_tree(union 
>> sidtab_entry_inner *edst,
>>           }
>>           cond_resched();
>>       }
>> +
>>       return 0;
>>   }
>>
> 
> Avoid unrelated whitespace changes.
> 
>> @@ -449,7 +469,16 @@ int sidtab_convert(struct sidtab *s, struct 
>> sidtab_convert_params *params)
>>           spin_lock_irqsave(&s->lock, flags);
>>           s->convert = NULL;
>>           spin_unlock_irqrestore(&s->lock, flags);
>> +        return rc;
>> +    }
>> +
>> +    rc = sidtab_convert_hashtable(params->target, count);
>> +    if (rc) {
>> +        spin_lock_irqsave(&s->lock, flags);
>> +        s->convert = NULL;
>> +        spin_unlock_irqrestore(&s->lock, flags);
>>       }
>> +
>>       return rc;
>>   }
>> @@ -478,6 +507,19 @@ static void sidtab_destroy_tree(union 
>> sidtab_entry_inner entry, u32 level)
>>       }
>>   }
>> +
>> +static void sidtab_destroy_hashtable(struct sidtab *s)
>> +{
>> +    struct sidtab_node *node;
>> +    struct hlist_node *tmp;
>> +    int i;
>> +
>> +    hash_for_each_safe(s->context_to_sid, i, tmp, node, list) {
>> +        hash_del(&node->list);
>> +        kfree(node);
>> +    }
>> +}
>> +
>>   void sidtab_destroy(struct sidtab *s)
>>   {
>>       u32 i, level;
>> @@ -491,4 +533,5 @@ void sidtab_destroy(struct sidtab *s)
>>           --level;
>>       sidtab_destroy_tree(s->roots[level], level);
>> +    sidtab_destroy_hashtable(s);
>>   }
>> diff --git a/security/selinux/ss/sidtab.h b/security/selinux/ss/sidtab.h
>> index 1f4763141aa1..85afef719a43 100644
>> --- a/security/selinux/ss/sidtab.h
>> +++ b/security/selinux/ss/sidtab.h
>> @@ -13,6 +13,7 @@
>>   #include <linux/spinlock_types.h>
>>   #include <linux/log2.h>
>> +#include <linux/hashtable.h>
>>   #include "context.h"
>> @@ -66,7 +67,16 @@ struct sidtab_convert_params {
>>       struct sidtab *target;
>>   };
>> -#define SIDTAB_RCACHE_SIZE 3
>> +struct sidtab_node {
>> +    u32 sid;
>> +    struct context *context;
>> +    struct hlist_node list;
>> +};
>> +
>> +#define SIDTAB_HASH_BITS 9
>> +#define SIDTAB_HASH_BUCKETS (1 << SIDTAB_HASH_BITS)
>> +#define index_to_sid(index) (index + SECINITSID_NUM + 1)
>> +#define sid_to_index(sid) (sid - (SECINITSID_NUM + 1))
>>   struct sidtab {
>>       /*
>> @@ -83,11 +93,11 @@ struct sidtab {
>>       struct sidtab_convert_params *convert;
>>       spinlock_t lock;
>> -    /* reverse lookup cache - access atomically via 
>> {READ|WRITE}_ONCE() */
>> -    u32 rcache[SIDTAB_RCACHE_SIZE];
>> -
>>       /* index == SID - 1 (no entry for SECSID_NULL) */
>>       struct sidtab_isid_entry isids[SECINITSID_NUM];
>> +
>> +    /* Hash table for fast reverse context-to-sid lookups. */
>> +    DECLARE_HASHTABLE(context_to_sid, SIDTAB_HASH_BITS);
>>   };
>>   int sidtab_init(struct sidtab *s);
>> @@ -101,6 +111,8 @@ int sidtab_context_to_sid(struct sidtab *s, struct 
>> context *context, u32 *sid);
>>   void sidtab_destroy(struct sidtab *s);
>> +int sidtab_hash_stats(struct sidtab *sidtab, char *page);
>> +
>>   #endif    /* _SS_SIDTAB_H_ */
>>
> 

