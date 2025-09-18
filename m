Return-Path: <selinux+bounces-4553-lists+selinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C03CDB21552
	for <lists+selinux@lfdr.de>; Mon, 11 Aug 2025 21:30:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 44AE34229D2
	for <lists+selinux@lfdr.de>; Mon, 11 Aug 2025 19:30:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEDF91E0DD8;
	Mon, 11 Aug 2025 19:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="oXQgnFZK"
X-Original-To: selinux@vger.kernel.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E59D14C7F
	for <selinux@vger.kernel.org>; Mon, 11 Aug 2025 19:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.77.154.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754940630; cv=none; b=YaXlik2/4IU4vxUa39r4bfgMnsuRypZxlWfJZEAs10x6qdxas0fpV0i+DIrBb+8uyX7GLMWIEt0IPDiii2kw7Dqjvw9jOVCFH1/BXqkr4lLfZU6NtNIiArHFghodPWLPVzXn0PPl9VEABkh08dnevl37cRZGRDVZVioVEYkmFR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754940630; c=relaxed/simple;
	bh=EUSNZ5slJ3RNEB1hc6kwIdUBb6pX6wOYGdsTzngFD2M=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=k4WUB3ANaYwgs2/GAkkYqdttBxFfgrLe8qwm3SUjvsNbp9BLnJwToE9MpT47WNJWdgc8uso/FVJZYvK7bNLqoaDsZoMLJKr40jjJPzggjSnfU4owrvvv6CgW451Xkk4AGlJQ68lpDOuylR96+A/Eu39H8tI0ZOVB1i+k8XUqrYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; spf=pass smtp.mailfrom=linux.microsoft.com; dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b=oXQgnFZK; arc=none smtp.client-ip=13.77.154.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Received: from [10.137.198.68] (unknown [131.107.8.68])
	by linux.microsoft.com (Postfix) with ESMTPSA id E692E211826C;
	Mon, 11 Aug 2025 12:30:27 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com E692E211826C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1754940628;
	bh=xt3RL18YTomUZgQxcePrDABlVQUoKuY4igWXRIcgY7g=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=oXQgnFZKJE5RrI0qRPK7buEQp3kn3CAcL3k5Zs1hexE2vX0T10qdYDj7pmu+2ST7j
	 Gk8KzvnIFCkapc/ZEr449y2g2ircyGDrgJ+RF6o2jBRMVVp0WzVUkwSU9ap8FGl9gw
	 Qz6zY1xBuB0HR0b+iEFHmA9tQ6lZ2xbrnDAp74dk=
Message-ID: <e5278ea4-33b5-48b5-a59e-bef7c4cfe866@linux.microsoft.com>
Date: Mon, 11 Aug 2025 12:30:26 -0700
Precedence: bulk
X-Mailing-List: selinux@vger.kernel.org
List-Id: <selinux.vger.kernel.org>
List-Subscribe: <mailto:selinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:selinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Eric Suen <ericsu@linux.microsoft.com>
Subject: Re: [PATCH] SELinux: Add support for BPF token access control
To: Daniel Durning <danieldurning.work@gmail.com>
Cc: selinux@vger.kernel.org, paul@paul-moore.com
References: <20250806180149.1995-1-ericsu@linux.microsoft.com>
 <CAKrb_fGECzqWO+Kq7n+5Q=J404npPyttrkLcXwLkdM-UZcZmLA@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAKrb_fGECzqWO+Kq7n+5Q=J404npPyttrkLcXwLkdM-UZcZmLA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 8/7/2025 11:00 AM, Daniel Durning wrote:
