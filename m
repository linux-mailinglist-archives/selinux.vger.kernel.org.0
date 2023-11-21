Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A69F7F3742
	for <lists+selinux@lfdr.de>; Tue, 21 Nov 2023 21:27:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229527AbjKUU1s (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Tue, 21 Nov 2023 15:27:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229524AbjKUU1r (ORCPT
        <rfc822;selinux@vger.kernel.org>); Tue, 21 Nov 2023 15:27:47 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38BC39D
        for <selinux@vger.kernel.org>; Tue, 21 Nov 2023 12:27:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1700598460;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type;
        bh=gHuMksrYWrkCfmnmuIOXrKB5fpuHX1t2O5XesjU9wDs=;
        b=KPB2G8AeA67AfTi6FY0msOwQvCQMj9EsaF5Dg2r/uovXRxBgl6qDBedFwmuC8/Uysce5ET
        Vyk4Lu64VuUVlgT7oI4tKw4W6RHcYVVQ/n1jhCRSbkfoHZVvwTRHw14pDOvUrLyzmKPQYl
        ZrewvlbNly4S9gKQCTAW44utNkCb/ZI=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-584-yTDYnkEaPqeECehQUpWEgw-1; Tue,
 21 Nov 2023 15:27:38 -0500
X-MC-Unique: yTDYnkEaPqeECehQUpWEgw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8FABA280D476
        for <selinux@vger.kernel.org>; Tue, 21 Nov 2023 20:27:38 +0000 (UTC)
Received: from localhost (unknown [10.45.226.163])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 518CFC1596F
        for <selinux@vger.kernel.org>; Tue, 21 Nov 2023 20:27:38 +0000 (UTC)
From:   Petr Lautrbach <lautrbach@redhat.com>
To:     selinux@vger.kernel.org
Subject: getpolicyload returns 0, 2, 3, 4, ...
Date:   Tue, 21 Nov 2023 21:27:37 +0100
Message-ID: <87o7fmua12.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Hi,

Milos Malik noticed [0] that getpolicyload "skippes" 1 after first
`semodule -R`:


[root@fedora ~]# getpolicyload
0
[root@fedora ~]# semodule -R
[root@fedora ~]# getpolicyload
2
[root@fedora ~]# semodule -R
[root@fedora ~]# getpolicyload
3
[root@fedora ~]# semodule -R
[root@fedora ~]# getpolicyload
4

why it's like that?

It looks like increased sequence is not propagated after first
policyload and it's propagated to the status after the second
policyload.


[0] https://src.fedoraproject.org/tests/selinux/pull-request/451#comment-168398

