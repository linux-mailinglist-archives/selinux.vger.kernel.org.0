Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6242466DA7A
	for <lists+selinux@lfdr.de>; Tue, 17 Jan 2023 11:01:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236150AbjAQKB3 (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Tue, 17 Jan 2023 05:01:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236333AbjAQKB0 (ORCPT
        <rfc822;selinux@vger.kernel.org>); Tue, 17 Jan 2023 05:01:26 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEEB32BF15
        for <selinux@vger.kernel.org>; Tue, 17 Jan 2023 02:00:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1673949640;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=kuFWwb8U43DhKlNxSoNqKZx+RqXEasU5aLdyl+U/jdg=;
        b=DC3FHKb/06epm+r5XIIsVvefP4GKHFfchF7iEJ3wsN0UabfgF3PyW+7eKWXulVG7FQ+AtW
        bcvPoT1RrZID2PkqB3YjggCQV3d8zvlomEaBtcGY+En7Wi36F9EtubRKb5kA8P9IN78rmt
        spSAA6Hp7Aa0Nr07oOVjEbfuvVueTbQ=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-384-sGdj2pWgPAu95qEvWiAeOg-1; Tue, 17 Jan 2023 05:00:38 -0500
X-MC-Unique: sGdj2pWgPAu95qEvWiAeOg-1
Received: by mail-pg1-f198.google.com with SMTP id 201-20020a6300d2000000b004ccf545f44fso2644019pga.12
        for <selinux@vger.kernel.org>; Tue, 17 Jan 2023 02:00:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kuFWwb8U43DhKlNxSoNqKZx+RqXEasU5aLdyl+U/jdg=;
        b=mJv1Ml7lKJecrB66kZISIIvjvxtX5f8YrgZL0I1Bl9VnGf8yvwC+aOtL8xAARH0sHZ
         nnoyHBqMmzw8OCbKfzB/5hvbmlyFratsohK1fOE6ptVJZ2a03fqEuuKuJobrv4wnsXOg
         d+GY/34RzWHiSQ8XJp7mmZSsz78+c3Ciab2XghqGw91yv+zotagz/K+Hfj//BWkMmuOK
         SSHWvbFmU2zG2p9F+j+3SkpR967OkGRLc0sgwihZXRs53NmUSo75GuLsVCU0I7jQ3sLQ
         hfW707Fs63MRJKd0yNEgwFFy9n/XkEhzUP1ARdrtD8I48NuldcFhtvaQbUe/26Xa+OQz
         CZzg==
X-Gm-Message-State: AFqh2krnBPZGjbnHK2PbiuXR9BD3djApcNauFCsmn5n58qslDtrhmpto
        j39NwaenOX7IIeim2B9Gri6saScEz2W/1ZKgaD7VjzGSByAg4GLb/6p48PJ9xxwtLOta5hn43Go
        RaehAMsSWhSj/OqnAj2h+YpbXfyKeHn4y7Q==
X-Received: by 2002:a63:c102:0:b0:46f:81cc:5ecb with SMTP id w2-20020a63c102000000b0046f81cc5ecbmr142216pgf.459.1673949637613;
        Tue, 17 Jan 2023 02:00:37 -0800 (PST)
X-Google-Smtp-Source: AMrXdXt51VZB0R8774K1D09Ebe4u+jd8Vy/7HTBBK3m8JHTYqlpjAZ/H19lFAtbOsV993KMGlqXEtRbsKbiz/cETacI=
X-Received: by 2002:a63:c102:0:b0:46f:81cc:5ecb with SMTP id
 w2-20020a63c102000000b0046f81cc5ecbmr142214pgf.459.1673949637255; Tue, 17 Jan
 2023 02:00:37 -0800 (PST)
MIME-Version: 1.0
References: <20230116214626.28955-1-cgzones@googlemail.com>
In-Reply-To: <20230116214626.28955-1-cgzones@googlemail.com>
From:   Ondrej Mosnacek <omosnace@redhat.com>
Date:   Tue, 17 Jan 2023 11:00:26 +0100
Message-ID: <CAFqZXNu-Wg=JAsAFHFW9J3DBV-7BYL2960SJnEpaP3VzOJn+Bg@mail.gmail.com>
Subject: Re: [TESTSUITE PATCH] policy: drop usage of files_list_pids()
To:     =?UTF-8?Q?Christian_G=C3=B6ttsche?= <cgzones@googlemail.com>
Cc:     selinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Mon, Jan 16, 2023 at 10:48 PM Christian G=C3=B6ttsche
<cgzones@googlemail.com> wrote:
> files_list_pids() has been superseded and marked deprecated in the
> Reference Policy since Jun 2020[1].  In the latest release it has been
> completely removed[2].
>
> Grant the necessary permissions via raw rules to support recent
> Refpolicy versions as well as old ones without the replacement
> interface files_list_runtime().

It seems the permissions aren't actually needed, at least on current
Fedoras. Simply removing the call passes the CI:
https://github.com/WOnder93/selinux-testsuite/commit/d0883a56d2583800a1fa79=
490097e73b842cec17

Do you have an environment with refpolicy where you can test it? It
would be better to just remove the interface call if it's not needed.

>
> [1]: https://github.com/SELinuxProject/refpolicy/commit/be04bb3e7e63671ed=
8a3c501a2ee76e11c3b92bb
> [2]: https://github.com/SELinuxProject/refpolicy/commit/3ca0cd59d7a9b531d=
d3620a02940396343fe2ed5
>
> Signed-off-by: Christian G=C3=B6ttsche <cgzones@googlemail.com>
> ---
>  policy/test_global.te | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/policy/test_global.te b/policy/test_global.te
> index e95102a..4bf30f8 100644
> --- a/policy/test_global.te
> +++ b/policy/test_global.te
> @@ -121,7 +121,6 @@ allow testsuite_domain proc_t:file { getattr read ope=
n };
>  files_list_var(testsuite_domain)
>  files_list_home(testsuite_domain)
>  dev_read_rand(testsuite_domain)
> -files_list_pids(testsuite_domain)
>  require {
>         type root_t;
>         type etc_t;
> @@ -136,8 +135,12 @@ require {
>         type init_t;
>         type initrc_t;
>         type console_device_t;
> +       type var_t;
> +       type var_run_t;
>  }
> -allow testsuite_domain { root_t etc_t bin_t sbin_t lib_t usr_t devpts_t =
}:dir list_dir_perms;
> +allow testsuite_domain { root_t etc_t bin_t sbin_t lib_t usr_t devpts_t =
var_run_t }:dir list_dir_perms;
> +allow testsuite_domain var_t:dir search_dir_perms;
> +allow testsuite_domain { var_t var_run_t }:lnk_file read_lnk_file_perms;
>  allow testsuite_domain lib_t:file read_file_perms;
>  allow testsuite_domain lib_t:lnk_file read;
>  allow testsuite_domain etc_t:file read_file_perms;
> --
> 2.39.0
>

--=20
Ondrej Mosnacek
Senior Software Engineer, Linux Security - SELinux kernel
Red Hat, Inc.

