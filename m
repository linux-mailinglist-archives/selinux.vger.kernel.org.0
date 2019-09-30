Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5575CC1F85
	for <lists+selinux@lfdr.de>; Mon, 30 Sep 2019 12:48:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730822AbfI3Ks6 (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Mon, 30 Sep 2019 06:48:58 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:52723 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1730629AbfI3Ks6 (ORCPT
        <rfc822;selinux@vger.kernel.org>); Mon, 30 Sep 2019 06:48:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1569840537;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=D5WnSw4E4mBZcAc1MVnqKEtF9zBywlJOmxVMcKWLQ/g=;
        b=LPLukUkLv1pXZSssirczETUU2k3yqJLdXdrXDTQ876KM670y+fC4xGM2d/FTGxHiP4EymT
        1DDdH7COO9hC2JF2N3jg+ZSCRkpOwseRhFQeBHcd49/NUoxADuKoIa3Cs8A7zZxTp5QOiB
        42i6CmyW5TTVfaLgy/lfflNZyh7tEhk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-243-yKnI9lfNPdiliQuK65PUUw-1; Mon, 30 Sep 2019 06:48:55 -0400
Received: by mail-wr1-f70.google.com with SMTP id h6so4327022wrh.6
        for <selinux@vger.kernel.org>; Mon, 30 Sep 2019 03:48:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=99PVVOe2ztmYixphvfaHVYPNsSUapX5KMlI4L/Mxq0I=;
        b=NHN0GJQm5z0NvNaFPqQsbwIsvT68gIHHFRDt7PuXbuQacaLxcmpShAqHoTibgra0kc
         UNG6o7N6xZQbgPlzBlU89O8c8+cbD1KsRgkGvBSX/nQ2lboTzYR23JPTBg+vrBp/7ENW
         WLi8bymZM30lLtxVvqfWziCY2nWwi7acgVaYziO33ybj5M4vZ6lLR1wSgHzCGgdQs+sq
         ifkkjtxXtwdTlopetyBkstMRfLLwImU/KTTHcemFzE3mq6Dqnjl/oiL2L0zYSVOUlCK+
         jA29cJ0eNMpPeKbxXu5WZf13SLwo/ZhS3iALKRgdTZV314CFZNpSESfjxp5aIENevSdv
         s3WA==
X-Gm-Message-State: APjAAAWavomuVgATWX6saofCR/N/NMlBxqGsk0V5EAnmtBfvYIMHiMKx
        SZskVSNGQIzEb4URTJ0ZX6WR6atxvorYbOdsGcoDVU6vvTI4LsRbkt2w8TgLRF0wHE2jwog6kBw
        O3rzQrBUN0+Lo8d66nA==
X-Received: by 2002:adf:db83:: with SMTP id u3mr10364105wri.36.1569840533897;
        Mon, 30 Sep 2019 03:48:53 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw7+mW3nteLyBWTzBPD5tVUV/SUI3jjtdGrAmBSYbNpRpqhATZCPEgDQtxJLfJ6o6m9x8IRbw==
X-Received: by 2002:adf:db83:: with SMTP id u3mr10364091wri.36.1569840533659;
        Mon, 30 Sep 2019 03:48:53 -0700 (PDT)
Received: from localhost.localdomain.com (nat-pool-brq-t.redhat.com. [213.175.37.10])
        by smtp.gmail.com with ESMTPSA id i73sm27081254wmg.33.2019.09.30.03.48.52
        for <selinux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2019 03:48:52 -0700 (PDT)
From:   Ondrej Mosnacek <omosnace@redhat.com>
To:     selinux@vger.kernel.org
Subject: [PATCH testsuite 0/3] Fix refpolicy build & build test_policy.pp in Travis
Date:   Mon, 30 Sep 2019 12:48:47 +0200
Message-Id: <20190930104850.5482-1-omosnace@redhat.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-MC-Unique: yKnI9lfNPdiliQuK65PUUw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

This series fixes the remaining test_policy.pp build errors under
refpolicy and enables building the test policy under both Fedora policy
and refpolicy in Travis CI.

Ondrej Mosnacek (3):
  policy: consolidate macros for home dirs access
  policy: add fallbacks for Fedora-specific macros
  travis: test building the test policy package

 .travis.yml                         | 24 ++++++++++++++++++--
 policy/test_overlayfs.te            |  6 ++---
 policy/test_policy.if               | 23 +++++++++++++++++--
 travis-ci/enable-policy.sh          | 10 +++++++++
 travis-ci/setup-policy-fedora.sh    | 35 +++++++++++++++++++++++++++++
 travis-ci/setup-policy-refpolicy.sh | 22 ++++++++++++++++++
 6 files changed, 112 insertions(+), 8 deletions(-)
 create mode 100644 travis-ci/enable-policy.sh
 create mode 100644 travis-ci/setup-policy-fedora.sh
 create mode 100644 travis-ci/setup-policy-refpolicy.sh

--=20
2.21.0

