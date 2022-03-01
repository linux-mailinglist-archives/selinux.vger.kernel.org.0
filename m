Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 912914C97E0
	for <lists+selinux@lfdr.de>; Tue,  1 Mar 2022 22:43:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238365AbiCAVoU (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Tue, 1 Mar 2022 16:44:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230285AbiCAVoT (ORCPT
        <rfc822;selinux@vger.kernel.org>); Tue, 1 Mar 2022 16:44:19 -0500
Received: from mail-vs1-xe30.google.com (mail-vs1-xe30.google.com [IPv6:2607:f8b0:4864:20::e30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 834E598593
        for <selinux@vger.kernel.org>; Tue,  1 Mar 2022 13:43:37 -0800 (PST)
Received: by mail-vs1-xe30.google.com with SMTP id y26so18012989vsq.8
        for <selinux@vger.kernel.org>; Tue, 01 Mar 2022 13:43:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=xVJHepNq93ePmAbCv1LHbdOWJcqWYQh8v11fr0KUdVw=;
        b=KXYG5cyp547Of+wLaw74LDCAFRJitoiNf/4aSSYVLSU/Vs4QVvhm/WBZln7+eLhunQ
         ImBrLfjIeethrYQ7QI5udaRJ5LYgofjX44JtR6lNlnU9mdeb8DXD4agFFL5T9TOQVGzn
         hOQMBx/cvOzwG3kmkEH1EgGA5JRQWs9bNW7jR1CKKNC4XiTmM0rimN0VOcboo0efW0GF
         P+j7cCWfpRLQtowB6X5bB1FB2p4zKbK3HVh/YEBcxsGQW3Rp9Smu9bQr63vSRdHTbrqG
         JXQzLWPfbOEAgShNUJ/ZAIoF5uVw+kCDu1ZthMG5JO+yIJqXNSf4k2oe+uz5Wu/UUcLM
         ITwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=xVJHepNq93ePmAbCv1LHbdOWJcqWYQh8v11fr0KUdVw=;
        b=aDWRlKwnS/y2dxwG39Taq3IsYWbZW79GgnRgrgNciNHvRwUNIqVKGQYxfPU1C7p+0I
         R1cl4wL7IXMQ3C1PzLE53JrQeAOLIZmj6ajS2kfShYXN71wfXvdau4chZJONn2CkRvI8
         8cDLKdBG3akVPJr/Q+CSIsGKaH+WhZmiXhHV5aqynLTG8ixV7x0dwTOYV/Mic/Fn5Qsy
         V3fTOHDryzAK3QhV9W4838UQYfhQBywJ+greh4ZB3P9+fsBFuZVrNBOPeAosrLf25uL0
         K2UJCJ7MImh0X28UMM4wQ1ZFOFub0iCWvIfRUM/be93OOEY4Wxt3aydnfxcqSasBaRga
         BFgw==
X-Gm-Message-State: AOAM5332zWl1M7Vm0/I5GcrPDXvTx//seDBi1mAY/CJoQxpvMQh41Suh
        vfjawInqSRG1mthsF+qJcglBSFxMjD8paz5neig=
X-Google-Smtp-Source: ABdhPJzI8Ncz64IxfZ0HuONvZC/vaKVYvLvbQKAlgsNeSSoET/FVS6++ZmoqRxTMuW0DwnPqV+NXtr89yv0KVTp6yoU=
X-Received: by 2002:a05:6102:32ce:b0:30f:4582:72e7 with SMTP id
 o14-20020a05610232ce00b0030f458272e7mr11028050vss.60.1646171015651; Tue, 01
 Mar 2022 13:43:35 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:ab0:690d:0:0:0:0:0 with HTTP; Tue, 1 Mar 2022 13:43:35 -0800 (PST)
Reply-To: lilywilliam989@gmail.com
From:   Lily William <safiyatuhammajjulde@gmail.com>
Date:   Tue, 1 Mar 2022 13:43:35 -0800
Message-ID: <CAE_8quAswBLFyqVB2EA9fv3ZtCYLUT-xg=7K0K-SyKKWRKP8_A@mail.gmail.com>
Subject: Hi Dear,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.4 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:e30 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.4488]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [lilywilliam989[at]gmail.com]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [safiyatuhammajjulde[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.6 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

-- 
Hi Dear,

My name is Lily William, I am from the United States of America. It's my
pleasure to contact you for a new and special friendship. I will be glad to
see your reply so we can get to know each other better.

Yours
Lily
