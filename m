Return-Path: <selinux+bounces-4024-lists+selinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F971ADCED4
	for <lists+selinux@lfdr.de>; Tue, 17 Jun 2025 16:09:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 59F391893B2E
	for <lists+selinux@lfdr.de>; Tue, 17 Jun 2025 14:07:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 496A02E425E;
	Tue, 17 Jun 2025 14:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LJPPU81a"
X-Original-To: selinux@vger.kernel.org
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AD4F2E2EF4;
	Tue, 17 Jun 2025 14:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750169178; cv=none; b=PkCRzsemFqtdk8hHA8IuRlxp5KFHGbQpUlb6VLx7lEi0PXnO5Cnt/TrarDgreX8ADCPfXiGmf6eTDZAW8tmVEW8X2ZXvzjXv75s0LPq0V98JbFZ+PVF+IFrNCgt2O7qS4bjD4x1hLSR+nmXf+S/Z6ZuPjUOQ7dFZprqVlGddBuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750169178; c=relaxed/simple;
	bh=/XGnO9II/eCb35MtP+PPQ81O78oC1MdT+GVgu1Pfm/8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ID+dKxbGC1spBPaJloscnl5jEmJm+csW0SRnH1rsV6pwJ5Bt/s/plGo+czj48vogWPOK+8qYg5Y1F2VyD00YrJYNTlv6vUQpXMJjcS2/PdffaBFchIH+IGx59hdX+0TEN5YJ6wbU2gucsOs/g/AamnHNdDygtraBuYzGi2a5d6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LJPPU81a; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7d0a47f6692so636537985a.1;
        Tue, 17 Jun 2025 07:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750169175; x=1750773975; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d84YIezmcW+s28bLNWbROGBVUR/PHNPOuni/8UPB8mo=;
        b=LJPPU81aoxKt3l/0lqYFlUmm+AOGJ4ReSHSamNhlTR4gHFNZPwD7dKrHhFGdAXobP3
         ws6NmhtxeQ2g08IaJPS2rZ9Oavy0mD9DvVuCGA2FoCeUEQYHCjGTOwuCpfV59gaPLAjX
         EHQ2OHZQZ2sfjggA8CQiCkkazSBTAkkj5K2Gw7lFG9Oi/bbxBR8nVKZN44L2zPZuzg+Y
         JO7C4qr38YV/k5CtrQ+4wMM1EA4b19YXLILKr/vguNE/PtOwYYetlIDsjf9sGOuyDTGu
         rbh1wBmuEouB7jYUQ/lnQiYMenbFiEskOMrDgXuAGtxY209Qambd85YMIT/+UWsdCP3B
         MLug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750169175; x=1750773975;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d84YIezmcW+s28bLNWbROGBVUR/PHNPOuni/8UPB8mo=;
        b=Upkjg8AGZ/H0k0I26CLxhr4CIl+OjpJYwSv12LSoUIPMbZR6TghIr5xGVqQY8mdpOU
         4OKKewukvk90nK11p9tQn+inHR2gLKgmy7KRB+fIalLx+MapKeRpPuVs2dINI1L84SpW
         mKK2twujiR9U3cwaVRvBdZXXv5xGFU1DtQ6AQr+bklCcpW89fkQ5cGiKG/E82WhdtMCP
         azqNC9c2P0aVIGAvLtT5VAfA8tu9pSPLGRevGIWtSeN5XxNfqonquKPU5j9lkYlxwZE9
         WOQn5yW1hGjPykL653OMrGlxJiAHSmL5ppbxq4qn5su7KjdMj8NWUB4fx084RQsMpeUY
         yKOQ==
X-Forwarded-Encrypted: i=1; AJvYcCXpgomQvoJ16M0WoKo/B8MzdoMbw5SmrBeP0i52OtkTtaL6RVagbiATI6pqOwIAZkqgho20R0U=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywc5Bj7gwp5HPwN1p1YhDXdAK5wz0Vd9myMQgf7kqbHFN/oYQpO
	jMvHQqb74DyW+k5BZE+f8lm3d4z+ozfOeyCXwFvX9jH/1xdVnogTBXbSvfFZLg==
X-Gm-Gg: ASbGncsmPJcgOWxjj+HHcH4Y/vCOdFom+RHyl6B4CPOR8NiL+EE37PxUYaWqC84SGJM
	qtJiuEpk450xnZsDbXKbwXzeTWN7+EpofjuEVnsWVML2I4ik4PHRWBcI0y/U6Mk+vvR3DIK4bD1
	/wbgPuTW2St8+vfl3fiMhJJ/TPRaUrSoe+p3UBZUkxXpPi8yTki+mrZjMelVBplcPLva7tdywFE
	AzYM/vrnEnHgWcRv+Q2aaHVLnbyPIjZMfol4rpJpL0uANxGOSvaGDB4G9ELTqCdj8h7k8qPUat1
	lZkDOxm3YViKJ4ASyfAvm6NnqYhCPiLYOvf3rsJsGvJVZ1w07LCzsMGoROBjkbQ0SwdYnq+qVIZ
	dQspEL+LpdZhQloxIJUoZKnyPxBVF28c71o2vPY1Id5Kr01GH6qkat9EAua+kYpVIgA==
