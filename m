Return-Path: <selinux+bounces-5158-lists+selinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D4FEBBF066
	for <lists+selinux@lfdr.de>; Mon, 06 Oct 2025 20:53:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id D4C3C34A802
	for <lists+selinux@lfdr.de>; Mon,  6 Oct 2025 18:53:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D5062DCF7C;
	Mon,  6 Oct 2025 18:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cZc/yqqJ"
X-Original-To: selinux@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9CC82D9498
	for <selinux@vger.kernel.org>; Mon,  6 Oct 2025 18:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759776790; cv=none; b=QCZVgJz/I/Mg2YPnLSnnAWYUgCx459SLbsz5W/+ZRHQwue82KKLsUJuxPAgHC237STzBKKmlSoYZm4S6afFOJEIUEfOVILJG+HOE88767NpSPe8rW40QYarFjXjcAR5FLUoUkq3vMHE0eDQR1GGnjn9ZSIDiD242muznD2CCxSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759776790; c=relaxed/simple;
	bh=eWI9PmOJt9WIaRlYjU78S12UG6uSHamRZWNSsCfgWvo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pS2Kyzb3mr7JJDYhAFMZ2JSKpO3XQtFK2St3WbE2+hSOm5DDoLG4CY1oDlYQQveBa+iZE9bVsUMjd42kfxyMQy/ylhKdd4VFPvxpmyS0luvnQ4E/TjCDgyjlvq9InaspE7keAySJH9Fuy5CtaFKZ9cKrYJsnR7YEeEhvQAdyUXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cZc/yqqJ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1759776787;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3AELUvjO0N+ODGhRgLstmsznCqJ4q95SzfBUYFo2Qts=;
	b=cZc/yqqJJlIIHPvNRrGGmAXMLPQwyPGyz9dgu3x+zm4Ea2kU3jYMdgh87eqsC7rAzyD4Ek
	jMzl9/uCDYuDaze+LRHfxLZufcieVFrfUvJV2DSs7QGiStH9Y3bwvxtEdyYX1uQIT8/WXY
	zBwQuCe4ZjILxjlM0lWgy0nPGgXgb4c=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-546-ICrwQPeyOfOSWy4PXaGKaw-1; Mon, 06 Oct 2025 14:53:06 -0400
X-MC-Unique: ICrwQPeyOfOSWy4PXaGKaw-1
X-Mimecast-MFC-AGG-ID: ICrwQPeyOfOSWy4PXaGKaw_1759776785
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-46e502a37cdso35246715e9.0
        for <selinux@vger.kernel.org>; Mon, 06 Oct 2025 11:53:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759776785; x=1760381585;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3AELUvjO0N+ODGhRgLstmsznCqJ4q95SzfBUYFo2Qts=;
        b=RFvHPh7BaYU/pTTYf1m+4X5BvppT/cUoHLhgfUGeq7H88ttjwzQZi2tK2HLriGzNZH
         Na1BDLxGN4GC5IKV5CxiASHGM8tSHRpbJLfamBigQnlV9q+vXx/+WMLUnhZ4UlTQCD30
         gFosPL4rdKXki1vjF1jtglUdtbVY4TNXwxF7CF0gqdbIwypwEYdRcZFV4gEm72RWB62y
         Uz48cVZ799xfxApr4teC41jSjpWcf6M+gpqNqop2bKjq3zStHCBkUDTg4BW0NBREDD3e
         LQwP5zmHOsEDfyquXHs4Af2TemvL5u7f1+1KGwl3ptz52niFmRPLVHwPt9mlTZWQn3B7
         hPlg==
X-Forwarded-Encrypted: i=1; AJvYcCWyFBFmRc447XpWc/ZaxVcl8vpxEgldBsFBWvZF1djr4kCsWkEfji77pdX/QoRgjtpnZW1EefsP@vger.kernel.org
X-Gm-Message-State: AOJu0YwzY2LPq2MVz207U8iu23CRZArlLgeeOdcH8OG7/w6czTd9VttC
	cP8zIp7lZ83xH4bTAdt82RIuRI2ihVB7j1Qau2UxrOrZLpO2zsUbkQ+1qTJFyojy2wYdvYOgM7d
	2ZoXEH9PLrff55scbgcypBfPygfRtajdGoy3RrQ1/H9eCLZsFkmW7lP+nu98hmgBSgA==
X-Gm-Gg: ASbGnctBLHkDG2A3jqC4cHlR7AbW/4SI2Fp0X2I4lXTlEQxQ2f8C3fvCX8W+odaz6vP
	0m/KS2LlkuyAcEzlmykdHLPfcgdNvP/cPmZDcr+QXs/kzMEdshRjewjynbdmQC6yTIztpLS+h6e
	jQCQKVGxr7v0PpG1UipolUh5Z0gY0WJ8KbNuxJ9K9dfk6eM/1ZeZ9Jh/BSjMrbYfXGuJDDQIrLv
	4sd8WJh9XHGBJu0govKcESJUWfRq4aJKpvPx/M+YabHhg2sUoou6p9JcGD2n0p5mSbG4zadttIq
	7KfEVfD884HILKhQan+lwfvbYbaYLWoRJTMWQyO9vZFbDN90jpbhfJs/hs//wT2sQQ==
