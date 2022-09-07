Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 94BB95B09C5
	for <lists+selinux@lfdr.de>; Wed,  7 Sep 2022 18:10:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229561AbiIGQKy (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Wed, 7 Sep 2022 12:10:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229626AbiIGQKx (ORCPT
        <rfc822;selinux@vger.kernel.org>); Wed, 7 Sep 2022 12:10:53 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A328870BC
        for <selinux@vger.kernel.org>; Wed,  7 Sep 2022 09:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1662567049;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=4z9+yEddsqBDkcxqiJNuig3YfvOERG9s2eXvLBsjp5U=;
        b=SlNePydH2K2/pIHHvwhRA2M4n5gR+ZyrCjyYPG+dwzw29UDauozPBjOV3z3ZLqRz1L70Mz
        A/fVDzLkg8H7wnZ+/v6UuUfnA6gwDoUg6RnWMGC1zCNfr9OjIhRqzm+daqIpDbAkcJAIHv
        Ow0zKtMXT9ne3LpAXAXlDQM+ZFv02Wk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-50-WCf-OuNPMuCfBwnDPYcJvg-1; Wed, 07 Sep 2022 12:10:48 -0400
X-MC-Unique: WCf-OuNPMuCfBwnDPYcJvg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 649F82999B54
        for <selinux@vger.kernel.org>; Wed,  7 Sep 2022 16:10:48 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.40.193.113])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 0E57B2026D4C
        for <selinux@vger.kernel.org>; Wed,  7 Sep 2022 16:10:47 +0000 (UTC)
From:   Vit Mojzis <vmojzis@redhat.com>
To:     selinux@vger.kernel.org
Subject: [PATCH] Update translations
Date:   Wed,  7 Sep 2022 18:08:06 +0200
Message-Id: <20220907160806.80382-1-vmojzis@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,TVD_SPACE_RATIO,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Source: https://translate.fedoraproject.org/projects/selinux/

Please see https://github.com/SELinuxProject/selinux/pull/369

Signed-off-by: Vit Mojzis <vmojzis@redhat.com>

