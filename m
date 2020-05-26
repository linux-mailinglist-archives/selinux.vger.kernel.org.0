Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3EC81AD84F
	for <lists+selinux@lfdr.de>; Fri, 17 Apr 2020 10:12:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729587AbgDQIMK (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Fri, 17 Apr 2020 04:12:10 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:37242 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1729176AbgDQIMK (ORCPT
        <rfc822;selinux@vger.kernel.org>); Fri, 17 Apr 2020 04:12:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1587111127;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=k7LjEb10bVeRT7DjsS371h+y+qMH7cfpDrx+wUN1OuM=;
        b=YEgCFAe5SK1LTxBHLIXKRcLwL8JD94hV3XqjiRkwKC0vriSsW3m9OrAFK3YH/i+2eJuhg8
        apeUUNH0whw3KRA3lBQChLvWorNpBpHzdgTwVMh3TwruFebS7gsZ7Fd8bxV3kcaees80kU
        M0A4Y9AIxhqYNSYu652pE2M1GI2Krlo=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-67-onX0-aWbPNa9kfFxoRiCmw-1; Fri, 17 Apr 2020 04:12:05 -0400
X-MC-Unique: onX0-aWbPNa9kfFxoRiCmw-1
Received: by mail-wr1-f69.google.com with SMTP id t8so596161wrq.22
        for <selinux@vger.kernel.org>; Fri, 17 Apr 2020 01:12:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=k7LjEb10bVeRT7DjsS371h+y+qMH7cfpDrx+wUN1OuM=;
        b=CDNydW/cjYzvfbWKr3mga3aScT2bXnIL3UFlGftn2elQL/+jktu5fC3o6Pc59t+PQh
         qisHDfQbAkAYgdq30S3EO81+q0fdNjERw0mEFBsblfH1rXpZvt4hgfr8SXZed0h7KBpp
         WkLg83EeNQC4SzkxIevR1A/z9xKohcDURt8YjPkNaRfGGmLoKlEpDn/bJUCRK1nVGWJ2
         8GChsbYHeq4GT01vqd56xcDCwxvBM/2o4uWJqfFriXsv+3IOqr95mMwd9nykSZAbzQry
         cl00qzgeQEXlyT+fBaf5JdHWfsh9JvIBHjRr2s9IeqHgnJDwkhlBt7oEZXVpjusdwrfr
         17bA==
X-Gm-Message-State: AGi0PuboDUjYZlrmgWrXdFZTO3ZOfDWYvyNSEEWS0M5GEDX0QDRxnOWP
        qFzcJH3m0LnoLsgASctX1sEys2GLTpVoqVAiwc5JFO7ZRtsmmP9WN0Kn61og8nBu5znRNSU+BlP
        m+3D36vqR3HNpBmF1SQ==
X-Received: by 2002:a1c:2e0a:: with SMTP id u10mr2033447wmu.119.1587111124021;
        Fri, 17 Apr 2020 01:12:04 -0700 (PDT)
X-Google-Smtp-Source: APiQypJGrO8yhrcyhc68Tl//a/jB2HqMgD/gDqa98HCc1T7z3i+U4tcJqjkVjSagjBgIJZ4YwJqk0A==
X-Received: by 2002:a1c:2e0a:: with SMTP id u10mr2033428wmu.119.1587111123694;
        Fri, 17 Apr 2020 01:12:03 -0700 (PDT)
Received: from omos.redhat.com ([2a02:8308:b13f:2100:f695:3ae5:c8bf:2f57])
        by smtp.gmail.com with ESMTPSA id i17sm20862398wru.39.2020.04.17.01.12.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2020 01:12:02 -0700 (PDT)
From:   Ondrej Mosnacek <omosnace@redhat.com>
To:     selinux@vger.kernel.org, Paul Moore <paul@paul-moore.com>
Cc:     Stephen Smalley <sds@tycho.nsa.gov>,
        Jeff Vander Stoep <jeffv@google.com>
Subject: [PATCH v3 1/2] selinux: hash context structure directly
Date:   Fri, 17 Apr 2020 10:11:56 +0200
Message-Id: <20200417081157.606789-2-omosnace@redhat.com>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <20200417081157.606789-1-omosnace@redhat.com>
References: <20200417081157.606789-1-omosnace@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Always hashing the string representation is inefficient. Just hash the
contents of the structure directly (using jhash). If the context is
invalid (str & len are set), then hash the string as before, otherwise
hash the structured data.

Since the context hashing function is now faster (about 10 times), this
patch decreases the overhead of security_transition_sid(), which is
called from many hooks.

The jhash function seemed as a good choice, since it is used as the
default hashing algorithm in rhashtable.

Signed-off-by: Ondrej Mosnacek <omosnace@redhat.com>
---
 security/selinux/Makefile      |  2 +-
 security/selinux/ss/context.c  | 32 +++++++++++++++++++++++++++++++
 security/selinux/ss/context.h  |  6 ++++--
 security/selinux/ss/ebitmap.c  | 14 ++++++++++++++
 security/selinux/ss/ebitmap.h  |  1 +
 security/selinux/ss/mls.h      | 11 +++++++++++
 security/selinux/ss/policydb.c |  7 ++-----
 security/selinux/ss/services.c | 35 ++++------------------------------
 security/selinux/ss/services.h |  3 ---
 9 files changed, 69 insertions(+), 42 deletions(-)
 create mode 100644 security/selinux/ss/context.c

diff --git a/security/selinux/Makefile b/security/selinux/Makefile
index 0c77ede1cc11..4d8e0e8adf0b 100644
--- a/security/selinux/Makefile
+++ b/security/selinux/Makefile
@@ -8,7 +8,7 @@ obj-$(CONFIG_SECURITY_SELINUX) := selinux.o
 selinux-y := avc.o hooks.o selinuxfs.o netlink.o nlmsgtab.o netif.o \
 	     netnode.o netport.o status.o \
 	     ss/ebitmap.o ss/hashtab.o ss/symtab.o ss/sidtab.o ss/avtab.o \
-	     ss/policydb.o ss/services.o ss/conditional.o ss/mls.o
+	     ss/policydb.o ss/services.o ss/conditional.o ss/mls.o ss/context.o
 
 selinux-$(CONFIG_SECURITY_NETWORK_XFRM) += xfrm.o
 
diff --git a/security/selinux/ss/context.c b/security/selinux/ss/context.c
new file mode 100644
index 000000000000..fac6f92b3e99
--- /dev/null
+++ b/security/selinux/ss/context.c
@@ -0,0 +1,32 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Implementations of the security context functions.
+ *
+ * Author: Ondrej Mosnacek <omosnacek@gmail.com>
+ * Copyright (C) 2020 Red Hat, Inc.
+ */
+
+#include <linux/jhash.h>
+
+#include "context.h"
+#include "mls.h"
+
+u32 context_compute_hash(const struct context *c)
+{
+	u32 hash = 0;
+
+	/*
+	 * If a context is invalid, it will always be represented by a
+	 * context struct with only the len & str set (and vice versa)
+	 * under a given policy. Since context structs from different
+	 * policies should never meet, it is safe to hash valid and
+	 * invalid contexts differently. The context_cmp() function
+	 * already opearates under the same assumption.
+	 */
+	if (c->len)
+		return full_name_hash(NULL, c->str, c->len);
+
+	hash = jhash_3words(c->user, c->role, c->type, hash);
+	hash = mls_range_hash(&c->range, hash);
+	return hash;
+}
diff --git a/security/selinux/ss/context.h b/security/selinux/ss/context.h
index 3ba044fe02ed..e7ae7e21449b 100644
--- a/security/selinux/ss/context.h
+++ b/security/selinux/ss/context.h
@@ -196,9 +196,11 @@ static inline int context_cmp(struct context *c1, struct context *c2)
 		mls_context_cmp(c1, c2));
 }
 
