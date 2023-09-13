Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 69E9979F090
	for <lists+selinux@lfdr.de>; Wed, 13 Sep 2023 19:46:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231526AbjIMRq0 (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Wed, 13 Sep 2023 13:46:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231452AbjIMRqZ (ORCPT
        <rfc822;selinux@vger.kernel.org>); Wed, 13 Sep 2023 13:46:25 -0400
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E54B819BB
        for <selinux@vger.kernel.org>; Wed, 13 Sep 2023 10:46:21 -0700 (PDT)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-5924093a9b2so888607b3.2
        for <selinux@vger.kernel.org>; Wed, 13 Sep 2023 10:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1694627181; x=1695231981; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0rAjF4LhtdLaI9RXtmV+TNTtCFAloczNHFo4emLf7hI=;
        b=fLUh5y+3uCffnkGreN6T1KVxy5t1w0EmmX+Srm4dcGEjxn/EvnlYfvCLaEAZFUG2rw
         Uoms1NfHR/UH0utNW6EUbvkihMmYDaRxjKtwqejQqSOPIgDDT6+4M5tJr0dkYIToflj8
         7bsaNFNqptJUz9xCXxPx4GKpH6XdQJLq85QsCZIfEKKaa+uPfOn63c9+6WLEVM4LWQPn
         NB5ZPWLNptuYtkS65t0wBtTL0Jodj7tZifkE1eZwzOLP89SNu24vCBMIzvVlYNkszFf3
         5T50TOfoaFrFiCPIyAgzujvgwJDjZyhN6NEF2FPlnWxfhmLdQtapBn3MzFWGNS3dSEHV
         OvvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694627181; x=1695231981;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0rAjF4LhtdLaI9RXtmV+TNTtCFAloczNHFo4emLf7hI=;
        b=BrcP/yXtZ2uf7fqX7CiAdBUhneHa8jiyT8nydRaMDjwGz+DgSADMrP2qXMu7NLRjEp
         SQUeBa1SF+P3domM6iuB+uCp9RlWsLWCJDTo6wypZgzeLO1bgiuwxhfohgVR8F1Q2++4
         Ho+F8v/rFcuplX9/LOdvwcFsBY2n4XHIHWJ82O/SDhkP0cc4DZ/uaSnHcH2VnLO67cmC
         IbTKXR0PzkZUC+vMgtuxPFAzJcNayNh0uxz0MEwqcu19tBAgsofsjr6eyv/nXP4ktMVY
         QJmynNJnw7FYyns/U3QNy17GQCR92sJ1l/amE3eZMSm3KlN9OwOolrUeiAm8JSp3wUEA
         maag==
X-Gm-Message-State: AOJu0YzwgbRN2QQJ3NspnUnGkQbTjpubRItIXMTVUsKMqL/kmHzU6JgS
        MVOVpXQcGlJfE5TFoYhQuQzb2Kw9roLqR8USCbai
X-Google-Smtp-Source: AGHT+IEcQ7YUx53xPdhufgWCS1R0Jw297fj8GL2vljjt3scAQXKeaKl1n1oJzB2Gh90UjFE04WZhp0Hy0kARe4yEB3w=
X-Received: by 2002:a0d:d456:0:b0:59b:52d6:9a34 with SMTP id
 w83-20020a0dd456000000b0059b52d69a34mr3109595ywd.11.1694627181097; Wed, 13
 Sep 2023 10:46:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230818151220.166215-1-cgzones@googlemail.com>
 <20230818151220.166215-5-cgzones@googlemail.com> <CAEjxPJ53LiT79=0L81QVgmfW+yKC6Fyq=sd0o1xF8ginCQjSew@mail.gmail.com>
In-Reply-To: <CAEjxPJ53LiT79=0L81QVgmfW+yKC6Fyq=sd0o1xF8ginCQjSew@mail.gmail.com>
From:   Paul Moore <paul@paul-moore.com>
Date:   Wed, 13 Sep 2023 13:46:10 -0400
Message-ID: <CAHC9VhRskKj7LyPDv99zvwmuWYhNqKmTsNYsMyi38mX3zgm+Cw@mail.gmail.com>
Subject: Re: [PATCH 6/6] selinux: improve symtab string hashing
To:     Stephen Smalley <stephen.smalley.work@gmail.com>
Cc:     =?UTF-8?Q?Christian_G=C3=B6ttsche?= <cgzones@googlemail.com>,
        selinux@vger.kernel.org, Eric Paris <eparis@parisplace.org>,
        Ondrej Mosnacek <omosnace@redhat.com>,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Thu, Sep 7, 2023 at 1:44=E2=80=AFPM Stephen Smalley
<stephen.smalley.work@gmail.com> wrote:
> On Fri, Aug 18, 2023 at 11:12=E2=80=AFAM Christian G=C3=B6ttsche
> <cgzones@googlemail.com> wrote:
> >
> > The number of buckets is calculated by performing a binary AND against
> > the mask of the hash table, which is one less than its size (which is a
> > power of two).  This leads to all top bits being discarded, requiring
> > for short or similar inputs a hash function with a good avalanche
> > effect.
> >
> > Use djb2a:
> >
> >     # current
> >     common prefixes:  7 entries and 5/8 buckets used, longest chain len=
gth 2, sum of chain length^2 11
> >     classes:  134 entries and 100/256 buckets used, longest chain lengt=
h 5, sum of chain length^2 234
> >     roles:  15 entries and 6/16 buckets used, longest chain length 5, s=
um of chain length^2 57
> >     types:  4448 entries and 3016/8192 buckets used, longest chain leng=
th 41, sum of chain length^2 14922
> >     users:  7 entries and 3/8 buckets used, longest chain length 3, sum=
 of chain length^2 17
> >     bools:  306 entries and 221/512 buckets used, longest chain length =
4, sum of chain length^2 524
> >     levels:  1 entries and 1/1 buckets used, longest chain length 1, su=
m of chain length^2 1
> >     categories:  1024 entries and 400/1024 buckets used, longest chain =
length 4, sum of chain length^2 2740
> >
> >     # patch
> >     common prefixes:  7 entries and 5/8 buckets used, longest chain len=
gth 2, sum of chain length^2 11
> >     classes:  134 entries and 101/256 buckets used, longest chain lengt=
h 3, sum of chain length^2 210
> >     roles:  15 entries and 9/16 buckets used, longest chain length 3, s=
um of chain length^2 31
> >     types:  4448 entries and 3459/8192 buckets used, longest chain leng=
th 5, sum of chain length^2 6778
> >     users:  7 entries and 5/8 buckets used, longest chain length 3, sum=
 of chain length^2 13
> >     bools:  306 entries and 236/512 buckets used, longest chain length =
5, sum of chain length^2 470
> >     levels:  1 entries and 1/1 buckets used, longest chain length 1, su=
m of chain length^2 1
> >     categories:  1024 entries and 518/1024 buckets used, longest chain =
length 7, sum of chain length^2 2992
> >
> > Signed-off-by: Christian G=C3=B6ttsche <cgzones@googlemail.com>
> > ---
> >  security/selinux/ss/symtab.c | 18 ++++++++----------
> >  1 file changed, 8 insertions(+), 10 deletions(-)
> >
> > diff --git a/security/selinux/ss/symtab.c b/security/selinux/ss/symtab.=
c
> > index 43d7f0319ccd..b6761b96eee4 100644
> > --- a/security/selinux/ss/symtab.c
> > +++ b/security/selinux/ss/symtab.c
> > @@ -11,16 +11,14 @@
> >
> >  static unsigned int symhash(const void *key)
> >  {
> > -       const char *p, *keyp;
> > -       unsigned int size;
> > -       unsigned int val;
> > -
> > -       val =3D 0;
> > -       keyp =3D key;
> > -       size =3D strlen(keyp);
> > -       for (p =3D keyp; (p - keyp) < size; p++)
> > -               val =3D (val << 4 | (val >> (8*sizeof(unsigned int)-4))=
) ^ (*p);
> > -       return val;
> > +       /* djb2a */
>
> Do we need/want something that specifies the author/license (I assume
> public domain) of this code?

It would be a good idea, yes.  I spent some time looking around, and
while there are many references to djb2 (and the djb2a xor version), I
had a hard time finding an explicit license statement from DJB.
However, in the cdb v0.75 release there is a source file, cdb_hash.c,
which has effectively the same hash (same algorithm, different
implementation) with a "/* Public domain. */" statement at the top.
IANAL, but I think that is good enough.

Christian, can you update this patch comments with this info?

http://cr.yp.to/cdb.html

> > +       unsigned int hash =3D 5381;
> > +       unsigned char c;
> > +
> > +       while ((c =3D *(const unsigned char *)key++))
> > +               hash =3D ((hash << 5) + hash) ^ c;
> > +
> > +       return hash;
> >  }
> >
> >  static int symcmp(const void *key1, const void *key2)
> > --
> > 2.40.1

--=20
paul-moore.com
