Return-Path: <selinux+bounces-772-lists+selinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 68316860752
	for <lists+selinux@lfdr.de>; Fri, 23 Feb 2024 00:59:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8B5831C21A01
	for <lists+selinux@lfdr.de>; Thu, 22 Feb 2024 23:59:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6760140377;
	Thu, 22 Feb 2024 23:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="EFpES6Hr"
X-Original-To: selinux@vger.kernel.org
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D107A140385
	for <selinux@vger.kernel.org>; Thu, 22 Feb 2024 23:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708646390; cv=none; b=ZIv5A9XdqsSOc4f/wtD4nI1p8Z6eoOVaIQWKq/uv89jIjcaj2obYyTjhxRtZjSjSFO3HcjaoFfayKf5sLfH19pQUGq5+8EntWDXCfMUgIN1Jc93qZD/DVuabZdQzvcZRdMnWVw9OFKRwsAT1bmpPDG98qD+lLFAXS8vaGT1g02Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708646390; c=relaxed/simple;
	bh=HRWAc2KELikCNisVhVCM3yHfwPwYkTPNRgp115QKDgg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CLQQ+aRQp0cPXeAIgsNy6bAoxkIL9TLnOYeTkaUmsErlttMH3T0L0+P/5PPj3gdYXwc1Od7YW2tTR3IkVNogrkk5+xddClG9M/0ZSufxEY1e8tw+6dKhwqEftsqlqBHdib2Dwn6oZlS7RRyswmSVps9jQ2QX9xmLNd9r6gDLLo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=EFpES6Hr; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-68fb3a3f1c5so2482906d6.3
        for <selinux@vger.kernel.org>; Thu, 22 Feb 2024 15:59:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1708646387; x=1709251187; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HO9gYKXdfRljFYpo/GBD95tWyC4dDYclbakKvnKiflQ=;
        b=EFpES6HrW5BANRE1uSA9N5egqc5nFbV9DbxKZbKWboJTMv0jSHDgcgiWcyYmq8Y/Jo
         ibc9O5nkeJbZ0oRjAAMMkYlczg1UUbPnKC6abNCdnE5eTX/h0Qku0PXztw9pqG7iLvdS
         j/XxfK1PpZScXoQSvYOiVRaumovxaBgjj/FCxjx59gVyJSD8KDXXvA0qSdjN/+iT3nx8
         EaeIJ4nv6S2qHa2/ZRGjwoRJ6XEHoDOIRVhdr/teoC6Gu23D/4B1gYQ/tanqAc5YSEde
         w4mmz5HDcy3+6wvM+V+nyMw97P1qKrLl85FyuIGfuRXWQ/ipBlg0JywJGCf6LohkhoRp
         E78w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708646387; x=1709251187;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HO9gYKXdfRljFYpo/GBD95tWyC4dDYclbakKvnKiflQ=;
        b=pD/w0IdtAMJxCf5Skhy3f50K9s0fBQjZ7r1XLTXxg4uc6rgaozZPZeVatc1FnbUN/q
         7ViuX9HRlfzmmvXC3f/qemb4dic5Is/RUdbqvg/Nx5afUhG743aP1HV1nQDMecynyJ6D
         RTLKFPQLVTYEAdv1sYJDZDDcCSwSu6g3VrwqOjD3GF3cQSb+scu6/JVOxvpsGVQoGjax
         oXX3SNdNQLUmOArFl9/xZgZYRlgZTOvUILdwB4Edj6VqOk4PXWblhHXT1V2RcOkoRc8Y
         MWIj6BBgCVAAanwcNO/4vHRMjBtj5qO4LWm/FBPulpNyMvkpH3tIGv/VnJrhKD2cGbMQ
         q6aA==
X-Gm-Message-State: AOJu0YxMArxBckYwmWOniBzKyTIcn/aeaP2NYuwEG2idNWNy/DrAh/6n
	5w19UARQavBGxTqoqmDVEl5Jk14LSkIUySMsJfebd6hlvPhTlUX13V1bXmxNAyEHnQWU/60eFOM
	=
X-Google-Smtp-Source: AGHT+IE+L3oTb004+d8yBSC/coZ4ElHxLZg0hYzN/OjGboHZKhis42BldK83s74qmNOLWA2F9j6kEg==
X-Received: by 2002:a05:6214:c49:b0:68f:2f04:9ce2 with SMTP id r9-20020a0562140c4900b0068f2f049ce2mr842007qvj.8.1708646387520;
        Thu, 22 Feb 2024 15:59:47 -0800 (PST)
