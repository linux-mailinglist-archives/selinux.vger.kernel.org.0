Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F615620EB0
	for <lists+selinux@lfdr.de>; Tue,  8 Nov 2022 12:21:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234115AbiKHLVr (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Tue, 8 Nov 2022 06:21:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233921AbiKHLVf (ORCPT
        <rfc822;selinux@vger.kernel.org>); Tue, 8 Nov 2022 06:21:35 -0500
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com [IPv6:2607:f8b0:4864:20::112a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B60948776
        for <selinux@vger.kernel.org>; Tue,  8 Nov 2022 03:21:34 -0800 (PST)
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-367b8adf788so130740807b3.2
        for <selinux@vger.kernel.org>; Tue, 08 Nov 2022 03:21:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jD/YBCtOhOa1ipEyheDVa6geA3XolzkSqDbroMLmTEw=;
        b=V0hDTk3NboyMzkv0Lw5jMGvSeB4k0ph3nxLoHOF5MibsKhiuYBHsXPoIVRa8Oo8UPh
         Wvjog20gdi0n41qdP3Rn5A14gMYaVJwTh4hfuev2DA0/X0wSQedNjt9GN82+WKiYtVUQ
         x8J8YVIZmJcWmAalVAumZrsT4CMZPwWg7x2DyWRAOYNJsCpkLQmDMgWda/smW1s9OgCX
         p45tnTvP4x0ZC3/TT6nABuMOVvsmYQ4Yq4D1+zQt9iYrlUQKJ5DnbULDNPRPHtLqU2J8
         Aor8EnPgpj1OOrgw4NMo3Dio83f4NYHs49mzHpW63G77TFuvCusQuplIlLiOQ71Nghnx
         /j/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jD/YBCtOhOa1ipEyheDVa6geA3XolzkSqDbroMLmTEw=;
        b=DEMp7Hg5ciVbS5mQF6Wi7CknfrDf3L+e9G6xiAIPaN8xQVk8BMBbBEFjDTEgV3l3cZ
         8fS5lz+V6nCy5I1/XqseQt+NN3Ow0LHGbYEnSjrkRPnsjfXSYL9YUP+qIruECM7xizFb
         aqxcz+1VOR31TExiPdEsBltkheFjsxg05Hrey+CeqSE56IoOcmh0x8+M5xwLV2y7B2tP
         kIyVFWZT9AZXukrNsGGvUmWylPmub7vSikPKhurz1ZSztHq9Qq3fi+ocKJilo+fqhOKK
         GQrorbKwS1U0fi/R6BS+m6rXuEt2YGXM6QJMbflJORJ9LrS3zoLS76sf3hnp6zvwdHBG
         j8XA==
X-Gm-Message-State: ACrzQf0Uimi9+1w7N0ZtJjdpX7h8PTxG+psPV2eUj52IPgXLFn5ndg6E
        Hrsj8dnOpFRbm/4ifR8G9m3G+YeA0uPWHrhMb7k=
X-Google-Smtp-Source: AMsMyM4w1t61GwYMzTnXa5MXwNg+7pxTA0bsgV4eCqAPL+W4EbLEm3G8CBmeG1uGRH8iSxKlzSiSe8v4dR25QIcqGKs=
X-Received: by 2002:a81:8644:0:b0:349:1126:97a4 with SMTP id
 w65-20020a818644000000b00349112697a4mr50325593ywf.333.1667906493520; Tue, 08
 Nov 2022 03:21:33 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:7010:a38a:b0:313:c983:1d7e with HTTP; Tue, 8 Nov 2022
 03:21:32 -0800 (PST)
Reply-To: mrinvest1010@gmail.com
From:   "K. A. Mr. Kairi" <ctocik2@gmail.com>
Date:   Tue, 8 Nov 2022 03:21:32 -0800
Message-ID: <CAC9COZdKPqPKFW4wjvc8XNOHBj4eLofd_gqNhdeb9JYXVhMXnQ@mail.gmail.com>
Subject: Re: My Response..
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.0 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:112a listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [mrinvest1010[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [ctocik2[at]gmail.com]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [ctocik2[at]gmail.com]
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  2.9 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

-- 
Hi

How are you with your family, I have a serious client, whom will be
interested to invest in your country, I got your Details through the
Investment Network and world Global Business directory.

If you are interested for more details.....

Sincerely,
Kairi Andrew
