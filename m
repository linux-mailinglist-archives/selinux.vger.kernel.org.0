Return-Path: <selinux+bounces-115-lists+selinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 92610807FE3
	for <lists+selinux@lfdr.de>; Thu,  7 Dec 2023 05:59:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C38B61C20C3D
	for <lists+selinux@lfdr.de>; Thu,  7 Dec 2023 04:59:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DE8AD532;
	Thu,  7 Dec 2023 04:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fromorbit-com.20230601.gappssmtp.com header.i=@fromorbit-com.20230601.gappssmtp.com header.b="gfOsPHBT"
X-Original-To: selinux@vger.kernel.org
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52354D53
	for <selinux@vger.kernel.org>; Wed,  6 Dec 2023 20:59:14 -0800 (PST)
Received: by mail-oi1-x231.google.com with SMTP id 5614622812f47-3b88c29a995so404743b6e.0
        for <selinux@vger.kernel.org>; Wed, 06 Dec 2023 20:59:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fromorbit-com.20230601.gappssmtp.com; s=20230601; t=1701925153; x=1702529953; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jNjuJ70wYcPCgm9fSzOs2on1O3wdVHSIH2LiIdCkx3k=;
        b=gfOsPHBTUzavm5VjHye5nHE0Q+7ccAKluciawSJEd6FOeQJbb5+Apf0aPnipbBt824
         5u4Ce5B53Fx5bvKeYxpbPVrs6ny4UitixanZx7kV6/ENMlT21GxGGZQBUhber8r7FOXR
         uKkyy/Y2DFwyPMD2gKsEeJ4uPQc/8vbrv/Up9VisxQ9XaMkXnz4/swBbtm4lHeNjuJCo
         jEG162T1XKmHZhWs0Kj4VdD/TTNq9aHATtgCyOMRroxD542WIZSA+opLL9S1AcucPpFs
         s5qCVDWJz9hCklfwzHEjjKigLuoUxyZRgR6MuPQV/6oLsVPayQmvS5Sfei3suO4j0hJb
         EVyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701925153; x=1702529953;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jNjuJ70wYcPCgm9fSzOs2on1O3wdVHSIH2LiIdCkx3k=;
        b=PG4wODoMBUJ2rad8JVGLDDjHNhcdrkyBvdMkcGbmO1E1XDvkQTTX/XfrxqeQcmIlju
         f+UfZdWf2gcco5fYY26nhooO/tZrgGf2jwv+Zw/Tz0KnZYDm/CdjRtiugS3Al65wQ21F
         NOQ9grixyQIA/3x2q3zvd4Pme0nhfLeAoZm1QrRKVNPqg9JdVh3cSXFI+E9REYTdyyoi
         nacQRJejBVXlaFVLEVPwhM3LeTD3kxaS2S46ImUSK73GG1faGo/EfwpAbUd9qu/w1AH4
         1NabrcygwXR5n9GuogsNmNIPLCt8DL9NaSNIwf68uCnoytnC8N8Vp4cUI3QzzUXBKLGN
         f6jw==
X-Gm-Message-State: AOJu0YzurOo8NYiT4D7J2xN8nnGTMaFCHCWHvn51coPqIFxgTUgegXK1
	Uuivw1nf3lRtDEDqAlxEW0UU+MJqGeHSHlHwSW4=
X-Google-Smtp-Source: AGHT+IEdmwUMzlCe4IXUpFIlutTUzo8JXxqf4Rr5coCve5YDCgo/MD/d8kxJh+Eiwruhtft9enzuUA==
X-Received: by 2002:a05:6808:4492:b0:3b8:b063:a1d8 with SMTP id eq18-20020a056808449200b003b8b063a1d8mr2287992oib.98.1701925153685;
        Wed, 06 Dec 2023 20:59:13 -0800 (PST)
Received: from dread.disaster.area (pa49-180-125-5.pa.nsw.optusnet.com.au. [49.180.125.5])
        by smtp.gmail.com with ESMTPSA id d21-20020aa78695000000b006cb903ab057sm376426pfo.83.2023.12.06.20.59.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 20:59:13 -0800 (PST)
Received: from dave by dread.disaster.area with local (Exim 4.96)
	(envelope-from <david@fromorbit.com>)
	id 1rB6Te-004vzJ-2E;
	Thu, 07 Dec 2023 15:59:10 +1100
Date: Thu, 7 Dec 2023 15:59:10 +1100
From: Dave Chinner <david@fromorbit.com>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: linux-fsdevel@vger.kernel.org, linux-block@vger.kernel.org,
	linux-cachefs@redhat.com, dhowells@redhat.com, gfs2@lists.linux.dev,
	dm-devel@lists.linux.dev, linux-security-module@vger.kernel.org,
	selinux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 03/11] vfs: Use dlock list for superblock's inode list
Message-ID: <ZXFRHo3mcbKfoC8v@dread.disaster.area>
References: <20231206060629.2827226-1-david@fromorbit.com>
 <20231206060629.2827226-4-david@fromorbit.com>
 <20231207024024.GU1674809@ZenIV>
Precedence: bulk
X-Mailing-List: selinux@vger.kernel.org
List-Id: <selinux.vger.kernel.org>
List-Subscribe: <mailto:selinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:selinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231207024024.GU1674809@ZenIV>

On Thu, Dec 07, 2023 at 02:40:24AM +0000, Al Viro wrote:
> On Wed, Dec 06, 2023 at 05:05:32PM +1100, Dave Chinner wrote:
> 
> > @@ -303,6 +303,7 @@ static void destroy_unused_super(struct super_block *s)
> >  	super_unlock_excl(s);
> >  	list_lru_destroy(&s->s_dentry_lru);
> >  	list_lru_destroy(&s->s_inode_lru);
> > +	free_dlock_list_heads(&s->s_inodes);
> >  	security_sb_free(s);
> >  	put_user_ns(s->s_user_ns);
> >  	kfree(s->s_subtype);
> 
> Umm...  Who's going to do that on normal umount?

Huh. So neither KASAN nor kmemleak has told me that s->s-inodes was
being leaked.  I'm guessing a rebase sometime in the past silently
dropped a critical hunk from deactivate_locked_super() in the bit
bucket, but as nothing since whenever that happened has failed or
flagged a memory leak I didn't notice.

Such great tools we have......

-Dave.
-- 
Dave Chinner
david@fromorbit.com

