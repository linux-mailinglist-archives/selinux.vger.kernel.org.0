Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD1451BC3A1
	for <lists+selinux@lfdr.de>; Tue, 28 Apr 2020 17:28:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728292AbgD1P20 (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Tue, 28 Apr 2020 11:28:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728021AbgD1P2Z (ORCPT
        <rfc822;selinux@vger.kernel.org>); Tue, 28 Apr 2020 11:28:25 -0400
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com [IPv6:2607:f8b0:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF14FC03C1AB
        for <selinux@vger.kernel.org>; Tue, 28 Apr 2020 08:28:24 -0700 (PDT)
Received: by mail-ot1-x341.google.com with SMTP id z17so33344541oto.4
        for <selinux@vger.kernel.org>; Tue, 28 Apr 2020 08:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RDVLZ42T8MWQVI8G4TIeuPxacytMUi3puuREXNsFY48=;
        b=Ledm+n/Y06BSa1QIkwBuyYd2UytE7a9mi61ypYtwbTI/k6WH1t3zN11e5YB0mNmm2F
         aQizKf4o/6hIiit4MY6jVeoq/itR3HLrToOgVxizXU7vSIWWUJggf67WkK5NjVhYjzNH
         nCgztnmQXtONo2eXVL41zH0lIB/Jg3YJKXCcJYTKbsAi7YEBfDEKdrgJhi/MVNUYIeSZ
         PRqZ/zv5wjo0jreai9dRByt59xNsab8RYDxObm1Z32KgfJcDeLTH8ybYbPYAG8Zsj0St
         dylB5Wl05ubQtBCisVlgzG53cl0qxzC5gHMbq75J1waIXWDj1NX7ZEcfYNCyihHZDx7j
         R08A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RDVLZ42T8MWQVI8G4TIeuPxacytMUi3puuREXNsFY48=;
        b=NUqubqGwweu88IW5PMtmZ2tMyHeH1fn1xUX53NqPKagM7qrTmh3fj16dAUj5Whkvys
         BNqcrJGIdhDWjSlu4OP5PU349ExbIO4Gp8K59aTBnD6fJXc9ofiD4gDMyYCKPa+WC1i5
         p7VXPvg7klJdURpMHtybcSiuNZjdw/mCZk+2g6lM38EKgLWUqbsmt/DbiJGOvjAwNlqr
         O8ux8jSUjMxy0Xp5kyqgH+tMvs0xpkQ1Si+rOUYFiip0uGV4UvEd5pmNWJ25V/gRDrW0
         ASBLcXKbVMxrTwRKbTT8O2+6C+U4QVkV/Fetd/LW6ugTuT2wF64C+c6T2qqOTy1unJMy
         Cysw==
X-Gm-Message-State: AGi0PuY6pGJr0pbF++MteJZAyXVho61crbOrK6SbOnV9Jv5Ao4gFR4rJ
        MaeM/+SVUZ0dW4Pr5Ei71jOWJ1mfy2uAwX94aDscEtYN
X-Google-Smtp-Source: APiQypK2V5L8i8vasVG8qoKODNounCoVMYxwiubVm1ixIqOk5HfP3mmo+Gx4SXzaGoAmbMe8d8nnFn/UUGP5oWeaeSk=
X-Received: by 2002:a05:6830:1c2b:: with SMTP id f11mr24239297ote.196.1588087704019;
 Tue, 28 Apr 2020 08:28:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200328124550.199568-1-omosnace@redhat.com> <20200328124550.199568-3-omosnace@redhat.com>
 <CAP+JOzTu=ziLHGgFfu6Do_yXV3eWQDA2hUEenYHP3StT64R=Bg@mail.gmail.com>
 <CAP+JOzRYAJgb3BZTJ5wodkat7kyqRED__Wp7oW6n-2Lj6J4yqQ@mail.gmail.com> <CAFqZXNsqfDw1SuW+69L776iw_J6CKKsrSjEivVnG_T3X20HXOA@mail.gmail.com>
In-Reply-To: <CAFqZXNsqfDw1SuW+69L776iw_J6CKKsrSjEivVnG_T3X20HXOA@mail.gmail.com>
From:   James Carter <jwcart2@gmail.com>
Date:   Tue, 28 Apr 2020 11:28:12 -0400
Message-ID: <CAP+JOzQMofOxLTSpDipzh52sWnKQT6bQ4dmY-AD_5NN=67mx4g@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] libsepol: implement POLICYDB_VERSION_COMP_FTRANS
To:     Ondrej Mosnacek <omosnace@redhat.com>
Cc:     SElinux list <selinux@vger.kernel.org>,
        Stephen Smalley <sds@tycho.nsa.gov>,
        Chris PeBenito <pebenito@ieee.org>
Content-Type: text/plain; charset="UTF-8"
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Tue, Apr 28, 2020 at 4:49 AM Ondrej Mosnacek <omosnace@redhat.com> wrote:
>
> On Mon, Apr 27, 2020 at 9:39 PM James Carter <jwcart2@gmail.com> wrote:
> > On Tue, Mar 31, 2020 at 4:30 PM James Carter <jwcart2@gmail.com> wrote:
> > >
> > > On Sat, Mar 28, 2020 at 8:46 AM Ondrej Mosnacek <omosnace@redhat.com> wrote:
> > > >
> > > > Implement a new, more space-efficient form of storing filename
> > > > transitions in the binary policy. The internal structures have already
> > > > been converted to this new representation; this patch just implements
> > > > reading/writing an equivalent representation from/to the binary policy.
> > > >
> > > > This new format reduces the size of Fedora policy from 7.6 MB to only
> > > > 3.3 MB (with policy optimization enabled in both cases). With the
> > > > unconfined module disabled, the size is reduced from 3.3 MB to 2.4 MB.
> > > >
> > > > Signed-off-by: Ondrej Mosnacek <omosnace@redhat.com>
> > >
> > > Acked-by: James Carter <jwcart2@gmail.com>
> > >
> >
> > Sorry, it has been a while.
>
> No problem. I would've merged it myself, I just wasn't sure if we
> shouldn't try to do something about the setools issue somehow... But I
> really don't feel like touching that code, so if the consensus is that
> this is worth the breakage then I'm fine with it :)
>

I thought the consensus was to apply this now, but it would be nice to
not break setools, so I am going to hold off merging for day or two
and take a look at how much work it would be to export what setools
needs.

> >
> > I was going to merge these today, but upon further testing, I noticed
> > a couple of problems.
> >
> > First, creating a policy.conf from a binary like this:
> > ~/local/usr/bin/checkpolicy -F -M -b -o policy.31.conf policy.31
> > give the following error:
> > libsepol.avtab_read_item: invalid item count
>
> Hm... I can't reproduce that on my side. Are you sure you're not using
> a broken policy generated by the buggy v1 of this series?
>

No, it wasn't that. It turns out that I didn't do "make clean" between
building master and building the branch with this patch series. I
don't see any problems now.

Jim

> >
> > Second, creating a binary from a policy.conf and then trying to create
> > a policy.conf from that binary:
> > ~/local/usr/bin/checkpolicy -o policy.bin policy.conf
> > ~/local/usr/bin/checkpolicy -F -b -o policy.bin.conf policy.bin
> > gives the following error:
> > security: ebitmap: high bit (32) is not a multiple of the map size (64)
>
> Likewise, couldn't reproduce it with the conf file I tried... Can you
> share the policy.conf that triggers this?
>
> >
> > I don't know if this is related to the problems you had on the kernel
> > side or not. I'll keep looking into this, but, for now, I'll have to
> > remove my Acked-by.
> >
> > Jim
> >
> >
> > > > ---
> > > >  libsepol/include/sepol/policydb/policydb.h |   3 +-
> > > >  libsepol/src/policydb.c                    | 218 +++++++++++++++++----
> > > >  libsepol/src/write.c                       |  72 ++++++-
> > > >  3 files changed, 242 insertions(+), 51 deletions(-)
> > > >
> > > > diff --git a/libsepol/include/sepol/policydb/policydb.h b/libsepol/include/sepol/policydb/policydb.h
> > > > index c3180c61..9ef43abc 100644
> > > > --- a/libsepol/include/sepol/policydb/policydb.h
> > > > +++ b/libsepol/include/sepol/policydb/policydb.h
> > > > @@ -755,10 +755,11 @@ extern int policydb_set_target_platform(policydb_t *p, int platform);
> > > >  #define POLICYDB_VERSION_XPERMS_IOCTL  30 /* Linux-specific */
> > > >  #define POLICYDB_VERSION_INFINIBAND            31 /* Linux-specific */
> > > >  #define POLICYDB_VERSION_GLBLUB                32
> > > > +#define POLICYDB_VERSION_COMP_FTRANS   33 /* compressed filename transitions */
> > > >
> > > >  /* Range of policy versions we understand*/
> > > >  #define POLICYDB_VERSION_MIN   POLICYDB_VERSION_BASE
> > > > -#define POLICYDB_VERSION_MAX   POLICYDB_VERSION_GLBLUB
> > > > +#define POLICYDB_VERSION_MAX   POLICYDB_VERSION_COMP_FTRANS
> > > >
> > > >  /* Module versions and specific changes*/
> > > >  #define MOD_POLICYDB_VERSION_BASE              4
> > > > diff --git a/libsepol/src/policydb.c b/libsepol/src/policydb.c
> > > > index 6b121d66..18ce1912 100644
> > > > --- a/libsepol/src/policydb.c
> > > > +++ b/libsepol/src/policydb.c
> > > > @@ -200,6 +200,13 @@ static struct policydb_compat_info policydb_compat[] = {
> > > >          .ocon_num = OCON_IBENDPORT + 1,
> > > >          .target_platform = SEPOL_TARGET_SELINUX,
> > > >         },
> > > > +       {
> > > > +        .type = POLICY_KERN,
> > > > +        .version = POLICYDB_VERSION_COMP_FTRANS,
> > > > +        .sym_num = SYM_NUM,
> > > > +        .ocon_num = OCON_IBENDPORT + 1,
> > > > +        .target_platform = SEPOL_TARGET_SELINUX,
> > > > +       },
> > > >         {
> > > >          .type = POLICY_BASE,
> > > >          .version = MOD_POLICYDB_VERSION_BASE,
> > > > @@ -2661,73 +2668,202 @@ int policydb_filetrans_insert(policydb_t *p, uint32_t stype, uint32_t ttype,
> > > >         return ebitmap_set_bit(&datum->stypes, stype - 1, 1);
> > > >  }
> > > >
> > > > -int filename_trans_read(policydb_t *p, struct policy_file *fp)
> > > > +static int filename_trans_read_one_old(policydb_t *p, struct policy_file *fp)
> > > >  {
> > > > -       unsigned int i;
> > > > -       uint32_t buf[4], nel, len, stype, ttype, tclass, otype;
> > > > +       uint32_t buf[4], len, stype, ttype, tclass, otype;
> > > > +       char *name = NULL;
> > > >         int rc;
> > > > -       char *name;
> > > >
> > > >         rc = next_entry(buf, fp, sizeof(uint32_t));
> > > >         if (rc < 0)
> > > >                 return -1;
> > > > -       nel = le32_to_cpu(buf[0]);
> > > > +       len = le32_to_cpu(buf[0]);
> > > > +       if (zero_or_saturated(len))
> > > > +               return -1;
> > > >
> > > > -       for (i = 0; i < nel; i++) {
> > > > -               name = NULL;
> > > > +       name = calloc(len + 1, sizeof(*name));
> > > > +       if (!name)
> > > > +               return -1;
> > > >
> > > > -               rc = next_entry(buf, fp, sizeof(uint32_t));
> > > > -               if (rc < 0)
> > > > -                       goto err;
> > > > -               len = le32_to_cpu(buf[0]);
> > > > -               if (zero_or_saturated(len))
> > > > +       rc = next_entry(name, fp, len);
> > > > +       if (rc < 0)
> > > > +               goto err;
> > > > +
> > > > +       rc = next_entry(buf, fp, sizeof(uint32_t) * 4);
> > > > +       if (rc < 0)
> > > > +               goto err;
> > > > +
> > > > +       stype  = le32_to_cpu(buf[0]);
> > > > +       ttype  = le32_to_cpu(buf[1]);
> > > > +       tclass = le32_to_cpu(buf[2]);
> > > > +       otype  = le32_to_cpu(buf[3]);
> > > > +
> > > > +       rc = policydb_filetrans_insert(p, stype, ttype, tclass, name, &name,
> > > > +                                      otype, NULL);
> > > > +       if (rc) {
> > > > +               if (rc != SEPOL_EEXIST)
> > > >                         goto err;
> > > > +               /*
> > > > +                * Some old policies were wrongly generated with
> > > > +                * duplicate filename transition rules.  For backward
> > > > +                * compatibility, do not reject such policies, just
> > > > +                * issue a warning and ignore the duplicate.
> > > > +                */
> > > > +               WARN(fp->handle,
> > > > +                    "Duplicate name-based type_transition %s %s:%s \"%s\":  %s, ignoring",
> > > > +                    p->p_type_val_to_name[stype - 1],
> > > > +                    p->p_type_val_to_name[ttype - 1],
> > > > +                    p->p_class_val_to_name[tclass - 1],
> > > > +                    name,
> > > > +                    p->p_type_val_to_name[otype - 1]);
> > > > +               /* continue, ignoring this one */
> > > > +       }
> > > > +       free(name);
> > > > +       return 0;
> > > > +err:
> > > > +       free(name);
> > > > +       return -1;
> > > > +}
> > > > +
> > > > +static int filename_trans_check_datum(filename_trans_datum_t *datum)
> > > > +{
> > > > +       ebitmap_t stypes, otypes;
> > > > +
> > > > +       ebitmap_init(&stypes);
> > > > +       ebitmap_init(&otypes);
> > > > +
> > > > +       while (datum) {
> > > > +               if (ebitmap_get_bit(&otypes, datum->otype))
> > > > +                       return -1;
> > > > +
> > > > +               if (ebitmap_set_bit(&otypes, datum->otype, 1))
> > > > +                       return -1;
> > > >
> > > > -               name = calloc(len + 1, sizeof(*name));
> > > > -               if (!name)
> > > > +               if (ebitmap_match_any(&stypes, &datum->stypes))
> > > > +                       return -1;
> > > > +
> > > > +               if (ebitmap_union(&stypes, &datum->stypes))
> > > > +                       return -1;
> > > > +       }
> > > > +       return 0;
> > > > +}
> > > > +
> > > > +static int filename_trans_read_one_new(policydb_t *p, struct policy_file *fp)
> > > > +{
> > > > +       filename_trans_key_t *ft = NULL;
> > > > +       filename_trans_datum_t **dst, *datum, *first = NULL;
> > > > +       unsigned int i;
> > > > +       uint32_t buf[3], len, ttype, tclass, ndatum;
> > > > +       char *name = NULL;
> > > > +       int rc;
> > > > +
> > > > +       rc = next_entry(buf, fp, sizeof(uint32_t));
> > > > +       if (rc < 0)
> > > > +               return -1;
> > > > +       len = le32_to_cpu(buf[0]);
> > > > +       if (zero_or_saturated(len))
> > > > +               return -1;
> > > > +
> > > > +       name = calloc(len + 1, sizeof(*name));
> > > > +       if (!name)
> > > > +               return -1;
> > > > +
> > > > +       rc = next_entry(name, fp, len);
> > > > +       if (rc < 0)
> > > > +               goto err;
> > > > +
> > > > +       rc = next_entry(buf, fp, sizeof(uint32_t) * 3);
> > > > +       if (rc < 0)
> > > > +               goto err;
> > > > +
> > > > +       ttype = le32_to_cpu(buf[0]);
> > > > +       tclass = le32_to_cpu(buf[1]);
> > > > +       ndatum = le32_to_cpu(buf[2]);
> > > > +       if (ndatum == 0)
> > > > +               goto err;
> > > > +
> > > > +       dst = &first;
> > > > +       for (i = 0; i < ndatum; i++) {
> > > > +               datum = malloc(sizeof(*datum));
> > > > +               if (!datum)
> > > >                         goto err;
> > > >
> > > > -               rc = next_entry(name, fp, len);
> > > > +               *dst = datum;
> > > > +
> > > > +               /* ebitmap_read() will at least init the bitmap */
> > > > +               rc = ebitmap_read(&datum->stypes, fp);
> > > >                 if (rc < 0)
> > > >                         goto err;
> > > >
> > > > -               rc = next_entry(buf, fp, sizeof(uint32_t) * 4);
> > > > +               rc = next_entry(buf, fp, sizeof(uint32_t));
> > > >                 if (rc < 0)
> > > >                         goto err;
> > > >
> > > > -               stype  = le32_to_cpu(buf[0]);
> > > > -               ttype  = le32_to_cpu(buf[1]);
> > > > -               tclass = le32_to_cpu(buf[2]);
> > > > -               otype  = le32_to_cpu(buf[3]);
> > > > +               datum->otype = le32_to_cpu(buf[0]);
> > > >
> > > > -               rc = policydb_filetrans_insert(p, stype, ttype, tclass, name,
> > > > -                                              &name, otype, NULL);
> > > > -               if (rc) {
> > > > -                       if (rc != SEPOL_EEXIST)
> > > > -                               goto err;
> > > > -                       /*
> > > > -                        * Some old policies were wrongly generated with
> > > > -                        * duplicate filename transition rules.  For backward
> > > > -                        * compatibility, do not reject such policies, just
> > > > -                        * issue a warning and ignore the duplicate.
> > > > -                        */
> > > > -                       WARN(fp->handle,
> > > > -                            "Duplicate name-based type_transition %s %s:%s \"%s\":  %s, ignoring",
> > > > -                            p->p_type_val_to_name[stype - 1],
> > > > -                            p->p_type_val_to_name[ttype - 1],
> > > > -                            p->p_class_val_to_name[tclass - 1],
> > > > -                            name,
> > > > -                            p->p_type_val_to_name[otype - 1]);
> > > > -                       /* continue, ignoring this one */
> > > > -               }
> > > > -               free(name);
> > > > +               p->filename_trans_count += ebitmap_cardinality(&datum->stypes);
> > > > +
> > > > +               dst = &datum->next;
> > > >         }
> > > > +       *dst = NULL;
> > > > +
> > > > +       if (ndatum > 1 && filename_trans_check_datum(first))
> > > > +               goto err;
> > > > +
> > > > +       ft = malloc(sizeof(*ft));
> > > > +       if (!ft)
> > > > +               goto err;
> > > > +
> > > > +       ft->ttype = ttype;
> > > > +       ft->tclass = tclass;
> > > > +       ft->name = name;
> > > > +
> > > > +       rc = hashtab_insert(p->filename_trans, (hashtab_key_t)ft,
> > > > +                           (hashtab_datum_t)first);
> > > > +       if (rc)
> > > > +               goto err;
> > > > +
> > > >         return 0;
> > > >  err:
> > > > +       free(ft);
> > > >         free(name);
> > > > +       while (first) {
> > > > +               datum = first;
> > > > +               first = first->next;
> > > > +
> > > > +               ebitmap_destroy(&datum->stypes);
> > > > +               free(datum);
> > > > +       }
> > > >         return -1;
> > > >  }
> > > >
> > > > +int filename_trans_read(policydb_t *p, struct policy_file *fp)
> > > > +{
> > > > +       unsigned int i;
> > > > +       uint32_t buf[1], nel;
> > > > +       int rc;
> > > > +
> > > > +       rc = next_entry(buf, fp, sizeof(uint32_t));
> > > > +       if (rc < 0)
> > > > +               return -1;
> > > > +       nel = le32_to_cpu(buf[0]);
> > > > +
> > > > +       if (p->policyvers < POLICYDB_VERSION_COMP_FTRANS) {
> > > > +               for (i = 0; i < nel; i++) {
> > > > +                       rc = filename_trans_read_one_old(p, fp);
> > > > +                       if (rc < 0)
> > > > +                               return -1;
> > > > +               }
> > > > +       } else {
> > > > +               for (i = 0; i < nel; i++) {
> > > > +                       rc = filename_trans_read_one_new(p, fp);
> > > > +                       if (rc < 0)
> > > > +                               return -1;
> > > > +               }
> > > > +       }
> > > > +       return 0;
> > > > +}
> > > > +
> > > >  static int ocontext_read_xen(struct policydb_compat_info *info,
> > > >         policydb_t *p, struct policy_file *fp)
> > > >  {
> > > > diff --git a/libsepol/src/write.c b/libsepol/src/write.c
> > > > index d3aee8d5..9c74d9f5 100644
> > > > --- a/libsepol/src/write.c
> > > > +++ b/libsepol/src/write.c
> > > > @@ -569,7 +569,7 @@ static int role_allow_write(role_allow_t * r, struct policy_file *fp)
> > > >         return POLICYDB_SUCCESS;
> > > >  }
> > > >
> > > > -static int filename_write_helper(hashtab_key_t key, void *data, void *ptr)
> > > > +static int filename_write_one_old(hashtab_key_t key, void *data, void *ptr)
> > > >  {
> > > >         uint32_t bit, buf[4];
> > > >         size_t items, len;
> > > > @@ -605,6 +605,54 @@ static int filename_write_helper(hashtab_key_t key, void *data, void *ptr)
> > > >         return 0;
> > > >  }
> > > >
> > > > +static int filename_write_one_new(hashtab_key_t key, void *data, void *ptr)
> > > > +{
> > > > +       uint32_t buf[3];
> > > > +       size_t items, len, ndatum;
> > > > +       filename_trans_key_t *ft = (filename_trans_key_t *)key;
> > > > +       filename_trans_datum_t *datum;
> > > > +       void *fp = ptr;
> > > > +
> > > > +       len = strlen(ft->name);
> > > > +       buf[0] = cpu_to_le32(len);
> > > > +       items = put_entry(buf, sizeof(uint32_t), 1, fp);
> > > > +       if (items != 1)
> > > > +               return POLICYDB_ERROR;
> > > > +
> > > > +       items = put_entry(ft->name, sizeof(char), len, fp);
> > > > +       if (items != len)
> > > > +               return POLICYDB_ERROR;
> > > > +
> > > > +       ndatum = 0;
> > > > +       datum = data;
> > > > +       do {
> > > > +               ndatum++;
> > > > +               datum = datum->next;
> > > > +       } while (datum);
> > > > +
> > > > +       buf[0] = cpu_to_le32(ft->ttype);
> > > > +       buf[1] = cpu_to_le32(ft->tclass);
> > > > +       buf[2] = cpu_to_le32(ndatum);
> > > > +       items = put_entry(buf, sizeof(uint32_t), 3, fp);
> > > > +       if (items != 3)
> > > > +               return POLICYDB_ERROR;
> > > > +
> > > > +       datum = data;
> > > > +       do {
> > > > +               if (ebitmap_write(&datum->stypes, fp))
> > > > +                       return POLICYDB_ERROR;
> > > > +
> > > > +               buf[0] = cpu_to_le32(datum->otype);
> > > > +               items = put_entry(buf, sizeof(uint32_t), 1, fp);
> > > > +               if (items != 1)
> > > > +                       return POLICYDB_ERROR;
> > > > +
> > > > +               datum = datum->next;
> > > > +       } while (datum);
> > > > +
> > > > +       return 0;
> > > > +}
> > > > +
> > > >  static int filename_trans_write(struct policydb *p, void *fp)
> > > >  {
> > > >         size_t items;
> > > > @@ -614,16 +662,22 @@ static int filename_trans_write(struct policydb *p, void *fp)
> > > >         if (p->policyvers < POLICYDB_VERSION_FILENAME_TRANS)
> > > >                 return 0;
> > > >
> > > > -       buf[0] = cpu_to_le32(p->filename_trans_count);
> > > > -       items = put_entry(buf, sizeof(uint32_t), 1, fp);
> > > > -       if (items != 1)
> > > > -               return POLICYDB_ERROR;
> > > > +       if (p->policyvers < POLICYDB_VERSION_COMP_FTRANS) {
> > > > +               buf[0] = cpu_to_le32(p->filename_trans_count);
> > > > +               items = put_entry(buf, sizeof(uint32_t), 1, fp);
> > > > +               if (items != 1)
> > > > +                       return POLICYDB_ERROR;
> > > >
> > > > -       rc = hashtab_map(p->filename_trans, filename_write_helper, fp);
> > > > -       if (rc)
> > > > -               return rc;
> > > > +               rc = hashtab_map(p->filename_trans, filename_write_one_old, fp);
> > > > +       } else {
> > > > +               buf[0] = cpu_to_le32(p->filename_trans->nel);
> > > > +               items = put_entry(buf, sizeof(uint32_t), 1, fp);
> > > > +               if (items != 1)
> > > > +                       return POLICYDB_ERROR;
> > > >
> > > > -       return 0;
> > > > +               rc = hashtab_map(p->filename_trans, filename_write_one_new, fp);
> > > > +       }
> > > > +       return rc;
> > > >  }
> > > >
> > > >  static int role_set_write(role_set_t * x, struct policy_file *fp)
> > > > --
> > > > 2.25.1
> > > >
> >
>
>
> --
> Ondrej Mosnacek <omosnace at redhat dot com>
> Software Engineer, Security Technologies
> Red Hat, Inc.
>
