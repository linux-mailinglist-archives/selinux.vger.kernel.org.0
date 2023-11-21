Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC4257F2D33
	for <lists+selinux@lfdr.de>; Tue, 21 Nov 2023 13:29:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234658AbjKUM3J (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Tue, 21 Nov 2023 07:29:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234682AbjKUM3J (ORCPT
        <rfc822;selinux@vger.kernel.org>); Tue, 21 Nov 2023 07:29:09 -0500
Received: from sender11-of-o52.zoho.eu (sender11-of-o52.zoho.eu [31.186.226.238])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34CDFE7
        for <selinux@vger.kernel.org>; Tue, 21 Nov 2023 04:29:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700569739; cv=none; 
        d=zohomail.eu; s=zohoarc; 
        b=eZstjdgG+tYzeTTFUOGyXciAKWXAqSUFLXcAjrGhQbMCPuk4G39C+hLsFDd6+kVaRe3Xm0D7B37JtQ9vGBw4t8cHrSWKxvoT1Zc2M/zFgvRC51zEFjmrHti94FdwgMyWVbkgaSBiWc3r9SrTcym9edXjgAaXf22D9BVGg+P1P+o=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
        t=1700569739; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
        bh=7cJ5Cn6sUm35BGWcch34HnS4VTetIOZkxrqyMs4OQgY=; 
        b=gzlk7bfdWpjeAfcFheANSNg1CRUG3kmWVLIn+PfWCsqVnK3NCX1kAvkEVEm8adHOmz/cDE2NTnw5TEGXlvvGpUcy9yG3/uzWLwz2ag19nFWQH1J76XEhtVxTDEzgOi/3L9mnXjTyCn5jxjSeypBdCUKoON8AzBp73WzbTs3zxw0=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
        dkim=pass  header.i=jurajmarcin.com;
        spf=pass  smtp.mailfrom=juraj@jurajmarcin.com;
        dmarc=pass header.from=<juraj@jurajmarcin.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1700569739;
        s=zoho; d=jurajmarcin.com; i=juraj@jurajmarcin.com;
        h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
        bh=7cJ5Cn6sUm35BGWcch34HnS4VTetIOZkxrqyMs4OQgY=;
        b=Q9dR4IIjuib40/zpgaX09MkBT89eWg54pjtzmSR/aTHuIudWmKCTXu4H16AzS4iX
        hUHy0iqNFMO9W/Or8mFi2EdRzcQp5Ck87yEv59JtpODW5RMumijPaL8EpSBB8Es/j83
        ibtBnM8gcBkk4m9Wx86jHliAuZeZoGLbH34m4UnI=
Received: from morty01.jurajmarcin.com (129.159.244.31 [129.159.244.31]) by mx.zoho.eu
        with SMTPS id 1700569737433173.45758195924896; Tue, 21 Nov 2023 13:28:57 +0100 (CET)
Received: from jmarcin-t14s-01.redhat.com (unknown [213.175.37.12])
        by morty01.jurajmarcin.com (Postfix) with ESMTPSA id F196820890FD;
        Tue, 21 Nov 2023 12:28:55 +0000 (UTC)
From:   Juraj Marcin <juraj@jurajmarcin.com>
To:     Paul Moore <paul@paul-moore.com>
Cc:     Stephen Smalley <stephen.smalley.work@gmail.com>,
        selinux@vger.kernel.org, Ondrej Mosnacek <omosnace@redhat.com>
Subject: [PATCH v4] selinux: add prefix/suffix matching to filename type transitions
Date:   Tue, 21 Nov 2023 13:27:15 +0100
Message-ID: <20231121122719.2332137-1-juraj@jurajmarcin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Currently, filename transitions are stored separately from other type
enforcement rules and only support exact name matching. However, in
practice, the names contain variable parts. This leads to many
duplicated rules in the policy that differ only in the part of the name,
or it is even impossible to cover all possible combinations.

This patch changes the filename transition table in the policydb
structure into an array of three tables, where the index determines the
match type for the rules contained (extract, prefix, and suffix match).
Then the patch extends the functions that access the table through the
policydb structure to accompany this change while reusing the majority
of the old filename transitions code.

This patch also updates the code responsible for finding the right
filename transition based on the context and the name. The rules have
the following order of prioriy, if no matching rule is found, the code
moves on to the next category:
- exact filename transitions,
- prefix filename transitions in the order of the longest prefix match,
- suffix filename transitions in the order of the longest suffix match.
This ensures the compatibility with older policies.

Without prefix/suffix rules in the policy, this patch has no impact on
performance or policy loading times. Moreover, with prefix/suffix rules,
the overall number of filename transitions can be reduced, which results
in smaller binary policy size and therefore also slightly lower load
time and memory usage.

Performance tests:

1: Reference kernel (f5bbdeda34c63), Fedora policy (format v33)
2: This patch, Fedora policy (format v33)
3: This patch, Fedora policy without prefix/suffix rules (format v34)
4: This patch, Fefora policy with prefix rules (format v35)

   | Mem    | Binary | Policy  | Create tty [1]       | osbench [2]
   | Usage  | policy | load    |                      | create
   |        | size   | time    | (ms/file)            | files
   | (MiB)  | (KiB)  | (ms)    | real     | kernel    | (us/file)
---+--------+--------+---------+----------+-----------+-----------
 1 |  298.7 |   3682 |  58.626 |   1.0228 |    0.6793 |    8.4916
   | sd=3D4.1 |        | sd=3D0.47 | sd=3D0.058 | sd=3D0.0497 |  sd=3D0.1=
31
 2 |  296.3 |   3682 |  58.915 |   1.0209 |    0.6752 |    8.5728
   | sd=3D3.9 |        | sd=3D0.28 | sd=3D0.021 | sd=3D0.0244 |  sd=3D0.1=
56
 3 |  295.7 |   3682 |  56.374 |   1.0160 |    0.6616 |    8.7467
   | sd=3D2.6 |        | sd=3D0.44 | sd=3D0.008 | sd=3D0.0141 |  sd=3D0.1=
26
 4 |  296.2 |   2585 |  51.434 |   1.0116 |    0.6699 |    8.7467
   | sd=3D4.1 |        | sd=3D0.39 | sd=3D0.012 | sd=3D0.0115 |  sd=3D0.1=
26

[1] Create test_tty benchmark:

    mknod /dev/test_tty c 4 1
    time for i in `seq 1 10000`; do
        mknod /dev/test_tty$i c 4 1
    done

This benchmark should simulate the worst case scenario as many filename
transitions affect files created in the /dev directory.

[2] https://github.com/mbitsnbites/osbench

Reviewed-by: Ondrej Mosnacek <omosnace@redhat.com>
Signed-off-by: Juraj Marcin <juraj@jurajmarcin.com>
---
v4:
- rebased to the latest pcmoore/selinux/next
- fixed non-atomic allocation in atomic section
---
v3:
- reworked the solution from scratch, this time only adding the
  prefix/suffix matching feature without moving filename transition
  rules to the avtab
---
 security/selinux/include/security.h |  3 +-
 security/selinux/ss/policydb.c      | 96 ++++++++++++++++++++++-------
 security/selinux/ss/policydb.h      | 12 +++-
 security/selinux/ss/services.c      | 57 ++++++++++++++---
 4 files changed, 134 insertions(+), 34 deletions(-)

diff --git a/security/selinux/include/security.h b/security/selinux/inclu=
de/security.h
index a9de89af8fdc..943dfe7ede83 100644
--- a/security/selinux/include/security.h
+++ b/security/selinux/include/security.h
@@ -46,10 +46,11 @@
 #define POLICYDB_VERSION_INFINIBAND		31
 #define POLICYDB_VERSION_GLBLUB		32
 #define POLICYDB_VERSION_COMP_FTRANS	33 /* compressed filename transitio=
ns */
+#define POLICYDB_VERSION_PREFIX_SUFFIX	34 /* prefix/suffix filename tran=
sitions */
=20
 /* Range of policy versions we understand*/
 #define POLICYDB_VERSION_MIN   POLICYDB_VERSION_BASE
-#define POLICYDB_VERSION_MAX   POLICYDB_VERSION_COMP_FTRANS
+#define POLICYDB_VERSION_MAX   POLICYDB_VERSION_PREFIX_SUFFIX
=20
 /* Mask for just the mount related flags */
 #define SE_MNTMASK	0x0f
diff --git a/security/selinux/ss/policydb.c b/security/selinux/ss/policyd=
b.c
index bd1e7f26d951..562eaa70fb12 100644
--- a/security/selinux/ss/policydb.c
+++ b/security/selinux/ss/policydb.c
@@ -157,6 +157,11 @@ static const struct policydb_compat_info policydb_co=
mpat[] =3D {
 		.sym_num	=3D SYM_NUM,
 		.ocon_num	=3D OCON_NUM,
 	},
+	{
+		.version	=3D POLICYDB_VERSION_PREFIX_SUFFIX,
+		.sym_num	=3D SYM_NUM,
+		.ocon_num	=3D OCON_NUM,
+	},
 };
