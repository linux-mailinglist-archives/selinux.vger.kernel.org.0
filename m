Return-Path: <selinux+bounces-4850-lists+selinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 93888B42D39
	for <lists+selinux@lfdr.de>; Thu,  4 Sep 2025 01:12:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1F2291C22D0C
	for <lists+selinux@lfdr.de>; Wed,  3 Sep 2025 23:13:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24DC72FE595;
	Wed,  3 Sep 2025 23:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="kaCKFuZF"
X-Original-To: selinux@vger.kernel.org
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E1372BDC1D
	for <selinux@vger.kernel.org>; Wed,  3 Sep 2025 23:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756941165; cv=none; b=TeofuNccHiZ6Qhth1jmNpkjXzxD6OHuUI6iR1I74hHZlBhblf9q/PBmhVGuafFbaCpMVMvoGnvrsBphJtHFIgxtCXw/fU8nzeFnmrytjnbN/e+3vkV7Kzy1XUaw24kJOud6dhPd2ZmyuTtO8IXVrhqvLIJwW5dHy65Si+EJCV/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756941165; c=relaxed/simple;
	bh=pxNzgUjLJkNLU9SdD2zq9OE6MWf/9W8LuG+5f212wqM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=roEu1lGeAWNrj1onos5H4PawGQZM87pxfX8I9WHSx1FGo1ZbVzG/V+xFmDj5KqpWD/XiExXonrCjNC+n9UDVcuyN1K+m9NwXItV+ydXHg6YQpp8okwPpMasuwr0kD1EiJObCGCXPO8ht1KBpGZ5MJOpDKYsj59BJX7ON2pPaMmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=kaCKFuZF; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 9C9063F71D
	for <selinux@vger.kernel.org>; Wed,  3 Sep 2025 23:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1756941155;
	bh=Q64SqV0O/o9aJmf976zGMIB6qbGdmRmpysnXyHWPzVU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=kaCKFuZFDAouzkPs+hHKJHo7c7xZAEb8XtOZygdgdU14et06RjJ2sdoAzKSoKPiU3
	 51F+wGdb6NaGB91dmDlWD3qqOYAezKFRkR9xnpAS/qIjs31mXd5vswCX9CB7d54GAm
	 JgMciRr0tyMhSdMOfrVfERPLNCdrb6BKfI573vFmFyncz0hakMkWBdXRwO6ResB5/O
	 RMWL/Go//m5CN+3FS3YublQ52in3+xxG1wDuSlLGmh94OEWhZnO2p5HsZlsqXrCFFw
	 bVnuJ9B3uCDOr2aKH+rYbTuSr4bvzS2sCHZ3lLlElMqm9ASIp57Ac5K0zQEcxgFZ7s
	 AbgawO4NVNBVQ==
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-325ce1082bcso430225a91.0
        for <selinux@vger.kernel.org>; Wed, 03 Sep 2025 16:12:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756941154; x=1757545954;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q64SqV0O/o9aJmf976zGMIB6qbGdmRmpysnXyHWPzVU=;
        b=Ow5gTMoChXH+4w9EWeT5MSGG6zfpKXkMzYJEFmc3h1onlUFf3/xZnGEMdWKwJT7+UY
         PlkO1SZQQHFrC6Qlvtq5pIKz024Qr9hfeHQ7wHCIcowxtTZflfB1nQz/gjsy0yo2HMjL
         FSODixIZVxiogIyTmWNsS/bxabdUtjlzGG9L8kbqh4e3eQII6NGkdbGAWa/Pa+1dZWYO
         Env1RWiG4OUUqKcZyMoEGkTp6bTqWVqarQudHUbzlo5awdobNw8kQnN463MEK2A3REz6
         SFzJnaku+UZBrAiDjoC2h/4ig3tdm79MlWMUCv9qU9TENJCGz0OMAxAVJwNK1jLpY3dI
         PfxQ==
