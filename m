Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2FEEB7EE2D3
	for <lists+selinux@lfdr.de>; Thu, 16 Nov 2023 15:31:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230030AbjKPObI (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Thu, 16 Nov 2023 09:31:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229562AbjKPObH (ORCPT
        <rfc822;selinux@vger.kernel.org>); Thu, 16 Nov 2023 09:31:07 -0500
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25622182;
        Thu, 16 Nov 2023 06:31:03 -0800 (PST)
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-5bdb0be3591so695061a12.2;
        Thu, 16 Nov 2023 06:31:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700145062; x=1700749862; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yZrBdEfRtcMzg4FNBtXal6+L9u7KqK/1Zsh9vyn/+eI=;
        b=ku/Uqn79wWU/BsTQXyKyCk6za48oSUKBl+DV3BnTGs7QHlSROLklPxX8tx2yRE9dTk
         Qg/90xC0rnz8Z/1vKkqJUghXCoKk49AWOoNAK31G1UmK1XfURFULk6OPmZocXX77Zqad
         UIO7LEYDs564In5keFGUZrpl+SDWp0kKQDa/wkVOO8jDQON08p52i6GmkbQb+g4P+naG
         fMnJbvUJCXbltpdAGg8t1yhuIWUH8VcnNZg9t4muS6NmUyKqj47LPCet8vBPXKYMaY+S
         6LXPYtdR69xWZ/7HfqMWjkrJtxzK4a1Am5S3zrD/aYfb384mRHPsxCqAwwLCV7OzuVX7
         KJCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700145062; x=1700749862;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yZrBdEfRtcMzg4FNBtXal6+L9u7KqK/1Zsh9vyn/+eI=;
        b=X/0vrzwaUANlTOKsnrOpjmFpn+Pq4ZFYfhPdO5gfGqvyCSX157KkiuUx0gw2UA910P
         KSKPn+4SOV8z/rLJD8+Cv2i5p8gQ+uJ7NahnJqV/Xoi1lDezLpMGxmT0FmKYWcrxqM5X
         jVGdAjIM4HuHWZnIcj1H8B1R8xwOIwzeRyWlgA+GmdAdRyZ9CdEnCrnPj4vSuzO9XoPl
         Hm0rVHRB+hbfkdYjeUemkVM2Hp0esgKChwTlW9EI9gsET4cDH/umweX9VPNfvqx9h3ou
         ecBzq7jsfBkSvw038Edr0LmqZm8zbbWSrQI9omCF4EPTGgCSFKQ7KYgin51qEIgEarl0
         4YWw==
X-Gm-Message-State: AOJu0YzRzpmHvuhtJ9u4UdkWLDSj1A+8TOB8OSndPp9cc+e2TkkHkDIq
        wtUWRq6nHdbwpeqkgXEbHl2V4f3OLDFNbC1rm9Q=
X-Google-Smtp-Source: AGHT+IGk07vXIuijIon4E9WyjJOCuPdifH9cDKGcddyeaaqIcZqem5qgbH9FT3y1BQLddOMx3Qzd4v6kspbE8GYB6FE=
X-Received: by 2002:a17:90b:4a0e:b0:280:46ac:be71 with SMTP id
 kk14-20020a17090b4a0e00b0028046acbe71mr18416376pjb.15.1700145061930; Thu, 16
 Nov 2023 06:31:01 -0800 (PST)
MIME-Version: 1.0
References: <20231016220835.GH800259@ZenIV> <CAHC9VhTzEiKixwpKuit0CBq3S5F-CX3bT1raWdK8UPuN3xS-Bw@mail.gmail.com>
 <CAEjxPJ4FD4m7wEO+FcH+=LyH2inTZqxi1OT5FkUH485s+cqM2Q@mail.gmail.com>
 <CAHC9VhQQ-xbV-dVvTm26LaQ8F+0iW+Z0SMXdZ9MeDBJ7z2x4xg@mail.gmail.com>
 <CAEjxPJ5YiW62qQEfpEDfSrav_43J7SeYYbBqV8YPRdpqBizAQw@mail.gmail.com> <CAEjxPJ5rL9aYxZq8nbB-gBfmNUM_s6+h8Q7C2jYYyP5M9O6z3Q@mail.gmail.com>
In-Reply-To: <CAEjxPJ5rL9aYxZq8nbB-gBfmNUM_s6+h8Q7C2jYYyP5M9O6z3Q@mail.gmail.com>
From:   Stephen Smalley <stephen.smalley.work@gmail.com>
Date:   Thu, 16 Nov 2023 09:30:50 -0500
Message-ID: <CAEjxPJ7-YtZSpiN63Gjc_zmnSh8yzH-iW_YkOnwbYNF0uNLPCA@mail.gmail.com>
Subject: Re: [PATCH][RFC] selinuxfs: saner handling of policy reloads
To:     Paul Moore <paul@paul-moore.com>
Cc:     Al Viro <viro@zeniv.linux.org.uk>,
        Christian Brauner <brauner@kernel.org>,
        selinux@vger.kernel.org, linux-fsdevel@vger.kernel.org,
        Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Thu, Nov 16, 2023 at 8:16=E2=80=AFAM Stephen Smalley
<stephen.smalley.work@gmail.com> wrote:
>
> On Wed, Nov 15, 2023 at 8:35=E2=80=AFAM Stephen Smalley
> <stephen.smalley.work@gmail.com> wrote:
> >
> > On Tue, Nov 14, 2023 at 5:24=E2=80=AFPM Paul Moore <paul@paul-moore.com=
> wrote:
> > >
> > > On Tue, Nov 14, 2023 at 3:57=E2=80=AFPM Stephen Smalley
> > > <stephen.smalley.work@gmail.com> wrote:
> > > > On Mon, Nov 13, 2023 at 11:19=E2=80=AFAM Paul Moore <paul@paul-moor=
e.com> wrote:
> > > > > On Mon, Oct 16, 2023 at 6:08=E2=80=AFPM Al Viro <viro@zeniv.linux=
.org.uk> wrote:
> > > > > >
> > > > > > [
> > > > > > That thing sits in viro/vfs.git#work.selinuxfs; I have
> > > > > > lock_rename()-related followups in another branch, so a pull wo=
uld be more
> > > > > > convenient for me than cherry-pick.  NOTE: testing and comments=
 would
> > > > > > be very welcome - as it is, the patch is pretty much untested b=
eyond
> > > > > > "it builds".
> > > > > > ]
> > > > >
> > > > > Hi Al,
> > > > >
> > > > > I will admit to glossing over the comment above when I merged thi=
s
> > > > > into the selinux/dev branch last night.  As it's been a few weeks=
, I'm
> > > > > not sure if the comment above still applies, but if it does let m=
e
> > > > > know and I can yank/revert the patch in favor of a larger pull.  =
Let
> > > > > me know what you'd like to do.
> > > >
> > > > Seeing this during testsuite runs:
> > > >
> > > > [ 3550.206423] SELinux:  Converting 1152 SID table entries...
> > > > [ 3550.666195] ------------[ cut here ]------------
> > > > [ 3550.666201] WARNING: CPU: 3 PID: 12300 at fs/inode.c:330 drop_nl=
ink+0x57/0x70
> > >
> > > How are you running the test suite Stephen?  I haven't hit this in my
> > > automated testing and I did another test run manually to make sure I
> > > wasn't missing it and everything ran clean.
> > >
> > > I'm running the latest selinux-testsuite on a current Rawhide system
> > > with kernel 6.7.0-0.rc1.20231114git9bacdd89.17.1.secnext.fc40 (curren=
t
> > > Rawhide kernel + the LSM, SELinux, and audit dev trees).
> >
> > Technically this was with a kernel built from your dev branch plus
> > Ondrej's selinux: introduce an initial SID for early boot processes
> > patch, but I don't see how the latter could introduce such a bug. Will
> > retry without it.
>
> Reproduced without Ondrej's patch; the trick seems to be accessing
> selinuxfs files during the testsuite run (likely interleaving with
> policy reloads).
> while true; do cat /sys/fs/selinux/initial_contexts/kernel ; done &
> while running the testsuite seems to trigger.
> Could also try while true; do sudo load_policy; done & in parallel
> with the above loop.
> In any event, will retry with Al's updated branch with the fix he propose=
d.

So far not showing up with Al's updated for-selinux branch. Difference
between that and your dev branch for selinuxfs is what he showed
earlier in the thread (pardon the whitespace damage):
diff --git a/security/selinux/selinuxfs.c b/security/selinux/selinuxfs.c
index 36dc656a642a..0619a1cbbfbe 100644
--- a/security/selinux/selinuxfs.c
+++ b/security/selinux/selinuxfs.c
@@ -1960,6 +1960,7 @@ static struct dentry *sel_make_swapover_dir(struct su=
per_b
lock *sb,
        inc_nlink(inode);
        inode_lock(sb->s_root->d_inode);
        d_add(dentry, inode);
+       inc_nlink(sb->s_root->d_inode);
        inode_unlock(sb->s_root->d_inode);
        return dentry;
 }