X-Google-Smtp-Source: AGHT+IH98aG/RBANATzGLp67qftqeLUDh+eqyq/0XCmhTvAWOSsw0Z0P9NhFYtu45IOmHT6LUujjZg==
X-Received: by 2002:a05:620a:2990:b0:7d3:9109:4472 with SMTP id af79cd13be357-7d3c6cda074mr2332771985a.37.1750169175074;
        Tue, 17 Jun 2025 07:06:15 -0700 (PDT)
Received: from fedora.. (ec2-52-70-167-183.compute-1.amazonaws.com. [52.70.167.183])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3b8edbe29sm651079585a.91.2025.06.17.07.06.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 07:06:14 -0700 (PDT)
From: Stephen Smalley <stephen.smalley.work@gmail.com>
To: selinux@vger.kernel.org
Cc: paul@paul-moore.com,
	omosnace@redhat.com,
	netdev@vger.kernel.org,
	horms@kernel.org,
	Stephen Smalley <stephen.smalley.work@gmail.com>
Subject: [PATCH v5 09/42] selinux: init inode from nearest initialized namespace
Date: Tue, 17 Jun 2025 10:04:56 -0400
Message-ID: <20250617140531.2036-10-stephen.smalley.work@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250617140531.2036-1-stephen.smalley.work@gmail.com>
References: <20250617140531.2036-1-stephen.smalley.work@gmail.com>
Precedence: bulk
X-Mailing-List: selinux@vger.kernel.org
List-Id: <selinux.vger.kernel.org>
List-Subscribe: <mailto:selinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:selinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Previously inode_doinit_with_dentry() was only checking sbsec->flags
to see if it should defer the inode security blob initialization,
which was fine when there was only a single SELinux state/namespace
since that could only be set if the state was initialized. However,
with the introduction of SELinux namespaces, the superblock could be
initialized in the parent (or other ancestor) namespace but the
current namespace may not yet be initialized (i.e. the namespace was
unshared but no policy has yet been loaded into it). Check for this
case, and if uninitialized, find the nearest ancestor SELinux
namespace that is initialized and use it instead. In the case where
the init SELinux namespace was never initialized (i.e. no policy
loaded on the host), then defer initialization of the inode.

Signed-off-by: Stephen Smalley <stephen.smalley.work@gmail.com>
---
 security/selinux/hooks.c            | 45 +++++++++++++++++------------
 security/selinux/include/security.h |  6 ++--
 2 files changed, 30 insertions(+), 21 deletions(-)

diff --git a/security/selinux/hooks.c b/security/selinux/hooks.c
index 22f7e7dc92a9..db427790b8e4 100644
--- a/security/selinux/hooks.c
+++ b/security/selinux/hooks.c
@@ -1347,10 +1347,9 @@ static inline u16 socket_type_to_security_class(int family, int type, int protoc
 	return SECCLASS_SOCKET;
 }
 
-static int selinux_genfs_get_sid(struct dentry *dentry,
-				 u16 tclass,
-				 u16 flags,
-				 u32 *sid)
+static int selinux_genfs_get_sid(struct selinux_state *state,
+				 struct dentry *dentry, u16 tclass,
+				 u16 flags, u32 *sid)
 {
 	int rc;
 	struct super_block *sb = dentry->d_sb;
@@ -1373,8 +1372,8 @@ static int selinux_genfs_get_sid(struct dentry *dentry,
 				path++;
 			}
 		}