X-Forwarded-Encrypted: i=1; AJvYcCXrRdDH/1ivMLqHxngneSuUHbMqe3n9Pi24itfrUykb9oKn4MHjIWSduPzh7mO3cd1+ukGVY9MQ@vger.kernel.org
X-Gm-Message-State: AOJu0YzYJqzfouZWdijiBlr7AJTaYmbEFz/SCVcCbBF2M+3TW/R8+T/t
	/WhtMlGOYVpdBHe62IT6xU1K8hqhOOs36hfNZbbvJ5r9xpOD0m3+R6kJFlCGp7kGSSUevJMzGN/
	kkxRVc0b46gUca6YniTR6GXFhiWexT28Mulv0WoIJr9oCdr7g/IbBdiF0aaHRNpXEs6tlyuwHqJ
	g=
X-Gm-Gg: ASbGncs6AtDOo50X71SLEtGdSbt0LD0024fjnLtLqv+fYxo3Ax60VTrWiTqEYkfwdwO
	Qzfsh5wy7hDw/KPwChkLs8hYAtcDMbtqAR5c5LxC878UHijx0w8mnzT86rFDDvPjV3UIh1ZNYZD
	LC2ncGIkBNWYeKd+rfv6aVO9PCfgO8UXJx6iF+KY7fGKF+YMVUua0V+Eju0oUH7RWX+NmuocX6N
	9kvU14RH2wZDBAYj7kUS8F1CmKJ1gTcRI0FYKFMx+V8H0Jv6IgM5HPBRtE5LKZUbDs7HV7jlfmz
	IVDUCwfd7O3NIwrMkXn8GIbvRcwiGeo+H/ydlrQlApjWOw4711+p4g==
X-Received: by 2002:a17:90a:c105:b0:32b:9506:1780 with SMTP id 98e67ed59e1d1-32b95061914mr509676a91.9.1756941153949;
        Wed, 03 Sep 2025 16:12:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJraQjlwbN0zR+9PwpbOqHhv2LNJC9dD5qnPC8pEAW8rMp5MFpb5ckWx2qAd3V/w/pIHuUOg==
X-Received: by 2002:a17:90a:c105:b0:32b:9506:1780 with SMTP id 98e67ed59e1d1-32b95061914mr509641a91.9.1756941153501;
        Wed, 03 Sep 2025 16:12:33 -0700 (PDT)
Received: from [192.168.192.85] ([50.47.129.42])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7722a26abbbsm17543955b3a.5.2025.09.03.16.12.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Sep 2025 16:12:33 -0700 (PDT)
Message-ID: <2def01c9-56d8-4554-83e9-62522805d5ff@canonical.com>
Date: Wed, 3 Sep 2025 16:12:32 -0700
Precedence: bulk
X-Mailing-List: selinux@vger.kernel.org
List-Id: <selinux.vger.kernel.org>
List-Subscribe: <mailto:selinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:selinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/34] lsm: get rid of the lsm_names list and do some
 cleanup
To: Paul Moore <paul@paul-moore.com>
Cc: linux-security-module@vger.kernel.org, linux-integrity@vger.kernel.org,
 selinux@vger.kernel.org, Mimi Zohar <zohar@linux.ibm.com>,
 Roberto Sassu <roberto.sassu@huawei.com>, Fan Wu <wufan@kernel.org>,
 =?UTF-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>,
 =?UTF-8?Q?G=C3=BCnther_Noack?= <gnoack@google.com>,
 Kees Cook <kees@kernel.org>, Micah Morton <mortonm@chromium.org>,
 Casey Schaufler <casey@schaufler-ca.com>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Nicolas Bouchinet <nicolas.bouchinet@oss.cyber.gouv.fr>,
 Xiu Jianfeng <xiujianfeng@huawei.com>
