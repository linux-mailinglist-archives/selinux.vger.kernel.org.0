Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B08051F4782
	for <lists+selinux@lfdr.de>; Tue,  9 Jun 2020 21:50:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731361AbgFITuE (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Tue, 9 Jun 2020 15:50:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730817AbgFITuE (ORCPT
        <rfc822;selinux@vger.kernel.org>); Tue, 9 Jun 2020 15:50:04 -0400
Received: from mail-oo1-xc41.google.com (mail-oo1-xc41.google.com [IPv6:2607:f8b0:4864:20::c41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FAD6C05BD1E
        for <selinux@vger.kernel.org>; Tue,  9 Jun 2020 12:50:03 -0700 (PDT)
Received: by mail-oo1-xc41.google.com with SMTP id n31so4412997ooi.10
        for <selinux@vger.kernel.org>; Tue, 09 Jun 2020 12:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kkXB+F4So3QDK5yjzC1Eh1emTi5lK0xypkNyaj9EQUM=;
        b=gV6An6PM/1aRfUsWh6GxyBlXEv6+QOx42BVvGUJ2vy4cfDTKYuDdQsBeUJFlwBVold
         3mtS3sUrJV1eK2Bx2FqIhCbqYwiSLUT0VHrEFF9ZMobi8+Z4S/1szdpBuL8nYzqLyvzl
         YS0kTPb8l3pB4+fd4GqUMfApBsfAUw6KonNY2KNZGOQcxqzq8j1czoTfd1xdeFc3N+un
         GnfMcMyB5neMzTfJs8zSeqDf64VQFiriY9D+4M5VB96YNEjpjSxAB6otfff98cJ5Glxh
         g7zswnLJnpG9dhKEtNoOVc50HWg8fCbX9sQDjQGBzaQScqzy/2sd0g+V5Q3huhXPQnMz
         CUxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kkXB+F4So3QDK5yjzC1Eh1emTi5lK0xypkNyaj9EQUM=;
        b=OTvHR7Brvfc27dvV8GhwJPQUldxi3IaOjMp8kgHanXV4tSLXxQQKEfnF8kgsrqXxEN
         AMltzn5iU2ZpCFeUXwFJKad8LEwNUvgrQMq6kwA90PtNnuhTSAbItIs+J0KUxyJnyz0n
         39R7R21pQaU2g1GnF9QE8WKYttsIGxiXXAulLR0o8wsVo+n06FpAwJ4CK3eXeBVm++On
         SzsR7SHUtZcqvhbXDTNLfed13tonjLLUbJ9lt1/IslB1IMqlr7YQ4u2cSKc1bgqrKucD
         6D/Uv5lzeS8EzCPvln+n3+JGmcVWwY4rA68IXvppLXaa4jqlsfN4pQYr8eGEYDe6BB8n
         ccMw==
X-Gm-Message-State: AOAM531rknrUfsQbHeavqIC5UGxO8uB0oko7ruBzy6hz5bn8+IkdyWf+
        Ns5uhI85LHqRuhbsaHxhzE796SExvnOCBsnjAtU=
X-Google-Smtp-Source: ABdhPJyEECfQZapuLm3qfCkV2cxm5SjSX9u7nSktHS1Ff7H4QqW/oDzsHNgrgC1JsJ9AEoDAulhiqgNNK+wf7slFOAU=
X-Received: by 2002:a4a:abcb:: with SMTP id o11mr20125366oon.58.1591732202926;
 Tue, 09 Jun 2020 12:50:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200603101534.4666-1-toiwoton@gmail.com> <CAEjxPJ5sshiJ+UC1F7EouwpHOsZOaR8X8EyYYKHHcnHjEOk40Q@mail.gmail.com>
In-Reply-To: <CAEjxPJ5sshiJ+UC1F7EouwpHOsZOaR8X8EyYYKHHcnHjEOk40Q@mail.gmail.com>
From:   Stephen Smalley <stephen.smalley.work@gmail.com>
Date:   Tue, 9 Jun 2020 15:49:52 -0400
Message-ID: <CAEjxPJ6oqc1-oeTWVZNRn3Ry+BZh=ObnHCksu0JQt-Poh7US1A@mail.gmail.com>
Subject: Re: [PATCH] semanage-node.8: describe netmask
To:     Topi Miettinen <toiwoton@gmail.com>
Cc:     SElinux list <selinux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Mon, Jun 8, 2020 at 11:20 AM Stephen Smalley
<stephen.smalley.work@gmail.com> wrote:
>
> On Wed, Jun 3, 2020 at 6:16 AM Topi Miettinen <toiwoton@gmail.com> wrote:
> >
> > Network Mask argument for `semanage node` accepts also the simple CIDR
> > mask format, so let's document it.
> >
> > Signed-off-by: Topi Miettinen <toiwoton@gmail.com>
>
> Acked-by: Stephen Smalley <stephen.smalley.work@gmail.com>

Applied
