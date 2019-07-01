Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 43AD22A111
	for <lists+selinux@lfdr.de>; Sat, 25 May 2019 00:16:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404258AbfEXWQm (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Fri, 24 May 2019 18:16:42 -0400
Received: from 48.23.240.77.static.louhi.net ([77.240.23.48]:36820 "EHLO
        kolttonen.fi" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2404282AbfEXWQm (ORCPT <rfc822;selinux@vger.kernel.org>);
        Fri, 24 May 2019 18:16:42 -0400
Received: from 34-41-5D-CA-59-C7 (176-93-196-243.bb.dnainternet.fi [176.93.196.243])
        (authenticated bits=0)
        by vcust561.louhi.net (8.14.7/8.14.7/0) with ESMTP id x4OMGUpS010839
        (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO)
        for <selinux@vger.kernel.org>; Sat, 25 May 2019 01:16:31 +0300
DKIM-Filter: OpenDKIM Filter v2.11.0 vcust561.louhi.net x4OMGUpS010839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kolttonen.fi;
        s=mail; t=1558736191;
        bh=7lvpfA/Szq1LR4+3RYVw52f1t5fIGVyF88OkoNY25e4=;
        h=Date:From:To:Subject:From;
        b=rbs8MtTnlfgPwXL7ki8ylMOlfhDxtjLXHbBgZWcgQz+Gs+InQ6sxEFD6P3oXuwX3W
         S7tfUh7EVfZpWx9RnTWaJKC+oIKw67bqR9vT1dJ3g759nxMoY+qnYjeK6FtuEJ+Y2C
         29FioEOQESX7QecWO1yMybhAQRvQLrB/pJzakVf7vL1LG6H3aECegrV3/WO5E1VtMJ
         cVuE21qYslKgud3t0NKjEZtOGXQ/8C6+E93T4QguPiZGcE4q4qqFd5+G5wkLWh+aIr
         LHgCPTE/iugecFjg/mDPyXEAPanllk7Y+rRyXWweFSe8i68eXfddm55HL9qhV88vrt
         AhbHzAvpukM3g==
Date:   Sat, 25 May 2019 01:16:38 +0300 (EEST)
From:   =?ISO-8859-15?Q?Jokke_H=E4m=E4l=E4inen?= 
        <jokke.hamalainen@kolttonen.fi>
To:     selinux@vger.kernel.org
Subject: [PATCH]: trivial fix incorrect indentation
Message-ID: <alpine.LFD.2.21.1905250116010.11723@34-41-5D-CA-59-C7>
User-Agent: Alpine 2.21 (LFD 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org


diff --git a/libsepol/src/services.c b/libsepol/src/services.c
index 303a138c..ac229279 100644
--- a/libsepol/src/services.c
+++ b/libsepol/src/services.c
@@ -325,8 +325,8 @@ static char *get_class_info(sepol_security_class_t tclass,
 	while (1) {
 		new_class_buf_len = class_buf_len + EXPR_BUF_SIZE;
 		new_class_buf = realloc(class_buf, new_class_buf_len);
-			if (!new_class_buf)
-				return NULL;
+		if (!new_class_buf)
+			return NULL;
 		class_buf_len = new_class_buf_len;
 		class_buf = new_class_buf;
 		buf_used = 0;
