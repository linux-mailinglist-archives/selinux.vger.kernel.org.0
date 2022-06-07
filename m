Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 936B353F70F
	for <lists+selinux@lfdr.de>; Tue,  7 Jun 2022 09:22:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231633AbiFGHWG (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Tue, 7 Jun 2022 03:22:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230106AbiFGHWF (ORCPT
        <rfc822;selinux@vger.kernel.org>); Tue, 7 Jun 2022 03:22:05 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEEC0A30AA
        for <selinux@vger.kernel.org>; Tue,  7 Jun 2022 00:22:04 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id n10so33350742ejk.5
        for <selinux@vger.kernel.org>; Tue, 07 Jun 2022 00:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=OHbou33WPhW0PDy9/CZae9mIrL4buN3/FALSld4obAM=;
        b=mEVr19+VSZ/83sDRbKknLnN3qZueLzDK6EaCVPYtUcl+KZAGjN2ocOWFML1LKTWbge
         M/q4uufTMYcqM2tjf2BmRwrlG/O+Q0av8U3L4XOQAKwFPhMyKD6xeyV7XjfwUVPIF84q
         VSAb5zWYseEoKmrRlGnrNWKkcl3YvBPCnQGaBEjlHvAeyJz8Tt7lhc6J15ou8HClcvUB
         Rxktvd62VPHOMXfXxJx3+TkPAzY9NNSF3AeFNCZwimi1froPRX/OFCzINXwlkoagT86v
         4dhJHkxwjveOlb6F1vaIQ08lIW8A9WD0c9aKVpzP45fxDsMayuNgu7CPkbw0w0ECeqYR
         b0xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=OHbou33WPhW0PDy9/CZae9mIrL4buN3/FALSld4obAM=;
        b=8SQsdBYGGbDy1u0SK3rH6+M31lLa1oT0g92yg3Uj1BPPcQ9Z5LkvwImUSIzk9EQU8f
         R1pMARl9rC2To/XUSv+71dAyGFBSccE+6Sxm/XyQpugL7bLuCO5UzH10PSXffPKdcPDO
         u9cah/qtcgIp8tIC/gZ0SPXW1DPQQOzIlvVVe8M1o9Gy+NNNY5AksXS9cnDuCaYmgam1
         N9IUqX/as0kF1fWjtaFikZgp1czfaa8fBbQliW1lbe7CQLLBlfeB70uIkhcpczNngius
         kB921IDviCA1Ir2bRQCYuTbqKTdwNcL5bMMoIBX6D/mRTU5DhXNASr7XkoDkVGB5WJBu
         M3kQ==
X-Gm-Message-State: AOAM532vSRiqaz3wnjoIYCIIVYlh65xwKrWA3iNCFqeC0x/KBhgy6dHN
        AIFHU+HAF+AoRK3uLpgKUrsp5fIUACiRw4O80MM=
X-Google-Smtp-Source: ABdhPJyLjzEdlzN4HQF89WABuec4QL2zzJChSl3VP1IQ1WMW56+1Ppj5U6lJLBFGuea9rxkX+H1sBjn7scdJrrfwalI=
X-Received: by 2002:a17:906:85cb:b0:70b:ffb4:b0e with SMTP id
 i11-20020a17090685cb00b0070bffb40b0emr21760576ejy.533.1654586524331; Tue, 07
 Jun 2022 00:22:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6402:26c8:0:0:0:0 with HTTP; Tue, 7 Jun 2022 00:22:03
 -0700 (PDT)
Reply-To: andyhalford22@gmail.com
From:   Andy Halford <fameyemrf@gmail.com>
Date:   Tue, 7 Jun 2022 00:22:03 -0700
Message-ID: <CAATdNatjS+6a5geC1q=944yxHXivcePN0wb4YCSSvv1_FxC5nQ@mail.gmail.com>
Subject: Dear Friend
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=6.8 required=5.0 tests=BAYES_50,DEAR_FRIEND,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:641 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5006]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [fameyemrf[at]gmail.com]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [andyhalford22[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  2.6 DEAR_FRIEND BODY: Dear Friend? That's not very dear!
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  2.3 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: ******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

-- 
Hello Sir



  I am Andy Halford from London, UK. Nice to meet you. Sorry for the
inconvenience it's because of the time difference. I contacted you
specifically regarding an important piece of information I intend
sharing with you that will be of interest to you. Having gone through
an intelligent methodical search, I decided to specifically contact
you hoping that you will find this information useful. Kindly confirm
I got the correct email by replying via same email to ensure I don't
send the information to the wrong person.



REGARDS
Andy Halford
