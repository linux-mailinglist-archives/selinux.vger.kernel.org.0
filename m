Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1867B121E58
	for <lists+selinux@lfdr.de>; Mon, 16 Dec 2019 23:37:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727644AbfLPWh4 (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Mon, 16 Dec 2019 17:37:56 -0500
Received: from sonic306-28.consmr.mail.ne1.yahoo.com ([66.163.189.90]:42914
        "EHLO sonic306-28.consmr.mail.ne1.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727738AbfLPWh4 (ORCPT
        <rfc822;selinux@vger.kernel.org>); Mon, 16 Dec 2019 17:37:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1576535874; bh=pk4OM2anm1/C+LQ96dtDYWeHAfHr5wLruGqEfoA0KyY=; h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject; b=e8/MEWXmiX0PDwzcd5hoqxf6uXdNXWOi2NDRqIDSDrB8m2yYtGMsIqeMg/S/+K7zkAWxzXArZOCV/clbRwJyvdbr2zM8zlJ65/Vg7Hvx7Ae3UcaJomInM+N9059zHZUylwrvJj7O+0pJ9yg8VxVcMiG1egcPizr+Prd2RmE/OY6Q9mIXUVmCqPzNdTxj0Spc/LZDet2cAsMLj/+AFog9tu5ck6QD4RoBMV2y115Pdc8KYUZy9WLbfJxKrJPQssh/ATOx6OnynS3JhpQe+LXEjcdmMNRODrgg9zEiT5QIiIwxaOZTauwCV5xiONHfjKjPwfE9FHb+l8dsEkPOYOxheg==
X-YMail-OSG: dukP4mQVM1kn4ZkTV2KsZ6WYDM6xdkMJ4h2VJ34HZTSMmlcITKyX1ATAGNPUKjl
 wrJ2JWh79ut1IqKcYavXH9puiIUPUtM3HHJlgtKPMuvDjv7UpEVYG4gkT2xpdjwwY4LPVIaNnz8b
 P8Tb4Y6pbkFFUBYzxIpXxQUPYTdl1LrBNlgp_Z6oF9r1SrlxquHWYmz2hZaXMndV7MFmetz3Fi1y
 YiwamyQ0TMnMxzxM8kjtMFQJT.aPZZ1r6rx5YogeQRvvSkaU_KI2R9IWfkmVNYFrwN19e7X2BcWy
 H5vGfD_HUYAcudsj6kGZbltyZ5hQgJ30BYGN.SNQ2EjItftMqrQIABqSkfbEd6Vym7mu93jSTtjv
 ijPSoU1A.GzUBtCy4yV2WqpiNNgMdxwmrg6axK1yJebzoOSqNywD97y6Gi2yBZDzTtClnUS_PZ9Q
 jTmJqlVzudQxmC24Ypvp9qmqr06d5tpxCtBlCIOGk8mxz0JWfKzdXI7f.717s7XE5lMoqTuE_oMZ
 J0OGvn77066F2_XS5iBlZQWeX93lGPrU74k.aaLthsl8qV.a_8UVTa2S6hnuZG27CMari.7bjjpe
 45NxJ9.ObyThP92aduO5.DAQmojFNO23VopdOhKv_WRyj0aDiVAeI24Ljaqm51pY8IbI4MMNAj_d
 iUBJwM4uQU77QdNB41b_shvSJWZ4XuKURTlC6LYLoZ47yedrRuudEx_Xql.eJBPp48JwBAYgNdqA
 WJcnCpUVIMnsJ21VV3ExA50R738awEIl4bEU.lu2gVkIYL3Ddmuf85ezog7cMOS8N66TLGrEbg8Z
 MGz_OWivngLpxL2w4PM9ahXUmC.JvA4q5AMALzMaQsDuDOE5KAKNlpq8jQvf2OPugIYFEyEpBogV
 xafrZtfh1FxK49EP2MWwVDa_Nqm6gsseCed7y6qr9xUBtbNIChn5wwNsiazOypQKCJwNoYyvSgy6
 tVkGUjVEm_OXIOQJCd0IOV4KWKMkEMTKVC8t1_ZPaMlVuQeXbzkxN_NGpJH.ONVCpZi1I_nuGT2g
 eAXRXxKs6k8rY.IFywnY4S7yq.V6ARcYCNu1PifKfTfrRqZoMyIz8qzGIEggf76Zfhx_8Ixqqdre
 O7X5dsHzehV7Tcp4RkwCcSHJ7zE7aAy4IT6191ifnsrrLqAvTaR1.lr6yjMQDd3wYvHSjvodf.G4
 uhNfVgT5sDzYox.lxlNPbLzPJZqaPMivZmI5cWqzCOqxuJ3sPFosSTWSODcdIKHDZZOZTyB3dj6S
 .GuZOgjWkEnQ44lPbPs0sBS2vUQDTxNulz.v6GdiW2u6xBYQt2LlRJi_498eRcIviVGfU.zgkhtc
 BJP60DpeH4b8Z20QfCFfZslyniIqqrCNRuH.rA.EtEwhZRiGaChoUeEsN6aQOru96k0G2Bg41D3N
 MMxfE8.InLYf65Yv6uVMrAozHCRPem04446VAUz5IsJpcApnpQwN1Wd0jzruPpwfaFx4-
Received: from sonic.gate.mail.ne1.yahoo.com by sonic306.consmr.mail.ne1.yahoo.com with HTTP; Mon, 16 Dec 2019 22:37:54 +0000
Received: by smtp425.mail.ne1.yahoo.com (Oath Hermes SMTP Server) with ESMTPA ID 8f9d0f9ff5e2996a72ce7cd8024969ae;
          Mon, 16 Dec 2019 22:37:52 +0000 (UTC)
From:   Casey Schaufler <casey@schaufler-ca.com>
To:     casey.schaufler@intel.com, jmorris@namei.org,
        linux-security-module@vger.kernel.org, selinux@vger.kernel.org
Cc:     keescook@chromium.org, john.johansen@canonical.com,
        penguin-kernel@i-love.sakura.ne.jp, paul@paul-moore.com,
        sds@tycho.nsa.gov
Subject: [PATCH v12 16/25] LSM: Use lsmcontext in security_dentry_init_security
Date:   Mon, 16 Dec 2019 14:36:12 -0800
Message-Id: <20191216223621.5127-17-casey@schaufler-ca.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191216223621.5127-1-casey@schaufler-ca.com>
References: <20191216223621.5127-1-casey@schaufler-ca.com>
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

