Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0DAD9534514
	for <lists+selinux@lfdr.de>; Wed, 25 May 2022 22:40:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345239AbiEYUkC (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Wed, 25 May 2022 16:40:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344655AbiEYUjx (ORCPT
        <rfc822;selinux@vger.kernel.org>); Wed, 25 May 2022 16:39:53 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BB0964BE8
        for <selinux@vger.kernel.org>; Wed, 25 May 2022 13:39:51 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id f21so30268359ejh.11
        for <selinux@vger.kernel.org>; Wed, 25 May 2022 13:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=LDBqQh/PztHeiDiV9Pr0v62BTTaDnPQyU98FGi1REkw=;
        b=V8ZoB3zlHdgZ2R2A4vgEAj70aKyCnGGpFtRZ9b0oTxUWZCuNT/gtyTwACRo1CCwI4R
         IK4Nm9PfwKHWvA3UrYMHrWxHVZx/Fd1WN7EUywQ1Bx9EGwE2G5w+zQhx2dxTEJx/Qhvx
         kZHC0CLj7Sf9TB4hKuFbYrHXEwFsp8ZlF2JEwj0d8Z6q0YaBJ7Gfmb4lwLJwI4EdSv4O
         UtqL/rx7DREYH1tyNT+z+VgaTm8jRy/Jx3K7Yn8LdMubX2Ahh10T0v0ikCTHCFRQ16rV
         PtrFcIYGMYWfojivKhNlerEa9N1T3tnRrDG9EOuK3KSgvDiYyowahaCPNsF4eF/kmTY3
         r85w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=LDBqQh/PztHeiDiV9Pr0v62BTTaDnPQyU98FGi1REkw=;
        b=Ju1eHDdiiDKDOn7SIxb5BUOT4HsgGgSF4UJMrtJylSahZMMvofjmV2LqFifJrwD1Jv
         Db30PqppuB2iUXL9ixmLrFoJEcwlNvE7loUJMhWlyYnlYtl1Q2H+SRLQotGPuzbDCqnp
         v2LnPf2nA8aGImAGHa3J6aGHoLtOBVbxTzn6dqhhxBSPI/kSEtLHhmjo2WbsB6AUYoqS
         oAnLfvyHrVaQuM1+yxVNJeAm2+e0hIycAWcHrDfLHEdDEIkQI80pYkacyjrs5cv82DT6
         sHhYKhMzM7xkpCt4KtIVXnm0v3gINqeI7x9bSM6JRaZtDSXOWSfPT3CLYzw7WMVYhO1W
         xhiA==
X-Gm-Message-State: AOAM533cTEZQV2xT+nRTjER3YPpnNrymUp6wDkKhDv304wEY1IPRwIl8
        ayxT7Q0usvaS96mXXHOjFQW91gU534bmpVaXtoU=
X-Google-Smtp-Source: ABdhPJwUsfb5OrQ3vcRS6HNq0+X7djtQ2eKtPHczM9HgH7+6P7FYocdSAR9l/DYJudx0gCT9N+SQNUs9NxBhx4GBA2I=
X-Received: by 2002:a17:906:8301:b0:6e4:896d:59b1 with SMTP id
 j1-20020a170906830100b006e4896d59b1mr29792721ejx.396.1653511190094; Wed, 25
 May 2022 13:39:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:907:16a0:0:0:0:0 with HTTP; Wed, 25 May 2022 13:39:49
 -0700 (PDT)
From:   Deterin Falcao <falcaodeterin@gmail.com>
Date:   Wed, 25 May 2022 22:39:49 +0200
Message-ID: <CABCO4Z34L5Ob2sRJ+JwD5j-Hmd-m2wJ6TEysrc=k65vmAnA3cw@mail.gmail.com>
Subject: Bitte kontaktaufnahme Erforderlich !!! Please Contact Required !!!
To:     info@firstdiamondbk.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=0.6 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Guten Tag,

Ich habe mich nur gefragt, ob Sie meine vorherige E-Mail bekommen

haben ?

Ich habe versucht, Sie per E-Mail zu erreichen.

Kommen Sie bitte schnell zu mir zur=C3=BCck, es ist sehr wichtig.

Danke

Falcao Deterin

falcaodeterin@gmail.com








----------------------------------




Good Afternoon,

I was just wondering if you got my Previous E-mail
have ?

I tried to reach you by E-mail.

Please come back to me quickly, it is very Important.

Thanks

Falcao Deterin

falcaodeterin@gmail.com
