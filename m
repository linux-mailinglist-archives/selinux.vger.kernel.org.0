Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD78B1E5E24
	for <lists+selinux@lfdr.de>; Thu, 28 May 2020 13:21:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388303AbgE1LVE (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Thu, 28 May 2020 07:21:04 -0400
Received: from agnus.defensec.nl ([80.100.19.56]:36416 "EHLO agnus.defensec.nl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388243AbgE1LVD (ORCPT <rfc822;selinux@vger.kernel.org>);
        Thu, 28 May 2020 07:21:03 -0400
X-Greylist: delayed 514 seconds by postgrey-1.27 at vger.kernel.org; Thu, 28 May 2020 07:21:02 EDT
Received: from brutus (brutus [IPv6:2001:985:d55d::438])
        by agnus.defensec.nl (Postfix) with ESMTPSA id E35522A1013
        for <selinux@vger.kernel.org>; Thu, 28 May 2020 13:12:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 agnus.defensec.nl E35522A1013
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=defensec.nl;
        s=default; t=1590664344;
        bh=or4KrGdo6byGfl3XF/Url0jRIhFp14jF+LLz+YTau68=;
        h=From:To:Subject:Date:From;
        b=fbQ7A20Qch3W09BjvHHM1eLQnHUJmE1xi3Bv3F/0NnUXfSzGkoNddg4tZvlbuPeFW
         UExPSZ5VINMA4kAIGPL3Rr5lgP/wbJougZAtoTAzZDvcV0LN6lfuT4t6PhJJqFwrAf
         gFrEU+4F9HOkF4IikUOuz8gR5dhoM0yfpqzZ76Zw=
From:   Dominick Grift <dominick.grift@defensec.nl>
To:     selinux@vger.kernel.org
Subject: CIL typealiases
Date:   Thu, 28 May 2020 13:12:19 +0200
Message-ID: <ypjlsgfk71po.fsf@defensec.nl>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org


tl;dr typalias (and possibly typealiasactual) statement does not like periods

systemd plans to consolidate systemd-udevd and udevadm and so I was
looking to consolidate the policy. For compatibility I wanted to add a
(typealias .udev.udevadm.exec) and (typealiasactual .udev.udevadm.exec
.udev.daemon.exec)

That reminded me that it does not like the period name space
delimiter in at least the typealias statement.

Example:

[root@brutus ~]# echo "(block test (type test1) (typealias test2.test1)
(typealiasactual test2.test1 test.test1))" > mytest.cil
[root@brutus ~]# semodule -vvv -i mytest.cil

<snip>
Building AST from Parse Tree
Invalid character "." in test2.test1
Invalid name
Failed to create node
Bad typealias declaration at
/var/lib/selinux/mydssp3-mcs/tmp/modules/400/mytest/cil:1
Problem at /var/lib/selinux/mydssp3-mcs/tmp/modules/400/mytest/cil:1
Failed to build ast
semodule:  Failed!

-- 
gpg --locate-keys dominick.grift@defensec.nl
Key fingerprint = FCD2 3660 5D6B 9D27 7FC6  E0FF DA7E 521F 10F6 4098
https://sks-keyservers.net/pks/lookup?op=get&search=0xDA7E521F10F64098
Dominick Grift
