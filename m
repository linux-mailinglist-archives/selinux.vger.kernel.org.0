Return-Path: <selinux+bounces-4389-lists+selinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9734DB0FEA8
	for <lists+selinux@lfdr.de>; Thu, 24 Jul 2025 04:10:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 654371C2403F
	for <lists+selinux@lfdr.de>; Thu, 24 Jul 2025 02:10:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4410619F420;
	Thu, 24 Jul 2025 02:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="JTcDKuI/"
X-Original-To: selinux@vger.kernel.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74FC6186E2E
	for <selinux@vger.kernel.org>; Thu, 24 Jul 2025 02:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753323011; cv=none; b=pqvRe2qgnmLjJeXS/WbiWbgR4w3Lu30gZddUSrVcpEKyhU5uu91pH/D9ls5IKn8hsb1EMXE2mKXg6ht3j95+FmqvxMZd2U8/+7W6eDr91hpLz3Cpg95w1HdPHVkSXcXmiTiVfKwz8/gQ/Hhs0DcXJH5nb8WFsEjhBTEr2zbt/iM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753323011; c=relaxed/simple;
	bh=ffvh4rw69doyRsmJ7u3cRO1OWqVlFCUnRhvVhvHpZTk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iYfW2umYm/4B/G86UfVOmMFCwF2Ei3WnGUFeX4B1k4GLZZmmjTb7y6dGUFXsFZkCRekdqIZKRemAf4hVwW5BNhM6xW10iTZx3FPf7w1XgmFEKkNb0ZE4EOOwbPdrms81aGhItj8LO4ZSpzX/LNLJWGGHfz1KNH4qKyTSvR++9Ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=JTcDKuI/; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e8bbb02b887so342774276.3
        for <selinux@vger.kernel.org>; Wed, 23 Jul 2025 19:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1753323008; x=1753927808; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ezOsh3Rw02sTHRTVL0D2zAjlIafvsBxPOvx6XqZve/E=;
        b=JTcDKuI/5CUQCswz04ZlBKuJ9nt1HfEgvhgr0nGsG9qp4BfN+m+hvEEEj2n1KSB5t5
         Hxia7vyFpvdiDnvE2X9hHOj8zKmSDAdrbDLE8CmWjesvRLDha7n4X9vXlfjpu6i1lIf5
         s5YmjwyTrKz7KDqG9G6wjRcjlDiB3ySIBdQCj4Hqgp7gwybEXQ+EFIBWRTkS+JUKxC3Z
         HE3YVrql5NXTPsdBwztgQAj6ZHafhnWx7Y1aZAd8pUBm+jAxolMA9D12Coe2nmSmnqrW
         a/b1qZmN1v9C/VqBmE7cu88zdzjd2+GScqCoLSusEJMLpxas41Qu/5Vr8kdEsDllqlXI
         JsBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753323008; x=1753927808;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ezOsh3Rw02sTHRTVL0D2zAjlIafvsBxPOvx6XqZve/E=;
        b=guKFATokTs25RkOpiSrSzrO78b/vhQsqKzkjV00F1VOjvw/eIjRZN8HZWq5r1Fnflh
         1Jqhj359Wri4KMZAGVX1qkg2vfZJOgMC2bnqXbOU2eOVf3C5yG4WGCEXStTUIcLJfrq4
         d3EWuJYkT7ePls9TAOykzrf+dVA/GxZY0tOp3V0u9o+PFTqOJu36j8XLCZWqazpvX+1a
         UkvPadbAwEozNOKSBQCYjgzEIn0zBcXbmBP+qdXTwUkdEZ9msH7oTzua4zPM8K8S9lvo
         uQ11DqPfo0IlKuEQtliQBqmp1g5oLSNYNnc8i0I/1TCHPm3gh3y6bRWtrqzz9cMZABNL
         t1oA==
