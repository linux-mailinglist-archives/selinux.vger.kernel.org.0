Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 71BA0121D94
	for <lists+selinux@lfdr.de>; Mon, 16 Dec 2019 23:29:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728522AbfLPW1b (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Mon, 16 Dec 2019 17:27:31 -0500
Received: from sonic306-28.consmr.mail.ne1.yahoo.com ([66.163.189.90]:35088
        "EHLO sonic306-28.consmr.mail.ne1.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727976AbfLPWZw (ORCPT
        <rfc822;selinux@vger.kernel.org>); Mon, 16 Dec 2019 17:25:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1576535151; bh=pk4OM2anm1/C+LQ96dtDYWeHAfHr5wLruGqEfoA0KyY=; h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject; b=lXU0LkbdrESxOfrdn4xmp5qGdHpGX4r42WOcujBm8skPdlVpu6iOVjfUYe4P2hKnoFpKbRobMCBQ2qb8+sw7QoA2WkPDMI77I4UDX6wMs5FQFO7KjcQCgvBUWaFJe9OiJtlcTL4cFz6LtVVrh1WtrhXAL/OPQljDzqixIEL1VghF2iI0keGKGVNjEcAOB7ixg51hQXqLopiOrUTxtaLq8J0nnE2kck+Dmf9tBkheEHgJbav5ixwfj8pEdUKYJTooWe1toN8qT3SwFHS0WHD+7kxmlUOrGaoFkpJrSGP77o98moDQma+LEKlhDKw94IgrZ4iC612dkgXwPnHDmeZSkw==
X-YMail-OSG: EOSHJDsVM1mOhuYYPl_cXXeuHvFRJU87DA6RKtOoGHz9wDxfoiIVSe9C2nQM1Fw
 lc_9Jru.i.LZn6UL1P3qv6mL4TiL5NsTIKukqPSzZGS1j_LEjNdAej2V9E.jeuHWfo_3eob98pc8
 6VyNqzUjbCiCnBkT4fFuBzC.rwWsY4x.EiFGY5fjWZG3BrRBnPvQRgVtdsrb5PjyUEVEmZg7fvbQ
 YhfobkW34KyBQ4sWo.GPwD4rp21ezmv9pFU8D4.lLx8Ls88UjeT93CszjV9e5u97NTF1GwHC0aGH
 iO.l2XUSdP.ifRSHbznvErL6RWmB3H9ClY9WK1eJteatiOek1cdiBT6MZcXMGa_EZqPyzAD6qnWs
 _oNUYwT5pMGxwBU5p872niiaz8EnxZKbeaE3hZqPqnH8En6rLE.kRwh4Y.bGKy1cHYz5Mbk2kPU5
 6UmZPGTlAKovFa2vvyBWDhRE.3h18n2xYy3ndJDHPWXJz.xG0lI4yURA_DHA_rYFz6Ed94xyCPPn
 g6hz96Ae4LtJPOpR7KcmW3uIOJrjJ4SpQGpB0Ks21gvZx4KAUIs7QEyn.aJT1yBSmi.K2H9.vhhK
 i_yw6Si3QdnuF6j9Jqor.jlx25DVXPH73XmDyNLEAlk9yoKnqC3.G9xxfSKIkhhZLeAQ_MdIjHHy
 VYr5w.V9QTt8hAJ_M64YhYh_UKkPVPvKQR77lHqauzjyKQz4Zu29qdAhZx7YJY1KUz_Oe8QVYAwm
 wGtl4N1A6fpcLbv8b3BNAWMh3tImLz491q4IYUNyOaq0bUT0v0lIU6PTvoIpWoGtLcmfhDjOoC6N
 sVtkj24dmoQws_EZ_74qRz1WTSoXnnecPe6MZSyCS3ROC3cOq4gYzMZwPPitOGfmTHjUHoYaxMVD
 8Tp2i4aDIQfJADCaRB05TsfzSZ47j5QvMwSrrnEDCF76dRhMURGGP1zplFRryMfxuW1P3bBftume
 cFSi0mGNOj45RnDUcjznlTAXu9i62AuQsbcxBQ.lg7NoiQlxZ1gQzBaA2lNOZPlLF9MdIIUE3jay
 oLNvbuK9l2zi7N6FYMyBpMiicuGny1ly04nTr9WzVpj2z8.99XoK55smyAvFylnHRi9EhLAnYiOO
 7RnTsR9C4hd5sfYUIKRkhR2rLOFn2aKN8knrGOVu0t6xbgTW1eCxgyOsAZUiG1Wz7yis0TLPtW79
 .u4DpiU0Skz6HLNf2DprE2sWJfPKQaaivVwG.6_xPDMcQHe1_w32jG1B0uPNc0K18cvRtIX6Qf9Z
 x3PfK7qXCXecGJpnwPyVWD9qqwD58N7mCrsPXI1tKTusQ2P_gJ0TY6rVgFyagohtFX0u.EMXSiLW
 xDjgkjpt_ecXNclidtpB3MemAhi7CboTpov_RvT03ytp3ZIAbsP2YVEn21uK3RFSzHg9FMKW12oG
 3FQ4HgN53jjeMknrkXkm01qk5ZCzWHu0L0hVPzgX1v3h6WVbOQlPkUcyXT2J7wmwF
Received: from sonic.gate.mail.ne1.yahoo.com by sonic306.consmr.mail.ne1.yahoo.com with HTTP; Mon, 16 Dec 2019 22:25:51 +0000
Received: by smtp426.mail.gq1.yahoo.com (Oath Hermes SMTP Server) with ESMTPA ID ad449dcdff93ede6e1b6227b68a93c45;
          Mon, 16 Dec 2019 22:25:46 +0000 (UTC)
From:   Casey Schaufler <casey@schaufler-ca.com>
To:     casey.schaufler@intel.com, jmorris@namei.org,
        linux-security-module@vger.kernel.org, selinux@vger.kernel.org
Cc:     keescook@chromium.org, john.johansen@canonical.com,
        penguin-kernel@i-love.sakura.ne.jp, paul@paul-moore.com,
        sds@tycho.nsa.gov
Subject: [PATCH v12 16/25] LSM: Use lsmcontext in security_dentry_init_security
Date:   Mon, 16 Dec 2019 14:24:22 -0800
Message-Id: <20191216222431.4956-17-casey@schaufler-ca.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191216222431.4956-1-casey@schaufler-ca.com>
References: <20191216222431.4956-1-casey@schaufler-ca.com>
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
index a30e36654c57..78d63f7f0088 100644
--- a/fs/nfs/nfs4proc.c
+++ b/fs/nfs/nfs4proc.c
@@ -112,6 +112,7 @@ static inline struct nfs4_label *
 nfs4_label_init_security(struct inode *dir, struct dentry *dentry,
 	struct iattr *sattr, struct nfs4_label *label)
 {
+	struct lsmcontext context;
 	int err;
 
 	if (label == NULL)
@@ -121,21 +122,26 @@ nfs4_label_init_security(struct inode *dir, struct dentry *dentry,
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
index 00421941f683..a5eba06a9382 100644
--- a/include/linux/security.h
+++ b/include/linux/security.h
@@ -398,8 +398,8 @@ int security_add_mnt_opt(const char *option, const char *val,
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
@@ -790,8 +790,7 @@ static inline void security_inode_free(struct inode *inode)
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
index 4ba1a6ed36e0..8aa107b57af9 100644
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

