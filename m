Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 542C64DCAC1
	for <lists+selinux@lfdr.de>; Thu, 17 Mar 2022 17:07:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233987AbiCQQIf (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Thu, 17 Mar 2022 12:08:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230315AbiCQQIe (ORCPT
        <rfc822;selinux@vger.kernel.org>); Thu, 17 Mar 2022 12:08:34 -0400
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id A4FCE214146
        for <selinux@vger.kernel.org>; Thu, 17 Mar 2022 09:07:17 -0700 (PDT)
Received: from [192.168.1.10] (pool-173-66-191-184.washdc.fios.verizon.net [173.66.191.184])
        by linux.microsoft.com (Postfix) with ESMTPSA id 3100E20D4DF6
        for <selinux@vger.kernel.org>; Thu, 17 Mar 2022 09:07:17 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 3100E20D4DF6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
        s=default; t=1647533237;
        bh=j7JlubFuUhPMtx3ijRpHonpBswekOKpQbH5vfl1i23w=;
        h=Date:To:From:Subject:From;
        b=WycsA38gWabIYIBLJtky7ozc+3aSI46I/pYaTjn6JpnMFc2lZWVqAfy0kcZ05r4WV
         0mxMyKYfSwUtF9xzwTxpb6Wl94z/0CW6eIhAcsRpEmfQSQcRe3dctQ1snFx5DaLy0a
         wY0nSV3cKwLsmYTNoo23lBJY04X/m1TiW4FYEpgM=
Message-ID: <9dd0a3d6-26b0-4689-ee28-ff8cb8af4d46@linux.microsoft.com>
Date:   Thu, 17 Mar 2022 12:07:06 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To:     SElinux list <selinux@vger.kernel.org>
From:   Daniel Burgener <dburgener@linux.microsoft.com>
Subject: Pwnkit and SELinux
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-19.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,
        USER_IN_DEF_SPF_WL autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Some on this list may in interested in this blog post I wrote up to 
discuss the ability of SELinux to mitigate against a recent high profile 
security vulnerability (CVE-2021-4043/pwnkit):

https://dburgener.github.io/2022/03/16/pwnkit-and-selinux.html

-Daniel
