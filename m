Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F3CBE7E6E0F
	for <lists+selinux@lfdr.de>; Thu,  9 Nov 2023 16:51:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234475AbjKIPvp (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Thu, 9 Nov 2023 10:51:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234896AbjKIPvh (ORCPT
        <rfc822;selinux@vger.kernel.org>); Thu, 9 Nov 2023 10:51:37 -0500
X-Greylist: delayed 105390 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 09 Nov 2023 07:51:28 PST
Received: from sender-of-o50.zoho.eu (sender-of-o50.zoho.eu [136.143.169.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 334C2D5A
        for <selinux@vger.kernel.org>; Thu,  9 Nov 2023 07:51:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699545082; cv=none; 
        d=zohomail.eu; s=zohoarc; 
        b=ieCJrKkGgzjdz4Ey042wFrFJ4MmkshcdO43Jo/YWbIJNCf3V408BwHqDuL2sO92eIAzh1phwIZsnUVfQ1cdeTFRfuQA/37M7pem7HMvc/c87GyW3cOUnI0kqZ46+s7bmftE0CVOGKBZVp2IMBZYx+V/dwFqUoBJmXR675m2r2E0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
        t=1699545082; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
        bh=BeMYaIiVCUuS6vXzZh8nPqV6jFSUv4EnnV6FH0vcaMY=; 
        b=kb6VixTR7abFIy7mjlhgmgjPzn07EKgI1LFbm7ReOn0KoR6ha57DpwsQmkm4+g5seDBJgLRGOxB2J5HeRYkBRlwdcoNQFbILIPiIm7iBlEU5ZBCgbURL9skBIrphIpx1lgkg8UUthwkbcpU65MyFO3V6d5o9STyNSq7Z6Nau8NY=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
        dkim=pass  header.i=jurajmarcin.com;
        spf=pass  smtp.mailfrom=juraj@jurajmarcin.com;
        dmarc=pass header.from=<juraj@jurajmarcin.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1699545082;
        s=zoho; d=jurajmarcin.com; i=juraj@jurajmarcin.com;
        h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Content-Transfer-Encoding:Message-Id:Reply-To;
        bh=BeMYaIiVCUuS6vXzZh8nPqV6jFSUv4EnnV6FH0vcaMY=;
        b=B6YaQKPdyLvMLcWjP9OBeLgFcjAe7mippobmrocx7Z03/dMYaY4VGokDhb/2LkUT
        lMR4InXdRhuo5w3t79z63uURTiCqvHAOldLsLbi3uwIhtXEqXYdO/UbHJcd+yilcLMc
        xKjYEVhXaHD691L8BLpSQMFYZNAFxDFtEPdlHko4=
Received: from morty01.jurajmarcin.com (129.159.244.31 [129.159.244.31]) by mx.zoho.eu
        with SMTPS id 1699545080445669.7746937380854; Thu, 9 Nov 2023 16:51:20 +0100 (CET)
Received: from jmarcin-t14s-01 (unknown [213.175.37.12])
        by morty01.jurajmarcin.com (Postfix) with ESMTPSA id 399A120890FD;
        Thu,  9 Nov 2023 15:51:19 +0000 (UTC)
Date:   Thu, 9 Nov 2023 16:51:17 +0100
From:   Juraj Marcin <juraj@jurajmarcin.com>
To:     James Carter <jwcart2@gmail.com>
Cc:     selinux@vger.kernel.org,
        Stephen Smalley <stephen.smalley.work@gmail.com>,
        Ondrej Mosnacek <omosnace@redhat.com>
Subject: Re: [PATCH v3] checkpolicy,libsepol: add prefix/suffix matching to
 filename type transitions
Message-ID: <20231109155117.x2sutdm6wx3omm6g@jmarcin-t14s-01>
References: <20231108103345.4014148-1-juraj@jurajmarcin.com>
 <CAP+JOzR4+633pd_R3=nQ5D9itYKgnkRdOwXx=rDtt-70rAiVXg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAP+JOzR4+633pd_R3=nQ5D9itYKgnkRdOwXx=rDtt-70rAiVXg@mail.gmail.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On 2023-11-09 09:51, James Carter wrote:
> On Wed, Nov 8, 2023 at 5:35=E2=80=AFAM Juraj Marcin <juraj@jurajmarcin.=
com> wrote:
> >
> > Currently, filename transitions are stored separately from other type
> > enforcement rules and only support exact name matching. However, in
> > practice, the names contain variable parts. This leads to many
> > duplicated rules in the policy that differ only in the part of the na=
me,
> > or it is even impossible to cover all possible combinations.
> >
> > This patch implements the equivalent changes made by this kernel
> > patch [1].
> >
> > This patch updates the policydb structure to contain prefix and suffi=
x
> > filename transition tables along normal filename transitions table an=
d
> > updates the code that accesses those tables. Furthermore, it adds
> > match_type attribute to module and CIL structures that store filename
> > transitions and updates functions that parse conf and CIL policy file=
s.
> >
> > This patch does not significantly change the binary policy size when
> > prefix/suffix rules are not used. In addition, with prefix/suffix rul=
es,
> > the number of filename transitions can be reduced, and therefore also
> > binary policy size can be reduced.
> >
> > Syntax of the new prefix/suffix filename transition rule:
> >
> >     type_transition source_type target_type : class default_type obje=
ct_name match_type;
> >
> >     (typetransition source_type_id target_type_id class_id object_nam=
e match_type default_type_id)
> >
> > where match_type is either keyword "prefix" or "suffix"
> >
> > Examples:
> >
> >     type_transition ta tb:CLASS01 tc "file01" prefix;
> >     type_transition td te:CLASS01 tf "file02" suffix;
> >
> >     (typetransition ta tb CLASS01 "file01" prefix td)
> >     (typetransition td te CLASS01 "file02" suffix tf)
> >
> > In the kernel, the rules have the following order of priority, if no
> > matching rule is found, the code moves on to the next category:
> > - exact filename transitions,
> > - prefix filename transitions in the order of the longest prefix matc=
h,
> > - suffix filename transitions in the order of the longest suffix matc=
h.
> > This ensures the compatibility with older policies.
> >
> > [1]: https://lore.kernel.org/selinux/20231108101427.3514509-1-juraj@j=
urajmarcin.com/
> >
> > Reviewed-by: Ondrej Mosnacek <omosnace@redhat.com>
> > Signed-off-by: Juraj Marcin <juraj@jurajmarcin.com>
> > ---
> > v3:
> > - reworked the solution from scratch, this time only adding the
> >   prefix/suffix matching feature without moving filename transition
> >   rules to the avtab
> > ---
> >  checkpolicy/policy_define.c                |  7 +-
> >  checkpolicy/policy_define.h                |  2 +-
> >  checkpolicy/policy_parse.y                 | 13 +++-
> >  checkpolicy/policy_scan.l                  |  4 ++
> >  checkpolicy/test/dismod.c                  | 14 +++-
> >  checkpolicy/test/dispol.c                  | 26 ++++++-
> >  libsepol/cil/src/cil.c                     |  6 ++
> >  libsepol/cil/src/cil_binary.c              |  8 +--
> >  libsepol/cil/src/cil_build_ast.c           | 26 +++++--
> >  libsepol/cil/src/cil_copy_ast.c            |  1 +
> >  libsepol/cil/src/cil_internal.h            |  4 ++
> >  libsepol/cil/src/cil_policy.c              | 17 ++++-
> >  libsepol/cil/src/cil_resolve_ast.c         | 12 ++++
> >  libsepol/cil/src/cil_write_ast.c           |  2 +
> >  libsepol/include/sepol/policydb/policydb.h | 20 ++++--
> >  libsepol/src/expand.c                      | 17 ++++-
> >  libsepol/src/kernel_to_cil.c               | 36 +++++++++-
> >  libsepol/src/kernel_to_conf.c              | 36 +++++++++-
> >  libsepol/src/link.c                        |  1 +
> >  libsepol/src/module_to_cil.c               | 21 ++++--
> >  libsepol/src/policydb.c                    | 82 +++++++++++++++++---=
--
> >  libsepol/src/policydb_validate.c           | 36 ++++++++--
> >  libsepol/src/write.c                       | 44 +++++++++---
> >  23 files changed, 367 insertions(+), 68 deletions(-)
> >
> > diff --git a/checkpolicy/policy_define.c b/checkpolicy/policy_define.=
c
> > index 260e609d..fb8325ee 100644
> > --- a/checkpolicy/policy_define.c
> > +++ b/checkpolicy/policy_define.c
> > @@ -3159,7 +3159,7 @@ avrule_t *define_cond_filename_trans(void)
> >         return COND_ERR;
> >  }
> >
> > -int define_filename_trans(void)
> > +int define_filename_trans(uint32_t match_type)
> >  {
> >         char *id, *name =3D NULL;
> >         type_set_t stypes, ttypes;
> > @@ -3261,7 +3261,7 @@ int define_filename_trans(void)
> >                         ebitmap_for_each_positive_bit(&e_ttypes, tnod=
e, t) {
> >                                 rc =3D policydb_filetrans_insert(
> >                                         policydbp, s+1, t+1, c+1, nam=
e,
> > -                                       NULL, otype, NULL
> > +                                       NULL, otype, match_type, NULL
> >                                 );
> >                                 if (rc !=3D SEPOL_OK) {
> >                                         if (rc =3D=3D SEPOL_EEXIST) {
> > @@ -3279,7 +3279,7 @@ int define_filename_trans(void)
> >                         if (self) {
> >                                 rc =3D policydb_filetrans_insert(
> >                                         policydbp, s+1, s+1, c+1, nam=
e,
> > -                                       NULL, otype, NULL
> > +                                       NULL, otype, match_type, NULL
> >                                 );
> >                                 if (rc !=3D SEPOL_OK) {
> >                                         if (rc =3D=3D SEPOL_EEXIST) {
> > @@ -3317,6 +3317,7 @@ int define_filename_trans(void)
> >                 ftr->tclass =3D c + 1;
> >                 ftr->otype =3D otype;
> >                 ftr->flags =3D self ? RULE_SELF : 0;
> > +               ftr->match_type =3D match_type;
> >         }
> >
> >         free(name);
> > diff --git a/checkpolicy/policy_define.h b/checkpolicy/policy_define.=
h
> > index 075b048d..05869346 100644
> > --- a/checkpolicy/policy_define.h
> > +++ b/checkpolicy/policy_define.h
> > @@ -57,7 +57,7 @@ int define_role_trans(int class_specified);
> >  int define_role_types(void);
> >  int define_role_attr(void);
> >  int define_roleattribute(void);
> > -int define_filename_trans(void);
> > +int define_filename_trans(uint32_t match_type);
> >  int define_sens(void);
> >  int define_te_avtab(int which);
> >  int define_te_avtab_extended_perms(int which);
> > diff --git a/checkpolicy/policy_parse.y b/checkpolicy/policy_parse.y
> > index 356626e2..ee4be4ea 100644
> > --- a/checkpolicy/policy_parse.y
> > +++ b/checkpolicy/policy_parse.y
> > @@ -153,6 +153,7 @@ typedef int (* require_func_t)(int pass);
> >  %token FILESYSTEM
> >  %token DEFAULT_USER DEFAULT_ROLE DEFAULT_TYPE DEFAULT_RANGE
> >  %token LOW_HIGH LOW HIGH GLBLUB
> > +%token PREFIX SUFFIX
> >
> >  %left OR
> >  %left XOR
> > @@ -410,6 +411,12 @@ cond_rule_def           : cond_transition_def
> >                         { $$ =3D NULL; }
> >                          ;
> >  cond_transition_def    : TYPE_TRANSITION names names ':' names ident=
ifier filename ';'
> > +                        { $$ =3D define_cond_filename_trans() ;
> > +                          if ($$ =3D=3D COND_ERR) return -1;}
> > +                       | TYPE_TRANSITION names names ':' names ident=
ifier filename PREFIX ';'
> > +                        { $$ =3D define_cond_filename_trans() ;
> > +                          if ($$ =3D=3D COND_ERR) return -1;}
> > +                       | TYPE_TRANSITION names names ':' names ident=
ifier filename SUFFIX ';'
> >                          { $$ =3D define_cond_filename_trans() ;
> >                            if ($$ =3D=3D COND_ERR) return -1;}
> >                         | TYPE_TRANSITION names names ':' names ident=
ifier ';'
> > @@ -449,7 +456,11 @@ cond_dontaudit_def : DONTAUDIT names names ':' n=
ames names ';'
> >                         ;
> >                         ;
> >  transition_def         : TYPE_TRANSITION  names names ':' names iden=
tifier filename ';'
> > -                       {if (define_filename_trans()) return -1; }
> > +                       {if (define_filename_trans(FILENAME_TRANS_MAT=
CH_EXACT)) return -1; }
> > +                       | TYPE_TRANSITION  names names ':' names iden=
tifier filename PREFIX ';'
> > +                       {if (define_filename_trans(FILENAME_TRANS_MAT=
CH_PREFIX)) return -1; }
> > +                       | TYPE_TRANSITION  names names ':' names iden=
tifier filename SUFFIX ';'
> > +                       {if (define_filename_trans(FILENAME_TRANS_MAT=
CH_SUFFIX)) return -1; }
> >                         | TYPE_TRANSITION names names ':' names ident=
ifier ';'
> >                          {if (define_compute_type(AVRULE_TRANSITION))=
 return -1;}
> >                          | TYPE_MEMBER names names ':' names identifi=
er ';'
> > diff --git a/checkpolicy/policy_scan.l b/checkpolicy/policy_scan.l
> > index c998ff8b..0780ef15 100644
> > --- a/checkpolicy/policy_scan.l
> > +++ b/checkpolicy/policy_scan.l
> > @@ -270,6 +270,10 @@ low |
> >  LOW                            { return(LOW); }
> >  glblub |
> >  GLBLUB                         { return(GLBLUB); }
> > +PREFIX |
> > +prefix                         { return(PREFIX); }
> > +SUFFIX |
> > +suffix                         { return(SUFFIX); }
> >  "/"[^ \n\r\t\f]*               { return(PATH); }
> >  \""/"[^\"\n]*\"                { return(QPATH); }
> >  \"[^"/"\"\n]+\"        { return(FILENAME); }
> > diff --git a/checkpolicy/test/dismod.c b/checkpolicy/test/dismod.c
> > index fa7117f5..5995e135 100644
> > --- a/checkpolicy/test/dismod.c
> > +++ b/checkpolicy/test/dismod.c
> > @@ -564,13 +564,25 @@ static void display_role_allow(role_allow_rule_=
t * ra, policydb_t * p, FILE * fp
> >
> >  static void display_filename_trans(filename_trans_rule_t * tr, polic=
ydb_t * p, FILE * fp)
> >  {
> > +       const char *match_str =3D "";
> >         fprintf(fp, "filename transition");
> >         for (; tr; tr =3D tr->next) {
> >                 display_type_set(&tr->stypes, 0, p, fp);
> >                 display_type_set(&tr->ttypes, 0, p, fp);
> >                 display_id(p, fp, SYM_CLASSES, tr->tclass - 1, ":");
> >                 display_id(p, fp, SYM_TYPES, tr->otype - 1, "");
> > -               fprintf(fp, " %s\n", tr->name);
> > +               switch (tr->match_type) {
> > +               case FILENAME_TRANS_MATCH_EXACT:
> > +                       match_str =3D "";
> > +                       break;
> > +               case FILENAME_TRANS_MATCH_PREFIX:
> > +                       match_str =3D " prefix";
> > +                       break;
> > +               case FILENAME_TRANS_MATCH_SUFFIX:
> > +                       match_str =3D " suffix";
> > +                       break;
> > +               }
> > +               fprintf(fp, " %s%s\n", tr->name, match_str);
> >         }
> >  }
> >
> > diff --git a/checkpolicy/test/dispol.c b/checkpolicy/test/dispol.c
> > index b567ce77..4426b844 100644
> > --- a/checkpolicy/test/dispol.c
> > +++ b/checkpolicy/test/dispol.c
> > @@ -450,6 +450,7 @@ static void display_role_trans(policydb_t *p, FIL=
E *fp)
> >
> >  struct filenametr_display_args {
> >         policydb_t *p;
> > +       uint32_t match_type;
> >         FILE *fp;
> >  };
> >
> > @@ -464,6 +465,19 @@ static int filenametr_display(hashtab_key_t key,
> >         FILE *fp =3D args->fp;
> >         ebitmap_node_t *node;
> >         uint32_t bit;
> > +       const char *match_str =3D "";
> > +
> > +       switch (args->match_type) {
> > +       case FILENAME_TRANS_MATCH_EXACT:
> > +               match_str =3D "";
> > +               break;
> > +       case FILENAME_TRANS_MATCH_PREFIX:
> > +               match_str =3D " prefix";
> > +               break;
> > +       case FILENAME_TRANS_MATCH_SUFFIX:
> > +               match_str =3D " suffix";
> > +               break;
> > +       }
> >
> >         do {
> >                 ebitmap_for_each_positive_bit(&ftdatum->stypes, node,=
 bit) {
> > @@ -471,7 +485,7 @@ static int filenametr_display(hashtab_key_t key,
> >                         display_id(p, fp, SYM_TYPES, ft->ttype - 1, "=
");
> >                         display_id(p, fp, SYM_CLASSES, ft->tclass - 1=
, ":");
> >                         display_id(p, fp, SYM_TYPES, ftdatum->otype -=
 1, "");
> > -                       fprintf(fp, " %s\n", ft->name);
> > +                       fprintf(fp, " %s%s\n", ft->name, match_str);
> >                 }
> >                 ftdatum =3D ftdatum->next;
> >         } while (ftdatum);
> > @@ -487,7 +501,15 @@ static void display_filename_trans(policydb_t *p=
, FILE *fp)
> >         fprintf(fp, "filename_trans rules:\n");
> >         args.p =3D p;
> >         args.fp =3D fp;
> > -       hashtab_map(p->filename_trans, filenametr_display, &args);
> > +       args.match_type =3D FILENAME_TRANS_MATCH_EXACT;
> > +       hashtab_map(p->filename_trans[FILENAME_TRANS_MATCH_EXACT],
> > +                   filenametr_display, &args);
> > +       args.match_type =3D FILENAME_TRANS_MATCH_PREFIX;
> > +       hashtab_map(p->filename_trans[FILENAME_TRANS_MATCH_PREFIX],
> > +                   filenametr_display, &args);
> > +       args.match_type =3D FILENAME_TRANS_MATCH_SUFFIX;
> > +       hashtab_map(p->filename_trans[FILENAME_TRANS_MATCH_SUFFIX],
> > +                   filenametr_display, &args);
> >  }
> >
> >  static int menu(void)
> > diff --git a/libsepol/cil/src/cil.c b/libsepol/cil/src/cil.c
> > index 2021187d..37769fc4 100644
> > --- a/libsepol/cil/src/cil.c
> > +++ b/libsepol/cil/src/cil.c
> > @@ -97,6 +97,8 @@ char *CIL_KEY_TUNABLEIF;
> >  char *CIL_KEY_ALLOW;
> >  char *CIL_KEY_DONTAUDIT;
> >  char *CIL_KEY_TYPETRANSITION;
> > +char *CIL_KEY_PREFIX;
> > +char *CIL_KEY_SUFFIX;
> >  char *CIL_KEY_TYPECHANGE;
> >  char *CIL_KEY_CALL;
> >  char *CIL_KEY_TUNABLE;
> > @@ -269,6 +271,8 @@ static void cil_init_keys(void)
> >         CIL_KEY_ALLOW =3D cil_strpool_add("allow");
> >         CIL_KEY_DONTAUDIT =3D cil_strpool_add("dontaudit");
> >         CIL_KEY_TYPETRANSITION =3D cil_strpool_add("typetransition");
> > +       CIL_KEY_PREFIX =3D cil_strpool_add("prefix");
> > +       CIL_KEY_SUFFIX =3D cil_strpool_add("suffix");
> >         CIL_KEY_TYPECHANGE =3D cil_strpool_add("typechange");
> >         CIL_KEY_CALL =3D cil_strpool_add("call");
> >         CIL_KEY_TUNABLE =3D cil_strpool_add("tunable");
> > @@ -2456,6 +2460,8 @@ void cil_nametypetransition_init(struct cil_nam=
etypetransition **nametypetrans)
> >         (*nametypetrans)->obj =3D NULL;
> >         (*nametypetrans)->name_str =3D NULL;
> >         (*nametypetrans)->name =3D NULL;
> > +       (*nametypetrans)->match_type_str =3D NULL;
> > +       (*nametypetrans)->match_type =3D FILENAME_TRANS_MATCH_EXACT;
> >         (*nametypetrans)->result_str =3D NULL;
> >         (*nametypetrans)->result =3D NULL;
> >  }
> > diff --git a/libsepol/cil/src/cil_binary.c b/libsepol/cil/src/cil_bin=
ary.c
> > index a8e3616a..75a9e064 100644
> > --- a/libsepol/cil/src/cil_binary.c
> > +++ b/libsepol/cil/src/cil_binary.c
> > @@ -1168,7 +1168,7 @@ static int __cil_typetransition_to_avtab_helper=
(policydb_t *pdb,
> >                                                 type_datum_t *sepol_s=
rc,
> >                                                 type_datum_t *sepol_t=
gt,
> >                                                 struct cil_list *clas=
s_list,
> > -                                               char *name,
> > +                                               char *name, uint32_t =
match_type,
> >                                                 type_datum_t *sepol_r=
esult)
> >  {
> >         int rc;
> > @@ -1183,7 +1183,7 @@ static int __cil_typetransition_to_avtab_helper=
(policydb_t *pdb,
> >                 rc =3D policydb_filetrans_insert(
> >                         pdb, sepol_src->s.value, sepol_tgt->s.value,
> >                         sepol_obj->s.value, name, NULL,
> > -                       sepol_result->s.value, &otype
> > +                       sepol_result->s.value, match_type, &otype
> >                 );
> >                 if (rc !=3D SEPOL_OK) {
> >                         if (rc =3D=3D SEPOL_EEXIST) {
> > @@ -1252,7 +1252,7 @@ static int __cil_typetransition_to_avtab(policy=
db_t *pdb, const struct cil_db *d
> >
> >                         rc =3D __cil_typetransition_to_avtab_helper(
> >                                 pdb, sepol_src, sepol_src, class_list=
,
> > -                               name, sepol_result
> > +                               name, typetrans->match_type, sepol_re=
sult
> >                         );
> >                         if (rc !=3D SEPOL_OK) goto exit;
> >                 }
> > @@ -1270,7 +1270,7 @@ static int __cil_typetransition_to_avtab(policy=
db_t *pdb, const struct cil_db *d
> >
> >                                 rc =3D __cil_typetransition_to_avtab_=
helper(
> >                                         pdb, sepol_src, sepol_tgt, cl=
ass_list,
> > -                                       name, sepol_result
> > +                                       name, typetrans->match_type, =
sepol_result
> >                                 );
> >                                 if (rc !=3D SEPOL_OK) goto exit;
> >                         }
> > diff --git a/libsepol/cil/src/cil_build_ast.c b/libsepol/cil/src/cil_=
build_ast.c
> > index 8976c254..94dadef8 100644
> > --- a/libsepol/cil/src/cil_build_ast.c
> > +++ b/libsepol/cil/src/cil_build_ast.c
> > @@ -3392,10 +3392,11 @@ int cil_gen_typetransition(struct cil_db *db,=
 struct cil_tree_node *parse_curren
> >                 CIL_SYN_STRING,
> >                 CIL_SYN_STRING,
> >                 CIL_SYN_STRING | CIL_SYN_END,
> > -               CIL_SYN_END
> > +               CIL_SYN_STRING | CIL_SYN_END,
> > +               CIL_SYN_END,
> >         };
> >         size_t syntax_len =3D sizeof(syntax)/sizeof(*syntax);
> > -       char *s1, *s2, *s3, *s4, *s5;
> > +       char *s1, *s2, *s3, *s4, *s5, *s6;
> >
> >         if (db =3D=3D NULL || parse_current =3D=3D NULL || ast_node =3D=
=3D NULL ) {
> >                 goto exit;
> > @@ -3411,12 +3412,22 @@ int cil_gen_typetransition(struct cil_db *db,=
 struct cil_tree_node *parse_curren
> >         s3 =3D parse_current->next->next->next->data;
> >         s4 =3D parse_current->next->next->next->next->data;
> >         s5 =3D NULL;
> > +       s6 =3D NULL;
> >
> >         if (parse_current->next->next->next->next->next) {
> >                 if (s4 =3D=3D CIL_KEY_STAR) {
> > -                       s4 =3D parse_current->next->next->next->next-=
>next->data;
> > +                       if (parse_current->next->next->next->next->ne=
xt->next) {
> > +                               s4 =3D parse_current->next->next->nex=
t->next->next->next->data;
> > +                       } else {
> > +                               s4 =3D parse_current->next->next->nex=
t->next->next->data;
> > +                       }
> >                 } else {
> > -                       s5 =3D parse_current->next->next->next->next-=
>next->data;
> > +                       if (parse_current->next->next->next->next->ne=
xt->next) {
> > +                               s5 =3D parse_current->next->next->nex=
t->next->next->data;
> > +                               s6 =3D parse_current->next->next->nex=
t->next->next->next->data;
> > +                       } else {
> > +                               s5 =3D parse_current->next->next->nex=
t->next->next->data;
> > +                       }
> >                 }
> >         }
> >
> > @@ -3428,8 +3439,13 @@ int cil_gen_typetransition(struct cil_db *db, =
struct cil_tree_node *parse_curren
> >                 nametypetrans->src_str =3D s1;
> >                 nametypetrans->tgt_str =3D s2;
> >                 nametypetrans->obj_str =3D s3;
> > -               nametypetrans->result_str =3D s5;
> >                 nametypetrans->name_str =3D s4;
> > +               if (s6) {
> > +                       nametypetrans->match_type_str =3D s5;
> > +                       nametypetrans->result_str =3D s6;
> > +               } else {
> > +                       nametypetrans->result_str =3D s5;
> > +               }
> >
> >                 ast_node->data =3D nametypetrans;
> >                 ast_node->flavor =3D CIL_NAMETYPETRANSITION;
> > diff --git a/libsepol/cil/src/cil_copy_ast.c b/libsepol/cil/src/cil_c=
opy_ast.c
> > index bc972f03..300390ec 100644
> > --- a/libsepol/cil/src/cil_copy_ast.c
> > +++ b/libsepol/cil/src/cil_copy_ast.c
> > @@ -726,6 +726,7 @@ int cil_copy_nametypetransition(__attribute__((un=
used)) struct cil_db *db, void
> >         new->tgt_str =3D orig->tgt_str;
> >         new->obj_str =3D orig->obj_str;
> >         new->name_str =3D orig->name_str;
> > +       new->match_type_str =3D orig->match_type_str;
> >         new->result_str =3D orig->result_str;
> >
> >
> > diff --git a/libsepol/cil/src/cil_internal.h b/libsepol/cil/src/cil_i=
nternal.h
> > index 9e492cb9..7f0be652 100644
> > --- a/libsepol/cil/src/cil_internal.h
> > +++ b/libsepol/cil/src/cil_internal.h
> > @@ -114,6 +114,8 @@ extern char *CIL_KEY_TUNABLEIF;
> >  extern char *CIL_KEY_ALLOW;
> >  extern char *CIL_KEY_DONTAUDIT;
> >  extern char *CIL_KEY_TYPETRANSITION;
> > +extern char *CIL_KEY_PREFIX;
> > +extern char *CIL_KEY_SUFFIX;
> >  extern char *CIL_KEY_TYPECHANGE;
> >  extern char *CIL_KEY_CALL;
> >  extern char *CIL_KEY_TUNABLE;
> > @@ -580,6 +582,8 @@ struct cil_nametypetransition {
> >         struct cil_class *obj;
> >         char *name_str;
> >         struct cil_name *name;
> > +       char *match_type_str;
> > +       uint32_t match_type;
> >         char *result_str;
> >         void *result; /* type or alias */
> >
> > diff --git a/libsepol/cil/src/cil_policy.c b/libsepol/cil/src/cil_pol=
icy.c
> > index feb97868..9776dfd3 100644
> > --- a/libsepol/cil/src/cil_policy.c
> > +++ b/libsepol/cil/src/cil_policy.c
> > @@ -1260,6 +1260,7 @@ static void cil_nametypetransition_to_policy(FI=
LE *out, struct cil_nametypetrans
> >         struct cil_name *name;
> >         struct cil_list *class_list;
> >         struct cil_list_item *i1;
> > +       const char *match_type_str =3D "";
> >
> >         src =3D trans->src;
> >         tgt =3D trans->tgt;
> > @@ -1268,7 +1269,21 @@ static void cil_nametypetransition_to_policy(F=
ILE *out, struct cil_nametypetrans
> >
> >         class_list =3D cil_expand_class(trans->obj);
> >         cil_list_for_each(i1, class_list) {
> > -               fprintf(out, "type_transition %s %s : %s %s \"%s\";\n=
", src->fqn, tgt->fqn, DATUM(i1->data)->fqn, res->fqn, name->datum.fqn);
> > +               switch (trans->match_type) {
> > +               case FILENAME_TRANS_MATCH_EXACT:
> > +                       match_type_str =3D "";
> > +                       break;
> > +               case FILENAME_TRANS_MATCH_PREFIX:
> > +                       match_type_str =3D " prefix";
> > +                       break;
> > +               case FILENAME_TRANS_MATCH_SUFFIX:
> > +                       match_type_str =3D " suffix";
> > +                       break;
> > +               default:
> > +                       match_type_str =3D "???";
> > +                       break;
> > +               }
> > +               fprintf(out, "type_transition %s %s : %s %s \"%s\"%s;=
\n", src->fqn, tgt->fqn, DATUM(i1->data)->fqn, res->fqn, name->datum.fqn,=
 match_type_str);
> >         }
> >         cil_list_destroy(&class_list, CIL_FALSE);
> >  }
> > diff --git a/libsepol/cil/src/cil_resolve_ast.c b/libsepol/cil/src/ci=
l_resolve_ast.c
> > index 33b9d321..3b00f065 100644
> > --- a/libsepol/cil/src/cil_resolve_ast.c
> > +++ b/libsepol/cil/src/cil_resolve_ast.c
> > @@ -717,6 +717,18 @@ int cil_resolve_nametypetransition(struct cil_tr=
ee_node *current, void *extra_ar
> >                 nametypetrans->name =3D (struct cil_name *)name_datum=
;
> >         }
> >
> > +       if (nametypetrans->match_type_str =3D=3D NULL) {
> > +               nametypetrans->match_type =3D FILENAME_TRANS_MATCH_EX=
ACT;
> > +       } else if (nametypetrans->match_type_str =3D=3D CIL_KEY_PREFI=
X) {
> > +               nametypetrans->match_type =3D FILENAME_TRANS_MATCH_PR=
EFIX;
> > +       } else if (nametypetrans->match_type_str =3D=3D CIL_KEY_SUFFI=
X) {
> > +               nametypetrans->match_type =3D FILENAME_TRANS_MATCH_SU=
FFIX;
> > +       } else {
> > +               cil_tree_log(current, CIL_ERR, "Invalid name match ty=
pe \"%s\"", nametypetrans->match_type_str);
> > +               rc =3D SEPOL_ERR;
> > +               goto exit;
> > +       }
> > +
> >         rc =3D cil_resolve_name(current, nametypetrans->result_str, C=
IL_SYM_TYPES, extra_args, &result_datum);
> >         if (rc !=3D SEPOL_OK) {
> >                 goto exit;
> > diff --git a/libsepol/cil/src/cil_write_ast.c b/libsepol/cil/src/cil_=
write_ast.c
> > index 4da7a77c..99c82292 100644
> > --- a/libsepol/cil/src/cil_write_ast.c
> > +++ b/libsepol/cil/src/cil_write_ast.c
> > @@ -1178,6 +1178,8 @@ void cil_write_ast_node(FILE *out, struct cil_t=
ree_node *node)
> >                 fprintf(out, "%s ", datum_or_str(DATUM(rule->tgt), ru=
le->tgt_str));
> >                 fprintf(out, "%s ", datum_or_str(DATUM(rule->obj), ru=
le->obj_str));
> >                 fprintf(out, "\"%s\" ", datum_or_str(DATUM(rule->name=
), rule->name_str));
> > +               if (rule->match_type !=3D FILENAME_TRANS_MATCH_EXACT)
> > +                       fprintf(out, "%s ", rule->match_type_str);
> >                 fprintf(out, "%s", datum_or_str(DATUM(rule->result), =
rule->result_str));
> >                 fprintf(out, ")\n");
> >                 break;
> > diff --git a/libsepol/include/sepol/policydb/policydb.h b/libsepol/in=
clude/sepol/policydb/policydb.h
> > index 6682069e..7727ca52 100644
> > --- a/libsepol/include/sepol/policydb/policydb.h
> > +++ b/libsepol/include/sepol/policydb/policydb.h
> > @@ -321,6 +321,7 @@ typedef struct filename_trans_rule {
> >         uint32_t tclass;
> >         char *name;
> >         uint32_t otype; /* new type */
> > +       uint32_t match_type;
> >         struct filename_trans_rule *next;
> >  } filename_trans_rule_t;
> >
> > @@ -423,6 +424,14 @@ typedef struct genfs {
> >  /* OCON_NUM needs to be the largest index in any platform's ocontext=
 array */
> >  #define OCON_NUM   9
> >
> > +/* filename transitions table array indices */
> > +enum {
> > +       FILENAME_TRANS_MATCH_EXACT,
> > +       FILENAME_TRANS_MATCH_PREFIX,
> > +       FILENAME_TRANS_MATCH_SUFFIX,
> > +       FILENAME_TRANS_MATCH_NUM,
> > +};
> > +
> >  /* section: module information */
> >
> >  /* scope_index_t holds all of the symbols that are in scope in a
> > @@ -593,7 +602,7 @@ typedef struct policydb {
> >         hashtab_t range_tr;
> >
> >         /* file transitions with the last path component */
> > -       hashtab_t filename_trans;
> > +       hashtab_t filename_trans[FILENAME_TRANS_MATCH_NUM];
> >         uint32_t filename_trans_count;
> >
> >         ebitmap_t *type_attr_map;
> > @@ -657,7 +666,8 @@ extern int policydb_sort_ocontexts(policydb_t *p)=
;
> >  extern int policydb_filetrans_insert(policydb_t *p, uint32_t stype,
> >                                      uint32_t ttype, uint32_t tclass,
> >                                      const char *name, char **name_al=
loc,
> > -                                    uint32_t otype, uint32_t *presen=
t_otype);
> > +                                    uint32_t otype, uint32_t match_t=
ype,
> > +                                    uint32_t *present_otype);
> >
> >  /* Deprecated */
> >  extern int policydb_context_isvalid(const policydb_t * p,
> > @@ -758,10 +768,11 @@ extern int policydb_set_target_platform(policyd=
b_t *p, int platform);
> >  #define POLICYDB_VERSION_INFINIBAND            31 /* Linux-specific =
*/
> >  #define POLICYDB_VERSION_GLBLUB                32
> >  #define POLICYDB_VERSION_COMP_FTRANS   33 /* compressed filename tra=
nsitions */
> > +#define POLICYDB_VERSION_PREFIX_SUFFIX 34 /* prefix and suffix filen=
ame transitions */
> >
> >  /* Range of policy versions we understand*/
> >  #define POLICYDB_VERSION_MIN   POLICYDB_VERSION_BASE
> > -#define POLICYDB_VERSION_MAX   POLICYDB_VERSION_COMP_FTRANS
> > +#define POLICYDB_VERSION_MAX   POLICYDB_VERSION_PREFIX_SUFFIX
> >
> >  /* Module versions and specific changes*/
> >  #define MOD_POLICYDB_VERSION_BASE              4
> > @@ -784,9 +795,10 @@ extern int policydb_set_target_platform(policydb=
_t *p, int platform);
> >  #define MOD_POLICYDB_VERSION_INFINIBAND                19
> >  #define MOD_POLICYDB_VERSION_GLBLUB            20
> >  #define MOD_POLICYDB_VERSION_SELF_TYPETRANS    21
> > +#define MOD_POLICYDB_VERSION_PREFIX_SUFFIX     22
> >
> >  #define MOD_POLICYDB_VERSION_MIN MOD_POLICYDB_VERSION_BASE
> > -#define MOD_POLICYDB_VERSION_MAX MOD_POLICYDB_VERSION_SELF_TYPETRANS
> > +#define MOD_POLICYDB_VERSION_MAX MOD_POLICYDB_VERSION_PREFIX_SUFFIX
> >
> >  #define POLICYDB_CONFIG_MLS    1
> >
> > diff --git a/libsepol/src/expand.c b/libsepol/src/expand.c
> > index ee5f9185..4df9521a 100644
> > --- a/libsepol/src/expand.c
> > +++ b/libsepol/src/expand.c
> > @@ -1419,18 +1419,31 @@ static int expand_filename_trans_helper(expan=
d_state_t *state,
> >         rc =3D policydb_filetrans_insert(
> >                 state->out, s + 1, t + 1,
> >                 rule->tclass, rule->name,
> > -               NULL, mapped_otype, &present_otype
> > +               NULL, mapped_otype, rule->match_type, &present_otype
> >         );
> >         if (rc =3D=3D SEPOL_EEXIST) {
> >                 /* duplicate rule, ignore */
> >                 if (present_otype =3D=3D mapped_otype)
> >                         return 0;
> >
> > -               ERR(state->handle, "Conflicting name-based type_trans=
ition %s %s:%s \"%s\":  %s vs %s",
> > +               const char *match_str =3D "";
> > +               switch (rule->match_type) {
> > +               case FILENAME_TRANS_MATCH_EXACT:
> > +                       match_str =3D "";
> > +                       break;
> > +               case FILENAME_TRANS_MATCH_PREFIX:
> > +                       match_str =3D " prefix";
> > +                       break;
> > +               case FILENAME_TRANS_MATCH_SUFFIX:
> > +                       match_str =3D " suffix";
> > +                       break;
> > +               }
> > +               ERR(state->handle, "Conflicting name-based type_trans=
ition %s %s:%s \"%s\"%s:  %s vs %s",
> >                     state->out->p_type_val_to_name[s],
> >                     state->out->p_type_val_to_name[t],
> >                     state->out->p_class_val_to_name[rule->tclass - 1]=
,
> >                     rule->name,
> > +                   match_str,
> >                     state->out->p_type_val_to_name[present_otype - 1]=
,
> >                     state->out->p_type_val_to_name[mapped_otype - 1])=
;
> >                 return -1;
> > diff --git a/libsepol/src/kernel_to_cil.c b/libsepol/src/kernel_to_ci=
l.c
> > index 8fcc385d..81efeaa2 100644
> > --- a/libsepol/src/kernel_to_cil.c
> > +++ b/libsepol/src/kernel_to_cil.c
> > @@ -1869,6 +1869,7 @@ exit:
> >
> >  struct map_filename_trans_args {
> >         struct policydb *pdb;
> > +       uint32_t match_type;
> >         struct strs *strs;
> >  };
> >
> > @@ -1883,6 +1884,19 @@ static int map_filename_trans_to_str(hashtab_k=
ey_t key, void *data, void *arg)
> >         struct ebitmap_node *node;
> >         uint32_t bit;
> >         int rc;
> > +       const char *match_str =3D "";
> > +
> > +       switch (map_args->match_type) {
> > +       case FILENAME_TRANS_MATCH_EXACT:
> > +               match_str =3D "";
> > +               break;
> > +       case FILENAME_TRANS_MATCH_PREFIX:
> > +               match_str =3D " prefix";
> > +               break;
> > +       case FILENAME_TRANS_MATCH_SUFFIX:
> > +               match_str =3D " suffix";
> > +               break;
> > +       }
> >
> >         tgt =3D pdb->p_type_val_to_name[ft->ttype - 1];
> >         class =3D pdb->p_class_val_to_name[ft->tclass - 1];
> > @@ -1893,8 +1907,8 @@ static int map_filename_trans_to_str(hashtab_ke=
y_t key, void *data, void *arg)
> >                 ebitmap_for_each_positive_bit(&datum->stypes, node, b=
it) {
> >                         src =3D pdb->p_type_val_to_name[bit];
> >                         rc =3D strs_create_and_add(strs,
> > -                                                "(typetransition %s =
%s %s \"%s\" %s)",
> > -                                                5, src, tgt, class, =
filename, new);
> > +                                                "(typetransition %s =
%s %s \"%s\"%s %s)",
> > +                                                6, src, tgt, class, =
filename, match_str, new);
> >                         if (rc)
> >                                 return rc;
> >                 }
> > @@ -1919,7 +1933,23 @@ static int write_filename_trans_rules_to_cil(F=
ILE *out, struct policydb *pdb)
> >         args.pdb =3D pdb;
> >         args.strs =3D strs;
> >
> > -       rc =3D hashtab_map(pdb->filename_trans, map_filename_trans_to=
_str, &args);
> > +       args.match_type =3D FILENAME_TRANS_MATCH_EXACT;
> > +       rc =3D hashtab_map(pdb->filename_trans[FILENAME_TRANS_MATCH_E=
XACT],
> > +                        map_filename_trans_to_str, &args);
> > +       if (rc !=3D 0) {
> > +               goto exit;
> > +       }
> > +
> > +       args.match_type =3D FILENAME_TRANS_MATCH_PREFIX;
> > +       rc =3D hashtab_map(pdb->filename_trans[FILENAME_TRANS_MATCH_P=
REFIX],
> > +                        map_filename_trans_to_str, &args);
> > +       if (rc !=3D 0) {
> > +               goto exit;
> > +       }
> > +
> > +       args.match_type =3D FILENAME_TRANS_MATCH_SUFFIX;
> > +       rc =3D hashtab_map(pdb->filename_trans[FILENAME_TRANS_MATCH_S=
UFFIX],
> > +                        map_filename_trans_to_str, &args);
> >         if (rc !=3D 0) {
> >                 goto exit;
> >         }
> > diff --git a/libsepol/src/kernel_to_conf.c b/libsepol/src/kernel_to_c=
onf.c
> > index b0ae16d9..99bef76e 100644
> > --- a/libsepol/src/kernel_to_conf.c
> > +++ b/libsepol/src/kernel_to_conf.c
> > @@ -1845,6 +1845,7 @@ exit:
> >
> >  struct map_filename_trans_args {
> >         struct policydb *pdb;
> > +       uint32_t match_type;
> >         struct strs *strs;
> >  };
> >
> > @@ -1859,6 +1860,19 @@ static int map_filename_trans_to_str(hashtab_k=
ey_t key, void *data, void *arg)
> >         struct ebitmap_node *node;
> >         uint32_t bit;
> >         int rc;
> > +       const char *match_str =3D "";
> > +
> > +       switch (map_args->match_type) {
> > +       case FILENAME_TRANS_MATCH_EXACT:
> > +               match_str =3D "";
> > +               break;
> > +       case FILENAME_TRANS_MATCH_PREFIX:
> > +               match_str =3D " prefix";
> > +               break;
> > +       case FILENAME_TRANS_MATCH_SUFFIX:
> > +               match_str =3D " suffix";
> > +               break;
> > +       }
> >
> >         tgt =3D pdb->p_type_val_to_name[ft->ttype - 1];
> >         class =3D pdb->p_class_val_to_name[ft->tclass - 1];
> > @@ -1869,8 +1883,8 @@ static int map_filename_trans_to_str(hashtab_ke=
y_t key, void *data, void *arg)
> >                 ebitmap_for_each_positive_bit(&datum->stypes, node, b=
it) {
> >                         src =3D pdb->p_type_val_to_name[bit];
> >                         rc =3D strs_create_and_add(strs,
> > -                                                "type_transition %s =
%s:%s %s \"%s\";",
> > -                                                5, src, tgt, class, =
new, filename);
> > +                                                "type_transition %s =
%s:%s %s \"%s\"%s;",
> > +                                                6, src, tgt, class, =
new, filename, match_str);
> >                         if (rc)
> >                                 return rc;
> >                 }
> > @@ -1895,7 +1909,23 @@ static int write_filename_trans_rules_to_conf(=
FILE *out, struct policydb *pdb)
> >         args.pdb =3D pdb;
> >         args.strs =3D strs;
> >
> > -       rc =3D hashtab_map(pdb->filename_trans, map_filename_trans_to=
_str, &args);
> > +       args.match_type =3D FILENAME_TRANS_MATCH_EXACT;
> > +       rc =3D hashtab_map(pdb->filename_trans[FILENAME_TRANS_MATCH_E=
XACT],
> > +                        map_filename_trans_to_str, &args);
> > +       if (rc !=3D 0) {
> > +               goto exit;
> > +       }
> > +
> > +       args.match_type =3D FILENAME_TRANS_MATCH_PREFIX;
> > +       rc =3D hashtab_map(pdb->filename_trans[FILENAME_TRANS_MATCH_P=
REFIX],
> > +                        map_filename_trans_to_str, &args);
> > +       if (rc !=3D 0) {
> > +               goto exit;
> > +       }
> > +
> > +       args.match_type =3D FILENAME_TRANS_MATCH_SUFFIX;
> > +       rc =3D hashtab_map(pdb->filename_trans[FILENAME_TRANS_MATCH_S=
UFFIX],
> > +                        map_filename_trans_to_str, &args);
> >         if (rc !=3D 0) {
> >                 goto exit;
> >         }
> > diff --git a/libsepol/src/link.c b/libsepol/src/link.c
> > index 3b7742bc..f432087f 100644
> > --- a/libsepol/src/link.c
> > +++ b/libsepol/src/link.c
> > @@ -1440,6 +1440,7 @@ static int copy_filename_trans_list(filename_tr=
ans_rule_t * list,
> >                 new_rule->name =3D strdup(cur->name);
> >                 if (!new_rule->name)
> >                         goto err;
> > +               new_rule->match_type =3D cur->match_type;
> >
> >                 if (type_set_or_convert(&cur->stypes, &new_rule->styp=
es, module) ||
> >                     type_set_or_convert(&cur->ttypes, &new_rule->ttyp=
es, module))
> > diff --git a/libsepol/src/module_to_cil.c b/libsepol/src/module_to_ci=
l.c
> > index d2868019..98e1c7ba 100644
> > --- a/libsepol/src/module_to_cil.c
> > +++ b/libsepol/src/module_to_cil.c
> > @@ -1609,6 +1609,7 @@ static int filename_trans_to_cil(int indent, st=
ruct policydb *pdb, struct filena
> >         unsigned int ttype;
> >         struct type_set *ts;
> >         struct filename_trans_rule *rule;
> > +       const char *match_str =3D "";
> >
> >         for (rule =3D rules; rule !=3D NULL; rule =3D rule->next) {
> >                 ts =3D &rule->stypes;
> > @@ -1623,19 +1624,31 @@ static int filename_trans_to_cil(int indent, =
struct policydb *pdb, struct filena
> >                         goto exit;
> >                 }
> >
> > +               switch (rule->match_type) {
> > +               case FILENAME_TRANS_MATCH_EXACT:
> > +                       match_str =3D "";
> > +                       break;
> > +               case FILENAME_TRANS_MATCH_PREFIX:
> > +                       match_str =3D " prefix";
> > +                       break;
> > +               case FILENAME_TRANS_MATCH_SUFFIX:
> > +                       match_str =3D " suffix";
> > +                       break;
> > +               }
> > +
> >                 for (stype =3D 0; stype < num_stypes; stype++) {
> >                         for (ttype =3D 0; ttype < num_ttypes; ttype++=
) {
> > -                               cil_println(indent, "(typetransition =
%s %s %s \"%s\" %s)",
> > +                               cil_println(indent, "(typetransition =
%s %s %s \"%s\"%s %s)",
> >                                             stypes[stype], ttypes[tty=
pe],
> >                                             pdb->p_class_val_to_name[=
rule->tclass - 1],
> > -                                           rule->name,
> > +                                           rule->name, match_str,
> >                                             pdb->p_type_val_to_name[r=
ule->otype - 1]);
> >                         }
> >                         if (rule->flags & RULE_SELF) {
> > -                               cil_println(indent, "(typetransition =
%s self %s \"%s\" %s)",
> > +                               cil_println(indent, "(typetransition =
%s self %s \"%s\"%s %s)",
> >                                             stypes[stype],
> >                                             pdb->p_class_val_to_name[=
rule->tclass - 1],
> > -                                           rule->name,
> > +                                           rule->name, match_str,
> >                                             pdb->p_type_val_to_name[r=
ule->otype - 1]);
> >                         }
> >                 }
> > diff --git a/libsepol/src/policydb.c b/libsepol/src/policydb.c
> > index f9537caa..29d7971a 100644
> > --- a/libsepol/src/policydb.c
> > +++ b/libsepol/src/policydb.c
> > @@ -208,6 +208,13 @@ static const struct policydb_compat_info policyd=
b_compat[] =3D {
> >          .ocon_num =3D OCON_IBENDPORT + 1,
> >          .target_platform =3D SEPOL_TARGET_SELINUX,
> >         },
> > +       {
> > +        .type =3D POLICY_KERN,
> > +        .version =3D POLICYDB_VERSION_PREFIX_SUFFIX,
> > +        .sym_num =3D SYM_NUM,
> > +        .ocon_num =3D OCON_IBENDPORT + 1,
> > +        .target_platform =3D SEPOL_TARGET_SELINUX,
> > +       },
> >         {
> >          .type =3D POLICY_BASE,
> >          .version =3D MOD_POLICYDB_VERSION_BASE,
> > @@ -334,6 +341,13 @@ static const struct policydb_compat_info policyd=
b_compat[] =3D {
> >          .ocon_num =3D OCON_IBENDPORT + 1,
> >          .target_platform =3D SEPOL_TARGET_SELINUX,
> >         },
> > +       {
> > +        .type =3D POLICY_BASE,
> > +        .version =3D MOD_POLICYDB_VERSION_PREFIX_SUFFIX,
> > +        .sym_num =3D SYM_NUM,
> > +        .ocon_num =3D OCON_IBENDPORT + 1,
> > +        .target_platform =3D SEPOL_TARGET_SELINUX,
> > +       },
> >         {
> >          .type =3D POLICY_MOD,
> >          .version =3D MOD_POLICYDB_VERSION_BASE,
> > @@ -460,6 +474,13 @@ static const struct policydb_compat_info policyd=
b_compat[] =3D {
> >          .ocon_num =3D 0,
> >          .target_platform =3D SEPOL_TARGET_SELINUX,
> >         },
> > +       {
> > +        .type =3D POLICY_MOD,
> > +        .version =3D MOD_POLICYDB_VERSION_PREFIX_SUFFIX,
> > +        .sym_num =3D SYM_NUM,
> > +        .ocon_num =3D 0,
> > +        .target_platform =3D SEPOL_TARGET_SELINUX,
> > +       },
> >  };
> >
> >  #if 0
> > @@ -909,10 +930,14 @@ int policydb_init(policydb_t * p)
> >         if (rc)
> >                 goto err;
> >
> > -       p->filename_trans =3D hashtab_create(filenametr_hash, filenam=
etr_cmp, (1 << 10));
> > -       if (!p->filename_trans) {
> > -               rc =3D -ENOMEM;
> > -               goto err;
> > +       for (i =3D 0; i < FILENAME_TRANS_MATCH_NUM; i++) {
> > +               p->filename_trans[i] =3D hashtab_create(filenametr_ha=
sh,
> > +                                                     filenametr_cmp,
> > +                                                     (1 << 10));
> > +               if (!p->filename_trans[i]) {
> > +                       rc =3D -ENOMEM;
> > +                       goto err;
> > +               }
> >         }
> >
> >         p->range_tr =3D hashtab_create(rangetr_hash, rangetr_cmp, 256=
);
> > @@ -926,7 +951,9 @@ int policydb_init(policydb_t * p)
> >
> >         return 0;
> >  err:
> > -       hashtab_destroy(p->filename_trans);
> > +       for (i =3D 0; i < FILENAME_TRANS_MATCH_NUM; i++) {
> > +               hashtab_destroy(p->filename_trans[i]);
> > +       }
> >         hashtab_destroy(p->range_tr);
> >         for (i =3D 0; i < SYM_NUM; i++) {
> >                 hashtab_destroy(p->symtab[i].table);
> > @@ -1564,8 +1591,10 @@ void policydb_destroy(policydb_t * p)
> >         if (lra)
> >                 free(lra);
> >
> > -       hashtab_map(p->filename_trans, filenametr_destroy, NULL);
> > -       hashtab_destroy(p->filename_trans);
> > +       for (i =3D 0; i < FILENAME_TRANS_MATCH_NUM; i++) {
> > +               hashtab_map(p->filename_trans[i], filenametr_destroy,=
 NULL);
> > +               hashtab_destroy(p->filename_trans[i]);
> > +       }
> >
> >         hashtab_map(p->range_tr, range_tr_destroy, NULL);
> >         hashtab_destroy(p->range_tr);
> > @@ -2599,7 +2628,7 @@ static int role_allow_read(role_allow_t ** r, s=
truct policy_file *fp)
> >  int policydb_filetrans_insert(policydb_t *p, uint32_t stype, uint32_=
t ttype,
> >                               uint32_t tclass, const char *name,
> >                               char **name_alloc, uint32_t otype,
> > -                             uint32_t *present_otype)
> > +                             uint32_t match_type, uint32_t *present_=
otype)
> >  {
> >         filename_trans_key_t *ft, key;
> >         filename_trans_datum_t *datum, *last;
> > @@ -2609,7 +2638,8 @@ int policydb_filetrans_insert(policydb_t *p, ui=
nt32_t stype, uint32_t ttype,
> >         key.name =3D (char *)name;
> >
> >         last =3D NULL;
> > -       datum =3D hashtab_search(p->filename_trans, (hashtab_key_t)&k=
ey);
> > +       datum =3D hashtab_search(p->filename_trans[match_type],
> > +                              (hashtab_key_t)&key);
> >         while (datum) {
> >                 if (ebitmap_get_bit(&datum->stypes, stype - 1)) {
> >                         if (present_otype)
> > @@ -2657,7 +2687,8 @@ int policydb_filetrans_insert(policydb_t *p, ui=
nt32_t stype, uint32_t ttype,
> >                         ft->tclass =3D tclass;
> >                         ft->name =3D name_dup;
> >
> > -                       if (hashtab_insert(p->filename_trans, (hashta=
b_key_t)ft,
> > +                       if (hashtab_insert(p->filename_trans[match_ty=
pe],
> > +                                          (hashtab_key_t)ft,
> >                                            (hashtab_datum_t)datum)) {
> >                                 free(name_dup);
> >                                 free(datum);
> > @@ -2704,8 +2735,9 @@ static int filename_trans_read_one_compat(polic=
ydb_t *p, struct policy_file *fp)
> >         tclass =3D le32_to_cpu(buf[2]);
> >         otype  =3D le32_to_cpu(buf[3]);
> >
> > +       // This version does not contain other than exact filename tr=
ansitions
> >         rc =3D policydb_filetrans_insert(p, stype, ttype, tclass, nam=
e, &name,
> > -                                      otype, NULL);
> > +                                      otype, FILENAME_TRANS_MATCH_EX=
ACT, NULL);
> >         if (rc) {
> >                 if (rc !=3D SEPOL_EEXIST)
> >                         goto err;
> > @@ -2753,7 +2785,8 @@ out:
> >         return rc;
> >  }
> >
> > -static int filename_trans_read_one(policydb_t *p, struct policy_file=
 *fp)
> > +static int filename_trans_read_one(policydb_t *p, uint32_t match_typ=
e,
> > +                                  struct policy_file *fp)
> >  {
> >         filename_trans_key_t *ft =3D NULL;
> >         filename_trans_datum_t **dst, *datum, *first =3D NULL;
> > @@ -2823,7 +2856,7 @@ static int filename_trans_read_one(policydb_t *=
p, struct policy_file *fp)
> >         ft->tclass =3D tclass;
> >         ft->name =3D name;
> >
> > -       rc =3D hashtab_insert(p->filename_trans, (hashtab_key_t)ft,
> > +       rc =3D hashtab_insert(p->filename_trans[match_type], (hashtab=
_key_t)ft,
> >                             (hashtab_datum_t)first);
> >         if (rc)
> >                 goto err;
> > @@ -2842,7 +2875,8 @@ err:
> >         return -1;
> >  }
> >
> > -static int filename_trans_read(policydb_t *p, struct policy_file *fp=
)
> > +static int filename_trans_read(policydb_t *p, struct policy_file *fp=
,
> > +                              uint32_t match_type)
> >  {
> >         unsigned int i;
> >         uint32_t buf[1], nel;
> > @@ -2855,13 +2889,17 @@ static int filename_trans_read(policydb_t *p,=
 struct policy_file *fp)
> >
> >         if (p->policyvers < POLICYDB_VERSION_COMP_FTRANS) {
> >                 for (i =3D 0; i < nel; i++) {
> > +                       /*
> > +                        * this version does not have other than exac=
t match
> > +                        * transitions
> > +                        */
> >                         rc =3D filename_trans_read_one_compat(p, fp);
> >                         if (rc < 0)
> >                                 return -1;
> >                 }
> >         } else {
> >                 for (i =3D 0; i < nel; i++) {
> > -                       rc =3D filename_trans_read_one(p, fp);
> > +                       rc =3D filename_trans_read_one(p, match_type,=
 fp);
> >                         if (rc < 0)
> >                                 return -1;
> >                 }
> > @@ -3837,7 +3875,7 @@ static int role_allow_rule_read(role_allow_rule=
_t ** r, struct policy_file *fp)
> >  static int filename_trans_rule_read(policydb_t *p, filename_trans_ru=
le_t **r,
> >                                     struct policy_file *fp)
> >  {
> > -       uint32_t buf[3], nel, i, len;
> > +       uint32_t buf[4], nel, i, len;
> >         unsigned int entries;
> >         filename_trans_rule_t *ftr, *lftr;
> >         int rc;
> > @@ -3883,7 +3921,9 @@ static int filename_trans_rule_read(policydb_t =
*p, filename_trans_rule_t **r,
> >                 if (type_set_read(&ftr->ttypes, fp))
> >                         return -1;
> >
> > -               if (p->policyvers >=3D MOD_POLICYDB_VERSION_SELF_TYPE=
TRANS)
> > +               if (p->policyvers >=3D MOD_POLICYDB_VERSION_PREFIX_SU=
FFIX)
> > +                       entries =3D 4;
> > +               else if (p->policyvers >=3D MOD_POLICYDB_VERSION_SELF=
_TYPETRANS)
> >                         entries =3D 3;
> >                 else
> >                         entries =3D 2;
> > @@ -3895,6 +3935,8 @@ static int filename_trans_rule_read(policydb_t =
*p, filename_trans_rule_t **r,
> >                 ftr->otype =3D le32_to_cpu(buf[1]);
> >                 if (p->policyvers >=3D MOD_POLICYDB_VERSION_SELF_TYPE=
TRANS)
> >                         ftr->flags =3D le32_to_cpu(buf[2]);
> > +               if (p->policyvers >=3D  MOD_POLICYDB_VERSION_PREFIX_S=
UFFIX)
> > +                       ftr->match_type =3D le32_to_cpu(buf[3]);
> >         }
> >
> >         return 0;
> > @@ -4470,7 +4512,11 @@ int policydb_read(policydb_t * p, struct polic=
y_file *fp, unsigned verbose)
> >                 if (role_allow_read(&p->role_allow, fp))
> >                         goto bad;
> >                 if (r_policyvers >=3D POLICYDB_VERSION_FILENAME_TRANS=
 &&
> > -                   filename_trans_read(p, fp))
> > +                   filename_trans_read(p, fp, FILENAME_TRANS_MATCH_E=
XACT))
> > +                       goto bad;
> > +               if (r_policyvers >=3D POLICYDB_VERSION_PREFIX_SUFFIX =
&&
> > +                   (filename_trans_read(p, fp, FILENAME_TRANS_MATCH_=
PREFIX) ||
> > +                    filename_trans_read(p, fp, FILENAME_TRANS_MATCH_=
SUFFIX)))
> >                         goto bad;
> >         } else {
> >                 /* first read the AV rule blocks, then the scope tabl=
es */
> > diff --git a/libsepol/src/policydb_validate.c b/libsepol/src/policydb=
_validate.c
> > index 892a0ffd..3f2ba5ea 100644
> > --- a/libsepol/src/policydb_validate.c
> > +++ b/libsepol/src/policydb_validate.c
> > @@ -1,4 +1,3 @@
> > -
> >  #include <sepol/policydb/conditional.h>
> >  #include <sepol/policydb/ebitmap.h>
> >  #include <sepol/policydb/policydb.h>
> > @@ -1115,14 +1114,27 @@ bad:
> >         return -1;
> >  }
> >
> > -static int validate_filename_trans_hashtab(sepol_handle_t *handle, h=
ashtab_t filename_trans, validate_t flavors[])
> > +static int validate_filename_trans_hashtabs(sepol_handle_t *handle,
> > +                                           const policydb_t *p,
> > +                                           validate_t flavors[])
> >  {
> > -       if (hashtab_map(filename_trans, validate_filename_trans, flav=
ors)) {
> > -               ERR(handle, "Invalid filename trans");
> > -               return -1;
> > +       if (hashtab_map(p->filename_trans[FILENAME_TRANS_MATCH_EXACT]=
,
> > +                       validate_filename_trans, flavors))
> > +               goto bad;
> > +
> > +       if (p->policyvers >=3D POLICYDB_VERSION_PREFIX_SUFFIX) {
> > +               if (hashtab_map(p->filename_trans[FILENAME_TRANS_MATC=
H_PREFIX],
> > +                               validate_filename_trans, flavors))
> > +                       goto bad;
> > +               if (hashtab_map(p->filename_trans[FILENAME_TRANS_MATC=
H_SUFFIX],
> > +                               validate_filename_trans, flavors))
> > +                       goto bad;
> >         }
> >
> >         return 0;
> > +bad:
> > +       ERR(handle, "Invalid filename trans");
> > +       return -1;
> >  }
> >
> >  static int validate_context(const context_struct_t *con, validate_t =
flavors[], int mls)
> > @@ -1334,6 +1346,15 @@ static int validate_filename_trans_rules(sepol=
_handle_t *handle, const filename_
> >                 if (validate_simpletype(filename_trans->otype, p, fla=
vors))
> >                         goto bad;
> >
> > +               switch (filename_trans->match_type) {
> > +               case FILENAME_TRANS_MATCH_EXACT:
> > +               case FILENAME_TRANS_MATCH_PREFIX:
> > +               case FILENAME_TRANS_MATCH_SUFFIX:
> > +                       break;
> > +               default:
> > +                       goto bad;
> > +               }
> > +
> >                 /* currently only the RULE_SELF flag can be set */
> >                 if ((filename_trans->flags & ~RULE_SELF) !=3D 0)
> >                         goto bad;
> > @@ -1554,9 +1575,10 @@ int policydb_validate(sepol_handle_t *handle, =
const policydb_t *p)
> >                         goto bad;
> >                 if (validate_role_allows(handle, p->role_allow, flavo=
rs))
> >                         goto bad;
> > -               if (p->policyvers >=3D POLICYDB_VERSION_FILENAME_TRAN=
S)
> > -                       if (validate_filename_trans_hashtab(handle, p=
->filename_trans, flavors))
> > +               if (p->policyvers >=3D POLICYDB_VERSION_FILENAME_TRAN=
S) {
> > +                       if (validate_filename_trans_hashtabs(handle, =
p, flavors))
> >                                 goto bad;
> > +               }
> >         } else {
> >                 if (validate_avrule_blocks(handle, p->global, p, flav=
ors))
> >                         goto bad;
> > diff --git a/libsepol/src/write.c b/libsepol/src/write.c
> > index 283d11c8..c9398a98 100644
> > --- a/libsepol/src/write.c
> > +++ b/libsepol/src/write.c
> > @@ -653,7 +653,8 @@ static int filename_write_one(hashtab_key_t key, =
void *data, void *ptr)
> >         return 0;
> >  }
> >
> > -static int filename_trans_write(struct policydb *p, void *fp)
> > +static int filename_trans_write(struct policydb *p, uint32_t match_t=
ype,
> > +                               void *fp)
> >  {
> >         size_t items;
> >         uint32_t buf[1];
> > @@ -663,20 +664,25 @@ static int filename_trans_write(struct policydb=
 *p, void *fp)
> >                 return 0;
> >
> >         if (p->policyvers < POLICYDB_VERSION_COMP_FTRANS) {
> > +               /*
> > +                * This version does not have other than exact match
> > +                * transitions, there is no need to count other ones.
> > +                */
> >                 buf[0] =3D cpu_to_le32(p->filename_trans_count);
> >                 items =3D put_entry(buf, sizeof(uint32_t), 1, fp);
> >                 if (items !=3D 1)
> >                         return POLICYDB_ERROR;
> >
> > -               rc =3D hashtab_map(p->filename_trans, filename_write_=
one_compat,
> > -                                fp);
> > +               rc =3D hashtab_map(p->filename_trans[match_type],
> > +                                filename_write_one_compat, fp);
> >         } else {
> > -               buf[0] =3D cpu_to_le32(p->filename_trans->nel);
> > +               buf[0] =3D cpu_to_le32(p->filename_trans[match_type]-=
>nel);
> >                 items =3D put_entry(buf, sizeof(uint32_t), 1, fp);
> >                 if (items !=3D 1)
> >                         return POLICYDB_ERROR;
> >
> > -               rc =3D hashtab_map(p->filename_trans, filename_write_=
one, fp);
> > +               rc =3D hashtab_map(p->filename_trans[match_type],
> > +                                filename_write_one, fp);
> >         }
> >         return rc;
> >  }
> > @@ -1944,7 +1950,7 @@ static int filename_trans_rule_write(policydb_t=
 *p, filename_trans_rule_t *t,
> >  {
> >         int nel =3D 0;
> >         size_t items, entries;
> > -       uint32_t buf[3], len;
> > +       uint32_t buf[4], len;
> >         filename_trans_rule_t *ftr;
> >
> >         for (ftr =3D t; ftr; ftr =3D ftr->next)
> > @@ -1974,8 +1980,11 @@ static int filename_trans_rule_write(policydb_=
t *p, filename_trans_rule_t *t,
> >                 buf[0] =3D cpu_to_le32(ftr->tclass);
> >                 buf[1] =3D cpu_to_le32(ftr->otype);
> >                 buf[2] =3D cpu_to_le32(ftr->flags);
> > +               buf[3] =3D cpu_to_le32(ftr->match_type);
> >
> > -               if (p->policyvers >=3D MOD_POLICYDB_VERSION_SELF_TYPE=
TRANS) {
> > +               if (p->policyvers >=3D MOD_POLICYDB_VERSION_PREFIX_SU=
FFIX) {
> > +                       entries =3D 4;
> > +               } else if (p->policyvers >=3D MOD_POLICYDB_VERSION_SE=
LF_TYPETRANS) {
> >                         entries =3D 3;
> >                 } else if (!(ftr->flags & RULE_SELF)) {
> >                         entries =3D 2;
> > @@ -2370,12 +2379,29 @@ int policydb_write(policydb_t * p, struct pol=
icy_file *fp)
> >                 if (role_allow_write(p->role_allow, fp))
> >                         return POLICYDB_ERROR;
> >                 if (p->policyvers >=3D POLICYDB_VERSION_FILENAME_TRAN=
S) {
> > -                       if (filename_trans_write(p, fp))
> > +                       if (filename_trans_write(p, FILENAME_TRANS_MA=
TCH_EXACT,
> > +                                                fp))
> >                                 return POLICYDB_ERROR;
> >                 } else {
> > -                       if (p->filename_trans)
> > +                       if (p->filename_trans[FILENAME_TRANS_MATCH_EX=
ACT])
> >                                 WARN(fp->handle, "Discarding filename=
 type transition rules");
> >                 }
> > +               if (p->policyvers >=3D POLICYDB_VERSION_PREFIX_SUFFIX=
) {
> > +                       if (filename_trans_write(p, FILENAME_TRANS_MA=
TCH_PREFIX,
> > +                                                fp) ||
> > +                           filename_trans_write(p, FILENAME_TRANS_MA=
TCH_SUFFIX,
> > +                                                fp))
> > +                               return POLICYDB_ERROR;
> > +               } else {
> > +                       if (p->filename_trans[FILENAME_TRANS_MATCH_PR=
EFIX] &&
> > +                           p->filename_trans[FILENAME_TRANS_MATCH_PR=
EFIX]->nel)
> > +                               WARN(fp->handle,
> > +                                    "Discarding prefix filename type=
 transition rules");
> > +                       if (p->filename_trans[FILENAME_TRANS_MATCH_SU=
FFIX] &&
> > +                           p->filename_trans[FILENAME_TRANS_MATCH_SU=
FFIX]->nel)
> > +                               WARN(fp->handle,
> > +                                    "Discarding suffix filename type=
 transition rules");
> > +               }
> >         } else {
> >                 if (avrule_block_write(p->global, num_syms, p, fp) =3D=
=3D -1) {
> >                         return POLICYDB_ERROR;
> > --
> > 2.41.0
> >
>=20
> I fixed up the validate stuff so I could do some testing.
>=20
> I found an issue when compiling CIL to policy version 32 (version 33
> works fine).
>=20
> The problem also happens with a binary generated from a policy.conf
> file as well.
> WIth modules, it is a little more complicated. If I compile the
> modules with module version 22 and then expand to a binary version 32,
> then I get the same problem.
> If I compile the modules to some version less than 22 and then expand
> to a binary version 32, there is no problem.

I have looked at it and discovered the cause of the problem. The
filename_trans_count attribute of the policydb structure (which is used
for compatibility when writing from 33 to older policy versions) was
erroneously incremented for all match types, not only exact match.
Therefore, when writing to a binary version 32 with prefix/suffix rules
loaded, the number of filename transitions in the file is incorrect.

I will send updated and rebased patch soon, also with changes suggested
by Christian.

Sorry for the inconvenience with the validate stuff.

>=20
>=20
> With this CIL policy:
>=20
> (handleunknown deny)
> (class CLASS01 (PERM01))
> (class CLASS02 (PERM02))
> (class CLASS03 (PERM03))
> (classorder (CLASS01 CLASS02 CLASS03))
> (sid kernel)
> (sidorder (kernel))
> (user USER1)
> (role ROLE1)
> (type TYPE1)
> (category CAT1)
> (categoryorder (CAT1))
> (sensitivity SENS1)
> (sensitivityorder (SENS1))
> (sensitivitycategory SENS1 (CAT1))
> (allow TYPE1 self (CLASS01 (PERM01)))
> (roletype ROLE1 TYPE1)
> (userrole USER1 ROLE1)
> (userlevel USER1 (SENS1))
> (userrange USER1 ((SENS1)(SENS1 (CAT1))))
> (sidcontext kernel (USER1 ROLE1 TYPE1 ((SENS1)(SENS1))))
>=20
> (type ta)
> (type tb)
> (type tc)
>=20
> (typetransition ta tb CLASS01 "file01" tc)
> (typetransition ta tb CLASS02 "file02" prefix tc)
> (typetransition ta tb CLASS03 "file03" suffix tc)
>=20
> Compiling to a binary policy works fine:
> ~/local/usr/bin/secilc -c 32 -o test.bin test.cil
>=20
> Trying to convert that binary back to CIL does not:
> ~/local/usr/bin/checkpolicy -C -b -o test.bin.cil test.bin
>=20
> I get a generic "error(s) encountered while parsing configuration"
> from checkpolicy, so I don't know what is causing the problem yet.
> Like I said, this works for policy version 33.
>=20
> I'll let you know if I figure out more.
>=20
> Thanks,
> Jim

Thank you,

--=20
Juraj Marcin
