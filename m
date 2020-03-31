Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1DA66199FEE
	for <lists+selinux@lfdr.de>; Tue, 31 Mar 2020 22:28:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727955AbgCaU2m (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Tue, 31 Mar 2020 16:28:42 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:45719 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727852AbgCaU2m (ORCPT
        <rfc822;selinux@vger.kernel.org>); Tue, 31 Mar 2020 16:28:42 -0400
Received: by mail-oi1-f195.google.com with SMTP id l22so20105483oii.12
        for <selinux@vger.kernel.org>; Tue, 31 Mar 2020 13:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wVwtU0J30WUbDRuSr0R/hcDGrUyz4foHrKVvz3oLz28=;
        b=bMFASBPNpD1EjcKwpBkPMoMAVaoP0tgARFdcioW7+VEU2DKMX+jDQgHo80Ba1llxRH
         g/ePNKm1ACC3BCijRfqHq3xZSzW3JYH3mwhDN355wdrZ71HvSEpAgGVFGaom+SMvXvcq
         kHw5K0Lj3tJzRHYR2Y6UQcDnu/qSOENVZfkopZWUlWrv07LUXa/pNYHMABw3ArzRO+21
         fS21HE5i00FmntRelpkfPihir36dgi4QL3YXsfAkkd9aV5aYbjqvhuq6gn7UR2Hbnd0O
         3zfUmzLJRcbRwk3+KoazFDRB989ppozSg8LHK68G8pk3M9VwHJyYqOws9SVBXFSwW5D+
         yf1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wVwtU0J30WUbDRuSr0R/hcDGrUyz4foHrKVvz3oLz28=;
        b=i+CT3GIoVzrc1CVdEkHxS15vW8xMGujwX5g69h90uFobQvDn2poHweyTUC/CkqnDFv
         tY0lafyLNeWr5WjJKrdO/rA71lfLYuk07V7985bEB3yFRCLf10KYFA8gp6Z9Q+mg7Qpu
         c6NvAapL8ngYr7hoPhJCD8NwiBKygIDB1fYmKAetTzt6FfSBlhK6iEYRk3ChGHz1J+xC
         f8PDs8qnK6PyejjsMQqyofQkkZu+GbpKn5OLS1NjOkjerUunLNEpGKZoBas6IK+msZLD
         K8KVADdJlIsyODAaP1a3lp9YFa+coKQnX7ZrA6efC/2rWfEnGFRF+JTJQ7Vxz51MpB06
         9p2g==
X-Gm-Message-State: AGi0PuYXi7z8VeWxUfmjZaJw4rQLk1wzHAHtF9rzS3steHbntqif33jO
        bFRAvfjqrfI5+Ma71uMuKkcLbf0fcZsvisBSljCb2ji5
X-Google-Smtp-Source: APiQypK9FhwDyWtuGUmCWB3bBzGj0L6tNS26D6qB22MSJjmBuJ3AKWZqGF++edJcEeTw/Rg4OkSLCR7KT+YxmFHKyIM=
X-Received: by 2002:aca:484c:: with SMTP id v73mr486355oia.138.1585686518305;
 Tue, 31 Mar 2020 13:28:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200328124550.199568-1-omosnace@redhat.com> <20200328124550.199568-2-omosnace@redhat.com>
In-Reply-To: <20200328124550.199568-2-omosnace@redhat.com>
From:   James Carter <jwcart2@gmail.com>
Date:   Tue, 31 Mar 2020 16:30:23 -0400
Message-ID: <CAP+JOzS+iD5CqWL1-kB5RcVRrTU_qk7uEp2wVjFuyrJWYxyv0A@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] libsepol,checkpolicy: optimize storage of filename transitions
To:     Ondrej Mosnacek <omosnace@redhat.com>
Cc:     SElinux list <selinux@vger.kernel.org>,
        Stephen Smalley <sds@tycho.nsa.gov>,
        Chris PeBenito <pebenito@ieee.org>
