Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A36B0FB742
	for <lists+selinux@lfdr.de>; Wed, 13 Nov 2019 19:20:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728401AbfKMSU6 (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Wed, 13 Nov 2019 13:20:58 -0500
Received: from sonic306-27.consmr.mail.ne1.yahoo.com ([66.163.189.89]:41490
        "EHLO sonic306-27.consmr.mail.ne1.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728325AbfKMSU6 (ORCPT
        <rfc822;selinux@vger.kernel.org>); Wed, 13 Nov 2019 13:20:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1573669257; bh=5a1Bn2oGXej0Jcc78dgWtIiwCtWaGO4LPz5VJ3J/aYQ=; h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject; b=pPLTKrVhj3MDhcoDIWNCzjEitUVnKPGKO1K4zPjpd7N0SGb/OmeW1AfExdubMoyI2OFNGtThO+cSRxfCUvkggUhzGOjbP/IRn5xWaXeJTaQzaZth4CgA/h1/SW/+i+fPu7SITk1eCkH5kazBUhqaS2GnhQdND+2S3i4CK9RtTPkgB9J8NBXYM6H/8kY1/rQJJz0fWsJBlSnBmgUn38+JjAKIWj4rKghrmMoVVyDjZenQlVm54NIQZKBKOa+ApX6xey4A3VFQebUFigwJVThCs3qoUAf6UsEvaOSTZGT29WKO0wTRWyfWtjqbClvBGNS4JsqcQpgLriQamTBw2DFkDg==
X-YMail-OSG: dlUkSZQVM1kXXZfGh_p5ZV2TozbIXjYq0Hg.Z71Rk8BHcMfr9tuTOX50cngrwhi
 GLtPjHpqiSIkAvx8XFfIiClPZuuvZ9.r.tXh0GEtY0bdOpqBq.j774YAdxI8ynN1UYJfaDq7mBaY
 ZYGlqpb_Ut8.fh6Flh0fDyc9SCP6eT53hTLV4nTw5Wfj6qGPOaR6YgJY8A_iP8F4L3xIpFAB2r3y
 c5lQET3cJxZMdLlwIeuhEI4xHQvnjCnPi0LmljELae4egLMy.HeVRmX1mxLig3_SbskDhSQUPkpB
 vIKkpg0szy5U3eKJMj9kl137sqCarfweVwHUDswqYpa9EeZF4x.W2.R9nK2ClgkMe8dQUZKyNJ9R
 nbAQKhKmrEtQsyh6hOboZev7CWpWSgkKXFCEBjGeaIraWQ9NGOKK.oAcURQTZH2iPKsU28denXxP
 kP6cr0_toqwBEHAnNoSucjg6RZxBxKoo_XoOyf2t7_UtDJG6.Q_RX88BJ2Tphx1JALbsq0BZ8ZVv
 oSOD_Ps_dZqA0gmyFwu91AKmE_D6f2jAQVVCaiBrrG2gtU9pFVNSXtfacFXGDj1UHrVSdtuHpEKc
 imW4Srg.xssvZ2.94jTqY_ItiV1o8jF9rkxOdyM2irAUZPSAbcU2Yz.teaJZsbNuHLG.zCZ_Uq7m
 roZmYX9dT_nDdrJ49JNKiRYALhmWajYUd4WyXqTzzm0k5ono3817XJKkZislN1NHKG9JniOhcslc
 jwuWLT4SZpS7ucSQwAv3lfXumsl.CsqpI3muhORrYM16nion6fZIIfSl1M59I649r_w_RzS3SkHK
 6bHCmNtnchgtNYJCMqRHfi9qHbS0MDBGFczYIt.eLp9GYL3Wvu4uCIDtrRCMeGak6w9DOJXRfcFw
 RjG0F1CRULVZS6K6IqLGdpa8zQfwZrnoVs5.KfTEtMPaQWli98Gy4Du1DqmO9myWsikGDjl3jJL8
 0GOHb8RFRkbzPdPJ70TzfSWZK26r50yrdvwYC1cfk8ND4rB.bxJvcUIah5yv5SCFjTpcWNANuNbt
 YM43qDzUfy3O6NvMsHs5SUOkR3FUoUH6B4PzInYcUytX2.npntRbHT.hlgfTvNqJ4LnZQ6Ro52Ua
 Visvs3t0PI_1wt8sofq1JnIY7cx8KFR6ZH5.mjJz30IBxWXptY0nBxkmerfCWFxgPgq4hzKczMA5
 ZVk4.7smqgngsXONC3MAqyXf4eg6r_X7irUhuv5afBU3SUJKpjEIHyMtHKbAI.DYUm1bwoRMvK7a
 yOhCVFHmrDKh63TrG9Q97m9d1AQmRikZsPHLiBJfWMA2.PtzlZ_2Tz_RI7BZ1P230hlKR6VgPh6f
 caIiX18HtPa25Zm0EFcXHWiR4gNO6dlvBfUBmRp1ERbEDZbk8Q.pS2JPXlyQwMdj_mwWrpyp.sA8
 lNZVZv9c3dDUCO7y_G0.hJtYJCVJLWQBcbsRkVszdK5udnIaGasWjnZDGv27LmYtB2sA-
Received: from sonic.gate.mail.ne1.yahoo.com by sonic306.consmr.mail.ne1.yahoo.com with HTTP; Wed, 13 Nov 2019 18:20:57 +0000
Received: by smtp405.mail.gq1.yahoo.com (Oath Hermes SMTP Server) with ESMTPA ID 2a1c85ac4bdbf5da4ba3fd738885b7e0;
          Wed, 13 Nov 2019 18:20:52 +0000 (UTC)
From:   Casey Schaufler <casey@schaufler-ca.com>
To:     casey.schaufler@intel.com, jmorris@namei.org,
        linux-security-module@vger.kernel.org, selinux@vger.kernel.org
Cc:     keescook@chromium.org, john.johansen@canonical.com,
        penguin-kernel@i-love.sakura.ne.jp, paul@paul-moore.com,
        sds@tycho.nsa.gov
Subject: [PATCH v11 16/25] LSM: Use lsmcontext in security_dentry_init_security
Date:   Wed, 13 Nov 2019 10:19:16 -0800
Message-Id: <20191113181925.2437-17-casey@schaufler-ca.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191113181925.2437-1-casey@schaufler-ca.com>
References: <20191113181925.2437-1-casey@schaufler-ca.com>
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

This interface does not use the "display". There is currently
not case where that is useful or reasonable.

Reviewed-by: Kees Cook <keescook@chromium.org>
Reviewed-by: John Johansen <john.johansen@canonical.com>
Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
---
 fs/nfs/nfs4proc.c        | 26 ++++++++++++++++----------
 include/linux/security.h |  7 +++----
 security/security.c      | 29 +++++++++++++++++++++++++----
 3 files changed, 44 insertions(+), 18 deletions(-)

diff --git a/fs/nfs/nfs4proc.c b/fs/nfs/nfs4proc.c
index 74e9f4b7cc07..2f76741ee528 100644
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
index e47cef3d62f0..3e333104720d 100644
--- a/include/linux/security.h
+++ b/include/linux/security.h
@@ -396,8 +396,8 @@ int security_add_mnt_opt(const char *option, const char *val,
 				int len, void **mnt_opts);
 int security_move_mount(const struct path *from_path, const struct path *to_path);
 int security_dentry_init_security(struct dentry *dentry, int mode,
-					const struct qstr *name, void **ctx,
-					u32 *ctxlen);
+					const struct qstr *name,
+					struct lsmcontext *ctx);
 int security_dentry_create_files_as(struct dentry *dentry, int mode,
 					struct qstr *name,
 					const struct cred *old,
@@ -788,8 +788,7 @@ static inline void security_inode_free(struct inode *inode)
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
index 618d4f90936b..6f43dafe1249 100644
--- a/security/security.c
+++ b/security/security.c
@@ -1011,12 +1011,33 @@ void security_inode_free(struct inode *inode)
 				inode_free_by_rcu);
 }
 
+/*
+ * security_dentry_init_security - initial context for a dentry
+ * @dentry: directory entry
+ * @mode: access mode
+ * @name: path name
+ * @context: resulting security context
+ *
+ * Use at most one security module to get the initial
+ * security context. Do not use the "display".
+ *
+ * Returns -EOPNOTSUPP if not supplied by any module or the module result.
+ */
 int security_dentry_init_security(struct dentry *dentry, int mode,
-					const struct qstr *name, void **ctx,
-					u32 *ctxlen)
+				  const struct qstr *name,
+				  struct lsmcontext *cp)
 {
-	return call_int_hook(dentry_init_security, -EOPNOTSUPP, dentry, mode,
-				name, ctx, ctxlen);
+	struct security_hook_list *hp;
+
+	hlist_for_each_entry(hp, &security_hook_heads.dentry_init_security,
+			     list) {
+		cp->slot = hp->lsmid->slot;
+		return hp->hook.dentry_init_security(dentry, mode, name,
+						     (void **)&cp->context,
+						     &cp->len);
+	}
+
+	return -EOPNOTSUPP;
 }
 EXPORT_SYMBOL(security_dentry_init_security);
 
-- 
2.20.1

