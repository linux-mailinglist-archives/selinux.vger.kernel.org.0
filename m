Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 46B1819EA3A
	for <lists+selinux@lfdr.de>; Sun,  5 Apr 2020 11:54:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726491AbgDEJyW (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Sun, 5 Apr 2020 05:54:22 -0400
Received: from smtp.sws.net.au ([46.4.88.250]:46036 "EHLO smtp.sws.net.au"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726455AbgDEJyW (ORCPT <rfc822;selinux@vger.kernel.org>);
        Sun, 5 Apr 2020 05:54:22 -0400
X-Greylist: delayed 453 seconds by postgrey-1.27 at vger.kernel.org; Sun, 05 Apr 2020 05:54:22 EDT
Received: from liv.localnet (localhost [127.0.0.1])
        by smtp.sws.net.au (Postfix) with ESMTP id D3D2CF0EA
        for <selinux@vger.kernel.org>; Sun,  5 Apr 2020 19:46:46 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=coker.com.au;
        s=2008; t=1586080008;
        bh=Oed4ArNKFhtOFHYhkMdd+TeQK+r3hVssHrmlKu/kMcY=; l=494;
        h=From:To:Subject:Date:From;
        b=1e8+kEzUQQfZZbVC4ve3LR9KEBs/GHXkm2g0ntJqyt3j7eNs8pFF0TvdIhT/Ti923
         PN5XUVUA0rutUVZ6AmwbDL6RPiuO2oNx9KZkGqE8Ib0pygNk8nJz2R87MO8hVL7juK
         Uc24853LzobnOgPlI/dQiEO7U48W/7kiALs5dsTU=
From:   Russell Coker <russell@coker.com.au>
To:     selinux@vger.kernel.org
Subject: libsepol releases
Date:   Sun, 05 Apr 2020 19:46:37 +1000
Message-ID: <3581425.j52oWYpJar@liv>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=955154

We have the above Debian bug report requesting a GIT patch for libsepol for 
GCC-10 support.

https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=955286

We also have the above for a policy constraint error.

Could we have a new upstream release soon to cover all GCC-10 issues as well 
as any other important things?  Maybe version 3.0.1?

-- 
My Main Blog         http://etbe.coker.com.au/
My Documents Blog    http://doc.coker.com.au/



