Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D5EB309BC4
	for <lists+selinux@lfdr.de>; Sun, 31 Jan 2021 13:00:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231598AbhAaLw3 (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Sun, 31 Jan 2021 06:52:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29145 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231530AbhAaLqK (ORCPT
        <rfc822;selinux@vger.kernel.org>); Sun, 31 Jan 2021 06:46:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1612093471;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=hu4hfhClN5l2sVYRZd+zbYi+HUCGDrHy3GXil/KkXdw=;
        b=IXPgq9BoDe4dwOd3Np40dbeAIe1DulXa7ct0HNi+wsvoo5pUuP8F+jpdkkjk5tE7tAKye8
        dwNDXVatra9HZQ/7T0BCxDXr0dLMGZoy5S2qIsigdBhnVCg3eAHq9FLeHt9SZT5zsVxWlR
        VqhX5cOm2CR/IsJkER7+GEdTh7fpg6I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-62-5-8BT1oLPU6GOMztFQ71Sw-1; Sun, 31 Jan 2021 06:03:03 -0500
X-MC-Unique: 5-8BT1oLPU6GOMztFQ71Sw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 31ECB10054FF
        for <selinux@vger.kernel.org>; Sun, 31 Jan 2021 11:03:02 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.40.192.93])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 5DE2B10016FD;
        Sun, 31 Jan 2021 11:03:01 +0000 (UTC)
From:   Petr Lautrbach <plautrba@redhat.com>
To:     selinux@vger.kernel.org
Cc:     Petr Lautrbach <plautrba@redhat.com>
Subject: [PATCH v3] libsemanage: sync filesystem with sandbox
Date:   Sun, 31 Jan 2021 12:02:51 +0100
Message-Id: <20210131110251.300553-1-plautrba@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Commit 331a109f91ea ("libsemanage: fsync final files before rename")
added fsync() for policy files and improved situation when something
unexpected happens right after rename(). However the module store could
be affected as well. After the following steps module files could be 0
size:

1. Run `semanage fcontext -a -t var_t "/tmp/abc"`
2. Force shutdown the server during the command is run, or right after
   it's finished
3. Boot the system and look for empty files:
    # find /var/lib/selinux/targeted/ -type f -size 0 | wc -l
    1266

It looks like this situation can be avoided if the filesystem with the
sandbox is sync()ed before we start to rename() directories in the
store.

Signed-off-by: Petr Lautrbach <plautrba@redhat.com>
---

- syncfs() moved before rename() dance

 libsemanage/src/semanage_store.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/libsemanage/src/semanage_store.c b/libsemanage/src/semanage_store.c
index cd5e46bb2401..c6a736fe2d26 100644
--- a/libsemanage/src/semanage_store.c
+++ b/libsemanage/src/semanage_store.c
@@ -1736,6 +1736,19 @@ static int semanage_commit_sandbox(semanage_handle_t * sh)
 	}
 	close(fd);
 
+	/* sync changes in sandbox to filesystem */
+	fd = open(sandbox, O_DIRECTORY);
+	if (fd == -1) {
+		ERR(sh, "Error while opening %s for syncfs(): %d", sandbox, errno);
+		return -1;
+	}
+	if (syncfs(fd) == -1) {
+		ERR(sh, "Error while syncing %s to filesystem: %d", sandbox, errno);
+		close(fd);
+		return -1;
+	}
+	close(fd);
+
 	retval = commit_number;
 
 	if (semanage_get_active_lock(sh) < 0) {
-- 
2.30.0

