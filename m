Return-Path: <selinux+bounces-3639-lists+selinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FAE1AB7F41
	for <lists+selinux@lfdr.de>; Thu, 15 May 2025 09:51:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 28EE47A46D9
	for <lists+selinux@lfdr.de>; Thu, 15 May 2025 07:49:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A737E283FD4;
	Thu, 15 May 2025 07:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DldQMFxA"
X-Original-To: selinux@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C32E72836A6
	for <selinux@vger.kernel.org>; Thu, 15 May 2025 07:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747295455; cv=none; b=ZXqdmnQYxlbdyY0G5QzBEU98NupehwsZsE/ZDPRlokqP6UHtd48tKG8eQ8XPuNrPBDPCaj9xwA49L+2wEG4e4PPWL5WOgaIGdoh+y/UKl8wu5A8jbxK0YR4a5xixM3sqLT8G1Yo/Zz5pc3n+uIoAjNh0LdxNW0HjK51BdwuAG4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747295455; c=relaxed/simple;
	bh=SI+pTvA0hGOAcmdfuFDmY5RUnGs6yiJiGIIQYLSqKL0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hihBnTyb1M0VC+7NnKRM5aznCDY5fi3Z+yVzwOsjIwhrsQLI2hN/K48x4omNsb2DOk1mdWiHgr3V1SVM8Ovy5r0JNXtfRxsq31s2bPUaGnHuY6EzgM/Dp/p7Mc86hTOqiZWkTeqCLRGklZI3LvTSDK4LnUSQJZiEDSShkBs33iI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DldQMFxA; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747295451;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dIYznBp1zKy3fmdyZZzgeQrbk2pRjSVKo51V0MhaZng=;
	b=DldQMFxAavsg8G6TXoVVzdQa+2B794I131t+XgoYaxCKxDAQYCHlulxQDOnwSl4Kdp6FWG
	Hm336+SU9Dbp4kS8vMUh/okrik/tFSZb8Jw+n+l2Jks824r6QI69jpgaPRq3AQhm9NkDpK
	PQgNhUxK4Q95QzZDFFqJDlBvxSMNwyc=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-452-GXPImbnnNc2rd94tXe0Gkg-1; Thu, 15 May 2025 03:50:49 -0400
X-MC-Unique: GXPImbnnNc2rd94tXe0Gkg-1
X-Mimecast-MFC-AGG-ID: GXPImbnnNc2rd94tXe0Gkg_1747295448
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-ad240e3f501so49458366b.1
        for <selinux@vger.kernel.org>; Thu, 15 May 2025 00:50:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747295448; x=1747900248;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dIYznBp1zKy3fmdyZZzgeQrbk2pRjSVKo51V0MhaZng=;
        b=FQuqvF13lV6hNFTGMAJQgeqwxCb95ynJa6YxIB+lblqgUjmOBm8SYF/HK3JCbpOAkT
         5nue2+9GIZa1kVRr8wUMGi99gqDIqSZXmcFmIBg5JAz6XTWOFfq7AlrriRoRPhOaeQkX
         R0n9r1PJWIS/AUWUNTa20U3G3CAlh5yNJ23xZQY71bSpEDFvE7XVtO7885ssG3IbrXDO
         wXY9HF1e7WRZqSU94MTgRHh5qf2qcAEW6uQdv3kFq/KSQQWSGPgmdi6GrNp34yZm9rxW
         DuQ8cO88675ZxAGM4Gex3jrdb0j15jbkdquDsbelh/Ed/kzdi0oIgzV4aJEHqjduBaVu
         MV+w==
X-Forwarded-Encrypted: i=1; AJvYcCWIeBmqYgHneHGV5kgXJeLor/3GFtFMdbwZKoZvu+ob4Abo9ZQ4TnSU8WHDI4zKOhxNv1SOPGMk@vger.kernel.org
X-Gm-Message-State: AOJu0Ywcfyy4VfhUCXzpI95FsTZtEAhLaBokbRm8Kri1LJf2FmcloMpb
	ggwrxyrQvuMbVzUWVXxuMVMAWcvyBcq1MoYN88UYQjcvlYvkJTZOq9ltGaPFlv+Kn/wfm0kV/Xz
	eVOPmsfkUkzKh+vcsuDrrZuUmmnLCBh9PLVzqa7o2ah1VsgWUJ2JbBg==
X-Gm-Gg: ASbGnctWJ8MgUuLIUciR8Kvzt0a4Y9UJjW/+9cTpoXYTpFv90uHWB1svlI/3ZqlJAo8
	uT/pgYH3oNy++zxlvDd1aNpiw8zfhXhEpOxqtIi9eZUps/+mmD3KMwyzH7eL2ztRMsJmGWhZtQA
	IrUmL3hsjfv8FhcZ2E9SgS0XfL4WVOBrTVIjq6SH9Zn+q5zN8sxnHX+T4E5qX+B4j5fd42BKUUt
	mx8SWnTrPAVl7/P+5JGGhCUyBEraaTTklEjnMsdVi9SJwJriwKOI46DEwQs7sP6+rHoQFOAOhI8
	JETC7uANcHAHIaGfMuVYrs2xXgBdhzpjl/pLsSOQ
X-Received: by 2002:a17:907:6e8f:b0:ad4:f6d2:431b with SMTP id a640c23a62f3a-ad51601e1edmr114982866b.44.1747295448278;
        Thu, 15 May 2025 00:50:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHWr4fWklZ0eQ07tSCt/uJX+ZC5LZkXrxcbvUbmkmojzea9n6Ige7V0auLmvx+BHm+IbBk77A==
X-Received: by 2002:a17:907:6e8f:b0:ad4:f6d2:431b with SMTP id a640c23a62f3a-ad51601e1edmr114976966b.44.1747295447688;
        Thu, 15 May 2025 00:50:47 -0700 (PDT)
