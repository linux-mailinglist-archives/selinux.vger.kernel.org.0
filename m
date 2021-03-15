Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB7B033C82A
	for <lists+selinux@lfdr.de>; Mon, 15 Mar 2021 22:07:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231409AbhCOVGk convert rfc822-to-8bit (ORCPT
        <rfc822;lists+selinux@lfdr.de>); Mon, 15 Mar 2021 17:06:40 -0400
Received: from mx1.polytechnique.org ([129.104.30.34]:34590 "EHLO
        mx1.polytechnique.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232784AbhCOVGj (ORCPT
        <rfc822;selinux@vger.kernel.org>); Mon, 15 Mar 2021 17:06:39 -0400
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by ssl.polytechnique.org (Postfix) with ESMTPSA id E36815650D3
        for <selinux@vger.kernel.org>; Mon, 15 Mar 2021 22:06:30 +0100 (CET)
Received: by mail-pj1-f52.google.com with SMTP id kk2-20020a17090b4a02b02900c777aa746fso254719pjb.3
        for <selinux@vger.kernel.org>; Mon, 15 Mar 2021 14:06:30 -0700 (PDT)
X-Gm-Message-State: AOAM533GINwUGcp5O8tlWGs/7bMj1EebB1MYMsbeZrHYDt+B5M+rS3SM
        SVcM6wXmIP+1V7vSTQQKry27XKMIjhjye1OpfcM=
X-Google-Smtp-Source: ABdhPJwHvSj6BcKqLg5Z9GbARk2EujhBLn9deWwBqxIEY82NiZZTk7Zc21dgcY2K1DK8p5pQHBZNPJo8eGYuSjmnOO4=
X-Received: by 2002:a17:902:f702:b029:e3:5e25:85bb with SMTP id
 h2-20020a170902f702b02900e35e2585bbmr13965878plo.56.1615842389649; Mon, 15
 Mar 2021 14:06:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210310193012.166256-1-jwcart2@gmail.com> <CAJ2a_DeSUHcBnXOTmTmexP_teYOz7Jt3zCNbKaHSS_V+fUs=EQ@mail.gmail.com>
 <CAJfZ7=nkqjKj8WqSPaTCJE6HGQvVgKPgOFxZ6OWiuVtHVwttmQ@mail.gmail.com>
In-Reply-To: <CAJfZ7=nkqjKj8WqSPaTCJE6HGQvVgKPgOFxZ6OWiuVtHVwttmQ@mail.gmail.com>
From:   Nicolas Iooss <nicolas.iooss@m4x.org>
Date:   Mon, 15 Mar 2021 22:06:18 +0100
X-Gmail-Original-Message-ID: <CAJfZ7==mTeJt-zpnqWkQSFf7heo5kkM1ZBiJQzDVOOREP3MseQ@mail.gmail.com>
Message-ID: <CAJfZ7==mTeJt-zpnqWkQSFf7heo5kkM1ZBiJQzDVOOREP3MseQ@mail.gmail.com>
Subject: Re: [PATCH] libsepol: Expand role attributes in constraint expressions
To:     =?UTF-8?Q?Christian_G=C3=B6ttsche?= <cgzones@googlemail.com>,
        James Carter <jwcart2@gmail.com>
Cc:     SElinux list <selinux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-AV-Checked: ClamAV using ClamSMTP at svoboda.polytechnique.org (Mon Mar 15 22:06:31 2021 +0100 (CET))
X-Spam-Flag: No, tests=bogofilter, spamicity=0.031028, queueID=7DDF35652A6
X-Org-Mail: nicolas.iooss.2010@polytechnique.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Sun, Mar 14, 2021 at 9:04 PM Nicolas Iooss <nicolas.iooss@m4x.org> wrote:
>
> On Wed, Mar 10, 2021 at 9:16 PM Christian Göttsche
> <cgzones@googlemail.com> wrote:
> >
> > Am Mi., 10. März 2021 um 20:30 Uhr schrieb James Carter <jwcart2@gmail.com>:
> > >
> > > When creating the kernel binary policy, role attributes in constraint
> > > expressions are not expanded. This causes the constraint expression
> > > to refer to a non-existent role in the kernel policy. This can lead
> > > to a segfault when converting the binary policy back to conf or CIL
> > > source or when using policy tools such as seinfo.
> > >
> > > Expand role attributes in constraint expressions when creating the
> > > kernel binary policy.
> >
> >
> > Thanks for the quick fix.
> > Tested role attribute constraints with bare 3.2, leading to setfiles
> > failing with `libsepol.validate_constraint_nodes: Invalid constraint
> > expr`.
> > Works fine with this patch.
> > Also seinfo does not crash on the newly generated policy anymore.
> >
> > Tested-by: Christian Göttsche <cgzones@googlemail.com>
> >
> >
> > >
> > > Reported-by: Christian Göttsche <cgzones@googlemail.com>
> > > Signed-off-by: James Carter <jwcart2@gmail.com>
>
> Acked-by: Nicolas Iooss <nicolas.iooss@m4x.org>

Merged.

Thanks,
Nicolas

> > > ---
> > >  libsepol/src/expand.c | 35 +++++++++++++++++++++++++++++++++++
> > >  1 file changed, 35 insertions(+)
> > >
> > > diff --git a/libsepol/src/expand.c b/libsepol/src/expand.c
> > > index eac7e450..2d9cb566 100644
> > > --- a/libsepol/src/expand.c
> > > +++ b/libsepol/src/expand.c
> > > @@ -71,6 +71,38 @@ static int map_ebitmap(ebitmap_t * src, ebitmap_t * dst, uint32_t * map)
> > >         return 0;
> > >  }
> > >
> > > +static int ebitmap_expand_roles(policydb_t *p, ebitmap_t *roles)
> > > +{
> > > +       ebitmap_node_t *node;
> > > +       unsigned int bit;
> > > +       role_datum_t *role;
> > > +       ebitmap_t tmp;
> > > +
> > > +       ebitmap_init(&tmp);
> > > +       ebitmap_for_each_positive_bit(roles, node, bit) {
> > > +               role = p->role_val_to_struct[bit];
> > > +               assert(role);
> > > +               if (role->flavor != ROLE_ATTRIB) {
> > > +                       if (ebitmap_set_bit(&tmp, bit, 1)) {
> > > +                               ebitmap_destroy(&tmp);
> > > +                               return -1;
> > > +                       }
> > > +               } else {
> > > +                       if (ebitmap_union(&tmp, &role->roles)) {
> > > +                               ebitmap_destroy(&tmp);
> > > +                               return -1;
> > > +                       }
> > > +               }
> > > +       }
> > > +       ebitmap_destroy(roles);
> > > +       if (ebitmap_cpy(roles, &tmp)) {
> > > +               ebitmap_destroy(&tmp);
> > > +               return -1;
> > > +       }
> > > +       ebitmap_destroy(&tmp);
> > > +       return 0;
> > > +}
> > > +
> > >  static int type_copy_callback(hashtab_key_t key, hashtab_datum_t datum,
> > >                               void *data)
> > >  {
> > > @@ -333,6 +365,9 @@ static int constraint_node_clone(constraint_node_t ** dst,
> > >                                         if (map_ebitmap(&expr->names, &new_expr->names, state->rolemap)) {
> > >                                                 goto out_of_mem;
> > >                                         }
> > > +                                       if (ebitmap_expand_roles(state->out, &new_expr->names)) {
> > > +                                               goto out_of_mem;
> > > +                                       }
> > >                                 } else if (new_expr->attr & CEXPR_USER) {
> > >                                         if (map_ebitmap(&expr->names, &new_expr->names, state->usermap)) {
> > >                                                 goto out_of_mem;
> > > --
> > > 2.26.2
> > >

