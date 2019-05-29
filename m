Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EA7DA2E1BE
	for <lists+selinux@lfdr.de>; Wed, 29 May 2019 17:56:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726330AbfE2P4U (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Wed, 29 May 2019 11:56:20 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52782 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726240AbfE2P4U (ORCPT <rfc822;selinux@vger.kernel.org>);
        Wed, 29 May 2019 11:56:20 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id E50F36EB99
        for <selinux@vger.kernel.org>; Wed, 29 May 2019 15:56:19 +0000 (UTC)
Received: from workstation.redhat.com (ovpn-204-164.brq.redhat.com [10.40.204.164])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 29C525C706;
        Wed, 29 May 2019 15:56:18 +0000 (UTC)
From:   Petr Lautrbach <plautrba@redhat.com>
To:     selinux@vger.kernel.org
Cc:     Petr Lautrbach <plautrba@redhat.com>
Subject: [selinux.wiki] Mention Signed-off-by in Contributing.md
Date:   Wed, 29 May 2019 17:56:07 +0200
Message-Id: <20190529155607.3849-1-plautrba@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]); Wed, 29 May 2019 15:56:19 +0000 (UTC)
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Signed-off-by: Petr Lautrbach <plautrba@redhat.com>
---

Currently Signed-of-by line is not mentioned anywhere.

The same CONTRIBUTING file should be also directly in sources.

 Contributing.md | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Contributing.md b/Contributing.md
index 9a798b2..0240e7e 100644
--- a/Contributing.md
+++ b/Contributing.md
@@ -46,6 +46,7 @@ patches, please follow these guidelines:
 -   Patches should apply with -p1
 -   Must apply against HEAD of the master branch
 -   Separate large patches into logical patches
+-   Patch descriptions must end with your "Signed-off-by" line. This means your code meets the [Developer's certificate of origin](https://developercertificate.org/).
 
 When adding new, large features or tools it is best to discuss the
 design on the mailing list prior to submitting the patch.
-- 
2.22.0.rc1

