Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 943A454D594
	for <lists+selinux@lfdr.de>; Thu, 16 Jun 2022 01:57:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350050AbiFOXzd (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Wed, 15 Jun 2022 19:55:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236390AbiFOXzb (ORCPT
        <rfc822;selinux@vger.kernel.org>); Wed, 15 Jun 2022 19:55:31 -0400
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54C743EAB2
        for <selinux@vger.kernel.org>; Wed, 15 Jun 2022 16:55:29 -0700 (PDT)
Received: from fews2.riseup.net (fews2-pn.riseup.net [10.0.1.84])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
         client-signature RSA-PSS (2048 bits) client-digest SHA256)
        (Client CN "mail.riseup.net", Issuer "R3" (not verified))
        by mx1.riseup.net (Postfix) with ESMTPS id 4LNhy92F5zzDqZy
        for <selinux@vger.kernel.org>; Wed, 15 Jun 2022 23:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
        t=1655337329; bh=DRgUJkKtYVFyw1xiIsHh46giuqFpjiBWEHZp1l8AMko=;
        h=Date:From:To:Subject:From;
        b=MgWI792izIPLALKMRfUEsj7e95f56V9YtV+cS1Ao55PNZYWna1OPJP10dPEG76pFT
         D+S+XXBtFvgxPGskknrYjVh07Ta9JICVjDRgjhEWGh+ShE8SuEMMiEava8hqpget3I
         WY5TDe0sMIW93C6UHtyV1WfFS9Ey0gCc365Fttdk=
X-Riseup-User-ID: E830324D88E75DA2B1DEBC9BD9FCA3F872F6175ADC9409031C393DFE1B638413
Received: from [127.0.0.1] (localhost [127.0.0.1])
         by fews2.riseup.net (Postfix) with ESMTPSA id 4LNhy91Lvkz1y9N
        for <selinux@vger.kernel.org>; Wed, 15 Jun 2022 23:55:29 +0000 (UTC)
MIME-Version: 1.0
Date:   Wed, 15 Jun 2022 16:55:28 -0700
From:   Mikhail <nytimes@riseup.net>
To:     selinux@vger.kernel.org
Subject: hack
Message-ID: <b6f5e3d88b6845b8491adb0b6d5425ff@riseup.net>
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Hello, my fedora 36 was hacked.
What Can I do?
