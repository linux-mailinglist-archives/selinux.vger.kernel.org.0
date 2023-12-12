Return-Path: <selinux+bounces-168-lists+selinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27F9880EE76
	for <lists+selinux@lfdr.de>; Tue, 12 Dec 2023 15:12:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 58DCF1C20ADD
	for <lists+selinux@lfdr.de>; Tue, 12 Dec 2023 14:12:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A28D673179;
	Tue, 12 Dec 2023 14:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L5bsmyJw"
X-Original-To: selinux@vger.kernel.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8636AF2
	for <selinux@vger.kernel.org>; Tue, 12 Dec 2023 06:12:08 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-50e04354de0so1733646e87.1
        for <selinux@vger.kernel.org>; Tue, 12 Dec 2023 06:12:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702390326; x=1702995126; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AoVf6iEBZQIIwmAe/gdoGu7MfckSN6TyM+ohjgK6u5s=;
        b=L5bsmyJwB66v6IeAn/NiuBwf057Jfm8u2sU71Di5eIoS/JeGu/PkcnTrw7wyRf3q7t
         fyRe4nKr13V4YoMlZ2wPGPrOLkLvQMoh0ZXTUS91Qp/xoI3rR0fNQvC+lDGR+XVggcKO
         jmWTIQVRfGTw0KVnbElQIVjPSfFeh8uNPtTINVcTXzAAwPDOeAvjfqb5gqYEwTBgjeI+
         aMueyLbJ2a66IzcmkFTqoI9pHCNWBp6q1aXeLO6b4Z8rK6SXjDnCI2M0WO0Lo7A0gc6D
         DPNVWBO5B3OMRNQz9mFibnq9nkw4Qge1OGDrXhI9dP9u4f7zfQhHC53vlTyty3F8HCTO
         CTrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702390326; x=1702995126;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AoVf6iEBZQIIwmAe/gdoGu7MfckSN6TyM+ohjgK6u5s=;
        b=Bq32Pq/mh+uLygQPZ3OWIJzBQyW1s2c720b9x73Jb/s9tAyb7MwabMTzgVoO8duyXs
         Q0TnawqBXpjG2zpz+Ha8aTwaoStQ0UeBSQYB44AFEy3a9DSElWECLrx+ClTFdW2stQES
         zuI92Z8ojMGvul25aRXuBbmyW5vTsnObvhvyFh8evnnyeJLv6lwX3TlpkH4ftHKONfE0
         USUrppwy27qF4ImLOPhSTjCJg6TpwOuyhOokNXldicOXM3tGHBtYp3Lh4IbgnLZxzIuF
         +cD7rQMP+gHXl1XdHIkOTPqkKxITPySL2idjXSPsW/GwSThhN5UWvKJQaCV5/E8exGW1
         HxUA==
X-Gm-Message-State: AOJu0Yw/jTjfB4Fr/PHalemxLYrNk8kEy+3e2D7lm4Pfv4Z+15E6Vyt/
	N0Mn9DXTOxJznYRAS+HjkyIk4PxSUQjCBId8DzBCJcZr
X-Google-Smtp-Source: AGHT+IH3v3AuWsfhf2WGCS1DyZ3PPoZUtNOre8lVjBkJ6eoUPmRPXUDeUAsGaEoKaRqg+BGKDk8uWwNhLc95FVl6i5o=
X-Received: by 2002:a05:6512:3b23:b0:50b:f0b2:70d9 with SMTP id
 f35-20020a0565123b2300b0050bf0b270d9mr3428369lfv.109.1702390326242; Tue, 12
 Dec 2023 06:12:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: selinux@vger.kernel.org
List-Id: <selinux.vger.kernel.org>
List-Subscribe: <mailto:selinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:selinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231129174246.188157-1-jwcart2@gmail.com>
In-Reply-To: <20231129174246.188157-1-jwcart2@gmail.com>
From: James Carter <jwcart2@gmail.com>
Date: Tue, 12 Dec 2023 09:11:54 -0500
Message-ID: <CAP+JOzSvpCNHPJm7Jg1xpVwiTmynddHS+k+FybVO8ywTo+cD+Q@mail.gmail.com>
Subject: Re: [PATCH] libsepol/cil: Clear AST node after destroying bad filecon rule
To: selinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 29, 2023 at 12:42=E2=80=AFPM James Carter <jwcart2@gmail.com> w=
rote:
>
> Commit fb0a4ce1 (libsepol/cil: Allow paths in filecon rules to be
> passed as arguments) changed when the new AST node data would be set
> to point to the new filecon struct when creating a filecon rule.
> This causes cil_destroy_filecon() to be called twice on the filecon
> struct if there is an error when creating the filecon rule.
>
> If there is an error when creating a filecon rule, call
> cil_clear_node() after destroying the filecon struct.
>
> Reported-by: oss-fuzz (issue 64385)
> Signed-off-by: James Carter <jwcart2@gmail.com>

I plan on merging this patch soon, unless there are any objections.
Jim

> ---
>  libsepol/cil/src/cil_build_ast.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/libsepol/cil/src/cil_build_ast.c b/libsepol/cil/src/cil_buil=
d_ast.c
> index be260a31..56dac891 100644
> --- a/libsepol/cil/src/cil_build_ast.c
> +++ b/libsepol/cil/src/cil_build_ast.c
> @@ -4197,6 +4197,7 @@ int cil_gen_filecon(struct cil_db *db, struct cil_t=
ree_node *parse_current, stru
>  exit:
>         cil_tree_log(parse_current, CIL_ERR, "Bad filecon declaration");
>         cil_destroy_filecon(filecon);
> +       cil_clear_node(ast_node);
>         return rc;
>  }
>
> --
> 2.43.0
>

