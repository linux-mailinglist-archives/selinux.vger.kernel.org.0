Return-Path: <selinux+bounces-3777-lists+selinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C90E6ABF0EC
	for <lists+selinux@lfdr.de>; Wed, 21 May 2025 12:07:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 35351188FD65
	for <lists+selinux@lfdr.de>; Wed, 21 May 2025 10:07:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 051A725C81A;
	Wed, 21 May 2025 10:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Zh482XLI"
X-Original-To: selinux@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99C3425B1FC
	for <selinux@vger.kernel.org>; Wed, 21 May 2025 10:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747822013; cv=none; b=Kl1xnWlcwlDK166/5HFseGC/tWDf5DPccd4JDGancm8ycVdEmMvuLMdbEYyRplrI87Yfe66Xe6xE3+e3deW4aJgek8McqBYRQ97qiHKbAsvnuUaxGj+b0Y9mUV5ebsK2P53ofwAhzQmEccOGMHi5yH8qZrkQuoomN6/xZoDidcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747822013; c=relaxed/simple;
	bh=gIiCV2qHZsYrLp4F4GGrR+qzRaTbL4nJhegKhHZOL9U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SxwTzIydSgen0VkDmQo0IgosTPEwlkbgxaJjY71B3CMg8RKPZsl2CAseTR2tsFbgEjW3xcW6LcC1edng91mtIyY+o71SsUfWRv8h410fxujsDcsRDGQ/6F6/WhJTb0GAw2GelG7MclXBy9YQlHktKttm5pUX6s+ukckSaLUPjbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Zh482XLI; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747822008;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V4vig+UBkOHWEC7q6eYysZp9vtHyxiu6x3tPs7w6Jt8=;
	b=Zh482XLIs2e1dIS2R38EkmGH0LaRYShxrhF8Sl3H+KYvdGe1RSkPoerRExiU+oXD8XvJPX
	PjFUi+JXJ8bcQFiz2YIWSVps9bDnNrsNj/CMaH3f584kjiSbjS7ar9AaQZO9lCiv+WHvvt
	Bzdf4lzIhCS9I8AIR/5b9XIJY2McIrQ=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-503-O4ZTrQPLODCEFk_atmKjQg-1; Wed, 21 May 2025 06:06:47 -0400
X-MC-Unique: O4ZTrQPLODCEFk_atmKjQg-1
X-Mimecast-MFC-AGG-ID: O4ZTrQPLODCEFk_atmKjQg_1747822006
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-acf0113e311so581835166b.1
        for <selinux@vger.kernel.org>; Wed, 21 May 2025 03:06:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747822006; x=1748426806;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V4vig+UBkOHWEC7q6eYysZp9vtHyxiu6x3tPs7w6Jt8=;
        b=jE7XO7hEMt8cPhKbCLIrcXnR9DfBnnyQTE03M4XOj4TAey/ej3SdYLECPrfnIn3vdR
         1VeC5v7/xJ1jq2zcsGZAYc506VAuE7RoID0yyDsaBoAHJVeOlWdjgIMgqKlp7UctZpq7
         c1Eh3tBRo6Zi4Hy6tR98cgp9EsaKoaTlLOPWCyQCABywhtzEKw4Z9+QJKaYL8OZKcWz8
         OwdNUbtVsX8pgmn7i3aNGHR73ae1Fb9RlXVPCH7lVucU6LdT9f3BRQrahGr6joWr5+xN
         R7/6JaQefK6S/P8QxPMgJRPdgvQdH0Coumhl8M1qdNqq2eE+lBHpEQtT2ka6sIUrmCXV
         L5RQ==
X-Forwarded-Encrypted: i=1; AJvYcCUEu5bTaWoTVsxWegYBci/bE+plm+4GzKYaQHAfdKzFR5xxtxO+0pfkz3RNd4xoRVhAMkxHYH+2@vger.kernel.org
X-Gm-Message-State: AOJu0Yxqg240OMN2xKG4s3FyJCFuhL4YiyMfOLjlaCJSYBIzyaSiX3yT
	+84GPpXG8ysoBoNfmyPjCTIx2PewmPJ0uXY3kQwYxUB1Y/bdsWKzkvL5lM/HMhsjmcZa/RKqQkE
	aRV6qMfOU81Aa+RpnaDkWtq9CZU8jTug0dFHNLPBevooeD9AdQAJIvaDqDQ==
