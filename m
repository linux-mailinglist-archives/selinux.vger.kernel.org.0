Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 29C9F611E8
	for <lists+selinux@lfdr.de>; Sat,  6 Jul 2019 17:32:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727045AbfGFPcd (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Sat, 6 Jul 2019 11:32:33 -0400
Received: from rgout0502.bt.lon5.cpcloud.co.uk ([65.20.0.223]:9431 "EHLO
        rgout05.bt.lon5.cpcloud.co.uk" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727044AbfGFPcd (ORCPT
        <rfc822;selinux@vger.kernel.org>); Sat, 6 Jul 2019 11:32:33 -0400
X-OWM-Source-IP: 86.147.205.157 (GB)
X-OWM-Env-Sender: richard_c_haines@btinternet.com
X-RazorGate-Vade-Classification: clean
X-RazorGate-Vade-Verdict: clean 0
X-VadeSecure-score: verdict=clean score=0/300, class=clean
X-SNCR-VADESECURE: CLEAN
X-RazorGate-Vade-Verdict: clean 0
X-RazorGate-Vade-Classification: clean
X-RazorGate-Vade: gggruggvucftvghtrhhoucdtuddrgeduvddrfeeigdekkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemuceutffkvffkuffjvffgnffgvefqofdpqfgfvfenuceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomheptfhitghhrghrugcujfgrihhnvghsuceorhhitghhrghruggptggphhgrihhnvghssegsthhinhhtvghrnhgvthdrtghomheqnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepkeeirddugeejrddvtdehrdduheejnecurfgrrhgrmhephhgvlhhopehlohgtrghlhhhoshhtrdhlohgtrghlughomhgrihhnpdhinhgvthepkeeirddugeejrddvtdehrdduheejpdhmrghilhhfrhhomhepoehrihgthhgrrhgupggtpghhrghinhgvshessghtihhnthgvrhhnvghtrdgtohhmqedprhgtphhtthhopeeonhhitgholhgrshdrihhoohhsshesmheggidrohhrgheqpdhrtghpthhtohepoehrihgthhgrrhgupggtpghhrghinhgvshessghtihhnthgvrhhnvghtrdgtohhmqedprhgtphhtthhopeeoshgushesthihtghhohdrnhhsrgdrghhovheqpdhrtghpthhtohepoehsvghlihhnuhigsehvghgvrhdrkhgvrhhnvghlrdhorhhgqedprhgtphhtthhopeeogihunhgthhgrnhhgsehgohhoghhlvgdrtghomheqnecuvehluhhsthgvrhfuihiivgeptd
X-RazorGate-Vade-Classification: clean
X-RazorGate-Vade-Verdict: clean 0
X-VadeSecure-score: verdict=clean score=0/300, class=clean
X-SNCR-VADESECURE: CLEAN
X-RazorGate-Vade-Verdict: clean 0
X-RazorGate-Vade-Classification: clean
X-RazorGate-Vade: gggruggvucftvghtrhhoucdtuddrgeduvddrfeeigdeltdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemuceutffkvffkuffjvffgnffgvefqofdpqfgfvfenuceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomheptfhitghhrghrugcujfgrihhnvghsuceorhhitghhrghruggptggphhgrihhnvghssegsthhinhhtvghrnhgvthdrtghomheqnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepkeeirddugeejrddvtdehrdduheejnecurfgrrhgrmhephhgvlhhopehlohgtrghlhhhoshhtrdhlohgtrghlughomhgrihhnpdhinhgvthepkeeirddugeejrddvtdehrdduheejpdhmrghilhhfrhhomhepoehrihgthhgrrhgupggtpghhrghinhgvshessghtihhnthgvrhhnvghtrdgtohhmqedprhgtphhtthhopeeoshgvlhhinhhugiesvhhgvghrrdhkvghrnhgvlhdrohhrgheqnecuvehluhhsthgvrhfuihiivgeptd
Received: from localhost.localdomain (86.147.205.157) by rgout05.bt.lon5.cpcloud.co.uk (9.0.019.26-1) (authenticated as richard_c_haines@btinternet.com)
        id 5C24804F11ED600D; Sat, 6 Jul 2019 16:21:19 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=btinternet.com; s=btcpcloud; t=1562427153; 
        bh=16nAdZPH0m4oGj/5W1O3EmN/0ou6AnDq1IZrbUpBt+Q=;
        h=From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version;
        b=h18hT1tzbkNTXNh4XOikUddea516kfIcFBh0n0lki5zYrcTrPyBX8qlW35X2qqNMwuMvIfnbVbNKOtNZ5SZyS3qdhccVpiHmVF7ovjWj8LfMErw8kleDQrt851+RNPviU98hk3dps7NatbG4tpzGqq2UgclKVuL3KwhANaiH5zc=
From:   Richard Haines <richard_c_haines@btinternet.com>
To:     selinux@vger.kernel.org, sds@tycho.nsa.gov
Cc:     xunchang@google.com, nicolas.iooss@m4x.org,
        Richard Haines <richard_c_haines@btinternet.com>
Subject: [PATCH V4 0/2] Update restorecon to support new digest scheme
Date:   Sat,  6 Jul 2019 16:21:13 +0100
Message-Id: <20190706152115.8490-1-richard_c_haines@btinternet.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

These patches require [1] and [2] be installed first. They have
been implemented on Android and sent to the selinux list, however their
merge has been deferred. They will install the core hashing of
file_context entries and fix root stem processing.

Patch 1/2 updates selinux_restorecon() replacing the per-mountpoint
security.restorecon_last attribute with a per-directory security.sehash
attribute computed from only those file contexts entries that partially
match the directory. This is to avoid the need to walk the entire tree
when any part of file_contexts changes, limiting relabels to only those
parts of the tree that could have changed.

One change is to add a new selabel_get_digests_all_partial_matches(3)
function that is explained in the man page. This could replace the Android
version of selabel_hash_all_partial_matches(3), that could then be
converted into a local function (The Android team would need to approve).

The patch [3] "selinux-testsuite: Add test for restorecon" will test these
changes.

Patch 1/2 Changes:
V2 Change:
Restore using SELABEL_OPT_DIGEST
V3 Change:
Replace memcpy in get_digests_all_partial_matches() to overcome error
flagged by -D_FORTIFY_SOURCE= when building only libselinux.
V4 Change:
Correctly fix the get_digests_all_partial_matches() memcpy error as pointed
out by Nicolas in [4].

Patch 2/2 Changes:
V2 Change
Keep restorecon(8) and setfiles(8) as they were for compatibility
 
[1] https://lore.kernel.org/selinux/20190311222442.49824-1-xunchang@google.com/
[2] https://lore.kernel.org/selinux/20190417180955.136942-1-xunchang@google.com/
[3] https://lore.kernel.org/selinux/20190603095609.21429-1-richard_c_haines@btinternet.com/
[4] https://lore.kernel.org/selinux/CAJfZ7=nwhZf9RnQ6TXdd-t8Ee-Tin3RjUewYjsad28eCLn+ZxA@mail.gmail.com/

Richard Haines (2):
  libselinux: Save digest of all partial matches for directory
  setfiles: Update utilities for the new digest scheme

 libselinux/include/selinux/label.h            |   5 +
 libselinux/include/selinux/restorecon.h       |  17 +-
 .../selabel_get_digests_all_partial_matches.3 |  70 +++++
 libselinux/man/man3/selinux_restorecon.3      |  81 +++---
 .../man/man3/selinux_restorecon_xattr.3       |   8 +-
 libselinux/src/label.c                        |  15 +
 libselinux/src/label_file.c                   |  51 ++++
 libselinux/src/label_file.h                   |   4 +
 libselinux/src/label_internal.h               |   5 +
 libselinux/src/selinux_restorecon.c           | 271 ++++++++++++------
 libselinux/utils/.gitignore                   |   1 +
 .../selabel_get_digests_all_partial_matches.c | 170 +++++++++++
 policycoreutils/setfiles/restorecon.8         |  10 +-
 policycoreutils/setfiles/restorecon_xattr.8   |  20 +-
 policycoreutils/setfiles/restorecon_xattr.c   |   2 +-
 policycoreutils/setfiles/setfiles.8           |  10 +-
 16 files changed, 580 insertions(+), 160 deletions(-)
 create mode 100644 libselinux/man/man3/selabel_get_digests_all_partial_matches.3
 create mode 100644 libselinux/utils/selabel_get_digests_all_partial_matches.c

-- 
2.21.0