X-Forwarded-Encrypted: i=1; AJvYcCWVV1FU31kmV4W8IdJ+EpfTsxnCmlq/N5uIgkKEJBBSLl0WYi9ZrigYJ0yoXKiApZyAt82uHn7V@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0QR+NOzWUlNDTBvzN+mv5LNrMpjtt3JlcEAm2PTqm9grw9tQH
	7dgTtxW2RQarSCYo7PPD6SD1bRhXSKQkdGtgBklaw8GZd5+4TiCDmMc8jmtUJmvDTa2r7/VOgpd
	+pLX2U2A9OcWztA1DVsPC+J7Yqfj9PCpJD+pcq8re
X-Gm-Gg: ASbGncvA06CGAeLk7OLZ/EP/cwjWTe+GUqtk+kLuv9veiicMVDT775MVFO1DO1L1VPm
	hQ6OJpjb+2DF3os1SGrgnNw9kDc+7yH00dgtOB6cakf5FmnV9Gar1YsEdZSJoaN188cuzd977y+
	kRlPuWzTIsxWm4Woihgl74q+heQD1lmejWIOb4NJajpIdeQ0tLdonto6a11uCO8EKJ1mBzsDZda
	ORCod8=
X-Google-Smtp-Source: AGHT+IEjtM0YH/uIkH5EC6RHdxIYSOEo9s7z9JMeuLNs93fJxU9BkwVAtv1fRHAPFv5MIBRtQfg1omYHVhyQIQh0vnM=
X-Received: by 2002:a05:6902:1288:b0:e82:17a1:5c15 with SMTP id
 3f1490d57ef6-e8dc57e75dcmr6464733276.10.1753323006953; Wed, 23 Jul 2025
 19:10:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: selinux@vger.kernel.org
List-Id: <selinux.vger.kernel.org>
List-Subscribe: <mailto:selinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:selinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250428195022.24587-2-stephen.smalley.work@gmail.com>
 <CAHC9VhQfrMe7EY3_bvW6PcLdaW7tPMgv6WZuePxd1RrbhyZv-g@mail.gmail.com>
 <CAHC9VhQyDX+NgWipgm5DGMewfVTBe3DkLbe_AANRiuAj40bA1w@mail.gmail.com>
 <6797b694-6c40-4806-9541-05ce6a0b07fc@oracle.com> <CAHC9VhQsK_XpJ-bbt6AXM4fk30huhrPvvMSEuHHTPb=eJZwoUA@mail.gmail.com>
In-Reply-To: <CAHC9VhQsK_XpJ-bbt6AXM4fk30huhrPvvMSEuHHTPb=eJZwoUA@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 23 Jul 2025 22:09:56 -0400
X-Gm-Features: Ac12FXzwcvMXRcY-HOujXriwLTi0J58g3gNTBeLJ4hgKLEq2xrVmA3w4Jght3uY
Message-ID: <CAHC9VhQnR6TKzzzpE9XQqiFivV0ECbVx7GH+1fQmz917-MAhsw@mail.gmail.com>
Subject: Re: [PATCH v2] security,fs,nfs,net: update security_inode_listsecurity()
 interface
To: Anna Schumaker <anna.schumaker@oracle.com>
Cc: Trond Myklebust <trondmy@kernel.org>, Anna Schumaker <anna@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Casey Schaufler <casey@schaufler-ca.com>, 
	Stephen Smalley <stephen.smalley.work@gmail.com>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>, Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, 
	Willem de Bruijn <willemb@google.com>, "David S. Miller" <davem@davemloft.net>, 
	Simon Horman <horms@kernel.org>, Ondrej Mosnacek <omosnace@redhat.com>, linux-nfs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-security-module@vger.kernel.org, netdev@vger.kernel.org, 
	selinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 19, 2025 at 5:18=E2=80=AFPM Paul Moore <paul@paul-moore.com> wr=
