Return-Path: <selinux+bounces-3158-lists+selinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DE79FA73E8A
	for <lists+selinux@lfdr.de>; Thu, 27 Mar 2025 20:26:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 72F6E176541
	for <lists+selinux@lfdr.de>; Thu, 27 Mar 2025 19:26:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0AE71C7010;
	Thu, 27 Mar 2025 19:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AhoI7WNe"
X-Original-To: selinux@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73ED018A6DB;
	Thu, 27 Mar 2025 19:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743103605; cv=none; b=OeaKf2eAmQaF/ijWQdMpzg7bpgJyeTMaRwCZg6yCO8pZZtH86a3PYscI3LKZuWwsviLltzlJUODzjjKD4C7KByD+I5lbGjAOOIqv9pPkyWpcFsjWkPtxeBJ72Y3E10H8yF4jTMLntohKSYNL3urA/xpNskpTmJeciVikG0YvgRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743103605; c=relaxed/simple;
	bh=g1CYlQqdxlwZLruKDHJtfRscrIkZVdAluXQtGU8MRKc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TemvPxwLw9ysPgvdH9e3SvnkoYicb4zmcrTMgTARNamEMksG8vzirWKXXyt/UNV1TXo8OFLfhdLakRodlCEaBRVOwcCu3Bd8Y7A2YtnFInMv6Hgo/MTFle7NOwreV8k67KdOSJmgBIaY3blyPNC+uOWiRhlgoL42AlfEH/8ijY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AhoI7WNe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98751C4CEE5;
	Thu, 27 Mar 2025 19:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743103604;
	bh=g1CYlQqdxlwZLruKDHJtfRscrIkZVdAluXQtGU8MRKc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AhoI7WNeMPZ29oSLwAkdjh1+hmd1H0PFd78VKrYEq7ZvOtJyRn/kZVpJ7ov1pCCkt
	 FFtBsyvNXkgsCOuqL30XwUuAqDQSOw70VXwuTA0GlahX+tgi0vjgOM4rALe3DWcHDQ
	 jjdr86gecU+SCmXIyBRIrTstnwwhhOU6G2P4SE+bQ56P43gtHv0GdjAy87Fkl3/6cO
	 KzWNTAKllZg27AeU0seeKYl9Wju3Yt8606yfQiT/HEaHSmUmIR/ZYy8Aof73NN9rkC
	 QlhDI25yR0zXN+3W0AsjfYwqvdqIfS5VNKvL2/jazZPFvmtHh/DNyEYhO04ZgZcO2W
	 aITrHM+dyWvfA==
Received: by pali.im (Postfix)
	id 490BC81B; Thu, 27 Mar 2025 20:26:29 +0100 (CET)
Date: Thu, 27 Mar 2025 20:26:29 +0100
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Amir Goldstein <amir73il@gmail.com>
Cc: Andrey Albershteyn <aalbersh@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Matt Turner <mattst88@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Michal Simek <monstr@monstr.eu>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Helge Deller <deller@gmx.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Andy Lutomirski <luto@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Chris Zankel <chris@zankel.net>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
	=?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>,
	=?utf-8?Q?G=C3=BCnther?= Noack <gnoack@google.com>,
	Arnd Bergmann <arnd@arndb.de>, Paul Moore <paul@paul-moore.com>,
	James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>, linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-security-module@vger.kernel.org, linux-api@vger.kernel.org,
	linux-arch@vger.kernel.org, selinux@vger.kernel.org,
	Andrey Albershteyn <aalbersh@kernel.org>, linux-xfs@vger.kernel.org
Subject: Re: [PATCH v4 0/3] fs: introduce getfsxattrat and setfsxattrat
 syscalls
Message-ID: <20250327192629.ivnarhlkfbhbzjcl@pali>
References: <20250321-xattrat-syscall-v4-0-3e82e6fb3264@kernel.org>
 <CAOQ4uxjQDUg8HFG+mSxMkR54zen7nC2jttzOKqh13Bx-uosh3Q@mail.gmail.com>
 <20250323103234.2mwhpsbigpwtiby4@pali>
 <CAOQ4uxiTKhGs1H-w1Hv-+MqY284m92Pvxfem0iWO+8THdzGvuA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: selinux@vger.kernel.org
