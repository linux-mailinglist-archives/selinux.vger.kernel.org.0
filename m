Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C4714EEF48
	for <lists+selinux@lfdr.de>; Fri,  1 Apr 2022 16:24:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233760AbiDAOZt (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Fri, 1 Apr 2022 10:25:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346597AbiDAOZs (ORCPT
        <rfc822;selinux@vger.kernel.org>); Fri, 1 Apr 2022 10:25:48 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 816F3ECB30
        for <selinux@vger.kernel.org>; Fri,  1 Apr 2022 07:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1648823038;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type;
        bh=D5K8Xv3dZCY8l8DQAmFAivHMGq+V+6t51c+5T1Ly8sM=;
        b=QHGw7Fi6VCRM7niRdR0N8vuHDc6mFgeWhVozgcU4SLq0jQofcD4pTk7lsIPkSbld2rhenK
        LyBo3kpBE8ivWq/zvCGhmGRoI1TkchTDmuzK8K+uCJT/prFaV5UKxMwMnvT5ZuC1VDt5gD
        8O7zD5ApC5794iVzFix8F7tC8CPavgk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-483-dfjkdLhTMIqIj67rPtX5RQ-1; Fri, 01 Apr 2022 10:23:57 -0400
X-MC-Unique: dfjkdLhTMIqIj67rPtX5RQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9935F3C18535
        for <selinux@vger.kernel.org>; Fri,  1 Apr 2022 14:23:56 +0000 (UTC)
Received: from localhost (unknown [10.40.194.37])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 43C2F40D2825
        for <selinux@vger.kernel.org>; Fri,  1 Apr 2022 14:23:56 +0000 (UTC)
From:   Petr Lautrbach <plautrba@redhat.com>
To:     selinux@vger.kernel.org
Subject: [PATCH] sepolgen: Update permission map
Date:   Fri, 01 Apr 2022 16:23:55 +0200
Message-ID: <87fsmwc26c.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org


https://github.com/SELinuxProject/selinux/pull/349

It's too big to be posted on this ML.

