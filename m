Return-Path: <selinux+bounces-1992-lists+selinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA22986773
	for <lists+selinux@lfdr.de>; Wed, 25 Sep 2024 22:11:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CC5AE1F21FC6
	for <lists+selinux@lfdr.de>; Wed, 25 Sep 2024 20:11:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AE011F94C;
	Wed, 25 Sep 2024 20:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="FM3DwHdy"
X-Original-To: selinux@vger.kernel.org
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 090E5146A79
	for <selinux@vger.kernel.org>; Wed, 25 Sep 2024 20:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727295089; cv=none; b=M73pEBenrpBqZ+coOUYpeSkLLnwARa6Qa0nKWhBiL1uyn1ABuQtAitMRwKRh98zI4LqiggYle+ysnc+Oi9cXRUhOs58CTnxE/FDshqWxyZFoXrKmFpH/6a0NnSaCc/jb/kkwjiil12AQIKI2PG9oi4U3d/6I58rgHehUefBIjbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727295089; c=relaxed/simple;
	bh=VLx6uUCjYaISG97Wa4TOTiMEM7nvsnd5jlDemBnYp5o=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bbbf2Bves2nhfgJWdx1RFXNLdt18PimhLbgR5g276xzhQJM5/GjII6Ir4yI+0Kpk9w1rWfIVrKCBWKHYoZVdH96U8fNlVnkHDc45vG/XeKnaG9mEL76VQax+E8BlUNWh422lvf3Dg2r+HfVlhv61Q8rQizQDJhlRtu4DkCxEyEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=FM3DwHdy; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7a9a30a0490so20149285a.3
        for <selinux@vger.kernel.org>; Wed, 25 Sep 2024 13:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1727295085; x=1727899885; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5Uyf/GUiwSQZXJjnlZ1nQhvOU4Gfs+64eQH8EvYYLKw=;
        b=FM3DwHdyMjVfkzAzT8CkmG+J3jTqKC4DyHx2enHW7u2xGSISTxkO2JjtlSPKefp0Qz
         sHroi18Eu+cZKNzGNTOVtDcrS07gPQQJRMn2HVufpp93G5nqKpFu9yTgxn7ETxeUkKBG
         Q8u3oR9En/G3iCd5SjOC8KD3DdQ70EL/Y3GgPYhtn2ut7RkrrgPBS2HeeD4vF7VXxvlY
         lrYI3mBm21mOrvSomBvCVIerD7tPlQEZIuYIp5lQi7QEYeZf9U5W9wHokGkrC7MKi5+R
         15bo33H3GG3rtvxAes6WLmI+6hLE1HG0KrByk47C4rLwAl6ybIGu0N7UkuF1jy2PxaSV
         id6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727295085; x=1727899885;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5Uyf/GUiwSQZXJjnlZ1nQhvOU4Gfs+64eQH8EvYYLKw=;
        b=XVWKHdOm90BYQPaB623mqIxmovdP+dJr3xrMLkCV3AGJanTg82VzfhSybDXRLj1RcX
         4310JnujnEetLIwh5CEkAoRzA2yYVBAruSRbutsnGMZGOFbcXsoHPwuiDpoozH9tZVuO
         Lkn8KzqAUa2GXtGdyeb95J1vKf2xDnad1tbJ4VyRz2zvcOgYvGMPJ9FhaK6Pd3LbXhuK
         fF9dyA2MptoRgXSu3leeSbYS4cC48KgAFLCxnMc0vG8w/PJSwTMfKiTUZX7vN2JgM2ia
         tuF8ivgkWa47Jt6xcRYOo0+NU17pt3cQtWNr48nGa3wiW6A+im+GEflsCFuRfUOIEceM
         0IgQ==
X-Gm-Message-State: AOJu0Yz15VlAp9iMrpJE732FpQNYA1/6hKfeXKe4VgvAa4DZ4bF6re4r
	6ccwu9bvjBAxrk4SIhDcyFxH3UhLsYtee1/CSqrs9PnOtdSFC0onr+QzXfZpBu5rzZJXtyIrp+s
	=
X-Google-Smtp-Source: AGHT+IEsVHp8iERC8+BWYK2N6g3JqB1+gKugO9BzSe1Q6uou44GLc0ZB9OSTW+9i4oEM5j2ccsa9/w==
X-Received: by 2002:a05:620a:4555:b0:7a9:be54:4b00 with SMTP id af79cd13be357-7ace7412827mr564186785a.35.1727295085500;
        Wed, 25 Sep 2024 13:11:25 -0700 (PDT)
