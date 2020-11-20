Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B55182BB34B
	for <lists+selinux@lfdr.de>; Fri, 20 Nov 2020 19:38:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730417AbgKTScV (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Fri, 20 Nov 2020 13:32:21 -0500
Received: from mail.kernel.org ([198.145.29.99]:51404 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730416AbgKTScV (ORCPT <rfc822;selinux@vger.kernel.org>);
        Fri, 20 Nov 2020 13:32:21 -0500
Received: from embeddedor (187-162-31-110.static.axtel.net [187.162.31.110])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D2C0B2415A;
        Fri, 20 Nov 2020 18:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605897140;
        bh=1LZU8FpZUMLgvhSd5M/jyE0eLp713Xrz3qaYf9NDI8I=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lQ2h4K/yHomv4tUQRLyfVMLME7HMghpj5JWLVl1UZ/TkGGGgBWgtaVtFS1a7riutP
         7lSdn4OnbVULu5xGcs+lZX8SAEYIllOrNMZX7y2Bpmy9ZK9kdunhTaBXpMn07u70K8
         6dYLo73W84y05FwjIIFl4ojPOmiF5K/sm8FmXL/E=
Date:   Fri, 20 Nov 2020 12:32:26 -0600
From:   "Gustavo A. R. Silva" <gustavoars@kernel.org>
To:     Paul Moore <paul@paul-moore.com>,
        Stephen Smalley <stephen.smalley.work@gmail.com>,
        Eric Paris <eparis@parisplace.org>
Cc:     selinux@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>
Subject: [PATCH 053/141] selinux: Fix fall-through warnings for Clang
Message-ID: <c543804fee333ba315ddf4056ceed79f94e10d19.1605896059.git.gustavoars@kernel.org>
References: <cover.1605896059.git.gustavoars@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1605896059.git.gustavoars@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

In preparation to enable -Wimplicit-fallthrough for Clang, fix a warning
by explicitly adding a break statement instead of letting the code fall
through to the next case.

Link: https://github.com/KSPP/linux/issues/115
Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 security/selinux/hooks.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/security/selinux/hooks.c b/security/selinux/hooks.c
index 6b1826fc3658..e57774367b3a 100644
--- a/security/selinux/hooks.c
+++ b/security/selinux/hooks.c
@@ -4029,6 +4029,7 @@ static int selinux_kernel_load_data(enum kernel_load_data_id id, bool contents)
 	switch (id) {
 	case LOADING_MODULE:
 		rc = selinux_kernel_module_from_file(NULL);
+		break;
 	default:
 		break;
 	}
-- 
2.27.0

