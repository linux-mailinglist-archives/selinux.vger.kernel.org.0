Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 51DCB1007AB
	for <lists+selinux@lfdr.de>; Mon, 18 Nov 2019 15:52:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727185AbfKROwp (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Mon, 18 Nov 2019 09:52:45 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:22548 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726748AbfKROwo (ORCPT
        <rfc822;selinux@vger.kernel.org>); Mon, 18 Nov 2019 09:52:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1574088763;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=DabM93OoheOrEmXg8Syh0emJ+a/qyGvYPkLKHwVWNXY=;
        b=aHBOE56nn0n9sQap0JxVwmO72epByzpwHyxvjaIZqTjR3JZz/VnbIGTYm6KQDtB50Z60rO
        CQzWKVLZrV4pMuXA/q1f7kX041t4mBVd4KQy3UUTU0SBsJf9wyDfVkgo8/sdScDm8K9gMW
        ibp6BLGRwgaeQXMU7Ed4NihbUCaCQqU=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-287-fJIjeJgpO8CuBRKB__YIlA-1; Mon, 18 Nov 2019 09:52:42 -0500
Received: by mail-wr1-f70.google.com with SMTP id l3so15473861wrx.21
        for <selinux@vger.kernel.org>; Mon, 18 Nov 2019 06:52:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tShv3HblVr38GsmOK3QTPK0EcQKV+tukNGauXiaStiw=;
        b=s8t+GL61nZTCoLUFDbsBlnyDkGliH1FHAiZvNRI0+ymkhiNzeUF+JSy6Otk0OJ9I2J
         UJ+oBfSK4AIrdcT5IbcxQZvlq5dBkMikWFUHnFVJdKFc/sqA9lcc3GEhEOcm9UHBVm9G
         QxdkJa+UJy/b0HDGs+9/NBBQ8562FvI5thzOP/JmdtS48vZ/NTplgUiNmwJYD7texneJ
         2liZTjdbIh6kj4iWgaF48bmnkB/BeQ/2dSTUCqQQn6uEfVV1/dSMGEYWj6lQp56EX2Ic
         ooID6Srpkw+qzQKajLEHxuYpWzQC9/QrZkVh06q//RyIQoDG16sCnFrgUustS8/24a5a
         CY2Q==
X-Gm-Message-State: APjAAAWK9jlc2RYJax8S5/EeGVnXfwDdQH22mip5pR4u1qE54Rkd5Zn5
        y1gjAaQcB599FsuuhJGh67jVxzv0F0Aub9DlmPqeD5lAZqsnjAWlADNz4MCULLjZ94EW2B3AuvZ
        Afre9Say2hfZEr0cLBQ==
X-Received: by 2002:adf:978c:: with SMTP id s12mr29733422wrb.47.1574088760786;
        Mon, 18 Nov 2019 06:52:40 -0800 (PST)
X-Google-Smtp-Source: APXvYqwVg6Z6Imu0cyzMhC7Mt7Eo1AAo2oiq/nu0GK1+vnNxECAxpLclsP74A0Piw4OlLHqfU3TcvA==
X-Received: by 2002:adf:978c:: with SMTP id s12mr29733405wrb.47.1574088760565;
        Mon, 18 Nov 2019 06:52:40 -0800 (PST)
Received: from localhost.localdomain.com (nat-pool-brq-t.redhat.com. [213.175.37.10])
        by smtp.gmail.com with ESMTPSA id o5sm23044658wrx.15.2019.11.18.06.52.39
        for <selinux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2019 06:52:40 -0800 (PST)
From:   Ondrej Mosnacek <omosnace@redhat.com>
To:     selinux@vger.kernel.org
Subject: [PATCH testsuite v4 2/3] policy: add fallbacks for Fedora-specific macros
Date:   Mon, 18 Nov 2019 15:52:37 +0100
Message-Id: <20191118145238.408124-3-omosnace@redhat.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191118145238.408124-1-omosnace@redhat.com>
References: <20191118145238.408124-1-omosnace@redhat.com>
MIME-Version: 1.0
X-MC-Unique: fJIjeJgpO8CuBRKB__YIlA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

dev_rw_infiniband_dev() and mount_rw_pid_files() are not defined in
refpolicy. Fall back to dev_rw_generic_{blk|chr}_files() and
mount_rw_runtime_files() if they are not defined.

Also, userdom_search_admin_dir() is not defined in refpolicy because it
doesn't have admin_home_t. Fall back to
userdom_search_user_home_content(), which should apply for root's home
directory under refpolicy.

Signed-off-by: Ondrej Mosnacek <omosnace@redhat.com>
---
 policy/test_policy.if | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/policy/test_policy.if b/policy/test_policy.if
index 939cd7e..e1175e8 100644
--- a/policy/test_policy.if
+++ b/policy/test_policy.if
@@ -60,3 +60,25 @@ interface(`userdom_sysadm_entry_spec_domtrans_to',`
         allow $1 sysadm_t:process sigchld;
 ')
 ')
+
+# Workarounds for refpolicy:
+
+ifdef(`dev_rw_infiniband_dev', `', ` dnl
+interface(`dev_rw_infiniband_dev', `
+    dev_rw_generic_blk_files($1)
+    dev_rw_generic_chr_files($1)
+')
+')
+
+ifdef(`mount_rw_pid_files', `', ` dnl
+interface(`mount_rw_pid_files', `
+    mount_rw_runtime_files($1)
+')
+')
+
+# Refpolicy doesn't have admin_home_t - assume /root will be user_home_dir=
_t.
+ifdef(`userdom_search_admin_dir', `', ` dnl
+interface(`userdom_search_admin_dir', `
+    userdom_search_user_home_content($1)
+')
+')
--=20
2.23.0