Received: from localhost ([70.22.175.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7acde542f6dsm203437685a.49.2024.09.25.13.11.24
        for <selinux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 13:11:25 -0700 (PDT)
From: Paul Moore <paul@paul-moore.com>
To: selinux@vger.kernel.org
Subject: [PATCH 2/2] selinux: apply clang format to security/selinux/nlmsgtab.c
Date: Wed, 25 Sep 2024 16:11:08 -0400
Message-ID: <20240925201106.16134-4-paul@paul-moore.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20240925201106.16134-3-paul@paul-moore.com>
References: <20240925201106.16134-3-paul@paul-moore.com>
Precedence: bulk
X-Mailing-List: selinux@vger.kernel.org
List-Id: <selinux.vger.kernel.org>
List-Subscribe: <mailto:selinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:selinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=14410; i=paul@paul-moore.com; h=from:subject; bh=VLx6uUCjYaISG97Wa4TOTiMEM7nvsnd5jlDemBnYp5o=; b=owEBbQKS/ZANAwAIAeog8tqXN4lzAcsmYgBm9G5iYSwV+B/lebqivBq1MIs6mTPRo+q27tHla 9MJlFltClWJAjMEAAEIAB0WIQRLQqjPB/KZ1VSXfu/qIPLalzeJcwUCZvRuYgAKCRDqIPLalzeJ cwyLEACndAFQtECGGfC3CUv2jDYadbPeEnVd4C8alXyw6+yP9tzdZ9+YX0LksdJGjQHLegm2fqM bu5gI507KHVrJjLyMXG52mTD8FppO2Dq3TWtPIweFsgPoro5R6VJXJOxpplgI82zkilL+GS3yH3 lsVTNEj9ES33dyIhgrPNt3XgP1buMmsEWkEw6tZcJQGDbuHb60qClkx3Or5eCE+jDIMhxYbZoos b8ar0TV7F5Y2qPDMzE93pnj191WkwDclysHKly2EZDteRpQxpZue7pszoKuu77IikhNz2/CG5cu fu2es/Q15qfvcgIlnXVw6rLINPibyB2AO9EPUiyFivPEB6ayRDzOie2Nss5mp+e798w7xCKkd05 NOBNPupArR7nwlb5/U4cwvb9FXmJmMM/lF3ufXOPE4lKOuQEOtpy7lH6Po6/SO4rvuYyiVsLYZt mftlz4HuB6BSeu0/AYGMliuYpz81BQRp9mSkqhd8Y9OWAkDYgYdvz5QXFunFAlO+s3fywaTB5dQ ky/Iznl1CrQdRQNwy6aV+VyDXr2lJgl9Gg3EBCk63CCk8c/iLH4pncrdkp80+VZXUh2lfhIyRpM XaN8wlW09fWXGmeOgTrs9SmB3PbsHqU8W+iRBAv2FMJcFhAnKV8qDkVOh1AyWW+2x3LSEZD1DaW XhYGuZWSGUEOZHg==
X-Developer-Key: i=paul@paul-moore.com; a=openpgp; fpr=7100AADFAE6E6E940D2E0AD655E45A5AE8CA7C8A
Content-Transfer-Encoding: 8bit

Update nlmsgtab.c to better adhere to the kernel coding style guidelines.

Signed-off-by: Paul Moore <paul@paul-moore.com>
---
 security/selinux/nlmsgtab.c | 236 ++++++++++++++++++------------------
 1 file changed, 118 insertions(+), 118 deletions(-)

diff --git a/security/selinux/nlmsgtab.c b/security/selinux/nlmsgtab.c
index f68b4f493de6..47117b4f991f 100644
--- a/security/selinux/nlmsgtab.c
+++ b/security/selinux/nlmsgtab.c
@@ -21,142 +21,142 @@
 #include "security.h"
 
 struct nlmsg_perm {
-	u16	nlmsg_type;
-	u32	perm;
+	u16 nlmsg_type;
+	u32 perm;
 };
 
 static const struct nlmsg_perm nlmsg_route_perms[] = {
-	{ RTM_NEWLINK,		NETLINK_ROUTE_SOCKET__NLMSG_WRITE },
-	{ RTM_DELLINK,		NETLINK_ROUTE_SOCKET__NLMSG_WRITE },
-	{ RTM_GETLINK,		NETLINK_ROUTE_SOCKET__NLMSG_READ  },
-	{ RTM_SETLINK,		NETLINK_ROUTE_SOCKET__NLMSG_WRITE },
-	{ RTM_NEWADDR,		NETLINK_ROUTE_SOCKET__NLMSG_WRITE },
-	{ RTM_DELADDR,		NETLINK_ROUTE_SOCKET__NLMSG_WRITE },
-	{ RTM_GETADDR,		NETLINK_ROUTE_SOCKET__NLMSG_READ  },
-	{ RTM_NEWROUTE,		NETLINK_ROUTE_SOCKET__NLMSG_WRITE },
-	{ RTM_DELROUTE,		NETLINK_ROUTE_SOCKET__NLMSG_WRITE },
-	{ RTM_GETROUTE,		NETLINK_ROUTE_SOCKET__NLMSG_READ  },
-	{ RTM_NEWNEIGH,		NETLINK_ROUTE_SOCKET__NLMSG_WRITE },
-	{ RTM_DELNEIGH,		NETLINK_ROUTE_SOCKET__NLMSG_WRITE },
-	{ RTM_GETNEIGH,		NETLINK_ROUTE_SOCKET__NLMSG_READ  },
-	{ RTM_NEWRULE,		NETLINK_ROUTE_SOCKET__NLMSG_WRITE },
-	{ RTM_DELRULE,		NETLINK_ROUTE_SOCKET__NLMSG_WRITE },
-	{ RTM_GETRULE,		NETLINK_ROUTE_SOCKET__NLMSG_READ  },
-	{ RTM_NEWQDISC,		NETLINK_ROUTE_SOCKET__NLMSG_WRITE },
-	{ RTM_DELQDISC,		NETLINK_ROUTE_SOCKET__NLMSG_WRITE },
-	{ RTM_GETQDISC,		NETLINK_ROUTE_SOCKET__NLMSG_READ  },
-	{ RTM_NEWTCLASS,	NETLINK_ROUTE_SOCKET__NLMSG_WRITE },
-	{ RTM_DELTCLASS,	NETLINK_ROUTE_SOCKET__NLMSG_WRITE },
-	{ RTM_GETTCLASS,	NETLINK_ROUTE_SOCKET__NLMSG_READ  },
-	{ RTM_NEWTFILTER,	NETLINK_ROUTE_SOCKET__NLMSG_WRITE },
-	{ RTM_DELTFILTER,	NETLINK_ROUTE_SOCKET__NLMSG_WRITE },
-	{ RTM_GETTFILTER,	NETLINK_ROUTE_SOCKET__NLMSG_READ  },
-	{ RTM_NEWACTION,	NETLINK_ROUTE_SOCKET__NLMSG_WRITE },
-	{ RTM_DELACTION,	NETLINK_ROUTE_SOCKET__NLMSG_WRITE },
-	{ RTM_GETACTION,	NETLINK_ROUTE_SOCKET__NLMSG_READ  },
-	{ RTM_NEWPREFIX,	NETLINK_ROUTE_SOCKET__NLMSG_WRITE },
-	{ RTM_GETMULTICAST,	NETLINK_ROUTE_SOCKET__NLMSG_READ  },
-	{ RTM_GETANYCAST,	NETLINK_ROUTE_SOCKET__NLMSG_READ  },
-	{ RTM_GETNEIGHTBL,	NETLINK_ROUTE_SOCKET__NLMSG_READ  },
-	{ RTM_SETNEIGHTBL,	NETLINK_ROUTE_SOCKET__NLMSG_WRITE },
-	{ RTM_NEWADDRLABEL,	NETLINK_ROUTE_SOCKET__NLMSG_WRITE },
-	{ RTM_DELADDRLABEL,	NETLINK_ROUTE_SOCKET__NLMSG_WRITE },
-	{ RTM_GETADDRLABEL,	NETLINK_ROUTE_SOCKET__NLMSG_READ  },
-	{ RTM_GETDCB,		NETLINK_ROUTE_SOCKET__NLMSG_READ  },
-	{ RTM_SETDCB,		NETLINK_ROUTE_SOCKET__NLMSG_WRITE },
-	{ RTM_NEWNETCONF,	NETLINK_ROUTE_SOCKET__NLMSG_WRITE },
-	{ RTM_DELNETCONF,	NETLINK_ROUTE_SOCKET__NLMSG_WRITE },
-	{ RTM_GETNETCONF,	NETLINK_ROUTE_SOCKET__NLMSG_READ  },
-	{ RTM_NEWMDB,		NETLINK_ROUTE_SOCKET__NLMSG_WRITE },
-	{ RTM_DELMDB,		NETLINK_ROUTE_SOCKET__NLMSG_WRITE  },
-	{ RTM_GETMDB,		NETLINK_ROUTE_SOCKET__NLMSG_READ  },
-	{ RTM_NEWNSID,		NETLINK_ROUTE_SOCKET__NLMSG_WRITE },
-	{ RTM_DELNSID,		NETLINK_ROUTE_SOCKET__NLMSG_READ  },
-	{ RTM_GETNSID,		NETLINK_ROUTE_SOCKET__NLMSG_READ  },
-	{ RTM_NEWSTATS,		NETLINK_ROUTE_SOCKET__NLMSG_READ },
-	{ RTM_GETSTATS,		NETLINK_ROUTE_SOCKET__NLMSG_READ  },
-	{ RTM_SETSTATS,		NETLINK_ROUTE_SOCKET__NLMSG_WRITE },
-	{ RTM_NEWCACHEREPORT,	NETLINK_ROUTE_SOCKET__NLMSG_READ },
-	{ RTM_NEWCHAIN,		NETLINK_ROUTE_SOCKET__NLMSG_WRITE },
-	{ RTM_DELCHAIN,		NETLINK_ROUTE_SOCKET__NLMSG_WRITE },
-	{ RTM_GETCHAIN,		NETLINK_ROUTE_SOCKET__NLMSG_READ  },
-	{ RTM_NEWNEXTHOP,	NETLINK_ROUTE_SOCKET__NLMSG_WRITE },
-	{ RTM_DELNEXTHOP,	NETLINK_ROUTE_SOCKET__NLMSG_WRITE },
-	{ RTM_GETNEXTHOP,	NETLINK_ROUTE_SOCKET__NLMSG_READ  },
-	{ RTM_NEWLINKPROP,	NETLINK_ROUTE_SOCKET__NLMSG_WRITE },
-	{ RTM_DELLINKPROP,	NETLINK_ROUTE_SOCKET__NLMSG_WRITE },
-	{ RTM_NEWVLAN,		NETLINK_ROUTE_SOCKET__NLMSG_WRITE },
-	{ RTM_DELVLAN,		NETLINK_ROUTE_SOCKET__NLMSG_WRITE },
-	{ RTM_GETVLAN,		NETLINK_ROUTE_SOCKET__NLMSG_READ  },
-	{ RTM_NEWNEXTHOPBUCKET,	NETLINK_ROUTE_SOCKET__NLMSG_WRITE },
-	{ RTM_DELNEXTHOPBUCKET,	NETLINK_ROUTE_SOCKET__NLMSG_WRITE },
-	{ RTM_GETNEXTHOPBUCKET,	NETLINK_ROUTE_SOCKET__NLMSG_READ  },
-	{ RTM_NEWTUNNEL,	NETLINK_ROUTE_SOCKET__NLMSG_WRITE },
-	{ RTM_DELTUNNEL,	NETLINK_ROUTE_SOCKET__NLMSG_WRITE },
-	{ RTM_GETTUNNEL,	NETLINK_ROUTE_SOCKET__NLMSG_READ  },
+	{ RTM_NEWLINK, NETLINK_ROUTE_SOCKET__NLMSG_WRITE },
+	{ RTM_DELLINK, NETLINK_ROUTE_SOCKET__NLMSG_WRITE },
+	{ RTM_GETLINK, NETLINK_ROUTE_SOCKET__NLMSG_READ },
+	{ RTM_SETLINK, NETLINK_ROUTE_SOCKET__NLMSG_WRITE },
+	{ RTM_NEWADDR, NETLINK_ROUTE_SOCKET__NLMSG_WRITE },
+	{ RTM_DELADDR, NETLINK_ROUTE_SOCKET__NLMSG_WRITE },
+	{ RTM_GETADDR, NETLINK_ROUTE_SOCKET__NLMSG_READ },
+	{ RTM_NEWROUTE, NETLINK_ROUTE_SOCKET__NLMSG_WRITE },
+	{ RTM_DELROUTE, NETLINK_ROUTE_SOCKET__NLMSG_WRITE },
+	{ RTM_GETROUTE, NETLINK_ROUTE_SOCKET__NLMSG_READ },
+	{ RTM_NEWNEIGH, NETLINK_ROUTE_SOCKET__NLMSG_WRITE },
+	{ RTM_DELNEIGH, NETLINK_ROUTE_SOCKET__NLMSG_WRITE },
+	{ RTM_GETNEIGH, NETLINK_ROUTE_SOCKET__NLMSG_READ },
+	{ RTM_NEWRULE, NETLINK_ROUTE_SOCKET__NLMSG_WRITE },
+	{ RTM_DELRULE, NETLINK_ROUTE_SOCKET__NLMSG_WRITE },
+	{ RTM_GETRULE, NETLINK_ROUTE_SOCKET__NLMSG_READ },
+	{ RTM_NEWQDISC, NETLINK_ROUTE_SOCKET__NLMSG_WRITE },
+	{ RTM_DELQDISC, NETLINK_ROUTE_SOCKET__NLMSG_WRITE },
+	{ RTM_GETQDISC, NETLINK_ROUTE_SOCKET__NLMSG_READ },
+	{ RTM_NEWTCLASS, NETLINK_ROUTE_SOCKET__NLMSG_WRITE },
+	{ RTM_DELTCLASS, NETLINK_ROUTE_SOCKET__NLMSG_WRITE },
+	{ RTM_GETTCLASS, NETLINK_ROUTE_SOCKET__NLMSG_READ },
+	{ RTM_NEWTFILTER, NETLINK_ROUTE_SOCKET__NLMSG_WRITE },
+	{ RTM_DELTFILTER, NETLINK_ROUTE_SOCKET__NLMSG_WRITE },
+	{ RTM_GETTFILTER, NETLINK_ROUTE_SOCKET__NLMSG_READ },
+	{ RTM_NEWACTION, NETLINK_ROUTE_SOCKET__NLMSG_WRITE },
+	{ RTM_DELACTION, NETLINK_ROUTE_SOCKET__NLMSG_WRITE },
+	{ RTM_GETACTION, NETLINK_ROUTE_SOCKET__NLMSG_READ },
+	{ RTM_NEWPREFIX, NETLINK_ROUTE_SOCKET__NLMSG_WRITE },
+	{ RTM_GETMULTICAST, NETLINK_ROUTE_SOCKET__NLMSG_READ },
+	{ RTM_GETANYCAST, NETLINK_ROUTE_SOCKET__NLMSG_READ },
+	{ RTM_GETNEIGHTBL, NETLINK_ROUTE_SOCKET__NLMSG_READ },
+	{ RTM_SETNEIGHTBL, NETLINK_ROUTE_SOCKET__NLMSG_WRITE },
+	{ RTM_NEWADDRLABEL, NETLINK_ROUTE_SOCKET__NLMSG_WRITE },
+	{ RTM_DELADDRLABEL, NETLINK_ROUTE_SOCKET__NLMSG_WRITE },
+	{ RTM_GETADDRLABEL, NETLINK_ROUTE_SOCKET__NLMSG_READ },
+	{ RTM_GETDCB, NETLINK_ROUTE_SOCKET__NLMSG_READ },
+	{ RTM_SETDCB, NETLINK_ROUTE_SOCKET__NLMSG_WRITE },
+	{ RTM_NEWNETCONF, NETLINK_ROUTE_SOCKET__NLMSG_WRITE },
+	{ RTM_DELNETCONF, NETLINK_ROUTE_SOCKET__NLMSG_WRITE },
+	{ RTM_GETNETCONF, NETLINK_ROUTE_SOCKET__NLMSG_READ },
+	{ RTM_NEWMDB, NETLINK_ROUTE_SOCKET__NLMSG_WRITE },
+	{ RTM_DELMDB, NETLINK_ROUTE_SOCKET__NLMSG_WRITE },
+	{ RTM_GETMDB, NETLINK_ROUTE_SOCKET__NLMSG_READ },
+	{ RTM_NEWNSID, NETLINK_ROUTE_SOCKET__NLMSG_WRITE },
+	{ RTM_DELNSID, NETLINK_ROUTE_SOCKET__NLMSG_READ },
+	{ RTM_GETNSID, NETLINK_ROUTE_SOCKET__NLMSG_READ },
+	{ RTM_NEWSTATS, NETLINK_ROUTE_SOCKET__NLMSG_READ },
+	{ RTM_GETSTATS, NETLINK_ROUTE_SOCKET__NLMSG_READ },
+	{ RTM_SETSTATS, NETLINK_ROUTE_SOCKET__NLMSG_WRITE },
+	{ RTM_NEWCACHEREPORT, NETLINK_ROUTE_SOCKET__NLMSG_READ },
+	{ RTM_NEWCHAIN, NETLINK_ROUTE_SOCKET__NLMSG_WRITE },
+	{ RTM_DELCHAIN, NETLINK_ROUTE_SOCKET__NLMSG_WRITE },
+	{ RTM_GETCHAIN, NETLINK_ROUTE_SOCKET__NLMSG_READ },
+	{ RTM_NEWNEXTHOP, NETLINK_ROUTE_SOCKET__NLMSG_WRITE },
+	{ RTM_DELNEXTHOP, NETLINK_ROUTE_SOCKET__NLMSG_WRITE },
+	{ RTM_GETNEXTHOP, NETLINK_ROUTE_SOCKET__NLMSG_READ },
+	{ RTM_NEWLINKPROP, NETLINK_ROUTE_SOCKET__NLMSG_WRITE },
+	{ RTM_DELLINKPROP, NETLINK_ROUTE_SOCKET__NLMSG_WRITE },
+	{ RTM_NEWVLAN, NETLINK_ROUTE_SOCKET__NLMSG_WRITE },
+	{ RTM_DELVLAN, NETLINK_ROUTE_SOCKET__NLMSG_WRITE },
+	{ RTM_GETVLAN, NETLINK_ROUTE_SOCKET__NLMSG_READ },
+	{ RTM_NEWNEXTHOPBUCKET, NETLINK_ROUTE_SOCKET__NLMSG_WRITE },
+	{ RTM_DELNEXTHOPBUCKET, NETLINK_ROUTE_SOCKET__NLMSG_WRITE },
+	{ RTM_GETNEXTHOPBUCKET, NETLINK_ROUTE_SOCKET__NLMSG_READ },
+	{ RTM_NEWTUNNEL, NETLINK_ROUTE_SOCKET__NLMSG_WRITE },
+	{ RTM_DELTUNNEL, NETLINK_ROUTE_SOCKET__NLMSG_WRITE },
+	{ RTM_GETTUNNEL, NETLINK_ROUTE_SOCKET__NLMSG_READ },
 };
 
 static const struct nlmsg_perm nlmsg_tcpdiag_perms[] = {
-	{ TCPDIAG_GETSOCK,	NETLINK_TCPDIAG_SOCKET__NLMSG_READ },
-	{ DCCPDIAG_GETSOCK,	NETLINK_TCPDIAG_SOCKET__NLMSG_READ },
-	{ SOCK_DIAG_BY_FAMILY,	NETLINK_TCPDIAG_SOCKET__NLMSG_READ },
-	{ SOCK_DESTROY,		NETLINK_TCPDIAG_SOCKET__NLMSG_WRITE },
+	{ TCPDIAG_GETSOCK, NETLINK_TCPDIAG_SOCKET__NLMSG_READ },
+	{ DCCPDIAG_GETSOCK, NETLINK_TCPDIAG_SOCKET__NLMSG_READ },
+	{ SOCK_DIAG_BY_FAMILY, NETLINK_TCPDIAG_SOCKET__NLMSG_READ },
+	{ SOCK_DESTROY, NETLINK_TCPDIAG_SOCKET__NLMSG_WRITE },
 };
 
 static const struct nlmsg_perm nlmsg_xfrm_perms[] = {
-	{ XFRM_MSG_NEWSA,	NETLINK_XFRM_SOCKET__NLMSG_WRITE },
-	{ XFRM_MSG_DELSA,	NETLINK_XFRM_SOCKET__NLMSG_WRITE },
-	{ XFRM_MSG_GETSA,	NETLINK_XFRM_SOCKET__NLMSG_READ  },
-	{ XFRM_MSG_NEWPOLICY,	NETLINK_XFRM_SOCKET__NLMSG_WRITE },
-	{ XFRM_MSG_DELPOLICY,	NETLINK_XFRM_SOCKET__NLMSG_WRITE },
-	{ XFRM_MSG_GETPOLICY,	NETLINK_XFRM_SOCKET__NLMSG_READ  },
-	{ XFRM_MSG_ALLOCSPI,	NETLINK_XFRM_SOCKET__NLMSG_WRITE },
-	{ XFRM_MSG_ACQUIRE,	NETLINK_XFRM_SOCKET__NLMSG_WRITE },
-	{ XFRM_MSG_EXPIRE,	NETLINK_XFRM_SOCKET__NLMSG_WRITE },
-	{ XFRM_MSG_UPDPOLICY,	NETLINK_XFRM_SOCKET__NLMSG_WRITE },
-	{ XFRM_MSG_UPDSA,	NETLINK_XFRM_SOCKET__NLMSG_WRITE },
-	{ XFRM_MSG_POLEXPIRE,	NETLINK_XFRM_SOCKET__NLMSG_WRITE },
-	{ XFRM_MSG_FLUSHSA,	NETLINK_XFRM_SOCKET__NLMSG_WRITE },
-	{ XFRM_MSG_FLUSHPOLICY,	NETLINK_XFRM_SOCKET__NLMSG_WRITE },
-	{ XFRM_MSG_NEWAE,	NETLINK_XFRM_SOCKET__NLMSG_WRITE },
-	{ XFRM_MSG_GETAE,	NETLINK_XFRM_SOCKET__NLMSG_READ  },
-	{ XFRM_MSG_REPORT,	NETLINK_XFRM_SOCKET__NLMSG_READ  },
-	{ XFRM_MSG_MIGRATE,	NETLINK_XFRM_SOCKET__NLMSG_WRITE },
-	{ XFRM_MSG_NEWSADINFO,	NETLINK_XFRM_SOCKET__NLMSG_READ  },
-	{ XFRM_MSG_GETSADINFO,	NETLINK_XFRM_SOCKET__NLMSG_READ  },
-	{ XFRM_MSG_NEWSPDINFO,	NETLINK_XFRM_SOCKET__NLMSG_WRITE },
-	{ XFRM_MSG_GETSPDINFO,	NETLINK_XFRM_SOCKET__NLMSG_READ  },
-	{ XFRM_MSG_MAPPING,	NETLINK_XFRM_SOCKET__NLMSG_READ  },
-	{ XFRM_MSG_SETDEFAULT,	NETLINK_XFRM_SOCKET__NLMSG_WRITE },
-	{ XFRM_MSG_GETDEFAULT,	NETLINK_XFRM_SOCKET__NLMSG_READ  },
+	{ XFRM_MSG_NEWSA, NETLINK_XFRM_SOCKET__NLMSG_WRITE },
+	{ XFRM_MSG_DELSA, NETLINK_XFRM_SOCKET__NLMSG_WRITE },
+	{ XFRM_MSG_GETSA, NETLINK_XFRM_SOCKET__NLMSG_READ },
+	{ XFRM_MSG_NEWPOLICY, NETLINK_XFRM_SOCKET__NLMSG_WRITE },
+	{ XFRM_MSG_DELPOLICY, NETLINK_XFRM_SOCKET__NLMSG_WRITE },
+	{ XFRM_MSG_GETPOLICY, NETLINK_XFRM_SOCKET__NLMSG_READ },
+	{ XFRM_MSG_ALLOCSPI, NETLINK_XFRM_SOCKET__NLMSG_WRITE },
+	{ XFRM_MSG_ACQUIRE, NETLINK_XFRM_SOCKET__NLMSG_WRITE },
+	{ XFRM_MSG_EXPIRE, NETLINK_XFRM_SOCKET__NLMSG_WRITE },
+	{ XFRM_MSG_UPDPOLICY, NETLINK_XFRM_SOCKET__NLMSG_WRITE },
+	{ XFRM_MSG_UPDSA, NETLINK_XFRM_SOCKET__NLMSG_WRITE },
+	{ XFRM_MSG_POLEXPIRE, NETLINK_XFRM_SOCKET__NLMSG_WRITE },
+	{ XFRM_MSG_FLUSHSA, NETLINK_XFRM_SOCKET__NLMSG_WRITE },
+	{ XFRM_MSG_FLUSHPOLICY, NETLINK_XFRM_SOCKET__NLMSG_WRITE },
+	{ XFRM_MSG_NEWAE, NETLINK_XFRM_SOCKET__NLMSG_WRITE },
+	{ XFRM_MSG_GETAE, NETLINK_XFRM_SOCKET__NLMSG_READ },
+	{ XFRM_MSG_REPORT, NETLINK_XFRM_SOCKET__NLMSG_READ },
+	{ XFRM_MSG_MIGRATE, NETLINK_XFRM_SOCKET__NLMSG_WRITE },
+	{ XFRM_MSG_NEWSADINFO, NETLINK_XFRM_SOCKET__NLMSG_READ },
+	{ XFRM_MSG_GETSADINFO, NETLINK_XFRM_SOCKET__NLMSG_READ },
+	{ XFRM_MSG_NEWSPDINFO, NETLINK_XFRM_SOCKET__NLMSG_WRITE },
+	{ XFRM_MSG_GETSPDINFO, NETLINK_XFRM_SOCKET__NLMSG_READ },
+	{ XFRM_MSG_MAPPING, NETLINK_XFRM_SOCKET__NLMSG_READ },
+	{ XFRM_MSG_SETDEFAULT, NETLINK_XFRM_SOCKET__NLMSG_WRITE },
+	{ XFRM_MSG_GETDEFAULT, NETLINK_XFRM_SOCKET__NLMSG_READ },
 };
 
 static const struct nlmsg_perm nlmsg_audit_perms[] = {
-	{ AUDIT_GET,		NETLINK_AUDIT_SOCKET__NLMSG_READ     },
-	{ AUDIT_SET,		NETLINK_AUDIT_SOCKET__NLMSG_WRITE    },
-	{ AUDIT_LIST,		NETLINK_AUDIT_SOCKET__NLMSG_READPRIV },
-	{ AUDIT_ADD,		NETLINK_AUDIT_SOCKET__NLMSG_WRITE    },
-	{ AUDIT_DEL,		NETLINK_AUDIT_SOCKET__NLMSG_WRITE    },
-	{ AUDIT_LIST_RULES,	NETLINK_AUDIT_SOCKET__NLMSG_READPRIV },
-	{ AUDIT_ADD_RULE,	NETLINK_AUDIT_SOCKET__NLMSG_WRITE    },
-	{ AUDIT_DEL_RULE,	NETLINK_AUDIT_SOCKET__NLMSG_WRITE    },
-	{ AUDIT_USER,		NETLINK_AUDIT_SOCKET__NLMSG_RELAY    },
-	{ AUDIT_SIGNAL_INFO,	NETLINK_AUDIT_SOCKET__NLMSG_READ     },
-	{ AUDIT_TRIM,		NETLINK_AUDIT_SOCKET__NLMSG_WRITE    },
-	{ AUDIT_MAKE_EQUIV,	NETLINK_AUDIT_SOCKET__NLMSG_WRITE    },
-	{ AUDIT_TTY_GET,	NETLINK_AUDIT_SOCKET__NLMSG_READ     },
-	{ AUDIT_TTY_SET,	NETLINK_AUDIT_SOCKET__NLMSG_TTY_AUDIT	},
-	{ AUDIT_GET_FEATURE,	NETLINK_AUDIT_SOCKET__NLMSG_READ     },
-	{ AUDIT_SET_FEATURE,	NETLINK_AUDIT_SOCKET__NLMSG_WRITE    },
+	{ AUDIT_GET, NETLINK_AUDIT_SOCKET__NLMSG_READ },
+	{ AUDIT_SET, NETLINK_AUDIT_SOCKET__NLMSG_WRITE },
+	{ AUDIT_LIST, NETLINK_AUDIT_SOCKET__NLMSG_READPRIV },
+	{ AUDIT_ADD, NETLINK_AUDIT_SOCKET__NLMSG_WRITE },
+	{ AUDIT_DEL, NETLINK_AUDIT_SOCKET__NLMSG_WRITE },
+	{ AUDIT_LIST_RULES, NETLINK_AUDIT_SOCKET__NLMSG_READPRIV },
+	{ AUDIT_ADD_RULE, NETLINK_AUDIT_SOCKET__NLMSG_WRITE },
+	{ AUDIT_DEL_RULE, NETLINK_AUDIT_SOCKET__NLMSG_WRITE },
+	{ AUDIT_USER, NETLINK_AUDIT_SOCKET__NLMSG_RELAY },
+	{ AUDIT_SIGNAL_INFO, NETLINK_AUDIT_SOCKET__NLMSG_READ },
+	{ AUDIT_TRIM, NETLINK_AUDIT_SOCKET__NLMSG_WRITE },
+	{ AUDIT_MAKE_EQUIV, NETLINK_AUDIT_SOCKET__NLMSG_WRITE },
+	{ AUDIT_TTY_GET, NETLINK_AUDIT_SOCKET__NLMSG_READ },
+	{ AUDIT_TTY_SET, NETLINK_AUDIT_SOCKET__NLMSG_TTY_AUDIT },
+	{ AUDIT_GET_FEATURE, NETLINK_AUDIT_SOCKET__NLMSG_READ },
+	{ AUDIT_SET_FEATURE, NETLINK_AUDIT_SOCKET__NLMSG_WRITE },
 };
 
-
-static int nlmsg_perm(u16 nlmsg_type, u32 *perm, const struct nlmsg_perm *tab, size_t tabsize)
+static int nlmsg_perm(u16 nlmsg_type, u32 *perm, const struct nlmsg_perm *tab,
+		      size_t tabsize)
 {
 	unsigned int i;
 	int err = -EINVAL;
 
-	for (i = 0; i < tabsize/sizeof(struct nlmsg_perm); i++)
+	for (i = 0; i < tabsize / sizeof(struct nlmsg_perm); i++)
 		if (nlmsg_type == tab[i].nlmsg_type) {
 			*perm = tab[i].perm;
 			err = 0;
-- 
2.46.1