=20
 static const struct policydb_compat_info *policydb_lookup_compat(unsigne=
d int version)
@@ -437,10 +442,33 @@ static const struct hashtab_key_params filenametr_k=
ey_params =3D {
 	.cmp =3D filenametr_cmp,
 };
=20
-struct filename_trans_datum *policydb_filenametr_search(
-	struct policydb *p, struct filename_trans_key *key)
+/**
+ * policydb_filenametr_search() - Search for filename transition in poli=
cy
+ * @p: policydb structure to search in
+ * @match_type: filename transition match type to search for
+ * @key: key to search for
+ * @stype: source type to search for, when stype is zero, the function w=
ill
+ *         return head of the linked list with matching key, otherwise i=
t will
+ *         traverse the linked list to find the item with matching stype
+ *
+ * Return: head of the linked list of filename transition datums or sing=
le item
+ * 	   of the list, based on the stype value
+ */
+struct filename_trans_datum *policydb_filenametr_search(struct policydb =
*p,
+	unsigned int match_type, struct filename_trans_key *key, u32 stype)
 {
-	return hashtab_search(&p->filename_trans, key, filenametr_key_params);
+	struct filename_trans_datum *datum =3D hashtab_search(
+		&p->filename_trans[match_type], key, filenametr_key_params);
+
+	if (stype) {
+		while (datum) {
+			if (ebitmap_get_bit(&datum->stypes, stype - 1)) {
+				return datum;
+			}
+			datum =3D datum->next;
+		}
+	}
+	return datum;
 }
