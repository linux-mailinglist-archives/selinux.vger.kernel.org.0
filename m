Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB65464EE8F
	for <lists+selinux@lfdr.de>; Fri, 16 Dec 2022 17:08:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230221AbiLPQIN (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Fri, 16 Dec 2022 11:08:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231969AbiLPQHf (ORCPT
        <rfc822;selinux@vger.kernel.org>); Fri, 16 Dec 2022 11:07:35 -0500
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCF652B614
        for <selinux@vger.kernel.org>; Fri, 16 Dec 2022 08:06:47 -0800 (PST)
Received: by mail-ed1-x52a.google.com with SMTP id d14so4207697edj.11
        for <selinux@vger.kernel.org>; Fri, 16 Dec 2022 08:06:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZePJUe/A99WW7I57WmKdDUyLSPAYeq1zGmjVbRBuZfo=;
        b=ZJNXS396fiJKFqqjeoWP6cI8W1fNOH1NjLU6D3xxBz9nJ7t5QKHqcUXvRc3TGP94hT
         pgEKBryC+hrp6/cdzzn8k+7Rx/CXD2H0NLD98NqNUfwsL/9d5uQjx4AxDY4Maee6ixgI
         MuZZ1QfDoUPzRMZfdeO/UUFqxamjsOY21HCiWv5kVrndL8PGtnIbXfB0CqH65BjOukUU
         NB2mTZceOr1R6qcwKz4mBGHZzo8O17nJ1aHKO5+/R68+GzcRPunPPCDUTHovZ88Jrz0Y
         OBg9FM0Qb/hMccyZXSuYvoW6jD0FOA/+nNkdnXKjVZWb5K9zx6nAKAMSRrOHo/Wbjyd8
         wZQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZePJUe/A99WW7I57WmKdDUyLSPAYeq1zGmjVbRBuZfo=;
        b=veGU8vzZqoGZLp5W9nOuMXSOS76LgzzAbMWmIYi5IBYIJ/cehCJHaNnROO6ziCxuGO
         ZvXdbg63YHaEmmV9YwLmHMGVfwW/zdWNpi4PGJbbphr8sCWhggiq615cNUUvJhjmUJUl
         4vPFZQczoFzQC7XjJUuoHdFQ7bep+5c/YdXwL5xYSUb9Trtb4YhAQgJZ3Xcfsbmv/ZLT
         4hCoMp5VE4fHC3fWZzKrnX3YjsTAD9jZFdxFtvDPFN0/tDthUH8N0yvGnpRnOzDS5rYe
         V/Nd4pARKleU7D0pMPEhCWd+aH7nL3tOqytcj+0b19LIAQVTcWfar57n4nYaFadA5yd2
         ZyOg==
X-Gm-Message-State: ANoB5pnsJvMvdb4NPleoHKDYwZnwaEPTwl7j7my2o7myDQxuZQhV05u3
        ikbPl3BQ8ZjzUZ3gi+YOmD1HxM52+u42OsjMKuQ=
X-Google-Smtp-Source: AA0mqf7yx58T8EFmIOG+PB3IiSPbzizdO6necu4SI7l1PQOtvG8aGvyMQ6CjlieZFW8NBE5Mhhf2X1JvARjTDYdMDjU=
X-Received: by 2002:a50:fe8d:0:b0:461:9183:834b with SMTP id
 d13-20020a50fe8d000000b004619183834bmr72138105edt.196.1671206806017; Fri, 16
 Dec 2022 08:06:46 -0800 (PST)
MIME-Version: 1.0
References: <20221205093644.703107-1-lujie54@huawei.com> <20221205093644.703107-2-lujie54@huawei.com>
In-Reply-To: <20221205093644.703107-2-lujie54@huawei.com>
From:   James Carter <jwcart2@gmail.com>
Date:   Fri, 16 Dec 2022 11:06:34 -0500
Message-ID: <CAP+JOzQMYso72aaH3whcTDv7-E-4hBTi9oK-_SKyJtBfxQkukA@mail.gmail.com>
Subject: Re: [PATCH 2/3] libsepol: fix potential memory leak in common_copy_callback
To:     Jie Lu <lujie54@huawei.com>
Cc:     selinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Mon, Dec 5, 2022 at 7:13 AM Jie Lu <lujie54@huawei.com> wrote:
>
> In common_copy_callback(), destroy new_common->permissions when the function fails.
>
> Signed-off-by: Jie Lu <lujie54@huawei.com>
> ---
>  libsepol/src/expand.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/libsepol/src/expand.c b/libsepol/src/expand.c
> index 8d19850e..b44cfd4f 100644
> --- a/libsepol/src/expand.c
> +++ b/libsepol/src/expand.c
> @@ -297,6 +297,7 @@ static int common_copy_callback(hashtab_key_t key, hashtab_datum_t datum,
>                            (hashtab_datum_t) new_common);
>         if (ret) {
>                 ERR(state->handle, "hashtab overflow");
> +               symtab_destroy(&new_common->permissions);
>                 free(new_common);
>                 free(new_id);
>                 return -1;

The call to hashtab_map() below this also needs similar cleanup if
there is an error. In fact, this whole function really needs common
cleanup code with a goto that code upon an error.

Thanks,
Jim


> --
> 2.27.0
>
