Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4A4B9159411
	for <lists+selinux@lfdr.de>; Tue, 11 Feb 2020 16:57:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728685AbgBKP5o (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Tue, 11 Feb 2020 10:57:44 -0500
Received: from mail-qk1-f180.google.com ([209.85.222.180]:44663 "EHLO
        mail-qk1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728389AbgBKP5n (ORCPT
        <rfc822;selinux@vger.kernel.org>); Tue, 11 Feb 2020 10:57:43 -0500
Received: by mail-qk1-f180.google.com with SMTP id v195so10496147qkb.11
        for <selinux@vger.kernel.org>; Tue, 11 Feb 2020 07:57:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
        h=from:subject:to:date:message-id:user-agent:mime-version
         :content-transfer-encoding;
        bh=QuPd2U/sdusyJEa+aj9TfWvF1z2bmrM0WoRLDmdhjQc=;
        b=EOqq1GHwY+f7vWvu/fgLCxVComLUANGD8e1Jk/mYASsXSE/GNk4tdeoaE1bjCSCRPo
         VM4mDSYI7ixkPJD4JFAaUbEsrHF1+xjK5plYg6FNEoV0UzUrVsQpw6XZYkEjwt/vb5EB
         SRA8R48CiWfUuItz6/qnONWLOxlKkiyUM+TtyCPDJcw9VCLgA1Dj5ZaqIzSUSYEXLZ7n
         /4BEN79LCBb/Xzj378tgtgCJTqha4EFXKD3R13qdn/cm1BV93ieOE+m8Yp5gTl0SFQe0
         pM0xHx+9ALy3D+K20v/T9nYPAcdA7A/geaLdELy3g7IKLxHzZWeV47kfFQFbhiGb1Ep3
         SkQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:date:message-id:user-agent
         :mime-version:content-transfer-encoding;
        bh=QuPd2U/sdusyJEa+aj9TfWvF1z2bmrM0WoRLDmdhjQc=;
        b=Jwx5n51kSKeuJDDxbXMzN907p4AG0pr1WXOYMfzJe/rTmQsN5WSjcfnryLIXg4Qw8P
         Xa2xtrEFPNWsqF8aAo92+4fq7kjQ9APx5qMEK6rz8KrmnHkk8eQdtweVFm5RTvLdAL1C
         YG/i9YR15Afm1me13jBJZbgDE5fmgAIc++9rAEJWGl7oZ3P8SWQX4yTUi8M2TH//GBcN
         BstVI9+BYreilriF9jNa2srKzt/btDKN0GhvM4Au7orlFy+a00y35qMjHAd09u8AoMJd
         Jsu4HXZlyl1G4y5Y8OpDTWHFRleu8dkC+EcI5OdXat9IYmpKNVYjWkafkax/i0z4YWWE
         uQCQ==
X-Gm-Message-State: APjAAAVw165s+akOza47N3Ivo2Nh7f4yEllGwE7a7kyGywriQ2RK+Tge
        JQWyuyRAfU0aFb5lIdtmWH77aqzHOQ==
X-Google-Smtp-Source: APXvYqwB2l4jon2vqydsQNZy7YDZ+fAIIxifeep86/3n5MNI1JfJsLVufkrG4y9sI+BqUsTGLWlp7A==
X-Received: by 2002:a05:620a:4e:: with SMTP id t14mr3427955qkt.396.1581436661410;
        Tue, 11 Feb 2020 07:57:41 -0800 (PST)
Received: from localhost (static-96-233-112-89.bstnma.ftas.verizon.net. [96.233.112.89])
        by smtp.gmail.com with ESMTPSA id 126sm1746631qkd.110.2020.02.11.07.57.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2020 07:57:40 -0800 (PST)
From:   Paul Moore <paul@paul-moore.com>
X-Google-Original-From: Paul Moore <pmoore2@cisco.com>
Subject: [PATCH] selinux-testsuite: add the quota package to the list of deps
 in README.md
To:     selinux@vger.kernel.org
Date:   Tue, 11 Feb 2020 10:57:39 -0500
Message-ID: <158143665924.193851.6057679833915268046.stgit@chester>
User-Agent: StGit/0.21
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

From: Paul Moore <paul@paul-moore.com>

The filesystem tests require the quota tools.

Signed-off-by: Paul Moore <paul@paul-moore.com>
---
 0 files changed

diff --git a/README.md b/README.md
index 64f80c8..27c9d56 100644
--- a/README.md
+++ b/README.md
@@ -54,6 +54,7 @@ similar dependencies):
 * libbpf-devel _(tools used by the bpf tests)_
 * keyutils-libs-devel _(tools used by the keys tests)_
 * kernel-devel _(used by the kernel module tests)_
+* quota _(used by the filesystem tests)_
 
 On a modern Fedora system you can install these dependencies with the
 following command:
@@ -71,7 +72,8 @@ following command:
 		attr \
 		libbpf-devel \
 		keyutils-libs-devel \
-		kernel-devel
+		kernel-devel \
+		quota
 
 The testsuite requires a pre-existing base policy configuration of SELinux,
 using either the old example policy or the reference policy as the baseline.

