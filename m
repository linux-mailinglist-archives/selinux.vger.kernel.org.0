Return-Path: <selinux+bounces-1465-lists+selinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B635E93A65A
	for <lists+selinux@lfdr.de>; Tue, 23 Jul 2024 20:34:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DA0EF1C22376
	for <lists+selinux@lfdr.de>; Tue, 23 Jul 2024 18:34:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 547A4158A32;
	Tue, 23 Jul 2024 18:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="aFepVZkW"
X-Original-To: selinux@vger.kernel.org
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BAC5158A01
	for <selinux@vger.kernel.org>; Tue, 23 Jul 2024 18:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721759658; cv=none; b=W5h9Wd7zLlRVLLD+CGB9RacDO1CqIjp4FhHMyQLP0B4iOcBU+8vfonjfJeFlrnvfO6ted4yvVJTlkkauBDqUJlDm3wQ/QPpjzfQhXuVjkHwcdo8XRlP+1IaQjAuQXWLWV0LGcqGLirljRHQP2KFNxGgjkH889LHFEcj8Af/2hjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721759658; c=relaxed/simple;
	bh=/BDujCC1m34ov27OfSvcr6YJrOqVpBj1SDvh/3UsOlU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MZvpyHFrsgWJY3V0hOo2/fB83Ij/0lN0mSXUGZgk0Gfh5TYWinb0dAm0J/k+y8WCMDci8S3VNILX7pbt6YzZUnaBnlulldQ2Yt4X7wkttEemHi4tcrH8pQ9hrnKuOVhfRktCs79Nufz0hrgkiT1ktqdLTmMDvsbY1PdZvTIZf14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=aFepVZkW; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-dff1ccdc17bso5723145276.0
        for <selinux@vger.kernel.org>; Tue, 23 Jul 2024 11:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1721759655; x=1722364455; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Umx7dac9KxgI1oocDLH/hx1evzjsOlrXNT+tzGIsg7k=;
        b=aFepVZkWo816N4mggXBCyxO8EYpfjir9sv3wzJyUlO/Brxq1ogEQQCmErHOsWvOdpn
         GEKaw3Ar0YNNjJJXto3U9ymA7CHHwCHvrEZGW2qB1KaWcN4BYF2/eYVSEp5dmIl44ain
         2qkv+MAeuV1nunFiLAt19CLxls2oALpPIPqkxlTeDO+1DgQv2x3OZ35exOhUf3me8Yvb
         t1PeWMYKTpQAEdmm47UaoG0jPgaMtux5w0fBctyxEwItK8Mnw7OA35RPafGl4lh62z+H
         RnI1p+Pb5kwiQxZor2rqBP+jNDgpDHf7QDK0wQ5hHImC7v9Ok0S3afv/4imlHvK6CuWp
         QBrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721759655; x=1722364455;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Umx7dac9KxgI1oocDLH/hx1evzjsOlrXNT+tzGIsg7k=;
        b=iFNwp2EfqeUcJZJZ5ZsJo7BNC0IAp0OoXG8cgvjgRSAOY5wz5HKBvJx03n/BrC9gOn
         guZn5u9xh/VTetjkrZ+n3Ny+h+pWUzfuA7d4pG721XsFpBsF7A4ZDhBzCteqFSxSdCXB
         Lmq6B9J6OXfpff6/ccQxqX4SKpgpOATuiGb9fT1bS0szTXuHaP97gE4EETgnaVMV1y2K
         Msnp2MuIdyJYL6/PnVKZ0062J5ob3szH2gbga8ZD7dGusgOy+Q2oNrOxO64FfwyXMG4K
         l1FBx8r8yxiwWtNTB+Qca2BoZdkIxTSyx16+oHUeW/h1KxxZdB7QdqDDt5M0M43JKZeX
         xQZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXv2XQxDoCiYtX8sRYQVCluiEv1CFyQe3IzM/SSOGFnZ3rpcbWDGH4xMHvehLXePURtDKSDiw8i2olP7j0oiIq7tqDTmsJZRg==
