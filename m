Return-Path: <selinux+bounces-1230-lists+selinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D7F904728
	for <lists+selinux@lfdr.de>; Wed, 12 Jun 2024 00:39:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 655421C22686
	for <lists+selinux@lfdr.de>; Tue, 11 Jun 2024 22:39:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E8251553B3;
	Tue, 11 Jun 2024 22:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="dM+ClF+P"
X-Original-To: selinux@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDEC11553B4
	for <selinux@vger.kernel.org>; Tue, 11 Jun 2024 22:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718145527; cv=none; b=AZbya3wUqu0glnIC1Ro1L7lyTpg4zpSWredovOnF2N/TWxZdscnCF+qkSDESVBh7UF/way65s7e9VUvgh8e16qSqKf8HjHgICsSgxy613pk3PS/o/UBictgGGWcWG6xunP6vzjf79V9TGavC3lkSBui3N8QkrWpuKFbzvCXVeOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718145527; c=relaxed/simple;
	bh=9Njb1QFUfo0wbmyt1RFmIM5BrHWuvMLeu82oSPr0buU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JPhN0Hh8lE+v5mX+3Djt1/A5gKXSGtKiJhNOUvdqd92IaTyhTuM2Px7rTufb9RbcEA36yU73902GOiQaYezMbPZ1MiGxf57QzcbRum/Fu8eL2FfAklVqBguBulGeh/VJK4/McaZT7qiYj/WwCv88I8W4XNuQuShdywKMB0C/wSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=dM+ClF+P; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-62f518bbab1so6867707b3.2
        for <selinux@vger.kernel.org>; Tue, 11 Jun 2024 15:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1718145523; x=1718750323; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=plZlLULbEPZ4CPINB2iX4W5eyj0ufYBE504Q1QyZ288=;
        b=dM+ClF+PxazyNTapsEd1uyA6O2r4SlarCGevqA1wr135PJ6jjT3C63n/dAoXlKKNni
         k/EykW2WxSKnglGup8fJJWYSyhRHq+5JM+aOuExMTaI4OyzeKaISp+u/bDdiryl11EgA
         178Z37EAx0TE5nO/YjK8v09GgzL8pBjJ3hhpYg9NaXxPSfS/5gNjQSb4BXA4jZGZrmK0
         7OXVOtu1yhmxs8CTNioxG07GMVuvY9uk6TZD2sbJq1YhVcx2t0uzLynhsfRxMTYoOMCC
         s8LStSl+pn9ydn2EcPRl6H3zCzJ+1FZHjUfPaDDLumwje/Usw3WghuBUKJmmiSvr9cu4
         6sdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718145523; x=1718750323;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=plZlLULbEPZ4CPINB2iX4W5eyj0ufYBE504Q1QyZ288=;
        b=Mt2vY3E9YVF9k7B1PD4VI4k2Mc9PW8/DeCISB6DXyi5zDzufkGBxJRo1n1MRyHSalH
         985wZJIcOQZXC+rFmQT1LQf51mmq7UwscbVmz9WJBhKzzjlLxnpIHGlL2hTDeWfElgDL
         e/zTU3+lKJkrt6ovfe7wIAS1HCJUj50TLN2EU2BMD3YsRCnByWJ4DIJ6fC5bxSLov7je
         ByVSIj6VL2bMmXWI71+BmSArmqNx95KmFejJ/Xl1CEkc4H7pdx0zKn5SZ+e53uzCyxCx
         Bhp9O5/o83KqKCc2pQeCv4x26IlE76FRF+wrflS0ImabDMcfzV29pf6xLKsvvdCN33CR
         Rlkw==
X-Forwarded-Encrypted: i=1; AJvYcCVTu7jXHwZIq1IUCJdAfBbRbbnO41+mnbbiEU7kvbaRdks1By448fKRlWHzCF05sOP/oEgYPSruQeRxeR864RDiocQZbvNkxg==
X-Gm-Message-State: AOJu0YxdVS0UGW7C5cfDrkqpaMzGdfXug60pne/4LEetMFDZyRAYT+oY
	SccrlJrXj1uhKg6TvAw1PxRYxOUV6FcoiciPz5TFMCX2DWH4RDO0TKvdrVizOAw0HeYHtzogNhk
	AgzPVhQEjfT1vTq8ZPoCPi+UztyRaqKLfGUQw
