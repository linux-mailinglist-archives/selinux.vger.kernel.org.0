Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 911DF1E8054
	for <lists+selinux@lfdr.de>; Fri, 29 May 2020 16:35:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726849AbgE2Of5 (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Fri, 29 May 2020 10:35:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726838AbgE2Of4 (ORCPT
        <rfc822;selinux@vger.kernel.org>); Fri, 29 May 2020 10:35:56 -0400
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com [IPv6:2607:f8b0:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16F49C03E969
        for <selinux@vger.kernel.org>; Fri, 29 May 2020 07:35:56 -0700 (PDT)
Received: by mail-oi1-x243.google.com with SMTP id v128so2724411oia.7
        for <selinux@vger.kernel.org>; Fri, 29 May 2020 07:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=xuTNGHUQ/6QsEcAmZllCaN63VIu280G+LVTQvVvs8XA=;
        b=CE+ypIjcRmnTes0Gh7Y4Pp/41VFC7R/cXIGXd4vkrrIcoUtjarh5BrGE/Ve1d/oyHa
         efYLafs/w2zgPSHKoqyjW8JHLFz/3RXKmK0mnKKcrJsBsBzUGT4xbDZdz6NFLy5ckyCO
         RK+5DPcxreFXKI7kszynRuPQJYX4dlJ5S/ZwyLTG0uJ3iEYX797+kAug7kdLZYVqpBTb
         e6j9HuJ7IjAdzywfNEKzHIZovA50WtOLGjX+wu6Ihzo7cDSmCqUjT3UPcd3sTAY2yXP3
         WsFe8khzQQDUaMMEWoJLP4bPtRTqZtKv/qM0Gx3PCqvfJtRnzrkB7u/3o52KeMKkJFHh
         iFOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=xuTNGHUQ/6QsEcAmZllCaN63VIu280G+LVTQvVvs8XA=;
        b=CcbcHw7CSQvTh9P3nBClkxbk9R5AeQcoIZ16aX87VH1ggW7jMjS7CPxS0gVDVMIlxi
         EyA0BPS35rC9V0np50gfCZNwdUq2hyPo5xzNHOOPOgX+E0I3vHrhRL8BRWxmFWkISgAQ
         +i0WXSvntb6XALvoN75BJZ8tWojCm+c0NsXbkmxlQDtQPehUCwkTUWgNE03fqL1zSuS6
         4FZlMcUM0btGs3zOXfKWigpw6k8Rtri30Ct8VHmMjmDv7aPxUQ+L1xrqL4GORwuJXF3n
         MmL5FUTnrfHd0xZvm/CbSe3zODoCvFl6lAictdyOpbmMKmD62AqI3KbNzdnuAbsbMXOx
         e+Xw==
X-Gm-Message-State: AOAM531BwDQMMCCDHsVRsOrrItmBDGwoHpgE6fNstveVloTYnlI4R93A
        vYNIUeMvrmDgegvAUpJg6CSrO+N7ZSxP+Dg3sQEACzfk
X-Google-Smtp-Source: ABdhPJwgLO7hizlp6s1fBbo5T71Hhk8okBPlA/WiffW7qXcuwWcG0OWlLBK4Bw2svyB/X5fwjYwB3hgU+amm7L7oJsM=
X-Received: by 2002:aca:c704:: with SMTP id x4mr5766747oif.92.1590762955513;
 Fri, 29 May 2020 07:35:55 -0700 (PDT)
MIME-Version: 1.0
References: <CAEjxPJ4qJj4-of0F=TKZ1wb-s82_wbMCYLbFPuxJ57dqbNRjeQ@mail.gmail.com>
 <20200528125128.26915-1-cgzones@googlemail.com> <20200528125128.26915-2-cgzones@googlemail.com>
In-Reply-To: <20200528125128.26915-2-cgzones@googlemail.com>
From:   Stephen Smalley <stephen.smalley.work@gmail.com>
Date:   Fri, 29 May 2020 10:35:44 -0400
Message-ID: <CAEjxPJ6EenXgia8b8-c_NG6RX1rpKGJ1Or_y2Y=2GAU+cxSTkA@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] refparser: add missing newline after error message
To:     =?UTF-8?Q?Christian_G=C3=B6ttsche?= <cgzones@googlemail.com>
Cc:     SElinux list <selinux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Thu, May 28, 2020 at 8:52 AM Christian G=C3=B6ttsche
<cgzones@googlemail.com> wrote:
>
> Signed-off-by: Christian G=C3=B6ttsche <cgzones@googlemail.com>

This seems fine although I wonder if we should just do this inside of
the o() definition and have it done for all callers.
Acked-by: Stephen Smalley <stephen.smalley.work@gmail.com>

> ---
>  python/sepolgen/src/sepolgen/refparser.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/python/sepolgen/src/sepolgen/refparser.py b/python/sepolgen/=
src/sepolgen/refparser.py
> index f3e0ae87..9f850990 100644
> --- a/python/sepolgen/src/sepolgen/refparser.py
> +++ b/python/sepolgen/src/sepolgen/refparser.py
> @@ -1148,6 +1148,6 @@ def parse_headers(root, output=3DNone, expand=3DTru=
e, debug=3DFalse):
>              status.step()
>
>      if len(failures):
> -        o("failed to parse some headers: %s" % ", ".join(failures))
> +        o("failed to parse some headers: %s\n" % ", ".join(failures))
>
>      return headers
> --
> 2.27.0.rc2
>
