Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABEBE43A49E
	for <lists+selinux@lfdr.de>; Mon, 25 Oct 2021 22:26:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234155AbhJYU2X (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Mon, 25 Oct 2021 16:28:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236733AbhJYU2C (ORCPT
        <rfc822;selinux@vger.kernel.org>); Mon, 25 Oct 2021 16:28:02 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8656C04F5BC
        for <selinux@vger.kernel.org>; Mon, 25 Oct 2021 13:16:30 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id g8so3617952edb.2
        for <selinux@vger.kernel.org>; Mon, 25 Oct 2021 13:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:sender:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=/Yjg0Se6z3bXQRU2+BbfYbjk3UB2U0b3w/1mQflW5Xk=;
        b=km4GqNpQCPnLW4cZOPKjW+cODG6AXl6DFjPODRUETMFzAagC5dW+u3OFZ/cTjeTl6R
         9SgG+vAExzTyVPznhMUCpElV5kFnqcpTeh1e8Pm/bNUJ4Nnhp4sm2q1aVhoBk9YsVubb
         FBu7doaTRMVDNNQCwWRDAXN5DY4zuADIH4IDwQXAIWJA1fKyXx1fNTZ5rwRia6IcydS6
         wjvRXGqaLZBJ45uE/MGYSJ1d0IngpEDM/6PIQnJomkzoD5vICrOOsen8T9YGVwM+hYiJ
         OHIPYL2bYUAGaJFAdgiMjaC6Q0bPPkQYhdHiKKRZbAwK/j5jE611bxiuDB47e4Ib3EES
         kDCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:sender:from:date
         :message-id:subject:to:content-transfer-encoding;
        bh=/Yjg0Se6z3bXQRU2+BbfYbjk3UB2U0b3w/1mQflW5Xk=;
        b=8MX3XuAhpptpkb5paV0Z+ggvK2VS5njtBITAef1gfsr2iYFs1mNQUXv91/8AfXEKB5
         gVAii8PE3OpUB6Tm3Yh8jC8sK50rtWhqVb4Mkv5Nr0ojym3xensu/Kaofaz7RGHCavXE
         lMit07EZASKHvO1WHPCIOM5Xm/ZNFoHzNwdTKY8M+Wr3muQmuIJnmGT6rC2GgeEEbruk
         9aYslkCq9dHgkmBOtAC+jVIhaEXrKG6ClhnpYw0etRy3FeXu4sC1hnYhhnFG+pN/z4aa
         GNn8OIjm9yRWwSciHWnVxAeXwa74Q6mfNYBq2roZCrRRbf7PbXt38MV1SkfuybnRV/5Y
         GoSQ==
X-Gm-Message-State: AOAM533PTxu+A6aWcJxiDbUaD5ZkWxCfK6Lwn6tU9O+D1MXWwcE3C9wS
        obd5P5wCZ6TBiCwXKWs/icoGeU7zU5Cm5EbMVhk=
X-Google-Smtp-Source: ABdhPJx90fbE6oFLFzz2MyV/l9SozyaphwqKbxe8/nQnkaUyq3/i4edT4ogbyhI94yQ5okL4Yxb7i0pdXWmYCiVvsUk=
X-Received: by 2002:a17:907:9496:: with SMTP id dm22mr20990922ejc.7.1635192987491;
 Mon, 25 Oct 2021 13:16:27 -0700 (PDT)
MIME-Version: 1.0
Reply-To: martinafrancis022@gmail.com
Sender: dannybains3@gmail.com
Received: by 2002:a05:6408:2607:b0:127:233d:b678 with HTTP; Mon, 25 Oct 2021
 13:16:26 -0700 (PDT)
From:   Martina Francis <martinafrancis655@gmail.com>
Date:   Mon, 25 Oct 2021 13:16:26 -0700
X-Google-Sender-Auth: hHap2jYMyHfAcqfSEvWI1TK7brk
Message-ID: <CAP7jSjLQhHwbzedpZiK8yXXY3zi1kCEfA7m2zEGjmaYd1eLf=A@mail.gmail.com>
Subject: =?UTF-8?Q?Dobry_dzie=C5=84_moja_droga?=
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

--=20
Dobry dzie=C5=84 moja droga,
Jak si=C4=99 masz i twoja rodzina,
jestem pani Martina Francis, chora kobieta pisz=C4=85ca ze szpitalnego
=C5=82=C3=B3=C5=BCka z powodu niebezpiecznego raka i udaru m=C3=B3zgu, kt=
=C3=B3ry mnie
zaatakowa=C5=82. Mam fundusz darowizn w wysoko=C5=9Bci ( 2 700 000,00 $)
MILION=C3=93W USD Chc=C4=99 przekaza=C4=87 za po=C5=9Brednictwem Twojej pom=
ocy na projekt
charytatywny

Prosz=C4=99 wr=C3=B3ci=C4=87 do mnie po wi=C4=99cej szczeg=C3=B3=C5=82=C3=
=B3w.

Twoja siostra,
Pani Martina Francis.