References: <20250814225159.275901-36-paul@paul-moore.com>
 <20250814225159.275901-47-paul@paul-moore.com>
 <06a68323-b297-4be7-92eb-c2091207b9f0@canonical.com>
 <CAHC9VhQnFJLXrhcbQ2b7rWDNYjRRKoevqiKYchE_39ShcjgLEw@mail.gmail.com>
Content-Language: en-US
From: John Johansen <john.johansen@canonical.com>
Autocrypt: addr=john.johansen@canonical.com; keydata=
 xsFNBE5mrPoBEADAk19PsgVgBKkImmR2isPQ6o7KJhTTKjJdwVbkWSnNn+o6Up5knKP1f49E
 BQlceWg1yp/NwbR8ad+eSEO/uma/K+PqWvBptKC9SWD97FG4uB4/caomLEU97sLQMtnvGWdx
 rxVRGM4anzWYMgzz5TZmIiVTZ43Ou5VpaS1Vz1ZSxP3h/xKNZr/TcW5WQai8u3PWVnbkjhSZ
 PHv1BghN69qxEPomrJBm1gmtx3ZiVmFXluwTmTgJOkpFol7nbJ0ilnYHrA7SX3CtR1upeUpM
 a/WIanVO96WdTjHHIa43fbhmQube4txS3FcQLOJVqQsx6lE9B7qAppm9hQ10qPWwdfPy/+0W
 6AWtNu5ASiGVCInWzl2HBqYd/Zll93zUq+NIoCn8sDAM9iH+wtaGDcJywIGIn+edKNtK72AM
 gChTg/j1ZoWH6ZeWPjuUfubVzZto1FMoGJ/SF4MmdQG1iQNtf4sFZbEgXuy9cGi2bomF0zvy
 BJSANpxlKNBDYKzN6Kz09HUAkjlFMNgomL/cjqgABtAx59L+dVIZfaF281pIcUZzwvh5+JoG
 eOW5uBSMbE7L38nszooykIJ5XrAchkJxNfz7k+FnQeKEkNzEd2LWc3QF4BQZYRT6PHHga3Rg
 ykW5+1wTMqJILdmtaPbXrF3FvnV0LRPcv4xKx7B3fGm7ygdoowARAQABzStKb2huIEpvaGFu
 c2VuIDxqb2huLmpvaGFuc2VuQGNhbm9uaWNhbC5jb20+wsF3BBMBCgAhBQJOjRdaAhsDBQsJ
 CAcDBRUKCQgLBRYCAwEAAh4BAheAAAoJEAUvNnAY1cPYi0wP/2PJtzzt0zi4AeTrI0w3Rj8E
 Waa1NZWw4GGo6ehviLfwGsM7YLWFAI8JB7gsuzX/im16i9C3wHYXKs9WPCDuNlMc0rvivqUI
 JXHHfK7UHtT0+jhVORyyVVvX+qZa7HxdZw3jK+ROqUv4bGnImf31ll99clzo6HpOY59soa8y
 66/lqtIgDckcUt/1ou9m0DWKwlSvulL1qmD25NQZSnvB9XRZPpPd4bea1RTa6nklXjznQvTm
 MdLq5aJ79j7J8k5uLKvE3/pmpbkaieEsGr+azNxXm8FPcENV7dG8Xpd0z06E+fX5jzXHnj69
 DXXc3yIvAXsYZrXhnIhUA1kPQjQeNG9raT9GohFPMrK48fmmSVwodU8QUyY7MxP4U6jE2O9L
 7v7AbYowNgSYc+vU8kFlJl4fMrX219qU8ymkXGL6zJgtqA3SYHskdDBjtytS44OHJyrrRhXP
 W1oTKC7di/bb8jUQIYe8ocbrBz3SjjcL96UcQJecSHu0qmUNykgL44KYzEoeFHjr5dxm+DDg
 OBvtxrzd5BHcIbz0u9ClbYssoQQEOPuFmGQtuSQ9FmbfDwljjhrDxW2DFZ2dIQwIvEsg42Hq
 5nv/8NhW1whowliR5tpm0Z0KnQiBRlvbj9V29kJhs7rYeT/dWjWdfAdQSzfoP+/VtPRFkWLr
 0uCwJw5zHiBgzsFNBE5mrPoBEACirDqSQGFbIzV++BqYBWN5nqcoR+dFZuQL3gvUSwku6ndZ
 vZfQAE04dKRtIPikC4La0oX8QYG3kI/tB1UpEZxDMB3pvZzUh3L1EvDrDiCL6ef93U+bWSRi
 GRKLnNZoiDSblFBST4SXzOR/m1wT/U3Rnk4rYmGPAW7ltfRrSXhwUZZVARyJUwMpG3EyMS2T
 dLEVqWbpl1DamnbzbZyWerjNn2Za7V3bBrGLP5vkhrjB4NhrufjVRFwERRskCCeJwmQm0JPD
 IjEhbYqdXI6uO+RDMgG9o/QV0/a+9mg8x2UIjM6UiQ8uDETQha55Nd4EmE2zTWlvxsuqZMgy
 W7gu8EQsD+96JqOPmzzLnjYf9oex8F/gxBSEfE78FlXuHTopJR8hpjs6ACAq4Y0HdSJohRLn
 5r2CcQ5AsPEpHL9rtDW/1L42/H7uPyIfeORAmHFPpkGFkZHHSCQfdP4XSc0Obk1olSxqzCAm
 uoVmRQZ3YyubWqcrBeIC3xIhwQ12rfdHQoopELzReDCPwmffS9ctIb407UYfRQxwDEzDL+m+
 TotTkkaNlHvcnlQtWEfgwtsOCAPeY9qIbz5+i1OslQ+qqGD2HJQQ+lgbuyq3vhefv34IRlyM
 sfPKXq8AUTZbSTGUu1C1RlQc7fpp8W/yoak7dmo++MFS5q1cXq29RALB/cfpcwARAQABwsFf
 BBgBCgAJBQJOZqz6AhsMAAoJEAUvNnAY1cPYP9cP/R10z/hqLVv5OXWPOcpqNfeQb4x4Rh4j
 h/jS9yjes4uudEYU5xvLJ9UXr0wp6mJ7g7CgjWNxNTQAN5ydtacM0emvRJzPEEyujduesuGy
 a+O6dNgi+ywFm0HhpUmO4sgs9SWeEWprt9tWrRlCNuJX+u3aMEQ12b2lslnoaOelghwBs8IJ
 r998vj9JBFJgdeiEaKJLjLmMFOYrmW197As7DTZ+R7Ef4gkWusYFcNKDqfZKDGef740Xfh9d
 yb2mJrDeYqwgKb7SF02Hhp8ZnohZXw8ba16ihUOnh1iKH77Ff9dLzMEJzU73DifOU/aArOWp
 JZuGJamJ9EkEVrha0B4lN1dh3fuP8EjhFZaGfLDtoA80aPffK0Yc1R/pGjb+O2Pi0XXL9AVe
 qMkb/AaOl21F9u1SOosciy98800mr/3nynvid0AKJ2VZIfOP46nboqlsWebA07SmyJSyeG8c
 XA87+8BuXdGxHn7RGj6G+zZwSZC6/2v9sOUJ+nOna3dwr6uHFSqKw7HwNl/PUGeRqgJEVu++
 +T7sv9+iY+e0Y+SolyJgTxMYeRnDWE6S77g6gzYYHmcQOWP7ZMX+MtD4SKlf0+Q8li/F9GUL
 p0rw8op9f0p1+YAhyAd+dXWNKf7zIfZ2ME+0qKpbQnr1oizLHuJX/Telo8KMmHter28DPJ03 lT9Q
