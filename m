Return-Path: <selinux+bounces-2224-lists+selinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AFBB9BF785
	for <lists+selinux@lfdr.de>; Wed,  6 Nov 2024 20:50:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9FCEA1F21D7A
	for <lists+selinux@lfdr.de>; Wed,  6 Nov 2024 19:50:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49AC920A5F6;
	Wed,  6 Nov 2024 19:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cjvIXC20"
X-Original-To: selinux@vger.kernel.org
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AE72212634
	for <selinux@vger.kernel.org>; Wed,  6 Nov 2024 19:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730922198; cv=none; b=TAEwzB6pN+5HAWiezcH7wjhtvbaRYD64sCVfgqhPImPZSLZjZlhweUuEjE+iVMmlapkFbWH0pnoKk2RNu7ASNQc0pBumhgW6fbRsqAUSk+qmQvijlUiuPnoyLp1LSakOMv9MpX8uGodIXQPMi4WkPTKjpvpTY/ktGqO17rFelUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730922198; c=relaxed/simple;
	bh=Hxsw05o+9Q0D5xOmr4wFlnl+iTkc8lsUSzLIxMEz/PU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wad2ef1CedD804WFmK93NN8TSiZ4fE+3wVF3/XsOl4sDbG5QWak2I/0SoL+6KV3PcHOT4d5NMXzNN6fq0w4ffLfdO26dTPuKp6R5lUibaauH7qmYeSw1+WRoOgRMmmyvX3Ezc1cq7CYfw5WcZn9GDWiC02ioiiKejy1maFMUuNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cjvIXC20; arc=none smtp.client-ip=209.85.222.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-84fc21ac668so34351241.1
        for <selinux@vger.kernel.org>; Wed, 06 Nov 2024 11:43:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730922195; x=1731526995; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dVeUbv6ZAGIoWkTi/rR5Jls+ppeHhoPDlrAmzfMw94E=;
        b=cjvIXC20eI3PqlYqLXiGgPFbnYUg49VdRa46oFxlHv6a1ktE/ofeO2qWCZxZq6Pwsp
         +rC0hj8KpqVuMgpgd2qftyILVqSCq4WZfDMs3snOh5JfnMHtx4Z8p7i92VuV5r6d3h+v
         ayWk8trLBGQHsqIfkvH5XCKJAdUUoddsNiD/lvirp6LiOy+STVdNMgUH3XrA2ugV45ww
         7ShEBeQQtevq0+izUwy5Bbc3fOa/4L7bHO39ieL152WPLqAUWqQmGLt+ACqct+MuCEsQ
         51HTgC938+fsdta86fK7bX8in/N+DFdCutb3tvqFFO78aYd2kmzntVt2mktJS8g/tC86
         E7zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730922195; x=1731526995;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dVeUbv6ZAGIoWkTi/rR5Jls+ppeHhoPDlrAmzfMw94E=;
        b=Rsm2MtpQR85jezHJwMK7QIbA+6sn4McKsih0MaL6P90vsyfz2ThOZW1pW+8egU5AzH
         XJlNQX9HP5g/LpO90PFIvhRowon+ODoe2xLtmDLjEpiy550pwJkJUWYHZWwitm+J4dpM
         J2bhyD5SrYGQFpoIfdkfzpoag03SSKlpTOSBLj6DV2pjq3WK8vpSTCsbZQW+TZgKXQxm
         wznK1CwQhjNyrJ27DiwUsxn1VokRA7Mcz848E0AErrOgF6fpOyyrRvgGAxkz9RbOuCas
         qKN57Yl1deMVueeRRquWb97KcU7DtP1+XsiSy6lxN21U8BMl+zLx0LpA0Sc3IRVLaPzr
         UinQ==
X-Gm-Message-State: AOJu0YwOV4OqTRPLE9rqNwurM2C8XuMRNafk6t+0mMQ+0xUITpgPALhY
	wCpakrmA3hsgtSXqPUmNV8VtghRpz64hhrIGccP+fTPq1TBSfCATPeaPLtelmoi1xFX0H0geRn4
	PmrTEXNNObi8H3EIbmEDEdVI8kpU=
X-Google-Smtp-Source: AGHT+IFg50rtmdf2UpM/PRKT8gpqiscN+ZkMbyCtDGk28yIVO83jPILOUHTclGj1fwqxR1nyRCQ8vyWU3FcUWDbJfF0=
X-Received: by 2002:a05:6102:390b:b0:4a3:e644:54dd with SMTP id
 ada2fe7eead31-4a8cfb4d9e4mr38495439137.12.1730922195142; Wed, 06 Nov 2024
 11:43:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: selinux@vger.kernel.org
