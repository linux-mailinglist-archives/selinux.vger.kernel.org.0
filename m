Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B2F34C820D
	for <lists+selinux@lfdr.de>; Tue,  1 Mar 2022 05:14:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230488AbiCAEPh (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Mon, 28 Feb 2022 23:15:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230015AbiCAEPg (ORCPT
        <rfc822;selinux@vger.kernel.org>); Mon, 28 Feb 2022 23:15:36 -0500
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12F285FF3;
        Mon, 28 Feb 2022 20:14:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:In-Reply-To:References;
        bh=Y7q8xHztHnZJZqp+AmgOGlnk6MmhqXo+e6s6l5uOMGs=; b=h8j/NR5cOl5JzKRnPtHB+NbHVu
        OR9sImv2b74i6cEH2gjbr2jskNZleqM3E25rQgrTpfnqX0uxaNtS4qWmWbo6vOG+wbgOiyoNo1zLz
        BUP3l27eEXw9SI8UjOJd2NAazzRQ1BBrxp/7vL5DeU0CxKrocYkRUX7OqUj/VE/2tLe2WskF7H2QO
        qm5T7oOOiW13btr7nyN5AU77LDysy1PdRF2TavK75BNaVGNtXs+p8jf4JThopzxEzzpc6wCDAU+48
        VPlSEHaCUREgQEUPPhtFXcatDvdCnkFow+RZh4y1M6XS48QPH4tup3Y5sGAODkbooMI8NvjCIKrZG
        Gx/o/AYQ==;
Received: from [2601:1c0:6280:3f0::aa0b] (helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1nOtuZ-00Eqbn-25; Tue, 01 Mar 2022 04:14:55 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
To:     linux-doc@vger.kernel.org
Cc:     patches@lists.linux.dev, Randy Dunlap <rdunlap@infradead.org>,
        Paul Moore <paul@paul-moore.com>,
        Stephen Smalley <stephen.smalley.work@gmail.com>,
        Eric Paris <eparis@parisplace.org>, selinux@vger.kernel.org,
        Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH] docs: selinux: add '=' signs to kernel boot options
Date:   Mon, 28 Feb 2022 20:14:54 -0800
Message-Id: <20220301041454.18960-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Provide the full kernel boot option string (with ending '=' sign).
They won't work without that and that is how other boot options are
listed.

If used without an '=' sign (as listed here), they cause an "Unknown
parameters" message and are added to init's argument strings,
polluting them.

  Unknown kernel command line parameters "enforcing checkreqprot
    BOOT_IMAGE=/boot/bzImage-517rc6", will be passed to user space.

 Run /sbin/init as init process
   with arguments:
     /sbin/init
     enforcing
     checkreqprot
   with environment:
     HOME=/
     TERM=linux
     BOOT_IMAGE=/boot/bzImage-517rc6

Fixes: ^1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Paul Moore <paul@paul-moore.com>
Cc: Stephen Smalley <stephen.smalley.work@gmail.com>
Cc: Eric Paris <eparis@parisplace.org>
Cc: selinux@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>
---
 Documentation/admin-guide/kernel-parameters.txt |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- linux-next-20220228.orig/Documentation/admin-guide/kernel-parameters.txt
+++ linux-next-20220228/Documentation/admin-guide/kernel-parameters.txt
@@ -550,7 +550,7 @@
 			nosocket -- Disable socket memory accounting.
 			nokmem -- Disable kernel memory accounting.
 
-	checkreqprot	[SELINUX] Set initial checkreqprot flag value.
+	checkreqprot=	[SELINUX] Set initial checkreqprot flag value.
 			Format: { "0" | "1" }
 			See security/selinux/Kconfig help text.
 			0 -- check protection applied by kernel (includes
@@ -1409,7 +1409,7 @@
 			(in particular on some ATI chipsets).
 			The kernel tries to set a reasonable default.
 
-	enforcing	[SELINUX] Set initial enforcing status.
+	enforcing=	[SELINUX] Set initial enforcing status.
 			Format: {"0" | "1"}
 			See security/selinux/Kconfig help text.
 			0 -- permissive (log only, no denials).
