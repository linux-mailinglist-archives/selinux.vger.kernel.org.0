Return-Path: <selinux+bounces-1453-lists+selinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EEC90939593
	for <lists+selinux@lfdr.de>; Mon, 22 Jul 2024 23:35:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ABA692827EB
	for <lists+selinux@lfdr.de>; Mon, 22 Jul 2024 21:35:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77B994503A;
	Mon, 22 Jul 2024 21:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="I2XpA0Y7"
X-Original-To: selinux@vger.kernel.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB0233BBF2
	for <selinux@vger.kernel.org>; Mon, 22 Jul 2024 21:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721684117; cv=none; b=XtjnEE7gzBJwNzrEVp0DjPJXg3D5l9qs60GK8dlROxJr9xOrP8JKmcHjJW5UY7Ot5oe9DZXQB0sHJFQ5819SSOrO7pqvyxAEPLg8RZZ9xRJaxLcpuYVYea8EKIqs4ghPv1ojKm2B3sFbmFdVFl1Zm4AGiKlQWOzjpQLaPySJhso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721684117; c=relaxed/simple;
	bh=QkalD80DqvTDCz2PN2W94IIv1RWLqf+OXseqlPlrVLI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vjnk4f3isag4NlqWh15FB3Ue7k5hDwjd+diZy5XNNnFs4ihQdKytJ4eZfjxRSarXnkLbFSDeoEpcCfmlsVjlywNalXBU3sIraTA00KG2oYq6dj3qC42rGw1I3IZ+pN+GuGmGjSBJTrEutQrkh8888Atw4LMSJ7avb9NI4WkIG34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=I2XpA0Y7; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e05e94a979eso3438388276.0
        for <selinux@vger.kernel.org>; Mon, 22 Jul 2024 14:35:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1721684114; x=1722288914; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uTsqn/83ZPeaLCYHapIif4YXESvQF8i3Q92iI0P3qBc=;
        b=I2XpA0Y7yXAFbooqbBs+mjE3d7rVzVMzufMptvTU5Z82mSMfvyIj0LuQlz0IiMFDdg
         HbiaGPc9EaV541ig95M98Xjh+czaV6bLTP4sXWGojDMA2JjK6XqPe/WHqrh4hVXqKsBj
         Hdpj6JcJx0WIxXm7hAjJyfpA/RJy7liY4gg2ddBHDgixp2oxEViG67gpUOA1YsR9KyNg
         lUYd5ryYaNXenrdAHrSubWSl6nls5+Z59e96rTvj8gSu+v8a/wElUHPDkW45LH5/4UoJ
         Qv0Nuk4DPZ7D+fbaITp7S5STrx30NNvpmifQ0ZPmYpBAESsoL5r9xwz4Vm+zWKkL4MhX
         wQ0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721684114; x=1722288914;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uTsqn/83ZPeaLCYHapIif4YXESvQF8i3Q92iI0P3qBc=;
        b=jpezHLIR1bdp5Mh7/XWjLVujLJyvCZTyTeJYuak6Qq826F1ksB4O4dmP9yMy8umYAO
         VrrjYVs/0V3Sz/EDDAnpmSc0Xm/oOsuRBCKiQd+Uw2YGUk9/vsUg4HHEK251iZEdqh6T
         xeSaZGtn2RxB5rBrsuoPcr7FhQk3BeolE73Hji/41dEGKXYNSJi6E9wuujw4oers5nzN
         yk5+3gedZromNRNFQtgGqLRg8hkSbClr5LG8D9mLCBd4fRGT6VKb5EFuwQsvOeBRMCwl
         u7vkC/0lP0/PTJBfJvM2Yfu5Z53zzxXRXywBZZEzbuE2vKu2Tqnx+8yskVnrcORacGoo
         a6ag==
X-Forwarded-Encrypted: i=1; AJvYcCWGUGylSXXFYCg5JT4O/yWGVO5p528cVWhpEDnJVw4BXctIF7HO1y2Y5gIzEMrErslTBZWFK9zDG8H0DAcr7Jrqab7RGC6yKw==
X-Gm-Message-State: AOJu0YzBNYa5SHJV9PzR1ZE6/XmHHuC0+vVniBhZDFc8cMGUxyiQqjRl
	YItV2LIrXPTKNAVc0HYy5g+ZFf3UvJt5mDc9Zs5Ftf8BuwNa8SAcD+PHJ2Q+voUyELeKtYj/tv3
	Dxw6OIJqgQZHw8bp3MsuJHn4Llc1c3GkuU7po
X-Google-Smtp-Source: AGHT+IFxvRdTpM9J/N/0hPOw4WP6B7wxQLoIxE+F11e00K/b5jjFnXSxfC/5KNaKiSnG10O3MfvJ02z+6becK/m+/x8=
X-Received: by 2002:a5b:d03:0:b0:e05:e4a6:3f1b with SMTP id
 3f1490d57ef6-e08b95ce4d8mr146419276.7.1721684113783; Mon, 22 Jul 2024
 14:35:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: selinux@vger.kernel.org
