Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 021607DFCD
	for <lists+selinux@lfdr.de>; Thu,  1 Aug 2019 18:11:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731930AbfHAQKv (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Thu, 1 Aug 2019 12:10:51 -0400
Received: from zeniv.linux.org.uk ([195.92.253.2]:55600 "EHLO
        ZenIV.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727403AbfHAQKu (ORCPT
        <rfc822;selinux@vger.kernel.org>); Thu, 1 Aug 2019 12:10:50 -0400
Received: from viro by ZenIV.linux.org.uk with local (Exim 4.92 #3 (Red Hat Linux))
        id 1htDfF-0003wN-HU; Thu, 01 Aug 2019 16:10:49 +0000
Date:   Thu, 1 Aug 2019 17:10:49 +0100
From:   Al Viro <viro@zeniv.linux.org.uk>
To:     Ondrej Mosnacek <omosnace@redhat.com>
Cc:     selinux@vger.kernel.org, Paul Moore <paul@paul-moore.com>,
        linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] d_walk: optionally lock also parent inode
Message-ID: <20190801161049.GX1131@ZenIV.linux.org.uk>
References: <20190801140243.24080-1-omosnace@redhat.com>
 <20190801140243.24080-2-omosnace@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190801140243.24080-2-omosnace@redhat.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Thu, Aug 01, 2019 at 04:02:40PM +0200, Ondrej Mosnacek wrote:
> @@ -1276,6 +1277,8 @@ static void d_walk(struct dentry *parent, void *data,
>  again:
>  	read_seqbegin_or_lock(&rename_lock, &seq);
>  	this_parent = parent;
> +	if (lock_inode)
> +		inode_lock(this_parent->d_inode);

Suppose we are on the second pass through that thing - with rename_lock held.
What will happen to that inode_lock?
