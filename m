Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6069B317C0
	for <lists+selinux@lfdr.de>; Sat,  1 Jun 2019 01:16:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726761AbfEaXQy (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Fri, 31 May 2019 19:16:54 -0400
Received: from sonic305-9.consmr.mail.bf2.yahoo.com ([74.6.133.48]:40859 "EHLO
        sonic305-9.consmr.mail.bf2.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726708AbfEaXQy (ORCPT
        <rfc822;selinux@vger.kernel.org>); Fri, 31 May 2019 19:16:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1559344612; bh=1xMyB3SejRKDCdQmKeBsMf7OEE0vB0tP/pBY2Hpzm7I=; h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject; b=MSTquErLon05pKeC8HIPcreIAPFmI04Z2fWOzH8ndlaH8IxcJk/WrDPwOcWDOUOvzt8rr9d6eEfiMU27r0gAHZ1QVrft/ebb0ZBYk7fI+j5YU+2uZlfsDfLNXaXVEJuX0SUyy7CeTm3BJZ2sH374Fl+Hn6+f6MxfD7BlgsrvSgvbiqumh4mUjkskWDKcqLQTcOSR2xB9mncL17/g64htWbXGIyoygUjj+9qMCMJuZsx6cusuYtb+KeOGBVF46s1VdVTr+1ywEr1KpPmcPfldM57iJhD5bZ6ChCMNAB5wjyTZl+s8XRC7uwa4YtZul0YZsU4Ki3z6Fq6TloprCtTUlg==
X-YMail-OSG: I3sAmI4VM1mUY3MJPCYVweg5tFD9SnLmoexaN5wUBGCrYAzSHUbbZiVQBHhm_DM
 id2DiUEoLRU9hF5ROdOTpnQI1wVcGw.3DIBlYCYCijCNuAoUC.4BOr9wFEuXIxpm5pKbkqKmIZjo
 dBHuggF8XBfNYmVwf7aFenf0WsjKApnEZ_3So6c.LhaymuzHKaDPv.BU7tNtmYyUShw4225Mn86Y
 .VBtBzaiMqgnHdgoDoE7yqX8n1aYZQANttUoEeGwtJmhbhA4ZofI36xAbQWSGBrUC8wCOJiDcbXZ
 jOLVhehfZp4Q9WPsd1tSHIOEUpqjrb8MJdZ8tzTwXYnYcDTKRRt_D5Pg3DJg2sfG.0Qo6URoCd3q
 2aL8O_dT5eH2rqjlknDd.iGD.oZCZ6I1IgeFnMxYKf79Bx0b0.xvc8pAzsJBdWrpQSZfDZUvN_B.
 al1SsSdyLjg7Tji8frMbA2aR8wPY2NaWK0HwBwfYbu8kmd9Hg34n.YOTF6kXYl.O91YAesceJMfx
 CxFKFeWrFHXQnb1zMnpKVWrjE8kKzYPGvkb7qz_T86o4UuHV1aEv9htDUQBVB7xCzMw7cDBGAmjr
 WuUKxPeARiUlT_FfAVdwySzK71KLko17fGVWwpML0yDrMOVQQ3zVTCi3sZs1ftq9.9yKQ1cha9yp
 BPI7zrJZCm6Dk6BdgJp8n5ovgKwdWmnyKflZxGFrpPnAcW5diycg.vyKgmrplELfzclD261wv2f9
 _yOTEzlKHK9bPNHgekkHTM3yraWSKA2FktBM1s3c6_ZJKw5oot56rueZV3LbdZ4ppvQtbRuvoMvl
 tSd5EMGICjWE1gL43ukMC6BpgiorB21AGGE9y0YR_F_MK6FV0e.yoHaLY3oObUxpj5Q3ZvUIFfKf
 .SQN7zm0vfbWeFfD65dXJEQZLb1Gb6jiwTCILAjvz5RROMCJEyWhzsm7__4kCN_5_aKAlgWIlGdi
 uOV4hJhroWZbCoId1AFn4z7OPsawhLsBBlyUW8VHrFh5OyQAPKnhxYq5v_qxpAl7K9JNDPUPIoi9
 vIXGY6tUyjh9IBSWJbCUfxygia_4TDLDRCttpnoZijHmYLvbB8B0.0ZzSye9EMz8yHN3p9dMR8gs
 cLrJtjNPqugjdrkw1ANVcDCTQBrnz98BL2n0N0THN59XY91Fj7eB4HiDCPPDkn70AxJGf5YCVlbU
 nGEnbs3tciZvW8XQJ6UY1K2dU1.0Rat6IffvBgE9A9PCDZSVBSuwkKwKAnypRtoORln6LpiI11rU
 sw749dN4jqqSATMoYTAFCGeAge_NiRBQXhmuMAhJKM9vCG1_DeYNydHE6
Received: from sonic.gate.mail.ne1.yahoo.com by sonic305.consmr.mail.bf2.yahoo.com with HTTP; Fri, 31 May 2019 23:16:52 +0000
Received: from c-73-223-4-185.hsd1.ca.comcast.net (EHLO localhost.localdomain) ([73.223.4.185])
          by smtp408.mail.bf1.yahoo.com (Oath Hermes SMTP Server) with ESMTPA ID 9cd5788d30d0fe2cc7baddaa2babae62;
          Fri, 31 May 2019 23:16:47 +0000 (UTC)
From:   Casey Schaufler <casey@schaufler-ca.com>
To:     casey.schaufler@intel.com, jmorris@namei.org,
        linux-security-module@vger.kernel.org, selinux@vger.kernel.org
Cc:     casey@schaufler-ca.com, keescook@chromium.org,
        john.johansen@canonical.com, penguin-kernel@i-love.sakura.ne.jp,
        paul@paul-moore.com, sds@tycho.nsa.gov
Subject: [PATCH 37/58] LSM: Use lsm_context in secid_to_secctx hooks
Date:   Fri, 31 May 2019 16:09:59 -0700
Message-Id: <20190531231020.628-38-casey@schaufler-ca.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20190531231020.628-1-casey@schaufler-ca.com>
References: <20190531231020.628-1-casey@schaufler-ca.com>
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Convert SELinux, Smack and AppArmor to use the lsm_context structure
instead of a context/secid pair. There is some scaffolding involved
that will be removed when the related data is updated.

Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
---
 include/linux/lsm_hooks.h         |  6 ++----
 security/apparmor/include/secid.h |  2 +-
 security/apparmor/secid.c         | 11 +++++------
 security/security.c               | 12 ++++++++++--
 security/selinux/hooks.c          |  5 ++---
 security/smack/smack_lsm.c        |  8 +++-----
 6 files changed, 23 insertions(+), 21 deletions(-)

diff --git a/include/linux/lsm_hooks.h b/include/linux/lsm_hooks.h
index 0837c214cc17..229899452678 100644
--- a/include/linux/lsm_hooks.h
+++ b/include/linux/lsm_hooks.h
@@ -1320,9 +1320,8 @@
  *	length and the next call which actually allocates and returns the
  *	secdata.
  *	@l points to the security information.
- *	@secdata contains the pointer that stores the converted security
+ *	@cp contains the pointer that stores the converted security
  *	context.
- *	@seclen pointer which contains the length of the data
  * @secctx_to_secid:
  *	Convert security context to exported lsm data.
  *	@l contains the pointer to the generated security data.
@@ -1664,8 +1663,7 @@ union security_list_options {
 	int (*getprocattr)(struct task_struct *p, char *name, char **value);
 	int (*setprocattr)(const char *name, void *value, size_t size);
 	int (*ismaclabel)(const char *name);
-	int (*secid_to_secctx)(struct lsm_export *l, char **secdata,
-				u32 *seclen);
+	int (*secid_to_secctx)(struct lsm_export *l, struct lsm_context *cp);
 	int (*secctx_to_secid)(const char *secdata, u32 seclen,
 				struct lsm_export *l);
 	void (*release_secctx)(char *secdata, u32 seclen);
diff --git a/security/apparmor/include/secid.h b/security/apparmor/include/secid.h
index 5381eff03d4f..964d3dc92635 100644
--- a/security/apparmor/include/secid.h
+++ b/security/apparmor/include/secid.h
@@ -26,7 +26,7 @@ struct aa_label;
 #define AA_SECID_WILDCARD 1
 
 struct aa_label *aa_secid_to_label(struct lsm_export *l);
-int apparmor_secid_to_secctx(struct lsm_export *l, char **secdata, u32 *seclen);
+int apparmor_secid_to_secctx(struct lsm_export *l, struct lsm_context *cp);
 int apparmor_secctx_to_secid(const char *secdata, u32 seclen,
 			     struct lsm_export *l);
 void apparmor_release_secctx(char *secdata, u32 seclen);
diff --git a/security/apparmor/secid.c b/security/apparmor/secid.c
index 69d98a89db75..4e11434605d6 100644
--- a/security/apparmor/secid.c
+++ b/security/apparmor/secid.c
@@ -81,7 +81,7 @@ static inline void aa_export_secid(struct lsm_export *l, u32 secid)
 	l->apparmor = secid;
 }
 
-int apparmor_secid_to_secctx(struct lsm_export *l, char **secdata, u32 *seclen)
+int apparmor_secid_to_secctx(struct lsm_export *l, struct lsm_context *cp)
 {
 	/* TODO: cache secctx and ref count so we don't have to recreate */
 	struct aa_label *label;
@@ -89,13 +89,12 @@ int apparmor_secid_to_secctx(struct lsm_export *l, char **secdata, u32 *seclen)
 
 	label = aa_secid_to_label(l);
 
-	AA_BUG(!seclen);
-
 	if (!label)
 		return -EINVAL;
 
-	if (secdata)
-		len = aa_label_asxprint(secdata, root_ns, label,
+	/* scaffolding check - Casey */
+	if (cp)
+		len = aa_label_asxprint(&cp->context, root_ns, label,
 					FLAG_SHOW_MODE | FLAG_VIEW_SUBNS |
 					FLAG_HIDDEN_UNCONFINED | FLAG_ABS_ROOT,
 					GFP_ATOMIC);
@@ -106,7 +105,7 @@ int apparmor_secid_to_secctx(struct lsm_export *l, char **secdata, u32 *seclen)
 	if (len < 0)
 		return -ENOMEM;
 
-	*seclen = len;
+	cp->len = len;
 
 	return 0;
 }
diff --git a/security/security.c b/security/security.c
index 365970f2501d..ac0498daa49e 100644
--- a/security/security.c
+++ b/security/security.c
@@ -1974,8 +1974,16 @@ EXPORT_SYMBOL(security_ismaclabel);
 
 int security_secid_to_secctx(struct lsm_export *l, char **secdata, u32 *seclen)
 {
-	return call_one_int_hook(secid_to_secctx, -EOPNOTSUPP, l, secdata,
-				 seclen);
+	struct lsm_context lc = { .context = NULL, .len = 0, };
+	int rc;
+
+	rc = call_one_int_hook(secid_to_secctx, -EOPNOTSUPP, l, &lc);
+	if (secdata)
+		*secdata = lc.context;
+	else
+		security_release_secctx(lc.context, lc.len);
+	*seclen = lc.len;
+	return rc;
 }
 EXPORT_SYMBOL(security_secid_to_secctx);
 
diff --git a/security/selinux/hooks.c b/security/selinux/hooks.c
index 7dd333f133db..6a2a82dcd948 100644
--- a/security/selinux/hooks.c
+++ b/security/selinux/hooks.c
@@ -6301,14 +6301,13 @@ static int selinux_ismaclabel(const char *name)
 	return (strcmp(name, XATTR_SELINUX_SUFFIX) == 0);
 }
 
-static int selinux_secid_to_secctx(struct lsm_export *l, char **secdata,
-				   u32 *seclen)
+static int selinux_secid_to_secctx(struct lsm_export *l, struct lsm_context *cp)
 {
 	u32 secid;
 
 	selinux_import_secid(l, &secid);
 	return security_sid_to_context(&selinux_state, secid,
-				       secdata, seclen);
+				       &cp->context, &cp->len);
 }
 
 static int selinux_secctx_to_secid(const char *secdata, u32 seclen,
diff --git a/security/smack/smack_lsm.c b/security/smack/smack_lsm.c
index a837af153ed9..10d6c6a1a001 100644
--- a/security/smack/smack_lsm.c
+++ b/security/smack/smack_lsm.c
@@ -4434,8 +4434,7 @@ static int smack_ismaclabel(const char *name)
  *
  * Exists for networking code.
  */
-static int smack_secid_to_secctx(struct lsm_export *l, char **secdata,
-				 u32 *seclen)
+static int smack_secid_to_secctx(struct lsm_export *l, struct lsm_context *cp)
 {
 	struct smack_known *skp;
 	u32 secid;
@@ -4443,9 +4442,8 @@ static int smack_secid_to_secctx(struct lsm_export *l, char **secdata,
 	smack_import_secid(l, &secid);
 	skp = smack_from_secid(secid);
 
-	if (secdata)
-		*secdata = skp->smk_known;
-	*seclen = strlen(skp->smk_known);
+	cp->context = skp->smk_known;
+	cp->len = strlen(skp->smk_known);
 	return 0;
 }
 
-- 
2.19.1

