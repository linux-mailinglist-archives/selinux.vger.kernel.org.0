Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C7617D6777
	for <lists+selinux@lfdr.de>; Wed, 25 Oct 2023 11:50:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233496AbjJYJuC (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Wed, 25 Oct 2023 05:50:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234088AbjJYJuB (ORCPT
        <rfc822;selinux@vger.kernel.org>); Wed, 25 Oct 2023 05:50:01 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8428ECE
        for <selinux@vger.kernel.org>; Wed, 25 Oct 2023 02:49:57 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id B23EF21D93;
        Wed, 25 Oct 2023 09:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1698227395; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
        bh=EeSSQ7yrsJpMdwDrrdBndyT566cl836obOjvUslRkIc=;
        b=LxAgonD9VIPfH8d3XtfQ3WnxgfCKKiQDMlqGtBs6bcT1zYlZ8FvK0nrDMzyvPYbRTmeC4t
        OBImoC41dCZIivQnv6VYuoiVWIFworwhjuatDMHM5Jwnyai/WHNR16WwFDue+AScYdTM1y
        KmFJNB0e7g/C8gMt2mI4yf8uPlJFJxQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1698227395;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
        bh=EeSSQ7yrsJpMdwDrrdBndyT566cl836obOjvUslRkIc=;
        b=A16XWtUkE0vRdaonggJTQrua1CL6lU5er2sFLqzDKcL/e0Red8DDBP85MFXe4+y5kdw8L9
        1TEBuqgqAm1NgiCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 97309138E9;
        Wed, 25 Oct 2023 09:49:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id tbvUI8PkOGX1JwAAMHmgww
        (envelope-from <cahu@suse.de>); Wed, 25 Oct 2023 09:49:55 +0000
From:   Cathy Hu <cahu@suse.de>
To:     selinux@vger.kernel.org
Cc:     selinux@suse.de, Cathy Hu <cahu@suse.de>
Subject: [PATCH] sepolicy/manpage.py: make output deterministic
Date:   Wed, 25 Oct 2023 11:49:23 +0200
Message-ID: <20231025094923.248941-1-cahu@suse.de>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
        none
X-Spam-Level: 
X-Spam-Score: 0.82
X-Spamd-Result: default: False [0.82 / 50.00];
         ARC_NA(0.00)[];
         RCVD_VIA_SMTP_AUTH(0.00)[];
         FROM_HAS_DN(0.00)[];
         RCPT_COUNT_THREE(0.00)[3];
         TO_DN_SOME(0.00)[];
         TO_MATCH_ENVRCPT_ALL(0.00)[];
         MIME_GOOD(-0.10)[text/plain];
         R_MISSING_CHARSET(2.50)[];
         BROKEN_CONTENT_TYPE(1.50)[];
         NEURAL_HAM_LONG(-3.00)[-1.000];
         DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
         NEURAL_HAM_SHORT(-1.00)[-1.000];
         MID_CONTAINS_FROM(1.00)[];
         FROM_EQ_ENVFROM(0.00)[];
         MIME_TRACE(0.00)[0:+];
         RCVD_COUNT_TWO(0.00)[2];
         RCVD_TLS_ALL(0.00)[];
         BAYES_HAM(-0.08)[63.81%]
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

The list entries in the alphabetically grouped dict are
not sorted, which results in non-deterministic output for
index.html.

Sort entries of those lists to make the output deterministic
to be able to have reproducible builds.

See https://reproducible-builds.org/ for reasoning.
This patch was done while working on reproducible builds for openSUSE.
---
 python/sepolicy/sepolicy/manpage.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/python/sepolicy/sepolicy/manpage.py b/python/sepolicy/sepolicy/manpage.py
index a488dcbf..62999019 100755
--- a/python/sepolicy/sepolicy/manpage.py
+++ b/python/sepolicy/sepolicy/manpage.py
@@ -156,7 +156,7 @@ def get_alphabet_manpages(manpage_list):
             if j.split("/")[-1][0] == i:
                 temp.append(j.split("/")[-1])
 
-        alphabet_manpages[i] = temp
+        alphabet_manpages[i] = sorted(temp)
 
     return alphabet_manpages
 
-- 
2.42.0

