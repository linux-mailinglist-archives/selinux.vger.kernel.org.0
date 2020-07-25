Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EBB4722D52B
	for <lists+selinux@lfdr.de>; Sat, 25 Jul 2020 07:14:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725874AbgGYFOf (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Sat, 25 Jul 2020 01:14:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725941AbgGYFOf (ORCPT
        <rfc822;selinux@vger.kernel.org>); Sat, 25 Jul 2020 01:14:35 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 230D3C0619E4
        for <selinux@vger.kernel.org>; Fri, 24 Jul 2020 22:14:35 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id b9so5632559plx.6
        for <selinux@vger.kernel.org>; Fri, 24 Jul 2020 22:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=zgyWqznSRtZ8AuY3tULsDjN5RpahufiDT3f0fggLh5s=;
        b=Uz3IlXv+sKUEtS5eC2DkIZtfS1Xha2bB4TKPa3hP+w1M1cIds1A7Bc9dmlvPRbvChZ
         wRrWcllSzjbfwURKIlVM3R6geZktvtQVkAUVECySvW+9t8BX+7Y+Mwnbg2+kr26wyHyc
         0WBa5P7q9VQ2U9GlcuKszMphubHxHCT/n6acs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=zgyWqznSRtZ8AuY3tULsDjN5RpahufiDT3f0fggLh5s=;
        b=Z11hcdFm0lur7eZhMpMzf8G5viiOzYpLnlnChCMjWXoU91Q+dhGT1HE1hc9nWtDyTn
         M9HwwmVErgVD2VKwAXb+s7poO59RZuHswSfWvOB27w1K0QHf5eAeLbmBIZWFEZ5vNjAG
         uM6CHap2XPdl1XySD9bWi6qY9KUqTLITYTpKQQskDHepqFqQAp7wdiGhyGmo0pYq7PvX
         3o0OfLwNQwuXflfVblUip028MXQFfmEc4zz3uJNotwpf3ojtRd9fdF6hFCFqRE++M6vM
         opaM8RLoiEVv/TSLTewVeP1DoIAwaESjzgq5fpHr5tivx5TQav7eq3iJqvLuxesgWkAH
         44AA==
X-Gm-Message-State: AOAM531PS3Xb4t5/4myfUkhl/U4lnDrg42+SPxLhrBXadgjU9RD+6C51
        4uTW4SVi6VK718b/xELDz+SlBQ==
X-Google-Smtp-Source: ABdhPJz6ILO9KJmQAo9dsBlTgCVjwv22IuoZPDOnnhlk6scO1A0oZWI5P9disMNuzZklnQGqIVBuug==
X-Received: by 2002:a17:90a:fe08:: with SMTP id ck8mr8549438pjb.90.1595654074430;
        Fri, 24 Jul 2020 22:14:34 -0700 (PDT)
Received: from [10.136.13.65] ([192.19.228.250])
        by smtp.gmail.com with ESMTPSA id 193sm7829508pfz.85.2020.07.24.22.14.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jul 2020 22:14:33 -0700 (PDT)
Subject: Re: [PATCH v3 00/19] Introduce partial kernel_read_file() support
To:     Kees Cook <keescook@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Mimi Zohar <zohar@linux.ibm.com>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Jessica Yu <jeyu@kernel.org>, SeongJae Park <sjpark@amazon.de>,
        KP Singh <kpsingh@chromium.org>, linux-efi@vger.kernel.org,
        linux-security-module@vger.kernel.org,
        linux-integrity@vger.kernel.org, selinux@vger.kernel.org,
        linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200724213640.389191-1-keescook@chromium.org>
From:   Scott Branden <scott.branden@broadcom.com>
Message-ID: <09bd8cc0-8073-c26a-fb7c-010a62f88c74@broadcom.com>
Date:   Fri, 24 Jul 2020 22:14:23 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200724213640.389191-1-keescook@chromium.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On 2020-07-24 2:36 p.m., Kees Cook wrote:
> v3:
> - add reviews/acks
> - add "IMA: Add support for file reads without contents" patch
> - trim CC list, in case that's why vger ignored v2
> v2: [missing from lkml archives! (CC list too long?) repeating changes here]
> - fix issues in firmware test suite
> - add firmware partial read patches
> - various bug fixes/cleanups
> v1: https://lore.kernel.org/lkml/20200717174309.1164575-1-keescook@chromium.org/
>
> Hi,
>
> Here's my tree for adding partial read support in kernel_read_file(),
> which fixes a number of issues along the way. It's got Scott's firmware
> and IMA patches ported and everything tests cleanly for me (even with
> CONFIG_IMA_APPRAISE=y).
>
> I think the intention is for this to go via Greg's tree since Scott's
> driver code will depend on it?
v3 of this patch series looks good and passes all of my tests.
Remaining patches
Acked-by: Scott Branden <scott.branden@broadcom.com>

I have added latest bcm-vk driver code to Kees' patch series and added 
it here:
https://github.com/sbranden/linux/tree/kernel_read_file_for_kees_v3

If everyone finds Kees' patch series acceptable then the 3 patches 
adding the bcm-vk driver
need to be added to the series.  I can send the 3 patches out separately 
and then
the two patch series can be combined in Greg or someone's tree if that 
works?
Or if an in-kernel user beyond kernel selftest is needed for 
request_partial_firmware_into_buf
in Kees' patch series then another PATCH v4 needs to be sent out 
including the bcm-vk driver.
>
> Thanks,
>
> -Kees
>
>
> Kees Cook (15):

Thanks for help Kees, it's works now.
>    test_firmware: Test platform fw loading on non-EFI systems
>    selftest/firmware: Add selftest timeout in settings
>    firmware_loader: EFI firmware loader must handle pre-allocated buffer
>    fs/kernel_read_file: Remove FIRMWARE_PREALLOC_BUFFER enum
>    fs/kernel_read_file: Remove FIRMWARE_EFI_EMBEDDED enum
>    fs/kernel_read_file: Split into separate source file
>    fs/kernel_read_file: Remove redundant size argument
>    fs/kernel_read_file: Switch buffer size arg to size_t
>    fs/kernel_read_file: Add file_size output argument
>    LSM: Introduce kernel_post_load_data() hook
>    firmware_loader: Use security_post_load_data()
>    module: Call security_kernel_post_load_data()
>    LSM: Add "contents" flag to kernel_read_file hook
>    fs/kernel_file_read: Add "offset" arg for partial reads
>    firmware: Store opt_flags in fw_priv
>
> Scott Branden (4):
>    fs/kernel_read_file: Split into separate include file
>    IMA: Add support for file reads without contents
>    firmware: Add request_partial_firmware_into_buf()
>    test_firmware: Test partial read support
>
>   drivers/base/firmware_loader/fallback.c       |  19 +-
>   drivers/base/firmware_loader/fallback.h       |   5 +-
>   .../base/firmware_loader/fallback_platform.c  |  16 +-
>   drivers/base/firmware_loader/firmware.h       |   7 +-
>   drivers/base/firmware_loader/main.c           | 143 ++++++++++---
>   drivers/firmware/efi/embedded-firmware.c      |  21 +-
>   drivers/firmware/efi/embedded-firmware.h      |  19 ++
>   fs/Makefile                                   |   3 +-
>   fs/exec.c                                     | 132 +-----------
>   fs/kernel_read_file.c                         | 189 ++++++++++++++++++
>   include/linux/efi_embedded_fw.h               |  13 --
>   include/linux/firmware.h                      |  12 ++
>   include/linux/fs.h                            |  39 ----
>   include/linux/ima.h                           |  19 +-
>   include/linux/kernel_read_file.h              |  55 +++++
>   include/linux/lsm_hook_defs.h                 |   6 +-
>   include/linux/lsm_hooks.h                     |  12 ++
>   include/linux/security.h                      |  19 +-
>   kernel/kexec.c                                |   2 +-
>   kernel/kexec_file.c                           |  19 +-
>   kernel/module.c                               |  24 ++-
>   lib/test_firmware.c                           | 159 +++++++++++++--
>   security/integrity/digsig.c                   |   8 +-
>   security/integrity/ima/ima_fs.c               |  10 +-
>   security/integrity/ima/ima_main.c             |  70 +++++--
>   security/integrity/ima/ima_policy.c           |   1 +
>   security/loadpin/loadpin.c                    |  17 +-
>   security/security.c                           |  26 ++-
>   security/selinux/hooks.c                      |   8 +-
>   .../selftests/firmware/fw_filesystem.sh       |  91 +++++++++
>   tools/testing/selftests/firmware/settings     |   8 +
>   tools/testing/selftests/kselftest/runner.sh   |   6 +-
>   32 files changed, 860 insertions(+), 318 deletions(-)
>   create mode 100644 drivers/firmware/efi/embedded-firmware.h
>   create mode 100644 fs/kernel_read_file.c
>   create mode 100644 include/linux/kernel_read_file.h
>   create mode 100644 tools/testing/selftests/firmware/settings
>

