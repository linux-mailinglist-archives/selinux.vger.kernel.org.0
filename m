Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 994411D0264
	for <lists+selinux@lfdr.de>; Wed, 13 May 2020 00:34:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731156AbgELWd6 (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Tue, 12 May 2020 18:33:58 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:57470 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725938AbgELWd6 (ORCPT
        <rfc822;selinux@vger.kernel.org>); Tue, 12 May 2020 18:33:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1589322835;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=q4U0PLmsgSq4elHF6xCBJMbXHYi4EQjvvhcMpUI6MAs=;
        b=NnmcVyBRVJXVsi8QNcipWwxA0FJyIEiD48a8d5fplRgw6SRZOkMqEueeDWKqKSMblepSKV
        ULeHkcQEQWqowDnSPKH0PZQE6cE+EYi4aJffFHDcoQy1dgDj5c5wL5zcSpNGChndSMG+rW
        zrrbfAteIvEvhESJ88I6N+64UKTymIM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-88-kdO7lGycP-qVkRFHaw_XVQ-1; Tue, 12 May 2020 18:33:53 -0400
X-MC-Unique: kdO7lGycP-qVkRFHaw_XVQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C497D100CCC1;
        Tue, 12 May 2020 22:33:51 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-112-59.rdu2.redhat.com [10.10.112.59])
        by smtp.corp.redhat.com (Postfix) with ESMTP id B23F375294;
        Tue, 12 May 2020 22:33:49 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH] keys: Make the KEY_NEED_* perms an enum rather than a mask
From:   David Howells <dhowells@redhat.com>
To:     stephen.smalley.work@gmail.com
Cc:     Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        Paul Moore <paul@paul-moore.com>,
        Casey Schaufler <casey@schaufler-ca.com>,
        keyrings@vger.kernel.org, selinux@vger.kernel.org,
        dhowells@redhat.com, linux-security-module@vger.kernel.org,
        linux-kernel@vger.kernel.org
Date:   Tue, 12 May 2020 23:33:48 +0100
Message-ID: <158932282880.2885325.2688622278854566047.stgit@warthog.procyon.org.uk>
In-Reply-To: <CAEjxPJ6pFdDfm55pv9bT3CV5DTFF9VqzRmG_Xi5bKNxPaGuOLg@mail.gmail.com>
References: <CAEjxPJ6pFdDfm55pv9bT3CV5DTFF9VqzRmG_Xi5bKNxPaGuOLg@mail.gmail.com>
User-Agent: StGit/0.21
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Since the meaning of combining the KEY_NEED_* constants is undefined, make
it so that you can't do that by turning them into an enum.

The enum is also given some extra values to represent special
circumstances, such as:

 (1) The '0' value is reserved and causes a warning to trap the parameter
     being unset.

 (2) The key is to be unlinked and we require no permissions on it, only
     the keyring, (this replaces the KEY_LOOKUP_FOR_UNLINK flag).

 (3) An override due to CAP_SYS_ADMIN.

 (4) An override due to an instantiation token being present.

 (5) The permissions check is being deferred to later key_permission()
     calls.

The extra values give the opportunity for LSMs to audit these situations.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
cc: Paul Moore <paul@paul-moore.com>
cc: Stephen Smalley <stephen.smalley.work@gmail.com>
cc: Casey Schaufler <casey@schaufler-ca.com>
cc: keyrings@vger.kernel.org
cc: selinux@vger.kernel.org
---

 include/linux/key.h          |   30 ++++++++++++++++-----------
 include/linux/security.h     |    6 +++--
 security/keys/internal.h     |    8 ++++---
 security/keys/keyctl.c       |   16 ++++++++-------
 security/keys/permission.c   |   31 ++++++++++++++++++++++------
 security/keys/process_keys.c |   46 ++++++++++++++++++++----------------------
 security/security.c          |    6 +++--
 security/selinux/hooks.c     |   25 ++++++++++++++++-------
 security/smack/smack_lsm.c   |   31 +++++++++++++++++++++-------
 9 files changed, 124 insertions(+), 75 deletions(-)

