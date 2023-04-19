Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 211F06E77A5
	for <lists+selinux@lfdr.de>; Wed, 19 Apr 2023 12:45:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232686AbjDSKo7 (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Wed, 19 Apr 2023 06:44:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232429AbjDSKo5 (ORCPT
        <rfc822;selinux@vger.kernel.org>); Wed, 19 Apr 2023 06:44:57 -0400
Received: from mail-ua1-x932.google.com (mail-ua1-x932.google.com [IPv6:2607:f8b0:4864:20::932])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8B58BE
        for <selinux@vger.kernel.org>; Wed, 19 Apr 2023 03:44:56 -0700 (PDT)
Received: by mail-ua1-x932.google.com with SMTP id az21so8056051uab.12
        for <selinux@vger.kernel.org>; Wed, 19 Apr 2023 03:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681901096; x=1684493096;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W9BR2Flu4pkd1a4nvfS2bzE5dKgIoEcx7rGGrDf0cD4=;
        b=PaAxqXLb664J3+XX8sS8ZTnAJi/Cy6mHk6IUofkOtloRWSynPSJCBCsNwFZWGwBE9e
         CxKW2Dj+GeHNmXNMpRh2IukNpBbCmqddV6rzeonCCHicNHrHs9At09beeg+sxusogc0j
         7yPgBc83QSlgBhCCF5naJW23ASVThqLJNF8w/haepyyjoUPZpoqbH6ZGQ3gkCO3LOWhX
         w1zaeo2g2tQLAjxKKOdKW/aiReJrmb+KOB7VB+MVvXPPpvbAbu/C92iekQ84P4ydDbNj
         Jez2zKjhQAkN2GT099cWScNT3HGAQIYm2IlUnVJg5jV3ymL/nKKm5Fnx19VHzlqtLc4X
         PIvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681901096; x=1684493096;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W9BR2Flu4pkd1a4nvfS2bzE5dKgIoEcx7rGGrDf0cD4=;
        b=Ha5sLvFz9Rm4BHlqMZiRh4MnhPL9RLjK6LqGGHC7RAhVmTGu0EL+i+qKRAZxJjsAPU
         dZJ7ec+Q1shHfqacBuOiTd6eLyZc1ObcT8aIyuPFNYSorHh2unod5q0SkC7kDsKDjZ8O
         ELgg8Sor3tf3KXGHRCpwf+87k+Q9gZo0HeOex2bADuQfMV8Hyq4Egl7dzqiJlbxbbKdx
         qrAkYQ2kF87GNSwT2o8pTOZ8v4gBmM4nYpcgrMIt4atGTiprqwOUC3kgarrXVQAepEEv
         eZ4E5g764n+Z3hUI2ubmNvhiy127k8NFrQSuFRtOwTmZXmZ2MXUzTVaTFgh3BuohIcdg
         GkNg==
X-Gm-Message-State: AAQBX9eeZhW0yGKpVOXOWtgc6SZJW8ejFe2USR3yaUOZhd9hkvqMyx5c
        9z2u2oqKyZqnTVi00bdeslQWiTWKP8HoiPP6qFc=
X-Google-Smtp-Source: AKy350ZEKH64RYz2EWlBnVOb/WegHRQlnBxM4t+4oHW6wjY28vlSQ9oHI4SLTljcRTUH6jsOjUcUkc7cJEzRVmaXh3Q=
X-Received: by 2002:a1f:e643:0:b0:440:4920:e620 with SMTP id
 d64-20020a1fe643000000b004404920e620mr6540394vkh.4.1681901095784; Wed, 19 Apr
 2023 03:44:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a59:cb0c:0:b0:3c4:f0c9:1ad4 with HTTP; Wed, 19 Apr 2023
 03:44:55 -0700 (PDT)
Reply-To: hitnodeby23@yahoo.com
From:   Hinda Itno Deby <amasylviagh@gmail.com>
Date:   Wed, 19 Apr 2023 03:44:55 -0700
Message-ID: <CAPVC9c=o2YLQuBcG+RNZP6asq+3GHgRc=EDmGiR3cMryUZOfjA@mail.gmail.com>
Subject: Reply
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,UNDISC_FREEM,UNDISC_MONEY,URG_BIZ autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:932 listed in]
        [list.dnswl.org]
        * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
        *      [score: 0.0000]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [amasylviagh[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [hitnodeby23[at]yahoo.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  0.6 URG_BIZ Contains urgent matter
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.0 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
        *  3.2 UNDISC_MONEY Undisclosed recipients + money/fraud signs
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

-- 
Hello

My name is Hinda Itno Deby Please I want us to discuss Urgent Business
Proposal  if you are interested kindly reply to me so i can give you
all the details.

Thanks and God Bless You.

Ms Hinda Itno Deby
