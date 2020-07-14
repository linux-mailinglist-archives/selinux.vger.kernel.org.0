Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B50D321E812
	for <lists+selinux@lfdr.de>; Tue, 14 Jul 2020 08:26:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726364AbgGNG0Y (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Tue, 14 Jul 2020 02:26:24 -0400
Received: from agnus.defensec.nl ([80.100.19.56]:49246 "EHLO agnus.defensec.nl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725788AbgGNG0X (ORCPT <rfc822;selinux@vger.kernel.org>);
        Tue, 14 Jul 2020 02:26:23 -0400
Received: from brutus (brutus.lan [IPv6:2001:985:d55d::438])
        by agnus.defensec.nl (Postfix) with ESMTPSA id D93ED2A0FFA
        for <selinux@vger.kernel.org>; Tue, 14 Jul 2020 08:26:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 agnus.defensec.nl D93ED2A0FFA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=defensec.nl;
        s=default; t=1594707981;
        bh=uR7VfQljqjSPY4eMpzsScjuVETyjwS/PHx0Ljhj6WZA=;
        h=From:To:Subject:Date:From;
        b=bgetkNfKJ0rYbT8/vhsvx8y7RDvcf6+KS2YGoV6t3Uqe1xSkT+3IB2K7O1tPjnBPv
         zCW3jQ5ttegSAd6mu4tKYWVEsmixZtjgMgpmjlgPST2ltVvtpCSxwKQKJTL6MjgNEc
         q9KnjAL6Wcqn7fuULInbuouNJResMQ12Kfvi3pe0=
From:   Dominick Grift <dominick.grift@defensec.nl>
To:     selinux@vger.kernel.org
Subject: genhomedircon and passwd
Date:   Tue, 14 Jul 2020 08:26:16 +0200
Message-ID: <ypjlwo36fw8n.fsf@defensec.nl>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org


Users managed with systemd-homed/userdbd do not get their contexts
generated by genhomedircon on autorelabel at the least (semodule -B
causes genhomedircon to generate contexts for these users just fine).

selinux-autorelabel calls fixfiles and fixfiles calls genhomedircon
genhomedircon skips the users on
https://github.com/SELinuxProject/selinux/blob/master/libsemanage/src/genhomedircon.c#L1015
Users managed by systemd-homed/userdbd do not have an entry in
/etc/passwd.

-- 
gpg --locate-keys dominick.grift@defensec.nl
Key fingerprint = FCD2 3660 5D6B 9D27 7FC6  E0FF DA7E 521F 10F6 4098
https://sks-keyservers.net/pks/lookup?op=get&search=0xDA7E521F10F64098
Dominick Grift
