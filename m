Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A623A277EA6
	for <lists+selinux@lfdr.de>; Fri, 25 Sep 2020 05:45:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726773AbgIYDpB (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Thu, 24 Sep 2020 23:45:01 -0400
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:38169 "EHLO
        wout4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726738AbgIYDpA (ORCPT
        <rfc822;selinux@vger.kernel.org>); Thu, 24 Sep 2020 23:45:00 -0400
X-Greylist: delayed 428 seconds by postgrey-1.27 at vger.kernel.org; Thu, 24 Sep 2020 23:45:00 EDT
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
        by mailout.west.internal (Postfix) with ESMTP id 437547BA;
        Thu, 24 Sep 2020 23:44:59 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Thu, 24 Sep 2020 23:44:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=themaw.net; h=
        message-id:subject:from:to:cc:date:in-reply-to:references
        :content-type:mime-version:content-transfer-encoding; s=fm1; bh=
        UYLYj2YIQ3K6uoXwT47NWuhJE0lOkU8zfvPESblngjI=; b=nw9Du8cB54e8uMD+
        6rkQVfn5oZAbbQFaFVHn2zjn7IrI9CZ0s49a0S8XdFAjPMrcGQ/oOIjy1Cz9Yhd2
        caviN/xiguLEFUFCnXi2ViCjH79q+cgrVum9OR+7JOU4VmT3ev0GrKj8HBSSnJdK
        k+4VlfeUNy1v2d9iotyw3wpU8HcEOrEBl1pqD/yUsGJEn0/5tQzONqFNPZU2iTxg
        V8gY56ByJm1D9n/RhWzPSq7NUrcPBhXmlyLSc34RTTNO1I8njGSHaccgcLKHoVsT
        Xcyf4aMiQFrwalvRRY0oJhVXhtDlndeTIV/zu29sq9X8w9uwvE4ZLFKk8srwv5Tm
        fjXsiA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; bh=UYLYj2YIQ3K6uoXwT47NWuhJE0lOkU8zfvPESblng
        jI=; b=szOjxxuTINrpNMvLMlQMjuO3/ua8HylBo0bF3uzj0Dp4PEEjn6MQyiNPu
        5zJu7pjrSvpvS+vodeDdOlfe2YrWzWzdSO9kJpFsXXBIN/S7AIdEC+OtdNC+Qw8K
        82pyPvYLe1K96MEtJFQRx8cs1A5KuerX0k/31zXumtYHnBV1JbncOmtOSsq/jR09
        0Xpt3AgpQRAOfmFHOt4ZlSncNNesoSsAIunWOgk3frTbJidA53Gp4vmy8zWDMoqC
        xfmy+dvNEwS0gRkmJKf/TNJrdlIgRsaakKG22mAJLTJA4wTwUTW8CJalPzGRKmOI
        sM8S6BHyZEyDOJ52SZfQiSQ+a8Jcw==
X-ME-Sender: <xms:umdtX1h3NJpVnD8PfnM1JKcEiJd9uVPYncMJFAjHXVYAZvI4O4SRdA>
    <xme:umdtX6D8pWj3uLrv1tQPtXGM1kKqXNBMPgvIplwQ25S5rnsa4NpbNSXHdhijoshAh
    e25iERUObtS>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudelgdeilecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefkuffhvfffjghftggfggfgsehtjeertddtreejnecuhfhrohhmpefkrghnucfm
    vghnthcuoehrrghvvghnsehthhgvmhgrfidrnhgvtheqnecuggftrfgrthhtvghrnhepfe
    efteetvdeguddvveefveeftedtffduudehueeihfeuvefgveehffeludeggfejnecukfhp
    pedutdeirdeiledrvdehgedrudehtdenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
    grmhepmhgrihhlfhhrohhmpehrrghvvghnsehthhgvmhgrfidrnhgvth
X-ME-Proxy: <xmx:umdtX1GohErjhIgWglYHcorADWz1MOclEi4v1PqTM6ZFM90AyKzonw>
    <xmx:umdtX6TcQ5cNEWmWbP7y_QDIBdyIuYq_xtpcb-fg2GXJdi9jdxLFJw>
    <xmx:umdtXywOlDs9TDlEo4erJH6F8tz2k--PJxsxfiHzmqRI8-knSVSqNw>
    <xmx:umdtX5rsuTT9HUW-xez9ym1YSsF3CH4DMkLsFA9dxBbu3B4LoeqVNA>
Received: from mickey.themaw.net (106-69-254-150.dyn.iinet.net.au [106.69.254.150])
        by mail.messagingengine.com (Postfix) with ESMTPA id EAB8F3064680;
        Thu, 24 Sep 2020 23:44:54 -0400 (EDT)
Message-ID: <572454eeca528478826d2943ce62b588f9ae203a.camel@themaw.net>
Subject: Re: Commit 13c164b1a186 - regression for LSMs/SELinux?
From:   Ian Kent <raven@themaw.net>
To:     Stephen Smalley <stephen.smalley.work@gmail.com>,
        Ondrej Mosnacek <omosnace@redhat.com>
Cc:     Al Viro <viro@zeniv.linux.org.uk>, Christoph Hellwig <hch@lst.de>,
        autofs@vger.kernel.org,
        Linux Security Module list 
        <linux-security-module@vger.kernel.org>,
        SElinux list <selinux@vger.kernel.org>,
        Zdenek Pytela <zpytela@redhat.com>,
        Linus Torvalds <torvalds@linux-foundation.org>
Date:   Fri, 25 Sep 2020 11:44:51 +0800
In-Reply-To: <8d771a45debc94f6401266c05f7634b6a867177f.camel@themaw.net>
References: <CAFqZXNsoXr1eA4C8==Nvujs5ONpRnuSqaOQQ0n78R=Dbm-EFGA@mail.gmail.com>
         <20200921160922.GA23870@lst.de>
         <20200921163011.GZ3421308@ZenIV.linux.org.uk>
         <CAFqZXNsBqvCj0NjEd9+C0H1EPjz7Fst296AA5eOFSVx=SKjfOg@mail.gmail.com>
         <0764629d33d151aee743d0429ac87a5b0c300235.camel@themaw.net>
         <CAFqZXNsqD73hptXxBn+g98ngbFd=Sx+CghtwVqM+NC47VFZhVQ@mail.gmail.com>
         <CAEjxPJ4oZvtqUpW0bMzoZwVsi9kDvL5LtouHQZAO7gM7_qyHMg@mail.gmail.com>
         <8d771a45debc94f6401266c05f7634b6a867177f.camel@themaw.net>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Fri, 2020-09-25 at 11:37 +0800, Ian Kent wrote:
> On Thu, 2020-09-24 at 10:16 -0400, Stephen Smalley wrote:
> > On Thu, Sep 24, 2020 at 4:36 AM Ondrej Mosnacek <
> > omosnace@redhat.com>
> > wrote:
> > > On Wed, Sep 23, 2020 at 3:55 AM Ian Kent <raven@themaw.net>
> > > wrote:
> > > > On Tue, 2020-09-22 at 09:33 +0200, Ondrej Mosnacek wrote:
> > > > > On Mon, Sep 21, 2020 at 6:30 PM Al Viro <
> > > > > viro@zeniv.linux.org.uk>
> > > > > wrote:
> > > > > > On Mon, Sep 21, 2020 at 06:09:22PM +0200, Christoph Hellwig
> > > > > > wrote:
> > > > > > > [adding Linus and Al]
> > > > > > > 
> > > > > > > On Mon, Sep 21, 2020 at 04:51:35PM +0200, Ondrej Mosnacek
> > > > > > > wrote:
> > > > > > > > Hi folks,
> > > > > > > > 
> > > > > > > > It seems that after commit 13c164b1a186 ("autofs:
> > > > > > > > switch
> > > > > > > > to
> > > > > > > > kernel_write") there is now an extra LSM permission
> > > > > > > > required
> > > > > > > > (for the
> > > > > > > > current task to write to the automount pipe) for
> > > > > > > > processes
> > > > > > > > accessing
> > > > > > > > some yet-to-to-be mounted directory on which an autofs
> > > > > > > > mount is
> > > > > > > > set
> > > > > > > > up. The call chain is:
> > > > > > > > [...]
> > > > > > > > autofs_wait() ->
> > > > > > > > autofs_notify_daemon() ->
> > > > > > > > autofs_write() ->
> > > > > > > > kernel_write() ->
> > > > > > > > rw_verify_area() ->
> > > > > > > > security_file_permission()
> > > > > > > > 
> > > > > > > > The bug report that led me to this commit is at [1].
> > > > > > > > 
> > > > > > > > Technically, this is a regression for LSM users, since
> > > > > > > > this is
> > > > > > > > a
> > > > > > > > kernel-internal operation and an LSM permission for the
> > > > > > > > current
> > > > > > > > task
> > > > > > > > shouldn't be required. Can this patch be reverted?
> > > > > > > > Perhaps
> > > > > > > > __kernel_{read|write}() could instead be renamed to
> > > > > > > > kernel_*_nocheck()
> > > > > > > > so that the name is more descriptive?
> > > > > > > 
> > > > > > > So we obviously should not break existing user space and
> > > > > > > need to
> > > > > > > fix
> > > > > > > this ASAP.  The trivial "fix" would be to export
> > > > > > > __kernel_write
> > > > > > > again
> > > > > > > and switch autofs to use it.  The other option would be a
> > > > > > > FMODE
> > > > > > > flag
> > > > > > > to bypass security checks, only to be set if the callers
> > > > > > > ensures
> > > > > > > they've been valided (i.e. in autofs_prepare_pipe).
> > > > > 
> > > > > IMHO that sounds like an overkill in this scenario. I don't
> > > > > think it
> > > > > makes sense to do the LSM check here (or at least not against
> > > > > the
> > > > > current task's creds), because it is not the current task
> > > > > that
> > > > > wants
> > > > > to communicate with the daemon, it just wants to to access
> > > > > some
> > > > > directory on the system that just happens to be special to
> > > > > the
> > > > > kernel,
> > > > > which needs to do some communication on the side to service
> > > > > this
> > > > > request. So if we do want to do any LSM check here, there
> > > > > should at
> > > > > least be some "bool internal" flag passed to the LSM,
> > > > > signalizing
> > > > > that
> > > > > this is an internal read/write operation that wasn't directly
> > > > > initiated/requested by the current process. SELinux could
> > > > > then
> > > > > either
> > > > > use the kernel secid instead of the current task's secid or
> > > > > skip the
> > > > > check completely in such case.
> > > > 
> > > > Perhaps, but see below.
> > > > 
> > > > > I'd like Stephen to weigh in on this, but it looks he might
> > > > > be
> > > > > on
> > > > > vacation right now...
> > > > > 
> > > > > > > Any opinions?
> > > > > > 
> > > > > > Reexport for now.  Incidentally, what is LSM doing
> > > > > > rejecting
> > > > > > writes
> > > > > > into a pipe?
> > > > > 
> > > > > With SELinux at least, what is allowed or denied is defined
> > > > > in
> > > > > the
> > > > > policy. And the policy usually defaults to everything denied
> > > > > and then
> > > > > you add rules to allow what needs (and makes sense) to be
> > > > > allowed.
> > > > > Since until kernel 5.8 random processes didn't need to write
> > > > > to
> > > > > pipes
> > > > > created by the automount daemon, it has never been explicitly
> > > > > allowed
> > > > > and so the automounting now fails. It is in no way obvious
> > > > > that
> > > > > all
> > > > > processes should have the permission to talk to the automount
> > > > > daemon
> > > > > just to traverse the filesystem...
> > > > 
> > > > I think you might have misunderstood what lead to this, just a
> > > > bit.
> > > > 
> > > > Previously the __kern_write() function was used for this
> > > > communication
> > > > and Christoph's patch changed that to use kern_write() instead.
> > > > 
> > > > In theory that's a good idea because kern_write() adds some
> > > > additional
> > > > sanity checks, one being a call to rw_verify_area() which is
> > > > where the
> > > > security_file_permission() call fails.
> > > > 
> > > > So previously any random process could avoid these checks by
> > > > calling
> > > > __kern_write() so the change to kern_write() is, in theory,
> > > > that's a
> > > > good thing and simply reverting that hunk in Christoph's patch
> > > > probably isn't the best thing to do.
> > > 
> > > I understand that and I'm not proposing the revert as a long-term
> > > fix.
> > > For a long-term solution I propose using kernel_write() and
> > > extending
> > > it to allow the caller to suppress (just) the
> > > security_file_permission() call. Then each caller would have to
> > > decide
> > > whether the LSM check makes sense in that situation or not. It
> > > seems
> > > safer against future mistakes than leaving it up to the caller to
> > > call
> > > security_file_permission() explicitly (I predict that no new user
> > > would even realize that the call might be needed).
> > > 
> > > > But any random process does need to be able to write to the
> > > > automount
> > > > daemon pipe for trailing path components and the root dentry of
> > > > autofs
> > > > mounts, depending on case.
> > > > 
> > > > So it's true that any write to any autofs dentry probably
> > > > doesn't
> > > > need to be allowed but I question what that gets us in terms of
> > > > security improvement over allowing pipe writes for automount_t
> > > > labelled pipes in selinux policy since they must be within an
> > > > autofs
> > > > mounted file system.
> > > 
> > > The difference is not in security, but in usability. The kernel
> > > communicating with the autofs daemon is an internal detail that
> > > shouldn't need special rules in policy. Even if we want to do any
> > > LSM
> > > checking here, the subject should be kernel_t, not the current
> > > running
> > > process. The process doesn't have any control on whether the
> > > kernel
> > > does the communication and it doesn't control the content of the
> > > communication, so the permission check as it is doesn't make any
> > > sense. People writing the policy should be burdened by low-level
> > > details about how the kernel works internally as little as
> > > possible.
> > > 
> > > > But Stephen has a different recommendation (and that appears to
> > > > consider the cause I outlined above) so I'll wait to see what
> > > > others
> > > > think about the recommendations.
> > > 
> > > As I said above, I think Stephen's approach is less future-proof.
> > > And
> > > it seems that rw_verify_area() has many other callers, most/all
> > > of
> > > which probably service actual requests from userspace and we'd
> > > need
> > > to
> > > retain the security_file_permission() call in those cases.
> > > 
> > > Let me try to put my proposal into a patch, so we have something
> > > concrete to talk about...
> > 
> > Up-thread I thought Linus indicated he didn't really want a flag to
> > disable pemission checking due to potential abuse (and I agree).
> > Historically we have taken one of two approaches for these
> > situations:
> > 1) Provide a separate interface like kernel_write() for use when we
> > don't want permission checking and don't have it call the security
> > hook at all.  If you prefer kernel_write_nosec() that's fine but I
> > think that's somewhat implicit in the fact that it is a
> > kernel-initiated write, not a userspace write (which would
> > hopefully
> > go through vfs_write() or similar and end up calling the hook).
> > 2) Temporarily override creds to the init_cred or the result of
> > prepare_kernel_creds() before calling any credential-checking
> > functions and then revert creds afterward.
> > 
> > The problem with #2 is that it still requires that the policy allow
> > kernel_t (or its equivalent) to be able to write to these pipes,
> > which
> > wasn't previously necessary and thus might not be allowed in all
> > policies (e.g. Android?).  #1 avoids any need for policy for these
> > operations.
> 
> There is a third option, that's actually to revert only the autofs
> change and forgo the couple of extra checks we get from kern_write().
> 
> My recommendation of keeping the change and documenting the behaviour
> via security policy includes the implicit assumption that there are
> no other cases of this.
> 
> If that wasn't the case then changing the kernel functions or (likely
> better option of) simply using __kern_write() in those cases would be
> the better choice IMHO.

Oh wait, that is essentially option one after re-reading Stephens
comment again ...


