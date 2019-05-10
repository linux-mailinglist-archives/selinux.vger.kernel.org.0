Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ED45E1A343
	for <lists+selinux@lfdr.de>; Fri, 10 May 2019 21:02:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728074AbfEJTCm (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Fri, 10 May 2019 15:02:42 -0400
Received: from 48.23.240.77.static.louhi.net ([77.240.23.48]:56178 "EHLO
        kolttonen.fi" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727535AbfEJTCm (ORCPT <rfc822;selinux@vger.kernel.org>);
        Fri, 10 May 2019 15:02:42 -0400
X-Greylist: delayed 2765 seconds by postgrey-1.27 at vger.kernel.org; Fri, 10 May 2019 15:02:40 EDT
Received: from 34-41-5D-CA-59-C7 (176-93-196-243.bb.dnainternet.fi [176.93.196.243])
        (authenticated bits=0)
        by vcust561.louhi.net (8.14.7/8.14.7/0) with ESMTP id x4AIIcgl013605
        (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO)
        for <selinux@vger.kernel.org>; Fri, 10 May 2019 21:18:39 +0300
DKIM-Filter: OpenDKIM Filter v2.11.0 vcust561.louhi.net x4AIIcgl013605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kolttonen.fi;
        s=mail; t=1557512319;
        bh=9mTgzrVyc6W8yzazdzTBIq4ME79EYkNtWv9nLT8tNwM=;
        h=Date:From:To:Subject:From;
        b=W/nKo1n3eeufZCUX9EcqeltZCo+6oUPEtGgVEAcaP62enEh7ABMIJ317yhayi80o3
         Sjc8bUkcjzo3o7VL4X+8mSJoZEMgbCueEWR4bCq/n9bhVbXmFTKRNLZZhgZ6Eil4KA
         FJrJKUVJwf/XolmPqbZK0SDcJVbWkwpqH36wXmr3l+4tImsUbBHSj0SnldkwteJHvZ
         Ko4Grc/RD3OYiRyH2JG4izFR64Hm3oRsVlvAPPKwnhzNhllOCprb5+vuEyKJelEtQF
         /nXpiDKcTtTU3eVEuUfFtVdHtsA00ESJGD6jBi/ykmg9lQwRZffTMLK7DyCxyO9Q3i
         nT1zJR7MUz9Tg==
Date:   Fri, 10 May 2019 21:18:41 +0300 (EEST)
From:   =?ISO-8859-15?Q?Jokke_H=E4m=E4l=E4inen?= 
        <jokke.hamalainen@kolttonen.fi>
To:     selinux@vger.kernel.org
Subject: [PATCH] Check strdup() failure
Message-ID: <alpine.LFD.2.21.1905102118010.16225@34-41-5D-CA-59-C7>
User-Agent: Alpine 2.21 (LFD 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org



---
 libselinux/utils/getconlist.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/libselinux/utils/getconlist.c b/libselinux/utils/getconlist.c
index 5ac0ca85..29c16640 100644
--- a/libselinux/utils/getconlist.c
+++ b/libselinux/utils/getconlist.c
@@ -27,6 +27,11 @@ int main(int argc, char **argv)
 		switch (opt) {
 		case 'l':
 			level = strdup(optarg);
+			if (!level) {
+				fprintf(stderr, "memory allocation failure: %d(%s)\n",
+					errno, strerror(errno));
+				return 3;
+			}
 			break;
 		default:
 			usage(argv[0], "invalid option", 1);
-- 
2.21.0