=20
 static u32 rangetr_hash(const void *k)
@@ -833,8 +861,10 @@ void policydb_destroy(struct policydb *p)
 	}
 	kfree(lra);
=20
-	hashtab_map(&p->filename_trans, filenametr_destroy, NULL);
-	hashtab_destroy(&p->filename_trans);
+	for (unsigned int i =3D 0; i < FILENAME_TRANS_MATCH_NUM; i++) {
+		hashtab_map(&p->filename_trans[i], filenametr_destroy, NULL);
+		hashtab_destroy(&p->filename_trans[i]);
+	}
=20
 	hashtab_map(&p->range_tr, range_tr_destroy, NULL);
 	hashtab_destroy(&p->range_tr);
@@ -1909,7 +1939,9 @@ static int filename_trans_read_helper_compat(struct=
 policydb *p, void *fp)
 	otype =3D le32_to_cpu(buf[3]);
=20
 	last =3D NULL;
-	datum =3D policydb_filenametr_search(p, &key);
+	// this version does not support other than exact match
+	datum =3D policydb_filenametr_search(p, FILENAME_TRANS_MATCH_EXACT, &ke=
y,
+					   0);
 	while (datum) {
 		if (unlikely(ebitmap_get_bit(&datum->stypes, stype - 1))) {
 			/* conflicting/duplicate rules are ignored */
@@ -1939,8 +1971,9 @@ static int filename_trans_read_helper_compat(struct=
 policydb *p, void *fp)
 			if (!ft)
 				goto out;
=20
-			rc =3D hashtab_insert(&p->filename_trans, ft, datum,
-					    filenametr_key_params);
+			rc =3D hashtab_insert(
+				&p->filename_trans[FILENAME_TRANS_MATCH_EXACT],
+				ft, datum, filenametr_key_params);
 			if (rc)
 				goto out;
 			name =3D NULL;
@@ -1961,7 +1994,8 @@ static int filename_trans_read_helper_compat(struct=
 policydb *p, void *fp)
 	return rc;
 }
=20
-static int filename_trans_read_helper(struct policydb *p, void *fp)
+static int filename_trans_read_helper(struct policydb *p, void *fp,
+				      unsigned int match_type)
 {
 	struct filename_trans_key *ft =3D NULL;
 	struct filename_trans_datum **dst, *datum, *first =3D NULL;
@@ -2028,7 +2062,7 @@ static int filename_trans_read_helper(struct policy=
db *p, void *fp)
 	ft->tclass =3D tclass;
 	ft->name =3D name;
=20
-	rc =3D hashtab_insert(&p->filename_trans, ft, first,
+	rc =3D hashtab_insert(&p->filename_trans[match_type], ft, first,
 			    filenametr_key_params);
 	if (rc =3D=3D -EEXIST)
 		pr_err("SELinux:  Duplicate filename transition key\n");
@@ -2050,7 +2084,8 @@ static int filename_trans_read_helper(struct policy=
db *p, void *fp)
 	return rc;
 }
=20
-static int filename_trans_read(struct policydb *p, void *fp)
+static int filename_trans_read(struct policydb *p, void *fp,
+			       unsigned int match_type)
 {
 	u32 nel, i;
 	__le32 buf[1];
@@ -2067,27 +2102,28 @@ static int filename_trans_read(struct policydb *p=
, void *fp)
 	if (p->policyvers < POLICYDB_VERSION_COMP_FTRANS) {
 		p->compat_filename_trans_count =3D nel;
=20
-		rc =3D hashtab_init(&p->filename_trans, (1 << 11));
+		rc =3D hashtab_init(&p->filename_trans[match_type], (1 << 11));
 		if (rc)
 			return rc;
=20
 		for (i =3D 0; i < nel; i++) {
+			// this version does not support other than exact match
 			rc =3D filename_trans_read_helper_compat(p, fp);
 			if (rc)
 				return rc;
 		}
 	} else {
-		rc =3D hashtab_init(&p->filename_trans, nel);
+		rc =3D hashtab_init(&p->filename_trans[match_type], nel);
 		if (rc)
 			return rc;
=20
 		for (i =3D 0; i < nel; i++) {
-			rc =3D filename_trans_read_helper(p, fp);
+			rc =3D filename_trans_read_helper(p, fp, match_type);
 			if (rc)
 				return rc;
 		}
 	}
-	hash_eval(&p->filename_trans, "filenametr");
+	hash_eval(&p->filename_trans[match_type], "filenametr");
 	return 0;
 }
=20
@@ -2636,9 +2672,17 @@ int policydb_read(struct policydb *p, void *fp)
 		lra =3D ra;
 	}
=20
-	rc =3D filename_trans_read(p, fp);
+	rc =3D filename_trans_read(p, fp, FILENAME_TRANS_MATCH_EXACT);
 	if (rc)
 		goto bad;
+	if (p->policyvers >=3D POLICYDB_VERSION_PREFIX_SUFFIX) {
+		rc =3D filename_trans_read(p, fp, FILENAME_TRANS_MATCH_PREFIX);
+		if (rc)
+			goto bad;
+		rc =3D filename_trans_read(p, fp, FILENAME_TRANS_MATCH_SUFFIX);
+		if (rc)
+			goto bad;
+	}
=20
 	rc =3D policydb_index(p);
 	if (rc)
@@ -3569,7 +3613,8 @@ static int filename_write_helper(void *key, void *d=
ata, void *ptr)
 	return 0;
 }
