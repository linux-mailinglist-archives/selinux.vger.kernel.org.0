Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 263392D6B18
	for <lists+selinux@lfdr.de>; Fri, 11 Dec 2020 00:38:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394192AbgLJWbY (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Thu, 10 Dec 2020 17:31:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:38809 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2405130AbgLJW03 (ORCPT
        <rfc822;selinux@vger.kernel.org>); Thu, 10 Dec 2020 17:26:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1607639102;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Fj9fVsZwFzNBajnKQY8dqzOVQ+aAkCpyFLDSXEQ7naY=;
        b=fUY+nnJbeJDTwwKjHsrqNeFdl1YeY4bg6J9lOMCof/Kj9ofyt8Rqyv5kD488Al8FE1z10u
        X037eVY6MzVxcsHkql38ugDUBi0KIzUZ/0ya/vMoiUCp/M4Ctm6Mg3/DW13lwsGmY3Gpcj
        5GHr9ywQbOZDg5XbRCLrJ0liegNEtKQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-419-FKrioB_gMM-OCVDfA8lbPA-1; Thu, 10 Dec 2020 17:17:56 -0500
X-MC-Unique: FKrioB_gMM-OCVDfA8lbPA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BFB4B107ACF5;
        Thu, 10 Dec 2020 22:17:54 +0000 (UTC)
Received: from horse.redhat.com (ovpn-116-241.rdu2.redhat.com [10.10.116.241])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 525A85C8AA;
        Thu, 10 Dec 2020 22:17:54 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
        id D7F22220BCF; Thu, 10 Dec 2020 17:17:53 -0500 (EST)
Date:   Thu, 10 Dec 2020 17:17:53 -0500
From:   Vivek Goyal <vgoyal@redhat.com>
To:     Ondrej Mosnacek <omosnace@redhat.com>
Cc:     Paul Moore <paul@paul-moore.com>, James Carter <jwcart2@gmail.com>,
        SElinux list <selinux@vger.kernel.org>,
        Stephen Smalley <stephen.smalley.work@gmail.com>,
        Daniel Walsh <dwalsh@redhat.com>,
        Zdenek Pytela <zpytela@redhat.com>
Subject: Re: virtiofs and its optional xattr support vs. fs_use_xattr
Message-ID: <20201210221753.GB185111@redhat.com>
References: <CAFqZXNsGabHBfV36nNAVLJgEzjkBev-O3YZ1vnmXyVoaDdjiHQ@mail.gmail.com>
 <CAP+JOzSWW6HFtN1VSyvKacKeZdtRkBo7TWR7JS4a0ewiopuKww@mail.gmail.com>
 <CAHC9VhSYt86rQJGg9JFD1ubL4N3PNmLg02sACOvRNHr94=41dg@mail.gmail.com>
 <CAP+JOzQ-s9ASgqFt7HVyY1R7JKQ85Ee-=iou0C5xRRvaSZo52Q@mail.gmail.com>
 <CAHC9VhQkSA5VteHfu8TyBp7wqDspoLCOP+sB7vaV4XCQ8vwBeA@mail.gmail.com>
 <CAFqZXNsfomoMTr+uhisdsj75c7ZdXmGCiDZBsDwtLUpkwEA76w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFqZXNsfomoMTr+uhisdsj75c7ZdXmGCiDZBsDwtLUpkwEA76w@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Thu, Dec 10, 2020 at 10:29:02AM +0100, Ondrej Mosnacek wrote:
> On Thu, Dec 10, 2020 at 3:40 AM Paul Moore <paul@paul-moore.com> wrote:
> > On Wed, Dec 9, 2020 at 10:37 AM James Carter <jwcart2@gmail.com> wrote:
> > > On Tue, Dec 8, 2020 at 6:45 PM Paul Moore <paul@paul-moore.com> wrote:
> > > > On Mon, Dec 7, 2020 at 12:17 PM James Carter <jwcart2@gmail.com> wrote:
> > > > > On Mon, Dec 7, 2020 at 9:45 AM Ondrej Mosnacek <omosnace@redhat.com> wrote:
> > > > > >
> > > > > > Hi everyone,
> > > > > >
> > > > > > In [1] we ran into a problem with the current handling of filesystem
> > > > > > labeling rules. Basically, it is only possible to specify either
> > > > > > genfscon or fs_use_xattr for a given filesystem, but in the case of
> > > > > > virtiofs, certain mounts may support security xattrs, while other ones
> > > > > > may not.
> > > > > >
> > > > > > So we can't use the xattr support by adding fs_use_xattr virtiofs
> > > > > > (...); to the policy, because then a non-xattr mount will fail
> > > > > > (SELinux does a mount-time check on the root inode to make sure that
> > > > > > the xattr handler works), but we also don't want to stay on genfscon,
> > > > > > because then we can't relabel files.
> > > > > >
> > > > > > So my question is how to best address this? One option is to use a
> > > > > > similar "hack" as for cgroupfs; i.e. do a kind of mixed genfs-xattr
> > > > > > labeling, but that's ugly and requires hard-coding another FS name in
> > > > > > the selinux code. The only other alternative I could come up with is
> > > > > > to add a new FS labeling statement that would specify some kind of
> > > > > > mixed genfscon / fs_use_xattr behavior. That would be a better
> > > > > > long-term solution, but leads to more questions on how such statement
> > > > > > should actually work... Should it work the cgroupfs way, giving a
> > > > > > default label to everything and allowing to set/change labels via
> > > > > > xattrs? Or should it rather just detect xattrs support and switch
> > > > > > between SECURITY_FS_USE_XATTR and SECURITY_FS_USE_GENFS behavior based
> > > > > > on that? In the latter case, should the statement specify two contexts
> > > > > > (one for fs_use_xattr and another one for genfscon) or just one for
> > > > > > both behaviors?
> > > > >
> > > > > I don't think adding a new statement is necessary. It seems like
> > > > > allowing both fs_use_xattr and genfscon rules for the filesystem in
> > > > > policy and then using the fs_use_xattr rule if xattrs are supported
> > > > > while falling back to the genfscon rule if they are not would do what
> > > > > you need.
> > > >
> > > > That seems reasonable to me so long as this ambiguity is okay with the
> > > > folks who do policy analysis.  Thinking quickly I'm not sure why it
> > > > would be a problem, but the thought did occur while I was typing up
> > > > this reply ...
> > >
> > > I don't think that it would cause a problem with policy analysis. I
> > > think that you would just assume the genfscon rule is being used,
> > > since it is less fine-grained. It wouldn't be much different from how
> > > booleans are handled.
> >
> > Makes sense to me.  Thanks Jim.
> 
> Okay, so I'll look into switching between use_xattr and use_genfs
> based on the availability of xattr support and the presence of
> corresponding rules in the policy. Thanks everyone for the fruitful
> discussion!

Hi Ondrej,

So this is now purely a policy change and no changes required in kernel?
If yes, then the patch Dan Walsh proposed, is that good enough or
it needs to be done in a different way.

Thanks
Vivek

