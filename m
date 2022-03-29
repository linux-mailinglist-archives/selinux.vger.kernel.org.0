Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5EEE24EB5C0
	for <lists+selinux@lfdr.de>; Wed, 30 Mar 2022 00:18:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236271AbiC2WUh (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Tue, 29 Mar 2022 18:20:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229751AbiC2WUg (ORCPT
        <rfc822;selinux@vger.kernel.org>); Tue, 29 Mar 2022 18:20:36 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B5ED20F4B
        for <selinux@vger.kernel.org>; Tue, 29 Mar 2022 15:18:53 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id h23so26747232wrb.8
        for <selinux@vger.kernel.org>; Tue, 29 Mar 2022 15:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:mime-version:content-transfer-encoding
         :content-description:subject:to:from:date:reply-to;
        bh=+v//v9bV1cKxYYqp6E5HrJfuFydY/JXcjMGnmfr7lM0=;
        b=S7mLD4Iavviogg/ZwjrHlTBDsTza5oHLKYVbMXPhMqzNK5t5VKdhB0aQE58nBn1lJX
         UmOQVG2hNylKnPgZKEjbGD6457hSbhGDbqE3EWxoYhaAsQY+mZEWeAayrUVeWFCpTGZ7
         EKEU4DF/hEzLU5hrUXqE0JfHyE2OSy58V1BA9No1DDfifUKORpQTdrkCPS3VGK3H91sy
         yQ//X/om3/9iM0eBbZC/sU3//OkbQCALPDZE28+YDRuiVVmhy3Dw5ruUdy8sLRz5KKUa
         z4FjZPfbziNcZQ/pBKEd+S906rLh5La9BD7oRl0dPXGLVo5bl4AS9d5hyHOq+GPSUet/
         JbAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:content-description:subject:to:from:date
         :reply-to;
        bh=+v//v9bV1cKxYYqp6E5HrJfuFydY/JXcjMGnmfr7lM0=;
        b=m5s4NGTAm0L0r6s0Bw/yscAo+vKgsqMuP49+ZBSw0Gu4lYvM3kwoxqYkmiNZ+37Em7
         qdvPHRlhNXG8fNHjXa6f11EppuE452AvJoYZ7q1wWh+DnRO+AMQ65ei6+G7Wy7xQ8NxG
         zZEAAN4wZe5/Mp05vA4TKtwGsHUb0gxv8Q9PuhCq124kVLUr0xJukPyTurdPpvCVstLX
         Hq+TV33xASMZDwkbi+j1zbGBvwM+bPfuMYTGBi5RzH6eOeS9o6q8Pv12BrIQlgFLSyD+
         Emj6z0iJzo1kfudpV5XKOCxpnKu/I/SJC70Kxqsli13fCASGc/ikseSbh34VrmpYUSaU
         3GYA==
X-Gm-Message-State: AOAM530fIU3N/6nU/7gUNiRxOIcCU55d8FbFRBCo5spFVvz9qY5rKMGh
        Sm6KEBKR/b66qaSu2Kne1Qs=
X-Google-Smtp-Source: ABdhPJy05/tllYlLm9jpiJKRt/dZ9XcPqRK7vhLQeocJeDdY6oo4OsutGF+N5p4nWvtDMOuud61YOA==
X-Received: by 2002:a5d:5046:0:b0:1ed:9eac:bade with SMTP id h6-20020a5d5046000000b001ed9eacbademr33714786wrt.697.1648592331616;
        Tue, 29 Mar 2022 15:18:51 -0700 (PDT)
Received: from [172.20.10.4] ([197.210.71.189])
        by smtp.gmail.com with ESMTPSA id g1-20020a1c4e01000000b003899c8053e1sm4263738wmh.41.2022.03.29.15.18.44
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 Mar 2022 15:18:50 -0700 (PDT)
Message-ID: <624385ca.1c69fb81.dae14.1f3c@mx.google.com>
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: Gefeliciteerd, er is geld aan je gedoneerd
To:     Recipients <adeboyejofolashade55@gmail.com>
From:   adeboyejofolashade55@gmail.com
Date:   Tue, 29 Mar 2022 23:18:36 +0100
Reply-To: mike.weirsky.foundation003@gmail.com
X-Spam-Status: No, score=2.5 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        LOTS_OF_MONEY,MONEY_FREEMAIL_REPTO,RCVD_IN_DNSWL_NONE,RCVD_IN_SBL,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,T_US_DOLLARS_3
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Beste begunstigde,

 Je hebt een liefdadigheidsdonatie van ($ 10.000.000,00) van Mr. Mike Weirs=
ky, een winnaar van een powerball-jackpotloterij van $ 273 miljoen.  Ik don=
eer aan 5 willekeurige personen als je deze e-mail ontvangt, dan is je e-ma=
il geselecteerd na een spin-ball. Ik heb vrijwillig besloten om het bedrag =
van $ 10 miljoen USD aan jou te doneren als een van de geselecteerde 5, om =
mijn winst te verifi=EBren
 =

  Vriendelijk antwoord op: mike.weirsky.foundation003@gmail.com
 Voor uw claim.
