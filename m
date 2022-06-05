Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 36F4B53DDD4
	for <lists+selinux@lfdr.de>; Sun,  5 Jun 2022 21:18:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346378AbiFETSg (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Sun, 5 Jun 2022 15:18:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234938AbiFETSf (ORCPT
        <rfc822;selinux@vger.kernel.org>); Sun, 5 Jun 2022 15:18:35 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DDFC120B5
        for <selinux@vger.kernel.org>; Sun,  5 Jun 2022 12:18:34 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id q1so13716264ljb.5
        for <selinux@vger.kernel.org>; Sun, 05 Jun 2022 12:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=3x72/ah7oVy1n7hZQ2TRq4JYjiu8oyFxE5Jon1kCtcA=;
        b=jiyYhjzBWJM6FmPWrrhH4thJrsKxgousxPbmw9SL12EkYTY/GcMCZedfzgm3ND0XKC
         Ag18nb02E9yL7vmTt51XHuMgWEQV0yH6oyIQiB+aMm84RQOTGAOfY4eSyJ2Zzq/R+HGk
         hnPNYUr6Z1agdxUvJeAkYefI2Du1FNYmrwYtKT/+bx6LLGXHj2/y+LKDuW3XtezGaXXo
         /tPOwk0lRoB2pjiyL2fowT8eleCYfOJJxGkamH2nYT3ajT9lvWXjENsVArNohOoeUT8/
         dSDa7I8Bh9W2YbzyUOkepBsCjf29oAcfy7KfqVsf7zdGXNiDdsAQNBzMqCzy4M/rCZ7f
         Q2Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=3x72/ah7oVy1n7hZQ2TRq4JYjiu8oyFxE5Jon1kCtcA=;
        b=yZxNDwIKQxm3bzsWb2euXs0EarDQ86ETW3r8Zsjx1mI1eTQiIXJ4z0xVQYCatiAmM4
         CwbSbbiyQ23yA7rSmYkm0fYfx9F6XE4oXZKfudl8Cl4vvllT5zGg6bq0U01a3qbVq0US
         RoygMnyEBXh3F0jfo0SFemK4nirIxMqUt3zok/unjz6PYDXRCAmXaxKMc1rX9zeyxjCw
         dqBbUCiBZIHtm+MuNmUZDCCwe2IY8l41dzFhIxKixCq58ngSE+CLYsODbGI3aN0Wty3S
         9vf+xqZY+GAkKMDa5RDDqdq443FEDfPB1qS5D6jK9mbXumY2kPZlwtdgcKcMOhzGdYfk
         ltLw==
X-Gm-Message-State: AOAM530DG7x/1xLQndVRpgfxutWMna2d92nrBZYu/oV+xCrMtkTZwfEb
        DLIGVxVMWfLbm6/W4J58XmLyn+GcjOL6fgFhBF8=
X-Google-Smtp-Source: ABdhPJw2qCziW77onTX/MyJUfR6fsIjw9Y6oYU4lslxneYdxPlELlFpQNxoJMbh6+7660UPnonysSVoAmFHYSONRv1U=
X-Received: by 2002:a05:651c:b93:b0:255:7a92:1795 with SMTP id
 bg19-20020a05651c0b9300b002557a921795mr8542462ljb.6.1654456712129; Sun, 05
 Jun 2022 12:18:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab2:6806:0:b0:141:cdcc:4d83 with HTTP; Sun, 5 Jun 2022
 12:18:31 -0700 (PDT)
Reply-To: mrstheresaheidi8@gmail.com
From:   Ms Theresa Heidi <mariannesocial4@gmail.com>
Date:   Sun, 5 Jun 2022 12:18:31 -0700
Message-ID: <CAPSQfjueD_AUr4HQy94qNch2Q6EYFSONEewESgJHe5d6ygOt5Q@mail.gmail.com>
Subject: =?UTF-8?B?5oCl5LqL5rGC5Yqp77yB?=
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
X-Spam-Status: Yes, score=7.1 required=5.0 tests=BAYES_99,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:231 listed in]
        [list.dnswl.org]
        *  3.5 BAYES_99 BODY: Bayes spam probability is 99 to 100%
        *      [score: 0.9951]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [mariannesocial4[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [mariannesocial4[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [mrstheresaheidi8[at]gmail.com]
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  2.3 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

5oWI5ZaE5o2Q5qy+77yBDQoNCuivt+S7lOe7humYheivu++8jOaIkeefpemBk+i/meWwgeS/oeeh
ruWunuWPr+iDveS8mue7meS9oOS4gOS4quaDiuWWnOOAgiDmiJHlnKjpnIDopoHkvaDluK7liqnn
moTml7blgJnpgJrov4fnp4HkurrmkJzntKLpgYfliLDkuobkvaDnmoTnlLXlrZDpgq7ku7bogZTn
s7vjgIINCuaIkeaAgOedgOayiemHjeeahOaCsuS8pOWGmei/meWwgemCruS7tue7meS9oO+8jOaI
kemAieaLqemAmui/h+S6kuiBlOe9keS4juS9oOiBlOezu++8jOWboOS4uuWug+S7jeeEtuaYr+ac
gOW/q+eahOayn+mAmuWqkuS7i+OAgg0KDQrmiJHmmK82MuWygeeahOeJueiVvuiOjirmtbfokoLl
pKvkurrvvIznm67liY3lm6DogrrnmYzlnKjku6XoibLliJfnmoTkuIDlrrbnp4Hnq4vljLvpmaLk
vY/pmaLmsrvnlpfjgIINCjTlubTliY3vvIzmiJHnmoTkuIjlpKvljrvkuJblkI7vvIzmiJHnq4vl
jbPooqvor4rmlq3lh7rmgqPmnInogrrnmYzvvIzku5bmiorku5bmiYDmnInnmoTkuIDliIfpg73n
lZnnu5nkuobmiJHjgIIg5oiR5bim552A5oiR55qE56yU6K6w5pys55S16ISR5Zyo5LiA5a625Yy7
6Zmi6YeM77yM5oiR5LiA55u05Zyo5o6l5Y+X6IK66YOo55mM55eH55qE5rK755aX44CCDQoNCuaI
keS7juaIkeW3suaVheeahOS4iOWkq+mCo+mHjOe7p+aJv+S6huS4gOeslOi1hOmHke+8jOWPquac
iTI1MOS4h+e+juWFg++8iDI1MOS4h+e+juWFg++8ieOAgueOsOWcqOW+iOaYjuaYvu+8jOaIkeat
o+WcqOaOpei/keeUn+WRveeahOacgOWQjuWHoOWkqe+8jOaIkeiupOS4uuaIkeS4jeWGjemcgOim
gei/meeslOmSseS6huOAgg0K5oiR55qE5Yy755Sf6K6p5oiR5piO55m977yM55Sx5LqO6IK655mM
55qE6Zeu6aKY77yM5oiR5LiN5Lya5oyB57ut5LiA5bm044CCDQoNCui/meeslOmSsei/mOWcqOWb
veWklumTtuihjO+8jOeuoeeQhuWxguS7peecn+ato+eahOS4u+S6uueahOi6q+S7veWGmeS/oee7
meaIke+8jOimgeaxguaIkeWHuumdouaUtumSse+8jOaIluiAheetvuWPkeaOiOadg+S5pu+8jOiu
qeWIq+S6uuS7o+aIkeaUtumSse+8jOWboOS4uuaIkeeUn+eXheS4jeiDvei/h+adpeOAgg0K5aaC
5p6c5LiN6YeH5Y+W6KGM5Yqo77yM6ZO26KGM5Y+v6IO95Lya5Zug5Li65L+d5oyB6L+Z5LmI6ZW/
5pe26Ze06ICM6KKr5rKh5pS26LWE6YeR44CCDQoNCuaIkeWGs+WumuS4juaCqOiBlOezu++8jOWm
guaenOaCqOaEv+aEj+W5tuacieWFtOi2o+W4ruWKqeaIkeS7juWkluWbvemTtuihjOaPkOWPlui/
meeslOmSse+8jOeEtuWQjuWwhui1hOmHkeeUqOS6juaFiOWWhOS6i+S4mu+8jOW4ruWKqeW8seWK
v+e+pOS9k+OAgg0K5oiR6KaB5L2g5Zyo5oiR5Ye65LqL5LmL5YmN55yf6K+a5Zyw5aSE55CG6L+Z
5Lqb5L+h5omY5Z+66YeR44CCIOi/meS4jeaYr+S4gOeslOiiq+ebl+eahOmSse+8jOS5n+ayoeac
iea2ieWPiueahOWNsemZqeaYrzEwMCXnmoTpo47pmanlhY3otLnkuI7lhYXliIbnmoTms5Xlvovo
r4HmmI7jgIINCg0K5oiR6KaB5L2g5ou/NDUl55qE6ZKx57uZ5L2g5Liq5Lq65L2/55So77yM6ICM
NTUl55qE6ZKx5bCG55So5LqO5oWI5ZaE5bel5L2c44CCDQrmiJHlsIbmhJ/osKLmgqjlnKjov5nk
u7bkuovkuIrmnIDlpKfnmoTkv6Hku7vlkozkv53lr4bvvIzku6Xlrp7njrDmiJHnmoTlhoXlv4Pm
hL/mnJvvvIzlm6DkuLrmiJHkuI3mg7PopoHku7vkvZXkvJrljbHlj4rmiJHmnIDlkI7nmoTmhL/m
nJvnmoTkuJzopb/jgIINCuaIkeW+iOaKseatie+8jOWmguaenOaCqOaUtuWIsOi/meWwgeS/oeWc
qOaCqOeahOWeg+WcvumCruS7tu+8jOaYr+eUseS6juacgOi/keeahOi/nuaOpemUmeivr+WcqOi/
memHjOeahOWbveWutuOAgg0KDQrkvaDkurLniLHnmoTlprnlprnjgIINCueJueiVvuiOjirmtbfo
koLlpKvkuroNCg==
