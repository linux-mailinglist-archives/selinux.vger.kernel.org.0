Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72AEF25ABF8
	for <lists+selinux@lfdr.de>; Wed,  2 Sep 2020 15:22:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726183AbgIBNVo (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Wed, 2 Sep 2020 09:21:44 -0400
Received: from mailomta10-sa.btinternet.com ([213.120.69.16]:38368 "EHLO
        sa-prd-fep-043.btinternet.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726377AbgIBNSk (ORCPT
        <rfc822;selinux@vger.kernel.org>); Wed, 2 Sep 2020 09:18:40 -0400
Received: from sa-prd-rgout-003.btmx-prd.synchronoss.net ([10.2.38.6])
          by sa-prd-fep-043.btinternet.com with ESMTP
          id <20200902131742.EEBP26847.sa-prd-fep-043.btinternet.com@sa-prd-rgout-003.btmx-prd.synchronoss.net>;
          Wed, 2 Sep 2020 14:17:42 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=btinternet.com; s=btmx201904; t=1599052662; 
        bh=iGn7yGQeO9TtNGCoCiElldA9u1nXjzFWjuLAb4LSiwo=;
        h=From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version;
        b=PEG+2lIOKYxKV9u7MVokm37YtUtuOmObTgzZ6tsHi5dHjhpCymJWDlAp29JXjPL6VxqpNfA/98NU7+P8ewzMZgOU0qEmpAU3f2ybyFO8frZIIwEpX09Mj5Vrpng3jiHO2hBSXioGJqTAqpRHHp8HdC3Me9E0F4NUSiTlUHjRM+m7B3K1OnEfeHmc6jyMSwLH4LuspLgPBxRyvneJonRug3D3NCg+gJKgSq61kx8GMF7Iuudl+ZeTg00xHQguCTbUohEWN07x5uiCUfmVIpQAPmos+U9dFEK4rEYKuV8axR+bNsa3rpQTZcp9TMuvTSOZp/YOv71yZfvSuVKs1ThNrw==
Authentication-Results: btinternet.com;
    auth=pass (PLAIN) smtp.auth=richard_c_haines@btinternet.com
X-Originating-IP: [109.155.32.197]
X-OWM-Source-IP: 109.155.32.197 (GB)
X-OWM-Env-Sender: richard_c_haines@btinternet.com
X-VadeSecure-score: verdict=clean score=0/300, class=clean
X-RazorGate-Vade: gggruggvucftvghtrhhoucdtuddrgeduiedrudefledgieefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuueftkffvkffujffvgffngfevqffopdfqfgfvnecuuegrihhlohhuthemuceftddunecunecujfgurhephffvufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeftihgthhgrrhguucfjrghinhgvshcuoehrihgthhgrrhgupggtpghhrghinhgvshessghtihhnthgvrhhnvghtrdgtohhmqeenucggtffrrghtthgvrhhnpeelteffgeevveejheevhfetgfeuveduteetuddtffdvjeekieetgeehveefjedtfeenucfkphepuddtledrudehhedrfedvrdduleejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehhvghloheplhhotggrlhhhohhsthdrlhhotggrlhguohhmrghinhdpihhnvghtpedutdelrdduheehrdefvddrudeljedpmhgrihhlfhhrohhmpeeorhhitghhrghruggptggphhgrihhnvghssegsthhinhhtvghrnhgvthdrtghomheqpdhrtghpthhtohepoehprghulhesphgruhhlqdhmohhorhgvrdgtohhmqedprhgtphhtthhopeeorhhitghhrghruggptggphhgrihhnvghssegsthhinhhtvghrnhgvthdrtghomhequcfqtfevrffvpehrfhgtkedvvdenrhhitghhrghruggptggphhgrihhnvghssegsthhinhhtvghrnhgvthdrtghomhdprhgtphhtthhopeeoshgvlhhinhhugiesvhhgvghrrdhkvghrnhgvlhdrohhrgheq
X-RazorGate-Vade-Verdict: clean 0
X-RazorGate-Vade-Classification: clean
X-SNCR-hdrdom: btinternet.com
Received: from localhost.localdomain (109.155.32.197) by sa-prd-rgout-003.btmx-prd.synchronoss.net (5.8.340) (authenticated as richard_c_haines@btinternet.com)
        id 5ED9AFBE0EF36B33; Wed, 2 Sep 2020 14:17:42 +0100
From:   Richard Haines <richard_c_haines@btinternet.com>
To:     paul@paul-moore.com, selinux@vger.kernel.org
Cc:     Richard Haines <richard_c_haines@btinternet.com>
Subject: [PATCH 00/13] SELinux Notebook: Convert batch 2 to markdown
Date:   Wed,  2 Sep 2020 14:17:25 +0100
Message-Id: <20200902131738.18425-1-richard_c_haines@btinternet.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Converted to Markdown or just tidy up formatting. Added TOC to aid
navigation where required.
No text changes.

Richard Haines (13):
  libselinux_functions: Convert to markdown
  mac: Tidy formatting
  modular_policy_statements: Convert to markdown
  network_statements: Convert to markdown
  network_support: Convert to markdown
  objects: Convert to markdown
  pam_login: Convert to markdown
  policy_config_statements: Convert to markdown
  policy_languages: Tidy up
  policy_store_config_files: Add TOC and tidy up formatting
  polyinstantiation: Convert to markdown
  rbac: Minor format fix
  role_statements: Convert to markdown

 src/libselinux_functions.md      | 2179 +++++++++++++++---------------
 src/mac.md                       |   34 +-
 src/modular_policy_statements.md |  229 ++--
 src/network_statements.md        |  261 ++--
 src/network_support.md           |  270 ++--
 src/objects.md                   |  185 +--
 src/pam_login.md                 |  107 +-
 src/policy_config_statements.md  |   54 +-
 src/policy_languages.md          |   26 +-
 src/policy_store_config_files.md |  432 +++---
 src/polyinstantiation.md         |  108 +-
 src/rbac.md                      |    2 +-
 src/role_statements.md           |  443 +++---
 13 files changed, 2109 insertions(+), 2221 deletions(-)

-- 
2.26.2