=20
-static int filename_trans_write(struct policydb *p, void *fp)
+static int filename_trans_write(struct policydb *p, void *fp,
+				unsigned int match_type)
 {
 	__le32 buf[1];
 	int rc;
@@ -3583,15 +3628,16 @@ static int filename_trans_write(struct policydb *=
p, void *fp)
 		if (rc)
 			return rc;
=20
-		rc =3D hashtab_map(&p->filename_trans,
+		rc =3D hashtab_map(&p->filename_trans[match_type],
 				 filename_write_helper_compat, fp);
 	} else {
-		buf[0] =3D cpu_to_le32(p->filename_trans.nel);
+		buf[0] =3D cpu_to_le32(p->filename_trans[match_type].nel);
 		rc =3D put_entry(buf, sizeof(u32), 1, fp);
 		if (rc)
 			return rc;
=20
-		rc =3D hashtab_map(&p->filename_trans, filename_write_helper, fp);
+		rc =3D hashtab_map(&p->filename_trans[match_type],
+				 filename_write_helper, fp);
 	}
 	return rc;
 }
@@ -3706,9 +3752,17 @@ int policydb_write(struct policydb *p, void *fp)
 	if (rc)
 		return rc;
=20
-	rc =3D filename_trans_write(p, fp);
+	rc =3D filename_trans_write(p, fp, FILENAME_TRANS_MATCH_EXACT);
 	if (rc)
 		return rc;
