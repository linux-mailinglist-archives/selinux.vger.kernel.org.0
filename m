Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BE909BBE5F
	for <lists+selinux@lfdr.de>; Tue, 24 Sep 2019 00:16:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391232AbfIWWQA (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Mon, 23 Sep 2019 18:16:00 -0400
Received: from mail-qt1-f173.google.com ([209.85.160.173]:37744 "EHLO
        mail-qt1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388785AbfIWWP7 (ORCPT
        <rfc822;selinux@vger.kernel.org>); Mon, 23 Sep 2019 18:15:59 -0400
Received: by mail-qt1-f173.google.com with SMTP id d2so19158994qtr.4
        for <selinux@vger.kernel.org>; Mon, 23 Sep 2019 15:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
        h=from:subject:to:date:message-id:user-agent:mime-version
         :content-transfer-encoding;
        bh=R5YlqEucYmrutKn87cCwwNAQ+yAvm6WS+4hkzruBZlI=;
        b=RiRB0u21rlXb4YzyXGauQ0KIcUBrWFGofu1di5URrnf5dTdDjrfn+q3Ye6DGV6+S5f
         GLGkZC8Kg4XAVnaO4g0xEOX1aJGnrpbT9/8UYSgngywpQNesEQux2EShzdbBmqoey4hn
         AQeoE9xQerMSEtkMEQrSIwjSfRnyDnYhrVi/hurLuw+qVPtjb6YTvYSlk/Si5L8nwNQ1
         Pi544fLs2DH09Hg5bVMQcwdy0uR/+vfeflNo4kcY9BeMEEGLGtB4Yvk/6qc+z02JGRyt
         fOyxP3S90lswaODetkJslGIKLBBPFNQVml3MWIM5DW/RhqxXx/x9eLy9Pl97VqKV9nNb
         MIbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:date:message-id:user-agent
         :mime-version:content-transfer-encoding;
        bh=R5YlqEucYmrutKn87cCwwNAQ+yAvm6WS+4hkzruBZlI=;
        b=pKztIaScYB9VSw/M/nY2i2ky2DWz+95tVkNwTrfLGq0ayRpMJ4V2eq0rl9AWzYnvBw
         Zw8IISsvlMaO7cvbB0IQQ2hs404WamZp7T/s+b6f9bnrw95teeWz+KbqSVFWdy+TYSmK
         puP1Vj2n3ssGHJqBawvVh7p1jxJo1STHXBA0s6TAaCrIt/vHecojJVt1krFP8tz86byp
         HP6VfPeToL7U0vI3ztIRJh6CadyEBc4NfQxRx7KICIxovJDOqf8LEhDz/hi6JJbeCMe4
         BJV8YvryzWUbPF3zVP7rZnfrqE7Ff/L9wUMB4OFV+EADL+7StNk2zX0GKxkTOwUsg6LC
         yIsw==
X-Gm-Message-State: APjAAAULGUvtkzb1ArBs/t4K08axdC/zELdPqJG6U0QGk0rPx2tDlmHV
        hmR9hatuATpa7LsrjcQ/Dog0ZhhzTg==
X-Google-Smtp-Source: APXvYqw/bxgYwPIiEoKN0hnIbMXSVe1K+D3P59SctmNXk6UEGwQ9WXejTi2pKXvvcPLLqEBVz74EWA==
X-Received: by 2002:a0c:f787:: with SMTP id s7mr1381300qvn.221.1569276958132;
        Mon, 23 Sep 2019 15:15:58 -0700 (PDT)
Received: from localhost (static-96-233-112-89.bstnma.ftas.verizon.net. [96.233.112.89])
        by smtp.gmail.com with ESMTPSA id 139sm6241062qkf.14.2019.09.23.15.15.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Sep 2019 15:15:57 -0700 (PDT)
From:   Paul Moore <paul@paul-moore.com>
X-Google-Original-From: Paul Moore <pmoore2@cisco.com>
Subject: [PATCH 0/2] selinux-testsuite: fix perltidy in Travis CI
To:     selinux@vger.kernel.org
Date:   Mon, 23 Sep 2019 18:15:56 -0400
Message-ID: <156927687193.621177.11371002337716273956.stgit@chester>
User-Agent: StGit/0.19-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

A small patchset that fixes perltidy on Travis CI (Ubuntu 16.04 LTS)
by building a local version of perltidy using the current upstream
which is shipped with most modern distros.

---

Paul Moore (2):
      selinux-testsuite: use our own version of perltidy in the Travis CI tests
      selinux-testsuite: apply perltidy fixes


 .travis.yml                   |    9 ++++++++-
 tests/infiniband_endport/test |    2 +-
 tests/infiniband_pkey/test    |    2 +-
 3 files changed, 10 insertions(+), 3 deletions(-)
