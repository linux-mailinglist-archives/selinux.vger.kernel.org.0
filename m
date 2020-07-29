Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE8E02323E1
	for <lists+selinux@lfdr.de>; Wed, 29 Jul 2020 19:59:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727856AbgG2R7B (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Wed, 29 Jul 2020 13:59:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727813AbgG2R66 (ORCPT
        <rfc822;selinux@vger.kernel.org>); Wed, 29 Jul 2020 13:58:58 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABDA2C0619DE
        for <selinux@vger.kernel.org>; Wed, 29 Jul 2020 10:58:57 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id e8so14660055pgc.5
        for <selinux@vger.kernel.org>; Wed, 29 Jul 2020 10:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=l8qt6NAOeJyvaC4CtbxP5H/W0DvGbou/HHI7SemtTDA=;
        b=dJ9IJZFAtwa4MwTQF04JKQ82W7CcnprUt/ARSlcv975KRLPZw5QjYP634YQ+iCPFvg
         Y5ixlGhSCg9q/oaV7QjEd3rfMgokmldpS1nm61sWMNFynYEWVKsNmB85sMNLOTG2O88e
         Fyyfen0e/BaDate0J313xFGgHUmmA6lX1DmE0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=l8qt6NAOeJyvaC4CtbxP5H/W0DvGbou/HHI7SemtTDA=;
        b=kOrfdNsJF/dnqAa88L32OQAPIHLdzZ24Ko00AVtYhuPZznxk7wFeOCh9/6SJanvRts
         HKwKe5H2K6mlJkp1HOsnPVfPI3PZRAEy2MVAx3+N+ua3A7qBRJkOZ/zdmW7lSm0vePcY
         YOZY2mEaYMvwCzfnAp3BJI/1xZnAXku1ycJBHTulSReOK+0Yrs+XIksydILbhomys6nS
         YlOeT4kFjL9PXI23/3mXg0QETQX+FNDU06iGFt9Mosn2lPX+RK8hVOFmvLAcrR0iV8TF
         Npd05EFngYG+7KspvGbvk22USg6YuXnOlSMtCG1wuOFi2IWl4OU7tvqJaYFMEytumBeX
         RJHQ==
X-Gm-Message-State: AOAM533OPC+oBKjoPnnXYBRLkR5BgjP7gDzveSkWs7/h7rCqt3VfjfBu
        kXW/4JVF19G0VZhdx2Jel/32uQ==
X-Google-Smtp-Source: ABdhPJwt43WfKvGpI4vogWMtKRdtxeUwOurnGazObk+rZA1J3axI6ETZEe9ItvQsMYAhNcI6jd8Hkg==
X-Received: by 2002:a62:3185:: with SMTP id x127mr30031402pfx.290.1596045537240;
        Wed, 29 Jul 2020 10:58:57 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id j10sm3124764pgh.28.2020.07.29.10.58.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2020 10:58:53 -0700 (PDT)
From:   Kees Cook <keescook@chromium.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Kees Cook <keescook@chromium.org>,
        Scott Branden <scott.branden@broadcom.com>,
        Mimi Zohar <zohar@linux.ibm.com>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Takashi Iwai <tiwai@suse.de>, Jessica Yu <jeyu@kernel.org>,
        SeongJae Park <sjpark@amazon.de>,
        KP Singh <kpsingh@chromium.org>, linux-efi@vger.kernel.org,
        linux-security-module@vger.kernel.org,
        linux-integrity@vger.kernel.org, selinux@vger.kernel.org,
        linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 00/17] Introduce partial kernel_read_file() support
Date:   Wed, 29 Jul 2020 10:58:28 -0700
Message-Id: <20200729175845.1745471-1-keescook@chromium.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

v4:
- add more reviews (mimi, luis)
- adjusted comment (mimi)
- fixed build error when not building firmware tests (0day, sfr)
- fixed needless .xz read (tiwai)
- rebased to driver-core-next
v3: https://lore.kernel.org/lkml/20200724213640.389191-1-keescook@chromium.org/
v2: lost to the ether
v1: https://lore.kernel.org/lkml/20200717174309.1164575-1-keescook@chromium.org/

Hi,

Here's my tree for adding partial read support in kernel_read_file(),
which fixes a number of issues along the way. It's got Scott's firmware
and IMA patches ported and everything tests cleanly for me (even with
CONFIG_IMA_APPRAISE=y), and now appears to pass 0day. :)

The intention is for this to go via Greg's tree since Scott's driver
code will depend on it.

Thanks,

-Kees

Kees Cook (13):
  test_firmware: Test platform fw loading on non-EFI systems
  fs/kernel_read_file: Remove FIRMWARE_PREALLOC_BUFFER enum
  fs/kernel_read_file: Remove FIRMWARE_EFI_EMBEDDED enum
  fs/kernel_read_file: Split into separate source file
  fs/kernel_read_file: Remove redundant size argument
  fs/kernel_read_file: Switch buffer size arg to size_t
  fs/kernel_read_file: Add file_size output argument
  LSM: Introduce kernel_post_load_data() hook
  firmware_loader: Use security_post_load_data()
  module: Call security_kernel_post_load_data()
  LSM: Add "contents" flag to kernel_read_file hook
  fs/kernel_file_read: Add "offset" arg for partial reads
  firmware: Store opt_flags in fw_priv

Scott Branden (4):
  fs/kernel_read_file: Split into separate include file
  IMA: Add support for file reads without contents
  firmware: Add request_partial_firmware_into_buf()
  test_firmware: Test partial read support

 drivers/base/firmware_loader/fallback.c       |  19 +-
 drivers/base/firmware_loader/fallback.h       |   5 +-
 .../base/firmware_loader/fallback_platform.c  |  11 +-
 drivers/base/firmware_loader/firmware.h       |   7 +-
 drivers/base/firmware_loader/main.c           | 135 ++++++++++---
 drivers/firmware/efi/embedded-firmware.c      |  21 +-
 drivers/firmware/efi/embedded-firmware.h      |  21 ++
 fs/Makefile                                   |   3 +-
 fs/exec.c                                     | 132 +-----------
 fs/kernel_read_file.c                         | 189 ++++++++++++++++++
 include/linux/efi_embedded_fw.h               |  13 --
 include/linux/firmware.h                      |  12 ++
 include/linux/fs.h                            |  39 ----
 include/linux/ima.h                           |  19 +-
 include/linux/kernel_read_file.h              |  55 +++++
 include/linux/lsm_hook_defs.h                 |   6 +-
 include/linux/lsm_hooks.h                     |  12 ++
 include/linux/security.h                      |  19 +-
 kernel/kexec.c                                |   2 +-
 kernel/kexec_file.c                           |  19 +-
 kernel/module.c                               |  24 ++-
 lib/test_firmware.c                           | 159 +++++++++++++--
 security/integrity/digsig.c                   |   8 +-
 security/integrity/ima/ima_fs.c               |  10 +-
 security/integrity/ima/ima_main.c             |  70 +++++--
 security/integrity/ima/ima_policy.c           |   1 +
 security/loadpin/loadpin.c                    |  17 +-
 security/security.c                           |  26 ++-
 security/selinux/hooks.c                      |   8 +-
 .../selftests/firmware/fw_filesystem.sh       |  91 +++++++++
 30 files changed, 839 insertions(+), 314 deletions(-)
 create mode 100644 drivers/firmware/efi/embedded-firmware.h
 create mode 100644 fs/kernel_read_file.c
 create mode 100644 include/linux/kernel_read_file.h

-- 
2.25.1

