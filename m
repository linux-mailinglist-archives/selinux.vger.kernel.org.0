Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E41C635652E
	for <lists+selinux@lfdr.de>; Wed,  7 Apr 2021 09:24:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244276AbhDGHZB (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Wed, 7 Apr 2021 03:25:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60642 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238957AbhDGHZB (ORCPT
        <rfc822;selinux@vger.kernel.org>); Wed, 7 Apr 2021 03:25:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1617780291;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=Zkhuq+QBQU/X6QfX5c+KQLlF96zyYiY6iM9qgAM9DH0=;
        b=YGhl9BoftDPSYEUEGzWYOqyq+LLpxFiZMuwVvkMHUUm+ym9eomhDTuXZO29RcozpM5+zLK
        rMrcBrhmZ0WSwprsKMs2oqdOavNRDPflIwsbeCPfc6DNSrmqMQgA8aED1vwCuEaYtLlulj
        Ztwntoyh7xaajTjzlmfr2rGcIk0qMLw=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-170-v-OhgwCKO3uDI7D5qAtiSg-1; Wed, 07 Apr 2021 03:24:49 -0400
X-MC-Unique: v-OhgwCKO3uDI7D5qAtiSg-1
Received: by mail-ej1-f70.google.com with SMTP id dv7so3528132ejb.22
        for <selinux@vger.kernel.org>; Wed, 07 Apr 2021 00:24:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Zkhuq+QBQU/X6QfX5c+KQLlF96zyYiY6iM9qgAM9DH0=;
        b=BfJjPfHw82J+iJ7kFunxMnWoD00tniPzwqXSewYztiCyIFkkN6zy4gIwuAqhANreTA
         p7ZViLM2O3RhAbMqQgN34Mg4BW2jvrLNFUa7q5U4cyWjLWhnwFL8Lvo/hobCvtXQ/3L4
         Eedoju6zj70R8+OzoUIHmwZz1mWle50W8kAtaZcX3P6NVBLCz3F4o8Q9XUvCcUMZlAoZ
         aozQXggNhjh5U/dPO1gM+0KIaiLelpe1Z6NJDzA8dMsUMe+R9MzUwUOdMWrBBcskk1SC
         n0NbKMiH0AtVk6ekp0wprH+K5VQ/v2J7k4mrZmemGjO+8hXnRh72mERFV3v6Qbi9iLAe
         FN1g==
X-Gm-Message-State: AOAM53113Gomb3J/vfm+ufT8m1muuBJ/LxNY2kSz+C2DHnkijtLe9NwU
        QwPYLNLCS/wjFmI/r7kOwUuRmMPnBK3YcffWByUoj2uiff44978Kun2zfUIbqZk6+px8uhT3FMX
        ltYXwYai+m66Lo95ou/Z1eqRgXLKNyvSPOueTl3ijRJQnqWkXaTUfPs7Y2R9ap9UepNS4fQ==
X-Received: by 2002:a17:907:a06b:: with SMTP id ia11mr2110973ejc.294.1617780287669;
        Wed, 07 Apr 2021 00:24:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxvImAbcKTeTKHAqWu+eRzlzhqs1blzlEqUop1CGQTG/XBJKmwlNW6O8+bxuPz2gQ5wts7CBA==
X-Received: by 2002:a17:907:a06b:: with SMTP id ia11mr2110946ejc.294.1617780287300;
        Wed, 07 Apr 2021 00:24:47 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8308:b105:dd00:277b:6436:24db:9466])
        by smtp.gmail.com with ESMTPSA id g21sm12196835ejd.6.2021.04.07.00.24.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Apr 2021 00:24:46 -0700 (PDT)
