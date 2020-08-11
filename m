Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CC0824186B
	for <lists+selinux@lfdr.de>; Tue, 11 Aug 2020 10:46:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728335AbgHKIqG (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Tue, 11 Aug 2020 04:46:06 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:54444 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728224AbgHKIqF (ORCPT
        <rfc822;selinux@vger.kernel.org>); Tue, 11 Aug 2020 04:46:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1597135563;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=+jwnPcjm8LN7ThcjUOZfAk7InVCmqO+S2NwTEAGGKVg=;
        b=a7Djno30AwLDZJbkhprEbVy4DvJGygUNf/V+iBSKy2lTnncaA8IyiSiYEFruTCd+//8g6P
        HJpTBbTXgMnEvI9VkxUhoDOSOGXHKBb/v/BxPsMdiz9i89HD3i9dWCI/DPVDCUrGk9T8my
        zdF899emfLIeMOCRrJBl7KXkqSTy8sM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-51-KspeNd9JNwyRCJGW2OZHOQ-1; Tue, 11 Aug 2020 04:45:59 -0400
X-MC-Unique: KspeNd9JNwyRCJGW2OZHOQ-1
Received: by mail-wm1-f70.google.com with SMTP id a5so604071wmj.5
        for <selinux@vger.kernel.org>; Tue, 11 Aug 2020 01:45:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+jwnPcjm8LN7ThcjUOZfAk7InVCmqO+S2NwTEAGGKVg=;
        b=OJi/iqNgbrzkQpLKFKVU1dv7oeeNwW6LwaVtRWydlJBxb0I42XzmYMYRMsBlPte3ZO
         cBX5W+pUJpoODuBs8ASq3jol/kCcqOSwhFYAJspkltsyxNuSiJykW12SwgITXpX2AEtP
         mbizIAwPXCnKm9NR8TEM09OdU4n2FCsFe1KYH2mrvFpdsrn4yZdnTPx7qJjOUOvgs08W
         u0u7WmYNW4+ME39+Olv5BVSeVps/dECyrzLCvI6rkR34E4hZWJ/szNBX6Y0zEDosiGwf
         BA5UczcSyulooiQmnyCsVNnEhc23bYy8E+80ZMUZk0JhzHmWQqVqQjQ60ZDt+r/txuWf
         daHg==
X-Gm-Message-State: AOAM532jCE8b93eR7HhGH/dQAJb3PY9Me94ll5CcRbJ3QlLDzUfF0vZh
        At782lSZhAad8+feQ8VMNEhwD4xtajvdAnz143m2RmfOT42tba5/zlOUpAKVSgQ9/TBQtseel8V
        KiZnfHO/aBwpY+h5a/Q==
X-Received: by 2002:a1c:3dd6:: with SMTP id k205mr3106228wma.61.1597135557892;
        Tue, 11 Aug 2020 01:45:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy9jMTU10AlralFWo+//u/Dq9trgSYUgebkWYO2IiGwRAAwtqAtqpmPfzz0OpS75kTy4EbQag==
X-Received: by 2002:a1c:3dd6:: with SMTP id k205mr3106206wma.61.1597135557593;
        Tue, 11 Aug 2020 01:45:57 -0700 (PDT)
Received: from omos.redhat.com ([2a02:8308:b13f:2100:8a6a:ec88:3ed7:44b3])
        by smtp.gmail.com with ESMTPSA id a11sm27674310wrq.0.2020.08.11.01.45.56
        for <selinux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2020 01:45:56 -0700 (PDT)
From:   Ondrej Mosnacek <omosnace@redhat.com>
To:     selinux@vger.kernel.org
Subject: [PATCH testsuite v2 0/2] Run full testsuite on Fedora in Travis CI
Date:   Tue, 11 Aug 2020 10:45:53 +0200
Message-Id: <20200811084555.105374-1-omosnace@redhat.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

This series converts the CI scripts to run the full testsuite in Fedora
VMs instead of build-testing it directly in the Ubuntu CI environment.

v2: run also on Rawhide in addition to the current stable release

Demo Travis run:
https://travis-ci.org/github/WOnder93/selinux-testsuite/builds/716827281

Ondrej Mosnacek (2):
  README: add perl-lib as a dependency
  travis: run the full testsuite on a Fedora VM

 .travis.yml                         |  68 +++++----------
 README.md                           |   2 +
 travis-ci/LICENSE                   |   5 ++
 travis-ci/enable-policy.sh          |  10 ---
 travis-ci/run-kvm-test.sh           | 124 ++++++++++++++++++++++++++++
 travis-ci/run-testsuite.sh          |  55 ++++++++++++
 travis-ci/setup-policy-fedora.sh    |  33 --------
 travis-ci/setup-policy-refpolicy.sh |  21 -----
 8 files changed, 205 insertions(+), 113 deletions(-)
 create mode 100644 travis-ci/LICENSE
 delete mode 100644 travis-ci/enable-policy.sh
 create mode 100755 travis-ci/run-kvm-test.sh
 create mode 100755 travis-ci/run-testsuite.sh
 delete mode 100644 travis-ci/setup-policy-fedora.sh
 delete mode 100644 travis-ci/setup-policy-refpolicy.sh

-- 
2.26.2

