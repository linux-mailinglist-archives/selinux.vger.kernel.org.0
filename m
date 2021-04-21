Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9372C367116
	for <lists+selinux@lfdr.de>; Wed, 21 Apr 2021 19:15:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244537AbhDURPd (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Wed, 21 Apr 2021 13:15:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32432 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S242840AbhDURPa (ORCPT
        <rfc822;selinux@vger.kernel.org>); Wed, 21 Apr 2021 13:15:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1619025296;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=G0dqxk6aCIJwYIeIK7RlZfnhxumuA+fnJWxdgE7A8fI=;
        b=E/XXpDcC4fJtZZWuwJNQ+68T0gVRiFAHvXtwQUQHiSnHLw6oX1jbK/DAcrfyYuWcVDO1uP
        tKN8LSbKXtL6wCpxvwWw9qzspqpo875YmPNPd2Fe0GPCtNwQBIZLw+0q396l9YyVaMkwPh
        Ya0pexOW1TdQ+j7GOWJLje/leABqU8I=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-19-PZ7a77UMMDSaduKZNiysBg-1; Wed, 21 Apr 2021 13:14:53 -0400
X-MC-Unique: PZ7a77UMMDSaduKZNiysBg-1
Received: by mail-ej1-f70.google.com with SMTP id n10-20020a1709061d0ab029037caa96b8c5so6190439ejh.23
        for <selinux@vger.kernel.org>; Wed, 21 Apr 2021 10:14:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=G0dqxk6aCIJwYIeIK7RlZfnhxumuA+fnJWxdgE7A8fI=;
        b=hkxhrzN/Z8Z4t8KFgcKm8tAw6+rZYO10DQWtwgOgR4PUnkjnrHy4VheZ2HbJ1xxnVb
         1OJ1Q7xnk2xDPJABsr5J7lHqblLDV2JPARubYBVKkkZJFD1iFHUfInny/JyWoUYbimTU
         NL7jfm3z4W75cQ4f8e1hvAIWzdv/NY8q6cYRGlxefb07bSZYXAXtGBXFleUERv0qy8r1
         knLTpj3Dzn5cDebVX97Kq1md3S1xEKCg1u8sCL4HklOQywwFa7+ySb/evxn+dp0y6m+r
         J40Hpq18tNrtLKgn4SjLqVabnyw8mdbTEvZAYuNeJM1ktMWJHMeaIlNS1l6wrTUJjLi/
         Nb9g==
X-Gm-Message-State: AOAM5317djKhqnm5g/J9T/+JcbHyfDETpX/3AAqiAFgWHVVGW09FqFOX
        fxwAqJ3hx3Tis4U8KdvRbZ8FLwsyoQk3p/wpYIZsjPfz/Ivwc6luWoLbqM1WwTiMAlGv8UpyKUT
        kYVW8ZaZZJb8lohJ0AkpsWmCy33X1mXzGh78X6lZELjBDWP0CW4V38nPQUUrxDiCkUGe/iA==
X-Received: by 2002:aa7:c893:: with SMTP id p19mr32667754eds.256.1619025291833;
        Wed, 21 Apr 2021 10:14:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyN2tOLiqStlOemoPihxz37Wt/OP+d1rIvEkhFqaa2GTQP9HkpW/vJH8NQfFid5RullHfwiDQ==
X-Received: by 2002:aa7:c893:: with SMTP id p19mr32667724eds.256.1619025291553;
        Wed, 21 Apr 2021 10:14:51 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8308:b105:dd00:277b:6436:24db:9466])
        by smtp.gmail.com with ESMTPSA id i1sm22905edt.33.2021.04.21.10.14.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Apr 2021 10:14:50 -0700 (PDT)
From:   Ondrej Mosnacek <omosnace@redhat.com>
To:     selinux@vger.kernel.org, Paul Moore <paul@paul-moore.com>
Cc:     linux-security-module@vger.kernel.org, linux-mm@kvack.org,
        linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
        Lokesh Gidra <lokeshgidra@google.com>,
        Stephen Smalley <stephen.smalley.work@gmail.com>