Organization: Canonical
In-Reply-To: <CAHC9VhQnFJLXrhcbQ2b7rWDNYjRRKoevqiKYchE_39ShcjgLEw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/3/25 13:26, Paul Moore wrote:
> On Tue, Sep 2, 2025 at 1:20 PM John Johansen
> <john.johansen@canonical.com> wrote:
>> On 8/14/25 15:50, Paul Moore wrote:
>>> The LSM currently has a lot of code to maintain a list of the currently
>>> active LSMs in a human readable string, with the only user being the
>>> "/sys/kernel/security/lsm" code.  Let's drop all of that code and
>>> generate the string on first use and then cache it for subsequent use.
>>>
>>> Signed-off-by: Paul Moore <paul@paul-moore.com>
>>> ---
>>>    include/linux/lsm_hooks.h |  1 -
>>>    security/inode.c          | 59 +++++++++++++++++++++++++++++++++++++--
>>>    security/lsm_init.c       | 49 --------------------------------
>>>    3 files changed, 57 insertions(+), 52 deletions(-)
>>>
>>> diff --git a/include/linux/lsm_hooks.h b/include/linux/lsm_hooks.h
>>> index 7343dd60b1d5..65a8227bece7 100644
>>> --- a/include/linux/lsm_hooks.h
>>> +++ b/include/linux/lsm_hooks.h
>>> @@ -172,7 +172,6 @@ struct lsm_info {
>>>
>>>
>>>    /* DO NOT tamper with these variables outside of the LSM framework */
>>> -extern char *lsm_names;
>>>    extern struct lsm_static_calls_table static_calls_table __ro_after_init;
>>>
>>>    /**
>>> diff --git a/security/inode.c b/security/inode.c
>>> index 43382ef8896e..a5e7a073e672 100644
>>> --- a/security/inode.c
>>> +++ b/security/inode.c
>>> @@ -22,6 +22,8 @@
>>>    #include <linux/lsm_hooks.h>
>>>    #include <linux/magic.h>
>>>
>>> +#include "lsm.h"
>>> +
>>>    static struct vfsmount *mount;
>>>    static int mount_count;
>>>
>>> @@ -315,12 +317,65 @@ void securityfs_remove(struct dentry *dentry)
>>>    EXPORT_SYMBOL_GPL(securityfs_remove);
>>>
>>>    #ifdef CONFIG_SECURITY
>>> +#include <linux/spinlock.h>
>>> +
>>>    static struct dentry *lsm_dentry;
>>> +
>>> +/* NOTE: we never free the string below once it is set. */
>>> +static DEFINE_SPINLOCK(lsm_read_lock);
>>
>> nit, this is only used on the write side, so not the best name
> 
> Fair point, I'll rename it to lsm_read_str_lock, it still has "read"
> in the name, but it should be a bit more clear that it references the
> lsm_read_str variable.
> 
>>> +static char *lsm_read_str = NULL;
>>> +static ssize_t lsm_read_len = 0;
> 
> Similarly, I'm renaming lsm_read_len to lsm_read_str_len.
> 
>>>    static ssize_t lsm_read(struct file *filp, char __user *buf, size_t count,
>>>                        loff_t *ppos)
>>>    {
>>> -     return simple_read_from_buffer(buf, count, ppos, lsm_names,
>>> -             strlen(lsm_names));
>>> +     int i;
>>> +     char *str;
>>> +     ssize_t len;
>>> +
>>> +restart:
>>> +
>>> +     rcu_read_lock();
>>> +     if (!lsm_read_str) {
>>
>> should probably be
>> if (!rcu_access_pointer(lsm_read_str)) {
> 
> The description for rcu_access_pointer() contains the following sentence:
> 
>    "Within an RCU read-side critical section, there is little reason to
>     use rcu_access_pointer()."
>    https://elixir.bootlin.com/linux/v6.17-rc4/source/include/linux/rcupdate.h#L628
> 
> Perhaps I'm reading it wrong, but it looks like the RCU folks would
> prefer we not use rcu_access_pointer() here?
> 
no, I just forgot that detail