-static inline unsigned int context_compute_hash(const char *s)
+u32 context_compute_hash(const struct context *c);
+
+static inline void context_add_hash(struct context *context)
 {
-	return full_name_hash(NULL, s, strlen(s));
+	context->hash = context_compute_hash(context);
 }
 
 #endif	/* _SS_CONTEXT_H_ */
diff --git a/security/selinux/ss/ebitmap.c b/security/selinux/ss/ebitmap.c
index c8c3663111e2..14bedc95c6dc 100644
--- a/security/selinux/ss/ebitmap.c
+++ b/security/selinux/ss/ebitmap.c
@@ -19,6 +19,7 @@
 #include <linux/kernel.h>
 #include <linux/slab.h>
 #include <linux/errno.h>
+#include <linux/jhash.h>
 #include <net/netlabel.h>
 #include "ebitmap.h"
 #include "policydb.h"
@@ -542,6 +543,19 @@ int ebitmap_write(struct ebitmap *e, void *fp)
 	return 0;
 }
 
+u32 ebitmap_hash(const struct ebitmap *e, u32 hash)
+{
+	struct ebitmap_node *node;
+
+	/* need to change hash even if ebitmap is empty */
+	hash = jhash_1word(e->highbit, hash);
+	for (node = e->node; node; node = node->next) {
+		hash = jhash_1word(node->startbit, hash);
+		hash = jhash(node->maps, sizeof(node->maps), hash);
+	}
+	return hash;
+}
+
 void __init ebitmap_cache_init(void)
 {
 	ebitmap_node_cachep = kmem_cache_create("ebitmap_node",
diff --git a/security/selinux/ss/ebitmap.h b/security/selinux/ss/ebitmap.h
index 9a23b81b8832..9eb2d0af2805 100644
--- a/security/selinux/ss/ebitmap.h
+++ b/security/selinux/ss/ebitmap.h
@@ -131,6 +131,7 @@ int ebitmap_set_bit(struct ebitmap *e, unsigned long bit, int value);
 void ebitmap_destroy(struct ebitmap *e);
 int ebitmap_read(struct ebitmap *e, void *fp);
 int ebitmap_write(struct ebitmap *e, void *fp);
+u32 ebitmap_hash(const struct ebitmap *e, u32 hash);
 
 #ifdef CONFIG_NETLABEL
 int ebitmap_netlbl_export(struct ebitmap *ebmap,
diff --git a/security/selinux/ss/mls.h b/security/selinux/ss/mls.h
index 7954b1e60b64..15cacde0ff61 100644
--- a/security/selinux/ss/mls.h
+++ b/security/selinux/ss/mls.h
@@ -22,7 +22,10 @@
 #ifndef _SS_MLS_H_
 #define _SS_MLS_H_
 
+#include <linux/jhash.h>
+
 #include "context.h"
+#include "ebitmap.h"
 #include "policydb.h"
 
 int mls_compute_context_len(struct policydb *p, struct context *context);
@@ -101,5 +104,13 @@ static inline int mls_import_netlbl_cat(struct policydb *p,
 }
 #endif
 
+static inline u32 mls_range_hash(const struct mls_range *r, u32 hash)
+{
+	hash = jhash_2words(r->level[0].sens, r->level[1].sens, hash);
+	hash = ebitmap_hash(&r->level[0].cat, hash);
+	hash = ebitmap_hash(&r->level[1].cat, hash);
+	return hash;
+}
+
 #endif	/* _SS_MLS_H */
 
diff --git a/security/selinux/ss/policydb.c b/security/selinux/ss/policydb.c
index 70ecdc78efbd..ac6c0a214fc5 100644
--- a/security/selinux/ss/policydb.c
+++ b/security/selinux/ss/policydb.c
@@ -836,11 +836,8 @@ int policydb_load_isids(struct policydb *p, struct sidtab *s)
 		if (!name)
 			continue;
 
-		rc = context_add_hash(p, &c->context[0]);
-		if (rc) {
-			sidtab_destroy(s);
-			goto out;
-		}
+		context_add_hash(&c->context[0]);
+
 		rc = sidtab_set_initial(s, sid, &c->context[0]);
 		if (rc) {
 			pr_err("SELinux:  unable to load initial SID %s.\n",
diff --git a/security/selinux/ss/services.c b/security/selinux/ss/services.c
index 8ad34fd031d1..e4ee6d5ed825 100644
--- a/security/selinux/ss/services.c
+++ b/security/selinux/ss/services.c
@@ -1490,38 +1490,13 @@ out:
 	return rc;
 }
 
-int context_add_hash(struct policydb *policydb,
-		     struct context *context)
-{
-	int rc;
-	char *str;
-	int len;
-
-	if (context->str) {
-		context->hash = context_compute_hash(context->str);
-	} else {
-		rc = context_struct_to_string(policydb, context,
-					      &str, &len);
-		if (rc)
-			return rc;
-		context->hash = context_compute_hash(str);
-		kfree(str);
-	}
-	return 0;
-}
-
 static int context_struct_to_sid(struct selinux_state *state,
 				 struct context *context, u32 *sid)
 {
-	int rc;
 	struct sidtab *sidtab = state->ss->sidtab;
-	struct policydb *policydb = &state->ss->policydb;
 
-	if (!context->hash) {
-		rc = context_add_hash(policydb, context);
-		if (rc)
-			return rc;
-	}
+	if (!context->hash)
+		context_add_hash(context);
 
 	return sidtab_context_to_sid(sidtab, context, sid);
 }
@@ -2120,9 +2095,7 @@ static int convert_context(struct context *oldc, struct context *newc, void *p)
 			goto bad;
 	}
 
-	rc = context_add_hash(args->newp, newc);
-	if (rc)
-		goto bad;
+	context_add_hash(newc);
 
 	return 0;
 bad:
@@ -2133,7 +2106,7 @@ bad:
 	context_destroy(newc);
 	newc->str = s;
 	newc->len = len;
-	newc->hash = context_compute_hash(s);
+	context_add_hash(newc);
 	pr_info("SELinux:  Context %s became invalid (unmapped).\n",
 		newc->str);
 	return 0;
diff --git a/security/selinux/ss/services.h b/security/selinux/ss/services.h
index e9bddf33e53d..a06f3d835216 100644
--- a/security/selinux/ss/services.h
+++ b/security/selinux/ss/services.h
@@ -8,7 +8,6 @@
 #define _SS_SERVICES_H_
 
 #include "policydb.h"
-#include "context.h"
 
 /* Mapping for a single class */
 struct selinux_mapping {
@@ -37,6 +36,4 @@ void services_compute_xperms_drivers(struct extended_perms *xperms,
 void services_compute_xperms_decision(struct extended_perms_decision *xpermd,
 					struct avtab_node *node);
 
-int context_add_hash(struct policydb *policydb, struct context *context);
-
 #endif	/* _SS_SERVICES_H_ */
-- 
2.25.2