Received: from localhost ([70.22.175.108])
        by smtp.gmail.com with ESMTPSA id d11-20020a0ce44b000000b0068efc28e3d3sm7424704qvm.45.2024.02.22.15.59.47
        for <selinux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Feb 2024 15:59:47 -0800 (PST)
From: Paul Moore <paul@paul-moore.com>
To: selinux@vger.kernel.org
Subject: [PATCH 15/21] selinux: fix style issues in security/selinux/ss/policydb.h
Date: Thu, 22 Feb 2024 18:52:33 -0500
Message-ID: <20240222235708.386652-38-paul@paul-moore.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240222235708.386652-23-paul@paul-moore.com>
References: <20240222235708.386652-23-paul@paul-moore.com>
Precedence: bulk
X-Mailing-List: selinux@vger.kernel.org
List-Id: <selinux.vger.kernel.org>
List-Subscribe: <mailto:selinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:selinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=12988; i=paul@paul-moore.com; h=from:subject; bh=HRWAc2KELikCNisVhVCM3yHfwPwYkTPNRgp115QKDgg=; b=owEBbQKS/ZANAwAIAeog8tqXN4lzAcsmYgBl19+vLeKCc0TNXMTmOm5LAcX/HrLVNcM91jUew ifhq4ZKVS6JAjMEAAEIAB0WIQRLQqjPB/KZ1VSXfu/qIPLalzeJcwUCZdffrwAKCRDqIPLalzeJ c+KrEADC3kNBpAB97fF82B+k7HUqVTX54xufgm4ojyeVmISUB8cBPsUl6g+Ywdq9fLPmUGRKA11 +qdZ/SeDHMLRuNzYbwOFzOtoCV97W1+Ym5U9TTrJV0EPBT/L8hC12ojucwyPsl4+e37UN9oMjda 8IhAJ1JoElKbYAgCYWScyQnMgJn03f7Jz23haqOLedtCXkj+BgufLja2xBBm8bIflz3rtGLyO4p cHLV8rPTv5WH8oESUjwhuCpZ9x6oNP0lOpf8BS4fKfvLAka1P4az5fl0gjQJRWehV7iJd22PUD9 nuf3B8fxH9DkRpjrakFz4fv1n78MuSHmIO9Vxjqnsp879aPULphn3Jdw+cJKyIerOCZQzhDkGCo gnboBlB7tygo7Lqppyu5VwqnU1UkFaNNKRZdBYZ8zGXtK7pJ1gt3pssriCEwhXxpgpBCGlmj8+c iwgKAP8033ZfgOs638XnkGTI4qsLqAGGZA8HumN5dbKog2ar5oB3JsO62alB1bn71LswisCLk+V pFSJn98L7ABLydJZh60pTuc4QcjPhSKwDyO0cib8r3wCMdkSIAw9EZ7jLZhlKYsLdEmbstOdun7 1YHUiGDUkWLUw/2S/W/xhamK4cyCVVoeHsgVlgfstTxhbnE+4couftCtrBu3uuMHlQ1UTSNUic9 4i886nR++BcqHKQ==
X-Developer-Key: i=paul@paul-moore.com; a=openpgp; fpr=7100AADFAE6E6E940D2E0AD655E45A5AE8CA7C8A
Content-Transfer-Encoding: 8bit

As part of on ongoing effort to perform more automated testing and
provide more tools for individual developers to validate their
patches before submitting, we are trying to make our code
"clang-format clean".  My hope is that once we have fixed all of our
style "quirks", developers will be able to run clang-format on their
patches to help avoid silly formatting problems and ensure their
changes fit in well with the rest of the SELinux kernel code.

Signed-off-by: Paul Moore <paul@paul-moore.com>
---
 security/selinux/ss/policydb.h | 192 ++++++++++++++++-----------------
 1 file changed, 95 insertions(+), 97 deletions(-)

diff --git a/security/selinux/ss/policydb.h b/security/selinux/ss/policydb.h
index b97cda489753..4bba386264a3 100644
--- a/security/selinux/ss/policydb.h
+++ b/security/selinux/ss/policydb.h
@@ -8,15 +8,13 @@
 
 /*
  * Updated: Trusted Computer Solutions, Inc. <dgoeddel@trustedcs.com>
+ *          Support for enhanced MLS infrastructure.
+ *          Copyright (C) 2004-2005 Trusted Computer Solutions, Inc.
  *
- *	Support for enhanced MLS infrastructure.
- *
- * Updated: Frank Mayer <mayerf@tresys.com> and Karl MacMillan <kmacmillan@tresys.com>
- *
- *	Added conditional policy language extensions
- *
- * Copyright (C) 2004-2005 Trusted Computer Solutions, Inc.
- * Copyright (C) 2003 - 2004 Tresys Technology, LLC
+ * Updated: Frank Mayer <mayerf@tresys.com> and
+ *          Karl MacMillan <kmacmillan@tresys.com>
+ *          Added conditional policy language extensions
+ *          Copyright (C) 2003-2004 Tresys Technology, LLC
  */
 
 #ifndef _SS_POLICYDB_H_
