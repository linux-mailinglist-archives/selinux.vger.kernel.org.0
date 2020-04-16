Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40E341ACB33
	for <lists+selinux@lfdr.de>; Thu, 16 Apr 2020 17:46:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2410348AbgDPPoi (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Thu, 16 Apr 2020 11:44:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2395504AbgDPPoh (ORCPT
        <rfc822;selinux@vger.kernel.org>); Thu, 16 Apr 2020 11:44:37 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BDBCC061A10
        for <selinux@vger.kernel.org>; Thu, 16 Apr 2020 08:44:37 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id d17so1830578pgo.0
        for <selinux@vger.kernel.org>; Thu, 16 Apr 2020 08:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=zinydhZTS7ZFQXHDqJakUjvKtN1SGrUoEJDQesMA15w=;
        b=QD0DRzHIBcHE7omT5f6kNF3zGfQIOuqpd7Z9gXnK/zTyjudBFukP3EfgatWhWuNqFx
         L9H3Qy4eCj0jHW3RdGvLeCkukZfwLzJ0aZZaDIrAufhYKEIvd3cbu3I8Q/6UShkn5cJK
         hkjEz3ObQ3yxuhrDJCvkN4o9vnD4EJjaOQPOCAskjJ8zcW5VlhPK9aVMwCxok2wVpTLK
         LjV0XQbny2B8BKzD3cGLfmQid3m3ElbEY4GhT24Gdlbrp1pGXAVmXL8HIOPoDX0FdC10
         M52nLvboqJ1sOHXsQAH/CZw10x25I0MEBP6xmNrdvG6EuE4F6YunLn9jYcPlfqnpHj/w
         QCoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=zinydhZTS7ZFQXHDqJakUjvKtN1SGrUoEJDQesMA15w=;
        b=Bp51d0HLS3YyAu7W2IHcsVWMVYCyhZRXcIF4wLmFp/OocyAngUEtDvKNnJuqjDTtAo
         YzLJInESP0MRv161OiID+MwltLOHf7HJ/t9uw8aKhJfRtNshynTUs5QfM4h+hlt7Eyof
         zpxEAbyzK9w3dwwBqqRR1zcS1fwtzmJa8TYmWaoCwzpDrXHMOAR4bpbD6SquW+1PkdWA
         cuw6UqPn3uDSd9/m9g/h4IcTVPk7J+ojF/tkX8TH6aVjfd4L9QBHIRvKbIkg9YwYagVn
         glfS7gFOWEnPINc3Hck6OlJEgzIy70qz8IDyTRDgzJFteEPetBEgAwdLAdF48nYdit8i
         e3ww==
X-Gm-Message-State: AGi0Pubvxm22UdyKlFcdLwg2YIvIx57DvKLCGK4rhNdEqrLwf9yVMZJQ
        y8jP4sXHIlLhZtrGVeaBfcg=
X-Google-Smtp-Source: APiQypIZUPFvWIgOCHSKSv6883R+fSypE+R3qki0zAO0R3uHduSsq2I9PWusEk1nwt/C+0B1i9IrGA==
X-Received: by 2002:a62:164d:: with SMTP id 74mr17425796pfw.52.1587051876947;
        Thu, 16 Apr 2020 08:44:36 -0700 (PDT)
Received: from localhost.localdomain ([192.55.55.45])
        by smtp.gmail.com with ESMTPSA id g25sm16888626pfh.55.2020.04.16.08.44.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2020 08:44:36 -0700 (PDT)
From:   bill.c.roberts@gmail.com
X-Google-Original-From: william.c.roberts@intel.com
To:     bill.c.roberts@gmail.com
Cc:     plautrba@redhat.com, sds@tycho.nsa.gov, selinux@vger.kernel.org,
        William Roberts <william.c.roberts@intel.com>
Subject: [PATCH v2 18/18] utils: matchpathcon add deprecated warning
Date:   Thu, 16 Apr 2020 10:43:52 -0500
Message-Id: <20200416154352.21619-19-william.c.roberts@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200416154352.21619-1-william.c.roberts@intel.com>
References: <20200225200219.6163-1-william.c.roberts@intel.com>
 <20200416154352.21619-1-william.c.roberts@intel.com>
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

From: William Roberts <william.c.roberts@intel.com>

Add a deprecated warning to matchpathcon encouraging users to switch to
selabel_lookup.

Signed-off-by: William Roberts <william.c.roberts@intel.com>
---
 libselinux/utils/matchpathcon.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/libselinux/utils/matchpathcon.c b/libselinux/utils/matchpathcon.c
index 3d94af365071..2615a7fd3d25 100644
--- a/libselinux/utils/matchpathcon.c
+++ b/libselinux/utils/matchpathcon.c
@@ -76,6 +76,9 @@ int main(int argc, char **argv)
 	int error = 0;
 	int quiet = 0;
 
+	fprintf(stderr,
+		"Deprecated, use selabel_lookup\n");
+
 	if (argc < 2)
 		usage(argv[0]);
 
-- 
2.17.1

