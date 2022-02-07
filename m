Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D970D4AC8FA
	for <lists+selinux@lfdr.de>; Mon,  7 Feb 2022 20:00:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234917AbiBGS7I (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Mon, 7 Feb 2022 13:59:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236550AbiBGS4e (ORCPT
        <rfc822;selinux@vger.kernel.org>); Mon, 7 Feb 2022 13:56:34 -0500
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D735C0401DA
        for <selinux@vger.kernel.org>; Mon,  7 Feb 2022 10:56:33 -0800 (PST)
Received: by mail-oi1-x22e.google.com with SMTP id ay7so4096725oib.8
        for <selinux@vger.kernel.org>; Mon, 07 Feb 2022 10:56:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=cUzAw8DAWRmA7WxGUsdznJk+Do8v8LTPWp3lMGqvM6o=;
        b=YzueVyJbBNA4x1GBbyRqN/KUZ9egg9buI+uCDPZTNCifsc6/aTDeWzYY0b+fLsPciB
         dyAScnzhpeFfartCks2dMa+sLis6JQW0DBW0qFYl9bVK2t0ugd/4ZQqCIXHzTZiyX+p3
         3bcLIPAjFHJBwNs7ft1aukfUBrUB6cUzjxztfXYBcwNyOXQApwYA1sAHzdYPmi4KZ/45
         BQzR5SiF9ce+ulQAMwbnU1hlw5Ml/ux+StuS7TFd1PLgbETGD4tCPjmHQmrT/60TxMOo
         dOfymXdvgj+D7N+/e8sTv640gtdfPYqUDMl2uGhlL7uA1qoIKH1es8cBqlCeaBs6Dlpk
         431g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=cUzAw8DAWRmA7WxGUsdznJk+Do8v8LTPWp3lMGqvM6o=;
        b=aK1xaxDBWs4oY+Bf7EMomDrW+YtrBKhih6CBVyJ++193+doYvuNzHeeTNKeaf7MCJq
         Yrmif/ionlBemK994TH0nDizsCJgj1fHP/XUVANxPKZYU4idLxVv2aqfOGldhB7zriWB
         YjcwEiFrBU/bplm8Y14WvGcuKz6ChpZy30z0/3s+aqgAc8Jc86k3YwuQr5Xy7b4jdho1
         509h6REmw2Cij92mz5MfXDxfj6PUT3gDJXdDsNvEwcTh/d5018PFfnSDNuKyaIINPlHt
         NvP/CkH0UiB7f9WOjA+nzKHfJqIC3YUr3Izn4goteHC4NRq5GQeGqO9d0+rYj4psL8AA
         9Z7A==
X-Gm-Message-State: AOAM530Lpcc9kUoizj0qp9/ygH6d3JPhIAasa60WReBWdPmc4pD4tC9I
        uK5PqOYyd1XIPyNuqz1dyRhFkeUQ4Li7dwCfAN7/ohf7
X-Google-Smtp-Source: ABdhPJyWQCPgDF5jkttmJTUDJoRE6yNZgDjsF976jhv0zf4rjr6AgJ3rqivDKpbeseu6z5erSsxuUHx9HXjZ7GO6VeU=
X-Received: by 2002:a54:408e:: with SMTP id i14mr169314oii.200.1644260192910;
 Mon, 07 Feb 2022 10:56:32 -0800 (PST)
MIME-Version: 1.0
References: <20220113160422.675541-1-jwcart2@gmail.com>
In-Reply-To: <20220113160422.675541-1-jwcart2@gmail.com>
From:   James Carter <jwcart2@gmail.com>
Date:   Mon, 7 Feb 2022 13:56:22 -0500
Message-ID: <CAP+JOzRcW_izEVpxwG8m099O6tK-UWEUfBebVyzfsaJLikzFUQ@mail.gmail.com>
Subject: Re: [PATCH] libsepol/cil: Ensure that the class in a classcommon is a
 kernel class
To:     SElinux list <selinux@vger.kernel.org>
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

I also plan on merging this patch at the end of the week.
Jim


On Thu, Jan 13, 2022 at 11:04 AM James Carter <jwcart2@gmail.com> wrote:
>
> Map classes use the same struct as kernel classes, but only the kernel
> class uses the pointer to a common class. When resolving a classcommon,
> make sure that the class that is found is a kernel class and not a
> map class. If not, then return an error.
>
> Found by oss-fuzz (#43209)
>
> Signed-off-by: James Carter <jwcart2@gmail.com>
> ---
>  libsepol/cil/src/cil_resolve_ast.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/libsepol/cil/src/cil_resolve_ast.c b/libsepol/cil/src/cil_resolve_ast.c
> index e97a9f46..d359eca0 100644
> --- a/libsepol/cil/src/cil_resolve_ast.c
> +++ b/libsepol/cil/src/cil_resolve_ast.c
> @@ -754,6 +754,11 @@ int cil_resolve_classcommon(struct cil_tree_node *current, void *extra_args)
>         if (rc != SEPOL_OK) {
>                 goto exit;
>         }
> +       if (NODE(class_datum)->flavor != CIL_CLASS) {
> +               cil_log(CIL_ERR, "Class %s is not a kernel class and cannot be associated with common %s\n", clscom->class_str, clscom->common_str);
> +               rc = SEPOL_ERR;
> +               goto exit;
> +       }
>
>         rc = cil_resolve_name(current, clscom->common_str, CIL_SYM_COMMONS, extra_args, &common_datum);
>         if (rc != SEPOL_OK) {
> --
> 2.31.1
>