Content-Type: text/plain; charset="UTF-8"
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Sat, Mar 28, 2020 at 8:46 AM Ondrej Mosnacek <omosnace@redhat.com> wrote:
>
> In preparation to support a new policy format with a more optimal
> representation of filename transition rules, this patch applies an
> equivalent change from kernel commit c3a276111ea2 ("selinux: optimize
> storage of filename transitions").
>
> See the kernel commit's description [1] for the rationale behind this
> representation. This change doesn't bring any measurable difference of
> policy build performance (semodule -B) on Fedora.
>
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/selinux.git/commit/?id=c3a276111ea2572399281988b3129683e2a6b60b
>
> Signed-off-by: Ondrej Mosnacek <omosnace@redhat.com>

Acked-by: James Carter <jwcart2@gmail.com>

> ---
>  checkpolicy/policy_define.c                |  52 +++------
>  checkpolicy/test/dispol.c                  |  27 +++--
>  libsepol/cil/src/cil_binary.c              |  29 ++---
>  libsepol/include/sepol/policydb/policydb.h |  15 ++-
>  libsepol/src/expand.c                      |  60 +++-------
>  libsepol/src/kernel_to_cil.c               |  24 +++-
>  libsepol/src/kernel_to_conf.c              |  24 +++-
>  libsepol/src/policydb.c                    | 126 ++++++++++++++-------
>  libsepol/src/write.c                       |  46 ++++----
>  9 files changed, 223 insertions(+), 180 deletions(-)
>
> diff --git a/checkpolicy/policy_define.c b/checkpolicy/policy_define.c
> index c6733fa4..01a90438 100644
> --- a/checkpolicy/policy_define.c
> +++ b/checkpolicy/policy_define.c
> @@ -3303,10 +3303,9 @@ int define_filename_trans(void)
>         ebitmap_t e_stypes, e_ttypes;
>         ebitmap_t e_tclasses;
>         ebitmap_node_t *snode, *tnode, *cnode;
> -       filename_trans_t *ft;
> -       filename_trans_datum_t *ftdatum;
>         filename_trans_rule_t *ftr;
>         type_datum_t *typdatum;
> +       char *dup_name;
>         uint32_t otype;
>         unsigned int c, s, t;
>         int add, rc;
> @@ -3388,40 +3387,21 @@ int define_filename_trans(void)
>         ebitmap_for_each_positive_bit(&e_tclasses, cnode, c) {
>                 ebitmap_for_each_positive_bit(&e_stypes, snode, s) {
>                         ebitmap_for_each_positive_bit(&e_ttypes, tnode, t) {
> -                               ft = calloc(1, sizeof(*ft));
> -                               if (!ft) {
> -                                       yyerror("out of memory");
> -                                       goto bad;
> -                               }
> -                               ft->stype = s+1;
> -                               ft->ttype = t+1;
> -                               ft->tclass = c+1;
> -                               ft->name = strdup(name);
> -                               if (!ft->name) {
> -                                       yyerror("out of memory");
> -                                       goto bad;
> -                               }
> -
> -                               ftdatum = hashtab_search(policydbp->filename_trans,
> -                                                        (hashtab_key_t)ft);
> -                               if (ftdatum) {
> -                                       yyerror2("duplicate filename transition for: filename_trans %s %s %s:%s",
> -                                                name,
> -                                                policydbp->p_type_val_to_name[s],
> -                                                policydbp->p_type_val_to_name[t],
> -                                                policydbp->p_class_val_to_name[c]);
> -                                       goto bad;
> -                               }
> -
> -                               ftdatum = calloc(1, sizeof(*ftdatum));
> -                               if (!ftdatum) {
> -                                       yyerror("out of memory");
> -                                       goto bad;
> -                               }
> -                               rc = hashtab_insert(policydbp->filename_trans,
> -                                                   (hashtab_key_t)ft,
> -                                                   ftdatum);
> -                               if (rc) {
> +                               dup_name = NULL;
> +                               rc = policydb_filetrans_insert(
> +                                       policydbp, s+1, t+1, c+1, name,
> +                                       &dup_name, otype, NULL
> +                               );
> +                               free(dup_name);
> +                               if (rc != SEPOL_OK) {
> +                                       if (rc == SEPOL_EEXIST) {
> +                                               yyerror2("duplicate filename transition for: filename_trans %s %s %s:%s",
> +                                                       name,
> +                                                       policydbp->p_type_val_to_name[s],
> +                                                       policydbp->p_type_val_to_name[t],
> +                                                       policydbp->p_class_val_to_name[c]);
> +                                               goto bad;
> +                                       }
>                                         yyerror("out of memory");
>                                         goto bad;
>                                 }
> diff --git a/checkpolicy/test/dispol.c b/checkpolicy/test/dispol.c
> index d72d9fb3..7c74e9cf 100644
> --- a/checkpolicy/test/dispol.c
> +++ b/checkpolicy/test/dispol.c
> @@ -329,26 +329,39 @@ static void display_role_trans(policydb_t *p, FILE *fp)
>  struct filenametr_display_args {
>         policydb_t *p;
>         FILE *fp;
> +       filename_trans_key_t *ft;
>  };
>
> -static int filenametr_display(hashtab_key_t key,
> -                             hashtab_datum_t datum,
> -                             void *ptr)
> +static int filenametr_display_sub(hashtab_key_t key,
> +                                 hashtab_datum_t datum,
> +                                 void *ptr)
>  {
> -       struct filename_trans *ft = (struct filename_trans *)key;
> -       struct filename_trans_datum *ftdatum = datum;
>         struct filenametr_display_args *args = ptr;
> +       filename_trans_key_t *ft = args->ft;
>         policydb_t *p = args->p;
>         FILE *fp = args->fp;
> +       uint32_t stype = (uintptr_t)key;
> +       uint32_t otype = (uintptr_t)datum;
>
> -       display_id(p, fp, SYM_TYPES, ft->stype - 1, "");
> +       display_id(p, fp, SYM_TYPES, stype - 1, "");
>         display_id(p, fp, SYM_TYPES, ft->ttype - 1, "");
>         display_id(p, fp, SYM_CLASSES, ft->tclass - 1, ":");
> -       display_id(p, fp, SYM_TYPES, ftdatum->otype - 1, "");
> +       display_id(p, fp, SYM_TYPES, otype - 1, "");
>         fprintf(fp, " %s\n", ft->name);
>         return 0;
>  }
>
> +static int filenametr_display(hashtab_key_t key,
> +                             hashtab_datum_t datum,
> +                             void *ptr)
> +{
> +       struct filenametr_display_args *args = ptr;
> +       hashtab_t subhash = datum;
> +
> +       args->ft = (filename_trans_key_t *)key;
> +       return hashtab_map(subhash, filenametr_display_sub, args);
> +}
> +
>
>  static void display_filename_trans(policydb_t *p, FILE *fp)
>  {
> diff --git a/libsepol/cil/src/cil_binary.c b/libsepol/cil/src/cil_binary.c
> index 62178d99..bedff628 100644
> --- a/libsepol/cil/src/cil_binary.c
> +++ b/libsepol/cil/src/cil_binary.c
> @@ -1131,13 +1131,13 @@ int __cil_typetransition_to_avtab(policydb_t *pdb, const struct cil_db *db, stru
>         class_datum_t *sepol_obj = NULL;
>         struct cil_list *class_list;
>         type_datum_t *sepol_result = NULL;
> -       filename_trans_t *newkey = NULL;
> -       filename_trans_datum_t *newdatum = NULL, *otype = NULL;
>         ebitmap_t src_bitmap, tgt_bitmap;
>         ebitmap_node_t *node1, *node2;
>         unsigned int i, j;
> +       uint32_t otype;
>         struct cil_list_item *c;
>         char *name = DATUM(typetrans->name)->name;
> +       char *dup_name;
>
>         if (name == CIL_KEY_STAR) {
>                 struct cil_type_rule trans;
> @@ -1176,22 +1176,16 @@ int __cil_typetransition_to_avtab(policydb_t *pdb, const struct cil_db *db, stru
>                                 rc = __cil_get_sepol_class_datum(pdb, DATUM(c->data), &sepol_obj);
>                                 if (rc != SEPOL_OK) goto exit;
>
> -                               newkey = cil_calloc(1, sizeof(*newkey));
> -                               newdatum = cil_calloc(1, sizeof(*newdatum));
> -                               newkey->stype = sepol_src->s.value;
> -                               newkey->ttype = sepol_tgt->s.value;
> -                               newkey->tclass = sepol_obj->s.value;
> -                               newkey->name = cil_strdup(name);
> -                               newdatum->otype = sepol_result->s.value;
> -
> -                               rc = hashtab_insert(pdb->filename_trans,
> -                                                   (hashtab_key_t)newkey,
> -                                                   newdatum);
> +                               dup_name = NULL;
> +                               rc = policydb_filetrans_insert(
> +                                       pdb, sepol_src->s.value, sepol_tgt->s.value,
> +                                       sepol_obj->s.value, name, &dup_name,
> +                                       sepol_result->s.value, &otype
> +                               );
> +                               free(dup_name);
>                                 if (rc != SEPOL_OK) {
>                                         if (rc == SEPOL_EEXIST) {
> -                                               otype = hashtab_search(pdb->filename_trans,
> -                                                               (hashtab_key_t)newkey);
> -                                               if (newdatum->otype != otype->otype) {
> +                                               if (sepol_result->s.value!= otype) {
>                                                         cil_log(CIL_ERR, "Conflicting name type transition rules\n");
>                                                 } else {
>                                                         rc = SEPOL_OK;
> @@ -1199,9 +1193,6 @@ int __cil_typetransition_to_avtab(policydb_t *pdb, const struct cil_db *db, stru
>                                         } else {
>                                                 cil_log(CIL_ERR, "Out of memory\n");
>                                         }
> -                                       free(newkey->name);
> -                                       free(newkey);
> -                                       free(newdatum);
>                                         if (rc != SEPOL_OK) {
>                                                 goto exit;
>                                         }
> diff --git a/libsepol/include/sepol/policydb/policydb.h b/libsepol/include/sepol/policydb/policydb.h
> index 81b63fef..c3180c61 100644
> --- a/libsepol/include/sepol/policydb/policydb.h
> +++ b/libsepol/include/sepol/policydb/policydb.h
> @@ -162,15 +162,16 @@ typedef struct role_allow {
>  } role_allow_t;
>
>  /* filename_trans rules */
> -typedef struct filename_trans {
> -       uint32_t stype;
> +typedef struct filename_trans_key {
>         uint32_t ttype;
>         uint32_t tclass;
>         char *name;
> -} filename_trans_t;
> +} filename_trans_key_t;
>
>  typedef struct filename_trans_datum {
> -       uint32_t otype;         /* expected of new object */
> +       ebitmap_t stypes;
> +       uint32_t otype;
> +       struct filename_trans_datum *next;
>  } filename_trans_datum_t;
>
>  /* Type attributes */
> @@ -591,6 +592,7 @@ typedef struct policydb {
>
>         /* file transitions with the last path component */
>         hashtab_t filename_trans;
> +       uint32_t filename_trans_count;
>
>         ebitmap_t *type_attr_map;
>
> @@ -650,6 +652,11 @@ extern int policydb_load_isids(policydb_t * p, sidtab_t * s);
>
>  extern int policydb_sort_ocontexts(policydb_t *p);
>
> +extern int policydb_filetrans_insert(policydb_t *p, uint32_t stype,
> +                                    uint32_t ttype, uint32_t tclass,
> +                                    const char *name, char **name_alloc,
> +                                    uint32_t otype, uint32_t *present_otype);
> +
>  /* Deprecated */
>  extern int policydb_context_isvalid(const policydb_t * p,
>                                     const context_struct_t * c);
> diff --git a/libsepol/src/expand.c b/libsepol/src/expand.c
> index 529e1d35..28f93acb 100644
> --- a/libsepol/src/expand.c
> +++ b/libsepol/src/expand.c
> @@ -1371,16 +1371,15 @@ static int copy_role_trans(expand_state_t * state, role_trans_rule_t * rules)
>  static int expand_filename_trans(expand_state_t *state, filename_trans_rule_t *rules)
>  {
>         unsigned int i, j;
> -       filename_trans_t key, *new_trans;
> -       filename_trans_datum_t *otype;
>         filename_trans_rule_t *cur_rule;
>         ebitmap_t stypes, ttypes;
>         ebitmap_node_t *snode, *tnode;
> +       char *name;
>         int rc;
>
>         cur_rule = rules;
>         while (cur_rule) {
> -               uint32_t mapped_otype;
> +               uint32_t mapped_otype, present_otype;
>
>                 ebitmap_init(&stypes);
>                 ebitmap_init(&ttypes);
> @@ -1401,15 +1400,17 @@ static int expand_filename_trans(expand_state_t *state, filename_trans_rule_t *r
>
>                 ebitmap_for_each_positive_bit(&stypes, snode, i) {
>                         ebitmap_for_each_positive_bit(&ttypes, tnode, j) {
> -                               key.stype = i + 1;
> -                               key.ttype = j + 1;
> -                               key.tclass = cur_rule->tclass;
> -                               key.name = cur_rule->name;
> -                               otype = hashtab_search(state->out->filename_trans,
> -                                                      (hashtab_key_t) &key);
> -                               if (otype) {
> +                               name = NULL;
> +
> +                               rc = policydb_filetrans_insert(
> +                                       state->out, i + 1, j + 1,
> +                                       cur_rule->tclass, cur_rule->name,
> +                                       &name, mapped_otype, &present_otype
> +                               );
> +                               free(name);
> +                               if (rc == SEPOL_EEXIST) {
>                                         /* duplicate rule, ignore */
> -                                       if (otype->otype == mapped_otype)
> +                                       if (present_otype == mapped_otype)
>                                                 continue;
>
>                                         ERR(state->handle, "Conflicting name-based type_transition %s %s:%s \"%s\":  %s vs %s",
> @@ -1417,44 +1418,11 @@ static int expand_filename_trans(expand_state_t *state, filename_trans_rule_t *r
>                                             state->out->p_type_val_to_name[j],
>                                             state->out->p_class_val_to_name[cur_rule->tclass - 1],
>                                             cur_rule->name,
> -                                           state->out->p_type_val_to_name[otype->otype - 1],
> +                                           state->out->p_type_val_to_name[present_otype - 1],
>                                             state->out->p_type_val_to_name[mapped_otype - 1]);
>                                         return -1;
> -                               }
> -
> -                               new_trans = calloc(1, sizeof(*new_trans));
> -                               if (!new_trans) {
> -                                       ERR(state->handle, "Out of memory!");
> -                                       return -1;
> -                               }
> -
> -                               new_trans->name = strdup(cur_rule->name);
> -                               if (!new_trans->name) {
> -                                       ERR(state->handle, "Out of memory!");
> -                                       free(new_trans);
> -                                       return -1;
> -                               }
> -                               new_trans->stype = i + 1;
> -                               new_trans->ttype = j + 1;
> -                               new_trans->tclass = cur_rule->tclass;
> -
> -                               otype = calloc(1, sizeof(*otype));
> -                               if (!otype) {
> -                                       ERR(state->handle, "Out of memory!");
> -                                       free(new_trans->name);
> -                                       free(new_trans);
> -                                       return -1;
> -                               }
> -                               otype->otype = mapped_otype;
> -
> -                               rc = hashtab_insert(state->out->filename_trans,
> -                                                   (hashtab_key_t)new_trans,
> -                                                   otype);
> -                               if (rc) {
> +                               } else if (rc < 0) {
>                                         ERR(state->handle, "Out of memory!");
> -                                       free(otype);
> -                                       free(new_trans->name);
> -                                       free(new_trans);
>                                         return -1;
>                                 }
>                         }
> diff --git a/libsepol/src/kernel_to_cil.c b/libsepol/src/kernel_to_cil.c
> index ede78a20..718d3481 100644
> --- a/libsepol/src/kernel_to_cil.c
> +++ b/libsepol/src/kernel_to_cil.c
> @@ -1821,21 +1821,35 @@ struct map_filename_trans_args {
>
>  static int map_filename_trans_to_str(hashtab_key_t key, void *data, void *arg)
>  {
> -       filename_trans_t *ft = (filename_trans_t *)key;
> +       filename_trans_key_t *ft = (filename_trans_key_t *)key;
>         filename_trans_datum_t *datum = data;
>         struct map_filename_trans_args *map_args = arg;
>         struct policydb *pdb = map_args->pdb;
>         struct strs *strs = map_args->strs;
>         char *src, *tgt, *class, *filename, *new;
> +       struct ebitmap_node *node;
> +       uint32_t bit;
> +       int rc;
>
> -       src = pdb->p_type_val_to_name[ft->stype - 1];
>         tgt = pdb->p_type_val_to_name[ft->ttype - 1];
>         class = pdb->p_class_val_to_name[ft->tclass - 1];
>         filename = ft->name;
> -       new =  pdb->p_type_val_to_name[datum->otype - 1];
> +       do {
> +               new = pdb->p_type_val_to_name[datum->otype - 1];
> +
> +               ebitmap_for_each_positive_bit(&datum->stypes, node, bit) {
> +                       src = pdb->p_type_val_to_name[bit];
> +                       rc = strs_create_and_add(strs,
> +                                                "(typetransition %s %s %s %s %s)",
> +                                                5, src, tgt, class, filename, new);
> +                       if (rc)
> +                               return rc;
> +               }
> +
> +               datum = datum->next;
> +       } while (datum);
>
> -       return strs_create_and_add(strs, "(typetransition %s %s %s %s %s)", 5,
> -                                  src, tgt, class, filename, new);
> +       return 0;
>  }
>
>  static int write_filename_trans_rules_to_cil(FILE *out, struct policydb *pdb)
> diff --git a/libsepol/src/kernel_to_conf.c b/libsepol/src/kernel_to_conf.c
> index 9de64832..9fb3ed22 100644
> --- a/libsepol/src/kernel_to_conf.c
> +++ b/libsepol/src/kernel_to_conf.c
> @@ -1801,21 +1801,35 @@ struct map_filename_trans_args {
>
>  static int map_filename_trans_to_str(hashtab_key_t key, void *data, void *arg)
>  {
> -       filename_trans_t *ft = (filename_trans_t *)key;
> +       filename_trans_key_t *ft = (filename_trans_key_t *)key;
>         filename_trans_datum_t *datum = data;
>         struct map_filename_trans_args *map_args = arg;
>         struct policydb *pdb = map_args->pdb;
>         struct strs *strs = map_args->strs;
>         char *src, *tgt, *class, *filename, *new;
> +       struct ebitmap_node *node;
> +       uint32_t bit;
> +       int rc;
>
> -       src = pdb->p_type_val_to_name[ft->stype - 1];
>         tgt = pdb->p_type_val_to_name[ft->ttype - 1];
>         class = pdb->p_class_val_to_name[ft->tclass - 1];
>         filename = ft->name;
> -       new =  pdb->p_type_val_to_name[datum->otype - 1];
> +       do {
> +               new = pdb->p_type_val_to_name[datum->otype - 1];
> +
> +               ebitmap_for_each_positive_bit(&datum->stypes, node, bit) {
> +                       src = pdb->p_type_val_to_name[bit];
> +                       rc = strs_create_and_add(strs,
> +                                                "type_transition %s %s:%s %s \"%s\";",
> +                                                5, src, tgt, class, new, filename);
> +                       if (rc)
> +                               return rc;
> +               }
> +
> +               datum = datum->next;
> +       } while (datum);
>
> -       return strs_create_and_add(strs, "type_transition %s %s:%s %s \"%s\";", 5,
> -                                  src, tgt, class, new, filename);
> +       return 0;
>  }
>
>  static int write_filename_trans_rules_to_conf(FILE *out, struct policydb *pdb)
> diff --git a/libsepol/src/policydb.c b/libsepol/src/policydb.c
> index 5b289a52..6b121d66 100644
> --- a/libsepol/src/policydb.c
> +++ b/libsepol/src/policydb.c
> @@ -789,12 +789,12 @@ partial_name_hash(unsigned long c, unsigned long prevhash)
>
>  static unsigned int filenametr_hash(hashtab_t h, const_hashtab_key_t k)
>  {
> -       const struct filename_trans *ft = (const struct filename_trans *)k;
> +       const filename_trans_key_t *ft = (const filename_trans_key_t *)k;
>         unsigned long hash;
>         unsigned int byte_num;
>         unsigned char focus;
>
> -       hash = ft->stype ^ ft->ttype ^ ft->tclass;
> +       hash = ft->ttype ^ ft->tclass;
>
>         byte_num = 0;
>         while ((focus = ft->name[byte_num++]))
> @@ -805,14 +805,10 @@ static unsigned int filenametr_hash(hashtab_t h, const_hashtab_key_t k)
>  static int filenametr_cmp(hashtab_t h __attribute__ ((unused)),
>                           const_hashtab_key_t k1, const_hashtab_key_t k2)
>  {
> -       const struct filename_trans *ft1 = (const struct filename_trans *)k1;
> -       const struct filename_trans *ft2 = (const struct filename_trans *)k2;
> +       const filename_trans_key_t *ft1 = (const filename_trans_key_t *)k1;
> +       const filename_trans_key_t *ft2 = (const filename_trans_key_t *)k2;
>         int v;
>
> -       v = ft1->stype - ft2->stype;
> -       if (v)
> -               return v;
> -
>         v = ft1->ttype - ft2->ttype;
>         if (v)
>                 return v;
> @@ -1409,9 +1405,12 @@ common_destroy, class_destroy, role_destroy, type_destroy, user_destroy,
>  static int filenametr_destroy(hashtab_key_t key, hashtab_datum_t datum,
>                               void *p __attribute__ ((unused)))
>  {
> -       struct filename_trans *ft = (struct filename_trans *)key;
> +       filename_trans_key_t *ft = (filename_trans_key_t *)key;
> +       filename_trans_datum_t *fd = datum;
> +
>         free(ft->name);
>         free(key);
> +       ebitmap_destroy(&fd->stypes);
>         free(datum);
>         return 0;
>  }
> @@ -2595,12 +2594,77 @@ int role_allow_read(role_allow_t ** r, struct policy_file *fp)
>         return 0;
>  }
>
> +int policydb_filetrans_insert(policydb_t *p, uint32_t stype, uint32_t ttype,
> +                             uint32_t tclass, const char *name,
> +                             char **name_alloc, uint32_t otype,
> +                             uint32_t *present_otype)
> +{
> +       filename_trans_key_t *ft, key;
> +       filename_trans_datum_t *datum, *last;
> +
> +       key.ttype = ttype;
> +       key.tclass = tclass;
> +       key.name = (char *)name;
> +
> +       last = NULL;
> +       datum = hashtab_search(p->filename_trans, (hashtab_key_t)&key);
> +       while (datum) {
> +               if (ebitmap_get_bit(&datum->stypes, stype - 1)) {
> +                       if (present_otype)
> +                               *present_otype = datum->otype;
> +                       return SEPOL_EEXIST;
> +               }
> +               if (datum->otype == otype)
> +                       break;
> +               last = datum;
> +               datum = datum->next;
> +       }
> +       if (!datum) {
> +               if (!*name_alloc) {
> +                       *name_alloc = strdup(name);
> +                       if (!*name_alloc)
> +                               return SEPOL_ENOMEM;
> +               }
> +
> +               datum = malloc(sizeof(*datum));
> +               if (!datum)
> +                       return SEPOL_ENOMEM;
> +
> +               ebitmap_init(&datum->stypes);
> +               datum->otype = otype;
> +               datum->next = NULL;
> +
> +               if (last) {
> +                       last->next = datum;
> +               } else {
> +                       ft = malloc(sizeof(*ft));
> +                       if (!ft) {
> +                               free(datum);
> +                               return SEPOL_ENOMEM;
> +                       }
> +
> +                       ft->ttype = ttype;
> +                       ft->tclass = tclass;
> +                       ft->name = *name_alloc;
> +
> +                       if (hashtab_insert(p->filename_trans, (hashtab_key_t)ft,
> +                                          (hashtab_datum_t)datum)) {
> +                               free(datum);
> +                               free(ft);
> +                               return SEPOL_ENOMEM;
> +                       }
> +                       *name_alloc = NULL;
> +               }
> +       }
> +
> +       p->filename_trans_count++;
> +       return ebitmap_set_bit(&datum->stypes, stype - 1, 1);
> +}
> +
>  int filename_trans_read(policydb_t *p, struct policy_file *fp)
>  {
>         unsigned int i;
> -       uint32_t buf[4], nel, len;
> -       filename_trans_t *ft;
> -       filename_trans_datum_t *otype;
> +       uint32_t buf[4], nel, len, stype, ttype, tclass, otype;
>         int rc;
>         char *name;
>
> @@ -2610,16 +2674,8 @@ int filename_trans_read(policydb_t *p, struct policy_file *fp)
>         nel = le32_to_cpu(buf[0]);
>
>         for (i = 0; i < nel; i++) {
> -               ft = NULL;
> -               otype = NULL;
>                 name = NULL;
>
> -               ft = calloc(1, sizeof(*ft));
> -               if (!ft)
> -                       goto err;
> -               otype = calloc(1, sizeof(*otype));
> -               if (!otype)
> -                       goto err;
>                 rc = next_entry(buf, fp, sizeof(uint32_t));
>                 if (rc < 0)
>                         goto err;
> @@ -2631,8 +2687,6 @@ int filename_trans_read(policydb_t *p, struct policy_file *fp)
>                 if (!name)
>                         goto err;
>
> -               ft->name = name;
> -
>                 rc = next_entry(name, fp, len);
>                 if (rc < 0)
>                         goto err;
> @@ -2641,13 +2695,13 @@ int filename_trans_read(policydb_t *p, struct policy_file *fp)
>                 if (rc < 0)
>                         goto err;
>
> -               ft->stype = le32_to_cpu(buf[0]);
> -               ft->ttype = le32_to_cpu(buf[1]);
> -               ft->tclass = le32_to_cpu(buf[2]);
> -               otype->otype = le32_to_cpu(buf[3]);
> +               stype  = le32_to_cpu(buf[0]);
> +               ttype  = le32_to_cpu(buf[1]);
> +               tclass = le32_to_cpu(buf[2]);
> +               otype  = le32_to_cpu(buf[3]);
>
> -               rc = hashtab_insert(p->filename_trans, (hashtab_key_t) ft,
> -                                   otype);
> +               rc = policydb_filetrans_insert(p, stype, ttype, tclass, name,
> +                                              &name, otype, NULL);
>                 if (rc) {
>                         if (rc != SEPOL_EEXIST)
>                                 goto err;
> @@ -2659,21 +2713,17 @@ int filename_trans_read(policydb_t *p, struct policy_file *fp)
>                          */
>                         WARN(fp->handle,
>                              "Duplicate name-based type_transition %s %s:%s \"%s\":  %s, ignoring",
> -                            p->p_type_val_to_name[ft->stype - 1],
> -                            p->p_type_val_to_name[ft->ttype - 1],
> -                            p->p_class_val_to_name[ft->tclass - 1],
> -                            ft->name,
> -                            p->p_type_val_to_name[otype->otype - 1]);
> -                       free(ft);
> -                       free(name);
> -                       free(otype);
> +                            p->p_type_val_to_name[stype - 1],
> +                            p->p_type_val_to_name[ttype - 1],
> +                            p->p_class_val_to_name[tclass - 1],
> +                            name,
> +                            p->p_type_val_to_name[otype - 1]);
>                         /* continue, ignoring this one */
>                 }
> +               free(name);
>         }
>         return 0;
>  err:
> -       free(ft);
> -       free(otype);
>         free(name);
>         return -1;
>  }
> diff --git a/libsepol/src/write.c b/libsepol/src/write.c
> index 1fd6a16a..d3aee8d5 100644
> --- a/libsepol/src/write.c
> +++ b/libsepol/src/write.c
> @@ -571,44 +571,50 @@ static int role_allow_write(role_allow_t * r, struct policy_file *fp)
>
>  static int filename_write_helper(hashtab_key_t key, void *data, void *ptr)
>  {
> -       uint32_t buf[4];
> +       uint32_t bit, buf[4];
>         size_t items, len;
> -       struct filename_trans *ft = (struct filename_trans *)key;
> -       struct filename_trans_datum *otype = data;
> +       filename_trans_key_t *ft = (filename_trans_key_t *)key;
> +       filename_trans_datum_t *datum = data;
> +       ebitmap_node_t *node;
>         void *fp = ptr;
>
>         len = strlen(ft->name);
> -       buf[0] = cpu_to_le32(len);
> -       items = put_entry(buf, sizeof(uint32_t), 1, fp);
> -       if (items != 1)
> -               return POLICYDB_ERROR;
> +       do {
> +               ebitmap_for_each_positive_bit(&datum->stypes, node, bit) {
> +                       buf[0] = cpu_to_le32(len);
> +                       items = put_entry(buf, sizeof(uint32_t), 1, fp);
> +                       if (items != 1)
> +                               return POLICYDB_ERROR;
>
> -       items = put_entry(ft->name, sizeof(char), len, fp);
> -       if (items != len)
> -               return POLICYDB_ERROR;
> +                       items = put_entry(ft->name, sizeof(char), len, fp);
> +                       if (items != len)
> +                               return POLICYDB_ERROR;
>
> -       buf[0] = cpu_to_le32(ft->stype);
> -       buf[1] = cpu_to_le32(ft->ttype);
> -       buf[2] = cpu_to_le32(ft->tclass);
> -       buf[3] = cpu_to_le32(otype->otype);
> -       items = put_entry(buf, sizeof(uint32_t), 4, fp);
> -       if (items != 4)
> -               return POLICYDB_ERROR;
> +                       buf[0] = cpu_to_le32(bit + 1);
> +                       buf[1] = cpu_to_le32(ft->ttype);
> +                       buf[2] = cpu_to_le32(ft->tclass);
> +                       buf[3] = cpu_to_le32(datum->otype);
> +                       items = put_entry(buf, sizeof(uint32_t), 4, fp);
> +                       if (items != 4)
> +                               return POLICYDB_ERROR;
> +               }
> +
> +               datum = datum->next;
> +       } while (datum);
>
>         return 0;
>  }
>
>  static int filename_trans_write(struct policydb *p, void *fp)
>  {
> -       size_t nel, items;
> +       size_t items;
>         uint32_t buf[1];
>         int rc;
>
>         if (p->policyvers < POLICYDB_VERSION_FILENAME_TRANS)
>                 return 0;
>
> -       nel =  p->filename_trans->nel;
> -       buf[0] = cpu_to_le32(nel);
> +       buf[0] = cpu_to_le32(p->filename_trans_count);
>         items = put_entry(buf, sizeof(uint32_t), 1, fp);
>         if (items != 1)
>                 return POLICYDB_ERROR;
> --
> 2.25.1
>
