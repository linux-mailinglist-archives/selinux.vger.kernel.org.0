Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 790C9264802
	for <lists+selinux@lfdr.de>; Thu, 10 Sep 2020 16:31:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726059AbgIJObH (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Thu, 10 Sep 2020 10:31:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730649AbgIJO2z (ORCPT
        <rfc822;selinux@vger.kernel.org>); Thu, 10 Sep 2020 10:28:55 -0400
Received: from mail-qv1-xf43.google.com (mail-qv1-xf43.google.com [IPv6:2607:f8b0:4864:20::f43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B828FC06179A
        for <selinux@vger.kernel.org>; Thu, 10 Sep 2020 07:28:18 -0700 (PDT)
Received: by mail-qv1-xf43.google.com with SMTP id ef16so3408191qvb.8
        for <selinux@vger.kernel.org>; Thu, 10 Sep 2020 07:28:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IefFgacHUhpWoa9YjlFipcfTO4+VJDWfaVWajf5JAGc=;
        b=vUPXm/vm96GdEGGCI//eZOMYpb/B6oqiqHCvmVrxuwMJFc8Ya3wffXfJptbI3i1+ut
         /iQ1pwKIAVQ7BxA9sLTpBZ/XrA8orDqd9WbdAtbfS19I6AH2B+DQtD1UHXVzYlJw8EFp
         BfdZ20yEgSd2RTGfvjoTlbR6bq1IazBYB6Sh1xKYKQPjZxzNLgS4Ja+T6aYpqxRTCaco
         mQfv2ofKVKn4kDpPbZc/rjFn0hUd4L9pEuIfwBT5hATGjqoHOVrdcwlmcsos1Z7MVJ4N
         MuHjGGbCB2Js5mCGLmZtmCpwfZ6y0UnJyUodYCzoyWeSyw7fbHVgUQaQAdnCcZMu8NNU
         7Hqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IefFgacHUhpWoa9YjlFipcfTO4+VJDWfaVWajf5JAGc=;
        b=QIUxZvCyqX8aFLQA558Re4np87JGc6z5CDZ6KjvGgY+nluPfgHMOTqXHPW8jqJFr7S
         xhTRbySMIdJB13F6YRj9EnZYNptBL7rWXGnI7z3e9kHNz34Y+QBbcPe9DI636VX4d5rW
         YtfRYRJrRCUrwQSBM2Wt76l/XDdk3SEI4kV+uMDRyw2KO9MJqmLRe2VMDvzOC5Y8rzf9
         bMWWyGd9wBOy7/nC4SW//honw7/Yp88Tb/5+2dHvk/JBkdFkWqUr7x3OpyfC8krf0JhG
         deNZECNQO/xQOYIkDp/KQLWj++tPQWouAQG6esYX3XmtqGCCCguZwSscxQbYw9MMb7HC
         RhDw==
X-Gm-Message-State: AOAM531E3pChQfiKLNl2/aUWuOTOsLd9PfuzDRm46GJ8kpRQVLEO4bIT
        Tlnzvl8+QwM3jZuHk498UII=
X-Google-Smtp-Source: ABdhPJwLp8c42otnaLNKSdoeG2UC49wosAXU6DdslUjD5QJ7vaqzWQbVx5ApUrQZ6SIND/JDGwKmAA==
X-Received: by 2002:a05:6214:805:: with SMTP id df5mr9048879qvb.78.1599748097870;
        Thu, 10 Sep 2020 07:28:17 -0700 (PDT)
Received: from puritycontrol.fios-router.home (pool-68-134-6-11.bltmmd.fios.verizon.net. [68.134.6.11])
        by smtp.gmail.com with ESMTPSA id k6sm7014301qti.23.2020.09.10.07.28.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2020 07:28:17 -0700 (PDT)
From:   Stephen Smalley <stephen.smalley.work@gmail.com>
To:     paul@paul-moore.com
Cc:     omosnace@redhat.com, selinux@vger.kernel.org,
        Stephen Smalley <stephen.smalley.work@gmail.com>
Subject: [PATCH] selinux: access policycaps with READ_ONCE/WRITE_ONCE
Date:   Thu, 10 Sep 2020 10:28:05 -0400
Message-Id: <20200910142805.20228-1-stephen.smalley.work@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Use READ_ONCE/WRITE_ONCE for all accesses to the
selinux_state.policycaps booleans to prevent compiler
mischief.

Signed-off-by: Stephen Smalley <stephen.smalley.work@gmail.com>
---
 security/selinux/include/security.h | 14 +++++++-------
 security/selinux/ss/services.c      |  3 ++-
 2 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/security/selinux/include/security.h b/security/selinux/include/security.h
index cc29177c8858..c17fed7db80a 100644
--- a/security/selinux/include/security.h
+++ b/security/selinux/include/security.h
@@ -174,49 +174,49 @@ static inline bool selinux_policycap_netpeer(void)
 {
 	struct selinux_state *state = &selinux_state;
 
-	return state->policycap[POLICYDB_CAPABILITY_NETPEER];
+	return READ_ONCE(state->policycap[POLICYDB_CAPABILITY_NETPEER]);
 }
 
 static inline bool selinux_policycap_openperm(void)
 {
 	struct selinux_state *state = &selinux_state;
 
-	return state->policycap[POLICYDB_CAPABILITY_OPENPERM];
+	return READ_ONCE(state->policycap[POLICYDB_CAPABILITY_OPENPERM]);
 }
 
 static inline bool selinux_policycap_extsockclass(void)
 {
 	struct selinux_state *state = &selinux_state;
 
-	return state->policycap[POLICYDB_CAPABILITY_EXTSOCKCLASS];
+	return READ_ONCE(state->policycap[POLICYDB_CAPABILITY_EXTSOCKCLASS]);
 }
 
 static inline bool selinux_policycap_alwaysnetwork(void)
 {
 	struct selinux_state *state = &selinux_state;
 
-	return state->policycap[POLICYDB_CAPABILITY_ALWAYSNETWORK];
+	return READ_ONCE(state->policycap[POLICYDB_CAPABILITY_ALWAYSNETWORK]);
 }
 
 static inline bool selinux_policycap_cgroupseclabel(void)
 {
 	struct selinux_state *state = &selinux_state;
 
-	return state->policycap[POLICYDB_CAPABILITY_CGROUPSECLABEL];
+	return READ_ONCE(state->policycap[POLICYDB_CAPABILITY_CGROUPSECLABEL]);
 }
 
 static inline bool selinux_policycap_nnp_nosuid_transition(void)
 {
 	struct selinux_state *state = &selinux_state;
 
-	return state->policycap[POLICYDB_CAPABILITY_NNP_NOSUID_TRANSITION];
+	return READ_ONCE(state->policycap[POLICYDB_CAPABILITY_NNP_NOSUID_TRANSITION]);
 }
 
 static inline bool selinux_policycap_genfs_seclabel_symlinks(void)
 {
 	struct selinux_state *state = &selinux_state;
 
-	return state->policycap[POLICYDB_CAPABILITY_GENFS_SECLABEL_SYMLINKS];
+	return READ_ONCE(state->policycap[POLICYDB_CAPABILITY_GENFS_SECLABEL_SYMLINKS]);
 }
 
 int security_mls_enabled(struct selinux_state *state);
diff --git a/security/selinux/ss/services.c b/security/selinux/ss/services.c
index 8dc111fbe23a..9704c8a32303 100644
--- a/security/selinux/ss/services.c
+++ b/security/selinux/ss/services.c
@@ -2123,7 +2123,8 @@ static void security_load_policycaps(struct selinux_state *state,
 	p = &policy->policydb;
 
 	for (i = 0; i < ARRAY_SIZE(state->policycap); i++)
-		state->policycap[i] = ebitmap_get_bit(&p->policycaps, i);
+		WRITE_ONCE(state->policycap[i],
+			ebitmap_get_bit(&p->policycaps, i));
 
 	for (i = 0; i < ARRAY_SIZE(selinux_policycap_names); i++)
 		pr_info("SELinux:  policy capability %s=%d\n",
-- 
2.25.1

