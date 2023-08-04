Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF3AE76F817
	for <lists+selinux@lfdr.de>; Fri,  4 Aug 2023 04:49:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230345AbjHDCtN (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Thu, 3 Aug 2023 22:49:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231496AbjHDCtH (ORCPT
        <rfc822;selinux@vger.kernel.org>); Thu, 3 Aug 2023 22:49:07 -0400
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6675D30F8
        for <selinux@vger.kernel.org>; Thu,  3 Aug 2023 19:49:06 -0700 (PDT)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-57a6df91b1eso19229767b3.1
        for <selinux@vger.kernel.org>; Thu, 03 Aug 2023 19:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1691117345; x=1691722145;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vd95Z3+osQHMY4UnbAFYs8153P0Rw3koffJjaaUVqu8=;
        b=O5PIAxBtKKdA3/fgp/239OYXj1/kQUg7Q++r9CInGzdKLwFKr+gTiZbS8b7B+GA1a+
         +w6lKrgO6e99jaHNWO95qyiHEmJTdXdQfhrikK96ZTOhXiwdQfSdD9Ne922uv79fKOoL
         nsxrPViDF3rzzdawDu9OQqtPROjsaew/xD1FxRh4jvSSB3HEW8Z5jERWH8RrNDqn4KKd
         lWPVLvDj0j3ZWqwKaUt7xyljvqQQCdL7BgC8QWdN7NEJi2/Kje19Xjt1ovNgRATq5B4P
         3nC2x1HnK1xR8EG226k74dQdv4N7FCF/H8cndOsUqQCMhq4tD1B/JCHV/0+3bF5mmqn1
         yu1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691117345; x=1691722145;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vd95Z3+osQHMY4UnbAFYs8153P0Rw3koffJjaaUVqu8=;
        b=hG0Hv1i7/SNCMvDqIMAMaPlzQAAvz5PYShKFk4fgT6GjYmuJu+lwzcgpalyjBiTxr2
         A3TWwTFnQtqyKFaF48vkIf0dv8xqNOfXnFivDsStx+RNbzWRV3VUShBlpCQ/COMXQrVx
         Xgr/hupoPIWKSTXrceYc8Ba2BRJLJV63gMCE2XtBekpyVXhmfmxU33KCua/5C+qtiSCR
         KorZOrNFPtOen7dt2VNe4cY/6DZNUrgvNLx4Alkty03iATkL2meojY/6jlS8WJ1JQTva
         gB9yDNwje/PcPiuF3+VvhCi+U13GG/M1TgA6nIApnwu4ytIlowFZVqSwgcfN24G+aXtS
         aLuw==
X-Gm-Message-State: AOJu0YwnHL98L6M8t9wOEfqSGbml10qmd10WtvXgfKQVHus+uee/6GaG
        0lWAkfiJ8dJUyqSjXGIyl5dA1Ds8ZMPSADTXBvLf
X-Google-Smtp-Source: AGHT+IHzOMv/ju9Tw8bPVPB4bGc67BfMOW+0Um7p830iso0PGeWxqbRtl37oozAHp4DGTMSMiA7RzLqc14ciUx57+XE=
X-Received: by 2002:a0d:e253:0:b0:584:189c:13ec with SMTP id
 l80-20020a0de253000000b00584189c13ecmr519784ywe.21.1691117342044; Thu, 03 Aug
 2023 19:49:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230802-master-v6-1-45d48299168b@kernel.org> <bac543537058619345b363bbfc745927.paul@paul-moore.com>
 <ca156cecbc070c3b7c68626572274806079a6e04.camel@kernel.org>
 <CAHC9VhTQDVyZewU0Oiy4AfJt_UtB7O2_-PcUmXkZtuwKDQBfXg@mail.gmail.com> <ec1fd18f271593d5c6b6813cfaeb688994f20bf4.camel@kernel.org>
In-Reply-To: <ec1fd18f271593d5c6b6813cfaeb688994f20bf4.camel@kernel.org>
From:   Paul Moore <paul@paul-moore.com>
Date:   Thu, 3 Aug 2023 22:48:50 -0400
Message-ID: <CAHC9VhSNXbJzfKLF+DjfK+_2eJYYc_AC3u3aUc_NUs_o5M5AaA@mail.gmail.com>
Subject: Re: [PATCH v6] vfs, security: Fix automount superblock LSM init
 problem, preventing NFS sb sharing
To:     Jeff Layton <jlayton@kernel.org>
Cc:     Alexander Viro <viro@zeniv.linux.org.uk>,
        Christian Brauner <brauner@kernel.org>,
        Trond Myklebust <trond.myklebust@hammerspace.com>,
        Anna Schumaker <anna@kernel.org>,
        James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>,
        Stephen Smalley <stephen.smalley.work@gmail.com>,
        Eric Paris <eparis@parisplace.org>,
        Casey Schaufler <casey@schaufler-ca.com>,
        David Howells <dhowells@redhat.com>,
        Scott Mayhew <smayhew@redhat.com>,
        Stephen Smalley <sds@tycho.nsa.gov>,
        linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-nfs@vger.kernel.org, linux-security-module@vger.kernel.org,
        selinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Thu, Aug 3, 2023 at 12:27=E2=80=AFPM Jeff Layton <jlayton@kernel.org> wr=
ote:
> On Wed, 2023-08-02 at 22:46 -0400, Paul Moore wrote:
> > On Wed, Aug 2, 2023 at 3:34=E2=80=AFPM Jeff Layton <jlayton@kernel.org>=
 wrote:
> > > On Wed, 2023-08-02 at 14:16 -0400, Paul Moore wrote:
> > > > On Aug  2, 2023 Jeff Layton <jlayton@kernel.org> wrote:

...

> > My only concern now is the fs_context::lsm_set flag.
>
> Yeah, that bit is ugly. David studied this problem a lot more than I
> have, but basically, we only want to set the context info once, and
> we're not always going to have a nice string to parse to set up the
> options. This obviously works, but I'm fine with a more elegant method
> if you can spot one.

Like I said before, sometimes making a LSM hook conditional on some
flag is the only practical solution, but I always worry that there is
a chance that a future patch might end up toggling that flag by
accident and we lose an important call into the LSM.  Even if all we
end up doing is moving the flag down into the LSMs I would be happier;
there is still a risk, but at least if something breaks it is our (the
LSM folks) own damn fault ;)

> > You didn't mention exactly why the security_sb_set_mnt_opts() was
> > failing, and requires the fs_context::lsm_set check, but my guess is
> > that something is tripping over the fact that the superblock is
> > already properly setup.  I'm working under the assumption that this
> > problem - attempting to reconfigure a properly configured superblock -
> > should only be happening in the submount/non-NULL-reference case.  If
> > it is happening elsewhere I think I'm going to need some help
> > understanding that ...
>
> Correct. When you pass in the mount options, fc->security seems to be
> properly set. NFS mounting is complex though, so the final superblock
> you care about may end up being a descendant of the one that was
> originally configured.

Ooof, okay, there goes that idea.

At this point I guess it comes back to that question of why is calling
into security_sb_set_mnt_opts() a second (or third, etc.) time failing
for you?  Is there some conflict with the superblock
config/labeling/etc.?  Is there a permissions problem?  Better
understanding why that is failing might help us come up with a better
solution.

--=20
paul-moore.com
