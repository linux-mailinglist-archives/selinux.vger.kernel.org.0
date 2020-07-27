Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49B7122F8DA
	for <lists+selinux@lfdr.de>; Mon, 27 Jul 2020 21:18:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728755AbgG0TSl (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Mon, 27 Jul 2020 15:18:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728760AbgG0TSk (ORCPT
        <rfc822;selinux@vger.kernel.org>); Mon, 27 Jul 2020 15:18:40 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 419A4C061794
        for <selinux@vger.kernel.org>; Mon, 27 Jul 2020 12:18:40 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id g10so14005819wmc.1
        for <selinux@vger.kernel.org>; Mon, 27 Jul 2020 12:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=AD/pgeUaAWIctoPbHAQcCg8O5lgu8H5ssjeAH3MlNAE=;
        b=b9Xi8EPKDhPyvptqzRh9TEyHmMfd/reQxGu/+VvNXDLeNkn94+A5XsLMU4sZGwGnYc
         VQ7cN6oppIHp7Sb9aOnqtUx8KbqUL2t0VNncf/TBpGWpM0VcUa7jrep3fZu9VV7ljCF3
         Wx50YZGH7fXe4vbZqShyP7XqktwHUoOhIiKJk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=AD/pgeUaAWIctoPbHAQcCg8O5lgu8H5ssjeAH3MlNAE=;
        b=afnSFtU8yTFV5CR3L8b4GYI/wJdegRZ6kHvPWrdPUQyiU3Rv16Y2Ng1H8iN7Ct1gCx
         VmYWzWVLQYtrRuQeT3F5Nm5qefbZ45ZGFGXdrvJVz4B5tp3vj8wqgxKoprCLTz40Gwhx
         gJvLC04n6cl5V/+e4cc7fgIfYJv5DevDIUWH79QMKpuvvL8gDUMJreWEL8yADupA08+l
         dAl/Er9kc+uNGoCHczmXvrJ1qKJ5yVXjIxk70zx8Cf3azlfInxPROiyPefeuoiKjRCyI
         95c1KOm3jWP3qXAyWJ73IsSgy+9NCsGNonlwRMMkvtOCL7HOC3vxlG6J5Qdg6ss+viW+
         b2RA==
X-Gm-Message-State: AOAM533Ep4mPUmSts42culBTIusPtmNwBdNFfrHOrxqmC1T2iTXGJ1IW
        yjdsr2/Pf82HIKCAfuNMZxNEEfi7T5ioSA==
X-Google-Smtp-Source: ABdhPJw7IDXDgUVkm/BmOYhovEDy4epUcWGU5dwgTcbUsYWhYOQSjfwYb9HbZEpCRr1sm9NvxhoSPA==
X-Received: by 2002:a1c:7fd3:: with SMTP id a202mr607949wmd.67.1595877518878;
        Mon, 27 Jul 2020 12:18:38 -0700 (PDT)
Received: from [10.136.13.65] ([192.19.228.250])
        by smtp.gmail.com with ESMTPSA id p11sm13730030wre.32.2020.07.27.12.18.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2020 12:18:38 -0700 (PDT)
Subject: Re: [PATCH v3 00/19] Introduce partial kernel_read_file() support
To:     Mimi Zohar <zohar@kernel.org>, Kees Cook <keescook@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Luis Chamberlain <mcgrof@kernel.org>, Jessica Yu <jeyu@kernel.org>,
        SeongJae Park <sjpark@amazon.de>,
        KP Singh <kpsingh@chromium.org>, linux-efi@vger.kernel.org,
        linux-security-module@vger.kernel.org,
        linux-integrity@vger.kernel.org, selinux@vger.kernel.org,
        linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200724213640.389191-1-keescook@chromium.org>
 <1595848589.4841.78.camel@kernel.org>
From:   Scott Branden <scott.branden@broadcom.com>
Message-ID: <1a46db6f-1c8a-3509-6371-7c77999833f2@broadcom.com>
Date:   Mon, 27 Jul 2020 12:18:33 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1595848589.4841.78.camel@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-CA
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Hi Mimi/Kees,

On 2020-07-27 4:16 a.m., Mimi Zohar wrote:
> On Fri, 2020-07-24 at 14:36 -0700, Kees Cook wrote:
>> v3:
>> - add reviews/acks
>> - add "IMA: Add support for file reads without contents" patch
>> - trim CC list, in case that's why vger ignored v2
>> v2: [missing from lkml archives! (CC list too long?) repeating changes here]
>> - fix issues in firmware test suite
>> - add firmware partial read patches
>> - various bug fixes/cleanups
>> v1: https://lore.kernel.org/lkml/20200717174309.1164575-1-keescook@chromium.org/
>>
>> Hi,
>>
>> Here's my tree for adding partial read support in kernel_read_file(),
>> which fixes a number of issues along the way. It's got Scott's firmware
>> and IMA patches ported and everything tests cleanly for me (even with
>> CONFIG_IMA_APPRAISE=y).
> Thanks, Kees.  Other than my comments on the new
> security_kernel_post_load_data() hook, the patch set is really nice.
>
> In addition to compiling with CONFIG_IMA_APPRAISE enabled, have you
> booted the kernel with the ima_policy=tcb?  The tcb policy will add
> measurements to the IMA measurement list and extend the TPM with the
> file or buffer data digest.  Are you seeing the firmware measurements,
> in particular the partial read measurement?
I booted the kernel with ima_policy=tcb.

Unfortunately after enabling the following, fw_run_tests.sh does not run.

mkdir /sys/kernel/security
mount -t securityfs securityfs /sys/kernel/security
echo "measure func=FIRMWARE_CHECK" > /sys/kernel/security/ima/policy
echo "appraise func=FIRMWARE_CHECK appraise_type=imasig" > /sys/kernel/security/ima/policy
./fw_run_tests.sh

[ 1296.258052] test_firmware: loading 'test-firmware.bin'
[ 1296.263903] misc test_firmware: loading /lib/firmware/test-firmware.bin failed with error -13
[ 1296.263905] audit: type=1800 audit(1595905754.266:9): pid=5696 uid=0 auid=4294967295 ses=4294967295 subj=kernel op=appraise_data cause=IMA-signature-required comm="fw_namespace" name="/lib/firmware/test-firmware.bin" dev="tmpfs" ino=4592 res=0
[ 1296.297085] misc test_firmware: Direct firmware load for test-firmware.bin failed with error -13
[ 1296.305947] test_firmware: load of 'test-firmware.bin' failed: -13

>
> thanks,
>
> Mimi