@@ -39,104 +37,103 @@
 
 /* Permission attributes */
 struct perm_datum {
-	u32 value;		/* permission bit + 1 */
+	u32 value; /* permission bit + 1 */
 };
 
 /* Attributes of a common prefix for access vectors */
 struct common_datum {
-	u32 value;			/* internal common value */
-	struct symtab permissions;	/* common permissions */
+	u32 value; /* internal common value */
+	struct symtab permissions; /* common permissions */
 };
 
 /* Class attributes */
 struct class_datum {
-	u32 value;			/* class value */
-	char *comkey;			/* common name */
-	struct common_datum *comdatum;	/* common datum */
-	struct symtab permissions;	/* class-specific permission symbol table */
-	struct constraint_node *constraints;	/* constraints on class permissions */
-	struct constraint_node *validatetrans;	/* special transition rules */
+	u32 value; /* class value */
+	char *comkey; /* common name */
+	struct common_datum *comdatum; /* common datum */
+	struct symtab permissions; /* class-specific permission symbol table */
+	struct constraint_node *constraints; /* constraints on class perms */
+	struct constraint_node *validatetrans; /* special transition rules */
 /* Options how a new object user, role, and type should be decided */
-#define DEFAULT_SOURCE         1
-#define DEFAULT_TARGET         2
+#define DEFAULT_SOURCE 1
+#define DEFAULT_TARGET 2
 	char default_user;
 	char default_role;
 	char default_type;
 /* Options how a new object range should be decided */
-#define DEFAULT_SOURCE_LOW     1
-#define DEFAULT_SOURCE_HIGH    2
-#define DEFAULT_SOURCE_LOW_HIGH        3
-#define DEFAULT_TARGET_LOW     4
-#define DEFAULT_TARGET_HIGH    5
-#define DEFAULT_TARGET_LOW_HIGH        6
+#define DEFAULT_SOURCE_LOW	1
+#define DEFAULT_SOURCE_HIGH	2
+#define DEFAULT_SOURCE_LOW_HIGH 3
+#define DEFAULT_TARGET_LOW	4
+#define DEFAULT_TARGET_HIGH	5
+#define DEFAULT_TARGET_LOW_HIGH 6
 #define DEFAULT_GLBLUB		7
 	char default_range;
 };
 
 /* Role attributes */
 struct role_datum {
-	u32 value;			/* internal role value */
-	u32 bounds;			/* boundary of role */
-	struct ebitmap dominates;	/* set of roles dominated by this role */
-	struct ebitmap types;		/* set of authorized types for role */
+	u32 value; /* internal role value */
+	u32 bounds; /* boundary of role */
+	struct ebitmap dominates; /* set of roles dominated by this role */
+	struct ebitmap types; /* set of authorized types for role */
 };
 
 struct role_trans_key {
-	u32 role;		/* current role */
-	u32 type;		/* program executable type, or new object type */
-	u32 tclass;		/* process class, or new object class */
+	u32 role; /* current role */
+	u32 type; /* program executable type, or new object type */
+	u32 tclass; /* process class, or new object class */
 };
 
 struct role_trans_datum {
-	u32 new_role;		/* new role */
+	u32 new_role; /* new role */
 };
 
 struct filename_trans_key {
-	u32 ttype;		/* parent dir context */
-	u16 tclass;		/* class of new object */
-	const char *name;	/* last path component */
+	u32 ttype; /* parent dir context */
+	u16 tclass; /* class of new object */
+	const char *name; /* last path component */
 };
 
 struct filename_trans_datum {
-	struct ebitmap stypes;	/* bitmap of source types for this otype */
-	u32 otype;		/* resulting type of new object */
-	struct filename_trans_datum *next;	/* record for next otype*/
+	struct ebitmap stypes; /* bitmap of source types for this otype */
+	u32 otype; /* resulting type of new object */
+	struct filename_trans_datum *next; /* record for next otype*/
 };
 
 struct role_allow {
-	u32 role;		/* current role */
-	u32 new_role;		/* new role */
+	u32 role; /* current role */
+	u32 new_role; /* new role */
 	struct role_allow *next;
 };
 
 /* Type attributes */
 struct type_datum {
-	u32 value;		/* internal type value */
-	u32 bounds;		/* boundary of type */
-	unsigned char primary;	/* primary name? */
-	unsigned char attribute;/* attribute ?*/
+	u32 value; /* internal type value */
+	u32 bounds; /* boundary of type */
+	unsigned char primary; /* primary name? */
+	unsigned char attribute; /* attribute ?*/
 };
 
 /* User attributes */
 struct user_datum {
-	u32 value;			/* internal user value */
-	u32 bounds;			/* bounds of user */
-	struct ebitmap roles;		/* set of authorized roles for user */
-	struct mls_range range;		/* MLS range (min - max) for user */
-	struct mls_level dfltlevel;	/* default login MLS level for user */
+	u32 value; /* internal user value */
+	u32 bounds; /* bounds of user */
+	struct ebitmap roles; /* set of authorized roles for user */
+	struct mls_range range; /* MLS range (min - max) for user */
+	struct mls_level dfltlevel; /* default login MLS level for user */
 };
 
