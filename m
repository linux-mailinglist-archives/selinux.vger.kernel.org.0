Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E5D53121CBA
	for <lists+selinux@lfdr.de>; Mon, 16 Dec 2019 23:25:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726587AbfLPWYt (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Mon, 16 Dec 2019 17:24:49 -0500
Received: from sonic311-30.consmr.mail.ne1.yahoo.com ([66.163.188.211]:43390
        "EHLO sonic311-30.consmr.mail.ne1.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726699AbfLPWYs (ORCPT
        <rfc822;selinux@vger.kernel.org>); Mon, 16 Dec 2019 17:24:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1576535086; bh=1geWvs7GfSFx9csTS2THo8vohI1Xi608jxOz2eEL/1Q=; h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject; b=GeFSDzVftJ/OG/MbcR1d+tgDcRcS+7s0EVQFnxCX5y+NRJMg/yiLwK096qWIoj6HgRG+7oOAZCc0FMH7AAX6VD4J3lBpeRtgs1uxymsdvW9us4kFcvf0p9WvFKTQs7MZ/zwCjB1mDHQjPQIq9dZQHCZrUR3kEb18I828k2WX6xXJ7KSJZ5foP0ho8iGsjDpK0Yu8kej7g5mR4hhS7UzqgNTAK2gAzftHobhfdgbn5/00WLLcQ/M6W/E+O6qwW+YeWVmlLqBRvSiNsn+av37N9hVrwNMmQMWlKVLUPLyi4KzaylnYi5bQ3m2KNJYnCcAcOjEsi/ctyb4b4Pf6FtiIZg==
X-YMail-OSG: LcMGhicVM1mcTbcidHSv.VHKiXMsrVvCLs9lQOK9Ml_ewQSOc9fcHHpZ6GBdNQq
 kQxb0XyHtE.pJZ8xU84FX8XymLyXtmUgxlJx1SMOsZqprGNLlxpS.48KTS5gGhkEYx945lUGC_bR
 Kb3ITBjoyGJHJCx0rgrde4XmdGr6U_aQ7hv51Oi3QDYOvcZBYzGllQLMb0zY6ki0c_IgrhQxrne4
 sIcELa1tGcEWsAbAbsdkbHrMaTN6LjF9EwFn5gNQcarl4aJbdZkCcs7I1ZJz1yfdB6_GHSdgteo8
 2r616DNYLBHP8P1HZNGU49JNt96DWINXx.nY6.38Y6Ap7I5wkH8lMfKa_6b9HHV.BcNtTREoqAGN
 gEN39WfH5cRvqIJx9ellAA965EN6pQ8ajLRSmfCwYBXDGOtbB6BCllNZflEcGskyM6UvYl4ExsIp
 HC2PFkB2vM1CSWxeGzV77.klVmtX1hfBNuuzCep6egDxzR69Ojp9Ugx0kOsmD8d1wmQfp8oC9D6l
 dP_1ukHv9MpN6XPht45SqHXCb41YFfEqGK.NcPlwOrQt3u5GhSTQ0v2PUE6xHWZVGs_II8gbDLtE
 a4P8fs2YZMhx_jkbV0XdOUaF83fClOOEd8b01lgk0au1rOSEa24yLbscplBJZ7Gg0l7QUdGahNwy
 jMxSDlP8WBpfliG3THKT1QJlXMBR1ORBLJzmf8EtJBjRK3mBlJnAkrCQLi1M8cADcY7DMSAnWE0Q
 PuW5rmFi0.wGUE8eZdBk0Jud9JPh8h61naU41m3DzNpqMhurGx1Gsy8E7qJQfyjnz3hATBL8ggDz
 vYDOv.881Z7ujDtZ19VW4e.Be4K2zeb5UdWMQY6N.He5ZrJUE1ih3Xa8H0KUe3ZCTQtEpRALoC2V
 2lX3y.J5CxfRf.Bd3LPBM_U4ePkefO8xEJqGWAgW92QFQrqjifufCYp5oBKwNBxtA8bZ9zmpxEYT
 nBaXjtOZ3fmEg.9NrtWV8wXf7kcgU1n4YavhIZqJSEhovPewzGdQlBA9KFtf2XEupyfK1wrZ8HDu
 FlixElnJ5Onl_OGhndePI17QBgXldmG7RxjjP6nvtnpADfovfePv0KGxCfG.JfwU248.0o0AZhDx
 Zcw7E5en0HxpQK6_aGhtPhPL6K5DBbk1lQ3D4_f.Qu3REPrjn0I6V1EAfueExUo5Nun308JLdzQr
 udgaiuJXHZuYhhiRXXJCeE38EFBbCVO1da8I3f56VkKFbTD5wH4Ys3z4aRJnramru3uv_T4eqZgh
 yqN7WBwjFdbB9G_iZNz8JchsZyXmW01CfwFWGsnylKt4FfNRU_to6bEN451sX1Zl1kQvq7cS164v
 awsVucEIn_7ViyJB3p1CW5zuNRBF46iybbTqrapuf0FkN7VS1z4p7PcVYNxfPaUJvGfDhX0CCTq8
 OJy5HLTChzIRNbpsSc.K8kwatiN5pfNdcUuztpzsdRABrG8juIRkeqbIG6xYo
Received: from sonic.gate.mail.ne1.yahoo.com by sonic311.consmr.mail.ne1.yahoo.com with HTTP; Mon, 16 Dec 2019 22:24:46 +0000
Received: by smtp426.mail.bf1.yahoo.com (Oath Hermes SMTP Server) with ESMTPA ID e7b8acfb3713ab7004f68eee190caaf8;
          Mon, 16 Dec 2019 22:24:41 +0000 (UTC)
From:   Casey Schaufler <casey@schaufler-ca.com>
To:     casey.schaufler@intel.com, jmorris@namei.org,
        linux-security-module@vger.kernel.org, selinux@vger.kernel.org
Cc:     keescook@chromium.org, john.johansen@canonical.com,
        penguin-kernel@i-love.sakura.ne.jp, paul@paul-moore.com,
        sds@tycho.nsa.gov
Subject: [PATCH v12 03/25] LSM: Use lsmblob in security_audit_rule_match
Date:   Mon, 16 Dec 2019 14:24:09 -0800
Message-Id: <20191216222431.4956-4-casey@schaufler-ca.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191216222431.4956-1-casey@schaufler-ca.com>
References: <20191216222431.4956-1-casey@schaufler-ca.com>
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

Reviewed-by: Kees Cook <keescook@chromium.org>
Reviewed-by: John Johansen <john.johansen@canonical.com>
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
index b74dc70088ca..9c6dbe248eaf 100644
--- a/include/linux/security.h
+++ b/include/linux/security.h
@@ -1837,7 +1837,8 @@ static inline int security_key_getsecurity(struct key *key, char **_buffer)
 #ifdef CONFIG_SECURITY
 int security_audit_rule_init(u32 field, u32 op, char *rulestr, void **lsmrule);
 int security_audit_rule_known(struct audit_krule *krule);
-int security_audit_rule_match(u32 secid, u32 field, u32 op, void *lsmrule);
+int security_audit_rule_match(struct lsmblob *blob, u32 field, u32 op,
+			      void *lsmrule);
 void security_audit_rule_free(void *lsmrule);
 
 #else
@@ -1853,8 +1854,8 @@ static inline int security_audit_rule_known(struct audit_krule *krule)
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
index b0126e9c0743..356db1dd276c 100644
--- a/kernel/auditfilter.c
+++ b/kernel/auditfilter.c
@@ -1325,6 +1325,7 @@ int audit_filter(int msgtype, unsigned int listtype)
 			struct audit_field *f = &e->rule.fields[i];
 			pid_t pid;
 			u32 sid;
+			struct lsmblob blob;
 
 			switch (f->type) {
 			case AUDIT_PID:
@@ -1355,8 +1356,10 @@ int audit_filter(int msgtype, unsigned int listtype)
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
index 4effe01ebbe2..7566e5b1c419 100644
--- a/kernel/auditsc.c
+++ b/kernel/auditsc.c
@@ -445,6 +445,7 @@ static int audit_filter_rules(struct task_struct *tsk,
 	const struct cred *cred;
 	int i, need_sid = 1;
 	u32 sid;
+	struct lsmblob blob;
 	unsigned int sessionid;
 
 	cred = rcu_dereference_check(tsk->cred, tsk == current || task_creation);
@@ -643,7 +644,9 @@ static int audit_filter_rules(struct task_struct *tsk,
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
@@ -658,15 +661,17 @@ static int audit_filter_rules(struct task_struct *tsk,
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
@@ -678,7 +683,8 @@ static int audit_filter_rules(struct task_struct *tsk,
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
index df4ca482fb53..d95b0ece7434 100644
--- a/security/integrity/ima/ima.h
+++ b/security/integrity/ima/ima.h
@@ -381,8 +381,8 @@ static inline int security_filter_rule_init(u32 field, u32 op, char *rulestr,
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
index f19a895ad7cd..193ddd55420b 100644
--- a/security/integrity/ima/ima_policy.c
+++ b/security/integrity/ima/ima_policy.c
@@ -414,6 +414,7 @@ static bool ima_match_rules(struct ima_rule_entry *rule, struct inode *inode,
 	for (i = 0; i < MAX_LSM_RULES; i++) {
 		int rc = 0;
 		u32 osid;
+		struct lsmblob blob;
 
 		if (!rule->lsm[i].rule)
 			continue;
@@ -423,7 +424,8 @@ static bool ima_match_rules(struct ima_rule_entry *rule, struct inode *inode,
 		case LSM_OBJ_ROLE:
 		case LSM_OBJ_TYPE:
 			security_inode_getsecid(inode, &osid);
-			rc = security_filter_rule_match(osid,
+			lsmblob_init(&blob, osid);
+			rc = security_filter_rule_match(&blob,
 							rule->lsm[i].type,
 							Audit_equal,
 							rule->lsm[i].rule);
@@ -431,7 +433,8 @@ static bool ima_match_rules(struct ima_rule_entry *rule, struct inode *inode,
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
index a89634af639a..bfea9739c084 100644
--- a/security/security.c
+++ b/security/security.c
@@ -439,7 +439,7 @@ static int lsm_append(const char *new, char **result)
 /*
  * Current index to use while initializing the lsmblob secid list.
  */
-static int lsm_slot __initdata;
+static int lsm_slot __lsm_ro_after_init;
 
 /**
  * security_add_hooks - Add a modules hooks to the hook lists.
@@ -2412,9 +2412,21 @@ void security_audit_rule_free(void *lsmrule)
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

