Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 29DC8611BA7
	for <lists+selinux@lfdr.de>; Fri, 28 Oct 2022 22:39:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229692AbiJ1UjG (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Fri, 28 Oct 2022 16:39:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229670AbiJ1UjF (ORCPT
        <rfc822;selinux@vger.kernel.org>); Fri, 28 Oct 2022 16:39:05 -0400
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com [IPv6:2607:f8b0:4864:20::735])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94D9823643C
        for <selinux@vger.kernel.org>; Fri, 28 Oct 2022 13:39:04 -0700 (PDT)
Received: by mail-qk1-x735.google.com with SMTP id 8so4239138qka.1
        for <selinux@vger.kernel.org>; Fri, 28 Oct 2022 13:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2RLk2jhO9ygRPUDTuBWAIeIidKHAkFbxo5zSuB1sBQQ=;
        b=nhepSbi2Ip0HXr57cxtozzSOfwpWUfGabkXzptUtSMB8hXlvtKaNg2YnDQl4PIiVIT
         CWPX+b7vDyz+sUV03D1DpQe3c3VOFDM9PLFJmCQeQRxglRa7DaXudZoF8cEZL7y8CFSY
         tzJ/fmsAhrxOS5zXmV6iytO0RSud6vok+rMmMINfYwoa3ERkQ6yhFIZtoy14l+GPzLbb
         gFfM9y7Wbb+dhsIz7poQlfgCGurrD0eo2bTLaBmaD5+klO619LhMdw/xFGF2JpKoa3mo
         tdT7WPWHJY4PAKo/ND2xggPsXMSLU2wKHNz2Y98xhmZZy5ObzLTy1tl/nQOcgTLG6DCu
         C1WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2RLk2jhO9ygRPUDTuBWAIeIidKHAkFbxo5zSuB1sBQQ=;
        b=f6vJg+mSRVvVg2I7V43j4TLa4/1zApcm5z+d90JVGlKal9k/0X6TiJcW3gta5qSzOR
         Rc1EJex39rBWqJ55GFO25SJe0RdkkwniVNymbiVyAZ86Lt78Al672Z0Rjkpa/62JlCp9
         JW/oJj6jwvN4LYkHHZZA3vCpn/CgJ6BBInSlkEoYTi6v4kA7VXsbNMC7DUCpxvHKuL85
         sEftGJUAuaoOaOBNmfJiCA0o4C/lcId8al21F5n+iLwlzux08vQbDPYLNqLggkX8Fp4o
         rXmLvwqIhb9/+KXVSo0k2BPxz4ciE9U6pis8VEY9lOaeYDhu5Iep/fnqWmc3Kpbuxf5w
         XRvQ==
X-Gm-Message-State: ACrzQf0NC5ljdpTvirAhWtbIMReXbvjrFJU8M1LvWc5g8B5rqp9lwwX8
        14Gw48mQ2vB+XZ6kc8mT+bYFXZYR4fU=
X-Google-Smtp-Source: AMsMyM6+xUmuIcUDCpt+PVg5jp92SJ7Rj6iZOQxQk+umFlMWXo+DWfhvyiB9EXogeI8qYPAJPf+EgA==
X-Received: by 2002:a05:620a:8c9:b0:6fa:120f:9776 with SMTP id z9-20020a05620a08c900b006fa120f9776mr910359qkz.235.1666989543480;
        Fri, 28 Oct 2022 13:39:03 -0700 (PDT)
Received: from electric.. (c-73-200-155-132.hsd1.md.comcast.net. [73.200.155.132])
        by smtp.gmail.com with ESMTPSA id v17-20020a05620a0f1100b006ecfb2c86d3sm3606642qkl.130.2022.10.28.13.39.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 13:39:02 -0700 (PDT)
From:   James Carter <jwcart2@gmail.com>
To:     selinux@vger.kernel.org
Cc:     James Carter <jwcart2@gmail.com>
Subject: [PATCH 4/5] scripts: Remove dependency on the Python module distutils
Date:   Fri, 28 Oct 2022 16:38:51 -0400
Message-Id: <20221028203852.526472-5-jwcart2@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221028203852.526472-1-jwcart2@gmail.com>
References: <20221028203852.526472-1-jwcart2@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

The distutils package is deprecated and scheduled to be removed in
Python 3.12. Use the sysconfig module instead.

Signed-off-by: James Carter <jwcart2@gmail.com>
---
 scripts/env_use_destdir | 2 +-
 scripts/run-scan-build  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/env_use_destdir b/scripts/env_use_destdir
index 8274013e..89d989a2 100755
--- a/scripts/env_use_destdir
+++ b/scripts/env_use_destdir
@@ -43,7 +43,7 @@ if [ -n "${SBINDIR:-}" ] ; then
     PATH="$DESTDIR$SBINDIR:$PATH"
 fi
 
-NEW_PYTHONPATH="$DESTDIR$(${PYTHON:-python3} -c "from distutils.sysconfig import *;print(get_python_lib(plat_specific=1, prefix='/usr'))"):$DESTDIR$(${PYTHON:-python3} -c "from distutils.sysconfig import *;print(get_python_lib(prefix='/usr'))")"
+NEW_PYTHONPATH="$DESTDIR$(${PYTHON:-python3} -c "import sysconfig; print(sysconfig.get_path('platlib', vars={'platbase': '/usr', 'base': '/usr'}))"):$DESTDIR$(${PYTHON:-python3} -c "import sysconfig; print(sysconfig.get_path('purelib', vars={'platbase': '/usr', 'base': '/usr'}))")"
 if [ -n "${PYTHONPATH:-}" ] ; then
     # Prefix the PYTHONPATH with the new directories
     export PYTHONPATH="$NEW_PYTHONPATH:$PYTHONPATH"
diff --git a/scripts/run-scan-build b/scripts/run-scan-build
index 77e02ca9..931ffd2a 100755
--- a/scripts/run-scan-build
+++ b/scripts/run-scan-build
@@ -21,7 +21,7 @@ fi
 # Make sure to use the newly-installed libraries when running tests
 export LD_LIBRARY_PATH="$DESTDIR/usr/lib:$DESTDIR/lib"
 export PATH="$DESTDIR/usr/sbin:$DESTDIR/usr/bin:$DESTDIR/sbin:$DESTDIR/bin:$PATH"
-export PYTHONPATH="$DESTDIR$(${PYTHON:-python3} -c "from distutils.sysconfig import *;print(get_python_lib(prefix='/usr'))")"
+export PYTHONPATH="$DESTDIR$(${PYTHON:-python3} -c "import sysconfig; print(sysconfig.get_path('purelib', vars={'platbase': '/usr', 'base': '/usr'}))")"
 export RUBYLIB="$DESTDIR/$(${RUBY:-ruby} -e 'puts RbConfig::CONFIG["vendorlibdir"]'):$DESTDIR/$(${RUBY:-ruby} -e 'puts RbConfig::CONFIG["vendorarchdir"]')"
 
 if [ -f /etc/debian_version ] && [ -z "${IS_CIRCLE_CI:-}" ] ; then
-- 
2.37.3

