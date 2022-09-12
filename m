Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D6655B5D04
	for <lists+selinux@lfdr.de>; Mon, 12 Sep 2022 17:20:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230095AbiILPT7 (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Mon, 12 Sep 2022 11:19:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229889AbiILPT6 (ORCPT
        <rfc822;selinux@vger.kernel.org>); Mon, 12 Sep 2022 11:19:58 -0400
Received: from mail-yb1-xb42.google.com (mail-yb1-xb42.google.com [IPv6:2607:f8b0:4864:20::b42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A8D0EE16
        for <selinux@vger.kernel.org>; Mon, 12 Sep 2022 08:19:57 -0700 (PDT)
Received: by mail-yb1-xb42.google.com with SMTP id d189so13260609ybh.12
        for <selinux@vger.kernel.org>; Mon, 12 Sep 2022 08:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:sender
         :reply-to:mime-version:from:to:cc:subject:date;
        bh=MbE5/R0x/uLTcGo1XaQOPDK9fXe06AjBY6BMQ4dhUXg=;
        b=DnKZBW4+9bGDWuXwQ6MZ2cNnNQkadeNidmsD2D+BI3U9w+woyqmNcvVDNHCblibyRi
         o9j2R+WTG7N5JUsYMJdSq0wQ+IIX4AAO6LblrSB+CIvmrtA+4O0ago22ohoqpYQMJE1t
         FTvrEImVlOjdS08w5YrjhMqe4gLSc8fUYcTgJwVRm1LqA0rmxi6Hd3B0ctTrPKvkELIn
         3ury4FEEiZ5Fq5o2agMWR6qITL70a6ljyhM5ni7WAAf3WG0EiB5RSVedhWm8fwGs03W/
         69B1IgXDtRDQhbhdigyaRQQRkWHCWbR8LzgiNTfg4nsHTy+pVMqeSbDySyXH0vHDHKx3
         CDIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:sender
         :reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=MbE5/R0x/uLTcGo1XaQOPDK9fXe06AjBY6BMQ4dhUXg=;
        b=v9q6mQYRF6+5sxaqcnFZuC+JhoC/Vbx1K73Bc3anpg0ozj1PC/5Swj/x2XUcxvv5MT
         umrfkA2a7DEco75xINLkp+HwV2AizHmqphmVimDCF/mmN3Q5l2DPW6EgrrNaNXcFALJc
         iGXRpRj4wd4fyYTA82I0NHz8T+RD/r2LxpxicQL0nc2DjRHIn5AHGQXJAX3VbCX+3oZP
         bYyuDB9Q1sSvAcy/afnghPY8dELVQxmzcJ8jzWQC2usu1tVWfE9vh5wW5adv4OhoxxgV
         c0Q9NehPIJkg9qd46d3ahnyZoLD7bnPla2TwRnEH4lmduD6TNWg2Giv5E0sJV0/AiHaK
         X4jA==
X-Gm-Message-State: ACgBeo2yvn3tHEao3q839Gqf5lWEKDt4mPsah0KZTY81d+z4K63GO/dS
        DAHd22sY31mi0sbmKe7oFAptOoeVt7kmhgJDe68=
X-Google-Smtp-Source: AA6agR7BX7lh+nCCQz9PXLCWXhPLAM8Qt7iue8bq5Dd2lcwos44sizU01CvyjyPFH2ReaQsPARTkngzl2UfBw9SuMs4=
X-Received: by 2002:a05:6902:12c1:b0:669:8f1d:cef2 with SMTP id
 j1-20020a05690212c100b006698f1dcef2mr22905183ybu.75.1662995996644; Mon, 12
 Sep 2022 08:19:56 -0700 (PDT)
MIME-Version: 1.0
Reply-To: zahirikeen@gmail.com
Sender: issasalif505@gmail.com
Received: by 2002:a05:7010:5925:b0:2ef:6bab:eaf0 with HTTP; Mon, 12 Sep 2022
 08:19:56 -0700 (PDT)
From:   Zahiri Keen <mrzahirikeen1@gmail.com>
Date:   Mon, 12 Sep 2022 15:19:56 +0000
X-Google-Sender-Auth: U32CPBix5-16ooGhQZDDnPZQepM
Message-ID: <CAO1GMAQ6mYCvnW_Pw6BY9-25Bg2Aa4qnLYfmPJSy843xMoCFZw@mail.gmail.com>
Subject: URGENT.
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: Yes, score=5.0 required=5.0 tests=BAYES_50,DKIM_SIGNED,
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
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [issasalif505[at]gmail.com]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [mrzahirikeen1[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.2 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Good Day,

    I know this email might come to you as a surprise because is
coming from someone you haven=E2=80=99t met with before.

I am Mr. Zahiri Keen, the bank manager with BOA bank i contact you for
a deal relating to the funds which are in my position I shall furnish
you with more detail once your response.

Regards,
Mr.Zahiri
