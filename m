Return-Path: <selinux+bounces-2825-lists+selinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2C14A23F1F
	for <lists+selinux@lfdr.de>; Fri, 31 Jan 2025 15:28:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7F8BE3A83AB
	for <lists+selinux@lfdr.de>; Fri, 31 Jan 2025 14:28:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B01B1CEAA3;
	Fri, 31 Jan 2025 14:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="Fhe8rSrY"
X-Original-To: selinux@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA467137742
	for <selinux@vger.kernel.org>; Fri, 31 Jan 2025 14:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738333726; cv=none; b=fIXId2BRGu5Nrin4LgGyupUGn6M4BoIvc1TQ7FFb/iyhjpGv0TpAzT/U1XPbgGqKjC31liYuULVtl8jzO1nDDY9eaSmDgm8v497P/KTiplAWmQCqFchVb17/LVR9SOy4aTY1PhL7Ic9hdpSqa7KtBOQXurmmCRt5nHA15HJ2/ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738333726; c=relaxed/simple;
	bh=Pw9kfX1ALZ4Z6q840pNpo1qxqLjeDBB2w5LiUnpx6E0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mlFhyTn6Qp5eeX3iNS8vsyLVP+lg5ERlNmfH7UNDugm8lIj8ZqlW9AhBBoAySec7G82woGKTUBegfuXjCUU+OUCVSt9RyuhTNKBg+UFAiJ/1NDNSufGIER0SDwcBIqvl2zcuL5TALJFHRjQuJeaELn7M7BR25CGDd+7FcMb//S0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=Fhe8rSrY; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-6f666c94285so8946617b3.3
        for <selinux@vger.kernel.org>; Fri, 31 Jan 2025 06:28:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1738333723; x=1738938523; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UFCjc+o79kMnlpLWAd51xeD9IIpgd4t1EriZRLT/AIs=;
        b=Fhe8rSrYYx5Z87nrVMMN/Sb0mbV09W+L/ISCb6868Jv8cwtBKNo2WB2lWHR47BB4VR
         hMIvRyTmDr7/MdNtxYKv6n8IDQqls3miWROMgNnMpKF0YMxwS1p+d+tKYnZ/NThmyKLV
         UxO+yjgYxI9ygqlpvNoGnwdMDMIRI4o21tWc1RfC5DmNLXX0me/GvV8wzvj0gLMWLGhY
         P/SO1PUtYVcGA4O7f+2N3uugcEfJCPqFpVhDozOBs/RgKz9lO9ZeXSjzVBG2o/hLHgX5
         ycls95MokP38bMqVoBZql26GI4huXKvo/FZTuwa2ignReOrV4EXFy+7yNCSs7ao4nRV7
         hDkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738333723; x=1738938523;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UFCjc+o79kMnlpLWAd51xeD9IIpgd4t1EriZRLT/AIs=;
        b=kTy8n8It8DYNxbNpRmp+EFhDSasvY9EDcJcc0lIatBGUC0OqqZaiIO4U5QdqTbzjHj
         22MUsLHRycYYp4iAzyPs8OkNR0Us4vRoI6qaCMEzgFMpVCayNkFKgTUMX/V5h7ftf6Yc
         hF31m77v3mLI6jQFuhr75PDTLHqwq3TImdE6IMc6lT4Hlj8YZmknguAJJVNEha/AeFr8
         B/WhQFlMWopPwuBOjvNdN+HzWMP5grnU0vndYzzJgBiVyiHN9uIPD5nMTVzFEQKfAjCo
         hALOo3ktXWPecgIr0Vd0wQ3P6KW4qeGFVjqbxSnsb49t01p4mhEIUKeY1TeYGiY6WNti
         CQ2w==
X-Forwarded-Encrypted: i=1; AJvYcCXNUyOOVcRigCUEd0H/3stHxeNkgYgOBc7vilAru3mJtDbBDY3RBfsz+b27EVGgwsOjyuoppySF@vger.kernel.org
X-Gm-Message-State: AOJu0Yzu2wTRxHkfEGX7MrxcbYOSw9vXKhZwDCQy3ATk0hggE79WcS8h
	AEQoHxhUd4olii6Egx7hklG//X7nTQUHxiBPsAtWYxQpjoB7/0EiGJNNH+fr4UNBSHLXTXZpwLd
	pq5rvmTuiGQ9gWilTctuivY6c56FIazaVSTsX
X-Gm-Gg: ASbGncv2YWjy0QSVVKtg26l9rA4fkrAxtsC/GC5uWMZ7/5kubdqgPxa9ysGHYlWp1Ub
	gz+1CQKGTCAw2wG3pUWJD2B7I8qyDxTAJExDn8bgVjoZN8intkE08azxlcdNUs4hhXdunss4=
X-Google-Smtp-Source: AGHT+IEPwxIej2jAoXcefzcT3Y8Ye6CuvFzmDyvzy+6zGg4KISq+CRzp/0PSHuOeR3jYzVu9ZiMAJtgVv/Ljv0M9e/o=
X-Received: by 2002:a05:690c:48c3:b0:6ee:694f:fea3 with SMTP id
 00721157ae682-6f7a834f496mr89021787b3.14.1738333721869; Fri, 31 Jan 2025
 06:28:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: selinux@vger.kernel.org
List-Id: <selinux.vger.kernel.org>
List-Subscribe: <mailto:selinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:selinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250129165803.72138-1-mszeredi@redhat.com> <20250129165803.72138-3-mszeredi@redhat.com>
 <CAHC9VhTOmCjCSE2H0zwPOmpFopheexVb6jyovz92ZtpKtoVv6A@mail.gmail.com> <CAJfpegu3N9T4cTQ5z+a_nsTpK1KFNDL-NduhMp15stB3O31=+Q@mail.gmail.com>
