Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 875861A344
	for <lists+selinux@lfdr.de>; Fri, 10 May 2019 21:02:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728075AbfEJTCo (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Fri, 10 May 2019 15:02:44 -0400
Received: from 48.23.240.77.static.louhi.net ([77.240.23.48]:56178 "EHLO
        kolttonen.fi" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727535AbfEJTCo (ORCPT <rfc822;selinux@vger.kernel.org>);
        Fri, 10 May 2019 15:02:44 -0400
X-Greylist: delayed 2765 seconds by postgrey-1.27 at vger.kernel.org; Fri, 10 May 2019 15:02:40 EDT
Received: from 34-41-5D-CA-59-C7 (176-93-196-243.bb.dnainternet.fi [176.93.196.243])
        (authenticated bits=0)
        by vcust561.louhi.net (8.14.7/8.14.7/0) with ESMTP id x4AIH8B1013589
        (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO)
        for <selinux@vger.kernel.org>; Fri, 10 May 2019 21:17:09 +0300
DKIM-Filter: OpenDKIM Filter v2.11.0 vcust561.louhi.net x4AIH8B1013589
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kolttonen.fi;
        s=mail; t=1557512229;
        bh=erFCaDtiD6YeyGsVMdboBVlvovtyynH+8XgoKvpHsmY=;
        h=Date:From:To:Subject:From;
        b=T2p9dr962tDTn8nPvqBxUJCsykZQSKwhPq55bv92w/dFM3kG3vi1ZJp/jpXI3CD/P
         nfTWEIkqp6TCwufPrno3I2+NSMbF80MmCLhVrtzHS4PxmnZU+U+MQylDSq4p6EOUv8
         lfXqTV0zn+ypyFPSImSzUY25Xt2wge5tSbwpEwIwRn3MUfukRqAoONYJIquyxVRT6x
         E3GdEckWfRdtfisTBcl1MXYeUqYVc9ZtyAdoI6yQkoxdltyfmEeCNHKpayCikMJ/Pi
         flRnqMXy6vTFcn5S8GXRYY8V8QWm/vOOPMBuzRvfDCt81m2+pd+GYlCj2i5dEV0nRe
         JHPto5/AoQ2GA==
Date:   Fri, 10 May 2019 21:17:12 +0300 (EEST)
From:   =?ISO-8859-15?Q?Jokke_H=E4m=E4l=E4inen?= 
        <jokke.hamalainen@kolttonen.fi>
To:     selinux@vger.kernel.org
Subject: [PATCH 2/2] another style fix
Message-ID: <alpine.LFD.2.21.1905102116350.16225@34-41-5D-CA-59-C7>
User-Agent: Alpine 2.21 (LFD 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org



---
 libselinux/utils/matchpathcon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/libselinux/utils/matchpathcon.c b/libselinux/utils/matchpathcon.c
index 9756d7d9..eb39a188 100644
--- a/libselinux/utils/matchpathcon.c
+++ b/libselinux/utils/matchpathcon.c
@@ -25,7 +25,7 @@ static int printmatchpathcon(const char *path, int header, int mode)
 	int rc = matchpathcon(path, mode, &buf);
 	if (rc < 0) {
 		if (errno == ENOENT) {
-			buf=strdup("<<none>>");
+			buf = strdup("<<none>>");
 		} else {
 			fprintf(stderr, "matchpathcon(%s) failed: %s\n", path,
 				strerror(errno));
-- 
2.21.0

