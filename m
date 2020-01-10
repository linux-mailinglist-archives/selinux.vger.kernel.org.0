Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 81805136F20
	for <lists+selinux@lfdr.de>; Fri, 10 Jan 2020 15:15:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727181AbgAJOPU (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Fri, 10 Jan 2020 09:15:20 -0500
Received: from mail-wr1-f54.google.com ([209.85.221.54]:38467 "EHLO
        mail-wr1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727354AbgAJOPU (ORCPT
        <rfc822;selinux@vger.kernel.org>); Fri, 10 Jan 2020 09:15:20 -0500
Received: by mail-wr1-f54.google.com with SMTP id y17so1963413wrh.5
        for <selinux@vger.kernel.org>; Fri, 10 Jan 2020 06:15:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=vB2fJqQTXRErxtXgpJG5ZTCBgLboktb/rHjtufN63BI=;
        b=D6yFIdL4KANLszp1BphxkygJQqPRUk8M7OcDmnrzyk6Zgi/nCWCjkrTfxcL1xb6L7/
         YW3CdaAph0lrKXV1tPsMLA6X18QKGoUyZ8Lnaj0U/w8ejIFqhUlssL2VtG+mvK7J4mpf
         ofXDsmsBPv1PNBNypTUmPRVDUMOxhRdT0rxZ8/UI4jsFH9nViNGKyai8ADlY8dfiBZbl
         0WsSu6gYPreJ9Yzfs1joLM8zS/K6iAXs1pN6/C6jWubdjtKljWbo54ofAsnKLI3pEu+D
         IWcy/BEdfhvpwNqKtklnkabMqFPIiBM+Y+6zkk1eYN0jGCbcaG1cJ6gGGmaD6Ntr2SBP
         TnKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vB2fJqQTXRErxtXgpJG5ZTCBgLboktb/rHjtufN63BI=;
        b=iujXSkl8TE2chO2Pd/iqxRvAWZfaLvM2rprYox8ID1WRbw3x1LPFAETm36z6Mm8PZh
         Hx0PwEA7IyXWlFmlaUKURbkMK8ZMYbpnsTVphgxdx/j4YgWkMgwLTYLZAqVZNWTzwWbE
         zARI4DfH04/3QpcKFXaF8wjfKK3VMoccio+Mm1DN7u9JBXThsRPFCt2txFLKVy1vto0e
         La9ylaWZlVmOXpL5umUwHQe7IlvDy9ojg5pRWHS29VfD+PAqY80v+hawD03pPiMyVuR5
         tlOFlf59golxgjMBxpJw8sHUWhLlUT40JQ0+fdBNlf2zmFrA5kqoK5E8Hsjr7vuUF9EC
         SfQw==
X-Gm-Message-State: APjAAAVKTw0eVL8hY/i0QnPHBE3/eRIFnNoxxkiSaZhNUlEoHD/+gYt9
        JiYVcAauh3LmL2/3FYygUlhL6GN0
X-Google-Smtp-Source: APXvYqxdbeSnLPy9Sfnq+ichxZbK70jNeaGr4uY/te0Y+VKlunRSyXPku3EOhN8668/7i9HF1OoQ+g==
X-Received: by 2002:a5d:690e:: with SMTP id t14mr3811844wru.65.1578665718109;
        Fri, 10 Jan 2020 06:15:18 -0800 (PST)
Received: from desktopdebian.localdomain (x4d03413a.dyn.telefonica.de. [77.3.65.58])
        by smtp.gmail.com with ESMTPSA id q15sm2369509wrr.11.2020.01.10.06.15.17
        for <selinux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2020 06:15:17 -0800 (PST)
From:   =?UTF-8?q?Christian=20G=C3=B6ttsche?= <cgzones@googlemail.com>
To:     selinux@vger.kernel.org
Subject: [RFC PATCH 3/3] libselinux: add policy capability test binary
Date:   Fri, 10 Jan 2020 15:15:09 +0100
Message-Id: <20200110141509.21098-4-cgzones@googlemail.com>
X-Mailer: git-send-email 2.25.0.rc2
In-Reply-To: <20200110141509.21098-1-cgzones@googlemail.com>
References: <20200110141509.21098-1-cgzones@googlemail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

---
 libselinux/utils/.gitignore       |  1 +
 libselinux/utils/polcap_enabled.c | 30 ++++++++++++++++++++++++++++++
 2 files changed, 31 insertions(+)
 create mode 100644 libselinux/utils/polcap_enabled.c

diff --git a/libselinux/utils/.gitignore b/libselinux/utils/.gitignore
index 3ef34374..bfe1db4d 100644
--- a/libselinux/utils/.gitignore
+++ b/libselinux/utils/.gitignore
@@ -12,6 +12,7 @@ getpidcon
 getsebool
 getseuser
 matchpathcon
+polcap_enabled
 policyvers
 sefcontext_compile
 selabel_digest
diff --git a/libselinux/utils/polcap_enabled.c b/libselinux/utils/polcap_enabled.c
new file mode 100644
index 00000000..e984d1e4
--- /dev/null
+++ b/libselinux/utils/polcap_enabled.c
@@ -0,0 +1,30 @@
+#include <errno.h>
+#include <stdio.h>
+#include <string.h>
+
+#include <selinux/selinux.h>
+
+int main(int argc, char **argv)
+{
+	int ret;
+
+	if (argc != 2) {
+		printf("usage: %s polcap_name\n", argv[0]);
+		return 1;
+	}
+
+	ret = security_is_policy_capability_enabled(argv[1]);
+
+	if (ret == 1)
+		printf("enabled\n");
+	else if (ret == 0)
+		printf("disabled\n");
+	else if (errno == ENOTSUP)
+		printf("not supported\n");
+	else {
+		printf("error (%d): %s\n", errno, strerror(errno));
+		return 1;
+	}
+
+	return 0;
+}
-- 
2.25.0.rc2