ote:
> On Tue, May 27, 2025 at 5:03=E2=80=AFPM Anna Schumaker
> <anna.schumaker@oracle.com> wrote:
> > On 5/20/25 5:31 PM, Paul Moore wrote:
> > > On Tue, Apr 29, 2025 at 7:34=E2=80=AFPM Paul Moore <paul@paul-moore.c=
om> wrote:
> > >> On Mon, Apr 28, 2025 at 4:15=E2=80=AFPM Stephen Smalley
> > >> <stephen.smalley.work@gmail.com> wrote:
> > >>>
> > >>> Update the security_inode_listsecurity() interface to allow
> > >>> use of the xattr_list_one() helper and update the hook
> > >>> implementations.
> > >>>
> > >>> Link: https://lore.kernel.org/selinux/20250424152822.2719-1-stephen=
.smalley.work@gmail.com/
> > >>>
> > >>> Signed-off-by: Stephen Smalley <stephen.smalley.work@gmail.com>
> > >>> ---
> > >>> This patch is relative to the one linked above, which in theory is =
on
> > >>> vfs.fixes but doesn't appear to have been pushed when I looked.
> > >>>
> > >>>  fs/nfs/nfs4proc.c             | 10 ++++++----
> > >>>  fs/xattr.c                    | 19 +++++++------------
> > >>>  include/linux/lsm_hook_defs.h |  4 ++--
> > >>>  include/linux/security.h      |  5 +++--
> > >>>  net/socket.c                  | 17 +++++++----------
> > >>>  security/security.c           | 16 ++++++++--------
> > >>>  security/selinux/hooks.c      | 10 +++-------
> > >>>  security/smack/smack_lsm.c    | 13 ++++---------
> > >>>  8 files changed, 40 insertions(+), 54 deletions(-)
> > >>
> > >> Thanks Stephen.  Once we get ACKs from the NFS, netdev, and Smack
> > >> folks I can pull this into the LSM tree.
> > >
> > > Gentle ping for Trond, Anna, Jakub, and Casey ... can I get some ACKs
> > > on this patch?  It's a little late for the upcoming merge window, but
> > > I'd like to merge this via the LSM tree after the merge window closes=
.
> >
> > For the NFS change:
> >     Acked-by: Anna Schumaker <anna.schumaker@oracle.com>
>
> Hi Anna,
>
> Thanks for reviewing the patch.  Unfortunately when merging the patch
> today and fixing up some merge conflicts I bumped into an odd case in
> the NFS space and I wanted to check with you on how you would like to
> resolve it.
>
> Commit 243fea134633 ("NFSv4.2: fix listxattr to return selinux
> security label")[1] adds a direct call to
> security_inode_listsecurity() in nfs4_listxattr(), despite the
> existing nfs4_listxattr_nfs4_label() call which calls into the same
> LSM hook, although that call is conditional on the server supporting
> NFS_CAP_SECURITY_LABEL.  Based on a quick search, it appears the only
> caller for nfs4_listxattr_nfs4_label() is nfs4_listxattr() so I'm
> wondering if there isn't some room for improvement here.
>
> I think there are two obvious options, and I'm curious about your
> thoughts on which of these you would prefer, or if there is another
> third option that you would like to see merged.
>
> Option #1:
> Essentially back out commit 243fea134633, removing the direct LSM call
> in nfs4_listxattr() and relying on the nfs4_listxattr_nfs4_label() for
> the LSM/SELinux xattrs.  I think we would want to remove the
> NFS_CAP_SECURITY_LABEL check and build nfs4_listxattr_nfs4_label()
> regardless of CONFIG_NFS_V4_SECURITY_LABEL.
>
> Option #2:
> Remove nfs4_listxattr_nfs4_label() entirely and keep the direct LSM
> call in nfs4_listxattr(), with the required changes for this patch.
>
> Thoughts?
>
> [1] https://lore.kernel.org/all/20250425180921.86702-1-okorniev@redhat.co=
m/

A gentle ping on the question above for the NFS folks.  If I don't
hear anything I'll hack up something and send it out for review, but I
thought it would nice if we could sort out the proper fix first.

--=20
paul-moore.com

