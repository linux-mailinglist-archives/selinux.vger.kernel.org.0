Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0A722766D94
	for <lists+selinux@lfdr.de>; Fri, 28 Jul 2023 14:48:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235372AbjG1Ms0 (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Fri, 28 Jul 2023 08:48:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234717AbjG1MsZ (ORCPT
        <rfc822;selinux@vger.kernel.org>); Fri, 28 Jul 2023 08:48:25 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B67030D6
        for <selinux@vger.kernel.org>; Fri, 28 Jul 2023 05:48:25 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-267fabc8465so1219375a91.1
        for <selinux@vger.kernel.org>; Fri, 28 Jul 2023 05:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690548504; x=1691153304;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wn91qj6Ey8vrcniEGC7CLPEKb5LcnREM5yaJxeHntB8=;
        b=ib3E7LQkXWoz7dHkzyTsWpr0x5AQsPbV/9t9L+5Pmer/o3wS0ndJApQhAg80K9ebtB
         5ZNf4BKMJuAOeEy150vaPYypoQtuOfsKYDp9aUz7hYTmpd/a47g0EWQFeco8y0rYwIFT
         FJQ4CP2SDEyd0DbuY4/aOUjl7aa//jWP7GY1E18HZYLJhGzocQQj/QkGhWuhUQwV9kOA
         JvKduRrXVUjztTUeNc1Nah3GI2NAbymbB+GoPReJiHWVavSpVeqdGgNNZ/IFgz+f2gDE
         jHM45sFr3c4bY+AyOhoAUaF7027uPyiTVcRMh90+YSfzfYT9vZSVe2kmEypYyaernox/
         0WkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690548504; x=1691153304;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wn91qj6Ey8vrcniEGC7CLPEKb5LcnREM5yaJxeHntB8=;
        b=T6ge/WE2+SwHgkQNeyML6wH0jAju10JMkoUuNdwrh4Sv/s5/oY/n3NRQWzN3HnLjvN
         rU973cJ9tYFAr0VrK38lIXDuK8UUasknpWLWFNoX7jEp3tf9nlGa4yb1tyL6liS8rSr2
         X0MhUYPObMcFP5r+46ZSUds5Y/SZ6PEWfHB1aTqNITm5fCSeaxm8ByRWmrzTQo94vFXI
         g9BfH+cNKkIATLuYJsTseBRDWI2c/LZvxBV/6nImmYv2coTiDCbp1T6hpEY6LMRhr1Hq
         CVojngCJmLm7DLyj7Waf5YHGP62dKMPRD2RNEJPN4aOq+EPkMBUjccuuTuMRVjHl+qDy
         WKVw==
X-Gm-Message-State: ABy/qLa661AZw4x3DYXdbSEkzrEDVh+2/O+Z5hpEDab1njukm8aQhrBC
        y2gpWMek8ND1aBc8fFr4HDA1FUR2dfrS9JeLJQLVjije
X-Google-Smtp-Source: APBJJlHc9l7i0c3zcOS5YIpDEugIOh9bJRPfgK1WL2hYnwKa9LlUDTOLcNR4hwg8/69uVOKetS2qYohVpLT2D6K9460=
X-Received: by 2002:a17:90b:46c8:b0:262:d7db:2520 with SMTP id
 jx8-20020a17090b46c800b00262d7db2520mr1353701pjb.26.1690548504330; Fri, 28
 Jul 2023 05:48:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230531112927.1957093-1-juraj@jurajmarcin.com>
 <CAHC9VhQZE9Qtsu=7N38sOjHkD=RS4GXsqHOcUgobsJOA+iq2_A@mail.gmail.com>
 <20230601170302.nrhuay2wh44g6sh4@jmarcin-t14s-01> <CAHC9VhRCBkx7ioHAEMpn=ug3zAo2nEOUBe2uWsm0Tb8p6-vE7g@mail.gmail.com>
 <20230618094047.oa4o2d2qj5nvvhhs@jmarcin-t14s-01> <CAHC9VhRGgrihrYEB9VxjttUA5uQC7hD4iyBd+Rkf5_WQ=p+-9w@mail.gmail.com>
 <20230620075100.4wvquojo52dhrixa@jmarcin-t14s-01> <CAEjxPJ6RSkOXRuuUCJr2=irN4k7M_isL12Gky--ucqJ-Fmmzcg@mail.gmail.com>
 <20230727164259.cys5mabxa5aeonod@jmarcin-t14s-01>
In-Reply-To: <20230727164259.cys5mabxa5aeonod@jmarcin-t14s-01>
From:   Stephen Smalley <stephen.smalley.work@gmail.com>
Date:   Fri, 28 Jul 2023 08:48:11 -0400
Message-ID: <CAEjxPJ7t6jr5gZm_mCZqPko207rh6t-CUc+gQxqLXi2QPJx9WA@mail.gmail.com>
Subject: Re: [PATCH 0/5] selinux: add prefix/suffix matching to filename type transitions
To:     Juraj Marcin <juraj@jurajmarcin.com>
Cc:     Paul Moore <paul@paul-moore.com>, selinux@vger.kernel.org,
        Ondrej Mosnacek <omosnace@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Thu, Jul 27, 2023 at 12:43=E2=80=AFPM Juraj Marcin <juraj@jurajmarcin.co=
m> wrote:
>
> On 2023-07-17 14:44, Stephen Smalley wrote:
> >
> > I'd be curious to see what results you would get if you simply added
> > the new feature (prefix/suffix matching) without moving the name-based
> > transitions into the avtab.
>
> Here are the performance metrics of a prototype solution, where the
> filename transition key is extended with match_type and match is found
> by shortening the name from the end or the beginning if a full match is
> not found.
>
> [2] Reference kernel (447a5688005e), Fedora policy (format v33)
> [3] This patchset, Fedora policy (format v33)
> [4] This patchset, Fedora policy without prefix/suffix rules (format v34)
> [5] This patchset, Fedora policy with prefix rules (format v34)
>
>
>  Test | Mem   | Binary | Policy | Create tty      | osbench
>       | Usage | policy | load   |                 | create
>       |       | size   | time   | (ms/file)       | files
>       | (MiB) | (MiB)  | (ms)   | real   | kernel | (us/file)
> ------+-------+--------+--------+--------+--------+-----------
>  [2]  |   157 |    3.4 |     76 |  1.256 |  0.871 | 9.4492
>  [3]  |   156 |    3.4 |     77 |  1.208 |  0.869 | 9.6160
>  [4]  |   157 |    3.4 |     71 |  1.239 |  0.893 | 9.6297
>  [5]  |   156 |    2.4 |     71 |  1.211 |  0.838 | 9.8305

This looks more promising to me - little-to-no impact on existing
users with old policy/userspace, reduced memory usage once fully
transitioned. Still some degradation in runtime for osbench but not
sure what the variance/stddev is for those numbers.

> > Also wondering whether you considered the simpler approach of just
> > augmenting the kernel to recognize and support use of wildcards at the
> > beginning and/or end of the existing name field to signify a prefix or
> > suffix match. That seems more amenable to extensions beyond just
> > prefix or suffix match.
>
> I had not considered this approach in the beginning, but as I thought
> about it, it did not seem as simple.
>
> For example, along with adding the wildcard character, we also need to
> add the ability to escape it; otherwise, it would be a weird edge case
> of an unsupported filename. Also, possibly to escape the escape
> character itself. This adds more complexity to the solution.
>
> In addition to this, extending such solution to support wildcards
> anywhere in the filename would also require reimplementing the filename
> transitions structures or moving rules with wildcards away from current
> filename transitions. Currently, the filename is part of the hashtab key
> and prefix/suffix could work by checking all prefixes and suffixes of a
> filename, which there are not that many. However, with a wildcard at any
> position, this is not feasible.

Fair enough. That said, I do wonder if users will immediately start
asking for wildcards at any position, then file globbing or regexes,
etc, and would like to allow for future extensibility in a less
disruptive manner.