diff --git a/include/linux/key.h b/include/linux/key.h
index b99b40db08fc..0f2e24f13c2b 100644
--- a/include/linux/key.h
+++ b/include/linux/key.h
@@ -71,6 +71,23 @@ struct net;
 
 #define KEY_PERM_UNDEF	0xffffffff
 
+/*
+ * The permissions required on a key that we're looking up.
+ */
+enum key_need_perm {
+	KEY_NEED_UNSPECIFIED,	/* Needed permission unspecified */
+	KEY_NEED_VIEW,		/* Require permission to view attributes */
+	KEY_NEED_READ,		/* Require permission to read content */
+	KEY_NEED_WRITE,		/* Require permission to update / modify */
+	KEY_NEED_SEARCH,	/* Require permission to search (keyring) or find (key) */
+	KEY_NEED_LINK,		/* Require permission to link */
+	KEY_NEED_SETATTR,	/* Require permission to change attributes */
+	KEY_NEED_UNLINK,	/* Require permission to unlink key */
+	KEY_SYSADMIN_OVERRIDE,	/* Special: override by CAP_SYS_ADMIN */
+	KEY_AUTHTOKEN_OVERRIDE,	/* Special: override by possession of auth token */
+	KEY_DEFER_PERM_CHECK,	/* Special: permission check is deferred */
+};
+
 struct seq_file;
 struct user_struct;
 struct signal_struct;
@@ -420,20 +437,9 @@ static inline key_serial_t key_serial(const struct key *key)
 extern void key_set_timeout(struct key *, unsigned);
 
 extern key_ref_t lookup_user_key(key_serial_t id, unsigned long flags,
-				 key_perm_t perm);
+				 enum key_need_perm need_perm);
 extern void key_free_user_ns(struct user_namespace *);
 
-/*
- * The permissions required on a key that we're looking up.
- */
-#define	KEY_NEED_VIEW	0x01	/* Require permission to view attributes */
-#define	KEY_NEED_READ	0x02	/* Require permission to read content */
-#define	KEY_NEED_WRITE	0x04	/* Require permission to update / modify */
-#define	KEY_NEED_SEARCH	0x08	/* Require permission to search (keyring) or find (key) */
-#define	KEY_NEED_LINK	0x10	/* Require permission to link */
-#define	KEY_NEED_SETATTR 0x20	/* Require permission to change attributes */
-#define	KEY_NEED_ALL	0x3f	/* All the above permissions */
-
 static inline short key_read_state(const struct key *key)
 {
 	/* Barrier versus mark_key_instantiated(). */
diff --git a/include/linux/security.h b/include/linux/security.h
index e7914e4e0b02..57aac14e3418 100644
--- a/include/linux/security.h
+++ b/include/linux/security.h
@@ -1767,8 +1767,8 @@ static inline int security_path_chroot(const struct path *path)
 
 int security_key_alloc(struct key *key, const struct cred *cred, unsigned long flags);
 void security_key_free(struct key *key);
-int security_key_permission(key_ref_t key_ref,
-			    const struct cred *cred, unsigned perm);
+int security_key_permission(key_ref_t key_ref, const struct cred *cred,
+			    enum key_need_perm need_perm);
 int security_key_getsecurity(struct key *key, char **_buffer);
 
 #else
@@ -1786,7 +1786,7 @@ static inline void security_key_free(struct key *key)
 
 static inline int security_key_permission(key_ref_t key_ref,
 					  const struct cred *cred,
-					  unsigned perm)
+					  enum key_need_perm need_perm)
 {
 	return 0;
 }
