Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C3FC6364E1
	for <lists+selinux@lfdr.de>; Wed, 23 Nov 2022 16:54:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238502AbiKWPyu (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Wed, 23 Nov 2022 10:54:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238589AbiKWPyS (ORCPT
        <rfc822;selinux@vger.kernel.org>); Wed, 23 Nov 2022 10:54:18 -0500
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 01B4FCB94C
        for <selinux@vger.kernel.org>; Wed, 23 Nov 2022 07:53:44 -0800 (PST)
Received: from [192.168.1.108] (ip98-168-40-103.ph.ph.cox.net [98.168.40.103])
        by linux.microsoft.com (Postfix) with ESMTPSA id 8F33820B83C2
        for <selinux@vger.kernel.org>; Wed, 23 Nov 2022 07:53:44 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 8F33820B83C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
        s=default; t=1669218824;
        bh=Ae0NYE8JEwry/aOuaF33hp88ULXxe17fXRpIpmYSSmg=;
        h=Date:To:From:Subject:From;
        b=AidSbNhWPwkSSN4y5b2M6Xb1zNBw2cBNG/8Pxw+Jy0zdgrGd40ziU90F6c62iSWTd
         uFi1IoIXCuGeS1PcTIusfp8OwDpLsWNIoDb6PP12XrA/w+A4NR4CySKxyWxl07/NWJ
         YNCaCbDMxRsKjTByXtVKzIulakMyUuTxWsg57zUU=
Message-ID: <d11c25c5-727e-342a-162a-e3851ff03d27@linux.microsoft.com>
Date:   Wed, 23 Nov 2022 08:53:42 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To:     SELinux <selinux@vger.kernel.org>
From:   Matthew Sheets <masheets@linux.microsoft.com>
Subject: secilc genfscon parsing error
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-19.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Hi,

I am seeing a parsing error from secilc when trying to compile the 
following line:
(genfscon sysfs "/zap" file (system_u object_r foo ((s0) (s0))))

But according to the documentation here:
https://github.com/SELinuxProject/selinux/blob/master/secilc/docs/cil_file_labeling_statements.md#genfscon
I believe this should be a valid line.

The compiler error given is:
Invalid syntax
Bad genfscon declaration at out.cil:129
Failed to build AST
Failed to compile cildb: -1

If I remove the file keyword everything compiles correctly.

Other interesting points of data:

In ref policy there is the following line in selinux.te
genfscon selinuxfs /booleans/ -- gen_context(system_u:object_r:boolean_t,s0)

When compiling this to cil with checkpolicy the following line is produced:
(genfscon selinuxfs "/booleans/" (system_u object_r boolean_t (systemlow 
systemlow)))
Which has no reference to the optional file_type field.