-		rc = security_genfs_sid(current_selinux_state, sb->s_type->name,
-					path, tclass, sid);
+		rc = security_genfs_sid(state, sb->s_type->name, path,
+					tclass, sid);
 		if (rc == -ENOENT) {
 			/* No match in policy, mark as unlabeled. */
 			*sid = SECINITSID_UNLABELED;
@@ -1385,7 +1384,9 @@ static int selinux_genfs_get_sid(struct dentry *dentry,
 	return rc;
 }
 
-static int inode_doinit_use_xattr(struct inode *inode, struct dentry *dentry,
+static int inode_doinit_use_xattr(struct selinux_state *state,
+				  struct inode *inode,
+				  struct dentry *dentry,
 				  u32 def_sid, u32 *sid)
 {
 #define INITCONTEXTLEN 255
@@ -1428,8 +1429,8 @@ static int inode_doinit_use_xattr(struct inode *inode, struct dentry *dentry,
 		return 0;
 	}
 
-	rc = security_context_to_sid_default(current_selinux_state, context, rc,
-					     sid, def_sid, GFP_NOFS);
+	rc = security_context_to_sid_default(state, context, rc, sid,
+					     def_sid, GFP_NOFS);
 	if (rc) {
 		char *dev = inode->i_sb->s_id;
 		unsigned long ino = inode->i_ino;
@@ -1449,6 +1450,7 @@ static int inode_doinit_use_xattr(struct inode *inode, struct dentry *dentry,
 /* The inode's security attributes must be initialized before first use. */
 static int inode_doinit_with_dentry(struct inode *inode, struct dentry *opt_dentry)
 {
+	struct selinux_state *state = current_selinux_state;
 	struct superblock_security_struct *sbsec = NULL;
 	struct inode_security_struct *isec = selinux_inode(inode);
 	u32 task_sid, sid = 0;
@@ -1466,8 +1468,14 @@ static int inode_doinit_with_dentry(struct inode *inode, struct dentry *opt_dent
 	if (isec->sclass == SECCLASS_FILE)
 		isec->sclass = inode_mode_to_security_class(inode->i_mode);
 
+	/*
+	 * Find an initialized state to use.
+	 */
+	while (state && !selinux_initialized(state))
+		state = state->parent;
+
 	sbsec = selinux_superblock(inode->i_sb);
-	if (!(sbsec->flags & SE_SBINITIALIZED)) {
+	if (!state || !(sbsec->flags & SE_SBINITIALIZED)) {
 		/* Defer initialization until selinux_complete_init,
 		   after the initial policy is loaded and the security
 		   server is ready to handle calls. */
@@ -1524,8 +1532,8 @@ static int inode_doinit_with_dentry(struct inode *inode, struct dentry *opt_dent
 			goto out_invalid;
 		}
 
-		rc = inode_doinit_use_xattr(inode, dentry, sbsec->def_sid,
-					    &sid);
+		rc = inode_doinit_use_xattr(state, inode, dentry,
+					    sbsec->def_sid, &sid);
 		dput(dentry);
 		if (rc)
 			goto out;
@@ -1538,8 +1546,8 @@ static int inode_doinit_with_dentry(struct inode *inode, struct dentry *opt_dent
 		sid = sbsec->sid;
 
 		/* Try to obtain a transition SID. */
-		rc = security_transition_sid(current_selinux_state, task_sid, sid,
-					     sclass, NULL, &sid);
+		rc = security_transition_sid(state, task_sid, sid, sclass,
+					     NULL, &sid);
 		if (rc)
 			goto out;
 		break;
@@ -1552,7 +1560,7 @@ static int inode_doinit_with_dentry(struct inode *inode, struct dentry *opt_dent
 
 		if ((sbsec->flags & SE_SBGENFS) &&
 		     (!S_ISLNK(inode->i_mode) ||
-		      selinux_policycap_genfs_seclabel_symlinks())) {
+		      selinux_policycap_genfs_seclabel_symlinks(state))) {
 			/* We must have a dentry to determine the label on
 			 * procfs inodes */
 			if (opt_dentry) {
@@ -1579,7 +1587,7 @@ static int inode_doinit_with_dentry(struct inode *inode, struct dentry *opt_dent
 			 */
 			if (!dentry)
 				goto out_invalid;
-			rc = selinux_genfs_get_sid(dentry, sclass,
+			rc = selinux_genfs_get_sid(state, dentry, sclass,
 						   sbsec->flags, &sid);
 			if (rc) {
 				dput(dentry);
@@ -1588,8 +1596,9 @@ static int inode_doinit_with_dentry(struct inode *inode, struct dentry *opt_dent
 
 			if ((sbsec->flags & SE_SBGENFS_XATTR) &&
 			    (inode->i_opflags & IOP_XATTR)) {
-				rc = inode_doinit_use_xattr(inode, dentry,
-							    sid, &sid);
+				rc = inode_doinit_use_xattr(state, inode,
+							    dentry, sid,
+							    &sid);
 				if (rc) {
 					dput(dentry);
 					goto out;
diff --git a/security/selinux/include/security.h b/security/selinux/include/security.h
index d4e1f9e088c1..3f36ab9e0315 100644
--- a/security/selinux/include/security.h
+++ b/security/selinux/include/security.h
@@ -259,11 +259,11 @@ static inline bool selinux_policycap_nnp_nosuid_transition(void)
 			->policycap[POLICYDB_CAP_NNP_NOSUID_TRANSITION]);
 }
 
-static inline bool selinux_policycap_genfs_seclabel_symlinks(void)
+static inline bool
+selinux_policycap_genfs_seclabel_symlinks(struct selinux_state *state)
 {
 	return READ_ONCE(
-		current_selinux_state
-			->policycap[POLICYDB_CAP_GENFS_SECLABEL_SYMLINKS]);
+		state->policycap[POLICYDB_CAP_GENFS_SECLABEL_SYMLINKS]);
 }
 
 static inline bool selinux_policycap_ioctl_skip_cloexec(void)
-- 
2.49.0