diff --git a/security/keys/internal.h b/security/keys/internal.h
index 28e17f4f3328..1fc17cb317a9 100644
--- a/security/keys/internal.h
+++ b/security/keys/internal.h
@@ -167,7 +167,6 @@ extern bool lookup_user_key_possessed(const struct key *key,
 				      const struct key_match_data *match_data);
 #define KEY_LOOKUP_CREATE	0x01
 #define KEY_LOOKUP_PARTIAL	0x02
-#define KEY_LOOKUP_FOR_UNLINK	0x04
 
 extern long join_session_keyring(const char *name);
 extern void key_change_session_keyring(struct callback_head *twork);
@@ -183,7 +182,7 @@ extern void key_gc_keytype(struct key_type *ktype);
 
 extern int key_task_permission(const key_ref_t key_ref,
 			       const struct cred *cred,
-			       key_perm_t perm);
+			       enum key_need_perm need_perm);
 
 static inline void notify_key(struct key *key,
 			      enum key_notification_subtype subtype, u32 aux)
@@ -205,9 +204,10 @@ static inline void notify_key(struct key *key,
 /*
  * Check to see whether permission is granted to use a key in the desired way.
  */
-static inline int key_permission(const key_ref_t key_ref, unsigned perm)
+static inline int key_permission(const key_ref_t key_ref,
+				 enum key_need_perm need_perm)
 {
-	return key_task_permission(key_ref, current_cred(), perm);
+	return key_task_permission(key_ref, current_cred(), need_perm);
 }
 
 extern struct key_type key_type_request_key_auth;
diff --git a/security/keys/keyctl.c b/security/keys/keyctl.c
index 7d8de1c9a478..6763ee45e04d 100644
--- a/security/keys/keyctl.c
+++ b/security/keys/keyctl.c
@@ -434,7 +434,7 @@ long keyctl_invalidate_key(key_serial_t id)
 
 		/* Root is permitted to invalidate certain special keys */
 		if (capable(CAP_SYS_ADMIN)) {
-			key_ref = lookup_user_key(id, 0, 0);
+			key_ref = lookup_user_key(id, 0, KEY_SYSADMIN_OVERRIDE);
 			if (IS_ERR(key_ref))
 				goto error;
 			if (test_bit(KEY_FLAG_ROOT_CAN_INVAL,
@@ -479,7 +479,8 @@ long keyctl_keyring_clear(key_serial_t ringid)
 
 		/* Root is permitted to invalidate certain special keyrings */
 		if (capable(CAP_SYS_ADMIN)) {
-			keyring_ref = lookup_user_key(ringid, 0, 0);
+			keyring_ref = lookup_user_key(ringid, 0,
+						      KEY_SYSADMIN_OVERRIDE);
 			if (IS_ERR(keyring_ref))
 				goto error;
 			if (test_bit(KEY_FLAG_ROOT_CAN_CLEAR,
@@ -563,7 +564,7 @@ long keyctl_keyring_unlink(key_serial_t id, key_serial_t ringid)
 		goto error;
 	}
 
-	key_ref = lookup_user_key(id, KEY_LOOKUP_FOR_UNLINK, 0);
+	key_ref = lookup_user_key(id, KEY_LOOKUP_PARTIAL, KEY_NEED_UNLINK);
 	if (IS_ERR(key_ref)) {
 		ret = PTR_ERR(key_ref);
 		goto error2;
@@ -663,7 +664,7 @@ long keyctl_describe_key(key_serial_t keyid,
 				key_put(instkey);
 				key_ref = lookup_user_key(keyid,
 							  KEY_LOOKUP_PARTIAL,
-							  0);
+							  KEY_AUTHTOKEN_OVERRIDE);
 				if (!IS_ERR(key_ref))
 					goto okay;
 			}
@@ -833,7 +834,7 @@ long keyctl_read_key(key_serial_t keyid, char __user *buffer, size_t buflen)
 	size_t key_data_len;
 
 	/* find the key first */
-	key_ref = lookup_user_key(keyid, 0, 0);
+	key_ref = lookup_user_key(keyid, 0, KEY_DEFER_PERM_CHECK);
 	if (IS_ERR(key_ref)) {
 		ret = -ENOKEY;
 		goto out;
@@ -1471,7 +1472,7 @@ long keyctl_set_timeout(key_serial_t id, unsigned timeout)
 				key_put(instkey);
 				key_ref = lookup_user_key(id,
 							  KEY_LOOKUP_PARTIAL,
-							  0);
+							  KEY_AUTHTOKEN_OVERRIDE);
 				if (!IS_ERR(key_ref))
 					goto okay;
 			}
@@ -1579,7 +1580,8 @@ long keyctl_get_security(key_serial_t keyid,
 			return PTR_ERR(instkey);
 		key_put(instkey);
 
-		key_ref = lookup_user_key(keyid, KEY_LOOKUP_PARTIAL, 0);
+		key_ref = lookup_user_key(keyid, KEY_LOOKUP_PARTIAL,
+					  KEY_AUTHTOKEN_OVERRIDE);
 		if (IS_ERR(key_ref))
 			return PTR_ERR(key_ref);
 	}
diff --git a/security/keys/permission.c b/security/keys/permission.c
index 085f907b64ac..4a61f804e80f 100644
--- a/security/keys/permission.c
+++ b/security/keys/permission.c
@@ -13,7 +13,7 @@
  * key_task_permission - Check a key can be used
  * @key_ref: The key to check.
  * @cred: The credentials to use.
- * @perm: The permissions to check for.
+ * @need_perm: The permission required.
  *
  * Check to see whether permission is granted to use a key in the desired way,
  * but permit the security modules to override.
@@ -24,12 +24,30 @@
  * permissions bits or the LSM check.
  */
 int key_task_permission(const key_ref_t key_ref, const struct cred *cred,
-			unsigned perm)
+			enum key_need_perm need_perm)
 {
 	struct key *key;
-	key_perm_t kperm;
+	key_perm_t kperm, mask;
 	int ret;
 
+	switch (need_perm) {
+	default:
+		WARN_ON(1);
+		return -EACCES;
+	case KEY_NEED_UNLINK:
+	case KEY_SYSADMIN_OVERRIDE:
+	case KEY_AUTHTOKEN_OVERRIDE:
+	case KEY_DEFER_PERM_CHECK:
+		goto lsm;
+
+	case KEY_NEED_VIEW:	mask = KEY_OTH_VIEW;	break;
+	case KEY_NEED_READ:	mask = KEY_OTH_READ;	break;
+	case KEY_NEED_WRITE:	mask = KEY_OTH_WRITE;	break;
+	case KEY_NEED_SEARCH:	mask = KEY_OTH_SEARCH;	break;
+	case KEY_NEED_LINK:	mask = KEY_OTH_LINK;	break;
+	case KEY_NEED_SETATTR:	mask = KEY_OTH_SETATTR;	break;
+	}
+
 	key = key_ref_to_ptr(key_ref);
 
 	/* use the second 8-bits of permissions for keys the caller owns */
@@ -64,13 +82,12 @@ int key_task_permission(const key_ref_t key_ref, const struct cred *cred,
 	if (is_key_possessed(key_ref))
 		kperm |= key->perm >> 24;
 
-	kperm = kperm & perm & KEY_NEED_ALL;
-
-	if (kperm != perm)
+	if ((kperm & mask) != mask)
 		return -EACCES;
 
 	/* let LSM be the final arbiter */
-	return security_key_permission(key_ref, cred, perm);
+lsm:
+	return security_key_permission(key_ref, cred, need_perm);
 }
 EXPORT_SYMBOL(key_task_permission);
 
diff --git a/security/keys/process_keys.c b/security/keys/process_keys.c
index 09541de31f2f..7e0232db1707 100644
--- a/security/keys/process_keys.c
+++ b/security/keys/process_keys.c
@@ -609,7 +609,7 @@ bool lookup_user_key_possessed(const struct key *key,
  * returned key reference.
  */
 key_ref_t lookup_user_key(key_serial_t id, unsigned long lflags,
-			  key_perm_t perm)
+			  enum key_need_perm need_perm)
 {
 	struct keyring_search_context ctx = {
 		.match_data.cmp		= lookup_user_key_possessed,
@@ -773,35 +773,33 @@ key_ref_t lookup_user_key(key_serial_t id, unsigned long lflags,
 
 	/* unlink does not use the nominated key in any way, so can skip all
 	 * the permission checks as it is only concerned with the keyring */
-	if (lflags & KEY_LOOKUP_FOR_UNLINK) {
-		ret = 0;
-		goto error;
-	}
-
-	if (!(lflags & KEY_LOOKUP_PARTIAL)) {
-		ret = wait_for_key_construction(key, true);
-		switch (ret) {
-		case -ERESTARTSYS:
-			goto invalid_key;
-		default:
-			if (perm)
+	if (need_perm != KEY_NEED_UNLINK) {
+		if (!(lflags & KEY_LOOKUP_PARTIAL)) {
+			ret = wait_for_key_construction(key, true);
+			switch (ret) {
+			case -ERESTARTSYS:
+				goto invalid_key;
+			default:
+				if (need_perm != KEY_AUTHTOKEN_OVERRIDE &&
+				    need_perm != KEY_DEFER_PERM_CHECK)
+					goto invalid_key;
+			case 0:
+				break;
+			}
+		} else if (need_perm != KEY_DEFER_PERM_CHECK) {
+			ret = key_validate(key);
+			if (ret < 0)
 				goto invalid_key;
-		case 0:
-			break;
 		}
-	} else if (perm) {
-		ret = key_validate(key);
-		if (ret < 0)
+
+		ret = -EIO;
+		if (!(lflags & KEY_LOOKUP_PARTIAL) &&
+		    key_read_state(key) == KEY_IS_UNINSTANTIATED)
 			goto invalid_key;
 	}
 
-	ret = -EIO;
-	if (!(lflags & KEY_LOOKUP_PARTIAL) &&
-	    key_read_state(key) == KEY_IS_UNINSTANTIATED)
-		goto invalid_key;
-
 	/* check the permissions */
-	ret = key_task_permission(key_ref, ctx.cred, perm);
+	ret = key_task_permission(key_ref, ctx.cred, need_perm);
 	if (ret < 0)
 		goto invalid_key;
 
diff --git a/security/security.c b/security/security.c
index c73334ab2882..af32d4cd0462 100644
--- a/security/security.c
+++ b/security/security.c
@@ -2398,10 +2398,10 @@ void security_key_free(struct key *key)
 	call_void_hook(key_free, key);
 }
 
-int security_key_permission(key_ref_t key_ref,
-			    const struct cred *cred, unsigned perm)
+int security_key_permission(key_ref_t key_ref, const struct cred *cred,
+			    enum key_need_perm need_perm)
 {
-	return call_int_hook(key_permission, 0, key_ref, cred, perm);
+	return call_int_hook(key_permission, 0, key_ref, cred, need_perm);
 }
 
 int security_key_getsecurity(struct key *key, char **_buffer)
diff --git a/security/selinux/hooks.c b/security/selinux/hooks.c
index 0b4e32161b77..3ff6b6dfc5ca 100644
--- a/security/selinux/hooks.c
+++ b/security/selinux/hooks.c
@@ -6541,20 +6541,31 @@ static void selinux_key_free(struct key *k)
 
 static int selinux_key_permission(key_ref_t key_ref,
 				  const struct cred *cred,
-				  unsigned perm)
+				  enum key_need_perm need_perm)
 {
 	struct key *key;
 	struct key_security_struct *ksec;
-	u32 sid;
+	u32 perm, sid;
 
-	/* if no specific permissions are requested, we skip the
-	   permission check. No serious, additional covert channels
-	   appear to be created. */
-	if (perm == 0)
+	switch (need_perm) {
+	case KEY_NEED_UNLINK:
+	case KEY_SYSADMIN_OVERRIDE:
+	case KEY_AUTHTOKEN_OVERRIDE:
+	case KEY_DEFER_PERM_CHECK:
 		return 0;
+	default:
+		WARN_ON(1);
+		return -EPERM;
 
-	sid = cred_sid(cred);
+	case KEY_NEED_VIEW:	perm = KEY__VIEW;	break;
+	case KEY_NEED_READ:	perm = KEY__READ;	break;
+	case KEY_NEED_WRITE:	perm = KEY__WRITE;	break;
+	case KEY_NEED_SEARCH:	perm = KEY__SEARCH;	break;
+	case KEY_NEED_LINK:	perm = KEY__LINK;	break;
+	case KEY_NEED_SETATTR:	perm = KEY__SETATTR;	break;
+	}
 
+	sid = cred_sid(cred);
 	key = key_ref_to_ptr(key_ref);
 	ksec = key->security;
 
diff --git a/security/smack/smack_lsm.c b/security/smack/smack_lsm.c
index 8c61d175e195..627ca7dc9b27 100644
--- a/security/smack/smack_lsm.c
+++ b/security/smack/smack_lsm.c
@@ -4230,13 +4230,14 @@ static void smack_key_free(struct key *key)
  * smack_key_permission - Smack access on a key
  * @key_ref: gets to the object
  * @cred: the credentials to use
- * @perm: requested key permissions
+ * @need_perm: requested key permission
  *
  * Return 0 if the task has read and write to the object,
  * an error code otherwise
  */
 static int smack_key_permission(key_ref_t key_ref,
-				const struct cred *cred, unsigned perm)
+				const struct cred *cred,
+				enum key_need_perm need_perm)
 {
 	struct key *keyp;
 	struct smk_audit_info ad;
@@ -4247,8 +4248,26 @@ static int smack_key_permission(key_ref_t key_ref,
 	/*
 	 * Validate requested permissions
 	 */
-	if (perm & ~KEY_NEED_ALL)
-		return -EINVAL;
+	switch (need_perm) {
+	default:
+		return -EACCES;
+	case KEY_NEED_UNSPECIFIED:
+	case KEY_NEED_UNLINK:
+	case KEY_SYSADMIN_OVERRIDE:
+	case KEY_AUTHTOKEN_OVERRIDE:
+	case KEY_DEFER_PERM_CHECK:
+		return 0;
+	case KEY_NEED_READ:
+	case KEY_NEED_SEARCH:
+	case KEY_NEED_VIEW:
+		request |= MAY_READ;
+		break;
+	case KEY_NEED_WRITE:
+	case KEY_NEED_LINK:
+	case KEY_NEED_SETATTR:
+		request |= MAY_WRITE;
+		break;
+	}
 
 	keyp = key_ref_to_ptr(key_ref);
 	if (keyp == NULL)
@@ -4273,10 +4292,6 @@ static int smack_key_permission(key_ref_t key_ref,
 	ad.a.u.key_struct.key = keyp->serial;
 	ad.a.u.key_struct.key_desc = keyp->description;
 #endif
-	if (perm & (KEY_NEED_READ | KEY_NEED_SEARCH | KEY_NEED_VIEW))
-		request |= MAY_READ;
-	if (perm & (KEY_NEED_WRITE | KEY_NEED_LINK | KEY_NEED_SETATTR))
-		request |= MAY_WRITE;
 	rc = smk_access(tkp, keyp->security, request, &ad);
 	rc = smk_bu_note("key access", tkp, keyp->security, request, rc);
 	return rc;