X-Google-Smtp-Source: AGHT+IGifaChWdPoqDKcu/zG1sPFHu3t29KGAok0VPBFpp8xy1nbzv00PRW17G/CBEF/tR53qSOD+uWyF14JleQj9nU=
X-Received: by 2002:a81:7283:0:b0:62f:518b:ba53 with SMTP id
 00721157ae682-62fba943427mr1376147b3.49.1718145522756; Tue, 11 Jun 2024
 15:38:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: selinux@vger.kernel.org
List-Id: <selinux.vger.kernel.org>
List-Subscribe: <mailto:selinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:selinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240609104355.442002-1-jcalmels@3xx0.net> <20240609104355.442002-5-jcalmels@3xx0.net>
 <CAHC9VhT5XWbhoY2Nw5jQz4GxpDriUdHw=1YsQ4xLVUtSnFxciA@mail.gmail.com>
 <z2bgjrzeq7crqx24chdbxnaanuhczbjnq6da3xw6al6omjj5xz@mqbzzzfva5sw>
 <887a3658-2d8d-4f9e-98f2-27124bb6f8e6@canonical.com> <CAHC9VhQFNPJTOct5rUv3HT6Z2S20mYdW75seiG8no5=fZd7JjA@mail.gmail.com>
 <uuvwcdsy7o4ulmrdzwffr6uywfacmlkjrontmjdj44luantpok@dtatxaa6tzyv>
In-Reply-To: <uuvwcdsy7o4ulmrdzwffr6uywfacmlkjrontmjdj44luantpok@dtatxaa6tzyv>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 11 Jun 2024 18:38:31 -0400
Message-ID: <CAHC9VhRnthf8+KgfuzFHXWEAc9RShDO0G_g0kc1OJ-UTih1ywg@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] bpf,lsm: Allow editing capabilities in BPF-LSM hooks
To: Jonathan Calmels <jcalmels@3xx0.net>
Cc: John Johansen <john.johansen@canonical.com>, brauner@kernel.org, ebiederm@xmission.com, 
	Jonathan Corbet <corbet@lwn.net>, James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, 
	KP Singh <kpsingh@kernel.org>, Matt Bobrowski <mattbobrowski@google.com>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, 
	Luis Chamberlain <mcgrof@kernel.org>, Kees Cook <kees@kernel.org>, 
	Joel Granados <j.granados@samsung.com>, David Howells <dhowells@redhat.com>, 
	Jarkko Sakkinen <jarkko@kernel.org>, Stephen Smalley <stephen.smalley.work@gmail.com>, 
	Ondrej Mosnacek <omosnace@redhat.com>, Mykola Lysenko <mykolal@fb.com>, Shuah Khan <shuah@kernel.org>, 
	containers@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-security-module@vger.kernel.org, bpf@vger.kernel.org, 
	apparmor@lists.ubuntu.com, keyrings@vger.kernel.org, selinux@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 11, 2024 at 6:15=E2=80=AFPM Jonathan Calmels <jcalmels@3xx0.net=
> wrote:
> On Tue, Jun 11, 2024 at 03:01:01PM GMT, Paul Moore wrote:
> > On Tue, Jun 11, 2024 at 6:32=E2=80=AFAM John Johansen
> > <john.johansen@canonical.com> wrote:
> > >
> > > On 6/11/24 01:09, Jonathan Calmels wrote:
> > > > On Sun, Jun 09, 2024 at 08:18:48PM GMT, Paul Moore wrote:
> > > >> On Sun, Jun 9, 2024 at 6:40=E2=80=AFAM Jonathan Calmels <jcalmels@=
3xx0.net> wrote:
> > > >>>
> > > >>> This patch allows modifying the various capabilities of the struc=
t cred
> > > >>> in BPF-LSM hooks. More specifically, the userns_create hook calle=
d
> > > >>> prior to creating a new user namespace.
> > > >>>
> > > >>> With the introduction of userns capabilities, this effectively pr=
ovides
> > > >>> a simple way for LSMs to control the capabilities granted to a us=
er
> > > >>> namespace and all its descendants.
> > > >>>
> > > >>> Update the selftests accordingly by dropping CAP_SYS_ADMIN in
> > > >>> namespaces and checking the resulting task's bounding set.
> > > >>>
> > > >>> Signed-off-by: Jonathan Calmels <jcalmels@3xx0.net>
> > > >>> ---
> > > >>>   include/linux/lsm_hook_defs.h                 |  2 +-
> > > >>>   include/linux/security.h                      |  4 +-
> > > >>>   kernel/bpf/bpf_lsm.c                          | 55 ++++++++++++=
+++++++
> > > >>>   security/apparmor/lsm.c                       |  2 +-
> > > >>>   security/security.c                           |  6 +-
> > > >>>   security/selinux/hooks.c                      |  2 +-
> > > >>>   .../selftests/bpf/prog_tests/deny_namespace.c | 12 ++--
> > > >>>   .../selftests/bpf/progs/test_deny_namespace.c |  7 ++-
> > > >>>   8 files changed, 76 insertions(+), 14 deletions(-)
> > > >>
> > > >> I'm not sure we want to go down the path of a LSM modifying the PO=
SIX
> > > >> capabilities of a task, other than the capabilities/commoncap LSM.=
  It
