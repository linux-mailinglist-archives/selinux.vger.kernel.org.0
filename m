Return-Path: <selinux+bounces-112-lists+selinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D81DB807FC5
	for <lists+selinux@lfdr.de>; Thu,  7 Dec 2023 05:42:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 93C2E281D1D
	for <lists+selinux@lfdr.de>; Thu,  7 Dec 2023 04:42:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E60CA443E;
	Thu,  7 Dec 2023 04:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fromorbit-com.20230601.gappssmtp.com header.i=@fromorbit-com.20230601.gappssmtp.com header.b="MKoR0dcr"
X-Original-To: selinux@vger.kernel.org
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1DB8110
	for <selinux@vger.kernel.org>; Wed,  6 Dec 2023 20:41:59 -0800 (PST)
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-286ceba3f3eso569210a91.0
        for <selinux@vger.kernel.org>; Wed, 06 Dec 2023 20:41:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fromorbit-com.20230601.gappssmtp.com; s=20230601; t=1701924119; x=1702528919; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=v2QqlXWCI26gv+jGfNp5oJjKdW8trvqIMxHSQSlEVHs=;
        b=MKoR0dcrSBRNJKZmpUwr0+k2U4NqHbxPyVIUTmDcvuDa7rgLcBAGAIx6zkdjjxunk4
         w7HqBHmzFX3i1Bc97Y1XK7d5r1CCuRapoxS9K67ePCo0I3YjnjbM+pVs2QeX6f0T4CSC
         X4lqcOPh54gnrmzQegKb9Mqc0LuG5JsT/yAaKm/DSPxO8xVUYxmyTvUMALt9WWpHfbhQ
         LwxY/XWeUMurIzzvkthXsuHxsSFu+jkPhiY30F3uGKiiNuOUY13chSKWw8BvQXIL0Sen
         zokKIhg3tUngUM+yYHxk9tZwQaVS5ZPU2H737G/uSJiPK9tws8aHT/hXEQnlJbJLEKTN
         TPDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701924119; x=1702528919;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v2QqlXWCI26gv+jGfNp5oJjKdW8trvqIMxHSQSlEVHs=;
        b=HZf74Kkq5qcyWzWaHy3EQT7crXK7qf0oJrR2JETX4mi+kjAHUvF5w0Wn51C1e3Js9A
         ou6NwbijPok/SGb8WRRQ3B117qWPtU/lr2B5H/xffvk7nXCAKP0AyvxwMIeRA9EA0e21
         zbhWzQWWPHqTuhxA5gtUnoemjTao0xYssaQ0MTfMr8ogUF+3Fx7gDmf9BoB3MDhZtv6W
         hZp1O83jFQ3MYhax/u44RL6VKFPZczB83MACaq8Mi9q1LoUKrFKrC3y/iIIiJxI8n+qb
         MoostRmdJwyZ5IujHnVPhcsOtIS3vS6BrmHghgj4fQeCoRuHmU2K8OwD+s6ckUmPsekz
         Mk1Q==
X-Gm-Message-State: AOJu0YzGDLqqWcLU+bQpzt7BZt9J/eTaQfple8AuBv+Uo0/RlsU4DfAD
	oxgcTza5G31IY1BhROWnepHvCg==
X-Google-Smtp-Source: AGHT+IEKMEQI+Kt2z5Onuh0MysWMqhlDFc/G7D/Ejlz0kBFz1I/zpQGv1eC/i6etrpu5sui34F8eUg==
X-Received: by 2002:a17:90a:ff14:b0:286:6cc1:781a with SMTP id ce20-20020a17090aff1400b002866cc1781amr1867568pjb.93.1701924119432;
        Wed, 06 Dec 2023 20:41:59 -0800 (PST)
Received: from dread.disaster.area (pa49-180-125-5.pa.nsw.optusnet.com.au. [49.180.125.5])
        by smtp.gmail.com with ESMTPSA id mm22-20020a17090b359600b00286901e226bsm293341pjb.28.2023.12.06.20.41.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 20:41:58 -0800 (PST)
Received: from dave by dread.disaster.area with local (Exim 4.96)
	(envelope-from <david@fromorbit.com>)
	id 1rB6Cy-004vYN-0Q;
	Thu, 07 Dec 2023 15:41:56 +1100
Date: Thu, 7 Dec 2023 15:41:56 +1100
From: Dave Chinner <david@fromorbit.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: linux-fsdevel@vger.kernel.org, linux-block@vger.kernel.org,
	linux-cachefs@redhat.com, dhowells@redhat.com, gfs2@lists.linux.dev,
	dm-devel@lists.linux.dev, linux-security-module@vger.kernel.org,
	selinux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 10/11] list_bl: don't use bit locks for PREEMPT_RT or
 lockdep
Message-ID: <ZXFNFKai3ILLFdnR@dread.disaster.area>
References: <20231206060629.2827226-1-david@fromorbit.com>
 <20231206060629.2827226-11-david@fromorbit.com>
 <20231207041650.3tzzmv2jfrr5vppl@moria.home.lan>
Precedence: bulk
X-Mailing-List: selinux@vger.kernel.org
List-Id: <selinux.vger.kernel.org>
List-Subscribe: <mailto:selinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:selinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231207041650.3tzzmv2jfrr5vppl@moria.home.lan>

On Wed, Dec 06, 2023 at 11:16:50PM -0500, Kent Overstreet wrote:
> On Wed, Dec 06, 2023 at 05:05:39PM +1100, Dave Chinner wrote:
> > From: Dave Chinner <dchinner@redhat.com>
> > 
> > hash-bl nests spinlocks inside the bit locks. This causes problems
> > for CONFIG_PREEMPT_RT which converts spin locks to sleeping locks,
> > and we're not allowed to sleep while holding a spinning lock.
> > 
> > Further, lockdep does not support bit locks, so we lose lockdep
> > coverage of the inode hash table with the hash-bl conversion.
> > 
> > To enable these configs to work, add an external per-chain spinlock
> > to the hlist_bl_head() and add helpers to use this instead of the
> > bit spinlock when preempt_rt or lockdep are enabled.
> > 
> > This converts all users of hlist-bl to use the external spinlock in
> > these situations, so we also gain lockdep coverage of things like
> > the dentry cache hash table with this change.
> > 
> > Signed-off-by: Dave Chinner <dchinner@redhat.com>
> 
> Sleepable bit locks can be done with wait_on_bit(), is that worth
> considering for PREEMPT_RT? Or are the other features of real locks
> important there?

I think wait_on_bit() is not scalable. It hashes down to one of 256
shared struct wait_queue_heads which have thundering herd
behaviours, and it requires the locker to always run
prepare_to_wait() and finish_wait(). This means there is at least
one spinlock_irqsave()/unlock pair needed, sometimes two, just to
get an uncontended sleeping bit lock.

So as a fast path operation that requires lock scalability, it's
going to be better to use a straight spinlock that doesn't require
irq safety as it's far less expensive than a sleeping bit lock.

Whether CONFIG_PREEMPT_RT changes that equation at all is not at all
clear to me, and so I'll leave that consideration to RT people if
they see a need to address it. In the mean time, we need to use an
external spinlock for lockdep validation so it really doesn't make
any sense at all to add a third locking variant with completely
different semantics just for PREEMPT_RT...

-Dave.
-- 
Dave Chinner
david@fromorbit.com