List-Id: <selinux.vger.kernel.org>
List-Subscribe: <mailto:selinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:selinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240711111908.3817636-10-xukuohai@huaweicloud.com>
 <94a3b82a1e3e1fec77d676fa382105d4@paul-moore.com> <7711bdba-9fbd-406c-8b81-adf91074d0b7@huaweicloud.com>
In-Reply-To: <7711bdba-9fbd-406c-8b81-adf91074d0b7@huaweicloud.com>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 22 Jul 2024 17:35:02 -0400
Message-ID: <CAHC9VhSsCuJzJ3ReUTyTXfWqRd+_TfShJBnRugZtX6OrMYJkOQ@mail.gmail.com>
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

On Sat, Jul 20, 2024 at 5:31=E2=80=AFAM Xu Kuohai <xukuohai@huaweicloud.com=
> wrote:
> On 7/19/2024 10:08 AM, Paul Moore wrote:
> > On Jul 11, 2024 Xu Kuohai <xukuohai@huaweicloud.com> wrote:
> >>
> >> To be consistent with most LSM hooks, convert the return value of
> >> hook key_getsecurity to 0 or a negative error code.
> >>
> >> Before:
> >> - Hook key_getsecurity returns length of value on success or a
> >>    negative error code on failure.
> >>
> >> After:
> >> - Hook key_getsecurity returns 0 on success or a negative error
> >>    code on failure. An output parameter @len is introduced to hold
> >>    the length of value on success.
> >>
> >> Signed-off-by: Xu Kuohai <xukuohai@huawei.com>
> >> ---
> >>   include/linux/lsm_hook_defs.h |  3 ++-
> >>   include/linux/security.h      |  6 ++++--
> >>   security/keys/keyctl.c        | 11 ++++++++---
> >>   security/security.c           | 26 +++++++++++++++++++++-----
> >>   security/selinux/hooks.c      | 11 +++++------
> >>   security/smack/smack_lsm.c    | 21 +++++++++++----------
> >>   6 files changed, 51 insertions(+), 27 deletions(-)

...

> >> diff --git a/security/security.c b/security/security.c
> >> index 9dd2ae6cf763..2c161101074d 100644
> >> --- a/security/security.c
> >> +++ b/security/security.c
> >> @@ -5338,19 +5338,35 @@ int security_key_permission(key_ref_t key_ref,=
 const struct cred *cred,
> >>    * security_key_getsecurity() - Get the key's security label
> >>    * @key: key
> >>    * @buffer: security label buffer
> >> + * @len: the length of @buffer (including terminating NULL) on succes=
s
> >>    *
> >>    * Get a textual representation of the security context attached to =
a key for
> >>    * the purposes of honouring KEYCTL_GETSECURITY.  This function allo=
cates the
> >>    * storage for the NUL-terminated string and the caller should free =
it.
> >>    *
> >> - * Return: Returns the length of @buffer (including terminating NUL) =
or -ve if
> >> - *         an error occurs.  May also return 0 (and a NULL buffer poi=
nter) if
> >> - *         there is no security label assigned to the key.
> >> + * Return: Returns 0 on success or -ve if an error occurs. May also r=
eturn 0
> >> + *         (and a NULL buffer pointer) if there is no security label =
assigned
> >> + *         to the key.
> >>    */
> >> -int security_key_getsecurity(struct key *key, char **buffer)
> >> +int security_key_getsecurity(struct key *key, char **buffer, size_t *=
len)
> >>   {
> >> +    int rc;
> >> +    size_t n =3D 0;
> >> +    struct security_hook_list *hp;
> >> +
> >>      *buffer =3D NULL;
> >> -    return call_int_hook(key_getsecurity, key, buffer);
> >> +
> >> +    hlist_for_each_entry(hp, &security_hook_heads.key_getsecurity, li=
st) {
> >> +            rc =3D hp->hook.key_getsecurity(key, buffer, &n);
> >> +            if (rc < 0)
> >> +                    return rc;
> >> +            if (n)
> >> +                    break;
> >> +    }
> >> +
> >> +    *len =3D n;
> >> +
> >> +    return 0;
> >>   }
> >
> > Help me understand why we can't continue to use the call_int_hook()
> > macro here?
> >
>
> Before this patch, the hook may return +ve, 0, or -ve, and call_int_hook
> breaks the loop when the hook return value is not 0.
>
> After this patch, the +ve is stored in @n, so @n and return value should
> both be checked to determine whether to break the loop. This is not
> feasible with call_int_hook.

Yes, gotcha.  I was focused on the error condition and wasn't thinking
about the length getting zero'd out by a trailing callback.
Unfortunately, we *really* want to stick with the
call_{int,void}_hook() macros so I think we either need to find a way
to work within that constraint for existing macro callers, or we have
to leave this hook as-is for the moment.

--=20
paul-moore.com

