Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49DF5222D1D
	for <lists+selinux@lfdr.de>; Thu, 16 Jul 2020 22:39:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726429AbgGPUjW (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Thu, 16 Jul 2020 16:39:22 -0400
Received: from smtprelay0099.b.hostedemail.com ([64.98.42.99]:39958 "EHLO
        smtprelay.b.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726386AbgGPUjV (ORCPT
        <rfc822;selinux@vger.kernel.org>); Thu, 16 Jul 2020 16:39:21 -0400
Received: from smtprelay.b.hostedemail.com (10.5.19.248.rfc1918.com [10.5.19.248])
        by smtpgrave02.b.hostedemail.com (Postfix) with ESMTP id D96871802937E
        for <selinux@vger.kernel.org>; Thu, 16 Jul 2020 20:29:22 +0000 (UTC)
Received: from filter.hostedemail.com (10.5.19.248.rfc1918.com [10.5.19.248])
        by smtprelay04.b.hostedemail.com (Postfix) with ESMTP id 484F910053779
        for <selinux@vger.kernel.org>; Thu, 16 Jul 2020 20:29:22 +0000 (UTC)
X-Session-Marker: 6D696B6540666C796E2E6F7267
X-Spam-Summary: 2,0,0,,d41d8cd98f00b204,mike@flyn.org,,RULES_HIT:41:152:355:379:800:960:973:988:989:1260:1277:1311:1313:1314:1345:1381:1437:1515:1516:1518:1534:1540:1568:1593:1594:1711:1714:1730:1747:1777:1792:2393:2559:2562:3138:3139:3140:3141:3142:3865:3868:3870:3871:3874:4321:5007:6261:7653:8957:10004:10400:10848:11658:11914:12043:12114:12297:12555:12760:12895:12986:13069:13184:13229:13255:13311:13357:14096:14097:14181:14394:14659:14721:21080:21451:21627:30054,0,RBL:none,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:,MSBL:0,DNSBL:none,Custom_rules:0:0:0,LFtime:5,LUA_SUMMARY:none
X-HE-Tag: show42_150866826f05
X-Filterd-Recvd-Size: 1536
Received: from imp (pool-173-67-42-132.bltmmd.fios.verizon.net [173.67.42.132])
        (Authenticated sender: mike@flyn.org)
        by omf06.b.hostedemail.com (Postfix) with ESMTPA
        for <selinux@vger.kernel.org>; Thu, 16 Jul 2020 20:29:22 +0000 (UTC)
Message-ID: <51d7bd5e067978ea5340ee408a7329e8b921b372.camel@flyn.org>
Subject: [PATCH] python/audit2allow: add #include <limits.h> to
 sepolgen-ifgen-attr-helper.c
From:   "W. Michael Petullo" <mike@flyn.org>
To:     selinux@vger.kernel.org
Date:   Thu, 16 Jul 2020 15:29:20 -0500
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.3 (3.36.3-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

I found that building on OpenWrt/musl failed with:

  sepolgen-ifgen-attr-helper.c:152:16: error: 'PATH_MAX' undeclared ...

Musl is less "generous" than glibc in recursively including header
files, and I suspect this is the reason for this error. Explicitly
including limits.h fixes the problem.

Signed-off-by: W. Michael Petullo <mike@flyn.org>
---
 python/audit2allow/sepolgen-ifgen-attr-helper.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/python/audit2allow/sepolgen-ifgen-attr-helper.c
b/python/audit2allow/sepolgen-ifgen-attr-helper.c
index 53f20818..f010c958 100644
--- a/python/audit2allow/sepolgen-ifgen-attr-helper.c
+++ b/python/audit2allow/sepolgen-ifgen-attr-helper.c
@@ -28,6 +28,7 @@

 #include <selinux/selinux.h>

+#include <limits.h>
 #include <stdio.h>
 #include <sys/types.h>
 #include <sys/stat.h>
-- 
2.26.2

