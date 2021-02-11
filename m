Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B47A318CED
	for <lists+selinux@lfdr.de>; Thu, 11 Feb 2021 15:07:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231695AbhBKOF2 (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Thu, 11 Feb 2021 09:05:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50809 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230465AbhBKODX (ORCPT
        <rfc822;selinux@vger.kernel.org>); Thu, 11 Feb 2021 09:03:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1613052115;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=ZU4zs3buWNPkY1UoxzzlBxJ+iVyS/9lraiVW85TYk94=;
        b=ejLeyzSpwJmm5+wIjIVFOF2+9Pkz8evj9GJqrut9bvRl6dpwY5m0kxv7VgABxV4Y2K+S2G
        1QW+042FysbPIiS1Guv1brA2AMBrcSwEJ7A+Xx8n0vMGSkZbc5ah9QPQck/PDh89lv2BZi
        KZu20WvBAWVQNj8+YDV7kxFVnSQzuJ0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-193-uD2uc4EcPKeRpHWm7ghjmg-1; Thu, 11 Feb 2021 09:01:51 -0500
X-MC-Unique: uD2uc4EcPKeRpHWm7ghjmg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 75C7D107ACC7;
        Thu, 11 Feb 2021 14:01:49 +0000 (UTC)
Received: from horse.redhat.com (ovpn-115-229.rdu2.redhat.com [10.10.115.229])
        by smtp.corp.redhat.com (Postfix) with ESMTP id D4BAE72FAF;
        Thu, 11 Feb 2021 14:01:47 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
        id 40F14220BCF; Thu, 11 Feb 2021 09:01:47 -0500 (EST)
Date:   Thu, 11 Feb 2021 09:01:47 -0500
From:   Vivek Goyal <vgoyal@redhat.com>
To:     Paul Moore <paul@paul-moore.com>
Cc:     selinux@vger.kernel.org, linux-unionfs@vger.kernel.org,
        Stephen Smalley <stephen.smalley.work@gmail.com>,
        Eric Paris <eparis@parisplace.org>,
        Miklos Szeredi <miklos@szeredi.hu>,
        Daniel J Walsh <dwalsh@redhat.com>,
        Ondrej Mosnacek <omosnace@redhat.com>,
        Amir Goldstein <amir73il@gmail.com>,
        Giuseppe Scrivano <gscrivan@redhat.com>
Subject: Re: [PATCH] selinux: Allow context mounts for unpriviliged overlayfs
Message-ID: <20210211140147.GA5014@redhat.com>
References: <20210209200233.GF3171@redhat.com>
 <CAHC9VhQYE3ga53AiK2r-568_=2U0BJe+L4g9U_J0dLinzJqXYA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHC9VhQYE3ga53AiK2r-568_=2U0BJe+L4g9U_J0dLinzJqXYA@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Wed, Feb 10, 2021 at 06:50:57PM -0500, Paul Moore wrote:
> On Tue, Feb 9, 2021 at 3:02 PM Vivek Goyal <vgoyal@redhat.com> wrote:
> >
> > Now overlayfs allow unpriviliged mounts. That is root inside a non-init
> > user namespace can mount overlayfs. This was added in 5.10 kernel.

Actually this is being added in 5.11 kernel (and not 5.10 kernel).

Paul, can you please fix this while committing. If you want me to
report, let me know.

> >
> > Giuseppe tried to mount overlayfs with option "context" and it failed
> > with error -EACCESS.
> >
> > $ su test
> > $ unshare -rm
> > $ mkdir -p lower upper work merged
> > $ mount -t overlay -o lowerdir=lower,workdir=work,upperdir=upper,userxattr,context='system_u:object_r:container_file_t:s0' none merged
> >
> > This fails with -EACCESS. It works if option "-o context" is not specified.
> >
> > Little debugging showed that selinux_set_mnt_opts() returns -EACCESS.
> >
> > So this patch adds "overlay" to the list, where it is fine to specific
> > context from non init_user_ns.
> >
> > Reported-by: Giuseppe Scrivano <gscrivan@redhat.com>
> > Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
> > ---
> >  security/selinux/hooks.c |    3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> This seems reasonable, but since we are at -rc7 this week it will need
> to wait until after the upcoming merge window.  It's too late in the
> cycle for new features.

I am fine with this going in 5.12 kernel. Thanks Paul.

Vivek

