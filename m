Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4802675A8CE
	for <lists+selinux@lfdr.de>; Thu, 20 Jul 2023 10:11:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229743AbjGTILE (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Thu, 20 Jul 2023 04:11:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229832AbjGTILD (ORCPT
        <rfc822;selinux@vger.kernel.org>); Thu, 20 Jul 2023 04:11:03 -0400
X-Greylist: delayed 233 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 20 Jul 2023 01:10:39 PDT
Received: from markus.defensec.nl (markus.defensec.nl [IPv6:2a10:3781:2099::123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8597270B
        for <selinux@vger.kernel.org>; Thu, 20 Jul 2023 01:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=defensec.nl;
        s=default; t=1689840404;
        bh=O7/OP8MZip/AQLo8N/TxObB/dRAJ2SvUHLoWhGOP9Ws=;
        h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
        b=DXEDefh87td6pDBN5JtRo3C6QeleeJz38+yYSV97sqg4ABWupNGu2adUk3RHeIFav
         uFE2PbzmZlvT6yPHook+Qu0tpBtVUH2PE/iN2Li3f4ngRyEafQlYsmElp4BEjKevsu
         QXHjCdgGejaPhQtB4AUoyhd6IU5m2nWsFdgQ5whs=
Received: from paulus (paulus.lan [IPv6:2a10:3781:2099::515])
        by markus.defensec.nl (Postfix) with ESMTPSA id 412F67D;
        Thu, 20 Jul 2023 10:06:44 +0200 (CEST)
From:   Dominick Grift <dominick.grift@defensec.nl>
To:     Brett Anderson <brett@bzdzb.com>
Cc:     selinux@vger.kernel.org
Subject: Re: SELinux Mascot/Logo
References: <CAPQCZivM+qGve5eUekri3_iEzAPE5o3ymqOunYMjQJ=4mRwPUg@mail.gmail.com>
Date:   Thu, 20 Jul 2023 10:06:43 +0200
In-Reply-To: <CAPQCZivM+qGve5eUekri3_iEzAPE5o3ymqOunYMjQJ=4mRwPUg@mail.gmail.com>
        (Brett Anderson's message of "Wed, 19 Jul 2023 14:42:01 -0400")
Message-ID: <877cqv6m7g.fsf@defensec.nl>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Brett Anderson <brett@bzdzb.com> writes:

> Hello!
>
> I made an SELinux logo for my own purposes and figured I would share
> it with you in case you would like to use it. I'm putting this into
> the public domain and you can do with it as you see fit; attribution
> would be cool, but not required.
>
> https://imgur.com/a/khkSEux.png
>
> Cheers!

Nice. No .svg? Check out: https://github.com/SELinuxProject/selinux-artwork#readme

-- 
gpg --locate-keys dominick.grift@defensec.nl (wkd)
Key fingerprint = FCD2 3660 5D6B 9D27 7FC6  E0FF DA7E 521F 10F6 4098
Dominick Grift
Mastodon: @kcinimod@defensec.nl