X-Gm-Gg: ASbGnctQpsnTir3LRzq7S8LT4/4IfhVPdhXEUVhEtfb0OMiOteZP7rAoXAUTcqnXRmF
	XobiAN6uQ93SzRUfynf+KJ5emTIYXiUhzVOMNyv/XgkrDzS/oSjMIlW27N7iPPSHeioeTjVpDuA
	QrNevT0K5bINa6nSTlP1OTq+ESkWDTr5LAdw+mjYTy6ry9JqQNmakWEjsfC59cmoBagUJ1tgNjD
	GhCAnuOMWuimlanrcUoVY4wx+seBMmeIhSWnlI8p/7qrDVHNohrha5fzkmgBTtkfdmocLqFyCJm
	dYz8AdFg7tC7uFfA0oPxWlU=
X-Received: by 2002:a17:907:7f20:b0:ad2:1f65:8569 with SMTP id a640c23a62f3a-ad52d4cac82mr1768736066b.28.1747822005805;
        Wed, 21 May 2025 03:06:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHrDhSRrFDtKo/q2kMry7jRxoxTndGDEB75ZiBniuUCDsbNGVDoC1oaveLmJXZWQWEiNaVF6A==
X-Received: by 2002:a17:907:7f20:b0:ad2:1f65:8569 with SMTP id a640c23a62f3a-ad52d4cac82mr1768728666b.28.1747822005178;
        Wed, 21 May 2025 03:06:45 -0700 (PDT)
