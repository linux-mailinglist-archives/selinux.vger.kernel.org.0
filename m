Return-Path: <selinux+bounces-3654-lists+selinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6139CAB8762
	for <lists+selinux@lfdr.de>; Thu, 15 May 2025 15:10:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6A00B1B65D16
	for <lists+selinux@lfdr.de>; Thu, 15 May 2025 13:10:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FD68299AAB;
	Thu, 15 May 2025 13:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W+PBl1tX"
X-Original-To: selinux@vger.kernel.org
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4465C298CBE
	for <selinux@vger.kernel.org>; Thu, 15 May 2025 13:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747314627; cv=none; b=Dnw94ChWGxvdm64ew/xDM8GowUTkHkKI1dcHe6KENbPKr61iNIa27x31blDuGGMnEwx4wxpjsNLBApLPqUZ6kqCOSpRmEjUWutsM0WrZi+b1KqKQO8WhhrhHdRp3jJqJGj9WfxMyF95VZTDX3DY11a/kIVrZ3H0H417MKP0zuYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747314627; c=relaxed/simple;
	bh=4BmyP7EQQWAgsS3eAmWx+L5cn8o8iL/SNjWbrf08bwQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O/b1FuIyE4JDRQ1Fcz4USzHz6NqgaVHjK0WQwC4otNmQ7zOzTm+v4bwVhiv72eFWQ4lQETEdI4jfjj6nmF18NDy1EO5VdPJiUNOZHWPYB7dMcerlFPUDzNQLUgy2mvRLO2nCaIFCiVp0pekqJ2+AWnd4QS+gpkvEOK9RyxQNeXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W+PBl1tX; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-4947635914aso9638891cf.3
        for <selinux@vger.kernel.org>; Thu, 15 May 2025 06:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747314618; x=1747919418; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6duY2m75HCB1J2wtPnXz/glq+BlgHcFDGQVmrn48SdE=;
        b=W+PBl1tXV1mp+TVfBxbfhDD2f7j52kE26UDmr/lQkRwGNJVD5KsH8UvQZpifgWmI8L
         A1pocs5o1cHwhhORsB4LfQDs5mGGbY8iExFQa9YDB0aBCs/RZl9rQW+7AbuxLeT+bJQT
         TxnDXKaoizn1hoGG2eWFGMRu8p+SVct8RfyLwWKO07ilHAGS89GGzGmCRYzXFI/GeB/t
         IVE+sU0q4chwI6HWtDl3o2ZVG3rPPExyMe7SJ3nrtogZi3p5dpwkk9l/dpEHF23NOfSn
         r87QZrKEi0+wGFlHv+NM54S/FJPY/FQZy3jriWsMa6jLn/Ph5MCH2slsY1+9DVTF/5H1
         Ro3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747314618; x=1747919418;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6duY2m75HCB1J2wtPnXz/glq+BlgHcFDGQVmrn48SdE=;
        b=G3pSHTuedLNfUUVoPiK+qwM1+aDRtYJ3e3TBdjtJ4AZsSivEpEq0mhx3p1FFra9pj+
         shyWBqPjdDlPocedCL/abvvuHDK+DKfHFECBmvWbN4h6rYqx3wBb9JMkrmZrlSph4NgL
         uluybxEpyn6Ecn/75qJR9eIjme0FETI0lRYMSuKoSpoR7llO4czpgKwnEzlFkYLeHgAj
         yueEABLmBG3LvwwDL5/fQjkIklIp0SV9BTBDoIbbvTfEfc1Z0ujhtgl8Uxr/u3p4zipj
         PnaP4gfpKLHc8kjuV4ij95Shx6RSYF6rsXxc2GkZwpOl4IXS4MR+JQkN/bQc8scMKvU2
         IInw==
X-Gm-Message-State: AOJu0Ywn+MFOUCqd3S5SE1zvOwoch6eWtnNH42jRdkaqq1AnpDDS0pjj
	i99fT+MmoGkVgUmc6SeyKZhzKdO8eto4cuEWVSZyZb+o3QnCDXsoCCjelQ==
X-Gm-Gg: ASbGncsrdbEWo36C3P+dDkodpZ03NKTw6f3dDfMICYzTzgefpezQ0zc+ScLH/wsiSM1
	b6B/HMze1AazD6hkQh+zrkn4ZAah1inNspGzMSuaKjOGZWaGlri3WIf2EjF7UK9l2j3s10o3KCk
	hjJKVgXspz/eXoXjvjizMys/n2sl/xArG2meiB5N9m1QQFdZ9ebDacnys4TVIk9XdHIazyyez8T
	gsOpnLN3z4WP0/ONUM2ZNUDSfCn2Tu6JCQJdZUA9EcTeTKzsK9D1oQYyLtTOwceuTC6OyabREu6
	3KOTRG6fb7OXtAws18FN7nzgmBhu/ltsjgmLoFqdSp6TGA8WfxMX8ruUh8Go0rv7I9ldJW8Es5I
	rG/XOkS6RYGk1mTxcZi6TK9fYL3Pa0bMUAfGpcZZzb7ZL+ix8uv+7LQ==
X-Google-Smtp-Source: AGHT+IEhnjqO367+ssVRiJ+ytEHfhanCg/Mnfx8pPS3QrEoUgSdPJovA2D2suHGdEHPhd5F9kQm+fQ==
X-Received: by 2002:a05:622a:5917:b0:494:acbc:ef44 with SMTP id d75a77b69052e-494acbcf015mr2491541cf.28.1747314616273;
        Thu, 15 May 2025 06:10:16 -0700 (PDT)
Received: from fedora.. (ec2-52-70-167-183.compute-1.amazonaws.com. [52.70.167.183])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-49452583e88sm91723891cf.63.2025.05.15.06.10.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 06:10:15 -0700 (PDT)
From: Stephen Smalley <stephen.smalley.work@gmail.com>
To: selinux@vger.kernel.org
Cc: paul@paul-moore.com,
	omosnace@redhat.com,
	Stephen Smalley <stephen.smalley.work@gmail.com>
Subject: [PATCH v2 01/49] selinux: restore passing of selinux_state
Date: Thu, 15 May 2025 09:08:59 -0400
Message-ID: <20250515130947.52806-2-stephen.smalley.work@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250515130947.52806-1-stephen.smalley.work@gmail.com>
References: <20250515130947.52806-1-stephen.smalley.work@gmail.com>
Precedence: bulk
X-Mailing-List: selinux@vger.kernel.org
List-Id: <selinux.vger.kernel.org>
List-Subscribe: <mailto:selinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:selinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This reverts commit e67b79850fcc4eb5 ("selinux: stop passing selinux_state
pointers and their offspring"). This change is necessary in order to
support SELinux namespaces.

Signed-off-by: Stephen Smalley <stephen.smalley.work@gmail.com>
---
 security/selinux/avc.c                 | 223 +++++-----
 security/selinux/hooks.c               | 569 +++++++++++++++----------
 security/selinux/ibpkey.c              |   2 +-
 security/selinux/ima.c                 |  37 +-
 security/selinux/include/avc.h         |  42 +-
 security/selinux/include/avc_ss.h      |   3 +-
 security/selinux/include/conditional.h |   4 +-
 security/selinux/include/ima.h         |  11 +-
 security/selinux/include/security.h    | 163 ++++---
 security/selinux/netif.c               |   2 +-
 security/selinux/netlabel.c            |  17 +-
 security/selinux/netnode.c             |   4 +-
 security/selinux/netport.c             |   2 +-
 security/selinux/selinuxfs.c           | 206 +++++----
 security/selinux/ss/services.c         | 349 +++++++++------
 security/selinux/ss/services.h         |   1 +
 security/selinux/status.c              |  44 +-
 security/selinux/xfrm.c                |  20 +-
 18 files changed, 1021 insertions(+), 678 deletions(-)

diff --git a/security/selinux/avc.c b/security/selinux/avc.c
index 4b4837a20225..1be359d9758c 100644
--- a/security/selinux/avc.c
+++ b/security/selinux/avc.c
@@ -93,7 +93,7 @@ struct selinux_avc {
 
 static struct selinux_avc selinux_avc;
 
-void selinux_avc_init(void)
+void selinux_avc_init(struct selinux_avc **avc)
 {
 	int i;
 
@@ -104,16 +104,18 @@ void selinux_avc_init(void)
 	}
 	atomic_set(&selinux_avc.avc_cache.active_nodes, 0);
 	atomic_set(&selinux_avc.avc_cache.lru_hint, 0);
+	*avc = &selinux_avc;
 }
 
-unsigned int avc_get_cache_threshold(void)
+unsigned int avc_get_cache_threshold(struct selinux_avc *avc)
 {
-	return selinux_avc.avc_cache_threshold;
+	return avc->avc_cache_threshold;
 }
 
-void avc_set_cache_threshold(unsigned int cache_threshold)
+void avc_set_cache_threshold(struct selinux_avc *avc,
+			     unsigned int cache_threshold)
 {
-	selinux_avc.avc_cache_threshold = cache_threshold;
+	avc->avc_cache_threshold = cache_threshold;
 }
 
 static struct avc_callback_node *avc_callbacks __ro_after_init;
@@ -140,7 +142,7 @@ void __init avc_init(void)
 	avc_xperms_data_cachep = KMEM_CACHE(extended_perms_data, SLAB_PANIC);
 }
 
