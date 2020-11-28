Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AAFFD2C73C9
	for <lists+selinux@lfdr.de>; Sat, 28 Nov 2020 23:15:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390524AbgK1WOY (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Sat, 28 Nov 2020 17:14:24 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:55602 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731427AbgK1WOV (ORCPT
        <rfc822;selinux@vger.kernel.org>); Sat, 28 Nov 2020 17:14:21 -0500
Received: from ip5f5af0a0.dynamic.kabel-deutschland.de ([95.90.240.160] helo=wittgenstein.fritz.box)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <christian.brauner@ubuntu.com>)
        id 1kj83K-0002aM-8p; Sat, 28 Nov 2020 21:46:46 +0000
From:   Christian Brauner <christian.brauner@ubuntu.com>
To:     Alexander Viro <viro@zeniv.linux.org.uk>,
        Christoph Hellwig <hch@infradead.org>,
        linux-fsdevel@vger.kernel.org
Cc:     John Johansen <john.johansen@canonical.com>,
        James Morris <jmorris@namei.org>,
        Mimi Zohar <zohar@linux.ibm.com>,
        Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
        Stephen Smalley <stephen.smalley.work@gmail.com>,
        Casey Schaufler <casey@schaufler-ca.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Andreas Dilger <adilger.kernel@dilger.ca>,
        OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
        Geoffrey Thomas <geofft@ldpreload.com>,
        Mrunal Patel <mpatel@redhat.com>,
        Josh Triplett <josh@joshtriplett.org>,
        Andy Lutomirski <luto@kernel.org>,
        Theodore Tso <tytso@mit.edu>, Alban Crequy <alban@kinvolk.io>,
        Tycho Andersen <tycho@tycho.ws>,
        David Howells <dhowells@redhat.com>,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        Seth Forshee <seth.forshee@canonical.com>,
        =?UTF-8?q?St=C3=A9phane=20Graber?= <stgraber@ubuntu.com>,
        Aleksa Sarai <cyphar@cyphar.com>,
        Lennart Poettering <lennart@poettering.net>,
        "Eric W. Biederman" <ebiederm@xmission.com>, smbarber@chromium.org,
        Phil Estes <estesp@gmail.com>, Serge Hallyn <serge@hallyn.com>,
        Kees Cook <keescook@chromium.org>,
        Todd Kjos <tkjos@google.com>, Paul Moore <paul@paul-moore.com>,
        Jonathan Corbet <corbet@lwn.net>,
        containers@lists.linux-foundation.org, fstests@vger.kernel.org,
        linux-security-module@vger.kernel.org, linux-api@vger.kernel.org,
        linux-ext4@vger.kernel.org, linux-integrity@vger.kernel.org,
        selinux@vger.kernel.org,
        Christian Brauner <christian.brauner@ubuntu.com>,
        Christoph Hellwig <hch@lst.de>
Subject: [PATCH v3 27/38] would_dump: handle idmapped mounts
Date:   Sat, 28 Nov 2020 22:35:16 +0100
Message-Id: <20201128213527.2669807-28-christian.brauner@ubuntu.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201128213527.2669807-1-christian.brauner@ubuntu.com>
References: <20201128213527.2669807-1-christian.brauner@ubuntu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

When determining whether or not to create a coredump the vfs will verify that
the caller is privileged over the inode. Make the would_dump() helper handle
idmapped mounts by passing down the mount's user namespace of the exec file. If
the initial user namespace is passed nothing changes so non-idmapped mounts will
see identical behavior as before.

Cc: Christoph Hellwig <hch@lst.de>
Cc: David Howells <dhowells@redhat.com>
Cc: Al Viro <viro@zeniv.linux.org.uk>
Cc: linux-fsdevel@vger.kernel.org
Signed-off-by: Christian Brauner <christian.brauner@ubuntu.com>
---
/* v2 */
unchanged

/* v3 */
unchanged
---
 fs/exec.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/fs/exec.c b/fs/exec.c
index b499a1a03934..10c06fdf78a7 100644
--- a/fs/exec.c
+++ b/fs/exec.c
@@ -1391,14 +1391,15 @@ EXPORT_SYMBOL(begin_new_exec);
 void would_dump(struct linux_binprm *bprm, struct file *file)
 {
 	struct inode *inode = file_inode(file);
-	if (inode_permission(&init_user_ns, inode, MAY_READ) < 0) {
+	struct user_namespace *ns = mnt_user_ns(file->f_path.mnt);
+	if (inode_permission(ns, inode, MAY_READ) < 0) {
 		struct user_namespace *old, *user_ns;
 		bprm->interp_flags |= BINPRM_FLAGS_ENFORCE_NONDUMP;
 
 		/* Ensure mm->user_ns contains the executable */
 		user_ns = old = bprm->mm->user_ns;
 		while ((user_ns != &init_user_ns) &&
-		       !privileged_wrt_inode_uidgid(user_ns, &init_user_ns, inode))
+		       !privileged_wrt_inode_uidgid(user_ns, ns, inode))
 			user_ns = user_ns->parent;
 
 		if (old != user_ns) {
-- 
2.29.2

