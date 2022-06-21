Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D0FA4552E5B
	for <lists+selinux@lfdr.de>; Tue, 21 Jun 2022 11:31:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348831AbiFUJbX (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Tue, 21 Jun 2022 05:31:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348791AbiFUJbW (ORCPT
        <rfc822;selinux@vger.kernel.org>); Tue, 21 Jun 2022 05:31:22 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07CCC2710
        for <selinux@vger.kernel.org>; Tue, 21 Jun 2022 02:31:22 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id 68so7158002pgb.10
        for <selinux@vger.kernel.org>; Tue, 21 Jun 2022 02:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=/0bRExIb6Mv4sy5raFRmeQINC+UUx7zEZcUUOWWOPJg=;
        b=Uz0muvtHVMzc40FYweCwdYSV1lFHMChdbIJxQUGoPe+BByEpIBJX+fjJWX31/F8tft
         8KISpPf4woIfRXJS1af91M9oBOQ0gMwHVUmhHP+7bK8yPNGyo00hGFINFLvarhBy5EZQ
         kdpd0n4oueOpDZ9VWwM0sPfCT2Raf9z0jMZcDdMYog4mKv1Plq+nCNyXNKXtIJRKCtk/
         hISapDtSd+RoJE1f2wCUytwHWg5BiER7V/R2vM3urDyCVxxR9jDH2vXqFRWc+ZadT1qU
         3cEoAbqkNhvWEkSdfaehdrAfeRLyL6zKm/HFhR55vwL+ifh/jTMEZqKyHQNNI4kPO2Cv
         s5pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=/0bRExIb6Mv4sy5raFRmeQINC+UUx7zEZcUUOWWOPJg=;
        b=CoWXDVvZtu46anzOy6CqV6EVRh1YXRoz2zgqPvzKwDqZ3QQxG2m5Zg2okKJ1ozhfo1
         qX6pB79MPN6mUD7UdyOyHZWB5ifmjfpyij42OW7FHa7nB/6dksNlW3SMWIwpAUtNjGgm
         XLgDbAZlDuPA5EXnUAeTUOI0XCPxuocSynPZ7371YixfYQsuPRHmPJj2NFUXBBJf/sbJ
         8fkLppZwXDAseeP88huGH3Q9cRpcGxGlpKtNllTXLCTd/6NF7FbB37/BGU79huNlIPOQ
         icVfTvgNuYblMVrnLwGq639QtGofjCSMJtNwuP/AgMpMvQ80GlyljFqvrpsHrVFrt85O
         p2vA==
X-Gm-Message-State: AJIora8hwfnJhu54BV2zGh+c14C8KutpvSaZcOfY2Pjul6HyZeSBoCdz
        Z1xqe2EDH36uHOiTaRqa6DUJjft+keZBeSLE/BA=
X-Google-Smtp-Source: AGRyM1scSKG5dFggt+wO+5iaVxhnqPG9/oTF2/Sr1nYGnYirlSNHt98weOif6M+XbkUOQdWfvyIG/9jF1xwowqhwjRI=
X-Received: by 2002:a63:b13:0:b0:3fd:f319:f6aa with SMTP id
 19-20020a630b13000000b003fdf319f6aamr25234798pgl.483.1655803880965; Tue, 21
 Jun 2022 02:31:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:522:c1eb:b0:44d:3785:185d with HTTP; Tue, 21 Jun 2022
 02:31:19 -0700 (PDT)
Reply-To: dimitryedik@gmail.com
From:   Dimitry Edik <dmrdavidnikiema@gmail.com>
Date:   Tue, 21 Jun 2022 02:31:19 -0700
Message-ID: <CAM0vfExu=YVfRsSEY10Kn3KwQ1zVtQgfA0AJnJUgR2Xv6KnSog@mail.gmail.com>
Subject: Dear Partner,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=7.8 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        LOTS_OF_MONEY,MONEY_FREEMAIL_REPTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_MONEY_PERCENT,T_SCC_BODY_TEXT_LINE,UNDISC_FREEM,
        UNDISC_MONEY autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:544 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [dmrdavidnikiema[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.0 LOTS_OF_MONEY Huge... sums of money
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  2.2 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
        *  2.0 MONEY_FREEMAIL_REPTO Lots of money from someone using free
        *      email?
        *  0.0 T_MONEY_PERCENT X% of a lot of money for you
        *  2.0 UNDISC_MONEY Undisclosed recipients + money/fraud signs
X-Spam-Level: *******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Hello Dear,

My Name is Dimitry Edik from Russia A special assistance to my Russia
boss who deals in oil import and export He was killed by the Ukraine
soldiers at the border side. He supplied
oil to the Philippines company and he was paid over 90 per cent of the
transaction and the remaining $18.6 Million dollars have been paid into a
Taiwan bank in the Philippines..i want a partner that will assist me
with the claims. Is a (DEAL ) 40% for you and 60% for me
I have all information for the claims.
Kindly read and reply to me back is 100 per cent risk-free

Yours Sincerely
Dimitry Edik
