Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9439258E22F
	for <lists+selinux@lfdr.de>; Tue,  9 Aug 2022 23:53:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229747AbiHIVxz (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Tue, 9 Aug 2022 17:53:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229448AbiHIVxy (ORCPT
        <rfc822;selinux@vger.kernel.org>); Tue, 9 Aug 2022 17:53:54 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 836506AA27
        for <selinux@vger.kernel.org>; Tue,  9 Aug 2022 14:53:53 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id uj29so24639712ejc.0
        for <selinux@vger.kernel.org>; Tue, 09 Aug 2022 14:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc;
        bh=OreQW8LduJ+3/sytHN1UMAwYouobUY5jZBcqHsdHYnw=;
        b=DgjUGjISdN/ceUngb6gECyv9X9xvFmWmkJjYJ9NiU+bGKPDzWdyLxNVpUsp0KqrsE5
         tQksOC9cOH4tMjH+EFm3yE0bK1452APYMvQqyZx35HcCzI/oHYeoAozQpaj+xHubeTxc
         5/kSHwSVEE/kYqtJ2p0YjQ6xr3jqv5dCpw/s9PNXnXLUEwSNtrNwD2NS8e8QtrDQ1FCX
         xO7zXO2k6dO5wKpRnDaxw2W42FkqWvD7TnYEBMXz3EiM3DMcAmv8h+F5G/TZXtEpCZlB
         tuHossRY3Et+52es+EYnqirwpe7BXOkjznBiIN5ivJU/vIei9yIuTGTXFCFC4XRQofn5
         jIjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc;
        bh=OreQW8LduJ+3/sytHN1UMAwYouobUY5jZBcqHsdHYnw=;
        b=H1FDH8vwSCRND/9YeZJVIQDRJvYOl4j/tJAu47ZoDOaqIr6umujmlomZ27lOYsKDhY
         b+x+VoYA2Q0puH6R2YKCnkxORNi8rFaEIIe/I+AWHD56rlt1b6xsJ9Hz0MYwvmMjnYsa
         c6920N0Dbo/P8VaLS0iKqHUKm5GsfZptgxDqIWURZ1zpzE+J3Lwf2N70xClAO1VqPEpa
         dzDyShLwnw38isj0IaOLz5WwXFRrG1xc72ZErjcUJ5H3xu/pJyeG+xI7uvH9+p3XTusI
         kjZV7td+PIotMzTOQdlbrjqQIZrI//NJvxcOiOj4FrR3Timb0bDl4NDnwXzYn/4ADU0R
         xESQ==
X-Gm-Message-State: ACgBeo1HJquaFfGpl/8VHdGNwMMFq8nfrOg+lITMrG7rwuhGO7PdSItX
        HnLAQDllVSz1jucHLRXn70L2GhagUC40G6BaGCM=
X-Google-Smtp-Source: AA6agR7W3qZCsp4jNC4wOdIZoLl0kx2nYGgRTCxuze9scILg89RVekYvEWKy01+5MtMW0O7fhRRWskcR3rYa/gIGklo=
X-Received: by 2002:a17:907:b590:b0:730:9e03:95a8 with SMTP id
 qx16-20020a170907b59000b007309e0395a8mr18122348ejc.384.1660082032006; Tue, 09
 Aug 2022 14:53:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a50:7e82:0:0:0:0:0 with HTTP; Tue, 9 Aug 2022 14:53:51 -0700 (PDT)
Reply-To: wijh555@gmail.com
From:   "Mrs. Mimi Aminu" <mimiaminu319@gmail.com>
Date:   Tue, 9 Aug 2022 14:53:51 -0700
Message-ID: <CAD-C4f6AE-LpsyEMs4cHz7rKdWGv0dD-hnPq4jQWq0uCyvH7QQ@mail.gmail.com>
Subject: Greetings,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.2 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_HK_NAME_FM_MR_MRS,
        T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:62a listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [mimiaminu319[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [wijh555[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [mimiaminu319[at]gmail.com]
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  0.0 T_HK_NAME_FM_MR_MRS No description available.
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.1 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

-- 
Hello,
We the Board Directors believe you are in good health, doing great and
with the hope that this mail will meet you in good condition, We are
privileged and delighted to reach you via email" And we are urgently
waiting to hear from you. and again your number is not connecting.

My regards,
Mrs. Mimi Aminu.

Sincerely,
Prof. Chin Guang
