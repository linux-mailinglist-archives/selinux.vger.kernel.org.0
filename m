Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17D5D2A18D1
	for <lists+selinux@lfdr.de>; Sat, 31 Oct 2020 17:53:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728074AbgJaQxA (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Sat, 31 Oct 2020 12:53:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:29821 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726586AbgJaQxA (ORCPT
        <rfc822;selinux@vger.kernel.org>); Sat, 31 Oct 2020 12:53:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1604163178;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=F2FHnLvB4HzsZ137bha/4V99p3QMoB9UeS6FR/ExuSw=;
        b=L8HuYoUwhyW1e7/HE2ZVddGkwr0GKAVuAxIeWf4QSUtxIlXlm0ePpfmjUfTmB1OaWg5mhp
        zajsh16+LjxEpp1vxZZOaw3G6qBk5TZSHNPM8qjVyvDm74gCDaceXpOsqgUgzb5p/ir9qQ
        mR4r0P/iV11V7/SjGgl/tZRqmuSCc8E=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-588-qRJCZVJ5OY6Q54Oq8_nxRQ-1; Sat, 31 Oct 2020 12:52:55 -0400
X-MC-Unique: qRJCZVJ5OY6Q54Oq8_nxRQ-1
Received: by mail-lj1-f197.google.com with SMTP id p6so2779188ljj.20
        for <selinux@vger.kernel.org>; Sat, 31 Oct 2020 09:52:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=F2FHnLvB4HzsZ137bha/4V99p3QMoB9UeS6FR/ExuSw=;
        b=KRrVaRGeNzxBanoNjEzbVokMlvThbuzvAiguW+GnWrIBLeNlrrK6zUlViHivakpiGv
         I8D8SQekOpybayNHK46cfWHLe7Id858QqeSGnUIghXDU7N+SNiqwaBZw3oBpPHAKebOi
         NtvxDyViXgX7LOF0i+RS1qR3GJYtcZGejVclvxZYpq1B9IeV42vbDeeT3765VbIKmqWL
         yrKS0ULKWTxqvABL/63nc2f/6OrDFfWjO4n74QK2xwV4EwfrIAsJq8x+G8t0xyNo64QO
         A+0vhzkE5RivXYvR1dpkmHi7KGGdsorNEQWrR4z1J5TmeMhGPR7hGwFvF/xJhBB07z97
         z4sw==
X-Gm-Message-State: AOAM531+w0AVoF4h/W3pVMP+bKdkcd/cQNiK7BpflaZI2qz94l1Va12G
        Z8Eja5a0Y8ChPFdGSYgAFwQaAzTFRBNkmezifwrHuMI8IsxfGvR500OHq7S4wlQm/Q70EJzuW7x
        FNpCKeIaqnuuKknR/rlNpHwY4ZC7j0cr9ZQ==
X-Received: by 2002:a05:651c:234:: with SMTP id z20mr3563641ljn.337.1604163173441;
        Sat, 31 Oct 2020 09:52:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw7BaLG1dP/tXyZLl3ua0aP4FMr9GS5/KfMzXb1JqWXXOvSllgqgTDbmXU9cA8LIzgQx8vfMYRvKTFiOBfHdEk=
X-Received: by 2002:a05:651c:234:: with SMTP id z20mr3563635ljn.337.1604163173262;
 Sat, 31 Oct 2020 09:52:53 -0700 (PDT)
MIME-Version: 1.0
References: <20201029082824.1328401-1-omosnace@redhat.com>
In-Reply-To: <20201029082824.1328401-1-omosnace@redhat.com>
From:   Ondrej Mosnacek <omosnace@redhat.com>
Date:   Sat, 31 Oct 2020 17:52:42 +0100
Message-ID: <CAFqZXNv_vFj9_LWo5p6A-dHqNhyU8J-MC7BNWMHSE8U+G71FGA@mail.gmail.com>
Subject: Re: [PATCH] test_sctp.te: avoid use of corenet_sctp_bind_generic_node()
To:     SElinux list <selinux@vger.kernel.org>
Cc:     Richard Haines <richard_c_haines@btinternet.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Thu, Oct 29, 2020 at 9:28 AM Ondrej Mosnacek <omosnace@redhat.com> wrote:
>
> RHEL-7 policy doesn't have it and we only check for
> corenet_sctp_bind_all_nodes() in the Makefile. Change the uses of
> corenet_sctp_bind_generic_node() to corenet_sctp_bind_all_nodes() to
> match the pattern used in the rest of the file.
>
> Fixes: 841ccaabb366 ("selinux-testsuite: Update SCTP asconf client/server")
> Signed-off-by: Ondrej Mosnacek <omosnace@redhat.com>
> ---
>  policy/test_sctp.te | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/policy/test_sctp.te b/policy/test_sctp.te
> index 793f451..363e3c5 100644
> --- a/policy/test_sctp.te
> +++ b/policy/test_sctp.te
> @@ -188,8 +188,8 @@ unconfined_runs_test(sctp_asconf_params_client_t)
>  typeattribute sctp_asconf_params_client_t testdomain;
>  typeattribute sctp_asconf_params_client_t sctpsocketdomain;
>  allow sctp_asconf_params_client_t self:sctp_socket { create connect ioctl read getattr write getopt setopt };
> +corenet_sctp_bind_all_nodes(sctp_asconf_params_client_t)
>  corenet_inout_generic_node(sctp_asconf_params_client_t)
> -corenet_sctp_bind_generic_node(sctp_asconf_params_client_t)
>  corenet_inout_generic_if(sctp_asconf_params_client_t)
>
>  # When running locally need this rule, else Client error 'Dynamic Address Reconfiguration'
> @@ -206,8 +206,8 @@ unconfined_runs_test(sctp_asconf_deny_pri_addr_client_t)
>  typeattribute sctp_asconf_deny_pri_addr_client_t testdomain;
>  typeattribute sctp_asconf_deny_pri_addr_client_t sctpsocketdomain;
>  allow sctp_asconf_deny_pri_addr_client_t self:sctp_socket { create connect ioctl read getattr write getopt setopt };
> +corenet_sctp_bind_all_nodes(sctp_asconf_deny_pri_addr_client_t)
>  corenet_inout_generic_node(sctp_asconf_deny_pri_addr_client_t)
> -corenet_sctp_bind_generic_node(sctp_asconf_deny_pri_addr_client_t)
>  corenet_inout_generic_if(sctp_asconf_deny_pri_addr_client_t)
>
>  # net/sctp/sm_make_chunk.c sctp_process_asconf_param() SCTP_PARAM_ADD_IP and SCTP_PARAM_SET_PRIMARY
> @@ -224,8 +224,8 @@ unconfined_runs_test(sctp_asconf_deny_param_add_client_t)
>  typeattribute sctp_asconf_deny_param_add_client_t testdomain;
>  typeattribute sctp_asconf_deny_param_add_client_t sctpsocketdomain;
>  allow sctp_asconf_deny_param_add_client_t self:sctp_socket { create connect ioctl read getattr write getopt setopt };
> +corenet_sctp_bind_all_nodes(sctp_asconf_deny_param_add_client_t)
>  corenet_inout_generic_node(sctp_asconf_deny_param_add_client_t)
> -corenet_sctp_bind_generic_node(sctp_asconf_deny_param_add_client_t)
>  corenet_inout_generic_if(sctp_asconf_deny_param_add_client_t)
>
>  # net/sctp/sm_make_chunk.c sctp_process_asconf_param() SCTP_PARAM_ADD_IP and SCTP_PARAM_SET_PRIMARY
> --
> 2.26.2
>

This is now applied:
https://github.com/SELinuxProject/selinux-testsuite/commit/4dcb6a552d538d0a16c78ad113a206949a8b1707

-- 
Ondrej Mosnacek
Software Engineer, Platform Security - SELinux kernel
Red Hat, Inc.