X-Received: by 2002:a05:6000:2303:b0:3ec:1154:7dec with SMTP id ffacd0b85a97d-42567164b20mr8887678f8f.25.1759776784554;
        Mon, 06 Oct 2025 11:53:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEcKlhLopprqD0ctLDeK3ZiOapzKNjpNRXsOsRWDtqgxDtwJuOl9eDtA1aAuyt6f3P21Qd/GA==
X-Received: by 2002:a05:6000:2303:b0:3ec:1154:7dec with SMTP id ffacd0b85a97d-42567164b20mr8887653f8f.25.1759776783878;
        Mon, 06 Oct 2025 11:53:03 -0700 (PDT)
Received: from thinky (ip-217-030-074-039.aim-net.cz. [217.30.74.39])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8f0170sm22533134f8f.49.2025.10.06.11.53.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 11:53:03 -0700 (PDT)
Date: Mon, 6 Oct 2025 20:52:32 +0200
From: Andrey Albershteyn <aalbersh@redhat.com>
To: Jan Kara <jack@suse.cz>
Cc: Jiri Slaby <jirislaby@kernel.org>, Amir Goldstein <amir73il@gmail.com>, 
	Arnd Bergmann <arnd@arndb.de>, Casey Schaufler <casey@schaufler-ca.com>, 
	Christian Brauner <brauner@kernel.org>, Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>, 
	Paul Moore <paul@paul-moore.com>, linux-api@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-xfs@vger.kernel.org, selinux@vger.kernel.org, 
	Andrey Albershteyn <aalbersh@kernel.org>
Subject: Re: [PATCH v6 4/6] fs: make vfs_fileattr_[get|set] return -EOPNOSUPP
Message-ID: <eyl6bzyi33tn6uys2ba5xjluvw7yjempqnla3jaih76mtgxgxq@i6xe2nquwqaf>
References: <20250630-xattrat-syscall-v6-0-c4e3bc35227b@kernel.org>
 <20250630-xattrat-syscall-v6-4-c4e3bc35227b@kernel.org>
 <a622643f-1585-40b0-9441-cf7ece176e83@kernel.org>
 <jp3vopwtpik7bj77aejuknaziecuml6x2l2dr3oe2xoats6tls@yskzvehakmkv>
Precedence: bulk
X-Mailing-List: selinux@vger.kernel.org
List-Id: <selinux.vger.kernel.org>
List-Subscribe: <mailto:selinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:selinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <jp3vopwtpik7bj77aejuknaziecuml6x2l2dr3oe2xoats6tls@yskzvehakmkv>

On 2025-10-06 17:39:46, Jan Kara wrote:
> On Mon 06-10-25 13:09:05, Jiri Slaby wrote:
> > On 30. 06. 25, 18:20, Andrey Albershteyn wrote:
> > > Future patches will add new syscalls which use these functions. As
> > > this interface won't be used for ioctls only, the EOPNOSUPP is more
> > > appropriate return code.
> > > 
> > > This patch converts return code from ENOIOCTLCMD to EOPNOSUPP for
> > > vfs_fileattr_get and vfs_fileattr_set. To save old behavior translate
> > > EOPNOSUPP back for current users - overlayfs, encryptfs and fs/ioctl.c.
> > > 
> > > Signed-off-by: Andrey Albershteyn <aalbersh@kernel.org>
> > ...
> > > @@ -292,6 +294,8 @@ int ioctl_setflags(struct file *file, unsigned int __user *argp)
> > >   			fileattr_fill_flags(&fa, flags);
> > >   			err = vfs_fileattr_set(idmap, dentry, &fa);
> > >   			mnt_drop_write_file(file);
> > > +			if (err == -EOPNOTSUPP)
> > > +				err = -ENOIOCTLCMD;
> > 
> > This breaks borg code (unit tests already) as it expects EOPNOTSUPP, not
> > ENOIOCTLCMD/ENOTTY:
> > https://github.com/borgbackup/borg/blob/1c6ef7a200c7f72f8d1204d727fea32168616ceb/src/borg/platform/linux.pyx#L147
> > 
> > I.e. setflags now returns ENOIOCTLCMD/ENOTTY for cases where 6.16 used to
> > return EOPNOTSUPP.
> > 
> > This minimal testcase program doing ioctl(fd2, FS_IOC_SETFLAGS,
> > &FS_NODUMP_FL):
> > https://github.com/jirislaby/collected_sources/tree/master/ioctl_setflags
> > 
> > dumps in 6.16:
> > sf: ioctl: Operation not supported
> > 
> > with the above patch:
> > sf: ioctl: Inappropriate ioctl for device
> > 
> > Is this expected?
> 
> No, that's a bug and a clear userspace regression so we need to fix it. I
> think we need to revert this commit and instead convert ENOIOCTLCMD from
> vfs_fileattr_get/set() to EOPNOTSUPP in appropriate places. Andrey?

I will prepare a patch soon

> 
> 								Honza
> -- 
> Jan Kara <jack@suse.com>
> SUSE Labs, CR
> 

-- 
- Andrey


