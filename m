Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 156D172CB65
	for <lists+selinux@lfdr.de>; Mon, 12 Jun 2023 18:22:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235874AbjFLQWy (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Mon, 12 Jun 2023 12:22:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234874AbjFLQWx (ORCPT
        <rfc822;selinux@vger.kernel.org>); Mon, 12 Jun 2023 12:22:53 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1190199
        for <selinux@vger.kernel.org>; Mon, 12 Jun 2023 09:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686586925;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=HjRvYIo5y+a4GfmRBU8J28/s0q5NsiLDD6WhiUD06GE=;
        b=e36TkiWmSNHAHh37oGBsyAsqS5lTduAew3SHCqdfPVXJiQcumpsG4mgU8IYyjHyorojrpQ
        D9eFnurxTTU4xkJE65bBVpcBUpE43pHvnybRQyjgPgjzpcI6Dh9v7B+IfTA7zRGkEO5bp9
        CFva607o9yvo/JCD5S+nEHlZSuaBHnY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-518-KUp4KebMP-iWPaLuk3r-mw-1; Mon, 12 Jun 2023 12:22:03 -0400
X-MC-Unique: KUp4KebMP-iWPaLuk3r-mw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B80328037AD
        for <selinux@vger.kernel.org>; Mon, 12 Jun 2023 16:22:02 +0000 (UTC)
Received: from P1.redhat.com (unknown [10.45.226.81])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 3D0022026D20;
        Mon, 12 Jun 2023 16:22:02 +0000 (UTC)
From:   Petr Lautrbach <lautrbach@redhat.com>
To:     selinux@vger.kernel.org
Cc:     vmojzis@redhat.com
Subject: 
Date:   Mon, 12 Jun 2023 18:21:12 +0200
Message-ID: <20230612162155.2604483-1-lautrbach@redhat.com>
In-Reply-To: <ef52fcda-2eaa-ee5b-9325-b5d3d753820f@redhat.com>
References: <ef52fcda-2eaa-ee5b-9325-b5d3d753820f@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org


Patch 1 and 2 updated based on Vits comments.

Patch 4 regenerated after changes in 1 and 2.

