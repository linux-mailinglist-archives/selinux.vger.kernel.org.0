Return-Path: <selinux+bounces-1748-lists+selinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1055295A8F7
	for <lists+selinux@lfdr.de>; Thu, 22 Aug 2024 02:38:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 71529283CED
	for <lists+selinux@lfdr.de>; Thu, 22 Aug 2024 00:38:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9777F1D12E0;
	Thu, 22 Aug 2024 00:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="slEtNSB1"
X-Original-To: selinux@vger.kernel.org
Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 446894C74
	for <selinux@vger.kernel.org>; Thu, 22 Aug 2024 00:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724287127; cv=none; b=IB0FFUuZLlWw9bhB707fm87DMMLKP/euh+f8fgc0kLvykOHkFIQeAXwzKxIViO2+eH6bKnRM3ihPybOHfXeBLutBw2Uu16nG/JUo13INe8JnDGCA7Hn1SqiVCPDvWGs+oNsKxD6/0t+newkEZXG7Yi2hVsq4Ao038mmJmpijy2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724287127; c=relaxed/simple;
	bh=U2d/5CVM4BmwCJ2lgbDno2NP+QEuzgNumjUOxjb63Ss=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=qKYyY33XGD1yxtIF9iD/7wo7EtiwEcmjdX5Zf1SlpETiBkxuaXeEz/8iJMLnTqoQp9YFPniT6UurjKeE1Z0prQqoPUHK73KLtxPnoUhasRwqfyeLvzohY9TAC+UWsayvPBVJJ04apKz665RnDFWGmUm98sU0lwyEyoIuwBaHrPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tweek.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=slEtNSB1; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tweek.bounces.google.com
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-690404fd230so5358647b3.3
        for <selinux@vger.kernel.org>; Wed, 21 Aug 2024 17:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1724287124; x=1724891924; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BHDtl+MEtT0w71HRhOjcg4vDjJvGDqZH4AcWRYKMkzY=;
        b=slEtNSB1elDktDdf+N6w4Dr47+uKlE41jVK2RgmAVpiRb/giciFH4JNNlJ9Rtg4ylx
         G5bUX34pACJV3/NE4tDDI61boU8ghF4KLERHnwh5KKxW/fwSay9NPfsooCUyKdAr8JSX
         ayuu1vk8n7SWA07VIvFQ+3Voeoe4mswbSZyVC/MTpw+KunGCsFEh8MRwsGzbYgzbh7Gv
         m3wj7QbAlbYDagCwzqzTdXzM/OURG7ZEux2YJTnArudiLrQjRIyKMIyst7zzI4Q/ZhI4
         ejp8J9P59e+yC8wUfPQqDIk25TuFCXLRHQ561WOqoewxArfVFfDpStJ0kBDor1DXiCGO
         L8vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724287124; x=1724891924;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BHDtl+MEtT0w71HRhOjcg4vDjJvGDqZH4AcWRYKMkzY=;
        b=Xfav9gcUiyneXe3YSCZ6XshhDSBIADnKeUNfQ1NSOJLd0kiIjy6hBx0OcpHJvxHIFQ
         WYOIPQcmLnzYNlkfFJuy6kPlsUyB3WdK7fSE8rMeaQCGzYj3N8ZZ24E3fkxGyEcjdmKD
         wieEUuRHh/HFiuQnqara1SnWCFFnoXK0gpfzJ5WEDzJbGrV8YN54p09lJbqgUQRoEtFH
         M/oqxPfAgdTGfT/tUzH+GLOhAQe82Npkq2e49yPtLu73QXYhFt8fjKPB+VYmYkgdVUGl
         T5qLTKEpvA2d5+JLGRuO+hKYeU2pLzWINE8hBVAYt9b7GF7rLZpCHmDWbFkmbbMzxATg
         PVkg==
X-Forwarded-Encrypted: i=1; AJvYcCXbcoWb2xdTq8zr91LUWaoJ3cMlisEy43d1cXHTS5qp1QiCd5EwOAu75tvITPMGjA+AkozACIoH@vger.kernel.org
X-Gm-Message-State: AOJu0YyNtNTltSgQp2O8d9/ttohbX/iq0+gxKk9NRXggqs41nBMedzEF
	21xFQVKqdJuecWOJ+IcoCRC5GmI9Y02HaXzU67LnfpoombjSkmFQ2uBS2K77m9HLw+g4RH5ZWw=
	=
X-Google-Smtp-Source: AGHT+IHYEnIgdXhLnGc8NgGRab46aLG6j9ATtRGjRU8PUX6AGCP7CWiHwTboeJvVl9KMumPx1Tl2DPCDHA==
X-Received: from tweek-syd.c.googlers.com ([fda3:e722:ac3:cc00:b7:3870:c0a8:26])
 (user=tweek job=sendgmr) by 2002:a25:a301:0:b0:e11:6ad4:6271 with SMTP id
 3f1490d57ef6-e1665411bd7mr6018276.1.1724287124047; Wed, 21 Aug 2024 17:38:44
 -0700 (PDT)
Date: Thu, 22 Aug 2024 10:37:56 +1000
In-Reply-To: <20240822003757.1998016-1-tweek@google.com>
Precedence: bulk
X-Mailing-List: selinux@vger.kernel.org
List-Id: <selinux.vger.kernel.org>
List-Subscribe: <mailto:selinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:selinux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240822003757.1998016-1-tweek@google.com>
X-Mailer: git-send-email 2.46.0.184.g6999bdac58-goog
Message-ID: <20240822003757.1998016-2-tweek@google.com>
Subject: [PATCH 2/3] libsepol: Support nlmsg extended permissions
From: "=?UTF-8?q?Thi=C3=A9baud=20Weksteen?=" <tweek@google.com>
To: paul@paul-moore.com
Cc: brambonne@google.com, jeffv@google.com, selinux@vger.kernel.org, 
	stephen.smalley.work@gmail.com, 
	"=?UTF-8?q?Thi=C3=A9baud=20Weksteen?=" <tweek@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Add support for AVTAB_XPERMS_NLMSG as extended permissions for netlink