+	if (p->policyvers >=3D POLICYDB_VERSION_PREFIX_SUFFIX) {
+		rc =3D filename_trans_write(p, fp, FILENAME_TRANS_MATCH_PREFIX);
+		if (rc)
+			return rc;
+		rc =3D filename_trans_write(p, fp, FILENAME_TRANS_MATCH_SUFFIX);
+		if (rc)
+			return rc;
+	}
=20
 	rc =3D ocontext_write(p, info, fp);
 	if (rc)
diff --git a/security/selinux/ss/policydb.h b/security/selinux/ss/policyd=
b.h
index b97cda489753..7bd0ecb8ed69 100644
--- a/security/selinux/ss/policydb.h
+++ b/security/selinux/ss/policydb.h
@@ -235,6 +235,13 @@ struct genfs {
 #define OCON_IBENDPORT	8 /* Infiniband end ports */
 #define OCON_NUM	9
=20
+enum {
+	FILENAME_TRANS_MATCH_EXACT,
+	FILENAME_TRANS_MATCH_PREFIX,
+	FILENAME_TRANS_MATCH_SUFFIX,
+	FILENAME_TRANS_MATCH_NUM,
+};
+
 /* The policy database */
 struct policydb {
 	int mls_enabled;
@@ -269,7 +276,7 @@ struct policydb {
 	/* quickly exclude lookups when parent ttype has no rules */
 	struct ebitmap filename_trans_ttypes;
 	/* actual set of filename_trans rules */
-	struct hashtab filename_trans;
+	struct hashtab filename_trans[FILENAME_TRANS_MATCH_NUM];
 	/* only used if policyvers < POLICYDB_VERSION_COMP_FTRANS */
 	u32 compat_filename_trans_count;
=20
@@ -325,7 +332,8 @@ extern int policydb_read(struct policydb *p, void *fp=
);
 extern int policydb_write(struct policydb *p, void *fp);
=20
 extern struct filename_trans_datum *policydb_filenametr_search(
-	struct policydb *p, struct filename_trans_key *key);
+	struct policydb *p, unsigned int match_type,
+	struct filename_trans_key *key, u32 stype);
=20
 extern struct mls_range *policydb_rangetr_search(
 	struct policydb *p, struct range_trans *key);
diff --git a/security/selinux/ss/services.c b/security/selinux/ss/service=
s.c
index 1eeffc66ea7d..99200a9490a3 100644
--- a/security/selinux/ss/services.c
+++ b/security/selinux/ss/services.c
@@ -1661,13 +1661,16 @@ static int compute_sid_handle_invalid_context(
 	return -EACCES;
 }
=20
-static void filename_compute_type(struct policydb *policydb,
+static int filename_compute_type(struct policydb *policydb,
 				  struct context *newcontext,
 				  u32 stype, u32 ttype, u16 tclass,
 				  const char *objname)
 {
 	struct filename_trans_key ft;
 	struct filename_trans_datum *datum;
+	size_t name_len =3D strlen(objname);
+	size_t i;
+	char *name_copy;
=20
 	/*
 	 * Most filename trans rules are going to live in specific directories
@@ -1675,20 +1678,50 @@ static void filename_compute_type(struct policydb=
 *policydb,
 	 * if the ttype does not contain any rules.
 	 */
 	if (!ebitmap_get_bit(&policydb->filename_trans_ttypes, ttype))
-		return;
+		return 0;
=20
 	ft.ttype =3D ttype;
 	ft.tclass =3D tclass;
+
+	/* Search for exact rules */
 	ft.name =3D objname;
+	datum =3D policydb_filenametr_search(policydb, FILENAME_TRANS_MATCH_EXA=
CT,
+					   &ft, stype);
+	if (datum) {
+		newcontext->type =3D datum->otype;
+		return 0;
+	}
=20
-	datum =3D policydb_filenametr_search(policydb, &ft);
-	while (datum) {
-		if (ebitmap_get_bit(&datum->stypes, stype - 1)) {
+	/* Search for prefix rules */
+	name_copy =3D kstrdup(objname, GFP_ATOMIC);
+	if (!name_copy)
+		return -ENOMEM;
+	ft.name =3D name_copy;
+	for (i =3D name_len; i > 0; i--) {
+		name_copy[i] =3D '\0';
+		datum =3D policydb_filenametr_search(policydb,
+						   FILENAME_TRANS_MATCH_PREFIX,
+						   &ft, stype);
+		if (datum) {
 			newcontext->type =3D datum->otype;
-			return;
+			kfree(name_copy);
+			return 0;
 		}
-		datum =3D datum->next;
 	}
+	kfree(name_copy);
+
+	/* Search for suffix rules */
+	for (i =3D 0; i < name_len; i++) {
+		ft.name =3D &objname[i];
+		datum =3D policydb_filenametr_search(policydb,
+						   FILENAME_TRANS_MATCH_SUFFIX,
+						   &ft, stype);
+		if (datum) {
+			newcontext->type =3D datum->otype;
+			return 0;
+		}
+	}
+	return 0;
 }
=20
 static int security_compute_sid(u32 ssid,
@@ -1833,9 +1866,13 @@ static int security_compute_sid(u32 ssid,
 	}
=20
 	/* if we have a objname this is a file trans check so check those rules=
 */
-	if (objname)
-		filename_compute_type(policydb, &newcontext, scontext->type,
-				      tcontext->type, tclass, objname);
+	if (objname) {
+		rc =3D filename_compute_type(policydb, &newcontext,
+					   scontext->type, tcontext->type,
+					   tclass, objname);
+		if (rc)
+			goto out_unlock;
+	}
=20
 	/* Check for class-specific changes. */
 	if (specified & AVTAB_TRANSITION) {
--=20
2.42.0

