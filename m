Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B1F9C611B94
	for <lists+selinux@lfdr.de>; Fri, 28 Oct 2022 22:35:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229552AbiJ1UfI (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Fri, 28 Oct 2022 16:35:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229935AbiJ1UfH (ORCPT
        <rfc822;selinux@vger.kernel.org>); Fri, 28 Oct 2022 16:35:07 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD9813C8CD
        for <selinux@vger.kernel.org>; Fri, 28 Oct 2022 13:35:03 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id y10so3890853wma.0
        for <selinux@vger.kernel.org>; Fri, 28 Oct 2022 13:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:references:in-reply-to:reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iE7IhtVgSANrFfZCwoQWHQYPjevWDZiQHLKyCUc9u3s=;
        b=KtKLzoid6Kv/3z6vtiRIsBy3PUpVgWeQ3jSgCENj6pHCmE2EGQGp+cs7HVekH9xldh
         NdIU92BTZaSkH2kmRnr7ts2AF78Vl1W9QjuvPytHQ83Fm2X7lWy1KX2Nx2kAiD8eNmQY
         q8CvHQewcrFFJYEP2Xhqs1lIpWKpH5wxjm4aTpBRLqDiA3iVivN8tO+zfJcokPZWsGB5
         vkDZtYpnDn7hMYLdoWCHJtocb0JdV3vd+dZCKJy1KYpH5+VPQ6kzPyBfgVQUraIsDWcI
         NQqZhquzNLlP91iRk4KnTaLdm+9bIAD/ZzPwTwYOd7JJjKscxXbiFc1t9RtBy9+AeUrQ
         FE+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:references:in-reply-to:reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iE7IhtVgSANrFfZCwoQWHQYPjevWDZiQHLKyCUc9u3s=;
        b=X4kS4SwVjOeeTgEE0f2Q4/VNJtNB6eOqAuCnhdQvL0+nVcTQmfm/sXml7iqMpKabc8
         d7m9OshJlUg062pknULIL3aU6g6rhNtkhODWdGosousSNGnuIZl4zEZdug/+kI33ev/4
         VzUysuiLJ5vP1Wq46tvYaylB/ki4YvtZjMmlAUNoOMxv7HRgcXN0F8hisHnYK6YkQJTW
         P86tElfk+vLjAEsksuZRVIOMaJvj5HphnrT/HXMVi6l2gDisbenZjeu82bBikhoTSKHU
         PQUYE0Mh6CRj4JFOadUeBuXONjqq6PI//8Ah20mdrksL5rR7F+xo6DzTG1X5CV0QdHi7
         zhkw==
X-Gm-Message-State: ACrzQf2+XRxEt459LkI5nfRjJKs4Us3RIe1g1FPQtc4Emp+Y+ivyBW9G
        x1YNv8x5UBVfwLQQVPuK0MQz3ErZgbYwOYP78fQ=
X-Google-Smtp-Source: AMsMyM6mMZ3fhxDwfttu01DUobm5XWoNAX5w1N87Ig07xhmYMqwVV6g+oU2BkWOwLNQ+8j8/pQkX9x8GGxoE0D3dlHk=
X-Received: by 2002:a05:600c:a4c:b0:3b4:fc1b:81 with SMTP id
 c12-20020a05600c0a4c00b003b4fc1b0081mr611137wmq.125.1666989302021; Fri, 28
 Oct 2022 13:35:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a5d:64ca:0:0:0:0:0 with HTTP; Fri, 28 Oct 2022 13:35:01
 -0700 (PDT)
Reply-To: jane.fergusons1011@gmail.com
In-Reply-To: <CABBvTcdBboQXRkow9RcRbZyQTrJpuSZ1GjPUjwYqY12FsDOKmQ@mail.gmail.com>
References: <CABBvTcfF=BYTnHFTGgXQfzbiFCMA6TRY+C8joe=ApF-1HO1VVw@mail.gmail.com>
 <CABBvTccz2tZjAjU+u_k=A88Zj-vXyYxbS7nru-poPhBD2FESBw@mail.gmail.com>
 <CABBvTcdxjtrJQ347f0bAqziPv+7u34wXJ+it9u26TfLt83NPEA@mail.gmail.com> <CABBvTcdBboQXRkow9RcRbZyQTrJpuSZ1GjPUjwYqY12FsDOKmQ@mail.gmail.com>
From:   "jane.fergusons" <mtewytvtuupuuu17@gmail.com>
Date:   Fri, 28 Oct 2022 22:35:01 +0200
Message-ID: <CABBvTceuzyT9BgAAWcKj+trivWqsHJjfOJhX3NtUua5A0G-+0w@mail.gmail.com>
Subject: Hello my love
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Hello my love, how are you my name is Jane Ferguson and i read through
your profile today and i became interested in you, i am a woman and i
will like to have a long lasting relationship with you and as soon as
i hear from you i will send to you my pictures for me and you to
proceed to know each other more better in future. thank and do have a
nice day.please contact me on this email jane.fergusons10111@gmail.com
Miss Jane