sockets. The behaviour is similar to the existing
AVTAB_XPERMS_IOCTLFUNCTION.

Signed-off-by: Thi=C3=A9baud Weksteen <tweek@google.com>
---
 checkpolicy/policy_define.c                | 64 +++++++++++++++--
 checkpolicy/test/dismod.c                  |  2 +
 libsepol/cil/src/cil.c                     |  2 +
 libsepol/cil/src/cil_binary.c              | 84 ++++++++++++++++------
 libsepol/cil/src/cil_build_ast.c           |  4 +-
 libsepol/cil/src/cil_internal.h            |  2 +
 libsepol/cil/src/cil_policy.c              |  2 +
 libsepol/cil/src/cil_verify.c              |  3 +
 libsepol/cil/src/cil_write_ast.c           | 16 ++++-
 libsepol/include/sepol/policydb/avtab.h    |  1 +
 libsepol/include/sepol/policydb/policydb.h |  1 +
 libsepol/src/expand.c                      |  3 +
 libsepol/src/kernel_to_cil.c               | 21 ++++--
 libsepol/src/module_to_cil.c               | 20 ++++--
 libsepol/src/policydb_validate.c           |  2 +
 libsepol/src/util.c                        | 14 ++--
 16 files changed, 200 insertions(+), 41 deletions(-)

diff --git a/checkpolicy/policy_define.c b/checkpolicy/policy_define.c
index 4f6b2266..6b062657 100644
--- a/checkpolicy/policy_define.c
+++ b/checkpolicy/policy_define.c
@@ -2342,8 +2342,8 @@ static int avrule_ioctl_completedriver(struct av_xper=
m_range_list *rangelist,
 	return 0;
 }
