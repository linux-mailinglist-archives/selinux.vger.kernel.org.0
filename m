Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 21A355507D5
	for <lists+selinux@lfdr.de>; Sun, 19 Jun 2022 03:10:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233348AbiFSBJ3 (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Sat, 18 Jun 2022 21:09:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbiFSBJ3 (ORCPT
        <rfc822;selinux@vger.kernel.org>); Sat, 18 Jun 2022 21:09:29 -0400
Received: from mail-vk1-xa42.google.com (mail-vk1-xa42.google.com [IPv6:2607:f8b0:4864:20::a42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCD02DF8D
        for <selinux@vger.kernel.org>; Sat, 18 Jun 2022 18:09:28 -0700 (PDT)
Received: by mail-vk1-xa42.google.com with SMTP id s141so418334vks.0
        for <selinux@vger.kernel.org>; Sat, 18 Jun 2022 18:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:sender:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=r9s45iLFR7996ZhX6f5bROMLZTrx/NqqeK2ijAW5crg=;
        b=BYswXrneXaPLOYRgYYH3AImpF6KbfInSb5p2bSLc2ec+NqyDCs4brY+2zi//ZhRbN/
         Z4Di3p8RrYhpjDHjlhyVXbbCAfab/azIYfFmFhiW6xRBxMo42vANWv0eQGlRwYAQQqGl
         75qp/u+OmWQIAlyJWkMmDMjRkPs8JPYlJmzgMUnVM2T7YISeY+0Okrwpc9PFd88rlj8r
         DrWYuYHzsuFEEZ61m7uqoJyTIe8RmF2xj5/6WQKjBuzc0/voC3Ssyb2eaQWJ7ZdM0Hni
         uw/Cla0pI+Y8HGoI8XM1XSGd2lzqoEBSUc/wEQu5R2QM8KuU+he1apDvk2nomoaUVHZR
         pJig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
         :to:content-transfer-encoding;
        bh=r9s45iLFR7996ZhX6f5bROMLZTrx/NqqeK2ijAW5crg=;
        b=OOOYxFewxE0D+ZTf86ISjTHFmMUD1cdCXsfK1DxB8vu1SnAd+CqoZ+WzJ3eqlCg1fV
         zPimVeLuZNqAk6bD5sGfyjBF/lWeK/t9/CfPHFKy770AhQtEDLvvUaMCA4Ql+eMi+cY6
         8bU4WQLRTkHkbLcxcldeKxnZNSMqKVEsSVNYW8weMt2WuQofj+PZwkVqrzCHSWYxAWI0
         fP1YqP+Zi5HxYefDJjgKDLQ3f2jnHbhy592dujenBmxG8pVLS18YelxoLEtXxNtV46bj
         +tIlPW8Fy2YrZiBGAgUIdkqXw2uzR0Rvk+0VEzU+wZ5kaCxGiTJI4u1ORy7Ydp+itimP
         9Tsw==
X-Gm-Message-State: AJIora/SbPRD3UMBPF6q6bV8rA5C4nop5ENn2nj24vwgkgojzjV6l4l9
        zXlDidXUika/nD/VMDP0dvHC2qIf6HWWjc3VlAo=
X-Google-Smtp-Source: AGRyM1vCcUB/CgtNO6AmAjAOS1vAV/KLRAcS7Pf8LMoh9JxsOY+Tu7NdJONhx0dtaAd44Dn3BN6fyusEamLEvw0RBcQ=
X-Received: by 2002:a1f:3456:0:b0:368:ca4e:1bd1 with SMTP id
 b83-20020a1f3456000000b00368ca4e1bd1mr7374515vka.36.1655600967773; Sat, 18
 Jun 2022 18:09:27 -0700 (PDT)
MIME-Version: 1.0
Sender: hamzaafarizaa@gmail.com
Received: by 2002:a05:612c:2220:b0:2cd:51e8:669d with HTTP; Sat, 18 Jun 2022
 18:09:27 -0700 (PDT)
From:   "Mrs. Hamza Farizaa" <hamzmrsfari@gmail.com>
Date:   Sat, 18 Jun 2022 18:09:27 -0700
X-Google-Sender-Auth: d4Gss00blRruAtLAjODnodFMB48
Message-ID: <CAHw4SCXr+x+ZqnHFffjtpgi8BjbCXKiqRNCPYaX5iPXZ7bWxsw@mail.gmail.com>
Subject: I think you can
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: Yes, score=6.5 required=5.0 tests=ADVANCE_FEE_5_NEW_MONEY,
        BAYES_80,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        FREEMAIL_FROM,FREEMAIL_REPLY,HK_SCAM,LOTS_OF_MONEY,MONEY_FRAUD_8,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_HK_NAME_FM_MR_MRS,
        T_SCC_BODY_TEXT_LINE,UNDISC_MONEY autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Report: *  2.0 BAYES_80 BODY: Bayes spam probability is 80 to 95%
        *      [score: 0.8153]
        * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:a42 listed in]
        [list.dnswl.org]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [hamzmrsfari[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  0.0 LOTS_OF_MONEY Huge... sums of money
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  0.0 T_HK_NAME_FM_MR_MRS No description available.
        *  0.0 HK_SCAM No description available.
        *  1.0 FREEMAIL_REPLY From and body contain different freemails
        *  0.0 MONEY_FRAUD_8 Lots of money and very many fraud phrases
        *  3.0 ADVANCE_FEE_5_NEW_MONEY Advance Fee fraud and lots of money
        *  0.7 UNDISC_MONEY Undisclosed recipients + money/fraud signs
X-Spam-Level: ******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

May peace be with you,

My Greetings in the name of our family, This is the second time i am
contacting you with regards to the charity work. I am Mrs. Fariza
Hamza, an aging widow suffering from longtime illness. I am currently
admitted in a private hospital here in the capital city of
Coted=E2=80=99Ivoire.

I have sum amounts of US$17.500 Million dollars i inherited from my
late husband Late Mr. Mohamed Hamza, the sum will be disclosed to you
for security purpose which he deposited in one of a Bank here and I
need a very honest and God fearing person that can use this funds for
God's work and purpose, 15% out of the total funds will be for your
compensation for doing this work of God. I found your email address
and i decided to contact you.

Please if you would be able to use these funds for the purpose and
God's work kindly reply me back. on ( hamzamrs027@gmail.com )

Yours Sister.

Mrs. Fariza Hamza.