> > > >> sets a bad precedent and could further complicate issues around LS=
M
> > > >> ordering.
> > > >
> > > > Well unless I'm misunderstanding, this does allow modifying the
> > > > capabilities/commoncap LSM through BTF. The reason for allowing
> > > > `userns_create` to be modified is that it is functionally very simi=
lar
> > > > to `cred_prepare` in that it operates with new creds (but specific =
to
> > > > user namespaces because of reasons detailed in [1]).
> > >
> > > yes
> > >
> > > > There were some concerns in previous threads that the userns caps b=
y
> > > > themselves wouldn't be granular enough, hence the LSM integration.
> > >
> > > > Ubuntu for example, currently has to resort to a hardcoded profile
> > > > transition to achieve this [2].
> > > >
> > >
> > > The hard coded profile transition, is because the more generic soluti=
on
> > > as part of policy just wasn't ready. The hard coding will go away bef=
ore
> > > it is upstreamed.
> > >
> > > But yes, updating the cred really is necessary for the flexibility ne=
eded
> > > whether it is modifying the POSIX capabilities of the task or the LSM
> > > modifying its own security blob.
> > >
> > > I do share some of Paul's concerns about the LSM modifying the POSIX
> > > capabilities of the task, but also thing the LSM here needs to be
> > > able to modify its own blob.
> >
> > To be clear, this isn't about a generic LSM needing to update its own
> > blob (LSM state), it is about the BPF LSM updating the capability
> > sets.  While we obviously must support a LSM updating its own state,
> > I'm currently of the opinion that allowing one LSM to update the state
> > of another LSM is only going to lead to problems.  We wouldn't want to
> > allow Smack to update AppArmor state, and from my current perspective
> > allowing the BPF LSM to update the capability state is no different.
> >
> > It's also important to keep in mind that if we allow one LSM to do
> > something, we need to allow all LSMs to do something.  If we allow
> > multiple LSMs to manipulate the capability sets, how do we reconcile
> > differences in the desired capability state?  Does that resolution
> > change depending on what LSMs are enabled at build time?  Enabled at
> > boot?  Similarly, what about custom LSM ordering?
> >
> > What about those LSMs that use a task's capabilities as an input to an
> > access control decision?  If those LSMs allow an access based on a
> > given capability set only to have a LSM later in the ordering modify
> > that capability set to something which would have resulted in an
> > access denial, do we risk a security regression?
>
> I understand the concerns, what I fail to understand however, is how is
> it any different from say the `cred_prepare` hook today?

The existing cred_prepare hooks only operate on their own small
portion of the cred::security blob.  What you are proposing would be
the BPF LSM operating on the capability sets that it does not "own"
(they belong to the capability LSM).

If you see that as a minor difference, please understand that if you
skip past that you have all the issues I mentioned in my previous
message to deal with.

> > Our current approach to handling multiple LSMs is that each LSM is
> > limited to modifying its own state, and I'm pretty confident that we
> > stick to this model if we have any hope of preserving the sanity of
> > the LSM layer as a whole.  If you want to modify the capability set
> > you need to do so within the confines of the capability LSM and/or
> > modify the other related kernel subsystems (which I'm guessing will
> > likely necessitate a change in the LSMs, but that avenue is very
> > unclear if such an option even exists).
>
> What do you mean by "within the confines of the capability LSM" here?

Basically security/commoncap.c.  One could make a lot of arguments
about if it is, or isn't, a LSM, but commoncap.c registers LSM hooks
which is pretty much the definition of a LSM from an implementation
point of view.

> Arguably, if we do want fine-grained userns policies, we need LSMs to
> influence the userns capset at some point.

One could always use, or develop, a LSM that offers additional
controls around exercising capabilities.  There are currently four
in-tree LSMs, including the capabilities LSM, which supply a
security_capable() hook that is used by the capability-based access
controls in the kernel; all of these hook implementations work
together within the LSM framework and provide an additional level of
control/granularity beyond the existing capabilities.

--=20
paul-moore.com

