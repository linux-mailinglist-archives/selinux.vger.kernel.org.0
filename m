Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B4A6739DC7
	for <lists+selinux@lfdr.de>; Thu, 22 Jun 2023 11:53:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230256AbjFVJxZ (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Thu, 22 Jun 2023 05:53:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230338AbjFVJw6 (ORCPT
        <rfc822;selinux@vger.kernel.org>); Thu, 22 Jun 2023 05:52:58 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3ED6559FC
        for <selinux@vger.kernel.org>; Thu, 22 Jun 2023 02:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1687427038;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=tfBTLjWk9HMhuQRWRNusLiVYa6Eoe9Ih4uI1VHHwYKo=;
        b=Z5Ylw4XudqNRLDUt1zZ0O3jvkVbA3lM4QpC4bETSDlWXB/yl85TQCD0zHpf/sOn9qdvymB
        SaC7cPVfW0iltfkIxP7a0xexBX+2Qh9oA7kIIReGw2B6FNDlBBl/giDDZcSzK0ODe8lLWM
        P26UlLiI3JhylQNHc00slaMUFNXyZ0s=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-551-6ZfbrOVuOnC-a63VXVSF_A-1; Thu, 22 Jun 2023 05:43:55 -0400
X-MC-Unique: 6ZfbrOVuOnC-a63VXVSF_A-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9227E873229
        for <selinux@vger.kernel.org>; Thu, 22 Jun 2023 09:43:55 +0000 (UTC)
Received: from localhost (unknown [10.45.225.244])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 3EC4540D1A4;
        Thu, 22 Jun 2023 09:43:55 +0000 (UTC)
From:   Petr Lautrbach <lautrbach@redhat.com>
To:     Vit Mojzis <vmojzis@redhat.com>, selinux@vger.kernel.org
Subject: Re: [PATCH] python/sepolicy: Add/remove user even when SELinux is
 disabled
In-Reply-To: <20230529161702.1920540-1-vmojzis@redhat.com>
References: <20230529161702.1920540-1-vmojzis@redhat.com>
Date:   Thu, 22 Jun 2023 11:43:54 +0200
Message-ID: <87r0q36dd1.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Vit Mojzis <vmojzis@redhat.com> writes:

> Use "semanage user -a/-d" in spec file generated by "sepolicy generate"
> even when SELinux is disabled. The command works properly when SELinux
> is disabled and with this change the user will be present once SELinux
> is re-enabled.
> Also, do not execute the command when the package is updated, only when
> it is first installed.
>
> Signed-off-by: Vit Mojzis <vmojzis@redhat.com>

Acked-by: Petr Lautrbach <lautrbach@redhat.com>


> ---
>  python/sepolicy/sepolicy/templates/spec.py | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/python/sepolicy/sepolicy/templates/spec.py b/python/sepolicy/sepolicy/templates/spec.py
> index 16a22081..433c298a 100644
> --- a/python/sepolicy/sepolicy/templates/spec.py
> +++ b/python/sepolicy/sepolicy/templates/spec.py
> @@ -43,20 +43,23 @@ install -m 644 %{SOURCE3} %{buildroot}/etc/selinux/targeted/contexts/users/DOMAI
>  
>  %post
>  semodule -n -i %{_datadir}/selinux/packages/MODULENAME.pp
> +# Add the new user defined in DOMAINNAME_u only when the package is installed (not during updates)
> +if [ $1 -eq 1 ]; then
> +    /usr/sbin/semanage user -a -R DOMAINNAME_r DOMAINNAME_u
> +fi
>  if /usr/sbin/selinuxenabled ; then
>      /usr/sbin/load_policy
>      %relabel_files
> -    /usr/sbin/semanage user -a -R DOMAINNAME_r DOMAINNAME_u
>  fi;
>  exit 0
>  
>  %postun
>  if [ $1 -eq 0 ]; then
> +    /usr/sbin/semanage user -d DOMAINNAME_u
>      semodule -n -r MODULENAME
>      if /usr/sbin/selinuxenabled ; then
>         /usr/sbin/load_policy
>         %relabel_files
> -       /usr/sbin/semanage user -d DOMAINNAME_u
>      fi;
>  fi;
>  exit 0
> -- 
> 2.40.0

