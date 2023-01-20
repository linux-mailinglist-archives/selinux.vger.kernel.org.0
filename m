Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A11E675CE4
	for <lists+selinux@lfdr.de>; Fri, 20 Jan 2023 19:41:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229575AbjATSk7 (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Fri, 20 Jan 2023 13:40:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229379AbjATSk6 (ORCPT
        <rfc822;selinux@vger.kernel.org>); Fri, 20 Jan 2023 13:40:58 -0500
Received: from mail-ua1-x944.google.com (mail-ua1-x944.google.com [IPv6:2607:f8b0:4864:20::944])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C91FCC25
        for <selinux@vger.kernel.org>; Fri, 20 Jan 2023 10:40:58 -0800 (PST)
Received: by mail-ua1-x944.google.com with SMTP id bx24so1572529uab.4
        for <selinux@vger.kernel.org>; Fri, 20 Jan 2023 10:40:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=29acQNA8Cumm02CGyUpVCLdeAEc2jQcZ1RkMPZNG+yw=;
        b=TISUpCkG8s6YQ7jnd/NwNFeD8bhtx9V/BosAh7S9Uj1XF+ItZ+kow40fauDzevqb+J
         GjPuw8CF4irsGWDZGfV/9h7gPtERSf+ygryq00d2rvoHATaQnzXbnWE5FK9KJh9nivFW
         sQtOam9EwkykuR5Yaimjm2kwuOqyV3DkLax4LR3Y+b+zxVIC4p9u12C8+NRKMbvqiXfY
         bUuDrFOg1hIscOBOJVkN0S87wAk0ExWYaPzJY4RUACQS25qwN9CGL9qsiTd+OmSmtybt
         ih0baD5c08SpZ64WhUlDjcTPJNodevLWEzNEibzAe5j+oYYO9KjFNjtooYYoYC8lJwBa
         D+cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=29acQNA8Cumm02CGyUpVCLdeAEc2jQcZ1RkMPZNG+yw=;
        b=ar3zvWozGpiaVRzUSvXrIFeogCEj7noqHfDmylUgMJZzRcFa3ZzNquR341159lvFZS
         lGW1ue/dp5LOnOczrVcr0yEzaIuugKFz+IkZTavAm9jvK5zzEVRruaTH7u+PHQIYTVlL
         95Nn6KCwRGK1UMDGO/Q+PUGBLEj9xoSmshcNkyxyApLH6B9/CPEokMIPj3vvlEtx3L21
         d/zwlVwthnby1jM6/9ixNYPDoenauuVjc3VOZ3XzjbPK1y7qH5TXCi9laZmu4gOZPABL
         70RQNBcuIMG8jcorvbQLSzGYtWDIJl8qByFeolfHbvMORrXoJG6CXp0oLMzZvjTzGsPf
         Uh8A==
X-Gm-Message-State: AFqh2krCGqa/JYJEf89qcsBSc6qenCAX670k02jGI08gVnbSKg0zhP4m
        bfMgcsPlCBnQyBO1FWyXCBo07rva3JwXDTG+bbw=
X-Google-Smtp-Source: AMrXdXs7efJRZMZcCiNJAldsYlk+6asy+GakOcOqt249OBLOxRBrgF9cy315MJAgZjilEpYMpww1ohqTpV0F54SVlgc=
X-Received: by 2002:a9f:368c:0:b0:5cd:6bf2:d8b3 with SMTP id
 p12-20020a9f368c000000b005cd6bf2d8b3mr1835893uap.122.1674240056798; Fri, 20
 Jan 2023 10:40:56 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a59:d999:0:b0:381:7392:937b with HTTP; Fri, 20 Jan 2023
 10:40:55 -0800 (PST)
Reply-To: avamedicinemed1@gmail.com
From:   DR AVA SMITH <davasm66@gmail.com>
Date:   Fri, 20 Jan 2023 10:40:55 -0800
Message-ID: <CAOyNY03us1brqR7=ktEjBkdpJDhQVfgyPOoR_sw4jRr=exDPvg@mail.gmail.com>
Subject: HI DEAR
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=7.7 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,UNDISC_FREEM,UNDISC_MONEY
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:944 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5004]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [davasm66[at]gmail.com]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [davasm66[at]gmail.com]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [avamedicinemed1[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  2.7 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
        *  2.9 UNDISC_MONEY Undisclosed recipients + money/fraud signs
X-Spam-Level: *******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Hello Dear,
how are you today?hope you are fine
My name is Dr Ava Smith ,Am an English and French nationalities.
I will give you pictures and more details about me as soon as i hear from you
Reply me through my official email (avamedicinemed1@gmail.com)
Thanks
Ava
