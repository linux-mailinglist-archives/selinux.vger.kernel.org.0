Return-Path: <selinux+bounces-110-lists+selinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 528D0807F8F
	for <lists+selinux@lfdr.de>; Thu,  7 Dec 2023 05:25:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CA88C281B8A
	for <lists+selinux@lfdr.de>; Thu,  7 Dec 2023 04:25:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25082D511;
	Thu,  7 Dec 2023 04:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="NFO11Xyc"
X-Original-To: selinux@vger.kernel.org
X-Greylist: delayed 419 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 06 Dec 2023 20:25:32 PST
Received: from out-187.mta0.migadu.com (out-187.mta0.migadu.com [IPv6:2001:41d0:1004:224b::bb])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C72FEDD
	for <selinux@vger.kernel.org>; Wed,  6 Dec 2023 20:25:32 -0800 (PST)
Date: Wed, 6 Dec 2023 23:18:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1701922711;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2mvMz4Xtdgv0/4300WneKlj3cKdx36cdNrIcEspzdyw=;
	b=NFO11XycgEixh3ft6g48SeLb7yeXS3J4BErSklwsmCkY/vNLDM+uI54ppt0a97GslK3N9e
	vh/Hdk0XILHlX93REmLqe4QAbbVtBqUPa6B3yxXoX9OOcTZoRfm5eTauUVSFjjARyChQf0
	c0CpqzY4BCG20/1m7mZGJapZt1QRhfw=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Dave Chinner <david@fromorbit.com>
Cc: linux-fsdevel@vger.kernel.org, linux-block@vger.kernel.org,
	linux-cachefs@redhat.com, dhowells@redhat.com, gfs2@lists.linux.dev,
	dm-devel@lists.linux.dev, linux-security-module@vger.kernel.org,
	selinux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 02/11] vfs: Remove unnecessary list_for_each_entry_safe()
 variants
Message-ID: <20231207041827.yn5d46g7lvz3d3um@moria.home.lan>
References: <20231206060629.2827226-1-david@fromorbit.com>
 <20231206060629.2827226-3-david@fromorbit.com>
Precedence: bulk
X-Mailing-List: selinux@vger.kernel.org
List-Id: <selinux.vger.kernel.org>
List-Subscribe: <mailto:selinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:selinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231206060629.2827226-3-david@fromorbit.com>
X-Migadu-Flow: FLOW_OUT

On Wed, Dec 06, 2023 at 05:05:31PM +1100, Dave Chinner wrote:
> From: Jan Kara <jack@suse.cz>
> 
> evict_inodes() and invalidate_inodes() use list_for_each_entry_safe()
> to iterate sb->s_inodes list. However, since we use i_lru list entry for
> our local temporary list of inodes to destroy, the inode is guaranteed
> to stay in sb->s_inodes list while we hold sb->s_inode_list_lock. So
> there is no real need for safe iteration variant and we can use
> list_for_each_entry() just fine.
> 
> Signed-off-by: Jan Kara <jack@suse.cz>
> Signed-off-by: Waiman Long <longman@redhat.com>

Reviewed-by: Kent Overstreet <kent.overstreet@linux.dev>

