Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB5CF5235BD
	for <lists+selinux@lfdr.de>; Wed, 11 May 2022 16:39:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244871AbiEKOjD (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Wed, 11 May 2022 10:39:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244877AbiEKOjC (ORCPT
        <rfc822;selinux@vger.kernel.org>); Wed, 11 May 2022 10:39:02 -0400
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F6006D1AE
        for <selinux@vger.kernel.org>; Wed, 11 May 2022 07:38:59 -0700 (PDT)
Received: by mail-oi1-x22a.google.com with SMTP id y63so2923010oia.7
        for <selinux@vger.kernel.org>; Wed, 11 May 2022 07:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/4QjO9Ti5ffsjd6aXOYdrPdLeSarpjHJIcLuoaV0IWc=;
        b=dWvEg/MxCU0p24QzyOD5+CzcO7BmmZiD0kEIIGisqG6LLNuzAbMK6lzYzmTZPS+1/j
         +CN17s1cMBpDrrPhwAAeYBNa4sJLFo7X9yGYvrV/z3DKnBEt6OZzK6a6oCujK1/fvvuk
         aP4m1Ncp5IKPKX746KEbEdMUVESrgtcA2/Xv8JaCyblIPXANpNfS0pU7tJCopzFEKVtQ
         BgXjwaCgTgwLqG6+OIo+EZzgOCD7PPV6M4sukas3jyTJoq50wGnNYKpbW3UnJAzZm3sj
         1+kb1GMN/xocJvyDGPQFcxEe1GJ+HZdtKxuYQXQhm0MNn3pNLQj42TdA7GT0SyEu6AeR
         0MjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/4QjO9Ti5ffsjd6aXOYdrPdLeSarpjHJIcLuoaV0IWc=;
        b=i82TqoA0vHzV2/sredKUYo82o16aEnDBC+AYNQIi8VUVB0q6EX87Sl40MgBn/eiw8K
         tYSOQVbT/KL9jI37tlxjaQp4553yobw0UNJLPvp9aE8wpxjjpFr9s9Njsixr2HsmWnti
         IW1cTgnGBgsIKaMCWiR2nLvtQ9/WuW/7fYTy5ZtmbGxR+tLryo6r3vw7Aqlj7l5ZNhul
         EeXJinp87nyl8X/oetWgbD7sVbqNENS+G7eezGtCU3v3dB4SItOm4VFtfaWOQFBAzJko
         6KUioOf4q01mJ0otC8P2YAwJYv00vGPDC5MQeIsNgET2A75otrm14P/MztTnvWn5+MVh
         RjQw==
X-Gm-Message-State: AOAM531tgRDwXjCNZEcM2rWkf5FrgbX6g7HSNLc8m3E+5wSccM0eV5Jb
        h6t494dMQu56Qw9mE/Gnu5JoE4bcb5F0BpvBWbg=
X-Google-Smtp-Source: ABdhPJwLImiZvYqJv9yZgN/rlMxRN0XOXddn9ZvBMuZKI7nMcF6Uq7HAxnmoEZhWfGZJaiv7nm0rso6ow3pT6BOZav4=
X-Received: by 2002:a05:6808:ec5:b0:2f9:a7fb:4dfb with SMTP id
 q5-20020a0568080ec500b002f9a7fb4dfbmr2671907oiv.156.1652279938742; Wed, 11
 May 2022 07:38:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220510113929.2780308-1-omosnace@redhat.com> <20220510113929.2780308-3-omosnace@redhat.com>
In-Reply-To: <20220510113929.2780308-3-omosnace@redhat.com>
From:   James Carter <jwcart2@gmail.com>
Date:   Wed, 11 May 2022 10:38:47 -0400
Message-ID: <CAP+JOzQCE41Wfb1VF29X=T1jzEbXB9p5RB+3ZyA89sYy01BqHA@mail.gmail.com>
Subject: Re: [PATCH userspace v3 2/2] libsepol,checkpolicy: add support for
 self keyword in type transitions
To:     Ondrej Mosnacek <omosnace@redhat.com>
Cc:     SElinux list <selinux@vger.kernel.org>,
        Dominick Grift <dominick.grift@defensec.nl>,
        =?UTF-8?Q?Christian_G=C3=B6ttsche?= <cgzones@googlemail.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Tue, May 10, 2022 at 7:39 AM Ondrej Mosnacek <omosnace@redhat.com> wrote:
>
> With the addition of the anon_inode class in the kernel, 'self'
> transition rules became useful, but haven't been implemented.
>
> The typetransition, typemember, and typechange statements share the
> relevant code, so this patch implements the self keyword in all of them
> at the TE language level and adds the support to the module policydb
> format. Note that changing the kernel policydb format is not necessary
> at all, as type transitions are always expanded in the kernel policydb.
>
> Signed-off-by: Ondrej Mosnacek <omosnace@redhat.com>
> ---
>  checkpolicy/policy_define.c                | 42 ++++++++++++-
>  libsepol/include/sepol/policydb/policydb.h |  4 +-
>  libsepol/src/expand.c                      | 69 ++++++++++++++--------
>  libsepol/src/link.c                        |  1 +
>  libsepol/src/module_to_cil.c               | 30 ++++++----
>  libsepol/src/policydb.c                    | 33 +++++++++--
>  libsepol/src/policydb_validate.c           |  4 ++
>  libsepol/src/write.c                       | 32 ++++++++--
>  8 files changed, 166 insertions(+), 49 deletions(-)
>
> diff --git a/checkpolicy/policy_define.c b/checkpolicy/policy_define.c
> index 16b78346..7e328edc 100644
> --- a/checkpolicy/policy_define.c
> +++ b/checkpolicy/policy_define.c
> @@ -1634,6 +1634,15 @@ static int define_compute_type_helper(int which, avrule_t ** rule)
>         }
>         add = 1;
>         while ((id = queue_remove(id_queue))) {
> +               if (strcmp(id, "self") == 0) {
> +                       free(id);
> +                       if (add == 0) {
> +                               yyerror("-self is not supported");
> +                               goto bad;
> +                       }
> +                       avrule->flags |= RULE_SELF;
> +                       continue;
> +               }
>                 if (set_types(&avrule->ttypes, id, &add, 0))
>                         goto bad;
>         }
> @@ -3300,7 +3309,7 @@ int define_filename_trans(void)
>         type_datum_t *typdatum;
>         uint32_t otype;
>         unsigned int c, s, t;
> -       int add, rc;
> +       int add, self, rc;
>
>         if (pass == 1) {
>                 /* stype */
> @@ -3333,8 +3342,18 @@ int define_filename_trans(void)
>                         goto bad;
>         }
>
> -       add =1;
> +       self = 0;
> +       add = 1;
>         while ((id = queue_remove(id_queue))) {
> +               if (strcmp(id, "self") == 0) {
> +                       free(id);
> +                       if (add == 0) {
> +                               yyerror("-self is not supported");
> +                               goto bad;
> +                       }
> +                       self = 1;
> +                       continue;
> +               }
>                 if (set_types(&ttypes, id, &add, 0))
>                         goto bad;
>         }
> @@ -3396,6 +3415,24 @@ int define_filename_trans(void)
>                                         goto bad;
>                                 }
>                         }
> +                       if (self) {
> +                               rc = policydb_filetrans_insert(
> +                                       policydbp, s+1, s+1, c+1, name,
> +                                       NULL, otype, NULL
> +                               );
> +                               if (rc != SEPOL_OK) {
> +                                       if (rc == SEPOL_EEXIST) {
> +                                               yyerror2("duplicate filename transition for: filename_trans %s %s %s:%s",
> +                                                       name,
> +                                                       policydbp->p_type_val_to_name[s],
> +                                                       policydbp->p_type_val_to_name[s],
> +                                                       policydbp->p_class_val_to_name[c]);
> +                                               goto bad;
> +                                       }
> +                                       yyerror("out of memory");
> +                                       goto bad;
> +                               }
> +                       }
>                 }
>
>                 /* Now add the real rule since we didn't find any duplicates */
> @@ -3418,6 +3455,7 @@ int define_filename_trans(void)
>                 }
>                 ftr->tclass = c + 1;
>                 ftr->otype = otype;
> +               ftr->flags = self ? RULE_SELF : 0;
>         }
>
>         free(name);
> diff --git a/libsepol/include/sepol/policydb/policydb.h b/libsepol/include/sepol/policydb/policydb.h
> index 4bf9f05d..de0068a6 100644
> --- a/libsepol/include/sepol/policydb/policydb.h
> +++ b/libsepol/include/sepol/policydb/policydb.h
> @@ -314,6 +314,7 @@ typedef struct role_allow_rule {
>  } role_allow_rule_t;
>
>  typedef struct filename_trans_rule {
> +       uint32_t flags; /* may have RULE_SELF set */
>         type_set_t stypes;
>         type_set_t ttypes;
>         uint32_t tclass;
> @@ -781,9 +782,10 @@ extern int policydb_set_target_platform(policydb_t *p, int platform);
>  #define MOD_POLICYDB_VERSION_XPERMS_IOCTL  18
>  #define MOD_POLICYDB_VERSION_INFINIBAND                19
>  #define MOD_POLICYDB_VERSION_GLBLUB            20
> +#define MOD_POLICYDB_VERSION_SELF_TYPETRANS    21
>
>  #define MOD_POLICYDB_VERSION_MIN MOD_POLICYDB_VERSION_BASE
> -#define MOD_POLICYDB_VERSION_MAX MOD_POLICYDB_VERSION_GLBLUB
> +#define MOD_POLICYDB_VERSION_MAX MOD_POLICYDB_VERSION_SELF_TYPETRANS
>
>  #define POLICYDB_CONFIG_MLS    1
>
> diff --git a/libsepol/src/expand.c b/libsepol/src/expand.c
> index 7316124f..8d19850e 100644
> --- a/libsepol/src/expand.c
> +++ b/libsepol/src/expand.c
> @@ -1407,6 +1407,40 @@ static int copy_role_trans(expand_state_t * state, role_trans_rule_t * rules)
>         return 0;
>  }
>
> +static int expand_filename_trans_helper(expand_state_t *state,
> +                                       filename_trans_rule_t *rule,
> +                                       unsigned int s, unsigned int t)
> +{
> +       uint32_t mapped_otype, present_otype;
> +       int rc;
> +
> +       mapped_otype = state->typemap[rule->otype - 1];
> +
> +       rc = policydb_filetrans_insert(
> +               state->out, s + 1, t + 1,
> +               rule->tclass, rule->name,
> +               NULL, mapped_otype, &present_otype
> +       );
> +       if (rc == SEPOL_EEXIST) {
> +               /* duplicate rule, ignore */
> +               if (present_otype == mapped_otype)
> +                       return 0;
> +
> +               ERR(state->handle, "Conflicting name-based type_transition %s %s:%s \"%s\":  %s vs %s",
> +                   state->out->p_type_val_to_name[s],
> +                   state->out->p_type_val_to_name[t],
> +                   state->out->p_class_val_to_name[rule->tclass - 1],
> +                   rule->name,
> +                   state->out->p_type_val_to_name[present_otype - 1],
> +                   state->out->p_type_val_to_name[mapped_otype - 1]);
> +               return -1;
> +       } else if (rc < 0) {
> +               ERR(state->handle, "Out of memory!");
> +               return -1;
> +       }
> +       return 0;
> +}
> +
>  static int expand_filename_trans(expand_state_t *state, filename_trans_rule_t *rules)
>  {
>         unsigned int i, j;
> @@ -1417,8 +1451,6 @@ static int expand_filename_trans(expand_state_t *state, filename_trans_rule_t *r
>
>         cur_rule = rules;
>         while (cur_rule) {
> -               uint32_t mapped_otype, present_otype;
> -
>                 ebitmap_init(&stypes);
>                 ebitmap_init(&ttypes);
>
> @@ -1434,32 +1466,21 @@ static int expand_filename_trans(expand_state_t *state, filename_trans_rule_t *r
>                         return -1;
>                 }
>
> -               mapped_otype = state->typemap[cur_rule->otype - 1];
>
>                 ebitmap_for_each_positive_bit(&stypes, snode, i) {
>                         ebitmap_for_each_positive_bit(&ttypes, tnode, j) {
> -                               rc = policydb_filetrans_insert(
> -                                       state->out, i + 1, j + 1,
> -                                       cur_rule->tclass, cur_rule->name,
> -                                       NULL, mapped_otype, &present_otype
> +                               rc = expand_filename_trans_helper(
> +                                       state, cur_rule, i, j
>                                 );
> -                               if (rc == SEPOL_EEXIST) {
> -                                       /* duplicate rule, ignore */
> -                                       if (present_otype == mapped_otype)
> -                                               continue;
> -
> -                                       ERR(state->handle, "Conflicting name-based type_transition %s %s:%s \"%s\":  %s vs %s",
> -                                           state->out->p_type_val_to_name[i],
> -                                           state->out->p_type_val_to_name[j],
> -                                           state->out->p_class_val_to_name[cur_rule->tclass - 1],
> -                                           cur_rule->name,
> -                                           state->out->p_type_val_to_name[present_otype - 1],
> -                                           state->out->p_type_val_to_name[mapped_otype - 1]);
> -                                       return -1;
> -                               } else if (rc < 0) {
> -                                       ERR(state->handle, "Out of memory!");
> -                                       return -1;
> -                               }
> +                               if (rc)
> +                                       return rc;
> +                       }
> +                       if (cur_rule->flags & RULE_SELF) {
> +                               rc = expand_filename_trans_helper(
> +                                       state, cur_rule, i, i
> +                               );
> +                               if (rc)
> +                                       return rc;
>                         }
>                 }
>
> diff --git a/libsepol/src/link.c b/libsepol/src/link.c
> index ecfb5786..7e8313cb 100644
> --- a/libsepol/src/link.c
> +++ b/libsepol/src/link.c
> @@ -1482,6 +1482,7 @@ static int copy_filename_trans_list(filename_trans_rule_t * list,
>
>                 new_rule->tclass = module->map[SYM_CLASSES][cur->tclass - 1];
>                 new_rule->otype = module->map[SYM_TYPES][cur->otype - 1];
> +               new_rule->flags = cur->flags;
>
>                 cur = cur->next;
>         }
> diff --git a/libsepol/src/module_to_cil.c b/libsepol/src/module_to_cil.c
> index 156a74a2..0e211c93 100644
> --- a/libsepol/src/module_to_cil.c
> +++ b/libsepol/src/module_to_cil.c
> @@ -1608,20 +1608,30 @@ static int filename_trans_to_cil(int indent, struct policydb *pdb, struct filena
>                         goto exit;
>                 }
>
> -               ts = &rule->ttypes;
> -               rc = process_typeset(pdb, ts, attr_list, &ttypes, &num_ttypes);
> -               if (rc != 0) {
> -                       goto exit;
> -               }
> -
> -               for (stype = 0; stype < num_stypes; stype++) {
> -                       for (ttype = 0; ttype < num_ttypes; ttype++) {
> -                               cil_println(indent, "(typetransition %s %s %s \"%s\" %s)",
> -                                           stypes[stype], ttypes[ttype],
> +               if (rule->flags & RULE_SELF) {
> +                       for (stype = 0; stype < num_stypes; stype++) {
> +                               cil_println(indent, "(typetransition %s self %s \"%s\" %s)",
> +                                           stypes[stype],
>                                             pdb->p_class_val_to_name[rule->tclass - 1],
>                                             rule->name,
>                                             pdb->p_type_val_to_name[rule->otype - 1]);
>                         }
> +               } else {
> +                       ts = &rule->ttypes;
> +                       rc = process_typeset(pdb, ts, attr_list, &ttypes, &num_ttypes);
> +                       if (rc != 0) {
> +                               goto exit;
> +                       }
> +
> +                       for (stype = 0; stype < num_stypes; stype++) {
> +                               for (ttype = 0; ttype < num_ttypes; ttype++) {
> +                                       cil_println(indent, "(typetransition %s %s %s \"%s\" %s)",
> +                                                   stypes[stype], ttypes[ttype],
> +                                                   pdb->p_class_val_to_name[rule->tclass - 1],
> +                                                   rule->name,
> +                                                   pdb->p_type_val_to_name[rule->otype - 1]);
> +                               }
> +                       }

Sorry, I missed this in the last version. This shouldn't be in an
else, it needs to always be done to handle rules like "type_transition
t1 { t2 attr1 self }:file t3 "file1";". No one really writes rules
like that, but they are valid.

Everything else looks good.
Thanks,
Jim


>                 }
>
>                 names_destroy(&stypes, &num_stypes);
> diff --git a/libsepol/src/policydb.c b/libsepol/src/policydb.c
> index 7c99571f..fc260eb6 100644
> --- a/libsepol/src/policydb.c
> +++ b/libsepol/src/policydb.c
> @@ -327,6 +327,13 @@ static const struct policydb_compat_info policydb_compat[] = {
>          .ocon_num = OCON_IBENDPORT + 1,
>          .target_platform = SEPOL_TARGET_SELINUX,
>         },
> +       {
> +        .type = POLICY_BASE,
> +        .version = MOD_POLICYDB_VERSION_SELF_TYPETRANS,
> +        .sym_num = SYM_NUM,
> +        .ocon_num = OCON_IBENDPORT + 1,
> +        .target_platform = SEPOL_TARGET_SELINUX,
> +       },
>         {
>          .type = POLICY_MOD,
>          .version = MOD_POLICYDB_VERSION_BASE,
> @@ -446,7 +453,13 @@ static const struct policydb_compat_info policydb_compat[] = {
>          .ocon_num = 0,
>          .target_platform = SEPOL_TARGET_SELINUX,
>         },
> -
> +       {
> +        .type = POLICY_MOD,
> +        .version = MOD_POLICYDB_VERSION_SELF_TYPETRANS,
> +        .sym_num = SYM_NUM,
> +        .ocon_num = 0,
> +        .target_platform = SEPOL_TARGET_SELINUX,
> +       },
>  };
>
>  #if 0
> @@ -3822,10 +3835,11 @@ static int role_allow_rule_read(role_allow_rule_t ** r, struct policy_file *fp)
>         return 0;
>  }
>
> -static int filename_trans_rule_read(filename_trans_rule_t ** r, struct policy_file *fp)
> +static int filename_trans_rule_read(policydb_t *p, filename_trans_rule_t **r,
> +                                   struct policy_file *fp)
>  {
> -       uint32_t buf[2], nel;
> -       unsigned int i, len;
> +       uint32_t buf[3], nel, i, len;
> +       unsigned int entries;
>         filename_trans_rule_t *ftr, *lftr;
>         int rc;
>
> @@ -3870,11 +3884,18 @@ static int filename_trans_rule_read(filename_trans_rule_t ** r, struct policy_fi
>                 if (type_set_read(&ftr->ttypes, fp))
>                         return -1;
>
> -               rc = next_entry(buf, fp, sizeof(uint32_t) * 2);
> +               if (p->policyvers >= MOD_POLICYDB_VERSION_SELF_TYPETRANS)
> +                       entries = 3;
> +               else
> +                       entries = 2;
> +
> +               rc = next_entry(buf, fp, sizeof(uint32_t) * entries);
>                 if (rc < 0)
>                         return -1;
>                 ftr->tclass = le32_to_cpu(buf[0]);
>                 ftr->otype = le32_to_cpu(buf[1]);
> +               if (p->policyvers >= MOD_POLICYDB_VERSION_SELF_TYPETRANS)
> +                       ftr->flags = le32_to_cpu(buf[2]);
>         }
>
>         return 0;
> @@ -3977,7 +3998,7 @@ static int avrule_decl_read(policydb_t * p, avrule_decl_t * decl,
>         }
>
>         if (p->policyvers >= MOD_POLICYDB_VERSION_FILENAME_TRANS &&
> -           filename_trans_rule_read(&decl->filename_trans_rules, fp))
> +           filename_trans_rule_read(p, &decl->filename_trans_rules, fp))
>                 return -1;
>
>         if (p->policyvers >= MOD_POLICYDB_VERSION_RANGETRANS &&
> diff --git a/libsepol/src/policydb_validate.c b/libsepol/src/policydb_validate.c
> index 13d9480d..da18282b 100644
> --- a/libsepol/src/policydb_validate.c
> +++ b/libsepol/src/policydb_validate.c
> @@ -1184,6 +1184,10 @@ static int validate_filename_trans_rules(sepol_handle_t *handle, filename_trans_
>                         goto bad;
>                 if (validate_value(filename_trans->otype, &flavors[SYM_TYPES]))
>                         goto bad;
> +
> +               /* currently only the RULE_SELF flag can be set */
> +               if ((filename_trans->flags & ~RULE_SELF) != 0)
> +                       goto bad;
>         }
>
>         return 0;
> diff --git a/libsepol/src/write.c b/libsepol/src/write.c
> index d7ac2b25..48ed21ea 100644
> --- a/libsepol/src/write.c
> +++ b/libsepol/src/write.c
> @@ -1745,6 +1745,14 @@ static int avrule_write(policydb_t *p, avrule_t * avrule,
>         uint32_t buf[32], len;
>         class_perm_node_t *cur;
>
> +       if (p->policyvers < MOD_POLICYDB_VERSION_SELF_TYPETRANS &&
> +           (avrule->specified & AVRULE_TYPE) &&
> +           (avrule->flags & RULE_SELF)) {
> +               ERR(fp->handle,
> +                   "Module contains a self rule not supported by the target module policy version");
> +               return POLICYDB_ERROR;
> +       }
> +
>         items = 0;
>         buf[items++] = cpu_to_le32(avrule->specified);
>         buf[items++] = cpu_to_le32(avrule->flags);
> @@ -1929,11 +1937,12 @@ static int role_allow_rule_write(role_allow_rule_t * r, struct policy_file *fp)
>         return POLICYDB_SUCCESS;
>  }
>
> -static int filename_trans_rule_write(filename_trans_rule_t * t, struct policy_file *fp)
> +static int filename_trans_rule_write(policydb_t *p, filename_trans_rule_t *t,
> +                                    struct policy_file *fp)
>  {
>         int nel = 0;
> -       size_t items;
> -       uint32_t buf[2], len;
> +       size_t items, entries;
> +       uint32_t buf[3], len;
>         filename_trans_rule_t *ftr;
>
>         for (ftr = t; ftr; ftr = ftr->next)
> @@ -1962,9 +1971,20 @@ static int filename_trans_rule_write(filename_trans_rule_t * t, struct policy_fi
>
>                 buf[0] = cpu_to_le32(ftr->tclass);
>                 buf[1] = cpu_to_le32(ftr->otype);
> +               buf[2] = cpu_to_le32(ftr->flags);
>
> -               items = put_entry(buf, sizeof(uint32_t), 2, fp);
> -               if (items != 2)
> +               if (p->policyvers >= MOD_POLICYDB_VERSION_SELF_TYPETRANS) {
> +                       entries = 3;
> +               } else if (!(ftr->flags & RULE_SELF)) {
> +                       entries = 2;
> +               } else {
> +                       ERR(fp->handle,
> +                           "Module contains a self rule not supported by the target module policy version");
> +                       return POLICYDB_ERROR;
> +               }
> +
> +               items = put_entry(buf, sizeof(uint32_t), entries, fp);
> +               if (items != entries)
>                         return POLICYDB_ERROR;
>         }
>         return POLICYDB_SUCCESS;
> @@ -2039,7 +2059,7 @@ static int avrule_decl_write(avrule_decl_t * decl, int num_scope_syms,
>         }
>
>         if (p->policyvers >= MOD_POLICYDB_VERSION_FILENAME_TRANS &&
> -           filename_trans_rule_write(decl->filename_trans_rules, fp))
> +           filename_trans_rule_write(p, decl->filename_trans_rules, fp))
>                 return POLICYDB_ERROR;
>
>         if (p->policyvers >= MOD_POLICYDB_VERSION_RANGETRANS &&
> --
> 2.35.3
>
