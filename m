Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F0ED23CD45
	for <lists+selinux@lfdr.de>; Wed,  5 Aug 2020 19:23:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728590AbgHERXo (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Wed, 5 Aug 2020 13:23:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728421AbgHERQB (ORCPT
        <rfc822;selinux@vger.kernel.org>); Wed, 5 Aug 2020 13:16:01 -0400
Received: from mail-qv1-xf43.google.com (mail-qv1-xf43.google.com [IPv6:2607:f8b0:4864:20::f43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BB6EC001FCE
        for <selinux@vger.kernel.org>; Wed,  5 Aug 2020 08:52:57 -0700 (PDT)
Received: by mail-qv1-xf43.google.com with SMTP id y11so17970808qvl.4
        for <selinux@vger.kernel.org>; Wed, 05 Aug 2020 08:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=J595VzXuE4xTsf9QmOo31DWVb8BTyMJoe/qNZKLEVlo=;
        b=f2r4KEXP46aMh2VEADGgbCZuxKuI3thkaeDHcjxwKsx4vKHTUeSrLP4KBon4do0KWU
         LZDA31kUdQA414hMJ6Jg7OtYRG77b1oBhg0ctQNNBnPz33h7nNM3Te7XMZ0PArq/RwZs
         BlV8syvOEN8FxKW8jXgIGgEWo1+90pMvgdlpFw04UBUMbxLHokejJNHek4MtlUmYR+1C
         q9/kJuv5vxjvQeDVEGkHPni9VcD2UslnzkMHjiLa1jOt19Zp4u2g65QhTUYi7w64WpJe
         QiWBp2tzsAVG6/Zg64a7OC3BZ20FDGczYyO84TwqoODV5R/2TmpBFSoOVGVspc476H4Q
         aXKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=J595VzXuE4xTsf9QmOo31DWVb8BTyMJoe/qNZKLEVlo=;
        b=OxMyS3R1LKp5nM6PlejuDEGk7ESdLO14aBZtM7oB7gcCnYftQvDFhEf5+901TQodH1
         RKSCi2m1R34lUKXm0rYVsYCNCfcKgD+hhwMm+7BRB1vmIF88P8h1smdrq9khYCxSniIS
         h+e0GeGczuWr+zTH1esSAHfPA8icAug6FcU+ObM3adL6bSM6iD06I+NX//CwhIV0KbTd
         v+/08Io5bJ8cog5shVId4MonMMXAX5t47ohG7Jqwz8cN/HS2UNOYtWJgvx6Aewu5nmfK
         RzSM0g0aQOmnnRbzEhme6HiUhmasYm17oCq5XRYJyyYFCBTPzH79+TDmHL5Jn+59s+CN
         WT+A==
X-Gm-Message-State: AOAM5329Fdlcxo1yNKdKo+26cZuTVHYpugioUBJgOZ4A0uLIWNA2elX1
        KdyCw4n8IgdHG+/Z8Y2OT4M=
X-Google-Smtp-Source: ABdhPJzqSSnR8AAL7TBNGDUS00OlyfWmeWEidaFRnjzK59pk5FubX4enROMoeW9LWdHoMoaPXltUwA==
X-Received: by 2002:a0c:a8c7:: with SMTP id h7mr4372768qvc.181.1596642776268;
        Wed, 05 Aug 2020 08:52:56 -0700 (PDT)
Received: from puritycontrol.fios-router.home (pool-71-244-252-199.bltmmd.fios.verizon.net. [71.244.252.199])
        by smtp.gmail.com with ESMTPSA id i20sm1863119qka.17.2020.08.05.08.52.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2020 08:52:55 -0700 (PDT)
From:   Stephen Smalley <stephen.smalley.work@gmail.com>
To:     paul@paul-moore.com
Cc:     omosnace@redhat.com, selinux@vger.kernel.org,
        dburgener@linux.microsoft.com,
        Stephen Smalley <stephen.smalley.work@gmail.com>
Subject: [RFC PATCH v4 1/2] selinux: encapsulate policy state, refactor policy load
Date:   Wed,  5 Aug 2020 11:52:39 -0400
Message-Id: <20200805155240.26473-1-stephen.smalley.work@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Encapsulate the policy state in its own structure (struct
selinux_policy) that is separately allocated but referenced from the
selinux_ss structure.  The policy state includes the SID table
(particularly the context structures), the policy database, and the
mapping between the kernel classes/permissions and the policy values.
Refactor the security server portion of the policy load logic to
cleanly separate loading of the new structures from committing the new
policy.  Unify the initial policy load and reload code paths as much
as possible, avoiding duplicated code.  Make sure we are taking the
policy read-lock prior to any dereferencing of the policy.  Move the
copying of the policy capability booleans into the state structure
outside of the policy write-lock because they are separate from the
policy and are read outside of any policy lock; possibly they should
be using at least READ_ONCE/WRITE_ONCE or smp_load_acquire/store_release.
Restore the load mutex that was previously removed by
commit 89abd0acf033 ("SELinux: drop load_mutex in security_load_policy")
to make explicit the exclusion even though it is currently redundant
with the fsi->mutex held by selinuxfs; this makes clear that we do
not need to take the policy read-lock across sidtab_convert() and will
be useful in the future for lockdep checking.

These changes simplify the policy loading logic, reduce the size of
the critical section while holding the policy write-lock, and should
facilitate future changes to e.g. refactor the entire policy reload
logic including the selinuxfs code to make the updating of the policy
and the selinuxfs directory tree atomic and/or to convert the policy
read-write lock to RCU.

Signed-off-by: Stephen Smalley <stephen.smalley.work@gmail.com>
---
v4 does not take the policy read-lock across sidtab_convert() and
therefore does not require changing allocations by it to be atomic
or dropping the cond_resched() call.  To make obvious that taking
the policy read-lock is not necessary in security_load_policy(), restore
the load mutex to security_load_policy() that was removed back in
commit 89abd0acf033 ("SELinux: drop load_mutex in security_load_policy").
However, since we have refactored security_load_policy() in this change
to split out selinux_policy_commit(), we need to take the mutex in
security_load_policy() and release it in selinux_policy_commit().

 security/selinux/ss/services.c | 403 +++++++++++++++++----------------
 security/selinux/ss/services.h |  11 +-
 2 files changed, 220 insertions(+), 194 deletions(-)

diff --git a/security/selinux/ss/services.c b/security/selinux/ss/services.c
index 9e76a80db6e1..6dea93fac9e2 100644
--- a/security/selinux/ss/services.c
+++ b/security/selinux/ss/services.c
@@ -81,6 +81,7 @@ static struct selinux_ss selinux_ss;
 void selinux_ss_init(struct selinux_ss **ss)
 {
 	rwlock_init(&selinux_ss.policy_rwlock);
+	mutex_init(&selinux_ss.load_mutex);
 	*ss = &selinux_ss;
 }
 
@@ -248,9 +249,15 @@ static void map_decision(struct selinux_map *map,
 
 int security_mls_enabled(struct selinux_state *state)
 {
-	struct policydb *p = &state->ss->policydb;
+	int mls_enabled;
 
-	return p->mls_enabled;
+	if (!selinux_initialized(state))
+		return 0;
+
+	read_lock(&state->ss->policy_rwlock);
+	mls_enabled = state->ss->policy->policydb.mls_enabled;
+	read_unlock(&state->ss->policy_rwlock);
+	return mls_enabled;
 }
 
 /*
@@ -726,8 +733,8 @@ static int security_validtrans_handle_fail(struct selinux_state *state,
 					   struct sidtab_entry *tentry,
 					   u16 tclass)
 {
-	struct policydb *p = &state->ss->policydb;
-	struct sidtab *sidtab = state->ss->sidtab;
+	struct policydb *p = &state->ss->policy->policydb;
+	struct sidtab *sidtab = &state->ss->policy->sidtab;
 	char *o = NULL, *n = NULL, *t = NULL;
 	u32 olen, nlen, tlen;
 
@@ -771,11 +778,11 @@ static int security_compute_validatetrans(struct selinux_state *state,
 
 	read_lock(&state->ss->policy_rwlock);
 
-	policydb = &state->ss->policydb;
-	sidtab = state->ss->sidtab;
+	policydb = &state->ss->policy->policydb;
+	sidtab = &state->ss->policy->sidtab;
 
 	if (!user)
-		tclass = unmap_class(&state->ss->map, orig_tclass);
+		tclass = unmap_class(&state->ss->policy->map, orig_tclass);
 	else
 		tclass = orig_tclass;
 
@@ -872,8 +879,8 @@ int security_bounded_transition(struct selinux_state *state,
 
 	read_lock(&state->ss->policy_rwlock);
 
-	policydb = &state->ss->policydb;
-	sidtab = state->ss->sidtab;
+	policydb = &state->ss->policy->policydb;
+	sidtab = &state->ss->policy->sidtab;
 
 	rc = -EINVAL;
 	old_entry = sidtab_search_entry(sidtab, old_sid);
@@ -1029,8 +1036,8 @@ void security_compute_xperms_decision(struct selinux_state *state,
 	if (!selinux_initialized(state))
 		goto allow;
 
-	policydb = &state->ss->policydb;
-	sidtab = state->ss->sidtab;
+	policydb = &state->ss->policy->policydb;
+	sidtab = &state->ss->policy->sidtab;
 
 	scontext = sidtab_search(sidtab, ssid);
 	if (!scontext) {
@@ -1046,7 +1053,7 @@ void security_compute_xperms_decision(struct selinux_state *state,
 		goto out;
 	}
 
-	tclass = unmap_class(&state->ss->map, orig_tclass);
+	tclass = unmap_class(&state->ss->policy->map, orig_tclass);
 	if (unlikely(orig_tclass && !tclass)) {
 		if (policydb->allow_unknown)
 			goto allow;
@@ -1114,8 +1121,8 @@ void security_compute_av(struct selinux_state *state,
 	if (!selinux_initialized(state))
 		goto allow;
 
-	policydb = &state->ss->policydb;
-	sidtab = state->ss->sidtab;
+	policydb = &state->ss->policy->policydb;
+	sidtab = &state->ss->policy->sidtab;
 
 	scontext = sidtab_search(sidtab, ssid);
 	if (!scontext) {
@@ -1135,7 +1142,7 @@ void security_compute_av(struct selinux_state *state,
 		goto out;
 	}
 
-	tclass = unmap_class(&state->ss->map, orig_tclass);
+	tclass = unmap_class(&state->ss->policy->map, orig_tclass);
 	if (unlikely(orig_tclass && !tclass)) {
 		if (policydb->allow_unknown)
 			goto allow;
@@ -1143,7 +1150,7 @@ void security_compute_av(struct selinux_state *state,
 	}
 	context_struct_compute_av(policydb, scontext, tcontext, tclass, avd,
 				  xperms);
-	map_decision(&state->ss->map, orig_tclass, avd,
+	map_decision(&state->ss->policy->map, orig_tclass, avd,
 		     policydb->allow_unknown);
 out:
 	read_unlock(&state->ss->policy_rwlock);
@@ -1168,8 +1175,8 @@ void security_compute_av_user(struct selinux_state *state,
 	if (!selinux_initialized(state))
 		goto allow;
 
-	policydb = &state->ss->policydb;
-	sidtab = state->ss->sidtab;
+	policydb = &state->ss->policy->policydb;
+	sidtab = &state->ss->policy->sidtab;
 
 	scontext = sidtab_search(sidtab, ssid);
 	if (!scontext) {
@@ -1292,7 +1299,7 @@ int security_sidtab_hash_stats(struct selinux_state *state, char *page)
 	}
 
 	read_lock(&state->ss->policy_rwlock);
-	rc = sidtab_hash_stats(state->ss->sidtab, page);
+	rc = sidtab_hash_stats(&state->ss->policy->sidtab, page);
 	read_unlock(&state->ss->policy_rwlock);
 
 	return rc;
@@ -1340,8 +1347,8 @@ static int security_sid_to_context_core(struct selinux_state *state,
 		return -EINVAL;
 	}
 	read_lock(&state->ss->policy_rwlock);
-	policydb = &state->ss->policydb;
-	sidtab = state->ss->sidtab;
+	policydb = &state->ss->policy->policydb;
+	sidtab = &state->ss->policy->sidtab;
 
 	if (force)
 		entry = sidtab_search_entry_force(sidtab, sid);
@@ -1534,8 +1541,8 @@ static int security_context_to_sid_core(struct selinux_state *state,
 			goto out;
 	}
 	read_lock(&state->ss->policy_rwlock);
-	policydb = &state->ss->policydb;
-	sidtab = state->ss->sidtab;
+	policydb = &state->ss->policy->policydb;
+	sidtab = &state->ss->policy->sidtab;
 	rc = string_to_context_struct(policydb, sidtab, scontext2,
 				      &context, def_sid);
 	if (rc == -EINVAL && force) {
@@ -1622,8 +1629,8 @@ static int compute_sid_handle_invalid_context(
 	u16 tclass,
 	struct context *newcontext)
 {
-	struct policydb *policydb = &state->ss->policydb;
-	struct sidtab *sidtab = state->ss->sidtab;
+	struct policydb *policydb = &state->ss->policy->policydb;
+	struct sidtab *sidtab = &state->ss->policy->sidtab;
 	char *s = NULL, *t = NULL, *n = NULL;
 	u32 slen, tlen, nlen;
 	struct audit_buffer *ab;
@@ -1719,16 +1726,16 @@ static int security_compute_sid(struct selinux_state *state,
 	read_lock(&state->ss->policy_rwlock);
 
 	if (kern) {
-		tclass = unmap_class(&state->ss->map, orig_tclass);
+		tclass = unmap_class(&state->ss->policy->map, orig_tclass);
 		sock = security_is_socket_class(orig_tclass);
 	} else {
 		tclass = orig_tclass;
-		sock = security_is_socket_class(map_class(&state->ss->map,
+		sock = security_is_socket_class(map_class(&state->ss->policy->map,
 							  tclass));
 	}
 
-	policydb = &state->ss->policydb;
-	sidtab = state->ss->sidtab;
+	policydb = &state->ss->policy->policydb;
+	sidtab = &state->ss->policy->sidtab;
 
 	sentry = sidtab_search_entry(sidtab, ssid);
 	if (!sentry) {
@@ -1945,7 +1952,7 @@ static inline int convert_context_handle_invalid_context(
 	struct selinux_state *state,
 	struct context *context)
 {
-	struct policydb *policydb = &state->ss->policydb;
+	struct policydb *policydb = &state->ss->policy->policydb;
 	char *s;
 	u32 len;
 
@@ -2098,10 +2105,14 @@ static int convert_context(struct context *oldc, struct context *newc, void *p)
 
 static void security_load_policycaps(struct selinux_state *state)
 {
-	struct policydb *p = &state->ss->policydb;
+	struct policydb *p;
 	unsigned int i;
 	struct ebitmap_node *node;
 
+	read_lock(&state->ss->policy_rwlock);
+
+	p = &state->ss->policy->policydb;
+
 	for (i = 0; i < ARRAY_SIZE(state->policycap); i++)
 		state->policycap[i] = ebitmap_get_bit(&p->policycaps, i);
 
@@ -2115,11 +2126,73 @@ static void security_load_policycaps(struct selinux_state *state)
 			pr_info("SELinux:  unknown policy capability %u\n",
 				i);
 	}
+
+	read_unlock(&state->ss->policy_rwlock);
 }
 
 static int security_preserve_bools(struct selinux_state *state,
 				   struct policydb *newpolicydb);
 
+static void selinux_policy_free(struct selinux_policy *policy)
+{
+	if (!policy)
+		return;
+
+	policydb_destroy(&policy->policydb);
+	sidtab_destroy(&policy->sidtab);
+	kfree(policy->map.mapping);
+	kfree(policy);
+}
+
+static void selinux_policy_commit(struct selinux_state *state,
+				struct selinux_policy *newpolicy)
+{
+	struct selinux_policy *oldpolicy;
+	u32 seqno;
+
+	lockdep_assert_held(&state->ss->load_mutex);
+
+	/* If switching between different policy types, log MLS status */
+	oldpolicy = state->ss->policy;
+	if (oldpolicy) {
+		if (oldpolicy->policydb.mls_enabled && !newpolicy->policydb.mls_enabled)
+			pr_info("SELinux: Disabling MLS support...\n");
+		else if (!oldpolicy->policydb.mls_enabled && newpolicy->policydb.mls_enabled)
+			pr_info("SELinux: Enabling MLS support...\n");
+	}
+
+	/* Install the new policy. */
+	write_lock_irq(&state->ss->policy_rwlock);
+	state->ss->policy = newpolicy;
+	seqno = ++state->ss->latest_granting;
+	write_unlock_irq(&state->ss->policy_rwlock);
+
+	/* Load the policycaps from the new policy */
+	security_load_policycaps(state);
+
+	if (!selinux_initialized(state)) {
+		/*
+		 * After first policy load, the security server is
+		 * marked as initialized and ready to handle requests and
+		 * any objects created prior to policy load are then labeled.
+		 */
+		selinux_mark_initialized(state);
+		mutex_unlock(&state->ss->load_mutex);
+		selinux_complete_init();
+	} else
+		mutex_unlock(&state->ss->load_mutex);
+
+	/* Free the old policy */
+	selinux_policy_free(oldpolicy);
+
+	/* Flush external caches and notify userspace of policy load */
+	avc_ss_reset(state->avc, seqno);
+	selnl_notify_policyload(seqno);
+	selinux_status_update_policyload(state, seqno);
+	selinux_netlbl_cache_invalidate();
+	selinux_xfrm_notify_policyload();
+}
+
 /**
  * security_load_policy - Load a security policy configuration.
  * @data: binary policy data
@@ -2132,166 +2205,82 @@ static int security_preserve_bools(struct selinux_state *state,
  */
 int security_load_policy(struct selinux_state *state, void *data, size_t len)
 {
-	struct policydb *policydb;
-	struct sidtab *oldsidtab, *newsidtab;
-	struct policydb *oldpolicydb, *newpolicydb;
-	struct selinux_mapping *oldmapping;
-	struct selinux_map newmap;
+	struct selinux_policy *newpolicy;
 	struct sidtab_convert_params convert_params;
 	struct convert_context_args args;
-	u32 seqno;
 	int rc = 0;
 	struct policy_file file = { data, len }, *fp = &file;
 
-	policydb = &state->ss->policydb;
-
-	newsidtab = kmalloc(sizeof(*newsidtab), GFP_KERNEL);
-	if (!newsidtab)
+	newpolicy = kzalloc(sizeof(*newpolicy), GFP_KERNEL);
+	if (!newpolicy)
 		return -ENOMEM;
 
-	if (!selinux_initialized(state)) {
-		rc = policydb_read(policydb, fp);
-		if (rc) {
-			kfree(newsidtab);
-			return rc;
-		}
-
-		policydb->len = len;
-		rc = selinux_set_mapping(policydb, secclass_map,
-					 &state->ss->map);
-		if (rc) {
-			kfree(newsidtab);
-			policydb_destroy(policydb);
-			return rc;
-		}
-
-		rc = policydb_load_isids(policydb, newsidtab);
-		if (rc) {
-			kfree(newsidtab);
-			policydb_destroy(policydb);
-			return rc;
-		}
-
-		state->ss->sidtab = newsidtab;
-		security_load_policycaps(state);
-		selinux_mark_initialized(state);
-		seqno = ++state->ss->latest_granting;
-		selinux_complete_init();
-		avc_ss_reset(state->avc, seqno);
-		selnl_notify_policyload(seqno);
-		selinux_status_update_policyload(state, seqno);
-		selinux_netlbl_cache_invalidate();
-		selinux_xfrm_notify_policyload();
-		return 0;
-	}
+	rc = policydb_read(&newpolicy->policydb, fp);
+	if (rc)
+		goto err;
 
-	oldpolicydb = kcalloc(2, sizeof(*oldpolicydb), GFP_KERNEL);
-	if (!oldpolicydb) {
-		kfree(newsidtab);
-		return -ENOMEM;
-	}
-	newpolicydb = oldpolicydb + 1;
+	newpolicy->policydb.len = len;
+	rc = selinux_set_mapping(&newpolicy->policydb, secclass_map,
+				&newpolicy->map);
+	if (rc)
+		goto err;
 
-	rc = policydb_read(newpolicydb, fp);
+	rc = policydb_load_isids(&newpolicy->policydb, &newpolicy->sidtab);
 	if (rc) {
-		kfree(newsidtab);
-		goto out;
+		pr_err("SELinux:  unable to load the initial SIDs\n");
+		goto err;
 	}
 
-	newpolicydb->len = len;
-	/* If switching between different policy types, log MLS status */
-	if (policydb->mls_enabled && !newpolicydb->mls_enabled)
-		pr_info("SELinux: Disabling MLS support...\n");
-	else if (!policydb->mls_enabled && newpolicydb->mls_enabled)
-		pr_info("SELinux: Enabling MLS support...\n");
+	mutex_lock(&state->ss->load_mutex);
 
-	rc = policydb_load_isids(newpolicydb, newsidtab);
-	if (rc) {
-		pr_err("SELinux:  unable to load the initial SIDs\n");
-		policydb_destroy(newpolicydb);
-		kfree(newsidtab);
-		goto out;
+	if (!selinux_initialized(state)) {
+		/* First policy load, so no need to preserve state from old policy */
+		selinux_policy_commit(state, newpolicy);
+		return 0;
 	}
 
-	rc = selinux_set_mapping(newpolicydb, secclass_map, &newmap);
-	if (rc)
-		goto err;
-
-	rc = security_preserve_bools(state, newpolicydb);
+	/* Preserve active boolean values from the old policy */
+	rc = security_preserve_bools(state, &newpolicy->policydb);
 	if (rc) {
 		pr_err("SELinux:  unable to preserve booleans\n");
-		goto err;
+		goto err_unlock;
 	}
 
-	oldsidtab = state->ss->sidtab;
-
 	/*
 	 * Convert the internal representations of contexts
 	 * in the new SID table.
 	 */
 	args.state = state;
-	args.oldp = policydb;
-	args.newp = newpolicydb;
+	args.oldp = &state->ss->policy->policydb;
+	args.newp = &newpolicy->policydb;
 
 	convert_params.func = convert_context;
 	convert_params.args = &args;
-	convert_params.target = newsidtab;
+	convert_params.target = &newpolicy->sidtab;
 
-	rc = sidtab_convert(oldsidtab, &convert_params);
+	rc = sidtab_convert(&state->ss->policy->sidtab, &convert_params);
 	if (rc) {
 		pr_err("SELinux:  unable to convert the internal"
 			" representation of contexts in the new SID"
 			" table\n");
-		goto err;
+		goto err_unlock;
 	}
 
-	/* Save the old policydb and SID table to free later. */
-	memcpy(oldpolicydb, policydb, sizeof(*policydb));
-
-	/* Install the new policydb and SID table. */
-	write_lock_irq(&state->ss->policy_rwlock);
-	memcpy(policydb, newpolicydb, sizeof(*policydb));
-	state->ss->sidtab = newsidtab;
-	security_load_policycaps(state);
-	oldmapping = state->ss->map.mapping;
-	state->ss->map.mapping = newmap.mapping;
-	state->ss->map.size = newmap.size;
-	seqno = ++state->ss->latest_granting;
-	write_unlock_irq(&state->ss->policy_rwlock);
-
-	/* Free the old policydb and SID table. */
-	policydb_destroy(oldpolicydb);
-	sidtab_destroy(oldsidtab);
-	kfree(oldsidtab);
-	kfree(oldmapping);
-
-	avc_ss_reset(state->avc, seqno);
-	selnl_notify_policyload(seqno);
-	selinux_status_update_policyload(state, seqno);
-	selinux_netlbl_cache_invalidate();
-	selinux_xfrm_notify_policyload();
-
-	rc = 0;
-	goto out;
-
+	selinux_policy_commit(state, newpolicy);
+	return 0;
+err_unlock:
+	mutex_unlock(&state->ss->load_mutex);
 err:
-	kfree(newmap.mapping);
-	sidtab_destroy(newsidtab);
-	kfree(newsidtab);
-	policydb_destroy(newpolicydb);
-
-out:
-	kfree(oldpolicydb);
+	selinux_policy_free(newpolicy);
 	return rc;
 }
 
 size_t security_policydb_len(struct selinux_state *state)
 {
-	struct policydb *p = &state->ss->policydb;
 	size_t len;
 
 	read_lock(&state->ss->policy_rwlock);
-	len = p->len;
+	len = state->ss->policy->policydb.len;
 	read_unlock(&state->ss->policy_rwlock);
 
 	return len;
@@ -2313,8 +2302,8 @@ int security_port_sid(struct selinux_state *state,
 
 	read_lock(&state->ss->policy_rwlock);
 
-	policydb = &state->ss->policydb;
-	sidtab = state->ss->sidtab;
+	policydb = &state->ss->policy->policydb;
+	sidtab = &state->ss->policy->sidtab;
 
 	c = policydb->ocontexts[OCON_PORT];
 	while (c) {
@@ -2358,8 +2347,8 @@ int security_ib_pkey_sid(struct selinux_state *state,
 
 	read_lock(&state->ss->policy_rwlock);
 
-	policydb = &state->ss->policydb;
-	sidtab = state->ss->sidtab;
+	policydb = &state->ss->policy->policydb;
+	sidtab = &state->ss->policy->sidtab;
 
 	c = policydb->ocontexts[OCON_IBPKEY];
 	while (c) {
@@ -2404,8 +2393,8 @@ int security_ib_endport_sid(struct selinux_state *state,
 
 	read_lock(&state->ss->policy_rwlock);
 
-	policydb = &state->ss->policydb;
-	sidtab = state->ss->sidtab;
+	policydb = &state->ss->policy->policydb;
+	sidtab = &state->ss->policy->sidtab;
 
 	c = policydb->ocontexts[OCON_IBENDPORT];
 	while (c) {
@@ -2449,8 +2438,8 @@ int security_netif_sid(struct selinux_state *state,
 
 	read_lock(&state->ss->policy_rwlock);
 
-	policydb = &state->ss->policydb;
-	sidtab = state->ss->sidtab;
+	policydb = &state->ss->policy->policydb;
+	sidtab = &state->ss->policy->sidtab;
 
 	c = policydb->ocontexts[OCON_NETIF];
 	while (c) {
@@ -2512,8 +2501,8 @@ int security_node_sid(struct selinux_state *state,
 
 	read_lock(&state->ss->policy_rwlock);
 
-	policydb = &state->ss->policydb;
-	sidtab = state->ss->sidtab;
+	policydb = &state->ss->policy->policydb;
+	sidtab = &state->ss->policy->sidtab;
 
 	switch (domain) {
 	case AF_INET: {
@@ -2612,8 +2601,8 @@ int security_get_user_sids(struct selinux_state *state,
 
 	read_lock(&state->ss->policy_rwlock);
 
-	policydb = &state->ss->policydb;
-	sidtab = state->ss->sidtab;
+	policydb = &state->ss->policy->policydb;
+	sidtab = &state->ss->policy->sidtab;
 
 	context_init(&usercon);
 
@@ -2714,8 +2703,8 @@ static inline int __security_genfs_sid(struct selinux_state *state,
 				       u16 orig_sclass,
 				       u32 *sid)
 {
-	struct policydb *policydb = &state->ss->policydb;
-	struct sidtab *sidtab = state->ss->sidtab;
+	struct policydb *policydb = &state->ss->policy->policydb;
+	struct sidtab *sidtab = &state->ss->policy->sidtab;
 	int len;
 	u16 sclass;
 	struct genfs *genfs;
@@ -2725,7 +2714,7 @@ static inline int __security_genfs_sid(struct selinux_state *state,
 	while (path[0] == '/' && path[1] == '/')
 		path++;
 
-	sclass = unmap_class(&state->ss->map, orig_sclass);
+	sclass = unmap_class(&state->ss->policy->map, orig_sclass);
 	*sid = SECINITSID_UNLABELED;
 
 	for (genfs = policydb->genfs; genfs; genfs = genfs->next) {
@@ -2800,8 +2789,8 @@ int security_fs_use(struct selinux_state *state, struct super_block *sb)
 
 	read_lock(&state->ss->policy_rwlock);
 
-	policydb = &state->ss->policydb;
-	sidtab = state->ss->sidtab;
+	policydb = &state->ss->policy->policydb;
+	sidtab = &state->ss->policy->sidtab;
 
 	c = policydb->ocontexts[OCON_FSUSE];
 	while (c) {
@@ -2851,7 +2840,7 @@ int security_get_bools(struct selinux_state *state,
 
 	read_lock(&state->ss->policy_rwlock);
 
-	policydb = &state->ss->policydb;
+	policydb = &state->ss->policy->policydb;
 
 	*names = NULL;
 	*values = NULL;
@@ -2902,7 +2891,7 @@ int security_set_bools(struct selinux_state *state, u32 len, int *values)
 
 	write_lock_irq(&state->ss->policy_rwlock);
 
-	policydb = &state->ss->policydb;
+	policydb = &state->ss->policy->policydb;
 
 	rc = -EFAULT;
 	lenp = policydb->p_bools.nprim;
@@ -2950,7 +2939,7 @@ int security_get_bool_value(struct selinux_state *state,
 
 	read_lock(&state->ss->policy_rwlock);
 
-	policydb = &state->ss->policydb;
+	policydb = &state->ss->policy->policydb;
 
 	rc = -EFAULT;
 	len = policydb->p_bools.nprim;
@@ -2998,8 +2987,8 @@ static int security_preserve_bools(struct selinux_state *state,
 int security_sid_mls_copy(struct selinux_state *state,
 			  u32 sid, u32 mls_sid, u32 *new_sid)
 {
-	struct policydb *policydb = &state->ss->policydb;
-	struct sidtab *sidtab = state->ss->sidtab;
+	struct policydb *policydb;
+	struct sidtab *sidtab;
 	struct context *context1;
 	struct context *context2;
 	struct context newcon;
@@ -3008,7 +2997,7 @@ int security_sid_mls_copy(struct selinux_state *state,
 	int rc;
 
 	rc = 0;
-	if (!selinux_initialized(state) || !policydb->mls_enabled) {
+	if (!selinux_initialized(state)) {
 		*new_sid = sid;
 		goto out;
 	}
@@ -3017,6 +3006,14 @@ int security_sid_mls_copy(struct selinux_state *state,
 
 	read_lock(&state->ss->policy_rwlock);
 
+	policydb = &state->ss->policy->policydb;
+	sidtab = &state->ss->policy->sidtab;
+
+	if (!policydb->mls_enabled) {
+		*new_sid = sid;
+		goto out_unlock;
+	}
+
 	rc = -EINVAL;
 	context1 = sidtab_search(sidtab, sid);
 	if (!context1) {
@@ -3094,8 +3091,8 @@ int security_net_peersid_resolve(struct selinux_state *state,
 				 u32 xfrm_sid,
 				 u32 *peer_sid)
 {
-	struct policydb *policydb = &state->ss->policydb;
-	struct sidtab *sidtab = state->ss->sidtab;
+	struct policydb *policydb;
+	struct sidtab *sidtab;
 	int rc;
 	struct context *nlbl_ctx;
 	struct context *xfrm_ctx;
@@ -3117,15 +3114,20 @@ int security_net_peersid_resolve(struct selinux_state *state,
 		return 0;
 	}
 
+	read_lock(&state->ss->policy_rwlock);
+
+	policydb = &state->ss->policy->policydb;
+	sidtab = &state->ss->policy->sidtab;
+
 	/*
 	 * We don't need to check initialized here since the only way both
 	 * nlbl_sid and xfrm_sid are not equal to SECSID_NULL would be if the
 	 * security server was initialized and state->initialized was true.
 	 */
-	if (!policydb->mls_enabled)
-		return 0;
-
-	read_lock(&state->ss->policy_rwlock);
+	if (!policydb->mls_enabled) {
+		rc = 0;
+		goto out;
+	}
 
 	rc = -EINVAL;
 	nlbl_ctx = sidtab_search(sidtab, nlbl_sid);
@@ -3172,7 +3174,7 @@ static int get_classes_callback(void *k, void *d, void *args)
 int security_get_classes(struct selinux_state *state,
 			 char ***classes, int *nclasses)
 {
-	struct policydb *policydb = &state->ss->policydb;
+	struct policydb *policydb;
 	int rc;
 
 	if (!selinux_initialized(state)) {
@@ -3183,6 +3185,8 @@ int security_get_classes(struct selinux_state *state,
 
 	read_lock(&state->ss->policy_rwlock);
 
+	policydb = &state->ss->policy->policydb;
+
 	rc = -ENOMEM;
 	*nclasses = policydb->p_classes.nprim;
 	*classes = kcalloc(*nclasses, sizeof(**classes), GFP_ATOMIC);
@@ -3219,12 +3223,14 @@ static int get_permissions_callback(void *k, void *d, void *args)
 int security_get_permissions(struct selinux_state *state,
 			     char *class, char ***perms, int *nperms)
 {
-	struct policydb *policydb = &state->ss->policydb;
+	struct policydb *policydb;
 	int rc, i;
 	struct class_datum *match;
 
 	read_lock(&state->ss->policy_rwlock);
 
+	policydb = &state->ss->policy->policydb;
+
 	rc = -EINVAL;
 	match = symtab_search(&policydb->p_classes, class);
 	if (!match) {
@@ -3265,12 +3271,22 @@ int security_get_permissions(struct selinux_state *state,
 
 int security_get_reject_unknown(struct selinux_state *state)
 {
-	return state->ss->policydb.reject_unknown;
+	int value;
+
+	read_lock(&state->ss->policy_rwlock);
+	value = state->ss->policy->policydb.reject_unknown;
+	read_unlock(&state->ss->policy_rwlock);
+	return value;
 }
 
 int security_get_allow_unknown(struct selinux_state *state)
 {
-	return state->ss->policydb.allow_unknown;
+	int value;
+
+	read_lock(&state->ss->policy_rwlock);
+	value = state->ss->policy->policydb.allow_unknown;
+	read_unlock(&state->ss->policy_rwlock);
+	return value;
 }
 
 /**
@@ -3286,11 +3302,10 @@ int security_get_allow_unknown(struct selinux_state *state)
 int security_policycap_supported(struct selinux_state *state,
 				 unsigned int req_cap)
 {
-	struct policydb *policydb = &state->ss->policydb;
 	int rc;
 
 	read_lock(&state->ss->policy_rwlock);
-	rc = ebitmap_get_bit(&policydb->policycaps, req_cap);
+	rc = ebitmap_get_bit(&state->ss->policy->policydb.policycaps, req_cap);
 	read_unlock(&state->ss->policy_rwlock);
 
 	return rc;
@@ -3314,7 +3329,7 @@ void selinux_audit_rule_free(void *vrule)
 int selinux_audit_rule_init(u32 field, u32 op, char *rulestr, void **vrule)
 {
 	struct selinux_state *state = &selinux_state;
-	struct policydb *policydb = &state->ss->policydb;
+	struct policydb *policydb;
 	struct selinux_audit_rule *tmprule;
 	struct role_datum *roledatum;
 	struct type_datum *typedatum;
@@ -3359,6 +3374,8 @@ int selinux_audit_rule_init(u32 field, u32 op, char *rulestr, void **vrule)
 
 	read_lock(&state->ss->policy_rwlock);
 
+	policydb = &state->ss->policy->policydb;
+
 	tmprule->au_seqno = state->ss->latest_granting;
 
 	switch (field) {
@@ -3455,7 +3472,7 @@ int selinux_audit_rule_match(u32 sid, u32 field, u32 op, void *vrule)
 		goto out;
 	}
 
-	ctxt = sidtab_search(state->ss->sidtab, sid);
+	ctxt = sidtab_search(&state->ss->policy->sidtab, sid);
 	if (unlikely(!ctxt)) {
 		WARN_ONCE(1, "selinux_audit_rule_match: unrecognized SID %d\n",
 			  sid);
@@ -3617,8 +3634,8 @@ int security_netlbl_secattr_to_sid(struct selinux_state *state,
 				   struct netlbl_lsm_secattr *secattr,
 				   u32 *sid)
 {
-	struct policydb *policydb = &state->ss->policydb;
-	struct sidtab *sidtab = state->ss->sidtab;
+	struct policydb *policydb;
+	struct sidtab *sidtab;
 	int rc;
 	struct context *ctx;
 	struct context ctx_new;
@@ -3630,6 +3647,9 @@ int security_netlbl_secattr_to_sid(struct selinux_state *state,
 
 	read_lock(&state->ss->policy_rwlock);
 
+	policydb = &state->ss->policy->policydb;
+	sidtab = &state->ss->policy->sidtab;
+
 	if (secattr->flags & NETLBL_SECATTR_CACHE)
 		*sid = *(u32 *)secattr->cache->data;
 	else if (secattr->flags & NETLBL_SECATTR_SECID)
@@ -3686,7 +3706,7 @@ int security_netlbl_secattr_to_sid(struct selinux_state *state,
 int security_netlbl_sid_to_secattr(struct selinux_state *state,
 				   u32 sid, struct netlbl_lsm_secattr *secattr)
 {
-	struct policydb *policydb = &state->ss->policydb;
+	struct policydb *policydb;
 	int rc;
 	struct context *ctx;
 
@@ -3695,8 +3715,10 @@ int security_netlbl_sid_to_secattr(struct selinux_state *state,
 
 	read_lock(&state->ss->policy_rwlock);
 
+	policydb = &state->ss->policy->policydb;
+
 	rc = -ENOENT;
-	ctx = sidtab_search(state->ss->sidtab, sid);
+	ctx = sidtab_search(&state->ss->policy->sidtab, sid);
 	if (ctx == NULL)
 		goto out;
 
@@ -3725,7 +3747,6 @@ int security_netlbl_sid_to_secattr(struct selinux_state *state,
 int security_read_policy(struct selinux_state *state,
 			 void **data, size_t *len)
 {
-	struct policydb *policydb = &state->ss->policydb;
 	int rc;
 	struct policy_file fp;
 
@@ -3742,7 +3763,7 @@ int security_read_policy(struct selinux_state *state,
 	fp.len = *len;
 
 	read_lock(&state->ss->policy_rwlock);
-	rc = policydb_write(policydb, &fp);
+	rc = policydb_write(&state->ss->policy->policydb, &fp);
 	read_unlock(&state->ss->policy_rwlock);
 
 	if (rc)
diff --git a/security/selinux/ss/services.h b/security/selinux/ss/services.h
index a06f3d835216..da673fa38900 100644
--- a/security/selinux/ss/services.h
+++ b/security/selinux/ss/services.h
@@ -22,12 +22,17 @@ struct selinux_map {
 	u16 size; /* array size of mapping */
 };
 
-struct selinux_ss {
-	struct sidtab *sidtab;
+struct selinux_policy {
+	struct sidtab sidtab;
 	struct policydb policydb;
+	struct selinux_map map;
+};
+
+struct selinux_ss {
 	rwlock_t policy_rwlock;
+	struct mutex load_mutex;
 	u32 latest_granting;
-	struct selinux_map map;
+	struct selinux_policy *policy;
 } __randomize_layout;
 
 void services_compute_xperms_drivers(struct extended_perms *xperms,
-- 
2.25.1