> On Wed, Aug 6, 2025 at 2:07 PM<ericsu@linux.microsoft.com> wrote:
>> From: Eric Suen<ericsu@linux.microsoft.com>
>>
>> BPF token support was introduced to allow a privileged process to delegate
>> limited BPF functionality—such as map creation and program loading—to an
>> unprivileged process:
>>    https://lore.kernel.org/linux-security-module/20231130185229.2688956-1-andrii@kernel.org/
>>
>> This patch adds SELinux support for controlling BPF token access. With
>> this change, SELinux policies can now enforce constraints on BPF token
>> usage based on both the delegating (privileged) process and the recipient
>> (unprivileged) process.
>>
>> Supported operations currently include:
>>    - map_create
>>    - prog_load
>>
>> High-level workflow:
>>    1. An unprivileged process creates a VFS context via `fsopen()` and
>>       obtains a file descriptor.
>>    2. This descriptor is passed to a privileged process, which configures
>>       BPF token delegation options and mounts a BPF filesystem.
>>    3. SELinux records the `creator_sid` of the privileged process during
>>       mount setup.
>>    4. The unprivileged process then uses this BPF fs mount to create a
>>       token and attach it to subsequent BPF syscalls.
>>    5. During verification of `map_create` and `prog_load`, SELinux uses
>>       `creator_sid` and the current SID to check policy permissions via:
>>         avc_has_perm(creator_sid, current_sid, SECCLASS_BPF,
>>                      BPF__MAP_CREATE, NULL);
>>
>> To verify the logic introduced by this patch, my fork of the SELinux
>> testsuite with relevant test cases is available here:
>>    https://github.com/havefuncoding1/selinux-testsuite
>>
> I like your approach. I have added some comments below. I think it
> would be worth implementing and testing the bpf_token_capable hook in
> your patch as well. You are welcome to reference my implementation.
Let me look into this first and we can have further discussion later.
>> Signed-off-by: Eric Suen<ericsu@linux.microsoft.com>
>> ---
>>   security/selinux/hooks.c                   | 107 ++++++++++++++++++++-
>>   security/selinux/include/classmap.h        |   2 +-
>>   security/selinux/include/objsec.h          |   4 +
>>   security/selinux/include/policycap.h       |   1 +
>>   security/selinux/include/policycap_names.h |   1 +
>>   security/selinux/include/security.h        |   6 ++
>>   6 files changed, 118 insertions(+), 3 deletions(-)
>>
>> diff --git a/security/selinux/hooks.c b/security/selinux/hooks.c
>> index 335fbf76cdd2..ef9771542737 100644
>> --- a/security/selinux/hooks.c
>> +++ b/security/selinux/hooks.c
>> @@ -733,6 +733,8 @@ static int selinux_set_mnt_opts(struct super_block *sb,
>>                  goto out;
>>          }
>>
>> +       sbsec->creator_sid = current_sid();
>> +
>>          if (strcmp(sb->s_type->name, "proc") == 0)
>>                  sbsec->flags |= SE_SBPROC | SE_SBGENFS;
>>
>> @@ -7002,9 +7004,13 @@ static int selinux_ib_alloc_security(void *ib_sec)
>>   static int selinux_bpf(int cmd, union bpf_attr *attr,
>>                         unsigned int size, bool kernel)
>>   {
>> +       bool bpf_token_perms = selinux_policycap_bpf_token_perms();
>>          u32 sid = current_sid();
>>          int ret;
>>
>> +       if (bpf_token_perms)
>> +               return 0;
> Why are you just returning 0 here instead of checking the permissions
> of the token regardless? Since you appear to do that in
> selinux_bpf_token_create, selinux_bpf_map_create and
> selinux_bpf_prog_load.

in case of of token is present, source and target SIDs we use to check 
for avc_has_perm are different. This is current design. Whether or not 
it's appropriate, we can discuss. However, if we go with this approach, 
then it's the best to delay the permission check when actual function is 
called, i.e. selinux_bpf_map_create and selinux_bpf_pro_load.

>> +
>>          switch (cmd) {
>>          case BPF_MAP_CREATE:
>>                  ret = avc_has_perm(sid, sid, SECCLASS_BPF, BPF__MAP_CREATE,
>> @@ -7086,10 +7092,34 @@ static int selinux_bpf_prog(struct bpf_prog *prog)
>>                              BPF__PROG_RUN, NULL);
>>   }
>>
>> +static int selinux_bpffs_creator_sid(const union bpf_attr *attr)
>> +{
>> +       struct path path;
>> +       struct super_block *sb;
>> +       struct superblock_security_struct *sbsec;
>> +
>> +       CLASS(fd, f)(attr->token_create.bpffs_fd);
>> +
>> +       if (!fd_file(f))
>> +               return SECSID_NULL;
> Is it possible for this value to be null assuming there is not a bug
> in the kernel? You would not want to do a runtime check for something
> that would indicate a kernel bug lest you accidentally hide the bug.
I always think being defensive is a good thing in kernel development. 
But you have a valid point, and I will review and update in next 
iteration if appropriate. Same applies to all similar comments below. 
Thank you.
>
>> +
>> +       path = fd_file(f)->f_path;
>> +       sb = path.dentry->d_sb;
>> +       if (!sb)
>> +               return SECSID_NULL;
> I do not think this value should ever be null barring a bug in the kernel.
>
>> +
>> +       sbsec = selinux_superblock(sb);
>> +       if (!sbsec)
>> +               return SECSID_NULL;
> Again, I do not think this value should ever be null barring a bug in
> the kernel.
>
>> +
>> +       return sbsec->creator_sid;
>> +}
>> +
>>   static int selinux_bpf_map_create(struct bpf_map *map, union bpf_attr *attr,
>>                                    struct bpf_token *token, bool kernel)
>>   {
>>          struct bpf_security_struct *bpfsec;
>> +       u32 ssid;
>>
>>          bpfsec = kzalloc(sizeof(*bpfsec), GFP_KERNEL);
>>          if (!bpfsec)
>> @@ -7098,7 +7128,15 @@ static int selinux_bpf_map_create(struct bpf_map *map, union bpf_attr *attr,
>>          bpfsec->sid = current_sid();
>>          map->security = bpfsec;
>>
>> -       return 0;
>> +       if (!token)
>> +               ssid = bpfsec->sid;
>> +       else {
>> +               ssid = selinux_bpffs_creator_sid(attr);
>> +               if (ssid == SECSID_NULL)
>> +                       return -EPERM;
> Should this ever be null? See above (for this and all repeated
> occurrences of this check).
>
>> +       }
>> +
>> +       return avc_has_perm(ssid, bpfsec->sid, SECCLASS_BPF, BPF__MAP_CREATE, NULL);
> In the token case, why is this not already handled by selinux_bpf_token_create?

It's because source and target sids are different. The setup is that a 
privileged process configures BPF token delegations, so logically we 
want to see if the privileged process (creator_sid) is allowed to 
perform map_create on object with current_sid (current unprivileged 
process).

In selinux_bpf_token_create, we make sure current process is allowed to 
perform map_create_as on object with creator_sid. You are right, there 
is no need to call avc_has_perm here if creator_sid and current_sid are 
identical (which is true in my test). However, this is not the case in 
real world scenarios.

>>   }
>>
>>   static void selinux_bpf_map_free(struct bpf_map *map)
>> @@ -7113,6 +7151,7 @@ static int selinux_bpf_prog_load(struct bpf_prog *prog, union bpf_attr *attr,
>>                                   struct bpf_token *token, bool kernel)
>>   {
>>          struct bpf_security_struct *bpfsec;
>> +       u32 ssid;
>>
>>          bpfsec = kzalloc(sizeof(*bpfsec), GFP_KERNEL);
>>          if (!bpfsec)
>> @@ -7121,7 +7160,15 @@ static int selinux_bpf_prog_load(struct bpf_prog *prog, union bpf_attr *attr,
>>          bpfsec->sid = current_sid();
>>          prog->aux->security = bpfsec;
>>
>> -       return 0;
>> +       if (!token)
>> +               ssid = bpfsec->sid;
>> +       if (token) {
>> +               ssid = selinux_bpffs_creator_sid(attr);
>> +               if (ssid == SECSID_NULL)
>> +                       return -EPERM;
>> +       }
>> +
>> +       return avc_has_perm(ssid, bpfsec->sid, SECCLASS_BPF, BPF__PROG_LOAD, NULL);
>>   }
>>
>>   static void selinux_bpf_prog_free(struct bpf_prog *prog)
>> @@ -7132,10 +7179,18 @@ static void selinux_bpf_prog_free(struct bpf_prog *prog)
>>          kfree(bpfsec);
>>   }
>>
>> +#define bpf_token_cmd(T, C) \
>> +       ((T)->allowed_cmds & (1ULL << (C)))
>> +
>>   static int selinux_bpf_token_create(struct bpf_token *token, union bpf_attr *attr,
>>                                      const struct path *path)
>>   {
>>          struct bpf_security_struct *bpfsec;
>> +       u32 sid = selinux_bpffs_creator_sid(attr);
>> +       int err;
>> +
>> +       if (sid == SECSID_NULL)
>> +               return -EPERM;
>>
>>          bpfsec = kzalloc(sizeof(*bpfsec), GFP_KERNEL);
>>          if (!bpfsec)
>> @@ -7144,6 +7199,29 @@ static int selinux_bpf_token_create(struct bpf_token *token, union bpf_attr *att
>>          bpfsec->sid = current_sid();
>>          token->security = bpfsec;
>>
>> +       bpfsec->perms = 0;
>> +
>> +       /**
>> +        * 'token->allowed_cmds' is a bit mask of allowed commands
>> +        * Convert the BPF command enum to a bitmask representing its position in the
>> +        * allowed_cmds bitmap.
>> +        */
>> +       if (bpf_token_cmd(token, BPF_MAP_CREATE)) {
>> +               err = avc_has_perm(bpfsec->sid, sid, SECCLASS_BPF, BPF__MAP_CREATE_AS, NULL);
>> +               if (err)
>> +                       return err;
>> +
>> +               bpfsec->perms |= BPF__MAP_CREATE;
>> +       }
>> +
>> +       if (bpf_token_cmd(token, BPF_PROG_LOAD)) {
>> +               err = avc_has_perm(bpfsec->sid, sid, SECCLASS_BPF, BPF__PROG_LOAD_AS, NULL);
>> +               if (err)
>> +                       return err;
>> +
>> +               bpfsec->perms |= BPF__PROG_LOAD;
>> +       }
>> +
>>          return 0;
>>   }
>>
>> @@ -7154,6 +7232,30 @@ static void selinux_bpf_token_free(struct bpf_token *token)
>>          token->security = NULL;
>>          kfree(bpfsec);
>>   }
>> +
>> +static int selinux_bpf_token_cmd(const struct bpf_token *token, enum bpf_cmd cmd)
>> +{
>> +       struct bpf_security_struct *bpfsec;
>> +
>> +       if (!token || !token->security)
>> +               return -EINVAL;
> Not sure if these should ever be null barring a kernel bug either.



