Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA6FA227EBD
	for <lists+selinux@lfdr.de>; Tue, 21 Jul 2020 13:25:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729663AbgGULZ0 (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Tue, 21 Jul 2020 07:25:26 -0400
Received: from agnus.defensec.nl ([80.100.19.56]:55966 "EHLO agnus.defensec.nl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728108AbgGULZ0 (ORCPT <rfc822;selinux@vger.kernel.org>);
        Tue, 21 Jul 2020 07:25:26 -0400
Received: from localhost.localdomain (brutus.lan [IPv6:2001:985:d55d::438])
        by agnus.defensec.nl (Postfix) with ESMTPSA id 9ACB92A06FB;
        Tue, 21 Jul 2020 13:25:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 agnus.defensec.nl 9ACB92A06FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=defensec.nl;
        s=default; t=1595330724;
        bh=R7iJGKyfIktmJDn4802TaMNUxl/yKacHWN12Ubnk0+k=;
        h=From:To:Cc:Subject:Date:From;
        b=mBqNYxDwGSTKsdVNoX7VUs1FboKwne+uxYZRzsUjz+EHQ4OcusP1Cepgmfgv7Wdrj
         fyYCdfyOsaVC7zXUZw/+EgBtV1diX/X9PERPlqw78cF2rYedcFyYhTYZwqlfXHnjRx
         wMxUXhAr0v+GpIHNRn47uGoZY1NK7glVLTL93CN8=
From:   Dominick Grift <dominick.grift@defensec.nl>
To:     selinux@vger.kernel.org
Cc:     Dominick Grift <dominick.grift@defensec.nl>
Subject: [PATCH] policycoreutils: fix inaccurate description in sestatus
Date:   Tue, 21 Jul 2020 13:25:12 +0200
Message-Id: <20200721112512.1906547-1-dominick.grift@defensec.nl>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

strdup(selinux_policy_root()) does not return a path that can be used to derive "Loaded policy name"
instead if returns a path that can be used to derive "Policy name from config file".

Signed-off-by: Dominick Grift <dominick.grift@defensec.nl>
---
 policycoreutils/sestatus/sestatus.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/policycoreutils/sestatus/sestatus.c b/policycoreutils/sestatus/sestatus.c
index b37f0353..8b03b028 100644
--- a/policycoreutils/sestatus/sestatus.c
+++ b/policycoreutils/sestatus/sestatus.c
@@ -268,7 +268,7 @@ int main(int argc, char **argv)
 	free(root_path);
 
 	/* Dump all the path information */
-	printf_tab("Loaded policy name:");
+	printf_tab("Policy name from config file:");
 	pol_path = strdup(selinux_policy_root());
 	if (pol_path) {
 		pol_name = basename(pol_path);
-- 
2.27.0