Subject: [RFC PATCH 2/2] selinux: add capability to map anon inode types to separate classes
Date:   Wed, 21 Apr 2021 19:14:46 +0200
Message-Id: <20210421171446.785507-3-omosnace@redhat.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210421171446.785507-1-omosnace@redhat.com>
References: <20210421171446.785507-1-omosnace@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Unfortunately, the approach chosen in commit 29cd6591ab6f ("selinux:
teach SELinux about anonymous inodes") to use a single class for all
anon inodes and let the policy distinguish between them using named
transitions turned out to have a rather unfortunate drawback.

For example, suppose we have two types of anon inodes, "A" and "B", and
we want to allow a set of domains (represented by an attribute "attr_x")
certain set of permissions on anon inodes of type "A" that were created
by the same domain, but at the same time disallow this set to access
anon inodes of type "B" entirely. Since all inodes share the same class
and we want to distinguish both the inode types and the domains that
created them, we have no choice than to create separate types for the
cartesian product of (domains that belong to attr_x) x ("A", "B") and
add all the necessary allow and transition rules for each domain
individually.

This makes it very impractical to write sane policies for anon inodes in
the future, as more anon inode types are added. Therefore, this patch
implements an alternative approach that assigns a separate class to each
type of anon inode. This allows the example above to be implemented
without any transition rules and with just a single allow rule:

allow attr_x self:A { ... };

In order to not break possible existing users of the already merged
original approach, this patch also adds a new policy capability
"extended_anon_inode_class" that needs to be set by the policy to enable
the new behavior.

I decided to keep the named transition mechanism in the new variant,
since there might eventually be some extra information in the anon inode
name that could be used in transitions.

One minor annoyance is that the kernel still expects the policy to
provide both classes (anon_inode and userfaultfd) regardless of the
capability setting and if one of them is not defined in the policy, the
kernel will print a warning when loading the policy. However, it doesn't
seem worth to work around that in the kernel, as the policy can provide
just the definition of the unused class(es) (and permissions) to avoid
this warning. Keeping the legacy anon_inode class with some fallback
rules may also be desirable to keep the policy compatible with kernels
that only support anon_inode.

Signed-off-by: Ondrej Mosnacek <omosnace@redhat.com>
---
 security/selinux/hooks.c                   | 27 +++++++++++++++++++++-
 security/selinux/include/classmap.h        |  2 ++
 security/selinux/include/policycap.h       |  1 +
 security/selinux/include/policycap_names.h |  3 ++-
 security/selinux/include/security.h        |  7 ++++++
 5 files changed, 38 insertions(+), 2 deletions(-)

diff --git a/security/selinux/hooks.c b/security/selinux/hooks.c
index dc57ba21d8ff..20a8d7d17936 100644
--- a/security/selinux/hooks.c
+++ b/security/selinux/hooks.c
@@ -3079,7 +3079,32 @@ static int selinux_inode_init_security_anon(struct inode *inode,
 		isec->sclass = context_isec->sclass;
 		isec->sid = context_isec->sid;
 	} else {
-		isec->sclass = SECCLASS_ANON_INODE;
+		/*
+		 * If the check below fails:
+		 *  1. Add the corresponding security class to
+		 *     security/selinux/include/classmap.h
+		 *  2. Map the new LSM_ANON_INODE_* value to the class in
+		 *     the switch statement below.
+		 *  3. Update the RHS of the comparison in the BUILD_BUG_ON().
+		 *  4. CC selinux@vger.kernel.org and
+		 *     linux-security-module@vger.kernel.org when submitting
+		 *     the patch or in case of any questions.
+		 */
+		BUILD_BUG_ON(LSM_ANON_INODE_MAX > LSM_ANON_INODE_USERFAULTFD);
+
+		if (selinux_policycap_extended_anon_inode()) {
+			switch (type) {
+			case LSM_ANON_INODE_USERFAULTFD:
+				isec->sclass = SECCLASS_USERFAULTFD;
+				break;
+			default:
+				pr_err("SELinux:  got invalid anon inode type: %d",
+				       (int)type);
+				return -EINVAL;
+			}
+		} else {
+			isec->sclass = SECCLASS_ANON_INODE;
+		}
 		rc = security_transition_sid(
 			&selinux_state, tsec->sid, tsec->sid,
 			isec->sclass, name, &isec->sid);
diff --git a/security/selinux/include/classmap.h b/security/selinux/include/classmap.h
index ba2e01a6955c..e4308cad6407 100644
--- a/security/selinux/include/classmap.h
+++ b/security/selinux/include/classmap.h
@@ -251,6 +251,8 @@ struct security_class_mapping secclass_map[] = {
 	  { "integrity", "confidentiality", NULL } },
 	{ "anon_inode",
 	  { COMMON_FILE_PERMS, NULL } },
+	{ "userfaultfd",
+	  { COMMON_FILE_PERMS, NULL } },
 	{ NULL }
   };
 
diff --git a/security/selinux/include/policycap.h b/security/selinux/include/policycap.h
index 2ec038efbb03..969804bd6dab 100644
--- a/security/selinux/include/policycap.h
+++ b/security/selinux/include/policycap.h
@@ -11,6 +11,7 @@ enum {
 	POLICYDB_CAPABILITY_CGROUPSECLABEL,
 	POLICYDB_CAPABILITY_NNP_NOSUID_TRANSITION,
 	POLICYDB_CAPABILITY_GENFS_SECLABEL_SYMLINKS,
+	POLICYDB_CAPABILITY_EXTENDED_ANON_INODE_CLASS,
 	__POLICYDB_CAPABILITY_MAX
 };
 #define POLICYDB_CAPABILITY_MAX (__POLICYDB_CAPABILITY_MAX - 1)
diff --git a/security/selinux/include/policycap_names.h b/security/selinux/include/policycap_names.h
index b89289f092c9..78651990425e 100644
--- a/security/selinux/include/policycap_names.h
+++ b/security/selinux/include/policycap_names.h
@@ -12,7 +12,8 @@ const char *selinux_policycap_names[__POLICYDB_CAPABILITY_MAX] = {
 	"always_check_network",
 	"cgroup_seclabel",
 	"nnp_nosuid_transition",
-	"genfs_seclabel_symlinks"
+	"genfs_seclabel_symlinks",
+	"extended_anon_inode_class",
 };
 
 #endif /* _SELINUX_POLICYCAP_NAMES_H_ */
diff --git a/security/selinux/include/security.h b/security/selinux/include/security.h
index 7130c9648ad1..4fb75101aca4 100644
--- a/security/selinux/include/security.h
+++ b/security/selinux/include/security.h
@@ -219,6 +219,13 @@ static inline bool selinux_policycap_genfs_seclabel_symlinks(void)
 	return READ_ONCE(state->policycap[POLICYDB_CAPABILITY_GENFS_SECLABEL_SYMLINKS]);
 }
 
+static inline bool selinux_policycap_extended_anon_inode(void)
+{
+	struct selinux_state *state = &selinux_state;
+
+	return READ_ONCE(state->policycap[POLICYDB_CAPABILITY_EXTENDED_ANON_INODE_CLASS]);
+}
+
 int security_mls_enabled(struct selinux_state *state);
 int security_load_policy(struct selinux_state *state,
 			void *data, size_t len,
-- 
2.30.2

