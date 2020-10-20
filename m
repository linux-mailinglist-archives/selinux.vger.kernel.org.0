Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C857828897A
	for <lists+selinux@lfdr.de>; Fri,  9 Oct 2020 15:01:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732456AbgJINBC (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Fri, 9 Oct 2020 09:01:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28330 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729347AbgJINBB (ORCPT
        <rfc822;selinux@vger.kernel.org>); Fri, 9 Oct 2020 09:01:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1602248461;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=yIpDrwWq433mFhVBybGz+ZT24Gz7TiggU/au+0Ww/xE=;
        b=ULC6OjYunLTmKD6R3VY7DkqdRh3PKhUFerC/rgBjMGTQOCuKulzL5D0xLC9pNQ8KssOkbV
        xwwy/OzKifiuT3uW5x+aQriP74h2Jg4gFP1ygCbqnKnqoS42ya13hyrdKveC1WtCPJVUcg
        pktMx7/5swNJ02RVRjG8qifYQislguo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-25-0a5yo83ZOI2L5vJNebmZ8g-1; Fri, 09 Oct 2020 09:00:58 -0400
X-MC-Unique: 0a5yo83ZOI2L5vJNebmZ8g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1F57319080BB
        for <selinux@vger.kernel.org>; Fri,  9 Oct 2020 13:00:57 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.40.193.213])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 6345476647
        for <selinux@vger.kernel.org>; Fri,  9 Oct 2020 13:00:56 +0000 (UTC)
From:   Petr Lautrbach <plautrba@redhat.com>
To:     selinux@vger.kernel.org
Subject: libsepol, libsemanage: drop duplicate and deprecated symbols
Date:   Fri,  9 Oct 2020 15:00:46 +0200
Message-Id: <20201009130052.52409-1-plautrba@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org


This is followup of
https://lore.kernel.org/selinux/20200930145031.910190-1-plautrba@redhat.com/T/#t

Change against 1 version:

- improved commit messages with references to Debian and Fedora guidelines
- drop deprecated functions from libsepol/src/deprecated_functions.c and
- semanage_module_enable/semanage_module_disable from libsemanage

