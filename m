Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 696893244C1
	for <lists+selinux@lfdr.de>; Wed, 24 Feb 2021 20:49:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232392AbhBXTta (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Wed, 24 Feb 2021 14:49:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45749 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232276AbhBXTta (ORCPT
        <rfc822;selinux@vger.kernel.org>); Wed, 24 Feb 2021 14:49:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1614196084;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type;
        bh=xUkUWb2UN7pQqPrcgAa+qQ3TvhGj02YGXcKvuE694Gw=;
        b=JME/ikqAULQgOhi7bT56XbRfnSKWqyU6xkpx+RqUFfiN+H2eipE4En2p+OaqbJ5L8atnru
        +MMQWZDHX61vdzUagtOVARSvVMykc8tRanoAmberjCO8YoR/r0hPZIXMcFjE0K7Ae2abRb
        mIjmmRSRC2qynXJB9Wc6DOw40JXMoBs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-559-r4-N3FvtMdyW96D0T8oQhA-1; Wed, 24 Feb 2021 14:48:02 -0500
X-MC-Unique: r4-N3FvtMdyW96D0T8oQhA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2EF43107ACE3
        for <selinux@vger.kernel.org>; Wed, 24 Feb 2021 19:48:01 +0000 (UTC)
Received: from localhost (unknown [10.40.193.133])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 9F5D65D9DE
        for <selinux@vger.kernel.org>; Wed, 24 Feb 2021 19:48:00 +0000 (UTC)
From:   Petr Lautrbach <plautrba@redhat.com>
To:     selinux@vger.kernel.org
Subject: Rename 'master' branch to 'main'
Date:   Wed, 24 Feb 2021 20:47:59 +0100
Message-ID: <87mtvt1c40.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Hello,

would there be any objection if 'master' was renamed to 'main' after 3.2
release?


Thanks,

Petr