-
 /* Sensitivity attributes */
 struct level_datum {
-	struct mls_level *level;	/* sensitivity and associated categories */
-	unsigned char isalias;	/* is this sensitivity an alias for another? */
+	struct mls_level *level; /* sensitivity and associated categories */
+	unsigned char isalias; /* is this sensitivity an alias for another? */
 };
 
 /* Category attributes */
 struct cat_datum {
-	u32 value;		/* internal category bit + 1 */
-	unsigned char isalias;  /* is this category an alias for another? */
+	u32 value; /* internal category bit + 1 */
+	unsigned char isalias; /* is this category an alias for another? */
 };
 
 struct range_trans {
@@ -147,7 +144,7 @@ struct range_trans {
 
 /* Boolean data type */
 struct cond_bool_datum {
-	__u32 value;		/* internal type value */
+	__u32 value; /* internal type value */
 	int state;
 };
 
@@ -173,20 +170,20 @@ struct type_set {
  */
 struct ocontext {
 	union {
-		char *name;	/* name of initial SID, fs, netif, fstype, path */
+		char *name; /* name of initial SID, fs, netif, fstype, path */
 		struct {
 			u8 protocol;
 			u16 low_port;
 			u16 high_port;
-		} port;		/* TCP or UDP port information */
+		} port; /* TCP or UDP port information */
 		struct {
 			u32 addr;
 			u32 mask;
-		} node;		/* node information */
+		} node; /* node information */
 		struct {
 			u32 addr[4];
 			u32 mask[4];
-		} node6;        /* IPv6 node information */
+		} node6; /* IPv6 node information */
 		struct {
 			u64 subnet_prefix;
 			u16 low_pkey;
@@ -198,11 +195,11 @@ struct ocontext {
 		} ibendport;
 	} u;
 	union {
-		u32 sclass;  /* security class for genfs */
-		u32 behavior;  /* labeling behavior for fs_use */
+		u32 sclass; /* security class for genfs */
+		u32 behavior; /* labeling behavior for fs_use */
 	} v;
-	struct context context[2];	/* security context(s) */
-	u32 sid[2];	/* SID(s) */
+	struct context context[2]; /* security context(s) */
+	u32 sid[2]; /* SID(s) */
 	struct ocontext *next;
 };
 
@@ -221,19 +218,19 @@ struct genfs {
 #define SYM_BOOLS   5
 #define SYM_LEVELS  6
 #define SYM_CATS    7
-#define SYM_NUM     8
+#define SYM_NUM	    8
 
 /* object context array indices */
-#define OCON_ISID	0 /* initial SIDs */
-#define OCON_FS		1 /* unlabeled file systems (deprecated) */
-#define OCON_PORT	2 /* TCP and UDP port numbers */
-#define OCON_NETIF	3 /* network interfaces */
-#define OCON_NODE	4 /* nodes */
-#define OCON_FSUSE	5 /* fs_use */
-#define OCON_NODE6	6 /* IPv6 nodes */
-#define OCON_IBPKEY	7 /* Infiniband PKeys */
-#define OCON_IBENDPORT	8 /* Infiniband end ports */
-#define OCON_NUM	9
+#define OCON_ISID      0 /* initial SIDs */
+#define OCON_FS	       1 /* unlabeled file systems (deprecated) */
+#define OCON_PORT      2 /* TCP and UDP port numbers */
+#define OCON_NETIF     3 /* network interfaces */
+#define OCON_NODE      4 /* nodes */
+#define OCON_FSUSE     5 /* fs_use */
+#define OCON_NODE6     6 /* IPv6 nodes */
+#define OCON_IBPKEY    7 /* Infiniband PKeys */
+#define OCON_IBENDPORT 8 /* Infiniband end ports */
+#define OCON_NUM       9
 
 /* The policy database */
 struct policydb {
@@ -243,15 +240,15 @@ struct policydb {
 	struct symtab symtab[SYM_NUM];
 #define p_commons symtab[SYM_COMMONS]
 #define p_classes symtab[SYM_CLASSES]
-#define p_roles symtab[SYM_ROLES]
-#define p_types symtab[SYM_TYPES]
-#define p_users symtab[SYM_USERS]
-#define p_bools symtab[SYM_BOOLS]
-#define p_levels symtab[SYM_LEVELS]
-#define p_cats symtab[SYM_CATS]
+#define p_roles	  symtab[SYM_ROLES]
+#define p_types	  symtab[SYM_TYPES]
+#define p_users	  symtab[SYM_USERS]
+#define p_bools	  symtab[SYM_BOOLS]
+#define p_levels  symtab[SYM_LEVELS]
+#define p_cats	  symtab[SYM_CATS]
 
 	/* symbol names indexed by (value - 1) */
-	char		**sym_val_to_name[SYM_NUM];
+	char **sym_val_to_name[SYM_NUM];
 
 	/* class, role, and user attributes indexed by (value - 1) */
 	struct class_datum **class_val_to_struct;
@@ -324,25 +321,25 @@ extern int policydb_role_isvalid(struct policydb *p, unsigned int role);
 extern int policydb_read(struct policydb *p, void *fp);
 extern int policydb_write(struct policydb *p, void *fp);
 
-extern struct filename_trans_datum *policydb_filenametr_search(
-	struct policydb *p, struct filename_trans_key *key);
+extern struct filename_trans_datum *
+policydb_filenametr_search(struct policydb *p, struct filename_trans_key *key);
 
-extern struct mls_range *policydb_rangetr_search(
-	struct policydb *p, struct range_trans *key);
+extern struct mls_range *policydb_rangetr_search(struct policydb *p,
+						 struct range_trans *key);
 
-extern struct role_trans_datum *policydb_roletr_search(
-	struct policydb *p, struct role_trans_key *key);
+extern struct role_trans_datum *
+policydb_roletr_search(struct policydb *p, struct role_trans_key *key);
 
-#define POLICYDB_CONFIG_MLS    1
+#define POLICYDB_CONFIG_MLS 1
 
 /* the config flags related to unknown classes/perms are bits 2 and 3 */
-#define REJECT_UNKNOWN	0x00000002
-#define ALLOW_UNKNOWN	0x00000004
+#define REJECT_UNKNOWN 0x00000002
+#define ALLOW_UNKNOWN  0x00000004
 
-#define OBJECT_R "object_r"
+#define OBJECT_R     "object_r"
 #define OBJECT_R_VAL 1
 
-#define POLICYDB_MAGIC SELINUX_MAGIC
+#define POLICYDB_MAGIC	SELINUX_MAGIC
 #define POLICYDB_STRING "SE Linux"
 
 struct policy_file {
@@ -366,7 +363,8 @@ static inline int next_entry(void *buf, struct policy_file *fp, size_t bytes)
 	return 0;
 }
 
-static inline int put_entry(const void *buf, size_t bytes, size_t num, struct policy_file *fp)
+static inline int put_entry(const void *buf, size_t bytes, size_t num,
+			    struct policy_file *fp)
 {
 	size_t len;
 
@@ -382,7 +380,8 @@ static inline int put_entry(const void *buf, size_t bytes, size_t num, struct po
 	return 0;
 }
 
-static inline char *sym_name(struct policydb *p, unsigned int sym_num, unsigned int element_nr)
+static inline char *sym_name(struct policydb *p, unsigned int sym_num,
+			     unsigned int element_nr)
 {
 	return p->sym_val_to_name[sym_num][element_nr];
 }
@@ -390,5 +389,4 @@ static inline char *sym_name(struct policydb *p, unsigned int sym_num, unsigned
 extern u16 string_to_security_class(struct policydb *p, const char *name);
 extern u32 string_to_av_perm(struct policydb *p, u16 tclass, const char *name);
 
-#endif	/* _SS_POLICYDB_H_ */
-
+#endif /* _SS_POLICYDB_H_ */
-- 
2.43.2


