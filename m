Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ECC75797C83
	for <lists+selinux@lfdr.de>; Thu,  7 Sep 2023 21:06:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231670AbjIGTGS (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Thu, 7 Sep 2023 15:06:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231301AbjIGTGS (ORCPT
        <rfc822;selinux@vger.kernel.org>); Thu, 7 Sep 2023 15:06:18 -0400
X-Greylist: delayed 4190 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 07 Sep 2023 12:06:12 PDT
Received: from mail.leachkin.pl (mail.leachkin.pl [217.61.97.203])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45DA3A1
        for <selinux@vger.kernel.org>; Thu,  7 Sep 2023 12:06:12 -0700 (PDT)
Received: by mail.leachkin.pl (Postfix, from userid 1001)
        id 3347783C47; Thu,  7 Sep 2023 08:46:17 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leachkin.pl; s=mail;
        t=1694072799; bh=elHzctRz/z3PfTIhGYJKd0TeBTmca98Y+JNgX4gfsPI=;
        h=Date:From:To:Subject:From;
        b=ZTNUyCfWYM7bvg37XuHMJXtIY9MxhusmFwUo8j0+mYpvk9MoPOhJtFjmVVSAfnnvK
         D7AWaAPPasOWlnb8mYbT9/WStc65n+ZWrI9U9Rp2owZpskegU3l0D7yN4KHVrqjrhe
         qrIzEBtzl3n8E6SqShdKYiaa8bQLdbuRJpH7J3r5xTSjm8sEo7ttgpQ3OTalvoNmpL
         xl404HdAdE2bBqe34ECcbMoRz7Mld+LZL7N9qF4wJjuIqOefnMRjXPzf6eVtu/BVZE
         Ts6Yc2S0BMUfDgnv2NWVpHQjwTem+Np6JRoE1id6770I63EJKbY64NsgubeZ4zukMF
         4iG1zLQ52eyZQ==
Received: by mail.leachkin.pl for <selinux@vger.kernel.org>; Thu,  7 Sep 2023 07:45:30 GMT
Message-ID: <20230907074501-0.1.59.hany.0.vhmk0xau59@leachkin.pl>
Date:   Thu,  7 Sep 2023 07:45:30 GMT
From:   "Jakub Lemczak" <jakub.lemczak@leachkin.pl>
To:     <selinux@vger.kernel.org>
Subject: =?UTF-8?Q?Pytanie_o_samoch=C3=B3d?=
X-Mailer: mail.leachkin.pl
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=0.6 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Dzie=C5=84 dobry,

Czy interesuje Pa=C5=84stwa rozwi=C4=85zanie umo=C5=BCliwiaj=C4=85ce moni=
torowanie samochod=C3=B3w firmowych oraz optymalizacj=C4=99 koszt=C3=B3w =
ich utrzymania?=20


Pozdrawiam,
Jakub Lemczak
