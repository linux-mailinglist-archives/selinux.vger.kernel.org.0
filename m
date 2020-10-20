Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E4D9293AF5
	for <lists+selinux@lfdr.de>; Tue, 20 Oct 2020 14:07:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393963AbgJTMH3 (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Tue, 20 Oct 2020 08:07:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:29043 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2394114AbgJTMH3 (ORCPT
        <rfc822;selinux@vger.kernel.org>); Tue, 20 Oct 2020 08:07:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1603195646;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Ht/4eCEEsiBUNuKAo/EAOdHU8sERsHz+anEQC7bfuAk=;
        b=eO/2psaN9ycxC7oT3RRI8AZhOEMryn4meSF3SZ6c+VvMv7F1l0GuX4nlR3H4OEMemLZwN7
        nL8HkLjjJxuWsbS71/SRjAIrh574fN8Ee0u2Vu6WPzq0BK01JNPZ4j7Il5RR09rIqPvcaC
        +w7ImF1tslo+SHgavDWKep2geGEN6gE=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-310-KXY5NpkbPTafqiNZzNQHyg-1; Tue, 20 Oct 2020 08:07:25 -0400
X-MC-Unique: KXY5NpkbPTafqiNZzNQHyg-1
Received: by mail-lj1-f199.google.com with SMTP id s11so757830ljh.8
        for <selinux@vger.kernel.org>; Tue, 20 Oct 2020 05:07:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ht/4eCEEsiBUNuKAo/EAOdHU8sERsHz+anEQC7bfuAk=;
        b=E+6BuOp7Ry0TPUhy1D/Q3lNUIg6Mk1B0ZmVN5Yc3hZYauTmLj3Is3PKOQCoTQw3L5Y
         ljVc79+mravQhBBCKB8CLWG8/yYwhZwJkPzRY7lK5VRUEtSdyq/CvE+yP9zhf0Sc+CbT
         7qUiZpgfUxGob2cwuslHMX+rbipypFua0oaLkF4wBdbrdqeM0RexUpYgTlHQBLl8c4NJ
         MoZNaIbTfVoKVvcptq1+OZATSCqmH3qlRQfZ2e0m4TKi1FQYD3VoSGxr7gtYQutETZ4x
         Hk8JT2mudCY1WqIdQTIpqiMRkhUWukzfqUGovjUvrrB2mEaCJvSvgA4zeb/BkEz6bSoF
         hSEA==
X-Gm-Message-State: AOAM532ckW8WWmlq0jGLNibg1zG6ohA6icLsgI01RrvcdgalBd+xv+w7
        8wlbmGOZJ9qtrEMgtPzxH7LiUpAcI25DT4J6CULt7fymnMVYip3YTcCspSWH45L6nUP+mK8yjS5
        wsEBR3gsH175SnJTeD9Swp7LLT8SswUuhAA==
X-Received: by 2002:a2e:7815:: with SMTP id t21mr919469ljc.217.1603195643226;
        Tue, 20 Oct 2020 05:07:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzjRO8holhPD39eveIWiX+iYOXf172S9xi9mUHks4a7a/N3kep21uQafrpTvcnuPp2s3823hICoHBRKcOlOgBk=
X-Received: by 2002:a2e:7815:: with SMTP id t21mr919458ljc.217.1603195642931;
 Tue, 20 Oct 2020 05:07:22 -0700 (PDT)
MIME-Version: 1.0
References: <20201015204352.569018-1-jwcart2@gmail.com>
In-Reply-To: <20201015204352.569018-1-jwcart2@gmail.com>
From:   Ondrej Mosnacek <omosnace@redhat.com>
Date:   Tue, 20 Oct 2020 14:07:12 +0200
Message-ID: <CAFqZXNsFSqa6NGHmDwLC-fF-KG2zZf3REuPGfRO3Va_8CT_nUA@mail.gmail.com>
Subject: Re: [PATCH] libsepol/cil: Give error for more than one true or false block
To:     James Carter <jwcart2@gmail.com>
Cc:     SElinux list <selinux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Thu, Oct 15, 2020 at 10:44 PM James Carter <jwcart2@gmail.com> wrote:
> Both tunableif and booleanif use conditional blocks (either true or
> false). No ordering is imposed, so a false block can be first (or even
> the only) block. Checks are made to ensure that the first and second
> (if it exists) blocks are either true or false, but no checks are made
> to ensure that there is only one true and/or one false block. If there
> are more than one true or false block, only the first will be used and
> the other will be ignored.
>
> Create a function, cil_verify_conditional_blocks(), that gives an error
> along with a message if more than one true or false block is specified
> and call that function when building tunableif and booleanif blocks in
> the AST.
>
> Signed-off-by: James Carter <jwcart2@gmail.com>
> ---
>  libsepol/cil/src/cil_build_ast.c | 44 +++++---------------------------
>  libsepol/cil/src/cil_verify.c    | 35 +++++++++++++++++++++++++
>  libsepol/cil/src/cil_verify.h    |  1 +
>  3 files changed, 42 insertions(+), 38 deletions(-)
>
> diff --git a/libsepol/cil/src/cil_build_ast.c b/libsepol/cil/src/cil_build_ast.c
> index 3aabb05e..a8955834 100644
> --- a/libsepol/cil/src/cil_build_ast.c
> +++ b/libsepol/cil/src/cil_build_ast.c
> @@ -2821,7 +2821,6 @@ int cil_gen_boolif(struct cil_db *db, struct cil_tree_node *parse_current, struc
>         int syntax_len = sizeof(syntax)/sizeof(*syntax);
>         struct cil_booleanif *bif = NULL;
>         struct cil_tree_node *next = NULL;
> -       struct cil_tree_node *cond = NULL;
>         int rc = SEPOL_ERR;
>
>         if (db == NULL || parse_current == NULL || ast_node == NULL) {
> @@ -2841,27 +2840,12 @@ int cil_gen_boolif(struct cil_db *db, struct cil_tree_node *parse_current, struc
>                 goto exit;
>         }
>
> -       cond = parse_current->next->next;
> -
> -       /* Destroying expr tree after stack is created*/
> -       if (cond->cl_head->data != CIL_KEY_CONDTRUE &&
> -               cond->cl_head->data != CIL_KEY_CONDFALSE) {
> -               rc = SEPOL_ERR;
> -               cil_log(CIL_ERR, "Conditional neither true nor false\n");
> +       rc = cil_verify_conditional_blocks(parse_current->next->next);
> +       if (rc != SEPOL_OK) {
>                 goto exit;
>         }
>
> -       if (cond->next != NULL) {
> -               cond = cond->next;
> -               if (cond->cl_head->data != CIL_KEY_CONDTRUE &&
> -                       cond->cl_head->data != CIL_KEY_CONDFALSE) {
> -                       rc = SEPOL_ERR;
> -                       cil_log(CIL_ERR, "Conditional neither true nor false\n");
> -                       goto exit;
> -               }
> -       }
> -
> -
> +       /* Destroying expr tree */
>         next = parse_current->next->next;
>         cil_tree_subtree_destroy(parse_current->next);
>         parse_current->next = next;
> @@ -2905,7 +2889,6 @@ int cil_gen_tunif(struct cil_db *db, struct cil_tree_node *parse_current, struct
>         int syntax_len = sizeof(syntax)/sizeof(*syntax);
>         struct cil_tunableif *tif = NULL;
>         struct cil_tree_node *next = NULL;
> -       struct cil_tree_node *cond = NULL;
>         int rc = SEPOL_ERR;
>
>         if (db == NULL || parse_current == NULL || ast_node == NULL) {
> @@ -2924,27 +2907,12 @@ int cil_gen_tunif(struct cil_db *db, struct cil_tree_node *parse_current, struct
>                 goto exit;
>         }
>
> -       cond = parse_current->next->next;
> -
> -       if (cond->cl_head->data != CIL_KEY_CONDTRUE &&
> -               cond->cl_head->data != CIL_KEY_CONDFALSE) {
> -               rc = SEPOL_ERR;
> -               cil_log(CIL_ERR, "Conditional neither true nor false\n");
> +       rc = cil_verify_conditional_blocks(parse_current->next->next);
> +       if (rc != SEPOL_OK) {
>                 goto exit;
>         }
>
> -       if (cond->next != NULL) {
> -               cond = cond->next;
> -
> -               if (cond->cl_head->data != CIL_KEY_CONDTRUE &&
> -                       cond->cl_head->data != CIL_KEY_CONDFALSE) {
> -                       rc = SEPOL_ERR;
> -                       cil_log(CIL_ERR, "Conditional neither true nor false\n");
> -                       goto exit;
> -               }
> -       }
> -
> -       /* Destroying expr tree after stack is created*/
> +       /* Destroying expr tree */
>         next = parse_current->next->next;
>         cil_tree_subtree_destroy(parse_current->next);
>         parse_current->next = next;
> diff --git a/libsepol/cil/src/cil_verify.c b/libsepol/cil/src/cil_verify.c
> index c73bbeee..7b3d2a8b 100644
> --- a/libsepol/cil/src/cil_verify.c
> +++ b/libsepol/cil/src/cil_verify.c
> @@ -324,6 +324,41 @@ exit:
>         return SEPOL_ERR;
>  }
>
> +int cil_verify_conditional_blocks(struct cil_tree_node *current)
> +{
> +       int found_true = CIL_FALSE;
> +       int found_false = CIL_FALSE;
> +
> +       if (current->cl_head->data == CIL_KEY_CONDTRUE) {
> +               found_true = CIL_TRUE;
> +       } else if (current->cl_head->data == CIL_KEY_CONDFALSE) {
> +               found_false = CIL_TRUE;
> +       } else {
> +               cil_tree_log(current,CIL_ERR,"Expected true or false block in conditional");

Please put a space after each comma in the argument list (same in the
other cil_tree_log() calls in this function).

> +               return SEPOL_ERR;
> +       }
> +
> +       current = current->next;
> +       if (current != NULL) {
> +               if (current->cl_head->data == CIL_KEY_CONDTRUE) {
> +                       if (found_true) {
> +                               cil_tree_log(current,CIL_ERR,"More than one true block in conditional");
> +                               return SEPOL_ERR;
> +                       }
> +               } else if (current->cl_head->data == CIL_KEY_CONDFALSE) {
> +                       if (found_false) {
> +                               cil_tree_log(current,CIL_ERR,"More than one false block in conditional");
> +                               return SEPOL_ERR;
> +                       }
> +               } else {
> +                       cil_tree_log(current,CIL_ERR,"Expected true or false block in conditional");
> +                       return SEPOL_ERR;
> +               }

Perhaps this is checked somewhere else or I'm missing something, but
shouldn't this function also fail if there are more than two blocks
(i.e. current->next != NULL here)? Not that it would cause any damage
(I guess the extra blocks would be just ignored), but IMHO it's better
to be strict about it.

> +       }
> +
> +       return SEPOL_OK;
> +}
> +
>  int cil_verify_no_self_reference(struct cil_symtab_datum *datum, struct cil_list *datum_list)
>  {
>         struct cil_list_item *i;
> diff --git a/libsepol/cil/src/cil_verify.h b/libsepol/cil/src/cil_verify.h
> index bda1565f..905761b0 100644
> --- a/libsepol/cil/src/cil_verify.h
> +++ b/libsepol/cil/src/cil_verify.h
> @@ -61,6 +61,7 @@ int __cil_verify_syntax(struct cil_tree_node *parse_current, enum cil_syntax s[]
>  int cil_verify_expr_syntax(struct cil_tree_node *current, enum cil_flavor op, enum cil_flavor expr_flavor);
>  int cil_verify_constraint_leaf_expr_syntax(enum cil_flavor l_flavor, enum cil_flavor r_flavor, enum cil_flavor op, enum cil_flavor expr_flavor);
>  int cil_verify_constraint_expr_syntax(struct cil_tree_node *current, enum cil_flavor op);
> +int cil_verify_conditional_blocks(struct cil_tree_node *current);
>  int cil_verify_no_self_reference(struct cil_symtab_datum *datum, struct cil_list *datum_list);
>  int __cil_verify_ranges(struct cil_list *list);
>  int __cil_verify_ordered_node_helper(struct cil_tree_node *node, uint32_t *finished, void *extra_args);
> --
> 2.25.4
>

-- 
Ondrej Mosnacek
Software Engineer, Platform Security - SELinux kernel
Red Hat, Inc.