Received: from thinky ([2a0e:fd87:a051:1:d224:1f1f:6cfc:763a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d278adcsm868243066b.84.2025.05.21.03.06.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 03:06:44 -0700 (PDT)
Date: Wed, 21 May 2025 12:06:32 +0200
From: Andrey Albershteyn <aalbersh@redhat.com>
To: Amir Goldstein <amir73il@gmail.com>, pali@kernel.org
Cc: Dave Chinner <david@fromorbit.com>, 
	Christian Brauner <brauner@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Richard Henderson <richard.henderson@linaro.org>, Matt Turner <mattst88@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, "David S . Miller" <davem@davemloft.net>, 
	Andreas Larsson <andreas@gaisler.com>, Andy Lutomirski <luto@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
	=?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, =?utf-8?Q?G=C3=BCnther?= Noack <gnoack@google.com>, 
	Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>, Paul Moore <paul@paul-moore.com>, 
	James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, 
	Stephen Smalley <stephen.smalley.work@gmail.com>, Ondrej Mosnacek <omosnace@redhat.com>, 
	Tyler Hicks <code@tyhicks.com>, Miklos Szeredi <miklos@szeredi.hu>, linux-alpha@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-api@vger.kernel.org, 
	Linux-Arch <linux-arch@vger.kernel.org>, selinux@vger.kernel.org, ecryptfs@vger.kernel.org, 
	linux-unionfs@vger.kernel.org, linux-xfs@vger.kernel.org, 
	Andrey Albershteyn <aalbersh@kernel.org>
Subject: Re: [PATCH v5 0/7] fs: introduce file_getattr and file_setattr
 syscalls
Message-ID: <mw2d36mqwzqoveguw5vlggrnw2wirsbhdxkox33z3fg7k6huz6@hj4ntgg3oj7p>
References: <20250513-xattrat-syscall-v5-0-22bb9c6c767f@kernel.org>
 <399fdabb-74d3-4dd6-9eee-7884a986dab1@app.fastmail.com>
 <20250515-bedarf-absagen-464773be3e72@brauner>
 <CAOQ4uxicuEkOas2UR4mqfus9Q2RAeKKYTwbE2XrkcE_zp8oScQ@mail.gmail.com>
 <aCsX4LTpAnGfFjHg@dread.disaster.area>
 <sfmrojifgnrpeilqxtixyqrdjj5uvvpbvirxmlju5yce7z72vi@ondnx7qbie4y>
 <CAOQ4uxiM+BBNODHfxu=v3XN2ezA-0k54qC5R4qdELbZW+W-xkg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: selinux@vger.kernel.org
List-Id: <selinux.vger.kernel.org>
List-Subscribe: <mailto:selinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:selinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOQ4uxiM+BBNODHfxu=v3XN2ezA-0k54qC5R4qdELbZW+W-xkg@mail.gmail.com>

On 2025-05-21 11:36:31, Amir Goldstein wrote:
> On Wed, May 21, 2025 at 10:48 AM Andrey Albershteyn <aalbersh@redhat.com> wrote:
> >
> > On 2025-05-19 21:37:04, Dave Chinner wrote:
> > > On Thu, May 15, 2025 at 12:33:31PM +0200, Amir Goldstein wrote:
> > > > On Thu, May 15, 2025 at 11:02 AM Christian Brauner <brauner@kernel.org> wrote:
> > > > >
> > > > > On Tue, May 13, 2025 at 11:53:23AM +0200, Arnd Bergmann wrote:
> > > > > > On Tue, May 13, 2025, at 11:17, Andrey Albershteyn wrote:
> > > > > >
> > > > > > >
> > > > > > >     long syscall(SYS_file_getattr, int dirfd, const char *pathname,
> > > > > > >             struct fsxattr *fsx, size_t size, unsigned int at_flags);
> > > > > > >     long syscall(SYS_file_setattr, int dirfd, const char *pathname,
> > > > > > >             struct fsxattr *fsx, size_t size, unsigned int at_flags);
> > > > > >
> > > > > > I don't think we can have both the "struct fsxattr" from the uapi
> > > > > > headers, and a variable size as an additional argument. I would
> > > > > > still prefer not having the extensible structure at all and just
> > > > >
> > > > > We're not going to add new interfaces that are fixed size unless for the
> > > > > very basic cases. I don't care if we're doing that somewhere else in the
> > > > > kernel but we're not doing that for vfs apis.
> > > > >
> > > > > > use fsxattr, but if you want to make it extensible in this way,
> > > > > > it should use a different structure (name). Otherwise adding
> > > > > > fields after fsx_pad[] would break the ioctl interface.
> > > > >
> > > > > Would that really be a problem? Just along the syscall simply add
> > > > > something like:
> > > > >
> > > > > diff --git a/fs/ioctl.c b/fs/ioctl.c
> > > > > index c91fd2b46a77..d3943805c4be 100644
> > > > > --- a/fs/ioctl.c
> > > > > +++ b/fs/ioctl.c
> > > > > @@ -868,12 +868,6 @@ static int do_vfs_ioctl(struct file *filp, unsigned int fd,
> > > > >         case FS_IOC_SETFLAGS:
> > > > >                 return ioctl_setflags(filp, argp);
> > > > >
> > > > > -       case FS_IOC_FSGETXATTR:
> > > > > -               return ioctl_fsgetxattr(filp, argp);
> > > > > -
> > > > > -       case FS_IOC_FSSETXATTR:
> > > > > -               return ioctl_fssetxattr(filp, argp);
> > > > > -
> > > > >         case FS_IOC_GETFSUUID:
> > > > >                 return ioctl_getfsuuid(filp, argp);
> > > > >
> > > > > @@ -886,6 +880,20 @@ static int do_vfs_ioctl(struct file *filp, unsigned int fd,
> > > > >                 break;
> > > > >         }
> > > > >
> > > > > +       switch (_IOC_NR(cmd)) {
> > > > > +       case _IOC_NR(FS_IOC_FSGETXATTR):
> > > > > +               if (WARN_ON_ONCE(_IOC_TYPE(cmd) != _IOC_TYPE(FS_IOC_FSGETXATTR)))
> > > > > +                       return SOMETHING_SOMETHING;
> > > > > +               /* Only handle original size. */
> > > > > +               return ioctl_fsgetxattr(filp, argp);
> > > > > +
> > > > > +       case _IOC_NR(FFS_IOC_FSSETXATTR):
> > > > > +               if (WARN_ON_ONCE(_IOC_TYPE(cmd) != _IOC_TYPE(FFS_IOC_FSSETXATTR)))
> > > > > +                       return SOMETHING_SOMETHING;
> > > > > +               /* Only handle original size. */
> > > > > +               return ioctl_fssetxattr(filp, argp);
> > > > > +       }
> > > > > +
> > > >
> > > > I think what Arnd means is that we will not be able to change struct
> > > > sfxattr in uapi
> > > > going forward, because we are not going to deprecate the ioctls and
> > >
> > > There's no need to deprecate anything to rev an ioctl API.  We have
> > > had to solve this "changing struct size" problem previously in XFS
> > > ioctls. See XFS_IOC_FSGEOMETRY and the older XFS_IOC_FSGEOMETRY_V4
> > > and XFS_IOC_FSGEOMETRY_V1 versions of the API/ABI.
> > >
> > > If we need to increase the structure size, we can rename the existing
> > > ioctl and struct to fix the version in the API, then use the
> > > original name for the new ioctl and structure definition.
> > >
> > > The only thing we have to make sure of is that the old and new
> > > structures have exactly the same overlapping structure. i.e.
> > > extension must always be done by appending new varibles, they can't
> > > be put in the middle of the structure.
> > >
> > > This way applications being rebuild will pick up the new definition
> > > automatically when the system asserts that it is suppored, whilst
> > > existing binaries will always still be supported by the kernel.
> > >
> > > If the application wants/needs to support all possible kernels, then
> > > if XFS_IOC_FSGEOMETRY is not supported, call XFS_IOC_FSGEOMETRY_V4,
> > > and if that fails (only on really old irix!) or you only need
> > > something in that original subset, call XFS_IOC_FSGEOMETRY_V1 which
> > > will always succeed....
> > >
> > > > Should we will need to depart from this struct definition and we might
> > > > as well do it for the initial release of the syscall rather than later on, e.g.:
> > > >
> > > > --- a/include/uapi/linux/fs.h
> > > > +++ b/include/uapi/linux/fs.h
> > > > @@ -148,6 +148,17 @@ struct fsxattr {
> > > >         unsigned char   fsx_pad[8];
> > > >  };
> > > >
> > > > +/*
> > > > + * Variable size structure for file_[sg]et_attr().
> > > > + */
> > > > +struct fsx_fileattr {
> > > > +       __u32           fsx_xflags;     /* xflags field value (get/set) */
> > > > +       __u32           fsx_extsize;    /* extsize field value (get/set)*/
> > > > +       __u32           fsx_nextents;   /* nextents field value (get)   */
> > > > +       __u32           fsx_projid;     /* project identifier (get/set) */
> > > > +       __u32           fsx_cowextsize; /* CoW extsize field value (get/set)*/
> > > > +};
> > > > +
> > > > +#define FSXATTR_SIZE_VER0 20
> > > > +#define FSXATTR_SIZE_LATEST FSXATTR_SIZE_VER0
> > >
> > > If all the structures overlap the same, all that is needed in the
> > > code is to define the structure size that should be copied in and
> > > parsed. i.e:
> > >
> > >       case FSXATTR..._V1:
> > >               return ioctl_fsxattr...(args, sizeof(fsx_fileattr_v1));
> > >       case FSXATTR..._V2:
> > >               return ioctl_fsxattr...(args, sizeof(fsx_fileattr_v2));
> > >       case FSXATTR...:
> > >               return ioctl_fsxattr...(args, sizeof(fsx_fileattr));
> > >
> > > -Dave.
> > > --
> > > Dave Chinner
> > > david@fromorbit.com
> > >
> >
> > So, looks like there's at least two solutions to this concern.
> > Considering also that we have a bit of space in fsxattr,
> > 'fsx_pad[8]', I think it's fine to stick with the current fsxattr
> > for now.
> 
> Not sure which two solutions you are referring to.

Suggested by Christian and Dave

> 
> I proposed fsx_fileattr as what I think is the path of least resistance.
> There are opinions that we may be able to avoid defining
> this struct, but I don't think there was any objection to adding it.
> 
> So unless I am missing an objection that I did not understand
> define it and get over this hurdle?

I see, sure, I misinterpreted the communication :) no problems, I
will create 'struct fsx_fileattr' then.

Pali, ah sorry, I forgot that you will extend fsxattr right away

-- 
- Andrey