List-Id: <selinux.vger.kernel.org>
List-Subscribe: <mailto:selinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:selinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241105210618.326533-1-cgoettsche@seltendoof.de>
In-Reply-To: <20241105210618.326533-1-cgoettsche@seltendoof.de>
From: James Carter <jwcart2@gmail.com>
Date: Wed, 6 Nov 2024 14:43:04 -0500
Message-ID: <CAP+JOzTMjLah6iX0WYzQUOQ18-s9Yj5-yJ6F_w=Yf5MMoW7zWQ@mail.gmail.com>
Subject: Re: [PATCH] checkpolicy: avoid memory leaks on redeclarations
To: cgzones@googlemail.com
Cc: selinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 5, 2024 at 4:06=E2=80=AFPM Christian G=C3=B6ttsche
<cgoettsche@seltendoof.de> wrote:
>
> From: Christian G=C3=B6ttsche <cgzones@googlemail.com>
>
> If declare_symbol() returns 1 the id and the datum are already defined
> and not consumed by the function, so it they must be free'd by the
> caller.
>
> Example policy (generated by fuzzer):
>
>     class s sid e class s{i}optional{require{bool K;}bool K true;
>
> Reported-by: oss-fuzz (issue 377544445)
> Signed-off-by: Christian G=C3=B6ttsche <cgzones@googlemail.com>

Acked-by: James Carter <jwcart2@gmail.com>

> ---
>  checkpolicy/module_compiler.c |  2 +-
>  checkpolicy/module_compiler.h |  2 +-
>  checkpolicy/policy_define.c   | 72 +++++++++++++++++++++++------------
>  3 files changed, 49 insertions(+), 27 deletions(-)
>
> diff --git a/checkpolicy/module_compiler.c b/checkpolicy/module_compiler.=
c
> index 4efd77bf..3a7ad1bb 100644
> --- a/checkpolicy/module_compiler.c
> +++ b/checkpolicy/module_compiler.c
> @@ -190,7 +190,7 @@ static int create_symbol(uint32_t symbol_type, hashta=
b_key_t key, hashtab_datum_
>   * not be restricted pointers. */
>  int declare_symbol(uint32_t symbol_type,
>                    hashtab_key_t key, hashtab_datum_t datum,
> -                  uint32_t * dest_value, uint32_t * datum_value)
> +                  uint32_t * dest_value, const uint32_t * datum_value)
>  {
>         avrule_decl_t *decl =3D stack_top->decl;
>         int ret =3D create_symbol(symbol_type, key, datum, dest_value, SC=
OPE_DECL);
> diff --git a/checkpolicy/module_compiler.h b/checkpolicy/module_compiler.=
h
> index e43bc6c0..2fe3455d 100644
> --- a/checkpolicy/module_compiler.h
> +++ b/checkpolicy/module_compiler.h
> @@ -28,7 +28,7 @@ int define_policy(int pass, int module_header_given);
>   */
>  int declare_symbol(uint32_t symbol_type,
>                    hashtab_key_t key, hashtab_datum_t datum,
> -                  uint32_t * dest_value, uint32_t * datum_value);
> +                  uint32_t * dest_value, const uint32_t * datum_value);
>
>  role_datum_t *declare_role(unsigned char isattr);
>  type_datum_t *declare_type(unsigned char primary, unsigned char isattr);
> diff --git a/checkpolicy/policy_define.c b/checkpolicy/policy_define.c
> index f8a10154..9aae8378 100644
> --- a/checkpolicy/policy_define.c
> +++ b/checkpolicy/policy_define.c
> @@ -156,9 +156,9 @@ static int id_has_dot(const char *id)
>
>  int define_class(void)
>  {
> -       char *id =3D 0;
> -       class_datum_t *datum =3D 0;
> -       int ret;
> +       char *id =3D NULL;
> +       class_datum_t *datum =3D NULL;
> +       int ret =3D -1;
>         uint32_t value;
>
>         if (pass =3D=3D 2) {
> @@ -175,27 +175,29 @@ int define_class(void)
>         datum =3D (class_datum_t *) malloc(sizeof(class_datum_t));
>         if (!datum) {
>                 yyerror("out of memory");
> -               goto bad;
> +               goto cleanup;
>         }
>         memset(datum, 0, sizeof(class_datum_t));
>         ret =3D declare_symbol(SYM_CLASSES, id, datum, &value, &value);
>         switch (ret) {
>         case -3:{
>                         yyerror("Out of memory!");
> -                       goto bad;
> +                       goto cleanup;
>                 }
>         case -2:{
>                         yyerror2("duplicate declaration of class %s", id)=
;
> -                       goto bad;
> +                       goto cleanup;
>                 }
>         case -1:{
>                         yyerror("could not declare class here");
> -                       goto bad;
> +                       goto cleanup;
>                 }
> -       case 0:
> -       case 1:{
> +       case 0: {
>                         break;
>                 }
> +       case 1:{
> +                       goto cleanup;
> +               }
>         default:{
>                         assert(0);      /* should never get here */
>                 }
> @@ -203,12 +205,10 @@ int define_class(void)
>         datum->s.value =3D value;
>         return 0;
>
> -      bad:
> -       if (id)
> -               free(id);
> -       if (datum)
> -               free(datum);
> -       return -1;
> +      cleanup:
> +       free(id);
> +       free(datum);
> +       return ret =3D=3D 1 ? 0 : -1;
>  }
>
>  int define_permissive(void)
> @@ -785,8 +785,13 @@ int define_sens(void)
>                         yyerror2("could not declare sensitivity level %s =
here", id);
>                         goto bad;
>                 }
> -       case 0:
> +       case 0: {
> +                       break;
> +               }
>         case 1:{
> +                       level_datum_destroy(datum);
> +                       free(datum);
> +                       free(id);
>                         break;
>                 }
>         default:{
> @@ -827,8 +832,13 @@ int define_sens(void)
>                                     ("could not declare sensitivity alias=
 %s here", id);
>                                 goto bad_alias;
>                         }
> -               case 0:
> +               case 0: {
> +                               break;
> +                       }
>                 case 1:{
> +                               level_datum_destroy(aliasdatum);
> +                               free(aliasdatum);
> +                               free(id);
>                                 break;
>                         }
>                 default:{
> @@ -957,15 +967,20 @@ int define_category(void)
>                         yyerror2("could not declare category %s here", id=
);
>                         goto bad;
>                 }
> -       case 0:
> +       case 0:{
> +                       datum->s.value =3D value;
> +                       break;
> +               }
>         case 1:{
> +                       cat_datum_destroy(datum);
> +                       free(datum);
> +                       free(id);
>                         break;
>                 }
>         default:{
>                         assert(0);      /* should never get here */
>                 }
>         }
> -       datum->s.value =3D value;
>
>         while ((id =3D queue_remove(id_queue))) {
>                 if (id_has_dot(id)) {
> @@ -981,11 +996,11 @@ int define_category(void)
>                 }
>                 cat_datum_init(aliasdatum);
>                 aliasdatum->isalias =3D TRUE;
> -               aliasdatum->s.value =3D datum->s.value;
> +               aliasdatum->s.value =3D value;
>
>                 ret =3D
>                     declare_symbol(SYM_CATS, id, aliasdatum, NULL,
> -                                  &datum->s.value);
> +                                  &value);
>                 switch (ret) {
>                 case -3:{
>                                 yyerror("Out of memory!");
> @@ -1001,8 +1016,13 @@ int define_category(void)
>                                     ("could not declare category alias %s=
 here", id);
>                                 goto bad_alias;
>                         }
> -               case 0:
> +               case 0:{
> +                               break;
> +                       }
>                 case 1:{
> +                               cat_datum_destroy(aliasdatum);
> +                               free(aliasdatum);
> +                               free(id);
>                                 break;
>                         }
>                 default:{
> @@ -1833,10 +1853,12 @@ int define_bool_tunable(int is_tunable)
>                         yyerror2("could not declare boolean %s here", id)=
;
>                         goto cleanup;
>                 }
> -       case 0:
> -       case 1:{
> +       case 0:{
>                         break;
>                 }
> +       case 1:{
> +                       goto cleanup;
> +               }
>         default:{
>                         assert(0);      /* should never get here */
>                 }
> @@ -1854,7 +1876,7 @@ int define_bool_tunable(int is_tunable)
>         return 0;
>        cleanup:
>         cond_destroy_bool(id, datum, NULL);
> -       return -1;
> +       return ret =3D=3D 1 ? 0 : -1;
>  }
>
>  avrule_t *define_cond_pol_list(avrule_t * avlist, avrule_t * sl)
> --
> 2.45.2
>
>

