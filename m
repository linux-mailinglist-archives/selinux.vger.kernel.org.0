Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4E9FD571A0
	for <lists+selinux@lfdr.de>; Wed, 26 Jun 2019 21:23:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726596AbfFZTXV (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Wed, 26 Jun 2019 15:23:21 -0400
Received: from sonic314-27.consmr.mail.ne1.yahoo.com ([66.163.189.153]:44193
        "EHLO sonic314-27.consmr.mail.ne1.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726579AbfFZTXT (ORCPT
        <rfc822;selinux@vger.kernel.org>); Wed, 26 Jun 2019 15:23:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1561576998; bh=pP6bAwvzvgolalnY6hLE5nCCrUSemGm0P6InO7TN/zI=; h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject; b=etR+qqF0a2Z8FC0TOJf01Y6/exfpqj9kkbHwgMSPDOhdt6mSP/DS5Li0LsOsroQbDKWjhmg4j0tw2wwu185XgflZ1mvzt9uqGWJNgNA9YV+SpZZ7rtTGABhwsovO+Rjy6gqPiV789tbmVipcYbupmNfEYpPRVdDAEozH1175aWJTf7xkOremAPYSP0ygjJnczDsQUO7JMureLYFtv89Y5SYDwmCJYA7d8Jn4DooRbmH04Uk5ZyICcWwEWITZjJq8+vl+dyUGMdKaEwuAmRK8Bxbw5bqy0aMWK8sSPwGOglMpHo47HB/GAFn/MuB/1yvMjEBrUNfpdxVAljPubjF9kA==
X-YMail-OSG: jsgsyp0VM1kQxO8QRyLHXT.oQEZI8m9aIFgPDU1zLSzQC8OH0cOrgy_R59nQPF5
 rFhfaefk3JL9Uo0ydrYZflA54QwQg0BJYRI8CvZSZKDnv3V7QY0oUDzagkTu3tL.VQiq83jmgCx.
 IOdeB.RmGpLkCYuwhUOAeN0Ia6iThzWouRwWz0mxiw5Ly4yr9IL3Bu4_awVazEgI9TyuSGrmsa01
 f03kC8XXsCoAl_qiSgRqrSxqibqBTRuoHETPBlElmKNbb3HSS7nXfmJtl1VfqmD3fukxBO5q2jxO
 05pMa_4A2fVGCXui9Dzg_qSVxKOvGGbS.m5g9TjQdgWy6o8CpJLCD4NwuPPrW2GIE1TjIm.69Vk1
 IgiLosMWiCprK7QcFH.1yzvTSCkpaI06MgPhu6_xtkfMxg6Cbbds_r5RJm9Gl9O6JQZkLVYpYH5o
 2OCRH8KoYy0YoKZOw_dCO40EnmjtcgE_RDxsprDzRdq4s3NddRxIoaZmmZaeHvFATCED7bnqSpOQ
 oxJlSAG6pH70L6M0o0X_jB__SoeYgfHSCd_YnRcmtsq.k8N5ltm6rbeCub3o.UsBqz4rp78dMc_H
 vcfx1nG67bHOo1fEiw.Bo1P05UKMktKgYRVN_KrcYZZYc_JH9N8k95XVmfJjjPZzaePmfabf0JSC
 kIEjDvWpCfiCfFRX3raGeV1FrGzgYn7CUSw7Eb2ifwR_AXxPscVa7rgXl8qUUe8.KOsJGxYSS4OS
 y.cUy3_mGN.MLYC1o1EDmAAiysAPnmz9o5cBvCHD7edmk35GZKLZ04xyU9ZzbxtfnK2N_6Md8mim
 O1FE8mR2oHK__f2QP1pj31bvO6a6wjyHVCC1xk60pF2S2rp57qwmsrHSdNyDsF1xR_JNSr2H60hc
 8cL0W_2AySw3FQaNyhXFFZ6qkKjMKjhz1jA8hNvplsvnvSJ0iJQbj7oXCpBBi0qTYLaGFfl.LBwU
 draraxR3khyMNB7NIBdb0E4paxaxgHkyDcB8k94CpXgBjt.pL1AFJZwNa0SXD1fyCpPAHxgfqsQJ
 nKzfn0LcnHlT0kRR9Ku7AmaE8rVa3OIgPE_3JDHal_cQHsXQmwzD8h9m_jXR7Blf.y75VWBQLSpp
 JeA3IxofiBwktFqEghPwibq5jWj2BMvGQ6_jpp6xyfe8tExW4MeGnJnQExFmHY8O6wDkN8FLu7Hl
 7RwviWES8puigu04DursqNr0p0RPhe_GYUzO_hcmn7OknnL6ceMC3F.Oume597b6Qu.x4LwNJWhP
 1.49o5ut.FH80dB.NP9Ft.6ssHD_RZ4sb_B5mXTR00yRiO8FH
Received: from sonic.gate.mail.ne1.yahoo.com by sonic314.consmr.mail.ne1.yahoo.com with HTTP; Wed, 26 Jun 2019 19:23:18 +0000
Received: from c-73-223-4-185.hsd1.ca.comcast.net (EHLO localhost.net) ([73.223.4.185])
          by smtp422.mail.ne1.yahoo.com (Oath Hermes SMTP Server) with ESMTPA ID b8c135b07bec32b448265b8073874548;
          Wed, 26 Jun 2019 19:23:14 +0000 (UTC)
From:   Casey Schaufler <casey@schaufler-ca.com>
To:     casey.schaufler@intel.com, jmorris@namei.org,
        linux-security-module@vger.kernel.org, selinux@vger.kernel.org
Cc:     casey@schaufler-ca.com, keescook@chromium.org,
        john.johansen@canonical.com, penguin-kernel@i-love.sakura.ne.jp,
        paul@paul-moore.com, sds@tycho.nsa.gov
Subject: [PATCH v4 18/23] LSM: Use lsmcontext in security_dentry_init_security
Date:   Wed, 26 Jun 2019 12:22:29 -0700
Message-Id: <20190626192234.11725-19-casey@schaufler-ca.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190626192234.11725-1-casey@schaufler-ca.com>
References: <20190626192234.11725-1-casey@schaufler-ca.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Change the security_dentry_init_security() interface to
fill an lsmcontext structure instead of a void * data area
and a length. The lone caller of this interface is NFS4,
which may make copies of the data using its own mechanisms.
A rework of the nfs4 code to use the lsmcontext properly
is a significant project, so the coward's way out is taken,
and the lsmcontext data from security_dentry_init_security()
is copied, then released directly.

Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
---
 fs/nfs/nfs4proc.c        | 26 ++++++++++++++++----------
 include/linux/security.h |  7 +++----
 security/security.c      | 19 +++++++++++++++----
 3 files changed, 34 insertions(+), 18 deletions(-)

diff --git a/fs/nfs/nfs4proc.c b/fs/nfs/nfs4proc.c
index af1c0db29c39..952f805965bb 100644
--- a/fs/nfs/nfs4proc.c
+++ b/fs/nfs/nfs4proc.c
@@ -113,6 +113,7 @@ static inline struct nfs4_label *
 nfs4_label_init_security(struct inode *dir, struct dentry *dentry,
 	struct iattr *sattr, struct nfs4_label *label)
 {
+	struct lsmcontext context;
 	int err;
 
 	if (label == NULL)
@@ -122,21 +123,26 @@ nfs4_label_init_security(struct inode *dir, struct dentry *dentry,
 		return NULL;
 
 	err = security_dentry_init_security(dentry, sattr->ia_mode,
-				&dentry->d_name, (void **)&label->label, &label->len);
-	if (err == 0)
-		return label;
+					    &dentry->d_name, &context);
+
+	if (err)
+		return NULL;
+
+	label->label = kmemdup(context.context, context.len, GFP_KERNEL);
+	if (label->label == NULL)
+		label = NULL;
+	else
+		label->len = context.len;
+
+	security_release_secctx(&context);
+
+	return label;
 
-	return NULL;
 }
 static inline void
 nfs4_label_release_security(struct nfs4_label *label)
 {
-	struct lsmcontext scaff; /* scaffolding */
-
-	if (label) {
-		lsmcontext_init(&scaff, label->label, label->len, 0);
-		security_release_secctx(&scaff);
-	}
+	kfree(label->label);
 }
 static inline u32 *nfs4_bitmask(struct nfs_server *server, struct nfs4_label *label)
 {
diff --git a/include/linux/security.h b/include/linux/security.h
index 7255825aa697..2674eb70c2d7 100644
--- a/include/linux/security.h
+++ b/include/linux/security.h
@@ -352,8 +352,8 @@ int security_sb_clone_mnt_opts(const struct super_block *oldsb,
 int security_add_mnt_opt(const char *option, const char *val,
 				int len, void **mnt_opts);
 int security_dentry_init_security(struct dentry *dentry, int mode,
-					const struct qstr *name, void **ctx,
-					u32 *ctxlen);
+					const struct qstr *name,
+					struct lsmcontext *ctx);
 int security_dentry_create_files_as(struct dentry *dentry, int mode,
 					struct qstr *name,
 					const struct cred *old,
@@ -724,8 +724,7 @@ static inline void security_inode_free(struct inode *inode)
 static inline int security_dentry_init_security(struct dentry *dentry,
 						 int mode,
 						 const struct qstr *name,
-						 void **ctx,
-						 u32 *ctxlen)
+						 struct lsmcontext *ctx)
 {
 	return -EOPNOTSUPP;
 }
diff --git a/security/security.c b/security/security.c
index 97b468f6e6a9..61cdc6bcd32e 100644
--- a/security/security.c
+++ b/security/security.c
@@ -1024,11 +1024,22 @@ void security_inode_free(struct inode *inode)
 }
 
 int security_dentry_init_security(struct dentry *dentry, int mode,
-					const struct qstr *name, void **ctx,
-					u32 *ctxlen)
+				  const struct qstr *name,
+				  struct lsmcontext *cp)
 {
-	return call_int_hook(dentry_init_security, -EOPNOTSUPP, dentry, mode,
-				name, ctx, ctxlen);
+	int *display = current->security;
+	struct security_hook_list *hp;
+
+	hlist_for_each_entry(hp, &security_hook_heads.dentry_init_security,
+			     list)
+		if (*display == LSMBLOB_INVALID ||
+		    *display == hp->lsmid->slot) {
+			cp->slot = hp->lsmid->slot;
+			return hp->hook.dentry_init_security(dentry, mode,
+					name, (void **)&cp->context, &cp->len);
+		}
+
+	return -EOPNOTSUPP;
 }
 EXPORT_SYMBOL(security_dentry_init_security);
 
-- 
2.20.1

