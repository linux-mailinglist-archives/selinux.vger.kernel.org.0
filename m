Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 167813EA57F
	for <lists+selinux@lfdr.de>; Thu, 12 Aug 2021 15:22:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237795AbhHLNWp (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Thu, 12 Aug 2021 09:22:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237643AbhHLNVM (ORCPT
        <rfc822;selinux@vger.kernel.org>); Thu, 12 Aug 2021 09:21:12 -0400
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B89D4C00E950
        for <selinux@vger.kernel.org>; Thu, 12 Aug 2021 06:20:16 -0700 (PDT)
Received: by mail-oi1-x232.google.com with SMTP id r5so10237272oiw.7
        for <selinux@vger.kernel.org>; Thu, 12 Aug 2021 06:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lB6q3c4Wmh3uvBuIuG47VXVqAooxwHSnLYneeUyxAUM=;
        b=TArFBgU3nh7vQeLYQh6OOEngBWLLQ4HFkSnHrCriuFApi6IybOZzfuat0qfSQhabkx
         fcVTurD5ssxsYAAvDwKhsV/FvqaCcoAzGHs+HxA1qIpqm0cdsvAWQsLIgu54/aCuIMsI
         2rHcw61SCBsjY6CgHVIXm7ewP/FCdGJyiyDd0lplbPi4l0DZMuGc8nQaafAXxmKiEnfk
         gvbWRFR2HPnW3gOESXuKPyh3s1Zinqf/q00/A8dKf6RoErAI40OyaaBstEQXjiDd0n4G
         WbEp2npWqcRdtR2mTRu5MM0wdhdt57wFbaV8q2gxclSFwxo5OmIflRBzpbigBdpdbHSD
         W7Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lB6q3c4Wmh3uvBuIuG47VXVqAooxwHSnLYneeUyxAUM=;
        b=pAuHrf58+l48EORwfH14SJo+8s7jxStDlzdDL6OVtv9eHPGeGx9O8ZjVtgsvgi8q//
         zV8xW7pZrxplHfywGjA0KsObPpZdAlBMyZPtQg1kEiuy6O9TENRjOjPy/455L3SqSYRJ
         VXGzyUXJDSiu71hI/VkWix2kSKXzSVrEcnOcIYOixA142bFugN0eVeE5E69lWGd6bCr6
         hckMAN/WW6KtfahQ1vFwRBRItpPeVuPlHOFp/nP6SlHoDRG6y4NkwY7Z8xbhJizvCltD
         WgOh1kYb87PzPOcpi4pSv5lTC0qfBNGycXzTea9K3BC3cAw9k2nUynOAM+XOROaAaBNi
         3pdg==
X-Gm-Message-State: AOAM5318rK33B9A4mIImd9G6opZzMY7h/V3G8MlZ+60XuWwJE/h+MjD+
        qwOi2jNY6bV8500PrOQgARD6jVcZISOvdTLQuI2eCZ52JyA=
X-Google-Smtp-Source: ABdhPJyJknQoog9ghF7kdgmmRHtzCHlpNNE7r1wZVambgtS1+lAjg9oYpGEcr5yMufO0MwNji96zXQy/8HliuexcNd8=
X-Received: by 2002:a05:6808:13c7:: with SMTP id d7mr11667772oiw.138.1628774416090;
 Thu, 12 Aug 2021 06:20:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210811210440.744101-1-jwcart2@gmail.com> <87pmuj3xq2.fsf@defensec.nl>
In-Reply-To: <87pmuj3xq2.fsf@defensec.nl>
From:   James Carter <jwcart2@gmail.com>
Date:   Thu, 12 Aug 2021 09:20:05 -0400
Message-ID: <CAP+JOzShx=m-VPTqJktEPXrvX4uEqWiZO3OBjPJbhYm7AFQaLw@mail.gmail.com>
Subject: Re: [PATCH] libsepol/cil: Allow some duplicate macro and block declarations
To:     Dominick Grift <dominick.grift@defensec.nl>
Cc:     SElinux list <selinux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Thu, Aug 12, 2021 at 3:53 AM Dominick Grift
<dominick.grift@defensec.nl> wrote:
>
> James Carter <jwcart2@gmail.com> writes:
>
> > The commit d155b410d4bbc90d28f361b966f0429598da8188 (libsepol/cil:
> > Check for duplicate blocks, optionals, and macros) added checks when
> > copying blocks, macros, and optionals so that a duplicate would cause
> > an exit with an error. Unfortunately, some policies exist that depend
> > on this behavior when using inheritance.
>
> Thanks. This resolved my issues.
>
> We should probably document this behavior.
>

Yes, you are right, we do need to document this behavior.

Thanks for testing the patch.
Jim

> >
> > The behavior is as follows.
> >
> > For macros only the first declared macro matters.
> > ;
> > (macro m ((type ARG1))
> >   (allow ARG1 self (CLASS (PERM1)))
> > )
> > (block b
> >   (macro m ((type ARG1))
> >     (allow ARG1 self (CLASS (PERM2)))
> >   )
> > )
> > (blockinherit b)
> > (type t)
> > (call m (t))
> > ;
> > For this policy segment, the macro m in block b will not be called.
> > Only the original macro m will be.
> >
> > This behavior has been used to override macros that are going to
> > be inherited. Only the inherited macros that have not already been
> > declared in the destination namespace will be used.
> >
> > Blocks seem to work fine even though there are two of them
> > ;
> > (block b1
> >   (blockinherit b2)
> >   (block b
> >     (type t1)
> >     (allow t1 self (CLASS (PERM)))
> >   )
> > )
> > (block b2
> >   (block b
> >     (type t2)
> >     (allow t2 self (CLASS (PERM)))
> >   )
> > )
> > (blockinherit b1)
> > ;
> > In this example, the blockinherit of b2 will cause there to be
> > two block b's in block b1. Note that if both block b's tried to
> > declare the same type, then that would be an error. The blockinherit
> > of b1 will copy both block b's.
> >
> > This behavior has been used to allow the use of in-statements for
> > a block that is being inherited. Since the in-statements are resolved
> > before block inheritance, this only works if a block with the same
> > name as the block to be inherited is declared in the namespace.
> >
> > To support the use of these two behaviors, allow duplicate blocks
> > and macros when they occur as the result of block inheritance. In
> > any other circumstances and error for a redeclaration will be given.
> >
> > Since the duplicate macro is not going to be used it is just skipped.
> > The duplicate block will use the datum of the original block. In both
> > cases a warning message will be produced (it will only be seen if
> > "-v" is used when compiling the policy).
> >
> > Signed-off-by: James Carter <jwcart2@gmail.com>
> > ---
> >  libsepol/cil/src/cil_copy_ast.c | 69 ++++++++++++++++++++++++---------
> >  1 file changed, 50 insertions(+), 19 deletions(-)
> >
> > diff --git a/libsepol/cil/src/cil_copy_ast.c b/libsepol/cil/src/cil_copy_ast.c
> > index 9c0231f2..67be2ec8 100644
> > --- a/libsepol/cil/src/cil_copy_ast.c
> > +++ b/libsepol/cil/src/cil_copy_ast.c
> > @@ -43,6 +43,7 @@
> >  #include "cil_verify.h"
> >
> >  struct cil_args_copy {
> > +     struct cil_tree_node *orig_dest;
> >       struct cil_tree_node *dest;
> >       struct cil_db *db;
> >  };
> > @@ -101,17 +102,23 @@ int cil_copy_block(__attribute__((unused)) struct cil_db *db, void *data, void *
> >       struct cil_block *orig = data;
> >       char *key = orig->datum.name;
> >       struct cil_symtab_datum *datum = NULL;
> > -     struct cil_block *new;
> >
> >       cil_symtab_get_datum(symtab, key, &datum);
> >       if (datum != NULL) {
> > -             cil_tree_log(NODE(datum), CIL_ERR, "Re-declaration of %s %s", cil_node_to_string(NODE(datum)), key);
> > -             return SEPOL_ERR;
> > +             if (FLAVOR(datum) != CIL_BLOCK) {
> > +                     cil_tree_log(NODE(orig), CIL_ERR, "Block %s being copied", key);
> > +                     cil_tree_log(NODE(datum), CIL_ERR, "  Conflicts with %s already declared", cil_node_to_string(NODE(datum)));
> > +                     return SEPOL_ERR;
> > +             }
> > +             cil_tree_log(NODE(orig), CIL_WARN, "Block %s being copied", key);
> > +             cil_tree_log(NODE(datum), CIL_WARN, "  Previously declared", key);
> > +             *copy = datum;
> > +     } else {
> > +             struct cil_block *new;
> > +             cil_block_init(&new);
> > +             *copy = new;
> >       }
> >
> > -     cil_block_init(&new);
> > -     *copy = new;
> > -
> >       return SEPOL_OK;
> >  }
> >
> > @@ -1511,21 +1518,26 @@ int cil_copy_macro(__attribute__((unused)) struct cil_db *db, void *data, void *
> >       struct cil_macro *orig = data;
> >       char *key = orig->datum.name;
> >       struct cil_symtab_datum *datum = NULL;
> > -     struct cil_macro *new;
> >
> >       cil_symtab_get_datum(symtab, key, &datum);
> >       if (datum != NULL) {
> > -             cil_tree_log(NODE(datum), CIL_ERR, "Re-declaration of %s %s", cil_node_to_string(NODE(datum)), key);
> > -             return SEPOL_ERR;
> > -     }
> > -
> > -     cil_macro_init(&new);
> > -     if (orig->params != NULL) {
> > -             cil_copy_list(orig->params, &new->params);
> > +             if (FLAVOR(datum) != CIL_MACRO) {
> > +                     cil_tree_log(NODE(orig), CIL_ERR, "Macro %s being copied", key);
> > +                     cil_tree_log(NODE(datum), CIL_ERR, "  Conflicts with %s already declared", cil_node_to_string(NODE(datum)));
> > +                     return SEPOL_ERR;
> > +             }
> > +             cil_tree_log(NODE(orig), CIL_WARN, "Skipping macro %s", key);
> > +             cil_tree_log(NODE(datum), CIL_WARN, "  Previously declared");
> > +             *copy = NULL;
> > +     } else {
> > +             struct cil_macro *new;
> > +             cil_macro_init(&new);
> > +             if (orig->params != NULL) {
> > +                     cil_copy_list(orig->params, &new->params);
> > +             }
> > +             *copy = new;
> >       }
> >
> > -     *copy = new;
> > -
> >       return SEPOL_OK;
> >  }
> >
> > @@ -1700,7 +1712,7 @@ int cil_copy_src_info(__attribute__((unused)) struct cil_db *db, void *data, voi
> >       return SEPOL_OK;
> >  }
> >
> > -int __cil_copy_node_helper(struct cil_tree_node *orig, __attribute__((unused)) uint32_t *finished, void *extra_args)
> > +int __cil_copy_node_helper(struct cil_tree_node *orig, uint32_t *finished, void *extra_args)
> >  {
> >       int rc = SEPOL_ERR;
> >       struct cil_tree_node *parent = NULL;
> > @@ -2005,6 +2017,16 @@ int __cil_copy_node_helper(struct cil_tree_node *orig, __attribute__((unused)) u
> >
> >       rc = (*copy_func)(db, orig->data, &data, symtab);
> >       if (rc == SEPOL_OK) {
> > +             if (orig->flavor == CIL_MACRO && data == NULL) {
> > +                     /* Skipping macro re-declaration */
> > +                     if (args->orig_dest->flavor != CIL_BLOCKINHERIT) {
> > +                             cil_log(CIL_ERR, "  Re-declaration of macro is only allowed when inheriting a block\n");
> > +                             return SEPOL_ERR;
> > +                     }
> > +                     *finished = CIL_TREE_SKIP_HEAD;
> > +                     return SEPOL_OK;
> > +             }
> > +
> >               cil_tree_node_init(&new);
> >
> >               new->parent = parent;
> > @@ -2013,7 +2035,15 @@ int __cil_copy_node_helper(struct cil_tree_node *orig, __attribute__((unused)) u
> >               new->flavor = orig->flavor;
> >               new->data = data;
> >
> > -             if (orig->flavor >= CIL_MIN_DECLARATIVE) {
> > +             if (orig->flavor == CIL_BLOCK && DATUM(data)->nodes->head != NULL) {
> > +                     /* Duplicate block */
> > +                     if (args->orig_dest->flavor != CIL_BLOCKINHERIT) {
> > +                             cil_log(CIL_ERR, "  Re-declaration of block is only allowed when inheriting a block\n");
> > +                             rc = SEPOL_ERR;
> > +                             goto exit;
> > +                     }
> > +                     cil_list_append(DATUM(new->data)->nodes, CIL_NODE, new);
> > +             } else if (orig->flavor >= CIL_MIN_DECLARATIVE) {
> >                       /* Check the flavor of data if was found in the destination symtab */
> >                       if (DATUM(data)->nodes->head && FLAVOR(data) != orig->flavor) {
> >                               cil_tree_log(orig, CIL_ERR, "Incompatible flavor when trying to copy %s", DATUM(data)->name);
> > @@ -2098,12 +2128,13 @@ int cil_copy_ast(struct cil_db *db, struct cil_tree_node *orig, struct cil_tree_
> >       int rc = SEPOL_ERR;
> >       struct cil_args_copy extra_args;
> >
> > +     extra_args.orig_dest = dest;
> >       extra_args.dest = dest;
> >       extra_args.db = db;
> >
> >       rc = cil_tree_walk(orig, __cil_copy_node_helper, NULL,  __cil_copy_last_child_helper, &extra_args);
> >       if (rc != SEPOL_OK) {
> > -             cil_log(CIL_INFO, "cil_tree_walk failed, rc: %d\n", rc);
> > +             cil_tree_log(dest, CIL_ERR, "Failed to copy %s to %s", cil_node_to_string(orig), cil_node_to_string(dest));
> >               goto exit;
> >       }
>
> --
> gpg --locate-keys dominick.grift@defensec.nl
> Key fingerprint = FCD2 3660 5D6B 9D27 7FC6  E0FF DA7E 521F 10F6 4098
> https://sks-keyservers.net/pks/lookup?op=get&search=0xDA7E521F10F64098
> Dominick Grift
