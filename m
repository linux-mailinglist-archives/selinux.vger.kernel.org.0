Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A06A1A6A7E
	for <lists+selinux@lfdr.de>; Mon, 13 Apr 2020 18:55:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732000AbgDMQxa (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Mon, 13 Apr 2020 12:53:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:45690 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731988AbgDMQx1 (ORCPT <rfc822;selinux@vger.kernel.org>);
        Mon, 13 Apr 2020 12:53:27 -0400
Received: from quaco.ghostprotocols.net (unknown [179.97.37.151])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E40622137B;
        Mon, 13 Apr 2020 16:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1586796807;
        bh=9kpEN/lFo7jxjTeW9ri+Y7V19Ly0ojOP0oybPA/ulXo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=AbVaFG4TIM9q3J0Fn0q8sEt6xEb3k/7967jRmoFoVVS6Opuxby9bWRBFpmhFCOb8q
         j0t6fV5QtWQoN98bB2yumokWiQRwbd3sDFZoaMu0yrCC1SVqDl/mB5H98qNwTs5Q8z
         GoNCBKocbwwz9gt9C4raHssA8eHnAzrh2cy4gZ9I=
From:   Arnaldo Carvalho de Melo <acme@kernel.org>
To:     Ingo Molnar <mingo@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>
Cc:     Jiri Olsa <jolsa@kernel.org>, Namhyung Kim <namhyung@kernel.org>,
        Clark Williams <williams@redhat.com>,
        linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
        Alexey Budankov <alexey.budankov@linux.intel.com>,
        James Morris <jamorris@linux.microsoft.com>,
        Alexei Starovoitov <ast@kernel.org>,
        Andi Kleen <ak@linux.intel.com>,
        Igor Lubashev <ilubashe@akamai.com>,
        Jiri Olsa <jolsa@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Serge Hallyn <serge@hallyn.com>,
        Song Liu <songliubraving@fb.com>,
        Stephane Eranian <eranian@google.com>,
        intel-gfx@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-man@vger.kernel.org, linux-security-module@vger.kernel.org,
        selinux@vger.kernel.org, Arnaldo Carvalho de Melo <acme@redhat.com>
Subject: [PATCH 14/26] drivers/oprofile: Open access for CAP_PERFMON privileged process
Date:   Mon, 13 Apr 2020 13:51:51 -0300
Message-Id: <20200413165203.1816-15-acme@kernel.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200413165203.1816-1-acme@kernel.org>
References: <20200413165203.1816-1-acme@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

From: Alexey Budankov <alexey.budankov@linux.intel.com>

Open access to monitoring for CAP_PERFMON privileged process.  Providing
the access under CAP_PERFMON capability singly, without the rest of
CAP_SYS_ADMIN credentials, excludes chances to misuse the credentials
and makes operation more secure.

CAP_PERFMON implements the principle of least privilege for performance
monitoring and observability operations (POSIX IEEE 1003.1e 2.2.2.39
principle of least privilege: A security design principle that states
that a process or program be granted only those privileges (e.g.,
capabilities) necessary to accomplish its legitimate function, and only
for the time that such privileges are actually required)

For backward compatibility reasons access to the monitoring remains open
for CAP_SYS_ADMIN privileged processes but CAP_SYS_ADMIN usage for
secure monitoring is discouraged with respect to CAP_PERFMON capability.

Signed-off-by: Alexey Budankov <alexey.budankov@linux.intel.com>
Acked-by: James Morris <jamorris@linux.microsoft.com>
Cc: Alexei Starovoitov <ast@kernel.org>
Cc: Andi Kleen <ak@linux.intel.com>
Cc: Igor Lubashev <ilubashe@akamai.com>
Cc: Jiri Olsa <jolsa@redhat.com>
Cc: Namhyung Kim <namhyung@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Serge Hallyn <serge@hallyn.com>
Cc: Song Liu <songliubraving@fb.com>
Cc: Stephane Eranian <eranian@google.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: intel-gfx@lists.freedesktop.org
Cc: linux-doc@vger.kernel.org
Cc: linux-man@vger.kernel.org
Cc: linux-security-module@vger.kernel.org
Cc: selinux@vger.kernel.org
Link: http://lore.kernel.org/lkml/691f1096-b15f-9b12-50a0-c2b93918149e@linux.intel.com
Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
---
 drivers/oprofile/event_buffer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/oprofile/event_buffer.c b/drivers/oprofile/event_buffer.c
index 12ea4a4ad607..6c9edc8bbc95 100644
--- a/drivers/oprofile/event_buffer.c
+++ b/drivers/oprofile/event_buffer.c
@@ -113,7 +113,7 @@ static int event_buffer_open(struct inode *inode, struct file *file)
 {
 	int err = -EPERM;
 
-	if (!capable(CAP_SYS_ADMIN))
+	if (!perfmon_capable())
 		return -EPERM;
 
 	if (test_and_set_bit_lock(0, &buffer_opened))
-- 
2.21.1

