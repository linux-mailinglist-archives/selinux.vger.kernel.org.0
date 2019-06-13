Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 50C8343F99
	for <lists+selinux@lfdr.de>; Thu, 13 Jun 2019 17:59:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731806AbfFMP6m (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Thu, 13 Jun 2019 11:58:42 -0400
Received: from 48.23.240.77.static.louhi.net ([77.240.23.48]:37814 "EHLO
        kolttonen.fi" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390315AbfFMP6j (ORCPT <rfc822;selinux@vger.kernel.org>);
        Thu, 13 Jun 2019 11:58:39 -0400
Received: from 34-41-5D-CA-59-C7 (82-203-159-32.bb.dnainternet.fi [82.203.159.32])
        (authenticated bits=0)
        by vcust561.louhi.net (8.14.7/8.14.7/0) with ESMTP id x5DFvMxV030707
        (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Thu, 13 Jun 2019 18:57:23 +0300
DKIM-Filter: OpenDKIM Filter v2.11.0 vcust561.louhi.net x5DFvMxV030707
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kolttonen.fi;
        s=mail; t=1560441443;
        bh=auEUAEvUZQwo04ZuhvGcSpPIo/2aicDVcv6bduz4D2I=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=pAcdCgZofufv4JhtSvbwuGDPaPNa1xNF9r66VmKzyxxtRm4XCe9O3DnRMCqyIPxm5
         DS76ccAp9vs3FmWx05/zVHvHVZ8T9wvo6laPeahdejeDKwfD1r0V+wZ/IcEcKsjaYV
         ukTJ7ILL2W3ML0VaWUzvphC8/XrpHFofC4KNDXA7Mo7W2LwiS+Lt0Sh319XhuCXehP
         4oFMlgI0otxRHUiNQZRArYQv3ApAry4We62COFsToaWBB9P3HuhR3kgTWNHq039UwZ
         bSXfjqJIxPbJouiXny4RVPsnNgx1KjbJS8yFFihw9F4usOSa9T0hOZpBd4YhKevDst
         z18oWjfc/AWoA==
Date:   Thu, 13 Jun 2019 18:57:56 +0300 (EEST)
From:   =?ISO-8859-15?Q?Jokke_H=E4m=E4l=E4inen?= 
        <jokke.hamalainen@kolttonen.fi>
To:     William Roberts <bill.c.roberts@gmail.com>
cc:     Petr Lautrbach <plautrba@redhat.com>, selinux@vger.kernel.org
Subject: Re: [PATCH] trivial: remove unneeded int
In-Reply-To: <CAFftDdp=Tp1V0wfdn_wiFcaSyHwQV_=NYi0s_Rz5Yvvj-DaUiw@mail.gmail.com>
Message-ID: <alpine.LFD.2.21.1906131856280.5703@34-41-5D-CA-59-C7>
References: <alpine.LFD.2.21.1905242306150.9521@34-41-5D-CA-59-C7> <pjd5zphv6ei.fsf@redhat.com> <pjd4l51v4ge.fsf@redhat.com> <alpine.LFD.2.21.1906121730070.28042@34-41-5D-CA-59-C7> <CAFftDdp=Tp1V0wfdn_wiFcaSyHwQV_=NYi0s_Rz5Yvvj-DaUiw@mail.gmail.com>
User-Agent: Alpine 2.21 (LFD 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="-1463786495-857999591-1560441477=:5703"
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---1463786495-857999591-1560441477=:5703
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT


Hi!

On Wed, 12 Jun 2019, William Roberts wrote:

> I'm OK with those three if you fix the 4 issues I pointed out. I'll
> let Stephen decide the fate on the pure style patches.

Sorry for this mess, guys. I will resend the three patches, hopefully 
correctly this time.

Best regards,
Jokke Hämäläinen
---1463786495-857999591-1560441477=:5703--
