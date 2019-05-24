Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A024E2A1AB
	for <lists+selinux@lfdr.de>; Sat, 25 May 2019 01:41:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725996AbfEXXlT (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Fri, 24 May 2019 19:41:19 -0400
Received: from 48.23.240.77.static.louhi.net ([77.240.23.48]:38394 "EHLO
        kolttonen.fi" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725816AbfEXXlT (ORCPT <rfc822;selinux@vger.kernel.org>);
        Fri, 24 May 2019 19:41:19 -0400
Received: from 34-41-5D-CA-59-C7 (176-93-196-243.bb.dnainternet.fi [176.93.196.243])
        (authenticated bits=0)
        by vcust561.louhi.net (8.14.7/8.14.7/0) with ESMTP id x4ON3Yrw010958
        (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO)
        for <selinux@vger.kernel.org>; Sat, 25 May 2019 02:03:35 +0300
DKIM-Filter: OpenDKIM Filter v2.11.0 vcust561.louhi.net x4ON3Yrw010958
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kolttonen.fi;
        s=mail; t=1558739015;
        bh=UqQMXem7+aGUSrP+JD8UT/K6CP0l9OnWQWRj0gLOF/A=;
        h=Date:From:To:Subject:From;
        b=xE+Y5RXuLw72tbHwJeQdtbi8v7gEG36HwQUjLHuGI7hQgYBeTZY7rC3TGEZ5gP14A
         arcnWw9vt6yl646mPLf/5rLhQX2LZnpopMIPtWYjB1j/HtLBxfSCTezkkcW7wSpyzh
         RaoKmzoi1iSFZQb0eCDHMhBy1RTqTk4wuy3pm0uROi2IUED6pI221iHLIDlPzlyGrv
         LqTibV9/NaTXt1q4fsZoktamh7C1d4ckphOIPZC0+u/s9MBSrwkO/krhkbxLxumVqk
         6uxXbVUvs+u1yOL3tr88Hnt8pzmvgmWEfeIAgaJb/NQVtuvwGTQMaLOrm/5xip7ac6
         o6MqNBqzQK/Lg==
Date:   Sat, 25 May 2019 02:03:43 +0300 (EEST)
From:   =?ISO-8859-15?Q?Jokke_H=E4m=E4l=E4inen?= 
        <jokke.hamalainen@kolttonen.fi>
To:     selinux@vger.kernel.org
Subject: [PATCH] trivial typo fix
Message-ID: <alpine.LFD.2.21.1905250203050.12535@34-41-5D-CA-59-C7>
User-Agent: Alpine 2.21 (LFD 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org


diff --git a/libsepol/include/sepol/booleans.h b/libsepol/include/sepol/booleans.h
index 2966903d..6bc14c3e 100644
--- a/libsepol/include/sepol/booleans.h
+++ b/libsepol/include/sepol/booleans.h
@@ -26,7 +26,7 @@ extern int sepol_genbools(void *data, size_t len, const char *boolpath);
    Returns 0 upon success or -1 otherwise. */
 extern int sepol_genbools_array(void *data, size_t len,
 				char **names, int *values, int nel);
-/*---------------end compatbility------------*/
+/*---------------end compatibility------------*/
 
 /* Set the specified boolean */
 extern int sepol_bool_set(sepol_handle_t * handle,