List-Id: <selinux.vger.kernel.org>
List-Subscribe: <mailto:selinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:selinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOQ4uxiTKhGs1H-w1Hv-+MqY284m92Pvxfem0iWO+8THdzGvuA@mail.gmail.com>
User-Agent: NeoMutt/20180716

On Thursday 27 March 2025 12:47:02 Amir Goldstein wrote:
> On Sun, Mar 23, 2025 at 11:32 AM Pali Rohár <pali@kernel.org> wrote:
> >
> > On Sunday 23 March 2025 09:45:06 Amir Goldstein wrote:
> > > On Fri, Mar 21, 2025 at 8:50 PM Andrey Albershteyn <aalbersh@redhat.com> wrote:
> > > >
> > > > This patchset introduced two new syscalls getfsxattrat() and
> > > > setfsxattrat(). These syscalls are similar to FS_IOC_FSSETXATTR ioctl()
> > > > except they use *at() semantics. Therefore, there's no need to open the
> > > > file to get an fd.
> > > >
> > > > These syscalls allow userspace to set filesystem inode attributes on
> > > > special files. One of the usage examples is XFS quota projects.
> > > >
> > > > XFS has project quotas which could be attached to a directory. All
> > > > new inodes in these directories inherit project ID set on parent
> > > > directory.
> > > >
> > > > The project is created from userspace by opening and calling
> > > > FS_IOC_FSSETXATTR on each inode. This is not possible for special
> > > > files such as FIFO, SOCK, BLK etc. Therefore, some inodes are left
> > > > with empty project ID. Those inodes then are not shown in the quota
> > > > accounting but still exist in the directory. This is not critical but in
> > > > the case when special files are created in the directory with already
> > > > existing project quota, these new inodes inherit extended attributes.
> > > > This creates a mix of special files with and without attributes.
> > > > Moreover, special files with attributes don't have a possibility to
> > > > become clear or change the attributes. This, in turn, prevents userspace
> > > > from re-creating quota project on these existing files.
> > > >
> > > > Christian, if this get in some mergeable state, please don't merge it
> > > > yet. Amir suggested these syscalls better to use updated struct fsxattr
> > > > with masking from Pali Rohár patchset, so, let's see how it goes.
> > >
> > > Andrey,
> > >
> > > To be honest I don't think it would be fair to delay your syscalls more
> > > than needed.
> >
> > I agree.
> >
> > > If Pali can follow through and post patches on top of your syscalls for
> > > next merge window that would be great, but otherwise, I think the
> > > minimum requirement is that the syscalls return EINVAL if fsx_pad
> > > is not zero. we can take it from there later.
> >
> > IMHO SYS_getfsxattrat is fine in this form.
> >
> > For SYS_setfsxattrat I think there are needed some modifications
> > otherwise we would have problem again with backward compatibility as
> > is with ioctl if the syscall wants to be extended in future.
> >
> > I would suggest for following modifications for SYS_setfsxattrat:
> >
> > - return EINVAL if fsx_xflags contains some reserved or unsupported flag
> >
> > - add some flag to completely ignore fsx_extsize, fsx_projid, and
> >   fsx_cowextsize fields, so SYS_setfsxattrat could be used just to
> >   change fsx_xflags, and so could be used without the preceding
> >   SYS_getfsxattrat call.
> >
> > What do you think about it?
> 
> I think all Andrey needs to do now is return -EINVAL if fsx_pad is not zero.
> 
> You can use this later to extend for the semantics of flags/fields mask
> and we can have a long discussion later on what this semantics should be.
> 
> Right?
> 
> Amir.

It is really enough? All new extensions later would have to be added
into fsx_pad fields, and currently unused bits in fsx_xflags would be
unusable for extensions.

