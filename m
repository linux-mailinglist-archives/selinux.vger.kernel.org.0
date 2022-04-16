Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 463245035CC
	for <lists+selinux@lfdr.de>; Sat, 16 Apr 2022 11:40:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230240AbiDPJnI (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Sat, 16 Apr 2022 05:43:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229705AbiDPJnH (ORCPT
        <rfc822;selinux@vger.kernel.org>); Sat, 16 Apr 2022 05:43:07 -0400
Received: from mail-yb1-xb42.google.com (mail-yb1-xb42.google.com [IPv6:2607:f8b0:4864:20::b42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAA38165B0
        for <selinux@vger.kernel.org>; Sat, 16 Apr 2022 02:40:36 -0700 (PDT)
Received: by mail-yb1-xb42.google.com with SMTP id j2so18060885ybu.0
        for <selinux@vger.kernel.org>; Sat, 16 Apr 2022 02:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=KeMi8W+p20zdR41YZoRj2EapY7imNsLYkAgQIQsIzqY=;
        b=nrlzoYnX2HzC7L2W0manjiMBZn8QNNY0VjN2AEU72NRBFKiOkx74m2tx5gh2SksgDW
         UR2RmSf3b31j1BX2jk5NtB4Iw6KnCXxh7jUe+ZA39GJ99vV8iTcH1wiM/iH8ZGalr/6J
         xVY+UPI1ayKWt6ORdQ3z5F/LzXA16sRFzLKX32qCqBs40yErQLXlXpas9WrMZtcN7VI0
         ozf4CUSH61eXegQH5QC7PpayVoZkr33ahmHfQqlOxXZkm1j1uU6LpIKX5s5umpzNnWja
         jIoiagbmMu2A2OuF+q6MvBdC1kJNZEUpYL09uxcwCVI2K2cNdlQb1LwLx+5IlyrGrZa5
         BuQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=KeMi8W+p20zdR41YZoRj2EapY7imNsLYkAgQIQsIzqY=;
        b=xagoZUuqHppjLumYagd/BZgUaMgHZEFa4iKNXwzU1dbYMZfFGoGyJV5ax0sk7oSlRR
         EtAr0Q9eTYSdKOid5oOnbZD4OTyq2GDQ229wFLsYQU9g6EHJJjx6lX2Lqbh9vZryXE3Y
         uq6kD/8sQAP6CdLQ97y8yFGmXMlC+aLjeZi47ScftixWTB/W6nTcrAyvjRsfEgoc8FD2
         S/Wp35a24fRLEpz9xiRvXIadGrCp8Gr+Dq6oK8NXVnMCGh3tGm54Pw7xQZhuKPrQZXw2
         v3ZMcyvFqgjCQDBwQGwiJkshTKpdG71SkGwWSJhC+4tTEYGIjebUZMT9qLfJNZJjzhEg
         ujPA==
X-Gm-Message-State: AOAM531kA2Z7Ufk1U8psnMGtF95Eh/4UgW8/Od7XJI7z1auB2puhXrQ7
        mhNI+G47r1xyAoRzhlDqJbwZxmIjJtyhB8aRMxg=
X-Google-Smtp-Source: ABdhPJya6c1sRIqVGq1XKCFfJ2Pom6Hd7ZKu8Wpre2FbIaxNJJEUE775bLasOyEBpeu7P6kogyu1y5HmKYR5s5hHaOQ=
X-Received: by 2002:a05:6902:1083:b0:633:68fc:f82a with SMTP id
 v3-20020a056902108300b0063368fcf82amr2470885ybu.276.1650102035391; Sat, 16
 Apr 2022 02:40:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7000:70f:0:0:0:0 with HTTP; Sat, 16 Apr 2022 02:40:34
 -0700 (PDT)
Reply-To: danielseyba@yahoo.com
From:   Seyba Daniel <chi.solo111@gmail.com>
Date:   Sat, 16 Apr 2022 11:40:34 +0200
Message-ID: <CAMuaJnMNXF8-Z6H87SDC11v6bFa582PF+y-dWThEmUw9vq9sAQ@mail.gmail.com>
Subject: Hello,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.5 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:b42 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [chi.solo111[at]gmail.com]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [chi.solo111[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.7 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Hello,

I am so sorry contacting you in this means especially when we have never
met before. I urgently seek your service to represent me in investing in
your region / country and you will be rewarded for your service without
affecting your present job with very little time invested in it.

My interest is in buying real estate, private schools or companies with
potentials for rapid growth in long terms.

So please confirm interest by responding back.

My dearest regards

Seyba Daniel
