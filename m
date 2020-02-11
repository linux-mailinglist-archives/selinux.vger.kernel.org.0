Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3264015952C
	for <lists+selinux@lfdr.de>; Tue, 11 Feb 2020 17:40:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730863AbgBKQkI (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Tue, 11 Feb 2020 11:40:08 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:20565 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728049AbgBKQkI (ORCPT
        <rfc822;selinux@vger.kernel.org>); Tue, 11 Feb 2020 11:40:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1581439207;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ivWLAFV+jFf4IhyLNgA83S0PkM1TkOuIB0+QEQGZU1w=;
        b=BG3ECn5CsM90oaYT8OyZiVwV+ZPA4X9T9LXfy8jbaUTst6/r1eAZ4MBDVLMEwesIpldwzM
        8J9wmMs+HfH7z6RYTwRS2njdN8dJfo2I29MFvGY1JYpjaassMu8LU9CE3UzDaG/X2L5kpN
        a5hqshDrXgxG7bRxJSe3NJUtA1r+GLQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-77-eg07V3NZMSasjJ_jLoI8pg-1; Tue, 11 Feb 2020 11:40:01 -0500
X-MC-Unique: eg07V3NZMSasjJ_jLoI8pg-1
Received: by mail-wm1-f69.google.com with SMTP id f66so1364970wmf.9
        for <selinux@vger.kernel.org>; Tue, 11 Feb 2020 08:40:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ivWLAFV+jFf4IhyLNgA83S0PkM1TkOuIB0+QEQGZU1w=;
        b=AzYSnlDfNbHfc3ND7230SmkRPvcKMK3YFw0FCrQSxQaNlHC/bOT1yScdc0T+WKcy1J
         kcwIaO6ZgWaBqoVFY0yVyDWODA7SLtj4PnPjuTlu6Hmu0ipqXT4RcLt5cmi6EAvYVfL8
         p23DBYpP2haeDHolyScnuoHfNvTqukUWIWyV/S5vHa+zHPKCZ5X8WyuyjxwiyDg5p8Zn
         1hBPUzxYOH0uYGo6ViSp+HeGwX6/OghdYLxZhG0Fe5QoF5pcuRx87kTuQzTtHT65HFei
         VY6ISu926lHIUIXR1nki3wkDK9CbbpdbazxqB/Xyp9EiZCX+ktHdhz3PFzXdOiFlwysr
         g1Jg==
X-Gm-Message-State: APjAAAWp4GQIpTqp++Cf3eILyibtsuwKFSx/mhQj/AUEfl6AJ2KfM3bJ
        JJRbSMmjFWn/R9/XmjlGamZMA9xRSNOurpFOeuhxJdd9JCvpT3sxy+hCH+qyElD0SmRYtJ5j3a+
        umnTFIjJC7ts/5PmvAQ==
X-Received: by 2002:a1c:98d5:: with SMTP id a204mr6627594wme.181.1581439198127;
        Tue, 11 Feb 2020 08:39:58 -0800 (PST)
X-Google-Smtp-Source: APXvYqwA25f3tH0B/8zNgMlNf+J+mIeAiWrTBQC2gNUmEIB7pGRD8goeOIi8xis7rTBwh/J6H3Q0IA==
X-Received: by 2002:a1c:98d5:: with SMTP id a204mr6627563wme.181.1581439197686;
        Tue, 11 Feb 2020 08:39:57 -0800 (PST)
Received: from omos.redhat.com (nat-pool-brq-t.redhat.com. [213.175.37.10])
        by smtp.gmail.com with ESMTPSA id k10sm5831076wrd.68.2020.02.11.08.39.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2020 08:39:56 -0800 (PST)
From:   Ondrej Mosnacek <omosnace@redhat.com>
To:     selinux@vger.kernel.org, Paul Moore <paul@paul-moore.com>
Cc:     Stephen Smalley <sds@tycho.nsa.gov>
Subject: [PATCH 2/2] selinux: optimize storage of filename transitions
Date:   Tue, 11 Feb 2020 17:39:53 +0100
Message-Id: <20200211163953.12231-3-omosnace@redhat.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200211163953.12231-1-omosnace@redhat.com>
References: <20200211163953.12231-1-omosnace@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

In these rules, each rule with the same (target type, target class,
filename) values is (in practice) always mapped to the same result type.
Therefore, it is much more efficient to group the rules by (ttype,
tclass, filename).

Thus, this patch drops the stype field from the key and changes the
datum to be a linked list of one or more structures that contain a
result type and an ebitmap of source types that map the given target to
the given result type under the given filename. The size of the hash
table is also incremented to 2048 to be more optimal for Fedora policy
(which currently has ~2500 unique (ttype, tclass, filename) tuples,
regardless of whether the 'unconfined' module is enabled).

Not only does this dramtically reduce memory usage when the policy
contains a lot of unconfined domains (ergo a lot of filename based
transitions), but it also slightly reduces memory usage of strongly
confined policies (modeled on Fedora policy with 'unconfined' module
disabled) and significantly reduces lookup times of these rules on
Fedora (roughly matches the performance of the rhashtable conversion
patch [1] posted recently to selinux@vger.kernel.org).

An obvious next step is to change binary policy format to match this
layout, so that disk space is also saved. However, since that requires
more work (including matching userspace changes) and this patch is
already beneficial on its own, I'm posting it separately.

Performance/memory usage comparison:

Kernel           | Policy load | Policy load   | Mem usage | Mem usage     | openbench
                 |             | (-unconfined) |           | (-unconfined) | (createfiles)
-----------------|-------------|---------------|-----------|---------------|--------------
reference        |       1,30s |         0,91s |      90MB |          77MB | 55 us/file
rhashtable patch |       0.98s |         0,85s |      85MB |          75MB | 38 us/file
this patch       |       0,95s |         0,87s |      75MB |          75MB | 40 us/file

(Memory usage is measured after boot. With SELinux disabled the memory
usage was ~60MB on the same system.)

[1] https://lore.kernel.org/selinux/20200116213937.77795-1-dev@lynxeye.de/T/

Signed-off-by: Ondrej Mosnacek <omosnace@redhat.com>
---
 security/selinux/ss/policydb.c | 175 ++++++++++++++++++++-------------
 security/selinux/ss/policydb.h |   8 +-
 security/selinux/ss/services.c |  16 +--
 3 files changed, 120 insertions(+), 79 deletions(-)

diff --git a/security/selinux/ss/policydb.c b/security/selinux/ss/policydb.c
index 981797bfc547..62283033bb7d 100644
--- a/security/selinux/ss/policydb.c
+++ b/security/selinux/ss/policydb.c
@@ -336,11 +336,17 @@ static int (*destroy_f[SYM_NUM]) (void *key, void *datum, void *datap) =
 
 static int filenametr_destroy(void *key, void *datum, void *p)
 {
-	struct filename_trans *ft = key;
+	struct filename_trans_key *ft = key;
+	struct filename_trans_datum *next, *d = datum;
 
 	kfree(ft->name);
 	kfree(key);
-	kfree(datum);
+	do {
+		ebitmap_destroy(&d->stypes);
+		next = d->next;
+		kfree(d);
+		d = next;
+	} while (unlikely(d));
 	cond_resched();
 	return 0;
 }
@@ -406,12 +412,12 @@ out:
 
 static u32 filenametr_hash(struct hashtab *h, const void *k)
 {
-	const struct filename_trans *ft = k;
+	const struct filename_trans_key *ft = k;
 	unsigned long hash;
 	unsigned int byte_num;
 	unsigned char focus;
 
-	hash = ft->stype ^ ft->ttype ^ ft->tclass;
+	hash = ft->ttype ^ ft->tclass;
 
 	byte_num = 0;
 	while ((focus = ft->name[byte_num++]))
@@ -421,14 +427,10 @@ static u32 filenametr_hash(struct hashtab *h, const void *k)
 
 static int filenametr_cmp(struct hashtab *h, const void *k1, const void *k2)
 {
-	const struct filename_trans *ft1 = k1;
-	const struct filename_trans *ft2 = k2;
+	const struct filename_trans_key *ft1 = k1;
+	const struct filename_trans_key *ft2 = k2;
 	int v;
 
-	v = ft1->stype - ft2->stype;
-	if (v)
-		return v;
-
 	v = ft1->ttype - ft2->ttype;
 	if (v)
 		return v;
@@ -495,7 +497,7 @@ static int policydb_init(struct policydb *p)
 		goto out;
 
 	p->filename_trans = hashtab_create(filenametr_hash, filenametr_cmp,
-					   (1 << 10));
+					   (1 << 11));
 	if (!p->filename_trans) {
 		rc = -ENOMEM;
 		goto out;
@@ -1882,64 +1884,93 @@ out:
 
 static int filename_trans_read_one(struct policydb *p, void *fp)
 {
-	struct filename_trans *ft;
-	struct filename_trans_datum *otype = NULL;
+	struct filename_trans_key key, *ft = NULL;
+	struct filename_trans_datum *datum, *last, *newdatum = NULL;
+	uintptr_t stype, otype;
 	char *name = NULL;
 	u32 len;
 	__le32 buf[4];
 	int rc;
-
-	ft = kzalloc(sizeof(*ft), GFP_KERNEL);
-	if (!ft)
-		return -ENOMEM;
-
-	rc = -ENOMEM;
-	otype = kmalloc(sizeof(*otype), GFP_KERNEL);
-	if (!otype)
-		goto out;
+	bool exists;
 
 	/* length of the path component string */
 	rc = next_entry(buf, fp, sizeof(u32));
 	if (rc)
-		goto out;
+		return rc;
 	len = le32_to_cpu(buf[0]);
 
 	/* path component string */
 	rc = str_read(&name, GFP_KERNEL, fp, len);
 	if (rc)
-		goto out;
-
-	ft->name = name;
+		return rc;
 
 	rc = next_entry(buf, fp, sizeof(u32) * 4);
 	if (rc)
 		goto out;
 
-	ft->stype = le32_to_cpu(buf[0]);
-	ft->ttype = le32_to_cpu(buf[1]);
-	ft->tclass = le32_to_cpu(buf[2]);
+	stype = le32_to_cpu(buf[0]);
+	key.ttype = le32_to_cpu(buf[1]);
+	key.tclass = le32_to_cpu(buf[2]);
+	key.name = name;
 
-	otype->otype = le32_to_cpu(buf[3]);
+	otype = le32_to_cpu(buf[3]);
 
-	rc = ebitmap_set_bit(&p->filename_trans_ttypes, ft->ttype, 1);
-	if (rc)
-		goto out;
+	exists = false;
+	last = NULL;
+	datum = hashtab_search(p->filename_trans, &key);
+	while (datum) {
+		if (ebitmap_get_bit(&datum->stypes, stype - 1)) {
+			exists = true;
+			break;
+		}
+		if (datum->otype == otype) {
+			last = NULL;
+			break;
+		}
+		last = datum;
+		datum = datum->next;
+	}
+	if (unlikely(exists))
+		goto out; /* conflicting/duplicate rules are ignored */
+	if (!datum) {
+		rc = -ENOMEM;
+		newdatum = kmalloc(sizeof(*newdatum), GFP_KERNEL);
+		if (!newdatum)
+			goto out;
 
-	rc = hashtab_insert(p->filename_trans, ft, otype);
-	if (rc) {
-		/*
-		 * Do not return -EEXIST to the caller, or the system
-		 * will not boot.
-		 */
-		if (rc == -EEXIST)
-			rc = 0;
-		goto out;
+		ebitmap_init(&newdatum->stypes);
+		newdatum->otype = otype;
+		newdatum->next = NULL;
+
+		if (unlikely(last)) {
+			last->next = newdatum;
+		} else {
+			rc = -ENOMEM;
+			ft = kzalloc(sizeof(*ft), GFP_KERNEL);
+			if (!ft)
+				goto out;
+
+			*ft = key;
+
+			rc = hashtab_insert(p->filename_trans, ft, newdatum);
+			if (rc)
+				goto out;
+			name = NULL;
+
+			rc = ebitmap_set_bit(&p->filename_trans_ttypes,
+					     key.ttype, 1);
+			if (rc)
+				return rc;
+		}
+		datum = newdatum;
 	}
-	return 0;
+	kfree(name);
+	return ebitmap_set_bit(&datum->stypes, stype - 1, 1);
+
 out:
 	kfree(ft);
 	kfree(name);
-	kfree(otype);
+	kfree(newdatum);
 	return rc;
 }
 
@@ -1957,6 +1988,8 @@ static int filename_trans_read(struct policydb *p, void *fp)
 		return rc;
 	nel = le32_to_cpu(buf[0]);
 
+	p->filename_trans_count = nel;
+
 	for (i = 0; i < nel; i++) {
 		rc = filename_trans_read_one(p, fp);
 		if (rc)
@@ -3334,50 +3367,52 @@ static int range_write(struct policydb *p, void *fp)
 
 static int filename_write_helper(void *key, void *data, void *ptr)
 {
-	__le32 buf[4];
-	struct filename_trans *ft = key;
-	struct filename_trans_datum *otype = data;
+	struct filename_trans_key *ft = key;
+	struct filename_trans_datum *datum = data;
 	void *fp = ptr;
+	__le32 buf[4];
 	int rc;
-	u32 len;
+	u32 len, bit;
 
-	len = strlen(ft->name);
-	buf[0] = cpu_to_le32(len);
-	rc = put_entry(buf, sizeof(u32), 1, fp);
-	if (rc)
-		return rc;
+	do {
+		struct ebitmap_node *node;
 
-	rc = put_entry(ft->name, sizeof(char), len, fp);
-	if (rc)
-		return rc;
+		ebitmap_for_each_positive_bit(&datum->stypes, node, bit) {
+			len = strlen(ft->name);
+			buf[0] = cpu_to_le32(len);
+			rc = put_entry(buf, sizeof(u32), 1, fp);
+			if (rc)
+				return rc;
 
-	buf[0] = cpu_to_le32(ft->stype);
-	buf[1] = cpu_to_le32(ft->ttype);
-	buf[2] = cpu_to_le32(ft->tclass);
-	buf[3] = cpu_to_le32(otype->otype);
+			rc = put_entry(ft->name, sizeof(char), len, fp);
+			if (rc)
+				return rc;
 
-	rc = put_entry(buf, sizeof(u32), 4, fp);
-	if (rc)
-		return rc;
+			buf[0] = cpu_to_le32(bit + 1);
+			buf[1] = cpu_to_le32(ft->ttype);
+			buf[2] = cpu_to_le32(ft->tclass);
+			buf[3] = cpu_to_le32(datum->otype);
+
+			rc = put_entry(buf, sizeof(u32), 4, fp);
+			if (rc)
+				return rc;
+		}
+
+		datum = datum->next;
+	} while (unlikely(datum));
 
 	return 0;
 }
 
 static int filename_trans_write(struct policydb *p, void *fp)
 {
-	u32 nel;
 	__le32 buf[1];
 	int rc;
 
 	if (p->policyvers < POLICYDB_VERSION_FILENAME_TRANS)
 		return 0;
 
-	nel = 0;
-	rc = hashtab_map(p->filename_trans, hashtab_cnt, &nel);
-	if (rc)
-		return rc;
-
-	buf[0] = cpu_to_le32(nel);
+	buf[0] = cpu_to_le32(p->filename_trans_count);
 	rc = put_entry(buf, sizeof(u32), 1, fp);
 	if (rc)
 		return rc;
diff --git a/security/selinux/ss/policydb.h b/security/selinux/ss/policydb.h
index 69b24191fa38..a947642816b0 100644
--- a/security/selinux/ss/policydb.h
+++ b/security/selinux/ss/policydb.h
@@ -89,15 +89,16 @@ struct role_trans {
 	struct role_trans *next;
 };
 
-struct filename_trans {
-	u32 stype;		/* current process */
+struct filename_trans_key {
 	u32 ttype;		/* parent dir context */
 	u16 tclass;		/* class of new object */
 	const char *name;	/* last path component */
 };
 
 struct filename_trans_datum {
-	u32 otype;		/* expected of new object */
+	struct ebitmap stypes;	/* bitmap of source types for this otype */
+	u32 otype;		/* resulting type of new object */
+	struct filename_trans_datum *next;	/* record for next otype*/
 };
 
 struct role_allow {
@@ -267,6 +268,7 @@ struct policydb {
 	struct ebitmap filename_trans_ttypes;
 	/* actual set of filename_trans rules */
 	struct hashtab *filename_trans;
+	u32 filename_trans_count;
 
 	/* bools indexed by (value - 1) */
 	struct cond_bool_datum **bool_val_to_struct;
diff --git a/security/selinux/ss/services.c b/security/selinux/ss/services.c
index e310f8ee21a1..83878c3d43a0 100644
--- a/security/selinux/ss/services.c
+++ b/security/selinux/ss/services.c
@@ -1692,8 +1692,8 @@ static void filename_compute_type(struct policydb *policydb,
 				  u32 stype, u32 ttype, u16 tclass,
 				  const char *objname)
 {
-	struct filename_trans ft;
-	struct filename_trans_datum *otype;
+	struct filename_trans_key ft;
+	struct filename_trans_datum *datum;
 
 	/*
 	 * Most filename trans rules are going to live in specific directories
@@ -1703,14 +1703,18 @@ static void filename_compute_type(struct policydb *policydb,
 	if (!ebitmap_get_bit(&policydb->filename_trans_ttypes, ttype))
 		return;
 
-	ft.stype = stype;
 	ft.ttype = ttype;
 	ft.tclass = tclass;
 	ft.name = objname;
 
-	otype = hashtab_search(policydb->filename_trans, &ft);
-	if (otype)
-		newcontext->type = otype->otype;
+	datum = hashtab_search(policydb->filename_trans, &ft);
+	while (datum) {
+		if (ebitmap_get_bit(&datum->stypes, stype - 1)) {
+			newcontext->type = datum->otype;
+			return;
+		}
+		datum = datum->next;
+	}
 }
 
 static int security_compute_sid(struct selinux_state *state,
-- 
2.24.1

