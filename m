Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C3AA731831
	for <lists+selinux@lfdr.de>; Sat,  1 Jun 2019 01:33:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727014AbfEaXdU (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Fri, 31 May 2019 19:33:20 -0400
Received: from sonic310-28.consmr.mail.gq1.yahoo.com ([98.137.69.154]:34489
        "EHLO sonic310-28.consmr.mail.gq1.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726934AbfEaXdI (ORCPT
        <rfc822;selinux@vger.kernel.org>); Fri, 31 May 2019 19:33:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1559345588; bh=e+8uXyTo2CH/SxRFMxOILZ2iZwykcjjY1wTO6Nmz4rg=; h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject; b=my9bxOsAj0+xCL4b52G31BQklG81FZRZ5Ol2dvigW7dHUZYuaiIebnzbidP3v1Edhjvt6JJIOClcCy5RPUyViAXGGnui6T91b1DFSr4yWkpylsk0/Wy817ehtjsncZR//FGjBsLzMqyvFECBfCQ+p8muizB8qtqwoCtCG5cDDiy8UnpTWZKsJbaL7OIR2oaoms+GO8oGZA3pmw2+0GMb01I0jQm3dIPp02Rcj5B2G3iS/iue/aaUAmlOQdTa8u5euUQ1FMIkWMzIfaaw3z92jkA2i4LT9ggsidKuUyi+oj8teTQqyJ7RSef8Vj1g+7O9RyDX4wUkFiK70Wbvho+DaA==
X-YMail-OSG: iIR1DJsVM1kc6VvlcHlNjQwtFdMorJRzLJImVcOZFb7bQzmMqEgKJAKoeTAkHpX
 3f06KxiYCLyBFYiGjPfGfqujlcBKv6yH9AgGxoamQVdkW6QWJWY2Qj54NXQ8uuy3GLdvEoPKSaRn
 9eaKGFP.OtKRbCUSRyVKcfqJWrCx4nfM1goOcDHdIQ6dHFsrTkLPmxURF1Q9ODhefkif23NC74ky
 vLOClgUxLBS18sWz_DcgSz2WDMAkeCx182cmfTAwX6CUPZrtZhvV4BtfufP.nwQOccNNEMYuxRtw
 qyrSedDZogt4aWSS2sqn7IS71c30S0xkrQxF3B1kYLQ3TcD4ZHZMm6i07h2_MY6PncTujPqsHY7e
 xuI5kcA4qXDJ_WFYhWmv4oSNM7FK0QinWak5F5Yo8fw2vrN0jNvcxMIC6X7.54cP73.WD.xlu50G
 TgME.8ig9fTpsjXXPaf1MuB2KW.0HAf2Pse7vOUflClh3fUPU.5oGtaaYN.e4tQM.dh9OtsUXMMA
 hc20uqH2I8kzV.xPBh7OFZ0HA8j7Di1q.XNXheLGCb4VPUx4UsLOw2wKwQvFosgS1axH_xCm0XM.
 YAhwAOjalHRueuTCqKwkL5NCmgfteM.2hQtf410K7V.268n.M1KySJCubDVxGsHPcJdekqgEUW7z
 bSZvbjBWM31qfcjreuKs2PxmFsLgf_jZ3pJtOgV32qd71uwR2i3BYlqVgRCvyiKimZ30OoC7J9YU
 uukbtt464BVgj0E.kVFdXfJrEnKn5X_nlyD8iJnK_lxt4mOHrcqFq3IK7v8ScyCU3w0QjtyPK5wN
 W1eX.224MHqIOPXjxyQXr6W4cQBU83TGOiypFUGvPBPJuBP_8ncHsFp03UCWJhqCzBQDQLdLsXqG
 yjCHIrZW6iwL2K08boApCCnEVGkjte8QJELulWFuytNaVwBqDv28IXMjKdESUJ.JtgLuqBdy3Ygt
 Yhq_5a_VIfPqw0CM6PJE7TTma8ngIYg1F9Rc.MmUX6SX0kB2YzKhXy17Beeno_sCUu8eArQa8PfG
 mGoZHOYSq7bsybE2C0cXDDVk55mMOF2kyj94sSJ2YgqU__XWjX9w.Vf9OdPVA092Xmgivs_7nxpf
 ScmMIYvT8Lmnb4PjxOQvjS0PlS9L7s2yvgiL7Zm4Mbmg_zWJNDXDux.JwL1GYrCj3jLJh80bb0tX
 J2aVpcQ5tg7fa75JxwdsUntY0cI7gVucNlpG3D2DxLjQEi9.cebxQYdcdI_krCRegfEH5gvT_cOv
 Tm5S4xgT3nZQdO3vPAYTebi4NWI2ONBYRzfP4PVMkQp1ccW8U30qA
Received: from sonic.gate.mail.ne1.yahoo.com by sonic310.consmr.mail.gq1.yahoo.com with HTTP; Fri, 31 May 2019 23:33:08 +0000
Received: from c-73-223-4-185.hsd1.ca.comcast.net (EHLO localhost.localdomain) ([73.223.4.185])
          by smtp426.mail.gq1.yahoo.com (Oath Hermes SMTP Server) with ESMTPA ID 0ff781cb969a300ef92504fa45022956;
          Fri, 31 May 2019 23:33:06 +0000 (UTC)
From:   Casey Schaufler <casey@schaufler-ca.com>
To:     casey.schaufler@intel.com, jmorris@namei.org,
        linux-security-module@vger.kernel.org, selinux@vger.kernel.org
Cc:     casey@schaufler-ca.com, keescook@chromium.org,
        john.johansen@canonical.com, penguin-kernel@i-love.sakura.ne.jp,
        paul@paul-moore.com, sds@tycho.nsa.gov
Subject: [PATCH 11/58] LSM: Use lsm_export in the secid_to_secctx hooks
Date:   Fri, 31 May 2019 16:31:02 -0700
Message-Id: <20190531233149.715-12-casey@schaufler-ca.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20190531233149.715-1-casey@schaufler-ca.com>
References: <20190531233149.715-1-casey@schaufler-ca.com>
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Convert the secid_to_secctx hooks to use the lsm_export
structure instead of a u32 secid. There is some scaffolding
involved that will be removed when security_secid_to_secctx()
is updated.

Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
---
 include/linux/lsm_hooks.h         | 5 +++--
 security/apparmor/include/secid.h | 2 +-
 security/apparmor/secid.c         | 6 ++----
 security/security.c               | 5 ++++-
 security/selinux/hooks.c          | 6 +++++-
 security/smack/smack_lsm.c        | 9 +++++++--
 6 files changed, 22 insertions(+), 11 deletions(-)

diff --git a/include/linux/lsm_hooks.h b/include/linux/lsm_hooks.h
index 01296e4ce474..433d98dcb928 100644
--- a/include/linux/lsm_hooks.h
+++ b/include/linux/lsm_hooks.h
@@ -1319,7 +1319,7 @@
  *	This does mean that the length could change between calls to check the
  *	length and the next call which actually allocates and returns the
  *	secdata.
- *	@secid contains the security ID.
+ *	@l points to the security information.
  *	@secdata contains the pointer that stores the converted security
  *	context.
  *	@seclen pointer which contains the length of the data
@@ -1664,7 +1664,8 @@ union security_list_options {
 	int (*getprocattr)(struct task_struct *p, char *name, char **value);
 	int (*setprocattr)(const char *name, void *value, size_t size);
 	int (*ismaclabel)(const char *name);
-	int (*secid_to_secctx)(u32 secid, char **secdata, u32 *seclen);
+	int (*secid_to_secctx)(struct lsm_export *l, char **secdata,
+				u32 *seclen);
 	int (*secctx_to_secid)(const char *secdata, u32 seclen, u32 *secid);
 	void (*release_secctx)(char *secdata, u32 seclen);
 
diff --git a/security/apparmor/include/secid.h b/security/apparmor/include/secid.h
index c283c620efe3..03369183f512 100644
--- a/security/apparmor/include/secid.h
+++ b/security/apparmor/include/secid.h
@@ -26,7 +26,7 @@ struct aa_label;
 #define AA_SECID_WILDCARD 1
 
 struct aa_label *aa_secid_to_label(struct lsm_export *l);
-int apparmor_secid_to_secctx(u32 secid, char **secdata, u32 *seclen);
+int apparmor_secid_to_secctx(struct lsm_export *l, char **secdata, u32 *seclen);
 int apparmor_secctx_to_secid(const char *secdata, u32 seclen, u32 *secid);
 void apparmor_release_secctx(char *secdata, u32 seclen);
 
diff --git a/security/apparmor/secid.c b/security/apparmor/secid.c
index 1546c45a2a18..ab4dc165e43e 100644
--- a/security/apparmor/secid.c
+++ b/security/apparmor/secid.c
@@ -81,15 +81,13 @@ static inline void aa_import_secid(struct lsm_export *l, u32 secid)
 	l->apparmor = secid;
 }
 
-int apparmor_secid_to_secctx(u32 secid, char **secdata, u32 *seclen)
+int apparmor_secid_to_secctx(struct lsm_export *l, char **secdata, u32 *seclen)
 {
 	/* TODO: cache secctx and ref count so we don't have to recreate */
-	struct lsm_export data;
 	struct aa_label *label;
 	int len;
 
-	aa_import_secid(&data, secid);
-	label = aa_secid_to_label(&data);
+	label = aa_secid_to_label(l);
 
 	AA_BUG(!seclen);
 
diff --git a/security/security.c b/security/security.c
index 60dd064c0531..adf4cb768665 100644
--- a/security/security.c
+++ b/security/security.c
@@ -2002,7 +2002,10 @@ EXPORT_SYMBOL(security_ismaclabel);
 
 int security_secid_to_secctx(u32 secid, char **secdata, u32 *seclen)
 {
-	return call_int_hook(secid_to_secctx, -EOPNOTSUPP, secid, secdata,
+	struct lsm_export data;
+
+	lsm_export_to_all(&data, secid);
+	return call_int_hook(secid_to_secctx, -EOPNOTSUPP, &data, secdata,
 				seclen);
 }
 EXPORT_SYMBOL(security_secid_to_secctx);
diff --git a/security/selinux/hooks.c b/security/selinux/hooks.c
index bfd0f1f5979f..16d902158e8a 100644
--- a/security/selinux/hooks.c
+++ b/security/selinux/hooks.c
@@ -6301,8 +6301,12 @@ static int selinux_ismaclabel(const char *name)
 	return (strcmp(name, XATTR_SELINUX_SUFFIX) == 0);
 }
 
-static int selinux_secid_to_secctx(u32 secid, char **secdata, u32 *seclen)
+static int selinux_secid_to_secctx(struct lsm_export *l, char **secdata,
+				   u32 *seclen)
 {
+	u32 secid;
+
+	selinux_import_secid(l, &secid);
 	return security_sid_to_context(&selinux_state, secid,
 				       secdata, seclen);
 }
diff --git a/security/smack/smack_lsm.c b/security/smack/smack_lsm.c
index a3776501965d..809af981f14c 100644
--- a/security/smack/smack_lsm.c
+++ b/security/smack/smack_lsm.c
@@ -4433,9 +4433,14 @@ static int smack_ismaclabel(const char *name)
  *
  * Exists for networking code.
  */
-static int smack_secid_to_secctx(u32 secid, char **secdata, u32 *seclen)
+static int smack_secid_to_secctx(struct lsm_export *l, char **secdata,
+				 u32 *seclen)
 {
-	struct smack_known *skp = smack_from_secid(secid);
+	struct smack_known *skp;
+	u32 secid;
+
+	smack_import_secid(l, &secid);
+	skp = smack_from_secid(secid);
 
 	if (secdata)
 		*secdata = skp->smk_known;
-- 
2.19.1