X-Gm-Message-State: AOJu0YwN06wOzckSuZ3jcCGDubZ5W8XWWDlV2UxjZBI03Oic6YE1I25J
	LHeoB7L9IzuyVjPASnGqU3wM6q51MxLW6CLXEChw9IQ8LuNRjACvy1LmCX2lJ5DgaWzocMmQzug
	O9/YDOSM6apC+/JgEOAlgO/rPhISoQx5tr+Jx
X-Google-Smtp-Source: AGHT+IEk6clKXMmbj8F9c4ALs9K9k0S5PErz2GXRvQye1XVqqzrWp12U0J4otwfEg5J3qaVWYV/s7JesHhJr3dvtkHg=
X-Received: by 2002:a05:6902:11cc:b0:e08:551f:c90f with SMTP id
 3f1490d57ef6-e087b2eaaa6mr11618458276.7.1721759655226; Tue, 23 Jul 2024
 11:34:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: selinux@vger.kernel.org
List-Id: <selinux.vger.kernel.org>
List-Subscribe: <mailto:selinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:selinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240711111908.3817636-10-xukuohai@huaweicloud.com>
 <94a3b82a1e3e1fec77d676fa382105d4@paul-moore.com> <7711bdba-9fbd-406c-8b81-adf91074d0b7@huaweicloud.com>
 <CAHC9VhSsCuJzJ3ReUTyTXfWqRd+_TfShJBnRugZtX6OrMYJkOQ@mail.gmail.com> <b1ba86f7-f943-4913-8265-2a94f3951a88@huaweicloud.com>
In-Reply-To: <b1ba86f7-f943-4913-8265-2a94f3951a88@huaweicloud.com>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 23 Jul 2024 14:34:04 -0400
Message-ID: <CAHC9VhQhLE8aunBsSvoGv2dWw3TGihXhXCJO1eSbx2VRAf5GDQ@mail.gmail.com>
Subject: Re: [PATCH v4 9/20] lsm: Refactor return value of LSM hook key_getsecurity
To: Xu Kuohai <xukuohai@huaweicloud.com>
Cc: bpf@vger.kernel.org, netdev@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-integrity@vger.kernel.org, selinux@vger.kernel.org, 
	Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, 
	Matt Bobrowski <mattbobrowski@google.com>, Brendan Jackman <jackmanb@chromium.org>, 
	James Morris <jmorris@namei.org>, "Serge E . Hallyn" <serge@hallyn.com>, 
	Khadija Kamran <kamrankhadijadj@gmail.com>, Casey Schaufler <casey@schaufler-ca.com>, 
	Ondrej Mosnacek <omosnace@redhat.com>, Kees Cook <keescook@chromium.org>, 
	John Johansen <john.johansen@canonical.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, 
	Roberto Sassu <roberto.sassu@huawei.com>, Shung-Hsi Yu <shung-hsi.yu@suse.com>, 
	Edward Cree <ecree.xilinx@gmail.com>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Trond Myklebust <trond.myklebust@hammerspace.com>, 
	Anna Schumaker <anna@kernel.org>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Stephen Smalley <stephen.smalley.work@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 23, 2024 at 3:04=E2=80=AFAM Xu Kuohai <xukuohai@huaweicloud.com=
