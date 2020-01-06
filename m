Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 47AFE13174A
	for <lists+selinux@lfdr.de>; Mon,  6 Jan 2020 19:13:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726681AbgAFSNe (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Mon, 6 Jan 2020 13:13:34 -0500
Received: from mail-pf1-f201.google.com ([209.85.210.201]:55330 "EHLO
        mail-pf1-f201.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726622AbgAFSNe (ORCPT
        <rfc822;selinux@vger.kernel.org>); Mon, 6 Jan 2020 13:13:34 -0500
Received: by mail-pf1-f201.google.com with SMTP id 8so35922845pfb.22
        for <selinux@vger.kernel.org>; Mon, 06 Jan 2020 10:13:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=UEDzAmAV9WaLeo9yTDqPSpBCyPNP5d0qczx1NnXY4co=;
        b=mP7El5Q4TtrIfgk9TDJS14F2Eu9vFw0ZDs7c8H76nJtmFN5yjRrLSDguZ60lYkNcDM
         Bkt+gDdPDI5ehXsqcQw3LrmnwYmgN8yKSw+0Q1Rk9nr5Adh1EDI01FsSsxoig0GiXpd7
         IT8yO+IXVVRGuEOamw+VDExxiunDcKNuGPzJEzvkJPSNNWFKizAqD59OhtgfAIHOknXs
         o7ECUMXlpuRUOt1QW5FmLC3hTyDp7kt7Rt9cYyYBnb6d0EWemY0pMCZPgYMGEN44sHj3
         laVOuHXIuo2vbzwWcAkWnfkYmATCv3yyXYVI8kdwoRwBkgr9teI/QL34W2lxjY4j2VZ7
         DYNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=UEDzAmAV9WaLeo9yTDqPSpBCyPNP5d0qczx1NnXY4co=;
        b=SrCRltaIqQV12bRaHMuSrzShnfN7TIkR4VPJKMQOaI4C8e21+j79srWmDS9IvOoI/U
         f/orqTeXKNPV8YdTDvAFhNQXPm9HVLi7ovX836Q+dg8fSez4Afz59AE8MlH3uJ1wUwhy
         3xcS3326U8TGWkeGGruL0U/PGAHLYRJwvJvW3ZQ/7kV5qu1uDBoWgjyeuhdq1ZmB4yWz
         eH/Fn24HQ5bprjvLutng9MpKHl6kgsCe3o+P6SZQDlUqrwzhzaEodfah+OTaYWwhwK1X
         Y1AxOq2sVeNZ9ky9H/4SfKGPbkSyNe1RMhmZv28B5Kj0nQEuJD3tOTMfdEyFno/UKt5N
         IPzQ==
X-Gm-Message-State: APjAAAVzAwuhPNqexSfUI82ts5G36hougTdlQlcxWarxROJUDbNN7OJ1
        f7lGXcEZxEc2lh/ocsXPXaSETNCedYg=
X-Google-Smtp-Source: APXvYqx52b7bUUdO8CftqfX7YMxu6TRCr8DCWWok5+XVBAVJsgPd//2sZgQfRpMyhE1OKDke/Qsdly46i0c=
X-Received: by 2002:a65:6842:: with SMTP id q2mr115275661pgt.345.1578334413511;
 Mon, 06 Jan 2020 10:13:33 -0800 (PST)
Date:   Mon,  6 Jan 2020 10:13:29 -0800
Message-Id: <20200106181329.167322-1-hridya@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.24.1.735.g03f4e72817-goog
Subject: [PATCH] security: selinux: allow per-file labelling for binderfs
From:   Hridya Valsaraju <hridya@google.com>
To:     Paul Moore <paul@paul-moore.com>,
        Stephen Smalley <sds@tycho.nsa.gov>,
        Eric Paris <eparis@parisplace.org>, selinux@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     kernel-team@android.com, Hridya Valsaraju <hridya@google.com>,
        Jeff Vander Stoep <jeffv@google.com>,
        Mark Salyzyn <salyzyn@android.com>
Content-Type: text/plain; charset="UTF-8"
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

This patch allows genfscon per-file labeling for binderfs.
This is required to have separate permissions to allow
access to binder, hwbinder and vndbinder devices which are
relocating to binderfs.

Acked-by: Jeff Vander Stoep <jeffv@google.com>
Acked-by: Mark Salyzyn <salyzyn@android.com>
Signed-off-by: Hridya Valsaraju <hridya@google.com>
---
 security/selinux/hooks.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/security/selinux/hooks.c b/security/selinux/hooks.c
index 116b4d644f68..3f0669a708e9 100644
--- a/security/selinux/hooks.c
+++ b/security/selinux/hooks.c
@@ -752,6 +752,7 @@ static int selinux_set_mnt_opts(struct super_block *sb,
 
 	if (!strcmp(sb->s_type->name, "debugfs") ||
 	    !strcmp(sb->s_type->name, "tracefs") ||
+	    !strcmp(sb->s_type->name, "binderfs") ||
 	    !strcmp(sb->s_type->name, "pstore"))
 		sbsec->flags |= SE_SBGENFS;
 
-- 
2.24.1.735.g03f4e72817-goog

