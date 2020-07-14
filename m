Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7E3621FFEB
	for <lists+selinux@lfdr.de>; Tue, 14 Jul 2020 23:20:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727822AbgGNVUt (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Tue, 14 Jul 2020 17:20:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726446AbgGNVUs (ORCPT
        <rfc822;selinux@vger.kernel.org>); Tue, 14 Jul 2020 17:20:48 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87997C061755
        for <selinux@vger.kernel.org>; Tue, 14 Jul 2020 14:20:48 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id y18so13277091lfh.11
        for <selinux@vger.kernel.org>; Tue, 14 Jul 2020 14:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=crunchydata-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ux4ZnoitOH7yGKiA0E2UQO1INjh4vfXYMgNg7UTn8KM=;
        b=BwL4jo4nlJr4am+PtHTjniVjjgp/rX1AQ5ZOem5hnfPNS9aWMXzpK8dC6Idwylry7j
         BW4veB8miJ1b4fOTdNC5wVWIxXy908tmgexpBK/zuQjr0oFXNdjHr/97IpbLCYHSdssj
         jvNew91ZWdGbNB5eSeHyHSD3ziBmtxatDtdXLOLQ1eqPppGHMOIkDkLJX7BuY+xPziVD
         Zo35VVA9VWiHMCNvaxMTIh/KdjnNdpyp7qfOz3SOE9Ni72tRGUsv/ESC631iWxctSBFl
         JfTpltHQtxLBx2jywJpk1wtYwkHQC/ovBhJDl2xpVb8tFbdf/jy3O5KkRmmlLPbrYmAa
         u70A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ux4ZnoitOH7yGKiA0E2UQO1INjh4vfXYMgNg7UTn8KM=;
        b=PzTQS9K19eqGP8x2bxV9gcw3xrMCIv363dPuu/nR9SdjILltoAzWghea41+2GiO4ic
         6lC6IZqPv+BUctqaw+xZLQgtTlP9tqZwry1X2Yjz8Nl4UkiIXtCT/w7s5KsUVlq2z579
         NTnF5H3WreN5VpQSibSapMte1BdXGtoD/47rTwtlOjvR1oMDxei3n4zR5W69oBfjsZdR
         Tr1FNQA9DpZT3P1bv22t+9fcYQb/FiM5irT60X++XoA23A0q0E+ci3rhJ1nAgTdRva+a
         bBwQX5WQMgC9ieWjoxQma7VJL0bFJNibGkX7yv1/ZAh4nNozl6CYDLBYAbmMoF9n/x05
         Ovnw==
X-Gm-Message-State: AOAM530dHAwCvMAQQymhy7PU/UxzwTI1l6nRWkCqCURTztJHvuJKz6k1
        tSX6Hxr29mAJC02W4jDn1GKJmvdBbayGr4V/78GdocB7W3o=
X-Google-Smtp-Source: ABdhPJw++Eb/FdJ4q7IbSuSny0n9Aoa7fzQMtNSn2Bp7mE7Hk/0xpoJUl6GJtPqcrea9CoCxpYbb9WSDBNIfbKGCLgc=
X-Received: by 2002:a19:7404:: with SMTP id v4mr3103470lfe.93.1594761647030;
 Tue, 14 Jul 2020 14:20:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200714202934.42424-1-mike.palmiotto@crunchydata.com> <CAEjxPJ5m31kcXH66viy3R-ncbBJCET8Wm3+DjphDeZ0iV3giEA@mail.gmail.com>
In-Reply-To: <CAEjxPJ5m31kcXH66viy3R-ncbBJCET8Wm3+DjphDeZ0iV3giEA@mail.gmail.com>
From:   Mike Palmiotto <mike.palmiotto@crunchydata.com>
Date:   Tue, 14 Jul 2020 17:20:35 -0400
Message-ID: <CAMN686GqFW_40pcX=fkb8XUVFczg7+md8tqoS45C4VNcbcq-ww@mail.gmail.com>
Subject: Re: [PATCH] libselinux: Use sestatus if open
To:     Stephen Smalley <stephen.smalley.work@gmail.com>
Cc:     SElinux list <selinux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Tue, Jul 14, 2020 at 5:03 PM Stephen Smalley
<stephen.smalley.work@gmail.com> wrote:
>
> On Tue, Jul 14, 2020 at 4:35 PM Mike Palmiotto
> <mike.palmiotto@crunchydata.com> wrote:
> >
> > Commit bc2a8f418e3b ("libselinux: add selinux_status_* interfaces for
> > /selinux/status") introduced the selinux_status page mechanism, which
> > allows for mmap()'ing of selinux status state as a replacement for
> > avc_netlink.
> >
> > The mechanism was initially intended for use by userspace object
> > managers which were calculating access decisions in-tree and did not
> > rely on the libselinux AVC implementation. In order to properly make use
> > of sestatus within avc_has_perm, the status mechanism needs to properly
> > set avc internals during status events; else, avc_enforcing is never
> > updated upon sestatus changes.
> >
> > This commit moves the netlink notice logic out into convenience
> > functions, which are then called by the sestatus code. Since sestatus
> > uses netlink as a fallback, we can change the avc_netlink_check_nb()
> > call in avc_has_perm_noaudit to check the status page if it is
> > available. If it is not, we fall back to
>
> Missing word/phrase here.

Oops. I'll go ahead and fix that, thank...

> Also you need to do more than just replace
> this one call or selinux_status_updated() will do nothing unless the
> application has explicitly done a selinux_status_open() itself, e.g.
> avc_netlink_open -> selinux_status_open, avc_netlink_close ->
> selinux_status_close, deal with other avc_netlink_* calls including
> the multi-threaded case.

That was by design. I figured for this version of the patch, we could
just introduce the ability to use sestatus instead of netlink (if
open).

Do you think we should go ahead and completely swap in sestatus? I was
just worried about breaking userspace object managers that are
currently using netlink threads by default, for instance
systemd-dbusd.  I can spend some more time getting those to work with
the status page if you think that's worthwhile.

> Finally, I don't think you need to sanitize
> the enforcing value from the kernel; it takes care of that itself
> these days and no point in fixing it up for old kernels now.

Very good to know, thanks! I'll update in the next version.

-- 
Mike Palmiotto
https://crunchydata.com