-int avc_get_hash_stats(char *page)
+int avc_get_hash_stats(struct selinux_avc *avc, char *page)
 {
 	int i, chain_len, max_chain_len, slots_used;
 	struct avc_node *node;
@@ -151,7 +153,7 @@ int avc_get_hash_stats(char *page)
 	slots_used = 0;
 	max_chain_len = 0;
 	for (i = 0; i < AVC_CACHE_SLOTS; i++) {
-		head = &selinux_avc.avc_cache.slots[i];
+		head = &avc->avc_cache.slots[i];
 		if (!hlist_empty(head)) {
 			slots_used++;
 			chain_len = 0;
@@ -166,7 +168,7 @@ int avc_get_hash_stats(char *page)
 
 	return scnprintf(page, PAGE_SIZE, "entries: %d\nbuckets used: %d/%d\n"
 			 "longest chain: %d\n",
-			 atomic_read(&selinux_avc.avc_cache.active_nodes),
+			 atomic_read(&avc->avc_cache.active_nodes),
 			 slots_used, AVC_CACHE_SLOTS, max_chain_len);
 }
 
@@ -410,7 +412,8 @@ static inline u32 avc_xperms_audit_required(u32 requested,
 	return audited;
 }
 
-static inline int avc_xperms_audit(u32 ssid, u32 tsid, u16 tclass,
+static inline int avc_xperms_audit(struct selinux_state *state,
+				   u32 ssid, u32 tsid, u16 tclass,
 				   u32 requested, struct av_decision *avd,
 				   struct extended_perms_decision *xpd,
 				   u8 perm, int result,
@@ -422,7 +425,7 @@ static inline int avc_xperms_audit(u32 ssid, u32 tsid, u16 tclass,
 			requested, avd, xpd, perm, result, &denied);
 	if (likely(!audited))
 		return 0;
-	return slow_avc_audit(ssid, tsid, tclass, requested,
+	return slow_avc_audit(state, ssid, tsid, tclass, requested,
 			audited, denied, result, ad);
 }
 
@@ -434,29 +437,30 @@ static void avc_node_free(struct rcu_head *rhead)
 	avc_cache_stats_incr(frees);
 }
 
-static void avc_node_delete(struct avc_node *node)
+static void avc_node_delete(struct selinux_avc *avc, struct avc_node *node)
 {
 	hlist_del_rcu(&node->list);
 	call_rcu(&node->rhead, avc_node_free);
-	atomic_dec(&selinux_avc.avc_cache.active_nodes);
+	atomic_dec(&avc->avc_cache.active_nodes);
 }
 
-static void avc_node_kill(struct avc_node *node)
+static void avc_node_kill(struct selinux_avc *avc, struct avc_node *node)
 {
 	avc_xperms_free(node->ae.xp_node);
 	kmem_cache_free(avc_node_cachep, node);
 	avc_cache_stats_incr(frees);
-	atomic_dec(&selinux_avc.avc_cache.active_nodes);
+	atomic_dec(&avc->avc_cache.active_nodes);
 }
 
-static void avc_node_replace(struct avc_node *new, struct avc_node *old)
+static void avc_node_replace(struct selinux_avc *avc,
+			     struct avc_node *new, struct avc_node *old)
 {
 	hlist_replace_rcu(&old->list, &new->list);
 	call_rcu(&old->rhead, avc_node_free);
-	atomic_dec(&selinux_avc.avc_cache.active_nodes);
+	atomic_dec(&avc->avc_cache.active_nodes);
 }
 
-static inline int avc_reclaim_node(void)
+static inline int avc_reclaim_node(struct selinux_avc *avc)
 {
 	struct avc_node *node;
 	int hvalue, try, ecx;
@@ -465,17 +469,17 @@ static inline int avc_reclaim_node(void)
 	spinlock_t *lock;
 
 	for (try = 0, ecx = 0; try < AVC_CACHE_SLOTS; try++) {
-		hvalue = atomic_inc_return(&selinux_avc.avc_cache.lru_hint) &
+		hvalue = atomic_inc_return(&avc->avc_cache.lru_hint) &
 			(AVC_CACHE_SLOTS - 1);
-		head = &selinux_avc.avc_cache.slots[hvalue];
-		lock = &selinux_avc.avc_cache.slots_lock[hvalue];
+		head = &avc->avc_cache.slots[hvalue];
+		lock = &avc->avc_cache.slots_lock[hvalue];
 
 		if (!spin_trylock_irqsave(lock, flags))
 			continue;
 
 		rcu_read_lock();
 		hlist_for_each_entry(node, head, list) {
-			avc_node_delete(node);
+			avc_node_delete(avc, node);
 			avc_cache_stats_incr(reclaims);
 			ecx++;
 			if (ecx >= AVC_CACHE_RECLAIM) {
@@ -491,7 +495,7 @@ static inline int avc_reclaim_node(void)
 	return ecx;
 }
 
-static struct avc_node *avc_alloc_node(void)
+static struct avc_node *avc_alloc_node(struct selinux_avc *avc)
 {
 	struct avc_node *node;
 
@@ -502,9 +506,9 @@ static struct avc_node *avc_alloc_node(void)
 	INIT_HLIST_NODE(&node->list);
 	avc_cache_stats_incr(allocations);
 
-	if (atomic_inc_return(&selinux_avc.avc_cache.active_nodes) >
-	    selinux_avc.avc_cache_threshold)
-		avc_reclaim_node();
+	if (atomic_inc_return(&avc->avc_cache.active_nodes) >
+	    avc->avc_cache_threshold)
+		avc_reclaim_node(avc);
 
 out:
 	return node;
@@ -518,14 +522,15 @@ static void avc_node_populate(struct avc_node *node, u32 ssid, u32 tsid, u16 tcl
 	memcpy(&node->ae.avd, avd, sizeof(node->ae.avd));
 }
 
-static inline struct avc_node *avc_search_node(u32 ssid, u32 tsid, u16 tclass)
+static inline struct avc_node *avc_search_node(struct selinux_avc *avc,
+					       u32 ssid, u32 tsid, u16 tclass)
 {
 	struct avc_node *node, *ret = NULL;
 	u32 hvalue;
 	struct hlist_head *head;
 
 	hvalue = avc_hash(ssid, tsid, tclass);
-	head = &selinux_avc.avc_cache.slots[hvalue];
+	head = &avc->avc_cache.slots[hvalue];
 	hlist_for_each_entry_rcu(node, head, list) {
 		if (ssid == node->ae.ssid &&
 		    tclass == node->ae.tclass &&
@@ -540,6 +545,7 @@ static inline struct avc_node *avc_search_node(u32 ssid, u32 tsid, u16 tclass)
 
 /**
  * avc_lookup - Look up an AVC entry.
+ * @avc: the access vector cache
  * @ssid: source security identifier
  * @tsid: target security identifier
  * @tclass: target security class
@@ -550,12 +556,13 @@ static inline struct avc_node *avc_search_node(u32 ssid, u32 tsid, u16 tclass)
  * then this function returns the avc_node.
  * Otherwise, this function returns NULL.
  */
-static struct avc_node *avc_lookup(u32 ssid, u32 tsid, u16 tclass)
+static struct avc_node *avc_lookup(struct selinux_avc *avc,
+				   u32 ssid, u32 tsid, u16 tclass)
 {
 	struct avc_node *node;
 
 	avc_cache_stats_incr(lookups);
-	node = avc_search_node(ssid, tsid, tclass);
+	node = avc_search_node(avc, ssid, tsid, tclass);
 
 	if (node)
 		return node;
@@ -564,7 +571,8 @@ static struct avc_node *avc_lookup(u32 ssid, u32 tsid, u16 tclass)
 	return NULL;
 }
 
-static int avc_latest_notif_update(u32 seqno, int is_insert)
+static int avc_latest_notif_update(struct selinux_avc *avc,
+				   u32 seqno, int is_insert)
 {
 	int ret = 0;
 	static DEFINE_SPINLOCK(notif_lock);
@@ -572,14 +580,14 @@ static int avc_latest_notif_update(u32 seqno, int is_insert)
 
 	spin_lock_irqsave(&notif_lock, flag);
 	if (is_insert) {
-		if (seqno < selinux_avc.avc_cache.latest_notif) {
+		if (seqno < avc->avc_cache.latest_notif) {
 			pr_warn("SELinux: avc:  seqno %d < latest_notif %d\n",
-			       seqno, selinux_avc.avc_cache.latest_notif);
+			       seqno, avc->avc_cache.latest_notif);
 			ret = -EAGAIN;
 		}
 	} else {
-		if (seqno > selinux_avc.avc_cache.latest_notif)
-			selinux_avc.avc_cache.latest_notif = seqno;
+		if (seqno > avc->avc_cache.latest_notif)
+			avc->avc_cache.latest_notif = seqno;
 	}
 	spin_unlock_irqrestore(&notif_lock, flag);
 
@@ -588,6 +596,7 @@ static int avc_latest_notif_update(u32 seqno, int is_insert)
 
 /**
  * avc_insert - Insert an AVC entry.
+ * @avc: the access vector cache
  * @ssid: source security identifier
  * @tsid: target security identifier
  * @tclass: target security class
@@ -603,7 +612,7 @@ static int avc_latest_notif_update(u32 seqno, int is_insert)
  * revocation notification, then the function copies
  * the access vectors into a cache entry.
  */
-static void avc_insert(u32 ssid, u32 tsid, u16 tclass,
+static void avc_insert(struct selinux_avc *avc, u32 ssid, u32 tsid, u16 tclass,
 		       struct av_decision *avd, struct avc_xperms_node *xp_node)
 {
 	struct avc_node *pos, *node = NULL;
@@ -612,28 +621,28 @@ static void avc_insert(u32 ssid, u32 tsid, u16 tclass,
 	spinlock_t *lock;
 	struct hlist_head *head;
 
-	if (avc_latest_notif_update(avd->seqno, 1))
+	if (avc_latest_notif_update(avc, avd->seqno, 1))
 		return;
 
-	node = avc_alloc_node();
+	node = avc_alloc_node(avc);
 	if (!node)
 		return;
 
 	avc_node_populate(node, ssid, tsid, tclass, avd);
 	if (avc_xperms_populate(node, xp_node)) {
-		avc_node_kill(node);
+		avc_node_kill(avc, node);
 		return;
 	}
 
 	hvalue = avc_hash(ssid, tsid, tclass);
-	head = &selinux_avc.avc_cache.slots[hvalue];
-	lock = &selinux_avc.avc_cache.slots_lock[hvalue];
+	head = &avc->avc_cache.slots[hvalue];
+	lock = &avc->avc_cache.slots_lock[hvalue];
 	spin_lock_irqsave(lock, flag);
 	hlist_for_each_entry(pos, head, list) {
 		if (pos->ae.ssid == ssid &&
 			pos->ae.tsid == tsid &&
 			pos->ae.tclass == tclass) {
-			avc_node_replace(node, pos);
+			avc_node_replace(avc, node, pos);
 			goto found;
 		}
 	}
@@ -700,14 +709,14 @@ static void avc_audit_post_callback(struct audit_buffer *ab, void *a)
 	u32 tcontext_len;
 	int rc;
 
-	rc = security_sid_to_context(sad->ssid, &scontext,
+	rc = security_sid_to_context(sad->state, sad->ssid, &scontext,
 				     &scontext_len);
 	if (rc)
 		audit_log_format(ab, " ssid=%d", sad->ssid);
 	else
 		audit_log_format(ab, " scontext=%s", scontext);
 
-	rc = security_sid_to_context(sad->tsid, &tcontext,
+	rc = security_sid_to_context(sad->state, sad->tsid, &tcontext,
 				     &tcontext_len);
 	if (rc)
 		audit_log_format(ab, " tsid=%d", sad->tsid);
@@ -725,7 +734,7 @@ static void avc_audit_post_callback(struct audit_buffer *ab, void *a)
 	kfree(scontext);
 
 	/* in case of invalid context report also the actual context string */
-	rc = security_sid_to_context_inval(sad->ssid, &scontext,
+	rc = security_sid_to_context_inval(sad->state, sad->ssid, &scontext,
 					   &scontext_len);
 	if (!rc && scontext) {
 		if (scontext_len && scontext[scontext_len - 1] == '\0')
@@ -735,7 +744,7 @@ static void avc_audit_post_callback(struct audit_buffer *ab, void *a)
 		kfree(scontext);
 	}
 
-	rc = security_sid_to_context_inval(sad->tsid, &scontext,
+	rc = security_sid_to_context_inval(sad->state, sad->tsid, &scontext,
 					   &scontext_len);
 	if (!rc && scontext) {
 		if (scontext_len && scontext[scontext_len - 1] == '\0')
@@ -751,7 +760,8 @@ static void avc_audit_post_callback(struct audit_buffer *ab, void *a)
  * Note that it is non-blocking and can be called from under
  * rcu_read_lock().
  */
-noinline int slow_avc_audit(u32 ssid, u32 tsid, u16 tclass,
+noinline int slow_avc_audit(struct selinux_state *state,
+			    u32 ssid, u32 tsid, u16 tclass,
 			    u32 requested, u32 audited, u32 denied, int result,
 			    struct common_audit_data *a)
 {
@@ -773,6 +783,7 @@ noinline int slow_avc_audit(u32 ssid, u32 tsid, u16 tclass,
 	sad.audited = audited;
 	sad.denied = denied;
 	sad.result = result;
+	sad.state = state;
 
 	a->selinux_audit_data = &sad;
 
@@ -810,6 +821,7 @@ int __init avc_add_callback(int (*callback)(u32 event), u32 events)
 
 /**
  * avc_update_node - Update an AVC entry
+ * @avc: the access vector cache
  * @event : Updating event
  * @perms : Permission mask bits
  * @driver: xperm driver information
@@ -827,9 +839,12 @@ int __init avc_add_callback(int (*callback)(u32 event), u32 events)
  * otherwise, this function updates the AVC entry. The original AVC-entry object
  * will release later by RCU.
  */
-static int avc_update_node(u32 event, u32 perms, u8 driver, u8 base_perm,
-			   u8 xperm, u32 ssid, u32 tsid, u16 tclass, u32 seqno,
-			   struct extended_perms_decision *xpd, u32 flags)
+static int avc_update_node(struct selinux_avc *avc,
+			   u32 event, u32 perms, u8 driver, u8 base_perm,
+			   u8 xperm, u32 ssid,
+			   u32 tsid, u16 tclass, u32 seqno,
+			   struct extended_perms_decision *xpd,
+			   u32 flags)
 {
 	u32 hvalue;
 	int rc = 0;
@@ -838,7 +853,7 @@ static int avc_update_node(u32 event, u32 perms, u8 driver, u8 base_perm,
 	struct hlist_head *head;
 	spinlock_t *lock;
 
-	node = avc_alloc_node();
+	node = avc_alloc_node(avc);
 	if (!node) {
 		rc = -ENOMEM;
 		goto out;
@@ -847,8 +862,8 @@ static int avc_update_node(u32 event, u32 perms, u8 driver, u8 base_perm,
 	/* Lock the target slot */
 	hvalue = avc_hash(ssid, tsid, tclass);
 
-	head = &selinux_avc.avc_cache.slots[hvalue];
-	lock = &selinux_avc.avc_cache.slots_lock[hvalue];
+	head = &avc->avc_cache.slots[hvalue];
+	lock = &avc->avc_cache.slots_lock[hvalue];
 
 	spin_lock_irqsave(lock, flag);
 
@@ -864,7 +879,7 @@ static int avc_update_node(u32 event, u32 perms, u8 driver, u8 base_perm,
 
 	if (!orig) {
 		rc = -ENOENT;
-		avc_node_kill(node);
+		avc_node_kill(avc, node);
 		goto out_unlock;
 	}
 
@@ -877,7 +892,7 @@ static int avc_update_node(u32 event, u32 perms, u8 driver, u8 base_perm,
 	if (orig->ae.xp_node) {
 		rc = avc_xperms_populate(node, orig->ae.xp_node);
 		if (rc) {
-			avc_node_kill(node);
+			avc_node_kill(avc, node);
 			goto out_unlock;
 		}
 	}
@@ -907,12 +922,12 @@ static int avc_update_node(u32 event, u32 perms, u8 driver, u8 base_perm,
 	case AVC_CALLBACK_ADD_XPERMS:
 		rc = avc_add_xperms_decision(node, xpd);
 		if (rc) {
-			avc_node_kill(node);
+			avc_node_kill(avc, node);
 			goto out_unlock;
 		}
 		break;
 	}
-	avc_node_replace(node, orig);
+	avc_node_replace(avc, node, orig);
 out_unlock:
 	spin_unlock_irqrestore(lock, flag);
 out:
@@ -921,8 +936,9 @@ static int avc_update_node(u32 event, u32 perms, u8 driver, u8 base_perm,
 
 /**
  * avc_flush - Flush the cache
+ * @avc: the access vector cache
  */
-static void avc_flush(void)
+static void avc_flush(struct selinux_avc *avc)
 {
 	struct hlist_head *head;
 	struct avc_node *node;
@@ -931,8 +947,8 @@ static void avc_flush(void)
 	int i;
 
 	for (i = 0; i < AVC_CACHE_SLOTS; i++) {
-		head = &selinux_avc.avc_cache.slots[i];
-		lock = &selinux_avc.avc_cache.slots_lock[i];
+		head = &avc->avc_cache.slots[i];
+		lock = &avc->avc_cache.slots_lock[i];
 
 		spin_lock_irqsave(lock, flag);
 		/*
@@ -941,7 +957,7 @@ static void avc_flush(void)
 		 */
 		rcu_read_lock();
 		hlist_for_each_entry(node, head, list)
-			avc_node_delete(node);
+			avc_node_delete(avc, node);
 		rcu_read_unlock();
 		spin_unlock_irqrestore(lock, flag);
 	}
@@ -949,14 +965,15 @@ static void avc_flush(void)
 
 /**
  * avc_ss_reset - Flush the cache and revalidate migrated permissions.
+ * @avc: the access vector cache
  * @seqno: policy sequence number
  */
-int avc_ss_reset(u32 seqno)
+int avc_ss_reset(struct selinux_avc *avc, u32 seqno)
 {
 	struct avc_callback_node *c;
 	int rc = 0, tmprc;
 
-	avc_flush();
+	avc_flush(avc);
 
 	for (c = avc_callbacks; c; c = c->next) {
 		if (c->events & AVC_CALLBACK_RESET) {
@@ -968,12 +985,13 @@ int avc_ss_reset(u32 seqno)
 		}
 	}
 
-	avc_latest_notif_update(seqno, 0);
+	avc_latest_notif_update(avc, seqno, 0);
 	return rc;
 }
 
 /**
  * avc_compute_av - Add an entry to the AVC based on the security policy
+ * @state: SELinux state pointer
  * @ssid: subject
  * @tsid: object/target
  * @tclass: object class
@@ -984,28 +1002,33 @@ int avc_ss_reset(u32 seqno)
  * fails.  Don't inline this, since it's the slow-path and just results in a
  * bigger stack frame.
  */
-static noinline void avc_compute_av(u32 ssid, u32 tsid, u16 tclass,
+static noinline void avc_compute_av(struct selinux_state *state, u32 ssid,
+				    u32 tsid, u16 tclass,
 				    struct av_decision *avd,
 				    struct avc_xperms_node *xp_node)
 {
 	INIT_LIST_HEAD(&xp_node->xpd_head);
-	security_compute_av(ssid, tsid, tclass, avd, &xp_node->xp);
-	avc_insert(ssid, tsid, tclass, avd, xp_node);
+	security_compute_av(state, ssid, tsid, tclass, avd, &xp_node->xp);
+	avc_insert(state->avc, ssid, tsid, tclass, avd, xp_node);
 }
 
-static noinline int avc_denied(u32 ssid, u32 tsid, u16 tclass, u32 requested,
+static noinline int avc_denied(struct selinux_state *state,
+			       u32 ssid, u32 tsid,
+			       u16 tclass, u32 requested,
 			       u8 driver, u8 base_perm, u8 xperm,
-			       unsigned int flags, struct av_decision *avd)
+			       unsigned int flags,
+			       struct av_decision *avd)
 {
 	if (flags & AVC_STRICT)
 		return -EACCES;
 
-	if (enforcing_enabled() &&
+	if (enforcing_enabled(state) &&
 	    !(avd->flags & AVD_FLAGS_PERMISSIVE))
 		return -EACCES;
 
-	avc_update_node(AVC_CALLBACK_GRANT, requested, driver, base_perm,
-			xperm, ssid, tsid, tclass, avd->seqno, NULL, flags);
+	avc_update_node(state->avc, AVC_CALLBACK_GRANT, requested, driver,
+			base_perm, xperm, ssid, tsid, tclass, avd->seqno,
+			NULL, flags);
 	return 0;
 }
 
@@ -1016,7 +1039,8 @@ static noinline int avc_denied(u32 ssid, u32 tsid, u16 tclass, u32 requested,
  * as-is the case with ioctls, then multiple may be chained together and the
  * driver field is used to specify which set contains the permission.
  */
-int avc_has_extended_perms(u32 ssid, u32 tsid, u16 tclass, u32 requested,
+int avc_has_extended_perms(struct selinux_state *state,
+			   u32 ssid, u32 tsid, u16 tclass, u32 requested,
 			   u8 driver, u8 base_perm, u8 xperm,
 			   struct common_audit_data *ad)
 {
@@ -1038,9 +1062,9 @@ int avc_has_extended_perms(u32 ssid, u32 tsid, u16 tclass, u32 requested,
 
 	rcu_read_lock();
 
-	node = avc_lookup(ssid, tsid, tclass);
+	node = avc_lookup(state->avc, ssid, tsid, tclass);
 	if (unlikely(!node)) {
-		avc_compute_av(ssid, tsid, tclass, &avd, xp_node);
+		avc_compute_av(state, ssid, tsid, tclass, &avd, xp_node);
 	} else {
 		memcpy(&avd, &node->ae.avd, sizeof(avd));
 		xp_node = node->ae.xp_node;
@@ -1065,12 +1089,13 @@ int avc_has_extended_perms(u32 ssid, u32 tsid, u16 tclass, u32 requested,
 			goto decision;
 		}
 		rcu_read_unlock();
-		security_compute_xperms_decision(ssid, tsid, tclass, driver,
-						 base_perm, &local_xpd);
+		security_compute_xperms_decision(state, ssid, tsid, tclass,
+						 driver, base_perm,
+						 &local_xpd);
 		rcu_read_lock();
-		avc_update_node(AVC_CALLBACK_ADD_XPERMS, requested, driver,
-				base_perm, xperm, ssid, tsid, tclass, avd.seqno,
-				&local_xpd, 0);
+		avc_update_node(state->avc, AVC_CALLBACK_ADD_XPERMS, requested,
+				driver, base_perm, xperm, ssid, tsid, tclass,
+				avd.seqno, &local_xpd, 0);
 	} else {
 		avc_quick_copy_xperms_decision(xperm, &local_xpd, xpd);
 	}
@@ -1082,12 +1107,13 @@ int avc_has_extended_perms(u32 ssid, u32 tsid, u16 tclass, u32 requested,
 decision:
 	denied = requested & ~(avd.allowed);
 	if (unlikely(denied))
-		rc = avc_denied(ssid, tsid, tclass, requested, driver,
-				base_perm, xperm, AVC_EXTENDED_PERMS, &avd);
+		rc = avc_denied(state, ssid, tsid, tclass, requested,
+				driver, base_perm, xperm, AVC_EXTENDED_PERMS,
+				&avd);
 
 	rcu_read_unlock();
 
-	rc2 = avc_xperms_audit(ssid, tsid, tclass, requested,
+	rc2 = avc_xperms_audit(state, ssid, tsid, tclass, requested,
 			&avd, xpd, xperm, rc, ad);
 	if (rc2)
 		return rc2;
@@ -1096,6 +1122,7 @@ int avc_has_extended_perms(u32 ssid, u32 tsid, u16 tclass, u32 requested,
 
 /**
  * avc_perm_nonode - Add an entry to the AVC
+ * @state: SELinux state pointer
  * @ssid: subject
  * @tsid: object/target
  * @tclass: object class
@@ -1107,23 +1134,25 @@ int avc_has_extended_perms(u32 ssid, u32 tsid, u16 tclass, u32 requested,
  * unlikely and needs extra stack space for the new node that we generate, so
  * don't inline it.
  */
-static noinline int avc_perm_nonode(u32 ssid, u32 tsid, u16 tclass,
+static noinline int avc_perm_nonode(struct selinux_state *state,
+				    u32 ssid, u32 tsid, u16 tclass,
 				    u32 requested, unsigned int flags,
 				    struct av_decision *avd)
 {
 	u32 denied;
 	struct avc_xperms_node xp_node;
 
-	avc_compute_av(ssid, tsid, tclass, avd, &xp_node);
+	avc_compute_av(state, ssid, tsid, tclass, avd, &xp_node);
 	denied = requested & ~(avd->allowed);
 	if (unlikely(denied))
-		return avc_denied(ssid, tsid, tclass, requested, 0, 0, 0,
-				  flags, avd);
+		return avc_denied(state, ssid, tsid, tclass, requested, 0, 0,
+				  0, flags, avd);
 	return 0;
 }
 
 /**
  * avc_has_perm_noaudit - Check permissions but perform no auditing.
+ * @state: SELinux state
  * @ssid: source security identifier
  * @tsid: target security identifier
  * @tclass: target security class
@@ -1142,7 +1171,8 @@ static noinline int avc_perm_nonode(u32 ssid, u32 tsid, u16 tclass,
  * auditing, e.g. in cases where a lock must be held for the check but
  * should be released for the auditing.
  */
-inline int avc_has_perm_noaudit(u32 ssid, u32 tsid,
+inline int avc_has_perm_noaudit(struct selinux_state *state,
+				u32 ssid, u32 tsid,
 				u16 tclass, u32 requested,
 				unsigned int flags,
 				struct av_decision *avd)
@@ -1154,10 +1184,10 @@ inline int avc_has_perm_noaudit(u32 ssid, u32 tsid,
 		return -EACCES;
 
 	rcu_read_lock();
-	node = avc_lookup(ssid, tsid, tclass);
+	node = avc_lookup(state->avc, ssid, tsid, tclass);
 	if (unlikely(!node)) {
 		rcu_read_unlock();
-		return avc_perm_nonode(ssid, tsid, tclass, requested,
+		return avc_perm_nonode(state, ssid, tsid, tclass, requested,
 				       flags, avd);
 	}
 	denied = requested & ~node->ae.avd.allowed;
@@ -1165,13 +1195,14 @@ inline int avc_has_perm_noaudit(u32 ssid, u32 tsid,
 	rcu_read_unlock();
 
 	if (unlikely(denied))
-		return avc_denied(ssid, tsid, tclass, requested, 0, 0, 0,
-				  flags, avd);
+		return avc_denied(state, ssid, tsid, tclass, requested, 0, 0,
+				  0, flags, avd);
 	return 0;
 }
 
 /**
  * avc_has_perm - Check permissions and perform any appropriate auditing.
+ * @state: SELinux state
  * @ssid: source security identifier
  * @tsid: target security identifier
  * @tclass: target security class
@@ -1186,23 +1217,23 @@ inline int avc_has_perm_noaudit(u32 ssid, u32 tsid,
  * permissions are granted, -%EACCES if any permissions are denied, or
  * another -errno upon other errors.
  */
-int avc_has_perm(u32 ssid, u32 tsid, u16 tclass,
+int avc_has_perm(struct selinux_state *state, u32 ssid, u32 tsid, u16 tclass,
 		 u32 requested, struct common_audit_data *auditdata)
 {
 	struct av_decision avd;
 	int rc, rc2;
 
-	rc = avc_has_perm_noaudit(ssid, tsid, tclass, requested, 0,
+	rc = avc_has_perm_noaudit(state, ssid, tsid, tclass, requested, 0,
 				  &avd);
 
-	rc2 = avc_audit(ssid, tsid, tclass, requested, &avd, rc,
+	rc2 = avc_audit(state, ssid, tsid, tclass, requested, &avd, rc,
 			auditdata);
 	if (rc2)
 		return rc2;
 	return rc;
 }
 
-u32 avc_policy_seqno(void)
+u32 avc_policy_seqno(struct selinux_state *state)
 {
-	return selinux_avc.avc_cache.latest_notif;
+	return state->avc->avc_cache.latest_notif;
 }
diff --git a/security/selinux/hooks.c b/security/selinux/hooks.c
index b8115df536ab..9eeed98fa534 100644
--- a/security/selinux/hooks.c
+++ b/security/selinux/hooks.c
@@ -280,7 +280,7 @@ static int __inode_security_revalidate(struct inode *inode,
 				       struct dentry *dentry,
 				       bool may_sleep)
 {
-	if (!selinux_initialized())
+	if (!selinux_initialized(&selinux_state))
 		return 0;
 
 	if (may_sleep)
@@ -441,12 +441,14 @@ static int may_context_mount_sb_relabel(u32 sid,
 	const struct task_security_struct *tsec = selinux_cred(cred);
 	int rc;
 
-	rc = avc_has_perm(tsec->sid, sbsec->sid, SECCLASS_FILESYSTEM,
+	rc = avc_has_perm(&selinux_state,
+			  tsec->sid, sbsec->sid, SECCLASS_FILESYSTEM,
 			  FILESYSTEM__RELABELFROM, NULL);
 	if (rc)
 		return rc;
 
-	rc = avc_has_perm(tsec->sid, sid, SECCLASS_FILESYSTEM,
+	rc = avc_has_perm(&selinux_state,
+			  tsec->sid, sid, SECCLASS_FILESYSTEM,
 			  FILESYSTEM__RELABELTO, NULL);
 	return rc;
 }
@@ -457,12 +459,14 @@ static int may_context_mount_inode_relabel(u32 sid,
 {
 	const struct task_security_struct *tsec = selinux_cred(cred);
 	int rc;
-	rc = avc_has_perm(tsec->sid, sbsec->sid, SECCLASS_FILESYSTEM,
+	rc = avc_has_perm(&selinux_state,
+			  tsec->sid, sbsec->sid, SECCLASS_FILESYSTEM,
 			  FILESYSTEM__RELABELFROM, NULL);
 	if (rc)
 		return rc;
 
-	rc = avc_has_perm(sid, sbsec->sid, SECCLASS_FILESYSTEM,
+	rc = avc_has_perm(&selinux_state,
+			  sid, sbsec->sid, SECCLASS_FILESYSTEM,
 			  FILESYSTEM__ASSOCIATE, NULL);
 	return rc;
 }
@@ -545,7 +549,7 @@ static int sb_check_xattr_support(struct super_block *sb)
 
 fallback:
 	/* No xattr support - try to fallback to genfs if possible. */
-	rc = security_genfs_sid(sb->s_type->name, "/",
+	rc = security_genfs_sid(&selinux_state, sb->s_type->name, "/",
 				SECCLASS_DIR, &sid);
 	if (rc)
 		return -EOPNOTSUPP;
@@ -656,7 +660,7 @@ static int selinux_set_mnt_opts(struct super_block *sb,
 
 	mutex_lock(&sbsec->lock);
 
-	if (!selinux_initialized()) {
+	if (!selinux_initialized(&selinux_state)) {
 		if (!opts) {
 			/* Defer initialization until selinux_complete_init,
 			   after the initial policy is loaded and the security
@@ -755,7 +759,7 @@ static int selinux_set_mnt_opts(struct super_block *sb,
 		 * Determine the labeling behavior to use for this
 		 * filesystem type.
 		 */
-		rc = security_fs_use(sb);
+		rc = security_fs_use(&selinux_state, sb);
 		if (rc) {
 			pr_warn("%s: security_fs_use(%s) returned %d\n",
 					__func__, sb->s_type->name, rc);
@@ -780,7 +784,8 @@ static int selinux_set_mnt_opts(struct super_block *sb,
 		}
 		if (sbsec->behavior == SECURITY_FS_USE_XATTR) {
 			sbsec->behavior = SECURITY_FS_USE_MNTPOINT;
-			rc = security_transition_sid(current_sid(),
+			rc = security_transition_sid(&selinux_state,
+						     current_sid(),
 						     current_sid(),
 						     SECCLASS_FILE, NULL,
 						     &sbsec->mntpoint_sid);
@@ -938,7 +943,7 @@ static int selinux_sb_clone_mnt_opts(const struct super_block *oldsb,
 	 * if the parent was able to be mounted it clearly had no special lsm
 	 * mount options.  thus we can safely deal with this superblock later
 	 */
-	if (!selinux_initialized()) {
+	if (!selinux_initialized(&selinux_state)) {
 		if (kern_flags & SECURITY_LSM_NATIVE_LABELS) {
 			newsbsec->flags |= SE_SBNATIVE;
 			*set_kern_flags |= SECURITY_LSM_NATIVE_LABELS;
@@ -965,7 +970,7 @@ static int selinux_sb_clone_mnt_opts(const struct super_block *oldsb,
 
 	if (newsbsec->behavior == SECURITY_FS_USE_NATIVE &&
 		!(kern_flags & SECURITY_LSM_NATIVE_LABELS) && !set_context) {
-		rc = security_fs_use(newsb);
+		rc = security_fs_use(&selinux_state, newsb);
 		if (rc)
 			goto out;
 	}
@@ -1014,7 +1019,7 @@ static int selinux_add_opt(int token, const char *s, void **mnt_opts)
 	if (!s)
 		return -EINVAL;
 
-	if (!selinux_initialized()) {
+	if (!selinux_initialized(&selinux_state)) {
 		pr_warn("SELinux: Unable to set superblock options before the security server is initialized\n");
 		return -EINVAL;
 	}
@@ -1051,7 +1056,7 @@ static int selinux_add_opt(int token, const char *s, void **mnt_opts)
 		WARN_ON(1);
 		return -EINVAL;
 	}
-	rc = security_context_str_to_sid(s, dst_sid, GFP_KERNEL);
+	rc = security_context_str_to_sid(&selinux_state, s, dst_sid, GFP_KERNEL);
 	if (rc)
 		pr_warn("SELinux: security_context_str_to_sid (%s) failed with errno=%d\n",
 			s, rc);
@@ -1068,7 +1073,8 @@ static int show_sid(struct seq_file *m, u32 sid)
 	u32 len;
 	int rc;
 
-	rc = security_sid_to_context(sid, &context, &len);
+	rc = security_sid_to_context(&selinux_state, sid,
+					     &context, &len);
 	if (!rc) {
 		bool has_comma = strchr(context, ',');
 
@@ -1091,7 +1097,7 @@ static int selinux_sb_show_options(struct seq_file *m, struct super_block *sb)
 	if (!(sbsec->flags & SE_SBINITIALIZED))
 		return 0;
 
-	if (!selinux_initialized())
+	if (!selinux_initialized(&selinux_state))
 		return 0;
 
 	if (sbsec->flags & FSCONTEXT_MNT) {
@@ -1345,7 +1351,7 @@ static int selinux_genfs_get_sid(struct dentry *dentry,
 				path++;
 			}
 		}
-		rc = security_genfs_sid(sb->s_type->name,
+		rc = security_genfs_sid(&selinux_state, sb->s_type->name,
 					path, tclass, sid);
 		if (rc == -ENOENT) {
 			/* No match in policy, mark as unlabeled. */
@@ -1400,7 +1406,7 @@ static int inode_doinit_use_xattr(struct inode *inode, struct dentry *dentry,
 		return 0;
 	}
 
-	rc = security_context_to_sid_default(context, rc, sid,
+	rc = security_context_to_sid_default(&selinux_state, context, rc, sid,
 					     def_sid, GFP_NOFS);
 	if (rc) {
 		char *dev = inode->i_sb->s_id;
@@ -1510,7 +1516,7 @@ static int inode_doinit_with_dentry(struct inode *inode, struct dentry *opt_dent
 		sid = sbsec->sid;
 
 		/* Try to obtain a transition SID. */
-		rc = security_transition_sid(task_sid, sid,
+		rc = security_transition_sid(&selinux_state, task_sid, sid,
 					     sclass, NULL, &sid);
 		if (rc)
 			goto out;
@@ -1655,9 +1661,11 @@ static int cred_has_capability(const struct cred *cred,
 		return -EINVAL;
 	}
 
-	rc = avc_has_perm_noaudit(sid, sid, sclass, av, 0, &avd);
+	rc = avc_has_perm_noaudit(&selinux_state,
+				  sid, sid, sclass, av, 0, &avd);
 	if (!(opts & CAP_OPT_NOAUDIT)) {
-		int rc2 = avc_audit(sid, sid, sclass, av, &avd, rc, &ad);
+		int rc2 = avc_audit(&selinux_state,
+				    sid, sid, sclass, av, &avd, rc, &ad);
 		if (rc2)
 			return rc2;
 	}
@@ -1681,7 +1689,8 @@ static int inode_has_perm(const struct cred *cred,
 	sid = cred_sid(cred);
 	isec = selinux_inode(inode);
 
-	return avc_has_perm(sid, isec->sid, isec->sclass, perms, adp);
+	return avc_has_perm(&selinux_state,
+			    sid, isec->sid, isec->sclass, perms, adp);
 }
 
 /* Same as inode_has_perm, but pass explicit audit data containing
@@ -1760,7 +1769,8 @@ static int file_has_perm(const struct cred *cred,
 	ad.u.file = file;
 
 	if (sid != fsec->sid) {
-		rc = avc_has_perm(sid, fsec->sid,
+		rc = avc_has_perm(&selinux_state,
+				  sid, fsec->sid,
 				  SECCLASS_FD,
 				  FD__USE,
 				  &ad);
@@ -1803,7 +1813,7 @@ selinux_determine_inode_label(const struct task_security_struct *tsec,
 		*_new_isid = tsec->create_sid;
 	} else {
 		const struct inode_security_struct *dsec = inode_security(dir);
-		return security_transition_sid(tsec->sid,
+		return security_transition_sid(&selinux_state, tsec->sid,
 					       dsec->sid, tclass,
 					       name, _new_isid);
 	}
@@ -1831,7 +1841,8 @@ static int may_create(struct inode *dir,
 	ad.type = LSM_AUDIT_DATA_DENTRY;
 	ad.u.dentry = dentry;
 
-	rc = avc_has_perm(sid, dsec->sid, SECCLASS_DIR,
+	rc = avc_has_perm(&selinux_state,
+			  sid, dsec->sid, SECCLASS_DIR,
 			  DIR__ADD_NAME | DIR__SEARCH,
 			  &ad);
 	if (rc)
@@ -1842,11 +1853,13 @@ static int may_create(struct inode *dir,
 	if (rc)
 		return rc;
 
-	rc = avc_has_perm(sid, newsid, tclass, FILE__CREATE, &ad);
+	rc = avc_has_perm(&selinux_state,
+			  sid, newsid, tclass, FILE__CREATE, &ad);
 	if (rc)
 		return rc;
 
-	return avc_has_perm(newsid, sbsec->sid,
+	return avc_has_perm(&selinux_state,
+			    newsid, sbsec->sid,
 			    SECCLASS_FILESYSTEM,
 			    FILESYSTEM__ASSOCIATE, &ad);
 }
@@ -1875,7 +1888,8 @@ static int may_link(struct inode *dir,
 
 	av = DIR__SEARCH;
 	av |= (kind ? DIR__REMOVE_NAME : DIR__ADD_NAME);
-	rc = avc_has_perm(sid, dsec->sid, SECCLASS_DIR, av, &ad);
+	rc = avc_has_perm(&selinux_state,
+			  sid, dsec->sid, SECCLASS_DIR, av, &ad);
 	if (rc)
 		return rc;
 
@@ -1895,7 +1909,8 @@ static int may_link(struct inode *dir,
 		return 0;
 	}
 
-	rc = avc_has_perm(sid, isec->sid, isec->sclass, av, &ad);
+	rc = avc_has_perm(&selinux_state,
+			  sid, isec->sid, isec->sclass, av, &ad);
 	return rc;
 }
 
@@ -1919,16 +1934,19 @@ static inline int may_rename(struct inode *old_dir,
 	ad.type = LSM_AUDIT_DATA_DENTRY;
 
 	ad.u.dentry = old_dentry;
-	rc = avc_has_perm(sid, old_dsec->sid, SECCLASS_DIR,
+	rc = avc_has_perm(&selinux_state,
+			  sid, old_dsec->sid, SECCLASS_DIR,
 			  DIR__REMOVE_NAME | DIR__SEARCH, &ad);
 	if (rc)
 		return rc;
-	rc = avc_has_perm(sid, old_isec->sid,
+	rc = avc_has_perm(&selinux_state,
+			  sid, old_isec->sid,
 			  old_isec->sclass, FILE__RENAME, &ad);
 	if (rc)
 		return rc;
 	if (old_is_dir && new_dir != old_dir) {
-		rc = avc_has_perm(sid, old_isec->sid,
+		rc = avc_has_perm(&selinux_state,
+				  sid, old_isec->sid,
 				  old_isec->sclass, DIR__REPARENT, &ad);
 		if (rc)
 			return rc;
@@ -1938,13 +1956,15 @@ static inline int may_rename(struct inode *old_dir,
 	av = DIR__ADD_NAME | DIR__SEARCH;
 	if (d_is_positive(new_dentry))
 		av |= DIR__REMOVE_NAME;
-	rc = avc_has_perm(sid, new_dsec->sid, SECCLASS_DIR, av, &ad);
+	rc = avc_has_perm(&selinux_state,
+			  sid, new_dsec->sid, SECCLASS_DIR, av, &ad);
 	if (rc)
 		return rc;
 	if (d_is_positive(new_dentry)) {
 		new_isec = backing_inode_security(new_dentry);
 		new_is_dir = d_is_dir(new_dentry);
-		rc = avc_has_perm(sid, new_isec->sid,
+		rc = avc_has_perm(&selinux_state,
+				  sid, new_isec->sid,
 				  new_isec->sclass,
 				  (new_is_dir ? DIR__RMDIR : FILE__UNLINK), &ad);
 		if (rc)
@@ -1964,7 +1984,8 @@ static int superblock_has_perm(const struct cred *cred,
 	u32 sid = cred_sid(cred);
 
 	sbsec = selinux_superblock(sb);
-	return avc_has_perm(sid, sbsec->sid, SECCLASS_FILESYSTEM, perms, ad);
+	return avc_has_perm(&selinux_state,
+			    sid, sbsec->sid, SECCLASS_FILESYSTEM, perms, ad);
 }
 
 /* Convert a Linux mode and permission mask to an access vector. */
@@ -2038,7 +2059,8 @@ static inline u32 open_file_to_av(struct file *file)
 
 static int selinux_binder_set_context_mgr(const struct cred *mgr)
 {
-	return avc_has_perm(current_sid(), cred_sid(mgr), SECCLASS_BINDER,
+	return avc_has_perm(&selinux_state,
+			    current_sid(), cred_sid(mgr), SECCLASS_BINDER,
 			    BINDER__SET_CONTEXT_MGR, NULL);
 }
 
@@ -2051,20 +2073,22 @@ static int selinux_binder_transaction(const struct cred *from,
 	int rc;
 
 	if (mysid != fromsid) {
-		rc = avc_has_perm(mysid, fromsid, SECCLASS_BINDER,
+		rc = avc_has_perm(&selinux_state,
+				  mysid, fromsid, SECCLASS_BINDER,
 				  BINDER__IMPERSONATE, NULL);
 		if (rc)
 			return rc;
 	}
 
-	return avc_has_perm(fromsid, tosid,
+	return avc_has_perm(&selinux_state, fromsid, tosid,
 			    SECCLASS_BINDER, BINDER__CALL, NULL);
 }
 
 static int selinux_binder_transfer_binder(const struct cred *from,
 					  const struct cred *to)
 {
-	return avc_has_perm(cred_sid(from), cred_sid(to),
+	return avc_has_perm(&selinux_state,
+			    cred_sid(from), cred_sid(to),
 			    SECCLASS_BINDER, BINDER__TRANSFER,
 			    NULL);
 }
@@ -2084,7 +2108,8 @@ static int selinux_binder_transfer_file(const struct cred *from,
 	ad.u.path = file->f_path;
 
 	if (sid != fsec->sid) {
-		rc = avc_has_perm(sid, fsec->sid,
+		rc = avc_has_perm(&selinux_state,
+				  sid, fsec->sid,
 				  SECCLASS_FD,
 				  FD__USE,
 				  &ad);
@@ -2102,7 +2127,8 @@ static int selinux_binder_transfer_file(const struct cred *from,
 		return 0;
 
 	isec = backing_inode_security(dentry);
-	return avc_has_perm(sid, isec->sid, isec->sclass, file_to_av(file),
+	return avc_has_perm(&selinux_state,
+			    sid, isec->sid, isec->sclass, file_to_av(file),
 			    &ad);
 }
 
@@ -2113,24 +2139,26 @@ static int selinux_ptrace_access_check(struct task_struct *child,
 	u32 csid = task_sid_obj(child);
 
 	if (mode & PTRACE_MODE_READ)
-		return avc_has_perm(sid, csid, SECCLASS_FILE, FILE__READ,
-				NULL);
+		return avc_has_perm(&selinux_state,
+				    sid, csid, SECCLASS_FILE, FILE__READ, NULL);
 
-	return avc_has_perm(sid, csid, SECCLASS_PROCESS, PROCESS__PTRACE,
-			NULL);
+	return avc_has_perm(&selinux_state,
+			    sid, csid, SECCLASS_PROCESS, PROCESS__PTRACE, NULL);
 }
 
 static int selinux_ptrace_traceme(struct task_struct *parent)
 {
-	return avc_has_perm(task_sid_obj(parent), task_sid_obj(current),
+	return avc_has_perm(&selinux_state,
+			    task_sid_obj(parent), task_sid_obj(current),
 			    SECCLASS_PROCESS, PROCESS__PTRACE, NULL);
 }
 
 static int selinux_capget(const struct task_struct *target, kernel_cap_t *effective,
 			  kernel_cap_t *inheritable, kernel_cap_t *permitted)
 {
-	return avc_has_perm(current_sid(), task_sid_obj(target),
-			SECCLASS_PROCESS, PROCESS__GETCAP, NULL);
+	return avc_has_perm(&selinux_state,
+			    current_sid(), task_sid_obj(target), SECCLASS_PROCESS,
+			    PROCESS__GETCAP, NULL);
 }
 
 static int selinux_capset(struct cred *new, const struct cred *old,
@@ -2138,7 +2166,8 @@ static int selinux_capset(struct cred *new, const struct cred *old,
 			  const kernel_cap_t *inheritable,
 			  const kernel_cap_t *permitted)
 {
-	return avc_has_perm(cred_sid(old), cred_sid(new), SECCLASS_PROCESS,
+	return avc_has_perm(&selinux_state,
+			    cred_sid(old), cred_sid(new), SECCLASS_PROCESS,
 			    PROCESS__SETCAP, NULL);
 }
 
@@ -2205,18 +2234,21 @@ static int selinux_syslog(int type)
 	switch (type) {
 	case SYSLOG_ACTION_READ_ALL:	/* Read last kernel messages */
 	case SYSLOG_ACTION_SIZE_BUFFER:	/* Return size of the log buffer */
-		return avc_has_perm(current_sid(), SECINITSID_KERNEL,
+		return avc_has_perm(&selinux_state,
+				    current_sid(), SECINITSID_KERNEL,
 				    SECCLASS_SYSTEM, SYSTEM__SYSLOG_READ, NULL);
 	case SYSLOG_ACTION_CONSOLE_OFF:	/* Disable logging to console */
 	case SYSLOG_ACTION_CONSOLE_ON:	/* Enable logging to console */
 	/* Set level of messages printed to console */
 	case SYSLOG_ACTION_CONSOLE_LEVEL:
-		return avc_has_perm(current_sid(), SECINITSID_KERNEL,
+		return avc_has_perm(&selinux_state,
+				    current_sid(), SECINITSID_KERNEL,
 				    SECCLASS_SYSTEM, SYSTEM__SYSLOG_CONSOLE,
 				    NULL);
 	}
 	/* All other syslog types */
-	return avc_has_perm(current_sid(), SECINITSID_KERNEL,
+	return avc_has_perm(&selinux_state,
+			    current_sid(), SECINITSID_KERNEL,
 			    SECCLASS_SYSTEM, SYSTEM__SYSLOG_MOD, NULL);
 }
 
@@ -2276,7 +2308,8 @@ static int check_nnp_nosuid(const struct linux_binprm *bprm,
 			av |= PROCESS2__NNP_TRANSITION;
 		if (nosuid)
 			av |= PROCESS2__NOSUID_TRANSITION;
-		rc = avc_has_perm(old_tsec->sid, new_tsec->sid,
+		rc = avc_has_perm(&selinux_state,
+				  old_tsec->sid, new_tsec->sid,
 				  SECCLASS_PROCESS2, av, NULL);
 		if (!rc)
 			return 0;
@@ -2287,7 +2320,7 @@ static int check_nnp_nosuid(const struct linux_binprm *bprm,
 	 * i.e. SIDs that are guaranteed to only be allowed a subset
 	 * of the permissions of the current SID.
 	 */
-	rc = security_bounded_transition(old_tsec->sid,
+	rc = security_bounded_transition(&selinux_state, old_tsec->sid,
 					 new_tsec->sid);
 	if (!rc)
 		return 0;
@@ -2333,7 +2366,7 @@ static int selinux_bprm_creds_for_exec(struct linux_binprm *bprm)
 	 * early boot end up with a label different from SECINITSID_KERNEL
 	 * (if the policy chooses to set SECINITSID_INIT != SECINITSID_KERNEL).
 	 */
-	if (!selinux_initialized()) {
+	if (!selinux_initialized(&selinux_state)) {
 		new_tsec->sid = SECINITSID_INIT;
 		/* also clear the exec_sid just in case */
 		new_tsec->exec_sid = 0;
@@ -2351,7 +2384,7 @@ static int selinux_bprm_creds_for_exec(struct linux_binprm *bprm)
 			return rc;
 	} else {
 		/* Check for a default transition on this program. */
-		rc = security_transition_sid(old_tsec->sid,
+		rc = security_transition_sid(&selinux_state, old_tsec->sid,
 					     isec->sid, SECCLASS_PROCESS, NULL,
 					     &new_tsec->sid);
 		if (rc)
@@ -2370,25 +2403,29 @@ static int selinux_bprm_creds_for_exec(struct linux_binprm *bprm)
 	ad.u.file = bprm->file;
 
 	if (new_tsec->sid == old_tsec->sid) {
-		rc = avc_has_perm(old_tsec->sid, isec->sid,
+		rc = avc_has_perm(&selinux_state,
+				  old_tsec->sid, isec->sid,
 				  SECCLASS_FILE, FILE__EXECUTE_NO_TRANS, &ad);
 		if (rc)
 			return rc;
 	} else {
 		/* Check permissions for the transition. */
-		rc = avc_has_perm(old_tsec->sid, new_tsec->sid,
+		rc = avc_has_perm(&selinux_state,
+				  old_tsec->sid, new_tsec->sid,
 				  SECCLASS_PROCESS, PROCESS__TRANSITION, &ad);
 		if (rc)
 			return rc;
 
-		rc = avc_has_perm(new_tsec->sid, isec->sid,
+		rc = avc_has_perm(&selinux_state,
+				  new_tsec->sid, isec->sid,
 				  SECCLASS_FILE, FILE__ENTRYPOINT, &ad);
 		if (rc)
 			return rc;
 
 		/* Check for shared state */
 		if (bprm->unsafe & LSM_UNSAFE_SHARE) {
-			rc = avc_has_perm(old_tsec->sid, new_tsec->sid,
+			rc = avc_has_perm(&selinux_state,
+					  old_tsec->sid, new_tsec->sid,
 					  SECCLASS_PROCESS, PROCESS__SHARE,
 					  NULL);
 			if (rc)
@@ -2400,7 +2437,8 @@ static int selinux_bprm_creds_for_exec(struct linux_binprm *bprm)
 		if (bprm->unsafe & LSM_UNSAFE_PTRACE) {
 			u32 ptsid = ptrace_parent_sid();
 			if (ptsid != 0) {
-				rc = avc_has_perm(ptsid, new_tsec->sid,
+				rc = avc_has_perm(&selinux_state,
+						  ptsid, new_tsec->sid,
 						  SECCLASS_PROCESS,
 						  PROCESS__PTRACE, NULL);
 				if (rc)
@@ -2414,7 +2452,8 @@ static int selinux_bprm_creds_for_exec(struct linux_binprm *bprm)
 		/* Enable secure mode for SIDs transitions unless
 		   the noatsecure permission is granted between
 		   the two SIDs, i.e. ahp returns 0. */
-		rc = avc_has_perm(old_tsec->sid, new_tsec->sid,
+		rc = avc_has_perm(&selinux_state,
+				  old_tsec->sid, new_tsec->sid,
 				  SECCLASS_PROCESS, PROCESS__NOATSECURE,
 				  NULL);
 		bprm->secureexec |= !!rc;
@@ -2506,7 +2545,8 @@ static void selinux_bprm_committing_creds(const struct linux_binprm *bprm)
 	 * higher than the default soft limit for cases where the default is
 	 * lower than the hard limit, e.g. RLIMIT_CORE or RLIMIT_STACK.
 	 */
-	rc = avc_has_perm(new_tsec->osid, new_tsec->sid, SECCLASS_PROCESS,
+	rc = avc_has_perm(&selinux_state,
+			  new_tsec->osid, new_tsec->sid, SECCLASS_PROCESS,
 			  PROCESS__RLIMITINH, NULL);
 	if (rc) {
 		/* protect against do_prlimit() */
@@ -2545,7 +2585,8 @@ static void selinux_bprm_committed_creds(const struct linux_binprm *bprm)
 	 * This must occur _after_ the task SID has been updated so that any
 	 * kill done after the flush will be checked against the new SID.
 	 */
-	rc = avc_has_perm(osid, sid, SECCLASS_PROCESS, PROCESS__SIGINH, NULL);
+	rc = avc_has_perm(&selinux_state,
+			  osid, sid, SECCLASS_PROCESS, PROCESS__SIGINH, NULL);
 	if (rc) {
 		clear_itimer();
 
@@ -2900,7 +2941,8 @@ static int selinux_dentry_init_security(struct dentry *dentry, int mode,
 		*xattr_name = XATTR_NAME_SELINUX;
 
 	cp->id = LSM_ID_SELINUX;
-	return security_sid_to_context(newsid, &cp->context, &cp->len);
+	return security_sid_to_context(&selinux_state, newsid, &cp->context,
+				       &cp->len);
 }
 
 static int selinux_dentry_create_files_as(struct dentry *dentry, int mode,
@@ -2952,12 +2994,12 @@ static int selinux_inode_init_security(struct inode *inode, struct inode *dir,
 		isec->initialized = LABEL_INITIALIZED;
 	}
 
-	if (!selinux_initialized() ||
+	if (!selinux_initialized(&selinux_state) ||
 	    !(sbsec->flags & SBLABEL_MNT))
 		return -EOPNOTSUPP;
 
 	if (xattr) {
-		rc = security_sid_to_context_force(newsid,
+		rc = security_sid_to_context_force(&selinux_state, newsid,
 						   &context, &clen);
 		if (rc)
 			return rc;
@@ -2978,7 +3020,7 @@ static int selinux_inode_init_security_anon(struct inode *inode,
 	struct inode_security_struct *isec;
 	int rc;
 
-	if (unlikely(!selinux_initialized()))
+	if (unlikely(!selinux_initialized(&selinux_state)))
 		return 0;
 
 	isec = selinux_inode(inode);
@@ -3002,7 +3044,7 @@ static int selinux_inode_init_security_anon(struct inode *inode,
 	} else {
 		isec->sclass = SECCLASS_ANON_INODE;
 		rc = security_transition_sid(
-			sid, sid,
+			&selinux_state, sid, sid,
 			isec->sclass, name, &isec->sid);
 		if (rc)
 			return rc;
@@ -3017,7 +3059,8 @@ static int selinux_inode_init_security_anon(struct inode *inode,
 	ad.type = LSM_AUDIT_DATA_ANONINODE;
 	ad.u.anonclass = name ? (const char *)name->name : "?";
 
-	return avc_has_perm(sid,
+	return avc_has_perm(&selinux_state,
+			    sid,
 			    isec->sid,
 			    isec->sclass,
 			    FILE__CREATE,
@@ -3085,7 +3128,8 @@ static int selinux_inode_follow_link(struct dentry *dentry, struct inode *inode,
 	if (IS_ERR(isec))
 		return PTR_ERR(isec);
 
-	return avc_has_perm(sid, isec->sid, isec->sclass, FILE__READ, &ad);
+	return avc_has_perm(&selinux_state,
+				  sid, isec->sid, isec->sclass, FILE__READ, &ad);
 }
 
 static noinline int audit_inode_permission(struct inode *inode,
@@ -3098,7 +3142,8 @@ static noinline int audit_inode_permission(struct inode *inode,
 	ad.type = LSM_AUDIT_DATA_INODE;
 	ad.u.inode = inode;
 
-	return slow_avc_audit(current_sid(), isec->sid, isec->sclass, perms,
+	return slow_avc_audit(&selinux_state,
+			    current_sid(), isec->sid, isec->sclass, perms,
 			    audited, denied, result, &ad);
 }
 
@@ -3113,7 +3158,7 @@ static inline void task_avdcache_reset(struct task_security_struct *tsec)
 {
 	memset(&tsec->avdcache.dir, 0, sizeof(tsec->avdcache.dir));
 	tsec->avdcache.sid = tsec->sid;
-	tsec->avdcache.seqno = avc_policy_seqno();
+	tsec->avdcache.seqno = avc_policy_seqno(&selinux_state);
 	tsec->avdcache.dir_spot = TSEC_AVDC_DIR_SIZE - 1;
 }
 
@@ -3137,7 +3182,7 @@ static inline int task_avdcache_search(struct task_security_struct *tsec,
 		return -ENOENT;
 
 	if (unlikely(tsec->sid != tsec->avdcache.sid ||
-		     tsec->avdcache.seqno != avc_policy_seqno())) {
+		     tsec->avdcache.seqno != avc_policy_seqno(&selinux_state))) {
 		task_avdcache_reset(tsec);
 		return -ENOENT;
 	}
@@ -3221,15 +3266,16 @@ static int selinux_inode_permission(struct inode *inode, int requested)
 		/* Cache hit. */
 		audited = perms & avdc->audited;
 		denied = perms & ~avdc->allowed;
-		if (unlikely(denied && enforcing_enabled() &&
+		if (unlikely(denied && enforcing_enabled(&selinux_state) &&
 			     !avdc->permissive))
 			rc = -EACCES;
 	} else {
 		struct av_decision avd;
 
 		/* Cache miss. */
-		rc = avc_has_perm_noaudit(tsec->sid, isec->sid, isec->sclass,
-					  perms, 0, &avd);
+		rc = avc_has_perm_noaudit(&selinux_state, tsec->sid,
+					  isec->sid, isec->sclass, perms, 0,
+					  &avd);
 		audited = avc_audit_required(perms, &avd, rc,
 			(requested & MAY_ACCESS) ? FILE__AUDIT_ACCESS : 0,
 			&denied);
@@ -3324,7 +3370,7 @@ static int selinux_inode_setxattr(struct mnt_idmap *idmap,
 	if (strcmp(name, XATTR_NAME_SELINUX))
 		return dentry_has_perm(current_cred(), dentry, FILE__SETATTR);
 
-	if (!selinux_initialized())
+	if (!selinux_initialized(&selinux_state))
 		return (inode_owner_or_capable(idmap, inode) ? 0 : -EPERM);
 
 	sbsec = selinux_superblock(inode->i_sb);
@@ -3338,12 +3384,13 @@ static int selinux_inode_setxattr(struct mnt_idmap *idmap,
 	ad.u.dentry = dentry;
 
 	isec = backing_inode_security(dentry);
-	rc = avc_has_perm(sid, isec->sid, isec->sclass,
+	rc = avc_has_perm(&selinux_state,
+			  sid, isec->sid, isec->sclass,
 			  FILE__RELABELFROM, &ad);
 	if (rc)
 		return rc;
 
-	rc = security_context_to_sid(value, size, &newsid,
+	rc = security_context_to_sid(&selinux_state, value, size, &newsid,
 				     GFP_KERNEL);
 	if (rc == -EINVAL) {
 		if (!has_cap_mac_admin(true)) {
@@ -3372,23 +3419,25 @@ static int selinux_inode_setxattr(struct mnt_idmap *idmap,
 
 			return rc;
 		}
-		rc = security_context_to_sid_force(value,
+		rc = security_context_to_sid_force(&selinux_state, value,
 						   size, &newsid);
 	}
 	if (rc)
 		return rc;
 
-	rc = avc_has_perm(sid, newsid, isec->sclass,
+	rc = avc_has_perm(&selinux_state,
+			  sid, newsid, isec->sclass,
 			  FILE__RELABELTO, &ad);
 	if (rc)
 		return rc;
 
-	rc = security_validate_transition(isec->sid, newsid,
+	rc = security_validate_transition(&selinux_state, isec->sid, newsid,
 					  sid, isec->sclass);
 	if (rc)
 		return rc;
 
-	return avc_has_perm(newsid,
+	return avc_has_perm(&selinux_state,
+			    newsid,
 			    sbsec->sid,
 			    SECCLASS_FILESYSTEM,
 			    FILESYSTEM__ASSOCIATE,
@@ -3428,7 +3477,7 @@ static void selinux_inode_post_setxattr(struct dentry *dentry, const char *name,
 		return;
 	}
 
-	if (!selinux_initialized()) {
+	if (!selinux_initialized(&selinux_state)) {
 		/* If we haven't even been initialized, then we can't validate
 		 * against a policy, so leave the label as invalid. It may
 		 * resolve to a valid label on the next revalidation try if
@@ -3437,7 +3486,7 @@ static void selinux_inode_post_setxattr(struct dentry *dentry, const char *name,
 		return;
 	}
 
-	rc = security_context_to_sid_force(value, size,
+	rc = security_context_to_sid_force(&selinux_state, value, size,
 					   &newsid);
 	if (rc) {
 		pr_err("SELinux:  unable to map context to SID"
@@ -3475,7 +3524,7 @@ static int selinux_inode_removexattr(struct mnt_idmap *idmap,
 	if (strcmp(name, XATTR_NAME_SELINUX))
 		return dentry_has_perm(current_cred(), dentry, FILE__SETATTR);
 
-	if (!selinux_initialized())
+	if (!selinux_initialized(&selinux_state))
 		return 0;
 
 	/* No one is allowed to remove a SELinux security label.
@@ -3549,7 +3598,7 @@ static int selinux_inode_getsecurity(struct mnt_idmap *idmap,
 	 * If we're not initialized yet, then we can't validate contexts, so
 	 * just let vfs_getxattr fall back to using the on-disk xattr.
 	 */
-	if (!selinux_initialized() ||
+	if (!selinux_initialized(&selinux_state) ||
 	    strcmp(name, XATTR_SELINUX_SUFFIX))
 		return -EOPNOTSUPP;
 
@@ -3564,10 +3613,11 @@ static int selinux_inode_getsecurity(struct mnt_idmap *idmap,
 	 */
 	isec = inode_security(inode);
 	if (has_cap_mac_admin(false))
-		error = security_sid_to_context_force(isec->sid, &context,
+		error = security_sid_to_context_force(&selinux_state,
+						      isec->sid, &context,
 						      &size);
 	else
-		error = security_sid_to_context(isec->sid,
+		error = security_sid_to_context(&selinux_state, isec->sid,
 						&context, &size);
 	if (error)
 		return error;
@@ -3599,7 +3649,7 @@ static int selinux_inode_setsecurity(struct inode *inode, const char *name,
 	if (!value || !size)
 		return -EACCES;
 
-	rc = security_context_to_sid(value, size, &newsid,
+	rc = security_context_to_sid(&selinux_state, value, size, &newsid,
 				     GFP_KERNEL);
 	if (rc)
 		return rc;
@@ -3616,7 +3666,7 @@ static int selinux_inode_listsecurity(struct inode *inode, char *buffer, size_t
 {
 	const int len = sizeof(XATTR_NAME_SELINUX);
 
-	if (!selinux_initialized())
+	if (!selinux_initialized(&selinux_state))
 		return 0;
 
 	if (buffer && len <= buffer_size)
@@ -3658,8 +3708,10 @@ static int selinux_inode_copy_up_xattr(struct dentry *dentry, const char *name)
 	 * xattrs up.  Instead, filter out SELinux-related xattrs following
 	 * policy load.
 	 */
-	if (selinux_initialized() && !strcmp(name, XATTR_NAME_SELINUX))
+	if (selinux_initialized(&selinux_state) &&
+	    !strcmp(name, XATTR_NAME_SELINUX))
 		return -ECANCELED; /* Discard */
+
 	/*
 	 * Any other attribute apart from SELINUX is not claimed, supported
 	 * by selinux.
@@ -3694,7 +3746,7 @@ static int selinux_kernfs_init_security(struct kernfs_node *kn_dir,
 		return rc;
 	}
 
-	rc = security_context_to_sid(context, clen, &parent_sid,
+	rc = security_context_to_sid(&selinux_state, context, clen, &parent_sid,
 				     GFP_KERNEL);
 	kfree(context);
 	if (rc)
@@ -3712,14 +3764,14 @@ static int selinux_kernfs_init_security(struct kernfs_node *kn_dir,
 		q.name = kn_name;
 		q.hash_len = hashlen_string(kn_dir, kn_name);
 
-		rc = security_transition_sid(tsec->sid,
+		rc = security_transition_sid(&selinux_state, tsec->sid,
 					     parent_sid, secclass, &q,
 					     &newsid);
 		if (rc)
 			return rc;
 	}
 
-	rc = security_sid_to_context_force(newsid,
+	rc = security_sid_to_context_force(&selinux_state, newsid,
 					   &context, &clen);
 	if (rc)
 		return rc;
@@ -3759,7 +3811,7 @@ static int selinux_file_permission(struct file *file, int mask)
 
 	isec = inode_security(inode);
 	if (sid == fsec->sid && fsec->isid == isec->sid &&
-	    fsec->pseqno == avc_policy_seqno())
+	    fsec->pseqno == avc_policy_seqno(&selinux_state))
 		/* No change since file_open check. */
 		return 0;
 
@@ -3800,7 +3852,8 @@ static int ioctl_has_perm(const struct cred *cred, struct file *file,
 	ad.u.op->path = file->f_path;
 
 	if (ssid != fsec->sid) {
-		rc = avc_has_perm(ssid, fsec->sid,
+		rc = avc_has_perm(&selinux_state,
+				  ssid, fsec->sid,
 				SECCLASS_FD,
 				FD__USE,
 				&ad);
@@ -3812,8 +3865,10 @@ static int ioctl_has_perm(const struct cred *cred, struct file *file,
 		return 0;
 
 	isec = inode_security(inode);
-	rc = avc_has_extended_perms(ssid, isec->sid, isec->sclass, requested,
-				    driver, AVC_EXT_IOCTL, xperm, &ad);
+	rc = avc_has_extended_perms(&selinux_state,
+				    ssid, isec->sid, isec->sclass,
+				    requested, driver, AVC_EXT_IOCTL, xperm,
+				    &ad);
 out:
 	return rc;
 }
@@ -3908,7 +3963,8 @@ static int file_map_prot_check(struct file *file, unsigned long prot, int shared
 		 * private file mapping that will also be writable.
 		 * This has an additional check.
 		 */
-		rc = avc_has_perm(sid, sid, SECCLASS_PROCESS,
+		rc = avc_has_perm(&selinux_state,
+				  sid, sid, SECCLASS_PROCESS,
 				  PROCESS__EXECMEM, NULL);
 		if (rc)
 			goto error;
@@ -3938,7 +3994,8 @@ static int selinux_mmap_addr(unsigned long addr)
 
 	if (addr < CONFIG_LSM_MMAP_MIN_ADDR) {
 		u32 sid = current_sid();
-		rc = avc_has_perm(sid, sid, SECCLASS_MEMPROTECT,
+		rc = avc_has_perm(&selinux_state,
+				  sid, sid, SECCLASS_MEMPROTECT,
 				  MEMPROTECT__MMAP_ZERO, NULL);
 	}
 
@@ -3986,11 +4043,13 @@ static int selinux_file_mprotect(struct vm_area_struct *vma,
 		 */
 		if (vma->vm_start >= vma->vm_mm->start_brk &&
 		    vma->vm_end <= vma->vm_mm->brk) {
-			rc = avc_has_perm(sid, sid, SECCLASS_PROCESS,
+			rc = avc_has_perm(&selinux_state,
+					  sid, sid, SECCLASS_PROCESS,
 					  PROCESS__EXECHEAP, NULL);
 		} else if (!vma->vm_file && (vma_is_initial_stack(vma) ||
 			    vma_is_stack_for_current(vma))) {
-			rc = avc_has_perm(sid, sid, SECCLASS_PROCESS,
+			rc = avc_has_perm(&selinux_state,
+					  sid, sid, SECCLASS_PROCESS,
 					  PROCESS__EXECSTACK, NULL);
 		} else if (vma->vm_file && vma->anon_vma) {
 			/*
@@ -4082,7 +4141,8 @@ static int selinux_file_send_sigiotask(struct task_struct *tsk,
 	else
 		perm = signal_to_av(signum);
 
-	return avc_has_perm(fsec->fown_sid, sid,
+	return avc_has_perm(&selinux_state,
+			    fsec->fown_sid, sid,
 			    SECCLASS_PROCESS, perm, NULL);
 }
 
@@ -4108,7 +4168,7 @@ static int selinux_file_open(struct file *file)
 	 * struct as its SID.
 	 */
 	fsec->isid = isec->sid;
-	fsec->pseqno = avc_policy_seqno();
+	fsec->pseqno = avc_policy_seqno(&selinux_state);
 	/*
 	 * Since the inode label or policy seqno may have changed
 	 * between the selinux_inode_permission check and the saving
@@ -4127,7 +4187,8 @@ static int selinux_task_alloc(struct task_struct *task,
 {
 	u32 sid = current_sid();
 
-	return avc_has_perm(sid, sid, SECCLASS_PROCESS, PROCESS__FORK, NULL);
+	return avc_has_perm(&selinux_state,
+			    sid, sid, SECCLASS_PROCESS, PROCESS__FORK, NULL);
 }
 
 /*
@@ -4174,7 +4235,8 @@ static int selinux_kernel_act_as(struct cred *new, u32 secid)
 	u32 sid = current_sid();
 	int ret;
 
-	ret = avc_has_perm(sid, secid,
+	ret = avc_has_perm(&selinux_state,
+			   sid, secid,
 			   SECCLASS_KERNEL_SERVICE,
 			   KERNEL_SERVICE__USE_AS_OVERRIDE,
 			   NULL);
@@ -4198,7 +4260,8 @@ static int selinux_kernel_create_files_as(struct cred *new, struct inode *inode)
 	u32 sid = current_sid();
 	int ret;
 
-	ret = avc_has_perm(sid, isec->sid,
+	ret = avc_has_perm(&selinux_state,
+			   sid, isec->sid,
 			   SECCLASS_KERNEL_SERVICE,
 			   KERNEL_SERVICE__CREATE_FILES_AS,
 			   NULL);
@@ -4215,7 +4278,8 @@ static int selinux_kernel_module_request(char *kmod_name)
 	ad.type = LSM_AUDIT_DATA_KMOD;
 	ad.u.kmod_name = kmod_name;
 
-	return avc_has_perm(current_sid(), SECINITSID_KERNEL, SECCLASS_SYSTEM,
+	return avc_has_perm(&selinux_state,
+			    current_sid(), SECINITSID_KERNEL, SECCLASS_SYSTEM,
 			    SYSTEM__MODULE_REQUEST, &ad);
 }
 
@@ -4228,20 +4292,25 @@ static int selinux_kernel_load_from_file(struct file *file, u32 requested)
 	int rc;
 
 	if (file == NULL)
-		return avc_has_perm(sid, sid, SECCLASS_SYSTEM, requested, NULL);
+		return avc_has_perm(&selinux_state,
+				    sid, sid, SECCLASS_SYSTEM, requested,
+				    NULL);
 
+	/* finit_module */
 	ad.type = LSM_AUDIT_DATA_FILE;
 	ad.u.file = file;
 
 	fsec = selinux_file(file);
 	if (sid != fsec->sid) {
-		rc = avc_has_perm(sid, fsec->sid, SECCLASS_FD, FD__USE, &ad);
+		rc = avc_has_perm(&selinux_state,
+				  sid, fsec->sid, SECCLASS_FD, FD__USE, &ad);
 		if (rc)
 			return rc;
 	}
 
 	isec = inode_security(file_inode(file));
-	return avc_has_perm(sid, isec->sid, SECCLASS_SYSTEM, requested, &ad);
+	return avc_has_perm(&selinux_state,
+			    sid, isec->sid, SECCLASS_SYSTEM, requested, &ad);
 }
 
 static int selinux_kernel_read_file(struct file *file,
@@ -4321,19 +4390,22 @@ static int selinux_kernel_load_data(enum kernel_load_data_id id, bool contents)
 
 static int selinux_task_setpgid(struct task_struct *p, pid_t pgid)
 {
-	return avc_has_perm(current_sid(), task_sid_obj(p), SECCLASS_PROCESS,
+	return avc_has_perm(&selinux_state,
+			    current_sid(), task_sid_obj(p), SECCLASS_PROCESS,
 			    PROCESS__SETPGID, NULL);
 }
 
 static int selinux_task_getpgid(struct task_struct *p)
 {
-	return avc_has_perm(current_sid(), task_sid_obj(p), SECCLASS_PROCESS,
+	return avc_has_perm(&selinux_state,
+			    current_sid(), task_sid_obj(p), SECCLASS_PROCESS,
 			    PROCESS__GETPGID, NULL);
 }
 
 static int selinux_task_getsid(struct task_struct *p)
 {
-	return avc_has_perm(current_sid(), task_sid_obj(p), SECCLASS_PROCESS,
+	return avc_has_perm(&selinux_state,
+			    current_sid(), task_sid_obj(p), SECCLASS_PROCESS,
 			    PROCESS__GETSESSION, NULL);
 }
 
@@ -4350,19 +4422,22 @@ static void selinux_task_getlsmprop_obj(struct task_struct *p,
 
 static int selinux_task_setnice(struct task_struct *p, int nice)
 {
-	return avc_has_perm(current_sid(), task_sid_obj(p), SECCLASS_PROCESS,
+	return avc_has_perm(&selinux_state,
+			    current_sid(), task_sid_obj(p), SECCLASS_PROCESS,
 			    PROCESS__SETSCHED, NULL);
 }
 
 static int selinux_task_setioprio(struct task_struct *p, int ioprio)
 {
-	return avc_has_perm(current_sid(), task_sid_obj(p), SECCLASS_PROCESS,
+	return avc_has_perm(&selinux_state,
+			    current_sid(), task_sid_obj(p), SECCLASS_PROCESS,
 			    PROCESS__SETSCHED, NULL);
 }
 
 static int selinux_task_getioprio(struct task_struct *p)
 {
-	return avc_has_perm(current_sid(), task_sid_obj(p), SECCLASS_PROCESS,
+	return avc_has_perm(&selinux_state,
+			    current_sid(), task_sid_obj(p), SECCLASS_PROCESS,
 			    PROCESS__GETSCHED, NULL);
 }
 
@@ -4377,7 +4452,8 @@ static int selinux_task_prlimit(const struct cred *cred, const struct cred *tcre
 		av |= PROCESS__SETRLIMIT;
 	if (flags & LSM_PRLIMIT_READ)
 		av |= PROCESS__GETRLIMIT;
-	return avc_has_perm(cred_sid(cred), cred_sid(tcred),
+	return avc_has_perm(&selinux_state,
+			    cred_sid(cred), cred_sid(tcred),
 			    SECCLASS_PROCESS, av, NULL);
 }
 
@@ -4391,7 +4467,8 @@ static int selinux_task_setrlimit(struct task_struct *p, unsigned int resource,
 	   later be used as a safe reset point for the soft limit
 	   upon context transitions.  See selinux_bprm_committing_creds. */
 	if (old_rlim->rlim_max != new_rlim->rlim_max)
-		return avc_has_perm(current_sid(), task_sid_obj(p),
+		return avc_has_perm(&selinux_state,
+				    current_sid(), task_sid_obj(p),
 				    SECCLASS_PROCESS, PROCESS__SETRLIMIT, NULL);
 
 	return 0;
@@ -4399,19 +4476,22 @@ static int selinux_task_setrlimit(struct task_struct *p, unsigned int resource,
 
 static int selinux_task_setscheduler(struct task_struct *p)
 {
-	return avc_has_perm(current_sid(), task_sid_obj(p), SECCLASS_PROCESS,
+	return avc_has_perm(&selinux_state,
+			    current_sid(), task_sid_obj(p), SECCLASS_PROCESS,
 			    PROCESS__SETSCHED, NULL);
 }
 
 static int selinux_task_getscheduler(struct task_struct *p)
 {
-	return avc_has_perm(current_sid(), task_sid_obj(p), SECCLASS_PROCESS,
+	return avc_has_perm(&selinux_state,
+			    current_sid(), task_sid_obj(p), SECCLASS_PROCESS,
 			    PROCESS__GETSCHED, NULL);
 }
 
 static int selinux_task_movememory(struct task_struct *p)
 {
-	return avc_has_perm(current_sid(), task_sid_obj(p), SECCLASS_PROCESS,
+	return avc_has_perm(&selinux_state,
+			    current_sid(), task_sid_obj(p), SECCLASS_PROCESS,
 			    PROCESS__SETSCHED, NULL);
 }
 
@@ -4429,7 +4509,8 @@ static int selinux_task_kill(struct task_struct *p, struct kernel_siginfo *info,
 		secid = current_sid();
 	else
 		secid = cred_sid(cred);
-	return avc_has_perm(secid, task_sid_obj(p), SECCLASS_PROCESS, perm, NULL);
+	return avc_has_perm(&selinux_state,
+			    secid, task_sid_obj(p), SECCLASS_PROCESS, perm, NULL);
 }
 
 static void selinux_task_to_inode(struct task_struct *p,
@@ -4449,8 +4530,8 @@ static int selinux_userns_create(const struct cred *cred)
 {
 	u32 sid = current_sid();
 
-	return avc_has_perm(sid, sid, SECCLASS_USER_NAMESPACE,
-			USER_NAMESPACE__CREATE, NULL);
+	return avc_has_perm(&selinux_state, sid, sid, SECCLASS_USER_NAMESPACE,
+						USER_NAMESPACE__CREATE, NULL);
 }
 
 /* Returns error only if unable to parse addresses */
@@ -4708,7 +4789,7 @@ static int selinux_skb_peerlbl_sid(struct sk_buff *skb, u16 family, u32 *sid)
 	if (unlikely(err))
 		return -EACCES;
 
-	err = security_net_peersid_resolve(nlbl_sid,
+	err = security_net_peersid_resolve(&selinux_state, nlbl_sid,
 					   nlbl_type, xfrm_sid, sid);
 	if (unlikely(err)) {
 		pr_warn(
@@ -4737,7 +4818,7 @@ static int selinux_conn_sid(u32 sk_sid, u32 skb_sid, u32 *conn_sid)
 	int err = 0;
 
 	if (skb_sid != SECSID_NULL)
-		err = security_sid_mls_copy(sk_sid, skb_sid,
+		err = security_sid_mls_copy(&selinux_state, sk_sid, skb_sid,
 					    conn_sid);
 	else
 		*conn_sid = sk_sid;
@@ -4755,7 +4836,7 @@ static int socket_sockcreate_sid(const struct task_security_struct *tsec,
 		return 0;
 	}
 
-	return security_transition_sid(tsec->sid, tsec->sid,
+	return security_transition_sid(&selinux_state, tsec->sid, tsec->sid,
 				       secclass, NULL, socksid);
 }
 
@@ -4793,7 +4874,8 @@ static int sock_has_perm(struct sock *sk, u32 perms)
 
 	ad_net_init_from_sk(&ad, &net, sk);
 
-	return avc_has_perm(current_sid(), sksec->sid, sksec->sclass, perms,
+	return avc_has_perm(&selinux_state,
+			    current_sid(), sksec->sid, sksec->sclass, perms,
 			    &ad);
 }
 
@@ -4813,7 +4895,8 @@ static int selinux_socket_create(int family, int type,
 	if (rc)
 		return rc;
 
-	return avc_has_perm(tsec->sid, newsid, secclass, SOCKET__CREATE, NULL);
+	return avc_has_perm(&selinux_state,
+			    tsec->sid, newsid, secclass, SOCKET__CREATE, NULL);
 }
 
 static int selinux_socket_post_create(struct socket *sock, int family,
@@ -4949,7 +5032,8 @@ static int selinux_socket_bind(struct socket *sock, struct sockaddr *address, in
 						      snum, &sid);
 				if (err)
 					goto out;
-				err = avc_has_perm(sksec->sid, sid,
+				err = avc_has_perm(&selinux_state,
+						   sksec->sid, sid,
 						   sksec->sclass,
 						   SOCKET__NAME_BIND, &ad);
 				if (err)
@@ -4988,7 +5072,8 @@ static int selinux_socket_bind(struct socket *sock, struct sockaddr *address, in
 		else
 			ad.u.net->v6info.saddr = addr6->sin6_addr;
 
-		err = avc_has_perm(sksec->sid, sid,
+		err = avc_has_perm(&selinux_state,
+				   sksec->sid, sid,
 				   sksec->sclass, node_perm, &ad);
 		if (err)
 			goto out;
@@ -5086,7 +5171,8 @@ static int selinux_socket_connect_helper(struct socket *sock,
 		ad.u.net = &net;
 		ad.u.net->dport = htons(snum);
 		ad.u.net->family = address->sa_family;
-		err = avc_has_perm(sksec->sid, sid, sksec->sclass, perm, &ad);
+		err = avc_has_perm(&selinux_state,
+				   sksec->sid, sid, sksec->sclass, perm, &ad);
 		if (err)
 			return err;
 	}
@@ -5196,7 +5282,8 @@ static int selinux_socket_unix_stream_connect(struct sock *sock,
 
 	ad_net_init_from_sk(&ad, &net, other);
 
-	err = avc_has_perm(sksec_sock->sid, sksec_other->sid,
+	err = avc_has_perm(&selinux_state,
+			   sksec_sock->sid, sksec_other->sid,
 			   sksec_other->sclass,
 			   UNIX_STREAM_SOCKET__CONNECTTO, &ad);
 	if (err)
@@ -5204,7 +5291,7 @@ static int selinux_socket_unix_stream_connect(struct sock *sock,
 
 	/* server child socket */
 	sksec_new->peer_sid = sksec_sock->sid;
-	err = security_sid_mls_copy(sksec_other->sid,
+	err = security_sid_mls_copy(&selinux_state, sksec_other->sid,
 				    sksec_sock->sid, &sksec_new->sid);
 	if (err)
 		return err;
@@ -5225,7 +5312,8 @@ static int selinux_socket_unix_may_send(struct socket *sock,
 
 	ad_net_init_from_sk(&ad, &net, other->sk);
 
-	return avc_has_perm(ssec->sid, osec->sid, osec->sclass, SOCKET__SENDTO,
+	return avc_has_perm(&selinux_state,
+			    ssec->sid, osec->sid, osec->sclass, SOCKET__SENDTO,
 			    &ad);
 }
 
@@ -5240,7 +5328,8 @@ static int selinux_inet_sys_rcv_skb(struct net *ns, int ifindex,
 	err = sel_netif_sid(ns, ifindex, &if_sid);
 	if (err)
 		return err;
-	err = avc_has_perm(peer_sid, if_sid,
+	err = avc_has_perm(&selinux_state,
+			   peer_sid, if_sid,
 			   SECCLASS_NETIF, NETIF__INGRESS, ad);
 	if (err)
 		return err;
@@ -5248,7 +5337,8 @@ static int selinux_inet_sys_rcv_skb(struct net *ns, int ifindex,
 	err = sel_netnode_sid(addrp, family, &node_sid);
 	if (err)
 		return err;
-	return avc_has_perm(peer_sid, node_sid,
+	return avc_has_perm(&selinux_state,
+			    peer_sid, node_sid,
 			    SECCLASS_NODE, NODE__RECVFROM, ad);
 }
 
@@ -5268,7 +5358,8 @@ static int selinux_sock_rcv_skb_compat(struct sock *sk, struct sk_buff *skb,
 		return err;
 
 	if (selinux_secmark_enabled()) {
-		err = avc_has_perm(sk_sid, skb->secmark, SECCLASS_PACKET,
+		err = avc_has_perm(&selinux_state,
+				   sk_sid, skb->secmark, SECCLASS_PACKET,
 				   PACKET__RECV, &ad);
 		if (err)
 			return err;
@@ -5328,7 +5419,8 @@ static int selinux_socket_sock_rcv_skb(struct sock *sk, struct sk_buff *skb)
 			selinux_netlbl_err(skb, family, err, 0);
 			return err;
 		}
-		err = avc_has_perm(sk_sid, peer_sid, SECCLASS_PEER,
+		err = avc_has_perm(&selinux_state,
+				   sk_sid, peer_sid, SECCLASS_PEER,
 				   PEER__RECV, &ad);
 		if (err) {
 			selinux_netlbl_err(skb, family, err, 0);
@@ -5337,7 +5429,8 @@ static int selinux_socket_sock_rcv_skb(struct sock *sk, struct sk_buff *skb)
 	}
 
 	if (secmark_active) {
-		err = avc_has_perm(sk_sid, skb->secmark, SECCLASS_PACKET,
+		err = avc_has_perm(&selinux_state,
+				   sk_sid, skb->secmark, SECCLASS_PACKET,
 				   PACKET__RECV, &ad);
 		if (err)
 			return err;
@@ -5363,7 +5456,7 @@ static int selinux_socket_getpeersec_stream(struct socket *sock,
 	if (peer_sid == SECSID_NULL)
 		return -ENOPROTOOPT;
 
-	err = security_sid_to_context(peer_sid, &scontext,
+	err = security_sid_to_context(&selinux_state, peer_sid, &scontext,
 				      &scontext_len);
 	if (err)
 		return err;
@@ -5513,7 +5606,8 @@ static int selinux_sctp_process_new_assoc(struct sctp_association *asoc,
 		 * consistency among the peer SIDs.
 		 */
 		ad_net_init_from_sk(&ad, &net, asoc->base.sk);
-		err = avc_has_perm(sksec->peer_sid, asoc->peer_secid,
+		err = avc_has_perm(&selinux_state,
+				   sksec->peer_sid, asoc->peer_secid,
 				   sksec->sclass, SCTP_SOCKET__ASSOCIATION,
 				   &ad);
 		if (err)
@@ -5743,8 +5837,9 @@ static void selinux_inet_conn_established(struct sock *sk, struct sk_buff *skb)
 
 static int selinux_secmark_relabel_packet(u32 sid)
 {
-	return avc_has_perm(current_sid(), sid, SECCLASS_PACKET, PACKET__RELABELTO,
-			    NULL);
+	return avc_has_perm(&selinux_state,
+			    current_sid(), sid, SECCLASS_PACKET,
+			    PACKET__RELABELTO, NULL);
 }
 
 static void selinux_secmark_refcount_inc(void)
@@ -5782,7 +5877,8 @@ static int selinux_tun_dev_create(void)
 	 * connections unlike traditional sockets - check the TUN driver to
 	 * get a better understanding of why this socket is special */
 
-	return avc_has_perm(sid, sid, SECCLASS_TUN_SOCKET, TUN_SOCKET__CREATE,
+	return avc_has_perm(&selinux_state,
+			    sid, sid, SECCLASS_TUN_SOCKET, TUN_SOCKET__CREATE,
 			    NULL);
 }
 
@@ -5790,7 +5886,8 @@ static int selinux_tun_dev_attach_queue(void *security)
 {
 	struct tun_security_struct *tunsec = selinux_tun_dev(security);
 
-	return avc_has_perm(current_sid(), tunsec->sid, SECCLASS_TUN_SOCKET,
+	return avc_has_perm(&selinux_state,
+			    current_sid(), tunsec->sid, SECCLASS_TUN_SOCKET,
 			    TUN_SOCKET__ATTACH_QUEUE, NULL);
 }
 
@@ -5818,11 +5915,13 @@ static int selinux_tun_dev_open(void *security)
 	u32 sid = current_sid();
 	int err;
 
-	err = avc_has_perm(sid, tunsec->sid, SECCLASS_TUN_SOCKET,
+	err = avc_has_perm(&selinux_state,
+			   sid, tunsec->sid, SECCLASS_TUN_SOCKET,
 			   TUN_SOCKET__RELABELFROM, NULL);
 	if (err)
 		return err;
-	err = avc_has_perm(sid, sid, SECCLASS_TUN_SOCKET,
+	err = avc_has_perm(&selinux_state,
+			   sid, sid, SECCLASS_TUN_SOCKET,
 			   TUN_SOCKET__RELABELTO, NULL);
 	if (err)
 		return err;
@@ -5873,7 +5972,8 @@ static unsigned int selinux_ip_forward(void *priv, struct sk_buff *skb,
 	}
 
 	if (secmark_active)
-		if (avc_has_perm(peer_sid, skb->secmark,
+		if (avc_has_perm(&selinux_state,
+				 peer_sid, skb->secmark,
 				 SECCLASS_PACKET, PACKET__FORWARD_IN, &ad))
 			return NF_DROP;
 
@@ -5950,7 +6050,8 @@ static unsigned int selinux_ip_postroute_compat(struct sk_buff *skb,
 		return NF_DROP;
 
 	if (selinux_secmark_enabled())
-		if (avc_has_perm(sksec->sid, skb->secmark,
+		if (avc_has_perm(&selinux_state,
+				 sksec->sid, skb->secmark,
 				 SECCLASS_PACKET, PACKET__SEND, &ad))
 			return NF_DROP_ERR(-ECONNREFUSED);
 
@@ -6072,7 +6173,8 @@ static unsigned int selinux_ip_postroute(void *priv,
 		return NF_DROP;
 
 	if (secmark_active)
-		if (avc_has_perm(peer_sid, skb->secmark,
+		if (avc_has_perm(&selinux_state,
+				 peer_sid, skb->secmark,
 				 SECCLASS_PACKET, secmark_perm, &ad))
 			return NF_DROP_ERR(-ECONNREFUSED);
 
@@ -6082,13 +6184,15 @@ static unsigned int selinux_ip_postroute(void *priv,
 
 		if (sel_netif_sid(state->net, ifindex, &if_sid))
 			return NF_DROP;
-		if (avc_has_perm(peer_sid, if_sid,
+		if (avc_has_perm(&selinux_state,
+				 peer_sid, if_sid,
 				 SECCLASS_NETIF, NETIF__EGRESS, &ad))
 			return NF_DROP_ERR(-ECONNREFUSED);
 
 		if (sel_netnode_sid(addrp, family, &node_sid))
 			return NF_DROP;
-		if (avc_has_perm(peer_sid, node_sid,
+		if (avc_has_perm(&selinux_state,
+				 peer_sid, node_sid,
 				 SECCLASS_NODE, NODE__SENDTO, &ad))
 			return NF_DROP_ERR(-ECONNREFUSED);
 	}
@@ -6113,8 +6217,9 @@ static int nlmsg_sock_has_extended_perms(struct sock *sk, u32 perms, u16 nlmsg_t
 	driver = nlmsg_type >> 8;
 	xperm = nlmsg_type & 0xff;
 
-	return avc_has_extended_perms(current_sid(), sksec->sid, sksec->sclass,
-				      perms, driver, AVC_EXT_NLMSG, xperm, &ad);
+	return avc_has_extended_perms(&selinux_state, current_sid(),
+				      sksec->sid, sksec->sclass, perms,
+				      driver, AVC_EXT_NLMSG, xperm, &ad);
 }
 
 static int selinux_netlink_send(struct sock *sk, struct sk_buff *skb)
@@ -6158,8 +6263,8 @@ static int selinux_netlink_send(struct sock *sk, struct sk_buff *skb)
 				sk->sk_protocol, nlh->nlmsg_type,
 				secclass_map[sclass - 1].name,
 				task_pid_nr(current), current->comm);
-			if (enforcing_enabled() &&
-			    !security_get_allow_unknown())
+			if (enforcing_enabled(&selinux_state) &&
+			    !security_get_allow_unknown(&selinux_state))
 				return rc;
 			rc = 0;
 		} else if (rc == -ENOENT) {
@@ -6198,7 +6303,8 @@ static int ipc_has_perm(struct kern_ipc_perm *ipc_perms,
 	ad.type = LSM_AUDIT_DATA_IPC;
 	ad.u.ipc_id = ipc_perms->key;
 
-	return avc_has_perm(sid, isec->sid, isec->sclass, perms, &ad);
+	return avc_has_perm(&selinux_state,
+			    sid, isec->sid, isec->sclass, perms, &ad);
 }
 
 static int selinux_msg_msg_alloc_security(struct msg_msg *msg)
@@ -6224,7 +6330,8 @@ static int selinux_msg_queue_alloc_security(struct kern_ipc_perm *msq)
 	ad.type = LSM_AUDIT_DATA_IPC;
 	ad.u.ipc_id = msq->key;
 
-	return avc_has_perm(sid, isec->sid, SECCLASS_MSGQ,
+	return avc_has_perm(&selinux_state,
+			    sid, isec->sid, SECCLASS_MSGQ,
 			    MSGQ__CREATE, &ad);
 }
 
@@ -6239,7 +6346,8 @@ static int selinux_msg_queue_associate(struct kern_ipc_perm *msq, int msqflg)
 	ad.type = LSM_AUDIT_DATA_IPC;
 	ad.u.ipc_id = msq->key;
 
-	return avc_has_perm(sid, isec->sid, SECCLASS_MSGQ,
+	return avc_has_perm(&selinux_state,
+			    sid, isec->sid, SECCLASS_MSGQ,
 			    MSGQ__ASSOCIATE, &ad);
 }
 
@@ -6251,7 +6359,8 @@ static int selinux_msg_queue_msgctl(struct kern_ipc_perm *msq, int cmd)
 	case IPC_INFO:
 	case MSG_INFO:
 		/* No specific object, just general system-wide information. */
-		return avc_has_perm(current_sid(), SECINITSID_KERNEL,
+		return avc_has_perm(&selinux_state,
+				    current_sid(), SECINITSID_KERNEL,
 				    SECCLASS_SYSTEM, SYSTEM__IPC_INFO, NULL);
 	case IPC_STAT:
 	case MSG_STAT:
@@ -6290,7 +6399,7 @@ static int selinux_msg_queue_msgsnd(struct kern_ipc_perm *msq, struct msg_msg *m
 		 * Compute new sid based on current process and
 		 * message queue this message will be stored in
 		 */
-		rc = security_transition_sid(sid, isec->sid,
+		rc = security_transition_sid(&selinux_state, sid, isec->sid,
 					     SECCLASS_MSG, NULL, &msec->sid);
 		if (rc)
 			return rc;
@@ -6300,15 +6409,18 @@ static int selinux_msg_queue_msgsnd(struct kern_ipc_perm *msq, struct msg_msg *m
 	ad.u.ipc_id = msq->key;
 
 	/* Can this process write to the queue? */
-	rc = avc_has_perm(sid, isec->sid, SECCLASS_MSGQ,
+	rc = avc_has_perm(&selinux_state,
+			  sid, isec->sid, SECCLASS_MSGQ,
 			  MSGQ__WRITE, &ad);
 	if (!rc)
 		/* Can this process send the message */
-		rc = avc_has_perm(sid, msec->sid, SECCLASS_MSG,
+		rc = avc_has_perm(&selinux_state,
+				  sid, msec->sid, SECCLASS_MSG,
 				  MSG__SEND, &ad);
 	if (!rc)
 		/* Can the message be put in the queue? */
-		rc = avc_has_perm(msec->sid, isec->sid, SECCLASS_MSGQ,
+		rc = avc_has_perm(&selinux_state,
+				  msec->sid, isec->sid, SECCLASS_MSGQ,
 				  MSGQ__ENQUEUE, &ad);
 
 	return rc;
@@ -6330,10 +6442,12 @@ static int selinux_msg_queue_msgrcv(struct kern_ipc_perm *msq, struct msg_msg *m
 	ad.type = LSM_AUDIT_DATA_IPC;
 	ad.u.ipc_id = msq->key;
 
-	rc = avc_has_perm(sid, isec->sid,
+	rc = avc_has_perm(&selinux_state,
+			  sid, isec->sid,
 			  SECCLASS_MSGQ, MSGQ__READ, &ad);
 	if (!rc)
-		rc = avc_has_perm(sid, msec->sid,
+		rc = avc_has_perm(&selinux_state,
+				  sid, msec->sid,
 				  SECCLASS_MSG, MSG__RECEIVE, &ad);
 	return rc;
 }
@@ -6351,7 +6465,8 @@ static int selinux_shm_alloc_security(struct kern_ipc_perm *shp)
 	ad.type = LSM_AUDIT_DATA_IPC;
 	ad.u.ipc_id = shp->key;
 
-	return avc_has_perm(sid, isec->sid, SECCLASS_SHM,
+	return avc_has_perm(&selinux_state,
+			    sid, isec->sid, SECCLASS_SHM,
 			    SHM__CREATE, &ad);
 }
 
@@ -6366,7 +6481,8 @@ static int selinux_shm_associate(struct kern_ipc_perm *shp, int shmflg)
 	ad.type = LSM_AUDIT_DATA_IPC;
 	ad.u.ipc_id = shp->key;
 
-	return avc_has_perm(sid, isec->sid, SECCLASS_SHM,
+	return avc_has_perm(&selinux_state,
+			    sid, isec->sid, SECCLASS_SHM,
 			    SHM__ASSOCIATE, &ad);
 }
 
@@ -6379,7 +6495,8 @@ static int selinux_shm_shmctl(struct kern_ipc_perm *shp, int cmd)
 	case IPC_INFO:
 	case SHM_INFO:
 		/* No specific object, just general system-wide information. */
-		return avc_has_perm(current_sid(), SECINITSID_KERNEL,
+		return avc_has_perm(&selinux_state,
+				    current_sid(), SECINITSID_KERNEL,
 				    SECCLASS_SYSTEM, SYSTEM__IPC_INFO, NULL);
 	case IPC_STAT:
 	case SHM_STAT:
@@ -6429,7 +6546,8 @@ static int selinux_sem_alloc_security(struct kern_ipc_perm *sma)
 	ad.type = LSM_AUDIT_DATA_IPC;
 	ad.u.ipc_id = sma->key;
 
-	return avc_has_perm(sid, isec->sid, SECCLASS_SEM,
+	return avc_has_perm(&selinux_state,
+			    sid, isec->sid, SECCLASS_SEM,
 			    SEM__CREATE, &ad);
 }
 
@@ -6444,7 +6562,8 @@ static int selinux_sem_associate(struct kern_ipc_perm *sma, int semflg)
 	ad.type = LSM_AUDIT_DATA_IPC;
 	ad.u.ipc_id = sma->key;
 
-	return avc_has_perm(sid, isec->sid, SECCLASS_SEM,
+	return avc_has_perm(&selinux_state,
+			    sid, isec->sid, SECCLASS_SEM,
 			    SEM__ASSOCIATE, &ad);
 }
 
@@ -6458,7 +6577,8 @@ static int selinux_sem_semctl(struct kern_ipc_perm *sma, int cmd)
 	case IPC_INFO:
 	case SEM_INFO:
 		/* No specific object, just general system-wide information. */
-		return avc_has_perm(current_sid(), SECINITSID_KERNEL,
+		return avc_has_perm(&selinux_state,
+				    current_sid(), SECINITSID_KERNEL,
 				    SECCLASS_SYSTEM, SYSTEM__IPC_INFO, NULL);
 	case GETPID:
 	case GETNCNT:
@@ -6545,7 +6665,8 @@ static int selinux_lsm_getattr(unsigned int attr, struct task_struct *p,
 	rcu_read_lock();
 	tsec = selinux_cred(__task_cred(p));
 	if (p != current) {
-		error = avc_has_perm(current_sid(), tsec->sid,
+		error = avc_has_perm(&selinux_state,
+				     current_sid(), tsec->sid,
 				     SECCLASS_PROCESS, PROCESS__GETATTR, NULL);
 		if (error)
 			goto err_unlock;
@@ -6580,7 +6701,7 @@ static int selinux_lsm_getattr(unsigned int attr, struct task_struct *p,
 		return 0;
 	}
 
-	error = security_sid_to_context(sid, value, &len);
+	error = security_sid_to_context(&selinux_state, sid, value, &len);
 	if (error)
 		return error;
 	return len;
@@ -6603,23 +6724,28 @@ static int selinux_lsm_setattr(u64 attr, void *value, size_t size)
 	 */
 	switch (attr) {
 	case LSM_ATTR_EXEC:
-		error = avc_has_perm(mysid, mysid, SECCLASS_PROCESS,
+		error = avc_has_perm(&selinux_state,
+				     mysid, mysid, SECCLASS_PROCESS,
 				     PROCESS__SETEXEC, NULL);
 		break;
 	case LSM_ATTR_FSCREATE:
-		error = avc_has_perm(mysid, mysid, SECCLASS_PROCESS,
+		error = avc_has_perm(&selinux_state,
+				     mysid, mysid, SECCLASS_PROCESS,
 				     PROCESS__SETFSCREATE, NULL);
 		break;
 	case LSM_ATTR_KEYCREATE:
-		error = avc_has_perm(mysid, mysid, SECCLASS_PROCESS,
+		error = avc_has_perm(&selinux_state,
+				     mysid, mysid, SECCLASS_PROCESS,
 				     PROCESS__SETKEYCREATE, NULL);
 		break;
 	case LSM_ATTR_SOCKCREATE:
-		error = avc_has_perm(mysid, mysid, SECCLASS_PROCESS,
+		error = avc_has_perm(&selinux_state,
+				     mysid, mysid, SECCLASS_PROCESS,
 				     PROCESS__SETSOCKCREATE, NULL);
 		break;
 	case LSM_ATTR_CURRENT:
-		error = avc_has_perm(mysid, mysid, SECCLASS_PROCESS,
+		error = avc_has_perm(&selinux_state,
+				     mysid, mysid, SECCLASS_PROCESS,
 				     PROCESS__SETCURRENT, NULL);
 		break;
 	default:
@@ -6635,7 +6761,7 @@ static int selinux_lsm_setattr(u64 attr, void *value, size_t size)
 			str[size-1] = 0;
 			size--;
 		}
-		error = security_context_to_sid(value, size,
+		error = security_context_to_sid(&selinux_state, value, size,
 						&sid, GFP_KERNEL);
 		if (error == -EINVAL && attr == LSM_ATTR_FSCREATE) {
 			if (!has_cap_mac_admin(true)) {
@@ -6661,8 +6787,9 @@ static int selinux_lsm_setattr(u64 attr, void *value, size_t size)
 
 				return error;
 			}
-			error = security_context_to_sid_force(value, size,
-							&sid);
+			error = security_context_to_sid_force(
+						      &selinux_state,
+						      value, size, &sid);
 		}
 		if (error)
 			return error;
@@ -6685,7 +6812,7 @@ static int selinux_lsm_setattr(u64 attr, void *value, size_t size)
 		tsec->create_sid = sid;
 	} else if (attr == LSM_ATTR_KEYCREATE) {
 		if (sid) {
-			error = avc_has_perm(mysid, sid,
+			error = avc_has_perm(&selinux_state, mysid, sid,
 					     SECCLASS_KEY, KEY__CREATE, NULL);
 			if (error)
 				goto abort_change;
@@ -6699,13 +6826,15 @@ static int selinux_lsm_setattr(u64 attr, void *value, size_t size)
 			goto abort_change;
 
 		if (!current_is_single_threaded()) {
-			error = security_bounded_transition(tsec->sid, sid);
+			error = security_bounded_transition(&selinux_state,
+							    tsec->sid, sid);
 			if (error)
 				goto abort_change;
 		}
 
 		/* Check permissions for the transition. */
-		error = avc_has_perm(tsec->sid, sid, SECCLASS_PROCESS,
+		error = avc_has_perm(&selinux_state,
+				     tsec->sid, sid, SECCLASS_PROCESS,
 				     PROCESS__DYNTRANSITION, NULL);
 		if (error)
 			goto abort_change;
@@ -6714,7 +6843,8 @@ static int selinux_lsm_setattr(u64 attr, void *value, size_t size)
 		   Otherwise, leave SID unchanged and fail. */
 		ptsid = ptrace_parent_sid();
 		if (ptsid != 0) {
-			error = avc_has_perm(ptsid, sid, SECCLASS_PROCESS,
+			error = avc_has_perm(&selinux_state,
+					     ptsid, sid, SECCLASS_PROCESS,
 					     PROCESS__PTRACE, NULL);
 			if (error)
 				goto abort_change;
@@ -6809,12 +6939,13 @@ static int selinux_secid_to_secctx(u32 secid, struct lsm_context *cp)
 
 	if (cp) {
 		cp->id = LSM_ID_SELINUX;
-		ret = security_sid_to_context(secid, &cp->context, &cp->len);
+		ret = security_sid_to_context(&selinux_state, secid,
+					      &cp->context, &cp->len);
 		if (ret < 0)
 			return ret;
 		return cp->len;
 	}
-	ret = security_sid_to_context(secid, NULL, &seclen);
+	ret = security_sid_to_context(&selinux_state, secid, NULL, &seclen);
 	if (ret < 0)
 		return ret;
 	return seclen;
@@ -6828,7 +6959,7 @@ static int selinux_lsmprop_to_secctx(struct lsm_prop *prop,
 
 static int selinux_secctx_to_secid(const char *secdata, u32 seclen, u32 *secid)
 {
-	return security_context_to_sid(secdata, seclen,
+	return security_context_to_sid(&selinux_state, secdata, seclen,
 				       secid, GFP_KERNEL);
 }
 
@@ -6941,7 +7072,8 @@ static int selinux_key_permission(key_ref_t key_ref,
 	key = key_ref_to_ptr(key_ref);
 	ksec = selinux_key(key);
 
-	return avc_has_perm(sid, ksec->sid, SECCLASS_KEY, perm, NULL);
+	return avc_has_perm(&selinux_state,
+			    sid, ksec->sid, SECCLASS_KEY, perm, NULL);
 }
 
 static int selinux_key_getsecurity(struct key *key, char **_buffer)
@@ -6951,7 +7083,7 @@ static int selinux_key_getsecurity(struct key *key, char **_buffer)
 	unsigned len;
 	int rc;
 
-	rc = security_sid_to_context(ksec->sid,
+	rc = security_sid_to_context(&selinux_state, ksec->sid,
 				     &context, &len);
 	if (!rc)
 		rc = len;
@@ -6965,7 +7097,8 @@ static int selinux_watch_key(struct key *key)
 	struct key_security_struct *ksec = selinux_key(key);
 	u32 sid = current_sid();
 
-	return avc_has_perm(sid, ksec->sid, SECCLASS_KEY, KEY__VIEW, NULL);
+	return avc_has_perm(&selinux_state,
+			    sid, ksec->sid, SECCLASS_KEY, KEY__VIEW, NULL);
 }
 #endif
 #endif
@@ -6987,7 +7120,8 @@ static int selinux_ib_pkey_access(void *ib_sec, u64 subnet_prefix, u16 pkey_val)
 	ibpkey.subnet_prefix = subnet_prefix;
 	ibpkey.pkey = pkey_val;
 	ad.u.ibpkey = &ibpkey;
-	return avc_has_perm(sec->sid, sid,
+	return avc_has_perm(&selinux_state,
+			    sec->sid, sid,
 			    SECCLASS_INFINIBAND_PKEY,
 			    INFINIBAND_PKEY__ACCESS, &ad);
 }
@@ -7001,7 +7135,7 @@ static int selinux_ib_endport_manage_subnet(void *ib_sec, const char *dev_name,
 	struct ib_security_struct *sec = ib_sec;
 	struct lsm_ibendport_audit ibendport;
 
-	err = security_ib_endport_sid(dev_name, port_num,
+	err = security_ib_endport_sid(&selinux_state, dev_name, port_num,
 				      &sid);
 
 	if (err)
@@ -7011,7 +7145,8 @@ static int selinux_ib_endport_manage_subnet(void *ib_sec, const char *dev_name,
 	ibendport.dev_name = dev_name;
 	ibendport.port = port_num;
 	ad.u.ibendport = &ibendport;
-	return avc_has_perm(sec->sid, sid,
+	return avc_has_perm(&selinux_state,
+			    sec->sid, sid,
 			    SECCLASS_INFINIBAND_ENDPORT,
 			    INFINIBAND_ENDPORT__MANAGE_SUBNET, &ad);
 }
@@ -7034,11 +7169,13 @@ static int selinux_bpf(int cmd, union bpf_attr *attr,
 
 	switch (cmd) {
 	case BPF_MAP_CREATE:
-		ret = avc_has_perm(sid, sid, SECCLASS_BPF, BPF__MAP_CREATE,
+		ret = avc_has_perm(&selinux_state,
+				   sid, sid, SECCLASS_BPF, BPF__MAP_CREATE,
 				   NULL);
 		break;
 	case BPF_PROG_LOAD:
-		ret = avc_has_perm(sid, sid, SECCLASS_BPF, BPF__PROG_LOAD,
+		ret = avc_has_perm(&selinux_state,
+				   sid, sid, SECCLASS_BPF, BPF__PROG_LOAD,
 				   NULL);
 		break;
 	default:
@@ -7078,14 +7215,16 @@ static int bpf_fd_pass(const struct file *file, u32 sid)
 	if (file->f_op == &bpf_map_fops) {
 		map = file->private_data;
 		bpfsec = map->security;
-		ret = avc_has_perm(sid, bpfsec->sid, SECCLASS_BPF,
+		ret = avc_has_perm(&selinux_state,
+				   sid, bpfsec->sid, SECCLASS_BPF,
 				   bpf_map_fmode_to_av(file->f_mode), NULL);
 		if (ret)
 			return ret;
 	} else if (file->f_op == &bpf_prog_fops) {
 		prog = file->private_data;
 		bpfsec = prog->aux->security;
-		ret = avc_has_perm(sid, bpfsec->sid, SECCLASS_BPF,
+		ret = avc_has_perm(&selinux_state,
+				   sid, bpfsec->sid, SECCLASS_BPF,
 				   BPF__PROG_RUN, NULL);
 		if (ret)
 			return ret;
@@ -7099,7 +7238,8 @@ static int selinux_bpf_map(struct bpf_map *map, fmode_t fmode)
 	struct bpf_security_struct *bpfsec;
 
 	bpfsec = map->security;
-	return avc_has_perm(sid, bpfsec->sid, SECCLASS_BPF,
+	return avc_has_perm(&selinux_state,
+			    sid, bpfsec->sid, SECCLASS_BPF,
 			    bpf_map_fmode_to_av(fmode), NULL);
 }
 
@@ -7109,7 +7249,8 @@ static int selinux_bpf_prog(struct bpf_prog *prog)
 	struct bpf_security_struct *bpfsec;
 
 	bpfsec = prog->aux->security;
-	return avc_has_perm(sid, bpfsec->sid, SECCLASS_BPF,
+	return avc_has_perm(&selinux_state,
+			    sid, bpfsec->sid, SECCLASS_BPF,
 			    BPF__PROG_RUN, NULL);
 }
 
@@ -7216,7 +7357,7 @@ static int selinux_perf_event_open(int type)
 	else
 		return -EINVAL;
 
-	return avc_has_perm(sid, sid, SECCLASS_PERF_EVENT,
+	return avc_has_perm(&selinux_state, sid, sid, SECCLASS_PERF_EVENT,
 			    requested, NULL);
 }
 
@@ -7235,7 +7376,7 @@ static int selinux_perf_event_read(struct perf_event *event)
 	struct perf_event_security_struct *perfsec = event->security;
 	u32 sid = current_sid();
 
-	return avc_has_perm(sid, perfsec->sid,
+	return avc_has_perm(&selinux_state, sid, perfsec->sid,
 			    SECCLASS_PERF_EVENT, PERF_EVENT__READ, NULL);
 }
 
@@ -7244,7 +7385,7 @@ static int selinux_perf_event_write(struct perf_event *event)
 	struct perf_event_security_struct *perfsec = event->security;
 	u32 sid = current_sid();
 
-	return avc_has_perm(sid, perfsec->sid,
+	return avc_has_perm(&selinux_state, sid, perfsec->sid,
 			    SECCLASS_PERF_EVENT, PERF_EVENT__WRITE, NULL);
 }
 #endif
@@ -7259,7 +7400,7 @@ static int selinux_perf_event_write(struct perf_event *event)
  */
 static int selinux_uring_override_creds(const struct cred *new)
 {
-	return avc_has_perm(current_sid(), cred_sid(new),
+	return avc_has_perm(&selinux_state, current_sid(), cred_sid(new),
 			    SECCLASS_IO_URING, IO_URING__OVERRIDE_CREDS, NULL);
 }
 
@@ -7273,7 +7414,7 @@ static int selinux_uring_sqpoll(void)
 {
 	u32 sid = current_sid();
 
-	return avc_has_perm(sid, sid,
+	return avc_has_perm(&selinux_state, sid, sid,
 			    SECCLASS_IO_URING, IO_URING__SQPOLL, NULL);
 }
 
@@ -7295,7 +7436,7 @@ static int selinux_uring_cmd(struct io_uring_cmd *ioucmd)
 	ad.type = LSM_AUDIT_DATA_FILE;
 	ad.u.file = file;
 
-	return avc_has_perm(current_sid(), isec->sid,
+	return avc_has_perm(&selinux_state, current_sid(), isec->sid,
 			    SECCLASS_IO_URING, IO_URING__CMD, &ad);
 }
 
@@ -7308,8 +7449,8 @@ static int selinux_uring_allowed(void)
 {
 	u32 sid = current_sid();
 
-	return avc_has_perm(sid, sid, SECCLASS_IO_URING, IO_URING__ALLOWED,
-			    NULL);
+	return avc_has_perm(&selinux_state, sid, sid, SECCLASS_IO_URING,
+			    IO_URING__ALLOWED, NULL);
 }
 #endif /* CONFIG_IO_URING */
 
@@ -7623,8 +7764,8 @@ static __init int selinux_init(void)
 	pr_info("SELinux:  Initializing.\n");
 
 	memset(&selinux_state, 0, sizeof(selinux_state));
-	enforcing_set(selinux_enforcing_boot);
-	selinux_avc_init();
+	enforcing_set(&selinux_state, selinux_enforcing_boot);
+	selinux_avc_init(&selinux_state.avc);
 	mutex_init(&selinux_state.status_lock);
 	mutex_init(&selinux_state.policy_mutex);
 
diff --git a/security/selinux/ibpkey.c b/security/selinux/ibpkey.c
index 470481cfe0e8..7406706582f5 100644
--- a/security/selinux/ibpkey.c
+++ b/security/selinux/ibpkey.c
@@ -141,7 +141,7 @@ static int sel_ib_pkey_sid_slow(u64 subnet_prefix, u16 pkey_num, u32 *sid)
 		return 0;
 	}
 
-	ret = security_ib_pkey_sid(subnet_prefix, pkey_num,
+	ret = security_ib_pkey_sid(&selinux_state, subnet_prefix, pkey_num,
 				   sid);
 	if (ret)
 		goto out;
diff --git a/security/selinux/ima.c b/security/selinux/ima.c
index aa34da9b0aeb..08f89f212422 100644
--- a/security/selinux/ima.c
+++ b/security/selinux/ima.c
@@ -15,10 +15,12 @@
 /*
  * selinux_ima_collect_state - Read selinux configuration settings
  *
+ * @state: selinux_state
+ *
  * On success returns the configuration settings string.
  * On error, returns NULL.
  */
-static char *selinux_ima_collect_state(void)
+static char *selinux_ima_collect_state(struct selinux_state *state)
 {
 	const char *on = "=1;", *off = "=0;";
 	char *buf;
@@ -37,27 +39,26 @@ static char *selinux_ima_collect_state(void)
 	rc = strscpy(buf, "initialized", buf_len);
 	WARN_ON(rc < 0);
 
-	rc = strlcat(buf, selinux_initialized() ? on : off, buf_len);
+	rc = strlcat(buf, selinux_initialized(state) ? on : off, buf_len);
 	WARN_ON(rc >= buf_len);
 
 	rc = strlcat(buf, "enforcing", buf_len);
 	WARN_ON(rc >= buf_len);
 
-	rc = strlcat(buf, enforcing_enabled() ? on : off, buf_len);
+	rc = strlcat(buf, enforcing_enabled(state) ? on : off, buf_len);
 	WARN_ON(rc >= buf_len);
 
 	rc = strlcat(buf, "checkreqprot", buf_len);
 	WARN_ON(rc >= buf_len);
 
-	rc = strlcat(buf, checkreqprot_get() ? on : off, buf_len);
+	rc = strlcat(buf, checkreqprot_get(state) ? on : off, buf_len);
 	WARN_ON(rc >= buf_len);
 
 	for (i = 0; i < __POLICYDB_CAP_MAX; i++) {
 		rc = strlcat(buf, selinux_policycap_names[i], buf_len);
 		WARN_ON(rc >= buf_len);
 
-		rc = strlcat(buf, selinux_state.policycap[i] ? on : off,
-			buf_len);
+		rc = strlcat(buf, state->policycap[i] ? on : off, buf_len);
 		WARN_ON(rc >= buf_len);
 	}
 
@@ -66,17 +67,19 @@ static char *selinux_ima_collect_state(void)
 
 /*
  * selinux_ima_measure_state_locked - Measure SELinux state and hash of policy
+ *
+ * @state: selinux state struct
  */
-void selinux_ima_measure_state_locked(void)
+void selinux_ima_measure_state_locked(struct selinux_state *state)
 {
 	char *state_str = NULL;
 	void *policy = NULL;
 	size_t policy_len;
 	int rc = 0;
 
-	lockdep_assert_held(&selinux_state.policy_mutex);
+	lockdep_assert_held(&state->policy_mutex);
 
-	state_str = selinux_ima_collect_state();
+	state_str = selinux_ima_collect_state(state);
 	if (!state_str) {
 		pr_err("SELinux: %s: failed to read state.\n", __func__);
 		return;
@@ -91,10 +94,10 @@ void selinux_ima_measure_state_locked(void)
 	/*
 	 * Measure SELinux policy only after initialization is completed.
 	 */
-	if (!selinux_initialized())
+	if (!selinux_initialized(state))
 		return;
 
-	rc = security_read_state_kernel(&policy, &policy_len);
+	rc = security_read_state_kernel(state, &policy, &policy_len);
 	if (rc) {
 		pr_err("SELinux: %s: failed to read policy %d.\n", __func__, rc);
 		return;
@@ -109,12 +112,14 @@ void selinux_ima_measure_state_locked(void)
 
 /*
  * selinux_ima_measure_state - Measure SELinux state and hash of policy
+ *
+ * @state: selinux state struct
  */
-void selinux_ima_measure_state(void)
+void selinux_ima_measure_state(struct selinux_state *state)
 {
-	lockdep_assert_not_held(&selinux_state.policy_mutex);
+	lockdep_assert_not_held(&state->policy_mutex);
 
-	mutex_lock(&selinux_state.policy_mutex);
-	selinux_ima_measure_state_locked();
-	mutex_unlock(&selinux_state.policy_mutex);
+	mutex_lock(&state->policy_mutex);
+	selinux_ima_measure_state_locked(state);
+	mutex_unlock(&state->policy_mutex);
 }
diff --git a/security/selinux/include/avc.h b/security/selinux/include/avc.h
index 281f40103663..833eec9b5fac 100644
--- a/security/selinux/include/avc.h
+++ b/security/selinux/include/avc.h
@@ -53,6 +53,7 @@ struct selinux_audit_data {
 	u32 audited;
 	u32 denied;
 	int result;
+	struct selinux_state *state;
 } __randomize_layout;
 
 /*
@@ -94,11 +95,13 @@ static inline u32 avc_audit_required(u32 requested, struct av_decision *avd,
 	return audited;
 }
 
-int slow_avc_audit(u32 ssid, u32 tsid, u16 tclass, u32 requested, u32 audited,
-		   u32 denied, int result, struct common_audit_data *a);
+int slow_avc_audit(struct selinux_state *state, u32 ssid, u32 tsid, u16 tclass,
+		   u32 requested, u32 audited, u32 denied, int result,
+		   struct common_audit_data *a);
 
 /**
  * avc_audit - Audit the granting or denial of permissions.
+ * @state: SELinux state
  * @ssid: source security identifier
  * @tsid: target security identifier
  * @tclass: target security class
@@ -116,33 +119,34 @@ int slow_avc_audit(u32 ssid, u32 tsid, u16 tclass, u32 requested, u32 audited,
  * be performed under a lock, to allow the lock to be released
  * before calling the auditing code.
  */
-static inline int avc_audit(u32 ssid, u32 tsid, u16 tclass, u32 requested,
-			    struct av_decision *avd, int result,
-			    struct common_audit_data *a)
+static inline int avc_audit(struct selinux_state *state, u32 ssid, u32 tsid,
+			    u16 tclass, u32 requested, struct av_decision *avd,
+			    int result, struct common_audit_data *a)
 {
 	u32 audited, denied;
 	audited = avc_audit_required(requested, avd, result, 0, &denied);
 	if (likely(!audited))
 		return 0;
-	return slow_avc_audit(ssid, tsid, tclass, requested, audited, denied,
-			      result, a);
+	return slow_avc_audit(state, ssid, tsid, tclass, requested, audited,
+			      denied, result, a);
 }
 
 #define AVC_STRICT	   1 /* Ignore permissive mode. */
 #define AVC_EXTENDED_PERMS 2 /* update extended permissions */
-int avc_has_perm_noaudit(u32 ssid, u32 tsid, u16 tclass, u32 requested,
-			 unsigned int flags, struct av_decision *avd);
+int avc_has_perm_noaudit(struct selinux_state *state, u32 ssid, u32 tsid,
+			 u16 tclass, u32 requested, unsigned int flags,
+			 struct av_decision *avd);
 
-int avc_has_perm(u32 ssid, u32 tsid, u16 tclass, u32 requested,
-		 struct common_audit_data *auditdata);
+int avc_has_perm(struct selinux_state *state, u32 ssid, u32 tsid, u16 tclass,
+		 u32 requested, struct common_audit_data *auditdata);
 
 #define AVC_EXT_IOCTL	(1 << 0) /* Cache entry for an ioctl extended permission */
 #define AVC_EXT_NLMSG	(1 << 1) /* Cache entry for an nlmsg extended permission */
-int avc_has_extended_perms(u32 ssid, u32 tsid, u16 tclass, u32 requested,
-			   u8 driver, u8 base_perm, u8 perm,
-			   struct common_audit_data *ad);
+int avc_has_extended_perms(struct selinux_state *state, u32 ssid, u32 tsid,
+			   u16 tclass, u32 requested, u8 driver, u8 base_perm,
+			   u8 perm, struct common_audit_data *ad);
 
-u32 avc_policy_seqno(void);
+u32 avc_policy_seqno(struct selinux_state *state);
 
 #define AVC_CALLBACK_GRANT		1
 #define AVC_CALLBACK_TRY_REVOKE		2
@@ -157,9 +161,11 @@ u32 avc_policy_seqno(void);
 int avc_add_callback(int (*callback)(u32 event), u32 events);
 
 /* Exported to selinuxfs */
-int avc_get_hash_stats(char *page);
-unsigned int avc_get_cache_threshold(void);
-void avc_set_cache_threshold(unsigned int cache_threshold);
+struct selinux_avc;
+int avc_get_hash_stats(struct selinux_avc *avc, char *page);
+unsigned int avc_get_cache_threshold(struct selinux_avc *avc);
+void avc_set_cache_threshold(struct selinux_avc *avc,
+			     unsigned int cache_threshold);
 
 #ifdef CONFIG_SECURITY_SELINUX_AVC_STATS
 DECLARE_PER_CPU(struct avc_cache_stats, avc_cache_stats);
diff --git a/security/selinux/include/avc_ss.h b/security/selinux/include/avc_ss.h
index 48ad64d54032..4dc2ddd0de7d 100644
--- a/security/selinux/include/avc_ss.h
+++ b/security/selinux/include/avc_ss.h
@@ -10,7 +10,8 @@
 
 #include <linux/types.h>
 
-int avc_ss_reset(u32 seqno);
+struct selinux_avc;
+int avc_ss_reset(struct selinux_avc *avc, u32 seqno);
 
 /* Class/perm mapping support */
 struct security_class_mapping {
diff --git a/security/selinux/include/conditional.h b/security/selinux/include/conditional.h
index 060833e2dba2..5e59ef056726 100644
--- a/security/selinux/include/conditional.h
+++ b/security/selinux/include/conditional.h
@@ -16,8 +16,8 @@
 int security_get_bools(struct selinux_policy *policy, u32 *len, char ***names,
 		       int **values);
 
-int security_set_bools(u32 len, const int *values);
+int security_set_bools(struct selinux_state *state, u32 len, const int *values);
 
-int security_get_bool_value(u32 index);
+int security_get_bool_value(struct selinux_state *state, u32 index);
 
 #endif
diff --git a/security/selinux/include/ima.h b/security/selinux/include/ima.h
index 38ab302f5946..37c7394de893 100644
--- a/security/selinux/include/ima.h
+++ b/security/selinux/include/ima.h
@@ -14,13 +14,16 @@
 #include "security.h"
 
 #ifdef CONFIG_IMA
-extern void selinux_ima_measure_state(void);
-extern void selinux_ima_measure_state_locked(void);
+extern void selinux_ima_measure_state(struct selinux_state *selinux_state);
+extern void
+selinux_ima_measure_state_locked(struct selinux_state *selinux_state);
 #else
-static inline void selinux_ima_measure_state(void)
+static inline void
+selinux_ima_measure_state(struct selinux_state *selinux_state)
 {
 }
-static inline void selinux_ima_measure_state_locked(void)
+static inline void
+selinux_ima_measure_state_locked(struct selinux_state *selinux_state)
 {
 }
 #endif
diff --git a/security/selinux/include/security.h b/security/selinux/include/security.h
index 278c144c22d6..275a7f8ec41a 100644
--- a/security/selinux/include/security.h
+++ b/security/selinux/include/security.h
@@ -88,6 +88,7 @@ extern int selinux_enabled_boot;
 /* limitation of boundary depth  */
 #define POLICYDB_BOUNDS_MAXDEPTH 4
 
+struct selinux_avc;
 struct selinux_policy;
 
 struct selinux_state {
@@ -100,48 +101,49 @@ struct selinux_state {
 	struct page *status_page;
 	struct mutex status_lock;
 
+	struct selinux_avc *avc;
 	struct selinux_policy __rcu *policy;
 	struct mutex policy_mutex;
 } __randomize_layout;
 
-void selinux_avc_init(void);
+void selinux_avc_init(struct selinux_avc **avc);
 
 extern struct selinux_state selinux_state;
 
-static inline bool selinux_initialized(void)
+static inline bool selinux_initialized(const struct selinux_state *state)
 {
 	/* do a synchronized load to avoid race conditions */
-	return smp_load_acquire(&selinux_state.initialized);
+	return smp_load_acquire(&state->initialized);
 }
 
-static inline void selinux_mark_initialized(void)
+static inline void selinux_mark_initialized(struct selinux_state *state)
 {
 	/* do a synchronized write to avoid race conditions */
-	smp_store_release(&selinux_state.initialized, true);
+	smp_store_release(&state->initialized, true);
 }
 
 #ifdef CONFIG_SECURITY_SELINUX_DEVELOP
-static inline bool enforcing_enabled(void)
+static inline bool enforcing_enabled(struct selinux_state *state)
 {
-	return READ_ONCE(selinux_state.enforcing);
+	return READ_ONCE(state->enforcing);
 }
 
-static inline void enforcing_set(bool value)
+static inline void enforcing_set(struct selinux_state *state, bool value)
 {
-	WRITE_ONCE(selinux_state.enforcing, value);
+	WRITE_ONCE(state->enforcing, value);
 }
 #else
-static inline bool enforcing_enabled(void)
+static inline bool enforcing_enabled(struct selinux_state *state)
 {
 	return true;
 }
 
-static inline void enforcing_set(bool value)
+static inline void enforcing_set(struct selinux_state *state, bool value)
 {
 }
 #endif
 
-static inline bool checkreqprot_get(void)
+static inline bool checkreqprot_get(const struct selinux_state *state)
 {
 	/* non-zero/true checkreqprot values are no longer supported */
 	return 0;
@@ -198,8 +200,7 @@ static inline bool selinux_policycap_userspace_initial_context(void)
 
 static inline bool selinux_policycap_netlink_xperm(void)
 {
-	return READ_ONCE(
-		selinux_state.policycap[POLICYDB_CAP_NETLINK_XPERM]);
+	return READ_ONCE(selinux_state.policycap[POLICYDB_CAP_NETLINK_XPERM]);
 }
 
 static inline bool selinux_policycap_netif_wildcard(void)
@@ -215,14 +216,18 @@ struct selinux_load_state {
 	struct selinux_policy_convert_data *convert_data;
 };
 
-int security_mls_enabled(void);
-int security_load_policy(void *data, size_t len,
+int security_mls_enabled(struct selinux_state *state);
+int security_load_policy(struct selinux_state *state, void *data, size_t len,
 			 struct selinux_load_state *load_state);
-void selinux_policy_commit(struct selinux_load_state *load_state);
-void selinux_policy_cancel(struct selinux_load_state *load_state);
-int security_read_policy(void **data, size_t *len);
-int security_read_state_kernel(void **data, size_t *len);
-int security_policycap_supported(unsigned int req_cap);
+void selinux_policy_commit(struct selinux_state *state,
+			   struct selinux_load_state *load_state);
+void selinux_policy_cancel(struct selinux_state *state,
+			   struct selinux_load_state *load_state);
+int security_read_policy(struct selinux_state *state, void **data, size_t *len);
+int security_read_state_kernel(struct selinux_state *state, void **data,
+			       size_t *len);
+int security_policycap_supported(struct selinux_state *state,
+				 unsigned int req_cap);
 
 #define SEL_VEC_MAX 32
 struct av_decision {
@@ -261,75 +266,93 @@ struct extended_perms {
 /* definitions of av_decision.flags */
 #define AVD_FLAGS_PERMISSIVE 0x0001
 
-void security_compute_av(u32 ssid, u32 tsid, u16 tclass,
-			 struct av_decision *avd,
+void security_compute_av(struct selinux_state *state, u32 ssid, u32 tsid,
+			 u16 tclass, struct av_decision *avd,
 			 struct extended_perms *xperms);
 
-void security_compute_xperms_decision(u32 ssid, u32 tsid, u16 tclass, u8 driver,
+void security_compute_xperms_decision(struct selinux_state *state, u32 ssid,
+				      u32 tsid, u16 tclass, u8 driver,
 				      u8 base_perm,
 				      struct extended_perms_decision *xpermd);
 
-void security_compute_av_user(u32 ssid, u32 tsid, u16 tclass,
-			      struct av_decision *avd);
+void security_compute_av_user(struct selinux_state *state, u32 ssid, u32 tsid,
+			      u16 tclass, struct av_decision *avd);
 
-int security_transition_sid(u32 ssid, u32 tsid, u16 tclass,
-			    const struct qstr *qstr, u32 *out_sid);
+int security_transition_sid(struct selinux_state *state, u32 ssid, u32 tsid,
+			    u16 tclass, const struct qstr *qstr, u32 *out_sid);
 
-int security_transition_sid_user(u32 ssid, u32 tsid, u16 tclass,
-				 const char *objname, u32 *out_sid);
+int security_transition_sid_user(struct selinux_state *state, u32 ssid,
+				 u32 tsid, u16 tclass, const char *objname,
+				 u32 *out_sid);
 
-int security_member_sid(u32 ssid, u32 tsid, u16 tclass, u32 *out_sid);
+int security_member_sid(struct selinux_state *state, u32 ssid, u32 tsid,
+			u16 tclass, u32 *out_sid);
 
-int security_change_sid(u32 ssid, u32 tsid, u16 tclass, u32 *out_sid);
+int security_change_sid(struct selinux_state *state, u32 ssid, u32 tsid,
+			u16 tclass, u32 *out_sid);
 
-int security_sid_to_context(u32 sid, char **scontext, u32 *scontext_len);
+int security_sid_to_context(struct selinux_state *state, u32 sid,
+			    char **scontext, u32 *scontext_len);
 
-int security_sid_to_context_force(u32 sid, char **scontext, u32 *scontext_len);
+int security_sid_to_context_force(struct selinux_state *state, u32 sid,
+				  char **scontext, u32 *scontext_len);
 
-int security_sid_to_context_inval(u32 sid, char **scontext, u32 *scontext_len);
+int security_sid_to_context_inval(struct selinux_state *state, u32 sid,
+				  char **scontext, u32 *scontext_len);
 
-int security_context_to_sid(const char *scontext, u32 scontext_len,
-			    u32 *out_sid, gfp_t gfp);
+int security_context_to_sid(struct selinux_state *state, const char *scontext,
+			    u32 scontext_len, u32 *out_sid, gfp_t gfp);
 
-int security_context_str_to_sid(const char *scontext, u32 *out_sid, gfp_t gfp);
+int security_context_str_to_sid(struct selinux_state *state,
+				const char *scontext, u32 *out_sid, gfp_t gfp);
 
-int security_context_to_sid_default(const char *scontext, u32 scontext_len,
+int security_context_to_sid_default(struct selinux_state *state,
+				    const char *scontext, u32 scontext_len,
 				    u32 *out_sid, u32 def_sid, gfp_t gfp_flags);
 
-int security_context_to_sid_force(const char *scontext, u32 scontext_len,
+int security_context_to_sid_force(struct selinux_state *state,
+				  const char *scontext, u32 scontext_len,
 				  u32 *sid);
 
-int security_get_user_sids(u32 fromsid, const char *username, u32 **sids, u32 *nel);
+int security_get_user_sids(struct selinux_state *state, u32 callsid,
+			   const char *username, u32 **sids, u32 *nel);
 
-int security_port_sid(u8 protocol, u16 port, u32 *out_sid);
+int security_port_sid(struct selinux_state *state, u8 protocol, u16 port,
+		      u32 *out_sid);
 
-int security_ib_pkey_sid(u64 subnet_prefix, u16 pkey_num, u32 *out_sid);
+int security_ib_pkey_sid(struct selinux_state *state, u64 subnet_prefix,
+			 u16 pkey_num, u32 *out_sid);
 
-int security_ib_endport_sid(const char *dev_name, u8 port_num, u32 *out_sid);
+int security_ib_endport_sid(struct selinux_state *state, const char *dev_name,
+			    u8 port_num, u32 *out_sid);
 
-int security_netif_sid(const char *name, u32 *if_sid);
+int security_netif_sid(struct selinux_state *state, const char *name,
+		       u32 *if_sid);
 
-int security_node_sid(u16 domain, const void *addr, u32 addrlen, u32 *out_sid);
+int security_node_sid(struct selinux_state *state, u16 domain,
+		      const void *addr, u32 addrlen, u32 *out_sid);
 
-int security_validate_transition(u32 oldsid, u32 newsid, u32 tasksid,
-				 u16 tclass);
+int security_validate_transition(struct selinux_state *state, u32 oldsid,
+				 u32 newsid, u32 tasksid, u16 tclass);
 
-int security_validate_transition_user(u32 oldsid, u32 newsid, u32 tasksid,
-				      u16 tclass);
+int security_validate_transition_user(struct selinux_state *state, u32 oldsid,
+				      u32 newsid, u32 tasksid, u16 tclass);
 
-int security_bounded_transition(u32 old_sid, u32 new_sid);
+int security_bounded_transition(struct selinux_state *state, u32 old_sid,
+				u32 new_sid);
 
-int security_sid_mls_copy(u32 sid, u32 mls_sid, u32 *new_sid);
+int security_sid_mls_copy(struct selinux_state *state, u32 sid, u32 mls_sid,
+			  u32 *new_sid);
 
-int security_net_peersid_resolve(u32 nlbl_sid, u32 nlbl_type, u32 xfrm_sid,
-				 u32 *peer_sid);
+int security_net_peersid_resolve(struct selinux_state *state, u32 nlbl_sid,
+				 u32 nlbl_type, u32 xfrm_sid, u32 *peer_sid);
 
 int security_get_classes(struct selinux_policy *policy, char ***classes,
 			 u32 *nclasses);
 int security_get_permissions(struct selinux_policy *policy, const char *class,
 			     char ***perms, u32 *nperms);
-int security_get_reject_unknown(void);
-int security_get_allow_unknown(void);
+int security_get_reject_unknown(struct selinux_state *state);
+int security_get_allow_unknown(struct selinux_state *state);
 
 #define SECURITY_FS_USE_XATTR	 1 /* use xattr */
 #define SECURITY_FS_USE_TRANS	 2 /* use transition SIDs, e.g. devpts/tmpfs */
@@ -340,28 +363,32 @@ int security_get_allow_unknown(void);
 #define SECURITY_FS_USE_NATIVE	 7 /* use native label support */
 #define SECURITY_FS_USE_MAX	 7 /* Highest SECURITY_FS_USE_XXX */
 
-int security_fs_use(struct super_block *sb);
+int security_fs_use(struct selinux_state *state, struct super_block *sb);
 
-int security_genfs_sid(const char *fstype, const char *path, u16 sclass,
-		       u32 *sid);
+int security_genfs_sid(struct selinux_state *state, const char *fstype,
+		       const char *path, u16 sclass, u32 *sid);
 
 int selinux_policy_genfs_sid(struct selinux_policy *policy, const char *fstype,
 			     const char *path, u16 sclass, u32 *sid);
 
 #ifdef CONFIG_NETLABEL
-int security_netlbl_secattr_to_sid(struct netlbl_lsm_secattr *secattr,
+int security_netlbl_secattr_to_sid(struct selinux_state *state,
+				   struct netlbl_lsm_secattr *secattr,
 				   u32 *sid);
 
-int security_netlbl_sid_to_secattr(u32 sid, struct netlbl_lsm_secattr *secattr);
+int security_netlbl_sid_to_secattr(struct selinux_state *state, u32 sid,
+				   struct netlbl_lsm_secattr *secattr);
 #else
 static inline int
-security_netlbl_secattr_to_sid(struct netlbl_lsm_secattr *secattr, u32 *sid)
+security_netlbl_secattr_to_sid(struct selinux_state *state,
+			       struct netlbl_lsm_secattr *secattr, u32 *sid)
 {
 	return -EIDRM;
 }
 
 static inline int
-security_netlbl_sid_to_secattr(u32 sid, struct netlbl_lsm_secattr *secattr)
+security_netlbl_sid_to_secattr(struct selinux_state *state, u32 sid,
+			       struct netlbl_lsm_secattr *secattr)
 {
 	return -ENOENT;
 }
@@ -372,7 +399,7 @@ const char *security_get_initial_sid_context(u32 sid);
 /*
  * status notifier using mmap interface
  */
-extern struct page *selinux_kernel_status_page(void);
+extern struct page *selinux_kernel_status_page(struct selinux_state *state);
 
 #define SELINUX_KERNEL_STATUS_VERSION 1
 struct selinux_kernel_status {
@@ -386,8 +413,10 @@ struct selinux_kernel_status {
 	 */
 } __packed;
 
-extern void selinux_status_update_setenforce(bool enforcing);
-extern void selinux_status_update_policyload(u32 seqno);
+extern void selinux_status_update_setenforce(struct selinux_state *state,
+					     bool enforcing);
+extern void selinux_status_update_policyload(struct selinux_state *state,
+					     u32 seqno);
 extern void selinux_complete_init(void);
 extern struct path selinux_null;
 extern void selnl_notify_setenforce(int val);
@@ -397,6 +426,6 @@ extern int selinux_nlmsg_lookup(u16 sclass, u16 nlmsg_type, u32 *perm);
 extern void avtab_cache_init(void);
 extern void ebitmap_cache_init(void);
 extern void hashtab_cache_init(void);
-extern int security_sidtab_hash_stats(char *page);
+extern int security_sidtab_hash_stats(struct selinux_state *state, char *page);
 
 #endif /* _SELINUX_SECURITY_H_ */
diff --git a/security/selinux/netif.c b/security/selinux/netif.c
index 78afbecdbe57..52718a78f06c 100644
--- a/security/selinux/netif.c
+++ b/security/selinux/netif.c
@@ -153,7 +153,7 @@ static int sel_netif_sid_slow(struct net *ns, int ifindex, u32 *sid)
 		goto out;
 	}
 
-	ret = security_netif_sid(dev->name, sid);
+	ret = security_netif_sid(&selinux_state, dev->name, sid);
 	if (ret != 0)
 		goto out;
 
diff --git a/security/selinux/netlabel.c b/security/selinux/netlabel.c
index d51dfe892312..b858b46fd4b4 100644
--- a/security/selinux/netlabel.c
+++ b/security/selinux/netlabel.c
@@ -47,7 +47,7 @@ static int selinux_netlbl_sidlookup_cached(struct sk_buff *skb,
 {
 	int rc;
 
-	rc = security_netlbl_secattr_to_sid(secattr, sid);
+	rc = security_netlbl_secattr_to_sid(&selinux_state, secattr, sid);
 	if (rc == 0 &&
 	    (secattr->flags & NETLBL_SECATTR_CACHEABLE) &&
 	    (secattr->flags & NETLBL_SECATTR_CACHE))
@@ -79,7 +79,8 @@ static struct netlbl_lsm_secattr *selinux_netlbl_sock_genattr(struct sock *sk)
 	if (secattr == NULL)
 		return ERR_PTR(-ENOMEM);
 
-	rc = security_netlbl_sid_to_secattr(sksec->sid, secattr);
+	rc = security_netlbl_sid_to_secattr(&selinux_state, sksec->sid,
+					    secattr);
 	if (rc != 0) {
 		netlbl_secattr_free(secattr);
 		return ERR_PTR(rc);
@@ -251,7 +252,8 @@ int selinux_netlbl_skbuff_setsid(struct sk_buff *skb,
 	if (secattr == NULL) {
 		secattr = &secattr_storage;
 		netlbl_secattr_init(secattr);
-		rc = security_netlbl_sid_to_secattr(sid, secattr);
+		rc = security_netlbl_sid_to_secattr(&selinux_state, sid,
+						    secattr);
 		if (rc != 0)
 			goto skbuff_setsid_return;
 	}
@@ -288,7 +290,8 @@ int selinux_netlbl_sctp_assoc_request(struct sctp_association *asoc,
 		return 0;
 
 	netlbl_secattr_init(&secattr);
-	rc = security_netlbl_sid_to_secattr(asoc->secid, &secattr);
+	rc = security_netlbl_sid_to_secattr(&selinux_state,
+					    asoc->secid, &secattr);
 	if (rc != 0)
 		goto assoc_request_return;
 
@@ -336,7 +339,8 @@ int selinux_netlbl_inet_conn_request(struct request_sock *req, u16 family)
 		return 0;
 
 	netlbl_secattr_init(&secattr);
-	rc = security_netlbl_sid_to_secattr(req->secid, &secattr);
+	rc = security_netlbl_sid_to_secattr(&selinux_state, req->secid,
+					    &secattr);
 	if (rc != 0)
 		goto inet_conn_request_return;
 	rc = netlbl_req_setattr(req, &secattr);
@@ -469,7 +473,8 @@ int selinux_netlbl_sock_rcv_skb(struct sk_security_struct *sksec,
 		perm = RAWIP_SOCKET__RECVFROM;
 	}
 
-	rc = avc_has_perm(sksec->sid, nlbl_sid, sksec->sclass, perm, ad);
+	rc = avc_has_perm(&selinux_state,
+			  sksec->sid, nlbl_sid, sksec->sclass, perm, ad);
 	if (rc == 0)
 		return 0;
 
diff --git a/security/selinux/netnode.c b/security/selinux/netnode.c
index 5d0ed08d46e5..48ba999eebfa 100644
--- a/security/selinux/netnode.c
+++ b/security/selinux/netnode.c
@@ -207,13 +207,13 @@ static int sel_netnode_sid_slow(const void *addr, u16 family, u32 *sid)
 	new = kmalloc(sizeof(*new), GFP_ATOMIC);
 	switch (family) {
 	case PF_INET:
-		ret = security_node_sid(PF_INET,
+		ret = security_node_sid(&selinux_state, PF_INET,
 					addr, sizeof(struct in_addr), sid);
 		if (new)
 			new->nsec.addr.ipv4 = *(const __be32 *)addr;
 		break;
 	case PF_INET6:
-		ret = security_node_sid(PF_INET6,
+		ret = security_node_sid(&selinux_state, PF_INET6,
 					addr, sizeof(struct in6_addr), sid);
 		if (new)
 			new->nsec.addr.ipv6 = *(const struct in6_addr *)addr;
diff --git a/security/selinux/netport.c b/security/selinux/netport.c
index 6fd7da4b3576..d7e57cd3ecba 100644
--- a/security/selinux/netport.c
+++ b/security/selinux/netport.c
@@ -142,7 +142,7 @@ static int sel_netport_sid_slow(u8 protocol, u16 pnum, u32 *sid)
 		return 0;
 	}
 
-	ret = security_port_sid(protocol, pnum, sid);
+	ret = security_port_sid(&selinux_state, protocol, pnum, sid);
 	if (ret != 0)
 		goto out;
 
diff --git a/security/selinux/selinuxfs.c b/security/selinux/selinuxfs.c
index 47480eb2189b..c9ba0073c1e3 100644
--- a/security/selinux/selinuxfs.c
+++ b/security/selinux/selinuxfs.c
@@ -77,6 +77,7 @@ struct selinux_fs_info {
 	bool policy_opened;
 	struct dentry *policycap_dir;
 	unsigned long last_ino;
+	struct selinux_state *state;
 	struct super_block *sb;
 };
 
@@ -89,6 +90,7 @@ static int selinux_fs_info_create(struct super_block *sb)
 		return -ENOMEM;
 
 	fsi->last_ino = SEL_INO_NEXT - 1;
+	fsi->state = &selinux_state;
 	fsi->sb = sb;
 	sb->s_fs_info = fsi;
 	return 0;
@@ -123,11 +125,12 @@ static void selinux_fs_info_free(struct super_block *sb)
 static ssize_t sel_read_enforce(struct file *filp, char __user *buf,
 				size_t count, loff_t *ppos)
 {
+	struct selinux_fs_info *fsi = file_inode(filp)->i_sb->s_fs_info;
 	char tmpbuf[TMPBUFLEN];
 	ssize_t length;
 
 	length = scnprintf(tmpbuf, TMPBUFLEN, "%d",
-			   enforcing_enabled());
+			   enforcing_enabled(fsi->state));
 	return simple_read_from_buffer(buf, count, ppos, tmpbuf, length);
 }
 
@@ -136,6 +139,8 @@ static ssize_t sel_write_enforce(struct file *file, const char __user *buf,
 				 size_t count, loff_t *ppos)
 
 {
+	struct selinux_fs_info *fsi = file_inode(file)->i_sb->s_fs_info;
+	struct selinux_state *state = fsi->state;
 	char *page = NULL;
 	ssize_t length;
 	int scan_value;
@@ -158,9 +163,10 @@ static ssize_t sel_write_enforce(struct file *file, const char __user *buf,
 
 	new_value = !!scan_value;
 
-	old_value = enforcing_enabled();
+	old_value = enforcing_enabled(state);
 	if (new_value != old_value) {
-		length = avc_has_perm(current_sid(), SECINITSID_SECURITY,
+		length = avc_has_perm(&selinux_state,
+				      current_sid(), SECINITSID_SECURITY,
 				      SECCLASS_SECURITY, SECURITY__SETENFORCE,
 				      NULL);
 		if (length)
@@ -171,15 +177,15 @@ static ssize_t sel_write_enforce(struct file *file, const char __user *buf,
 			new_value, old_value,
 			from_kuid(&init_user_ns, audit_get_loginuid(current)),
 			audit_get_sessionid(current));
-		enforcing_set(new_value);
+		enforcing_set(state, new_value);
 		if (new_value)
-			avc_ss_reset(0);
+			avc_ss_reset(state->avc, 0);
 		selnl_notify_setenforce(new_value);
-		selinux_status_update_setenforce(new_value);
+		selinux_status_update_setenforce(state, new_value);
 		if (!new_value)
 			call_blocking_lsm_notifier(LSM_POLICY_CHANGE, NULL);
 
-		selinux_ima_measure_state();
+		selinux_ima_measure_state(state);
 	}
 	length = count;
 out:
@@ -199,12 +205,14 @@ static const struct file_operations sel_enforce_ops = {
 static ssize_t sel_read_handle_unknown(struct file *filp, char __user *buf,
 					size_t count, loff_t *ppos)
 {
+	struct selinux_fs_info *fsi = file_inode(filp)->i_sb->s_fs_info;
+	struct selinux_state *state = fsi->state;
 	char tmpbuf[TMPBUFLEN];
 	ssize_t length;
 	ino_t ino = file_inode(filp)->i_ino;
 	int handle_unknown = (ino == SEL_REJECT_UNKNOWN) ?
-		security_get_reject_unknown() :
-		!security_get_allow_unknown();
+		security_get_reject_unknown(state) :
+		!security_get_allow_unknown(state);
 
 	length = scnprintf(tmpbuf, TMPBUFLEN, "%d", handle_unknown);
 	return simple_read_from_buffer(buf, count, ppos, tmpbuf, length);
@@ -217,7 +225,8 @@ static const struct file_operations sel_handle_unknown_ops = {
 
 static int sel_open_handle_status(struct inode *inode, struct file *filp)
 {
-	struct page    *status = selinux_kernel_status_page();
+	struct selinux_fs_info *fsi = file_inode(filp)->i_sb->s_fs_info;
+	struct page    *status = selinux_kernel_status_page(fsi->state);
 
 	if (!status)
 		return -ENOMEM;
@@ -342,11 +351,12 @@ static struct dentry *sel_make_swapover_dir(struct super_block *sb,
 static ssize_t sel_read_mls(struct file *filp, char __user *buf,
 				size_t count, loff_t *ppos)
 {
+	struct selinux_fs_info *fsi = file_inode(filp)->i_sb->s_fs_info;
 	char tmpbuf[TMPBUFLEN];
 	ssize_t length;
 
 	length = scnprintf(tmpbuf, TMPBUFLEN, "%d",
-			   security_mls_enabled());
+			   security_mls_enabled(fsi->state));
 	return simple_read_from_buffer(buf, count, ppos, tmpbuf, length);
 }
 
@@ -363,14 +373,16 @@ struct policy_load_memory {
 static int sel_open_policy(struct inode *inode, struct file *filp)
 {
 	struct selinux_fs_info *fsi = inode->i_sb->s_fs_info;
+	struct selinux_state *state = fsi->state;
 	struct policy_load_memory *plm = NULL;
 	int rc;
 
 	BUG_ON(filp->private_data);
 
-	mutex_lock(&selinux_state.policy_mutex);
+	mutex_lock(&fsi->state->policy_mutex);
 
-	rc = avc_has_perm(current_sid(), SECINITSID_SECURITY,
+	rc = avc_has_perm(&selinux_state,
+			  current_sid(), SECINITSID_SECURITY,
 			  SECCLASS_SECURITY, SECURITY__READ_POLICY, NULL);
 	if (rc)
 		goto err;
@@ -384,7 +396,7 @@ static int sel_open_policy(struct inode *inode, struct file *filp)
 	if (!plm)
 		goto err;
 
-	rc = security_read_policy(&plm->data, &plm->len);
+	rc = security_read_policy(state, &plm->data, &plm->len);
 	if (rc)
 		goto err;
 
@@ -398,11 +410,11 @@ static int sel_open_policy(struct inode *inode, struct file *filp)
 
 	filp->private_data = plm;
 
-	mutex_unlock(&selinux_state.policy_mutex);
+	mutex_unlock(&fsi->state->policy_mutex);
 
 	return 0;
 err:
-	mutex_unlock(&selinux_state.policy_mutex);
+	mutex_unlock(&fsi->state->policy_mutex);
 
 	if (plm)
 		vfree(plm->data);
@@ -431,7 +443,8 @@ static ssize_t sel_read_policy(struct file *filp, char __user *buf,
 	struct policy_load_memory *plm = filp->private_data;
 	int ret;
 
-	ret = avc_has_perm(current_sid(), SECINITSID_SECURITY,
+	ret = avc_has_perm(&selinux_state,
+			   current_sid(), SECINITSID_SECURITY,
 			  SECCLASS_SECURITY, SECURITY__READ_POLICY, NULL);
 	if (ret)
 		return ret;
@@ -571,7 +584,7 @@ static ssize_t sel_write_load(struct file *file, const char __user *buf,
 			      size_t count, loff_t *ppos)
 
 {
-	struct selinux_fs_info *fsi;
+	struct selinux_fs_info *fsi = file_inode(file)->i_sb->s_fs_info;
 	struct selinux_load_state load_state;
 	ssize_t length;
 	void *data = NULL;
@@ -583,9 +596,9 @@ static ssize_t sel_write_load(struct file *file, const char __user *buf,
 	if (!count)
 		return -EINVAL;
 
-	mutex_lock(&selinux_state.policy_mutex);
-
-	length = avc_has_perm(current_sid(), SECINITSID_SECURITY,
+	mutex_lock(&fsi->state->policy_mutex);
+	length = avc_has_perm(&selinux_state,
+			      current_sid(), SECINITSID_SECURITY,
 			      SECCLASS_SECURITY, SECURITY__LOAD_POLICY, NULL);
 	if (length)
 		goto out;
@@ -600,7 +613,7 @@ static ssize_t sel_write_load(struct file *file, const char __user *buf,
 		goto out;
 	}
 
-	length = security_load_policy(data, count, &load_state);
+	length = security_load_policy(fsi->state, data, count, &load_state);
 	if (length) {
 		pr_warn_ratelimited("SELinux: failed to load policy\n");
 		goto out;
@@ -609,11 +622,11 @@ static ssize_t sel_write_load(struct file *file, const char __user *buf,
 	length = sel_make_policy_nodes(fsi, load_state.policy);
 	if (length) {
 		pr_warn_ratelimited("SELinux: failed to initialize selinuxfs\n");
-		selinux_policy_cancel(&load_state);
+		selinux_policy_cancel(fsi->state, &load_state);
 		goto out;
 	}
 
-	selinux_policy_commit(&load_state);
+	selinux_policy_commit(fsi->state, &load_state);
 	length = count;
 	audit_log(audit_context(), GFP_KERNEL, AUDIT_MAC_POLICY_LOAD,
 		"auid=%u ses=%u lsm=selinux res=1",
@@ -621,7 +634,7 @@ static ssize_t sel_write_load(struct file *file, const char __user *buf,
 		audit_get_sessionid(current));
 
 out:
-	mutex_unlock(&selinux_state.policy_mutex);
+	mutex_unlock(&fsi->state->policy_mutex);
 	vfree(data);
 	return length;
 }
@@ -633,20 +646,23 @@ static const struct file_operations sel_load_ops = {
 
 static ssize_t sel_write_context(struct file *file, char *buf, size_t size)
 {
+	struct selinux_fs_info *fsi = file_inode(file)->i_sb->s_fs_info;
+	struct selinux_state *state = fsi->state;
 	char *canon = NULL;
 	u32 sid, len;
 	ssize_t length;
 
-	length = avc_has_perm(current_sid(), SECINITSID_SECURITY,
+	length = avc_has_perm(&selinux_state,
+			      current_sid(), SECINITSID_SECURITY,
 			      SECCLASS_SECURITY, SECURITY__CHECK_CONTEXT, NULL);
 	if (length)
 		goto out;
 
-	length = security_context_to_sid(buf, size, &sid, GFP_KERNEL);
+	length = security_context_to_sid(state, buf, size, &sid, GFP_KERNEL);
 	if (length)
 		goto out;
 
-	length = security_sid_to_context(sid, &canon, &len);
+	length = security_sid_to_context(state, sid, &canon, &len);
 	if (length)
 		goto out;
 
@@ -667,22 +683,25 @@ static ssize_t sel_write_context(struct file *file, char *buf, size_t size)
 static ssize_t sel_read_checkreqprot(struct file *filp, char __user *buf,
 				     size_t count, loff_t *ppos)
 {
+	struct selinux_fs_info *fsi = file_inode(filp)->i_sb->s_fs_info;
 	char tmpbuf[TMPBUFLEN];
 	ssize_t length;
 
 	length = scnprintf(tmpbuf, TMPBUFLEN, "%u",
-			   checkreqprot_get());
+			   checkreqprot_get(fsi->state));
 	return simple_read_from_buffer(buf, count, ppos, tmpbuf, length);
 }
 
 static ssize_t sel_write_checkreqprot(struct file *file, const char __user *buf,
 				      size_t count, loff_t *ppos)
 {
+	struct selinux_fs_info *fsi = file_inode(file)->i_sb->s_fs_info;
 	char *page;
 	ssize_t length;
 	unsigned int new_value;
 
-	length = avc_has_perm(current_sid(), SECINITSID_SECURITY,
+	length = avc_has_perm(&selinux_state,
+			      current_sid(), SECINITSID_SECURITY,
 			      SECCLASS_SECURITY, SECURITY__SETCHECKREQPROT,
 			      NULL);
 	if (length)
@@ -713,7 +732,7 @@ static ssize_t sel_write_checkreqprot(struct file *file, const char __user *buf,
 		       comm, current->pid);
 	}
 
-	selinux_ima_measure_state();
+	selinux_ima_measure_state(fsi->state);
 
 out:
 	kfree(page);
@@ -729,13 +748,16 @@ static ssize_t sel_write_validatetrans(struct file *file,
 					const char __user *buf,
 					size_t count, loff_t *ppos)
 {
+	struct selinux_fs_info *fsi = file_inode(file)->i_sb->s_fs_info;
+	struct selinux_state *state = fsi->state;
 	char *oldcon = NULL, *newcon = NULL, *taskcon = NULL;
 	char *req = NULL;
 	u32 osid, nsid, tsid;
 	u16 tclass;
 	int rc;
 
-	rc = avc_has_perm(current_sid(), SECINITSID_SECURITY,
+	rc = avc_has_perm(&selinux_state,
+			  current_sid(), SECINITSID_SECURITY,
 			  SECCLASS_SECURITY, SECURITY__VALIDATE_TRANS, NULL);
 	if (rc)
 		goto out;
@@ -773,19 +795,19 @@ static ssize_t sel_write_validatetrans(struct file *file,
 	if (sscanf(req, "%s %s %hu %s", oldcon, newcon, &tclass, taskcon) != 4)
 		goto out;
 
-	rc = security_context_str_to_sid(oldcon, &osid, GFP_KERNEL);
+	rc = security_context_str_to_sid(state, oldcon, &osid, GFP_KERNEL);
 	if (rc)
 		goto out;
 
-	rc = security_context_str_to_sid(newcon, &nsid, GFP_KERNEL);
+	rc = security_context_str_to_sid(state, newcon, &nsid, GFP_KERNEL);
 	if (rc)
 		goto out;
 
-	rc = security_context_str_to_sid(taskcon, &tsid, GFP_KERNEL);
+	rc = security_context_str_to_sid(state, taskcon, &tsid, GFP_KERNEL);
 	if (rc)
 		goto out;
 
-	rc = security_validate_transition_user(osid, nsid, tsid, tclass);
+	rc = security_validate_transition_user(state, osid, nsid, tsid, tclass);
 	if (!rc)
 		rc = count;
 out:
@@ -855,13 +877,16 @@ static const struct file_operations transaction_ops = {
 
 static ssize_t sel_write_access(struct file *file, char *buf, size_t size)
 {
+	struct selinux_fs_info *fsi = file_inode(file)->i_sb->s_fs_info;
+	struct selinux_state *state = fsi->state;
 	char *scon = NULL, *tcon = NULL;
 	u32 ssid, tsid;
 	u16 tclass;
 	struct av_decision avd;
 	ssize_t length;
 
-	length = avc_has_perm(current_sid(), SECINITSID_SECURITY,
+	length = avc_has_perm(&selinux_state,
+			      current_sid(), SECINITSID_SECURITY,
 			      SECCLASS_SECURITY, SECURITY__COMPUTE_AV, NULL);
 	if (length)
 		goto out;
@@ -880,15 +905,15 @@ static ssize_t sel_write_access(struct file *file, char *buf, size_t size)
 	if (sscanf(buf, "%s %s %hu", scon, tcon, &tclass) != 3)
 		goto out;
 
-	length = security_context_str_to_sid(scon, &ssid, GFP_KERNEL);
+	length = security_context_str_to_sid(state, scon, &ssid, GFP_KERNEL);
 	if (length)
 		goto out;
 
-	length = security_context_str_to_sid(tcon, &tsid, GFP_KERNEL);
+	length = security_context_str_to_sid(state, tcon, &tsid, GFP_KERNEL);
 	if (length)
 		goto out;
 
-	security_compute_av_user(ssid, tsid, tclass, &avd);
+	security_compute_av_user(state, ssid, tsid, tclass, &avd);
 
 	length = scnprintf(buf, SIMPLE_TRANSACTION_LIMIT,
 			  "%x %x %x %x %u %x",
@@ -903,6 +928,8 @@ static ssize_t sel_write_access(struct file *file, char *buf, size_t size)
 
 static ssize_t sel_write_create(struct file *file, char *buf, size_t size)
 {
+	struct selinux_fs_info *fsi = file_inode(file)->i_sb->s_fs_info;
+	struct selinux_state *state = fsi->state;
 	char *scon = NULL, *tcon = NULL;
 	char *namebuf = NULL, *objname = NULL;
 	u32 ssid, tsid, newsid;
@@ -912,7 +939,8 @@ static ssize_t sel_write_create(struct file *file, char *buf, size_t size)
 	u32 len;
 	int nargs;
 
-	length = avc_has_perm(current_sid(), SECINITSID_SECURITY,
+	length = avc_has_perm(&selinux_state,
+			      current_sid(), SECINITSID_SECURITY,
 			      SECCLASS_SECURITY, SECURITY__COMPUTE_CREATE,
 			      NULL);
 	if (length)
@@ -968,20 +996,20 @@ static ssize_t sel_write_create(struct file *file, char *buf, size_t size)
 		objname = namebuf;
 	}
 
-	length = security_context_str_to_sid(scon, &ssid, GFP_KERNEL);
+	length = security_context_str_to_sid(state, scon, &ssid, GFP_KERNEL);
 	if (length)
 		goto out;
 
-	length = security_context_str_to_sid(tcon, &tsid, GFP_KERNEL);
+	length = security_context_str_to_sid(state, tcon, &tsid, GFP_KERNEL);
 	if (length)
 		goto out;
 
-	length = security_transition_sid_user(ssid, tsid, tclass,
+	length = security_transition_sid_user(state, ssid, tsid, tclass,
 					      objname, &newsid);
 	if (length)
 		goto out;
 
-	length = security_sid_to_context(newsid, &newcon, &len);
+	length = security_sid_to_context(state, newsid, &newcon, &len);
 	if (length)
 		goto out;
 
@@ -1004,6 +1032,8 @@ static ssize_t sel_write_create(struct file *file, char *buf, size_t size)
 
 static ssize_t sel_write_relabel(struct file *file, char *buf, size_t size)
 {
+	struct selinux_fs_info *fsi = file_inode(file)->i_sb->s_fs_info;
+	struct selinux_state *state = fsi->state;
 	char *scon = NULL, *tcon = NULL;
 	u32 ssid, tsid, newsid;
 	u16 tclass;
@@ -1011,7 +1041,8 @@ static ssize_t sel_write_relabel(struct file *file, char *buf, size_t size)
 	char *newcon = NULL;
 	u32 len;
 
-	length = avc_has_perm(current_sid(), SECINITSID_SECURITY,
+	length = avc_has_perm(&selinux_state,
+			      current_sid(), SECINITSID_SECURITY,
 			      SECCLASS_SECURITY, SECURITY__COMPUTE_RELABEL,
 			      NULL);
 	if (length)
@@ -1031,19 +1062,19 @@ static ssize_t sel_write_relabel(struct file *file, char *buf, size_t size)
 	if (sscanf(buf, "%s %s %hu", scon, tcon, &tclass) != 3)
 		goto out;
 
-	length = security_context_str_to_sid(scon, &ssid, GFP_KERNEL);
+	length = security_context_str_to_sid(state, scon, &ssid, GFP_KERNEL);
 	if (length)
 		goto out;
 
-	length = security_context_str_to_sid(tcon, &tsid, GFP_KERNEL);
+	length = security_context_str_to_sid(state, tcon, &tsid, GFP_KERNEL);
 	if (length)
 		goto out;
 
-	length = security_change_sid(ssid, tsid, tclass, &newsid);
+	length = security_change_sid(state, ssid, tsid, tclass, &newsid);
 	if (length)
 		goto out;
 
-	length = security_sid_to_context(newsid, &newcon, &len);
+	length = security_sid_to_context(state, newsid, &newcon, &len);
 	if (length)
 		goto out;
 
@@ -1062,6 +1093,8 @@ static ssize_t sel_write_relabel(struct file *file, char *buf, size_t size)
 
 static ssize_t sel_write_user(struct file *file, char *buf, size_t size)
 {
+	struct selinux_fs_info *fsi = file_inode(file)->i_sb->s_fs_info;
+	struct selinux_state *state = fsi->state;
 	char *con = NULL, *user = NULL, *ptr;
 	u32 sid, *sids = NULL;
 	ssize_t length;
@@ -1073,7 +1106,8 @@ static ssize_t sel_write_user(struct file *file, char *buf, size_t size)
 		" This will not be supported in the future; please update your"
 		" userspace.\n", current->comm, current->pid);
 
-	length = avc_has_perm(current_sid(), SECINITSID_SECURITY,
+	length = avc_has_perm(&selinux_state,
+			      current_sid(), SECINITSID_SECURITY,
 			      SECCLASS_SECURITY, SECURITY__COMPUTE_USER,
 			      NULL);
 	if (length)
@@ -1093,18 +1127,18 @@ static ssize_t sel_write_user(struct file *file, char *buf, size_t size)
 	if (sscanf(buf, "%s %s", con, user) != 2)
 		goto out;
 
-	length = security_context_str_to_sid(con, &sid, GFP_KERNEL);
+	length = security_context_str_to_sid(state, con, &sid, GFP_KERNEL);
 	if (length)
 		goto out;
 
-	length = security_get_user_sids(sid, user, &sids, &nsids);
+	length = security_get_user_sids(state, sid, user, &sids, &nsids);
 	if (length)
 		goto out;
 
 	length = sprintf(buf, "%u", nsids) + 1;
 	ptr = buf + length;
 	for (i = 0; i < nsids; i++) {
-		rc = security_sid_to_context(sids[i], &newcon, &len);
+		rc = security_sid_to_context(state, sids[i], &newcon, &len);
 		if (rc) {
 			length = rc;
 			goto out;
@@ -1128,6 +1162,8 @@ static ssize_t sel_write_user(struct file *file, char *buf, size_t size)
 
 static ssize_t sel_write_member(struct file *file, char *buf, size_t size)
 {
+	struct selinux_fs_info *fsi = file_inode(file)->i_sb->s_fs_info;
+	struct selinux_state *state = fsi->state;
 	char *scon = NULL, *tcon = NULL;
 	u32 ssid, tsid, newsid;
 	u16 tclass;
@@ -1135,7 +1171,8 @@ static ssize_t sel_write_member(struct file *file, char *buf, size_t size)
 	char *newcon = NULL;
 	u32 len;
 
-	length = avc_has_perm(current_sid(), SECINITSID_SECURITY,
+	length = avc_has_perm(&selinux_state,
+			      current_sid(), SECINITSID_SECURITY,
 			      SECCLASS_SECURITY, SECURITY__COMPUTE_MEMBER,
 			      NULL);
 	if (length)
@@ -1155,19 +1192,19 @@ static ssize_t sel_write_member(struct file *file, char *buf, size_t size)
 	if (sscanf(buf, "%s %s %hu", scon, tcon, &tclass) != 3)
 		goto out;
 
-	length = security_context_str_to_sid(scon, &ssid, GFP_KERNEL);
+	length = security_context_str_to_sid(state, scon, &ssid, GFP_KERNEL);
 	if (length)
 		goto out;
 
-	length = security_context_str_to_sid(tcon, &tsid, GFP_KERNEL);
+	length = security_context_str_to_sid(state, tcon, &tsid, GFP_KERNEL);
 	if (length)
 		goto out;
 
-	length = security_member_sid(ssid, tsid, tclass, &newsid);
+	length = security_member_sid(state, ssid, tsid, tclass, &newsid);
 	if (length)
 		goto out;
 
-	length = security_sid_to_context(newsid, &newcon, &len);
+	length = security_sid_to_context(state, newsid, &newcon, &len);
 	if (length)
 		goto out;
 
@@ -1209,7 +1246,7 @@ static ssize_t sel_read_bool(struct file *filep, char __user *buf,
 	unsigned index = file_inode(filep)->i_ino & SEL_INO_MASK;
 	const char *name = filep->f_path.dentry->d_name.name;
 
-	mutex_lock(&selinux_state.policy_mutex);
+	mutex_lock(&fsi->state->policy_mutex);
 
 	ret = -EINVAL;
 	if (index >= fsi->bool_num || strcmp(name,
@@ -1221,21 +1258,21 @@ static ssize_t sel_read_bool(struct file *filep, char __user *buf,
 	if (!page)
 		goto out_unlock;
 
-	cur_enforcing = security_get_bool_value(index);
+	cur_enforcing = security_get_bool_value(fsi->state, index);
 	if (cur_enforcing < 0) {
 		ret = cur_enforcing;
 		goto out_unlock;
 	}
 	length = scnprintf(page, PAGE_SIZE, "%d %d", cur_enforcing,
 			  fsi->bool_pending_values[index]);
-	mutex_unlock(&selinux_state.policy_mutex);
+	mutex_unlock(&fsi->state->policy_mutex);
 	ret = simple_read_from_buffer(buf, count, ppos, page, length);
 out_free:
 	free_page((unsigned long)page);
 	return ret;
 
 out_unlock:
-	mutex_unlock(&selinux_state.policy_mutex);
+	mutex_unlock(&fsi->state->policy_mutex);
 	goto out_free;
 }
 
@@ -1260,9 +1297,10 @@ static ssize_t sel_write_bool(struct file *filep, const char __user *buf,
 	if (IS_ERR(page))
 		return PTR_ERR(page);
 
-	mutex_lock(&selinux_state.policy_mutex);
+	mutex_lock(&fsi->state->policy_mutex);
 
-	length = avc_has_perm(current_sid(), SECINITSID_SECURITY,
+	length = avc_has_perm(&selinux_state,
+			      current_sid(), SECINITSID_SECURITY,
 			      SECCLASS_SECURITY, SECURITY__SETBOOL,
 			      NULL);
 	if (length)
@@ -1284,7 +1322,7 @@ static ssize_t sel_write_bool(struct file *filep, const char __user *buf,
 	length = count;
 
 out:
-	mutex_unlock(&selinux_state.policy_mutex);
+	mutex_unlock(&fsi->state->policy_mutex);
 	kfree(page);
 	return length;
 }
@@ -1315,9 +1353,10 @@ static ssize_t sel_commit_bools_write(struct file *filep,
 	if (IS_ERR(page))
 		return PTR_ERR(page);
 
-	mutex_lock(&selinux_state.policy_mutex);
+	mutex_lock(&fsi->state->policy_mutex);
 
-	length = avc_has_perm(current_sid(), SECINITSID_SECURITY,
+	length = avc_has_perm(&selinux_state,
+			      current_sid(), SECINITSID_SECURITY,
 			      SECCLASS_SECURITY, SECURITY__SETBOOL,
 			      NULL);
 	if (length)
@@ -1329,14 +1368,14 @@ static ssize_t sel_commit_bools_write(struct file *filep,
 
 	length = 0;
 	if (new_value && fsi->bool_pending_values)
-		length = security_set_bools(fsi->bool_num,
+		length = security_set_bools(fsi->state, fsi->bool_num,
 					    fsi->bool_pending_values);
 
 	if (!length)
 		length = count;
 
 out:
-	mutex_unlock(&selinux_state.policy_mutex);
+	mutex_unlock(&fsi->state->policy_mutex);
 	kfree(page);
 	return length;
 }
@@ -1413,11 +1452,13 @@ static int sel_make_bools(struct selinux_policy *newpolicy, struct dentry *bool_
 static ssize_t sel_read_avc_cache_threshold(struct file *filp, char __user *buf,
 					    size_t count, loff_t *ppos)
 {
+	struct selinux_fs_info *fsi = file_inode(filp)->i_sb->s_fs_info;
+	struct selinux_state *state = fsi->state;
 	char tmpbuf[TMPBUFLEN];
 	ssize_t length;
 
 	length = scnprintf(tmpbuf, TMPBUFLEN, "%u",
-			   avc_get_cache_threshold());
+			   avc_get_cache_threshold(state->avc));
 	return simple_read_from_buffer(buf, count, ppos, tmpbuf, length);
 }
 
@@ -1426,11 +1467,14 @@ static ssize_t sel_write_avc_cache_threshold(struct file *file,
 					     size_t count, loff_t *ppos)
 
 {
+	struct selinux_fs_info *fsi = file_inode(file)->i_sb->s_fs_info;
+	struct selinux_state *state = fsi->state;
 	char *page;
 	ssize_t ret;
 	unsigned int new_value;
 
-	ret = avc_has_perm(current_sid(), SECINITSID_SECURITY,
+	ret = avc_has_perm(&selinux_state,
+			   current_sid(), SECINITSID_SECURITY,
 			   SECCLASS_SECURITY, SECURITY__SETSECPARAM,
 			   NULL);
 	if (ret)
@@ -1451,7 +1495,7 @@ static ssize_t sel_write_avc_cache_threshold(struct file *file,
 	if (sscanf(page, "%u", &new_value) != 1)
 		goto out;
 
-	avc_set_cache_threshold(new_value);
+	avc_set_cache_threshold(state->avc, new_value);
 
 	ret = count;
 out:
@@ -1462,6 +1506,8 @@ static ssize_t sel_write_avc_cache_threshold(struct file *file,
 static ssize_t sel_read_avc_hash_stats(struct file *filp, char __user *buf,
 				       size_t count, loff_t *ppos)
 {
+	struct selinux_fs_info *fsi = file_inode(filp)->i_sb->s_fs_info;
+	struct selinux_state *state = fsi->state;
 	char *page;
 	ssize_t length;
 
@@ -1469,7 +1515,7 @@ static ssize_t sel_read_avc_hash_stats(struct file *filp, char __user *buf,
 	if (!page)
 		return -ENOMEM;
 
-	length = avc_get_hash_stats(page);
+	length = avc_get_hash_stats(state->avc, page);
 	if (length >= 0)
 		length = simple_read_from_buffer(buf, count, ppos, page, length);
 	free_page((unsigned long)page);
@@ -1480,6 +1526,8 @@ static ssize_t sel_read_avc_hash_stats(struct file *filp, char __user *buf,
 static ssize_t sel_read_sidtab_hash_stats(struct file *filp, char __user *buf,
 					size_t count, loff_t *ppos)
 {
+	struct selinux_fs_info *fsi = file_inode(filp)->i_sb->s_fs_info;
+	struct selinux_state *state = fsi->state;
 	char *page;
 	ssize_t length;
 
@@ -1487,7 +1535,7 @@ static ssize_t sel_read_sidtab_hash_stats(struct file *filp, char __user *buf,
 	if (!page)
 		return -ENOMEM;
 
-	length = security_sidtab_hash_stats(page);
+	length = security_sidtab_hash_stats(state, page);
 	if (length >= 0)
 		length = simple_read_from_buffer(buf, count, ppos, page,
 						length);
@@ -1653,12 +1701,13 @@ static int sel_make_ss_files(struct dentry *dir)
 static ssize_t sel_read_initcon(struct file *file, char __user *buf,
 				size_t count, loff_t *ppos)
 {
+	struct selinux_fs_info *fsi = file_inode(file)->i_sb->s_fs_info;
 	char *con;
 	u32 sid, len;
 	ssize_t ret;
 
 	sid = file_inode(file)->i_ino&SEL_INO_MASK;
-	ret = security_sid_to_context(sid, &con, &len);
+	ret = security_sid_to_context(fsi->state, sid, &con, &len);
 	if (ret)
 		return ret;
 
@@ -1752,12 +1801,13 @@ static const struct file_operations sel_perm_ops = {
 static ssize_t sel_read_policycap(struct file *file, char __user *buf,
 				  size_t count, loff_t *ppos)
 {
+	struct selinux_fs_info *fsi = file_inode(file)->i_sb->s_fs_info;
 	int value;
 	char tmpbuf[TMPBUFLEN];
 	ssize_t length;
 	unsigned long i_ino = file_inode(file)->i_ino;
 
-	value = security_policycap_supported(i_ino & SEL_INO_MASK);
+	value = security_policycap_supported(fsi->state, i_ino & SEL_INO_MASK);
 	length = scnprintf(tmpbuf, TMPBUFLEN, "%d", value);
 
 	return simple_read_from_buffer(buf, count, ppos, tmpbuf, length);
@@ -2171,7 +2221,7 @@ static int __init init_sel_fs(void)
 	 * Try to pre-allocate the status page, so the sequence number of the
 	 * initial policy load can be stored.
 	 */
-	(void) selinux_kernel_status_page();
+	(void) selinux_kernel_status_page(&selinux_state);
 
 	return err;
 }
diff --git a/security/selinux/ss/services.c b/security/selinux/ss/services.c
index 7becf3808818..1f8d44faa9bc 100644
--- a/security/selinux/ss/services.c
+++ b/security/selinux/ss/services.c
@@ -236,16 +236,16 @@ static void map_decision(struct selinux_map *map,
 	}
 }
 
-int security_mls_enabled(void)
+int security_mls_enabled(struct selinux_state *state)
 {
 	int mls_enabled;
 	struct selinux_policy *policy;
 
-	if (!selinux_initialized())
+	if (!selinux_initialized(state))
 		return 0;
 
 	rcu_read_lock();
-	policy = rcu_dereference(selinux_state.policy);
+	policy = rcu_dereference(state->policy);
 	mls_enabled = policy->policydb.mls_enabled;
 	rcu_read_unlock();
 	return mls_enabled;
@@ -722,7 +722,8 @@ static void context_struct_compute_av(struct policydb *policydb,
 				 tclass, avd);
 }
 
-static int security_validtrans_handle_fail(struct selinux_policy *policy,
+static int security_validtrans_handle_fail(struct selinux_state *state,
+					struct selinux_policy *policy,
 					struct sidtab_entry *oentry,
 					struct sidtab_entry *nentry,
 					struct sidtab_entry *tentry,
@@ -748,12 +749,13 @@ static int security_validtrans_handle_fail(struct selinux_policy *policy,
 	kfree(n);
 	kfree(t);
 
-	if (!enforcing_enabled())
+	if (!enforcing_enabled(state))
 		return 0;
 	return -EPERM;
 }
 
-static int security_compute_validatetrans(u32 oldsid, u32 newsid, u32 tasksid,
+static int security_compute_validatetrans(struct selinux_state *state,
+					  u32 oldsid, u32 newsid, u32 tasksid,
 					  u16 orig_tclass, bool user)
 {
 	struct selinux_policy *policy;
@@ -768,12 +770,12 @@ static int security_compute_validatetrans(u32 oldsid, u32 newsid, u32 tasksid,
 	int rc = 0;
 
 
-	if (!selinux_initialized())
+	if (!selinux_initialized(state))
 		return 0;
 
 	rcu_read_lock();
 
-	policy = rcu_dereference(selinux_state.policy);
+	policy = rcu_dereference(state->policy);
 	policydb = &policy->policydb;
 	sidtab = policy->sidtab;
 
@@ -820,7 +822,8 @@ static int security_compute_validatetrans(u32 oldsid, u32 newsid, u32 tasksid,
 			if (user)
 				rc = -EPERM;
 			else
-				rc = security_validtrans_handle_fail(policy,
+				rc = security_validtrans_handle_fail(state,
+								policy,
 								oentry,
 								nentry,
 								tentry,
@@ -835,17 +838,19 @@ static int security_compute_validatetrans(u32 oldsid, u32 newsid, u32 tasksid,
 	return rc;
 }
 
-int security_validate_transition_user(u32 oldsid, u32 newsid, u32 tasksid,
+int security_validate_transition_user(struct selinux_state *state,
+				      u32 oldsid, u32 newsid, u32 tasksid,
 				      u16 tclass)
 {
-	return security_compute_validatetrans(oldsid, newsid, tasksid,
+	return security_compute_validatetrans(state, oldsid, newsid, tasksid,
 					      tclass, true);
 }
 
-int security_validate_transition(u32 oldsid, u32 newsid, u32 tasksid,
+int security_validate_transition(struct selinux_state *state,
+				 u32 oldsid, u32 newsid, u32 tasksid,
 				 u16 orig_tclass)
 {
-	return security_compute_validatetrans(oldsid, newsid, tasksid,
+	return security_compute_validatetrans(state, oldsid, newsid, tasksid,
 					      orig_tclass, false);
 }
 
@@ -855,10 +860,12 @@ int security_validate_transition(u32 oldsid, u32 newsid, u32 tasksid,
  * It returns 0, if @newsid is bounded by @oldsid.
  * Otherwise, it returns error code.
  *
+ * @state: SELinux state
  * @oldsid : current security identifier
  * @newsid : destinated security identifier
  */
-int security_bounded_transition(u32 old_sid, u32 new_sid)
+int security_bounded_transition(struct selinux_state *state,
+				u32 old_sid, u32 new_sid)
 {
 	struct selinux_policy *policy;
 	struct policydb *policydb;
@@ -868,11 +875,11 @@ int security_bounded_transition(u32 old_sid, u32 new_sid)
 	u32 index;
 	int rc;
 
-	if (!selinux_initialized())
+	if (!selinux_initialized(state))
 		return 0;
 
 	rcu_read_lock();
-	policy = rcu_dereference(selinux_state.policy);
+	policy = rcu_dereference(state->policy);
 	policydb = &policy->policydb;
 	sidtab = policy->sidtab;
 
@@ -1023,7 +1030,8 @@ void services_compute_xperms_decision(struct extended_perms_decision *xpermd,
 	}
 }
 
-void security_compute_xperms_decision(u32 ssid,
+void security_compute_xperms_decision(struct selinux_state *state,
+				      u32 ssid,
 				      u32 tsid,
 				      u16 orig_tclass,
 				      u8 driver,
@@ -1049,10 +1057,10 @@ void security_compute_xperms_decision(u32 ssid,
 	memset(xpermd->dontaudit->p, 0, sizeof(xpermd->dontaudit->p));
 
 	rcu_read_lock();
-	if (!selinux_initialized())
+	if (!selinux_initialized(state))
 		goto allow;
 
-	policy = rcu_dereference(selinux_state.policy);
+	policy = rcu_dereference(state->policy);
 	policydb = &policy->policydb;
 	sidtab = policy->sidtab;
 
@@ -1111,6 +1119,7 @@ void security_compute_xperms_decision(u32 ssid,
 
 /**
  * security_compute_av - Compute access vector decisions.
+ * @state: SELinux state
  * @ssid: source security identifier
  * @tsid: target security identifier
  * @orig_tclass: target security class
@@ -1120,7 +1129,8 @@ void security_compute_xperms_decision(u32 ssid,
  * Compute a set of access vector decisions based on the
  * SID pair (@ssid, @tsid) for the permissions in @tclass.
  */
-void security_compute_av(u32 ssid,
+void security_compute_av(struct selinux_state *state,
+			 u32 ssid,
 			 u32 tsid,
 			 u16 orig_tclass,
 			 struct av_decision *avd,
@@ -1133,10 +1143,10 @@ void security_compute_av(u32 ssid,
 	struct context *scontext = NULL, *tcontext = NULL;
 
 	rcu_read_lock();
-	policy = rcu_dereference(selinux_state.policy);
+	policy = rcu_dereference(state->policy);
 	avd_init(policy, avd);
 	xperms->len = 0;
-	if (!selinux_initialized())
+	if (!selinux_initialized(state))
 		goto allow;
 
 	policydb = &policy->policydb;
@@ -1178,7 +1188,8 @@ void security_compute_av(u32 ssid,
 	goto out;
 }
 
-void security_compute_av_user(u32 ssid,
+void security_compute_av_user(struct selinux_state *state,
+			      u32 ssid,
 			      u32 tsid,
 			      u16 tclass,
 			      struct av_decision *avd)
@@ -1189,9 +1200,9 @@ void security_compute_av_user(u32 ssid,
 	struct context *scontext = NULL, *tcontext = NULL;
 
 	rcu_read_lock();
-	policy = rcu_dereference(selinux_state.policy);
+	policy = rcu_dereference(state->policy);
 	avd_init(policy, avd);
-	if (!selinux_initialized())
+	if (!selinux_initialized(state))
 		goto allow;
 
 	policydb = &policy->policydb;
@@ -1307,19 +1318,19 @@ static int sidtab_entry_to_string(struct policydb *p,
 
 #include "initial_sid_to_string.h"
 
-int security_sidtab_hash_stats(char *page)
+int security_sidtab_hash_stats(struct selinux_state *state, char *page)
 {
 	struct selinux_policy *policy;
 	int rc;
 
-	if (!selinux_initialized()) {
+	if (!selinux_initialized(state)) {
 		pr_err("SELinux: %s:  called before initial load_policy\n",
 		       __func__);
 		return -EINVAL;
 	}
 
 	rcu_read_lock();
-	policy = rcu_dereference(selinux_state.policy);
+	policy = rcu_dereference(state->policy);
 	rc = sidtab_hash_stats(policy->sidtab, page);
 	rcu_read_unlock();
 
@@ -1333,7 +1344,8 @@ const char *security_get_initial_sid_context(u32 sid)
 	return initial_sid_to_string[sid];
 }
 
-static int security_sid_to_context_core(u32 sid, char **scontext,
+static int security_sid_to_context_core(struct selinux_state *state,
+					u32 sid, char **scontext,
 					u32 *scontext_len, int force,
 					int only_invalid)
 {
@@ -1347,7 +1359,7 @@ static int security_sid_to_context_core(u32 sid, char **scontext,
 		*scontext = NULL;
 	*scontext_len  = 0;
 
-	if (!selinux_initialized()) {
+	if (!selinux_initialized(state)) {
 		if (sid <= SECINITSID_NUM) {
 			char *scontextp;
 			const char *s;
@@ -1379,7 +1391,7 @@ static int security_sid_to_context_core(u32 sid, char **scontext,
 		return -EINVAL;
 	}
 	rcu_read_lock();
-	policy = rcu_dereference(selinux_state.policy);
+	policy = rcu_dereference(state->policy);
 	policydb = &policy->policydb;
 	sidtab = policy->sidtab;
 
@@ -1407,6 +1419,7 @@ static int security_sid_to_context_core(u32 sid, char **scontext,
 
 /**
  * security_sid_to_context - Obtain a context for a given SID.
+ * @state: SELinux state
  * @sid: security identifier, SID
  * @scontext: security context
  * @scontext_len: length in bytes
@@ -1415,22 +1428,24 @@ static int security_sid_to_context_core(u32 sid, char **scontext,
  * into a dynamically allocated string of the correct size.  Set @scontext
  * to point to this string and set @scontext_len to the length of the string.
  */
-int security_sid_to_context(u32 sid, char **scontext, u32 *scontext_len)
+int security_sid_to_context(struct selinux_state *state,
+			    u32 sid, char **scontext, u32 *scontext_len)
 {
-	return security_sid_to_context_core(sid, scontext,
+	return security_sid_to_context_core(state, sid, scontext,
 					    scontext_len, 0, 0);
 }
 
-int security_sid_to_context_force(u32 sid,
+int security_sid_to_context_force(struct selinux_state *state, u32 sid,
 				  char **scontext, u32 *scontext_len)
 {
-	return security_sid_to_context_core(sid, scontext,
+	return security_sid_to_context_core(state, sid, scontext,
 					    scontext_len, 1, 0);
 }
 
 /**
  * security_sid_to_context_inval - Obtain a context for a given SID if it
  *                                 is invalid.
+ * @state: SELinux state
  * @sid: security identifier, SID
  * @scontext: security context
  * @scontext_len: length in bytes
@@ -1441,10 +1456,10 @@ int security_sid_to_context_force(u32 sid,
  * this string (or NULL if the context is valid) and set @scontext_len to
  * the length of the string (or 0 if the context is valid).
  */
-int security_sid_to_context_inval(u32 sid,
+int security_sid_to_context_inval(struct selinux_state *state, u32 sid,
 				  char **scontext, u32 *scontext_len)
 {
-	return security_sid_to_context_core(sid, scontext,
+	return security_sid_to_context_core(state, sid, scontext,
 					    scontext_len, 1, 1);
 }
 
@@ -1529,7 +1544,8 @@ static int string_to_context_struct(struct policydb *pol,
 	return rc;
 }
 
-static int security_context_to_sid_core(const char *scontext, u32 scontext_len,
+static int security_context_to_sid_core(struct selinux_state *state,
+					const char *scontext, u32 scontext_len,
 					u32 *sid, u32 def_sid, gfp_t gfp_flags,
 					int force)
 {
@@ -1549,9 +1565,8 @@ static int security_context_to_sid_core(const char *scontext, u32 scontext_len,
 	if (!scontext2)
 		return -ENOMEM;
 
-	if (!selinux_initialized()) {
+	if (!selinux_initialized(state)) {
 		u32 i;
-
 		for (i = 1; i < SECINITSID_NUM; i++) {
 			const char *s = initial_sid_to_string[i];
 
@@ -1574,7 +1589,7 @@ static int security_context_to_sid_core(const char *scontext, u32 scontext_len,
 	}
 retry:
 	rcu_read_lock();
-	policy = rcu_dereference(selinux_state.policy);
+	policy = rcu_dereference(state->policy);
 	policydb = &policy->policydb;
 	sidtab = policy->sidtab;
 	rc = string_to_context_struct(policydb, sidtab, scontext2,
@@ -1606,6 +1621,7 @@ static int security_context_to_sid_core(const char *scontext, u32 scontext_len,
 
 /**
  * security_context_to_sid - Obtain a SID for a given security context.
+ * @state: SELinux state
  * @scontext: security context
  * @scontext_len: length in bytes
  * @sid: security identifier, SID
@@ -1616,16 +1632,18 @@ static int security_context_to_sid_core(const char *scontext, u32 scontext_len,
  * Returns -%EINVAL if the context is invalid, -%ENOMEM if insufficient
  * memory is available, or 0 on success.
  */
-int security_context_to_sid(const char *scontext, u32 scontext_len, u32 *sid,
+int security_context_to_sid(struct selinux_state *state,
+			    const char *scontext, u32 scontext_len, u32 *sid,
 			    gfp_t gfp)
 {
-	return security_context_to_sid_core(scontext, scontext_len,
+	return security_context_to_sid_core(state, scontext, scontext_len,
 					    sid, SECSID_NULL, gfp, 0);
 }
 
-int security_context_str_to_sid(const char *scontext, u32 *sid, gfp_t gfp)
+int security_context_str_to_sid(struct selinux_state *state,
+				const char *scontext, u32 *sid, gfp_t gfp)
 {
-	return security_context_to_sid(scontext, strlen(scontext),
+	return security_context_to_sid(state, scontext, strlen(scontext),
 				       sid, gfp);
 }
 
@@ -1633,6 +1651,7 @@ int security_context_str_to_sid(const char *scontext, u32 *sid, gfp_t gfp)
  * security_context_to_sid_default - Obtain a SID for a given security context,
  * falling back to specified default if needed.
  *
+ * @state: SELinux state
  * @scontext: security context
  * @scontext_len: length in bytes
  * @sid: security identifier, SID
@@ -1648,21 +1667,24 @@ int security_context_str_to_sid(const char *scontext, u32 *sid, gfp_t gfp)
  * Returns -%EINVAL if the context is invalid, -%ENOMEM if insufficient
  * memory is available, or 0 on success.
  */
-int security_context_to_sid_default(const char *scontext, u32 scontext_len,
+int security_context_to_sid_default(struct selinux_state *state,
+				    const char *scontext, u32 scontext_len,
 				    u32 *sid, u32 def_sid, gfp_t gfp_flags)
 {
-	return security_context_to_sid_core(scontext, scontext_len,
+	return security_context_to_sid_core(state, scontext, scontext_len,
 					    sid, def_sid, gfp_flags, 1);
 }
 
-int security_context_to_sid_force(const char *scontext, u32 scontext_len,
+int security_context_to_sid_force(struct selinux_state *state,
+				  const char *scontext, u32 scontext_len,
 				  u32 *sid)
 {
-	return security_context_to_sid_core(scontext, scontext_len,
+	return security_context_to_sid_core(state, scontext, scontext_len,
 					    sid, SECSID_NULL, GFP_KERNEL, 1);
 }
 
 static int compute_sid_handle_invalid_context(
+	struct selinux_state *state,
 	struct selinux_policy *policy,
 	struct sidtab_entry *sentry,
 	struct sidtab_entry *tentry,
@@ -1695,7 +1717,7 @@ static int compute_sid_handle_invalid_context(
 	kfree(s);
 	kfree(t);
 	kfree(n);
-	if (!enforcing_enabled())
+	if (!enforcing_enabled(state))
 		return 0;
 	return -EACCES;
 }
@@ -1730,7 +1752,8 @@ static void filename_compute_type(struct policydb *policydb,
 	}
 }
 
-static int security_compute_sid(u32 ssid,
+static int security_compute_sid(struct selinux_state *state,
+				u32 ssid,
 				u32 tsid,
 				u16 orig_tclass,
 				u16 specified,
@@ -1750,7 +1773,7 @@ static int security_compute_sid(u32 ssid,
 	int rc = 0;
 	bool sock;
 
-	if (!selinux_initialized()) {
+	if (!selinux_initialized(state)) {
 		switch (orig_tclass) {
 		case SECCLASS_PROCESS: /* kernel value */
 			*out_sid = ssid;
@@ -1768,7 +1791,7 @@ static int security_compute_sid(u32 ssid,
 
 	rcu_read_lock();
 
-	policy = rcu_dereference(selinux_state.policy);
+	policy = rcu_dereference(state->policy);
 
 	if (kern) {
 		tclass = unmap_class(&policy->map, orig_tclass);
@@ -1902,7 +1925,7 @@ static int security_compute_sid(u32 ssid,
 
 	/* Check the validity of the context. */
 	if (!policydb_context_isvalid(policydb, &newcontext)) {
-		rc = compute_sid_handle_invalid_context(policy, sentry,
+		rc = compute_sid_handle_invalid_context(state, policy, sentry,
 							tentry, tclass,
 							&newcontext);
 		if (rc)
@@ -1924,6 +1947,7 @@ static int security_compute_sid(u32 ssid,
 
 /**
  * security_transition_sid - Compute the SID for a new subject/object.
+ * @state: SELinux state
  * @ssid: source security identifier
  * @tsid: target security identifier
  * @tclass: target security class
@@ -1936,24 +1960,27 @@ static int security_compute_sid(u32 ssid,
  * if insufficient memory is available, or %0 if the new SID was
  * computed successfully.
  */
-int security_transition_sid(u32 ssid, u32 tsid, u16 tclass,
+int security_transition_sid(struct selinux_state *state,
+			    u32 ssid, u32 tsid, u16 tclass,
 			    const struct qstr *qstr, u32 *out_sid)
 {
-	return security_compute_sid(ssid, tsid, tclass,
+	return security_compute_sid(state, ssid, tsid, tclass,
 				    AVTAB_TRANSITION,
 				    qstr ? qstr->name : NULL, out_sid, true);
 }
 
-int security_transition_sid_user(u32 ssid, u32 tsid, u16 tclass,
+int security_transition_sid_user(struct selinux_state *state,
+				 u32 ssid, u32 tsid, u16 tclass,
 				 const char *objname, u32 *out_sid)
 {
-	return security_compute_sid(ssid, tsid, tclass,
+	return security_compute_sid(state, ssid, tsid, tclass,
 				    AVTAB_TRANSITION,
 				    objname, out_sid, false);
 }
 
 /**
  * security_member_sid - Compute the SID for member selection.
+ * @state: SELinux state
  * @ssid: source security identifier
  * @tsid: target security identifier
  * @tclass: target security class
@@ -1965,18 +1992,20 @@ int security_transition_sid_user(u32 ssid, u32 tsid, u16 tclass,
  * if insufficient memory is available, or %0 if the SID was
  * computed successfully.
  */
-int security_member_sid(u32 ssid,
+int security_member_sid(struct selinux_state *state,
+			u32 ssid,
 			u32 tsid,
 			u16 tclass,
 			u32 *out_sid)
 {
-	return security_compute_sid(ssid, tsid, tclass,
+	return security_compute_sid(state, ssid, tsid, tclass,
 				    AVTAB_MEMBER, NULL,
 				    out_sid, false);
 }
 
 /**
  * security_change_sid - Compute the SID for object relabeling.
+ * @state: SELinux state
  * @ssid: source security identifier
  * @tsid: target security identifier
  * @tclass: target security class
@@ -1988,23 +2017,26 @@ int security_member_sid(u32 ssid,
  * if insufficient memory is available, or %0 if the SID was
  * computed successfully.
  */
-int security_change_sid(u32 ssid,
+int security_change_sid(struct selinux_state *state,
+			u32 ssid,
 			u32 tsid,
 			u16 tclass,
 			u32 *out_sid)
 {
-	return security_compute_sid(ssid, tsid, tclass, AVTAB_CHANGE, NULL,
+	return security_compute_sid(state,
+				    ssid, tsid, tclass, AVTAB_CHANGE, NULL,
 				    out_sid, false);
 }
 
 static inline int convert_context_handle_invalid_context(
+	struct selinux_state *state,
 	struct policydb *policydb,
 	struct context *context)
 {
 	char *s;
 	u32 len;
 
-	if (enforcing_enabled())
+	if (enforcing_enabled(state))
 		return -EINVAL;
 
 	if (!context_struct_to_string(policydb, context, &s, &len)) {
@@ -2122,7 +2154,8 @@ int services_convert_context(struct convert_context_args *args,
 
 	/* Check the validity of the new context. */
 	if (!policydb_context_isvalid(args->newp, newc)) {
-		rc = convert_context_handle_invalid_context(args->oldp, oldc);
+		rc = convert_context_handle_invalid_context(args->state,
+							    args->oldp, oldc);
 		if (rc)
 			goto bad;
 	}
@@ -2141,7 +2174,8 @@ int services_convert_context(struct convert_context_args *args,
 	return 0;
 }
 
-static void security_load_policycaps(struct selinux_policy *policy)
+static void security_load_policycaps(struct selinux_state *state,
+				struct selinux_policy *policy)
 {
 	struct policydb *p;
 	unsigned int i;
@@ -2149,8 +2183,8 @@ static void security_load_policycaps(struct selinux_policy *policy)
 
 	p = &policy->policydb;
 
-	for (i = 0; i < ARRAY_SIZE(selinux_state.policycap); i++)
-		WRITE_ONCE(selinux_state.policycap[i],
+	for (i = 0; i < ARRAY_SIZE(state->policycap); i++)
+		WRITE_ONCE(state->policycap[i],
 			ebitmap_get_bit(&p->policycaps, i));
 
 	for (i = 0; i < ARRAY_SIZE(selinux_policycap_names); i++)
@@ -2186,9 +2220,9 @@ static void selinux_policy_cond_free(struct selinux_policy *policy)
 	kfree(policy);
 }
 
-void selinux_policy_cancel(struct selinux_load_state *load_state)
+void selinux_policy_cancel(struct selinux_state *state,
+			   struct selinux_load_state *load_state)
 {
-	struct selinux_state *state = &selinux_state;
 	struct selinux_policy *oldpolicy;
 
 	oldpolicy = rcu_dereference_protected(state->policy,
@@ -2199,20 +2233,21 @@ void selinux_policy_cancel(struct selinux_load_state *load_state)
 	kfree(load_state->convert_data);
 }
 
-static void selinux_notify_policy_change(u32 seqno)
+static void selinux_notify_policy_change(struct selinux_state *state,
+					u32 seqno)
 {
 	/* Flush external caches and notify userspace of policy load */
-	avc_ss_reset(seqno);
+	avc_ss_reset(state->avc, seqno);
 	selnl_notify_policyload(seqno);
-	selinux_status_update_policyload(seqno);
+	selinux_status_update_policyload(state, seqno);
 	selinux_netlbl_cache_invalidate();
 	selinux_xfrm_notify_policyload();
-	selinux_ima_measure_state_locked();
+	selinux_ima_measure_state_locked(state);
 }
 
-void selinux_policy_commit(struct selinux_load_state *load_state)
+void selinux_policy_commit(struct selinux_state *state,
+			   struct selinux_load_state *load_state)
 {
-	struct selinux_state *state = &selinux_state;
 	struct selinux_policy *oldpolicy, *newpolicy = load_state->policy;
 	unsigned long flags;
 	u32 seqno;
@@ -2245,15 +2280,15 @@ void selinux_policy_commit(struct selinux_load_state *load_state)
 	}
 
 	/* Load the policycaps from the new policy */
-	security_load_policycaps(newpolicy);
+	security_load_policycaps(state, newpolicy);
 
-	if (!selinux_initialized()) {
+	if (!selinux_initialized(state)) {
 		/*
 		 * After first policy load, the security server is
 		 * marked as initialized and ready to handle requests and
 		 * any objects created prior to policy load are then labeled.
 		 */
-		selinux_mark_initialized();
+		selinux_mark_initialized(state);
 		selinux_complete_init();
 	}
 
@@ -2263,11 +2298,12 @@ void selinux_policy_commit(struct selinux_load_state *load_state)
 	kfree(load_state->convert_data);
 
 	/* Notify others of the policy change */
-	selinux_notify_policy_change(seqno);
+	selinux_notify_policy_change(state, seqno);
 }
 
 /**
  * security_load_policy - Load a security policy configuration.
+ * @state: SELinux state
  * @data: binary policy data
  * @len: length of data in bytes
  * @load_state: policy load state
@@ -2277,10 +2313,9 @@ void selinux_policy_commit(struct selinux_load_state *load_state)
  * This function will flush the access vector cache after
  * loading the new policy.
  */
-int security_load_policy(void *data, size_t len,
+int security_load_policy(struct selinux_state *state, void *data, size_t len,
 			 struct selinux_load_state *load_state)
 {
-	struct selinux_state *state = &selinux_state;
 	struct selinux_policy *newpolicy, *oldpolicy;
 	struct selinux_policy_convert_data *convert_data;
 	int rc = 0;
@@ -2312,7 +2347,7 @@ int security_load_policy(void *data, size_t len,
 		goto err_mapping;
 	}
 
-	if (!selinux_initialized()) {
+	if (!selinux_initialized(state)) {
 		/* First policy load, so no need to preserve state from old policy */
 		load_state->policy = newpolicy;
 		load_state->convert_data = NULL;
@@ -2340,6 +2375,7 @@ int security_load_policy(void *data, size_t len,
 		goto err_free_isids;
 	}
 
+	convert_data->args.state = state;
 	convert_data->args.oldp = &oldpolicy->policydb;
 	convert_data->args.newp = &newpolicy->policydb;
 
@@ -2413,11 +2449,13 @@ static int ocontext_to_sid(struct sidtab *sidtab, struct ocontext *c,
 
 /**
  * security_port_sid - Obtain the SID for a port.
+ * @state: SELinux state
  * @protocol: protocol number
  * @port: port number
  * @out_sid: security identifier
  */
-int security_port_sid(u8 protocol, u16 port, u32 *out_sid)
+int security_port_sid(struct selinux_state *state,
+		      u8 protocol, u16 port, u32 *out_sid)
 {
 	struct selinux_policy *policy;
 	struct policydb *policydb;
@@ -2425,7 +2463,7 @@ int security_port_sid(u8 protocol, u16 port, u32 *out_sid)
 	struct ocontext *c;
 	int rc;
 
-	if (!selinux_initialized()) {
+	if (!selinux_initialized(state)) {
 		*out_sid = SECINITSID_PORT;
 		return 0;
 	}
@@ -2433,7 +2471,7 @@ int security_port_sid(u8 protocol, u16 port, u32 *out_sid)
 retry:
 	rc = 0;
 	rcu_read_lock();
-	policy = rcu_dereference(selinux_state.policy);
+	policy = rcu_dereference(state->policy);
 	policydb = &policy->policydb;
 	sidtab = policy->sidtab;
 
@@ -2465,11 +2503,13 @@ int security_port_sid(u8 protocol, u16 port, u32 *out_sid)
 
 /**
  * security_ib_pkey_sid - Obtain the SID for a pkey.
+ * @state: SELinux state
  * @subnet_prefix: Subnet Prefix
  * @pkey_num: pkey number
  * @out_sid: security identifier
  */
-int security_ib_pkey_sid(u64 subnet_prefix, u16 pkey_num, u32 *out_sid)
+int security_ib_pkey_sid(struct selinux_state *state,
+			 u64 subnet_prefix, u16 pkey_num, u32 *out_sid)
 {
 	struct selinux_policy *policy;
 	struct policydb *policydb;
@@ -2477,7 +2517,7 @@ int security_ib_pkey_sid(u64 subnet_prefix, u16 pkey_num, u32 *out_sid)
 	struct ocontext *c;
 	int rc;
 
-	if (!selinux_initialized()) {
+	if (!selinux_initialized(state)) {
 		*out_sid = SECINITSID_UNLABELED;
 		return 0;
 	}
@@ -2485,7 +2525,7 @@ int security_ib_pkey_sid(u64 subnet_prefix, u16 pkey_num, u32 *out_sid)
 retry:
 	rc = 0;
 	rcu_read_lock();
-	policy = rcu_dereference(selinux_state.policy);
+	policy = rcu_dereference(state->policy);
 	policydb = &policy->policydb;
 	sidtab = policy->sidtab;
 
@@ -2517,11 +2557,13 @@ int security_ib_pkey_sid(u64 subnet_prefix, u16 pkey_num, u32 *out_sid)
 
 /**
  * security_ib_endport_sid - Obtain the SID for a subnet management interface.
+ * @state: SELinux state
  * @dev_name: device name
  * @port_num: port number
  * @out_sid: security identifier
  */
-int security_ib_endport_sid(const char *dev_name, u8 port_num, u32 *out_sid)
+int security_ib_endport_sid(struct selinux_state *state,
+			    const char *dev_name, u8 port_num, u32 *out_sid)
 {
 	struct selinux_policy *policy;
 	struct policydb *policydb;
@@ -2529,7 +2571,7 @@ int security_ib_endport_sid(const char *dev_name, u8 port_num, u32 *out_sid)
 	struct ocontext *c;
 	int rc;
 
-	if (!selinux_initialized()) {
+	if (!selinux_initialized(state)) {
 		*out_sid = SECINITSID_UNLABELED;
 		return 0;
 	}
@@ -2537,7 +2579,7 @@ int security_ib_endport_sid(const char *dev_name, u8 port_num, u32 *out_sid)
 retry:
 	rc = 0;
 	rcu_read_lock();
-	policy = rcu_dereference(selinux_state.policy);
+	policy = rcu_dereference(state->policy);
 	policydb = &policy->policydb;
 	sidtab = policy->sidtab;
 
@@ -2570,10 +2612,12 @@ int security_ib_endport_sid(const char *dev_name, u8 port_num, u32 *out_sid)
 
 /**
  * security_netif_sid - Obtain the SID for a network interface.
+ * @state: SELinux state
  * @name: interface name
  * @if_sid: interface SID
  */
-int security_netif_sid(const char *name, u32 *if_sid)
+int security_netif_sid(struct selinux_state *state,
+		       const char *name, u32 *if_sid)
 {
 	struct selinux_policy *policy;
 	struct policydb *policydb;
@@ -2582,7 +2626,7 @@ int security_netif_sid(const char *name, u32 *if_sid)
 	struct ocontext *c;
 	bool wildcard_support;
 
-	if (!selinux_initialized()) {
+	if (!selinux_initialized(state)) {
 		*if_sid = SECINITSID_NETIF;
 		return 0;
 	}
@@ -2590,7 +2634,7 @@ int security_netif_sid(const char *name, u32 *if_sid)
 retry:
 	rc = 0;
 	rcu_read_lock();
-	policy = rcu_dereference(selinux_state.policy);
+	policy = rcu_dereference(state->policy);
 	policydb = &policy->policydb;
 	sidtab = policy->sidtab;
 	wildcard_support = ebitmap_get_bit(&policydb->policycaps, POLICYDB_CAP_NETIF_WILDCARD);
@@ -2637,12 +2681,14 @@ static bool match_ipv6_addrmask(const u32 input[4], const u32 addr[4], const u32
 
 /**
  * security_node_sid - Obtain the SID for a node (host).
+ * @state: SELinux state
  * @domain: communication domain aka address family
  * @addrp: address
  * @addrlen: address length in bytes
  * @out_sid: security identifier
  */
-int security_node_sid(u16 domain,
+int security_node_sid(struct selinux_state *state,
+		      u16 domain,
 		      const void *addrp,
 		      u32 addrlen,
 		      u32 *out_sid)
@@ -2653,14 +2699,14 @@ int security_node_sid(u16 domain,
 	int rc;
 	struct ocontext *c;
 
-	if (!selinux_initialized()) {
+	if (!selinux_initialized(state)) {
 		*out_sid = SECINITSID_NODE;
 		return 0;
 	}
 
 retry:
 	rcu_read_lock();
-	policy = rcu_dereference(selinux_state.policy);
+	policy = rcu_dereference(state->policy);
 	policydb = &policy->policydb;
 	sidtab = policy->sidtab;
 
@@ -2724,6 +2770,7 @@ int security_node_sid(u16 domain,
 
 /**
  * security_get_user_sids - Obtain reachable SIDs for a user.
+ * @state: SELinux state
  * @fromsid: starting SID
  * @username: username
  * @sids: array of reachable SIDs for user
@@ -2736,7 +2783,9 @@ int security_node_sid(u16 domain,
  * number of elements in the array.
  */
 
-int security_get_user_sids(u32 fromsid,
+
+int security_get_user_sids(struct selinux_state *state,
+			   u32 fromsid,
 			   const char *username,
 			   u32 **sids,
 			   u32 *nel)
@@ -2755,7 +2804,7 @@ int security_get_user_sids(u32 fromsid,
 	*sids = NULL;
 	*nel = 0;
 
-	if (!selinux_initialized())
+	if (!selinux_initialized(state))
 		return 0;
 
 	mysids = kcalloc(maxnel, sizeof(*mysids), GFP_KERNEL);
@@ -2765,7 +2814,7 @@ int security_get_user_sids(u32 fromsid,
 retry:
 	mynel = 0;
 	rcu_read_lock();
-	policy = rcu_dereference(selinux_state.policy);
+	policy = rcu_dereference(state->policy);
 	policydb = &policy->policydb;
 	sidtab = policy->sidtab;
 
@@ -2831,7 +2880,8 @@ int security_get_user_sids(u32 fromsid,
 	}
 	for (i = 0, j = 0; i < mynel; i++) {
 		struct av_decision dummy_avd;
-		rc = avc_has_perm_noaudit(fromsid, mysids[i],
+		rc = avc_has_perm_noaudit(state,
+					  fromsid, mysids[i],
 					  SECCLASS_PROCESS, /* kernel value */
 					  PROCESS__TRANSITION, AVC_STRICT,
 					  &dummy_avd);
@@ -2913,6 +2963,7 @@ static inline int __security_genfs_sid(struct selinux_policy *policy,
 
 /**
  * security_genfs_sid - Obtain a SID for a file in a filesystem
+ * @state: SELinux state
  * @fstype: filesystem type
  * @path: path from root of mount
  * @orig_sclass: file security class
@@ -2921,7 +2972,8 @@ static inline int __security_genfs_sid(struct selinux_policy *policy,
  * Acquire policy_rwlock before calling __security_genfs_sid() and release
  * it afterward.
  */
-int security_genfs_sid(const char *fstype,
+int security_genfs_sid(struct selinux_state *state,
+		       const char *fstype,
 		       const char *path,
 		       u16 orig_sclass,
 		       u32 *sid)
@@ -2929,14 +2981,14 @@ int security_genfs_sid(const char *fstype,
 	struct selinux_policy *policy;
 	int retval;
 
-	if (!selinux_initialized()) {
+	if (!selinux_initialized(state)) {
 		*sid = SECINITSID_UNLABELED;
 		return 0;
 	}
 
 	do {
 		rcu_read_lock();
-		policy = rcu_dereference(selinux_state.policy);
+		policy = rcu_dereference(state->policy);
 		retval = __security_genfs_sid(policy, fstype, path,
 					      orig_sclass, sid);
 		rcu_read_unlock();
@@ -2956,9 +3008,10 @@ int selinux_policy_genfs_sid(struct selinux_policy *policy,
 
 /**
  * security_fs_use - Determine how to handle labeling for a filesystem.
+ * @state: SELinux state
  * @sb: superblock in question
  */
-int security_fs_use(struct super_block *sb)
+int security_fs_use(struct selinux_state *state, struct super_block *sb)
 {
 	struct selinux_policy *policy;
 	struct policydb *policydb;
@@ -2968,7 +3021,7 @@ int security_fs_use(struct super_block *sb)
 	struct superblock_security_struct *sbsec = selinux_superblock(sb);
 	const char *fstype = sb->s_type->name;
 
-	if (!selinux_initialized()) {
+	if (!selinux_initialized(state)) {
 		sbsec->behavior = SECURITY_FS_USE_NONE;
 		sbsec->sid = SECINITSID_UNLABELED;
 		return 0;
@@ -2976,7 +3029,7 @@ int security_fs_use(struct super_block *sb)
 
 retry:
 	rcu_read_lock();
-	policy = rcu_dereference(selinux_state.policy);
+	policy = rcu_dereference(state->policy);
 	policydb = &policy->policydb;
 	sidtab = policy->sidtab;
 
@@ -3069,14 +3122,14 @@ int security_get_bools(struct selinux_policy *policy,
 }
 
 
-int security_set_bools(u32 len, const int *values)
+int security_set_bools(struct selinux_state *state, u32 len,
+		       const int *values)
 {
-	struct selinux_state *state = &selinux_state;
 	struct selinux_policy *newpolicy, *oldpolicy;
 	int rc;
 	u32 i, seqno = 0;
 
-	if (!selinux_initialized())
+	if (!selinux_initialized(state))
 		return -EINVAL;
 
 	oldpolicy = rcu_dereference_protected(state->policy,
@@ -3137,22 +3190,23 @@ int security_set_bools(u32 len, const int *values)
 	selinux_policy_cond_free(oldpolicy);
 
 	/* Notify others of the policy change */
-	selinux_notify_policy_change(seqno);
+	selinux_notify_policy_change(state, seqno);
 	return 0;
 }
 
-int security_get_bool_value(u32 index)
+int security_get_bool_value(struct selinux_state *state,
+			    u32 index)
 {
 	struct selinux_policy *policy;
 	struct policydb *policydb;
 	int rc;
 	u32 len;
 
-	if (!selinux_initialized())
+	if (!selinux_initialized(state))
 		return 0;
 
 	rcu_read_lock();
-	policy = rcu_dereference(selinux_state.policy);
+	policy = rcu_dereference(state->policy);
 	policydb = &policy->policydb;
 
 	rc = -EFAULT;
@@ -3199,7 +3253,8 @@ static int security_preserve_bools(struct selinux_policy *oldpolicy,
  * security_sid_mls_copy() - computes a new sid based on the given
  * sid and the mls portion of mls_sid.
  */
-int security_sid_mls_copy(u32 sid, u32 mls_sid, u32 *new_sid)
+int security_sid_mls_copy(struct selinux_state *state,
+			  u32 sid, u32 mls_sid, u32 *new_sid)
 {
 	struct selinux_policy *policy;
 	struct policydb *policydb;
@@ -3211,7 +3266,7 @@ int security_sid_mls_copy(u32 sid, u32 mls_sid, u32 *new_sid)
 	u32 len;
 	int rc;
 
-	if (!selinux_initialized()) {
+	if (!selinux_initialized(state)) {
 		*new_sid = sid;
 		return 0;
 	}
@@ -3221,7 +3276,7 @@ int security_sid_mls_copy(u32 sid, u32 mls_sid, u32 *new_sid)
 	context_init(&newcon);
 
 	rcu_read_lock();
-	policy = rcu_dereference(selinux_state.policy);
+	policy = rcu_dereference(state->policy);
 	policydb = &policy->policydb;
 	sidtab = policy->sidtab;
 
@@ -3255,7 +3310,7 @@ int security_sid_mls_copy(u32 sid, u32 mls_sid, u32 *new_sid)
 
 	/* Check the validity of the new context. */
 	if (!policydb_context_isvalid(policydb, &newcon)) {
-		rc = convert_context_handle_invalid_context(policydb,
+		rc = convert_context_handle_invalid_context(state, policydb,
 							&newcon);
 		if (rc) {
 			if (!context_struct_to_string(policydb, &newcon, &s,
@@ -3289,6 +3344,7 @@ int security_sid_mls_copy(u32 sid, u32 mls_sid, u32 *new_sid)
 
 /**
  * security_net_peersid_resolve - Compare and resolve two network peer SIDs
+ * @state: SELinux state
  * @nlbl_sid: NetLabel SID
  * @nlbl_type: NetLabel labeling protocol type
  * @xfrm_sid: XFRM SID
@@ -3308,7 +3364,8 @@ int security_sid_mls_copy(u32 sid, u32 mls_sid, u32 *new_sid)
  *   multiple, inconsistent labels |    -<errno>     |    SECSID_NULL
  *
  */
-int security_net_peersid_resolve(u32 nlbl_sid, u32 nlbl_type,
+int security_net_peersid_resolve(struct selinux_state *state,
+				 u32 nlbl_sid, u32 nlbl_type,
 				 u32 xfrm_sid,
 				 u32 *peer_sid)
 {
@@ -3336,11 +3393,11 @@ int security_net_peersid_resolve(u32 nlbl_sid, u32 nlbl_type,
 		return 0;
 	}
 
-	if (!selinux_initialized())
+	if (!selinux_initialized(state))
 		return 0;
 
 	rcu_read_lock();
-	policy = rcu_dereference(selinux_state.policy);
+	policy = rcu_dereference(state->policy);
 	policydb = &policy->policydb;
 	sidtab = policy->sidtab;
 
@@ -3483,31 +3540,31 @@ int security_get_permissions(struct selinux_policy *policy,
 	return rc;
 }
 
-int security_get_reject_unknown(void)
+int security_get_reject_unknown(struct selinux_state *state)
 {
 	struct selinux_policy *policy;
 	int value;
 
-	if (!selinux_initialized())
+	if (!selinux_initialized(state))
 		return 0;
 
 	rcu_read_lock();
-	policy = rcu_dereference(selinux_state.policy);
+	policy = rcu_dereference(state->policy);
 	value = policy->policydb.reject_unknown;
 	rcu_read_unlock();
 	return value;
 }
 
-int security_get_allow_unknown(void)
+int security_get_allow_unknown(struct selinux_state *state)
 {
 	struct selinux_policy *policy;
 	int value;
 
-	if (!selinux_initialized())
+	if (!selinux_initialized(state))
 		return 0;
 
 	rcu_read_lock();
-	policy = rcu_dereference(selinux_state.policy);
+	policy = rcu_dereference(state->policy);
 	value = policy->policydb.allow_unknown;
 	rcu_read_unlock();
 	return value;
@@ -3515,6 +3572,7 @@ int security_get_allow_unknown(void)
 
 /**
  * security_policycap_supported - Check for a specific policy capability
+ * @state: SELinux state
  * @req_cap: capability
  *
  * Description:
@@ -3523,16 +3581,17 @@ int security_get_allow_unknown(void)
  * supported, false (0) if it isn't supported.
  *
  */
-int security_policycap_supported(unsigned int req_cap)
+int security_policycap_supported(struct selinux_state *state,
+				 unsigned int req_cap)
 {
 	struct selinux_policy *policy;
 	int rc;
 
-	if (!selinux_initialized())
+	if (!selinux_initialized(state))
 		return 0;
 
 	rcu_read_lock();
-	policy = rcu_dereference(selinux_state.policy);
+	policy = rcu_dereference(state->policy);
 	rc = ebitmap_get_bit(&policy->policydb.policycaps, req_cap);
 	rcu_read_unlock();
 
@@ -3569,7 +3628,7 @@ int selinux_audit_rule_init(u32 field, u32 op, char *rulestr, void **vrule,
 
 	*rule = NULL;
 
-	if (!selinux_initialized())
+	if (!selinux_initialized(state))
 		return -EOPNOTSUPP;
 
 	switch (field) {
@@ -3694,7 +3753,7 @@ int selinux_audit_rule_match(struct lsm_prop *prop, u32 field, u32 op, void *vru
 		return -ENOENT;
 	}
 
-	if (!selinux_initialized())
+	if (!selinux_initialized(state))
 		return 0;
 
 	rcu_read_lock();
@@ -3847,6 +3906,7 @@ static void security_netlbl_cache_add(struct netlbl_lsm_secattr *secattr,
 
 /**
  * security_netlbl_secattr_to_sid - Convert a NetLabel secattr to a SELinux SID
+ * @state: SELinux state
  * @secattr: the NetLabel packet security attributes
  * @sid: the SELinux SID
  *
@@ -3860,7 +3920,8 @@ static void security_netlbl_cache_add(struct netlbl_lsm_secattr *secattr,
  * failure.
  *
  */
-int security_netlbl_secattr_to_sid(struct netlbl_lsm_secattr *secattr,
+int security_netlbl_secattr_to_sid(struct selinux_state *state,
+				   struct netlbl_lsm_secattr *secattr,
 				   u32 *sid)
 {
 	struct selinux_policy *policy;
@@ -3870,7 +3931,7 @@ int security_netlbl_secattr_to_sid(struct netlbl_lsm_secattr *secattr,
 	struct context *ctx;
 	struct context ctx_new;
 
-	if (!selinux_initialized()) {
+	if (!selinux_initialized(state)) {
 		*sid = SECSID_NULL;
 		return 0;
 	}
@@ -3878,7 +3939,7 @@ int security_netlbl_secattr_to_sid(struct netlbl_lsm_secattr *secattr,
 retry:
 	rc = 0;
 	rcu_read_lock();
-	policy = rcu_dereference(selinux_state.policy);
+	policy = rcu_dereference(state->policy);
 	policydb = &policy->policydb;
 	sidtab = policy->sidtab;
 
@@ -3928,6 +3989,7 @@ int security_netlbl_secattr_to_sid(struct netlbl_lsm_secattr *secattr,
 
 /**
  * security_netlbl_sid_to_secattr - Convert a SELinux SID to a NetLabel secattr
+ * @state: SELinux state
  * @sid: the SELinux SID
  * @secattr: the NetLabel packet security attributes
  *
@@ -3936,18 +3998,19 @@ int security_netlbl_secattr_to_sid(struct netlbl_lsm_secattr *secattr,
  * Returns zero on success, negative values on failure.
  *
  */
-int security_netlbl_sid_to_secattr(u32 sid, struct netlbl_lsm_secattr *secattr)
+int security_netlbl_sid_to_secattr(struct selinux_state *state,
+				   u32 sid, struct netlbl_lsm_secattr *secattr)
 {
 	struct selinux_policy *policy;
 	struct policydb *policydb;
 	int rc;
 	struct context *ctx;
 
-	if (!selinux_initialized())
+	if (!selinux_initialized(state))
 		return 0;
 
 	rcu_read_lock();
-	policy = rcu_dereference(selinux_state.policy);
+	policy = rcu_dereference(state->policy);
 	policydb = &policy->policydb;
 
 	rc = -ENOENT;
@@ -3997,13 +4060,14 @@ static int __security_read_policy(struct selinux_policy *policy,
 
 /**
  * security_read_policy - read the policy.
+ * @state: selinux_state
  * @data: binary policy data
  * @len: length of data in bytes
  *
  */
-int security_read_policy(void **data, size_t *len)
+int security_read_policy(struct selinux_state *state,
+			 void **data, size_t *len)
 {
-	struct selinux_state *state = &selinux_state;
 	struct selinux_policy *policy;
 
 	policy = rcu_dereference_protected(
@@ -4021,6 +4085,7 @@ int security_read_policy(void **data, size_t *len)
 
 /**
  * security_read_state_kernel - read the policy.
+ * @state: selinux_state
  * @data: binary policy data
  * @len: length of data in bytes
  *
@@ -4030,10 +4095,10 @@ int security_read_policy(void **data, size_t *len)
  *
  * This function must be called with policy_mutex held.
  */
-int security_read_state_kernel(void **data, size_t *len)
+int security_read_state_kernel(struct selinux_state *state,
+			       void **data, size_t *len)
 {
 	int err;
-	struct selinux_state *state = &selinux_state;
 	struct selinux_policy *policy;
 
 	policy = rcu_dereference_protected(
diff --git a/security/selinux/ss/services.h b/security/selinux/ss/services.h
index 93358e7a649c..8696f9300529 100644
--- a/security/selinux/ss/services.h
+++ b/security/selinux/ss/services.h
@@ -31,6 +31,7 @@ struct selinux_policy {
 } __randomize_layout;
 
 struct convert_context_args {
+	struct selinux_state *state;
 	struct policydb *oldp;
 	struct policydb *newp;
 };
diff --git a/security/selinux/status.c b/security/selinux/status.c
index dffca22ce6f7..e9ba1dae06e1 100644
--- a/security/selinux/status.c
+++ b/security/selinux/status.c
@@ -39,21 +39,21 @@
  * It returns a reference to selinux_status_page. If the status page is
  * not allocated yet, it also tries to allocate it at the first time.
  */
-struct page *selinux_kernel_status_page(void)
+struct page *selinux_kernel_status_page(struct selinux_state *state)
 {
 	struct selinux_kernel_status   *status;
 	struct page		       *result = NULL;
 
-	mutex_lock(&selinux_state.status_lock);
-	if (!selinux_state.status_page) {
-		selinux_state.status_page = alloc_page(GFP_KERNEL|__GFP_ZERO);
+	mutex_lock(&state->status_lock);
+	if (!state->status_page) {
+		state->status_page = alloc_page(GFP_KERNEL|__GFP_ZERO);
 
-		if (selinux_state.status_page) {
-			status = page_address(selinux_state.status_page);
+		if (state->status_page) {
+			status = page_address(state->status_page);
 
 			status->version = SELINUX_KERNEL_STATUS_VERSION;
 			status->sequence = 0;
-			status->enforcing = enforcing_enabled();
+			status->enforcing = enforcing_enabled(state);
 			/*
 			 * NOTE: the next policyload event shall set
 			 * a positive value on the status->policyload,
@@ -62,11 +62,11 @@ struct page *selinux_kernel_status_page(void)
 			 */
 			status->policyload = 0;
 			status->deny_unknown =
-				!security_get_allow_unknown();
+				!security_get_allow_unknown(state);
 		}
 	}
-	result = selinux_state.status_page;
-	mutex_unlock(&selinux_state.status_lock);
+	result = state->status_page;
+	mutex_unlock(&state->status_lock);
 
 	return result;
 }
@@ -76,13 +76,14 @@ struct page *selinux_kernel_status_page(void)
  *
  * It updates status of the current enforcing/permissive mode.
  */
-void selinux_status_update_setenforce(bool enforcing)
+void selinux_status_update_setenforce(struct selinux_state *state,
+				      bool enforcing)
 {
 	struct selinux_kernel_status   *status;
 
-	mutex_lock(&selinux_state.status_lock);
-	if (selinux_state.status_page) {
-		status = page_address(selinux_state.status_page);
+	mutex_lock(&state->status_lock);
+	if (state->status_page) {
+		status = page_address(state->status_page);
 
 		status->sequence++;
 		smp_wmb();
@@ -92,7 +93,7 @@ void selinux_status_update_setenforce(bool enforcing)
 		smp_wmb();
 		status->sequence++;
 	}
-	mutex_unlock(&selinux_state.status_lock);
+	mutex_unlock(&state->status_lock);
 }
 
 /*
@@ -101,22 +102,23 @@ void selinux_status_update_setenforce(bool enforcing)
  * It updates status of the times of policy reloaded, and current
  * setting of deny_unknown.
  */
-void selinux_status_update_policyload(u32 seqno)
+void selinux_status_update_policyload(struct selinux_state *state,
+				      u32 seqno)
 {
 	struct selinux_kernel_status   *status;
 
-	mutex_lock(&selinux_state.status_lock);
-	if (selinux_state.status_page) {
-		status = page_address(selinux_state.status_page);
+	mutex_lock(&state->status_lock);
+	if (state->status_page) {
+		status = page_address(state->status_page);
 
 		status->sequence++;
 		smp_wmb();
 
 		status->policyload = seqno;
-		status->deny_unknown = !security_get_allow_unknown();
+		status->deny_unknown = !security_get_allow_unknown(state);
 
 		smp_wmb();
 		status->sequence++;
 	}
-	mutex_unlock(&selinux_state.status_lock);
+	mutex_unlock(&state->status_lock);
 }
diff --git a/security/selinux/xfrm.c b/security/selinux/xfrm.c
index 90ec4ef1b082..83a94ca4d738 100644
--- a/security/selinux/xfrm.c
+++ b/security/selinux/xfrm.c
@@ -97,12 +97,13 @@ static int selinux_xfrm_alloc_user(struct xfrm_sec_ctx **ctxp,
 	ctx->ctx_len = str_len;
 	memcpy(ctx->ctx_str, &uctx[1], str_len);
 	ctx->ctx_str[str_len] = '\0';
-	rc = security_context_to_sid(ctx->ctx_str, str_len,
+	rc = security_context_to_sid(&selinux_state, ctx->ctx_str, str_len,
 				     &ctx->ctx_sid, gfp);
 	if (rc)
 		goto err;
 
-	rc = avc_has_perm(current_sid(), ctx->ctx_sid,
+	rc = avc_has_perm(&selinux_state,
+			  current_sid(), ctx->ctx_sid,
 			  SECCLASS_ASSOCIATION, ASSOCIATION__SETCONTEXT, NULL);
 	if (rc)
 		goto err;
@@ -136,7 +137,8 @@ static int selinux_xfrm_delete(struct xfrm_sec_ctx *ctx)
 	if (!ctx)
 		return 0;
 
-	return avc_has_perm(current_sid(), ctx->ctx_sid,
+	return avc_has_perm(&selinux_state,
+			    current_sid(), ctx->ctx_sid,
 			    SECCLASS_ASSOCIATION, ASSOCIATION__SETCONTEXT,
 			    NULL);
 }
@@ -158,7 +160,8 @@ int selinux_xfrm_policy_lookup(struct xfrm_sec_ctx *ctx, u32 fl_secid)
 	if (!selinux_authorizable_ctx(ctx))
 		return -EINVAL;
 
-	rc = avc_has_perm(fl_secid, ctx->ctx_sid,
+	rc = avc_has_perm(&selinux_state,
+			  fl_secid, ctx->ctx_sid,
 			  SECCLASS_ASSOCIATION, ASSOCIATION__POLMATCH, NULL);
 	return (rc == -EACCES ? -ESRCH : rc);
 }
@@ -199,7 +202,7 @@ int selinux_xfrm_state_pol_flow_match(struct xfrm_state *x,
 	/* We don't need a separate SA Vs. policy polmatch check since the SA
 	 * is now of the same label as the flow and a flow Vs. policy polmatch
 	 * check had already happened in selinux_xfrm_policy_lookup() above. */
-	return (avc_has_perm(flic_sid, state_sid,
+	return (avc_has_perm(&selinux_state, flic_sid, state_sid,
 			     SECCLASS_ASSOCIATION, ASSOCIATION__SENDTO,
 			     NULL) ? 0 : 1);
 }
@@ -349,7 +352,7 @@ int selinux_xfrm_state_alloc_acquire(struct xfrm_state *x,
 	if (secid == 0)
 		return -EINVAL;
 
-	rc = security_sid_to_context(secid, &ctx_str,
+	rc = security_sid_to_context(&selinux_state, secid, &ctx_str,
 				     &str_len);
 	if (rc)
 		return rc;
@@ -418,7 +421,8 @@ int selinux_xfrm_sock_rcv_skb(u32 sk_sid, struct sk_buff *skb,
 	/* This check even when there's no association involved is intended,
 	 * according to Trent Jaeger, to make sure a process can't engage in
 	 * non-IPsec communication unless explicitly allowed by policy. */
-	return avc_has_perm(sk_sid, peer_sid,
+	return avc_has_perm(&selinux_state,
+			    sk_sid, peer_sid,
 			    SECCLASS_ASSOCIATION, ASSOCIATION__RECVFROM, ad);
 }
 
@@ -461,6 +465,6 @@ int selinux_xfrm_postroute_last(u32 sk_sid, struct sk_buff *skb,
 	/* This check even when there's no association involved is intended,
 	 * according to Trent Jaeger, to make sure a process can't engage in
 	 * non-IPsec communication unless explicitly allowed by policy. */
-	return avc_has_perm(sk_sid, SECINITSID_UNLABELED,
+	return avc_has_perm(&selinux_state, sk_sid, SECINITSID_UNLABELED,
 			    SECCLASS_ASSOCIATION, ASSOCIATION__SENDTO, ad);
 }
-- 
2.49.0


