Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4FE975718A
	for <lists+selinux@lfdr.de>; Wed, 26 Jun 2019 21:22:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726408AbfFZTWx (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Wed, 26 Jun 2019 15:22:53 -0400
Received: from sonic316-12.consmr.mail.gq1.yahoo.com ([98.137.69.36]:33971
        "EHLO sonic316-12.consmr.mail.gq1.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726410AbfFZTWx (ORCPT
        <rfc822;selinux@vger.kernel.org>); Wed, 26 Jun 2019 15:22:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1561576971; bh=3fozsIUtSDO9AJ7IDtWvjrVCYGRH4w3JwqRegBbN3sM=; h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject; b=jk9/EaVij0OAv5UKskGPZexVgy8rQLp16ni7sXroOBIrDKKNXS6HCtBEFn5jX1805rquiLfbXcC5RPlNkOwqHz0zw8JrGOjSujU7OAjvEUoinuL5OWu0AjZaA51pQ5WKq6k9e3OyNL0j79eHeoL8APioXNM2ptEjyqQ53Xk9E6F2VZPVhrvUJVwat2TjDxcI/8ZQGeKi+dvWCztn1SzestB0H9XcHqnWRma9xOVelpNUfJcjyd97jrqhHwnPkRA3xSB7D9M2yvyHZN+8h9awUvhAoToEFm9WKuaZT5y2+5q5MS7gv164xACnZbvs3h4uqYDdDThJi8jJxHaysikxeA==
X-YMail-OSG: 3uQ8k_kVM1mEAxg4CHb74IglvkcA.1N4.eueQpLdaqPMeTOQWjiT3zyyhbgB6MN
 KJMXhYaw03xedBvFYu8JUkcs3znfbFOPacl1VG6eY6vvzOJieQgguzuAeo1yhJskq3LhlqhYdInd
 ttgjBff8z7IhJ2InQcuJJ5GuqRk3Wla7zA6g.Aim__Y35qNVkrdi1n38uZxUz8FBjvgZW.oKbahB
 iiNmyNv2jR02ihteWxpMHa3ehfSbuYTjm6CxBm1hMtn05eX5knKo2cIdLXCjvLIRLGB7BvOu8lkY
 BnchMC5fvtOc2APcuECAXQ9_OTWPKQVFj_L7cUrEugk.lqFgRmO.P8MPeNI7o0UZch8Qxmdpi_WN
 T4lOEAD89JyN9rleMsltQ0PRu02KMMpav7FhH6ziIz2dLS2tAFKtlBPVadheb5OTX6SsaaeMY0fK
 4T2uZOEpg5XKcHUXHOh_P8kcvv52JjC9zcXb5sNBqAUUF6MWvHgI9WB0sfWj5LHA8t6EUUP7IeTZ
 Jz2NybQU9puaBYge8UlaIwiZ3tzjD7QOhtlab56u4wWFBs7qmo5KFoU1hGVsKUcg4IXFtiUOShmD
 6mHOkPajht4VAPYxHuMKd3ZfiuHycpN.tbxpCmUH7EfpT5lz2hsLat3ITJI8EyJz7ipXOp5cz9zz
 NK.FhBXVqBVx5zQjcnvw9QLxEg4vlJzLnGEGUF2f21VQui1SKgjRMoQV.xRhxsO1n2vHA.Eqw19N
 lDA80M0JQDK2qSpfK.t1zsNGUBHTDHjqLUVdS.m6xqD.5EaHRm9YcncDcefyezW97Oy0ZJSQKAiH
 GlkGnBDVEKt3z4.k4Xc4mQuxKCZUQjnMakJAs1vtYQnQ9vXCSR8ERgW3m_hu4ySqhPih6LH1rrrB
 SCm06oslxC_b6uuRyTfDZTOBgOYQJ7Idnz.0S9FSBXrsNY4ADkg_5zGSdZXUyyhNd4J95BphdWW.
 pNmsWkgR25TNPTO3LWQsXJ35atqpf.rOTZKDf2GegjHxaAq1qeqRNsCApDwk0cVfEOqoXSbgwlZb
 ZhYZ1n0Twxw2rKBbegjwbyr6FKNiI1DfA6QiQdwDLOqzWUHb_ujsxkcNAMXQmxCM__YlpBcKMHZk
 OyMAML.LcfWCSbOCTxdoXn.ycDL1GuoMv9aWTODP_hWO3Z9AZVt0kUKo180B2SBRJPrLCoCiSM1v
 L2nYkdQDpfhJCMJEdsXLNLJJu00ESwhzuXRO12u8205L9oZQAWoUv0imPZjbwrsK6pxMfQwelDqD
 mf3KpX5eN5GJP._e9xLTpJjcnkVvoUpUgha4-
Received: from sonic.gate.mail.ne1.yahoo.com by sonic316.consmr.mail.gq1.yahoo.com with HTTP; Wed, 26 Jun 2019 19:22:51 +0000
Received: from c-73-223-4-185.hsd1.ca.comcast.net (EHLO localhost.net) ([73.223.4.185])
          by smtp425.mail.gq1.yahoo.com (Oath Hermes SMTP Server) with ESMTPA ID c714fa5cf5fc340fbb5c59821a30e7c3;
          Wed, 26 Jun 2019 19:22:48 +0000 (UTC)
From:   Casey Schaufler <casey@schaufler-ca.com>
To:     casey.schaufler@intel.com, jmorris@namei.org,
        linux-security-module@vger.kernel.org, selinux@vger.kernel.org
Cc:     casey@schaufler-ca.com, keescook@chromium.org,
        john.johansen@canonical.com, penguin-kernel@i-love.sakura.ne.jp,
        paul@paul-moore.com, sds@tycho.nsa.gov
Subject: [PATCH v4 05/23] LSM: Use lsmblob in security_audit_rule_match
Date:   Wed, 26 Jun 2019 12:22:16 -0700
Message-Id: <20190626192234.11725-6-casey@schaufler-ca.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190626192234.11725-1-casey@schaufler-ca.com>
References: <20190626192234.11725-1-casey@schaufler-ca.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Change the secid parameter of security_audit_rule_match
to a lsmblob structure pointer. Pass the entry from the
lsmblob structure for the approprite slot to the LSM hook.

Change the users of security_audit_rule_match to use the
lsmblob instead of a u32. In some cases this requires a
temporary conversion using lsmblob_init() that will go
away when other interfaces get converted.

Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
---
 include/linux/security.h            |  7 ++++---
 kernel/auditfilter.c                |  7 +++++--
 kernel/auditsc.c                    | 14 ++++++++++----
 security/integrity/ima/ima.h        |  4 ++--
 security/integrity/ima/ima_policy.c |  7 +++++--
 security/security.c                 | 18 +++++++++++++++---
 6 files changed, 41 insertions(+), 16 deletions(-)

diff --git a/include/linux/security.h b/include/linux/security.h
index 5bb8b9a6fa84..4f8b478bc3a1 100644
--- a/include/linux/security.h
+++ b/include/linux/security.h
@@ -1761,7 +1761,8 @@ static inline int security_key_getsecurity(struct key *key, char **_buffer)
 #ifdef CONFIG_SECURITY
 int security_audit_rule_init(u32 field, u32 op, char *rulestr, void **lsmrule);
 int security_audit_rule_known(struct audit_krule *krule);
-int security_audit_rule_match(u32 secid, u32 field, u32 op, void *lsmrule);
+int security_audit_rule_match(struct lsmblob *blob, u32 field, u32 op,
+			      void *lsmrule);
 void security_audit_rule_free(void *lsmrule);
 
 #else
@@ -1777,8 +1778,8 @@ static inline int security_audit_rule_known(struct audit_krule *krule)
 	return 0;
 }
 