=20
-static int avrule_ioctl_func(struct av_xperm_range_list *rangelist,
-		av_extended_perms_t **extended_perms, unsigned int driver)
+static int avrule_xperm_func(struct av_xperm_range_list *rangelist,
+		av_extended_perms_t **extended_perms, unsigned int driver, uint8_t speci=
fied)
 {
 	struct av_xperm_range_list *r;
 	av_extended_perms_t *xperms;
@@ -2379,7 +2379,7 @@ static int avrule_ioctl_func(struct av_xperm_range_li=
st *rangelist,
 		high =3D IOC_FUNC(high);
 		avrule_xperm_setrangebits(low, high, xperms);
 		xperms->driver =3D driver;
-		xperms->specified =3D AVRULE_XPERMS_IOCTLFUNCTION;
+		xperms->specified =3D specified;
 		r =3D r->next;
 	}
=20
@@ -2495,7 +2495,61 @@ static int define_te_avtab_ioctl(const avrule_t *avr=
ule_template)
 	 */
 	i =3D 0;
 	while (xperms_for_each_bit(&i, partial_driver)) {
-		if (avrule_ioctl_func(rangelist, &xperms, i))
+		if (avrule_xperm_func(rangelist, &xperms, i, AVRULE_XPERMS_IOCTLFUNCTION=
))
+			return -1;
+
+		if (xperms) {
+			avrule =3D (avrule_t *) calloc(1, sizeof(avrule_t));
+			if (!avrule) {
+				yyerror("out of memory");
+				return -1;
+			}
+			if (avrule_cpy(avrule, avrule_template))
+				return -1;
+			avrule->xperms =3D xperms;
+			append_avrule(avrule);
+		}
+	}
+
+done:
+	if (partial_driver)
+		free(partial_driver);
+
+	while (rangelist !=3D NULL) {
+		r =3D rangelist;
+		rangelist =3D rangelist->next;
+		free(r);
+	}
+
+	return 0;
+}
+
+static int define_te_avtab_netlink(const avrule_t *avrule_template)
+{
+	avrule_t *avrule;
+	struct av_xperm_range_list *rangelist, *r;
+	av_extended_perms_t *partial_driver, *xperms;
+	unsigned int i;
+
+	/* organize ranges */
+	if (avrule_xperm_ranges(&rangelist))
+		return -1;
+
+	/* flag driver codes that are partially enabled */
+	if (avrule_xperm_partialdriver(rangelist, NULL, &partial_driver))
+		return -1;
+
+	if (!partial_driver || !avrule_xperms_used(partial_driver))
+		goto done;
+
+	/*
+	 * create rule for each partially used driver codes
+	 * "partially used" meaning that the code number e.g. socket 0x89
+	 * has some permission bits set and others not set.
+	 */
+	i =3D 0;
+	while (xperms_for_each_bit(&i, partial_driver)) {
+		if (avrule_xperm_func(rangelist, &xperms, i, AVRULE_XPERMS_NLMSG))
 			return -1;
=20
 		if (xperms) {
@@ -2546,6 +2600,8 @@ int define_te_avtab_extended_perms(int which)
 	id =3D queue_remove(id_queue);
 	if (strcmp(id,"ioctl") =3D=3D 0) {
 		rc =3D define_te_avtab_ioctl(avrule_template);
+	} else if (strcmp(id,"nlmsg") =3D=3D 0) {
+		rc =3D define_te_avtab_netlink(avrule_template);
 	} else {
 		yyerror2("only ioctl extended permissions are supported, found %s", id);
 		rc =3D -1;
diff --git a/checkpolicy/test/dismod.c b/checkpolicy/test/dismod.c
index bd45c95e..4868190f 100644
--- a/checkpolicy/test/dismod.c
+++ b/checkpolicy/test/dismod.c
@@ -353,6 +353,8 @@ static int display_avrule(avrule_t * avrule, policydb_t=
 * policy,
 			xperms.specified =3D AVTAB_XPERMS_IOCTLFUNCTION;
 		else if (avrule->xperms->specified =3D=3D AVRULE_XPERMS_IOCTLDRIVER)
 			xperms.specified =3D AVTAB_XPERMS_IOCTLDRIVER;
+		else if (avrule->xperms->specified =3D=3D AVRULE_XPERMS_NLMSG)
+			xperms.specified =3D AVTAB_XPERMS_NLMSG;
 		else {
 			fprintf(fp, "     ERROR: no valid xperms specified\n");
 			return -1;
diff --git a/libsepol/cil/src/cil.c b/libsepol/cil/src/cil.c
index 067e28a6..5521c7ea 100644
--- a/libsepol/cil/src/cil.c
+++ b/libsepol/cil/src/cil.c
@@ -221,6 +221,7 @@ char *CIL_KEY_DONTAUDITX;
 char *CIL_KEY_NEVERALLOWX;
 char *CIL_KEY_PERMISSIONX;
 char *CIL_KEY_IOCTL;
+char *CIL_KEY_NLMSG;
 char *CIL_KEY_UNORDERED;
 char *CIL_KEY_SRC_INFO;
 char *CIL_KEY_SRC_CIL;
@@ -393,6 +394,7 @@ static void cil_init_keys(void)
 	CIL_KEY_NEVERALLOWX =3D cil_strpool_add("neverallowx");
 	CIL_KEY_PERMISSIONX =3D cil_strpool_add("permissionx");
 	CIL_KEY_IOCTL =3D cil_strpool_add("ioctl");
+	CIL_KEY_NLMSG =3D cil_strpool_add("nlmsg");
 	CIL_KEY_UNORDERED =3D cil_strpool_add("unordered");
 	CIL_KEY_SRC_INFO =3D cil_strpool_add("<src_info>");
 	CIL_KEY_SRC_CIL =3D cil_strpool_add("cil");
diff --git a/libsepol/cil/src/cil_binary.c b/libsepol/cil/src/cil_binary.c
index c8144a5a..3dec1883 100644
--- a/libsepol/cil/src/cil_binary.c
+++ b/libsepol/cil/src/cil_binary.c
@@ -66,6 +66,7 @@ struct cil_args_binary {
 	int pass;
 	hashtab_t role_trans_table;
 	hashtab_t avrulex_ioctl_table;
+	hashtab_t avrulex_nlmsg_table;
 	void **type_value_to_cil;
 };
=20
@@ -1671,11 +1672,22 @@ static void __avrule_xperm_setrangebits(uint16_t lo=
w, uint16_t high, struct avta
 	}
 }
=20
+static char* __cil_xperm_kind_to_str(uint32_t xperm_kind)
+{
+	switch (xperm_kind) {
+		case CIL_PERMX_KIND_IOCTL:
+			return CIL_KEY_IOCTL;
+		case CIL_PERMX_KIND_NLMSG:
+			return CIL_KEY_NLMSG;
+		default:
+			return (char *) "unknown";
+	}
+}
=20
 #define IOC_DRIV(x) (x >> 8)
 #define IOC_FUNC(x) (x & 0xff)
=20
-static int __cil_permx_bitmap_to_sepol_xperms_list(ebitmap_t *xperms, stru=
ct cil_list **xperms_list)
+static int __cil_permx_bitmap_to_sepol_xperms_list(uint32_t kind, ebitmap_=
t *xperms, struct cil_list **xperms_list)
 {
 	ebitmap_node_t *node;
 	unsigned int i;
@@ -1705,7 +1717,7 @@ static int __cil_permx_bitmap_to_sepol_xperms_list(eb=
itmap_t *xperms, struct cil
 		high =3D i;
 		start_new_range =3D 1;
=20
-		if (IOC_FUNC(low) =3D=3D 0x00 && IOC_FUNC(high) =3D=3D 0xff) {
+		if (kind =3D=3D CIL_PERMX_KIND_IOCTL && IOC_FUNC(low) =3D=3D 0x00 && IOC=
_FUNC(high) =3D=3D 0xff) {
 			if (!complete) {
 				complete =3D cil_calloc(1, sizeof(*complete));
 				complete->driver =3D 0x0;
@@ -1722,7 +1734,14 @@ static int __cil_permx_bitmap_to_sepol_xperms_list(e=
bitmap_t *xperms, struct cil
 			if (!partial) {
 				partial =3D cil_calloc(1, sizeof(*partial));
 				partial->driver =3D IOC_DRIV(low);
-				partial->specified =3D AVTAB_XPERMS_IOCTLFUNCTION;
+				switch (kind) {
+				case CIL_PERMX_KIND_IOCTL:
+					partial->specified =3D AVTAB_XPERMS_IOCTLFUNCTION;
+					break;
+				case CIL_PERMX_KIND_NLMSG:
+					partial->specified =3D AVTAB_XPERMS_NLMSG;
+					break;
+				}
 			}
=20
 			__avrule_xperm_setrangebits(IOC_FUNC(low), IOC_FUNC(high), partial);
@@ -1740,7 +1759,7 @@ static int __cil_permx_bitmap_to_sepol_xperms_list(eb=
itmap_t *xperms, struct cil
 	return SEPOL_OK;
 }
=20
-static int __cil_avrulex_ioctl_to_policydb(hashtab_key_t k, hashtab_datum_=
t datum, void *args)
+static int __cil_avrulex_xperm_to_policydb(hashtab_key_t k, hashtab_datum_=
t datum, uint32_t xperm_kind, void *args)
 {
 	int rc =3D SEPOL_OK;
 	struct policydb *pdb;
@@ -1750,6 +1769,7 @@ static int __cil_avrulex_ioctl_to_policydb(hashtab_ke=
y_t k, hashtab_datum_t datu
 	struct cil_list_item *item;
 	class_datum_t *sepol_obj;
 	uint32_t data =3D 0;
+	char *kind =3D NULL;
=20
 	avtab_key =3D (avtab_key_t *)k;
 	pdb =3D args;
@@ -1759,13 +1779,14 @@ static int __cil_avrulex_ioctl_to_policydb(hashtab_=
key_t k, hashtab_datum_t datu
 	// setting the data for an extended avtab isn't really necessary because
 	// it is ignored by the kernel. However, neverallow checking requires tha=
t
 	// the data value be set, so set it for that to work.
-	rc =3D __perm_str_to_datum(CIL_KEY_IOCTL, sepol_obj, &data);
+	kind =3D __cil_xperm_kind_to_str(xperm_kind);
+	rc =3D __perm_str_to_datum(kind, sepol_obj, &data);
 	if (rc !=3D SEPOL_OK) {
 		goto exit;
 	}
 	avtab_datum.data =3D data;
=20
-	rc =3D __cil_permx_bitmap_to_sepol_xperms_list(datum, &xperms_list);
+	rc =3D __cil_permx_bitmap_to_sepol_xperms_list(xperm_kind, datum, &xperms=
_list);
 	if (rc !=3D SEPOL_OK) {
 		goto exit;
 	}
@@ -1790,7 +1811,15 @@ exit:
 	return rc;
 }
=20
-static int __cil_avrulex_ioctl_to_hashtable(hashtab_t h, uint16_t kind, ui=
nt32_t src, uint32_t tgt, uint32_t obj, ebitmap_t *xperms)
+static int __cil_avrulex_ioctl_to_policydb(hashtab_key_t k, hashtab_datum_=
t datum, void *args) {
+	return __cil_avrulex_xperm_to_policydb(k, datum, CIL_PERMX_KIND_IOCTL, ar=
gs);
+}
+
+static int __cil_avrulex_nlmsg_to_policydb(hashtab_key_t k, hashtab_datum_=
t datum, void *args) {
+	return __cil_avrulex_xperm_to_policydb(k, datum, CIL_PERMX_KIND_NLMSG, ar=
gs);
+}
+
+static int __cil_avrulex_xperm_to_hashtable(hashtab_t h, uint16_t kind, ui=
nt32_t src, uint32_t tgt, uint32_t obj, ebitmap_t *xperms)
 {
 	uint16_t specified;
 	avtab_key_t *avtab_key;
@@ -1870,7 +1899,11 @@ static int __cil_avrulex_to_hashtable_helper(policyd=
b_t *pdb, uint16_t kind, str
=20
 		switch (permx->kind) {
 		case  CIL_PERMX_KIND_IOCTL:
-			rc =3D __cil_avrulex_ioctl_to_hashtable(args->avrulex_ioctl_table, kind=
, sepol_src->s.value, sepol_tgt->s.value, sepol_obj->s.value, permx->perms)=
;
+			rc =3D __cil_avrulex_xperm_to_hashtable(args->avrulex_ioctl_table, kind=
, sepol_src->s.value, sepol_tgt->s.value, sepol_obj->s.value, permx->perms)=
;
+			if (rc !=3D SEPOL_OK) goto exit;
+			break;
+		case  CIL_PERMX_KIND_NLMSG:
+			rc =3D __cil_avrulex_xperm_to_hashtable(args->avrulex_nlmsg_table, kind=
, sepol_src->s.value, sepol_tgt->s.value, sepol_obj->s.value, permx->perms)=
;
 			if (rc !=3D SEPOL_OK) goto exit;
 			break;
 		default:
@@ -2037,7 +2070,7 @@ exit:
 	return rc;
 }
=20
-static int __cil_avrulex_ioctl_destroy(hashtab_key_t k, hashtab_datum_t da=
tum, __attribute__((unused)) void *args)
+static int __cil_avrulex_xperm_destroy(hashtab_key_t k, hashtab_datum_t da=
tum, __attribute__((unused)) void *args)
 {
 	free(k);
 	ebitmap_destroy(datum);
@@ -4630,6 +4663,9 @@ static int __cil_permx_to_sepol_class_perms(policydb_=
t *pdb, struct cil_permissi
 			case CIL_PERMX_KIND_IOCTL:
 				perm_str =3D CIL_KEY_IOCTL;
 				break;
+			case CIL_PERMX_KIND_NLMSG:
+				perm_str =3D CIL_KEY_NLMSG;
+				break;
 			default:
 				rc =3D SEPOL_ERR;
 				goto exit;
@@ -4769,17 +4805,10 @@ static void __cil_print_classperm(struct cil_list *=
cp_list)
=20
 static void __cil_print_permissionx(struct cil_permissionx *px)
 {
-	const char *kind_str =3D "";
+	const char *kind_str =3D NULL;
 	char *expr_str;
=20
-	switch (px->kind) {
-		case CIL_PERMX_KIND_IOCTL:
-			kind_str =3D CIL_KEY_IOCTL;
-			break;
-		default:
-			kind_str =3D "unknown";
-			break;
-	}
+	kind_str =3D __cil_xperm_kind_to_str(px->kind);
=20
 	__cil_expr_to_string(px->expr_str, CIL_PERMISSIONX, &expr_str);
=20
@@ -4928,7 +4957,7 @@ static int cil_check_neverallow(const struct cil_db *=
db, policydb_t *pdb, struct
 			goto exit;
 		}
=20
-		rc =3D __cil_permx_bitmap_to_sepol_xperms_list(cil_rule->perms.x.permx->=
perms, &xperms);
+		rc =3D __cil_permx_bitmap_to_sepol_xperms_list(cil_rule->perms.x.permx->=
kind, cil_rule->perms.x.permx->perms, &xperms);
 		if (rc !=3D SEPOL_OK) {
 			goto exit;
 		}
@@ -5137,6 +5166,7 @@ int cil_binary_create_allocated_pdb(const struct cil_=
db *db, sepol_policydb_t *p
 	struct cil_list *neverallows =3D NULL;
 	hashtab_t role_trans_table =3D NULL;
 	hashtab_t avrulex_ioctl_table =3D NULL;
+	hashtab_t avrulex_nlmsg_table =3D NULL;
 	void **type_value_to_cil =3D NULL;
 	struct cil_class **class_value_to_cil =3D NULL;
 	struct cil_perm ***perm_value_to_cil =3D NULL;
@@ -5184,6 +5214,12 @@ int cil_binary_create_allocated_pdb(const struct cil=
_db *db, sepol_policydb_t *p
 		goto exit;
 	}
=20
+	avrulex_nlmsg_table =3D hashtab_create(avrulex_hash, avrulex_compare, AVR=
ULEX_TABLE_SIZE);
+	if (!avrulex_nlmsg_table) {
+		cil_log(CIL_INFO, "Failure to create hashtab for avrulex\n");
+		goto exit;
+	}
+
 	cil_list_init(&neverallows, CIL_LIST_ITEM);
=20
 	extra_args.db =3D db;
@@ -5191,6 +5227,7 @@ int cil_binary_create_allocated_pdb(const struct cil_=
db *db, sepol_policydb_t *p
 	extra_args.neverallows =3D neverallows;
 	extra_args.role_trans_table =3D role_trans_table;
 	extra_args.avrulex_ioctl_table =3D avrulex_ioctl_table;
+	extra_args.avrulex_nlmsg_table =3D avrulex_nlmsg_table;
 	extra_args.type_value_to_cil =3D type_value_to_cil;
=20
 	for (i =3D 1; i <=3D 3; i++) {
@@ -5216,6 +5253,11 @@ int cil_binary_create_allocated_pdb(const struct cil=
_db *db, sepol_policydb_t *p
 				cil_log(CIL_INFO, "Failure creating avrulex rules\n");
 				goto exit;
 			}
+			rc =3D hashtab_map(avrulex_nlmsg_table, __cil_avrulex_nlmsg_to_policydb=
, pdb);
+			if (rc !=3D SEPOL_OK) {
+				cil_log(CIL_INFO, "Failure creating avrulex rules\n");
+				goto exit;
+			}
 		}
 	}
=20
@@ -5287,8 +5329,10 @@ int cil_binary_create_allocated_pdb(const struct cil=
_db *db, sepol_policydb_t *p
=20
 exit:
 	hashtab_destroy(role_trans_table);
-	hashtab_map(avrulex_ioctl_table, __cil_avrulex_ioctl_destroy, NULL);
+	hashtab_map(avrulex_ioctl_table, __cil_avrulex_xperm_destroy, NULL);
 	hashtab_destroy(avrulex_ioctl_table);
+	hashtab_map(avrulex_nlmsg_table, __cil_avrulex_xperm_destroy, NULL);
+	hashtab_destroy(avrulex_nlmsg_table);
 	free(type_value_to_cil);
 	free(class_value_to_cil);
 	if (perm_value_to_cil !=3D NULL) {
diff --git a/libsepol/cil/src/cil_build_ast.c b/libsepol/cil/src/cil_build_=
ast.c
index 56dac891..87178294 100644
--- a/libsepol/cil/src/cil_build_ast.c
+++ b/libsepol/cil/src/cil_build_ast.c
@@ -2153,8 +2153,10 @@ static int cil_fill_permissionx(struct cil_tree_node=
 *parse_current, struct cil_
=20
 	if (parse_current->data =3D=3D CIL_KEY_IOCTL) {
 		permx->kind =3D CIL_PERMX_KIND_IOCTL;
+	} else if (parse_current->data =3D=3D CIL_KEY_NLMSG) {
+		permx->kind =3D CIL_PERMX_KIND_NLMSG;
 	} else {
-		cil_log(CIL_ERR, "Unknown permissionx kind, %s. Must be \"ioctl\"\n", (c=
har *)parse_current->data);
+		cil_log(CIL_ERR, "Unknown permissionx kind, %s. Must be \"ioctl\" or \"n=
lmsg\"\n", (char *)parse_current->data);
 		rc =3D SEPOL_ERR;
 		goto exit;
 	}
diff --git a/libsepol/cil/src/cil_internal.h b/libsepol/cil/src/cil_interna=
l.h
index 47b67c89..959b31e3 100644
--- a/libsepol/cil/src/cil_internal.h
+++ b/libsepol/cil/src/cil_internal.h
@@ -238,6 +238,7 @@ extern char *CIL_KEY_DONTAUDITX;
 extern char *CIL_KEY_NEVERALLOWX;
 extern char *CIL_KEY_PERMISSIONX;
 extern char *CIL_KEY_IOCTL;
+extern char *CIL_KEY_NLMSG;
 extern char *CIL_KEY_UNORDERED;
 extern char *CIL_KEY_SRC_INFO;
 extern char *CIL_KEY_SRC_CIL;
@@ -636,6 +637,7 @@ struct cil_avrule {
 };
=20
 #define CIL_PERMX_KIND_IOCTL 1
+#define CIL_PERMX_KIND_NLMSG 2
 struct cil_permissionx {
 	struct cil_symtab_datum datum;
 	uint32_t kind;
diff --git a/libsepol/cil/src/cil_policy.c b/libsepol/cil/src/cil_policy.c
index e9a8f75d..c497c8ab 100644
--- a/libsepol/cil/src/cil_policy.c
+++ b/libsepol/cil/src/cil_policy.c
@@ -1112,6 +1112,8 @@ static void cil_xperms_to_policy(FILE *out, struct ci=
l_permissionx *permx)
=20
 	if (permx->kind =3D=3D CIL_PERMX_KIND_IOCTL) {
 		kind =3D "ioctl";
+	} else if (permx->kind =3D=3D CIL_PERMX_KIND_NLMSG) {
+		kind =3D "nlmsg";
 	} else {
 		kind =3D "???";
 	}
diff --git a/libsepol/cil/src/cil_verify.c b/libsepol/cil/src/cil_verify.c
index 4ef2cbab..9621a247 100644
--- a/libsepol/cil/src/cil_verify.c
+++ b/libsepol/cil/src/cil_verify.c
@@ -1513,6 +1513,9 @@ static int __cil_verify_permissionx(struct cil_permis=
sionx *permx, struct cil_tr
 		case CIL_PERMX_KIND_IOCTL:
 			kind_str =3D CIL_KEY_IOCTL;
 			break;
+		case CIL_PERMX_KIND_NLMSG:
+			kind_str =3D CIL_KEY_NLMSG;
+			break;
 		default:
 			cil_tree_log(node, CIL_ERR, "Invalid permissionx kind (%d)", permx->kin=
d);
 			rc =3D SEPOL_ERR;
diff --git a/libsepol/cil/src/cil_write_ast.c b/libsepol/cil/src/cil_write_=
ast.c
index 46bd84db..cd1b6e6c 100644
--- a/libsepol/cil/src/cil_write_ast.c
+++ b/libsepol/cil/src/cil_write_ast.c
@@ -303,7 +303,13 @@ static void write_permx(FILE *out, struct cil_permissi=
onx *permx)
 		fprintf(out, "%s", datum_to_str(DATUM(permx)));
 	} else {
 		fprintf(out, "(");
-		fprintf(out, "%s ", permx->kind =3D=3D CIL_PERMX_KIND_IOCTL ? "ioctl" : =
"<?KIND>");
+		if (permx->kind =3D=3D CIL_PERMX_KIND_IOCTL) {
+			fprintf(out, "ioctl ");
+		} else if (permx->kind =3D=3D CIL_PERMX_KIND_NLMSG) {
+			fprintf(out, "nlmsg ");
+		} else {
+			fprintf(out, "<?KIND> ");
+		}
 		fprintf(out, "%s ", datum_or_str(DATUM(permx->obj), permx->obj_str));
 		write_expr(out, permx->expr_str);
 		fprintf(out, ")");
@@ -825,7 +831,13 @@ void cil_write_ast_node(FILE *out, struct cil_tree_nod=
e *node)
 	case CIL_PERMISSIONX: {
 		struct cil_permissionx *permx =3D node->data;
 		fprintf(out, "(permissionx %s (", datum_to_str(DATUM(permx)));
-		fprintf(out, "%s ", permx->kind =3D=3D CIL_PERMX_KIND_IOCTL ? "ioctl" : =
"<?KIND>");
+		if (permx->kind =3D=3D CIL_PERMX_KIND_IOCTL) {
+			fprintf(out, "ioctl ");
+		} else if (permx->kind =3D=3D CIL_PERMX_KIND_NLMSG) {
+			fprintf(out, "nlmsg ");
+		} else {
+			fprintf(out, "<?KIND> ");
+		}
 		fprintf(out, "%s ", datum_or_str(DATUM(permx->obj), permx->obj_str));
 		write_expr(out, permx->expr_str);
 		fprintf(out, "))\n");
diff --git a/libsepol/include/sepol/policydb/avtab.h b/libsepol/include/sep=
ol/policydb/avtab.h
index 2ab99c39..6e154cfe 100644
--- a/libsepol/include/sepol/policydb/avtab.h
+++ b/libsepol/include/sepol/policydb/avtab.h
@@ -74,6 +74,7 @@ typedef struct avtab_extended_perms {
=20
 #define AVTAB_XPERMS_IOCTLFUNCTION	0x01
 #define AVTAB_XPERMS_IOCTLDRIVER	0x02
+#define AVTAB_XPERMS_NLMSG	0x03
 	/* extension of the avtab_key specified */
 	uint8_t specified;
 	uint8_t driver;
diff --git a/libsepol/include/sepol/policydb/policydb.h b/libsepol/include/=
sepol/policydb/policydb.h
index 856faeb7..104a7dc8 100644
--- a/libsepol/include/sepol/policydb/policydb.h
+++ b/libsepol/include/sepol/policydb/policydb.h
@@ -259,6 +259,7 @@ typedef struct class_perm_node {
 typedef struct av_extended_perms {
 #define AVRULE_XPERMS_IOCTLFUNCTION	0x01
 #define AVRULE_XPERMS_IOCTLDRIVER	0x02
+#define AVRULE_XPERMS_NLMSG	0x03
 	uint8_t specified;
 	uint8_t driver;
 	/* 256 bits of permissions */
diff --git a/libsepol/src/expand.c b/libsepol/src/expand.c
index e63414b1..7032a83f 100644
--- a/libsepol/src/expand.c
+++ b/libsepol/src/expand.c
@@ -1821,6 +1821,9 @@ static int allocate_xperms(sepol_handle_t * handle, a=
vtab_datum_t * avdatump,
 	case AVRULE_XPERMS_IOCTLDRIVER:
 		xperms->specified =3D AVTAB_XPERMS_IOCTLDRIVER;
 		break;
+	case AVRULE_XPERMS_NLMSG:
+		xperms->specified =3D AVTAB_XPERMS_NLMSG;
+		break;
 	default:
 		return -1;
 	}
diff --git a/libsepol/src/kernel_to_cil.c b/libsepol/src/kernel_to_cil.c
index f94cb245..7243b3c0 100644
--- a/libsepol/src/kernel_to_cil.c
+++ b/libsepol/src/kernel_to_cil.c
@@ -1651,7 +1651,8 @@ static char *xperms_to_str(const avtab_extended_perms=
_t *xperms)
 	size_t remaining, size =3D 128;
=20
 	if ((xperms->specified !=3D AVTAB_XPERMS_IOCTLFUNCTION)
-		&& (xperms->specified !=3D AVTAB_XPERMS_IOCTLDRIVER)) {
+		&& (xperms->specified !=3D AVTAB_XPERMS_IOCTLDRIVER)
+		&& (xperms->specified !=3D AVTAB_XPERMS_NLMSG)) {
 		return NULL;
 	}
=20
@@ -1681,7 +1682,8 @@ retry:
 			continue;
 		}
=20
-		if (xperms->specified & AVTAB_XPERMS_IOCTLFUNCTION) {
+		if ((xperms->specified =3D=3D AVTAB_XPERMS_IOCTLFUNCTION)
+		 || (xperms->specified =3D=3D AVTAB_XPERMS_NLMSG)) {
 			value =3D xperms->driver<<8 | bit;
 			if (in_range) {
 				low_value =3D xperms->driver<<8 | low_bit;
@@ -1690,7 +1692,7 @@ retry:
 			} else {
 				len =3D snprintf(p, remaining, " 0x%hx", value);
 			}
-		} else if (xperms->specified & AVTAB_XPERMS_IOCTLDRIVER) {
+		} else if (xperms->specified =3D=3D AVTAB_XPERMS_IOCTLDRIVER) {
 			value =3D bit << 8;
 			if (in_range) {
 				low_value =3D low_bit << 8;
@@ -1728,7 +1730,7 @@ static char *avtab_node_to_str(struct policydb *pdb, =
avtab_key_t *key, avtab_dat
 	uint32_t data =3D datum->data;
 	type_datum_t *type;
 	const char *flavor, *tgt;
-	char *src, *class, *perms, *new;
+	char *src, *class, *perms, *new, *xperm;
 	char *rule =3D NULL;
=20
 	switch (0xFFF & key->specified) {
@@ -1795,9 +1797,16 @@ static char *avtab_node_to_str(struct policydb *pdb,=
 avtab_key_t *key, avtab_dat
 			ERR(NULL, "Failed to generate extended permission string");
 			goto exit;
 		}
-
+		if (datum->xperms->specified =3D=3D AVTAB_XPERMS_IOCTLFUNCTION || datum-=
>xperms->specified =3D=3D AVTAB_XPERMS_IOCTLDRIVER) {
+			xperm =3D (char *) "ioctl";
+		} else if (datum->xperms->specified =3D=3D AVTAB_XPERMS_NLMSG) {
+			xperm =3D (char *) "nlmsg";
+		} else {
+			ERR(NULL, "Unknown extended permssion");
+			goto exit;
+		}
 		rule =3D create_str("(%s %s %s (%s %s (%s)))",
-				  flavor, src, tgt, "ioctl", class, perms);
+				  flavor, src, tgt, xperm, class, perms);
 		free(perms);
 	} else {
 		new =3D pdb->p_type_val_to_name[data - 1];
diff --git a/libsepol/src/module_to_cil.c b/libsepol/src/module_to_cil.c
index 2dbf137e..79636897 100644
--- a/libsepol/src/module_to_cil.c
+++ b/libsepol/src/module_to_cil.c
@@ -630,7 +630,8 @@ static int xperms_to_cil(const av_extended_perms_t *xpe=
rms)
 	int first =3D 1;
=20
 	if ((xperms->specified !=3D AVTAB_XPERMS_IOCTLFUNCTION)
-		&& (xperms->specified !=3D AVTAB_XPERMS_IOCTLDRIVER))
+		&& (xperms->specified !=3D AVTAB_XPERMS_IOCTLDRIVER)
+		&& (xperms->specified !=3D AVTAB_XPERMS_NLMSG))
 		return -1;
=20
 	for (bit =3D 0; bit < sizeof(xperms->perms)*8; bit++) {
@@ -652,7 +653,8 @@ static int xperms_to_cil(const av_extended_perms_t *xpe=
rms)
 		else
 			first =3D 0;
=20
-		if (xperms->specified & AVTAB_XPERMS_IOCTLFUNCTION) {
+		if ((xperms->specified =3D=3D AVTAB_XPERMS_IOCTLFUNCTION)
+		 || (xperms->specified =3D=3D AVTAB_XPERMS_NLMSG)) {
 			value =3D xperms->driver<<8 | bit;
 			if (in_range) {
 				low_value =3D xperms->driver<<8 | low_bit;
@@ -661,7 +663,7 @@ static int xperms_to_cil(const av_extended_perms_t *xpe=
rms)
 			} else {
 				cil_printf("0x%hx", value);
 			}
-		} else if (xperms->specified & AVTAB_XPERMS_IOCTLDRIVER) {
+		} else if (xperms->specified =3D=3D AVTAB_XPERMS_IOCTLDRIVER) {
 			value =3D bit << 8;
 			if (in_range) {
 				low_value =3D low_bit << 8;
@@ -680,6 +682,7 @@ static int avrulex_to_cil(int indent, struct policydb *=
pdb, uint32_t type, const
 {
 	int rc =3D -1;
 	const char *rule;
+	const char *xperm;
 	const struct class_perm_node *classperm;
=20
 	switch (type) {
@@ -701,10 +704,19 @@ static int avrulex_to_cil(int indent, struct policydb=
 *pdb, uint32_t type, const
 		goto exit;
 	}
=20
+	if (xperms->specified =3D=3D AVTAB_XPERMS_IOCTLFUNCTION || xperms->specif=
ied =3D=3D AVTAB_XPERMS_IOCTLDRIVER) {
+		xperm =3D "ioctl";
+	} else if (xperms->specified =3D=3D AVTAB_XPERMS_NLMSG) {
+		xperm =3D "nlmsg";
+	} else {
+		ERR(NULL, "Unkown avrule xperms->specified: %i", xperms->specified);
+		rc =3D -1;
+		goto exit;
+	}
 	for (classperm =3D classperms; classperm !=3D NULL; classperm =3D classpe=
rm->next) {
 		cil_indent(indent);
 		cil_printf("(%s %s %s (%s %s (", rule, src, tgt,
-			   "ioctl", pdb->p_class_val_to_name[classperm->tclass - 1]);
+			   xperm, pdb->p_class_val_to_name[classperm->tclass - 1]);
 		xperms_to_cil(xperms);
 		cil_printf(")))\n");
 	}
diff --git a/libsepol/src/policydb_validate.c b/libsepol/src/policydb_valid=
ate.c
index 121fd46c..5035313b 100644
--- a/libsepol/src/policydb_validate.c
+++ b/libsepol/src/policydb_validate.c
@@ -921,6 +921,7 @@ static int validate_xperms(const avtab_extended_perms_t=
 *xperms)
 	switch (xperms->specified) {
 	case AVTAB_XPERMS_IOCTLDRIVER:
 	case AVTAB_XPERMS_IOCTLFUNCTION:
+	case AVTAB_XPERMS_NLMSG:
 		break;
 	default:
 		goto bad;
@@ -1067,6 +1068,7 @@ static int validate_avrules(sepol_handle_t *handle, c=
onst avrule_t *avrule, int
 			switch (avrule->xperms->specified) {
 			case AVRULE_XPERMS_IOCTLFUNCTION:
 			case AVRULE_XPERMS_IOCTLDRIVER:
+			case AVRULE_XPERMS_NLMSG:
 				break;
 			default:
 				goto bad;
diff --git a/libsepol/src/util.c b/libsepol/src/util.c
index b1eb9b38..a4befbd9 100644
--- a/libsepol/src/util.c
+++ b/libsepol/src/util.c
@@ -146,7 +146,8 @@ char *sepol_extended_perms_to_string(const avtab_extend=
ed_perms_t *xperms)
 	size_t remaining, size =3D 128;
=20
 	if ((xperms->specified !=3D AVTAB_XPERMS_IOCTLFUNCTION)
-		&& (xperms->specified !=3D AVTAB_XPERMS_IOCTLDRIVER))
+		&& (xperms->specified !=3D AVTAB_XPERMS_IOCTLDRIVER)
+		&& (xperms->specified !=3D AVTAB_XPERMS_NLMSG))
 		return NULL;
=20
 retry:
@@ -158,7 +159,12 @@ retry:
 	buffer =3D p;
 	remaining =3D size;
=20
-	len =3D snprintf(p, remaining, "ioctl { ");
+	if ((xperms->specified =3D=3D AVTAB_XPERMS_IOCTLFUNCTION)
+		|| (xperms->specified =3D=3D AVTAB_XPERMS_IOCTLDRIVER)) {
+		len =3D snprintf(p, remaining, "ioctl { ");
+	} else {
+		len =3D snprintf(p, remaining, "nlmsg { ");
+	}
 	if (len < 0 || (size_t)len >=3D remaining)
 		goto err;
 	p +=3D len;
@@ -179,7 +185,7 @@ retry:
 			continue;
 		}
=20
-		if (xperms->specified & AVTAB_XPERMS_IOCTLFUNCTION) {
+		if (xperms->specified =3D=3D AVTAB_XPERMS_IOCTLFUNCTION || xperms->speci=
fied =3D=3D AVTAB_XPERMS_NLMSG) {
 			value =3D xperms->driver<<8 | bit;
 			if (in_range) {
 				low_value =3D xperms->driver<<8 | low_bit;
@@ -187,7 +193,7 @@ retry:
 			} else {
 				len =3D snprintf(p, remaining, "0x%hx ", value);
 			}
-		} else if (xperms->specified & AVTAB_XPERMS_IOCTLDRIVER) {
+		} else if (xperms->specified =3D=3D AVTAB_XPERMS_IOCTLDRIVER) {
 			value =3D bit << 8;
 			if (in_range) {
 				low_value =3D low_bit << 8;
--=20
2.46.0.184.g6999bdac58-goog