Received: from thinky (109-92-26-237.static.isp.telekom.rs. [109.92.26.237])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad224531152sm984378866b.38.2025.05.15.00.50.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 00:50:47 -0700 (PDT)
Date: Thu, 15 May 2025 09:50:44 +0200
From: Andrey Albershteyn <aalbersh@redhat.com>
To: Casey Schaufler <casey@schaufler-ca.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, 
	Matt Turner <mattst88@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	Helge Deller <deller@gmx.de>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Rich Felker <dalias@libc.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
	"David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, 
	Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	=?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, =?utf-8?Q?G=C3=BCnther?= Noack <gnoack@google.com>, 
	Arnd Bergmann <arnd@arndb.de>, Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>, 
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>, Stephen Smalley <stephen.smalley.work@gmail.com>, 
	Ondrej Mosnacek <omosnace@redhat.com>, Tyler Hicks <code@tyhicks.com>, 
	Miklos Szeredi <miklos@szeredi.hu>, Amir Goldstein <amir73il@gmail.com>, linux-alpha@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-api@vger.kernel.org, linux-arch@vger.kernel.org, 
	selinux@vger.kernel.org, ecryptfs@vger.kernel.org, linux-unionfs@vger.kernel.org, 
	linux-xfs@vger.kernel.org, Andrey Albershteyn <aalbersh@kernel.org>
Subject: Re: [PATCH v5 2/7] lsm: introduce new hooks for setting/getting
 inode fsxattr
Message-ID: <5jtjzgfgyjkw5oiofp2npp5zwib4rdp24u6lwmfctvmxo742vz@5wi6latt74lb>
References: <20250512-xattrat-syscall-v5-0-4cd6821e8ff7@kernel.org>
 <20250512-xattrat-syscall-v5-2-4cd6821e8ff7@kernel.org>
 <f700845d-f332-4336-a441-08f98cd7f075@schaufler-ca.com>
 <kgl5h2iruqnhmad65sonlvneu6mdj6jl3sd4aoc3us3lvrgviy@imce27t4nk2e>
 <cb737e58-51ab-4918-b5ba-2c18bf1ad601@schaufler-ca.com>
Precedence: bulk
X-Mailing-List: selinux@vger.kernel.org
List-Id: <selinux.vger.kernel.org>
List-Subscribe: <mailto:selinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:selinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cb737e58-51ab-4918-b5ba-2c18bf1ad601@schaufler-ca.com>

On 2025-05-14 11:21:46, Casey Schaufler wrote:
> On 5/14/2025 4:02 AM, Andrey Albershteyn wrote:
> > On 2025-05-12 08:43:32, Casey Schaufler wrote:
> >> On 5/12/2025 6:25 AM, Andrey Albershteyn wrote:
> >>> Introduce new hooks for setting and getting filesystem extended
> >>> attributes on inode (FS_IOC_FSGETXATTR).
> >>>
> >>> Cc: selinux@vger.kernel.org
> >>> Cc: Paul Moore <paul@paul-moore.com>
> >>>
> >>> Signed-off-by: Andrey Albershteyn <aalbersh@kernel.org>
> >>> ---
> >>>  fs/file_attr.c                | 19 ++++++++++++++++---
> >>>  include/linux/lsm_hook_defs.h |  2 ++
> >>>  include/linux/security.h      | 16 ++++++++++++++++
> >>>  security/security.c           | 30 ++++++++++++++++++++++++++++++
> >>>  4 files changed, 64 insertions(+), 3 deletions(-)
> >>>
> >>> diff --git a/fs/file_attr.c b/fs/file_attr.c
> >>> index 2910b7047721..be62d97cc444 100644
> >>> --- a/fs/file_attr.c
> >>> +++ b/fs/file_attr.c
> >>> @@ -76,10 +76,15 @@ EXPORT_SYMBOL(fileattr_fill_flags);
> >>>  int vfs_fileattr_get(struct dentry *dentry, struct fileattr *fa)
> >>>  {
> >>>  	struct inode *inode = d_inode(dentry);
> >>> +	int error;
> >>>  
> >>>  	if (!inode->i_op->fileattr_get)
> >>>  		return -ENOIOCTLCMD;
> >>>  
> >>> +	error = security_inode_file_getattr(dentry, fa);
> >>> +	if (error)
> >>> +		return error;
> >>> +
> >> If you're changing VFS behavior to depend on LSMs supporting the new
> >> hooks I'm concerned about the impact it will have on the LSMs that you
> >> haven't supplied hooks for. Have you tested these changes with anything
> >> besides SELinux?
> > Sorry, this thread is incomplete, I've resent full patchset again.
> > If you have any further comments please comment in that thread [1]
> >
> > I haven't tested with anything except SELinux, but I suppose if
> > module won't register any hooks, then security_inode_file_*() will
> > return 0. Reverting SELinux implementation of the hooks doesn't
> > cause any errors.
> >
> > I'm not that familiar with LSMs/selinux and its codebase, if you can
> > recommend what need to be tested while adding new hooks, I will try
> > to do that for next revision.
> 
> At a minimum the Smack testsuite:
> 	https://github.com/smack-team/smack-testsuite.git
> And the audit suite:
> 	https://github.com/linux-audit/audit-testsuite.git
> 
> AppArmor has a suite as well, but I'm not sure where is resides.

Well, I thought about something more specific, I know about these
testsuites

> 
> My primary concern is that you're making changes that remove existing
> hook calls and add new hook calls without verifying that the protections
> provided by the old calls are always also provided by the new ones.

I'm only adding new hooks, ioctls weren't calling any hooks.

-- 
- Andrey


