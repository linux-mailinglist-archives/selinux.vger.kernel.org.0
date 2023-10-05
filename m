Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6EE8F7BA16C
	for <lists+selinux@lfdr.de>; Thu,  5 Oct 2023 16:53:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236846AbjJEOnJ (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Thu, 5 Oct 2023 10:43:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230270AbjJEOhg (ORCPT
        <rfc822;selinux@vger.kernel.org>); Thu, 5 Oct 2023 10:37:36 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A24C54F6CC
        for <selinux@vger.kernel.org>; Thu,  5 Oct 2023 07:02:50 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-3248e90f032so1044085f8f.1
        for <selinux@vger.kernel.org>; Thu, 05 Oct 2023 07:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696514567; x=1697119367; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5OFii5WdVQDyhl2VKfgg41U3fXAQ82ND7sbZdi9TxWw=;
        b=eifUpYykzKv5EQjc03R6VOsIw8+Z8O6mK30dxpT94GeGUWOPuNXBhzYRhKqufYmPdv
         VZay5YBhfxALvmiZ2PCHj8t6Prr3zkimxz5pb2GfL+Yyw7JaOJl9Gb7yOYgbYeY6tdRm
         ogvlSabYDEOwuX7YSKQ/dLdMEQzn7vewl5pZb4JR7p/h8rokeGiKggKYuayp79J3WXNi
         o3vJFGWYnE3cxCP06gZGVHV5FOPTrVe42hdX8BPdsC1t3J0morlYmlugSbCx4Zh8XlK1
         2cCh5hkVmH15/NTztgmy7rED7YXRYa8t2zMFcHotTKVFVk2lnhZgAwYOT7j8/nyvhUS1
         JJAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696514567; x=1697119367;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5OFii5WdVQDyhl2VKfgg41U3fXAQ82ND7sbZdi9TxWw=;
        b=lHsQMGcSSQ6AR0Z9b1v4bUeygkR139WbEFwXwGUEPjOsYTM20VobGU+1G3yrEgL7XH
         ehSPuRMyOAUGdy7zuz8N9sbcezRIzn5WU635B2jT/r79KES5gFfJvoHaNq/qeL1vVP6q
         xKIBsRdCE3RncvJx88neNRkG2NtC7/PpYmNpQgKBYQBTnxn6HoLa+nKS08NwvfTM7OXZ
         hP/2bthdYJAxVUtP+jpIEf9HPQsRXzTyx/ACGAnYHY+TU+RqnUd78w6cX5jgFsq//Uaq
         sOk/3zcvlxr9gWVggcwb86VYsRA87fbP6KLEkbuBoJ/tzs1eu9Wa2Dd3ODrwRuMAiqbU
         yOSw==
X-Gm-Message-State: AOJu0YxLlfrnNSGTBkIGfB6q2QDPKz2UcQZZOADuTg++uhDDwcBR6H3K
        FtT86Bj3pODaaUDx8yjnrQEclqB/elQ8GN4e0AA=
X-Google-Smtp-Source: AGHT+IFa3XalC4m7822MNM/pnqyEuRvtiKtypPSV7p8m7xxGG+ivY925ow216FCbpYilWwxvTXxk/ztro85vtkwrWyI=
X-Received: by 2002:a05:6000:14e:b0:320:a19:7f87 with SMTP id
 r14-20020a056000014e00b003200a197f87mr4645365wrx.18.1696514567420; Thu, 05
 Oct 2023 07:02:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230814132025.45364-1-cgzones@googlemail.com> <20230814132025.45364-12-cgzones@googlemail.com>
In-Reply-To: <20230814132025.45364-12-cgzones@googlemail.com>
From:   James Carter <jwcart2@gmail.com>
Date:   Thu, 5 Oct 2023 10:02:36 -0400
Message-ID: <CAP+JOzR24hdHpKtgVsfWHN0jLaE6O9YrKLvP7zcOwi3Y8sotYg@mail.gmail.com>
Subject: Re: [RFC PATCH v2 11/27] libselinux/utils: use type safe union assignment
To:     =?UTF-8?Q?Christian_G=C3=B6ttsche?= <cgzones@googlemail.com>
Cc:     selinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Mon, Aug 14, 2023 at 9:41=E2=80=AFAM Christian G=C3=B6ttsche
<cgzones@googlemail.com> wrote:
>
>     selinux_check_access.c:43:10: warning: cast to union type is a GNU ex=
tension [-Wgnu-union-cast]
>        43 |                                      (union selinux_callback)=
cb_auditinfo);
>           |                                      ^                       =
~~~~~~~~~~~~
>
> Signed-off-by: Christian G=C3=B6ttsche <cgzones@googlemail.com>

Acked-by: James Carter <jwcart2@gmail.com>

> ---
>  libselinux/utils/selinux_check_access.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/libselinux/utils/selinux_check_access.c b/libselinux/utils/s=
elinux_check_access.c
> index 6cea40e9..f7b27a85 100644
> --- a/libselinux/utils/selinux_check_access.c
> +++ b/libselinux/utils/selinux_check_access.c
> @@ -40,7 +40,7 @@ int main(int argc, char **argv)
>
>         if (audit_msg)
>                 selinux_set_callback(SELINUX_CB_AUDIT,
> -                                    (union selinux_callback)cb_auditinfo=
);
> +                                    (union selinux_callback) { .func_aud=
it =3D cb_auditinfo });
>
>         rc =3D selinux_check_access(argv[optind], argv[optind + 1],
>                                   argv[optind + 2], argv[optind + 3],
> --
> 2.40.1
>
