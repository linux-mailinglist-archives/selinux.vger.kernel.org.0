Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F86C4D3E8C
	for <lists+selinux@lfdr.de>; Thu, 10 Mar 2022 02:04:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234632AbiCJBFO (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Wed, 9 Mar 2022 20:05:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229604AbiCJBFO (ORCPT
        <rfc822;selinux@vger.kernel.org>); Wed, 9 Mar 2022 20:05:14 -0500
Received: from mail-yw1-x1144.google.com (mail-yw1-x1144.google.com [IPv6:2607:f8b0:4864:20::1144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBB4411C7C9
        for <selinux@vger.kernel.org>; Wed,  9 Mar 2022 17:04:14 -0800 (PST)
Received: by mail-yw1-x1144.google.com with SMTP id 00721157ae682-2db2add4516so42448797b3.1
        for <selinux@vger.kernel.org>; Wed, 09 Mar 2022 17:04:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:sender:from:date:message-id:subject:to;
        bh=H2YfWCG0balrUsjNebe6NPqLv9wl/pqUnfwIaMT7BYE=;
        b=pg/Hz+ITZrS1BArljqqwA7qHTLnEViajRKZp+wdmPJPxoPFjQQXmy0LNAQWteV4GgK
         LGm552CsWxqw3l+YZUDdPz1sfGp6tFGod2o0CB0XvnyEArjcRkIM2QmuLH7Tz8tUbubk
         BQhctpCgbljq0bb3Up+Fg28bbWwOVXP8MqwxP7O6Ll3xHb3p7/OBWPpf+BJYdLnVXaIR
         MKJJhoL1rXvC+j57xD/7nGbVeEyslDrP8dqlsDbSqzli0oGz2/ooOvd0OsvYmXS8w/Er
         8oCWSNMqvfG5LHuNerrIcTo3BT7AdugMEETL9rSczSIwDUsCN++1d7WeRPaJj6eJ742f
         frhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
         :to;
        bh=H2YfWCG0balrUsjNebe6NPqLv9wl/pqUnfwIaMT7BYE=;
        b=FqZ8Nn0RMxEHZuSd08bWRcfQOP1dgLVeMfpxzadryn/KsP5KPNuvacbYWSw09+pPgj
         s/ooNWT1oa/6vATnyOB/R+22XLys5AdYydpslQvuNvPZs41vUkO1aZjyrkXod4rpSJgC
         +ZceS/dcbAIsv+sqYy4Sh/B+ztedi8hIWp97HKZ9H7RURKLVkBvuaiN7ufLuDqlrvoij
         GjxTlrnyArJk13+glwuiY2kDGBMBlOB+cs8XhJYrCHmtnNqD59YF7AWw0vEUCzvkdGXc
         Q6W7+RZ+ElDLYBUX62brum5Bx7qdTWzATTU8CPA+OBQ+6qnKtr59v5Rf98EJqukHnPkh
         S2JA==
X-Gm-Message-State: AOAM5309fWDICnPVswgzl1t+AfEcfh/c3kF0cFUiT5QJtefzTYrlnQNt
        KZkibtFslJUprAlf+G6rfTMFfVZuIWdroB6Z9aM=
X-Google-Smtp-Source: ABdhPJycM65D3w7cQT6WOjWerNMyD8yTXwRQU7cKHoVFMhS05m9F59A4tuvsImyvZ3+GK1DHLIHAxQ/C57P6EfQmWyc=
X-Received: by 2002:a0d:e2c9:0:b0:2dc:1f22:e349 with SMTP id
 l192-20020a0de2c9000000b002dc1f22e349mr2158843ywe.10.1646874253735; Wed, 09
 Mar 2022 17:04:13 -0800 (PST)
MIME-Version: 1.0
Sender: bintaahmed2030@gmail.com
Received: by 2002:a05:7110:4b1c:b0:16f:cabd:46d0 with HTTP; Wed, 9 Mar 2022
 17:04:13 -0800 (PST)
From:   Lisa Williams <lw23675851@gmail.com>
Date:   Thu, 10 Mar 2022 01:04:13 +0000
X-Google-Sender-Auth: rAtS3QG6PBjYZKwRamZUATPN6Yc
Message-ID: <CAGQNKtRaZY+r=E-ijOBXBnYZr4KAhs=_ad28N5ZE-9yyfvmd5w@mail.gmail.com>
Subject: My name is Lisa Williams
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.0 required=5.0 tests=BAYES_40,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

-- 
Hi Dear,

My name is Lisa  Williams, I am from the United States of America, Its
my pleasure to contact you for new and special friendship, I will be
glad to see your reply for us to know each other better.

Yours
Lisa
