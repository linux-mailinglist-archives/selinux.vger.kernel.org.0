Return-Path: <selinux+bounces-117-lists+selinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E46808058
	for <lists+selinux@lfdr.de>; Thu,  7 Dec 2023 06:43:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 463451F213BA
	for <lists+selinux@lfdr.de>; Thu,  7 Dec 2023 05:43:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB6E31118E;
	Thu,  7 Dec 2023 05:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="IdnVs7Vi"
X-Original-To: selinux@vger.kernel.org
X-Greylist: delayed 5169 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 06 Dec 2023 21:43:06 PST
Received: from out-183.mta1.migadu.com (out-183.mta1.migadu.com [95.215.58.183])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 100491A8
	for <selinux@vger.kernel.org>; Wed,  6 Dec 2023 21:43:05 -0800 (PST)
Date: Thu, 7 Dec 2023 00:42:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1701927784;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RdkE7cfoCE6RprmuDTJo4aDA/cMCyuQzoGY8unYOC/U=;
	b=IdnVs7Vi7unvKOyS8HY/3pkuIEPD03zqV1vALHaO/bpzmbBWF5D6mi0ATroyP4lR7G40fU
	FVxOcbeNRl1GysGG11L+g0K48yHqyOypx/5PqkvLC5O7lxVC8hWpq8kMciPrzUceu2SXMQ
	0dNkbCsaPpS4FC9MgaaiTA+IjAkT1hk=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Dave Chinner <david@fromorbit.com>, Waiman Long <longman@redhat.com>
Cc: linux-fsdevel@vger.kernel.org, linux-block@vger.kernel.org,
	linux-cachefs@redhat.com, dhowells@redhat.com, gfs2@lists.linux.dev,
	dm-devel@lists.linux.dev, linux-security-module@vger.kernel.org,
	selinux@vger.kernel.org, linux-kernel@vger.kernel.org,
	Jan Kara <jack@suse.cz>
Subject: Re: [PATCH 04/11] lib/dlock-list: Make sibling CPUs share the same
 linked list
Message-ID: <20231207054259.gpx3cydlb6b7raax@moria.home.lan>
References: <20231206060629.2827226-1-david@fromorbit.com>
 <20231206060629.2827226-5-david@fromorbit.com>
Precedence: bulk
X-Mailing-List: selinux@vger.kernel.org
List-Id: <selinux.vger.kernel.org>
List-Subscribe: <mailto:selinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:selinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231206060629.2827226-5-david@fromorbit.com>
X-Migadu-Flow: FLOW_OUT

On Wed, Dec 06, 2023 at 05:05:33PM +1100, Dave Chinner wrote:
> From: Waiman Long <longman@redhat.com>
> 
> The dlock list needs one list for each of the CPUs available. However,
> for sibling CPUs, they are sharing the L2 and probably L1 caches
> too. As a result, there is not much to gain in term of avoiding
> cacheline contention while increasing the cacheline footprint of the
> L1/L2 caches as separate lists may need to be in the cache.
> 
> This patch makes all the sibling CPUs share the same list, thus
> reducing the number of lists that need to be maintained in each
> dlock list without having any noticeable impact on performance. It
> also improves dlock list iteration performance as fewer lists need
> to be iterated.

Seems Waiman was missed on the CC

it looks like there's some duplication of this with list_lru
functionality - similar list-sharded-by-node idea.

list_lru does the sharding by page_to_nid() of the item, which saves a
pointer and allows just using a list_head in the item. OTOH, it's less
granular than what dlock-list is doing?

I think some attempt ought to be made to factor out the common ideas
hear; perhaps reworking list_lru to use this thing, and I hope someone
has looked at the page_nid idea vs. dlock_list using the current core.

But it's nice and small, and I'd like to use it elsewhere.

Reviewed-by: Kent Overstreet <kent.overstreet@linux.dev>

