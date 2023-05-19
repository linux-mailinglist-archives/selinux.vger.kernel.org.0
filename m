Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 45B52709762
	for <lists+selinux@lfdr.de>; Fri, 19 May 2023 14:41:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229586AbjESMli (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Fri, 19 May 2023 08:41:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229571AbjESMlh (ORCPT
        <rfc822;selinux@vger.kernel.org>); Fri, 19 May 2023 08:41:37 -0400
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63E971A6
        for <selinux@vger.kernel.org>; Fri, 19 May 2023 05:41:13 -0700 (PDT)
Received: by mail-yb1-xb2c.google.com with SMTP id 3f1490d57ef6-ba82956d3e0so1224003276.0
        for <selinux@vger.kernel.org>; Fri, 19 May 2023 05:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684500070; x=1687092070;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WIDs2kxktlKTTEJ6a5vNk/gXg/KBrPoTQlY4dW6WTl0=;
        b=Jw8lAJUzGcfyT+jYkxO128qDKJWoxuLDi90YrrOvomWzY4N7es2yt8p24aGDhs+TJf
         ZJ2zCJWYaKxnQ4TwnKx7IOkjNivCHKw9oo10+AsC/qetU08eK+qtWnADAp95HCCHMepr
         iRBaSrynywwa8NjJKVJhOWMmIoCmScp9H0ud+vfQ55db9+RY1YF/K24+qzNfFQDGhCH6
         pXDZe/tsiYCnRcmZYnC86sPVZgoYyl6iJZk3Kn/7ng9v0CpBnnNBJsnSYcUvRWIgcOxO
         65sKr+3U2qoH9ajRcUH7RQU1Enz1xoHLRe37pawRfE1kvzzpcRU6X4l08evK58R1/y5q
         Nnuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684500070; x=1687092070;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WIDs2kxktlKTTEJ6a5vNk/gXg/KBrPoTQlY4dW6WTl0=;
        b=Mavd2ct3h7l8m1lFeL9AnEwJrQkjR+kZKMnQXQsBL5YCPCpOeEDcu9JYz+tSXH3V7d
         kYMouekux42uf88ySEFf7CXNRc/mVGBp5K5sFZkgzHQU82CO4j/8/X7eNmrOGnZOk5gl
         SSf26jRkB99E5liHhNQ3bERwaJ4TA53AqQZlgmg8bVthKlbvhAIt2RlmR05Swk3oOOqg
         9Jfa7g2cZndv7G5D9NnfiuLFoBZ5Ck32Ke9L1Ux8NJ+nDK9MSznaZG3GScLbTQnp2EF8
         WgD9nbJDbN1d3rNSUa2qrg/qrtkvT1GkzUQR3iD/52oosZYYhQJNBECMab9pCVzs/0X2
         s9jA==
X-Gm-Message-State: AC+VfDyW+Iw36Djpfsr+SzhxdpoxN522JJpWqxYlGhsOMZTU7iNUMEOR
        lcSQLD1upcKth6LAt1RKAEpyCvmPBDdGJlpzSw==
X-Google-Smtp-Source: ACHHUZ5r3f+HQPQfnXeAh3Df7l8HpOkyN+VwnLKGjMFdULypgS/8YPCme9J1xZgVhQD11+90MYEGMFmx/e8hC5Cl5g8=
X-Received: by 2002:a81:52cd:0:b0:55d:626e:3dcf with SMTP id
 g196-20020a8152cd000000b0055d626e3dcfmr1537557ywb.12.1684500069755; Fri, 19
 May 2023 05:41:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7010:8418:b0:357:f46f:ec7c with HTTP; Fri, 19 May 2023
 05:41:09 -0700 (PDT)
Reply-To: ninacoulibaly03@hotmail.com
From:   nina coulibaly <ninacoulibaly.info2020@gmail.com>
Date:   Fri, 19 May 2023 05:41:09 -0700
Message-ID: <CAC4KtETb-3GMkVeLZwswY4uvz0Hv5VJP0D-Ogkc69nyJ-eNG3g@mail.gmail.com>
Subject: from nina coulibaly
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.8 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Dear ,

I am interested to invest with you in your country with total trust
and i hope you will give me total support, sincerity and commitment.
Please get back to me as soon as possible so that i can give you my
proposed details of funding and others.

Best Regards.

Mrs. Nina Coulibaly
