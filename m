Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83554294FCB
	for <lists+selinux@lfdr.de>; Wed, 21 Oct 2020 17:20:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2502321AbgJUPT5 (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Wed, 21 Oct 2020 11:19:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2502313AbgJUPT4 (ORCPT
        <rfc822;selinux@vger.kernel.org>); Wed, 21 Oct 2020 11:19:56 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B772EC0613D4
        for <selinux@vger.kernel.org>; Wed, 21 Oct 2020 08:19:55 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id l18so1678633pgg.0
        for <selinux@vger.kernel.org>; Wed, 21 Oct 2020 08:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=android.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AaLxoMYWxby/CcFJviQRdg6riGgNtKHzl1ULFWsI1LU=;
        b=J2o/jSbBc93JMBnXrzu/phYX6M/NVWFfTlIA7OpoP8cQJHqsH1fCfmioEEyczBIa7H
         1TFUxCzNLaAGKRzJMNumqjwy4jAyQeuH3pff4X5POz2WE7+BfxXpGQRGhXHMeR541M1V
         MTqFoSeAcqpFTA/Ac43tqn1ASzryjx+KJJHa8wh0wAj6uczbum4x1dEOTP8G+J88LpcX
         dPrAdWYC5Thl3GZjL3y369rWz+CdA9MbfU/zyrtKYOwEO5N7ZOEpqtZ1e7R9MmTg3I50
         aH1irSDRlOVgdIaFldJx4BtF7KaVq7IGByGXW1SEyh6HMTRRhQTUnTowNiXCC6F0LpyM
         +66g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AaLxoMYWxby/CcFJviQRdg6riGgNtKHzl1ULFWsI1LU=;
        b=ByXJ6zIQYfCmPoRqprgYqj+8v/bZ5pIB5bdWAKJXSF9T/hVx1XnLwhDi7g0XyANRDU
         x+oyC4TUKLOLH6/5+3Y9TSYXB/NQ3mZJMLTqX7DqjATI3XzaPDKMNF6PX/KTZbfMh1fF
         sliE6oFeytfS2i2850f+nePZNS0olhdLFEBn1ANh2T6HZIGhSKbC/FxKu+EYSFs9nOQf
         Jr28xzQoUH08A/edUCWtPMs7tmp9Hxxp6+6m6j85eObm2ZFx89Bu/IEYhXnwA0A2MK52
         mfF5FYv6+03VIg9fJTAJsPCVbc4/o+3qE61r4Iu6L3tXfpCqyHtFuaOA5T1a+ppXVcLO
         XUHg==
X-Gm-Message-State: AOAM533tt8WISR5GcKbjB3q4Nw2VRj3fIW3qRAxiBAZUvFushwWa7tag
        ZA+waLJWXPz0hBLxV3gXWHLkEjVURa4rQg==
X-Google-Smtp-Source: ABdhPJxm+X36PcK1omfmcfN6HFOmSAaTzQeMEywPqsmKeeScmUNRYVWZOmM4SSDhLOkELky+sbPt3g==
X-Received: by 2002:a65:5a0d:: with SMTP id y13mr3864078pgs.436.1603293595298;
        Wed, 21 Oct 2020 08:19:55 -0700 (PDT)
Received: from nebulus.mtv.corp.google.com ([2620:15c:211:200:4a0f:cfff:fe35:d61b])
        by smtp.gmail.com with ESMTPSA id s10sm2409646pji.7.2020.10.21.08.19.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2020 08:19:54 -0700 (PDT)
From:   Mark Salyzyn <salyzyn@android.com>
To:     linux-kernel@vger.kernel.org
Cc:     kernel-team@android.com, Mark Salyzyn <salyzyn@android.com>,
        linux-fsdevel@vger.kernel.org, linux-unionfs@vger.kernel.org,
        Stephen Smalley <sds@tycho.nsa.gov>,
        linux-security-module@vger.kernel.org,
        Miklos Szeredi <miklos@szeredi.hu>,
        Jonathan Corbet <corbet@lwn.net>,
        Vivek Goyal <vgoyal@redhat.com>,
        "Eric W . Biederman" <ebiederm@xmission.com>,
        Amir Goldstein <amir73il@gmail.com>, linux-doc@vger.kernel.org,
        selinux@vger.kernel.org
Subject: [RESEND PATCH v18 2/4] overlayfs: handle XATTR_NOSECURITY flag for get xattr method
Date:   Wed, 21 Oct 2020 08:19:01 -0700
Message-Id: <20201021151903.652827-3-salyzyn@android.com>
X-Mailer: git-send-email 2.29.0.rc1.297.gfa9743e501-goog
In-Reply-To: <20201021151903.652827-1-salyzyn@android.com>
References: <20201021151903.652827-1-salyzyn@android.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Because of the overlayfs getxattr recursion, the incoming inode fails
to update the selinux sid resulting in avc denials being reported
against a target context of u:object_r:unlabeled:s0.

Solution is to respond to the XATTR_NOSECURITY flag in get xattr
method that calls the __vfs_getxattr handler instead so that the
context can be read in, rather than being denied with an -EACCES
when vfs_getxattr handler is called.

For the use case where access is to be blocked by the security layer.

The path then would be security(dentry) ->
__vfs_getxattr({dentry...XATTR_NOSECURITY}) ->
handler->get({dentry...XATTR_NOSECURITY}) ->
__vfs_getxattr({realdentry...XATTR_NOSECURITY}) ->
lower_handler->get({realdentry...XATTR_NOSECURITY}) which
would report back through the chain data and success as expected,
the logging security layer at the top would have the data to
determine the access permissions and report back to the logs and
the caller that the target context was blocked.

For selinux this would solve the cosmetic issue of the selinux log
and allow audit2allow to correctly report the rule needed to address
the access problem.

Check impure, opaque, origin & meta xattr with no sepolicy audit
(using __vfs_getxattr) since these operations are internal to
overlayfs operations and do not disclose any data.  This became
an issue for credential override off since sys_admin would have
been required by the caller; whereas would have been inherently
present for the creator since it performed the mount.

This is a change in operations since we do not check in the new
ovl_do_getxattr function if the credential override is off or not.
Reasoning is that the sepolicy check is unnecessary overhead,
especially since the check can be expensive.

Because for override credentials off, this affects _everyone_ that
underneath performs private xattr calls without the appropriate
sepolicy permissions and sys_admin capability.  Providing blanket
support for sys_admin would be bad for all possible callers.

For the override credentials on, this will affect only the mounter,
should it lack sepolicy permissions. Not considered a security
problem since mounting by definition has sys_admin capabilities,
but sepolicy contexts would still need to be crafted.

It should be noted that there is precedence, __vfs_getxattr is used
in other filesystems for their own internal trusted xattr management.

Signed-off-by: Mark Salyzyn <salyzyn@android.com>
Cc: linux-fsdevel@vger.kernel.org
Cc: linux-unionfs@vger.kernel.org
Cc: Stephen Smalley <sds@tycho.nsa.gov>
Cc: linux-kernel@vger.kernel.org
Cc: linux-security-module@vger.kernel.org
Cc: kernel-team@android.com
Cc: Miklos Szeredi <miklos@szeredi.hu>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Vivek Goyal <vgoyal@redhat.com>
Cc: Eric W. Biederman <ebiederm@xmission.com>
Cc: Amir Goldstein <amir73il@gmail.com>
Cc: Stephen Smalley <sds@tycho.nsa.gov>
Cc: linux-doc@vger.kernel.org
Cc: selinux@vger.kernel.org

v18 - correct inode argument to __vfs_getxattr

v17 - rebase and add inode argument to __vfs_getxattr

v16 - rebase and merge internal getxattr operations patch

v15 - revert to v13 because xattr_gs_args rejected.

v14 - rebase to use xattr_gs_args.

v13 - rebase to use __vfs_getxattr flags option.

v12 - Added back to patch series as get xattr with flag option.

v11 - Squashed out of patch series and replaced with per-thread flag
      solution.

v10 - Added to patch series as __get xattr method.
---
 fs/overlayfs/inode.c     | 5 +++--
 fs/overlayfs/overlayfs.h | 6 ++++--
 fs/overlayfs/super.c     | 4 ++--
 3 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/fs/overlayfs/inode.c b/fs/overlayfs/inode.c
index b584dca845ba..2b14291beb86 100644
--- a/fs/overlayfs/inode.c
+++ b/fs/overlayfs/inode.c
@@ -378,7 +378,7 @@ int ovl_xattr_set(struct dentry *dentry, struct inode *inode, const char *name,
 }
 
 int ovl_xattr_get(struct dentry *dentry, struct inode *inode, const char *name,
-		  void *value, size_t size)
+		  void *value, size_t size, int flags)
 {
 	ssize_t res;
 	const struct cred *old_cred;
@@ -386,7 +386,8 @@ int ovl_xattr_get(struct dentry *dentry, struct inode *inode, const char *name,
 		ovl_i_dentry_upper(inode) ?: ovl_dentry_lower(dentry);
 
 	old_cred = ovl_override_creds(dentry->d_sb);
-	res = vfs_getxattr(realdentry, name, value, size);
+	res = __vfs_getxattr(realdentry, d_inode(realdentry), name,
+			     value, size, flags);
 	revert_creds(old_cred);
 	return res;
 }
diff --git a/fs/overlayfs/overlayfs.h b/fs/overlayfs/overlayfs.h
index f8880aa2ba0e..06db4cf87f55 100644
--- a/fs/overlayfs/overlayfs.h
+++ b/fs/overlayfs/overlayfs.h
@@ -184,7 +184,9 @@ static inline ssize_t ovl_do_getxattr(struct ovl_fs *ofs, struct dentry *dentry,
 				      size_t size)
 {
 	const char *name = ovl_xattr(ofs, ox);
-	return vfs_getxattr(dentry, name, value, size);
+	struct inode *ip = d_inode(dentry);
+
+	return __vfs_getxattr(dentry, ip, name, value, size, XATTR_NOSECURITY);
 }
 
 static inline int ovl_do_setxattr(struct ovl_fs *ofs, struct dentry *dentry,
@@ -439,7 +441,7 @@ int ovl_permission(struct inode *inode, int mask);
 int ovl_xattr_set(struct dentry *dentry, struct inode *inode, const char *name,
 		  const void *value, size_t size, int flags);
 int ovl_xattr_get(struct dentry *dentry, struct inode *inode, const char *name,
-		  void *value, size_t size);
+		  void *value, size_t size, int flags);
 ssize_t ovl_listxattr(struct dentry *dentry, char *list, size_t size);
 struct posix_acl *ovl_get_acl(struct inode *inode, int type);
 int ovl_update_time(struct inode *inode, struct timespec64 *ts, int flags);
diff --git a/fs/overlayfs/super.c b/fs/overlayfs/super.c
index f41353ba1e68..d447958badc2 100644
--- a/fs/overlayfs/super.c
+++ b/fs/overlayfs/super.c
@@ -930,7 +930,7 @@ ovl_posix_acl_xattr_get(const struct xattr_handler *handler,
 			struct dentry *dentry, struct inode *inode,
 			const char *name, void *buffer, size_t size, int flags)
 {
-	return ovl_xattr_get(dentry, inode, handler->name, buffer, size);
+	return ovl_xattr_get(dentry, inode, handler->name, buffer, size, flags);
 }
 
 static int __maybe_unused
@@ -1012,7 +1012,7 @@ static int ovl_other_xattr_get(const struct xattr_handler *handler,
 			       const char *name, void *buffer, size_t size,
 			       int flags)
 {
-	return ovl_xattr_get(dentry, inode, name, buffer, size);
+	return ovl_xattr_get(dentry, inode, name, buffer, size, flags);
 }
 
 static int ovl_other_xattr_set(const struct xattr_handler *handler,
-- 
2.29.0.rc1.297.gfa9743e501-goog

