Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 066AE593288
	for <lists+selinux@lfdr.de>; Mon, 15 Aug 2022 17:54:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230162AbiHOPxy (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Mon, 15 Aug 2022 11:53:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229515AbiHOPxw (ORCPT
        <rfc822;selinux@vger.kernel.org>); Mon, 15 Aug 2022 11:53:52 -0400
Received: from mail-oo1-xc34.google.com (mail-oo1-xc34.google.com [IPv6:2607:f8b0:4864:20::c34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0974D19004
        for <selinux@vger.kernel.org>; Mon, 15 Aug 2022 08:53:51 -0700 (PDT)
Received: by mail-oo1-xc34.google.com with SMTP id s10-20020a4ab54a000000b00435f410bbacso1388693ooo.9
        for <selinux@vger.kernel.org>; Mon, 15 Aug 2022 08:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc;
        bh=KjP9wAQ8KeBLdnthwyhuEKLcscDBkev0AiYHVSkLQYo=;
        b=Kk332b9BBSlrm7ejhWmB8UK89BkkhO7mLYvT/ZUkZwB1GzE2rw7EfrI6obnLy7sdyb
         OSnNtohWYccC5jVKg2am++Z8/fnO14c9YCxBZKYMrTFNxt7Qh36MvuV2Ih0H4c4Cb6fp
         1Ao6cyOXzNeVf80IW0u7luRpfetElNR4w54DYlRkYslPEMKgjHTJcktNi2jJnivAyvNM
         mceQnZRjJ1E+SMBeP08LqSbgVA+Yq2tk5yS6U9QH6JQzKw6tJntEPpfODAt1/9pclMWU
         /cD05vHrlv6tse5y3zNwsKiqxGUVQMBkUtb89r/4b7zlC8XuTNCcCxSv1/34eLPbLDti
         Y4DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
        bh=KjP9wAQ8KeBLdnthwyhuEKLcscDBkev0AiYHVSkLQYo=;
        b=H7u3pNKOQ/oLnxdcflMG08uQvoFvvG47jKxxInWAukLlPVwnkko2ZDbB88nx8nwa56
         lJsfe2MjC1t8mj/LlSpiLTOwakhk3kVeWKV5hWviPJvgArjvdSHLgxeekVwIxFtTp0CT
         gJYow7n8FusJfheG1IMl917u77JkTmma0kIWKBhu5yo4qC5Kyo14CgOfalaHEYoRkYdn
         4W0vsejOJaz3wj4kV2EB97/30DIi/IG1vKt2EmnUtF4hha+5nbW6pR0LTmR2f2sW8WPC
         i0OHwCeXSNSUxxzaw/BVkIS18D07Wqd97hCN1PDR/KDEXbvID9vzbxBLjKKYtaYL0Sny
         F6VA==
X-Gm-Message-State: ACgBeo0hNsWmInrqYUWZ0a7yc54q6XtKsNgbWxqYkXCwflRPsUuxWnR7
        AGo1hRqPhzuy4gfaqFqc/rzlS+fc4HC1RTAnEB/gk09J
X-Google-Smtp-Source: AA6agR4cD6s9ilzRRWLAbf8ah3e8r8kHunP6fWm8bgzLe8X8kKNTirs4lYwE0nZLINq3wSQAyb3I7JZVlM6XmUofYcg=
X-Received: by 2002:a4a:9731:0:b0:35e:fd1a:d452 with SMTP id
 u46-20020a4a9731000000b0035efd1ad452mr5089759ooi.8.1660578830389; Mon, 15 Aug
 2022 08:53:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220808173429.16318-1-cgzones@googlemail.com> <CAP+JOzSXn++7PrSViBt2tEsBr1vNweAtduO00bAMmv3GjTOuCQ@mail.gmail.com>
In-Reply-To: <CAP+JOzSXn++7PrSViBt2tEsBr1vNweAtduO00bAMmv3GjTOuCQ@mail.gmail.com>
From:   James Carter <jwcart2@gmail.com>
Date:   Mon, 15 Aug 2022 11:53:39 -0400
Message-ID: <CAP+JOzSM4ZGBK_ncgxhFzH1SWQdvNOOfwqrVr+nMA1HdZcJbcw@mail.gmail.com>
Subject: Re: [PATCH] libselinux: avoid newline in avc message
To:     =?UTF-8?Q?Christian_G=C3=B6ttsche?= <cgzones@googlemail.com>
Cc:     selinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Wed, Aug 10, 2022 at 11:33 AM James Carter <jwcart2@gmail.com> wrote:
>
> On Mon, Aug 8, 2022 at 1:36 PM Christian G=C3=B6ttsche
> <cgzones@googlemail.com> wrote:
> >
> > Do not add a final newline to the avc log message as it will be treated
> > as a part of the tclass field in final audit record:
> >
> >     {
> >         "AUDIT_FIELD_EXE" : "/usr/bin/dbus-broker",
> >         "_UID" : "104",
> >         "_AUDIT_SESSION" : "4294967295",
> >         "_TRANSPORT" : "audit",
> >         "__REALTIME_TIMESTAMP" : "1659975331468531",
> >         "_AUDIT_TYPE" : "1107",
> >         "AUDIT_FIELD_SCONTEXT" : "system_u:system_r:systemd_t:s0",
> >         "_AUDIT_LOGINUID" : "4294967295",
> >         "_SELINUX_CONTEXT" : "system_u:system_r:system_dbusd_t:s0-s0:c0=
.c1023",
> >         "AUDIT_FIELD_SAUID" : "104",
> >         "MESSAGE" : "USER_AVC pid=3D1538 uid=3D104 auid=3D4294967295 se=
s=3D4294967295 subj=3Dsystem_u:system_r:system_dbusd_t:s0-s0:c0.c1023 msg=
=3D'avc:  granted  { send_msg } for  scontext=3Dsystem_u:system_r:systemd_t=
:s0 tcontext=3Dsystem_u:system_r:systemd_logind_t:s0 tclass=3Ddbus\n exe=3D=
\"/usr/bin/dbus-broker\" sauid=3D104 hostname=3D? addr=3D? terminal=3D?'",
> >         "AUDIT_FIELD_TCONTEXT" : "system_u:system_r:systemd_logind_t:s0=
",
> >         "_SOURCE_REALTIME_TIMESTAMP" : "1659975331462000",
> >         "__MONOTONIC_TIMESTAMP" : "207995768",
> >         "AUDIT_FIELD_TCLASS" : "dbus\n",
> >         "AUDIT_FIELD_TERMINAL" : "?",
> >         "_PID" : "1538",
> >         "SYSLOG_FACILITY" : "4",
> >         "_BOOT_ID" : "3921464b65f64fb4a7c037dee97cd6ad",
> >         "SYSLOG_IDENTIFIER" : "audit",
> >         "_MACHINE_ID" : "5d78c28f10d54c0fb7b6fd1acc6af8ff",
> >         "_AUDIT_TYPE_NAME" : "USER_AVC",
> >         "__CURSOR" : "s=3D84589ce96ff8400189fc515ff892674a;i=3Dc38e;b=
=3D3921464b65f64fb4a7c037dee97cd6ad;m=3Dc65c378;t=3D5e5bd1ff7d4f3;x=3Dc22e6=
10fc9b00b10",
> >         "AUDIT_FIELD_ADDR" : "?",
> >         "AUDIT_FIELD_HOSTNAME" : "?",
> >         "_AUDIT_ID" : "1075",
> >         "_HOSTNAME" : "debianBullseye"
> >     }
> >
> > Signed-off-by: Christian G=C3=B6ttsche <cgzones@googlemail.com>
>
> Acked-by: James Carter <jwcart2@gmail.com>
>
Merged.
Thanks,
Jim

> > ---
> >  libselinux/src/avc.c | 1 -
> >  1 file changed, 1 deletion(-)
> >
> > diff --git a/libselinux/src/avc.c b/libselinux/src/avc.c
> > index 7493e4b2..8d5983a2 100644
> > --- a/libselinux/src/avc.c
> > +++ b/libselinux/src/avc.c
> > @@ -725,7 +725,6 @@ void avc_audit(security_id_t ssid, security_id_t ts=
id,
> >         if (denied)
> >                 log_append(avc_audit_buf, " permissive=3D%u", result ? =
0 : 1);
> >
> > -       log_append(avc_audit_buf, "\n");
> >         avc_log(SELINUX_AVC, "%s", avc_audit_buf);
> >
> >         avc_release_lock(avc_log_lock);
> > --
> > 2.36.1
> >
