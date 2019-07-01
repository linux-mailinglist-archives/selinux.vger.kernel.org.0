Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B3CD429F91
	for <lists+selinux@lfdr.de>; Fri, 24 May 2019 22:07:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391738AbfEXUHm (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Fri, 24 May 2019 16:07:42 -0400
Received: from 48.23.240.77.static.louhi.net ([77.240.23.48]:34498 "EHLO
        kolttonen.fi" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2391612AbfEXUHm (ORCPT <rfc822;selinux@vger.kernel.org>);
        Fri, 24 May 2019 16:07:42 -0400
Received: from 34-41-5D-CA-59-C7 (176-93-196-243.bb.dnainternet.fi [176.93.196.243])
        (authenticated bits=0)
        by vcust561.louhi.net (8.14.7/8.14.7/0) with ESMTP id x4OK7Uwv010486
        (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO)
        for <selinux@vger.kernel.org>; Fri, 24 May 2019 23:07:30 +0300
DKIM-Filter: OpenDKIM Filter v2.11.0 vcust561.louhi.net x4OK7Uwv010486
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kolttonen.fi;
        s=mail; t=1558728451;
        bh=aT83EvKp0LFPPIGwpBYix3PVcuIP9FWmvkmtFlNudxg=;
        h=Date:From:To:Subject:From;
        b=QTvxPMExYGCsp6JTciHtzoFRhBTY2EuNA6M0Ux9nCuD1wSprYxZEzRMLIy+0aYSxu
         rDW23LqKWhzXNh2RDC23P7yWLog2znlxlmyidRbBw13w13WkxjOnHdmW4OlGVnDDXY
         SjpYYjX/RFq6IgHtCcOX020EndgrkzW3CfNa23sawoBVxMmGq97dwaiU3jsakM840Z
         aCadaV9tskRML6RcULVwBhzJwIin1y5p0yToNXbv8pHPHVVv9TM01R/LOy5dnnsY5d
         d9o9yJjA1Bu6fRysuwR6IYpK5Fiy7mhNJjlzuZakaetjbdY3bwIVDEZk3TVnJa9KOM
         TIU8B6IYJlgrA==
Date:   Fri, 24 May 2019 23:07:38 +0300 (EEST)
From:   =?ISO-8859-15?Q?Jokke_H=E4m=E4l=E4inen?= 
        <jokke.hamalainen@kolttonen.fi>
To:     selinux@vger.kernel.org
Subject: [PATCH] trivial: remove unneeded int
Message-ID: <alpine.LFD.2.21.1905242306150.9521@34-41-5D-CA-59-C7>
User-Agent: Alpine 2.21 (LFD 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org


diff --git a/libsepol/src/context.c b/libsepol/src/context.c
index a88937fc..e81b28c6 100644
--- a/libsepol/src/context.c
+++ b/libsepol/src/context.c
@@ -38,7 +38,6 @@ int context_is_valid(const policydb_t * p, const context_struct_t * c)
 	role_datum_t *role;
 	user_datum_t *usrdatum;
 	ebitmap_t types, roles;
-	int ret = 1;
 
 	ebitmap_init(&types);
 	ebitmap_init(&roles);
@@ -75,7 +74,7 @@ int context_is_valid(const policydb_t * p, const context_struct_t * c)
 	if (!mls_context_isvalid(p, c))
 		return 0;
 
-	return ret;
+	return 1;
 }
 
 /*
