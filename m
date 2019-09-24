Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DAC8CBD2FB
	for <lists+selinux@lfdr.de>; Tue, 24 Sep 2019 21:46:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727322AbfIXTqo (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Tue, 24 Sep 2019 15:46:44 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48882 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726251AbfIXTqo (ORCPT <rfc822;selinux@vger.kernel.org>);
        Tue, 24 Sep 2019 15:46:44 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id EB861309BF16
        for <selinux@vger.kernel.org>; Tue, 24 Sep 2019 19:46:43 +0000 (UTC)
Received: from workstation.redhat.com (ovpn-204-49.brq.redhat.com [10.40.204.49])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 3227F60852;
        Tue, 24 Sep 2019 19:46:43 +0000 (UTC)
From:   Petr Lautrbach <plautrba@redhat.com>
To:     selinux@vger.kernel.org
Cc:     Petr Lautrbach <plautrba@redhat.com>
Subject: [PATCH] Switch last 2 files using /usr/bin/env to /usr/bin/python3
Date:   Tue, 24 Sep 2019 21:46:37 +0200
Message-Id: <20190924194637.248190-1-plautrba@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.45]); Tue, 24 Sep 2019 19:46:43 +0000 (UTC)
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Other python scripts already use python3 by default. Both files don't have exec
bits so they have to be run using python interpret on command line anyway:

    $ python3 ./setup.py ...

Signed-off-by: Petr Lautrbach <plautrba@redhat.com>
---
 libsemanage/src/pywrap-test.py | 2 +-
 python/sepolicy/setup.py       | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/libsemanage/src/pywrap-test.py b/libsemanage/src/pywrap-test.py
index 5ac48f40..f266f700 100644
--- a/libsemanage/src/pywrap-test.py
+++ b/libsemanage/src/pywrap-test.py
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/python3
 from __future__ import print_function
 
 import sys
diff --git a/python/sepolicy/setup.py b/python/sepolicy/setup.py
index 4bd8353d..3633c127 100644
--- a/python/sepolicy/setup.py
+++ b/python/sepolicy/setup.py
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/python3
 
 # Author: Thomas Liu <tliu@redhat.com>
 # Author: Dan Walsh <dwalsh@redhat.com>
-- 
2.23.0

