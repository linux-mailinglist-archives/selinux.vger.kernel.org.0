Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63A3930146A
	for <lists+selinux@lfdr.de>; Sat, 23 Jan 2021 11:00:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726032AbhAWJ6m (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Sat, 23 Jan 2021 04:58:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59832 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726986AbhAWJ50 (ORCPT
        <rfc822;selinux@vger.kernel.org>); Sat, 23 Jan 2021 04:57:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1611395756;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=28AuRnw5wC1Vle97ZHduufjMVR059Zg280ZOOHY9S4U=;
        b=Ub1iz+imXLbawnSvtPRIqeZLkQ9JhvidnfxYvguYNkrvgYgZwcvq/Qymi2RAv9lk6fed0T
        Z5EkLC4JQwKhzI+6GVkrhJbh/aku+LInywii627Y0viqF3AAItLi0RPgDzye6UK1cxhBgs
        4/0Ot0MNX6CrOfjWbyVOnS8NHU4efow=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-345-5O8TTQqQP3ajoAiUn7yjDQ-1; Sat, 23 Jan 2021 04:55:53 -0500
X-MC-Unique: 5O8TTQqQP3ajoAiUn7yjDQ-1
Received: by mail-lj1-f198.google.com with SMTP id a2so3532998ljm.23
        for <selinux@vger.kernel.org>; Sat, 23 Jan 2021 01:55:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=28AuRnw5wC1Vle97ZHduufjMVR059Zg280ZOOHY9S4U=;
        b=JJ6J7xwJ388QDL8EL2/RK+tPm8mYrBDqWzg5jSy6YKI1UNTryonlC7hJukTXsD/vz5
         k/TnVfnKLSVsp+GivLsRSQ1WUmIANkiLLvoaZOD0NEYu/Oy5InI4yxKJ15cMKwJ7BZDp
         3dL9LJWji/suwBtk0HvpGOljM8sEpP4g8GW3gv1Mi94qptjuWPgAvxVS66WFRPPpCTLd
         TveXLCnG6ndYUKeWy7+txPAzQrw2W3FO9CJUmIhKzziemkAGqy7y3OHVB5egurUBkfOq
         z0YdrjX/beXvHlY7chk+Vo3GocmLpo5hzzzDr3S8jrTJwarOrlTc9nJTF94/T/rQvuyE
         CbsA==
X-Gm-Message-State: AOAM531FHeYPazSKE/MkOk5RDa7LhZj6C5QNVUinFa4uDTeP450aumpn
        LzLeyFdIDfwIETGoRUWJidxtm2ylKJarbmsdUsT4hOCf8r2GZ8hOx4783ZnFUQb8nhyy+LzVwYg
        WKoOdllc6qAJWq2ruUhJJ0AyKm4xPKQ4+Iw==
X-Received: by 2002:a2e:2a86:: with SMTP id q128mr943362ljq.158.1611395751618;
        Sat, 23 Jan 2021 01:55:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzSPURjjj890lIN2bkkW6SflMK2DHogoIfwYZldLTF8Vd8DUAo/E2FRvvPPASSUf4dMRoH5/AwpK10f2+eXrPg=
X-Received: by 2002:a2e:2a86:: with SMTP id q128mr943357ljq.158.1611395751453;
 Sat, 23 Jan 2021 01:55:51 -0800 (PST)
MIME-Version: 1.0
References: <20210122102748.38776-1-omosnace@redhat.com>
In-Reply-To: <20210122102748.38776-1-omosnace@redhat.com>
From:   Ondrej Mosnacek <omosnace@redhat.com>
Date:   Sat, 23 Jan 2021 10:55:41 +0100
Message-ID: <CAFqZXNthGnTdptfjMZhX4CXHpuR9TPX_XbyeTOEJwPrOujvfnA@mail.gmail.com>
Subject: Re: [PATCH testsuite 0/2] Migrate CI to GH Actions
To:     SElinux list <selinux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Fri, Jan 22, 2021 at 11:27 AM Ondrej Mosnacek <omosnace@redhat.com> wrote:
> See individual patches for more details.
>
> Special thanks to Nicholas Iooss, who figured out this approach.
>
> Note: I plan to merge this tomorrow (along with the userfaultfd test)
> so that we have working CI again. I might do that also earlier if
> someone acks it fast ;)
>
> Ondrej Mosnacek (2):
>   check-syntax: use 'command -v' instead of 'which'
>   Migrate CI to GH Actions
>
>  .github/workflows/checks.yml |  27 +++++++
>  .travis.yml                  |  40 ----------
>  Vagrantfile                  |  65 ++++++++++++++++
>  tools/check-syntax           |   2 +-
>  travis-ci/LICENSE            |   5 --
>  travis-ci/run-kvm-test.sh    | 141 -----------------------------------
>  travis-ci/run-testsuite.sh   |  58 --------------
>  7 files changed, 93 insertions(+), 245 deletions(-)
>  create mode 100644 .github/workflows/checks.yml
>  delete mode 100644 .travis.yml
>  create mode 100644 Vagrantfile
>  delete mode 100644 travis-ci/LICENSE
>  delete mode 100755 travis-ci/run-kvm-test.sh
>  delete mode 100755 travis-ci/run-testsuite.sh
>
> --
> 2.29.2

Merged and passing:
https://github.com/SELinuxProject/selinux-testsuite/actions/runs/505560875

--
Ondrej Mosnacek
Software Engineer, Platform Security - SELinux kernel
Red Hat, Inc.

