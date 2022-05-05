Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B62FF51B7EF
	for <lists+selinux@lfdr.de>; Thu,  5 May 2022 08:26:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235401AbiEEG3q (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Thu, 5 May 2022 02:29:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235313AbiEEG3p (ORCPT
        <rfc822;selinux@vger.kernel.org>); Thu, 5 May 2022 02:29:45 -0400
X-Greylist: delayed 303 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 04 May 2022 23:26:04 PDT
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [170.10.129.74])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 99A0F1A049
        for <selinux@vger.kernel.org>; Wed,  4 May 2022 23:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1651731963;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=lkTbNwb0jkgHvI0jvIxZIjzUwVGevXCF3M/9bjB1oAA=;
        b=DQ9iSYWBF0DNuF4y3hh+V3w44ujeqxFLiLlrniIWwnw+DChmRTePWuirvC16K+omY305Yv
        +ziPWtdBS1uWz230aOeUtb3dYjWOvFE1jP2TzCGqqjCd9sqUr0xac8ccE8Vf8aSrkNe+M9
        lAIhj9+6SW8e0Cd1drDCplp8hp9ZJ2w=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-54-VJ5Ws1ShNGGc-OD1UbGm0g-1; Thu, 05 May 2022 02:19:33 -0400
X-MC-Unique: VJ5Ws1ShNGGc-OD1UbGm0g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7C4441D9F88A
        for <selinux@vger.kernel.org>; Thu,  5 May 2022 06:19:33 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (unknown [10.39.192.229])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id DE77EC27E92;
        Thu,  5 May 2022 06:19:32 +0000 (UTC)
Subject: Re: [PATCH v2 0/5] selinux_restorecon(3), setfiles(8): skip
 relabeling errors
To:     Petr Lautrbach <plautrba@redhat.com>,
        SELinux List <selinux@vger.kernel.org>
Cc:     "Richard W.M. Jones" <rjones@redhat.com>
References: <20220503082326.11621-1-lersek@redhat.com>
 <87pmkt8of6.fsf@redhat.com>
From:   Laszlo Ersek <lersek@redhat.com>
Message-ID: <744ffe32-85e8-2bb6-c633-d6ee93437387@redhat.com>
Date:   Thu, 5 May 2022 08:19:31 +0200
MIME-Version: 1.0
In-Reply-To: <87pmkt8of6.fsf@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On 05/04/22 14:36, Petr Lautrbach wrote:
> Laszlo Ersek <lersek@redhat.com> writes:
> 
>> Bugzilla: https://bugzilla.redhat.com/show_bug.cgi?id=1794518
>> v1:       https://lore.kernel.org/selinux/20220428065354.27605-1-lersek@redhat.com/
>>
>> In version 2, I've picked up Daniel Burgener's R-b for patch#3, and
>> moved the new symbol "selinux_restorecon_get_skipped_errors" to section
>> LIBSELINUX_3.4 of "libselinux.map" in patch#4, according to Petr's
>> feedback.
>>
>> Please CC me on all replies to the series; I'm not subscribed to the
>> SELinux mailing list. ("CONTRIBUTING.md" does not say that subscribing
>> is a requirement.)
>>
>> Cc: "Richard W.M. Jones" <rjones@redhat.com>
>> Cc: Petr Lautrbach <plautrba@redhat.com>
>>
> 
> 
> For all 5
> 
> Acked-by: Petr Lautrbach <plautrba@redhat.com>

(Commit range d108226d3fc6..2b6f7e969cf6.)

Thank you!
Laszlo

> 
> 
>> Thanks,
>> Laszlo
>>
>> Laszlo Ersek (5):
>>   setfiles: fix up inconsistent indentation
>>   setfiles: remove useless assignment and comment (after RHBZ#1926386)
>>   setfiles: remove useless "iamrestorecon" checks in option parsing
>>   selinux_restorecon: introduce SELINUX_RESTORECON_COUNT_ERRORS
>>   setfiles: introduce the -C option for distinguishing file tree walk
>>     errors
>>
>>  libselinux/include/selinux/restorecon.h                     | 15 ++++++++
>>  libselinux/man/man3/selinux_restorecon.3                    | 22 +++++++++++-
>>  libselinux/man/man3/selinux_restorecon_get_skipped_errors.3 | 28 +++++++++++++++
>>  libselinux/src/libselinux.map                               |  1 +
>>  libselinux/src/selinux_restorecon.c                         | 34 +++++++++++++++---
>>  policycoreutils/setfiles/restore.c                          |  8 +++--
>>  policycoreutils/setfiles/restore.h                          |  4 ++-
>>  policycoreutils/setfiles/setfiles.8                         | 22 ++++++++++++
>>  policycoreutils/setfiles/setfiles.c                         | 36 +++++++++-----------
>>  9 files changed, 141 insertions(+), 29 deletions(-)
>>  create mode 100644 libselinux/man/man3/selinux_restorecon_get_skipped_errors.3
>>
>>
>> base-commit: 2a167d1156578fc29541f6fb60af65452f431aae
>> -- 
>> 2.19.1.3.g30247aa5d201
> 