In-Reply-To: <CAJfpegu3N9T4cTQ5z+a_nsTpK1KFNDL-NduhMp15stB3O31=+Q@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 31 Jan 2025 09:28:31 -0500
X-Gm-Features: AWEUYZkt82_iCSM-fSiDJM-RM3ZJIN0lwcID8h73UJEIWkmSScpJB9MUzM_QtCg
Message-ID: <CAHC9VhR+zEms9XQk1HWNWG9cF9606g5KP83pbRQa4XesyORaBA@mail.gmail.com>
Subject: Re: [PATCH v5 2/3] fanotify: notify on mount attach and detach
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: Miklos Szeredi <mszeredi@redhat.com>, Christian Brauner <brauner@kernel.org>, 
	linux-fsdevel@vger.kernel.org, Jan Kara <jack@suse.cz>, 
	Amir Goldstein <amir73il@gmail.com>, Karel Zak <kzak@redhat.com>, 
	Lennart Poettering <lennart@poettering.net>, Ian Kent <raven@themaw.net>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, selinux@vger.kernel.org, 
	linux-security-module@vger.kernel.org, selinux-refpolicy@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 31, 2025 at 5:53=E2=80=AFAM Miklos Szeredi <miklos@szeredi.hu> =
wrote:
> On Thu, 30 Jan 2025 at 22:06, Paul Moore <paul@paul-moore.com> wrote:
> > On Wed, Jan 29, 2025 at 11:58=E2=80=AFAM Miklos Szeredi <mszeredi@redha=
t.com> wrote:
> > >
> > > Add notifications for attaching and detaching mounts.  The following =
new
> > > event masks are added:
> > >
> > >   FAN_MNT_ATTACH  - Mount was attached
> > >   FAN_MNT_DETACH  - Mount was detached
> > >
> > > If a mount is moved, then the event is reported with (FAN_MNT_ATTACH =
|
> > > FAN_MNT_DETACH).
> > >
> > > These events add an info record of type FAN_EVENT_INFO_TYPE_MNT conta=
ining
> > > these fields identifying the affected mounts:
> > >
> > >   __u64 mnt_id    - the ID of the mount (see statmount(2))
> > >
> > > FAN_REPORT_MNT must be supplied to fanotify_init() to receive these e=
vents
> > > and no other type of event can be received with this report type.
> > >
> > > Marks are added with FAN_MARK_MNTNS, which records the mount namespac=
e from
> > > an nsfs file (e.g. /proc/self/ns/mnt).
> > >
> > > Signed-off-by: Miklos Szeredi <mszeredi@redhat.com>
> > > ---
> > >  fs/mount.h                         |  2 +
> > >  fs/namespace.c                     | 14 +++--
> > >  fs/notify/fanotify/fanotify.c      | 38 +++++++++++--
> > >  fs/notify/fanotify/fanotify.h      | 18 +++++++
> > >  fs/notify/fanotify/fanotify_user.c | 87 +++++++++++++++++++++++++---=
--
> > >  fs/notify/fdinfo.c                 |  5 ++
> > >  include/linux/fanotify.h           | 12 +++--
> > >  include/uapi/linux/fanotify.h      | 10 ++++
> > >  security/selinux/hooks.c           |  4 ++
> > >  9 files changed, 167 insertions(+), 23 deletions(-)
> >
> > ...
> >
> > > diff --git a/security/selinux/hooks.c b/security/selinux/hooks.c
> > > index 7b867dfec88b..06d073eab53c 100644
> > > --- a/security/selinux/hooks.c
> > > +++ b/security/selinux/hooks.c
> > > @@ -3395,6 +3395,10 @@ static int selinux_path_notify(const struct pa=
th *path, u64 mask,
> > >         case FSNOTIFY_OBJ_TYPE_INODE:
> > >                 perm =3D FILE__WATCH;
> > >                 break;
> > > +       case FSNOTIFY_OBJ_TYPE_MNTNS:
> > > +               /* Maybe introduce FILE__WATCH_MOUNTNS? */
> > > +               perm =3D FILE__WATCH_MOUNT;
> > > +               break;
> > >         default:
> > >                 return -EINVAL;
> > >         }
> >
> > Ignoring for a moment that this patch was merged without an explicit
> > ACK for the SELinux changes, let's talk about these SELinux changes
> > ...
> >
> > I understand that you went with the "simpler version" because you
> > didn't believe the discussion was converging, which is fair, however,
> > I believe Daniel's argument is convincing enough to warrant the new
> > permission.
>
> Fine, I'll work on this.

Great, thanks.

> >  Yes, it has taken me approximately two days to find the
> > time to revisit this topic and reply with some clarity, but personally
> > I feel like that is not an unreasonable period of time, especially for
> > a new feature discussion occurring during the merge window.
>
> Definitely not.
>
> Christian is definitely very responsive and quick to queue things up,
> and that can have drawbacks.   In this he made it clear that he wants
> to get this queued ASAP regardless of whether there's decision on the
> SELinux side or not.

When one merges code that affects another subsystem without an
explicit ACK from the affected subsystem when the maintainer has asked
for others to clear the code change with an ACK, it's hard to see that
as anything but bad behavior at its best and reckless behavior at its
worst.  It is doubly troubling in cases like this where the code
change is user visible.

> What I think might be a good thing if Christian could record
> conditional NAKs such as this one from you, that need to be worked on
> before sending a feature upstream.  That would prevent wrong code
> being sent upstream due to lack of attention.

Christian's merge notification email already has this section:

  "Please report any outstanding bugs that were missed
   during review in a new review to the original patch series
   allowing us to drop it."

... and to be fair, the vfs-6.15.mount branch mentioned in the
notification does appear to be gone.

--=20
paul-moore.com