From:   Ondrej Mosnacek <omosnace@redhat.com>
To:     selinux@vger.kernel.org, Paul Moore <paul@paul-moore.com>
Cc:     Stephen Smalley <stephen.smalley.work@gmail.com>
Subject: [PATCH v3] selinux: fix race between old and new sidtab
Date:   Wed,  7 Apr 2021 09:24:43 +0200
Message-Id: <20210407072443.2698107-1-omosnace@redhat.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Since commit 1b8b31a2e612 ("selinux: convert policy read-write lock to
RCU"), there is a small window during policy load where the new policy
pointer has already been installed, but some threads may still be
holding the old policy pointer in their read-side RCU critical sections.
This means that there may be conflicting attempts to add a new SID entry
to both tables via sidtab_context_to_sid().

See also (and the rest of the thread):
https://lore.kernel.org/selinux/CAFqZXNvfux46_f8gnvVvRYMKoes24nwm2n3sPbMjrB8vKTW00g@mail.gmail.com/

Fix this by installing the new policy pointer under the old sidtab's
spinlock along with marking the old sidtab as "frozen". Then, if an
attempt to add new entry to a "frozen" sidtab is detected, make
sidtab_context_to_sid() return -ESTALE to indicate that a new policy
has been installed and that the caller will have to abort the policy
transaction and try again after re-taking the policy pointer (which is
guaranteed to be a newer policy). This requires adding a retry-on-ESTALE
logic to all callers of sidtab_context_to_sid(), but fortunately these
are easy to determine and aren't that many.

This seems to be the simplest solution for this problem, even if it
looks somewhat ugly. Note that other places in the kernel (e.g.
do_mknodat() in fs/namei.c) use similar stale-retry patterns, so I think
it's reasonable.

Fixes: 1b8b31a2e612 ("selinux: convert policy read-write lock to RCU")
Signed-off-by: Ondrej Mosnacek <omosnace@redhat.com>
---

v3: correctly handle initial allocation in security_get_user_sids()
v2: reset cladatum to NULL on retry in security_compute_sid()

 security/selinux/ss/services.c | 157 +++++++++++++++++++++++++--------
 security/selinux/ss/sidtab.c   |  21 +++++
 security/selinux/ss/sidtab.h   |   4 +
 3 files changed, 145 insertions(+), 37 deletions(-)

diff --git a/security/selinux/ss/services.c b/security/selinux/ss/services.c
index 08ac1d01c743..f0ba82611343 100644
--- a/security/selinux/ss/services.c
+++ b/security/selinux/ss/services.c
@@ -1552,6 +1552,7 @@ static int security_context_to_sid_core(struct selinux_state *state,
 		if (!str)
 			goto out;
 	}
+retry:
 	rcu_read_lock();
 	policy = rcu_dereference(state->policy);
 	policydb = &policy->policydb;
@@ -1565,6 +1566,15 @@ static int security_context_to_sid_core(struct selinux_state *state,
 	} else if (rc)
 		goto out_unlock;
 	rc = sidtab_context_to_sid(sidtab, &context, sid);
+	if (rc == -ESTALE) {
+		rcu_read_unlock();
+		if (context.str) {
+			str = context.str;
+			context.str = NULL;
+		}
+		context_destroy(&context);
+		goto retry;
+	}
 	context_destroy(&context);
 out_unlock:
 	rcu_read_unlock();
@@ -1714,7 +1724,7 @@ static int security_compute_sid(struct selinux_state *state,
 	struct selinux_policy *policy;
 	struct policydb *policydb;
 	struct sidtab *sidtab;
-	struct class_datum *cladatum = NULL;
+	struct class_datum *cladatum;
 	struct context *scontext, *tcontext, newcontext;
 	struct sidtab_entry *sentry, *tentry;
 	struct avtab_key avkey;
@@ -1736,6 +1746,8 @@ static int security_compute_sid(struct selinux_state *state,
 		goto out;
 	}
 
+retry:
+	cladatum = NULL;
 	context_init(&newcontext);
 
 	rcu_read_lock();
@@ -1880,6 +1892,11 @@ static int security_compute_sid(struct selinux_state *state,
 	}
 	/* Obtain the sid for the context. */
 	rc = sidtab_context_to_sid(sidtab, &newcontext, out_sid);
+	if (rc == -ESTALE) {
+		rcu_read_unlock();
+		context_destroy(&newcontext);
+		goto retry;
+	}
 out_unlock:
 	rcu_read_unlock();
 	context_destroy(&newcontext);
@@ -2192,6 +2209,7 @@ void selinux_policy_commit(struct selinux_state *state,
 			   struct selinux_load_state *load_state)
 {
 	struct selinux_policy *oldpolicy, *newpolicy = load_state->policy;
+	unsigned long flags;
 	u32 seqno;
 
 	oldpolicy = rcu_dereference_protected(state->policy,
@@ -2213,7 +2231,13 @@ void selinux_policy_commit(struct selinux_state *state,
 	seqno = newpolicy->latest_granting;
 
 	/* Install the new policy. */
-	rcu_assign_pointer(state->policy, newpolicy);
+	if (oldpolicy) {
+		sidtab_freeze_begin(oldpolicy->sidtab, &flags);
+		rcu_assign_pointer(state->policy, newpolicy);
+		sidtab_freeze_end(oldpolicy->sidtab, &flags);
+	} else {
+		rcu_assign_pointer(state->policy, newpolicy);
+	}
 
 	/* Load the policycaps from the new policy */
 	security_load_policycaps(state, newpolicy);
@@ -2357,13 +2381,15 @@ int security_port_sid(struct selinux_state *state,
 	struct policydb *policydb;
 	struct sidtab *sidtab;
 	struct ocontext *c;
-	int rc = 0;
+	int rc;
 
 	if (!selinux_initialized(state)) {
 		*out_sid = SECINITSID_PORT;
 		return 0;
 	}
 
+retry:
+	rc = 0;
 	rcu_read_lock();
 	policy = rcu_dereference(state->policy);
 	policydb = &policy->policydb;
@@ -2382,6 +2408,10 @@ int security_port_sid(struct selinux_state *state,
 		if (!c->sid[0]) {
 			rc = sidtab_context_to_sid(sidtab, &c->context[0],
 						   &c->sid[0]);
+			if (rc == -ESTALE) {
+				rcu_read_unlock();
+				goto retry;
+			}
 			if (rc)
 				goto out;
 		}
@@ -2408,13 +2438,15 @@ int security_ib_pkey_sid(struct selinux_state *state,
 	struct policydb *policydb;
 	struct sidtab *sidtab;
 	struct ocontext *c;
-	int rc = 0;
+	int rc;
 
 	if (!selinux_initialized(state)) {
 		*out_sid = SECINITSID_UNLABELED;
 		return 0;
 	}
 
+retry:
+	rc = 0;
 	rcu_read_lock();
 	policy = rcu_dereference(state->policy);
 	policydb = &policy->policydb;
@@ -2435,6 +2467,10 @@ int security_ib_pkey_sid(struct selinux_state *state,
 			rc = sidtab_context_to_sid(sidtab,
 						   &c->context[0],
 						   &c->sid[0]);
+			if (rc == -ESTALE) {
+				rcu_read_unlock();
+				goto retry;
+			}
 			if (rc)
 				goto out;
 		}
@@ -2460,13 +2496,15 @@ int security_ib_endport_sid(struct selinux_state *state,
 	struct policydb *policydb;
 	struct sidtab *sidtab;
 	struct ocontext *c;
-	int rc = 0;
+	int rc;
 
 	if (!selinux_initialized(state)) {
 		*out_sid = SECINITSID_UNLABELED;
 		return 0;
 	}
 
+retry:
+	rc = 0;
 	rcu_read_lock();
 	policy = rcu_dereference(state->policy);
 	policydb = &policy->policydb;
@@ -2487,6 +2525,10 @@ int security_ib_endport_sid(struct selinux_state *state,
 		if (!c->sid[0]) {
 			rc = sidtab_context_to_sid(sidtab, &c->context[0],
 						   &c->sid[0]);
+			if (rc == -ESTALE) {
+				rcu_read_unlock();
+				goto retry;
+			}
 			if (rc)
 				goto out;
 		}
@@ -2510,7 +2552,7 @@ int security_netif_sid(struct selinux_state *state,
 	struct selinux_policy *policy;
 	struct policydb *policydb;
 	struct sidtab *sidtab;
-	int rc = 0;
+	int rc;
 	struct ocontext *c;
 
 	if (!selinux_initialized(state)) {
@@ -2518,6 +2560,8 @@ int security_netif_sid(struct selinux_state *state,
 		return 0;
 	}
 
+retry:
+	rc = 0;
 	rcu_read_lock();
 	policy = rcu_dereference(state->policy);
 	policydb = &policy->policydb;
@@ -2534,10 +2578,18 @@ int security_netif_sid(struct selinux_state *state,
 		if (!c->sid[0] || !c->sid[1]) {
 			rc = sidtab_context_to_sid(sidtab, &c->context[0],
 						   &c->sid[0]);
+			if (rc == -ESTALE) {
+				rcu_read_unlock();
+				goto retry;
+			}
 			if (rc)
 				goto out;
 			rc = sidtab_context_to_sid(sidtab, &c->context[1],
 						   &c->sid[1]);
+			if (rc == -ESTALE) {
+				rcu_read_unlock();
+				goto retry;
+			}
 			if (rc)
 				goto out;
 		}
@@ -2587,6 +2639,7 @@ int security_node_sid(struct selinux_state *state,
 		return 0;
 	}
 
+retry:
 	rcu_read_lock();
 	policy = rcu_dereference(state->policy);
 	policydb = &policy->policydb;
@@ -2635,6 +2688,10 @@ int security_node_sid(struct selinux_state *state,
 			rc = sidtab_context_to_sid(sidtab,
 						   &c->context[0],
 						   &c->sid[0]);
+			if (rc == -ESTALE) {
+				rcu_read_unlock();
+				goto retry;
+			}
 			if (rc)
 				goto out;
 		}
@@ -2676,18 +2733,24 @@ int security_get_user_sids(struct selinux_state *state,
 	struct sidtab *sidtab;
 	struct context *fromcon, usercon;
 	u32 *mysids = NULL, *mysids2, sid;
-	u32 mynel = 0, maxnel = SIDS_NEL;
+	u32 i, j, mynel, maxnel = SIDS_NEL;
 	struct user_datum *user;
 	struct role_datum *role;
 	struct ebitmap_node *rnode, *tnode;
-	int rc = 0, i, j;
+	int rc;
 
 	*sids = NULL;
 	*nel = 0;
 
 	if (!selinux_initialized(state))
-		goto out;
+		return 0;
+
+	mysids = kcalloc(maxnel, sizeof(*mysids), GFP_KERNEL);
+	if (!mysids)
+		return -ENOMEM;
 
+retry:
+	mynel = 0;
 	rcu_read_lock();
 	policy = rcu_dereference(state->policy);
 	policydb = &policy->policydb;
@@ -2707,11 +2770,6 @@ int security_get_user_sids(struct selinux_state *state,
 
 	usercon.user = user->value;
 
-	rc = -ENOMEM;
-	mysids = kcalloc(maxnel, sizeof(*mysids), GFP_ATOMIC);
-	if (!mysids)
-		goto out_unlock;
-
 	ebitmap_for_each_positive_bit(&user->roles, rnode, i) {
 		role = policydb->role_val_to_struct[i];
 		usercon.role = i + 1;
@@ -2723,6 +2781,10 @@ int security_get_user_sids(struct selinux_state *state,
 				continue;
 
 			rc = sidtab_context_to_sid(sidtab, &usercon, &sid);
+			if (rc == -ESTALE) {
+				rcu_read_unlock();
+				goto retry;
+			}
 			if (rc)
 				goto out_unlock;
 			if (mynel < maxnel) {
@@ -2745,14 +2807,14 @@ out_unlock:
 	rcu_read_unlock();
 	if (rc || !mynel) {
 		kfree(mysids);
-		goto out;
+		return rc;
 	}
 
 	rc = -ENOMEM;
 	mysids2 = kcalloc(mynel, sizeof(*mysids2), GFP_KERNEL);
 	if (!mysids2) {
 		kfree(mysids);
-		goto out;
+		return rc;
 	}
 	for (i = 0, j = 0; i < mynel; i++) {
 		struct av_decision dummy_avd;
@@ -2765,12 +2827,10 @@ out_unlock:
 			mysids2[j++] = mysids[i];
 		cond_resched();
 	}
-	rc = 0;
 	kfree(mysids);
 	*sids = mysids2;
 	*nel = j;
-out:
-	return rc;
+	return 0;
 }
 
 /**
@@ -2783,6 +2843,9 @@ out:
  * Obtain a SID to use for a file in a filesystem that
  * cannot support xattr or use a fixed labeling behavior like
  * transition SIDs or task SIDs.
+ *
+ * WARNING: This function may return -ESTALE, indicating that the caller
+ * must retry the operation after re-acquiring the policy pointer!
  */
 static inline int __security_genfs_sid(struct selinux_policy *policy,
 				       const char *fstype,
@@ -2861,11 +2924,13 @@ int security_genfs_sid(struct selinux_state *state,
 		return 0;
 	}
 
-	rcu_read_lock();
-	policy = rcu_dereference(state->policy);
-	retval = __security_genfs_sid(policy,
-				fstype, path, orig_sclass, sid);
-	rcu_read_unlock();
+	do {
+		rcu_read_lock();
+		policy = rcu_dereference(state->policy);
+		retval = __security_genfs_sid(policy, fstype, path,
+					      orig_sclass, sid);
+		rcu_read_unlock();
+	} while (retval == -ESTALE);
 	return retval;
 }
 
@@ -2888,7 +2953,7 @@ int security_fs_use(struct selinux_state *state, struct super_block *sb)
 	struct selinux_policy *policy;
 	struct policydb *policydb;
 	struct sidtab *sidtab;
-	int rc = 0;
+	int rc;
 	struct ocontext *c;
 	struct superblock_security_struct *sbsec = sb->s_security;
 	const char *fstype = sb->s_type->name;
@@ -2899,6 +2964,8 @@ int security_fs_use(struct selinux_state *state, struct super_block *sb)
 		return 0;
 	}
 
+retry:
+	rc = 0;
 	rcu_read_lock();
 	policy = rcu_dereference(state->policy);
 	policydb = &policy->policydb;
@@ -2916,6 +2983,10 @@ int security_fs_use(struct selinux_state *state, struct super_block *sb)
 		if (!c->sid[0]) {
 			rc = sidtab_context_to_sid(sidtab, &c->context[0],
 						   &c->sid[0]);
+			if (rc == -ESTALE) {
+				rcu_read_unlock();
+				goto retry;
+			}
 			if (rc)
 				goto out;
 		}
@@ -2923,6 +2994,10 @@ int security_fs_use(struct selinux_state *state, struct super_block *sb)
 	} else {
 		rc = __security_genfs_sid(policy, fstype, "/",
 					SECCLASS_DIR, &sbsec->sid);
+		if (rc == -ESTALE) {
+			rcu_read_unlock();
+			goto retry;
+		}
 		if (rc) {
 			sbsec->behavior = SECURITY_FS_USE_NONE;
 			rc = 0;
@@ -3132,12 +3207,13 @@ int security_sid_mls_copy(struct selinux_state *state,
 	u32 len;
 	int rc;
 
-	rc = 0;
 	if (!selinux_initialized(state)) {
 		*new_sid = sid;
-		goto out;
+		return 0;
 	}
 
+retry:
+	rc = 0;
 	context_init(&newcon);
 
 	rcu_read_lock();
@@ -3196,10 +3272,14 @@ int security_sid_mls_copy(struct selinux_state *state,
 		}
 	}
 	rc = sidtab_context_to_sid(sidtab, &newcon, new_sid);
+	if (rc == -ESTALE) {
+		rcu_read_unlock();
+		context_destroy(&newcon);
+		goto retry;
+	}
 out_unlock:
 	rcu_read_unlock();
 	context_destroy(&newcon);
-out:
 	return rc;
 }
 
@@ -3792,6 +3872,8 @@ int security_netlbl_secattr_to_sid(struct selinux_state *state,
 		return 0;
 	}
 
+retry:
+	rc = 0;
 	rcu_read_lock();
 	policy = rcu_dereference(state->policy);
 	policydb = &policy->policydb;
@@ -3818,23 +3900,24 @@ int security_netlbl_secattr_to_sid(struct selinux_state *state,
 				goto out;
 		}
 		rc = -EIDRM;
-		if (!mls_context_isvalid(policydb, &ctx_new))
-			goto out_free;
+		if (!mls_context_isvalid(policydb, &ctx_new)) {
+			ebitmap_destroy(&ctx_new.range.level[0].cat);
+			goto out;
+		}
 
 		rc = sidtab_context_to_sid(sidtab, &ctx_new, sid);
+		ebitmap_destroy(&ctx_new.range.level[0].cat);
+		if (rc == -ESTALE) {
+			rcu_read_unlock();
+			goto retry;
+		}
 		if (rc)
-			goto out_free;
+			goto out;
 
 		security_netlbl_cache_add(secattr, *sid);
-
-		ebitmap_destroy(&ctx_new.range.level[0].cat);
 	} else
 		*sid = SECSID_NULL;
 
-	rcu_read_unlock();
-	return 0;
-out_free:
-	ebitmap_destroy(&ctx_new.range.level[0].cat);
 out:
 	rcu_read_unlock();
 	return rc;
diff --git a/security/selinux/ss/sidtab.c b/security/selinux/ss/sidtab.c
index 5ee190bd30f5..656d50b09f76 100644
--- a/security/selinux/ss/sidtab.c
+++ b/security/selinux/ss/sidtab.c
@@ -39,6 +39,7 @@ int sidtab_init(struct sidtab *s)
 	for (i = 0; i < SECINITSID_NUM; i++)
 		s->isids[i].set = 0;
 
+	s->frozen = false;
 	s->count = 0;
 	s->convert = NULL;
 	hash_init(s->context_to_sid);
@@ -281,6 +282,15 @@ int sidtab_context_to_sid(struct sidtab *s, struct context *context,
 	if (*sid)
 		goto out_unlock;
 
+	if (unlikely(s->frozen)) {
+		/*
+		 * This sidtab is now frozen - tell the caller to abort and
+		 * get the new one.
+		 */
+		rc = -ESTALE;
+		goto out_unlock;
+	}
+
 	count = s->count;
 	convert = s->convert;
 
@@ -474,6 +484,17 @@ void sidtab_cancel_convert(struct sidtab *s)
 	spin_unlock_irqrestore(&s->lock, flags);
 }
 
+void sidtab_freeze_begin(struct sidtab *s, unsigned long *flags) __acquires(&s->lock)
+{
+	spin_lock_irqsave(&s->lock, *flags);
+	s->frozen = true;
+	s->convert = NULL;
+}
+void sidtab_freeze_end(struct sidtab *s, unsigned long *flags) __releases(&s->lock)
+{
+	spin_unlock_irqrestore(&s->lock, *flags);
+}
+
 static void sidtab_destroy_entry(struct sidtab_entry *entry)
 {
 	context_destroy(&entry->context);
diff --git a/security/selinux/ss/sidtab.h b/security/selinux/ss/sidtab.h
index 80c744d07ad6..4eff0e49dcb2 100644
--- a/security/selinux/ss/sidtab.h
+++ b/security/selinux/ss/sidtab.h
@@ -86,6 +86,7 @@ struct sidtab {
 	u32 count;
 	/* access only under spinlock */
 	struct sidtab_convert_params *convert;
+	bool frozen;
 	spinlock_t lock;
 
 #if CONFIG_SECURITY_SELINUX_SID2STR_CACHE_SIZE > 0
@@ -125,6 +126,9 @@ int sidtab_convert(struct sidtab *s, struct sidtab_convert_params *params);
 
 void sidtab_cancel_convert(struct sidtab *s);
 
+void sidtab_freeze_begin(struct sidtab *s, unsigned long *flags) __acquires(&s->lock);
+void sidtab_freeze_end(struct sidtab *s, unsigned long *flags) __releases(&s->lock);
+
 int sidtab_context_to_sid(struct sidtab *s, struct context *context, u32 *sid);
 
 void sidtab_destroy(struct sidtab *s);
-- 
2.30.2

