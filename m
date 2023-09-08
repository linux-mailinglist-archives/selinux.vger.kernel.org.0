Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 23E8A798E66
	for <lists+selinux@lfdr.de>; Fri,  8 Sep 2023 20:51:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237616AbjIHSvp (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Fri, 8 Sep 2023 14:51:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231263AbjIHSvp (ORCPT
        <rfc822;selinux@vger.kernel.org>); Fri, 8 Sep 2023 14:51:45 -0400
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE0D61FEF;
        Fri,  8 Sep 2023 11:51:07 -0700 (PDT)
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-6bdacc5ed66so1243804a34.1;
        Fri, 08 Sep 2023 11:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694198951; x=1694803751; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1JXyDBXH/IQvWZ4DC40T8/yEMbRwGO5yNrTgrNy4W3o=;
        b=aqs3UhmjUBU+vsM0+p9azfO5wOfzgJGCi7vaU7wvPy1CqKgKKrPa7Ov3SXBiW1/wfJ
         lOG33sdoyTjjU8XGkmg/PfQfXfmJNM3z7jcevM77Yx2Zgt1/hdt49N0VNFQVZB9C5ukH
         PchqYFI7Zcgqt+Iq+cjsziXjK/RxOrkcquuuOQer4WP+JGIPWwDfw6H+V6r6PekzUWPJ
         MAmix6E/3wTXjAzlu/kbvioLOFB4dMnh31mODyYnHijifl86Up9JDIXQX84M4S6ekzpF
         vwOhQheZOlnC6GZSNTbCm/7oSJJtJsOL0QCD+Uq0lIJwWyuHm8MR2vpbCFcJ3W7QQc7J
         2JCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694198951; x=1694803751;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1JXyDBXH/IQvWZ4DC40T8/yEMbRwGO5yNrTgrNy4W3o=;
        b=sIK0NPODzbbtSIgQ9jzzvP9+wGupvORDTv9g/hO2bR5eo+aY0I4a2y0X9hK6dbhZoQ
         xMpkB7lmrpPL0rGJqFAXrRGC0o3+tz8oxvYKqTvkDBjPl3XSo9XnqwMturqzCWyase4Y
         VqAiOQNgbNLa0cQlWCYElSGp2PKPHtgBebTa+jUoWsOUuLgTkN71b9kBtO6NSkYquaFV
         G66HDKQwPEpIee22HlrPYROl7+RVW94VDupr0lUoEnUBd22P8lT12ipWphO+bCc7NCpZ
         OZ4cQKnGa1nHjDQSmbO3Kf0HA1UeKr1NEt0JmkcD0G57uCQWOGoL6KkI1+/znXClEy7L
         wg7Q==
X-Gm-Message-State: AOJu0YwdkDwSW+e/EjMd9EgJAODNeCRBoyP6lofR0sMqrf+tkdrk7007
        /mrHRWWr9zRC3ej9atQNDQsU5yToGzck9dzKzJI=
X-Google-Smtp-Source: AGHT+IE2gzaHyucYmW+KEjRqE2PyK43Vv662M6gJ9HlcDuQbZ2Hl6VOhIeHojhvsVNZQQTRVNqcuF31bXsZvOIWx9Yk=
X-Received: by 2002:a9d:69d6:0:b0:6bc:6445:e24f with SMTP id
 v22-20020a9d69d6000000b006bc6445e24fmr1369105oto.19.1694198950953; Fri, 08
 Sep 2023 11:49:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230818151220.166215-1-cgzones@googlemail.com> <20230818151220.166215-5-cgzones@googlemail.com>
In-Reply-To: <20230818151220.166215-5-cgzones@googlemail.com>
From:   Stephen Smalley <stephen.smalley.work@gmail.com>
Date:   Fri, 8 Sep 2023 14:49:00 -0400
Message-ID: <CAEjxPJ4-zG8Z-KW1VXMHQ4x_AgzsdjpC3W7HfyimSKtsinBmYQ@mail.gmail.com>
Subject: Re: [PATCH 6/6] selinux: improve symtab string hashing
To:     =?UTF-8?Q?Christian_G=C3=B6ttsche?= <cgzones@googlemail.com>
Cc:     selinux@vger.kernel.org, Paul Moore <paul@paul-moore.com>,
        Eric Paris <eparis@parisplace.org>,
        Ondrej Mosnacek <omosnace@redhat.com>,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Fri, Aug 18, 2023 at 11:12=E2=80=AFAM Christian G=C3=B6ttsche
<cgzones@googlemail.com> wrote:
>
> The number of buckets is calculated by performing a binary AND against
> the mask of the hash table, which is one less than its size (which is a
> power of two).  This leads to all top bits being discarded, requiring
> for short or similar inputs a hash function with a good avalanche
> effect.
>
> Use djb2a:
>
>     # current
>     common prefixes:  7 entries and 5/8 buckets used, longest chain lengt=
h 2, sum of chain length^2 11
>     classes:  134 entries and 100/256 buckets used, longest chain length =
5, sum of chain length^2 234
>     roles:  15 entries and 6/16 buckets used, longest chain length 5, sum=
 of chain length^2 57
>     types:  4448 entries and 3016/8192 buckets used, longest chain length=
 41, sum of chain length^2 14922
>     users:  7 entries and 3/8 buckets used, longest chain length 3, sum o=
f chain length^2 17
>     bools:  306 entries and 221/512 buckets used, longest chain length 4,=
 sum of chain length^2 524
>     levels:  1 entries and 1/1 buckets used, longest chain length 1, sum =
of chain length^2 1
>     categories:  1024 entries and 400/1024 buckets used, longest chain le=
ngth 4, sum of chain length^2 2740
>
>     # patch
>     common prefixes:  7 entries and 5/8 buckets used, longest chain lengt=
h 2, sum of chain length^2 11
>     classes:  134 entries and 101/256 buckets used, longest chain length =
3, sum of chain length^2 210
>     roles:  15 entries and 9/16 buckets used, longest chain length 3, sum=
 of chain length^2 31
>     types:  4448 entries and 3459/8192 buckets used, longest chain length=
 5, sum of chain length^2 6778
>     users:  7 entries and 5/8 buckets used, longest chain length 3, sum o=
f chain length^2 13
>     bools:  306 entries and 236/512 buckets used, longest chain length 5,=
 sum of chain length^2 470
>     levels:  1 entries and 1/1 buckets used, longest chain length 1, sum =
of chain length^2 1
>     categories:  1024 entries and 518/1024 buckets used, longest chain le=
ngth 7, sum of chain length^2 2992
>
> Signed-off-by: Christian G=C3=B6ttsche <cgzones@googlemail.com>

Assuming this is in fact public domain,
Reviewed-by: Stephen Smalley <stephen.smalley.work@gmail.com>
