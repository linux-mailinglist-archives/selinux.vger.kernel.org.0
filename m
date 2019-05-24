Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D827529FE7
	for <lists+selinux@lfdr.de>; Fri, 24 May 2019 22:30:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404102AbfEXUai (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Fri, 24 May 2019 16:30:38 -0400
Received: from 48.23.240.77.static.louhi.net ([77.240.23.48]:34870 "EHLO
        kolttonen.fi" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2403760AbfEXUai (ORCPT <rfc822;selinux@vger.kernel.org>);
        Fri, 24 May 2019 16:30:38 -0400
Received: from 34-41-5D-CA-59-C7 (176-93-196-243.bb.dnainternet.fi [176.93.196.243])
        (authenticated bits=0)
        by vcust561.louhi.net (8.14.7/8.14.7/0) with ESMTP id x4OKUQbE010516
        (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO)
        for <selinux@vger.kernel.org>; Fri, 24 May 2019 23:30:27 +0300
DKIM-Filter: OpenDKIM Filter v2.11.0 vcust561.louhi.net x4OKUQbE010516
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kolttonen.fi;
        s=mail; t=1558729827;
        bh=GPYXk3jUg+PjR5KrVWHewXSzRHe5+AUYbcmiTRno9LE=;
        h=Date:From:To:Subject:From;
        b=q8QqYwHCApfMgg28h6oVU4BzhiT8R1ikzv4FhsMCc1xicJ9MBvM6HHVEJDC2/7qnh
         TJ3cd1vBpGeT4KAEJfUxOAv9cDW+IsRgslDjTKzXdOX7OldBvCL174ft/92eqf6Gjz
         gT+JOqQx/qoeOUhPEZpjt7Nc9Tv9J1NsdnoxFC8D0/PnDQg8GFhhRUvK5Xxga52EgS
         JZeCIHMohFCqEJ/8xd7qRFYWYg4OPFK6G9l+F2LPifYZc56U1lbrFYmOfRZVT4omjK
         H4EKnnJfaolC+sCHIfVHv7/hgLgfkld6JlYPmh+NqT5pvc+fSDMcxYIII9BWJr1zmZ
         +07dmAn8EP7XQ==
Date:   Fri, 24 May 2019 23:30:34 +0300 (EEST)
From:   =?ISO-8859-15?Q?Jokke_H=E4m=E4l=E4inen?= 
        <jokke.hamalainen@kolttonen.fi>
To:     selinux@vger.kernel.org
Subject: [PATCH] remove redundant if
Message-ID: <alpine.LFD.2.21.1905242328001.9911@34-41-5D-CA-59-C7>
User-Agent: Alpine 2.21 (LFD 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org


Check already done earlier with: 

if (yyparse() || policydb_errors)

diff --git a/checkpolicy/parse_util.c b/checkpolicy/parse_util.c
index 9fda5b42..f2809b48 100644
--- a/checkpolicy/parse_util.c
+++ b/checkpolicy/parse_util.c
@@ -69,9 +69,6 @@ int read_source_policy(policydb_t * p, const char *file, const char *progname)
 	}
 	queue_destroy(id_queue);
 
-	if (policydb_errors)
-		return -1;
-
 	fclose(yyin);
 
 	return 0;