> wrote:
> On 7/23/2024 5:35 AM, Paul Moore wrote:
> > On Sat, Jul 20, 2024 at 5:31=E2=80=AFAM Xu Kuohai <xukuohai@huaweicloud=
.com> wrote:
> >> On 7/19/2024 10:08 AM, Paul Moore wrote:
> >>> On Jul 11, 2024 Xu Kuohai <xukuohai@huaweicloud.com> wrote:
> >>>>
> >>>> To be consistent with most LSM hooks, convert the return value of
> >>>> hook key_getsecurity to 0 or a negative error code.
> >>>>
> >>>> Before:
> >>>> - Hook key_getsecurity returns length of value on success or a
> >>>>     negative error code on failure.
> >>>>
> >>>> After:
> >>>> - Hook key_getsecurity returns 0 on success or a negative error
> >>>>     code on failure. An output parameter @len is introduced to hold
> >>>>     the length of value on success.
> >>>>
> >>>> Signed-off-by: Xu Kuohai <xukuohai@huawei.com>
> >>>> ---
> >>>>    include/linux/lsm_hook_defs.h |  3 ++-
> >>>>    include/linux/security.h      |  6 ++++--
> >>>>    security/keys/keyctl.c        | 11 ++++++++---
> >>>>    security/security.c           | 26 +++++++++++++++++++++-----
> >>>>    security/selinux/hooks.c      | 11 +++++------
> >>>>    security/smack/smack_lsm.c    | 21 +++++++++++----------
> >>>>    6 files changed, 51 insertions(+), 27 deletions(-)
> >
> > ...
> >
> >>>> diff --git a/security/security.c b/security/security.c
> >>>> index 9dd2ae6cf763..2c161101074d 100644
> >>>> --- a/security/security.c
> >>>> +++ b/security/security.c
> >>>> @@ -5338,19 +5338,35 @@ int security_key_permission(key_ref_t key_re=
f, const struct cred *cred,
> >>>>     * security_key_getsecurity() - Get the key's security label
> >>>>     * @key: key
> >>>>     * @buffer: security label buffer
> >>>> + * @len: the length of @buffer (including terminating NULL) on succ=
ess
> >>>>     *
> >>>>     * Get a textual representation of the security context attached =
to a key for
> >>>>     * the purposes of honouring KEYCTL_GETSECURITY.  This function a=
llocates the
> >>>>     * storage for the NUL-terminated string and the caller should fr=
ee it.
> >>>>     *
> >>>> - * Return: Returns the length of @buffer (including terminating NUL=
) or -ve if
> >>>> - *         an error occurs.  May also return 0 (and a NULL buffer p=
ointer) if
> >>>> - *         there is no security label assigned to the key.
> >>>> + * Return: Returns 0 on success or -ve if an error occurs. May also=
 return 0
> >>>> + *         (and a NULL buffer pointer) if there is no security labe=
l assigned
> >>>> + *         to the key.
> >>>>     */
> >>>> -int security_key_getsecurity(struct key *key, char **buffer)
> >>>> +int security_key_getsecurity(struct key *key, char **buffer, size_t=
 *len)
> >>>>    {
> >>>> +    int rc;
> >>>> +    size_t n =3D 0;
> >>>> +    struct security_hook_list *hp;
> >>>> +
> >>>>       *buffer =3D NULL;
> >>>> -    return call_int_hook(key_getsecurity, key, buffer);
> >>>> +
> >>>> +    hlist_for_each_entry(hp, &security_hook_heads.key_getsecurity, =
list) {
> >>>> +            rc =3D hp->hook.key_getsecurity(key, buffer, &n);
> >>>> +            if (rc < 0)
> >>>> +                    return rc;
> >>>> +            if (n)
> >>>> +                    break;
> >>>> +    }
> >>>> +
> >>>> +    *len =3D n;
> >>>> +
> >>>> +    return 0;
> >>>>    }
> >>>
> >>> Help me understand why we can't continue to use the call_int_hook()
> >>> macro here?
> >>>
> >>
> >> Before this patch, the hook may return +ve, 0, or -ve, and call_int_ho=
ok
> >> breaks the loop when the hook return value is not 0.
> >>
> >> After this patch, the +ve is stored in @n, so @n and return value shou=
ld
> >> both be checked to determine whether to break the loop. This is not
> >> feasible with call_int_hook.
> >
> > Yes, gotcha.  I was focused on the error condition and wasn't thinking
> > about the length getting zero'd out by a trailing callback.
> > Unfortunately, we *really* want to stick with the
> > call_{int,void}_hook() macros so I think we either need to find a way
> > to work within that constraint for existing macro callers, or we have
> > to leave this hook as-is for the moment.
> >
>
> Let's leave it as is. So we ultimately have four hooks that can be
> converted, two of which require adding additional output parameter to
> hold odd return values. These output parameters require extra work
> on the BPF verifier, and it doesn't seem worthwhile just for two
> hooks. So I prefer to keep only the two patches that handle
> conversion without adding output parameters (patch 1 and 5).

Fair enough.  Thanks for working on this, between the changes to the
LSM framework and the BPF verifier, I think this is still a nice
improvement.

--=20
paul-moore.com