-static inline int security_audit_rule_match(u32 secid, u32 field, u32 op,
-					    void *lsmrule)
+static inline int security_audit_rule_match(struct lsmblob *blob, u32 field,
+					    u32 op, void *lsmrule)
 {
 	return 0;
 }
diff --git a/kernel/auditfilter.c b/kernel/auditfilter.c
index 63f8b3f26fab..8786b95b60bd 100644
--- a/kernel/auditfilter.c
+++ b/kernel/auditfilter.c
@@ -1324,6 +1324,7 @@ int audit_filter(int msgtype, unsigned int listtype)
 			struct audit_field *f = &e->rule.fields[i];
 			pid_t pid;
 			u32 sid;
+			struct lsmblob blob;
 
 			switch (f->type) {
 			case AUDIT_PID:
@@ -1354,8 +1355,10 @@ int audit_filter(int msgtype, unsigned int listtype)
 			case AUDIT_SUBJ_CLR:
 				if (f->lsm_rule) {
 					security_task_getsecid(current, &sid);
-					result = security_audit_rule_match(sid,
-						   f->type, f->op, f->lsm_rule);
+					lsmblob_init(&blob, sid);
+					result = security_audit_rule_match(
+							&blob, f->type,
+							f->op, f->lsm_rule);
 				}
 				break;
 			case AUDIT_EXE:
diff --git a/kernel/auditsc.c b/kernel/auditsc.c
index d1eab1d4a930..18ee5556c086 100644
--- a/kernel/auditsc.c
+++ b/kernel/auditsc.c
@@ -445,6 +445,7 @@ static int audit_filter_rules(struct task_struct *tsk,
 	const struct cred *cred;
 	int i, need_sid = 1;
 	u32 sid;
+	struct lsmblob blob;
 	unsigned int sessionid;
 
 	cred = rcu_dereference_check(tsk->cred, tsk == current || task_creation);
@@ -630,7 +631,9 @@ static int audit_filter_rules(struct task_struct *tsk,
 					security_task_getsecid(tsk, &sid);
 					need_sid = 0;
 				}
-				result = security_audit_rule_match(sid, f->type,
+				lsmblob_init(&blob, sid);
+				result = security_audit_rule_match(&blob,
+								   f->type,
 								   f->op,
 								   f->lsm_rule);
 			}
@@ -645,15 +648,17 @@ static int audit_filter_rules(struct task_struct *tsk,
 			if (f->lsm_rule) {
 				/* Find files that match */
 				if (name) {
+					lsmblob_init(&blob, name->osid);
 					result = security_audit_rule_match(
-								name->osid,
+								&blob,
 								f->type,
 								f->op,
 								f->lsm_rule);
 				} else if (ctx) {
 					list_for_each_entry(n, &ctx->names_list, list) {
+						lsmblob_init(&blob, n->osid);
 						if (security_audit_rule_match(
-								n->osid,
+								&blob,
 								f->type,
 								f->op,
 								f->lsm_rule)) {
@@ -665,7 +670,8 @@ static int audit_filter_rules(struct task_struct *tsk,
 				/* Find ipc objects that match */
 				if (!ctx || ctx->type != AUDIT_IPC)
 					break;
-				if (security_audit_rule_match(ctx->ipc.osid,
+				lsmblob_init(&blob, ctx->ipc.osid);
+				if (security_audit_rule_match(&blob,
 							      f->type, f->op,
 							      f->lsm_rule))
 					++result;
diff --git a/security/integrity/ima/ima.h b/security/integrity/ima/ima.h
index d213e835c498..5a337239d9e4 100644
--- a/security/integrity/ima/ima.h
+++ b/security/integrity/ima/ima.h
@@ -307,8 +307,8 @@ static inline int security_filter_rule_init(u32 field, u32 op, char *rulestr,
 	return -EINVAL;
 }
 
-static inline int security_filter_rule_match(u32 secid, u32 field, u32 op,
-					     void *lsmrule)
+static inline int security_filter_rule_match(struct lsmblob *blob, u32 field,
+					     u32 op, void *lsmrule)
 {
 	return -EINVAL;
 }
diff --git a/security/integrity/ima/ima_policy.c b/security/integrity/ima/ima_policy.c
index e0cc323f948f..e7b8ce942950 100644
--- a/security/integrity/ima/ima_policy.c
+++ b/security/integrity/ima/ima_policy.c
@@ -327,6 +327,7 @@ static bool ima_match_rules(struct ima_rule_entry *rule, struct inode *inode,
 	for (i = 0; i < MAX_LSM_RULES; i++) {
 		int rc = 0;
 		u32 osid;
+		struct lsmblob blob;
 		int retried = 0;
 
 		if (!rule->lsm[i].rule)
@@ -337,7 +338,8 @@ static bool ima_match_rules(struct ima_rule_entry *rule, struct inode *inode,
 		case LSM_OBJ_ROLE:
 		case LSM_OBJ_TYPE:
 			security_inode_getsecid(inode, &osid);
-			rc = security_filter_rule_match(osid,
+			lsmblob_init(&blob, osid);
+			rc = security_filter_rule_match(&blob,
 							rule->lsm[i].type,
 							Audit_equal,
 							rule->lsm[i].rule);
@@ -345,7 +347,8 @@ static bool ima_match_rules(struct ima_rule_entry *rule, struct inode *inode,
 		case LSM_SUBJ_USER:
 		case LSM_SUBJ_ROLE:
 		case LSM_SUBJ_TYPE:
-			rc = security_filter_rule_match(secid,
+			lsmblob_init(&blob, secid);
+			rc = security_filter_rule_match(&blob,
 							rule->lsm[i].type,
 							Audit_equal,
 							rule->lsm[i].rule);
diff --git a/security/security.c b/security/security.c
index 27e2db3d6b04..46ca4b85ad96 100644
--- a/security/security.c
+++ b/security/security.c
@@ -424,7 +424,7 @@ static int lsm_append(const char *new, char **result)
 /*
  * Current index to use while initializing the lsmblob secid list.
  */
-static int lsm_slot __initdata;
+static int lsm_slot;
 
 /**
  * security_add_hooks - Add a modules hooks to the hook lists.
@@ -2433,9 +2433,21 @@ void security_audit_rule_free(void *lsmrule)
 	call_void_hook(audit_rule_free, lsmrule);
 }
 
-int security_audit_rule_match(u32 secid, u32 field, u32 op, void *lsmrule)
+int security_audit_rule_match(struct lsmblob *blob, u32 field, u32 op,
+			      void *lsmrule)
 {
-	return call_int_hook(audit_rule_match, 0, secid, field, op, lsmrule);
+	struct security_hook_list *hp;
+	int rc;
+
+	hlist_for_each_entry(hp, &security_hook_heads.audit_rule_match, list) {
+		if (WARN_ON(hp->lsmid->slot < 0 || hp->lsmid->slot >= lsm_slot))
+			continue;
+		rc = hp->hook.audit_rule_match(blob->secid[hp->lsmid->slot],
+					       field, op, lsmrule);
+		if (rc != 0)
+			return rc;
+	}
+	return 0;
 }
 #endif /* CONFIG_AUDIT */
 
-- 
2.20.1

