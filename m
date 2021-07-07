Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DFE63BEC5F
	for <lists+selinux@lfdr.de>; Wed,  7 Jul 2021 18:36:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229519AbhGGQjg (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Wed, 7 Jul 2021 12:39:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229542AbhGGQjg (ORCPT
        <rfc822;selinux@vger.kernel.org>); Wed, 7 Jul 2021 12:39:36 -0400
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3769C061574
        for <selinux@vger.kernel.org>; Wed,  7 Jul 2021 09:36:55 -0700 (PDT)
Received: by mail-ot1-x335.google.com with SMTP id z18-20020a9d7a520000b02904b28bda1885so1344918otm.7
        for <selinux@vger.kernel.org>; Wed, 07 Jul 2021 09:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ntLRPo2fAq2LUky6uU6e2VQFGopoXHovgfzKg/q4hkk=;
        b=UAcbcquZIg+PJ7nGsDx6qo+3jJ2ZOgY4kuIwkmu+8aaEASffKxQtXHtIeUemKFLdpJ
         pp4lYheXN+ZPHvBzdw0KM9XrwQ3Yw6lYosX18J8ezn0UnwXCIBaSbQDtpnujMfL1G/Eu
         YQyR8vioRTi3FzNYqDahuVb7Sednew8YSnxn71hFMDByxCNe2s3+UCsm6btqqHmDTKe3
         9YkTyCQqdgXj+MBdOj6QpvbhUwDlKgdE6lSu+Ky7l4cOxPvBG59kKhF90lBAA+Ronjcf
         NWV/IVXBOuZh7Q+N4ALjr7aukdve9ajtyNk8A74umIv5pTkkhqd4XEr8FtLLmDvytQvz
         3WXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ntLRPo2fAq2LUky6uU6e2VQFGopoXHovgfzKg/q4hkk=;
        b=MitAlXOOi9ptFweoubawq4kCICz0QSpbrEnf/wkQJD8NyTK+NgBc6cZyGa0UQVcdRt
         DwRFvDWHFtuvn5pwxhMd9vkESIHvGf9rE91pYf2RgwpVepIzp7X/D/iu+vMmhoQbTRZT
         MG5AxrhrYEHjhxIxOvTEGOxS7Y/hmMsYAAyN/3HvxMwvzEw9ERPJiWbf8CxM15Gz6oz1
         aGesrV7T8rJAaAM5whyae54uR13QNf+JwbFuZEGF4nyWL2CGSEWK2y5T/dKfcicgcKb2
         TZiINBCvtOTbdPbUieny7pC5vi4EAVQDnx0AOQpYv1Nt1yCxbUS5JAqIYRO38LzRTkgy
         7nUw==
X-Gm-Message-State: AOAM5336D4srNTiH6eU/IKw8ZETlfjV8U4BBBR/x22DT2WzvQjlpFVn9
        KytBcNpjevUHQ4hd9gI2Irj2a3BbXB4v4v0Z3Pw=
X-Google-Smtp-Source: ABdhPJw7OZ7o2BUo1EsYvqLzBMfgf35GxjkAP6HuopUzQgpfF7OEtF8uz/i7VEMVqyUbPrBfRMoCbXz9Z/+by0K7TDo=
X-Received: by 2002:a05:6830:16d2:: with SMTP id l18mr5615914otr.196.1625675815118;
 Wed, 07 Jul 2021 09:36:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210630203459.155577-1-jwcart2@gmail.com> <CAJfZ7=mLBTpK8dMywnJb1AL48acn3iTutUj+hEFc-j8tF6P6iw@mail.gmail.com>
 <CAP+JOzQaeSzYa-VYwMY-FGuQs-NQ6zVUdgYvj_-EPtnEFeQbtg@mail.gmail.com>
In-Reply-To: <CAP+JOzQaeSzYa-VYwMY-FGuQs-NQ6zVUdgYvj_-EPtnEFeQbtg@mail.gmail.com>
From:   James Carter <jwcart2@gmail.com>
Date:   Wed, 7 Jul 2021 12:36:44 -0400
Message-ID: <CAP+JOzSxq1PP1sGTUs6VfVMKW9C69ao0KRqxCy_dz8v-yoJp7g@mail.gmail.com>
Subject: Re: [PATCH] libsepol/cil: Improve checking for bad inheritance patterns
To:     Nicolas Iooss <nicolas.iooss@m4x.org>
Cc:     SElinux list <selinux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Wed, Jul 7, 2021 at 10:03 AM James Carter <jwcart2@gmail.com> wrote:
>
> On Fri, Jul 2, 2021 at 5:07 PM Nicolas Iooss <nicolas.iooss@m4x.org> wrote:
> >
> > On Wed, Jun 30, 2021 at 10:35 PM James Carter <jwcart2@gmail.com> wrote:
> > >
> > > commits 37863b0b1444c85a1ddc6c333c8bfea0c678c592 (libsepol/cil:
> > > Improve degenerate inheritance check) and
> > > 74d00a8decebf940d95064ff60042dcb2cbcc2c0 (libsepol/cil: Detect
> > > degenerate inheritance and exit with an error) attempted to detect
> > > and exit with an error when compiling policies that have degenerate
> > > inheritances. These policies result in the exponential growth of memory
> > > usage while copying the blocks that are inherited.
> > >
> > > There were two problems with the previous attempts to detect this
> > > bad inheritance problem. The first is that the quick check using
> > > cil_possible_degenerate_inheritance() did not detect all patterns
> > > of degenerate inheritance. The second problem is that the detection
> > > of inheritance loops during the CIL_PASS_BLKIN_LINK pass did not
> > > detect all inheritance loops which made it possible for the full
> > > degenerate inheritance checking done with
> > > cil_check_for_degenerate_inheritance() to have a stack overflow
> > > when encountering the inheritance loops. Both the degenerate and
> > > loop inheritance checks need to be done at the same time and done
> > > after the CIL_PASS_BLKIN_LINK pass. Otherwise, if loops are being
> > > detected first, then a degenerate policy can cause the consumption
> > > of all system memory and if degenerate policy is being detected
> > > first, then an inheritance loop can cause a stack overflow.
> > >
> > > With the new approach, the quick check is eliminated and the full
> > > check is always done after the CIL_PASS_BLKIN_LINK pass. Because
> > > of this the "inheritance_check" field in struct cil_resolve_args
> > > is not needed and removed and the functions
> > > cil_print_recursive_blockinherit(), cil_check_recursive_blockinherit(),
> > > and cil_possible_degenerate_inheritance() have been deleted. The
> > > function cil_count_potential() is renamed cil_check_inheritances()
> > > and has checks for both degenerate inheritance and inheritance loops.
> > > The inheritance checking is improved and uses an approach similar
> > > to commit c28525a26fa145cb5fd911fd2a3b9125a275677f (libsepol/cil:
> > > Properly check for loops in sets). Most importantly, the call to
> > > cil_check
> >
> > Hi, this sentence seems to be truncated.
> >
>
> I think that I was going to say that cil_check_inheritances() is
> always called now and that the quick check had been eliminated, but
> then decided that I should talk about that at the beginning of the
> paragraph. I'll delete that truncated sentence when I merge the patch.
>
> Thanks,
> Jim
>
> > Otherwise, this patch looks good to me (and the logic is now much
> > simpler to understand than previously), thanks!
> >
> > Acked-by: Nicolas Iooss <nicolas.iooss@m4x.org>
> >

Merged.
Jim

> > > As has been the case with these degenerate inheritance patches,
> > > these issues were discovered by the secilc-fuzzer.
> > >
> > > Signed-off-by: James Carter <jwcart2@gmail.com>
> > > ---
> > >  libsepol/cil/src/cil_resolve_ast.c | 172 +++++++----------------------
> > >  1 file changed, 42 insertions(+), 130 deletions(-)
> > >
> > > diff --git a/libsepol/cil/src/cil_resolve_ast.c b/libsepol/cil/src/cil_resolve_ast.c
> > > index 0ea5b169..47779a0c 100644
> > > --- a/libsepol/cil/src/cil_resolve_ast.c
> > > +++ b/libsepol/cil/src/cil_resolve_ast.c
> > > @@ -64,7 +64,6 @@ struct cil_args_resolve {
> > >         struct cil_list *sensitivityorder_lists;
> > >         struct cil_list *in_list;
> > >         struct cil_stack *disabled_optionals;
> > > -       int *inheritance_check;
> > >  };
> > >
> > >  static struct cil_name * __cil_insert_name(struct cil_db *db, hashtab_key_t key, struct cil_tree_node *ast_node)
> > > @@ -2309,100 +2308,8 @@ exit:
> > >         return rc;
> > >  }
> > >
> > > -static void cil_print_recursive_blockinherit(struct cil_tree_node *bi_node, struct cil_tree_node *terminating_node)
> > > -{
> > > -       struct cil_list *trace = NULL;
> > > -       struct cil_list_item *item = NULL;
> > > -       struct cil_tree_node *curr = NULL;
> > > -
> > > -       cil_list_init(&trace, CIL_NODE);
> > > -
> > > -       for (curr = bi_node; curr != terminating_node; curr = curr->parent) {
> > > -               if (curr->flavor == CIL_BLOCK) {
> > > -                       cil_list_prepend(trace, CIL_NODE, curr);
> > > -               } else if (curr->flavor == CIL_BLOCKINHERIT) {
> > > -                       if (curr != bi_node) {
> > > -                               cil_list_prepend(trace, CIL_NODE, NODE(((struct cil_blockinherit *)curr->data)->block));
> > > -                       }
> > > -                       cil_list_prepend(trace, CIL_NODE, curr);
> > > -               } else {
> > > -                       cil_list_prepend(trace, CIL_NODE, curr);
> > > -               }
> > > -       }
> > > -       cil_list_prepend(trace, CIL_NODE, terminating_node);
> > > -
> > > -       cil_list_for_each(item, trace) {
> > > -               curr = item->data;
> > > -               if (curr->flavor == CIL_BLOCK) {
> > > -                       cil_tree_log(curr, CIL_ERR, "block %s", DATUM(curr->data)->name);
> > > -               } else if (curr->flavor == CIL_BLOCKINHERIT) {
> > > -                       cil_tree_log(curr, CIL_ERR, "blockinherit %s", ((struct cil_blockinherit *)curr->data)->block_str);
> > > -               } else if (curr->flavor == CIL_OPTIONAL) {
> > > -                       cil_tree_log(curr, CIL_ERR, "optional %s", DATUM(curr->data)->name);
> > > -               } else {
> > > -                       cil_tree_log(curr, CIL_ERR, "%s", cil_node_to_string(curr));
> > > -               }
> > > -       }
> > > -
> > > -       cil_list_destroy(&trace, CIL_FALSE);
> > > -}
> > > -
> > > -static int cil_check_recursive_blockinherit(struct cil_tree_node *bi_node)
> > > -{
> > > -       struct cil_tree_node *curr = NULL;
> > > -       struct cil_blockinherit *bi = NULL;
> > > -       struct cil_block *block = NULL;
> > > -       int rc = SEPOL_ERR;
> > > -
> > > -       bi = bi_node->data;
> > > -
> > > -       for (curr = bi_node->parent; curr != NULL; curr = curr->parent) {
> > > -               if (curr->flavor != CIL_BLOCK) {
> > > -                       continue;
> > > -               }
> > > -
> > > -               block = curr->data;
> > > -
> > > -               if (block != bi->block) {
> > > -                       continue;
> > > -               }
> > > -
> > > -               cil_log(CIL_ERR, "Recursive blockinherit found:\n");
> > > -               cil_print_recursive_blockinherit(bi_node, curr);
> > > -
> > > -               rc = SEPOL_ERR;
> > > -               goto exit;
> > > -       }
> > > -
> > > -       rc = SEPOL_OK;
> > > -
> > > -exit:
> > > -       return rc;
> > > -}
> > > -
> > > -static int cil_possible_degenerate_inheritance(struct cil_tree_node *node)
> > > -{
> > > -       unsigned depth = 1;
> > > -
> > > -       node = node->parent;
> > > -       while (node && node->flavor != CIL_ROOT) {
> > > -               if (node->flavor == CIL_BLOCK) {
> > > -                       if (((struct cil_block *)(node->data))->bi_nodes != NULL) {
> > > -                               depth++;
> > > -                               if (depth >= CIL_DEGENERATE_INHERITANCE_DEPTH) {
> > > -                                       return CIL_TRUE;
> > > -                               }
> > > -                       }
> > > -               }
> > > -               node = node->parent;
> > > -       }
> > > -
> > > -       return CIL_FALSE;
> > > -}
> > > -
> > >  int cil_resolve_blockinherit_link(struct cil_tree_node *current, void *extra_args)
> > >  {
> > > -       struct cil_args_resolve *args = extra_args;
> > >         struct cil_blockinherit *inherit = current->data;
> > >         struct cil_symtab_datum *block_datum = NULL;
> > >         struct cil_tree_node *node = NULL;
> > > @@ -2423,20 +2330,11 @@ int cil_resolve_blockinherit_link(struct cil_tree_node *current, void *extra_arg
> > >
> > >         inherit->block = (struct cil_block *)block_datum;
> > >
> > > -       rc = cil_check_recursive_blockinherit(current);
> > > -       if (rc != SEPOL_OK) {
> > > -                       goto exit;
> > > -       }
> > > -
> > >         if (inherit->block->bi_nodes == NULL) {
> > >                 cil_list_init(&inherit->block->bi_nodes, CIL_NODE);
> > >         }
> > >         cil_list_append(inherit->block->bi_nodes, CIL_NODE, current);
> > >
> > > -       if (*(args->inheritance_check) == CIL_FALSE) {
> > > -               *(args->inheritance_check) = cil_possible_degenerate_inheritance(node);
> > > -       }
> > > -
> > >         return SEPOL_OK;
> > >
> > >  exit:
> > > @@ -2466,11 +2364,6 @@ int cil_resolve_blockinherit_copy(struct cil_tree_node *current, void *extra_arg
> > >         }
> > >
> > >         cil_list_for_each(item, block->bi_nodes) {
> > > -               rc = cil_check_recursive_blockinherit(item->data);
> > > -               if (rc != SEPOL_OK) {
> > > -                       goto exit;
> > > -               }
> > > -
> > >                 rc = cil_copy_ast(db, current, item->data);
> > >                 if (rc != SEPOL_OK) {
> > >                         cil_log(CIL_ERR, "Failed to copy block contents into blockinherit\n");
> > > @@ -3611,34 +3504,58 @@ static unsigned cil_count_actual(struct cil_tree_node *node)
> > >         return count;
> > >  }
> > >
> > > -static unsigned cil_count_potential(struct cil_tree_node *node, unsigned max)
> > > +static int cil_check_inheritances(struct cil_tree_node *node, unsigned max, unsigned *count, struct cil_stack *stack, unsigned *loop)
> > >  {
> > > -       unsigned count = 0;
> > > +       int rc;
> > >
> > >         if (node->flavor == CIL_BLOCKINHERIT) {
> > >                 struct cil_blockinherit *bi = node->data;
> > > -               count += 1;
> > > +               *count += 1;
> > > +               if (*count > max) {
> > > +                       cil_tree_log(node, CIL_ERR, "Degenerate inheritance detected");
> > > +                       return SEPOL_ERR;
> > > +               }
> > >                 if (bi->block) {
> > > -                       count += cil_count_potential(NODE(bi->block), max);
> > > -                       if (count > max) {
> > > -                               return count;
> > > +                       struct cil_tree_node *block_node = NODE(bi->block);
> > > +                       struct cil_stack_item *item;
> > > +                       int i = 0;
> > > +                       cil_stack_for_each(stack, i, item) {
> > > +                               if (block_node == (struct cil_tree_node *)item->data) {
> > > +                                       *loop = CIL_TRUE;
> > > +                                       cil_tree_log(block_node, CIL_ERR, "Block inheritance loop found");
> > > +                                       cil_tree_log(node, CIL_ERR, "  blockinherit");
> > > +                                       return SEPOL_ERR;
> > > +                               }
> > > +                       }
> > > +                       cil_stack_push(stack, CIL_BLOCK, block_node);
> > > +                       rc = cil_check_inheritances(block_node, max, count, stack, loop);
> > > +                       cil_stack_pop(stack);
> > > +                       if (rc != SEPOL_OK) {
> > > +                               if (*loop == CIL_TRUE) {
> > > +                                       cil_tree_log(node, CIL_ERR, "  blockinherit");
> > > +                               }
> > > +                               return SEPOL_ERR;
> > >                         }
> > >                 }
> > >         }
> > >
> > >         for (node = node->cl_head; node; node = node->next) {
> > > -               count += cil_count_potential(node, max);
> > > -               if (count > max) {
> > > -                       return count;
> > > +               rc = cil_check_inheritances(node, max, count, stack, loop);
> > > +               if (rc != SEPOL_OK) {
> > > +                       return SEPOL_ERR;
> > >                 }
> > >         }
> > >
> > > -       return count;
> > > +       return SEPOL_OK;
> > >  }
> > >
> > > -static int cil_check_for_degenerate_inheritance(struct cil_tree_node *node)
> > > +static int cil_check_for_bad_inheritance(struct cil_tree_node *node)
> > >  {
> > > -       uint64_t num_actual, num_potential, max;
> > > +       unsigned num_actual, max;
> > > +       unsigned num_potential = 0;
> > > +       unsigned loop = CIL_FALSE;
> > > +       struct cil_stack *stack;
> > > +       int rc;
> > >
> > >         num_actual = cil_count_actual(node);
> > >
> > > @@ -3647,13 +3564,11 @@ static int cil_check_for_degenerate_inheritance(struct cil_tree_node *node)
> > >                 max = CIL_DEGENERATE_INHERITANCE_MINIMUM;
> > >         }
> > >
> > > -       num_potential = cil_count_potential(node, max);
> > > +       cil_stack_init(&stack);
> > > +       rc = cil_check_inheritances(node, max, &num_potential, stack, &loop);
> > > +       cil_stack_destroy(&stack);
> > >
> > > -       if (num_potential > max) {
> > > -               return SEPOL_ERR;
> > > -       }
> > > -
> > > -       return SEPOL_OK;
> > > +       return rc;
> > >  }
> > >
> > >  int __cil_resolve_ast_node(struct cil_tree_node *node, void *extra_args)
> > > @@ -4127,7 +4042,6 @@ int cil_resolve_ast(struct cil_db *db, struct cil_tree_node *current)
> > >         struct cil_args_resolve extra_args;
> > >         enum cil_pass pass = CIL_PASS_TIF;
> > >         uint32_t changed = 0;
> > > -       int inheritance_check = 0;
> > >
> > >         if (db == NULL || current == NULL) {
> > >                 return rc;
> > > @@ -4147,7 +4061,6 @@ int cil_resolve_ast(struct cil_db *db, struct cil_tree_node *current)
> > >         extra_args.sensitivityorder_lists = NULL;
> > >         extra_args.in_list = NULL;
> > >         extra_args.disabled_optionals = NULL;
> > > -       extra_args.inheritance_check = &inheritance_check;
> > >
> > >         cil_list_init(&extra_args.to_destroy, CIL_NODE);
> > >         cil_list_init(&extra_args.sidorder_lists, CIL_LIST_ITEM);
> > > @@ -4174,10 +4087,9 @@ int cil_resolve_ast(struct cil_db *db, struct cil_tree_node *current)
> > >                         cil_list_destroy(&extra_args.in_list, CIL_FALSE);
> > >                 }
> > >
> > > -               if (pass == CIL_PASS_BLKIN_LINK && inheritance_check == CIL_TRUE) {
> > > -                       rc = cil_check_for_degenerate_inheritance(current);
> > > +               if (pass == CIL_PASS_BLKIN_LINK) {
> > > +                       rc = cil_check_for_bad_inheritance(current);
> > >                         if (rc != SEPOL_OK) {
> > > -                               cil_log(CIL_ERR, "Degenerate inheritance detected\n");
> > >                                 rc = SEPOL_ERR;
> > >                                 goto exit;
> > >                         }
> > > --
> > > 2.31.1
> > >
> >
